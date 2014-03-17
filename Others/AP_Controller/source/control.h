// コントローラとしての動作

#ifndef CONTROL_H_
#define CONTROL_H_

#include "define.h"
#include "driver/task.h"




// 定数
#define F_CONTROL_TASK		30		// コントローラのタスクの頻度




// コントローラを初期化
void Control_Init(void);



// コントローラの初期化ルーチン
bool Control_TaskInit(const void *init_data);

// コントローラのメインルーチン
void Control_TaskMain(void);

// コントローラの終了ルーチン
void Control_TaskExit(void);



// ビット数を数える
inline int POPCNT(int bits);
inline int POPCNT(int bits){
	bits = (bits & 0x55555555) + (bits >> 1 & 0x55555555);
	bits = (bits & 0x33333333) + (bits >> 2 & 0x33333333);
	bits = (bits & 0x0f0f0f0f) + (bits >> 4 & 0x0f0f0f0f);
	bits = (bits & 0x00ff00ff) + (bits >> 8 & 0x00ff00ff);
	return (bits & 0x0000ffff) + (bits >>16 & 0x0000ffff);
}	

// 拡張ハミング符号を計算
unsigned char CalcHamming(unsigned int word);








#endif
