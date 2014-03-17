/**	@file
	@brief 電圧測定
*/

#ifndef ADC_H_
#define ADC_H_

#include "../define.h"
#include "int.h"



namespace ADC{
	
	
	static const unsigned short BATTERY_HIGH_THRESHOULD		= 1520;	// 1セルあたり3.8V
	static const unsigned short BATTERY_MIDDLE_THRESHOULD	= 1400;	// 1セルあたり3.5V
	//static const unsigned short BATTERY_LOW_THRESHOULD		= 1320;	// 1セルあたり3.3V
	//static const unsigned short SWITCH_OFF_THRESHOULD		= 1120;	// 1セルあたり2.8V
	static const unsigned short BATTERY_LOW_THRESHOULD		= 1000;	// 1セルあたり3.3V
	static const unsigned short SWITCH_OFF_THRESHOULD		= 900;	// 1セルあたり2.8V
	
	
	enum BATLEVEL_e{
		BATLEVEL_HIGH,
		BATLEVEL_MIDDLE,
		BATLEVEL_LOW,
		BATLEVEL_SWOFF
	};
	
	static const unsigned short OVERTEMP_THRESHOULD	= 60 * 16;		// 60℃
	
	extern unsigned short BatteryVoltage;
	extern unsigned short V12Volatge;
	extern unsigned short Temperature;
	extern unsigned short BatteryVoltageRaw;
	
	
	
	// 初期化
	void Init(void);
	
	// 値を更新
	void Update(void);
	
	// バッテリー電圧を取得
	static inline int GetBatteryVoltage(void){
		return BatteryVoltage;
	}
	static inline int GetBatteryVoltageRaw(void){
		return BatteryVoltage;
	}
	
	// 12V電源電圧を取得
	static inline int Get12VVoltage(void){
		return V12Volatge / 16;
	}
	static inline int Get12VVoltageRaw(void){
		return V12Volatge;
	}
	
	// モータードライバー2の温度を取得
	static inline int GetTemperature(void){
		return Temperature / 16;
	}
	static inline int GetTemperatureRaw(void){
		return Temperature;
	}
	
	// バッテリーレベルを取得
	static inline BATLEVEL_e GetBatteryLevel(void){
		if (BATTERY_HIGH_THRESHOULD <= BatteryVoltage) return BATLEVEL_HIGH;
		if (BATTERY_MIDDLE_THRESHOULD <= BatteryVoltage) return BATLEVEL_MIDDLE;
		if (BATTERY_LOW_THRESHOULD <= BatteryVoltage) return BATLEVEL_LOW;
		return BATLEVEL_SWOFF;
	}

	// 過熱状態かどうか取得
	static inline bool IsOverTemperature(void){
		return OVERTEMP_THRESHOULD <= Temperature;
	}

	// 電源が落とされたかどうか取得
	static inline bool IsSwitchOff(void){
		return BatteryVoltageRaw < SWITCH_OFF_THRESHOULD;
	}

}


#endif