#ifndef _TRAMPOLINE_H_
#define _TRAMPOLINE_H_

#include <avr32/io.h>



#define SIGNATURE_STRING	"KIKS Gen.5 Rev.A"

/* 識別領域 */
#define SIGNATURE_OFFSET	0x10000						// プログラムの識別のための領域
#define COMPILEDATE_OFFSET	(SIGNATURE_OFFSET + 0x20)	// コンパイル日付(月 日 年)
#define COMPILETIME_OFFSET	(SIGNATURE_OFFSET + 0x30)	// コンパイル時刻(時:分:秒)
#define FILL_OFFSET			(SIGNATURE_OFFSET + 0x40)

#define IDENTIFIER_SIZE		0x200

// DFU領域のサイズの変更点はmcuflash.hにもある


/* APPの開始アドレス */
#define PROGRAM_START_OFFSET	(SIGNATURE_OFFSET + IDENTIFIER_SIZE)
#define PROGRAM_START_ADDRESS	(AVR32_FLASH_ADDRESS + PROGRAM_START_OFFSET)


#endif
