// クロック管理

#include "clock.h"



// クロックの初期化
void Clock_Init(void){
	// 24MHz発振器を起動
	PM.mcctrl   = AVR32_PM_MCCTRL_OSC0EN_MASK | (AVR32_PM_MCCTRL_MCSEL_SLOW << AVR32_PM_MCCTRL_MCSEL);
	PM.oscctrl0 = (AVR32_PM_OSCCTRL0_MODE_EXT_CLOCK << AVR32_PM_OSCCTRL0_MODE)
	              | (AVR32_PM_OSCCTRL0_STARTUP_16384_RCOSC << AVR32_PM_OSCCTRL0_STARTUP);
	while(~PM.poscsr & AVR32_PM_POSCSR_OSC0RDY_MASK);

	// PLLを起動 (24MHz -> DIV -> 12MHz -> PLL -> 96MHz -> DIV -> 48MHz)
	PM.pll[0] = ((8-1) << AVR32_PM_PLLMUL) | (2 << AVR32_PM_PLLDIV) | (0b111 << AVR32_PM_PLLOPT)
	          | (0 << AVR32_PM_PLL0_PLLOSC) | AVR32_PM_PLLEN_MASK;
	while(~PM.poscsr & AVR32_PM_POSCSR_LOCK0_MASK);

	// クロック源をPLLに変更
	FLASHC.FCR.fws = 1;	// 1ウェイト
	PM.mcctrl	= AVR32_PM_MCCTRL_OSC0EN_MASK | (AVR32_PM_MCCTRL_MCSEL_PLL0 << AVR32_PM_MCCTRL_MCSEL);
	PM.gcctrl[AVR32_PM_GCLK_USBB] = AVR32_PM_GCCTRL_CEN_MASK | AVR32_PM_GCCTRL_PLLSEL_MASK;	// GCLK_USBBへクロック供給
	
	// 不必要なモジュールへのクロック供給を止める
	PM.hsbmask = 0b11111;
	PM.pbamask = 0b01001100001111;
	PM.pbbmask = 0b111;
}




