// 第6世代リビジョンAのキッカーを管理するクラス

#include "kicker6A.h"
#include "trace.h"
#include "convstr.h"
#include "hexload.h"

#include <stdlib.h>
#include <process.h>

#include <SetupAPI.h>
#include "winusb/usbiodef.h"





// USBの情報を比較する
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

// コンストラクタ
clKicker6A::clKicker6A(HANDLE hdev, HANDLE husb) : iKicker(hdev, husb){
	// 変数初期化
	


	// バージョンと動作モードを取得
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
	throw 0;	// エラー
	
succeeded:
	Trace(L"clKicker:デバイスが作成されました");
}

// デストラクタ
clKicker6A::~clKicker6A(){
	Trace(L"clKicker:デバイスが解放されました");
}

// デバイスが接続されているか
bool clKicker6A::IsConnected(void){
	return true;
}

// 動作モードを変更する
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

// バージョンを取得
bool clKicker6A::GetVersion(VERSION_t &version){
	version.Version = 5;
	version.Revision = 1;
	version.Mode = m_Mode;
	return true;
}

// デバッグ出力を取得
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

// ユーザー領域を書き換える
bool clKicker6A::UserWriteBIN(const std::wstring &file){
	char buf[XMEGA_EEPROM_SIZE];
	int size = 0;

	memset(buf, 0xFF, XMEGA_EEPROM_SIZE);

	// ファイルを読み込む
	FILE *fp;
	if (_wfopen_s(&fp, file.c_str(), L"rb") == 0){
		size = fread(buf, sizeof(char), XMEGA_EEPROM_SIZE, fp);
		fclose(fp);
	}

	if (0 < size){
		// 転送していく
		bool result = false;
		int pages = (size + XMEGA_EEPROM_PAGE_SIZE - 1) / XMEGA_EEPROM_PAGE_SIZE;

		for(int page = 0; page < pages; page++){
			// Write
			char *p = &buf[XMEGA_EEPROM_PAGE_SIZE * page];
			unsigned short page_w = page;
			unsigned int transfered = 0;
			Trace(L"Write(%d) %d bytes", page, XMEGA_EEPROM_PAGE_SIZE);

			// ページをセット
			result = Transmit(CMDID_SET_PAGE, 2, &page_w);
			if (result == false) break;

			// ライト
			result = Transmit(CMDID_WRITE_EEPROM, XMEGA_EEPROM_PAGE_SIZE, p, &transfered);
			if (result == false) break;

			Trace(L"Written %d bytes", transfered);

			Sleep(10);
		}

		if (result == true){
			Trace(L"成功しました");
		}else{
			Trace(L"失敗しました");
		}
		return result;
	}

	return false;
}

// フラッシュを書き換える
bool clKicker6A::FlashWriteHEX(const std::wstring &file){
	if (m_Mode != MODE_DFU) return false;
	
	char *buf = new char[XMEGA_APP_SIZE];
	char *used = new char[XMEGA_APP_SIZE];
	char *and = new char[XMEGA_APP_PAGES];
	memset(and, 0, XMEGA_APP_PAGES);

	// HEXファイルを読み込む
	bool result;
	result = LoadIntelHEX(file.c_str(), buf, used, XMEGA_APP_SIZE, XMEGA_APP_START);
	if (result == true){
		bool exist = false;

		// 書き換えるページを調べる
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
			// 転送していく
			result = false;
			
			for(int page = 0; page < XMEGA_APP_PAGES; page++){
				if (and[page] != 0){
					// Write
					char *p = &buf[XMEGA_PAGE_SIZE * page];
					unsigned short page_w = page;
					unsigned int transfered = 0;
					Trace(L"Write(%d) %d bytes", page, XMEGA_PAGE_SIZE);

					// ページをセット
					result = Transmit(CMDID_SET_PAGE, 2, &page_w);
					if (result == false) break;

					// ライト
					result = Transmit(CMDID_WRITE, XMEGA_PAGE_SIZE, p, &transfered);
					if (result == false) break;

					Trace(L"Written %d bytes", transfered);

					Sleep(10);
				}
			}
			
			if (result == true){
				Trace(L"成功しました");
			}else{
				Trace(L"失敗しました");
			}
		}else{
			Trace(L"書き込むデータがありません");
		}
		result = exist;
	}

	delete [] buf;
	delete [] used;
	delete [] and;
	return result;
}
	
// フラッシュを読み出す
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

			// ページをセット
			result = Transmit(CMDID_SET_PAGE, 2, &page_w, &transfered);
			if (result == false) break;
			if (transfered != 2) break;

			// リード
			result = Receive(CMDID_READ, XMEGA_PAGE_SIZE, p, &transfered);
			if (result == false) break;

			Trace(L"Read(%d) %d bytes", page, transfered);
		}
		if (result == false) break;
		
		// 書き出し
		FILE *fp;
		if (_wfopen_s(&fp, file.c_str(), L"wb") == 0){
			fwrite(buf, sizeof(char), XMEGA_APP_SIZE, fp);
			fclose(fp);
		}
	}while(false);

	if (result == true){
		Trace(L"成功しました");
	}else{
		Trace(L"失敗しました");
	}
	return result;
}



