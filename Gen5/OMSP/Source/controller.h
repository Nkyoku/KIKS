/**	@file
	@brief コントローラ
*/

#ifndef _CONTROLLER_H_
#define _CONTROLLER_H_

#include "math/fix.h"



namespace Controller{
	
	// 操作状態
	struct State_t{
		fix16 Velocity;			// 移動速度指令 [m/s]
		fix16 Direction;		// 移動方向指令 [deg]の1/90倍
		fix16 Rotation;			// 回転速度指令 [回転/s]
		// fix16 VisionX;		// X座標情報 [m]
		// fix16 VisionY;		// Y座標情報 [m]
		// fix16 VisionD;		// 方向情報 [deg]の1/90倍 
		short KickPower;		// キックの強さ(-255～255)
		short DribblePower;		// ドリブルの強さ(0～255)
		bool Enabled;			// ロボットを動かす
		// bool VisionEnabled;	// 座標情報が有効
	}/* __attribute__((__packed__))*/;
	extern State_t m_State;
	
	
	
	// ポーリング
	void Receive(void);
	
	// XBeeからの受信関数
	void ReceiveFromXBee(unsigned short length, const char *data);
	
	// 操作されているか？
	static inline bool IsControllerEnabled(void){
		return m_State.Enabled != 0;
	}
	
	// 座標情報が有効か？
	/*static inline bool IsVisionEnabled(void){
		// この関数の呼出し後、フラグはクリアされる
		bool enabled = m_State.VisionEnabled;
		m_State.VisionEnabled = false;
		return enabled;
	}*/
}



#endif
