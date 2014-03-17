/**	@file
	@brief  ���ʂ̒�`�E�萔
*/

#ifndef DEFINE_H_
#define DEFINE_H_

#include <avr/io.h>
#include <avr/interrupt.h>


// �^
#undef NULL
#define NULL	0
/*
#undef false
#define false	0

#undef true
#define true	1

#undef bool
#define bool	char
*/

// 2�ׂ̂��悩���f����
#define ISPOWEROF2(x) (((x) & -(x)) == (x))


// �G���f�B�A���ϊ�
#define SWAP16(s) ((((s) << 8) & 0xFF00) | (((s) >> 8) & 0xFF))


// �p�b�L���O�E�A���C�����g
#define PACK	__attribute__((packed))
#define ALIGN1	__attribute__((aligned(1)))
#define ALIGN2	__attribute__((aligned(2)))
#define ALIGN4	__attribute__((aligned(4)))

// �֐��̏C��
#define NORETURN __attribute__((noreturn)) void


// NOP
#define NOP()	__asm__ __volatile__("nop" ::)


// CPU�N���b�N
#define F_CPU		32000000




/*// �N���e�B�J���Z�N�V����
extern volatile char _cs_counter;	// �N���e�B�J���Z�N�V�����̃J�E���^

// �N���e�B�J���Z�N�V�����ɓ���
static inline void EnterCritical(void){
	cli();
	_cs_counter++;
}

// �N���e�B�J���Z�N�V��������o��
static inline void LeaveCritical(void){
	_cs_counter--;
	if (_cs_counter <= 0){
		_cs_counter = 0;
		sei();
	}
}*/



// CCP�ŕی삳���IO���W�X�^�ɃA�N�Z�X
static inline void WriteProtectedIOREG(volatile register8_t *reg, unsigned char val){
	unsigned char ccp_ioreg = CCP_IOREG_gc;
	__asm__ __volatile__(
		"out %0, %1"	"\n\t"
		"st Z, %3"
		::"I"(_SFR_IO_ADDR(CCP)), "d"(ccp_ioreg), "z"(reg), "d"(val)
		);
}

// CCP�ŕی삳���SPM���������
static inline void WriteProtectedSPM(volatile register8_t *reg, unsigned char val){
	unsigned char ccp_spm = CCP_SPM_gc;
	__asm__ __volatile__(
		"out %0, %1"	"\n\t"
		"st Z, %3"
		::"I"(_SFR_IO_ADDR(CCP)), "d"(ccp_spm), "z"(reg), "d"(val)
		);
}



// ���荞�݋֎~�̈��ݒ肷��N���X
class clCS{
private:
	char m_sr;
	
public:
	bool m_first;
	
	// �R���X�g���N�^
	clCS() : m_first(true){
		m_sr = SREG;
		cli();
	}
	
	// �f�X�g���N�^
	~clCS(){
		asm volatile("":::"memory");
		SREG = m_sr;
	}
};

// �N���e�B�J���Z�N�V���������
#define CriticalSection	for(clCS _c; _c.m_first == true; _c.m_first = false)

// �N���e�B�J���Z�N�V�����ɓ���
#define EnterCritical() char _sr = SREG; cli()


#define LeaveCritical() asm volatile("":::"memory"); SREG = _sr









#endif
