// ��6���ナ�r�W����A�̃L�b�J�[���Ǘ�����N���X

#include "kicker6A.h"
#include "trace.h"
#include "convstr.h"
#include "hexload.h"

#include <stdlib.h>
#include <process.h>

#include <SetupAPI.h>
#include "winusb/usbiodef.h"





// USB�̏����r����
bool clKicker6A::Compare(int usb_vid, int usb_pid, int usb_rev){
	if (usb_vid == USB_VID){
		if (usb_pid == USB_PID){
			if (usb_rev == USB_REV){
				return true;
			}
		}
	}
	return false;
}

// �R���X�g���N�^
clKicker6A::clKicker6A(HANDLE hdev, HANDLE husb) : iKicker(hdev, husb){
	// �ϐ�������
	


	// �o�[�W�����Ɠ��샂�[�h���擾
	bool result;
	unsigned int transfered;
	char buffer[4];
	result = Receive(CMDID_GET_NAME, sizeof(buffer), buffer, &transfered);
	if ((result == true) && (transfered == sizeof(buffer))){
		if ((buffer[1] == '6') && (buffer[2] == 'A')){
			if (buffer[0] == 'b'){
				m_Mode = MODE_DFU;
				goto succeeded;
			}else if (buffer[0] == 'a'){
				m_Mode = MODE_APP;
				goto succeeded;
			}
		}
	}
	throw 0;	// �G���[
	
succeeded:
	Trace(L"clKicker:�f�o�C�X���쐬����܂���");
}

// �f�X�g���N�^
clKicker6A::~clKicker6A(){
	Trace(L"clKicker:�f�o�C�X���������܂���");
}

// �f�o�C�X���ڑ�����Ă��邩
bool clKicker6A::IsConnected(void){
	return true;
}

// ���샂�[�h��ύX����
bool clKicker6A::ChangeMode(MODE_e mode){
	char cmd;
	switch(mode){
	case MODE_DFU:
		cmd = 0;
		break;
	case MODE_APP:
		cmd = 1;
		break;
	
	default:
		return false;
	}
	return Transmit(CMDID_RESET, 1, &cmd);
}

// �o�[�W�������擾
bool clKicker6A::GetVersion(VERSION_t &version){
	version.Version = 5;
	version.Revision = 1;
	version.Mode = m_Mode;
	return true;
}

// �f�o�b�O�o�͂��擾
bool clKicker6A::GetString(std::wstring &text){
	char buf[257];

	bool result;
	unsigned int transfered;
	result = Receive(CMDID_STRING, sizeof(buf) - 1, buf, &transfered);
	if (result == true){
		buf[transfered] = L'\0';
		CharToWString(text, buf, transfered);
		return true;
	}

	return false;
}

// ���[�U�[�̈������������
bool clKicker6A::UserWriteBIN(const std::wstring &file){
	char buf[XMEGA_EEPROM_SIZE];
	int size = 0;

	memset(buf, 0xFF, XMEGA_EEPROM_SIZE);

	// �t�@�C����ǂݍ���
	FILE *fp;
	if (_wfopen_s(&fp, file.c_str(), L"rb") == 0){
		size = fread(buf, sizeof(char), XMEGA_EEPROM_SIZE, fp);
		fclose(fp);
	}

	if (0 < size){
		// �]�����Ă���
		bool result = false;
		int pages = (size + XMEGA_EEPROM_PAGE_SIZE - 1) / XMEGA_EEPROM_PAGE_SIZE;

		for(int page = 0; page < pages; page++){
			// Write
			char *p = &buf[XMEGA_EEPROM_PAGE_SIZE * page];
			unsigned short page_w = page;
			unsigned int transfered = 0;
			Trace(L"Write(%d) %d bytes", page, XMEGA_EEPROM_PAGE_SIZE);

			// �y�[�W���Z�b�g
			result = Transmit(CMDID_SET_PAGE, 2, &page_w);
			if (result == false) break;

			// ���C�g
			result = Transmit(CMDID_WRITE_EEPROM, XMEGA_EEPROM_PAGE_SIZE, p, &transfered);
			if (result == false) break;

			Trace(L"Written %d bytes", transfered);

			Sleep(10);
		}

		if (result == true){
			Trace(L"�������܂���");
		}else{
			Trace(L"���s���܂���");
		}
		return result;
	}

	return false;
}

// �t���b�V��������������
bool clKicker6A::FlashWriteHEX(const std::wstring &file){
	if (m_Mode != MODE_DFU) return false;
	
	char *buf = new char[XMEGA_APP_SIZE];
	char *used = new char[XMEGA_APP_SIZE];
	char *and = new char[XMEGA_APP_PAGES];
	memset(and, 0, XMEGA_APP_PAGES);

	// HEX�t�@�C����ǂݍ���
	bool result;
	result = LoadIntelHEX(file.c_str(), buf, used, XMEGA_APP_SIZE, XMEGA_APP_START);
	if (result == true){
		bool exist = false;

		// ����������y�[�W�𒲂ׂ�
		for(int page = 0; page < XMEGA_APP_PAGES; page++){
			char flag = 0;
			char *s = used + XMEGA_PAGE_SIZE * page;
			for(int cnt = 0; cnt < XMEGA_PAGE_SIZE; cnt++){
				flag |= *s++;
			}
			if (flag != 0){
				and[page] = 1;
				exist = true;
			}
		}

		if (exist == true){
			// �]�����Ă���
			result = false;
			
			for(int page = 0; page < XMEGA_APP_PAGES; page++){
				if (and[page] != 0){
					// Write
					char *p = &buf[XMEGA_PAGE_SIZE * page];
					unsigned short page_w = page;
					unsigned int transfered = 0;
					Trace(L"Write(%d) %d bytes", page, XMEGA_PAGE_SIZE);

					// �y�[�W���Z�b�g
					result = Transmit(CMDID_SET_PAGE, 2, &page_w);
					if (result == false) break;

					// ���C�g
					result = Transmit(CMDID_WRITE, XMEGA_PAGE_SIZE, p, &transfered);
					if (result == false) break;

					Trace(L"Written %d bytes", transfered);

					Sleep(10);
				}
			}
			
			if (result == true){
				Trace(L"�������܂���");
			}else{
				Trace(L"���s���܂���");
			}
		}else{
			Trace(L"�������ރf�[�^������܂���");
		}
		result = exist;
	}

	delete [] buf;
	delete [] used;
	delete [] and;
	return result;
}
	
// �t���b�V����ǂݏo��
bool clKicker6A::FlashReadBIN(const std::wstring &file){
	if (m_Mode != MODE_DFU) return false;
	
	bool result = false;
	do{
		char buf[XMEGA_APP_SIZE];

		// Read
		for(int page = 0; page < XMEGA_APP_PAGES; page++){
			char *p = buf + XMEGA_PAGE_SIZE * page;
			unsigned short page_w = page;
			unsigned int transfered = 0;

			// �y�[�W���Z�b�g
			result = Transmit(CMDID_SET_PAGE, 2, &page_w, &transfered);
			if (result == false) break;
			if (transfered != 2) break;

			// ���[�h
			result = Receive(CMDID_READ, XMEGA_PAGE_SIZE, p, &transfered);
			if (result == false) break;

			Trace(L"Read(%d) %d bytes", page, transfered);
		}
		if (result == false) break;
		
		// �����o��
		FILE *fp;
		if (_wfopen_s(&fp, file.c_str(), L"wb") == 0){
			fwrite(buf, sizeof(char), XMEGA_APP_SIZE, fp);
			fclose(fp);
		}
	}while(false);

	if (result == true){
		Trace(L"�������܂���");
	}else{
		Trace(L"���s���܂���");
	}
	return result;
}



