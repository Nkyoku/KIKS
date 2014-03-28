/*	@file
	@brief openMSP430コアで動くプログラム
*/

#include "define.h"
#include "smem.h"
#include "controller.h"
#include "motor.h"
#include "driver/intc.h"
#include "driver/gpio.h"
#include "driver/logger.h"
#include "driver/delay.h"
#include "driver/mpu6000.h"
#include "driver/xbee.h"



// グローバル変数
volatile bool g_IntPeriodicOccured = false;		// 定期割り込みが発生した



// メイン
int main(void){
	// WDTはHDLレベルで無効化済み
	
	// 共有メモリー初期化
	// ...
	SMEM.ControlVia = CONTROL_VIA_NONE;
	SMEM.TerminalEnabled = 0;
	
	
	// I/Oを初期化
	PORT[0].OUT = 0;
	PORT[1].OUT = IO_BIT(PIN_PWR_BALL) | IO_BIT(PIN_PWR_SENSORS345) | IO_BIT(PIN_PWR_SENSORS12) | IO_BIT(PIN_PWR_5V);
	PORT[2].OUT = IO_BIT(PIN_EXT1_nCS);

	// MPU-6000の初期化
	MPU::Init();
	
	// XBeeの初期化
	// I/Oの初期化からXBeeの初期化まで最低でも200ns以上かけること
	XBee::Init();
	
	// モーターの初期化
	Motor::Init();

	// ↓ここでカルマンフィルタの初期化
	// Kalman::Init();
	
	// 定期割り込みを設定
	if (MPU::IsExisted() == true){
		ConfigINTC(true, INT_INTERVAL, INTC_SRC_EXT_POS);	// 外部ソース
	}else{
		ConfigINTC(true, INT_INTERVAL, INTC_SRC_INT);		// 内部ソース
	}
	
	// 割り込みを有効化
	sei();
	
	/*** メインループ ***/
	for(;;){
		while(g_IntPeriodicOccured == false){
			// XBeeの受信処理
			XBee::Receive(Controller::ReceiveFromXBee);
			
			// コントローラの処理
			Controller::Receive();
			
			// ↓ここでカルマンフィルタ更新1
			//if (Controller::IsVisionEnabled() == true){
			//	Kalman::Proc1();
			//}
		}
		g_IntPeriodicOccured = false;
		
		// 時刻を送信
		Logger::SendData4(Logger::ID_COPTIME, TICK);
		
		CYCLE1 = 0;	// サイクルカウンタをリセット
		
		// ↓ここでカルマンフィルタ更新2
		//Kalman::Proc2();
		
		// モーターの制御計算
		Motor::Proc();
		
		// 点滅
		static volatile int cnt = 0;
		cnt++;
		if (cnt < 100){
			SetOut(PIN_LED5, OUT_HIGH);
		}else if (cnt < 200){
			SetOut(PIN_LED5, OUT_LOW);
		}else{
			cnt = 0;
		}
		
		// ボールセンサーの状態を表示
		if (GetIn(PIN_BALL_DETECT) == IN_HIGH){
			SetOut(PIN_LED7, OUT_HIGH);
		}else{
			SetOut(PIN_LED7, OUT_LOW);
		}
		
		// 操作が有効か表示
		if (Controller::IsControllerEnabled() == true){
			SetOut(PIN_LED4, OUT_HIGH);
		}else{
			SetOut(PIN_LED4, OUT_LOW);
		}
		
		Logger::SendData2(Logger::ID_CYCLE_1, CYCLE1);
	}
}





// 定期割り込みベクター
#pragma vector = PERIOD_VECTOR
__interrupt void IntPeriodic(void){
	/*
	 * ☠ 間違ってもここで本処理を行わないこと ☠
	 */
	
	// IMUの値を取得
	if (MPU::IsExisted() == true){
		short buf[7];
		MPU::GetSensorValues(MPU::MPUREG_ACCEL_XOUT_H, buf, 7);
		
		// 格納処理
		
		
		
	}
	
	// センサー取得処理は1msごとに行って、計算は2msごとに行わせても良いんじゃないかな
	// その場合、エンコーダなどの値はこのループで取得しておかなければならない
	g_IntPeriodicOccured = true;
}



