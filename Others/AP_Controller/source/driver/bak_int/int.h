// Manage interrupts

#ifndef INT_H_
#define INT_H_

#include "define.h"

#define AVR32_INTC_MAX_NUM_IRQS_PER_GRP 32



// Initialize interrupt handler
void InitInt(void);

// Register interrupt handler
void RegisterInt(unsigned int irq, void *address, unsigned int level);

// Get interrupt handler (called from assembler)
void* GetIntHandler(unsigned int priority);




// Avoid compiler optimization
#define Barrier()	asm volatile("" ::: "memory")


// Enable global interrupt
#define EnableGlobalInt()	\
	do{						\
		Barrier();			\
		__builtin_csrf(AVR32_SR_GM_OFFSET);	\
	}while(0)

// Disable global interrupt
#define DisableGlobalInt()	\
	do{						\
		__builtin_ssrf(AVR32_SR_GM_OFFSET);	\
		Barrier();			\
	}while(0)

// Enable level interrupt
#define EnableLevelInt(level)	\
	do{							\
		Barrier();				\
		__builtin_csrf(AVR32_SR_I##level##M_OFFSET);    \
	}while(0)

// Disable level interrupt
#define DisableLevelInt(level)	\
	do{							\
		__builtin_ssrf(AVR32_SR_I##level##M_OFFSET);    \
		Barrier();				\
	}while(0)








#endif