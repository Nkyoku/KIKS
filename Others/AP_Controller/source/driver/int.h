// 割り込みの管理

#ifndef INT_H_
#define INT_H_

#include "../define.h"




// 割り込みハンドラ
#define IH	__attribute__((__interrupt__)) void

// 割り込み優先度
#define IL_LOW		0
#define IL_NORMAL	1
#define IL_HIGH		2
#define IL_HIGHEST	3

// 割り込み要求(IRQ)
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


// 割り込みを初期化
void Int_Init(void);

// 割り込みハンドラを登録
void Int_Register(unsigned int irq, void *address, unsigned int level);



// PDCAの最初の割り込みハンドラ
IH PDCA_FirstHandler();

// タイマーの最初の割り込みハンドラ
IH Timer_FirstHandler();





// コンパイラの最適化を防ぐ
#define Barrier()	asm volatile("" ::: "memory")


// グローバル割り込みを有効にする
#define EnableGlobalInt()	\
	do{						\
		Barrier();			\
		__builtin_csrf(AVR32_SR_GM_OFFSET);	\
	}while(0)

// グローバル割り込みを無効にする
#define DisableGlobalInt()	\
	do{						\
		__builtin_ssrf(AVR32_SR_GM_OFFSET);	\
		Barrier();			\
	}while(0)
/*
// 各レベルの割り込みを有効にする
#define EnableLevelInt(level)	\
	do{							\
		Barrier();				\
		__builtin_csrf(AVR32_SR_I##level##M_OFFSET);    \
	}while(0)

// 各レベルの割り込みを無効にする
#define DisableLevelInt(level)	\
	do{							\
		__builtin_ssrf(AVR32_SR_I##level##M_OFFSET);    \
		Barrier();				\
	}while(0)
*/
// 各レベルの割り込みを有効にする
#define EnableLevelInt(level)	\
	do{							\
		Barrier();				\
		__builtin_csrf(AVR32_SR_I0M + (level));    \
	}while(0)

// 各レベルの割り込みを無効にする
#define DisableLevelInt(level)	\
	do{							\
		__builtin_ssrf(AVR32_SR_I0M + (level));    \
		Barrier();				\
	}while(0)









#endif