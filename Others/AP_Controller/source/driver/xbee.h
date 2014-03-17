// XBeeとの通信

#ifndef XBEE_H_
#define XBEE_H_

#include "../define.h"
#include "int.h"
#include "task.h"

#include <stdarg.h>



// 定数
#define XBEE_BAUDRATE		57600
#define XBEE_TX_BUFSIZE		128
#define XBEE_RX_BUFSIZE		128

#define F_XBEE_TASK			10		// XBeeインターフェースのタスクの頻度

#define XBEE_BOOTUP_TIME	1000	// XBeeの起動時間


#define XBEE_TX_PDCA	PDCA.channel[0]
#define XBEE_RX_PDCA	PDCA.channel[1]




// XBeeインターフェースを初期化
void XBee_Init(void);

// 送信PDCA割り込み
IH XBee_OnTxPDCA();

// 受信PDCA割り込み
IH XBee_OnRxPDCA();



// XBeeインターフェースの初期化ルーチン
bool XBee_TaskInit(const void *init_data);

// XBeeインターフェースのメインルーチン
void XBee_TaskMain(void);

// XBeeインターフェースの終了ルーチン
void XBee_TaskExit(void);



// 生データを送信
bool XBee_SendData(const void *data, unsigned int size);

// パケットを送信
bool XBee_SendPacket(const void *data);








#endif
