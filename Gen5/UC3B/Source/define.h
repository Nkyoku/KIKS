/**	@file
	@brief  共通の定義・定数
*/

#ifndef DEFINE_H_
#define DEFINE_H_

#include <avr32/io.h>



// 型
#undef NULL
#define NULL	0



// 2のべき乗か判断する
#define ISPOWEROF2(x) (((x) & -(x)) == (x))


// エンディアン変換
#define SWAP16(s) ((((s) << 8) & 0xFF00) | (((s) >> 8) & 0xFF))


// パッキング・アライメント
#define PACK	__attribute__((packed))
#define ALIGN1	__attribute__((aligned(1)))
#define ALIGN2	__attribute__((aligned(2)))
#define ALIGN4	__attribute__((aligned(4)))

// 関数の修飾
#define NORETURN __attribute__((noreturn)) void



// 短縮
#define WDT		AVR32_WDT
//#define FLASHC	AVR32_FLASHC
#define INTC	AVR32_INTC
//#define PM		AVR32_PM
//#define TC		AVR32_TC
//#define SPI		AVR32_SPI
//#define UART0	AVR32_USART0
//#define UART1	AVR32_USART1
//#define ADC		AVR32_ADC
//#define PDCA	AVR32_PDCA



// NOP
#define NOP()	__asm__ __volatile__("nop" ::)


// CPUクロック
#define F_CPU		60000000

// ペリフェラルクロック
#define F_PER		60000000









#endif
