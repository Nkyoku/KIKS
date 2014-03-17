/**	@file
	@brief �[�d�Ǘ�
*/

#include "charge.h"
#include "define.h"
#include "driver/adc.h"
#include "driver/gpio.h"
#include "driver/flash.h"
#include "xprintf.h"

#include <util/delay.h>




/* �y���t�F������` */
#define CHARGE_TC			TCD1
#define KICK_TC				TCC1
#define SREC_TC				TCE0
#define SREC_EV_MUX_SET()	EVSYS.CH0MUX = EVSYS_CHMUX_TCE0_OVF_gc
#define SREC_EV_SEL			
#define SREC_DMA			DMA.CH1
#define SREC_DMA_TRIG		DMA_CH_TRIGSRC_EVSYS_CH0_gc


#define NS_TO_CYCLE(ns)	(unsigned short)((double)F_CPU * (ns) / 1.0e+9)




namespace Charge{
	
	
	/* �萔 */
	static const unsigned char SUPPLY_LIMIT		= 130;		// �[�d���J�n�ł���d���d����10�{[V]
	static const unsigned char SUPPLY_RETURN	= 140;		// �[�d���ĊJ�ł���d���d����10�{[V]
	static const unsigned char BOOST_START		= 20;		// �������J�n����d���d������̌�������10�{[V]
	static const unsigned char UPPER_LIMIT		= 200;		// (�W��)�[�d�I�~�d��[V]
	static const unsigned char LOWER_LIMIT		= 197;		// (�W��)�[�d�J�n�d��[V]
	static const unsigned char KICK_LIMIT		= 150;		// �L�b�N���d��[V]
	
	static const unsigned char CHARGE_PULSES		= 64;	// 1��̏[�d����ŉ���p���X���o����
	static const unsigned short MAX_BUCK_CYCLES		= 300;	// �~���[�d���s���ő�T�C�N����
	static const unsigned short MAX_BOOST_CYCLES	= 6000;	// �����[�d���s���ő�T�C�N����
	static const unsigned short T_BUCK_OFF	= 2000;			// �~�� �W���I�t����[ns]
	static const unsigned short T_BUCK_ON	= 5000;			// �~�� �ő�I������[ns]
	static const unsigned short T_BOOST_OFF	= 2000;			// ���� �W���I�t����[ns]
	static const unsigned short T_BOOST_ON	= 5000;			// ���� �ő�I������[ns]
	static const unsigned short T_BOOST_COOL= 4000;			// ���� �W���N�[�����O����[ns]
															// ����������l���w�肵�Ȃ�����
															// �����̒l�́A�w��l��艄�т�
	
	static const unsigned long T_KICK_MAX	= 10000000;		// �L�b�J�[�̍ő�I������[ns]
	static const unsigned long T_KICK_SW_ON	= 20000;		// �L�b�J�[�̍ŏ��I���p���X��[ns]
	static const unsigned long T_KICK_SW_OFF= 50000;		// �L�b�J�[�̍ŏ��I�t�p���X��[ns]
	static const unsigned char KICK_UPPER_LIMIT	= 100;		// �L�b�J�[�̓d������(�㏸)[A]
	static const unsigned char KICK_LOWER_LIMIT	= 97;		// �L�b�J�[�̓d������(���~)[A]
	
	static const unsigned short NUM_OF_RECORDS = 2048;		// �d���𑪒肷��T���v����
	static const unsigned long F_SREC = 100000;				// �\���m�C�h�d���̑�����g��[Hz]
	
	enum State_e{
		State_Idle,		// �w���҂�
		State_Buck,		// �~���[�d
		State_Boost,	// �����[�d
		State_Stop,		// �[�d��~
		State_Kick,		// �L�b�N��
		State_Error,	// �ُ�
	};
	
	
	/* �ϐ� */
	State_e m_State = State_Idle;	// �X�e�[�g�}�V��
	bool m_ChargeEnabled;	// �[�d���L��
	unsigned short m_ChargeCycles;
	unsigned char m_UpperLimit/* = UPPER_LIMIT*/;
	unsigned char m_LowerLimit/* = LOWER_LIMIT*/;
	unsigned char m_KickLimit = KICK_LIMIT;
	char m_KickType = KICK_NONE;
	unsigned char m_KickPower = 0;
	
	unsigned short m_RecordLength;		// �d���̑���T���v����
	char m_RecordData[NUM_OF_RECORDS];	// �d���̑���f�[�^
	
	
	
	// �[�d��~
	static void StopConvert(void);
	
	// �~���[�d
	static void BuckConvert(void);
	
	// �����[�d
	static void BoostConvert(void);
	
	// �L�b�N
	static void KickProc(void);
	
	
	
	
	// ������
	void Init(void){
		// �L�����u���[�V�����l��ǂݍ���
		m_UpperLimit = Flash::EEPROMReadByte(0x0000, UPPER_LIMIT);
		m_LowerLimit = Flash::EEPROMReadByte(0x0001, LOWER_LIMIT);
		
		// �[�d�^�C�}�[������
		//CHARGE_TC.CTRLB = TC_WGMODE_NORMAL_gc;
		CHARGE_TC.CTRLA	= TC_CLKSEL_DIV1_gc;
		
		// �L�b�N�^�C�}�[������
		KICK_TC.PER		= NS_TO_CYCLE((double)T_KICK_MAX / 8);
		
		// �\���m�C�h�d������p�^�C�}�[������
		SREC_TC.PER		= F_CPU / F_SREC - 1;
		SREC_TC.CTRLA	= TC_CLKSEL_DIV1_gc;
		SREC_EV_MUX_SET();
		
		// �\���m�C�h�d������pDMA������
		SREC_DMA.ADDRCTRL	= DMA_CH_SRCRELOAD_NONE_gc | DMA_CH_SRCDIR_FIXED_gc | DMA_CH_DESTRELOAD_NONE_gc | DMA_CH_DESTDIR_INC_gc;
		SREC_DMA.TRIGSRC	= SREC_DMA_TRIG;
		SREC_DMA.SRCADDR0	= (unsigned short)&ADCA.CH0RESL & 0xFF;
		SREC_DMA.SRCADDR1	= (unsigned short)&ADCA.CH0RESL >> 8;
		SREC_DMA.SRCADDR2	= 0;
		
		
		//m_ChargeEnabled = true;
		
		StopConvert();
	}
	
	// �[�d�����H
	bool IsCharging(void){
		return (m_State == State_Buck) || (m_State == State_Boost);
	}
	
	// �ُ킪�������Ă��邩�H
	bool IsErrorOccured(void){
		return (m_State == State_Error);
	}
	
	// �[�d��L���ɂ���
	void ChargeEnable(bool enable){
		m_ChargeEnabled = enable;
	}
	
	// �[�d�d����ݒ�
	void SetVoltage(unsigned char upper, unsigned char lower){
		m_UpperLimit = upper;
		if (upper < lower) lower = 0;
		m_LowerLimit = lower;
	}
	
	// �L�b�N����
	void KickEnable(char type, unsigned short power){
		m_KickType = type;
		if ((power >> 8) != 0){
			m_KickPower = 255;
		}else{
			m_KickPower = power;
		}
	}
	
	// ����
	void Proc(void){
		if (m_ChargeEnabled == false){
			if (m_State != State_Error){
				m_State = State_Idle;
			}
		}
		
		switch(m_State){
		case State_Idle:	// �w���҂��E�d���d���ቺ
			if (m_ChargeEnabled == true){
				if (SUPPLY_RETURN <= ADC::GetSupplyVoltage()){
					m_ChargeCycles = 0;					
					m_State = State_Buck;	// �[�d���J�n
					xputs("->Buck\n");
				}
			}
			break;
		
		case State_Buck:	// �~���[�d
			{
				unsigned short supply = ADC::GetSupplyVoltage();
				unsigned short cap = (unsigned short)ADC::GetCapacitorVoltage() * 10 + BOOST_START;
				if (supply <= SUPPLY_LIMIT){
					m_State = State_Idle;	// �d���d�����ቺ
					xputs("->Idle\n");
					break;
				}
				if (supply <= cap){
					m_ChargeCycles = 0;
					m_State = State_Boost;	// �����[�d��
					xputs("->Boost\n");
					break;
				}
				if (MAX_BUCK_CYCLES <= ++m_ChargeCycles){
					m_State = State_Error;	// �G���[
					xputs("->Error\n");
				}
				// �~���[�d
				BuckConvert();
			}
			break;
		
		case State_Boost:	// �����[�d
			{
				unsigned char supply = ADC::GetSupplyVoltage();
				if (supply <= SUPPLY_LIMIT){
					m_State = State_Idle;	// �d���d�����ቺ
					xputs("->Idle\n");
					break;
				}
				unsigned char cap = ADC::GetCapacitorVoltage();
				if (m_UpperLimit <= cap){
					m_State = State_Stop;	// �[�d���~
					xputs("->Stop\n");
					break;
				}
				if ((m_KickLimit <= cap) && (m_KickType != KICK_NONE)){
					m_State = State_Kick;	// �L�b�N���J�n
					xputs("->Kick\n");
					break;
				}
				if (MAX_BOOST_CYCLES <= ++m_ChargeCycles){
					m_State = State_Error;	// �G���[
					xputs("->Error\n");
				}
				// �����[�d
				BoostConvert();
			}
			break;
			
		case State_Stop:	// �[�d��~
			{
				unsigned char cap = ADC::GetCapacitorVoltage();
				if (cap <= m_LowerLimit){
					m_ChargeCycles = 0;
					m_State = State_Buck;	// �[�d���J�n
					xputs("->Buck\n");
					break;
				}
				if ((m_KickLimit <= cap) && (m_KickType != KICK_NONE)){
					m_State = State_Kick;	// �L�b�N���J�n
					xputs("->Kick\n");
					break;
				}
			}
			break;
		
		case State_Kick:	// �L�b�N��
			break;
		
		case State_Error:	// �ُ�
			break;
		}
		
		if (m_State == State_Kick){
			// �L�b�N
			KickProc();
			m_State = State_Idle;
			xputs("->Idle\n");
		}
		
		// �L�b�N�t���O�𖳌���
		m_KickType = KICK_NONE;
	}
	
	
	
	// �[�d��~
	static void StopConvert(void){
		SetOut(PIN_GATE_BOOST, OUT_LOW);
		SetOut(PIN_GATE_BUCK_H, OUT_LOW);
		SetOut(PIN_GATE_BUCK_L, OUT_LOW);
	}
	
	// �~���[�d
	static void BuckConvert(void){
		// 1�T�C�N���̍~���[�d
		SetOut(PIN_GATE_BOOST, OUT_LOW);
		SetOut(PIN_GATE_BUCK_H, OUT_LOW);
		SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
		for(unsigned char cnt = CHARGE_PULSES; 0 < cnt; cnt--){
			// OFF�o��
			_delay_us(0.001 * T_BUCK_OFF);
			
			CriticalSection{
				CHARGE_TC.PER = NS_TO_CYCLE(T_BUCK_ON);
				CHARGE_TC.CNT = 0;
				CHARGE_TC.INTFLAGS = TC0_OVFIF_bm;
				
				// ON�o��
				SetOut(PIN_GATE_BUCK_L, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_H, OUT_HIGH);
				while(~CHARGE_TC.INTFLAGS & TC0_OVFIF_bm){
					if (GetIn(PIN_CUR_TRIP) == IN_LOW){
						break;
					}
				}
				SetOut(PIN_GATE_BUCK_H, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
			}
		}
		
		SetOut(PIN_GATE_BUCK_L, OUT_LOW);
	}
	
	// �����[�d
	static void BoostConvert(void){
		// 1�T�C�N���̏����[�d
		SetOut(PIN_GATE_BOOST, OUT_LOW);
		SetOut(PIN_GATE_BUCK_H, OUT_LOW);
		SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
		for(unsigned char cnt = CHARGE_PULSES; 0 < cnt; cnt--){
			// OFF�o��
			_delay_us(0.001 * T_BOOST_OFF);
			
			CriticalSection{
				CHARGE_TC.PER = NS_TO_CYCLE(T_BOOST_ON);
				CHARGE_TC.CNT = 0;
				CHARGE_TC.INTFLAGS = TC0_OVFIF_bm;
				
				// ON�o��
				SetOut(PIN_GATE_BUCK_L, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_H, OUT_HIGH);
				SetOut(PIN_GATE_BOOST, OUT_HIGH);
				while(~CHARGE_TC.INTFLAGS & TC0_OVFIF_bm){
					if (GetIn(PIN_CUR_TRIP) == IN_LOW){
						break;
					}
				}
				
				// �N�[�����O
				SetOut(PIN_GATE_BOOST, OUT_LOW);
				_delay_us(0.001 * T_BOOST_COOL);
				
				SetOut(PIN_GATE_BUCK_H, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
			}
		}
		
		SetOut(PIN_GATE_BUCK_L, OUT_LOW);
	}
	
	// �L�b�N
	static void KickProc(void){
		// �萔
		//static const unsigned short MAX_KICK_COUNT	= NS_TO_CYCLE((double)T_KICK_MAX / 8);
		//static const unsigned short MIN_ON_COUNT	= NS_TO_CYCLE((double)T_KICK_SW_ON / 8);
		//static const unsigned short MIN_OFF_COUNT	= NS_TO_CYCLE((double)T_KICK_SW_OFF / 8);
		static const unsigned short LAST_ON_COUNT	= NS_TO_CYCLE((double)(T_KICK_MAX - T_KICK_SW_ON) / 8);
		static const unsigned char UPPER_VALUE		= (unsigned char)((double)KICK_UPPER_LIMIT / 1.30208);	// �d�����Z 1.30208[A/1]
		static const unsigned char LOWER_VALUE		= (unsigned char)((double)KICK_LOWER_LIMIT / 1.30208);
		
		cli();
		
		// ADC���\���m�C�h�d������p�ɕύX
		ADC::ConfSolenoid();
		ADC::WaitVoltage();
		
		// �ڕW�G�l���M�[�v�Z
		unsigned char present_energy, target_energy;
		present_energy = ADC::GetEnergy();
		if (m_KickPower < present_energy){
			target_energy = present_energy - m_KickPower;
		}else{
			target_energy = 1;	// 0�͂������ɓ��
		}
		
		// �L�b�N�^�C�}�[������
		//KICK_TC.CTRLA	= 0;
		KICK_TC.CNT		= 1;
		KICK_TC.INTFLAGS= TC1_OVFIF_bm;
		KICK_TC.CCA		= 0xFFFF;
		KICK_TC.CCB		= 0xFFFF;
		KICK_TC.CCABUF	= 0;
		KICK_TC.CCBBUF	= 0;
		if (m_KickType == KICK_STRAIGHT){
			KICK_TC.CTRLB = TC1_CCBEN_bm | TC_WGMODE_SINGLESLOPE_gc;
		}else{
			KICK_TC.CTRLB = TC1_CCAEN_bm | TC_WGMODE_SINGLESLOPE_gc;
		}
		
		// DMA�ݒ�
		SREC_DMA.DESTADDR0	= (unsigned short)m_RecordData & 0xFF;
		SREC_DMA.DESTADDR1	= (unsigned short)m_RecordData >> 8;
		SREC_DMA.DESTADDR2	= 0;
		SREC_DMA.TRFCNT		= NUM_OF_RECORDS;
		SREC_DMA.CTRLA		= DMA_CH_ENABLE_bm | DMA_CH_SINGLE_bm | DMA_CH_BURSTLEN_1BYTE_gc;
		
		// �L�b�N�J�n
		KICK_TC.CTRLC = TC1_CMPB_bm | TC1_CMPA_bm;
		KICK_TC.CTRLA = TC_CLKSEL_DIV8_gc;
		bool gate = true;
		char goal_count = 0;
		while(~KICK_TC.INTFLAGS & TC0_OVFIF_bm){
			// �d���擾
			char cur = ADC::GetCurrent8Bit();
			if (cur < 0) cur = 0;
			
			if (gate == true){
				if (UPPER_VALUE <= (unsigned char)cur){
					KICK_TC.CTRLA = 0;
					KICK_TC.CTRLC = 0;
					gate = false;
				}
			}else{
				if ((unsigned char)cur <= LOWER_VALUE){
					if (KICK_TC.CNT <= LAST_ON_COUNT){
						KICK_TC.CTRLC = TC1_CMPB_bm | TC1_CMPA_bm;
						KICK_TC.CTRLA = TC_CLKSEL_DIV8_gc;
						gate = true;
					}else{
						// �I���ɂ���ɂ͎��Ԃ�����Ȃ�
						break;
					}
				}
			}
			
			sei();
			
			if (gate == true){
				_delay_us(0.001 * T_KICK_SW_ON);
			}else{
				_delay_us(0.001 * T_KICK_SW_OFF);
			}
			
			cli();
			
			// �d���擾
			if (ADC::GetEnergy() <= target_energy){
				// �ڕW�l���B
				goal_count++;
				if (3 <= goal_count) break;
			}else{
				goal_count = 0;
			}
		}
		
		// �^�C�}�[�����Z�b�g
		KICK_TC.CTRLA	= 0;
		KICK_TC.CTRLB	= 0;
		KICK_TC.CTRLC	= 0;
		
		// DMA��~
		SREC_DMA.CTRLA	= 0;
		while(SREC_DMA.CTRLA & DMA_CH_ENABLE_bm);
		m_RecordLength = NUM_OF_RECORDS - SREC_DMA.TRFCNT;
		if (m_RecordLength == 0) m_RecordLength = NUM_OF_RECORDS;	// TRFCNT�͂��ׂẴf�[�^��]�����I���ƃ����[�h����Ă��܂�
		
		sei();
		
		char max = -128;
		long ave = 0;
		for(unsigned short cnt = 0; cnt < m_RecordLength; cnt++){
			char d = m_RecordData[cnt];
			if (max < d) max = d;
			ave += d;
		}
		ave /= m_RecordLength;
		
		xprintf("Energy=%d->%d(%d)\n", present_energy, ADC::GetEnergy(), target_energy);
		xprintf("Samples=%d\n", m_RecordLength);
		xprintf("Max=%d, Average=%d\n", max, ave);
		
		// ADC�����Z�b�g
		ADC::ConfReset();
	}
	
	
	
	
	
}

