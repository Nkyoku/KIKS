/**	@file
	@brief ADC�̐���
*/

#include "../define.h"
#include "adc.h"
#include "flash.h"

#include <stddef.h>
#include <avr/pgmspace.h>
#include <avr/interrupt.h>



#define ADC_CH_MUXNEG_PADGND_gc	(0b101 << 0)



// 16�r�b�g�l��8�r�b�g�ɃN���b�v
static inline unsigned char Clip8Bit(signed short word){
	unsigned char high = word >> 8;
	if (high != 0){
		if (high & 0x80){
			return 0;
		}else{
			return 255;
		}
	}else{
		return word;
	}
}

// 16x16=>32bit�̊|���Z
signed long Mul16x16to32(signed short in1, unsigned short in2){
	signed long result;
	__asm__ __volatile__(
		"clr r16"			"\n\t"
		"mul %A1, %A2"		"\n\t"
		"movw %A0, r0"		"\n\t"
		"muls %B1, %B2"		"\n\t"
		"movw %C0, r0"		"\n\t"
		"mulsu %B2, %A1"	"\n\t"
		"sbrc r1, 7"		"\n\t"
		"ser r16"			"\n\t"
		"add %B0, r0"		"\n\t"
		"adc %C0, r1"		"\n\t"
		"adc %D0, r16"		"\n\t"
		"clr r16"			"\n\t"
		"mulsu %B1, %A2"	"\n\t"
		"sbrc r1, 7"		"\n\t"
		"ser r16"			"\n\t"
		"add %B0, r0"		"\n\t"
		"adc %C0, r1"		"\n\t"
		"adc %D0, r16"		"\n\t"
		"clr r1"			"\n\t"
		: "=&r"(result)
		: "a"(in1), "a"(in2)
		: "r16"
		);
	return result;
}



/*
	Vref = 2.500[V]
	
	CH0 -> PIN5:ChargeCurrent / PIN11:SolenoidCurrent
	CH1 -> PIN1:CapacitorVoltage
	CH2 -> ----
	CH3 -> PIN6:SupplyVoltage
*/



namespace ADC{
	
	// �L�����u���[�V�����̕W���l
	static const unsigned short COEFFICIENT_ENERGY		= 1401;		// (0.16681<<4)^2 * 0.003
	static const unsigned short COEFFICIENT_CAPACITOR	= 10932;	// 0.16681
	static const unsigned short COEFFICIENT_SUPPLY		= 8800;		// 0.13428
	
	// �L�����u���[�V�����l
	unsigned short m_CoefficientEnergy;
	unsigned short m_CoefficientCapacitor;
	unsigned short m_CoefficientSupply;
	
	short m_Channel1Filter;	// �t�B���^�[�l
	short m_Channel3Filter;
	unsigned char m_SupplyVoltage;		// �d���d��
	unsigned char m_CapacitorVoltage;	// �L���p�V�^�d��
	
	unsigned char m_EnergyTable[127];	// �d���l�ƃG�l���M�[�̊��Z�e�[�u��
	
	
	
	
	// ������
	void Init(void){
		// �L�����u���[�V�����l��ǂݍ���
		m_CoefficientEnergy		= Flash::EEPROMReadWord(0x0006, COEFFICIENT_ENERGY);
		m_CoefficientCapacitor	= Flash::EEPROMReadWord(0x0004, COEFFICIENT_CAPACITOR);
		m_CoefficientSupply		= Flash::EEPROMReadWord(0x0002, COEFFICIENT_SUPPLY);
		
		// ���Z�e�[�u�����쐬
		for(unsigned char val = 0; ++val <= 128; ){
			unsigned short val2;
			__asm__ __volatile__(
				"mul %1, %1"	"\n\t"
				"movw %A0, r0"	"\n\t"
				"clr r1"
				: "=&r"(val2) : "r"(val));
			union{
				signed short DWord[2];
				signed long QWord;
			} res;
			res.QWord = Mul16x16to32(val2, m_CoefficientEnergy);
			m_EnergyTable[val - 1] = Clip8Bit(res.DWord[1]);
		}
		
		// ADC�̃L�����u���[�V�����l��ǂݍ���
		unsigned char adca_calL, adca_calH;
		NVM.CMD = NVM_CMD_READ_CALIB_ROW_gc;
		adca_calL = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL0));
		adca_calH = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL1));
		ADCA.CAL = (adca_calH << 8) | adca_calL;
		NVM.CMD = NVM_CMD_NO_OPERATION_gc;
		
		// ADC���W�X�^��������
		ADCA.REFCTRL	= ADC_REFSEL_AREFA_gc;
		ADCA.PRESCALER	= ADC_PRESCALER_DIV16_gc;
		ADCA.CH0.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH1.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH3.CTRL	= ADC_CH_INPUTMODE_DIFF_gc;
		ADCA.CH1.MUXCTRL	= ADC_CH_MUXPOS_PIN1_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.CH3.MUXCTRL	= ADC_CH_MUXPOS_PIN6_gc | ADC_CH_MUXNEG_PADGND_gc;
		
		// ����̑��������
		ConfReset();
		Proc(true);
	}
	
	// ���펞�̑���
	void Proc(bool init){
		// ����J�n
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		ADCA.CTRLB		= ADC_CONMODE_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_12BIT_gc;
		ADCA.INTFLAGS	= ADC_CH3IF_bm;
		ADCA.CTRLA		= ADC_CH3START_bm | ADC_CH1START_bm | ADC_ENABLE_bm;
		while(~ADCA.INTFLAGS & ADC_CH3IF_bm);
		
		// ���ʂ�����
		union{
			signed short DWord[2];
			signed long QWord;
		} res;
		
		if (init == true){
			m_Channel1Filter = ADCA.CH1RES;
			m_Channel3Filter = ADCA.CH3RES;
		}else{
			m_Channel1Filter = m_Channel1Filter + ADCA.CH1RES + 1;
			m_Channel1Filter >>= 1;
			m_Channel3Filter = m_Channel3Filter * 7 + ADCA.CH3RES + 4;
			m_Channel3Filter >>= 3;
		}
		
		// CH2
		res.QWord = Mul16x16to32(m_Channel1Filter, m_CoefficientCapacitor);
		m_CapacitorVoltage = Clip8Bit(res.DWord[1]);
			
		// CH3
		res.QWord = Mul16x16to32(m_Channel3Filter, m_CoefficientSupply);
		m_SupplyVoltage = Clip8Bit(res.DWord[1]);
	}
	
	
	// �\�����Z�b�g
	void ConfReset(void){
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		//ADCA.CTRLB		= ADC_CONMODE_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_12BIT_gc;
		//ADCA.INTFLAGS	= ADC_CH3IF_bm | ADC_CH2IF_bm | ADC_CH1IF_bm | ADC_CH0IF_bm;
	}
	
	// �[�d�d�����������肷��\���֕ύX
	void ConfCharge(void){
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		ADCA.CH0.MUXCTRL= ADC_CH_MUXPOS_PIN5_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.INTFLAGS	= ADC_CH0IF_bm;
		ADCA.EVCTRL		= ADC_SWEEP_0_gc;
		ADCA.CTRLB		= ADC_CONMODE_bm | ADC_FREERUN_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_8BIT_gc;
		ADCA.CTRLA		= ADC_CH0START_bm | ADC_ENABLE_bm;
	}
	
	// �\���m�C�h�d�����������肷��\���֕ύX
	void ConfSolenoid(void){
		ADCA.CTRLA		= ADC_FLUSH_bm | ADC_ENABLE_bm;
		ADCA.CH0.MUXCTRL= ADC_CH_MUXPOS_PIN11_gc | ADC_CH_MUXNEG_PADGND_gc;
		ADCA.INTFLAGS	= ADC_CH1IF_bm | ADC_CH0IF_bm;
		ADCA.EVCTRL		= ADC_SWEEP_01_gc;
		ADCA.CTRLB		= ADC_CONMODE_bm | ADC_FREERUN_bm | ADC_CURRLIMIT_NO_gc | ADC_RESOLUTION_8BIT_gc;
		ADCA.CTRLA		= ADC_CH1START_bm | ADC_CH0START_bm | ADC_ENABLE_bm;
	}
	
	// (�d�����莞)�G�l���M�[���~�ʂ��擾
	// �P�ʂ̓W���[����2�{
	unsigned char GetEnergy(void){
		char vol = ADCA.CH1RESL;
		//char vol = ADCA.CH1RES >> 4;
		if (vol <= 0) return 0;
		return m_EnergyTable[(unsigned char)(vol - 1)];
	}
	
	
	
	
	
	
	
	
	
}




