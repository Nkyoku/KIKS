// DeviceState中のパイプ関連の分割

#include "DeviceStatePipe.h"
#include "trace.h"
#include "convstr.h"



// コンストラクタ
clDeviceStatePipe::clDeviceStatePipe(clDeviceState *parent) : m_Parent(parent){
	// 変数初期化
	m_NumOfLinks = 0;
	m_NumOfUsingLinks = 0;
	memset(const_cast<LinkItem_t*>(&m_LinkList[0]), 0x00, sizeof(m_LinkList));

	// クリティカルセクション初期化
	InitializeCriticalSectionAndSpinCount(&m_CS, 4000);
}
	
// デストラクタ
clDeviceStatePipe::~clDeviceStatePipe(){
	// クリティカルセクション破棄
	DeleteCriticalSection(&m_CS);
}

// コールバックを設定
void clDeviceStatePipe::SetCallback(void){
	m_NumOfUsingLinks = 0;
	memset(const_cast<LinkItem_t*>(&m_LinkList[0]), 0x00, sizeof(m_LinkList));
	for(int cnt = 0; cnt < MAX_LINKS; cnt++){
		m_Parent->m_Device->RxDataRegister(DTR::PIPE0 + cnt, this, StaticCallback);
		m_Parent->TxData(DTR::PIPE0 + cnt, MTX::PIPE_CLOSE, nullptr, 0);
	}
}

// リンク数を設定
void clDeviceStatePipe::SetNumOfPipeLinks(int pipe_links){
	EnterCriticalSection(&m_CS);
	
	m_NumOfLinks = (pipe_links <= MAX_LINKS) ? pipe_links : MAX_LINKS;

	// リンクを初期したのち、Usingフラグが立っていたリンクにエラーフラグを立てる
	bool using_flag[MAX_LINKS];
	for(int cnt = 0; cnt < MAX_LINKS; cnt++){
		using_flag[cnt] = m_LinkList[cnt].Using;

	}
	
	memset(const_cast<LinkItem_t*>(&m_LinkList[0]), 0x00, sizeof(m_LinkList));
	for(int cnt = 0; cnt < MAX_LINKS; cnt++){
		m_LinkList[cnt].Using = using_flag[cnt];
		m_LinkList[cnt].Error = using_flag[cnt];
	}

	LeaveCriticalSection(&m_CS);
}

// コールバック
void clDeviceStatePipe::StaticCallback(void *inst_, const iBTL::PACKET_t &packet){
	clDeviceStatePipe *inst = (clDeviceStatePipe*)inst_;
	EnterCriticalSection(&inst->m_CS);
	inst->Callback(packet);
	LeaveCriticalSection(&inst->m_CS);
}

// コールバック
void clDeviceStatePipe::Callback(const iBTL::PACKET_t &packet){
	// メソッド内は上層でクリティカルセクションで覆われている
	
	using namespace BTT;
	
	// 共通メッセージ
	clDeviceState *p = m_Parent;
	switch(packet.Msg){
	case MRX::PIPE_ENUM_CLEAR:	// パイプの一覧をクリアする
		Reset();
		Trace(L"Pipe Reset");
		return;
	
	case MRX::PIPE_ENUM_RET:	// パイプの一覧を返す
		if (packet.Length == sizeof(PIPE_INFO_t)){
			const PIPE_INFO_t *info = (const PIPE_INFO_t*)packet.Data;
			PipeItem_t item;
			CharToWString(item.PipeName, info->PipeName, PIPE_INFO_NAME_LENGTH);
			item.PipeSize	= info->PipeSize;
			item.WriteUnit	= info->WriteUnit;
			item.Modifiers	= info->Modifiers;
			if (item.WriteUnit < 1) item.WriteUnit = 1;		// 書き込み単位は1以上
			m_PipeList.push_back(item);
			
			Trace(L"Pipe Added '%s' %X", item.PipeName.c_str(), item.Modifiers);
			
			// 追加されたパイプによって処理する
			if (item.PipeName == PIPE_NAME_PROCESSOR){
				p->m_Functions[FUNC_PROCESSOR_READ]		= (item.Modifiers & RS) == RS;
				p->m_Functions[FUNC_PROCESSOR_WRITE]	= (item.Modifiers & WS) == WS;
			}else if (item.PipeName == PIPE_NAME_BITSTREAM){
				p->m_Functions[FUNC_BITSTREAM_SEND]		= item.Modifiers & WRITABLE;
			}else if (item.PipeName == PIPE_NAME_COPROCESSOR){
				p->m_Functions[FUNC_COPROCESSOR_SEND]	= item.Modifiers & WRITABLE;
			}else if (item.PipeName == PIPE_NAME_CONTROLLER){
				p->m_Functions[FUNC_CONTROLLER_WRITE]	= item.Modifiers & WRITABLE;
			}else if (item.PipeName == PIPE_NAME_LOGGER){
				p->m_Functions[FUNC_LOGGER_READ]		= (item.Modifiers & RW) == RW;
			}else{
				
				
				
			}
			
			// フラグが変わったかもしれないのでウィジェットを更新
			p->UpdateWidgets();
			
			// アクセス修飾子の文字列を作成
			wchar_t buf[4] = L"---";
			if (item.Modifiers & READABLE)	buf[0] = L'R';
			if (item.Modifiers & WRITABLE)	buf[1] = L'W';
			if (item.Modifiers & SEEKABLE)	buf[2] = L'S';
			emit addPipe(item.PipeName.c_str(), item.PipeSize, item.WriteUnit, buf);
		}
		return;
	}
	
	
	
	// 個別メッセージ
	unsigned int link_index = packet.Dest - DTR::PIPE0;
	if (m_NumOfLinks <= link_index) return;
	volatile LinkItem_t &link = m_LinkList[link_index];

	switch(packet.Msg){
	case MRX::PIPE_OPEN_RET:	// パイプを開いた結果を返す
		if (packet.Length == sizeof(PIPE_OPEN_RET_t)){
			if ((link.Using == true) && (link.Error == false) && (link.Operation == OPE_OPENING)){
				// バッファに収まるかチェック
				if ((link.BufferSize == sizeof(PIPE_OPEN_RET_t)) && (link.Buffer != nullptr)){
					// あらゆる値が正常だったらコピー
					memcpy(link.Buffer, packet.Data, sizeof(PIPE_OPEN_RET_t));
					link.BufferRead = sizeof(PIPE_OPEN_RET_t);
					link.Operation = OPE_IDLE;
				}
			}
		}
		break;

	case MRX::PIPE_READ_RET:	// パイプを読み込んだ結果を返す
		if ((link.Using == true) && (link.Error == false) && (link.Operation == OPE_READING)){
			// バッファに収まるかチェック
			PIPE_READ_RET_t *pipe_read_ret = (PIPE_READ_RET_t*)packet.Data;
			unsigned int length = packet.Length - sizeof(PIPE_READ_RET_t);
			unsigned int pointer = pipe_read_ret->Pointer;
			if ((link.Buffer != nullptr) && (length <= (link.BufferSize - link.BufferRead)) && (link.Pointer == pointer)){
				memcpy((char*)link.Buffer + link.BufferRead, pipe_read_ret->Data, length);
				link.BufferRead += length;
				if (link.Info->PipeSize != 0){
					link.Pointer += length;
				}
				if (packet.Length < iBTL::MAX_PAYLOADSIZE){
					// 送れる最大サイズより小さいサイズで送られた場合、転送の終わりとみなす
					link.Operation = OPE_IDLE;
				}
			}else{
				// 要求したサイズを超えて送ってきた・シークポインターがずれたらエラー
				link.BufferRead = -1;
				link.Operation = OPE_IDLE;
			}
			
		}
		break;

	case MRX::PIPE_READ_ERROR:	// パイプを読み込んでエラーが起きた
		if ((link.Using == true) && (link.Error == false) && (link.Operation == OPE_READING)){
			link.BufferRead = -1;
			link.Operation = OPE_IDLE;
		}
		break;

	case MRX::PIPE_WRITE_RET:	// パイプに書き込んだ結果を返す
		if (packet.Length == sizeof(PIPE_WRITE_RET_t)){
			if ((link.Using == true) && (link.Error == false) && (link.Operation == OPE_WRITING)){
				// バッファに収まるかチェック
				if ((link.BufferSize == sizeof(PIPE_WRITE_RET_t)) && (link.Buffer != nullptr)){
					// あらゆる値が正常だったらコピー
					memcpy(link.Buffer, packet.Data, sizeof(PIPE_WRITE_RET_t));
					link.BufferRead = sizeof(PIPE_WRITE_RET_t);
					link.Operation = OPE_IDLE;
				}
			}
		}
		break;

	case MRX::PIPE_SEEK_RET:	// パイプをシークした結果を返す
		if (packet.Length == sizeof(PIPE_SEEK_RET_t)){
			if ((link.Using == true) && (link.Error == false) && (link.Operation == OPE_SEEKING)){
				// バッファに収まるかチェック
				if ((link.BufferSize == sizeof(PIPE_SEEK_RET_t)) && (link.Buffer != nullptr)){
					// あらゆる値が正常だったらコピー
					memcpy(link.Buffer, packet.Data, sizeof(PIPE_SEEK_RET_t));
					link.BufferRead = sizeof(PIPE_SEEK_RET_t);
					link.Operation = OPE_IDLE;
				}
			}
		}
		break;
	}
}



// リセット
void clDeviceStatePipe::Reset(void){
	clDeviceState *p = m_Parent;
	
	m_PipeList.clear();
	
	SetNumOfPipeLinks(0);

	p->m_Functions[FUNC_PROCESSOR_READ]		= false;
	p->m_Functions[FUNC_PROCESSOR_WRITE]	= false;
	p->m_Functions[FUNC_BITSTREAM_SEND]		= false;
	p->m_Functions[FUNC_COPROCESSOR_SEND]	= false;
	p->m_Functions[FUNC_CONTROLLER_WRITE]	= false;
	p->m_Functions[FUNC_LOGGER_READ]		= false;

	// ウィジェットを更新
	p->UpdateWidgets();

	emit clearPipe();
}



// パイプを開く
int clDeviceStatePipe::popen(const wchar_t *name, const wchar_t *mode){
	int result = -1;

	Trace(L"popen('%s','%s')", name, mode);

	EnterCriticalSection(&m_CS);

	if (m_NumOfLinks <= m_NumOfUsingLinks){
		LeaveCriticalSection(&m_CS);
		return result;
	}

	// モード文字列をフラグに変換
	unsigned int modi = 0;
	while(*mode != L'\0'){
		switch(*mode++){
		case L'r': modi |= BTT::READABLE; break;
		case L'w': modi |= BTT::WRITABLE; break;
		case L's': modi |= BTT::SEEKABLE; break;
		}
	}

	unsigned int pipe_index = 0;
	unsigned int link_index = 0;
	volatile LinkItem_t *link;
	do{
		// パイプが存在するか調べる
		int pipe_count = m_PipeList.size();
		for(; pipe_index < pipe_count; pipe_index++){
			if (m_PipeList[pipe_index].PipeName == name){
				break;
			}
		}
		if (pipe_count <= pipe_index) break;

		// オープンモードをクリアするか
		if ((m_PipeList[pipe_index].Modifiers & modi) != modi) break;

		// リンクリストに空きがあるか、いやある
		for(; link_index < m_NumOfLinks; link_index++){
			if (m_LinkList[link_index].Using == false){
				break;
			}
		}
		if (m_NumOfLinks <= link_index) break;

		Trace(L"pipe_index=%d", pipe_index);
		Trace(L"link_index=%d", link_index);

		// リンクリストに登録
		volatile LinkItem_t &link = m_LinkList[link_index];
		link.Using		= true;
		link.Error		= false;
		link.Info		= &m_PipeList[pipe_index];
		link.Modifiers	= modi;
		link.Pointer	= 0;
		m_NumOfUsingLinks++;

		result = 0;
	}while(false);

	LeaveCriticalSection(&m_CS);

	if (0 <= result){
		using namespace BTT;

		volatile LinkItem_t &link = m_LinkList[link_index];
		unsigned int dest = DTR::PIPE0 + link_index;
		
		bool ret = false;
		do{
			EnterCriticalSection(&m_CS);
			
			// 実際にデバイスと通信する
			Trace(L"Communicating to device...");

			// PIPE_OPEN_RETの受信準備
			PIPE_OPEN_RET_t pipe_open_ret;
			RxSetup(link, OPE_OPENING, &pipe_open_ret, sizeof(PIPE_OPEN_RET_t));

			LeaveCriticalSection(&m_CS);

			// PIPE_OPENを送る
			PIPE_OPEN_t pipe_open;
			WCharToChar(pipe_open.PipeName, PIPE_OPEN_NAME_LENGTH, link.Info->PipeName.c_str(), PIPE_OPEN_NAME_LENGTH);
			pipe_open.Modifiers = modi;
			ret = TxData(link, dest, MTX::PIPE_OPEN, &pipe_open, sizeof(PIPE_OPEN_t));
			Trace(L"sent PIPE_OPEN");
			if (ret == false) break;

			// 受信待ち
			ret = RxWait(link);
			if (ret == false) break;

			// 返り値を判定
			Trace(L"return=%d", pipe_open_ret.Status);
			ret = pipe_open_ret.Status == 1;
			if (ret == false) break;
			
		}while(false);
		if (ret == true){
			// 成功
			result = link_index;

			Trace(L"popen succeeded handle=%d", link_index);
		}else{
			// 失敗
			result = -1;

			Trace(L"popen failed");

			// リンクリストからはずす
			EnterCriticalSection(&m_CS);
			link.Using		= false;
			link.Error		= false;
			link.Info		= nullptr;
			m_NumOfUsingLinks--;
			LeaveCriticalSection(&m_CS);
		}
	}

	return result;
}

// パイプを閉じる
bool clDeviceStatePipe::pclose(unsigned int handle){
	Trace(L"pclose(%d)", handle);

	EnterCriticalSection(&m_CS);

	bool ret = false;
	bool exception = false;
	do{
		if (m_NumOfLinks <= handle) break;

		volatile LinkItem_t &link = m_LinkList[handle];
		if (link.Using == false) break;

		LeaveCriticalSection(&m_CS);

		// PIPE_CLOSEを送る
		unsigned int dest = DTR::PIPE0 + handle;
		ret = TxData(link, dest, MTX::PIPE_CLOSE, nullptr, 0);
		exception = !ret;
		Trace(L"sent PIPE_CLOSE");
		
		EnterCriticalSection(&m_CS);

		// 初期化
		memset(const_cast<LinkItem_t*>(&m_LinkList[handle]), 0x00, sizeof(LinkItem_t));
		m_NumOfUsingLinks--;
	}while(false);

	LeaveCriticalSection(&m_CS);

	if (exception == true){
		Trace(L"Exception");
		throw L"pclose falied";
	}

	return ret;
}

// パイプから読み取る
int clDeviceStatePipe::pread(unsigned int handle, void *buf, unsigned int len){
	using namespace BTT;

	Trace(L"pread(%d,%d)", handle, len);

	int result = -1;
	bool ret = false;
	bool cs = false;
	do{
		if (m_NumOfLinks <= handle) break;

		unsigned int dest = DTR::PIPE0 + handle;
		volatile LinkItem_t &link = m_LinkList[handle];

		if ((link.Using == false) || (link.Error == true)) break;
		if (~link.Modifiers & READABLE) break;

		if (link.Info->PipeSize != 0){
			if (link.Info->PipeSize < (link.Pointer + len)){
				len = link.Info->PipeSize - link.Pointer;
			}
		}
		if ((signed int)len <= 0){
			result = 0;
			break;
		}

		EnterCriticalSection(&m_CS);

		// PIPE_READ_RETの受信準備
		RxSetup(link, OPE_READING, buf, len);

		LeaveCriticalSection(&m_CS);

		// PIPE_READを送る
		PIPE_READ_t pipe_read;
		pipe_read.Pointer	= link.Pointer;
		pipe_read.Length	= len;
		ret = TxData(link, dest, MTX::PIPE_READ, &pipe_read, sizeof(PIPE_READ_t));
		if (ret == false) break;
		Trace(L"sent PIPE_READ");

		// 受信待ち
		ret = RxWait(link);
		if (ret == false) break;
		
		EnterCriticalSection(&m_CS);
		cs = true;

		// 結果を受け取る
		if (link.BufferRead < 0) break;
		result = link.BufferRead;
		link.BufferRead	= 0;

	}while(false);

	if (cs == true){
		LeaveCriticalSection(&m_CS);
	}

	if (result < 0){
		if (handle < m_NumOfLinks){
			volatile LinkItem_t &link = m_LinkList[handle];
			if (link.Using == true){
				link.Error = true;		// 例外が起きたらエラーフラグを立てる
			}
		}

		Trace(L"Exception");
		throw L"pread falied";
	}

	return result;
}

// パイプに書き込む
int clDeviceStatePipe::pwrite(unsigned int handle, const void *buf, unsigned int len){
	using namespace BTT;

	Trace(L"pwrite(%d,%d)", handle, len);

	int result = -1;
	bool ret = false;
	bool cs = false;
	do{
		if (m_NumOfLinks <= handle) break;

		unsigned int dest = DTR::PIPE0 + handle;
		volatile LinkItem_t &link = m_LinkList[handle];
		bool have_size = link.Info->PipeSize != 0;

		if ((link.Using == false) || (link.Error == true)) break;
		if (~link.Modifiers & WRITABLE) break;

		if (have_size == true){
			if (link.Info->PipeSize < (link.Pointer + len)){
				len = link.Info->PipeSize - link.Pointer;
			}
		}
		if ((signed int)len <= 0){
			result = 0;
			break;
		}

		EnterCriticalSection(&m_CS);

		// PIPE_WRITE_RETの受信準備
		PIPE_WRITE_RET_t pipe_write_ret;
		RxSetup(link, OPE_WRITING, &pipe_write_ret, sizeof(PIPE_WRITE_RET_t));

		LeaveCriticalSection(&m_CS);

		// PIPE_WRITEを送る
		Trace(L"sending PIPE_WRITE");
		char buffer[iBTL::MAX_PAYLOADSIZE];
		PIPE_WRITE_t *pipe_write = (PIPE_WRITE_t*)buffer;
		unsigned int unit = link.Info->WriteUnit;
		unsigned int payload = ((iBTL::MAX_PAYLOADSIZE - sizeof(PIPE_WRITE_t)) / unit) * unit;
		unsigned int pointer = link.Pointer;
		while(0 < len){
			unsigned int tlen = (len <= payload) ? len : payload;
			
			pipe_write->Pointer = pointer;
			memcpy(pipe_write->Data, buf, tlen);
			ret = TxData(link, dest, MTX::PIPE_WRITE, pipe_write, tlen + sizeof(PIPE_WRITE_t));
			if (ret == false) break;
			buf = (const char*)buf + tlen;
			len -= tlen;
			if (have_size == true){
				pointer += tlen;
			}
		}
		if (ret == false) break;
		
		// ゼロ長パケットを送る
		// これによってデバイスからPIPE_WRITE_RETが返される
		pipe_write->Pointer = pointer;
		ret = TxData(link, dest, MTX::PIPE_WRITE, pipe_write, sizeof(PIPE_WRITE_t));
		if (ret == false) break;

		// 受信待ち
		ret = RxWait(link);
		if (ret == false) break;

		EnterCriticalSection(&m_CS);
		cs = true;

		// 進んだポインタを元に書き込めた長さを計算
		unsigned int ret_pointer = pipe_write_ret.Pointer;
		Trace(L"pointer = %d, %d, %d", ret_pointer, pointer, link.Pointer);
		if ((signed int)ret_pointer < 0) break;
		if (ret_pointer < link.Pointer) break;
		result = ret_pointer - link.Pointer;
		link.Pointer = ret_pointer;
	}while(false);

	if (cs == true){
		LeaveCriticalSection(&m_CS);
	}

	if (result < 0){
		if (handle < m_NumOfLinks){
			volatile LinkItem_t &link = m_LinkList[handle];
			if (link.Using == true){
				link.Error = true;		// 例外が起きたらエラーフラグを立てる
			}
		}

		Trace(L"Exception");
		throw L"pwrite falied";
	}

	return result;
}

// パイプをシークする
bool clDeviceStatePipe::pseek(unsigned int handle, unsigned int addr){
	using namespace BTT;

	Trace(L"pseek(%d,%d)", handle, addr);
	
	bool exception = true;
	bool ret = false;
	bool cs = false;
	do{
		if (m_NumOfLinks <= handle) break;

		unsigned int dest = DTR::PIPE0 + handle;
		volatile LinkItem_t &link = m_LinkList[handle];

		if ((link.Using == false) || (link.Error == true)) break;
		if (~link.Modifiers & SEEKABLE) break;

		if (link.Info->PipeSize != 0){
			if (link.Info->PipeSize < addr){
				addr = link.Info->PipeSize;
			}
		}else{
			// サイズなしパイプにシークは無い
			exception = false;
			break;
		}

		EnterCriticalSection(&m_CS);

		// PIPE_SEEK_RETの受信準備
		PIPE_SEEK_RET_t pipe_seek_ret;
		RxSetup(link, OPE_SEEKING, &pipe_seek_ret, sizeof(PIPE_SEEK_RET_t));

		LeaveCriticalSection(&m_CS);

		// PIPE_SEEKを送る
		PIPE_SEEK_t pipe_seek;
		pipe_seek.Pointer = addr;
		ret = TxData(link, dest, MTX::PIPE_SEEK, &pipe_seek, sizeof(PIPE_SEEK_t));
		if (ret == false) break;
		Trace(L"sent PIPE_SEEK");

		// 受信待ち
		ret = RxWait(link);
		if (ret == false) break;
		
		EnterCriticalSection(&m_CS);
		cs = true;

		// 結果を受け取る
		exception = pipe_seek_ret.Status != 1;
		ret = true;
		link.Pointer = addr;
	}while(false);

	if (cs == true){
		LeaveCriticalSection(&m_CS);
	}

	if (exception == true){
		if (handle < m_NumOfLinks){
			volatile LinkItem_t &link = m_LinkList[handle];
			if (link.Using == true){
				link.Error = true;		// 例外が起きたらエラーフラグを立てる
			}
		}

		Trace(L"Exception");
		throw L"pseek falied";
	}

	return ret;
}

// パイプのシークポインタを取得
unsigned int clDeviceStatePipe::ptell(unsigned int handle){
	if (handle < m_NumOfLinks){
		volatile LinkItem_t &link = m_LinkList[handle];
		if ((link.Using == true) && (link.Error == false)){
			if (link.Info->PipeSize != 0){
				return link.Pointer;
			}else{
				return 0;
			}
		}
	}

	Trace(L"Exception");
	throw L"ptell falied";
	return 0;
}

// パイプサイズを取得
unsigned int clDeviceStatePipe::psize(unsigned int handle){
	if (handle < m_NumOfLinks){
		volatile LinkItem_t &link = m_LinkList[handle];
		if ((link.Using == true) && (link.Error == false)){
			return link.Info->PipeSize;
		}
	}

	Trace(L"Exception");
	throw L"psize falied";
	return 0;
}






// データを送信する
bool clDeviceStatePipe::TxData(volatile LinkItem_t &link, const iBTL::PACKET_t &packet){
	if (iBTL::MAX_PAYLOADSIZE < packet.Length) return false;

	bool result = false;
	volatile bool &cancel = link.Error;

	int count = TIMEOUT_COUNT;
	for(; 0 < count; count--){
		result = m_Parent->TxData(packet);
		if (result == true) break;
		if (cancel == true) break;
		Sleep(TIMEOUT_PERIOD);
	}

	return result;
}
bool clDeviceStatePipe::TxData(volatile LinkItem_t &link, unsigned int dest, unsigned int msg, const void *data, unsigned int len){
	if (iBTL::MAX_PAYLOADSIZE < len) return false;

	bool result = false;
	volatile bool &cancel = link.Error;

	// データをPACKET_tに詰める
	iBTL::PACKET_t packet;
	packet.Dest		= dest;
	packet.Msg		= msg;
	packet.Length	= len;
	if (data != nullptr){
		memcpy(packet.Data, data, len);
	}

	int count = TIMEOUT_COUNT;
	for(; 0 < count; count--){
		result = m_Parent->TxData(packet);
		if (result == true) break;
		if (cancel == true) break;
		Sleep(TIMEOUT_PERIOD);
	}

	return result;
}

// データの受信準備をする
void clDeviceStatePipe::RxSetup(volatile LinkItem_t &link, Operation_e ope, void *buf, unsigned int len){
	link.Operation	= ope;
	link.Buffer		= buf;
	link.BufferSize	= len;
	link.BufferRead	= 0;
}

// データの受信を待つ
// 結果にかかわらず、受信状態は解除される
bool clDeviceStatePipe::RxWait(volatile LinkItem_t &link){
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


