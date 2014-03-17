// GUIとデバイスの制御を仲介

#include "../DeviceState.h"
#include "trace.h"
#include "convqstr.h"

#include <QWinEventNotifier>

#define _USE_MATH_DEFINES
#include <math.h>
#include <stdio.h>
#include <time.h>



// システム関連のパイプ名・ファイルパス
const wchar_t bsDeviceState::PIPE_NAME_PROCESSOR[]		= {L"MCUFLASH"};
const wchar_t bsDeviceState::PIPE_NAME_BITSTREAM[]		= {L"BITSTREAM"};
const wchar_t bsDeviceState::PIPE_NAME_COPROCESSOR[]	= {L"COPROCESSOR"};
const wchar_t bsDeviceState::FILE_PATH_BITSTREAM[]		= {L"0:\\PLD_GAME.BIT"};
const wchar_t bsDeviceState::FILE_PATH_COPROCESSOR[]	= {L"0:\\COP_GAME.BIN"};
const wchar_t bsDeviceState::PIPE_NAME_CONTROLLER[]		= {L"CONTROLLER"};
const wchar_t bsDeviceState::PIPE_NAME_LOGGER[]			= {L"LOGGER"};



// コンストラクタ
clDeviceState::clDeviceState(QWidget *parent)
	: m_Parent(parent), m_Device(nullptr), m_State(STATE_NOTCONNECT), m_Counter(0),
	m_NameString(L"未接続"), m_StateString(L"NOTCONNECT")
{
	// クリティカルセクション初期化
	InitializeCriticalSectionAndSpinCount(&m_CS, 4000);
	
	// 受信イベントを作成して接続
	hRxEvent = CreateEvent(NULL, FALSE, FALSE, NULL);
	QWinEventNotifier *notifier = new QWinEventNotifier(hRxEvent, this);
	connect(notifier, SIGNAL(activated(HANDLE)), this, SLOT(onRxEvent(HANDLE)));

	// 関連クラスを作成
	m_dsPipe = new clDeviceStatePipe(this);
	m_dsDir = new clDeviceStateDir(this);
	m_dsFile = new clDeviceStateFile(this);
}

// デストラクタ
clDeviceState::~clDeviceState(){
	// 関連クラスを削除
	delete m_dsPipe;
	delete m_dsDir;
	delete m_dsFile;

	// デバイスを削除
	delete m_Device;

	// 受信イベントを削除
	CloseHandle(hRxEvent);

	// クリティカルセクション破棄
	DeleteCriticalSection(&m_CS);
}

// 接続・切断する
bool clDeviceState::Connect(const std::wstring *phy, bool connect){
	if (connect == true){
		// 接続する
		if (IsConnected() == false){
			m_Device = iDevice::Search(*phy);
			if (m_Device != nullptr){
				if (m_Device->IsConnected()){
					// 接続した
					ChangeState(STATE_IDLE);

					m_PhyString = *phy;

					// デバイス情報の更新
					UpdateDeviceInfo();

					Sleep(10);

					// 受信イベントを設定
					m_Device->SetRxEvent(hRxEvent);

					// リセット
					m_dsPipe->Reset();
					m_dsDir->Reset();
					m_dsFile->Reset();

					// 受信コールバックの登録
					m_dsPipe->SetCallback();
					m_dsDir->SetCallback();
					m_dsFile->SetCallback();

					// ログ情報を設定
					std::wstring loginfo;
					if (m_Device->GetLogInfo(loginfo) == true){
						emit setLogInfo(loginfo);
					}

					// デバイスの時刻を合わせる
					BTT::DEVICE_TIME_SET_t now_time;
					now_time.Time = time(nullptr);
					TxData(DTR::DEVICE, MTX::DEVICE_TIME_SET, &now_time, sizeof(BTT::DEVICE_TIME_SET_t));

					// デバイス情報を要求
					TxData(DTR::DEVICE, MTX::DEVICE_INFO_GET, nullptr, 0);

					// パイプ一覧を要求
					TxData(DTR::PIPE0, MTX::PIPE_ENUM, nullptr, 0);

					


					

					

					return true;
				}
				delete m_Device;
				m_Device = nullptr;
			}
			return false;
		}
		return true;
	}else{
		// 切断する
		if (IsIdle() == true){
			// デバイスの削除
			EnterCriticalSection(&m_CS);
			delete m_Device;
			m_Device = nullptr;
			LeaveCriticalSection(&m_CS);

			// ステートの更新
			ChangeState(STATE_NOTCONNECT);

			// デバイス情報の更新
			UpdateDeviceInfo();

			// リセット
			m_dsPipe->Reset();
			m_dsDir->Reset();
			m_dsFile->Reset();



			return true;
		}
		if (IsConnected() == true){
			return false;
		}
		return true;
	}
}

// 数値を取得
int clDeviceState::GetValue(VALUE_e num){
	switch(num){
	case VALUE_GENERATION:
		return m_DevInfo.Generation;
	case VALUE_REVISION:
		return m_DevInfo.Revision;
	case VALUE_ID:
		return m_DevInfo.MachineID;
	default:
		return -1;
	}
}

// 文字列を取得
const wchar_t* clDeviceState::GetString(STRING_e num){
	switch(num){
	case STRING_NAME:
		return m_NameString.c_str();
	case STRING_VERSION:
		return m_VersionString.c_str();
	case STRING_STATE:
		return m_StateString.c_str();
	case STRING_PHY:
		return m_PhyString.c_str();
	}
	return L"無効な文字列番号です";
}

// データを送信する
// 他のスレッドから呼ばれる可能性がある
bool clDeviceState::TxData(const iBTL::PACKET_t &packet){
	if (iBTL::MAX_PAYLOADSIZE < packet.Length) return false;

	EnterCriticalSection(&m_CS);

	bool result = false;
	if (m_Device != nullptr){
		result = m_Device->TxData(packet);
	}

	LeaveCriticalSection(&m_CS);

	return result;
}
bool clDeviceState::TxData(unsigned int dest, unsigned int msg, const void *data, unsigned int len){
	if (iBTL::MAX_PAYLOADSIZE < len) return false;

	EnterCriticalSection(&m_CS);

	bool result = false;
	if (m_Device != nullptr){
		// データをPACKET_tに詰める
		iBTL::PACKET_t packet;
		packet.Dest		= dest;
		packet.Msg		= msg;
		packet.Length	= len;
		if (data != nullptr){
			memcpy(packet.Data, data, len);
		}

		result = m_Device->TxData(packet);
	}

	LeaveCriticalSection(&m_CS);

	return result;
}



// 受信時に呼び出される
void clDeviceState::onRxEvent(HANDLE hEvent){
	// onRxEvent()とonInterval()は同一スレッドで実行されるので特別な考慮は必要ない

	//ResetEvent(hEvent);

	// 受信する
	if (m_Device != nullptr){
		m_Device->RxDataAll();
	}
}

// 定期的に呼び出される
void clDeviceState::onInterval(int period){
	// 受信してみる
	if (m_Device != nullptr){
		m_Device->RxDataAll();
	}
	
	// 画面下部にステート表示を更新
	{
		std::wstring str(m_StateString);
		str.append(L":");
		str += std::to_wstring((long long)m_Counter);
		QString qstr = WCharToQString(str.c_str());
		emit setDebugText(qstr);
	}

	// デバイス情報の表示を更新
	if (m_Device != nullptr){
		UpdateDeviceInfo();
	}

	/*if (m_Controller.Enable == true){
		// コントローラの操作状態を送信
		sendController();
		memset(&m_Controller, 0x00, sizeof(Controller_t));
	}*/

	// ステートごとの処理
	switch(m_State){
	case STATE_NOTCONNECT:
		
		break;

	case STATE_RECONNECT:
		if (1000 < m_Counter){
			// デバイスを探す
			m_Counter = 0;
			Connect(&m_PhyString, true);
		}
		break;

	case STATE_IDLE:
		// アイドル
		if (m_Device != nullptr){
			

			


		}


		break;

	

	}

	m_Counter += period;
}





// デバイス情報を更新
void clDeviceState::UpdateDeviceInfo(void){
	if (m_Device != nullptr){
		// 接続中
		if (m_Device->IsUpdated()){
			// デバイス文字列の作成
			m_Device->GetDeviceInfo(m_DevInfo);
			m_NameString = m_DevInfo.DevName;
			if (m_DevInfo.Inquiry == false){
				m_NameString.append(L" (取得中...)");
			}

			// バージョン文字列の作成
			wchar_t buf[64];
			swprintf_s(buf, 64, L"第%d世代 リビジョン%c", m_DevInfo.Generation, L'A' + m_DevInfo.Revision - 1);
			m_VersionString.assign(buf);

			CheckCapabilities();

			m_dsPipe->SetNumOfPipeLinks(m_DevInfo.PipeLinks);
			m_dsDir->PermissionChanged();
			m_dsFile->PermissionChanged();

			emit updateWidgetsInfo();
		}
	}else{
		// 切断中
		m_DevInfo.clear();
		m_NameString.assign(L"未接続");
		m_VersionString.clear();

		CheckCapabilities();

		m_Functions.reset();

		emit updateWidgetsInfo();
	}
}

// 対応している機能を調べる
void clDeviceState::CheckCapabilities(void){
	m_Capabilities = false;
	if (m_Device != nullptr){
		// 対応するビットを立てる
		m_Capabilities[CAP_PIPE_READ]		= m_Device->GetCapability(L"pipe_read");
		m_Capabilities[CAP_PIPE_WRITE]		= m_Device->GetCapability(L"pipe_write");
		m_Capabilities[CAP_DIR_READ]		= m_Device->GetCapability(L"dir_read");
		m_Capabilities[CAP_DIR_WRITE]		= m_Device->GetCapability(L"dir_write");
		m_Capabilities[CAP_FILE_READ]		= m_Device->GetCapability(L"file_read");
		m_Capabilities[CAP_FILE_WRITE]		= m_Device->GetCapability(L"file_write");
		

		
	}
	UpdateWidgets();
}

// ウィジェットの状態を更新
void clDeviceState::UpdateWidgets(void){
	bool enable	= IsConnected();
	bool idle	= IsIdle();
	bool pipe_r	= m_Capabilities[CAP_PIPE_READ];
	bool pipe_w	= m_Capabilities[CAP_PIPE_WRITE];
	bool pipe	= pipe_r & pipe_w;
	bool dir_r	= m_Capabilities[CAP_DIR_READ];
	bool dir_w	= m_Capabilities[CAP_DIR_WRITE];
	bool dir	= dir_r & dir_w;
	bool file_r	= m_Capabilities[CAP_FILE_READ];
	bool file_w	= m_Capabilities[CAP_FILE_WRITE];
	bool file	= file_r & file_w;
	bool processor_w	= pipe_w & m_Functions[FUNC_PROCESSOR_WRITE];
	bool processor_r	= pipe_r & m_Functions[FUNC_PROCESSOR_READ];
	bool bitstream_s	= pipe_w & m_Functions[FUNC_BITSTREAM_SEND];
	bool coprocessor_s	= pipe_w & m_Functions[FUNC_COPROCESSOR_SEND];
	bool controller_w	= pipe_w & m_Functions[FUNC_CONTROLLER_WRITE];
	bool logger_r		= pipe_r & m_Functions[FUNC_LOGGER_READ];



	emit enableConsole		(enable);
	emit enableInfo			(enable, idle);
	emit enableAccess		('P', enable, idle, processor_w, processor_r);
	emit enableAccess		('B', enable, idle, bitstream_s, file_w);
	emit enableAccess		('C', enable, idle, coprocessor_s, file_w);
	emit enableFileTree		(enable, idle, dir_r, dir_w, file_r, file_w);
	emit enableController	(enable, idle, controller_w);
	emit enableLogger		(enable, idle, logger_r);
}






// モードを変える
void clDeviceState::changeBootMode(const wchar_t *mode_){
	using namespace BTT;

	if (IsIdle() == true){
		DEVICE_REBOOT_t reboot;
		std::wstring mode(mode_);
		if (mode == L"DFU"){
			reboot.BootMode = BOOT_DFU;
		}else if (mode == L"APP"){
			reboot.BootMode = BOOT_APP;
		}else if (mode == L"SafeAPP"){
			reboot.BootMode = BOOT_SAFE_APP;
		}else{
			return;
		}

		// 再起動を要求
		if (TxData(DTR::DEVICE, MTX::DEVICE_REBOOT, &reboot, sizeof(DEVICE_REBOOT_t)) == true){
			// 切断
			if (Connect(nullptr, false) == true){
				// 再接続を試みる
				ChangeState(STATE_RECONNECT);
			}
		}
	}
}

// 排他的なステートに遷移
void clDeviceState::setExclusiveState(bool enable){
	if (IsIdle() & enable){
		// STATE_IDLE → STATE_EXCLUSIVE;
		ChangeState(STATE_EXCLUSIVE);
	}else if (IsExclusive() & !enable){
		// STATE_EXCLUSIVE → STATE_IDLE;
		ChangeState(STATE_IDLE);
	}
}









// ステートの遷移
void clDeviceState::ChangeState(STATE_e next){
	if (m_State == next) return;

	m_Counter = 0;

	m_State = next;
	switch(next){
	case STATE_NOTCONNECT:
		m_StateString = L"Not Connected";
		break;

	case STATE_RECONNECT:
		m_StateString = L"Reconnecting...";
		break;

	case STATE_IDLE:
		m_StateString = L"Idle";
		break;

	case STATE_EXCLUSIVE:
		m_StateString = L"Exclusive";
		break;

	default:
		m_StateString = L"----";
		break;
	}

	// GUIを更新
	UpdateWidgets();
}



	






