/**	@file
	@brief USBのデバイスインターフェース
*/

#include "usbif.h"
#include "driver/usb.h"
#include "driver/flash.h"
#include "driver/gpio.h"

#include <string.h>
#include <avr/pgmspace.h>



namespace USBIF{
	
	/* 定数 */
#ifdef _APP_
	static const char DEVICE_NAME[] PROGMEM = "a6A";		// Application, Gen.6, Rev.A の意味
#else
	static const char DEVICE_NAME[] PROGMEM = "b6A";		// Bootloader, ... の意味
#endif
	
	
	
	
	/* 変数 */
	volatile char m_ResetRequest;
	unsigned char m_FlashPage = -1;	// フラッシュ操作ページ
	
#ifdef _APP_
	// 送信リングバッファ
	const static short OUT_BUFSIZE = 256;
	struct DEBUGOUT_t{
		char Buf[OUT_BUFSIZE];	// バッファ
		short Next;				// 次にデータを追加する先
		short Size;				// データの数
	};
	volatile DEBUGOUT_t DebugOut;
#endif
	
	
	
#ifdef _APP_
	// デバッグ出力をする
	void PutDebugOut(char c){
		CriticalSection{
			short next = DebugOut.Next;
			short size = DebugOut.Size;
			
			if (OUT_BUFSIZE <= size) break;
			
			DebugOut.Buf[next] = c;
			size++;
			next++;
			if (OUT_BUFSIZE <= next){
				next = 0;
			}
			
			DebugOut.Next = next;
			DebugOut.Size = size;
		}
	}
#endif
	
	
	
	
	
	// USB経由でレポートの送信を要求された
	bool HIDGetReportRequest(unsigned char id, unsigned short &len, char *data){
		switch(id){
		case CMDID_GET_NAME:
			memcpy_P(data, DEVICE_NAME, sizeof(DEVICE_NAME));
			len = sizeof(DEVICE_NAME);
			break;
			
		case CMDID_STRING:	// デバッグ文字列を送信する
#ifdef _APP_
			//CriticalSection{
			{
				short size = DebugOut.Size;
				short offset, txlen;
				offset = DebugOut.Next - size;
				txlen = size;
				if (USBC::USB_EP0_FIFOLENGTH < (unsigned short)txlen) txlen = USBC::USB_EP0_FIFOLENGTH;
				len = txlen;
				if (txlen != 0){
					if (offset < 0){
						if (txlen < -offset){
							// 1回でコピー
							offset += OUT_BUFSIZE;
							memcpy(data, (char*)(DebugOut.Buf + offset), txlen);
						}else{
							// バッファの端なので、2回に分けてコピー
							memcpy(data, (char*)(DebugOut.Buf + OUT_BUFSIZE + offset), -offset);
							memcpy(data - offset, (char*)DebugOut.Buf, txlen + offset);
						}
					}else{
						// 1回でコピー
						memcpy(data, (char*)(DebugOut.Buf + offset), txlen);
					}
					
					DebugOut.Size = size - txlen;
				}
			}
#else
			// DFUモードではメモリー削減のためデバッグ文字列の送受信を行わない
			len = 0;
#endif			
			break;
			
#ifdef _DFU_
		case CMDID_READ:
			memcpy_P(data, (void*)(Flash::PAGE_SIZE * m_FlashPage), Flash::PAGE_SIZE);
			break;
#endif
		
		default:
			return false;
		}
		return true;
	}
	
	// USB経由でレポートを受信した
	void HIDSetReportRequest(unsigned char id, unsigned short len, const char *data){
		switch(id){
		case CMDID_RESET:
			if (len == 1){
				char req = *data;
				if (req == 1){
					m_ResetRequest = REQ_APP;
				}else{
					m_ResetRequest = REQ_DFU;
				}
			}
			break;
			
#ifdef _APP_
		case CMDID_STRING:
			
			break;
#endif
		
		case CMDID_SET_PAGE:
			if (len == 2){
				m_FlashPage = *((const short*)data);
			}
			break;
			
		case CMDID_WRITE_EEPROM:
			if (len == EEPROM_PAGE_SIZE){
				Flash::EEPROMPageWrite(m_FlashPage, data);
				m_FlashPage = -1;
			}
			break;
			
#ifdef _DFU_
		case CMDID_WRITE:
			if (len == Flash::PAGE_SIZE){
				Flash::Write(m_FlashPage, data);
				m_FlashPage = -1;
			}
			break;
#endif
		}
	}
	
}

