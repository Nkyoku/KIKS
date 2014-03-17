// Manage interrupts

#include "int.h"



// From assember
extern void EVBA_Region(void);
extern const unsigned int IPR_Values[4];


// Intterupt handler table
volatile void *IntHandlerTable[36];

// Offsets of interrupt handlers
const unsigned int IntHandlerOffset[18 + 1] = {0, 1, 12, 16, 23, 24, 25, 26, 27, 27, 28, 28, 29, 30, 31, 34, 35, 35, 36};






// Initialize interrupt handler
void InitInt(void){
	__builtin_mtsr(AVR32_EVBA, (int)&EVBA_Region);

	for(unsigned int group = 0; group < AVR32_INTC_NUM_INT_GRPS; group++)
		INTC.ipr[group] = IPR_Values[0];
	for(unsigned int index = 0; index < 36; index++)
		IntHandlerTable[index] = NULL;

}

// Register interrupt handler
void RegisterInt(unsigned int irq, void *address, unsigned int level){
	unsigned int group;
	unsigned int index;

	group = irq / AVR32_INTC_MAX_NUM_IRQS_PER_GRP;
	if (AVR32_INTC_NUM_INT_GRPS <= group) return;

	index = IntHandlerOffset[group] + (irq % AVR32_INTC_MAX_NUM_IRQS_PER_GRP);
	if (IntHandlerOffset[group + 1] <= index) return;

	if (4 <= level) level = 3;
	IntHandlerTable[index] = address;
	INTC.ipr[group] = IPR_Values[level];
}

// Get interrupt handler (called from assembler)
void* GetIntHandler(unsigned int priority){
	unsigned int group = INTC.icr[AVR32_INTC_INT3 - priority];
	unsigned int index = 0;
	unsigned int irr = INTC.irr[group];
	if (irr != 0x1){
		unsigned int bits = (~irr) & (irr - 1);
		bits = (bits & 0x5555) + (bits >> 1 & 0x5555);
		bits = (bits & 0x3333) + (bits >> 2 & 0x3333);
		bits = (bits & 0x0f0f) + (bits >> 4 & 0x0f0f);
		bits = (bits & 0x00ff) + (bits >> 8 & 0x00ff);	// count bits
		index = bits;
	}
	index += IntHandlerOffset[group];
	return (void*)IntHandlerTable[index];
}
