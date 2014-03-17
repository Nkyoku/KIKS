// マシンを管理するクラス

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



// コンストラクタ
iKicker::iKicker(HANDLE hdev, HANDLE husb) : m_hDevice(hdev), m_hWinUSB(husb){
	// 入力バッファの数を最少である2に
	//BOOL result;
	//result = HidD_SetNumInputBuffers(hdev, 2);

	// 入出力バッファの大きさを取得
	/*HIDP_CAPS hidp_caps;
	PHIDP_PREPARSED_DATA phidp_pa;
	HidD_GetPreparsedData(hdev, &phidp_pa);
	HidP_GetCaps(phidp_pa, &hidp_caps);
	HidD_FreePreparsedData(phidp_pa);*/



	




	Trace(L"clKicker:デバイスが作成されました");
}

// デストラクタ
iKicker::~iKicker(){
	if (m_hDevice != NULL){
		// デバイスハンドルを閉じる
		WinUsb_Free(m_hWinUSB);
		CloseHandle(m_hDevice);
	}
	Trace(L"clKicker:デバイスが解放されました");
}

// デバイスを検索する
iKicker* iKicker::Search(void){
	HANDLE hWinUSB = NULL;

	// デバイスを列挙
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
			Trace(L"iKicker:デバイスを発見しました");
			
			if (WinUsb_Initialize(hDev, &hWinUSB) == TRUE){
				// VID, PID, リビジョン情報を読み取る
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
				} DeviceDescriptor;		// デバイスデスクリプタ
				#pragma pack(pop)
				result = WinUsb_GetDescriptor(hWinUSB, 0x01, 0, 0x409, (PUCHAR)&DeviceDescriptor, sizeof(DeviceDescriptor), (PULONG)&length);
				if (result == TRUE){
					// 各クラスと比較する
					int vid = DeviceDescriptor.idVendor;
					int pid = DeviceDescriptor.idProduct;
					int rev = DeviceDescriptor.bcdDevice;
					iKicker *kicker = nullptr;

					try{
						if (clKicker5::Compare(vid, pid, rev) == true){
							kicker = new clKicker5(hDev, hWinUSB);
						}else if (clKicker6A::Compare(vid, pid, rev) == true){
							kicker = new clKicker6A(hDev, hWinUSB);
						}/*else if ... 追加する*/


					}catch(...){
						Trace(L"iKicker:デバイスインスタンスの作成中に例外が発生しました");
					}

					if (kicker != nullptr){
						if (kicker->IsConnected() == true){
							SetupDiDestroyDeviceInfoList(hDevinfo);
							return kicker;
						}
						delete kicker;
					}
					Trace(L"iKicker:デバイスは適合しませんでした");
				}
				WinUsb_Free(hWinUSB);
			}
			CloseHandle(hDev);
		}
	}
	SetupDiDestroyDeviceInfoList(hDevinfo);

	Trace(L"iKicker:デバイスを見つけられませんでした");
	return nullptr;
}



// データを送信
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
	
// データを受信
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