// IOポートの制御

#ifndef GPIO_H_
#define GPIO_H_

#include "../define.h"



#define OUT_LOW		0
#define OUT_HIGH	1

#define DIR_IN		0
#define DIR_OUT		1

#define PULL_NONE	0
#define PULL_UP		1

#define IN_LOW		0
#define IN_HIGH		1



// IOポートの初期化
void GPIO_Init(void);


// 出力を設定
inline void SetOut(int bit, int out){
	if (out == OUT_LOW)
		GPIO.port[0].ovrc = 1 << bit;
	else
		GPIO.port[0].ovrs = 1 << bit;
}

// 方向を設定
inline void SetDir(int bit, int dir){
	if (dir == DIR_IN)
		GPIO.port[0].oderc = 1 << bit;
	else
		GPIO.port[0].oders = 1 << bit;
}

// プルアップを設定
inline void SetPull(int bit, int pull){
	if (pull == PULL_NONE)
		GPIOM.port[0].puerc = 1 << bit;
	else
		GPIOM.port[0].puers = 1 << bit;
}

// 入力を取得
inline int GetIn(int bit){
	return GPIO.port[0].pvr & (1 << bit) ? IN_HIGH : IN_LOW;
}




#define PORT_LED_PWR	3
#define PORT_LED_TRC	4
#define PORT_LED_IND	5
#define PORT_LED_ERR	6

#define PORT_SW13		26
#define PORT_SW5		27

#define PORT_SR_CL		14
#define PORT_SR_CLK		13
#define PORT_SR_DO		15
#define PORT_SR_DI1		16
#define PORT_SR_DI2		12

#define PORT_X_RST		22
#define PORT_X_CTS		9
#define PORT_X_RTS		10
#define PORT_X_DTR		17
#define PORT_X_RX		23
#define PORT_X_TX		24

#define PORT_DBG_TX		20
#define PORT_DBG_RX		21












#endif
