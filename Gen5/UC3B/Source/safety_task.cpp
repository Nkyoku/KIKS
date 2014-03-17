/**	@file
	@brief 電源監視、シャットダウン管理等
*/

#include "safety_task.h"

#include "driver/gpio.h"
#include "driver/adc.h"
#include "driver/boot.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "ff.h"

#include "global.h"

#include "shell_task.h"
#include "usb_task.h"
#ifdef _APP_
#include "main_task.h"
#include "kicker_task.h"
#include "logger.h"
#endif







namespace SafetyTask{
	
	volatile int m_RebootMode = 0;	// 再起動要求
	


	// タスク
	void Task(void *param){
		// FatFsマウント
		f_mount(0, &g_FatFs_LogVol0);
		
		// ADCの値が落ち着くまで待つ
		for(int cnt = 10; 0 < cnt; cnt--){
			if (m_RebootMode != 0) break;
			ADC::Update();
			vTaskDelay(TASK_DELAY_MS(2));
		}
		
		// 各タスクを起動
		xTaskCreate(ShellTask::Task, "Shell", 1024, NULL, PRIORITY_HIGH, NULL);
		xTaskCreate(USBTask::Task, "USB", 2048, NULL, PRIORITY_NORMAL, NULL);
#ifdef _APP_
		if (Boot::IsSafeAPP() == false){
			MainTask::MainCreate();
		}
		xTaskCreate(KickerTask::Task, "Kicker", 512, NULL, PRIORITY_HIGH, NULL);
#endif
		
		// 通常動作
#ifdef _APP_
		int presc = 50;
#endif
		while(m_RebootMode == 0){
			ADC::Update();
			if (ADC::IsSwitchOff() == true){
				// 電源が落とされた
				break;
			}
			
#ifdef _APP_
			if (presc-- < 0){
				presc = 50;
				using namespace Logger;
				portENTER_CRITICAL();
				AddTime(xTaskGetTickCount());
				AddDataHalf(ID_BAT_VOLATGE, ADC::GetBatteryVoltageRaw());
				AddDataHalf(ID_GATE_VOLATGE, ADC::Get12VVoltageRaw());
				AddDataHalf(ID_TEMPERATURE, ADC::GetTemperatureRaw());
				portEXIT_CRITICAL();
			}
#endif
			
			vTaskDelay(TASK_DELAY_MS(10));
		}
		
		
		
		// 再起動・シャットダウン待ち
		int mode = m_RebootMode;
		
		// 終了処理が必要なタスクに終了要求を出す
		USBTask::RequestExit();
#ifdef _APP_
		MainTask::RequestExit();
		KickerTask::RequestExit();
#endif
		
		// 終了を待つ
		while(USBTask::IsAlive() == true){
			vTaskDelay(TASK_DELAY_MS(2));
		}
#ifdef _APP_
		while(MainTask::IsAlive() == true){
			vTaskDelay(TASK_DELAY_MS(2));
		}
		while(KickerTask::IsAlive() == true){
			vTaskDelay(TASK_DELAY_MS(2));
		}
#endif
		
		// FatFsアンマウント
		f_mount(0, NULL);
		
		// おわり
		DisableGlobalInt();
		
		SetOut(PIN_LED1, PIN_LED2, OUT_HIGH);
		SetOut(PIN_nLED3, OUT_LOW);
		
		// 再起動・シャットダウン
		if (mode != 0){
			Boot::SwitchTo((Boot::BOOT_e)mode);
		}else{
			while(true);		
		}
	}
	
	
	
	
	
	
	
	
}
