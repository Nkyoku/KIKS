/**	@file
	@brief SPIフラッシュ MX25L6445Eの制御
*/

#include "mx25l6445e.h"
#include "gpio.h"
#include "spi.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "xprintf.h"

#include <string.h>



#define DEBUG_MESSAGE	0



namespace SPIFlash{
	
	
	const static int TIMEOUT	= 2000;	// ページ消去の待ち時間
	
	volatile bool Implement = true;		// MX25L6445Eが実装されている
	xSemaphoreHandle Semaphore;			// アクセス中のセマフォ
	
	
	
	// 初期化
 	void Init(void){
		// セマフォ作成
		vSemaphoreCreateBinary(Semaphore);
		xSemaphoreGive(Semaphore);
		
		// 実装されているか調べる
		do{
			unsigned int data = 0;
			
			// デバイスIDの比較
			if (IntCommandRead(0x9F, &data, 3) == false) break;	// 0x9F Read Identification
			if (data != 0xC2201700) break;
			
			// プロテクトがかかっていないことの確認
			if ((IntReadStatus() & 0xFC) != 0x00) break;
			
			// 書き込みを禁止する
			if (IntCommandWrite(0x04) == false) break;	// 0x04 Write Disable
			
			return;
		}while(false);
		Implement = false;
	}
	
	// 占有権を取得する
	bool IntOpen(void){
		portBASE_TYPE result;
	
		// セマフォを取る
		result = xSemaphoreTake(Semaphore, SPI_TIMEOUT);
		if (result == pdFALSE) return false;
	
		return true;
	}
	
	// 占有権を返す
	void IntClose(void){
		// セマフォを返す
		xSemaphoreGive(Semaphore);
	}
	
	// 短いコマンドを発行(書き込み系)
	bool IntCommandWrite(int command, const void *data_, int length){
		if (Implement == false) return false;
		if (SPI::Open() == false) return false;
		
		const char *data = (const char*)data_;
		
		SetOut(PIN_FLASH_nCS, OUT_LOW);
		Barrier();
		SPI::SetMode(SPI::MODE_8BIT);
		Barrier();
		
		AVR32_SPI.tdr = command;
		while(~AVR32_SPI.sr & AVR32_SPI_SR_TDRE_MASK);
		while(0 < length--){
			AVR32_SPI.tdr = *data++;
			while(~AVR32_SPI.sr & AVR32_SPI_SR_TDRE_MASK);
		}
		while(~AVR32_SPI.sr & AVR32_SPI_SR_TXEMPTY_MASK);
		
		Barrier();
		SetOut(PIN_FLASH_nCS, OUT_HIGH);

		SPI::Close();
		return true;
	}
	
	// 短いコマンドを発行(読み込み系)
	bool IntCommandRead(int command, void *data_, int length){
		if (Implement == false) return false;
		if (SPI::Open() == false) return false;
		
		char *data = (char*)data_;
		
		// たまにDMAリードが失敗するので、ここでは確実性を高めるためにCPUが直に読み出す
		SetOut(PIN_FLASH_nCS, OUT_LOW);
		Barrier();
		SPI::SetMode(SPI::MODE_8BIT);
		Barrier();
		
		AVR32_SPI.rdr;
		AVR32_SPI.tdr = command;
		while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
		AVR32_SPI.rdr;
		
		while(0 < length--){
			AVR32_SPI.tdr = 0x00;
			while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
			*data++ = AVR32_SPI.rdr;
		}		
		
		SetOut(PIN_FLASH_nCS, OUT_HIGH);
		
		SPI::Close();
		return true;
	}
	
	// ステータスを確認
	int IntReadStatus(void){
		if (Implement == false) return 0xBD;
		if (SPI::Open() == false) return 0xBD;	// タイムアウト時は、すべて無効なステータスを返す
		
		int status;
		
		// ここでもCPUが直に読み出す
		SetOut(PIN_FLASH_nCS, OUT_LOW);
		Barrier();
		SPI::SetMode(SPI::MODE_8BIT);
		Barrier();
		
		AVR32_SPI.rdr;
		AVR32_SPI.tdr = 0x05;	// 0x05 Read Status Register
		while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
		AVR32_SPI.rdr;
		
		AVR32_SPI.tdr = 0x00;
		while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
		status = AVR32_SPI.rdr & 0xFF;
		
		SetOut(PIN_FLASH_nCS, OUT_HIGH);
		
		SPI::Close();
		return status;
	}
	
	// 書き込み・消去が終わるのを待つ
	bool IntWait(void){
		for(int cnt = TIMEOUT; IntReadStatus() & 0x01; cnt -= 1){
			if (cnt <= 0) return false;	// タイムアウト
			vTaskDelay(TASK_DELAY_MS(1));
		}
		return true;
	}
	
	// 消去コマンドを発行
	bool IntErase(int header){
		if (Implement == false) return false;
		if (IntOpen() == false) return false;
		
		// ステータスを確認
		if (IntWait() == false){IntClose(); return false;}
		
		// WELビットを立てる
		if (IntCommandWrite(0x06) == false){IntClose(); return false;}	// 0x06 Write Enable
		
		// なにかを消去
		{
			if (SPI::Open() == false){IntClose(); return false;}
			
			SetOut(PIN_FLASH_nCS, OUT_LOW);
			Barrier();
			SPI::SetMode(SPI::MODE_16BIT);
			SPI::SetupTxDMA(&header, 2);
			SPI::StartDMA();
			SPI::WaitTxDMA();
			SPI::StopDMA();
			Barrier();
			SetOut(PIN_FLASH_nCS, OUT_HIGH);
		
			SPI::Close();
		}
		
		IntClose();
		return true;
	}
	
	
	
	// 書き込み・消去の処理中か確認
	bool IsProcessing(void){
		if (Implement == false) return false;
		if (IntOpen() == false) return false;
		int status = IntReadStatus();
		IntClose();
		return status & 0x01;
	}
	
	// 書き込み・消去の完了を待つ
	bool Wait(void){
#if DEBUG_MESSAGE
		xprintf("wait()\n");
#endif
		if (Implement == false) return false;
		if (IntOpen() == false) return false;
		bool result;
		result = IntWait();
		IntClose();
		return result;
	}
	
	// データを書き込む
	bool Write(int address, const void *data, int length){
#if DEBUG_MESSAGE
		xprintf("wr(%X,%X)\n", address, length);
#endif
		if (Implement == false) return false;
		if (IntOpen() == false) return false;
		
		// ステータスを確認
		if (IntWait() == false){IntClose(); return false;}
		
		if (READ_ONLY == false){
			// WELビットを立てる
			if (IntCommandWrite(0x06) == false){IntClose(); return false;}	// 0x06 Write Enable
		
			// 書き込み
			{
				if (SPI::Open() == false){IntClose(); return false;}
			
				int header = 0x02000000 | (address & 0x00FFFFFF);	// 0x02 Program Page
			
				SetOut(PIN_FLASH_nCS, OUT_LOW);
				Barrier();
				if (length & 1){
					// 奇数バイト書き込み
					SPI::SetMode(SPI::MODE_8BIT);
					SPI::SetupTxDMA(&header, 4);
					SPI::SetupTxDMA(data, length);
				}else{
					// 偶数バイト書き込み
					SPI::SetMode(SPI::MODE_16BIT);
					SPI::SetupTxDMA(&header, 2);
					SPI::SetupTxDMA(data, length / 2);
				}
				Barrier();
				SPI::StartDMA();
				SPI::WaitTxDMA();
				SPI::StopDMA();
				Barrier();
				SetOut(PIN_FLASH_nCS, OUT_HIGH);
			
				SPI::Close();
			}
		}
		
		IntClose();
		return true;
	}
	
	// データを読み込む
	bool Read(int address, void *data, int length){
#if DEBUG_MESSAGE
		xprintf("rd(%X,%X)\n", address, length);
#endif
		if (Implement == false) return false;
		if (IntOpen() == false) return false;
		if (IntWait() == false){IntClose(); return false;}
		if (SPI::Open() == false){IntClose(); return false;}
		
		int header = 0x03000000 | (address & 0x00FFFFFF);	// 0x03 Read Data Bytes
		
		// ヘッダーはDMAで送信
		// DMA受信は不安定なので、データの受信はCPUが直接行う
		SetOut(PIN_FLASH_nCS, OUT_LOW);
		Barrier();
		SPI::SetMode(SPI::MODE_16BIT);
		SPI::SetupTxDMANew(&header, 2);
		Barrier();
		SPI::StartDMA();
		SPI::WaitTxDMA();
		SPI::StopDMA();
		Barrier();
		AVR32_SPI.rdr;
		while(0 < length){
			if (length == 1){
				// 最後の1バイト
				SPI::SetMode(SPI::MODE_8BIT);
				AVR32_SPI.tdr = 0xFF;
				while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
				*(char*)data = AVR32_SPI.rdr;
				break;
			}else{
				// 偶数バイトずつ読み出し
				AVR32_SPI.tdr = 0xFFFF;
				while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
				*(short*)data = AVR32_SPI.rdr;
				data = (short*)data + 1;
				length -= 2;
			}
		}
		SetOut(PIN_FLASH_nCS, OUT_HIGH);
		
		SPI::Close();
		IntClose();
		return true;
	}

	// セクターに書き込む
	bool SectorWrite(unsigned int sector, const void *data){
#if DEBUG_MESSAGE
		xprintf("sw(%X)\n", sector);
#endif
		
		unsigned int address = SECTOR_SIZE * sector;
		bool result = true;
		
		int need_erase = 0;								// セクターの消去が必要
		int need_write[SECTOR_SIZE / PAGE_SIZE] = {0};	// データの書き込みが必要
		
		// セクター消去・ページ書き込みが必要か調べる
		{
			if (Implement == false) return false;
			if (IntOpen() == false) return false;
			if (IntWait() == false){IntClose(); return false;}
			if (SPI::Open() == false){IntClose(); return false;}
			
			int header = 0x03000000 | (address & 0x00FFFFFF);	// 0x03 Read Data Bytes
			const short *compare = (const short*)data;
			
			// ヘッダーはDMAで送信
			// DMA受信は不安定なので、データの受信はCPUが直接行う
			SetOut(PIN_FLASH_nCS, OUT_LOW);
			Barrier();
			SPI::SetMode(SPI::MODE_16BIT);
			SPI::SetupTxDMANew(&header, 2);
			Barrier();
			SPI::StartDMA();
			SPI::WaitTxDMA();
			SPI::StopDMA();
			Barrier();
			AVR32_SPI.rdr;
			for(int cnt = 0; cnt < SECTOR_SIZE; cnt += 2){
				int *write;
				
				// 偶数バイトずつ読み出し
				AVR32_SPI.tdr = 0xFFFF;
				Barrier();
				write =	need_write + (cnt / PAGE_SIZE);	// 転送の暇に現在のページを計算
				Barrier();
				while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
				short a = AVR32_SPI.rdr, b = *compare++;
				need_erase |= (a & b) - b;
				*write |= a - b;
			}
			SetOut(PIN_FLASH_nCS, OUT_HIGH);
			
			SPI::Close();
			IntClose();
		}
		
		// 必要ならセクター消去
		if (need_erase != 0){
#if DEBUG_MESSAGE
			xprintf("se(%X)\n", sector);
#endif
			SectorErase(sector);
#if DEBUG_MESSAGE
			if (result == false){
				xprintf("se(%X) error\n", sector);
			}
#endif
		}
		
		if (result == true){
			// 必要なページに書き込み
			// セクター消去が行われた場合は必ず書き込む
			for(int page = 0; page < (SECTOR_SIZE / PAGE_SIZE); page++){
				if ((need_write[page] | need_erase) != 0){
					result = Write(address, data, PAGE_SIZE);
					if (result == false) break;
				}
				data = (const char*)data + PAGE_SIZE;
				address += PAGE_SIZE;
			}
		}
		
		/*
#if DEBUG_MESSAGE
		xprintf("se(%X)\n", sector);
#endif
		SectorErase(sector);
		if (result == false){
#if DEBUG_MESSAGE
			xprintf("se(%X) error\n", sector);
#endif
		}
		
		for(int page = 0; page < (SECTOR_SIZE / PAGE_SIZE); page++){
			result = Write(address, data, PAGE_SIZE);
			if (result == false) break;
			data = (const char*)data + PAGE_SIZE;
			address += PAGE_SIZE;
		}
		if (result == false){
#if DEBUG_MESSAGE
			xprintf("sw(%X) error\n", sector);
#endif
		}*/
		
		return result;
	}
	
}


