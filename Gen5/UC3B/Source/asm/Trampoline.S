/**	@file
	@brief ブートローダーのためのトランポリンセクション
*/

#include "Trampoline.h"

#ifndef _DFU_

	// This must be linked @ 0x80000000 if it is to be run upon reset.
	.section .reset, "ax", @progbits

	.global _trampoline
	.type _trampoline, @function
_trampoline:
	// Jump to program start.
	rjmp	program_start


	
	// プログラム署名
	.org SIGNATURE_OFFSET
	.global FirmwareSignature
	.type FirmwareSignature, @object
FirmwareSignature:
	.string SIGNATURE_STRING
	
	// コンパイル日付
	.org COMPILEDATE_OFFSET
	.global CompileDate
	.type CompileDate, @object
CompileDate:
	.string __DATE__
	
	// コンパイル時刻
	.org COMPILETIME_OFFSET
	.global CompileTime
	.type CompileTime, @object
CompileTime:
	.string __TIME__



	.org FILL_OFFSET
	.fill IDENTIFIER_SIZE - (FILL_OFFSET - SIGNATURE_OFFSET), 1, 0xFF




	// プログラム開始
	.org PROGRAM_START_OFFSET
program_start:
	// Jump to the C runtime startup routine.
	lda.w	pc, _stext

#endif
