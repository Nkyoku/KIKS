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



#include "driver/mode.h"
#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/usb.h"
#include "usbif.h"
#ifdef _APP_
#include "driver/uart.h"
#include "driver/adc.h"
#include "charge.h"
#include "hostif.h"
#endif
#include "xprintf.h"



/* 定数 */
static const unsigned short DFU_TIMEOUT	= 500;		// DFUモードでUSB通信が無いときにAPPモードに移行するまでの時間
static const unsigned char HEARTBEAT_PERIOD	= 5;	// 充電電圧や温度を送る周期

//volatile char _cs_counter;		// クリティカルセクションのカウンタ

/* グローバル変数 */
volatile unsigned long g_Tick;		// 起動してからの経過時間
volatile bool g_TickFlag = false;	// チック割り込みが発生したときにtrueになる
volatile bool g_USBAlive;			// USBが接続中



// チック割り込み
ISR(TCD0_OVF_vect){
	static unsigned char cnt1, cnt2;
	static unsigned char per1, per2;
	
#ifdef _DFU_
	bool alive = USBC::LinkAlive();
	g_USBAlive = alive;
	
	if (alive == true){
		cnt1 = 1; per1 = 0;	// LED1 点灯
	}else{
		cnt1 = 0; per1 = 0;	// LED1 消灯
	}
	per2 = 200;	// LED2 点滅
#else
	if (Charge::IsErrorOccured() == false){
		// 正常動作
		per1 = 200;	// LED1 点滅
		if (Charge::IsCharging() == true){
			cnt2 = 1; per2 = 0;	// LED2 点灯
		}else{
			cnt2 = 0; per2 = 0;	// LED2 消灯
		}
	}else{
		// 異常動作
		per1 = 100;	// LED1,2 点滅
		cnt2 = cnt1;
		per2 = per1;
	}
#endif
	
	// LEDの点灯制御
	if (cnt1 <= (per1 >> 1)){
		SetOut(PIN_LED1, OUT_LOW);
	}else{
		SetOut(PIN_LED1, OUT_HIGH);
	}
	if (per1 <= ++cnt1){
		cnt1 = 0;
	}
	if (cnt2 <= (per2 >> 1)){
		SetOut(PIN_LED2, OUT_LOW);
	}else{
		SetOut(PIN_LED2, OUT_HIGH);
	}
	if (per2 <= ++cnt2){
		cnt2 = 0;
	}
	
	g_Tick++;
	g_TickFlag = true;
}

// 一定時間待つ
static void WaitFor(unsigned short time);



#include <avr/eeprom.h>

// メイン
int main(void){
#ifdef _DFU_
	// リセット要因を見て分岐
	Mode::JumpToAPPIfNecessary();
#endif
	
	// 割り込みの設定
#ifdef _DFU_
	WriteProtectedIOREG(&PMIC_CTRL, PMIC_RREN_bm | PMIC_IVSEL_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm);
#else
	WriteProtectedIOREG(&PMIC_CTRL, PMIC_RREN_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm);
#endif

	
	
	
	
	// システム初期化
	GPIO::Init();
	Clock::Init();
	USBC::Enable();
	
	xprintf("Debug Output\n");
	
#ifdef _APP_
	ADC::Init();
	Charge::Init();
	UART::Init();
#endif
	
	// DMAを有効化
	DMA.CTRL = DMA_ENABLE_bm | DMA_DBUFMODE_CH23_gc;
	
	// チックタイマーを設定
	TCD0.PER = 1000 - 1;	// 2ms
	TCD0.INTCTRLA = TC_OVFINTLVL_MED_gc;
	TCD0.CTRLA = TC_CLKSEL_DIV64_gc;
	
	// 割り込み許可
	sei();
	
	WaitFor(50);
	
	// USB接続
	USBC::Attach();
	
	while(true){
		// リセット要求を確認
		char reset_request = USBIF::ResetRequest();
		switch(reset_request){
		case USBIF::REQ_NONE:
			break;
			
		default:
			USBC::Disable();
			WaitFor(50);
			if (reset_request == USBIF::REQ_APP){
				Mode::SwitchToAPP();
			}else{
				Mode::SwitchToDFU();
			}
		}
		
#ifdef _APP_
		// 充電処理
		//ADC::Proc();
		//Charge::Proc();
#endif
		
		// チックイベント
		if (g_TickFlag == true){
			g_TickFlag = false;
			
#ifdef _APP_
			// 電圧測定
			ADC::Proc();
			Charge::Proc();
			
			// ホストとの通信
			static unsigned char heartbeat_cnt = 0;
			if (HEARTBEAT_PERIOD <= ++heartbeat_cnt){
				heartbeat_cnt = 0;
				HOSTIF::SendHeartBeat();
			}
			HOSTIF::Proc();
			
			static unsigned short second = 0;
			if (500 <= ++second){
				second = 0;
				xprintf("V=%d C=%d\n", ADC::GetSupplyVoltage(), ADC::GetCapacitorVoltage());
				//xprintf("A=%d,B=%d,C=%d\n", ADCA.CH0.RES, ADCA.CH1.RES, ADCA.CH2.RES);
			}
#endif

#ifdef _DFU_
			// USB接続が一定時間されていないときは、自動的にAPPモードに移行する
			static unsigned short dfu_cnt;
			if (g_USBAlive == false){
				if (DFU_TIMEOUT <= ++dfu_cnt){
					USBC::Disable();
					WaitFor(50);
					Mode::SwitchToAPP();
				}
			}else{
				dfu_cnt = 0;
			}
#endif
		}
		
		
	}
	return 0;
}



// 一定時間待つ
static void WaitFor(unsigned short time){
	// この関数を呼び出すときは必ず割り込みが有効になっている
	unsigned long end;
	cli();
	end = g_Tick + time;
	sei();
	while(true){
		unsigned long now;
		cli();
		now = g_Tick;
		sei();
		if (end <= now) break;
	}
}



extern "C" void __cxa_pure_virtual(){while(true);}
