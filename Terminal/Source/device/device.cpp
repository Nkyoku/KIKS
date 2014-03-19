// デバイスを管理するインターフェース

#pragma once

#include "device.h"
#include "device_5A.h"
#include "btl_usb.h"
#include "trace.h"
#include "convstr.h"

#include <SetupAPI.h>
#include "winusb/winusb.h"
#include "winusb/usbiodef.h"

#pragma comment(lib, "winmm.lib")
#pragma comment(lib, "SetupAPI.lib")
#ifndef _WIN64
#pragma comment(lib, "winusb_x86.lib")
#else
#pragma comment(lib, "winusb_x64.lib")
#endif



const GUID iDevice::USB_GUID = {0x3758a52f, 0xb900, 0x4bb4, {0xb5, 0xc3, 0xa7, 0x30, 0x56, 0x0c, 0x9e, 0xce}};



// コンストラクタ
iDevice::iDevice(iBTL *btl) : m_BTL(btl){
	// コールバックを登録
	RxDataRegister(DTR::DEVICE, this, CallbackDevice);
}

// デストラクタ
iDevice::~iDevice(){
	if (m_BTL != nullptr){
		delete m_BTL;
	}
}

// デバイスを検索する
iDevice* iDevice::Search(const std::wstring &phy){
	if (phy == L"USB"){
		// USB
		return SearchViaUSB();
	}else if (0 == phy.find_first_of(L"COM", 0)){
		// COMポート
		int port, baudrate;
		port = _wtoi(phy.c_str() + 3);
		baudrate = _wtoi(phy.c_str() + phy.find_first_of(L":", 0) + 1);




		return nullptr;
	}else{
		return nullptr;
	}
}

// USBでデバイスを検索
iDevice* iDevice::SearchViaUSB(void){
	bool detect = false;
	WINUSB_INTERFACE_HANDLE hWinUSB = NULL;

	// INFファイル内で指定したInterfaceGUIDをもつデバイスを列挙
	SP_DEVICE_INTERFACE_DATA sp_did;
	HDEVINFO hDevinfo;
	sp_did.cbSize = sizeof(sp_did);

	hDevinfo = SetupDiGetClassDevs(&USB_GUID, NULL, NULL, DIGCF_DEVICEINTERFACE | DIGCF_PRESENT);

	for(int cnt = 0; cnt < 255; cnt++){
		int result;
		result = SetupDiEnumDeviceInterfaces(hDevinfo, NULL, &USB_GUID, cnt, &sp_did);
		if (result == FALSE) break;
		
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
			Trace(L"iDevice:デバイスを発見しました");
			
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
					iDevice *device = nullptr;
					iBTL *btl = nullptr;

					// 適合したデバイスを作成
					try{
						if (clDevice5A::MatchingUSB(vid, pid, rev) == true){
							btl = new clBTLUSB(hDev, hWinUSB);
							device = new clDevice5A(btl);
						}else{

						}
					}catch(...){
						Trace(L"iDevice:デバイスインスタンスの作成中に例外が発生しました");
					}

					if (btl != nullptr){
						if (device->IsConnected() == true){
							SetupDiDestroyDeviceInfoList(hDevinfo);
							return device;
						}
						delete device;
					}
					Trace(L"iDevice:デバイスは適合しませんでした");
				}
				WinUsb_Free(hWinUSB);
			}
			CloseHandle(hDev);
		}
	}
	SetupDiDestroyDeviceInfoList(hDevinfo);

	Trace(L"iDevice:デバイスを見つけられませんでした");
	return nullptr;
}



// すべてのデータを受信
void iDevice::RxDataAll(void){
	iBTL::PACKET_t packet;

	// データを受信し、コールバック関数を呼び出す
	while(m_BTL->RxFlow() == true){
		if (m_BTL->Rx(packet) == true){
			//Trace(L"iDevice:RxData(%d)[%d]", rxdata.Message, rxdata.Length);
			
			/*int checksum = 0;
			for(int cnt2 = 0; cnt2 < rxdata.Length; cnt2++){
				checksum += rxdata.Data[cnt2] & 0xFF;
				if (0x100 <= checksum)
					checksum = (checksum & 0xFF) + 1;
			}
			checksum ^= 0xFF;
			Trace(L"I(%04X,%d,%02X)", rxdata.Message, rxdata.Length, checksum);*/
			
			// Destに登録されたコールバック関数を読み出す
			auto it = m_RxDataCallbacks.find(packet.Dest);
			if(it != m_RxDataCallbacks.end()){
				RXDATAREG_t reg;
				reg = it->second;
				if (reg.Callback != nullptr)
					(*(reg.Callback))(reg.Instance, packet);
			}
		}
	}
}

// データを受信するコールバック関数を登録
void iDevice::RxDataRegister(unsigned int dest, void *inst, RxDataCallback_t func){
	if (func != nullptr){
		// 登録
		RXDATAREG_t reg;
		reg.Instance = inst;
		reg.Callback = func;
		m_RxDataCallbacks[dest] = reg;
	}else{
		// 登録解除
		m_RxDataCallbacks.erase(dest);
	}
}



// デバイスの対応機能を調べる
bool iDevice::GetCapability(const wchar_t *cap){
	int len = m_Capabilities.size();
	for(int cnt = 0; cnt < len; cnt++){
		if (wcsicmp(m_Capabilities[cnt], cap) == 0){
			return true;
		}
	}
	return false;
}






// DTR_DEVICEのコールバック
void iDevice::CallbackDevice(void *inst, const iBTL::PACKET_t &packet){
	using namespace BTT;

	iDevice *dev = (iDevice*)inst;
	switch(packet.Msg){
	case MRX::DEVICE_INFO_RET:
		Trace(L"デバイス情報を取得しました");
		if (sizeof(DEVICE_INFO_RET_t) < packet.Length){
			// 返ってきたデバイス情報を格納
			DEVINFO_t *info = &dev->m_DeviceInfo;
			const DEVICE_INFO_RET_t *ret = (const DEVICE_INFO_RET_t*)packet.Data;
			std::wstring time;
			CharToWString(info->DevName, ret->DevName, DEVICE_INFO_RET_NAME_LENGTH);
			CharToWString(info->MacName1, ret->MacName1, DEVICE_INFO_RET_NAME_LENGTH);
			CharToWString(info->MacName2, ret->MacName2, DEVICE_INFO_RET_NAME_LENGTH);
			CharToWString(info->Date, ret->FirmDate, DEVICE_INFO_RET_TIME_LENGTH);
			CharToWString(time, ret->FirmTime, DEVICE_INFO_RET_TIME_LENGTH);
			info->Date.append(L" ");
			info->Date.append(time);
			info->Generation	= ret->Generation;
			info->Revision		= ret->Revision;
			info->MachineID		= ret->MachineID;
			info->PipeLinks		= ret->PipeLinks;

			// デバイスの機能を格納
			std::wstring *clist = &dev->m_CapabilityList;
			std::vector<const wchar_t*> *caps = &dev->m_Capabilities;
			caps->clear();
			CharToWString(*clist, ret->Capabilities, packet.Length - sizeof(DEVICE_INFO_RET_t));
			if (0 < clist->size()){
				int head = 0;
				while(true){
					int tail = clist->find(L',', head);
					if (tail != head){
						const wchar_t *c = &(*clist)[head];
						if (*c != L'\0') caps->push_back(c);
					}
					if (tail < 0) break;
					(*clist)[tail] = L'\0';
					head = tail + 1;
				}
			}

			// 更新を通知
			info->Update = true;
			info->Inquiry = true;

			Trace(L"デバイス情報を確認しました");
		}
		break;
	}
}






