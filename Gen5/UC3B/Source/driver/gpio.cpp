/**	@file
	@brief IOポートの制御
*/


#include "gpio.h"






namespace GPIO{
	
	// GPIOの初期化
	void Init(void){
		const static int TYPE_PER_A	= 0;
		const static int TYPE_PER_B	= 1;
		const static int TYPE_PER_C	= 2;
		const static int TYPE_PER_D	= 3;
		const static int TYPE_GPIO	= 4;
		
		class clPortSetting{
		public:
			unsigned long long puer, pmr1, pmr0, gper, ovr, oder;
		
			clPortSetting() : puer(0), pmr1(0), pmr0(0), gper(0), ovr(0), oder(0){}
		
			void pin_set(int bit, int type, int dir, int out, int pull){
				unsigned long long mask = 1ULL << bit;
				gper = (gper & ~mask) | (type == TYPE_GPIO ? mask : 0);
				pmr1 = (pmr1 & ~mask) | (type & 0x2 ? mask : 0);
				pmr0 = (pmr0 & ~mask) | (type & 0x1 ? mask : 0);
				oder = (oder & ~mask) | (dir == DIR_OUT ? mask : 0);
				ovr  = (ovr  & ~mask) | (out == OUT_HIGH ? mask : 0);
				puer = (puer & ~mask) | (pull == PULL_UP ? mask : 0);
			}
		};
		clPortSetting port;
		
		// CPUローカルバスからGPIOにアクセスできるようにする
		#if GPIO_USE_LOCAL_BUS
		__builtin_mtsr(AVR32_CPUCR, __builtin_mfsr(AVR32_CPUCR) | AVR32_CPUCR_LOCEN_MASK);
		#endif
		
		// ピンのセット
		#ifdef _DFU_
			port.pin_set(PIN_TDI				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_TDO				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_TMS				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_VOLT_BAT			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SETTING_APPLICATION	, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_SETTING_ID0		, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_SETTING_ID1		, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_SETTING_ID2		, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_VOLT_12V			, TYPE_PER_B, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_POWER_SCL			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_POWER_SDA			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_AUX0			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_DONE			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_CONF			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SPI_MOSI			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SPI_SCLK			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_FPGA_nPROG			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_FLASH_nCS			, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_SPI_MISO			, TYPE_PER_C, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_AUX2			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_PWR_MOTOR2			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_UNUSED_P21			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_UNUSED_P22			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_IRDA_TX			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_IRDA_RX			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_UNUSED_P25			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_CHARGER_TX			, TYPE_PER_B, DIR_OUT, OUT_HIGH, PULL_UP);
			port.pin_set(PIN_CHARGER_RX			, TYPE_PER_B, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_MCU_CLK			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_OSC_EN				, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_MOT2_TEMP			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_nSW1				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_PWR_MOTOR1			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SETTING_CHARGER	, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_LED1				, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_LED2				, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_FPGA_AUX1			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_nCS			, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_FPGA_nINIT			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_PWR_12V			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_IRDA_SD			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_nLED3				, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_DEBUG_RX			, TYPE_PER_C, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_DEBUG_TX			, TYPE_PER_C, DIR_OUT, OUT_HIGH, PULL_NONE);
		#else
			port.pin_set(PIN_TDI				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_TDO				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_TMS				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_VOLT_BAT			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SETTING_APPLICATION	, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_SETTING_ID0		, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_SETTING_ID1		, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_SETTING_ID2		, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_VOLT_12V			, TYPE_PER_B, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_POWER_SCL			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_POWER_SDA			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_AUX0			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_FPGA_DONE			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_CONF			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SPI_MOSI			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SPI_SCLK			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_FPGA_nPROG			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_FLASH_nCS			, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_SPI_MISO			, TYPE_PER_C, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_FPGA_AUX2			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_PWR_MOTOR2			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_UNUSED_P21			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_UNUSED_P22			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_IRDA_TX			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_IRDA_RX			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_UNUSED_P25			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_CHARGER_TX			, TYPE_PER_B, DIR_OUT, OUT_HIGH, PULL_UP);
			port.pin_set(PIN_CHARGER_RX			, TYPE_PER_B, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_MCU_CLK			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_OSC_EN				, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_MOT2_TEMP			, TYPE_PER_A, DIR_IN, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_nSW1				, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_PWR_MOTOR1			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_SETTING_CHARGER	, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_LED1				, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_LED2				, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_FPGA_AUX1			, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_FPGA_nCS			, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_FPGA_nINIT			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_UP);
			port.pin_set(PIN_PWR_12V			, TYPE_GPIO, DIR_OUT, OUT_LOW, PULL_NONE);
			port.pin_set(PIN_IRDA_SD			, TYPE_GPIO, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_nLED3				, TYPE_GPIO, DIR_OUT, OUT_HIGH, PULL_NONE);
			port.pin_set(PIN_DEBUG_RX			, TYPE_PER_C, DIR_IN, OUT_LOW, PULL_UP);
			port.pin_set(PIN_DEBUG_TX			, TYPE_PER_C, DIR_OUT, OUT_HIGH, PULL_NONE);
		#endif

		// レジスタに格納
		IO_GPIO.port[0].puer	= port.puer & 0xFFFFFFFFULL;
		IO_GPIO.port[0].pmr1	= port.pmr1 & 0xFFFFFFFFULL;
		IO_GPIO.port[0].pmr0	= port.pmr0 & 0xFFFFFFFFULL;
		IO_GPIO.port[0].gper	= port.gper & 0xFFFFFFFFULL;
		IO_GPIOL.port[0].ovr	= port.ovr & 0xFFFFFFFFULL;
		IO_GPIOL.port[0].oder	= port.oder & 0xFFFFFFFFULL;
		IO_GPIO.port[1].puer	= port.puer >> 32;
		IO_GPIO.port[1].pmr1	= port.pmr1 >> 32;
		IO_GPIO.port[1].pmr0	= port.pmr0 >> 32;
		IO_GPIO.port[1].gper	= port.gper >> 32;
		IO_GPIOL.port[1].ovr	= port.ovr >> 32;
		IO_GPIOL.port[1].oder	= port.oder >> 32;
	}
}









