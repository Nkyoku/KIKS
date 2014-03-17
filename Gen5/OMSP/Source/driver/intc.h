/*	@file
	@brief 割り込みコントローラ
*/

#ifndef _INTC_H_
#define _INTC_H_

#include "OMSP.h"



// 割り込みを許可
#define sei()	__bis_SR_register(GIE)

// 割り込みを禁止
#define cli()	__bic_SR_register(GIE)

// NMIを有効
#define enanmi()	{IE1 = NMIIE;}

// NMIを無効
#define disnmi()	{IE1 = 0;}




#define INTC_SRC_INT		(0)		// 内部割り込み(1kHz)
#define INTC_SRC_EXT_POS	(1)		// 外部割り込み(ポジティブエッジ)
#define INTC_SRC_EXT_NEG	(2)		// 外部割り込み(ネガティブエッジ)

// INTCを設定
static inline void ConfigINTC(bool enable, int period, int source){
	unsigned short value;
	value  = enable ? 0x8000 : 0x0000;
	value |= (period - 1) & 0xF;
	value |= (source == INTC_SRC_EXT_POS) ? 0x6000 :
	         (source == INTC_SRC_EXT_NEG) ? 0x4000 :
	         0x0000;
	INTE = value;
}



#endif
