// スイッチ・LEDの制御

#ifndef UI_H_
#define UI_H_

#include "../define.h"
#include "gpio.h"
#include "int.h"



// グローバル変数
extern volatile int SwitchFlags;
extern volatile int SwitchTriggers;

extern volatile int LEDFlags;
extern volatile char LEDSegments[2];



// 定数
#define F_UI	50		// UIは50Hzごとにデータを更新する



#define LED_DV1		0
#define LED_DV2		1
#define LED_DV3		2
#define LED_DV4		3
#define LED_DV5		6
#define LED_DV6		7
#define LED_DVERR	4
#define LED_DVWRN	5

#define LED_PWR		8
#define LED_TRC		9
#define LED_IND		10
#define LED_ERR		11






// ユーザーインターフェースの初期化
void UI_Init(void);

// 割り込みルーチン
IH UI_OnTimer();

// シフトレジスタを8ビットまわす(入出力)
void RotateSR(char in, char *out1, char *out2);
// シフトレジスタを8ビットまわす(出力のみ)
void RotateSR(char in);

// LED表示を即時更新・スイッチ入力状態を更新
void UI_Update(void);


// LED表示を更新
inline void SetLED(int led, bool on);
inline void SetLED(int led, bool on){
	if (on == true)
		LEDFlags |= 1 << led;
	else
		LEDFlags &= ~(1 << led);
}

// 7セグLEDに数字を表示
void SetDisplay(unsigned char num);

// LEDを全消灯
inline void ClearLEDs(void);
inline void ClearLEDs(void){
	LEDFlags = 0;
	LEDSegments[0] = 0;
	LEDSegments[1] = 0;
}

#define CONV_SEG_TO_OUT1(s)							\
			( (((s) & 0x80) ? 0x01 : 0x00)	/* DP */\
			| (((s) & 0x40) ? 0x20 : 0x00)	/* a */	\
			| (((s) & 0x20) ? 0x10 : 0x00)	/* b */	\
			| (((s) & 0x10) ? 0x02 : 0x00)	/* c */	\
			| (((s) & 0x08) ? 0x04 : 0x00)	/* d */	\
			| (((s) & 0x04) ? 0x08 : 0x00)	/* e */	\
			| (((s) & 0x02) ? 0x40 : 0x00)	/* f */	\
			| (((s) & 0x01) ? 0x80 : 0x00)	/* g */	\
			)

#define CONV_SEG_TO_OUT2(s)							\
			( (((s) & 0x80) ? 0x10 : 0x00)	/* DP */\
			| (((s) & 0x40) ? 0x02 : 0x00)	/* a */	\
			| (((s) & 0x20) ? 0x01 : 0x00)	/* b */	\
			| (((s) & 0x10) ? 0x20 : 0x00)	/* c */	\
			| (((s) & 0x08) ? 0x40 : 0x00)	/* d */	\
			| (((s) & 0x04) ? 0x80 : 0x00)	/* e */	\
			| (((s) & 0x02) ? 0x04 : 0x00)	/* f */	\
			| (((s) & 0x01) ? 0x08 : 0x00)	/* g */	\
			)




#endif
