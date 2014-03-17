/*	@file
	@brief 共有メモリー
*/

#ifndef _SMEM_H_
#define _SMEM_H_



// 共有メモリー 128バイトまで
// アクセスは2バイト以上の単位でのみ
// 読み書きはAVR32とOMSPの両方から同時に可能
struct SMEM_t{
	// 方向表示
	// in:AVR32からOMSP, out:OMSPからAVR32, bi:両方向
	
	short ControlVia;			// out	操作先を表す
	short MachineID;			// in	マシンID
	short HiResEncoder;			// in	高分解能のエンコーダを使用しているか？
	short BatteryVoltage;		// in	バッテリー電圧x100[V]
	
	short KickEnable;			// bi	キックの指示
	
	short TerminalVelocity;		// in	ターミナルからの操作内容
	short TerminalDirection;	// in
	short TerminalRotation;		// in
	short TerminalDribble;		// in
	short TerminalKick;			// in
	short TerminalEnabled;		// bi	ターミナルからの操作が有効になっている
	
	
	
	
	
}
#ifdef __MSP430__
__attribute__((__packed__));
#else
__attribute__((packed));
#endif
#ifdef __MSP430__
extern volatile SMEM_t SMEM;
#endif




#define CONTROL_VIA_NONE		0
#define CONTROL_VIA_TERMINAL	1
#define CONTROL_VIA_WIRELESS	2













#endif
