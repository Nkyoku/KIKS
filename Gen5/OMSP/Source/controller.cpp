/**
 * @file
 * @brief コントローラ
 */

#include "controller.h"
#include "define.h"
#include "smem.h"
#include "misc.h"
#include "driver/intc.h"
#include "driver/gpio.h"
#include "driver/logger.h"
#include "driver/delay.h"



#define FLAGS_DRIBBLE_POWER		0x3
#define FLAGS_KICK_TYPE			0x10
#define FLAGS_KICK_ENABLE		0x20
#define FLAGS_TURN_DIRECTION	0x80

// 動作指令(パケット形式)
struct InstructionPacket_t{
	unsigned char MachineID;	// マシンID
	unsigned char Velocity;		// 速度
	unsigned char Direction;	// 方向
	unsigned char Rotation;		// 回転速度
	unsigned char Flags;		// フラグ
	unsigned char KickPower;	// キックの強さ
	unsigned char Hamming[3];	// ハミング符号
	char Terminator[2];
}/* __attribute__((__packed__))*/;



namespace Controller{
	
	unsigned long g_LastReceivedTime;	// 最後に受信した時刻
	State_t m_State;					// 操作状態
	
	
	
	
	
	// キックの指示を送る
	static void SendKickEnable(short power);
	
	// 操作状態のログをとる
	static void SendControllerLog(void);
	
	// ポーリング
	void Receive(void){
		if (SMEM.TerminalEnabled != 0){
			// ターミナルからの操作
			SMEM.TerminalEnabled = 0;
			SMEM.ControlVia = CONTROL_VIA_TERMINAL;
			
			// ターミナルからのデータはほぼそのまま格納
			fix16 vel, dir, rot;
			short drib, kick;
			vel.m_Value = (long)SMEM.TerminalVelocity << 8;
			dir.m_Value = (long)SMEM.TerminalDirection << 8;
			rot.m_Value = (long)SMEM.TerminalRotation << 8;
			drib = minmax_limit<short>(SMEM.TerminalDribble, 0, 255);
			kick = minmax_limit<short>(SMEM.TerminalKick, -255, 255);
			SendKickEnable(kick);
			
			m_State.Enabled		= true;
			//m_State.VisionEnabled = false;
			m_State.Velocity	= vel; 
			m_State.Direction	= dir;
			m_State.Rotation	= rot;
			m_State.DribblePower= drib;
			m_State.KickPower	= kick;
			SendControllerLog();
		}else{
			// 前回の指令からの時間を調べる
			unsigned long tick = TICK;
			
			if (CONTROLLER_TIMEOUT <= (tick - g_LastReceivedTime)){
				// タイムアウト
				SMEM.ControlVia = CONTROL_VIA_NONE;
				m_State.Enabled = false;
			}
		}
	}
	
	// XBeeからの受信関数
	void ReceiveFromXBee(unsigned short length, const char *data){
		using namespace Logger;
		const InstructionPacket_t *packet = (const InstructionPacket_t*)data;
		
		if (SMEM.ControlVia == CONTROL_VIA_TERMINAL) return;
		if (length != sizeof(InstructionPacket_t)) return;
		if (packet->MachineID != (SMEM.MachineID + 1)) return;
		
		SMEM.ControlVia = CONTROL_VIA_WIRELESS;
		
		// 換算しつつ格納
		fix16 vel, dir, rot;
		short drib, kick;
		vel.m_Value = packet->Velocity;
		dir.m_Value = packet->Direction;
		rot.m_Value = (packet->Flags & FLAGS_TURN_DIRECTION) ? (short)(-(short)packet->Rotation) : (short)packet->Rotation;
		drib = (packet->Flags & FLAGS_DRIBBLE_POWER) << 6;
		if (packet->Flags & FLAGS_KICK_ENABLE){
			if (packet->Flags & FLAGS_KICK_TYPE){
				kick = packet->KickPower;
			}else{
				kick = -(short)packet->KickPower;
			}
		}else{
			kick = 0;
		}
		SendKickEnable(kick);
		
		vel *= to_fix(1310.72);
		dir *= to_fix(1024.00);
		rot *= to_fix(2607.59);
		
		m_State.Enabled		= true;
		m_State.Velocity	= vel;
		m_State.Direction	= dir;
		m_State.Rotation	= rot;
		m_State.DribblePower= drib;
		m_State.KickPower	= kick;
		// ←ここにVision関連のコードを入れる
		SendControllerLog();
	}
	
	// キックの指示を送る
	static void SendKickEnable(short power){
		if (GetIn(PIN_BALL_DETECT) == IN_LOW){
			power = 0;
		}
		SMEM.KickEnable = power;
		if (power != 0){
			SetOut(PIN_nINIT, OUT_HIGH);	// nINITピンをHにしてAVR32に通知
			delay_moment(3);
			SetOut(PIN_nINIT, OUT_LOW);		// nINITピンをLに戻す
		}
	}
	
	// 操作状態のログをとる
	static void SendControllerLog(void){
		// この関数ではついでに受信時刻の更新も行われる
		using namespace Logger;
		unsigned long tick = TICK;
		g_LastReceivedTime = tick;
		SendData4(ID_COPTIME, tick);
		SendData4(ID_CONTROLLER_VEL, m_State.Velocity);
		SendData4(ID_CONTROLLER_DIR, m_State.Direction);
		SendData4(ID_CONTROLLER_ROT, m_State.Rotation);
		SendData4(ID_CONTROLLER_DRIB, m_State.DribblePower);
		SendData4(ID_CONTROLLER_KICK, m_State.KickPower);
		// ←ここにVision関連のコードを入れる
	}
	
	
	
	
	
	
	
	
	
}





