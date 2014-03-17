/**	@file
	@brief 充電管理
*/

#ifndef CHARGE_H_
#define CHARGE_H_







namespace Charge{
	
	// キックの種類
	enum KICK_e{
		KICK_NONE = 0,
		KICK_STRAIGHT,
		KICK_CHIP,
	};
	
	// ステート
	enum State_e{
		State_Idle = 0,	// 指示待ち
		State_Buck,		// 降圧充電
		State_Boost,	// 昇圧充電
		State_Stop,		// 充電停止
		State_Kick,		// キック中
		State_Error,	// 異常
	};
	
	// 各ステートの関数を格納するリストの項目
	struct StateList_t{
		void (*Enter)(unsigned char vol_sup, unsigned char vol_cap);
		State_e (*Execute)(unsigned char vol_sup, unsigned char vol_cap);
		void (*Leave)(void);
	};
	
	
	
	// 充電中か？
	bool IsCharging(void);
	
	// 異常が発生しているか？
	bool IsErrorOccured(void);
	
	// 充電を有効にする
	void ChargeEnable(bool enable);
	
	// 充電電圧を設定
	void SetVoltage(unsigned char upper, unsigned char lower);
	
	// キックする
	void KickEnable(KICK_e type, unsigned short power);
	
	// 初期化
	void Init(void);
	
	// 処理
	void Proc(void);
	
	
	
	
	/* 各ステートの関数 */
	namespace StateIdle{	// 指示待ち
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	namespace StateBuck{	// 降圧充電
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
		void Leave(void);
	}
	namespace StateBoost{	// 昇圧充電
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
		void Leave(void);
	}
	namespace StateStop{	// 充電停止
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	namespace StateKick{	// キック中
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	namespace StateError{	// 異常
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	
	
	
}


#endif
