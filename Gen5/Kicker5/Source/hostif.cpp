/**	@file
	@brief ホストとのインターフェース
*/

#include "hostif.h"
#include "driver/uart.h"
#include "driver/adc.h"
#include "charge.h"
#include "xprintf.h"

#include <string.h>



namespace HOSTIF{
	
	/* 定数 */
	static const unsigned char RX_BUFSIZE = 16;
	
	/* 変数 */
	struct Rx_t{
		unsigned char Buffer[RX_BUFSIZE];
		unsigned char Length;
		bool ValueValid;
		short Value;
	} Rx;
	
	
	
	// 受信データを1文字処理
	static void PushChar(unsigned char c);
	
	// 受信文字列を処理
	static void ParseString(void);
	
	// コマンドを処理
	static void ExecuteCommand(char cmd);
	
	
	
	
	// ハートビート信号を送信
	void SendHeartBeat(void){
		char buf[16];
		xsprintf(buf, "v%d\n", ADC::GetCapacitorVoltage());
		UART::Write(buf);
	}
	
	// 受信処理
	void Proc(void){
		unsigned short len;
		const char *str;
		len = UART::BeginRead(&str);
		while(0 < len--){
			PushChar(*str++);
		}
		UART::EndRead();
	}
	
	// 受信データを1文字処理
	static void PushChar(unsigned char c){
		unsigned char length = Rx.Length;
		unsigned char *buf = Rx.Buffer + length;
		if (c == 0x0A){
			// LF
			*buf = '\0';
			ParseString();
			Rx.Length = 0;
		}else{
			// 文字・制御コード
			if ((RX_BUFSIZE - 1) <= Rx.Length) return;
			*buf = c;
			Rx.Length = length + 1;
		}
	}
	
	// 受信文字列を処理
	static void ParseString(void){
		unsigned char length = Rx.Length;
		unsigned char *buf = Rx.Buffer;
		long value_l;
		short value;
		char reply[16];
		reply[0] = '\0';
		
		if (length == 0) return;
		if ((buf[0] == 'c') && (length == 5)){
			// コマンド
			buf++;
			
			// 4つのコマンド文字の多数決
			unsigned char cmd0, cmd1, cmd2, cmd3;
			cmd0 = buf[1];
			cmd1 = buf[2];
			cmd2 = buf[3];
			cmd3 = buf[4];
	
			if (((cmd0 ^ cmd1) | (cmd1 ^ cmd2)) == 0)		ExecuteCommand(cmd0);
			else if (((cmd1 ^ cmd2) | (cmd2 ^ cmd3)) == 0)	ExecuteCommand(cmd1);
			else if (((cmd2 ^ cmd3) | (cmd3 ^ cmd0)) == 0)	ExecuteCommand(cmd2);
			else if (((cmd3 ^ cmd0) | (cmd0 ^ cmd1)) == 0)	ExecuteCommand(cmd3);
			else memcpy(reply, "N*Diff\n", 8);	// 多数決に失敗
		}else if ((buf[0] == 'n') && (2 <= length)){
			// 数値
			char *buf_ = (char*)(buf + 1);
			if (xatoi(&buf_, &value_l) != 0){
				value = value_l;
				Rx.Value = value;
				Rx.ValueValid = true;
				xsprintf(reply, "n%d\n", value);
			}else{
				Rx.ValueValid = false;
				memcpy(reply, "N*Value\n", 9);
			}
		}else{
			// エラー
			xsprintf(reply, "N*Header'%s'\n", buf);
		}
		
		// 送信
		UART::Write(reply);
	}
	
	// コマンドを処理
	static void ExecuteCommand(char cmd){
		short value = Rx.Value;
		bool value_valid = Rx.ValueValid;
		Rx.ValueValid = false;
		
		char reply[16];
		reply[0] = '\0';
		
		switch(cmd){
		case 'v':	// キャパシタ電圧を取得
			xsprintf(reply, "v%d\n", ADC::GetCapacitorVoltage());
			break;
		
		default:
			if (value_valid == true){
				switch(cmd){
				case 'm':	// 最大電圧を設定
					break;
				
				case 'c':	// 充電の開始・停止
					Charge::ChargeEnable(value == 0x0876);	// 値が一致したときのみ充電
					//xprintf("ChargeEnable(%d)\n", value);
					break;
				
				case 's':	// ストレートキック
					Charge::KickEnable(Charge::KICK_STRAIGHT, value);
					xprintf("StraightKick(%d)\n", value);
					break;
				
				case 'h':	// チップキック
					Charge::KickEnable(Charge::KICK_CHIP, value);
					xprintf("ChipKick(%d)\n", value);
					break;
				
				default:	// Not Exist
					memcpy(reply, "X\n", 3);
					break;
				}
			}else{	// Not Exist
				memcpy(reply, "X\n", 3);
			}
			break;
		}
		
		// 送信
		UART::Write(reply);
	}
	
	
	
}