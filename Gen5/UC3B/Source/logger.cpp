/**	@file
	@brief ロボットの入出力情報のロギング
*/

#include "logger.h"

#include "FreeRTOS.h"
#include "task.h"

#include "xprintf.h"

#include <stdlib.h>
#include <string.h>



namespace Logger{
	
	const static unsigned int BUFFER_LENGTH = 8192;
	
	volatile bool m_Opened;		// 開かれている
	volatile bool m_Dropped;	// データの取りこぼしが最近起きた
	
	char m_SendList[(_ID_MAX_ + 7) / 8];
	
	// バッファ
	unsigned short m_Buffer[BUFFER_LENGTH];
	volatile unsigned int m_BufferNext;
	volatile unsigned int m_BufferSize;
	
	unsigned int m_LastTime;	// 最後に送信した時刻
	
	
	
	
	
	
	/* パイプ関連 */
	
	// パイプ情報
#ifdef _APP_
	extern const BTT::PIPE_INFO_t Info = {
		"LOGGER", 0, 1, BTT::RW
	};
#endif
	
	// 開く
	bool Open(void){
		portENTER_CRITICAL();
		
		bool result = !m_Opened;
		if (result == true){
			// オープン成功
			m_Opened = true;
			
			// すべてクリア
			memset(m_SendList, 0x00, sizeof(m_SendList));
			m_BufferNext = 0;
			m_BufferSize = 0;
			m_Dropped = false;
			
			// 時刻を設定
			m_LastTime = xTaskGetTickCount();
		}
		
		portENTER_CRITICAL();
		
		xprintf("log_open:res=%d, opened=%d\n", result, m_Opened);
		return result;
	}
	
	// 閉じる
	void Close(void){
		xprintf("log_close:opened=%d\n", m_Opened);
		m_Opened = false;
	}
	
	// 読み込む
	bool Read(void *data, unsigned int len, unsigned int &read){
		if (m_Opened == false) return false;
		
		len &= ~0x1;
		if (len < 2){
			read = 0;
			return true;
		}
		
		portENTER_CRITICAL();
		
		unsigned int buf_next = m_BufferNext;
		unsigned int buf_size = m_BufferSize;
		
		if (buf_size == 0){
			read = 0;
		}else{
			signed int offset;
			unsigned int txlen;
			offset = (buf_next - buf_size) * 2;
			txlen = buf_size * 2;
			if (len < txlen) txlen = len;
			buf_size -= txlen / 2;
			read = txlen;
			
			m_BufferNext = buf_next;
			m_BufferSize = buf_size;
			
			if (offset < 0){
				if ((int)txlen < -offset){
					// 1回でコピー
					offset += BUFFER_LENGTH * 2;
					memcpy(data, (char*)m_Buffer + offset, txlen);
				}else{
					// バッファの端なので、2回に分けてコピー
					memcpy(data, (char*)&m_Buffer[BUFFER_LENGTH] + offset, -offset);
					data = (unsigned char*)data - offset;
					memcpy(data, m_Buffer, txlen + offset);
				}
			}else{
				// 1回でコピー
				memcpy(data, (char*)&m_Buffer + offset, txlen);
			}
		}
		
		portEXIT_CRITICAL();
		
		return true;
	}
	
	// 書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written){
		xprintf("log_write:opened=%d\n", m_Opened);
		
		if (m_Opened == false) return false;
		
		// クリア
		memset(m_SendList, 0x00, sizeof(m_SendList));
		
		// コピー
		if (sizeof(m_SendList) < len) len = sizeof(m_SendList);
		memcpy(m_SendList, data, len);
		written = len;
		
		// AVR32内部で使用するIDのフラグを立てる
		m_SendList[ID_COPTIME / 8] |=  1 << (ID_COPTIME % 8);
		
		return true;
	}
	
	
	
	
	/* 一般 */
	
	// IDをチェック
	/*bool CheckID(unsigned int addr){
		if (m_Opened == false) return false;
		if (_ID_MAX_ <= addr) return false;
		return m_SendList[addr / 8] & (1 << (addr % 8));
	}*/
	
	// データを追加
	bool AddDataByte(unsigned int addr, unsigned char byte){
		if (CheckID(addr) == false) return false;
		if (_ID_BYTE_MAX_ <= addr) return false;
		
		register unsigned int p;
		unsigned short p1;
		p = 0x1;
		p |= (addr & 0x1F) << 9;
		p |= byte << 1;
		p1 = p;
		return AddDataRaw(&p1, 1);
	}
	bool AddDataHalf(unsigned int addr, unsigned short half){
		if (CheckID(addr) == false) return false;
		
		register unsigned long p;
		unsigned short p21[2];
		p = half;
		p <<= 1;
		p21[1] = p;
		p >>= 15;
		p |= (addr & 0x3FF) << 4;
		p |= 0x4001;
		p21[0] = p;
		return AddDataRaw(p21, 2);
	}
	bool AddDataWord(unsigned int addr, unsigned long word){
		if (CheckID(addr) == false) return false;
		
		register unsigned long p;
		unsigned short p321[3];
		p = word;
		p <<= 1;
		p321[2] = p;
		p = word >> 15;
		p <<= 1;
		p321[1] = p;
		p >>= 15;
		p |= (addr & 0x3FF) << 4;
		p |= 0x8001;
		p321[0] = p;
		return AddDataRaw(p321, 3);
	}
	
	// 時刻を追加
	void AddTime(unsigned int time){
		if (time == m_LastTime) return;
		
		signed int delta = time - m_LastTime;
		unsigned int diff = abs(delta);
		
		// 本来なら負数は正数より表現できる値が多いが気にしない
		bool result;
		if (diff <= 127){
			result = AddDataByte(ID_DELTATIME, delta);
		}else if (diff <= 32767){
			result = AddDataHalf(ID_DELTATIME, delta);
		}else{
			result = AddDataWord(ID_DELTATIME, delta);
		}
		if (result == true){
			m_LastTime = time;
		}
	}
	
	// 生データを追加
	// この関数はパイプが開かれているかチェックしない
	bool AddDataRaw(const unsigned short *data, unsigned int length){
		unsigned int buf_next = m_BufferNext;
		unsigned int buf_size = m_BufferSize;
		bool drop = m_Dropped;
		
		if (BUFFER_LENGTH <= (buf_size + length)){	// 欠落通知のために1ワード空けておく
			m_Dropped = true;
			return false;
		}
		if (drop == true){
			// 欠落を通知する
			m_Buffer[buf_next] = __builtin_bswap_16(((ID_DROP & 0x1F) << 9) | 0x1);
			buf_size++;
			buf_next++;
			if (ISPOWEROF2(BUFFER_LENGTH)){
				buf_next &= (BUFFER_LENGTH - 1);
			}else{
				if (BUFFER_LENGTH <= buf_next){
					buf_next = 0;
				}
			}
			m_Dropped = false;
		}
		
		while(0 < length--){
			m_Buffer[buf_next] = __builtin_bswap_16(*data++);
			buf_size++;
			buf_next++;
			if (ISPOWEROF2(BUFFER_LENGTH)){
				buf_next &= (BUFFER_LENGTH - 1);
			}else{
				if (BUFFER_LENGTH <= buf_next){
					buf_next = 0;
				}
			}
		}
		
		m_BufferNext = buf_next;
		m_BufferSize = buf_size;
		return true;
	}
	
	
	
	
	
	// データを逆変換
	unsigned int ParseData(const unsigned short *data, unsigned int length){
		unsigned int output;
		switch(length){
		case 3:
			output = ((unsigned int)data[0] << 13) & 0xC000000;
			output |= ((unsigned int)data[1] << 14) & 0x3FFF8000;
			output |= ((unsigned int)data[2] >> 1) & 0x7FFF;
			break;
		
		case 2:
			output = (data[0] << 14) & 0x8000;
			output |= (data[1] >> 1) & 0x7FFF;
			break;
		
		default:
			output = (data[0] >> 1) & 0xFF;
			break;
		}
		return output;
	}
	
}
