// スイッチ・LEDの制御

#include "ui.h"



volatile int SwitchFlags = 0;		// スイッチの現在の押下状態
volatile int SwitchTriggers = 0;	// 前フレームにスイッチを走査してから押下状態が変化したか

volatile int LEDFlags = 0;				// LEDの点灯状態
volatile char LEDSegments[2] = {0, 0};	// 7セグメントLEDの点灯状態




// ユーザーインターフェースの初期化
void UI_Init(void){
	TC.channel[1].cmr	= AVR32_TC_CMR0_WAVE_MASK
						| (AVR32_TC_CMR0_WAVSEL_UP_AUTO << AVR32_TC_CMR0_WAVSEL)
						| (AVR32_TC_CMR0_TCCLKS_TIMER_CLOCK5 << AVR32_TC_CMR0_TCCLKS);	// 128分周
	TC.channel[1].rc	= (F_PER / 128) / F_UI;
	
	Int_Register(AVR32_TC_IRQ1, (void*)UI_OnTimer, IL_HIGH);
	TC.channel[1].ier	= AVR32_TC_IER0_CPCS_MASK;
	
	TC.channel[1].ccr	= AVR32_TC_CCR0_SWTRG_MASK | AVR32_TC_CCR0_CLKEN_MASK;
}

// 割り込みルーチン
IH UI_OnTimer(){
	TC.channel[1].sr;
	UI_Update();
}


// シフトレジスタを8ビットまわす(入出力)
void RotateSR(char in, char *out1_, char *out2_){
	char out1 = 0, out2 = 0;
	for(unsigned int cnt = 8; 0 < cnt; cnt--){
		SetOut(PORT_SR_DO, (in & 0x80) ? OUT_HIGH : OUT_LOW);
		SetOut(PORT_SR_CLK, OUT_HIGH);
		NOP();
		NOP();
		SetOut(PORT_SR_CLK, OUT_LOW);
		NOP();
		int i = GetIn(PORT_SR_DI1);
		int j = GetIn(PORT_SR_DI2);
		out1 |= (i == IN_HIGH) ? 0x1 : 0x0;
		out2 |= (j == IN_HIGH) ? 0x1 : 0x0;
		in <<= 1;
		out1 <<= 1;
		out2 <<= 1;
	}
	*out1_ = out1;
	*out2_ = out2;
}
// シフトレジスタを8ビットまわす(出力のみ)
void RotateSR(char in){
	for(unsigned int cnt = 8; 0 < cnt; cnt--){
		SetOut(PORT_SR_DO, (in & 0x80) ? OUT_HIGH : OUT_LOW);
		SetOut(PORT_SR_CLK, OUT_HIGH);
		SetOut(PORT_SR_CLK, OUT_LOW);
	}
}

// LED表示を即時更新・スイッチ入力状態を更新
void UI_Update(void){
	/* スイッチを走査・LEDの表示 */
	int sw_flags;
	int led_flags = LEDFlags;
	char led_segs[2] = {LEDSegments[0], LEDSegments[1]};
	
	sw_flags  =	(GetIn(PORT_SW5) == IN_LOW) ? (1 << 5) : 0;
	sw_flags |=	(GetIn(PORT_SW13) == IN_LOW) ? (1 << 13) : 0;
	
	SetOut(PORT_LED_PWR, (led_flags & (1 << LED_PWR)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_TRC, (led_flags & (1 << LED_TRC)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_IND, (led_flags & (1 << LED_IND)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_ERR, (led_flags & (1 << LED_ERR)) ? OUT_HIGH : OUT_LOW);
	
	// シフトレジスタの操作
	SetOut(PORT_SR_CL, OUT_LOW);
	NOP();
	SetOut(PORT_SR_CL, OUT_HIGH);
	
	char in1, in2;
	RotateSR(led_segs[0], &in1, &in2);
	RotateSR(led_segs[1]);
	RotateSR(led_flags);
	
	/* スイッチのビットの並べ替え */
	
	
	sw_flags = 0;
	SwitchTriggers = sw_flags ^ SwitchFlags;
	SwitchFlags = sw_flags;
}	




// 7セグLED(1)の変換テーブル
const char AsciiToSegmentTable1[10] = {
	CONV_SEG_TO_OUT1(0b1111110),	// 0
	CONV_SEG_TO_OUT1(0b0110000),	// 1
	CONV_SEG_TO_OUT1(0b1101101),	// 2
	CONV_SEG_TO_OUT1(0b1111001),	// 3
	CONV_SEG_TO_OUT1(0b0110011),	// 4
	CONV_SEG_TO_OUT1(0b1011011),	// 5
	CONV_SEG_TO_OUT1(0b1011111),	// 6
	CONV_SEG_TO_OUT1(0b1110000),	// 7
	CONV_SEG_TO_OUT1(0b1111111),	// 8
	CONV_SEG_TO_OUT1(0b1111011)		// 9
};
const char AsciiToSegmentTable2[10] = {
	CONV_SEG_TO_OUT2(0b1111110),	// 0
	CONV_SEG_TO_OUT2(0b0110000),	// 1
	CONV_SEG_TO_OUT2(0b1101101),	// 2
	CONV_SEG_TO_OUT2(0b1111001),	// 3
	CONV_SEG_TO_OUT2(0b0110011),	// 4
	CONV_SEG_TO_OUT2(0b1011011),	// 5
	CONV_SEG_TO_OUT2(0b1011111),	// 6
	CONV_SEG_TO_OUT2(0b1110000),	// 7
	CONV_SEG_TO_OUT2(0b1111111),	// 8
	CONV_SEG_TO_OUT2(0b1111011)		// 9
};

// 7セグLEDに数字を表示
void SetDisplay(unsigned char num){
	unsigned char high = (num / 10) % 10;
	unsigned char low = num % 10;
	LEDSegments[0] = AsciiToSegmentTable1[high];
	LEDSegments[1] = AsciiToSegmentTable2[low];
}


