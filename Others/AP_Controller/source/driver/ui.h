// スイッチ・LEDの制御

#ifndef UI_H_
#define UI_H_

#include "../define.h"
#include "gpio.h"
#include "int.h"
#include "task.h"



// グローバル変数
extern volatile int SwitchFlags;
extern volatile int SwitchTriggers;

extern volatile int LEDFlags;
extern volatile char LEDSegments[2];



// 定数
#define F_UI_TASK	50		// UIは50Hzごとにデータを更新する



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



#define SW_LEFT		12
#define SW_UP		13
#define SW_RIGHT	15
#define SW_DOWN		14
#define SW_ROL			8
#define SW_ROR		2
#define SW_FN1		6
#define SW_FN2		4
#define SW_FN3		7
#define SW_FN4		5
#define SW_FN5		1
#define SW_FN6		0
#define SW_FN7			9
#define SW_FN8		3



// ユーザーインターフェースの初期化
void UI_Init(void);



// UIのメインルーチン
void UI_TaskMain(void);

// UIの終了ルーチン
void UI_TaskExit(void);



// シフトレジスタを8ビットまわす(入力)
void RotateSR(char *out1, char *out2);
// シフトレジスタを8ビットまわす(出力)
void RotateSR(char in);

// LED表示を即時更新・スイッチ入力状態を更新
void UI_Update(void);

// LED表示のみ更新
void UI_UpdateLED(void);


// LED表示を更新
inline void SetLED(int led, bool on){
	if (on == true)
		LEDFlags |= 1 << led;
	else
		LEDFlags &= ~(1 << led);
}

// 7セグLEDに数字を表示
void SetDisplay(unsigned char num);

// LEDを全消灯
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



// スイッチの状態を取得
inline bool GetSwitch(int sw);
inline bool GetSwitch(int sw){
	return (SwitchFlags & (1 << sw)) ? true : false;
}
// トリガーを取得
inline bool GetTrigger(int sw);
inline bool GetTrigger(int sw){
	return (SwitchTriggers & (1 << sw)) ? true : false;
}
// トリガーを取得してリセット
inline bool GetTriggerAndReset(int sw);
inline bool GetTriggerAndReset(int sw){
	bool ret = (SwitchTriggers & (1 << sw)) ? true : false;
	SwitchTriggers &= ~(1 << sw);
	return ret;
}







#endif
