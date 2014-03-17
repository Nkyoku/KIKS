/**	@file
	@brief ADCの制御
*/

#ifndef ADC_H_
#define ADC_H_

#include <avr/io.h>



namespace ADC{
	
	extern unsigned char m_SupplyVoltage;
	extern unsigned char m_CapacitorVoltage;
	
	/*extern unsigned short m_CoefficientEnergy;
	extern unsigned short m_CoefficientCapacitor;
	extern unsigned short m_CoefficientSupply;*/
	
	
	
	// 初期化
	void Init(void);
	
	// 平常時の測定
	void Proc(bool init = false);
	
	// 構成リセット
	void ConfReset(void);
	
	// 充電電流を高速測定する構成へ変更
	void ConfCharge(void);
	
	// ソレノイド電流を高速測定する構成へ変更
	void ConfSolenoid(void);
	
	
	
	// 電源電圧を取得
	static inline unsigned char GetSupplyVoltage(void){
		return m_SupplyVoltage;
	}
	
	// キャパシタ電圧を取得
	static inline unsigned char GetCapacitorVoltage(void){
		return m_CapacitorVoltage;
	}
	
	
	
	// (電流測定時)電流値が測定できるのを待つ
	static inline void WaitCurrent(void){
		while(~ADCA.INTFLAGS & ADC_CH0IF_bm);
	}
	// (電流測定時電圧値が測定できるのを待つ
	static inline void WaitVoltage(void){
		while(~ADCA.INTFLAGS & ADC_CH1IF_bm);
	}
	
	// (電流測定時)電流値を取得
	static inline short GetCurrent12Bit(void){
		return ADCA.CH0RES;
	}
	
	// (電流測定時)電流値を取得
	static inline char GetCurrent8Bit(void){
		return ADCA.CH0RESL;
	}
	
	// (電流測定時)エネルギー貯蓄量を取得
	// 単位はジュールの2倍
	unsigned char GetEnergy(void);
	
	
	
}

#endif
