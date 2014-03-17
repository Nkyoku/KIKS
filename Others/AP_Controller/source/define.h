// ���ʂ̒�`�E�萔

#ifndef DEFINE_H_
#define DEFINE_H_

#include <avr32/io.h>



// �^
#undef NULL
#define NULL	0
/*
#undef false
#define false	0

#undef true
#define true	1

#undef bool
#define bool	char
*/

// �G���f�B�A���ϊ�
#define SWAP16(s) ((((s) << 8) & 0xFF00) | (((s) >> 8) & 0xFF))


// �p�b�L���O�E�A���C�����g
#define PACK	__attribute__((packed))
#define ALIGN1	__attribute__((aligned(1)))
#define ALIGN2	__attribute__((aligned(2)))
#define ALIGN4	__attribute__((aligned(4)))


// �Z�k
#define WDT		AVR32_WDT
#define FLASHC	AVR32_FLASHC
#define GPIOM	AVR32_GPIO
#define GPIO	AVR32_GPIO_LOCAL
#define INTC	AVR32_INTC
#define PM		AVR32_PM
#define TC		AVR32_TC
#define USBB	AVR32_USBB
#define SPI		AVR32_SPI
#define UART0	AVR32_USART0
#define UART1	AVR32_USART1
#define UART2	AVR32_USART2
#define ADC		AVR32_ADC
#define PDCA	AVR32_PDCA



// NOP
#define NOP()	asm volatile("nop" ::)


// CPU�N���b�N
#define F_CPU		48000000

// �y���t�F�����N���b�N
#define F_PER		48000000









#endif
