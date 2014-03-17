/**	@file
	@brief �[�d�Ǘ�
*/

#ifndef CHARGE_H_
#define CHARGE_H_







namespace Charge{
	
	// �L�b�N�̎��
	enum KICK_e{
		KICK_NONE = 0,
		KICK_STRAIGHT,
		KICK_CHIP,
	};
	
	// �X�e�[�g
	enum State_e{
		State_Idle = 0,	// �w���҂�
		State_Buck,		// �~���[�d
		State_Boost,	// �����[�d
		State_Stop,		// �[�d��~
		State_Kick,		// �L�b�N��
		State_Error,	// �ُ�
	};
	
	// �e�X�e�[�g�̊֐����i�[���郊�X�g�̍���
	struct StateList_t{
		void (*Enter)(unsigned char vol_sup, unsigned char vol_cap);
		State_e (*Execute)(unsigned char vol_sup, unsigned char vol_cap);
		void (*Leave)(void);
	};
	
	
	
	// �[�d�����H
	bool IsCharging(void);
	
	// �ُ킪�������Ă��邩�H
	bool IsErrorOccured(void);
	
	// �[�d��L���ɂ���
	void ChargeEnable(bool enable);
	
	// �[�d�d����ݒ�
	void SetVoltage(unsigned char upper, unsigned char lower);
	
	// �L�b�N����
	void KickEnable(KICK_e type, unsigned short power);
	
	// ������
	void Init(void);
	
	// ����
	void Proc(void);
	
	
	
	
	/* �e�X�e�[�g�̊֐� */
	namespace StateIdle{	// �w���҂�
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	namespace StateBuck{	// �~���[�d
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
		void Leave(void);
	}
	namespace StateBoost{	// �����[�d
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
		void Leave(void);
	}
	namespace StateStop{	// �[�d��~
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	namespace StateKick{	// �L�b�N��
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	namespace StateError{	// �ُ�
		void Enter(unsigned char vol_sup, unsigned char vol_cap);
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap);
	}
	
	
	
}


#endif
