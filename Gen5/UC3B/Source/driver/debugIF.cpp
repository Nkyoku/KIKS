/**	@file
	@brief デバッグインターフェース・PDIライター
*/

#include "debugIF.h"
#include "gpio.h"

#include "FreeRTOS.h"
#include "task.h"

#include "xprintf.h"

#include <string.h>



#define DEBUGIF_USART			AVR32_USART0			// デバッグインターフェースのチャンネル
#define DEBUGIF_TX_PDCA			(AVR32_PDCA.channel[4])	// 送信PDCAチャンネル
#define DEBUGIF_RX_PDCA			(AVR32_PDCA.channel[5])	// 受信PDCAチャンネル

#define DEBUGIF_TX_PDCA_IRQ		IRQ_PDCA4
#define DEBUGIF_RX_PDCA_IRQ		IRQ_PDCA5
#define DEBUGIF_TX_PDCA_PID		AVR32_PDCA_PID_USART0_TX
#define DEBUGIF_RX_PDCA_PID		AVR32_PDCA_PID_USART0_RX

#define PIN_PDI_CLK				PIN_DEBUG_TX
#define PIN_PDI_DATA			PIN_DEBUG_RX
#define PDI_CLK_FREQUENCY		100000



namespace nsDebugIF{
	
	const static int DEBUGIF_BAUDRATE	= 250000;		// ボーレート
	const static int DEBUGIF_TX_BUFSIZE	= 512;			// 送信バッファサイズ
	const static int DEBUGIF_RX_BUFSIZE	= 120;			// 受信バッファサイズ
	const static int DEBUGIF_RX_SHADOW_BUFSIZE	= 8;	// 受信シャドウバッファサイズ
	
	volatile bool m_PDIMode = false;		// PDIモードかどうか
	volatile bool m_NVMEnabled = false;		// NVMが有効かどうか
	
	// 送信リングバッファ
	struct Tx_t{
		char Buf[DEBUGIF_TX_BUFSIZE];
		int Size;
	} Tx[2] = {{{0}, 0}, {{0}, 0}};
	int Tx_TransBank = -1;
	int Tx_EmptyBank = 0;

	// 受信バッファ
	struct Rx_t{
		char Buf[DEBUGIF_RX_BUFSIZE];
		char ShadowBuf[DEBUGIF_RX_SHADOW_BUFSIZE];
		//volatile bool Use;
	} Rx = {{0}, {0}/*, false*/};
	
	



	// デバッグインターフェースを初期化
	void Init(void){
		DEBUGIF_USART.mr	= AVR32_USART_MR_ONEBIT_MASK
							| (AVR32_USART_MR_OVER_X16 << AVR32_USART_MR_OVER)
							| (AVR32_USART_MR_PAR_NONE << AVR32_USART_MR_PAR)
							| (AVR32_USART_MR_CHRL_8 << AVR32_USART_MR_CHRL);
		DEBUGIF_USART.brgr	= F_CPU / (16 * DEBUGIF_BAUDRATE);
	
		DEBUGIF_TX_PDCA.psr	= DEBUGIF_TX_PDCA_PID;
		DEBUGIF_RX_PDCA.psr	= DEBUGIF_RX_PDCA_PID;
		
		Int::Register(DEBUGIF_TX_PDCA_IRQ, (void*)OnTxPDCA, IL_HIGHEST);
		
		// 送受信許可
		DEBUGIF_USART.cr	= AVR32_USART_CR_RXEN_MASK | AVR32_USART_CR_TXEN_MASK;
		DEBUGIF_RX_PDCA.mar	= (int)Rx.Buf;
		DEBUGIF_RX_PDCA.tcr	= DEBUGIF_RX_BUFSIZE;
		DEBUGIF_TX_PDCA.tcrr= 0;
		DEBUGIF_TX_PDCA.tcr	= 0;
		DEBUGIF_TX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
		DEBUGIF_RX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
		DEBUGIF_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
		DEBUGIF_RX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	}

	// 送信PDCA割り込み
	IH OnTxPDCA(){
		int bank = Tx_TransBank;
		
		//if (max_transfer < Tx[ch].Size){
		//	max_transfer = Tx[ch].Size;	// バッファにたまったデータの最大値を記録
		//}		
		Tx[bank].Size = 0;
		if (0 < Tx[bank ^ 1].Size){
			// 別のバッファが空でないときはそちらを次に送信する
			DEBUGIF_TX_PDCA.marr	= (int)Tx[bank ^ 1].Buf;
			DEBUGIF_TX_PDCA.tcrr	= Tx[bank ^ 1].Size;
			Tx_TransBank = bank ^ 1;
			Tx_EmptyBank = bank;
		}else{
			// 別のバッファも空のときは送信を終える
			Tx_TransBank = -1;
			DEBUGIF_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
		}
	}
	
	// 書き込み
	void Write(char c){
		if (m_PDIMode == true) return;
		
		portENTER_CRITICAL();
	
		DEBUGIF_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	
		int bank = Tx_EmptyBank;
	
		if (Tx[bank].Size < DEBUGIF_TX_BUFSIZE){
			Tx[bank].Buf[Tx[bank].Size] = c;
			Tx[bank].Size++;
		
			if (Tx_TransBank < 0){
				// DMAが空いていたらDMAで送信
				Tx_TransBank = bank;
				Tx_EmptyBank = bank ^ 1;
			
				DEBUGIF_TX_PDCA.marr	= (int)Tx[bank].Buf;
				DEBUGIF_TX_PDCA.tcrr	= Tx[bank].Size;
				//DEBUGIF_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
			}
		}
	
		DEBUGIF_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
	
		portEXIT_CRITICAL();
		
		NOP();
	}
	
	// 複数データを書き込み
	void Write(const char *s, int len){
		if (m_PDIMode == true) return;
		for(int cnt = 0; cnt < len; cnt++)
			Write(*s++);
	}
	
	// 読み込みを始める
	int BeginRead(const char **s){
		if (m_PDIMode == true) return 0;
		
		int rxlen;
		
		/*if (Rx.Use == true){
			*s = NULL;
			return 0;
		}
		Rx.Use = true;*/
		
		// メインバッファへの転送を中断し、シャドウバッファへ切り替え
		DEBUGIF_RX_PDCA.cr	= AVR32_PDCA_CR_TDIS_MASK;
		rxlen = DEBUGIF_RX_BUFSIZE - DEBUGIF_RX_PDCA.tcr;
		DEBUGIF_RX_PDCA.mar	= (int)Rx.ShadowBuf;
		DEBUGIF_RX_PDCA.tcr	= DEBUGIF_RX_SHADOW_BUFSIZE;
		DEBUGIF_RX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
		
		*s = Rx.Buf;
		return rxlen;
	}
	
	// 読み込みを終える
	void EndRead(void){
		if (m_PDIMode == true) return;
		
		int rxlen;
		
		//if (Rx.Use == false) return;
		
		// シャドウバッファへの転送を中断
		DEBUGIF_RX_PDCA.cr	= AVR32_PDCA_CR_TDIS_MASK;
		rxlen = DEBUGIF_RX_SHADOW_BUFSIZE - DEBUGIF_RX_PDCA.tcr;
		
		// シャドウバッファからメインバッファへコピー
		memcpy(Rx.Buf, Rx.ShadowBuf, rxlen);
		
		// メインバッファへの転送を開始
		DEBUGIF_RX_PDCA.mar	= (int)Rx.Buf + rxlen;
		DEBUGIF_RX_PDCA.tcr	= DEBUGIF_RX_BUFSIZE - rxlen;
		DEBUGIF_RX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
		
		//Rx.Use = false;
	}
	
	
	
	
	
	namespace PDI{
		/*
			PDIモード
				PDI_DATA <- DEBUG_RX
				PDI_CLK <- DEBUG_TX
		*/
		
		// PDIモードを開始
		void EnterPDIMode(void){
			portENTER_CRITICAL();
			if (m_PDIMode == true){
				portEXIT_CRITICAL();
				return;
			}else{
				m_PDIMode = true;
				m_NVMEnabled = false;

				// UARTを停止
				DEBUGIF_TX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TDIS_MASK;
				DEBUGIF_USART.cr	= 0;

				// PDI_CLKを維持するためのタイマーを設定
				AVR32_TC.channel[2].cmr	= AVR32_TC_CMR0_WAVE_MASK
								| (AVR32_TC_CMR0_BSWTRG_CLEAR << AVR32_TC_CMR0_BSWTRG)
								| (AVR32_TC_CMR0_BCPC_CLEAR << AVR32_TC_CMR0_BCPC)
								| (AVR32_TC_CMR0_BCPB_SET << AVR32_TC_CMR0_BCPB)
								| (AVR32_TC_CMR0_EEVT_XC0_OUTPUT << AVR32_TC_CMR0_EEVT)
								| (AVR32_TC_CMR0_WAVSEL_UP_AUTO << AVR32_TC_CMR0_WAVSEL)
								| (AVR32_TC_CMR0_TCCLKS_TIMER_CLOCK3 << AVR32_TC_CMR0_TCCLKS);
				AVR32_TC.channel[2].rb = (F_CPU / 8) / PDI_CLK_FREQUENCY / 2;
				AVR32_TC.channel[2].rc = (F_CPU / 8) / PDI_CLK_FREQUENCY;
				
				// GPIOの設定を変更
				AVR32_GPIO.port[PIN_PDI_CLK >> 5].gpers	= (1 << (PIN_PDI_CLK & 0x1F)) | (1 << (PIN_PDI_DATA & 0x1F));	// PDIラインをGPIOに
				AVR32_GPIO.port[PIN_PDI_CLK >> 5].pmr0s	= (1 << (PIN_PDI_CLK & 0x1F));
				AVR32_GPIO.port[PIN_PDI_CLK >> 5].pmr1c	= (1 << (PIN_PDI_CLK & 0x1F));	// PDI_CLKをTC-B2に接続
				
				// PDIを有効にする
				SetOut(PIN_PDI_DATA, OUT_LOW);
				SetDir(PIN_PDI_DATA, DIR_OUT);
				Delay(1000);
				SetOut(PIN_PDI_DATA, OUT_HIGH);
				Delay(1000);
				SetOut(PIN_PDI_CLK, OUT_LOW);
				//Delay(100);
				RunCLK();
				Delay(2000);	// 16CLK以上待つ
				SetDir(PIN_PDI_DATA, DIR_IN);
			}
			portEXIT_CRITICAL();
		}

		// PDIモードを終了
		void ExitPDIMode(void){
			portENTER_CRITICAL();
			if (m_PDIMode == false){
				portEXIT_CRITICAL();
				return;
			}else{
				m_PDIMode = false;
				m_NVMEnabled = false;

				// PDIを無効にする
				PauseCLK();
				SetOut(PIN_PDI_CLK, OUT_HIGH);
				SetOut(PIN_PDI_DATA, OUT_LOW);
				SetDir(PIN_PDI_DATA, DIR_OUT);
				Delay(10000);
				SetOut(PIN_PDI_CLK, OUT_LOW);
				Delay(1000);
				SetOut(PIN_PDI_CLK, OUT_HIGH);
				
				// GPIOの設定を戻す
				AVR32_GPIO.port[PIN_PDI_CLK >> 5].pmr0c	= (1 << (PIN_PDI_CLK & 0x1F));
				AVR32_GPIO.port[PIN_PDI_CLK >> 5].pmr1s	= (1 << (PIN_PDI_CLK & 0x1F));	// PDI_CLKをUSARTに接続
				AVR32_GPIO.port[PIN_PDI_CLK >> 5].gperc	= (1 << (PIN_PDI_CLK & 0x1F)) | (1 << (PIN_PDI_DATA & 0x1F));	// PDIラインをペリフェラルに
				SetDir(PIN_PDI_DATA, DIR_IN);

				// UARTを有効にする
				DEBUGIF_USART.cr	= AVR32_USART_CR_RXEN_MASK | AVR32_USART_CR_TXEN_MASK;
				DEBUGIF_TX_PDCA.tcr	= 0;
				DEBUGIF_TX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
			}
			portEXIT_CRITICAL();
		}

		// 少し待つ
		void Delay(int cnt_){
			volatile int cnt = cnt_;
			while(0 < cnt--);
		}

		// 自動クロックを動かす
		void RunCLK(void){
			SetGPER(PIN_PDI_CLK, GPER_PER);
			AVR32_TC.channel[2].cmr &= ~AVR32_TC_CMR0_CPCDIS_MASK;
			AVR32_TC.channel[2].ccr = AVR32_TC_CCR0_SWTRG_MASK | AVR32_TC_CCR0_CLKEN_MASK;
		}
		
		// 自動クロックを止める
		void PauseCLK(void){
			AVR32_TC.channel[2].cmr |= AVR32_TC_CMR0_CPCDIS_MASK;
			while(AVR32_TC.channel[2].sr & AVR32_TC_SR0_CLKSTA_MASK);
			SetGPER(PIN_PDI_CLK, GPER_GPIO);
		}

		// PDIで1バイト送る
		void TxFrame(char data_){
			int data = (unsigned char)data_;
			
			// パリティを計算してフレームの形式にする
			int parity = 0;
			int sr = data;
			while(sr != 0){
				parity ^= sr & 0x1;
				sr >>= 1;
			}
			if (parity != 0)	data |= 0x700;
			else				data |= 0x600;
			data <<= 1;

			// フレームを転送
			SetDir(PIN_PDI_DATA, DIR_OUT);
			while(data != 0){
				if (data & 1)
					SetOut(PIN_PDI_DATA, OUT_HIGH);
				else
					SetOut(PIN_PDI_DATA, OUT_LOW);
				Delay(40);
				SetOut(PIN_PDI_CLK, OUT_HIGH);
				Delay(40);
				SetOut(PIN_PDI_CLK, OUT_LOW);
				data >>= 1;
			}
			Delay(40);
			SetDir(PIN_PDI_DATA, DIR_IN);
		}
		
		// PDIでBREAKを送る
		void TxBreak(void){
			SetOut(PIN_PDI_DATA, OUT_LOW);
			SetDir(PIN_PDI_DATA, DIR_OUT);
			for(int cnt = 24; 0 < cnt; cnt--){	// Two BREAK
				Delay(40);
				SetOut(PIN_PDI_CLK, OUT_HIGH);
				Delay(40);
				SetOut(PIN_PDI_CLK, OUT_LOW);
			}
			Delay(40);
			SetDir(PIN_PDI_DATA, DIR_IN);
		}

		// 方向を変えるための時間を待つ
		void ChangeDir(void){
			SetPull(PIN_PDI_DATA, PULL_NONE);
			
			for(int cnt = 2; 0 < cnt; cnt--){
				SetOut(PIN_PDI_CLK, OUT_HIGH);
				Delay(40);
				SetOut(PIN_PDI_CLK, OUT_LOW);
				Delay(40);
			}
		}

		// PDIで1バイト受け取る
		bool RxFrame(char *data_, int idle){
			int data = 0xFFF;
			
			// フレームを待ちつつ受信する
			int cnt = idle + 13;
			for(; 0 < cnt; cnt--){
				data >>= 1;
				if (GetIn(PIN_PDI_DATA) == IN_HIGH)
					data |= 0x800;
				SetOut(PIN_PDI_CLK, OUT_HIGH);
				Delay(40);
				SetOut(PIN_PDI_CLK, OUT_LOW);
				Delay(40);

				if ((data & 0xC01) == 0xC00) break;
			}
			if (cnt == 0) return false;
			
			SetPull(PIN_PDI_DATA, PULL_UP);
			
			// パリティをチェックはしない
			*data_ = (data >> 1) & 0xFF;
			return true;
		}

		// KEY命令を発行
		void KEY(void){
			portENTER_CRITICAL();
			if (m_PDIMode == false){
				portEXIT_CRITICAL();
				return;
			}else{
				PauseCLK();
				TxFrame(0b11100000);	// KEY
				TxFrame(0xFF);
				TxFrame(0x88);
				TxFrame(0xD8);
				TxFrame(0xCD);
				TxFrame(0x45);
				TxFrame(0xAB);
				TxFrame(0x89);
				TxFrame(0x12);		// 0x1289AB45CDD888FF
				RunCLK();
			}
			portEXIT_CRITICAL();
		}

		// LDCS命令を発行
		bool LDCS(int addr, char *data){
			portENTER_CRITICAL();
			if (m_PDIMode == false){
				portEXIT_CRITICAL();
				return false;
			}

			bool status;

			PauseCLK();
			TxFrame(0x80 | (addr & 0xF));	// LDCS
			ChangeDir();
			status = RxFrame(data, 256);
			RunCLK();

			portEXIT_CRITICAL();
			
			return status;
		}

		// STCS命令を発行
		void STCS(int addr, char data){
			portENTER_CRITICAL();
			if (m_PDIMode == false){
				portEXIT_CRITICAL();
				return;
			}else{
				PauseCLK();
				TxFrame(0xC0 | (addr & 0xF));	// STCS
				TxFrame(data);
				RunCLK();
			}
			portEXIT_CRITICAL();
		}

		// LDS命令を発行
		bool LDS(int addr, char *data){
			portENTER_CRITICAL();
			if (m_PDIMode == false){
				portEXIT_CRITICAL();
				return false;
			}

			bool status;
			
			PauseCLK();
			TxFrame(0x0C);		// LDS 1byte
			TxFrame(addr & 0xFF);
			TxFrame((addr >> 8) & 0xFF);
			TxFrame((addr >> 16) & 0xFF);
			TxFrame((addr >> 24) & 0xFF);
			ChangeDir();
			status = RxFrame(data, 256);
			RunCLK();

			portEXIT_CRITICAL();
			
			return status;
		}

		// STS命令を発行
		void STS(int addr, char data){
			portENTER_CRITICAL();
			if (m_PDIMode == false){
				portEXIT_CRITICAL();
				return;
			}else{
				PauseCLK();
				TxFrame(0x4C);	// STS 1byte
				TxFrame(addr & 0xFF);
				TxFrame((addr >> 8) & 0xFF);
				TxFrame((addr >> 16) & 0xFF);
				TxFrame((addr >> 24) & 0xFF);
				TxFrame(data);
				RunCLK();
			}
			portEXIT_CRITICAL();
		}

		// NVMへのアクセスを開始する
		bool EnterNVM(void){
			if (m_PDIMode == false) return false;
			if (m_NVMEnabled == true) return true;
			
			char data;
			bool result;
			
			// リセットする
			xprintf("PDI Reset\n");
			STCS(0x01, 0x59);	// リセット
			if (LDCS(0x01, &data) == false) return false;	// リセットを確認
			if (data != 1) return false;
			
			// NVMキーをセット
			xprintf("Send NVM Key\n");
			KEY();
			for(int cnt = 100; 0 < cnt; cnt--){
				result = LDCS(0x00, &data);	// NVMENを確認
				if (result == false) break;
				if (data & 0x02) break;
			}
			if (result == false) return false;	
			if (~data & 0x02) return false;
			
			// ヒューズ読み出し
			xprintf("Reading Fuse Bits\n");
			STS(0x010001CA, 0x07);	// NVM_CMD <= READ_FUSE
			for(int cnt = 0; cnt < 6; cnt++){
				if (cnt == 3) continue;
				data = 0xA5;
				LDS(0x008F0020 + cnt, &data);
				xprintf("Fuse%d:0x%02X\n", cnt, data);
			}
			STS(0x010001CA, 0x00);	// NVM_CMD <= NOP
			
			m_NVMEnabled = true;
			return true;
		}
		
		// NVMへのアクセスを終了する
		bool ExitNVM(void){
			if (m_NVMEnabled == true){
				STCS(0x01, 0x00);	// リセット解除
				m_NVMEnabled = false;
			}
			return true;
		}
		
		// NVM_BUSYを待つ
		bool NVMWait(void){
			if (m_PDIMode == false) return false;
			if (m_NVMEnabled == false) return true;
			
			bool result;
			char data;
			for(int cnt = 10000; 0 < cnt; cnt--){
				result = LDS(0x010001CF, &data);	// STATUSを確認
				if (result == false) break;
				if (~data & 0x80) break;	// NVMBUSYフラグをチェック
			}			
			if (result == false) return false;
			if (data & 0x80) return false;
			return true;
		}
		
		// NVMでページ書き込み
		bool NVMWritePage(int page, const void *data_){
			if (m_NVMEnabled == false) return false;
			if (page < 0) return false;
			if ((APP_PAGES + DFU_PAGES) <= page) return false;
			
			bool result;
			int base_addr;
			const char *data = (const char*)data_;
			
			// ページバッファをクリア
			STS(0x010001CA, 0x26);	// NVM_CMD <= ERASE_FLASH_PAGE_BUFFER
			STS(0x010001CB, 0x01);	// NVM_CTRLA <= CMDEX
			if (NVMWait() == false){
				STS(0x010001CA, 0x00);	// NVM_CMD <= NOP
				return false;
			}
			
			// ページバッファを満たす
			base_addr = 0x00800000 + PAGE_SIZE * page;
			STS(0x010001CA, 0x23);	// NVM_CMD <= LOAD_FLASH_PAGE_BUFFER
			for(int cnt = 0; cnt < PAGE_SIZE; cnt++){
				STS(base_addr + cnt, *data++);
			}
			
			// ページ消去と書き込み
			if (page < APP_PAGES){
				// APP領域
				STS(0x010001CA, 0x25);	// NVM_CMD <= ERASE_AND_WRITE_APPLICATION_SECTION_PAGE
			}else{
				// DFU領域
				STS(0x010001CA, 0x2D);	// NVM_CMD <= ERASE_AND_WRITE_BOOTLOADER_SECTION_PAGE
			}
			xprintf("WR(%08X)\n", base_addr);
			STS(base_addr, 0x00);
			result = NVMWait();
			STS(0x010001CA, 0x00);	// NVM_CMD <= NOP
			
			return result;
		}
		
		// NVMでフラッシュ読み出し
		bool NVMReadFlash(int addr, void *data_, int length){
			if (m_NVMEnabled == false) return false;
			if (addr < 0) return false;
			//if (FLASH_SIZE < addr) return false;
			
			bool result = false;
			char *data = (char*)data_;
			
			addr += 0x00800000;
			STS(0x010001CA, 0x43);	// NVM_CMD <= READ_NVM
			for(int cnt = 0; cnt < length; cnt++){
				result = LDS(addr++, data++);
				if (result == false) break;
			}
			STS(0x010001CA, 0x00);	// NVM_CMD <= NOP
			
			return result;
		}

		// NVMでチップイレース
		bool NVMChipErase(void){
			if (m_NVMEnabled == false) return false;
			
			bool result = false;

			// チップイレース
			STS(0x010001CA, 0x40);	// NVM_CMD <= CHIP_ERASE
			STS(0x010001CB, 0x01);	// NVM_CTRLA <= CMDEX
			for(int cnt = 1000; 0 < cnt; cnt--){
				result = NVMWait();	
				if (result == true) break;
			}
			STS(0x010001CA, 0x00);	// NVM_CMD <= NOP
			
			return result;
		}

		// NVMでヒューズビット書き込み
		bool NVMWriteFuse(int fuse, int byte){
			if (m_NVMEnabled == false) return false;
			
			bool result = false;
			
			// ヒューズ書き込み
			STS(0x010001CA, 0x4C);	// NVM_CMD <= WRITE_FUSE
			STS(0x008F0020 + fuse, byte);
			for(int cnt = 1000; 0 < cnt; cnt--){
				result = NVMWait();	
				if (result == true) break;
			}
			STS(0x010001CA, 0x00);	// NVM_CMD <= NOP
			
			return result;
		}

		// NVMでヒューズビット読み込み
		bool NVMReadFuse(int fuse, int *byte){
			if (m_NVMEnabled == false) return false;
			
			bool result = false;
			char data = 0xA5;
			
			// ヒューズ読み込み
			STS(0x010001CA, 0x07);	// NVM_CMD <= READ_FUSE
			result = LDS(0x008F0020 + fuse, &data);
			*byte = (unsigned char)data;
			STS(0x010001CA, 0x00);	// NVM_CMD <= NOP
			
			return result;
		}
		
		
		
	}
	
	

}
