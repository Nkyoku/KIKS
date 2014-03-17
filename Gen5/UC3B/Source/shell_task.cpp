/**	@file
	@brief シェル
*/

#include "shell_task.h"
#include "../HAL/TTY.h"

#include "ff.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "xprintf.h"

#include <ctype.h>
#include <string.h>

#include "driver/gpio.h"
#include "driver/boot.h"
#include "driver/time.h"
#include "driver/spartan6.h"
#ifdef _DFU_
#include "driver/debugIF.h"
#else
#include "kicker_task.h"
#endif
#include "main_task.h"



#ifdef _APP_
extern const char FirmwareSignature[];	// プログラム署名
extern const char CompileDate[];		// コンパイル日付
extern const char CompileTime[];		// コンパイル時刻
#endif



namespace ShellTask{
	
	const static int SHELL_RX_BUFSIZE	= 256;
	
	const char CLS_Command[11] = {"\e[2J\e[0;0H"};		// CLSコマンド \eは0x1B
	
	
	
	// 受信バッファ
	struct Rx_t{
		char Buf[SHELL_RX_BUFSIZE];
		int Next;
		unsigned char Escmode;
	};
	Rx_t Rx;

	

	// タスク
	void Task(void *param){
		// セマフォ作成
		//vSemaphoreCreateBinary(Rx.Semaphore);
		
		xputs(CLS_Command);
#ifdef _APP_
		xputs("*** Shell APP ***\n");
#else
		xputs("*** Shell DFU ***\n");
#endif
		
		while(1){
			const char *rxbuf;
			int rxlen;
			
			rxlen = ttyUART.BeginRead(&rxbuf);
			if (rxbuf != NULL){
				for(int cnt = 0; cnt < rxlen; cnt++){
					IntPush(*rxbuf++);
				}
				ttyUART.EndRead();
			}
			
			rxlen = ttyUSB.BeginRead(&rxbuf);
			if (rxbuf != NULL){
				for(int cnt = 0; cnt < rxlen; cnt++){
					IntPush(*rxbuf++);
				}
				/*xprintf("RX(%d)[", rxlen);
				put_dump(rxbuf, 0, rxlen, DW_CHAR);
				xputs("]\n");*/
				ttyUSB.EndRead();
			}
			
			vTaskDelay(TASK_DELAY_MS(100));
		}
	}
	
	// 一文字出力
	void PutChar(char c){
		ttyUSB.Write(c);
		//ttyUART.Write(c);
	}
	
	// (内部)一文字入力
	void IntPush(char c){
		if (Rx.Escmode == 0){
			if (c <= 0x1F){
				switch(c){
				case 0x0A:	// LF
					PutChar(0x0A);
					Rx.Buf[Rx.Next++] = '\0';
					Parse();
					Rx.Next	= 0;
					break;
				
				case 0x08:	// BS
					Rx.Next--;
					for(int cnt = Rx.Next; cnt < (SHELL_RX_BUFSIZE - 1); cnt++){
						Rx.Buf[cnt] = Rx.Buf[cnt + 1];
					}
					Rx.Buf[SHELL_RX_BUFSIZE - 1] = '\0';
					PutChar(0x08);
					break;
				
				case 0x1B:	// ESC
					Rx.Escmode++;
					break;	
				}
			}else{
				if ((c < 0x7F) && (Rx.Next < (SHELL_RX_BUFSIZE - 1))){
					Rx.Buf[Rx.Next++] = c;
					PutChar(c);
				}
			}				
		}else{
			// エスケープシーケンス
			switch(Rx.Escmode){
			case 1:
				if (c == '[')	Rx.Escmode = 2;
				else			Rx.Escmode = 255;
				break;
			
			case 2:
				if ((c == 'C') || (c == 'D')){
					if ((c == 'C') && (Rx.Buf[Rx.Next] != '\0') && (Rx.Next < SHELL_RX_BUFSIZE)) Rx.Next++;
					if ((c == 'D') && (0 < Rx.Next)) Rx.Next--;
					PutChar(0x1B);
					PutChar('[');
					PutChar(c);
					Rx.Escmode = 0;
					break;
				}
				Rx.Escmode++;
				break;
			
			default:
				if (isalpha(c) != 0)
					Rx.Escmode = 0;
			}				
		}	
		
		
	}
	
	// コマンドをパース
	void Parse(void){
		const static int MAX_COMMANDS = 8;
		
		char *arg = Rx.Buf;
		
		int args = 0;
		short separate[MAX_COMMANDS];		// コマンド文字列の区切りの位置
		
		int arg_int[MAX_COMMANDS] = {0};	// 引数を数値に変換したもの
		
		
		
		// 受信バッファのスペース、コンマをヌルで置き換え。ダブルクオートをはずす。
		{
			bool sp = true;
			bool cm = true;
			bool dq = false;
			char *buf = arg;
			for(int cnt = 0; cnt < SHELL_RX_BUFSIZE; cnt++){
				char c = *buf;
				if (c == '\0') break;
				switch(c){
				case ',':
					if (dq == false){
						if ((cm == true) && (args < MAX_COMMANDS))
							separate[args++] = cnt;	// 引数が省略されたとき
						cm = true;
					}					
				case ' ':
					if (dq == false){
						*buf = '\0';
						sp = true;
					}					
					break;
				
				case '\"':
					*buf = '\0';
					dq = !dq;
					break;
			
				default:
					if (sp == true){
						if (args < MAX_COMMANDS)
							separate[args++] = cnt;
						cm = false;
						sp = false;
					}				
				}
				buf++;
			}
		}
		if (args == 0) return;
	
		// 各引数を数値に変換してみる
		for(int cnt = 0; cnt < args; cnt++){
			char *str = &arg[separate[cnt]];
			xatoi(&str, (long*)&arg_int[cnt]);
		}
		
		// コマンドの頭文字を数値に変換
		int cmd = 0;
		{
			char *buf = &arg[separate[0]];
			for(int cnt = 0; cnt < 4; cnt++){
				char c = *buf++;
				if (c == '\0') break;
				cmd <<= 8;
				cmd |= (unsigned char)c;
			}
		}
		
		// コマンドごと分岐
		switch(cmd){
#ifdef _APP_
		case 'main':
			MainTask::MainCreate();
			break;
			
		case 'exit':
			MainTask::RequestExit();
			break;
			
		case 'step':
			MainTask::StepInSafeMode();
			break;
			
		case 'skip':
			MainTask::SkipInSafeMode();
			break;
			
		case 'wr':		// FPGA内のレジスタにストア
			if (args == 3){
				FPGA::Write(arg_int[1], arg_int[2]);
				xprintf("[%d]<=%d\n", arg_int[1], arg_int[2]);
			}
			break;
			
		case 'rd':		// FPGA内のレジスタからロード
			if (args == 2){
				unsigned short data;
				FPGA::Read(arg_int[1], &data, 1);
				xprintf("[%d]=>%d\n", arg_int[1], data);
			}
			break;

		
		
		case 'kcmd':
			if (args == 3){
				KickerTask::IntTx(arg[separate[1]], arg_int[2]);
			}
			break;
			
		
#endif
		
#ifdef _DFU_
		case 'mkfs':	// ファイルシステムの再作成
			if ((args == 3) && (arg_int[1] == 765) && (arg_int[2] == 876)){
				int result;
				result = f_mkfs(0, 1, 1);
				xprintf("result:%d\n", result);
			}else{
				xprintf("To execute mkfs, type 'mkfs 765,876'");
			}
			break;
#endif
			
		
			
			
		
#ifdef _DFU_
		case 'pdie':	// PDIモードを開始
			nsDebugIF::PDI::EnterPDIMode();
			xprintf("PDI Enabled\n");
			if (nsDebugIF::PDI::EnterNVM() == true){
				xprintf("NVM Enabled\n");
			}else{
				xprintf("NVM Failed\n");
				nsDebugIF::PDI::ExitPDIMode();
				xprintf("PDI Disabled\n");
			}
			break;
		
		/*case 'nvme':	// NVMを有効にする
			if (nsDebugIF::PDI::EnterNVM() == true){
				xprintf("NVM Enabled\n");
			}else{
				xprintf("NVM Failed\n");
				nsDebugIF::PDI::ExitPDIMode();
				xprintf("PDI Disabled\n");
			}
			break;*/
		
		case 'pdid':	// PDIモードを終了
			nsDebugIF::PDI::ExitNVM();
			nsDebugIF::PDI::ExitPDIMode();
			xprintf("PDI Disabled\n");
			break;
			
		/*case 'brk':
			nsDebugIF::PDI::TxBreak();
			xprintf("Break\n");
			break;*/
			
		/*case 'key':
			nsDebugIF::PDI::KEY();
			xprintf("KEY Sent\n");
			break;

		case 'lds':
			if (args == 2){
				char data = 0x00;
				if (nsDebugIF::PDI::LDS(arg_int[1], &data)){
					xprintf("LDS(%d)=>%02X\n", arg_int[1], data);
				}else{
					xprintf("Failed LDS(%d)=>%02X\n", arg_int[1], data);
				}
			}
			break;
			
		case 'stcs':
			if (args == 3){
				nsDebugIF::PDI::STCS(arg_int[1], arg_int[2]);
				xprintf("STCS(%d)<=%02X\n", arg_int[1], arg_int[2]);
			}
			break;*/
			
		case 'eras':	// PDIでチップイレース
			if (nsDebugIF::PDI::NVMChipErase() == true){
				xprintf("Succeeded\n");
			}else{
				xprintf("Failed\n");
			}
			break;
		
		case 'wrfs':	// PDIでヒューズビット書き込み
			if (args == 3){
				if (nsDebugIF::PDI::NVMWriteFuse(arg_int[1], arg_int[2]) == true){
					xprintf("Succeeded FUSE%d<=%02X\n", arg_int[1], arg_int[2]);
				}else{
					xprintf("Failed\n");
				}
			}
			break;

		case 'rdfs':	// PDIでヒューズビット読み込み
			if (args == 2){
				int byte;
				if (nsDebugIF::PDI::NVMReadFuse(arg_int[1], &byte) == true)
					xprintf("Succeeded FUSE%d=>%02X\n", arg_int[1], byte);
				else
					xprintf("Failed\n");
				break;
			}
		
		case 'pdib':	// PDIでブートローダー領域に書き込み
		case 'pdia':	// PDIでアプリケーション領域に書き込み
			if (args == 2){
				FIL fp;
				if (f_open(&fp, &arg[separate[1]], FA_READ | FA_OPEN_EXISTING) == FR_OK){
					int flash_pages, flash_start;
					if (cmd == 'pdib')	{flash_pages = nsDebugIF::PDI::DFU_PAGES; flash_start = nsDebugIF::PDI::APP_PAGES;}
					else				{flash_pages = nsDebugIF::PDI::APP_PAGES; flash_start = 0;}
					if (f_size(&fp) <= (flash_pages * nsDebugIF::PDI::PAGE_SIZE)){
						xputs("Start programming\n");
						FRESULT result;
						for(int page = 0; page < flash_pages; page++){
							char buf[nsDebugIF::PDI::PAGE_SIZE];
							unsigned int read;
							memset(buf, 0xFF, nsDebugIF::PDI::PAGE_SIZE);
							result = f_read(&fp, buf, nsDebugIF::PDI::PAGE_SIZE, &read);
							if (read == 0) break;
							if (result != FR_OK) break;
							if (nsDebugIF::PDI::NVMWritePage(flash_start + page, buf) == false){
								result = FR_DISK_ERR;
								break;
							}
						}
						if (result == FR_OK){
							xprintf("Succeeded\n");
						}else{
							xprintf("Failed\n");
						}
					}else{
						xputs("File size isn't match\n");
					}
					f_close(&fp);
				}else{
					xputs("File isn't existed\n");
				}
			}
			break;
		
		/*case 'dump':
			xprintf("Starting NVM\n");
			if (Kicker::HiddenPDINVMStart() == false){
				xprintf("Failed\n");
				break;
			}
			xprintf("Succeeded\n");
			
			xprintf("Dump Start...\n");
			vTaskDelay(TASK_DELAY_MS(10));
			
			for(int cnt = 0; cnt < 256; cnt++){
				unsigned char data[16];
				if (Kicker::HiddenPDINVMReadFlash(16 * cnt, data, 16) == false){
					xprintf("Failed(%04X)\n", 16 * cnt);
					break;
				}
				xprintf("%04X", 16 * cnt);
				for(int cnt2 = 0; cnt2 < 16; cnt2++){
					xprintf(" %02X", data[cnt2]);
				}				
				xprintf("\n");
				vTaskDelay(TASK_DELAY_MS(1));
			}
			
			xprintf("Finishing NVM\n");
			if (Kicker::HiddenPDINVMFinish() == true)
				xprintf("Succeeded\n");
			else
				xprintf("Failed\n");
			break;*/

		


#endif


		
			
		case '12v':
			if (args == 2){
				if (arg_int[1] == 0){
					xputs("12V OFF\n");
					SetOut(PIN_PWR_12V, OUT_LOW);
				}else{
					xputs("12V ON\n");
					SetOut(PIN_PWR_12V, OUT_HIGH);
				}
			}
			break;
			
		case 'drv':
			if (args == 2){
				if (arg_int[1] == 0){
					xputs("Driver OFF\n");
					SetOut(PIN_PWR_MOTOR1, OUT_LOW);
					SetOut(PIN_PWR_MOTOR2, OUT_LOW);
				}else{
					xputs("Driver ON\n");
					SetOut(PIN_PWR_MOTOR1, OUT_HIGH);
					SetOut(PIN_PWR_MOTOR2, OUT_HIGH);
				}
			}
			break;
			
		
			
#ifdef _APP_
		case 'info':	// ファームウェア情報を表示
			xprintf("Firm '%s'\n", FirmwareSignature);
			xprintf("Date '%s %s'\n", CompileDate, CompileTime);
			break;
#endif
		
		case 'heap':	// ヒープ残量を表示
			xprintf("Heap=%d\n", xPortGetFreeHeapSize());
			break;
		
		case 'time':	// 時刻を表示
			{
				Time::TIME_t time;
				Time::GetCalender(&time);
			}
			break;
		
		case 'rebo':	// 再起動
			if (args != 2){
				xputs("1:DFU, 2:APP, 3:SafeAPP\n");
			}else{
				Boot::SwitchTo((Boot::BOOT_e)arg_int[1]);
			}
			break;
			
		default:
			xputs("Invalid Command\n");
			break;
		}
	}
}
