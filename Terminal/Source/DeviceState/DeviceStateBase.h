// GUIとデバイスの制御を仲介

#ifndef DEVICE_STATE_BASE_H
#define DEVICE_STATE_BASE_H

#include "../device/device.h"
#include "../device/controller_struct.h"

#include <QObject>

#include <vector>
#include <bitset>



class clDeviceStatePipe;
class clDeviceStateDir;
class clDeviceStateFile;



// DeviceState系クラスの基底クラス
class bsDeviceState{
protected:
	// 対応している機能の一覧
	enum{
		CAP_PIPE_READ,			// パイプを読み取れる
		CAP_PIPE_WRITE,			// パイプに書き込める
		CAP_DIR_READ,			// ディレクトリ構造を読み取れる
		CAP_DIR_WRITE,			// ディレクトリ構造を変更できる
		CAP_FILE_READ,			// ファイルを読み取れる
		CAP_FILE_WRITE,			// ファイルに書き込める
		




		_CAP_LENGTH_
	};

	// 個別の機能の一覧
	enum{
		FUNC_PROCESSOR_READ,
		FUNC_PROCESSOR_WRITE,
		FUNC_BITSTREAM_SEND,
		FUNC_COPROCESSOR_SEND,
		FUNC_CONTROLLER_WRITE,
		FUNC_LOGGER_READ,



		_FUNC_LENGTH_
	};

public:
	// システム関連のパイプ名・ファイルパス
	static const wchar_t PIPE_NAME_PROCESSOR[];
	static const wchar_t PIPE_NAME_BITSTREAM[];
	static const wchar_t PIPE_NAME_COPROCESSOR[];
	static const wchar_t FILE_PATH_BITSTREAM[];
	static const wchar_t FILE_PATH_COPROCESSOR[];
	static const wchar_t PIPE_NAME_CONTROLLER[];
	static const wchar_t PIPE_NAME_LOGGER[];
};



// DeviceState
class clDeviceState : public QObject, public bsDeviceState{
Q_OBJECT
	friend class clDeviceStatePipe;
	friend class clDeviceStateDir;
	friend class clDeviceStateFile;

	/* 定数 */
public:
	// GetValue()へ与える番号
	enum VALUE_e{
		VALUE_GENERATION,
		VALUE_REVISION,
		VALUE_ID
	};

	// GetString()へ与える番号
	enum STRING_e{
		STRING_NAME,
		STRING_VERSION,
		STRING_STATE,
		STRING_PHY
	};

private:
	enum STATE_e{
		STATE_NOTCONNECT,		// 未接続
		STATE_RECONNECT,		// 再接続待ち
		STATE_IDLE,				// アイドル
		STATE_EXCLUSIVE,		// 排他的な操作中(ビジー)
	};

	




	/* メンバー */
private:
	QWidget *m_Parent;

	iDevice *m_Device;		// デバイス
	DEVINFO_t m_DevInfo;	// デバイス情報
	HANDLE hRxEvent;		// 受信時に有効になるイベント
	CRITICAL_SECTION m_CS;	// クリティカルセクション

	STATE_e m_State;
	int m_Counter;			// 経過時間のカウンター

	std::bitset<_CAP_LENGTH_> m_Capabilities;	// 対応している機能のフラグ
	std::bitset<_FUNC_LENGTH_> m_Functions;		// 個別の機能のフラグ

	


	std::wstring m_NameString;		// 名前の文字列
	std::wstring m_VersionString;	// バージョンの文字列
	std::wstring m_StateString;		// ステートの文字列
	std::wstring m_PhyString;		// 最後に上手くいった接続

	
	
	

public:
	clDeviceStatePipe *m_dsPipe;	// パイプ関連
	clDeviceStateDir *m_dsDir;		// ディレクトリ関連
	clDeviceStateFile *m_dsFile;	// ファイル関連




public:
	// コンストラクタ
	clDeviceState(QWidget *parent);
	
	// デストラクタ
	~clDeviceState();

	// 接続されているかどうか
	bool IsConnected(void){
		return (m_State != STATE_NOTCONNECT) && (m_State != STATE_RECONNECT);
	}

	// アイドル状態かどうか
	bool IsIdle(void){
		return m_State == STATE_IDLE;
	}

	// 排他的な操作中かどうか
	bool IsExclusive(void){
		return m_State == STATE_EXCLUSIVE;
	}

	// 接続・切断する
	bool Connect(const std::wstring *phy, bool connect);

	// 数値を取得
	int GetValue(VALUE_e num);

	// 文字列を取得
	const wchar_t* GetString(STRING_e num);

	// デバッグ文字列の送信
	bool TxDebug(std::string &str){
		return (m_Device != nullptr) ? m_Device->TxDebug(str) : false;
	}

	// デバッグ文字列の受信
	bool RxDebug(void){
		return (m_Device != nullptr) ? m_Device->RxDebug() : false;
	}
	bool RxDebug(std::string &str){
		return (m_Device != nullptr) ? m_Device->RxDebug(str) : false;
	}

	// データを送信する
	// 他のスレッドから呼ばれる可能性がある
	bool TxData(const iBTL::PACKET_t &packet);
	bool TxData(unsigned int dest, unsigned int msg, const void *data, unsigned int len);

public slots:
	// 受信時に呼び出される
	void onRxEvent(HANDLE hEvent);

	// 定期的に呼び出される
	void onInterval(int period);

	
	



private:
	// デバイス情報を更新
	void UpdateDeviceInfo(void);

	// 対応している機能を調べる
	void CheckCapabilities(void);

	// ウィジェットの状態を更新
	void UpdateWidgets(void);




public:
	// プロセッサのプログラムを読み込む
	bool LoadProcessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path){
		if (m_Device != nullptr) return m_Device->LoadProcessorFirmware(dst_vector, src_path);
		return false;
	}

	// コプロセッサのプログラムを読み込む
	bool LoadCoprocessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path){
		if (m_Device != nullptr) return m_Device->LoadCoprocessorFirmware(dst_vector, src_path);
		return false;
	}














public slots:
	// モードを変える
	void changeBootMode(const wchar_t *mode);

	// 排他的なステートに遷移
	void setExclusiveState(bool enable);


signals:
	// 接続・切断する
	void changeConnection(const std::wstring *phy, bool connect, bool warn);

	// GUIの表示情報を更新
	void updateWidgetsInfo(void);

	// デバッグ情報の更新
	void setDebugText(QString &str);

	// 進捗情報を設定
	void sendProgress(int progress);

	// ログ情報を設定
	void setLogInfo(const std::wstring &name);
	
	// 各ウェジェットを有効・無効にする
	void enableConsole(bool enable);
	void enableInfo(bool enable, bool idle);
	void enableAccess(char letter, bool enable, bool idle, bool pipe_r, bool pipe_w);
	void enableFileTree(bool enable, bool idle, bool dir_r, bool dir_w, bool file_r, bool file_w);
	void enableController(bool enable, bool idle, bool pipe);
	void enableLogger(bool enable, bool idle, bool pipe_r);




private:
	// ステートの遷移
	void ChangeState(STATE_e next);



};

#endif // DEVICE_STATE_H
