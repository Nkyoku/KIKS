/**	@file
	@brief ベースボードとの通信
*/

#include "uart.h"

#include <string.h>



#define UART_USART			USARTD0			// UARTのチャンネル

#define UART_TX_DMA_BIT		DMA_CH0TRNIF_bm
#define UART_TX_DMA			DMA.CH0
#define UART_TX_DMA_vect	DMA_CH0_vect
#define UART_TX_DMA_TRIG	DMA_CH_TRIGSRC_USARTD0_DRE_gc

#define UART_RX_vect		USARTD0_RXC_vect


namespace UART{
	
	const static long UART_BAUDRATE		= 250000;		// ボーレート
	const static char UART_TX_BUFSIZE	= 64;			// 送信バッファサイズ
	const static char UART_RX_BUFSIZE	= 56;			// 受信バッファサイズ
	const static char UART_RX_SHADOW_BUFSIZE	= 8;	// 受信シャドウバッファサイズ
	
	
	// 送信リングバッファ
	struct Tx_t{
		char Buf[UART_TX_BUFSIZE];
		unsigned char Size;
	};
	Tx_t Tx[2];
	char Tx_TransBank = -1;
	char Tx_EmptyBank = 0;

	// 受信バッファ
	struct Rx_t{
		char Buf[UART_RX_BUFSIZE];
		char ShadowBuf[UART_RX_SHADOW_BUFSIZE];
		unsigned char  Next;
		bool Shadow;
	};
	Rx_t Rx;
	



	// デバッグインターフェースを初期化
	void Init(void){
		// UARTの初期化
		UART_USART.CTRLC = USART_CHSIZE_8BIT_gc;
		UART_USART.BAUDCTRLA = F_CPU / (16 * UART_BAUDRATE) - 1;
		UART_USART.BAUDCTRLB = 0;
		UART_USART.CTRLB = USART_RXEN_bm | USART_TXEN_bm;
		UART_USART.CTRLA = USART_RXCINTLVL_HI_gc;

		// 送信DMAの初期化
		UART_TX_DMA.CTRLB		= DMA_CH_TRNINTLVL_HI_gc;
		UART_TX_DMA.ADDRCTRL	= DMA_CH_SRCRELOAD_BLOCK_gc | DMA_CH_SRCDIR_INC_gc | DMA_CH_DESTRELOAD_NONE_gc | DMA_CH_DESTDIR_FIXED_gc;
		UART_TX_DMA.TRIGSRC		= UART_TX_DMA_TRIG;
		UART_TX_DMA.DESTADDR0	= (unsigned short)&UART_USART.DATA & 0xFF;
		UART_TX_DMA.DESTADDR1	= (unsigned short)&UART_USART.DATA >> 8;
		UART_TX_DMA.DESTADDR2	= 0;
	}

	// 送信DMA割り込み
	ISR(UART_TX_DMA_vect){
		DMA.INTFLAGS = UART_TX_DMA_BIT;
		
		/*char bank = Tx_TransBank;
		Tx_t *front_bank, *back_bank;
		if (bank == 0){
			front_bank = &Tx[0];
			back_bank = &Tx[1];
		}else{
			front_bank = &Tx[1];
			back_bank = &Tx[0];
		}
		
		front_bank->Size = 0;
		if (0 < back_bank->Size){
			// 別のバッファが空でないときはそちらを次に送信する
			UART_TX_DMA.SRCADDR0	= (unsigned short)back_bank->Buf;
			UART_TX_DMA.SRCADDR1	= (unsigned short)back_bank->Buf >> 8;
			UART_TX_DMA.SRCADDR2	= 0;
			UART_TX_DMA.TRFCNT		= back_bank->Size;
			UART_TX_DMA.CTRLA		= DMA_CH_ENABLE_bm | DMA_CH_SINGLE_bm | DMA_CH_BURSTLEN_1BYTE_gc;
			Tx_TransBank = bank ^ 1;
			Tx_EmptyBank = bank;
		}else{
			// 別のバッファも空のときは送信を終える
			Tx_TransBank = -1;
		}*/
		unsigned char bank = Tx_TransBank;
		Tx[bank].Size = 0;
		if (0 < Tx[bank ^ 1].Size){
			// 別のバッファが空でないときはそちらを次に送信する
			UART_TX_DMA.SRCADDR0	= (unsigned short)Tx[bank ^ 1].Buf;
			UART_TX_DMA.SRCADDR1	= (unsigned short)Tx[bank ^ 1].Buf >> 8;
			UART_TX_DMA.SRCADDR2	= 0;
			UART_TX_DMA.TRFCNT		= Tx[bank ^ 1].Size;
			UART_TX_DMA.CTRLA		= DMA_CH_ENABLE_bm | DMA_CH_SINGLE_bm | DMA_CH_BURSTLEN_1BYTE_gc;
			Tx_TransBank = bank ^ 1;
			Tx_EmptyBank = bank;
		}else{
			// 別のバッファも空のときは送信を終える
			Tx_TransBank = -1;
		}
	}
	
	// 書き込み
	void Write(char c){
		CriticalSection{
			/*char bank = Tx_EmptyBank;
			Tx_t *empty_bank;
			if (bank == 0){
				empty_bank = &Tx[0];
			}else{
				empty_bank = &Tx[1];
			}
			if (empty_bank->Size < UART_TX_BUFSIZE){
				empty_bank->Buf[empty_bank->Size] = c;
				empty_bank->Size++;

				if (Tx_TransBank < 0){
					// DMAが空いていたらDMAで送信
					Tx_TransBank = bank;
					Tx_EmptyBank = bank ^ 1;
					UART_TX_DMA.SRCADDR0	= (unsigned short)empty_bank->Buf;
					UART_TX_DMA.SRCADDR1	= (unsigned short)empty_bank->Buf >> 8;
					UART_TX_DMA.SRCADDR2	= 0;
					UART_TX_DMA.TRFCNT		= empty_bank->Size;
					UART_TX_DMA.CTRLA		= DMA_CH_ENABLE_bm | DMA_CH_SINGLE_bm | DMA_CH_BURSTLEN_1BYTE_gc;
				}
			}*/
			unsigned char bank = Tx_EmptyBank;
			if (Tx[bank].Size < UART_TX_BUFSIZE){
				Tx[bank].Buf[Tx[bank].Size] = c;
				Tx[bank].Size++;

				if (Tx_TransBank < 0){
					// DMAが空いていたらDMAで送信
					Tx_TransBank = bank;
					Tx_EmptyBank = bank ^ 1;
					UART_TX_DMA.SRCADDR0	= (unsigned short)Tx[bank].Buf;
					UART_TX_DMA.SRCADDR1	= (unsigned short)Tx[bank].Buf >> 8;
					UART_TX_DMA.SRCADDR2	= 0;
					UART_TX_DMA.TRFCNT		= Tx[bank].Size;
					UART_TX_DMA.CTRLA		= DMA_CH_ENABLE_bm | DMA_CH_SINGLE_bm | DMA_CH_BURSTLEN_1BYTE_gc;
				}
			}
		}
	}
	
	// 複数データを書き込み
	void Write(const char *s){
		while(true){
			char c = *s++;
			if (c == '\0') break;
			Write(c);
		}	
	}
	
	// 受信割り込み
	ISR(UART_RX_vect){
		UART_USART.STATUS;
		char c = UART_USART.DATA;
		unsigned char rxlen = Rx.Next;
		if (Rx.Shadow == false){
			if (rxlen < UART_RX_BUFSIZE){
				Rx.Buf[rxlen] = c;
				Rx.Next = rxlen + 1;
			}
		}else{
			if (rxlen < UART_RX_SHADOW_BUFSIZE){
				Rx.ShadowBuf[rxlen] = c;
				Rx.Next = rxlen + 1;
			}
		}
	}

	// 読み込みを始める
	unsigned short BeginRead(const char **s){
		unsigned char rxlen;
		
		EnterCritical();
		
		rxlen = Rx.Next;
		Rx.Next = 0;
		Rx.Shadow = true;
		
		LeaveCritical();

		*s = Rx.Buf;
		return rxlen;
	}
	
	// 読み込みを終える
	void EndRead(void){
		CriticalSection{
			// シャドウバッファからメインバッファへコピー
			memcpy(Rx.Buf, Rx.ShadowBuf, Rx.Next);
			Rx.Shadow = false;
		}
	}
	


}
