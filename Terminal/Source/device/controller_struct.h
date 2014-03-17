// コントローラの操作状態

#ifndef CONTROLLER_H
#define CONTROLLER_H



// コントローラの操作状態を内部で扱う構造体
struct Controller_t{
	bool Enable;
	double VelX;
	double VelY;
	double VelR;
	int DribblePower;
	int KickPower;
	bool NormalKick;
	bool ChipKick;
};



// コントローラ
struct ControllerState_t{
	short Velocity;		// 移動速度
	short Direction;	// 移動方向
	short Rotation;		// 回転速度
	short Dribble;		// ドリブルの強さ
	short Kick;			// キックの強さ
	short Enabled;		// 操作が有効になっている
};



#endif // CONTROLLER_H
