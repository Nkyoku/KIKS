/*	@file
	@brief MPU-6000の制御
	       カラーセンサーTCS34725も同時に制御する
*/

#include "mpu6000.h"

#include "../define.h"
#include "delay.h"
#include "gpio.h"



namespace MPU{
	
	static const unsigned char MPU6000_ADDR = 0x68;
	static const unsigned char TCS34725_ADDR = 0x29;
	static const unsigned char TCS34725_ID = 0x44;
	
	
	
	bool m_MPUExist = 0;	// MPU-6000が存在する
	bool m_ColorExist;		// TCS34725が存在する
	
	
	
	// (内部)レジスタに書き込み
	void IntWriteByte(unsigned char addr, unsigned char data){
		unsigned char ret;
		SetOut(PIN_EXT1_nCS, OUT_LOW);
		SPI.SPDR = addr & 0x7F;
		SPI.SPDR = data;
		while(~SPI.SPSR & 0x20);
		ret = SPI.SPDR;
		ret = SPI.SPDR;
		SetOut(PIN_EXT1_nCS, OUT_HIGH);
		delay_moment(5);	// CLK_SYS=45MHzのとき、3でOK
	}
	
	// (内部)レジスタから読み込み
	unsigned char IntReadByte(unsigned char addr){
		unsigned char ret;
		SetOut(PIN_EXT1_nCS, OUT_LOW);
		SPI.SPDR = 0x80 | addr;
		SPI.SPDR = 0;
		while(~SPI.SPSR & 0x20);
		ret = SPI.SPDR;
		ret = SPI.SPDR;
		SetOut(PIN_EXT1_nCS, OUT_HIGH);
		delay_moment(5);
		return ret;
	}
	unsigned short IntReadWord(unsigned char addr){
		unsigned short ret;
		SetOut(PIN_EXT1_nCS, OUT_LOW);
		SPI.SPDR = 0x80 | addr;
		SPI.SPDR = 0;
		SPI.SPDR = 0;
		while(~SPI.SPSR & 0x20);
		ret = SPI.SPDR;
		ret = SPI.SPDR << 8;
		ret |= SPI.SPDR;
		SetOut(PIN_EXT1_nCS, OUT_HIGH);
		delay_moment(5);
		return ret;
	}
	
	// 2バイトの値を複数取得
	void GetSensorValues(unsigned char addr, void *output_, unsigned int count){
		unsigned short *output = (unsigned short*)output_;
		unsigned short ret;
		SetOut(PIN_EXT1_nCS, OUT_LOW);
		SPI.SPDR = 0x80 | addr;
		while(~SPI.SPSR & 0x20);
		ret = SPI.SPDR;
		while(0 < count--){
			SPI.SPDR = 0;
			SPI.SPDR = 0;
			while(~SPI.SPSR & 0x20);
			ret = SPI.SPDR << 8;
			ret |= SPI.SPDR;
			*output++ = ret;
		}
		SetOut(PIN_EXT1_nCS, OUT_HIGH);
		//delay_moment(5);
	}
	
	// (内部)AUX I2Cでレジスタに書き込み
	void IntWriteI2C(unsigned char reg, unsigned char data){
		IntWriteByte(MPUREG_I2C_SLV4_ADDR, TCS34725_ADDR);
		IntWriteByte(MPUREG_I2C_SLV4_REG, reg);
		IntWriteByte(MPUREG_I2C_SLV4_DO, data);
		IntWriteByte(MPUREG_I2C_SLV4_CTRL, 0x80);
		for(int cnt = 1000; 0 < cnt; cnt--){
			unsigned char status = IntReadByte(MPUREG_I2C_MST_STATUS);
			if (status & 0x70){
				if (status & 0x40) return;
				UART.DATA = 'e';
				break;
			}
		}
	}
	
	// (内部)AUX I2Cでレジスタから読み込み
	unsigned char IntReadI2C(unsigned char reg){
		IntWriteByte(MPUREG_I2C_SLV4_ADDR, 0x80 | TCS34725_ADDR);
		IntWriteByte(MPUREG_I2C_SLV4_REG, reg);
		IntWriteByte(MPUREG_I2C_SLV4_CTRL, 0x80);
		for(int cnt = 1000; 0 < cnt; cnt--){
			unsigned char status = IntReadByte(MPUREG_I2C_MST_STATUS);
			if (status & 0x70){
				if (status & 0x40){
					return IntReadByte(MPUREG_I2C_SLV4_DI);
				}
				break;
			}
		}
		return 0;
	}
	
	
	
	// MPU-6000の初期化
	void Init(void){
		// SPI初期化
		SPI.SPER = 0x01;
		SPI.SPCR = 0x51;	// 0b0101 -> 64分周
		SPI.SPSR = 0xC0;
		SetOut(PIN_EXT1_CE, OUT_HIGH);	// 外部オシレータ有効
		
		// MPU-6000が存在するか？
		if (IntReadByte(MPUREG_WHOAMI) == MPU6000_ADDR){
			m_MPUExist = true;
			
			// MPU-6000をソフトリセット
			IntWriteByte(MPUREG_PWR_MGMT_1, 0x80);
			delay_ms(3);	// MPU-6000のリセット・外部オシレータの発振待ち
			
			// クロック源を外部19.2MHzに切り替え
			IntWriteByte(MPUREG_PWR_MGMT_1, 0x05);
			delay_ms(10);	// PLLロック待ち
			
			// 加速度・ジャイロ設定
			IntWriteByte(MPUREG_CONFIG, 0x01);				// both Fs=1kHz
			IntWriteByte(MPUREG_GYRO_CONFIG, 0x3 << 3);		// ±2000deg/s
			IntWriteByte(MPUREG_ACCEL_CONFIG, 0x1 << 3);	// ±4g
			
			// 割り込み設定
			IntWriteByte(MPUREG_INT_PIN_CFG, 0x10);		// ピン設定(Active-High, Push-Pull, Clear on any read)
			IntWriteByte(MPUREG_INT_ENABLE, 0x01);		// Data ready interrupt
			
			// AUX I2C設定
			IntWriteByte(MPUREG_USER_CTRL, 0x30);
			IntWriteByte(MPUREG_I2C_MST_CTRL, 13);	// I2C 400kHz
			IntReadByte(MPUREG_I2C_MST_STATUS);
			
			// TCS34725が存在するか？
			if (IntReadI2C(TCSREG_ID) == TCS34725_ID){
				m_ColorExist = true;
				
				// TCS34725を初期化
				// リセット機能は無いので、念のため初期値が0でも動作に必要なレジスタはすべて初期化する
				IntWriteI2C(TCSREG_ENABLE, 0x03);
				IntWriteI2C(TCSREG_ATIME, 256 - 16);	// 16サンプル分積分 更新周期38.4ms
				IntWriteI2C(TCSREG_PERS, 0x00);
				IntWriteI2C(TCSREG_CONTROL, 0x01);		// ゲイン x4
				
				// TCS34725を自動で読み出すように設定
				IntWriteByte(MPUREG_I2C_SLV0_ADDR, 0x80 | TCS34725_ADDR);
				IntWriteByte(MPUREG_I2C_SLV0_REG, TCSREG_CDATAL | TCSREG_INCREMENT);
				IntWriteByte(MPUREG_I2C_SLV0_CTRL, 0xC8);
				IntWriteByte(MPUREG_I2C_SLV4_CTRL, 30 - 1);		// I2Cのサンプルレート = Fs / 30
				IntWriteByte(MPUREG_I2C_MST_DELAY_CTRL, 0x81);
			}
			
			// SPI周波数を切り替え
			// 以降、センサーレジスタ以外にアクセスできなくなる
			// 後で他のレジスタにアクセスする用事があるときは、コメントアウトすること
			SPI.SPER = 0x00;	// 0b0001 -> 4分周
		}else{
			// 存在しない
			// 外部オシレータとSPIを無効にする
			SetOut(PIN_EXT1_CE, OUT_LOW);
			SPI.SPCR = 0x00;
		}
	}
	
	
	
	
	
	
	
}
