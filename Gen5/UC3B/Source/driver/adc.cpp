/**	@file
	@brief 電圧測定
*/

#include "adc.h"


/*
	Vcc = 3.392[V]
	
	CH0 -> バッテリー
	CH5 -> 12V
	CH6 -> 温度
*/

namespace ADC{
	
	unsigned short BatteryVoltage;		// バッテリー電圧 x 100[V]
	unsigned short V12Volatge;			// 12V電源電圧 x 160[V]
	unsigned short Temperature;			// 温度 x 16[℃]
	unsigned short BatteryVoltageRaw;	// バッテリー電圧(生値) x 100[V]

	
	// 初期化
	void Init(void){
		// ADC_CLK=500kHz, SH_Time=6us, STARTUP=48us
		AVR32_ADC.mr = (15 << AVR32_ADC_MR_SHTIM) | (2 << AVR32_ADC_MR_STARTUP) | (59 << AVR32_ADC_MR_PRESCAL);
		AVR32_ADC.cher = AVR32_ADC_CHER_CH6_MASK | AVR32_ADC_CHER_CH5_MASK | AVR32_ADC_CHER_CH0_MASK;
		AVR32_ADC.cdr6;
		
		// 始めに1度変換
		AVR32_ADC.cr = AVR32_ADC_CR_START_MASK;
		while(~AVR32_ADC.sr & AVR32_ADC_SR_EOC6_MASK);
		BatteryVoltage = AVR32_ADC.cdr0 * 10000 / 2744;
		V12Volatge = AVR32_ADC.cdr5 * 16000 / 2744;
		Temperature = (AVR32_ADC.cdr6 - 121) / 6 * 16;
		
		AVR32_ADC.cr = AVR32_ADC_CR_START_MASK;
	}
	
	// 値を更新
	void Update(void){
		if (AVR32_ADC.sr & AVR32_ADC_SR_EOC6_MASK){
			int value, new_value;
			
			new_value = AVR32_ADC.cdr0 * 10000 / 2744;
			value = (new_value + (int)BatteryVoltage * 15) / 16;
			BatteryVoltage = value;
			BatteryVoltageRaw = new_value;
			//BatteryVoltage = new_value;
			
			new_value = AVR32_ADC.cdr5 * 1000 / 2744;
			value = (new_value + (int)V12Volatge * 15 / 16);
			V12Volatge = value;
			//V12Volatge = new_value;
			
			new_value = (AVR32_ADC.cdr6 - 121) / 6;	// 正確には5.9
			value = (new_value + (int)Temperature * 15 / 16);
			Temperature = value;
			//Temperature = new_value;
			
			AVR32_ADC.cr = AVR32_ADC_CR_START_MASK;
		}			
	}
	
}
