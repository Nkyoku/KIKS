/**	@file
	@brief ADC�̐���
*/

#ifndef ADC_H_
#define ADC_H_

#include <avr/io.h>



namespace ADC{
	
	extern unsigned char m_SupplyVoltage;
	extern unsigned char m_CapacitorVoltage;
	
	/*extern unsigned short m_CoefficientEnergy;
	extern unsigned short m_CoefficientCapacitor;
	extern unsigned short m_CoefficientSupply;*/
	
	
	
	// ������
	void Init(void);
	
	// ���펞�̑���
	void Proc(bool init = false);
	
	// �\�����Z�b�g
	void ConfReset(void);
	
	// �[�d�d�����������肷��\���֕ύX
	void ConfCharge(void);
	
	// �\���m�C�h�d�����������肷��\���֕ύX
	void ConfSolenoid(void);
	
	
	
	// �d���d�����擾
	static inline unsigned char GetSupplyVoltage(void){
		return m_SupplyVoltage;
	}
	
	// �L���p�V�^�d�����擾
	static inline unsigned char GetCapacitorVoltage(void){
		return m_CapacitorVoltage;
	}
	
	
	
	// (�d�����莞)�d���l������ł���̂�҂�
	static inline void WaitCurrent(void){
		while(~ADCA.INTFLAGS & ADC_CH0IF_bm);
	}
	// (�d�����莞�d���l������ł���̂�҂�
	static inline void WaitVoltage(void){
		while(~ADCA.INTFLAGS & ADC_CH1IF_bm);
	}
	
	// (�d�����莞)�d���l���擾
	static inline short GetCurrent12Bit(void){
		return ADCA.CH0RES;
	}
	
	// (�d�����莞)�d���l���擾
	static inline char GetCurrent8Bit(void){
		return ADCA.CH0RESL;
	}
	
	// (�d�����莞)�G�l���M�[���~�ʂ��擾
	// �P�ʂ̓W���[����2�{
	unsigned char GetEnergy(void);
	
	
	
}

#endif
