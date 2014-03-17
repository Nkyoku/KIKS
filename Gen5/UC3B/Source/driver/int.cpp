/**	@file
	@brief 割り込みの管理
*/

#include "int.h"



// int_evba.S内で定義されている
extern "C" void EVBA_Region(void);
extern "C" const unsigned int IPR_Values[4];



// 割り込みハンドラのテーブル
void *IntHandlerTable[18] = {NULL};

// PDCAの割り込みハンドラのテーブル
void *IntHandlerTablePDCA[7] = {NULL};

// タイマーの割り込みハンドラのテーブル
void *IntHandlerTableTimer[3] = {NULL};

		

namespace Int{
	
	// 割り込みを初期化
	void Init(void){
		__builtin_mtsr(AVR32_EVBA, (int)&EVBA_Region);
	
		for(unsigned int group = 0; group < AVR32_INTC_NUM_INT_GRPS; group++)
			INTC.ipr[group] = IPR_Values[0];
		
		IntHandlerTable[IRQ_PDCA0 / NUM_OF_IRQS_PER_GRP] = (void*)PDCA_FirstHandler;
		IntHandlerTable[IRQ_TC0 / NUM_OF_IRQS_PER_GRP] = (void*)Timer_FirstHandler;
	}
	
	// 割り込みハンドラを登録
	void Register(unsigned int irq, void *address, unsigned int level){
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
	
	
	
	// PDCAの最初の割り込みハンドラ
	IH PDCA_FirstHandler(){
		unsigned int irr = INTC.irr[IRQ_PDCA0 / NUM_OF_IRQS_PER_GRP];
		void **proc = IntHandlerTablePDCA;
		do{
			if (irr & 0x1){
				__asm__ __volatile__(
					"cp.w %0, 0		\n"
					"movne pc, %0	\n"
					: : "r"(*proc));
				break;
			}
			irr >>= 1;
			proc++;
		}while(irr != 0);
	}
	
	// タイマーの最初の割り込みハンドラ
	IH Timer_FirstHandler(){
		unsigned int irr = INTC.irr[IRQ_TC0 / NUM_OF_IRQS_PER_GRP];
		void **proc = IntHandlerTableTimer;
		do{
			if (irr & 0x1){
				__asm__ __volatile__(
					"cp.w %0, 0		\n"
					"movne pc, %0	\n"
					: : "r"(*proc));
				break;
			}
			irr >>= 1;
			proc++;
		}while(irr != 0);
	}
	
}

