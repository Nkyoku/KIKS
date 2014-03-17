/**	@file
	@brief USB�̃f�o�C�X�C���^�[�t�F�[�X
*/

#include "usbif.h"
#include "driver/usb.h"
#include "driver/flash.h"
#include "driver/gpio.h"

#include <string.h>
#include <avr/pgmspace.h>



namespace USBIF{
	
	/* �萔 */
#ifdef _APP_
	static const char DEVICE_NAME[] PROGMEM = "a6A";		// Application, Gen.6, Rev.A �̈Ӗ�
#else
	static const char DEVICE_NAME[] PROGMEM = "b6A";		// Bootloader, ... �̈Ӗ�
#endif
	
	
	
	
	/* �ϐ� */
	volatile char m_ResetRequest;
	unsigned char m_FlashPage = -1;	// �t���b�V������y�[�W
	
#ifdef _APP_
	// ���M�����O�o�b�t�@
	const static short OUT_BUFSIZE = 256;
	struct DEBUGOUT_t{
		char Buf[OUT_BUFSIZE];	// �o�b�t�@
		short Next;				// ���Ƀf�[�^��ǉ������
		short Size;				// �f�[�^�̐�
	};
	volatile DEBUGOUT_t DebugOut;
#endif
	
	
	
#ifdef _APP_
	// �f�o�b�O�o�͂�����
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
	
	
	
	
	
	// USB�o�R�Ń��|�[�g�̑��M��v�����ꂽ
	bool HIDGetReportRequest(unsigned char id, unsigned short &len, char *data){
		switch(id){
		case CMDID_GET_NAME:
			memcpy_P(data, DEVICE_NAME, sizeof(DEVICE_NAME));
			len = sizeof(DEVICE_NAME);
			break;
			
		case CMDID_STRING:	// �f�o�b�O������𑗐M����
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
							// 1��ŃR�s�[
							offset += OUT_BUFSIZE;
							memcpy(data, (char*)(DebugOut.Buf + offset), txlen);
						}else{
							// �o�b�t�@�̒[�Ȃ̂ŁA2��ɕ����ăR�s�[
							memcpy(data, (char*)(DebugOut.Buf + OUT_BUFSIZE + offset), -offset);
							memcpy(data - offset, (char*)DebugOut.Buf, txlen + offset);
						}
					}else{
						// 1��ŃR�s�[
						memcpy(data, (char*)(DebugOut.Buf + offset), txlen);
					}
					
					DebugOut.Size = size - txlen;
				}
			}
#else
			// DFU���[�h�ł̓������[�팸�̂��߃f�o�b�O������̑���M���s��Ȃ�
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
	
	// USB�o�R�Ń��|�[�g����M����
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

