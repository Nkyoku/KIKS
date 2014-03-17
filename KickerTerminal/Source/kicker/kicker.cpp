// �}�V�����Ǘ�����N���X

#pragma once

#include "kicker.h"
#include "kicker6A.h"
#include "kicker5.h"
#include "trace.h"

#include <SetupAPI.h>
#include "winusb/winusb.h"
#include "winusb/usbiodef.h"

#pragma comment(lib, "winmm.lib")
#pragma comment(lib, "SetupAPI.lib")
#pragma comment(lib, "winusb_x86.lib")



const GUID iKicker::INTERFACE_GUID = {0x3758a52f, 0xb900, 0x4bb4, {0xb5, 0xc3, 0xa7, 0x30, 0x56, 0x0c, 0x9e, 0xce}};



// �R���X�g���N�^
iKicker::iKicker(HANDLE hdev, HANDLE husb) : m_hDevice(hdev), m_hWinUSB(husb){
	// ���̓o�b�t�@�̐����ŏ��ł���2��
	//BOOL result;
	//result = HidD_SetNumInputBuffers(hdev, 2);

	// ���o�̓o�b�t�@�̑傫�����擾
	/*HIDP_CAPS hidp_caps;
	PHIDP_PREPARSED_DATA phidp_pa;
	HidD_GetPreparsedData(hdev, &phidp_pa);
	HidP_GetCaps(phidp_pa, &hidp_caps);
	HidD_FreePreparsedData(phidp_pa);*/



	




	Trace(L"clKicker:�f�o�C�X���쐬����܂���");
}

// �f�X�g���N�^
iKicker::~iKicker(){
	if (m_hDevice != NULL){
		// �f�o�C�X�n���h�������
		WinUsb_Free(m_hWinUSB);
		CloseHandle(m_hDevice);
	}
	Trace(L"clKicker:�f�o�C�X���������܂���");
}

// �f�o�C�X����������
iKicker* iKicker::Search(void){
	HANDLE hWinUSB = NULL;

	// �f�o�C�X���
	SP_DEVICE_INTERFACE_DATA sp_did;
	HDEVINFO hDevinfo;
	sp_did.cbSize = sizeof(sp_did);

	hDevinfo = SetupDiGetClassDevs(&INTERFACE_GUID, NULL, NULL, DIGCF_DEVICEINTERFACE | DIGCF_PRESENT);

	for(int cnt = 0; cnt < 255; cnt++){
		int result;
		result = SetupDiEnumDeviceInterfaces(hDevinfo, NULL, &INTERFACE_GUID, cnt, &sp_did);
		if (result == 0) break;
		
		int size = 0;
		SetupDiGetDeviceInterfaceDetail(hDevinfo, &sp_did, NULL, NULL, (DWORD*)&size, NULL);
		
		SP_DEVICE_INTERFACE_DETAIL_DATA *sp_didd;
		sp_didd = (SP_DEVICE_INTERFACE_DETAIL_DATA*)malloc(size);
		sp_didd->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

		SetupDiGetDeviceInterfaceDetail(hDevinfo, &sp_did, sp_didd, size, NULL, NULL);

		HANDLE hDev;
		hDev = CreateFile(sp_didd->DevicePath, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, FILE_FLAG_OVERLAPPED, NULL);
		free(sp_didd);

		if (hDev != INVALID_HANDLE_VALUE){
			Trace(L"iKicker:�f�o�C�X�𔭌����܂���");
			
			if (WinUsb_Initialize(hDev, &hWinUSB) == TRUE){
				// VID, PID, ���r�W��������ǂݎ��
				int result, length;
				#pragma pack(push, 1)
				struct{
					unsigned char bLength;
					unsigned char bDescriptorType;
					unsigned short bcdUSB;
					unsigned char bDeviceClass;
					unsigned char bDeviceSubClass;
					unsigned char bDeviceProtocol;
					unsigned char bMaxPacketSize0;
					unsigned short idVendor;
					unsigned short idProduct;
					unsigned short bcdDevice;
					unsigned char iManufacturer;
					unsigned char iProduct;
					unsigned char iSerialNumber;
					unsigned char bNumConfigurations;
				} DeviceDescriptor;		// �f�o�C�X�f�X�N���v�^
				#pragma pack(pop)
				result = WinUsb_GetDescriptor(hWinUSB, 0x01, 0, 0x409, (PUCHAR)&DeviceDescriptor, sizeof(DeviceDescriptor), (PULONG)&length);
				if (result == TRUE){
					// �e�N���X�Ɣ�r����
					int vid = DeviceDescriptor.idVendor;
					int pid = DeviceDescriptor.idProduct;
					int rev = DeviceDescriptor.bcdDevice;
					iKicker *kicker = nullptr;

					try{
						if (clKicker5::Compare(vid, pid, rev) == true){
							kicker = new clKicker5(hDev, hWinUSB);
						}else if (clKicker6A::Compare(vid, pid, rev) == true){
							kicker = new clKicker6A(hDev, hWinUSB);
						}/*else if ... �ǉ�����*/


					}catch(...){
						Trace(L"iKicker:�f�o�C�X�C���X�^���X�̍쐬���ɗ�O���������܂���");
					}

					if (kicker != nullptr){
						if (kicker->IsConnected() == true){
							SetupDiDestroyDeviceInfoList(hDevinfo);
							return kicker;
						}
						delete kicker;
					}
					Trace(L"iKicker:�f�o�C�X�͓K�����܂���ł���");
				}
				WinUsb_Free(hWinUSB);
			}
			CloseHandle(hDev);
		}
	}
	SetupDiDestroyDeviceInfoList(hDevinfo);

	Trace(L"iKicker:�f�o�C�X���������܂���ł���");
	return nullptr;
}



// �f�[�^�𑗐M
bool iKicker::Transmit(int cmdid, unsigned int length, const void *data, unsigned int *transfered_){
	BOOL result;
	int transfered;
	WINUSB_SETUP_PACKET setup;
	setup.RequestType	= 0x21;
	setup.Request		= 0x09;
	setup.Value			= cmdid;
	setup.Index			= 0;
	setup.Length		= length;
	result = WinUsb_ControlTransfer(m_hWinUSB, setup, (PUCHAR)data, length, (PULONG)&transfered, NULL);
	int error = GetLastError();
	if (result == TRUE){
		if (transfered_ != nullptr) *transfered_ = transfered;
		return true;
	}else{
		if (transfered_ != nullptr) *transfered_ = 0;
		return false;
	}
}
	
// �f�[�^����M
bool iKicker::Receive(int cmdid, unsigned int length, void *data, unsigned int *transfered_){
	BOOL result;
	int transfered;
	WINUSB_SETUP_PACKET setup;
	setup.RequestType	= 0xA1;
	setup.Request		= 0x01;
	setup.Value			= cmdid;
	setup.Index			= 0;
	setup.Length		= length;
	result = WinUsb_ControlTransfer(m_hWinUSB, setup, (PUCHAR)data, length, (PULONG)&transfered, NULL);
	int error = GetLastError();
	if (result == TRUE){
		if (transfered_ != nullptr) *transfered_ = transfered;
		return true;
	}else{
		if (transfered_ != nullptr) *transfered_ = 0;
		return false;
	}
}