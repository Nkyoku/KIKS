// USB バルク転送レイヤー

#include "btl_usb.h"
#include "trace.h"
#include "adler32.h"

#include <stdlib.h>
#include <process.h>

#include <SetupAPI.h>
#include "winusb/usbiodef.h"






// コンストラクタ
clBTLUSB::clBTLUSB(HANDLE hdev, HANDLE husb) : iBTL(){
	// クリティカルセクション作成
	InitializeCriticalSection(&CS);
	
	// 変数初期化
	hDevice = hdev;
	hWinUSB = husb;
	hEventDebugIn	= NULL;
	hEventDebugOut	= NULL;
	hEventBulkIn	= NULL;
	hEventBulkOut	= NULL;
	hEventEnd	= NULL;
	hThread		= NULL;

	// 非同期アクセスのためのOVERLAPPED構造体を用意
	memset(&OverlappedDebugIn, 0x00, sizeof(OVERLAPPED));
	memset(&OverlappedDebugOut, 0x00, sizeof(OVERLAPPED));
	OverlappedDebugIn.hEvent	= hEventDebugIn		= CreateEvent(NULL, TRUE, FALSE, NULL);
	OverlappedDebugOut.hEvent	= hEventDebugOut	= CreateEvent(NULL, TRUE, FALSE, NULL);
	UsingEventDebugIn = UsingEventDebugOut = false;

	memset(&OverlappedBulkIn, 0x00, sizeof(OVERLAPPED));
	memset(&OverlappedBulkOut, 0x00, sizeof(OVERLAPPED));
	OverlappedBulkIn.hEvent		= hEventBulkIn	= CreateEvent(NULL, TRUE, FALSE, NULL);
	OverlappedBulkOut.hEvent	= hEventBulkOut	= CreateEvent(NULL, TRUE, FALSE, NULL);
	UsingEventBulkIn = UsingEventBulkOut = false;

	BulkInFrameLacking	= false;

	// INパイプでRAW_IOを有効にする
	BOOL val = TRUE;
	WinUsb_SetPipePolicy(hWinUSB, PIPE_DEBUG_IN, RAW_IO, sizeof(BOOL), &val);
	WinUsb_SetPipePolicy(hWinUSB, PIPE_BULK_IN, RAW_IO, sizeof(BOOL), &val);

	// パイプをリセット
	WinUsb_ResetPipe(hWinUSB, PIPE_DEBUG_IN);
	WinUsb_ResetPipe(hWinUSB, PIPE_DEBUG_OUT);
	WinUsb_ResetPipe(hWinUSB, PIPE_BULK_IN);
	WinUsb_ResetPipe(hWinUSB, PIPE_BULK_OUT);

	// スレッドを立てる
	hEventEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
	hThread = (HANDLE)_beginthreadex(NULL, 0, TransceiveThread, this, 0, NULL);

	Trace(L"clBTLUSB:デバイスが作成されました");
}

// デストラクタ
clBTLUSB::~clBTLUSB(){
	if (hThread != NULL){
		// スレッド終了
		SetEvent(hEventEnd);
		if (WaitForSingleObject(hThread, 1000) == WAIT_TIMEOUT){
			TerminateThread(hThread, 0);
			Trace(L"clBTLUSB:スレッドが強制的に削除されました");
		}
		CloseHandle(hThread);
	}

	if (hWinUSB != NULL){
		// 通信をアボート
		WinUsb_AbortPipe(hWinUSB, PIPE_DEBUG_IN);
		WinUsb_AbortPipe(hWinUSB, PIPE_DEBUG_OUT);
		WinUsb_AbortPipe(hWinUSB, PIPE_BULK_IN);
		WinUsb_AbortPipe(hWinUSB, PIPE_BULK_OUT);

		// デバイスハンドルを閉じる
		WinUsb_Free(hWinUSB);
		CloseHandle(hDevice);
	}

	// イベントを破棄
	SafeClose(hEventEnd);
	SafeClose(hEventDebugIn);
	SafeClose(hEventDebugOut);
	SafeClose(hEventBulkIn);
	SafeClose(hEventBulkOut);

	// クリティカルセクション削除
	DeleteCriticalSection(&CS);

	Trace(L"clBTLUSB:デバイスが解放されました");
}

// デバイスが接続されているか
bool clBTLUSB::IsConnected(void){
	return hThread != NULL;
}

// リンクが生きているか
bool clBTLUSB::IsAlive(void){
	return IsConnected();	// 実装はしてない
}

// デバッグ文字列を送信する
bool clBTLUSB::TxDebug(std::string &str){
	int len = str.length();
	if (len == 0) return true;

	EnterCriticalSection(&CS);
	
	if (UsingEventDebugOut == false)
		SetEvent(hEventDebugOut);	// イベントループが出来ていないときは作り出す
	
	if (TX_DEBUG_BUFSIZE < (DebugOutQueue.size() + len)){
		LeaveCriticalSection(&CS);
		return false;
	}

	// キューにデータを追加
	for(int cnt = 0; cnt < len; cnt++)
		DebugOutQueue.push_back(str[cnt]);

	LeaveCriticalSection(&CS);
	return true;
}

// デバッグ文字列を受信する
bool clBTLUSB::RxDebug(void){
	EnterCriticalSection(&CS);

	if (UsingEventDebugIn == false)
		SetEvent(hEventDebugIn);	// イベントループが出来ていないときは作り出す

	// キューのサイズチェック
	if (DebugInQueue.size() == 0){
		LeaveCriticalSection(&CS);
		return false;
	}

	LeaveCriticalSection(&CS);
	return true;
}

bool clBTLUSB::RxDebug(std::string &str){
	EnterCriticalSection(&CS);

	if (UsingEventDebugIn == false)
		SetEvent(hEventDebugIn);	// イベントループが出来ていないときは作り出す

	// キューのサイズチェック
	int len = DebugInQueue.size();
	if (len == 0){
		LeaveCriticalSection(&CS);
		return false;
	}

	// キューからstringへデータを移動
	char *buf = new char[len];
	for(int cnt = 0; cnt < len; cnt++){
		buf[cnt] = DebugInQueue[cnt];
	}
	str.assign(buf, len);
	DebugInQueue.clear();

	LeaveCriticalSection(&CS);
	return true;
}

// (内部)デバッグ文字列を送信する
void clBTLUSB::IntTxDebug(void){
	EnterCriticalSection(&CS);

	if (UsingEventDebugOut == true){
		// 前回送信したデータを処理
		int transfered = -1;
		int result;
		result = WinUsb_GetOverlappedResult(hWinUSB, &OverlappedDebugOut, (LPDWORD)&transfered, TRUE);
		//Trace(L"clBTLUSB:TxDebug(%d)", transfered);
	}

	ResetEvent(hEventDebugOut);

	// キューが空だったら送信ループを止める
	int len = DebugOutQueue.size();
	if (len == 0){
		UsingEventDebugOut = false;
		LeaveCriticalSection(&CS);
		return;
	}
	UsingEventDebugOut = true;

	// キューからバッファにコピー
	if (DEBUG_OUT_PACKETSIZE < len) len = DEBUG_OUT_PACKETSIZE;
	for(int cnt = 0; cnt < len; cnt++){
		DebugOutBuffer[cnt] = DebugOutQueue.front();
		DebugOutQueue.pop_front();
	}

	// 送信
	WinUsb_WritePipe(hWinUSB, PIPE_DEBUG_OUT, (PUCHAR)DebugOutBuffer, len, NULL, &OverlappedDebugOut);

	LeaveCriticalSection(&CS);
}

// (内部)デバッグ文字列を受信する
void clBTLUSB::IntRxDebug(void){
	EnterCriticalSection(&CS);

	if (UsingEventDebugIn == true){
		// 受信したデータを処理
		int transfered = -1;
		int result;
		result = WinUsb_GetOverlappedResult(hWinUSB, &OverlappedDebugIn, (LPDWORD)&transfered, TRUE);
		if ((result == TRUE) && (0 < transfered)){
			//Trace(L"clBTLUSB:RxDebug(%d)", transfered);
			// キューにデータを追加
			if ((DebugInQueue.size() + transfered) <= RX_DEBUG_BUFSIZE){
				for(int cnt = 0; cnt < transfered; cnt++)
					DebugInQueue.push_back(DebugInBuffer[cnt]);
			}
		}
	}
	UsingEventDebugIn = true;

	// 受信
	WinUsb_ReadPipe(hWinUSB, PIPE_DEBUG_IN, (PUCHAR)DebugInBuffer, DEBUG_IN_PACKETSIZE, NULL, &OverlappedDebugIn);

	LeaveCriticalSection(&CS);
}









// データを送信できるか調べる
bool clBTLUSB::TxFlow(unsigned int len){
	// 必要なパケット数を計算
	int need_packets = GetDividedPackets(len, BULK_OUT_PAYLOADSIZE);
	
	EnterCriticalSection(&CS);

	if (UsingEventBulkOut == false){
		SetEvent(hEventBulkOut);	// イベントループが出来ていないときは作り出す
	}

	bool result;
	result = (BulkOutQueue.size() + need_packets) <= TX_DATA_QUEUELEVEL;

	LeaveCriticalSection(&CS);

	return result;
}

// データを送信
bool clBTLUSB::Tx(const PACKET_t &packet){
	// データを転送するのに必要なパケット数を計算
	if (MAX_PAYLOADSIZE < packet.Length) return false;
	int need_packets = GetDividedPackets(packet.Length, BULK_OUT_PAYLOADSIZE);

	EnterCriticalSection(&CS);
	
	if (UsingEventBulkOut == false){
		SetEvent(hEventBulkOut);	// イベントループが出来ていないときは作り出す
	}

	if (TX_DATA_QUEUELEVEL < (BulkOutQueue.size() + need_packets)){
		LeaveCriticalSection(&CS);
		return false;
	}

	Trace(L"%d tx(%X,%X)(%d)[%08X]", timeGetTime(), packet.Dest, packet.Msg, packet.Length, CalcAdler32(packet.Data, packet.Length));

	// キューにデータを追加
	// 大きい場合は分割
	unsigned int len = packet.Length;
	const char *data = packet.Data;
	for(int cnt = need_packets - 1; 0 <= cnt; cnt--){
		unsigned int tlen = (len <= BULK_OUT_PAYLOADSIZE) ? len : BULK_OUT_PAYLOADSIZE;
		TXDATA_t buf = {0};
		SPACKET_t *spacket = (SPACKET_t*)&buf;
		spacket->Dest	= packet.Dest;
		spacket->Msg	= packet.Msg;
		spacket->Length	= tlen;
		spacket->Frame	= cnt;
		if (data != nullptr){
			memcpy(spacket->Data, data, tlen);
			data += tlen;
		}
		BulkOutQueue.push_back(buf);

		/*static int counter = 0;
		std::string str("txdata");
		str += std::to_string((long long)counter++) + ".bin";
		FILE *fp = fopen(str.c_str(), "wb");
		fwrite(&data, BULK_OUT_PACKETSIZE, 1, fp);
		fclose(fp);*/

		len -= tlen;
	}

	LeaveCriticalSection(&CS);
	return true;
}

// データを受信できるか調べる
bool clBTLUSB::RxFlow(void){
	EnterCriticalSection(&CS);

	if (UsingEventBulkIn == false){
		SetEvent(hEventBulkIn);	// イベントループが出来ていないときは作り出す
	}

	bool result;
	result = !(BulkInQueue.empty() | BulkInFrameLacking);

	LeaveCriticalSection(&CS);

	return result;
}

// データを受信
bool clBTLUSB::Rx(PACKET_t &packet){
	EnterCriticalSection(&CS);

	if (UsingEventBulkIn == false){
		SetEvent(hEventBulkIn);	// イベントループが出来ていないときは作り出す
	}

	// キューのサイズチェック
	if (BulkInQueue.empty() == true){
		LeaveCriticalSection(&CS);
		return false;
	}

	bool result = false;

	// 最初のパケットを取得
	unsigned int dest, msg;
	signed int frame;
	SPACKET_t *spacket = (SPACKET_t*)&BulkInQueue.at(0);
	dest	= spacket->Dest;
	msg		= spacket->Msg;
	frame	= spacket->Frame;
	
	if (frame < BulkInQueue.size()){
		if (frame < BULK_IN_MAX_DIVISION){
			// キューの中に一連のパケットが納まっているか
			int cnt = 0;
			unsigned int total_length = 0;
			while(cnt <= frame){
				spacket = (SPACKET_t*)&BulkInQueue.at(cnt);
				if (spacket->Dest != dest) break;
				if (spacket->Msg != msg) break;
				if (spacket->Frame != (frame - cnt)) break;

				total_length += spacket->Length;

				cnt++;
			}

			if ((frame < cnt) && (total_length <= MAX_PAYLOADSIZE)){
				// 実際にコピー
				packet.Dest		= dest;
				packet.Msg		= msg;
				packet.Length	= total_length;
				
				char *data = packet.Data;
				while(0 <= frame--){
					spacket = (SPACKET_t*)&BulkInQueue.front();
					memcpy(data, spacket->Data, spacket->Length);
					data += spacket->Length;
					BulkInQueue.pop_front();
				}

				Trace(L"%d rx(%X,%X)(%d)[%08X]", timeGetTime(), packet.Dest, packet.Msg, packet.Length, CalcAdler32(packet.Data, packet.Length));

				result = true;
			}else{
				// データが異常なので廃棄
				Trace(L"clBTLUSB:Rx invalid frame number(%d)", total_length);
				BulkInQueue.pop_front();
			}
		}else{
			// フレーム番号が異常
			Trace(L"clBTLUSB:Rx invalid frame number(%d)", frame);
			BulkInQueue.pop_front();
		}
	}else{
		// フレームが足りていない
		//Trace(L"clBTLUSB:Rx frame lacking");
		BulkInFrameLacking = true;
	}

	LeaveCriticalSection(&CS);
	return result;
}

// (内部)データを送信
void clBTLUSB::IntTxData(void){
	EnterCriticalSection(&CS);

	if (UsingEventBulkOut == true){
		// 前回送信したデータを処理
		int transfered = -1;
		int result;
		result = WinUsb_GetOverlappedResult(hWinUSB, &OverlappedBulkOut, (LPDWORD)&transfered, TRUE);
		//Trace(L"clBTLUSB:TxData(%d)", transfered);
	}

	ResetEvent(hEventBulkOut);

	// キューが空だったら送信ループを止める
	if (BulkOutQueue.empty() == true){
		UsingEventBulkOut = false;
		LeaveCriticalSection(&CS);
		return;
	}
	UsingEventBulkOut = true;

	// キューからバッファにコピー
	BulkOutBuffer = BulkOutQueue.front();
	BulkOutQueue.pop_front();

	SPACKET_t *spacket = (SPACKET_t*)&BulkOutBuffer;

	// 送信
	WinUsb_WritePipe(hWinUSB, PIPE_BULK_OUT, (PUCHAR)&BulkOutBuffer, HEADER_LENGTH + spacket->Length, NULL, &OverlappedBulkOut);

	LeaveCriticalSection(&CS);
}

// (内部)データを受信
void clBTLUSB::IntRxData(bool &ignite){
	ignite = false;
	
	EnterCriticalSection(&CS);

	if (UsingEventBulkIn == true){
		// 受信したデータを処理
		int transfered = 0;
		int result;
		result = WinUsb_GetOverlappedResult(hWinUSB, &OverlappedBulkIn, (LPDWORD)&transfered, TRUE);
		if ((result == TRUE)/* && (0 < transfered)*/){
			// サイズが合っているか確認
			SPACKET_t *spacket = (SPACKET_t*)&BulkInBuffer;
			
			//Trace(L"clBTLUSB:RxData(%d,%d,%d)[%d]", spacket->Dest, spacket->Msg, spacket->Frame, transfered - HEADER_LENGTH);
			
			if (transfered < (HEADER_LENGTH + spacket->Length)){
				// エラー
				Trace(L"clBTLUSB:RxError");
				return;
			}

			if (spacket->Frame == 0){
				// 最終フレームらしいのでイベントを起こす
				ignite = true;
				//Trace(L"%d ignite", timeGetTime());
			}

			// キューにデータを追加
			BulkInQueue.push_back(BulkInBuffer);
			BulkInFrameLacking = false;

			if (RX_DATA_QUEUELEVEL <= BulkInQueue.size()){
				// キューがいっぱいなので受信ループを止める
				UsingEventBulkIn = false;
				LeaveCriticalSection(&CS);
				return;
			}
		}
	}
	UsingEventBulkIn = true;

	// 受信
	WinUsb_ReadPipe(hWinUSB, PIPE_BULK_IN, (PUCHAR)&BulkInBuffer, BULK_IN_PACKETSIZE, NULL, &OverlappedBulkIn);

	LeaveCriticalSection(&CS);
}



// 送受信するスレッド
unsigned int __stdcall clBTLUSB::TransceiveThread(void *device){
	if (device == nullptr) return 0;

	clBTLUSB *Device = (clBTLUSB*)device;
	HANDLE hEvents[5] = {Device->hEventEnd, Device->hEventDebugIn, Device->hEventDebugOut, Device->hEventBulkIn, Device->hEventBulkOut};

	while(true){
		int result;
		result = WaitForMultipleObjects(5, hEvents, FALSE, INFINITE);
		if (result == (WAIT_OBJECT_0 + 0)){
			// スレッド終了
			break;
		}else if (result == (WAIT_OBJECT_0 + 1)){
			// デバッグIN
			Device->IntRxDebug();
		}else if (result == (WAIT_OBJECT_0 + 2)){
			// デバッグOUT
			Device->IntTxDebug();
		}else if (result == (WAIT_OBJECT_0 + 3)){
			// バルクIN
			bool ignite;
			Device->IntRxData(ignite);
			if ((ignite == true) && (Device->hRxEvent != NULL)){
				SetEvent(Device->hRxEvent);
			}
		}else if (result == (WAIT_OBJECT_0 + 4)){
			// バルクOUT
			Device->IntTxData();
		}
	}

	return 0;
}




