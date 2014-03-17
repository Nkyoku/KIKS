/*	@file
	@brief ロガーFIFOの制御
*/

#ifndef _LOGGER_H_
#define _LOGGER_H_

#include "../define.h"
#include "../math/fix.h"



namespace Logger{
	/* システムで使用済みのID */
	enum SYSID_e{
		ID_ERROR= 0,			// 意味は無い
		ID_DELTATIME = 1,		// ms単位の相対時間
		ID_COPTIME = 2,			// ms単位のコプロセッサの絶対時間
		
		_ID_USER_ = 16,			// 以降、ユーザーが使用可能なID
		_ID_BYTE_MAX_ = 32,		// IDの最大数(1バイト型)
		_ID_MAX_ = 1024			// IDの最大数(2,4バイト型)
	};
	
	/* AVR32側で100～499を使用 */
	/* OMSP側で使っていいIDは500～1023*/
	enum USERID_e{
		ID_CYCLE_1			= 500,	// サイクルカウンタ1

		ID_CONTROLLER_VEL	= 510,	// 指示された移動速度
		ID_CONTROLLER_DIR	= 511,	// 指示された移動方向
		ID_CONTROLLER_ROT	= 512,	// 指示された回転速度
		ID_CONTROLLER_DRIB	= 513,	// 指示されたドリブルの強さ
		ID_CONTROLLER_KICK	= 514,	// 指示されたキックの強さと種類
		
		ID_ACCELERATION_X	= 550,	// 加速度 X軸
		ID_ACCELERATION_Y	= 551,	// 加速度 Y軸
		ID_ACCELERATION_Z	= 552,	// 加速度 Z軸
		ID_ROTATION_X		= 553,	// 回転速度 X軸
		ID_ROTATION_Y		= 554,	// 回転速度 Y軸
		ID_ROTATION_Z		= 555,	// 回転速度 X軸
		
		ID_MOTOR1_TARGET_SPEED		= 600,	// モーター1 指令速度
		ID_MOTOR1_REAL_SPEED		= 601,	// モーター1 現在速度
		ID_MOTOR1_TARGET_CURRENT	= 602,	// モーター1 指令速度
		ID_MOTOR1_REAL_CURRENT		= 603,	// モーター1 現在速度
		
		ID_MOTOR2_REAL_SPEED 		= 604,	//　モーター2現在速度
		ID_MOTOR3_REAL_SPEED 		= 605,	//　モーター3現在速度
		ID_MOTOR4_REAL_SPEED 		= 606,	//　モーター4現在速度

		ID_MOTOR1_DUTY				= 607,	// モーター1のduty
		ID_MOTOR2_DUTY				= 608,	// モーター2のduty
		ID_MOTOR3_DUTY				= 609,	// モーター3のduty
		ID_MOTOR4_DUTY				= 610,	// モーター4のduty
		
		ID_VISION_X					= 620,	//visionのX
		ID_VISION_Y					= 621,	//visionのY
		ID_VISION_TH				= 622,	//visionの角度
		
		


		


		_TERMINATOR_
	};
	
	
	
	
	
	/* Logger FIFO関連 */
	
	// FIFOに1バイト送信
	// システム的に使えない
	static inline void SendData1(unsigned short addr, unsigned char data){
		LOGTXD1 = data;
		LOGTXID = addr;
	}
	
	// FIFOに2バイト送信
	static inline void SendData2(unsigned short addr, unsigned short data){
		LOGTXD2 = data;
		LOGTXID = addr;
	}
	
	// FIFOに4バイト送信
	static inline void SendData4(unsigned short addr, unsigned long data){
		LOGTXD4 = data;
		LOGTXID = addr;
	}
	
	// FIFOに4バイト送信
	static inline void SendData4(unsigned short addr, fix16 data){
		LOGTXD4 = data.m_Value;
		LOGTXID = addr;
	}
	
}



#endif
