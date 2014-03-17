// デバイスを管理するクラス(Gen.5 Rev.A)

#include "device_5A.h"
#include "trace.h"
#include "hexload.h"



// USBの情報を比較する
bool clDevice5A::MatchingUSB(int vid, int pid, int rev){
	if ((vid == USB_VID) && (pid == USB_PID) && (rev == USB_REV)){
		return true;
	}
	return false;
}

// コンストラクタ
clDevice5A::clDevice5A(iBTL *btl) : iDevice(btl){
	Trace(L"clDevice5A:デバイスが作成されました");

	// デバイス情報を埋める
	m_DeviceInfo.Update			= true;
	m_DeviceInfo.Inquiry		= false;
	m_DeviceInfo.DevName		= L"KIKS SSL";
	m_DeviceInfo.MacName1		= L"";
	m_DeviceInfo.MacName2		= L"";
	m_DeviceInfo.Generation		= 5;
	m_DeviceInfo.Revision		= 1;
	m_DeviceInfo.Phy			= m_BTL->GetPhyName();
	m_DeviceInfo.MachineID		= -1;
}

// デストラクタ
clDevice5A::~clDevice5A(){
	Trace(L"clDevice5A:デバイスが解放されました");
}

	


// プロセッサのプログラムを読み込む
bool clDevice5A::LoadProcessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path){
	static const char SIGNATURE[] = "KIKS Gen.5 Rev.A";
	
	char *buf = new char[AVR32_APP_SIZE];
	char *used = new char[AVR32_APP_SIZE];

	dst_vector.clear();

	// HEXファイルを読み込む
	bool result;
	result = LoadIntelHEX(src_path, buf, used, AVR32_APP_SIZE, AVR32_FLASH_START + AVR32_APP_OFFSET);
	if (result == true){
		int upper = -1;

		// 書き換えるページを調べる
		for(int cnt = 0; cnt < AVR32_APP_SIZE; cnt++){
			if (used[cnt] != 0) upper = cnt;
		}

		result = false;
		if (AVR32_PAGE_SIZE <= upper){
			// ファームウェア中のシグネチャを確認
			if (memcmp(buf, SIGNATURE, sizeof(SIGNATURE)) == 0){
				int length = (upper / AVR32_PAGE_SIZE + 1) * AVR32_PAGE_SIZE;
				dst_vector.resize(length, 0xFF);
				memcpy(&dst_vector[0], buf, length);

				result = true;
			}
		}
	}
	delete [] buf;
	delete [] used;
	return result;
}

// コプロセッサのプログラムを読み込む
bool clDevice5A::LoadCoprocessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path){
	char *buf = new char[OMSP_PROGRAM_SIZE];

	dst_vector.clear();

	// HEXファイルを読み込む
	bool result;
	result = LoadIntelHEX(src_path, buf, nullptr, OMSP_PROGRAM_SIZE, OMSP_PROGRAM_START);
	if (result == true){
		// プログラムが存在するか調べる
		result = false;
		for(int cnt = 0; cnt < OMSP_PROGRAM_SIZE; cnt++){
			if (buf[cnt] != 0xFF){
				result = true;
				break;
			}
		}

		if (result == true){
			// コピー
			dst_vector.resize(OMSP_PROGRAM_SIZE);
			memcpy(&dst_vector[0], buf, OMSP_PROGRAM_SIZE);
		}
	}
	delete [] buf;
	return result;
}



/*




// BITファイルをロードする
bool clDeviceGen5USB::LoadBIT(std::wstring &file, std::deque<TRANSFER_t> &transfer){
	bool result = false;

	transfer.clear();

	// ファイルを開く
	HANDLE hFile;
	hFile = CreateFile(file.c_str(), GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hFile == INVALID_HANDLE_VALUE) return false;

	char *buf = nullptr;
	do{
		// ファイルサイズのチェック
		LARGE_INTEGER size;
		if (GetFileSizeEx(hFile, &size) == FALSE) break;
		if (FPGA_BITSTREAM_LIMIT < size.QuadPart) break;

		// バッファに読み込む
		int len = size.LowPart;
		int read;
		buf = new char[len];
		if (ReadFile(hFile, buf, len, (LPDWORD)&read, NULL) == FALSE){
			int error = GetLastError();
			break;
		}
		if (read != len) break;

		// キューに追加する
		int page = 0;
		char *p = buf;
		while(0 < len){
			//int tlen = (len < TRANSFER_UNIT) ? len : TRANSFER_UNIT;
			int tlen = (len < AVR32_PAGE_SIZE) ? len : AVR32_PAGE_SIZE;
			TRANSFER_t append;
			append.Number	= page++;
			append.Length	= AVR32_PAGE_SIZE;//tlen;
			append.Fill(0xFF);
			append.Copy(p, tlen);
			transfer.push_back(append);
			p += tlen;
			len -= tlen;
		}

		result = true;
	}while(false);
	CloseHandle(hFile);
	delete [] buf;
	return result;
}

// コプロセッサのHEXファイルをロードする
bool clDeviceGen5USB::LoadCopHEX(std::wstring &file, std::deque<TRANSFER_t> &transfer){
	char *buf = new char[COP_SIZE];

	transfer.clear();

	// HEXファイルを読み込む
	bool result;
	result = LoadIntelHEX(file.c_str(), buf, nullptr, COP_SIZE, COP_START);
	if (result == true){
		bool exist = false;

		// 書き換えるページを調べる
		for(int cnt = 0; cnt < COP_SIZE; cnt++){
			if (buf[cnt] != 0xFF){
				exist = true;
				break;
			}
		}

		if (exist == true){
			// キューに追加する
			char *p = buf;
			int len = COP_SIZE;
			int page = 0;
			while(0 < len){
				//int tlen = (len < TRANSFER_UNIT) ? len : TRANSFER_UNIT;
				int tlen = (len < AVR32_PAGE_SIZE) ? len : AVR32_PAGE_SIZE;
				TRANSFER_t append;
				append.Number	= page++;
				append.Length	= AVR32_PAGE_SIZE;//tlen;
				append.Fill(0xFF);
				append.Copy(p, tlen);
				transfer.push_back(append);
				p += tlen;
				len -= tlen;
			}
		}
		result = exist;
	}
	delete [] buf;
	return result;
}

*/








// ログ情報を持つファイル名を取得
bool clDevice5A::GetLogInfo(std::wstring &dst_name){
	dst_name.assign(L"log_dev5A.ini");
	return true;
}




