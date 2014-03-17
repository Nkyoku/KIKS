/**	@file
	@brief IOポートの制御
*/

#ifndef GPIO_H_
#define GPIO_H_

#include "../define.h"



#define GPIO_USE_LOCAL_BUS	0	// CPUローカルバスを使用する



#define IO_GPIO		AVR32_GPIO

#if GPIO_USE_LOCAL_BUS
#define IO_GPIOL	AVR32_GPIO_LOCAL
#else
#define IO_GPIOL	AVR32_GPIO
#endif





#define OUT_LOW		0
#define OUT_HIGH	1

#define DIR_IN		0
#define DIR_OUT		1

#define PULL_NONE	0
#define PULL_UP		1

#define IN_LOW		0
#define IN_HIGH		1

#define GPER_PER	0
#define GPER_GPIO	1




#ifdef __cplusplus
namespace GPIO{
	// IOポートの初期化
	void Init(void);
}
#endif


// 出力を設定
static inline void SetOut(int bit, int out){
	if (out == OUT_LOW)
		IO_GPIOL.port[bit >> 5].ovrc = 1 << (bit & 0x1F);
	else
		IO_GPIOL.port[bit >> 5].ovrs = 1 << (bit & 0x1F);
}

// 出力をトグル
static inline void SetToggle(int bit){
	IO_GPIOL.port[bit >> 5].ovrt = 1 << (bit & 0x1F);
}

// 方向を設定
static inline void SetDir(int bit, int dir){
	if (dir == DIR_IN)
		IO_GPIOL.port[bit >> 5].oderc = 1 << (bit & 0x1F);
	else
		IO_GPIOL.port[bit >> 5].oders = 1 << (bit & 0x1F);
}

// プルアップを設定
static inline void SetPull(int bit, int pull){
	if (pull == PULL_NONE)
		IO_GPIO.port[bit >> 5].puerc = 1 << (bit & 0x1F);
	else
		IO_GPIO.port[bit >> 5].puers = 1 << (bit & 0x1F);
}

// 入力を取得
static inline int GetIn(int bit){
	return IO_GPIOL.port[bit >> 5].pvr & (1 << (bit & 0x1F)) ? IN_HIGH : IN_LOW;
}

// GPERを設定
static inline void SetGPER(int bit, int gper){
	if (gper == GPER_PER)
		IO_GPIO.port[bit >> 5].gperc = 1 << (bit & 0x1F);
	else
		IO_GPIO.port[bit >> 5].gpers = 1 << (bit & 0x1F);
}




#ifdef __cplusplus

// 出力を2つ同時に設定
static inline void SetOut(int bit1, int bit2, int out){
	if ((bit1 >> 5) == (bit2 >> 5)){
		if (out == OUT_LOW)
			IO_GPIOL.port[bit1 >> 5].ovrc = (1 << (bit1 & 0x1F)) | (1 << (bit2 & 0x1F));
		else
			IO_GPIOL.port[bit1 >> 5].ovrs = (1 << (bit1 & 0x1F)) | (1 << (bit2 & 0x1F));
	}else{	
		SetOut(bit1, out);
		SetOut(bit2, out);
	}
}

// 出力を2つ同時にトグル
static inline void SetToggle(int bit1, int bit2){
	if ((bit1 >> 5) == (bit2 >> 5)){
		IO_GPIOL.port[bit1 >> 5].ovrt = (1 << (bit1 & 0x1F)) | (1 << (bit2 & 0x1F));
	}else{	
		SetToggle(bit1);
		SetToggle(bit2);
	}
}

// 方向を2つ同時に設定
static inline void SetDir(int bit1, int bit2, int dir){
	if ((bit1 >> 5) == (bit2 >> 5)){
		if (dir == DIR_IN)
			IO_GPIOL.port[bit1 >> 5].oderc = (1 << (bit1 & 0x1F)) | (1 << (bit2 & 0x1F));
		else
			IO_GPIOL.port[bit1 >> 5].oders = (1 << (bit1 & 0x1F)) | (1 << (bit2 & 0x1F));
	}else{	
		SetDir(bit1, dir);
		SetDir(bit2, dir);
	}
}

// プルアップを2つ同時に設定
static inline void SetPull(int bit1, int bit2, int pull){
	if ((bit1 >> 5) == (bit2 >> 5)){
		if (pull == PULL_NONE)
			IO_GPIOL.port[bit1 >> 5].puerc = (1 << (bit1 & 0x1F)) | (1 << (bit2 & 0x1F));
		else
			IO_GPIOL.port[bit1 >> 5].puers = (1 << (bit1 & 0x1F)) | (1 << (bit2 & 0x1F));
	}else{	
		SetPull(bit1, pull);
		SetPull(bit2, pull);
	}	
}

#endif









#define PIN_TDI					0
#define PIN_TDO					1
#define PIN_TMS					2
#define PIN_VOLT_BAT			3
#define PIN_SETTING_APPLICATION	4
#define PIN_SETTING_ID0			5
#define PIN_SETTING_ID1			6
#define PIN_SETTING_ID2			7
#define PIN_VOLT_12V			8
#define PIN_POWER_SCL			9
#define PIN_POWER_SDA			10
#define PIN_FPGA_AUX0			11
#define PIN_FPGA_DONE			12
#define PIN_FPGA_CONF			13
#define PIN_SPI_MOSI			14
#define PIN_SPI_SCLK			15
#define PIN_FPGA_nPROG			16
#define PIN_FLASH_nCS			17
#define PIN_SPI_MISO			18
#define PIN_FPGA_AUX2			19
#define PIN_PWR_MOTOR2			20
#define PIN_UNUSED_P21			21		// 配線の都合でPOWER_SDAと接続
#define PIN_UNUSED_P22			22		// 配線の都合でPOWER_SCLと接続
#define PIN_IRDA_TX				23
#define PIN_IRDA_RX				24
#define PIN_UNUSED_P25			25		// 未使用
#define PIN_CHARGER_TX			26
#define PIN_CHARGER_RX			27
#define PIN_MCU_CLK				28
#define PIN_OSC_EN				29
#define PIN_MOT2_TEMP			30
#define PIN_nSW1				31
#define PIN_PWR_MOTOR1			(32 + 0)
#define PIN_SETTING_CHARGER		(32 + 1)
#define PIN_LED1				(32 + 2)
#define PIN_LED2				(32 + 3)
#define PIN_FPGA_AUX1			(32 + 4)
#define PIN_FPGA_nCS			(32 + 5)
#define PIN_FPGA_nINIT			(32 + 6)
#define PIN_PWR_12V				(32 + 7)
#define PIN_IRDA_SD				(32 + 8)
#define PIN_nLED3				(32 + 9)
#define PIN_DEBUG_RX			(32 + 10)
#define PIN_DEBUG_TX			(32 + 11)



#endif
