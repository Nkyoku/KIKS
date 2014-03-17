/**	@file
	@brief メイン
*/



// マクロのチェック
#ifdef _DFU_
#ifdef _APP_
#error Both _DFU_ and _APP_ are defined.
#endif
#endif
#ifndef _DFU_
#ifndef _APP_
#error Both _DFU_ and _APP_ are not defined.
#endif
#endif

// virtualメソッドを使うときにコードが肥大化することへの対処
extern "C" void __cxa_pure_virtual(){while(true);}



#define _MAIN_CPP_

#include "driver/boot.h"
#include "driver/int.h"
#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/adc.h"
#include "driver/time.h"
#include "driver/debugIF.h"
#include "driver/usb.h"
#include "driver/spi.h"
#include "driver/spartan6.h"
#include "driver/mx25l6445e.h"
#include "driver/kicker.h"

#include "ff.h"
#include "HAL/TTY.h"
#include "HAL/BTLUSB.h"

#include "FreeRTOS.h"
#include "task.h"

#include "safety_task.h"
//#include "shell_task.h"
//#include "usb_task.h"
//#ifdef _APP_
//#include "main_task.h"
//#endif

#include "global.h"






// メイン
int main(void){
#ifdef _DFU_
	// 起動フラグを見て分岐
	Boot::JumpToAPPIfNecessary();
#else
	// 起動フラグが正常かチェック
	Boot::CheckFlagAtAPP();
#endif
	
	// HMATRIXの優先度設定
	//AVR32_HMATRIX.prs[3].pras = 3 << AVR32_HMATRIX_PRAS3_M3PR;
	
	// システム初期化
	GPIO::Init();
	Clock::Init();
	Int::Init();
	Time::Init();
	ADC::Init();
	nsDebugIF::Init();
	USB::Init();
	SPI::Init();
	FPGA::Init();
	SPIFlash::Init();
#ifdef _APP_
	Kicker::Init();
#endif
	
	// RTOS初期化
	Tick_Init();
	
	// ジャンパ読み取り
	int id = 0;
	if (GetIn(PIN_SETTING_ID2) == IN_LOW) id |= 0x4;
	if (GetIn(PIN_SETTING_ID1) == IN_LOW) id |= 0x2;
	if (GetIn(PIN_SETTING_ID0) == IN_LOW) id |= 0x1;
	g_MachineID = id;
	if (GetIn(PIN_SETTING_CHARGER) == IN_LOW) g_HiResEncoder = true;	// 現在はエンコーダの識別のために使用
	
	// タスク作成
	xTaskCreate(SafetyTask::Task, "Safety", 1024, NULL, PRIORITY_LOW, NULL);
	
	// RTOSスタート
	vTaskStartScheduler();
	
	return 0;
}



