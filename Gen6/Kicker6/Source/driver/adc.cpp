/**	@file
	@brief ADCの制御
*/

#include "../define.h"
#include "adc.h"
#include "flash.h"

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
	Vref = 2.500[V]
	
	CH0 -> PIN5:ChargeCurrent / PIN11:SolenoidCurrent
	CH1 -> PIN1:CapacitorVoltage
	CH2 -> ----
	CH3 -> PIN6:SupplyVoltage
*/



namespace ADC{
	
	// キャリブレーションの標準値
	static const unsigned short COEFFICIENT_ENERGY		= 1401;		// (0.16681<<4)^2 * 0.003
	static const unsigned short COEFFICIENT_CAPACITOR	= 10932;	// 0.16681
	static const unsigned short COEFFICIENT_SUPPLY		= 8800;		// 0.13428
	
	// キャリブレーション値
	unsigned short m_CoefficientEnergy;
	unsigned short m_CoefficientCapacitor;
	unsigned short m_CoefficientSupply;
	
	short m_Channel1Filter;	// フィルター値
	short m_Channel3Filter;
	unsigned char m_SupplyVoltage;		// 電源電圧
	unsigned char m_CapacitorVoltage;	// キャパシタ電圧
	
	unsigned char m_EnergyTable[127];	// 電圧値とエネルギーの換算テーブル
	
	
	
	
	// 初期化
	void Init(void){
		// キャリブレーション値を読み込む
		m_CoefficientEnergy		= Flash::EEPROMReadWord(0x0006, COEFFICIENT_ENERGY);
		m_CoefficientCapacitor	= Flash::EEPROMReadWord(0x0004, COEFFICIENT_CAPACITOR);
		m_CoefficientSupply		= Flash::EEPROMReadWord(0x0002, COEFFICIENT_SUPPLY);
		
		// 換算テーブルを作成
		for(unsigned char val = 0; ++val <= 128; ){
			unsigned short val2;
			__asm__ __volatile__(
				"mul %1, %1"	"\n\t"
				"movw %A0, r0"	"\n\t"
				"clr r1"
				: "=&r"(val2) : "r"(val));
			union{
				signed short DWord[2];
				signed long QWord;
			} res;
			res.QWord = Mul16x16to32(val2, m_CoefficientEnergy);
			m_EnergyTable[val - 1] = Clip8Bit(res.DWord[1]);
		}
		
		// ADCのキャリブレーション値を読み込む
		unsigned char adca_calL, adca_calH;
		NVM.CMD = NVM_CMD_READ_CALIB_ROW_gc;
		adca_calL = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL0));
		adca_calH = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL1));
		ADCA.CAL = (adca_calH << 8) | adca_calL;
		NVM.CMD = NVM_CMD_NO_OPERATION_gc;
		
		// ADCレジスタを初期化
		ADCA.REFCTRL	= ADC_REFSEL_AREFA_gc;
		ADCA.PRESCALER	= ADC_PRESCALER_DIV16_gc;
		ADCA.CH0.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH1.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH3.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH1.MUXCTRL	= ADC_CH_MUXPOS_PIN1_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.CH3.MUXCTRL	= ADC_CH_MUXPOS_PIN6_gc | ADC_CH_MUXNEG_PADGND_gc;
		
		// 初回の測定をする
		ConfReset();
		Proc(true);
	}
	
	// 平常時の測定
	void Proc(bool init){
		// 測定開始
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		ADCA.CTRLB		= ADC_CONMODE_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_12BIT_gc;
		ADCA.INTFLAGS	= ADC_CH3IF_bm;
		ADCA.CTRLA		= ADC_CH3START_bm | ADC_CH1START_bm | ADC_ENABLE_bm;
		while(~ADCA.INTFLAGS & ADC_CH3IF_bm);
		
		// 結果を処理
		union{
			signed short DWord[2];
			signed long QWord;
		} res;
		
		if (init == true){
			m_Channel1Filter = ADCA.CH1RES;
			m_Channel3Filter = ADCA.CH3RES;
		}else{
			m_Channel1Filter = m_Channel1Filter + ADCA.CH1RES + 1;
			m_Channel1Filter >>= 1;
			m_Channel3Filter = m_Channel3Filter * 7 + ADCA.CH3RES + 4;
			m_Channel3Filter >>= 3;
		}
		
		// CH2
		res.QWord = Mul16x16to32(m_Channel1Filter, m_CoefficientCapacitor);
		m_CapacitorVoltage = Clip8Bit(res.DWord[1]);
			
		// CH3
		res.QWord = Mul16x16to32(m_Channel3Filter, m_CoefficientSupply);
		m_SupplyVoltage = Clip8Bit(res.DWord[1]);
	}
	
	
	// 構成リセット
	void ConfReset(void){
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		//ADCA.CTRLB		= ADC_CONMODE_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_12BIT_gc;
		//ADCA.INTFLAGS	= ADC_CH3IF_bm | ADC_CH2IF_bm | ADC_CH1IF_bm | ADC_CH0IF_bm;
	}
	
	// 充電電流を高速測定する構成へ変更
	void ConfCharge(void){
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		ADCA.CH0.MUXCTRL= ADC_CH_MUXPOS_PIN5_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.INTFLAGS	= ADC_CH0IF_bm;
		ADCA.EVCTRL		= ADC_SWEEP_0_gc;
		ADCA.CTRLB		= ADC_CONMODE_bm | ADC_FREERUN_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_8BIT_gc;
		ADCA.CTRLA		= ADC_CH0START_bm | ADC_ENABLE_bm;
	}
	
	// ソレノイド電流を高速測定する構成へ変更
	void ConfSolenoid(void){
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		ADCA.CH0.MUXCTRL= ADC_CH_MUXPOS_PIN11_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.INTFLAGS	= ADC_CH1IF_bm | ADC_CH0IF_bm;
		ADCA.EVCTRL		= ADC_SWEEP_01_gc;
		ADCA.CTRLB		= ADC_CONMODE_bm | ADC_FREERUN_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_8BIT_gc;
		ADCA.CTRLA		= ADC_CH1START_bm | ADC_CH0START_bm | ADC_ENABLE_bm;
	}
	
	// (電流測定時)エネルギー貯蓄量を取得
	// 単位はジュールの2倍
	unsigned char GetEnergy(void){
		char vol = ADCA.CH1RESL;
		//char vol = ADCA.CH1RES >> 4;
		if (vol <= 0) return 0;
		return m_EnergyTable[(unsigned char)(vol - 1)];
	}
	
	
	
	
	
	
	
	
	
}




