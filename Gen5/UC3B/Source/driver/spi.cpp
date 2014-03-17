/**	@file
	@brief SPIバスの制御
*/

#include "spi.h"
#include "gpio.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"



namespace SPI{
	
	xSemaphoreHandle Semaphore;	// バス使用中のセマフォ
	
	
	
	// 初期化
	void Init(void){
		// SPIの初期化
		AVR32_SPI.mr = (0 << AVR32_SPI_MR_DLYBCS) | (0b1110 << AVR32_SPI_MR_PCS)
			   | AVR32_SPI_MR_MODFDIS_MASK | AVR32_SPI_MR_MSTR_MASK;
		AVR32_SPI.csr0 = (0 << AVR32_SPI_CSR0_DLYBCT) | (0 << AVR32_SPI_CSR0_DLYBS)
				 | (2 << AVR32_SPI_CSR0_SCBR) | (AVR32_SPI_CSR0_BITS_8_BPT << AVR32_SPI_CSR0_BITS)
				 | AVR32_SPI_CSR0_NCPHA_MASK;
		AVR32_SPI.csr1 = (0 << AVR32_SPI_CSR1_DLYBCT) | (0 << AVR32_SPI_CSR1_DLYBS)
				 | (2 << AVR32_SPI_CSR1_SCBR) | (AVR32_SPI_CSR1_BITS_16_BPT << AVR32_SPI_CSR1_BITS)
				 | AVR32_SPI_CSR1_NCPHA_MASK;
		AVR32_SPI.cr = AVR32_SPI_CR_SPIEN_MASK;
		
		// PDCAの初期化
		SPI_PDCA_TX.psr = AVR32_PDCA_PID_SPI_TX;
		SPI_PDCA_TX.tcrr = 0;
		SPI_PDCA_TX.mr = AVR32_PDCA_MR_SIZE_BYTE << AVR32_PDCA_MR_SIZE;
		SPI_PDCA_TX.cr = AVR32_PDCA_CR_TDIS_MASK;
		
		// セマフォ作成
		vSemaphoreCreateBinary(Semaphore);
		xSemaphoreGive(Semaphore);
	}
	
	// 占有権を取得する
	bool Open(void){
		portBASE_TYPE result;
		
		// セマフォを取る
		result = xSemaphoreTake(Semaphore, TASK_DELAY_MS(SPI_TIMEOUT));
		if (result == pdFALSE) return false;
	
		return true;
	}
	
	// 占有権を返す
	void Close(void){
		// セマフォを返す
		xSemaphoreGive(Semaphore);
	}
	
}
