/**	@file
	@brief FPGA Spartan-6の制御
*/

#ifndef SPARTAN6_H_
#define SPARTAN6_H_

#include "../HAL/Pipe.h"



namespace FPGA{
	
	static const unsigned int MAX_BITSTREAM_SIZE = 512 * 1024;	// ビットストリームの最大サイズ
	
	// FPGAの状態
	extern enum FPGA_STATE_e{
		FSTATE_NoConf = 0,	// コンフィグレーションされていない
		FSTATE_Config,		// コンフィグレーション中
		FSTATE_Running		// 動作中
	} State;
	
	// FPGA内に作ったレジスタ
	enum REGISTER_e{
		IOM_GPIA		= 0x0000,
		IOM_GPIB		= 0x0001,
		IOM_GPIC		= 0x0002,
		IOM_GPID		= 0x0003,
		IOM_GPOA		= 0x0001,
		IOM_GPOACLR		= 0x0002,
		IOM_GPOASET		= 0x0003,
		IOM_GPOB		= 0x0005,
		IOM_GPOBCLR		= 0x0006,
		IOM_GPOBSET		= 0x0007,
		IOM_GPOC		= 0x0009,
		IOM_GPOCCLR		= 0x000A,
		IOM_GPOCSET		= 0x000B,
		IOM_GPOD		= 0x000D,
		IOM_GPODCLR		= 0x000E,
		IOM_GPODSET		= 0x000F,
		IOM_BZ			= 0x0010,
		
		OMSP_EXIST		= 0x0100,
		OMSP_CR			= 0x0100,
		OMSP_PROG		= 0x0101,
		OMSP_TICKH		= 0x0102,
		OMSP_TICKL		= 0x0103,
		
		PIPE_RXDATA		= 0x0201,
		PIPE_RXCNT		= 0x0203,
		
		SMEM_BASE		= 0x0300,
		
		
		QMOTOR_CR		= 0x0400,
		QMOTOR_SR		= 0x0401,
		QMOTOR_DUTY0	= 0x0402,
		QMOTOR_DUTY1	= 0x0403,
		QMOTOR_DUTY2	= 0x0404,
		QMOTOR_DUTY3	= 0x0405,
		QMOTOR_ROT0		= 0x0408,
		QMOTOR_ROT1		= 0x0409,
		QMOTOR_ROT2		= 0x040A,
		QMOTOR_ROT3		= 0x040B,
		QMOTOR_PWM0		= 0x040E,
		QMOTOR_PWM1		= 0x040F,
		QMOTOR_PWM2		= 0x0410,
		QMOTOR_PWM3		= 0x0411,
		
		DRMOT_CR		= 0x0500,
		DRMOT_SR		= 0x0501,
		DRMOT_DUTY		= 0x0502,
		DRMOT_PWM		= 0x0504,
		
		
		
		
		
		
	};	
	


	// 制御用の変数を初期化
 	void Init(void);

	// FPGAをリセット
	void Reset(void);
	
	
	
	// コンフィギュレーション関連
	namespace Conf{
		
		
		// パイプ情報
		extern const BTT::PIPE_INFO_t Info;
		
		// 開く
		bool Open(void);
		
		// 閉じる
		void Close(void);
		
		// 書き込み
		bool Write(const void *data, unsigned int len, unsigned int &written);
		
	}
	
	
	// コンフィギュレーションを停止する
	bool StopConfig(void);

	// ビットストリームを送信
	bool SendBitstream(const void *data, int length);
	
	
	
	
	
	
	
	
	
	
	
	// コンフィギュレーションをされたか
	static inline bool IsRunning(void){
		return State == FSTATE_Running;
	}
	
	// データを書き込む
	bool Write(int address, short data);
	bool Write(int address, const void *data, int length, bool noinc = false);
	
	// データを読み込む
	bool Read(int address, void *data, int length, bool noinc = false);
	
	
	
	
}

#endif
