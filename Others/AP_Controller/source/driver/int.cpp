// ���荞�݂̊Ǘ�

#include "int.h"



// int_evba.x���Œ�`����Ă���
extern "C" void EVBA_Region(void);
extern "C" const unsigned int IPR_Values[4];



// ���荞�݃n���h���̃e�[�u��
void *IntHandlerTable[18] = {NULL};

// PDCA�̊��荞�݃n���h���̃e�[�u��
void *IntHandlerTablePDCA[7] = {NULL};

// �^�C�}�[�̊��荞�݃n���h���̃e�[�u��
void *IntHandlerTableTimer[3] = {NULL};



// ���荞�݂�������
void Int_Init(void){
	__builtin_mtsr(AVR32_EVBA, (int)&EVBA_Region);

	for(unsigned int group = 0; group < AVR32_INTC_NUM_INT_GRPS; group++)
		INTC.ipr[group] = IPR_Values[0];
	
	IntHandlerTable[IRQ_PDCA0 / NUM_OF_IRQS_PER_GRP] = (void*)PDCA_FirstHandler;
	IntHandlerTable[IRQ_TC0 / NUM_OF_IRQS_PER_GRP] = (void*)Timer_FirstHandler;
}

// ���荞�݃n���h����o�^
void Int_Register(unsigned int irq, void *address, unsigned int level){
	unsigned int group	= irq / NUM_OF_IRQS_PER_GRP;
	unsigned int line	= irq % NUM_OF_IRQS_PER_GRP;
	
	if (18 < group) return;
	
	switch(group){
	case (IRQ_PDCA0 / NUM_OF_IRQS_PER_GRP):
		if (7 <= line) return;
		IntHandlerTablePDCA[line] = address;
		break;
		
	case (IRQ_TC0 / NUM_OF_IRQS_PER_GRP):
		if (3 <= line) return;
		IntHandlerTableTimer[line] = address;
		break;
		
	default:
		IntHandlerTable[group] = address;
		break;
	}
	
	if (IL_HIGHEST < level) level = IL_HIGHEST;
	INTC.ipr[group] = IPR_Values[level];
}



// PDCA�̍ŏ��̊��荞�݃n���h��
IH PDCA_FirstHandler(){
	unsigned int irr = INTC.irr[IRQ_PDCA0 / NUM_OF_IRQS_PER_GRP];
	void **proc = IntHandlerTablePDCA;
	do{
		if (irr & 0x1){
			asm volatile(
				"cp.w %0, 0		\n"
				"movne pc, %0	\n"
				: : "r"(*proc));
			break;
		}
		irr >>= 1;
		proc++;
	}while(irr != 0);
}

// �^�C�}�[�̍ŏ��̊��荞�݃n���h��
IH Timer_FirstHandler(){
	unsigned int irr = INTC.irr[IRQ_TC0 / NUM_OF_IRQS_PER_GRP];
	void **proc = IntHandlerTableTimer;
	do{
		if (irr & 0x1){
			asm volatile(
				"cp.w %0, 0		\n"
				"movne pc, %0	\n"
				: : "r"(*proc));
			break;
		}
		irr >>= 1;
		proc++;
	}while(irr != 0);
}



