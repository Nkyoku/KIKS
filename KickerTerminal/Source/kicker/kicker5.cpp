// ��5����̃L�b�J�[���Ǘ�����N���X

#include "kicker5.h"
#include "trace.h"
#include "convstr.h"
#include "hexload.h"

#include <stdlib.h>
#include <process.h>

#include <SetupAPI.h>
#include "winusb/usbiodef.h"





// USB�̏����r����
bool clKicker5::Compare(int usb_vid, int usb_pid, int usb_rev){
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
clKicker5::clKicker5(HANDLE hdev, HANDLE husb) : clKicker6A(hdev, husb){
}

// �f�X�g���N�^
clKicker5::~clKicker5(){
}

// �o�[�W�������擾
bool clKicker5::GetVersion(VERSION_t &version){
	version.Version = 5;
	version.Revision = 1;
	version.Mode = m_Mode;
	return true;
}

// ���[�U�[�̈������������
bool clKicker5::UserWriteBIN(const std::wstring &file){
	Trace(L"���Ή��̑���ł�");
	return false;
}



