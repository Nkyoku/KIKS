// 非同期操作担当

#ifndef TERMINAL_ASYNC_H
#define TERMINAL_ASYNC_H

#include "../DeviceState.h"
#include "../device/controller_struct.h"

#include <QObject>
#include <QThread>
#include <QTimer>

#include <vector>
#include <string>
#include <Windows.h>






class TerminalAsync : public QObject{
Q_OBJECT

	/* 定数 */
private:
	static const unsigned long long MAX_FILESIZE = 10 * 1024 * 1024;

	static const int LOGGER_PERIOD = 200;
	static const int CONTROLLER_PERIOD = 50;


	/* メンバー */
private:
	bool m_Deleted;				// すでに削除された

	clDeviceState *m_ds;		// デバイスステート

	QTimer *m_LoggerTimer;		// ロガーのポーリング用タイマー
	int m_LoggerHandle;			// ロガーのパイプハンドル
	std::vector<char> m_LoggerList;	// ロギングするリスト

	QTimer *m_ControllerTimer;	// コントローラのポーリング用タイマー
	int m_ControllerHandle;		// コントローラのパイプハンドル





public:
	// コンストラクタ
	TerminalAsync(clDeviceState *ds, QObject *parent = 0);

	// デストラクタ
	~TerminalAsync();




	/* ファイル転送関連 */
private:
	/* (PC)ファイル ⇔ メモリー(PC) */

	// ファイルを読み込む
	bool LoadFile(std::vector<char> &dst_vector, const wchar_t *src_path);

	// ファイルに保存
	bool SaveFile(const wchar_t *dst_path, const void *src_data, unsigned int src_length);


	/* (PC)メモリー ⇔ ファイル(デバイス) */
	
	// 転送 メモリー → ファイル
	bool TransMemoryToFile(const wchar_t *dst_path, const void *src_data, unsigned int src_length);

	// 転送 メモリー ← ファイル
	bool TransMemoryFromFile(void *dst_data, unsigned int &dst_length, const wchar_t *src_path);

	// 転送 メモリー ← ファイル全体
	bool TransMemoryFromFileAll(std::vector<char> &dst_vector, const wchar_t *src_path);


	/* (PC)ファイル ⇔ ファイル(デバイス) */

	// 転送 ファイル → ファイル
	bool TransFileToFile(const wchar_t *dst_path, const wchar_t *src_path);

	// 転送 ファイル ← ファイル全体
	bool TransFileFromFileAll(const wchar_t *dst_path, const wchar_t *src_path);


	/* (PC)メモリー ⇔ パイプ(デバイス) */

	// 転送 メモリー → パイプ
	bool TransMemoryToPipe(const wchar_t *dst_pipe, const void *src_data, unsigned int src_length, bool progress = true);

	// 転送 メモリー ← パイプ全体
	bool TransMemoryFromPipeAll(std::vector<char> &dst_vector, const wchar_t *src_pipe, bool progress = true);


	/* (PC)ファイル ⇔ パイプ(デバイス) */
	// なし

	
public slots:
	// ファイルをデバイスへ転送
	void transfarToDevice(std::wstring *dst_path, std::wstring *src_path);

	// ファイルをデバイスから転送
	void transfarFromDevice(std::wstring *dst_path, std::wstring *src_path);
	
	// アクセスパネルの操作
	void onAccessOperation(char letter, std::wstring *path);

	


	







	/* ロギング関連 */
private slots:
	// 一定周期で呼び出される
	void onLoggingInterval(void);

public slots:
	// ロギングする項目を設定
	void setLoggingList(char *list, unsigned int size);

signals:
	// ログを受信する
	void sendLog(unsigned short *data, unsigned int size);

	// エラーを受信する
	void sendLoggingError(void);
	




	/* コントローラ関連 */
private slots:
	// 一定周期で呼び出される
	void onControllerInterval(void);

public slots:
	// コントローラをセットする
	void setControllerState(ControllerState_t *state);

signals:
	// コントローラを要求する
	void requestControllerState(void);



	/* 全体 */
signals:
	// 警告ダイアログを表示
	void showWarningConst(const wchar_t *title, const wchar_t *content);
	
	// 進捗情報を設定
	void sendProgress(int value);

	// 排他的なステートに遷移
	void setExclusiveState(bool enable);


};


#endif // TERMINAL_ASYNC_H
