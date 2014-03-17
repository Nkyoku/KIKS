// コントローラの操作状態

#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "HAL/Pipe.h"


// コントローラ
struct ControllerState_t{
	short Velocity;		// 移動速度
	short Direction;	// 移動方向
	short Rotation;		// 回転速度
	short Dribble;		// ドリブルの強さ
	short Kick;			// キックの強さ
	short Enabled;		// 操作が有効になっている
};



namespace Controller{
	
	
	// パイプ情報
	extern const BTT::PIPE_INFO_t Info;
	
	// 開く
	bool Open(void);
	
	// 閉じる
	void Close(void);
	
	// 書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written);
	
	
	
	// 操作状態を読み取る
	bool GetState(ControllerState_t &state);
	
	
}



#endif // CONTROLLER_H
