/**	@file
	@brief ADCの制御
*/

#ifndef ADC_H_
#define ADC_H_

#include <avr/io.h>



namespace ADC{
	
	extern unsigned char m_SupplyVoltage;
	extern unsigned char m_LineVoltage;
	extern unsigned char m_CapacitorVoltage;
	
	
	
	
	// 初期化
	void Init(void);
	
	// 平常時の測定
	void Proc(bool init = false);
	
	
	// 供給電圧を取得
	static inline unsigned char GetSupplyVoltage(void){
		return m_SupplyVoltage;
	}
	
	// ライン電圧を取得
	static inline unsigned char GetLineVoltage(void){
		return m_LineVoltage;
	}
	
	// キャパシタ電圧を取得
	static inline unsigned char GetCapacitorVoltage(void){
		return m_CapacitorVoltage;
	}
	
	
	
}

#endif
