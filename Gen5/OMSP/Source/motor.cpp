/*	@file
	@brief BLDCモーター制御
*/

#include "define.h"
#include "misc.h"
#include "motor.h"
#include "smem.h"
#include "controller.h"
#include "driver/logger.h"
#include "driver/delay.h"
#include "math/fix.h"

#include <math.h>
#include <string.h>





#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif
#define cosd(deg) cos((deg) / 180.0 * M_PI)
#define sind(deg) sin((deg) / 180.0 * M_PI)
#define atan2d(y, x) (atan2(y, x) / M_PI * 180.0)
#define length(x, y) sqrt((x)*(x)+(y)*(y))



namespace Motor{
	
	/* パラメータ */
	static const double P_INTERVAL				// 制御周期[s]
							= 0.002;
	static const double P_ENCODER_PPR_LO		// エンコーダの1回転あたりのパルス数[ppr] (低分解能, 高分解能)
							= 1440;
	static const double P_ENCODER_PPR_HI
							= -4096;
	static const double P_GEAR_RATIO			// ギア比(モーター側÷ホイール側)
							= 1.0 / 4.0;
	static const double P_WHEEL_CIRCUMFERENCE	// ホイールの外周[m]
							= M_PI * 0.05;
	static const double P_REGISTANCE			// モーター+モータードライバの抵抗[Ω]
							= 1.20 + 0.08 * 2;
	static const double P_SPEED_CONSTANT		// モーターの速度定数[rps/V]
							= 6.23333;
	static const double P_TORQUE_CONSTANT		// モーターのトルク定数[Nm/A] 
							= 0.0255;
	
	static const double K_P				// Kp:比例ゲイン
							= 0.6819396;
	static const double K_I				// Ki:積分ゲイン
							= 0.0242791;
	static const double K_D				// Kd:微分ゲイン
							= 0.0;
	static const double K_E				// Ke:逆起電力ゲイン
							= 1.0 / P_SPEED_CONSTANT;
	static const double K_C				// Kc:電流制限ゲイン
							= 0.0;
	
	
	
	
	/* 定数 */
	static const double MAX_DUTY			= 4095;
	//static const double MIN_DUTY			= 20;
	static const double MAX_DUTY_LIMIT		= 4000;
	//static const double MAX_INTEGRATION	= 5000;
	static const short DRIBBLE_RAMP_LIMIT	= 200;	// ドリブルモーターのPWMランプレート制限
	static const short DRIBBLE_TABLE[4] = {			// ドリブルパワーとデューティ比の変換テーブル
		0, -900, -1300, -2000
	};
	
	static const double PULSE_TO_RPS_LO				// パルス数→回転数[rps]の換算係数 (低分解能, 高分解能)
							= 1.0 / (P_ENCODER_PPR_LO * P_INTERVAL);
	static const double PULSE_TO_RPS_HI
							= 1.0 / (P_ENCODER_PPR_HI * P_INTERVAL);
	
	
	
	/* ゲイン・係数 */
	long DECOMPOSITION[12] = {		// ベクトル分解行列
											// 付属のシートで計算する	
		TO_FIX_L(-18.0063263231), TO_FIX_L( 18.0063263231), TO_FIX_L(12.5962304944),
		TO_FIX_L( 18.0063263231), TO_FIX_L( 18.0063263231), TO_FIX_L(12.5962304944),
		TO_FIX_L( 18.0063263231), TO_FIX_L(-18.0063263231), TO_FIX_L(12.5962304944),
		TO_FIX_L(-18.0063263231), TO_FIX_L(-18.0063263231), TO_FIX_L(12.5962304944)
	};
	
	long GAINS[5] = {				// ゲイン
		TO_FIX_L(K_P),
		TO_FIX_L(K_I),
		0,//TO_FIX_L(K_D),
		TO_FIX_L(K_E),
		0,//TO_FIX_L(K_C)
	};
	
	fix16 PULSE_TO_RPS;				// パルス数→回転数の換算係数
	fix16 VOLT_TO_DUTY;				// 電圧→デューティ値の換算係数
	
	
	
	
	
	
	// ホイールモーターの制御情報
	struct MOTORSTATE_t{
		short DutySetting;			// 操作量(PWMデューティ設定値)
		fix16 RealSpeed;			// 制御量(回転数n[rps])
		fix16 TargetSpeed;			// 目標値(回転数n[rps])
		
		fix16 Error;				// エラー
		fix16 Integration;			// 積分値
		
		
		
		/*short NextSetting;			// 次のデューティ設定値
		short LastSetting;			// 前回のデューティ設定値
		short LastRotation;			// 前回の回転速度
		short LastError;			// 前回のエラー
		short Integration;			// 積分値*/
	};
	MOTORSTATE_t m_LastMotorState[4];
	MOTORSTATE_t m_NextMotorState[4];
	
	// ドリブルモーターの制御情報
	short m_DribbleDutySetting;		// PWMデューティ設定値
	
	
	
	
	
	
	
	// ベクトル分解
	static void VectorDecomposition(void);
	
	// 車輪のモーターの制御
	static void WheelMotorProc(MOTORSTATE_t &last, MOTORSTATE_t &next);
	
	// ドリブルモーターの制御
	static void DribbleMotorProc(void);
	
	// 初期化
	void Init(void){
		if (SMEM.HiResEncoder == 0){
			// 低分解能エンコーダを使用
			PULSE_TO_RPS = to_fix(PULSE_TO_RPS_LO);
		}else{
			// 高分解能エンコーダを使用
			PULSE_TO_RPS = to_fix(PULSE_TO_RPS_HI);
		}
		
		
		
		
		
		
		
	}
	
	// メインループ内での処理
	void Proc(void){
		if (Controller::IsControllerEnabled() == true){
			// モーター制御をする
			using namespace Logger;
			
			// 必要な情報を格納
			VOLT_TO_DUTY = to_fix(MAX_DUTY * 6.25) / to_fix(SMEM.BatteryVoltage >> 4);
			m_NextMotorState[0].RealSpeed = PULSE_TO_RPS * to_fix(QMOTOR.ROT[0]);
			m_NextMotorState[1].RealSpeed = PULSE_TO_RPS * to_fix(QMOTOR.ROT[1]);
			m_NextMotorState[2].RealSpeed = PULSE_TO_RPS * to_fix(QMOTOR.ROT[2]);
			m_NextMotorState[3].RealSpeed = PULSE_TO_RPS * to_fix(QMOTOR.ROT[3]);
			
			// ベクトル分解
			VectorDecomposition();
			

			// 制御計算
			WheelMotorProc(m_LastMotorState[0], m_NextMotorState[0]);
			WheelMotorProc(m_LastMotorState[1], m_NextMotorState[1]);
			WheelMotorProc(m_LastMotorState[2], m_NextMotorState[2]);
			WheelMotorProc(m_LastMotorState[3], m_NextMotorState[3]);
			DribbleMotorProc();

			SendData4(ID_MOTOR1_TARGET_SPEED, m_NextMotorState[0].TargetSpeed);
			SendData4(ID_MOTOR1_REAL_SPEED, m_NextMotorState[0].RealSpeed);
			SendData4(ID_MOTOR1_ERROR, m_NextMotorState[0].Error);
			SendData4(ID_MOTOR1_INTEGRATION, m_NextMotorState[0].Integration);

			SendData2(ID_MOTOR1_DUTY, m_NextMotorState[0].DutySetting);
			SendData2(ID_MOTOR2_DUTY, m_NextMotorState[1].DutySetting);
			SendData2(ID_MOTOR3_DUTY, m_NextMotorState[2].DutySetting);
			SendData2(ID_MOTOR4_DUTY, m_NextMotorState[3].DutySetting);
			// モータードライバに出力
			QMOTOR.DUTY[0] = m_NextMotorState[0].DutySetting;
			QMOTOR.DUTY[1] = m_NextMotorState[1].DutySetting;
			QMOTOR.DUTY[2] = m_NextMotorState[2].DutySetting;
			QMOTOR.DUTY[3] = m_NextMotorState[3].DutySetting;
			QMOTOR.CR = 0x2;
			DRMOT.DUTY = m_DribbleDutySetting;
			DRMOT.CR = 0x2;
			
			// 制御情報を更新
			memcpy(m_LastMotorState, m_NextMotorState, sizeof(m_LastMotorState));
		}else{
			// モーター停止
			
			// 制御情報を初期化
			memset(m_LastMotorState, 0x00, sizeof(m_LastMotorState));
			memset(m_NextMotorState, 0x00, sizeof(m_NextMotorState));
			m_DribbleDutySetting = 0;
			
			// モータードライバを停止
			QMOTOR.CR = 0;
			DRMOT.CR = 0;
		}
	}
	
	
	
	
	
	
	
	
	
	
	// ベクトル分解
	static void VectorDecomposition(void){
		matrix<3, 4> *decomp_matrix = (matrix<3, 4>*)DECOMPOSITION;
		matrix<1, 3> in_vector;
		matrix<1, 4> out_vector;
		
		in_vector.m(0, 0) = Controller::m_State.Velocity * cos(Controller::m_State.Direction);
		in_vector.m(0, 1) = Controller::m_State.Velocity * sin(Controller::m_State.Direction);
		in_vector.m(0, 2) = Controller::m_State.Rotation;
		
		Matrix::Multiply(out_vector, *decomp_matrix, in_vector);
		Matrix::WaitForOperation();
		
		m_NextMotorState[0].TargetSpeed = out_vector.m(0, 0);
		m_NextMotorState[1].TargetSpeed = out_vector.m(0, 1);
		m_NextMotorState[2].TargetSpeed = out_vector.m(0, 2);
		m_NextMotorState[3].TargetSpeed = out_vector.m(0, 3);
	}
	
	// 車輪のモーターの制御
	static void WheelMotorProc(MOTORSTATE_t &last, MOTORSTATE_t &next){
		matrix<4, 1> *gain_matrix = (matrix<4, 1>*)GAINS;
		matrix<1, 4> in_vector;
		fix16 output;
		fix16 error, integ;
		short duty;
		
		// エラーを計算・積分
		error = next.TargetSpeed - next.RealSpeed;
		integ = last.Integration + error;
		
		integ = minmax_limit<fix16>(integ, to_fix(-200.0), to_fix(200.0));
		

		
		
		
		// PIDを計算
		in_vector.m(0, 0) = error;
		in_vector.m(0, 1) = integ;
		in_vector.m(0, 2) = error - last.Error;
		in_vector.m(0, 3) = next.RealSpeed;
		Matrix::Multiply((matrix<1, 1>&)output, *gain_matrix, in_vector);
		Matrix::WaitForOperation();
		
		
		
		
		
		
		
		// 出力を換算
		output *= VOLT_TO_DUTY;
		duty = output;
		duty = minmax_limit<short>(duty, -MAX_DUTY_LIMIT, MAX_DUTY_LIMIT);
		duty = delta_limit<short>(last.DutySetting, duty, -300, 300);
		
		// 結果を格納
		next.Integration = integ;
		next.Error = error;
		next.DutySetting = duty;
	}
	
	// ドリブルモーターの制御
	static void DribbleMotorProc(void){
		short power = Controller::m_State.DribblePower >> 6;
		short last = m_DribbleDutySetting;
		short next = DRIBBLE_TABLE[power];
		next = delta_limit<short>(last, next, -DRIBBLE_RAMP_LIMIT, DRIBBLE_RAMP_LIMIT);
		m_DribbleDutySetting = next;
	}
	


	
	
	


	
	
	
}


