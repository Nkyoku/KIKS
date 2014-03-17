// デバッグ用シリアルポート

#include "debug.h"

#include <stdio.h>




// 送信リングバッファ
typedef struct DebugTx_id{
	char Buf[DEBUG_TX_BUFSIZE];
	int Size;
} DebugTx_t;
DebugTx_t DebugTx[2] = {0};
int DebugTx_TransChannel = -1;
int DebugTx_EmptyChannel = 0;

// 受信バッファ
typedef struct DebugRx_id{
	char Buf[DEBUG_RX_BUFSIZE];
	int Next;
	int Escmode;
} DebugRx_t;
DebugRx_t DebugRx = {{0}, 0, 0};

volatile int max_transfer = 0;


// デバッグインターフェースを初期化
void Debug_Init(void){
	/*DebugTx.Next = 0;
	DebugTx.Size = 0;
	DebugRx.Next = 0;
	DebugRx.Escmode = 0;*/
	
	UART2.mr	= AVR32_USART_MR_ONEBIT_MASK
				| (AVR32_USART_MR_OVER_X16 << AVR32_USART_MR_OVER)
				| (AVR32_USART_MR_PAR_NONE << AVR32_USART_MR_PAR)
				| (AVR32_USART_MR_CHRL_8 << AVR32_USART_MR_CHRL);
	UART2.brgr = F_CPU / (16 * DEBUG_BAUDRATE);
	
	DEBUG_TX_PDCA.psr	= AVR32_PDCA_PID_USART2_TX;
	//DEBUG_RX_PDCA.psr	= AVR32_PDCA_PID_USART2_RX;
	
	Int_Register(IRQ_PDCA2, (void*)Debug_OnTxPDCA, IL_HIGHEST);
	Int_Register(IRQ_USART2, (void*)Debug_OnRxPDCA, IL_HIGHEST);
	
	const static TaskDesc_t desc = {Debug_TaskInit, Debug_TaskMain, Debug_TaskExit};
	Task_Create(&desc, 1000 / F_DEBUG_TASK);
}

// 送信PDCA割り込み
IH Debug_OnTxPDCA(){
	int ch = DebugTx_TransChannel;
	//if (0 <= ch){
		if (max_transfer < DebugTx[ch].Size){
			max_transfer = DebugTx[ch].Size;
		}		
		DebugTx[ch].Size = 0;
		if (0 < DebugTx[ch ^ 1].Size){
			// 別のバッファが空でないときはそちらを次に送信する
			DEBUG_TX_PDCA.marr	= (int)DebugTx[ch ^ 1].Buf;
			DEBUG_TX_PDCA.tcrr	= DebugTx[ch ^ 1].Size;
			DebugTx_TransChannel = ch ^ 1;
			DebugTx_EmptyChannel = ch;
		}else{
			// 別のバッファも空のときは送信を終える
			DebugTx_TransChannel = -1;
			DEBUG_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
		}
	//}else{
		// ここへは来ないはず
	//	DEBUG_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	//}		
}

// 受信PDCA割り込み
IH Debug_OnRxPDCA(){
	UART2.rhr;
}

// 一文字送信
void PutByte(char c){
	DEBUG_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	
	int ch = DebugTx_EmptyChannel;
	
	if (DebugTx[ch].Size < DEBUG_TX_BUFSIZE){
		DebugTx[ch].Buf[DebugTx[ch].Size] = c;
		DebugTx[ch].Size++;
		
		if (DebugTx_TransChannel < 0){
			// DMAが空いていたらDMAで送信
			DebugTx_TransChannel = ch;
			DebugTx_EmptyChannel = ch ^ 1;
			
			DEBUG_TX_PDCA.marr	= (int)DebugTx[ch].Buf;
			DEBUG_TX_PDCA.tcrr	= DebugTx[ch].Size;
			DEBUG_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
		}
	}
				
	DEBUG_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
}	



// デバッグインターフェースの初期化ルーチン
bool Debug_TaskInit(const void *init_data){
	//UART2.ier = AVR32_USART_IER_RXRDY_MASK;
	UART2.cr = AVR32_USART_CR_RXEN_MASK | AVR32_USART_CR_TXEN_MASK;
	
	DEBUG_TX_PDCA.cr	= AVR32_PDCA_CR_TEN_MASK;
	//DEBUG_RX_PDCA.cr	= AVR32_PDCA_CR_TEN_MASK;
	
	SendCls();
	PutLine("*** Debug Interface ***");
	
	return true;
}

// デバッグインターフェースのメインルーチン
void Debug_TaskMain(void){
	
	
	
	
	
	
}

// デバッグインターフェースの終了ルーチン
void Debug_TaskExit(void){
	DEBUG_TX_PDCA.idr = AVR32_PDCA_IDR_TRC_MASK | AVR32_PDCA_IDR_RCZ;
	DEBUG_RX_PDCA.idr = AVR32_PDCA_IDR_TRC_MASK | AVR32_PDCA_IDR_RCZ;
	UART2.cr = 0;
	//UART2.idr = AVR32_USART_IDR_TXRDY_MASK | AVR32_USART_IER_RXRDY_MASK;
}










// 文字列を送信
void PutString(const char *s){
	for(;;){
		char c = *s++;
		if (c == '\0') break;
		PutByte(c);
	}
}

// フォーマットされた文字列を送る
void PutFormat(const char *fmt, ...){
	/*va_list args;
	va_start(args, fmt);
	char buf[128];
	vsnprintf(buf, 128, fmt, args);
	PutString(buf);
	va_end(args);*/
}

// 16進数でダンプする
void PutDump(const char *s, int length){
	while(0 < length){
		unsigned char d = *s++;
		char c;
		c = (d >> 4) + '0';	// 上位のニブル
		if ('9' < c) c += ('A' - '9' - 1);
		PutByte(c);
		c = (d & 0xF) + '0';	// 下位のニブル
		if ('9' < c) c += ('A' - '9' - 1);
		PutByte(c);
		length--;
		if (length != 0) PutByte(' ');
	}
}

// Put decimal number through UART
void PutDecimal(int n){
	char buf[11];
	//sprintf(buf, "%d", n);
	//PutString(buf);
}

// Put hexadecimal byte through UART
void PutHexBYTE(int n){
	char buf[9];
	//sprintf(buf, "%02x", n);
	//PutString(buf);
}

// Put hexadecimal word through UART
void PutHexWORD(int n){
	char buf[9];
	//sprintf(buf, "%04x", n);
	//PutString(buf);
}

// Put hexadecimal dword through UART
void PutHexDWORD(int n){
	char buf[9];
	//sprintf(buf, "%08x", n);
	//PutString(buf);
}


// CLSコマンド
const char CLS_Command[11] = {"\x1B" "[2J" "\x1B" "[0;0H"};




