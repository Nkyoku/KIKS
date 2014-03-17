/**	@file
	@brief ADC�̐���
*/

#ifndef ADC_H_
#define ADC_H_

#include <avr/io.h>



namespace ADC{
	
	extern unsigned char m_SupplyVoltage;
	extern unsigned char m_LineVoltage;
	extern unsigned char m_CapacitorVoltage;
	
	
	
	
	// ������
	void Init(void);
	
	// ���펞�̑���
	void Proc(bool init = false);
	
	
	// �����d�����擾
	static inline unsigned char GetSupplyVoltage(void){
		return m_SupplyVoltage;
	}
	
	// ���C���d�����擾
	static inline unsigned char GetLineVoltage(void){
		return m_LineVoltage;
	}
	
	// �L���p�V�^�d�����擾
	static inline unsigned char GetCapacitorVoltage(void){
		return m_CapacitorVoltage;
	}
	
	
	
}

#endif
