/**	@file
	@brief IOポートの制御
*/

#ifndef GPIO_H_
#define GPIO_H_

#include "../define.h"





#define OUT_LOW		0
#define OUT_HIGH	1

#define DIR_IN		0
#define DIR_OUT		1

#define IN_LOW		0
#define IN_HIGH		1



#ifdef __cplusplus
namespace GPIO{
	// IOポートの初期化
	void Init(void);
}
#endif


// ポートレジスタを取得
#define GetVPort(bit) (((bit >> 3) == 0) ? VPORT0 : ((bit >> 3) == 1) ? VPORT1 : ((bit >> 3) == 2) ? VPORT2 : VPORT3)

// 出力を設定
static inline void SetOut(int bit, int out){
	if (out == OUT_LOW) GetVPort(bit).OUT &= ~(1 << (bit & 0x7));
	if (out == OUT_HIGH) GetVPort(bit).OUT |= 1 << (bit & 0x7);
}

// 方向を設定
static inline void SetDir(int bit, int dir){
	if (dir == DIR_IN) GetVPort(bit).DIR &= ~(1 << (bit & 0x7));
	if (dir == DIR_OUT) GetVPort(bit).DIR |= 1 << (bit & 0x7);
}

// 入力を取得
static inline int GetIn(int bit){
	return GetVPort(bit).IN & (1 << (bit & 0x7)) ? IN_HIGH : IN_LOW;
}



#ifdef __cplusplus

// 出力を2つ同時に設定
/*static inline void SetOut(int bit1, int bit2, int out){
	if ((bit1 >> 3) == (bit2 >> 3)){
		if (out == OUT_LOW)
			VPORT[bit1 >> 3]->OUT &= ~((1 << (bit1 & 0x7)) | (1 << (bit2 & 0x7)));
		else
			VPORT[bit1 >> 3]->OUT |= (1 << (bit1 & 0x7)) | (1 << (bit2 & 0x7));
	}else{	
		SetOut(bit1, out);
		SetOut(bit2, out);
	}	
}*/

#endif




// PORTA
#define PIN_VOLT_LINE			(1)
#define PIN_VOLT_BAT			(2)
#define PIN_VOLT_TEMP			(3)
#define PIN_VOLT_CAP			(4)

// PORTC
#define PIN_GATE_CHOPPER		(8 + 0)
#define PIN_GATE_KICK1			(8 + 1)
#define PIN_GATE_KICK2			(8 + 2)

// PORTD
#define PIN_LED1				(16 + 0)
#define PIN_LED2				(16 + 1)

// PORTE
#define PIN_PWR_CHARGER			(24 + 1)
#define PIN_PWR_GATE			(24 + 3)



#endif
