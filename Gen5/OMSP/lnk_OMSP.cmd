/******************************************************************************/
/* lnk_msp430f2350.cmd - LINKER COMMAND FILE FOR LINKING MSP430F2350 PROGRAMS     */
/*                                                                            */
/*   Usage:  lnk430 <obj files...>    -o <out file> -m <map file> lnk.cmd     */
/*           cl430  <src files...> -z -o <out file> -m <map file> lnk.cmd     */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/* These linker options are for command line linking only.  For IDE linking,  */
/* you should set your linker options in Project Properties                   */
/* -c                                               LINK USING C CONVENTIONS  */
/* -stack  0x0200                                   SOFTWARE STACK SIZE       */
/* -heap   0x0100                                   HEAP AREA SIZE            */
/*                                                                            */
/*----------------------------------------------------------------------------*/


/****************************************************************************/
/* SPECIFY THE SYSTEM MEMORY MAP                                            */
/****************************************************************************/

MEMORY
{
	SFR                     : origin = 0x0000, length = 0x0010
	PERIPHERALS_8BIT        : origin = 0x0010, length = 0x00F0
	PERIPHERALS_16BIT       : origin = 0x0100, length = 0x3F00
	RAM                     : origin = 0x4000, length = 0x4000
	FLASH                   : origin = 0xC000, length = 0x3FE0
	INT00                   : origin = 0xFFE0, length = 0x0002
	INT01                   : origin = 0xFFE2, length = 0x0002
	INT02                   : origin = 0xFFE4, length = 0x0002
	INT03                   : origin = 0xFFE6, length = 0x0002
	INT04                   : origin = 0xFFE8, length = 0x0002
	INT05                   : origin = 0xFFEA, length = 0x0002
	INT06                   : origin = 0xFFEC, length = 0x0002
	INT07                   : origin = 0xFFEE, length = 0x0002
	INT08                   : origin = 0xFFF0, length = 0x0002
	INT09                   : origin = 0xFFF2, length = 0x0002
	INT10                   : origin = 0xFFF4, length = 0x0002
	INT11                   : origin = 0xFFF6, length = 0x0002
	INT12                   : origin = 0xFFF8, length = 0x0002
	INT13                   : origin = 0xFFFA, length = 0x0002
	INT14                   : origin = 0xFFFC, length = 0x0002
	RESET                   : origin = 0xFFFE, length = 0x0002
}

/****************************************************************************/
/* SPECIFY THE SECTIONS ALLOCATION INTO MEMORY                              */
/****************************************************************************/

SECTIONS
{
	.bss		: {} > RAM			/* GLOBAL & STATIC VARS */
	.data		: {} > RAM			/* GLOBAL & STATIC VARS */
	.sysmem		: {} > RAM			/* DYNAMIC MEMORY ALLOCATION AREA */
	.stack		: {} > RAM (HIGH)	/* SOFTWARE SYSTEM STACK */

	.text		: {} > FLASH		/* CODE */
	.cinit		: {} > FLASH		/* INITIALIZATION TABLES */
	.const		: {} > FLASH		/* CONSTANT DATA */
	.cio		: {} > RAM			/* C I/O BUFFER */

	.pinit		: {} > FLASH		/* C++ CONSTRUCTOR TABLES */
	.init_array	: {} > FLASH		/* C++ CONSTRUCTOR TABLES */
	.mspabi.exidx	: {} > FLASH	/* C++ CONSTRUCTOR TABLES */
	.mspabi.extab	: {} > FLASH	/* C++ CONSTRUCTOR TABLES */

	/* MSP430 INTERRUPT VECTORS          */
	.int00	: {*(.int00)}	> INT00 type = VECT_INIT
	.int01	: {}			> INT01
	.int02	: {}			> INT02
	.int03	: {}			> INT03
	.int04	: {}			> INT04
	.int05	: {}			> INT05
	.int06	: {}			> INT06
	.int07	: {}			> INT07
	.int08	: {}			> INT08
	.int09	: {}			> INT09
	.int10	: {}			> INT10
	.int11	: {}			> INT11
	.int12	: {}			> INT12
	.int13 	: {*(.int13)}	> INT13 type = VECT_INIT
	.int14	: {}			> INT14
	.reset	: {}			> RESET
}


