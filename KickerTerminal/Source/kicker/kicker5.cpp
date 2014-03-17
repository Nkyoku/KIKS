// 第5世代のキッカーを管理するクラス

#include "kicker5.h"
#include "trace.h"
#include "convstr.h"
#include "hexload.h"

#include <stdlib.h>
#include <process.h>

#include <SetupAPI.h>
#include "winusb/usbiodef.h"





// USBの情報を比較する
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

// コンストラクタ
clKicker5::clKicker5(HANDLE hdev, HANDLE husb) : clKicker6A(hdev, husb){
}

// デストラクタ
clKicker5::~clKicker5(){
}

// バージョンを取得
bool clKicker5::GetVersion(VERSION_t &version){
	version.Version = 5;
	version.Revision = 1;
	version.Mode = m_Mode;
	return true;
}

// ユーザー領域を書き換える
bool clKicker5::UserWriteBIN(const std::wstring &file){
	Trace(L"未対応の操作です");
	return false;
}



