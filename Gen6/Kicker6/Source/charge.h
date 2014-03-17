/**	@file
	@brief �[�d�Ǘ�
*/

#ifndef CHARGE_H_
#define CHARGE_H_







namespace Charge{
	
	
	enum KICK_e{
		KICK_NONE = 0,
		KICK_STRAIGHT,
		KICK_CHIP,
	};
	
	
	
	// ������
	void Init(void);
	
	// �[�d�����H
	bool IsCharging(void);
	
	// �ُ킪�������Ă��邩�H
	bool IsErrorOccured(void);
	
	// �[�d��L���ɂ���
	void ChargeEnable(bool enable);
	
	// �[�d�d����ݒ�
	void SetVoltage(unsigned char upper, unsigned char lower);
	
	// �L�b�N����
	void KickEnable(char type, unsigned short power);
	
	// ����
	void Proc(void);
	
	
	
	
	
	
	
}


#endif
