/**	@file
	@brief キッカーボードとの通信
*/

#include "kicker.h"
#include "gpio.h"

#include "FreeRTOS.h"
#include "task.h"

#include "xprintf.h"

#include <string.h>



#define KICKER_USART		AVR32_USART2			// USARTのチャンネル
#define KICKER_TX_PDCA		(AVR32_PDCA.channel[2])	// 送信PDCAチャンネル
#define KICKER_RX_PDCA		(AVR32_PDCA.channel[3])	// 受信PDCAチャンネル

#define KICKER_TX_PDCA_PID	AVR32_PDCA_PID_USART2_TX
#define KICKER_RX_PDCA_PID	AVR32_PDCA_PID_USART2_RX



namespace Kicker{
	
	const static int KICKER_BAUDRATE	= 250000;		// ボーレート
	const static int KICKER_TX_BUFSIZE	= 128;			// 送信バッファサイズ
	const static int KICKER_RX_BUFSIZE	= 112;			// 受信バッファサイズ
	const static int KICKER_RX_SHADOW_BUFSIZE	= 16;	// 受信シャドウバッファサイズ
	const static int KICKER_RX_PACKETSIZE	= 64;		// 受信パケットサイズ
	
	// 送信バッファ
	struct Tx_t{
		char Buf[KICKER_TX_BUFSIZE];
	} Tx;
	
	// 受信バッファ
	struct Rx_t{
		char Buf[KICKER_RX_BUFSIZE];
		char ShadowBuf[KICKER_RX_SHADOW_BUFSIZE];
	} Rx;
	
	
	
	
	// キッカーとの通信ポートを初期化
	void Init(void){
		KICKER_USART.mr		= AVR32_USART_MR_ONEBIT_MASK
							| (AVR32_USART_MR_OVER_X16 << AVR32_USART_MR_OVER)
							| (AVR32_USART_MR_PAR_NONE << AVR32_USART_MR_PAR)
							| (AVR32_USART_MR_CHRL_8 << AVR32_USART_MR_CHRL);
		KICKER_USART.brgr	= F_CPU / (16 * KICKER_BAUDRATE);
		
		KICKER_TX_PDCA.psr	= KICKER_TX_PDCA_PID;
		KICKER_RX_PDCA.psr	= KICKER_RX_PDCA_PID;
		
		// 送受信許可
		KICKER_USART.cr		= AVR32_USART_CR_RXEN_MASK | AVR32_USART_CR_TXEN_MASK;
		KICKER_RX_PDCA.mar	= (int)Rx.Buf;
		KICKER_RX_PDCA.tcr	= KICKER_RX_BUFSIZE;
		KICKER_TX_PDCA.tcrr	= 0;
		KICKER_TX_PDCA.tcr	= 0;
		KICKER_TX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
		KICKER_RX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
		KICKER_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
		KICKER_RX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	}

	// データを送る
	void Transmit(const void *data, int len){
		while((KICKER_TX_PDCA.isr & (AVR32_PDCA_ISR_TERR_MASK | AVR32_PDCA_ISR_TRC_MASK)) == 0);
		
		portENTER_CRITICAL();
		while((KICKER_TX_PDCA.isr & (AVR32_PDCA_ISR_TERR_MASK | AVR32_PDCA_ISR_TRC_MASK)) == 0);
		
		memcpy(Tx.Buf, data, len);
		KICKER_TX_PDCA.marr	= (int)Tx.Buf;
		KICKER_TX_PDCA.tcrr	= len;
		
		portEXIT_CRITICAL();
	}
	
	// 読み込みを始める
	int BeginRead(const char **s){
		int rxlen;
		
		// メインバッファへの転送を中断し、シャドウバッファへ切り替え
		KICKER_RX_PDCA.cr	= AVR32_PDCA_CR_TDIS_MASK;
		rxlen = KICKER_RX_BUFSIZE - KICKER_RX_PDCA.tcr;
		KICKER_RX_PDCA.mar	= (int)Rx.ShadowBuf;
		KICKER_RX_PDCA.tcr	= KICKER_RX_SHADOW_BUFSIZE;
		KICKER_RX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
		
		*s = Rx.Buf;
		return rxlen;
	}
	
	// 読み込みを終える
	void EndRead(void){
		int rxlen;
		
		// シャドウバッファへの転送を中断
		KICKER_RX_PDCA.cr	= AVR32_PDCA_CR_TDIS_MASK;
		rxlen = KICKER_RX_SHADOW_BUFSIZE - KICKER_RX_PDCA.tcr;
		
		// シャドウバッファからメインバッファへコピー
		memcpy(Rx.Buf, Rx.ShadowBuf, rxlen);
		
		// メインバッファへの転送を開始
		KICKER_RX_PDCA.mar	= (int)Rx.Buf + rxlen;
		KICKER_RX_PDCA.tcr	= KICKER_RX_BUFSIZE - rxlen;
		KICKER_RX_PDCA.cr	= AVR32_PDCA_CR_ECLR_MASK | AVR32_PDCA_CR_TEN_MASK;
	}









}

