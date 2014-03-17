// ���荞�݂̊Ǘ�

#ifndef INT_H_
#define INT_H_

#include "../define.h"




// ���荞�݃n���h��
#define IH	__attribute__((__interrupt__)) void

// ���荞�ݗD��x
#define IL_LOW		0
#define IL_NORMAL	1
#define IL_HIGH		2
#define IL_HIGHEST	3

// ���荞�ݗv��(IRQ)
#define NUM_OF_IRQS_PER_GRP	16
#define IRQ_PDCA0	(3*16)
#define IRQ_PDCA1	(3*16+1)
#define IRQ_PDCA2	(3*16+2)
#define IRQ_PDCA3	(3*16+3)
#define IRQ_PDCA4	(3*16+4)
#define IRQ_PDCA5	(3*16+5)
#define IRQ_PDCA6	(3*16+6)
#define IRQ_FLASHC	(4*16)
#define IRQ_USART0	(5*16)
#define IRQ_USART1	(6*16)
#define IRQ_USART2	(7*16)
#define IRQ_SPI		(9*16)
#define IRQ_TWI		(11*16)
#define IRQ_PWM		(12*16)
#define IRQ_TC0		(14*16)
#define IRQ_TC1		(14*16+1)
#define IRQ_TC2		(14*16+2)
#define IRQ_ADC		(15*16)
#define IRQ_USBB	(17*16)


// ���荞�݂�������
void Int_Init(void);

// ���荞�݃n���h����o�^
void Int_Register(unsigned int irq, void *address, unsigned int level);



// PDCA�̍ŏ��̊��荞�݃n���h��
IH PDCA_FirstHandler();

// �^�C�}�[�̍ŏ��̊��荞�݃n���h��
IH Timer_FirstHandler();





// �R���p�C���̍œK����h��
#define Barrier()	asm volatile("" ::: "memory")


// �O���[�o�����荞�݂�L���ɂ���
#define EnableGlobalInt()	\
	do{						\
		Barrier();			\
		__builtin_csrf(AVR32_SR_GM_OFFSET);	\
	}while(0)

// �O���[�o�����荞�݂𖳌��ɂ���
#define DisableGlobalInt()	\
	do{						\
		__builtin_ssrf(AVR32_SR_GM_OFFSET);	\
		Barrier();			\
	}while(0)
/*
// �e���x���̊��荞�݂�L���ɂ���
#define EnableLevelInt(level)	\
	do{							\
		Barrier();				\
		__builtin_csrf(AVR32_SR_I##level##M_OFFSET);    \
	}while(0)

// �e���x���̊��荞�݂𖳌��ɂ���
#define DisableLevelInt(level)	\
	do{							\
		__builtin_ssrf(AVR32_SR_I##level##M_OFFSET);    \
		Barrier();				\
	}while(0)
*/
// �e���x���̊��荞�݂�L���ɂ���
#define EnableLevelInt(level)	\
	do{							\
		Barrier();				\
		__builtin_csrf(AVR32_SR_I0M + (level));    \
	}while(0)

// �e���x���̊��荞�݂𖳌��ɂ���
#define DisableLevelInt(level)	\
	do{							\
		__builtin_ssrf(AVR32_SR_I0M + (level));    \
		Barrier();				\
	}while(0)









#endif