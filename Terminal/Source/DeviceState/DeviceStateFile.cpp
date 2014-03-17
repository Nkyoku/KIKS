// DeviceState中のファイル関連の分割

#include "DeviceStateFile.h"
#include "trace.h"
#include "convstr.h"



// コンストラクタ
clDeviceStateFile::clDeviceStateFile(clDeviceState *parent) : m_Parent(parent){
	// クリティカルセクション初期化
	InitializeCriticalSectionAndSpinCount(&m_CS, 4000);

	// 初期化
	Reset();
}
	
// デストラクタ
clDeviceStateFile::~clDeviceStateFile(){
	// クリティカルセクション破棄
	DeleteCriticalSection(&m_CS);
}

// コールバックを設定
void clDeviceStateFile::SetCallback(void){
	m_Parent->m_Device->RxDataRegister(DTR::FILE, this, StaticCallback);
	m_Parent->TxData(DTR::FILE, MTX::FILE_CLOSE, nullptr, 0);
}

// コールバック
void clDeviceStateFile::StaticCallback(void *inst_, const iBTL::PACKET_t &packet){
	clDeviceStateFile *inst = (clDeviceStateFile*)inst_;
	EnterCriticalSection(&inst->m_CS);
	inst->Callback(packet);
	LeaveCriticalSection(&inst->m_CS);
}

// コールバック
void clDeviceStateFile::Callback(const iBTL::PACKET_t &packet){
	// メソッド内は上層でクリティカルセクションで覆われている
	
	using namespace BTT;
	
	switch(packet.Msg){
	case MRX::FILE_OPEN_RET:	// ファイルを開いた結果を返す
	case MRX::FILE_WRITE_RET:	// ファイルに書き込んだ結果を返す
	case MRX::FILE_SEEK_RET:	// ファイルをシークした結果を返す
		if (packet.Length == sizeof(FILE_ANY_RET_t)){
			if ((m_File.Using == true) && (m_File.Error == false)){
				if (((packet.Msg == MRX::FILE_OPEN_RET) && (m_File.Operation == OPE_OPENING)) ||
					((packet.Msg == MRX::FILE_WRITE_RET) && (m_File.Operation == OPE_WRITING)) ||
					(packet.Msg == MRX::FILE_SEEK_RET)){
					// バッファに収まるかチェック
					if ((m_File.BufferSize == sizeof(FILE_ANY_RET_t)) && (m_File.Buffer != nullptr)){
						// あらゆる値が正常だったらコピー
						memcpy(m_File.Buffer, packet.Data, sizeof(FILE_ANY_RET_t));
						m_File.BufferRead = sizeof(FILE_ANY_RET_t);
						m_File.Operation = OPE_IDLE;
					}
				}
			}
		}
		break;

	case MRX::FILE_READ_RET:	// ファイルを読み込んだ結果を返す
		if ((m_File.Using == true) && (m_File.Error == false) && (m_File.Operation == OPE_READING)){
			// バッファに収まるかチェック
			FILE_READ_RET_t *file_read_ret = (FILE_READ_RET_t*)packet.Data;
			unsigned int length = packet.Length - sizeof(FILE_READ_RET_t);
			unsigned long long pointer = file_read_ret->Pointer;
			if ((m_File.Buffer != nullptr) && (length <= (m_File.BufferSize - m_File.BufferRead)) && (m_File.FilePtr == pointer)){
				memcpy((char*)m_File.Buffer + m_File.BufferRead, file_read_ret->Data, length);
				m_File.BufferRead += length;
				m_File.FilePtr += length;
				if (packet.Length < iBTL::MAX_PAYLOADSIZE){
					// 送れる最大サイズより小さいサイズで送られた場合、転送の終わりとみなす
					m_File.Operation = OPE_IDLE;
				}
			}else{
				// 要求したサイズを超えて送ってきた・シークポインターがずれたらエラー
				m_File.BufferRead = -1;
				m_File.Operation = OPE_IDLE;
			}
			
		}
		break;

	case MRX::FILE_READ_ERROR:	// ファイルを読み込んでエラーが起きた
		if ((m_File.Using == true) && (m_File.Error == false) && (m_File.Operation == OPE_READING)){
			m_File.BufferRead = -1;
			m_File.Operation = OPE_IDLE;
		}
		break;
	}
}



// リセット
void clDeviceStateFile::Reset(void){
	memset(const_cast<File_t*>(&m_File), 0x00, sizeof(File_t));
}

// アクセス許可が更新された
void clDeviceStateFile::PermissionChanged(void){
	clDeviceState *p = m_Parent;

	bool read, write;
	m_AllowRead = p->m_Capabilities[CAP_FILE_READ];
	m_AllowWrite = p->m_Capabilities[CAP_FILE_WRITE];
}



// ファイルを開く
int clDeviceStateFile::fopen(const wchar_t *wpath, const wchar_t *mode){
	using namespace BTT;

	int result = -1;

	Trace(L"fopen('%s','%s')", wpath, mode);

	bool cs = true;
	EnterCriticalSection(&m_CS);

	if (m_File.Using == true){
		LeaveCriticalSection(&m_CS);
		return result;
	}

	// ファイルパスを変換
	std::string path;
	unsigned int length;
	WCharToUTF8(path, wpath);
	length = path.size() + 1;
	if ((iBTL::MAX_PAYLOADSIZE - sizeof(FILE_OPEN_t)) <= length){
		LeaveCriticalSection(&m_CS);
		return result;
	}

	// モード文字列をフラグに変換
	unsigned int modi = 0;
	while(*mode != L'\0'){
		switch(*mode++){
		case L'c': modi |= CREATE; break;
		case L'o': modi |= OPEN; break;
		case L'r': modi |= READABLE; break;
		case L'w': modi |= WRITABLE; break;
		}
	}

	bool ret = false;
	do{
		// 実際にデバイスと通信する
		Trace(L"Communicating to device...");

		// 登録
		memset(const_cast<File_t*>(&m_File), 0x00, sizeof(File_t));
		m_File.Using = true;
		m_File.Modifiers = modi;
		
		// この時点で、ファイルは仮に開かれた状態になっているので、
		// 途中でクリティカルセクションを抜けても重複してfopenが進行することは無い

		// アクセス許可を確認する
		if ((m_AllowRead == false) && (modi & READABLE)) break;
		if ((m_AllowWrite == false) && (modi & (WRITABLE | CREATE | OPEN))) break;

		// FILE_OPEN_RETの受信準備
		FILE_ANY_RET_t file_open_ret;
		RxSetup(OPE_OPENING, &file_open_ret, sizeof(FILE_ANY_RET_t));

		cs = false;
		LeaveCriticalSection(&m_CS);

		// FILE_OPENを送る
		char buf[iBTL::MAX_PAYLOADSIZE];
		FILE_OPEN_t *file_open = (FILE_OPEN_t*)buf;
		file_open->Modifiers = modi;
		memcpy(file_open->Name, &path[0], length);
		ret = TxData(DTR::FILE, MTX::FILE_OPEN, file_open, sizeof(FILE_OPEN_t) + length);
		Trace(L"sent FILE_OPEN");
		if (ret == false) break;
		
		// 受信待ち
		ret = RxWait();
		if (ret == false) break;

		// 返り値を判定
		Trace(L"return=%d", file_open_ret.Status);
		ret = file_open_ret.Status == 1;
		if (ret == false) break;
		
		m_FilePath.assign(wpath);
		m_File.FilePtr	= file_open_ret.Pointer;
		m_File.FileSize	= file_open_ret.Size;
	}while(false);

	if (ret == true){
		// 成功
		result = 0;

		Trace(L"fopen succeeded");
	}else{
		// 失敗
		result = -1;

		Trace(L"fopen failed");

		if (cs == false){
			EnterCriticalSection(&m_CS);
		}

		// 登録を削除
		memset(const_cast<File_t*>(&m_File), 0x00, sizeof(File_t));

		LeaveCriticalSection(&m_CS);
	}

	return result;
}

// ファイルを閉じる
bool clDeviceStateFile::fclose(unsigned int handle){
	Trace(L"fclose()");

	EnterCriticalSection(&m_CS);

	bool ret = false;
	bool exception = false;
	do{
		if (0 < handle) break;
		if (m_File.Using == false) break;

		LeaveCriticalSection(&m_CS);

		// FILE_CLOSEを送る
		ret = TxData(DTR::FILE, MTX::FILE_CLOSE, nullptr, 0);
		exception = !ret;
		Trace(L"sent FILE_CLOSE");
		
		EnterCriticalSection(&m_CS);
		
		if (m_File.Modifiers & BTT::WRITABLE){
			// ファイル情報を更新
			std::wstring *path = new std::wstring(m_FilePath);
			emit changeFile(path, m_File.FileSize);
		}

		// 初期化
		memset(const_cast<File_t*>(&m_File), 0x00, sizeof(File_t));
	}while(false);

	LeaveCriticalSection(&m_CS);

	if (exception == true){
		Trace(L"Exception");
		throw L"fclose falied";
	}

	return ret;
}

// ファイルから読み取る
int clDeviceStateFile::fread(unsigned int handle, void *buf, unsigned int len){
	using namespace BTT;

	Trace(L"fread(%d)", len);

	bool cs = true;
	EnterCriticalSection(&m_CS);

	int result = -1;
	bool ret = false;
	do{
		if (0 < handle) break;
		if ((m_File.Using == false) || (m_File.Error == true)) break;
		if (~m_File.Modifiers & READABLE) break;
		
		if (m_File.FileSize < (m_File.FilePtr + len)){
			len = m_File.FileSize - m_File.FilePtr;
		}
		if ((signed int)len <= 0){
			result = 0;
			break;
		}

		// FILE_READ_RETの受信準備
		RxSetup(OPE_READING, buf, len);

		cs = false;
		LeaveCriticalSection(&m_CS);

		// FILE_READを送る
		FILE_READ_t file_read;
		file_read.Pointer	= m_File.FilePtr;
		file_read.Length	= len;
		ret = TxData(DTR::FILE, MTX::FILE_READ, &file_read, sizeof(FILE_READ_t));
		if (ret == false) break;
		Trace(L"sent FILE_READ");

		// 受信待ち
		ret = RxWait();
		if (ret == false) break;
		
		cs = true;
		EnterCriticalSection(&m_CS);

		// 結果を受け取る
		if (m_File.BufferRead < 0) break;
		result = m_File.BufferRead;
		m_File.BufferRead	= 0;

	}while(false);

	if (cs == true){
		LeaveCriticalSection(&m_CS);
	}

	if (result < 0){
		if (handle <= 0){
			if (m_File.Using == true){
				m_File.Error = true;		// 例外が起きたらエラーフラグを立てる
			}
		}

		Trace(L"Exception");
		throw L"fread falied";
	}

	return result;
}

// ファイルに書き込む
int clDeviceStateFile::fwrite(unsigned int handle, const void *buf, unsigned int len){
	using namespace BTT;

	Trace(L"fwrite(%d)", len);

	bool cs = true;
	EnterCriticalSection(&m_CS);

	int result = -1;
	bool ret = false;
	do{
		if (0 < handle) break;
		if ((m_File.Using == false) || (m_File.Error == true)) break;
		if (~m_File.Modifiers & WRITABLE) break;

		// FILE_WRITE_RETの受信準備
		FILE_ANY_RET_t file_write_ret;
		RxSetup(OPE_WRITING, &file_write_ret, sizeof(FILE_ANY_RET_t));

		cs = false;
		LeaveCriticalSection(&m_CS);

		// FILE_WRITEを送る
		Trace(L"sending FILE_WRITE");
		char buffer[iBTL::MAX_PAYLOADSIZE];
		FILE_WRITE_t *file_write = (FILE_WRITE_t*)buffer;
		unsigned int payload = iBTL::MAX_PAYLOADSIZE - sizeof(FILE_WRITE_t);
		unsigned long long pointer = m_File.FilePtr;
		while(0 < len){
			unsigned int tlen = (len <= payload) ? len : payload;
			
			file_write->Pointer = pointer;
			memcpy(file_write->Data, buf, tlen);
			ret = TxData(DTR::FILE, MTX::FILE_WRITE, file_write, sizeof(FILE_WRITE_t) + tlen);
			if (ret == false) break;
			buf = (const char*)buf + tlen;
			len -= tlen;
			pointer += tlen;
		}
		if (ret == false) break;
		
		// ゼロ長パケットを送る
		// これによってデバイスからFILE_WRITE_RETが返される
		file_write->Pointer = pointer;
		ret = TxData(DTR::FILE, MTX::FILE_WRITE, file_write, sizeof(FILE_WRITE_t));
		if (ret == false) break;

		// 受信待ち
		ret = RxWait();
		if (ret == false) break;

		cs = true;
		EnterCriticalSection(&m_CS);

		// 進んだポインタを元に書き込めた長さを計算
		unsigned long long ret_pointer = file_write_ret.Pointer;
		Trace(L"pointer = %lld, %lld, %lld", ret_pointer, pointer, m_File.FilePtr);
		if (file_write_ret.Status != 1) break;
		if ((signed long long)ret_pointer < 0) break;
		if (ret_pointer < m_File.FilePtr) break;
		result = ret_pointer - m_File.FilePtr;
		m_File.FilePtr = ret_pointer;
		m_File.FileSize = file_write_ret.Size;
	}while(false);

	if (cs == true){
		LeaveCriticalSection(&m_CS);
	}

	if (result < 0){
		if (handle <= 0){
			if (m_File.Using == true){
				m_File.Error = true;		// 例外が起きたらエラーフラグを立てる
			}
		}

		Trace(L"Exception");
		throw L"fwrite falied";
	}

	return result;
}

// ファイルをシークする
bool clDeviceStateFile::fseek(unsigned int handle, unsigned long long addr){
	using namespace BTT;

	Trace(L"fseek(%d)", addr);
	
	bool cs = true;
	EnterCriticalSection(&m_CS);

	bool exception = true;
	bool ret = false;
	do{
		if (0 < handle) break;
		if ((m_File.Using == false) || (m_File.Error == true)) break;
		
		if (m_File.FileSize < addr){
			addr = m_File.FileSize;
		}

		// FILE_SEEK_RETの受信準備
		FILE_ANY_RET_t file_seek_ret;
		RxSetup(OPE_SEEKING, &file_seek_ret, sizeof(FILE_ANY_RET_t));

		cs = false;
		LeaveCriticalSection(&m_CS);

		// FILE_SEEKを送る
		FILE_SEEK_t file_seek;
		file_seek.Pointer = addr;
		ret = TxData(DTR::FILE, MTX::FILE_SEEK, &file_seek, sizeof(FILE_SEEK_t));
		if (ret == false) break;
		Trace(L"sent FILE_SEEK");

		// 受信待ち
		ret = RxWait();
		if (ret == false) break;
		
		EnterCriticalSection(&m_CS);
		cs = true;

		// 結果を受け取る
		exception = file_seek_ret.Status != 1;
		m_File.FilePtr = file_seek_ret.Pointer;
		m_File.FileSize = file_seek_ret.Size;
		ret = true;

	}while(false);

	if (cs == true){
		LeaveCriticalSection(&m_CS);
	}

	if (exception == true){
		if (handle <= 0){
			if (m_File.Using == true){
				m_File.Error = true;		// 例外が起きたらエラーフラグを立てる
			}
		}

		Trace(L"Exception");
		throw L"fseek falied";
	}

	return ret;
}

// ファイルのシークポインタを取得
unsigned long long clDeviceStateFile::ftell(unsigned int handle){
	if (handle <= 0){
		if ((m_File.Using == true) && (m_File.Error == false)){
			return m_File.FilePtr;
		}
	}

	Trace(L"Exception");
	throw L"ftell falied";
	return 0;
}

// ファイルサイズを取得
unsigned long long clDeviceStateFile::fsize(unsigned int handle){
	if (handle <= 0){
		if ((m_File.Using == true) && (m_File.Error == false)){
			return m_File.FileSize;
		}
	}

	Trace(L"Exception");
	throw L"fsize falied";
	return 0;
}



// データを送信する
bool clDeviceStateFile::TxData(const iBTL::PACKET_t &packet){
	if (iBTL::MAX_PAYLOADSIZE < packet.Length) return false;

	bool result = false;
	int count = TIMEOUT_COUNT;
	for(; 0 < count; count--){
		result = m_Parent->TxData(packet);
		if (result == true) break;
		if (m_File.Error == true) break;
		Sleep(TIMEOUT_PERIOD);
	}

	return result;
}
bool clDeviceStateFile::TxData(unsigned int dest, unsigned int msg, const void *data, unsigned int len){
	if (iBTL::MAX_PAYLOADSIZE < len) return false;

	// データをPACKET_tに詰める
	iBTL::PACKET_t packet;
	packet.Dest		= dest;
	packet.Msg		= msg;
	packet.Length	= len;
	if (data != nullptr){
		memcpy(packet.Data, data, len);
	}

	bool result = false;
	int count = TIMEOUT_COUNT;
	for(; 0 < count; count--){
		result = m_Parent->TxData(packet);
		if (result == true) break;
		if (m_File.Error == true) break;
		Sleep(TIMEOUT_PERIOD);
	}

	return result;
}

// データの受信準備をする
void clDeviceStateFile::RxSetup(Operation_e ope, void *buf, unsigned int len){
	m_File.Operation	= ope;
	m_File.Buffer		= buf;
	m_File.BufferSize	= len;
	m_File.BufferRead	= 0;
}

// データの受信を待つ
// 結果にかかわらず、受信状態は解除される
bool clDeviceStateFile::RxWait(void){
	EnterCriticalSection(&m_CS);

	int count = TIMEOUT_COUNT;
	for(; 0 < count; count--){
		if (m_File.Operation == OPE_IDLE) break;
		if (m_File.Error == true) break;
		LeaveCriticalSection(&m_CS);
		Sleep(TIMEOUT_PERIOD);
		EnterCriticalSection(&m_CS);
	}

	bool result = (m_File.Operation == OPE_IDLE) & !m_File.Error;
	int read_byte = m_File.BufferRead;

	// 受信状態を解除
	RxSetup(OPE_IDLE, nullptr, 0);
	m_File.BufferRead = read_byte;

	LeaveCriticalSection(&m_CS);

	return result;
}


