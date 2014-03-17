// デバッグ用シリアルポート

#ifndef DEBUG_H_
#define DEBUG_H_

#include "../define.h"
#include "int.h"
#include "task.h"

#include <stdarg.h>



// 定数
#define DEBUG_BAUDRATE		38400
#define DEBUG_TX_BUFSIZE	512
#define DEBUG_RX_BUFSIZE	128

#define F_DEBUG_TASK		1		// デバッグインターフェースのタスクの頻度(使わないので1Hz)



#define DEBUG_TX_PDCA	PDCA.channel[2]
#define DEBUG_RX_PDCA	PDCA.channel[3]




// デバッグインターフェースを初期化
void Debug_Init(void);

// 送信PDCA割り込み
IH Debug_OnTxPDCA();

// 受信PDCA割り込み
IH Debug_OnRxPDCA();

// 一文字送信
void PutByte(char c);



// デバッグインターフェースの初期化ルーチン
bool Debug_TaskInit(const void *init_data);

// デバッグインターフェースのメインルーチン
void Debug_TaskMain(void);

// デバッグインターフェースの終了ルーチン
void Debug_TaskExit(void);



// 改行を送信
inline void PutReturn(void){
	//PutByte(0x0D);
	PutByte(0x0A);
}

// 文字列を送信
void PutString(const char *s);

// 一行の文字列を送る
inline void PutLine(const char *s){
	PutString(s);
	PutReturn();
}	

// フォーマットされた文字列を送る
void PutFormat(const char *fmt, ...);

// 16進数でダンプする
void PutDump(const char *s, int length);

// Put decimal number through UART
void PutDecimal(int n);

// Put hexadecimal byte through UART
void PutHexBYTE(int n);

// Put hexadecimal word through UART
void PutHexWORD(int n);

// Put hexadecimal dword through UART
void PutHexDWORD(int n);


// CLSコマンドを送信
extern const char CLS_Command[];
inline void SendCls(void){
	PutString(CLS_Command);
}



#endif
