/**	@file
	@brief USBメインタスク
*/

#include "usb_task.h"
#include "usb_task_struct.h"
#include "driver/gpio.h"
#include "driver/time.h"
//#include "driver/kicker.h"
#include "driver/usb.h"
#include "driver/boot.h"
#include "driver/mcuflash.h"
#include "driver/mx25l6445e.h"
#include "misc/misc.h"
#include "global.h"

#include "ff.h"

#include "HAL/BTLUSB.h"
#include "HAL/Pipe.h"

#include "safety_task.h"
#ifdef _DFU_
#else
#include "main_task.h"
#include "driver/spartan6.h"
#endif

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "xprintf.h"

#include <string.h>




namespace USBTask{
	
	static const int PERIOD			= 20;	// 処理間隔
	static const int TIMEOUT		= 500;	// 送信タイムアウト
	static const int CHANGE_DELAY	= 200;	// リセット時の猶予
	
	volatile int m_TaskFlag;	// USBタスクのフラグ
	
	bool m_ConnectionChanged;	// 接続状態が変わった
	
	clBTLUSB::PACKET_t m_Packet;	// メッセージを格納する
	
	const clPipe *m_PipeUsing[NUM_OF_PIPE_LINKS];	// 開いているパイプ
	
	bool m_FileUsing;			// 開いているファイル
	FIL m_FilePtr;				// FatFsのファイル情報
	
	
	
	
	
	
	// タスク
	void Task(void *param){
		m_TaskFlag = TASK_FLAG_ALIVE;
		
		// USB接続
		USB::AttachUSB();
		
		while(~m_TaskFlag & TASK_FLAG_KILLREQ){
			vTaskDelay(TASK_DELAY_MS(PERIOD));
			
			bool connected = USB::IsConnected();
			if (m_ConnectionChanged != connected){
				m_ConnectionChanged = connected;
				
				// 接続状態が変化したのでキューをリセット
				btlUSB.Reset();
				
				if (connected == false){
					// 切断された
					ResetPipes();
					CloseFiles();
				}
			}else if (connected == true){
				// データを受信
				if (btlUSB.RxFlow() == true){
					while(btlUSB.Rx(m_Packet) == true){
						unsigned int dest = m_Packet.Dest;
						
						if ((DTR::PIPE0 <= dest) && (dest < (DTR::PIPE0 + NUM_OF_PIPE_LINKS))){
							// パイプ
							ProcPipe(dest - DTR::PIPE0);
						}else{
							switch(dest){
							// 両方のモード
							case DTR::DEVICE:
								ProcDevice();
								break;
							
							case DTR::DIR:
								ProcDir();
								break;
							
							case DTR::FILE:
								ProcFile(0);
								break;
							
							
							
							default:
						
								break;
							}
						}
					}
				}
			}
		}
		
		// USB切断
		USB::DetachUSB();
		USB::DisableUSB();
		
		// リセット
		ResetPipes();
		CloseFiles();
		
		// タスク終了
		m_TaskFlag = 0;
		vTaskDelete(NULL);
	}
	
	
	
	
	// メッセージを送信
	bool Transmit(void){
		bool result;
		for(int cnt = 0; cnt < TIMEOUT; cnt++){
			result = btlUSB.Tx(m_Packet);
			if (result == true) break;
			vTaskDelay(TASK_DELAY_MS(1));
		}
		return result;
	}
	
	
	
	// デバイス関連のメッセージを処理
	void ProcDevice(void){
		switch(m_Packet.Msg){
		case MTX::DEVICE_REBOOT:	// 再起動
			if (m_Packet.Length == sizeof(DEVICE_REBOOT_t)){
				using namespace BTT;
				DEVICE_REBOOT_t *req = (DEVICE_REBOOT_t*)m_Packet.Data;
				int mode = req->BootMode;
				if ((BOOT_DFU <= mode) && (mode <= BOOT_SAFE_APP)){
					// BTT::BOOTMODE_eとBoot::BOOT_eは完全に対応しているものとする
					SafetyTask::RequestReboot((Boot::BOOT_e)mode);
				}
			}
			break;
			
		case MTX::DEVICE_INFO_GET:	// デバイス情報を取得
			{
				using namespace BTT;
				DEVICE_INFO_RET_t *ret = (DEVICE_INFO_RET_t*)m_Packet.Data;
				
				m_Packet.Msg	= MRX::DEVICE_INFO_RET;
				m_Packet.Length	= sizeof(DeviceInfoRet) + sizeof(DeviceInfoRetCaps);
				memcpy(ret, &DeviceInfoRet, sizeof(DeviceInfoRet));
				memcpy(ret->Capabilities, DeviceInfoRetCaps, sizeof(DeviceInfoRetCaps));
				ret->MachineID	= g_MachineID;
				
				Transmit();
			}
			break;
		
		case MTX::DEVICE_TIME_SET:	// デバイスの時刻を設定
			{
				DEVICE_TIME_SET_t *set = (DEVICE_TIME_SET_t*)m_Packet.Data;
				Time::SetTime(BE64(set->Time));	// 送られてきたデータは64bitだが、32bitに切り落とす
			}
			break;
		
		
		
		}
	}
	
	// パイプ関連のメッセージを処理
	void ProcPipe(unsigned int link_index){
		// この関数は間違ったlink_indexが渡されないと想定している
		
		using namespace BTT;
		
		switch(m_Packet.Msg){
		case MTX::PIPE_ENUM:	// パイプを列挙
			{
				// 向こうのパイプリストをクリア
				m_Packet.Msg	= MRX::PIPE_ENUM_CLEAR;
				m_Packet.Length	= 0;
				Transmit();
				
				// パイプリストを送る
				m_Packet.Msg	= MRX::PIPE_ENUM_RET;
				m_Packet.Length	= sizeof(BTT::PIPE_INFO_t);
				const clPipe *pipes = pipeList;
				BTT::PIPE_INFO_t *info = (BTT::PIPE_INFO_t*)m_Packet.Data;
				for(unsigned int cnt = pipeListLength; 0 < cnt; cnt--){
					memcpy(info, pipes->Info, sizeof(BTT::PIPE_INFO_t));
					info->PipeSize = LE32(info->PipeSize);
					info->WriteUnit = LE16(info->WriteUnit);
					info->Modifiers = LE16(info->Modifiers);
					pipes++;
					Transmit();
				}
			}
			break;
			
		case MTX::PIPE_OPEN:	// パイプを開く
			{
				PIPE_OPEN_t *req = (PIPE_OPEN_t*)m_Packet.Data;
				PIPE_OPEN_RET_t *ret = (PIPE_OPEN_RET_t*)m_Packet.Data;
				short req_modifiers = BE16(req->Modifiers);
				
				xprintf("popen_req('%s',%d)\n", req->PipeName, req_modifiers);
				
				bool result = false;
				do{
					// このリンクを使っていないか
					if (m_PipeUsing[link_index] != NULL) break;
					
					// パイプが存在するか調べる
					unsigned int pipe_index = 0;
					const clPipe *pipes = pipeList;
					for(; pipe_index < pipeListLength; pipe_index++){
						if (strncmp(pipes->Info->PipeName, req->PipeName, PIPE_OPEN_NAME_LENGTH) == 0){
							break;
						}
						pipes++;
					}
					if (pipeListLength <= pipe_index) break;
					
					// オープンモードをクリアするか
					if ((pipes->Info->Modifiers & req_modifiers) != req_modifiers) break;
					
					// パイプを開く
					if (pipes->Open() == false) break;
					
					// パイプとパイプリンクを関連付け
					m_PipeUsing[link_index] = pipes;
					
					xprintf("Link(%d) Pipe('%s') was opened mode:%d\n", link_index, pipes->Info->PipeName, req_modifiers);
					
					result = true;
				}while(false);
				
				// ステータスを返す
				m_Packet.Msg	= MRX::PIPE_OPEN_RET;
				m_Packet.Length	= sizeof(PIPE_OPEN_RET_t);
				ret->Status		= (result == true) ? 1 : 0;
				Transmit();
				
				xprintf("result=%d\n", result);
			}
			break;
		
		case MTX::PIPE_CLOSE:	// パイプを閉じる
			{
				xprintf("pclose_req(%d)\n", link_index);
				const clPipe *pipe = m_PipeUsing[link_index];
				if (pipe != NULL){
					m_PipeUsing[link_index] = NULL;
					xprintf("Link(%d) Pipe('%s') was closed\n", link_index, pipe->Info->PipeName);
					pipe->Close();
					
				}
			}
			break;
			
		case MTX::PIPE_READ:	// パイプから読み込む
			{
				PIPE_READ_t *req = (PIPE_READ_t*)m_Packet.Data;
				PIPE_READ_RET_t *ret = (PIPE_READ_RET_t*)m_Packet.Data;
				
				//xprintf("pread_req(%d)[%d]\n", link_index, req->Length);
				
				const clPipe *pipe = m_PipeUsing[link_index];
				if (pipe != NULL){
					m_Packet.Msg = MRX::PIPE_READ_RET;
					
					bool result = false;
					if ((m_Packet.Length == sizeof(PIPE_READ_t)) && (BE32(req->Pointer) == *pipe->pSeekPointer)){
						result = true;
						
						unsigned int len = BE32(req->Length);
						unsigned int tlen, read = 0;
						unsigned int payload = clBTLUSB::MAX_PAYLOADSIZE - sizeof(PIPE_READ_RET_t);
						do{
							// 読み込んで順次、送信
							tlen = (len <= payload) ? len : payload;
						
							ret->Pointer = LE32(*pipe->pSeekPointer);
							result = pipe->Read(ret->Data, tlen, read);
							if (result == false) break;
						
							m_Packet.Length = read + sizeof(PIPE_READ_RET_t);
							result = Transmit();
							if (result == false) break;
						
							if (read < tlen) break;
							len -= tlen;
						}while(0 < len);
						if ((read == payload) && (result == true)){
							// ゼロ長パケットが必要
							ret->Pointer = LE32(*pipe->pSeekPointer);
							m_Packet.Length = sizeof(PIPE_READ_RET_t);
							result = Transmit();
						}
					}else{
						xprintf("pread unmatch %d p=%d ne %d\n", link_index, *pipe->pSeekPointer, BE32(req->Pointer));
					}
					if (result == false){
						// エラー
						m_Packet.Msg = MRX::PIPE_READ_ERROR;
						m_Packet.Length = 0;
						Transmit();
					}
				}
			}
			break;
		
		case MTX::PIPE_WRITE:	// パイプに書き込む
			{
				PIPE_WRITE_t *req = (PIPE_WRITE_t*)m_Packet.Data;
				PIPE_WRITE_RET_t *ret = (PIPE_WRITE_RET_t*)m_Packet.Data;
				
				//xprintf("pwrite_req(%d)\n", link_index);
				
				const clPipe *pipe = m_PipeUsing[link_index];
				if (pipe != NULL){
					bool result = false;
					if ((sizeof(PIPE_WRITE_t) <= m_Packet.Length) && (BE32(req->Pointer) == *pipe->pSeekPointer)){
						result = true;
						
						unsigned int len = m_Packet.Length - sizeof(PIPE_WRITE_t);
						unsigned int written;
						
						if (len == 0){
							// PIPE_WRITE_RETを返す
							m_Packet.Msg	= MRX::PIPE_WRITE_RET;
							m_Packet.Length	= sizeof(PIPE_WRITE_RET_t);
							ret->Pointer	= LE32(*pipe->pSeekPointer);
							result = Transmit();
						}else{
							// 書き込む
							result = pipe->Write(req->Data, len, written);
						}
					}else{
						xprintf("pwrite unmatch %d p=%d ne %d\n", link_index, *pipe->pSeekPointer, BE32(req->Pointer));
					}
					if (result == false){
						// エラー
						m_Packet.Msg	= MRX::PIPE_WRITE_RET;
						m_Packet.Length	= sizeof(PIPE_WRITE_RET_t);
						ret->Pointer	= -1;
						result = Transmit();
					}
				}
			}
			break;
		
		case MTX::PIPE_SEEK:	// パイプをシーク
			{
				PIPE_SEEK_t *req = (PIPE_SEEK_t*)m_Packet.Data;
				PIPE_SEEK_RET_t *ret = (PIPE_SEEK_RET_t*)m_Packet.Data;
				
				//xprintf("pseek_req(%d,%d)\n", link_index, req->Pointer);
				
				const clPipe *pipe = m_PipeUsing[link_index];
				if (pipe != NULL){
					m_Packet.Msg	= MRX::PIPE_SEEK_RET;
					m_Packet.Length	= sizeof(PIPE_SEEK_RET_t);
					
					bool result = false;
					result = pipe->Seek(BE32(req->Pointer));
					
					ret->Status = (result == true) ? 1 : 0;
					
					// PIPE_SEEK_RETを返す
					Transmit();
				}
			}
			break;
		
		
		}
	}
	
	// ディレクトリ関連のメッセージを処理
	void ProcDir(void){
		if (m_Packet.Length == 0) return;
		
		m_Packet.Data[clBTLUSB::MAX_PAYLOADSIZE - 1] = '\0';
		
		switch(m_Packet.Msg){
		case MTX::DIR_ENUM:		// ディレクトリ内を列挙
			{
				DIR dir;
				int result;
				
				// 向こうのディレクトリツリーをクリア
				m_Packet.Msg = MRX::DIR_ENUM_CLEAR;
				Transmit();
				
				// ディレクトリを列挙していく
				xprintf("enum '%s'\n", m_Packet.Data);
				
				// パスを検査
				if (m_Packet.Data[0] == '\0'){
					// ドライブ
					SendDriveInfo('0');
					
				}else{
					// ディレクトリ
					DIR_ENUM_RET_t *dir_enum_ret = (DIR_ENUM_RET_t*)m_Packet.Data;
					m_Packet.Msg = MRX::DIR_ENUM_RET;
					
					result = f_opendir(&dir, m_Packet.Data);
					if (result == FR_OK){
						FILINFO filinfo;
						while(true){
							result = f_readdir(&dir, &filinfo);
							if (result != FR_OK){
								xprintf("f_readdir result=%d\n", result);
								break;
							}
							if ((result != FR_OK) || (filinfo.fname[0] == '\0')) break;
							if (filinfo.fname[0] == '.') continue;
							
							dir_enum_ret->Usage	= LE64(filinfo.fsize);
							dir_enum_ret->Size	= LE64(filinfo.fsize);
							dir_enum_ret->Date	= LE32((filinfo.fdate << 16) | filinfo.ftime);
							dir_enum_ret->Letter= 0;
							if (filinfo.fattrib & AM_DIR){
								dir_enum_ret->DirSFNFlag = 1;
							}else{
								dir_enum_ret->DirSFNFlag = 0;
							}
							memcpy(dir_enum_ret->Name, filinfo.fname, 13);
							
							//xprintf(" -> '%s'\n", filinfo.fname);
							
							m_Packet.Length = sizeof(DIR_ENUM_RET_t) + 13;
							Transmit();
						}
						//f_closedir(&dir);
					}else{
						xprintf("f_opendir result=%d\n", result);
					}
				}
			}
			break;
			
#ifdef _DFU_
		case MTX::DIR_MOVE:		// ディレクトリ・ファイルを移動
			{
				char *dst_offset = m_Packet.Data + 2;
				char *src_offset = m_Packet.Data;
				char *src_end = m_Packet.Data + clBTLUSB::MAX_PAYLOADSIZE;
				for(; src_offset != src_end; src_offset++){
					if (*src_offset == '?'){
						*src_offset = '\0';
						src_offset += 1;
						xprintf("rename '%s' <- '%s'\n", dst_offset, src_offset);
						int result = f_rename(src_offset, dst_offset);
						xprintf("result=%d\n", result);
						break;
					}
				}
			}
			break;
			
		case MTX::DIR_REMOVE:	// ディレクトリ・ファイルを削除
			{
				xprintf("remove '%s'\n", m_Packet.Data);
				int result = f_unlink(m_Packet.Data);
				xprintf("result=%d\n", result);
				if (result == FR_OK){
					SendDriveInfo(m_Packet.Data[0]);
				}
			}
			break;
			
		case MTX::DIR_CREATE:	// ディレクトリを作成
			{
				xprintf("mkdir '%s'\n", m_Packet.Data);
				int result = f_mkdir(m_Packet.Data);
				xprintf("result=%d\n", result);
				if (result == FR_OK){
					SendDriveInfo(m_Packet.Data[0]);
				}
			}
			break;
#endif
			
			
		}
	}
	
	// ファイル関連のメッセージを処理
	void ProcFile(unsigned int link_index){
		// この関数は間違ったlink_indexが渡されないと想定している
		
		using namespace BTT;
		
		switch(m_Packet.Msg){
		case MTX::FILE_OPEN:	// ファイルを開く
			{
				FILE_OPEN_t *req = (FILE_OPEN_t*)m_Packet.Data;
				FILE_ANY_RET_t *ret = (FILE_ANY_RET_t*)m_Packet.Data;
				unsigned short req_modifiers = BE16(req->Modifiers);
				
				xprintf("fopen_req('%s',%d)\n", req->Name, req_modifiers);
				
				bool result = false;
				do{
					// このリンクを使っていないか
					if (m_FileUsing == true) break;
					
					m_Packet.Data[clBTLUSB::MAX_PAYLOADSIZE - 1] = '\0';
					
					// ファイルを開く
					int mode;
#ifdef _DFU_
					if (req_modifiers & CREATE){
						mode = FA_CREATE_ALWAYS;
					}else if (req_modifiers & OPEN){
						mode = FA_OPEN_ALWAYS;
					}else{
						mode = FA_OPEN_EXISTING;
					}
					if (req_modifiers & WRITABLE) mode |= FA_WRITE;
#else
					mode = FA_OPEN_EXISTING;
#endif
					if (req_modifiers & READABLE) mode |= FA_READ;
					
					int status;
					status = f_open(&m_FilePtr, req->Name, mode);
					xprintf("f_open returned %d\n", status);
					if (status == FR_OK){
						status = f_sync(&m_FilePtr);
						xprintf("f_sync returned %d\n", status);
						if (status == FR_OK){
							// 登録
							m_FileUsing = true;
							
							xprintf("Link(%d) File('%s') was opened mode:%d\n", link_index, req->Name, req_modifiers);
							
							result = true;
						}
					}
				}while(false);
				
				// ステータスを返す
				m_Packet.Msg		= MRX::FILE_OPEN_RET;
				m_Packet.Length	= sizeof(FILE_ANY_RET_t);
				if (result == true){
					ret->Pointer	= LE64(f_tell(&m_FilePtr));
					ret->Size		= LE64(f_size(&m_FilePtr));
					ret->Status		= 1;
				}else{
					ret->Pointer	= 0;
					ret->Size		= 0;
					ret->Status		= 0;
				}
				Transmit();
				
				xprintf("result=%d\n", result);
			}
			break;
		
		case MTX::FILE_CLOSE:	// ファイルを閉じる
			{
				xprintf("fclose_req(%d)\n", link_index);
				if (m_FileUsing == true){
					m_FileUsing = false;
					xprintf("Link(%d) was closed\n", link_index);
					
					// ドライブ残量を返す
					SendDriveInfo('0' + m_FilePtr.fs->drv);
					
					int status;
					status = f_close(&m_FilePtr);
					xprintf("f_close returned %d\n", status);
				}
			}
			break;
			
		case MTX::FILE_READ:	// ファイルから読み込む
			{
				FILE_READ_t *req = (FILE_READ_t*)m_Packet.Data;
				FILE_READ_RET_t *ret = (FILE_READ_RET_t*)m_Packet.Data;
				
				//xprintf("fread_req(%d)[%d]\n", link_index, req->Length);
				
				if (m_FileUsing == true){
					m_Packet.Msg = MRX::FILE_READ_RET;
					
					bool result = false;
					if ((m_Packet.Length == sizeof(FILE_READ_t)) && (BE64(req->Pointer) == f_tell(&m_FilePtr))){
						unsigned int len = BE32(req->Length);
						unsigned int tlen, read = 0;
						unsigned int payload = clBTLUSB::MAX_PAYLOADSIZE - sizeof(FILE_READ_RET_t);
						do{
							// 読み込んで順次、送信
							tlen = (len <= payload) ? len : payload;
							
							ret->Pointer = LE64(f_tell(&m_FilePtr));
							int status;
							status = f_read(&m_FilePtr, ret->Data, tlen, &read);
							if (status != FR_OK){
								xprintf("f_read returned %d\n", status);
								break;	
							}
							
							m_Packet.Length = read + sizeof(FILE_READ_RET_t);
							result = Transmit();
							if (result == false) break;
							
							if (read < tlen) break;
							len -= tlen;
						}while(0 < len);
						if ((read == payload) && (result == true)){
							// ゼロ長パケットが必要
							ret->Pointer = LE64(f_tell(&m_FilePtr));
							m_Packet.Length = sizeof(FILE_READ_RET_t);
							result = Transmit();
						}
						
					}else{
						xprintf("fread unmatched %d p=%d ne %d\n", link_index, f_tell(&m_FilePtr), BE64(req->Pointer));
					}
					
					if (result == false){
						// エラー
						m_Packet.Msg = MRX::FILE_READ_ERROR;
						m_Packet.Length = 0;
						Transmit();
					}
				}
			}
			break;
			
#ifdef _DFU_
		case MTX::FILE_WRITE:	// ファイルに書き込む
			{
				FILE_WRITE_t *req = (FILE_WRITE_t*)m_Packet.Data;
				FILE_ANY_RET_t *ret = (FILE_ANY_RET_t*)m_Packet.Data;
				
				//xprintf("fwrite_req(%d)\n", link_index);
				
				if (m_FileUsing == true){
					bool result = false;
					if ((sizeof(FILE_WRITE_t) <= m_Packet.Length) && (BE64(req->Pointer) == f_tell(&m_FilePtr))){
						unsigned int len = m_Packet.Length - sizeof(FILE_WRITE_t);
						unsigned int written;
						
						if (len == 0){
							// FILE_WRITE_RETを返す
							m_Packet.Msg	= MRX::FILE_WRITE_RET;
							m_Packet.Length	= sizeof(FILE_ANY_RET_t);
							ret->Pointer	= LE64(f_tell(&m_FilePtr));
							ret->Size		= LE64(f_size(&m_FilePtr));
							ret->Status		= 1;
							result = Transmit();
						}else{
							// 書き込む
							int status;
							status = f_write(&m_FilePtr, req->Data, len, &written);
							result = status == FR_OK;
							xprintf("f_write returned %d\n", status);
						}
					}else{
						xprintf("fwrite unmatched %d p=%d ne %d\n", link_index, f_tell(&m_FilePtr), BE64(req->Pointer));
					}
					if (result == false){
						// エラー
						m_Packet.Msg	= MRX::FILE_WRITE_RET;
						m_Packet.Length	= sizeof(FILE_ANY_RET_t);
						ret->Pointer	= LE64(f_tell(&m_FilePtr));
						ret->Size		= LE64(f_size(&m_FilePtr));
						ret->Status		= 0;
						result = Transmit();
					}
				}
			}
			break;
#else
		case MTX::FILE_WRITE:	// ファイルに書き込む
			{
				//FILE_WRITE_t *req = (FILE_WRITE_t*)m_Packet.Data;
				FILE_ANY_RET_t *ret = (FILE_ANY_RET_t*)m_Packet.Data;
				
				//xprintf("fwrite_req(%d) error\n", link_index);
				
				if (m_FileUsing == true){
					// エラー
					m_Packet.Msg	= MRX::FILE_WRITE_RET;
					m_Packet.Length	= sizeof(FILE_ANY_RET_t);
					ret->Pointer	= LE64(f_tell(&m_FilePtr));
					ret->Size		= LE64(f_size(&m_FilePtr));
					ret->Status		= 0;
					Transmit();
				}
			}
			break;
#endif
		
		case MTX::FILE_SEEK:	// ファイルをシーク
			{
				FILE_SEEK_t *req = (FILE_SEEK_t*)m_Packet.Data;
				FILE_ANY_RET_t *ret = (FILE_ANY_RET_t*)m_Packet.Data;
				
				xprintf("fseek_req(%d,%d)\n", link_index, BE64(req->Pointer));
				
				if (m_FileUsing == true){
					m_Packet.Msg	= MRX::FILE_SEEK_RET;
					m_Packet.Length	= sizeof(FILE_ANY_RET_t);
					
					int status;
					status = f_lseek(&m_FilePtr, BE64(req->Pointer));
					xprintf("f_lseek returned %d\n", status);
					
					ret->Pointer	= LE64(f_tell(&m_FilePtr));
					ret->Size		= LE64(f_size(&m_FilePtr));
					ret->Status		= (status == FR_OK) ? 1 : 0;
					
					// FILE_SEEK_RETを返す
					Transmit();
				}
			}
			break;
		
		
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// パイプをリセット
	void ResetPipes(void){
		// すべて閉じる
		const clPipe *pipes = pipeList;
		for(int cnt = pipeListLength; 0 < cnt; cnt--){
			pipes->Close();
			pipes++;
		}
		
		memset(m_PipeUsing, 0x00, sizeof(m_PipeUsing));
	}
	
	// ファイルをすべて閉じる
	void CloseFiles(void){
		if (m_FileUsing == true){
			m_FileUsing = false;
			f_close(&m_FilePtr);
		}
	}
	
	// ドライブ情報を送信
	void SendDriveInfo(int letter){
		unsigned char dest_backup = m_Packet.Dest;
		
		DIR_ENUM_RET_t *dir_enum_ret = (DIR_ENUM_RET_t*)m_Packet.Data;
		m_Packet.Dest = DTR::DIR;
		m_Packet.Msg = MRX::DIR_ENUM_RET;
		
		DWORD free_area;
		FATFS *fs;
		char path[4] = "0:\\";
		path[0] = letter;
		
		if (letter == '0'){
			if (SPIFlash::IsImplemented() == false){
				// 内蔵フラッシュの代替領域の情報を送信
				f_getfree(path, &free_area, &fs);
				dir_enum_ret->Usage	= LE64(MCUFlash::FF_SIZE - MCUFlash::PAGE_SIZE * free_area);
				dir_enum_ret->Size	= LE64(MCUFlash::FF_SIZE);
				dir_enum_ret->Date	= 0;
				dir_enum_ret->Letter= '0';
				dir_enum_ret->DirSFNFlag = 1;
				memcpy(dir_enum_ret->Name, "AT32UC3B0512", sizeof("AT32UC3B0512"));
				m_Packet.Length = sizeof(DIR_ENUM_RET_t) + sizeof("AT32UC3B0512");
				Transmit();
			}else{
				// MX25L6445Eの情報を送信	
				f_getfree(path, &free_area, &fs);
				dir_enum_ret->Usage	= LE64(SPIFlash::FLASH_SIZE - SPIFlash::SECTOR_SIZE * free_area);
				dir_enum_ret->Size	= LE64(SPIFlash::FLASH_SIZE);
				dir_enum_ret->Date	= 0;
				dir_enum_ret->Letter= '0';
				dir_enum_ret->DirSFNFlag = 1;
				memcpy(dir_enum_ret->Name, "MX25L6445E", sizeof("MX25L6445E"));
				m_Packet.Length = sizeof(DIR_ENUM_RET_t) + sizeof("MX25L6445E");
				Transmit();
			}
		}
		
		m_Packet.Dest = dest_backup;
	}
	
	
	
	
	
	
	
	
	

}
