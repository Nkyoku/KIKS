#include "Trampoline.h"

	// This must be linked @ 0x80000000 if it is to be run upon reset.
	.section .reset, "ax", @progbits

	.global _trampoline
	.type _trampoline, @function
_trampoline:
	// Jump to program start.
	rjmp	program_start

	.org	PROGRAM_START_OFFSET
program_start:
	// Jump to the C runtime startup routine.
	lda.w	pc, _stext
