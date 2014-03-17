/*	@file
	@brief MPU-6000の制御
	       カラーセンサーTCS34725も同時に制御する
*/

#ifndef _MPU6000_H_
#define _MPU6000_H_



namespace MPU{
	
	extern bool m_MPUExist;
	extern bool m_ColorExist;
	
	
	
	// (内部)レジスタに書き込み
	void IntWriteByte(unsigned char addr, unsigned char data);
	
	// (内部)レジスタから読み込み
	unsigned char IntReadByte(unsigned char addr);
	unsigned short IntReadWord(unsigned char addr);
	
	// (内部)AUX I2Cでレジスタに書き込み
	void IntWriteI2C(unsigned char reg, unsigned char data);
	
	// (内部)AUX I2Cでレジスタから読み込み
	unsigned char IntReadI2C(unsigned char reg);
	
	
	
	// MPU-6000の初期化
	void Init(void);
	
	// MPU-6000が存在する
	static inline bool IsExisted(void){
		return m_MPUExist;
	}
	
	// 2バイトの値を複数取得
	// outputはアライメントされていること
	void GetSensorValues(unsigned char addr, void *output, unsigned int count); 
	
	
	
	
	
	
	/*** MPU6050 レジスタセット ***/
	// どこかのAndroidのソースから流用
	enum MPUREG_e{
		MPUREG_XG_OFFS_TC = 0,				/* 0x00,   0 */
		MPUREG_YG_OFFS_TC,					/* 0x01,   1 */
		MPUREG_ZG_OFFS_TC,					/* 0x02,   2 */
		MPUREG_X_FINE_GAIN,					/* 0x03,   3 */
		MPUREG_Y_FINE_GAIN,					/* 0x04,   4 */
		MPUREG_Z_FINE_GAIN,					/* 0x05,   5 */
		MPUREG_XA_OFFS_H,					/* 0x06,   6 */
		MPUREG_XA_OFFS_L,					/* 0x07,   7 */
		MPUREG_YA_OFFS_H,					/* 0x08,   8 */
		MPUREG_YA_OFFS_L,					/* 0x09,   9 */
		MPUREG_ZA_OFFS_H,					/* 0x0a,  10 */
		MPUREG_ZA_OFFS_L,					/* 0x0B,  11 */
		MPUREG_PRODUCT_ID,					/* 0x0c,  12 */
		
		MPUREG_XG_OFFS_USRH = 19,			/* 0x13,  19 */
		MPUREG_XG_OFFS_USRL,				/* 0x14,  20 */
		MPUREG_YG_OFFS_USRH,				/* 0x15,  21 */
		MPUREG_YG_OFFS_USRL,				/* 0x16,  22 */
		MPUREG_ZG_OFFS_USRH,				/* 0x17,  23 */
		MPUREG_ZG_OFFS_USRL,				/* 0x18,  24 */
		MPUREG_SMPLRT_DIV,					/* 0x19,  25 */
		MPUREG_CONFIG,						/* 0x1A,  26 */
		MPUREG_GYRO_CONFIG,					/* 0x1b,  27 */
		MPUREG_ACCEL_CONFIG,				/* 0x1c,  28 */
		MPUREG_ACCEL_FF_THR,				/* 0x1d,  29 */
		MPUREG_ACCEL_FF_DUR,				/* 0x1e,  30 */
		MPUREG_ACCEL_MOT_THR,				/* 0x1f,  31 */
		MPUREG_ACCEL_MOT_DUR,				/* 0x20,  32 */
		MPUREG_ACCEL_ZRMOT_THR,				/* 0x21,  33 */
		MPUREG_ACCEL_ZRMOT_DUR,				/* 0x22,  34 */
		MPUREG_FIFO_EN,						/* 0x23,  35 */
		MPUREG_I2C_MST_CTRL,				/* 0x24,  36 */
		MPUREG_I2C_SLV0_ADDR,				/* 0x25,  37 */
		MPUREG_I2C_SLV0_REG,				/* 0x26,  38 */
		MPUREG_I2C_SLV0_CTRL,				/* 0x27,  39 */
		MPUREG_I2C_SLV1_ADDR,				/* 0x28,  40 */
		MPUREG_I2C_SLV1_REG,				/* 0x29,  41 */
		MPUREG_I2C_SLV1_CTRL,				/* 0x2a,  42 */
		MPUREG_I2C_SLV2_ADDR,				/* 0x2B,  43 */
		MPUREG_I2C_SLV2_REG,				/* 0x2c,  44 */
		MPUREG_I2C_SLV2_CTRL,				/* 0x2d,  45 */
		MPUREG_I2C_SLV3_ADDR,				/* 0x2E,  46 */
		MPUREG_I2C_SLV3_REG,				/* 0x2f,  47 */
		MPUREG_I2C_SLV3_CTRL,				/* 0x30,  48 */
		MPUREG_I2C_SLV4_ADDR,				/* 0x31,  49 */
		MPUREG_I2C_SLV4_REG,				/* 0x32,  50 */
		MPUREG_I2C_SLV4_DO,					/* 0x33,  51 */
		MPUREG_I2C_SLV4_CTRL,				/* 0x34,  52 */
		MPUREG_I2C_SLV4_DI,					/* 0x35,  53 */
		MPUREG_I2C_MST_STATUS,				/* 0x36,  54 */
		MPUREG_INT_PIN_CFG,					/* 0x37,  55 */
		MPUREG_INT_ENABLE,					/* 0x38,  56 */
		MPUREG_DMP_INT_STATUS,				/* 0x39,  57 */
		MPUREG_INT_STATUS,					/* 0x3A,  58 */
		MPUREG_ACCEL_XOUT_H,				/* 0x3B,  59 */
		MPUREG_ACCEL_XOUT_L,				/* 0x3c,  60 */
		MPUREG_ACCEL_YOUT_H,				/* 0x3d,  61 */
		MPUREG_ACCEL_YOUT_L,				/* 0x3e,  62 */
		MPUREG_ACCEL_ZOUT_H,				/* 0x3f,  63 */
		MPUREG_ACCEL_ZOUT_L,				/* 0x40,  64 */
		MPUREG_TEMP_OUT_H,					/* 0x41,  65 */
		MPUREG_TEMP_OUT_L,					/* 0x42,  66 */
		MPUREG_GYRO_XOUT_H,					/* 0x43,  67 */
		MPUREG_GYRO_XOUT_L,					/* 0x44,  68 */
		MPUREG_GYRO_YOUT_H,					/* 0x45,  69 */
		MPUREG_GYRO_YOUT_L,					/* 0x46,  70 */
		MPUREG_GYRO_ZOUT_H,					/* 0x47,  71 */
		MPUREG_GYRO_ZOUT_L,					/* 0x48,  72 */
		MPUREG_EXT_SLV_SENS_DATA_00,		/* 0x49,  73 */
		MPUREG_EXT_SLV_SENS_DATA_23 = 96,	/* 0x60,  96 */
		MPUREG_ACCEL_INTEL_STATUS,			/* 0x61,  97 */
		
		MPUREG_I2C_SLV0_DO = 99,			/* 0x63,  99 */
		MPUREG_I2C_SLV1_DO,					/* 0x64, 100 */
		MPUREG_I2C_SLV2_DO,					/* 0x65, 101 */
		MPUREG_I2C_SLV3_DO,					/* 0x66, 102 */
		MPUREG_I2C_MST_DELAY_CTRL,			/* 0x67, 103 */
		MPUREG_SIGNAL_PATH_RESET,			/* 0x68, 104 */
		MPUREG_ACCEL_INTEL_CTRL,			/* 0x69, 105 */
		MPUREG_USER_CTRL,					/* 0x6A, 106 */
		MPUREG_PWR_MGMT_1,					/* 0x6B, 107 */
		MPUREG_PWR_MGMT_2,					/* 0x6C, 108 */
		
		MPUREG_FIFO_COUNTH = 114,			/* 0x72, 114 */
		MPUREG_FIFO_COUNTL,					/* 0x73, 115 */
		MPUREG_FIFO_R_W,					/* 0x74, 116 */
		MPUREG_WHOAMI						/* 0x75, 117 */
	};
	
	
	
	
	/*** TCS3472x レジスタセット ***/
	enum TCSREG_e{
		TCSREG_ENABLE	= 0x80,
		TCSREG_ATIME	= 0x81,
		TCSREG_WTIME	= 0x83,
		TCSREG_AILTL	= 0x84,
		TCSREG_AILTH	= 0x85,
		TCSREG_AIHTL	= 0x86,
		TCSREG_AIHTH	= 0x87,
		TCSREG_PERS		= 0x8C,
		TCSREG_CONFIG	= 0x8D,
		TCSREG_CONTROL	= 0x8F,
		TCSREG_ID		= 0x92,
		TCSREG_STATUS	= 0x93,
		TCSREG_CDATAL	= 0x94,
		TCSREG_CDATAH	= 0x95,
		TCSREG_RDATAL	= 0x96,
		TCSREG_RDATAH	= 0x97,
		TCSREG_GDATAL	= 0x98,
		TCSREG_GDATAH	= 0x99,
		TCSREG_BDATAL	= 0x9A,
		TCSREG_BDATAH	= 0x9B,
		
		TCSREG_CLEAR_INT= 0xE6,	// 割り込みをクリア
		TCSREG_INCREMENT= 0x20	// アドレスを自動でインクリメント
	};
	
	
	
}


#endif
