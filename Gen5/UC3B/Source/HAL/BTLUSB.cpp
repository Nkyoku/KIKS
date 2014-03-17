/**	@file
	@brief USBデータ転送デバイスの仮想化
	       Bulk Transport Layer
*/

#include "BTLUSB.h"
#include "../driver/usb.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "xprintf.h"
#include "../misc/misc.h"

#include <string.h>



// BTLデバイス
clBTLUSB btlUSB;	// USB BTL



// リセット
void clBTLUSB::Reset(void){
	portENTER_CRITICAL();
	
	memset(const_cast<Tx_t*>(&m_Tx), 0x00, sizeof(Tx_t));
	memset(const_cast<Rx_t*>(&m_Rx), 0x00, sizeof(Rx_t));
	
	portEXIT_CRITICAL();
}

// デバイスから送信時に呼ばれる(ISR内)
bool clBTLUSB::CallbackTx(char *fifo, int *len){
	unsigned int size = m_Tx.Size;
	if (0 < size){
		if (fifo != NULL){
			// キュー内のインデックスを計算
			unsigned int index = LowerWrap(m_Tx.Next - size, TX_QUEUELEVEL);
			m_Tx.Size = size - 1;
			
			// サイズを取得
			const char *buf = (const char*)m_Tx.Buf[index];
			const SPACKET_t *spacket = (const SPACKET_t*)m_Tx.Buf[index];
			int cnt = HEADER_LENGTH + spacket->Length;
			if (len != NULL) *len = cnt;
			
			// データをコピー(memcpyしてはいけない)
			while(0 < cnt--){
				*fifo++ = *buf++;
			}
		}
		return true;
	}else{
		return false;
	}
}

// デバイスから受信時に呼ばれる(ISR内)
bool clBTLUSB::CallbackRx(const char *fifo, int len){
	unsigned int size = m_Rx.Size + 1;
	if (size <= RX_QUEUELEVEL){
		if (fifo != NULL){
			m_Rx.Size = size;
			
			// データをコピー(memcpyしてはいけない)
			int next = m_Rx.Next, cnt = len;
			char *buf, *buf_ = (char*)m_Rx.Buf[next];
			buf = buf_;
			while(0 < cnt--){
				*buf_++ = *fifo++;
			}
			
			/*xprintf("out(%d)[", len);
			put_dump(buf, 0, HEADER_LENGTH + ((SPACKET_t*)buf)->Length, DW_CHAR);
			xputs("]\n");*/
			
			// サイズが合っているか確認
			int len_in_packet = HEADER_LENGTH + ((SPACKET_t*)buf)->Length;
			if (len < len_in_packet){
				// パケットが不正
				m_Rx.Size = size - 1;	// +1した分を戻す
				return true;		// 処理はしたのでtrueを返す
			}
			
			// キュー内のインデックスを計算
			m_Rx.Next = IncAndWrap(next, RX_QUEUELEVEL);
			m_Rx.FrameLacking = false;
		}
		return true;
	}else{
		return false;
	}
}

// 送信できるか調べる
bool clBTLUSB::TxFlow(unsigned int len){
	unsigned int need_packets;
	need_packets = GetDividedPackets(len, TX_PAYLOADSIZE);
	
	if (TX_QUEUELEVEL < (m_Tx.Size + need_packets)){
		return false;
	}else{
		return true;
	}
}

// 送信
bool clBTLUSB::Tx(const PACKET_t &packet){
	// 必要なパケット数を計算
	// データの合計サイズがペイロードサイズの倍数だった場合、ゼロ長のパケットを余計に送る
	int need_packets;
	need_packets = GetDividedPackets(packet.Length, TX_PAYLOADSIZE);
	
	// クリティカルセクションは時間がかかるため、最初に一度チェックする
	if (TX_QUEUELEVEL < (m_Tx.Size + need_packets)) return false;
	
	portENTER_CRITICAL();
	
	unsigned int size = m_Tx.Size + need_packets;
	if (TX_QUEUELEVEL < size){	// 二重にチェック
		portEXIT_CRITICAL();
		return false;
	}
	
	//xprintf("tx(%X,%X)(%d)[%08X]\n", packet.Dest, packet.Msg, packet.Length, Adler32(packet.Data, packet.Length));
	//xprintf("%d tx(%X,%X)(%d)\n", xTaskGetTickCount(), packet.Dest, packet.Msg, packet.Length);
	
	m_Tx.Size = size;
	
	unsigned int next = m_Tx.Next;
		
	// キューに詰めていく
	unsigned int len = packet.Length;
	const char *data = packet.Data;
	for(int cnt = need_packets - 1; 0 <= cnt; cnt--){
		unsigned int tlen = (len < TX_PAYLOADSIZE) ? len : TX_PAYLOADSIZE;
		SPACKET_t *spacket = (SPACKET_t*)m_Tx.Buf[next];
		spacket->Dest	= packet.Dest;
		spacket->Msg	= packet.Msg;
		spacket->Length	= tlen;
		spacket->Frame	= cnt;
		memcpy(spacket->Data, data, tlen);
		
		//xprintf("tx(%X,%X,%d)[%d]\n", spacket->Dest, spacket->Msg, spacket->Frame, spacket->Length);
		
		/*xprintf("tx(%d,%d,%d)[", spacket->Dest, spacket->Msg, tlen, cnt);
		put_dump(data, 0, tlen, DW_CHAR);
		xputs("]\n");*/
		
		len -= tlen;
		data = (const char*)data + tlen;
		
		// キュー内のインデックスを計算
		next = IncAndWrap(next, TX_QUEUELEVEL);
	}
	
	m_Tx.Next = next;
	
	// 送信できるデータがあることを通知
	USB::Data::TxReady();
	
	portEXIT_CRITICAL();
	
	return true;
}

// 受信できるか調べる
bool clBTLUSB::RxFlow(void){
	portENTER_CRITICAL();
	
	bool result;
	result = !(m_Rx.Size <= 0) | m_Rx.FrameLacking;
	
	portEXIT_CRITICAL();
	
	return result;
}

// 受信
bool clBTLUSB::Rx(PACKET_t &packet){
	if (m_Rx.Size <= 0) return false;	// クリティカルセクションは時間がかかるため、最初に一度チェックする
	
	portENTER_CRITICAL();
	
	unsigned int size = m_Rx.Size;
	if (size <= 0){		// 二重にチェック
		portEXIT_CRITICAL();
		return false;
	}
	
	bool result = false;
	
	// キュー内のインデックスを計算
	unsigned int next = m_Rx.Next;
	unsigned int index = LowerWrap(next - size, RX_QUEUELEVEL);
	
	//xprintf("rx(idx=%X)\n", index);
	
	// 最初のパケットを取得
	unsigned int dest, msg, frame;
	const SPACKET_t *spacket = (const SPACKET_t*)m_Rx.Buf[index];
	dest	= spacket->Dest;
	msg		= spacket->Msg;
	frame	= spacket->Frame;
	//xprintf("rx(sp=%08X)\n", spacket);
	
	if (frame < size){
		if (frame < RX_MAX_DIVISION){
			//xprintf("rx(dest=%X)\n", dest);
			
			// キューの中に一連のパケットが納まっているか
			unsigned int cnt = 0;
			unsigned int total_length = 0;
			signed int start_index = index;
			while(cnt <= frame){
				spacket = (const SPACKET_t*)m_Rx.Buf[index];
				if (spacket->Dest != dest) break;
				if (spacket->Msg != msg) break;
				if (spacket->Frame != (frame - cnt)) break;

				total_length += spacket->Length;

				cnt++;
				index = IncAndWrap(index, RX_QUEUELEVEL);
			}
			
			if ((frame < cnt) && (total_length <= MAX_PAYLOADSIZE)){
				index = start_index;
				
				// 実際にコピー
				packet.Dest		= dest;
				packet.Msg		= msg;
				packet.Length	= total_length;
				
				frame++;
				size -= frame;
				
				char *data = packet.Data;
				do{
					spacket = (const SPACKET_t*)m_Rx.Buf[index];
					memcpy(data, spacket->Data, spacket->Length);
					data += spacket->Length;
					
					index = IncAndWrap(index, RX_QUEUELEVEL);
				}while(0 < --frame);
				
				/*xprintf("rx(%d,%d,%d)[", spacket->Dest, spacket->Msg, spacket->Length);
				put_dump(packet.Data, 0, spacket->Length, DW_CHAR);
				xputs("]\n");*/
				
				//xprintf("rx(%X,%X)(%d)[%08X]\n", dest, msg, total_length, Adler32(packet.Data, total_length));
				//xprintf("%d rx(%X,%X)(%d)\n", xTaskGetTickCount(), dest, msg, total_length);
				
				result = true;
			}else{
				// データが異常なので廃棄
				size--;
				xprintf("rx(err1)\n");
			}
		}else{
			// データが異常なので廃棄
			size--;
			xprintf("rx(err2)\n");
		}
		
		m_Rx.Size = size;
		
		// データが受信できることを通知
		USB::Data::RxReady();	
	}else{
		m_Rx.FrameLacking = true;
		//xprintf("rx(lack)\n");
	}
	
	portEXIT_CRITICAL();
	
	return result;
}




