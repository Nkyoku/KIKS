/*	@file
	@brief IOポートの制御
*/

#ifndef _GPIO_H_
#define _GPIO_H_

#include "../define.h"



#define OUT_LOW		0
#define OUT_HIGH	1

#define IN_LOW		0
#define IN_HIGH		1



// 出力を設定
static inline void SetOut(int bit, int out){
	if (out == OUT_LOW)
		PORT[bit >> 4].OUTCLR = 1 << (bit & 0xF);
	else
		PORT[bit >> 4].OUTSET = 1 << (bit & 0xF);
}

// 入力を取得
static inline int GetIn(int bit){
	return PORT[bit >> 4].IN & (1 << (bit & 0xF)) ? IN_HIGH : IN_LOW;
}




#define IO_BIT(v) (1 << ((v) & 0xF))

// 入力ピン
#define PIN_BALL_DETECT			(0 +0)
#define PIN_EXT1_IRQ			(0 +1)
#define PIN_XBEE_nCTS			(0 +2)

#define PIN_POWERED12			(16+15)
#define PIN_POWERED345			(32+15)



// 出力ピン
#define PIN_LED4				(0 +0)		// 赤
#define PIN_LED5				(0 +1)		// 青
#define PIN_LED6				(0 +2)		// 緑
#define PIN_LED7				(0 +3)		// 白
#define PIN_LED8				(0 +4)		// 赤(AVR32:バッテリー低)
#define PIN_LED9				(0 +5)		// 黄(AVR32:バッテリー中)
#define PIN_LED10				(0 +6)		// 緑(AVR32:バッテリー高)

#define PIN_PWR_5V				(16+0)
#define PIN_PWR_SENSORS12		(16+1)
#define PIN_PWR_SENSORS345		(16+2)
#define PIN_PWR_BALL			(16+3)

#define PIN_XBEE_nRESET			(32+0)
#define PIN_EXT1_nCS			(32+1)
#define PIN_EXT1_CE				(32+2)
#define PIN_nINIT				(32+3)




#endif
