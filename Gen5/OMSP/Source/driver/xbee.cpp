/*	@file
	@brief XBeeの制御
*/

#include "xbee.h"

#include "../define.h"
#include "gpio.h"



namespace XBee{
	
	/* 定数 */
	static const unsigned short RXBUFSIZE = 32;
	
	/* 変数 */
	struct UartRx_t{
		unsigned char Size;		// 送られたバイト数
		char LastChar;			// 最後に送られた文字
		char Buf[RXBUFSIZE];	// 受信バッファ
	};
	UartRx_t UartRx;
	
	
	
	// 初期化
	void Init(void){
		UART.LCR = 0x83;
		UARTALT.BAUDH = F_CPU / (16 * XBEE_BAUDRATE) >> 8;
		UARTALT.BAUDL = F_CPU / (16 * XBEE_BAUDRATE);
		UART.LCR = 0x03;
		UART.IER = 0x00;
		UARTALT.FCR = 0xC6;	// 16レベル中8レベルで割り込み
		//UARTALT.FCR = 0xC7;	// 16レベル中14レベルで割り込み
		UART.MCR = 0x00;
		
		SetOut(PIN_XBEE_nRESET, OUT_HIGH);	// XBeeリセット解除
	}
	
	// ポーリング
	void Receive(void (*func)(unsigned short, const char*)){
		short size = UartRx.Size;
		char last_char = UartRx.LastChar; 
		
		while(UART.LSR & 0x01){
			char c = UART.DATA;
			
			if (size < (RXBUFSIZE - 1)){
				UartRx.Buf[size] = c;
				size++;
			}
			if ((c == 0x0A) && (last_char == 0x0D)){
				// 改行コードを認識
				UartRx.Buf[size] = '\0';
				
				// 受信関数に渡す
				(*func)(size, UartRx.Buf);
				
				size = 0;
			}
			
			last_char = c;
		}
		
		UartRx.Size = size;
		UartRx.LastChar = last_char;
	}
	
	
}



// UART割り込みベクター
#pragma vector = UART_VECTOR
__interrupt void IntUART(void){
	UART.IER = 0x00;
}
/*#pragma vector = UART_VECTOR
__interrupt void IntUART(void){
	using namespace XBee;
	
	switch(UART.IIR & 0xE){
	case 0x4:	// Receiver Data Available
	case 0xC:	// Timeout Indication
		while(UART.LSR & 0x01){
			char c = UART.DATA;
			char last_char = UartRx.LastChar;
			UartRx.LastChar = c;
			
			if (UartRx.Size < (UARTRX_BUFSIZE - 1)){
				UartRx.Buf[UartRx.Size++] = c;
			}
			if ((c == 0x0A) && (last_char == 0x0D)){
				char id = UartRx.Buf[0] - 1;
				if ((id < 12) && (id != g_MachineID)){
					// 違うマシンID向けの通信だったら無視する
					UartRx.Size = 0;
					continue;
				}
				
				// 改行コードを認識
				UartRx.Buf[UartRx.Size] = '\0';
				
				// 割り込み停止
				UART.IER = 0x00;

				break;
			}
		}
		break;
		
	case 0x2:	// Transmitter Holding Register empty
		break;
		
	case 0x0:	// Modem Status
		char msr = UART.MSR;
		break;
		
	case 0x6:	// Receiver Line Status
		char lsr = UART.LSR;
		break;
	}
}*/
