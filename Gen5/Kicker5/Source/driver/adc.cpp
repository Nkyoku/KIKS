/**	@file
	@brief ADCの制御
*/

#include "../define.h"
#include "adc.h"

#include <stddef.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>



#define ADC_CH_MUXNEG_PADGND_gc	(0b101 << 0)



// 16ビット値を8ビットにクリップ
static inline unsigned char Clip8Bit(signed short word){
	unsigned char high = word >> 8;
	if (high != 0){
		if (high & 0x80){
			return 0;
		}else{
			return 255;
		}
	}else{
		return word;
	}
}

// 16x16=>32bitの掛け算
signed long Mul16x16to32(signed short in1, unsigned short in2){
	signed long result;
	__asm__ __volatile__(
		"clr r16"			"\n\t"
		"mul %A1, %A2"		"\n\t"
		"movw %A0, r0"		"\n\t"
		"muls %B1, %B2"		"\n\t"
		"movw %C0, r0"		"\n\t"
		"mulsu %B2, %A1"	"\n\t"
		"sbrc r1, 7"		"\n\t"
		"ser r16"			"\n\t"
		"add %B0, r0"		"\n\t"
		"adc %C0, r1"		"\n\t"
		"adc %D0, r16"		"\n\t"
		"clr r16"			"\n\t"
		"mulsu %B1, %A2"	"\n\t"
		"sbrc r1, 7"		"\n\t"
		"ser r16"			"\n\t"
		"add %B0, r0"		"\n\t"
		"adc %C0, r1"		"\n\t"
		"adc %D0, r16"		"\n\t"
		"clr r1"			"\n\t"
		: "=&r"(result)
		: "a"(in1), "a"(in2)
		: "r16"
		);
	return result;
}



/*
	Vref = 3.392[V]
	
	CH0 -> PIN4:CapacitorVoltage
	CH1 -> PIN1:LineVoltage
	CH2 -> PIN2:SupplyVoltage
	CH3 -> (PIN3:Temperature)
*/



namespace ADC{
	
	// 換算係数
	static const unsigned short COEFFICIENT_CAPACITOR	= 10244;	// 0.15631
	static const unsigned short COEFFICIENT_SUPPLY		= 7463;		// 0.11387
	
	short m_ChannelFilter[3];	// フィルター値
	unsigned char m_SupplyVoltage;		// 供給電圧(スイッチ前の電源電圧)
	unsigned char m_LineVoltage;		// ライン電圧(ヒューズ後の電源電圧)
	unsigned char m_CapacitorVoltage;	// キャパシタ電圧
	
	
	
	
	
	// 初期化
	void Init(void){
		// ADCのキャリブレーション値を読み込む
		unsigned char adca_calL, adca_calH;
		NVM.CMD = NVM_CMD_READ_CALIB_ROW_gc;
		adca_calL = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL0));
		adca_calH = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL1));
		ADCA.CAL = (adca_calH << 8) | adca_calL;
		NVM.CMD = NVM_CMD_NO_OPERATION_gc;
		
		// ADCレジスタを初期化
		ADCA.REFCTRL	= ADC_REFSEL_VCC_gc;
		ADCA.PRESCALER	= ADC_PRESCALER_DIV16_gc;
		ADCA.CH0.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH1.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH2.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH0.MUXCTRL	= ADC_CH_MUXPOS_PIN4_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.CH1.MUXCTRL	= ADC_CH_MUXPOS_PIN1_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.CH2.MUXCTRL	= ADC_CH_MUXPOS_PIN2_gc | ADC_CH_MUXNEG_PADGND_gc;
		
		// 初回の測定をする
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		Proc(true);
	}
	
	// 平常時の測定
	void Proc(bool init){
		// 測定開始
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		ADCA.CTRLB		= ADC_CONMODE_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_12BIT_gc;
		ADCA.INTFLAGS	= ADC_CH2IF_bm;
		ADCA.CTRLA		= ADC_CH2START_bm | ADC_CH1START_bm | ADC_CH0START_bm | ADC_ENABLE_bm;
		while(~ADCA.INTFLAGS & ADC_CH2IF_bm);
		
		// 結果を処理
		union{
			signed short DWord[2];
			signed long QWord;
		} res;
		
		if (init == true){
			m_ChannelFilter[0] = ADCA.CH0RES;
			m_ChannelFilter[1] = ADCA.CH1RES;
			m_ChannelFilter[2] = ADCA.CH2RES;
		}else{
			m_ChannelFilter[0] = m_ChannelFilter[0] * 3 + ADCA.CH0RES + 2;
			m_ChannelFilter[0] >>= 2;
			m_ChannelFilter[1] = m_ChannelFilter[1] * 7 + ADCA.CH1RES + 4;
			m_ChannelFilter[1] >>= 3;
			m_ChannelFilter[2] = m_ChannelFilter[2] * 7 + ADCA.CH2RES + 4;
			m_ChannelFilter[2] >>= 3;
		}
		
		// CH0
		res.QWord = Mul16x16to32(m_ChannelFilter[0], COEFFICIENT_CAPACITOR);
		m_CapacitorVoltage = Clip8Bit(res.DWord[1]);
		
		// CH1
		res.QWord = Mul16x16to32(m_ChannelFilter[1], COEFFICIENT_SUPPLY);
		m_LineVoltage = Clip8Bit(res.DWord[1]);
		
		// CH2
		res.QWord = Mul16x16to32(m_ChannelFilter[2], COEFFICIENT_SUPPLY);
		m_SupplyVoltage = Clip8Bit(res.DWord[1]);
	}
	
	
	
	
	
	
	
	
}




