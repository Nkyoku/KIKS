// DeviceState中のディレクトリ関連の分割

#include "DeviceStateDir.h"
#include "trace.h"
#include "convstr.h"



// コンストラクタ
clDeviceStateDir::clDeviceStateDir(clDeviceState *parent) : m_Parent(parent){
	// 変数初期化
	
	
	

}
	
// デストラクタ
clDeviceStateDir::~clDeviceStateDir(){
	
}

// コールバックを設定
void clDeviceStateDir::SetCallback(void){
	m_Parent->m_Device->RxDataRegister(DTR::DIR, this, StaticCallback);
}

// コールバック
void clDeviceStateDir::StaticCallback(void *inst_, const iBTL::PACKET_t &packet){
	clDeviceStateDir *inst = (clDeviceStateDir*)inst_;
	inst->Callback(packet);
}
void clDeviceStateDir::Callback(const iBTL::PACKET_t &packet){
	using namespace BTT;

	// 共通メッセージ
	clDeviceState *p = m_Parent;
	switch(packet.Msg){
	case MRX::DIR_ENUM_CLEAR:	// ディレクトリの内容をクリアする
		{
			std::wstring path;
			UTF8ToWString(path, packet.Data, packet.Length);
			emit initTree(path);
		}
		break;

	case MRX::DIR_ENUM_RET:			// ディレクトリの内容を返す
		if (sizeof(DIR_ENUM_RET_t) < packet.Length){
			DIR_ENUM_RET_t *dir_enum_ret = (DIR_ENUM_RET_t*)packet.Data;
			// データの簡単なチェック
			if ((dir_enum_ret->Usage <= dir_enum_ret->Size) && ((dir_enum_ret->DirSFNFlag & 0xFE) == 0)){
				std::wstring name;	
				UTF8ToWString(name, dir_enum_ret->Name, packet.Length - sizeof(DIR_ENUM_RET_t));
				if (dir_enum_ret->Letter != '\0'){
					// ドライブ
					emit addDrive(dir_enum_ret->Letter, name, dir_enum_ret->DirSFNFlag, dir_enum_ret->Size);
					emit changeDriveStatus(dir_enum_ret->Letter, dir_enum_ret->Usage);
				}else{
					// ファイル・ディレクトリ
					emit addItem(name, dir_enum_ret->Size, dir_enum_ret->DirSFNFlag, dir_enum_ret->Date);
					emit moveUp();
				}
			}
		}
		break;

	case MRX::DIR_ANY_ERROR:			// ディレクトリ・ファイルの操作でエラーが起きた
		if (packet.Length == 0){
			m_ErrorOccured = true;
		}
		break;
	}
}

// リセット
void clDeviceStateDir::Reset(void){
	//clDeviceState *p = m_Parent;
	
	// アクセスを不許可にする
	m_AllowRead = false;
	m_AllowWrite = false;

	// ツリー初期化
	emit initTree();
}

// アクセス許可が更新された
void clDeviceStateDir::PermissionChanged(void){
	clDeviceState *p = m_Parent;

	bool read, write;
	read = p->m_Capabilities[CAP_DIR_READ];
	write = p->m_Capabilities[CAP_DIR_WRITE] & read;

	if ((read ^ m_AllowRead) | (write ^ m_AllowWrite)){
		// アクセス許可を設定
		m_AllowRead = read;
		m_AllowWrite = write;
		
		// ツリー更新
		updateRequest();
	}
}



// ツリーを更新する
void clDeviceStateDir::updateRequest(const std::wstring &path){
	if (m_AllowRead == true){
		std::string utf8_path;
		WCharToUTF8(utf8_path, path.c_str(), path.size() + 1);
		if (utf8_path.size() < iBTL::MAX_PAYLOADSIZE){
			// 送信
			TxData(DTR::DIR, MTX::DIR_ENUM, utf8_path.c_str(), utf8_path.size() + 1);
		}
	}
}

// ファイル・ディレクトリの移動・リネーム
void clDeviceStateDir::moveRequest(const std::wstring &dst_path, const std::wstring &src_path){
	if (m_AllowWrite == true){
		std::wstring path(dst_path);
		std::string utf8_path;
		path.append(L"?");
		path.append(src_path);
		WCharToUTF8(utf8_path, path.c_str(), path.size() + 1);
		if (utf8_path.size() < iBTL::MAX_PAYLOADSIZE){
			// 送信
			TxData(DTR::DIR, MTX::DIR_MOVE, utf8_path.c_str(), utf8_path.size() + 1);
		}
	}
}

// ファイル・ディレクトリのコピー
void clDeviceStateDir::copyRequest(const std::wstring &dst_path, const std::wstring &src_path){
	// 未実装
}

// ファイル・ディレクトリの削除
void clDeviceStateDir::deleteRequest(const std::wstring &path){
	if (m_AllowWrite == true){
		std::string utf8_path;
		WCharToUTF8(utf8_path, path.c_str(), path.size() + 1);
		if (utf8_path.size() < iBTL::MAX_PAYLOADSIZE){
			// 送信
			TxData(DTR::DIR, MTX::DIR_REMOVE, utf8_path.c_str(), utf8_path.size() + 1);
		}
	}
}

// ディレクトリの作成
void clDeviceStateDir::mkdirRequest(const std::wstring &path){
	if (m_AllowWrite == true){
		std::string utf8_path;
		WCharToUTF8(utf8_path, path.c_str(), path.size() + 1);
		if (utf8_path.size() < iBTL::MAX_PAYLOADSIZE){
			// 送信
			TxData(DTR::DIR, MTX::DIR_CREATE, utf8_path.c_str(), utf8_path.size() + 1);
		}
	}
}





// データを送信する
bool clDeviceStateDir::TxData(const iBTL::PACKET_t &packet){
	if (iBTL::MAX_PAYLOADSIZE < packet.Length) return false;

	bool result = false;
	int count = TIMEOUT_COUNT;
	for(; 0 < count; count--){
		result = m_Parent->TxData(packet);
		if (result == true) break;
		if (m_ErrorOccured == true) break;
		Sleep(TIMEOUT_PERIOD);
	}

	return result;
}
bool clDeviceStateDir::TxData(unsigned int dest, unsigned int msg, const void *data, unsigned int len){
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
		if (m_ErrorOccured == true) break;
		Sleep(TIMEOUT_PERIOD);
	}

	return result;
}

/*// データの受信準備をする
void clDeviceStateDir::RxSetup(volatile LinkItem_t &link, Operation_e ope, void *buf, unsigned int len){
	link.Operation	= ope;
	link.Buffer		= buf;
	link.BufferSize	= len;
	link.BufferRead	= 0;
}

// データの受信を待つ
// 結果にかかわらず、受信状態は解除される
bool clDeviceStateDir::RxWait(volatile LinkItem_t &link){
	EnterCriticalSection(&m_CS);

	volatile Operation_e &ope = link.Operation;
	volatile bool &cancel = link.Error;

	int count = TIMEOUT_COUNT;
	for(; 0 < count; count--){
		if (ope == OPE_IDLE) break;
		if (cancel == true) break;
		LeaveCriticalSection(&m_CS);
		Sleep(TIMEOUT_PERIOD);
		EnterCriticalSection(&m_CS);
	}

	bool result = (ope == OPE_IDLE) & !cancel;
	int read_byte = link.BufferRead;

	// 受信状態を解除
	RxSetup(link, OPE_IDLE, nullptr, 0);
	link.BufferRead = read_byte;

	LeaveCriticalSection(&m_CS);

	return result;
}
*/

