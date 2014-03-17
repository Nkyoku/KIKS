/**	@file
	@brief 充電管理
*/

#ifndef CHARGE_H_
#define CHARGE_H_







namespace Charge{
	
	
	enum KICK_e{
		KICK_NONE = 0,
		KICK_STRAIGHT,
		KICK_CHIP,
	};
	
	
	
	// 初期化
	void Init(void);
	
	// 充電中か？
	bool IsCharging(void);
	
	// 異常が発生しているか？
	bool IsErrorOccured(void);
	
	// 充電を有効にする
	void ChargeEnable(bool enable);
	
	// 充電電圧を設定
	void SetVoltage(unsigned char upper, unsigned char lower);
	
	// キックする
	void KickEnable(char type, unsigned short power);
	
	// 処理
	void Proc(void);
	
	
	
	
	
	
	
}


#endif
