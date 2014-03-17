/**	@file
	@brief SPIバスの制御
*/

#ifndef SPI_H_
#define SPI_H_

#include "../define.h"



namespace SPI{


	#define SPI_PDCA_TX		AVR32_PDCA.channel[1]	// SPI送信のDMAチャンネル

	#define SPI_TIMEOUT		500		// SPIを占有するときのタイムアウト


	enum MODE_e{
		MODE_8BIT,
		MODE_16BIT
	};



	// 初期化
	void Init(void);

	// 占有権を取得する
	bool Open(void);

	// 占有権を返す
	void Close(void);
	
	// 転送のモードを設定
	static inline void SetMode(MODE_e mode){
		switch(mode){
		case MODE_8BIT:
			AVR32_SPI.mr = (0 << AVR32_SPI_MR_DLYBCS) | (0b1110 << AVR32_SPI_MR_PCS)
				   | AVR32_SPI_MR_MODFDIS_MASK | AVR32_SPI_MR_MSTR_MASK;
			SPI_PDCA_TX.mr = AVR32_PDCA_MR_SIZE_BYTE << AVR32_PDCA_MR_SIZE;
			break;
			
		case MODE_16BIT:
			AVR32_SPI.mr = (0 << AVR32_SPI_MR_DLYBCS) | (0b1101 << AVR32_SPI_MR_PCS)
				   | AVR32_SPI_MR_MODFDIS_MASK | AVR32_SPI_MR_MSTR_MASK;
			SPI_PDCA_TX.mr = AVR32_PDCA_MR_SIZE_HALF_WORD << AVR32_PDCA_MR_SIZE;
			break;
		}
	}
	
	// 送信の準備をする
	static inline void SetupTxDMANew(const void *write_data = NULL, int write_length = 0){
		SPI_PDCA_TX.mar = (unsigned int)write_data;
		SPI_PDCA_TX.tcr = write_length;
	}
	static inline void SetupTxDMA(const void *write_data = NULL, int write_length = 0){
		SPI_PDCA_TX.marr = (unsigned int)write_data;
		SPI_PDCA_TX.tcrr = write_length;
	}
	
	// 転送を行う
	static inline void StartDMA(void){
		AVR32_SPI.rdr;
		SPI_PDCA_TX.cr = AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
	}
	
	// 転送を停止する
	static inline void StopDMA(void){
		SPI_PDCA_TX.cr = AVR32_PDCA_CR_TDIS_MASK;
	}
	
	// 送信の完了を待つ
	static inline bool WaitTxDMA(void){
		while((SPI_PDCA_TX.isr & (AVR32_PDCA_ISR_TERR_MASK | AVR32_PDCA_ISR_TRC_MASK)) == 0);
		if (SPI_PDCA_TX.isr & AVR32_PDCA_ISR_TERR_MASK) return false;
		while(~AVR32_SPI.sr & AVR32_SPI_SR_TXEMPTY_MASK);
		return true;
	}
	
	
}





#endif
