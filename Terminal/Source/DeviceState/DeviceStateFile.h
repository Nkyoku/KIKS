// DeviceState中のファイル関連の分割

#ifndef DEVICE_STATE_FILE_H
#define DEVICE_STATE_FILE_H

#include "DeviceStateBase.h"

#include <QObject>

#include <Windows.h>
#include <vector>



class clDeviceStateFile : public QObject, public bsDeviceState{
Q_OBJECT

	/* 定数 */
private:
	static const unsigned int TIMEOUT_PERIOD	= 10;	// タイムアウト間隔
	static const unsigned int TIMEOUT_COUNT		= 100000;	// タイムアウト回数
	
	// 操作の内容
	enum Operation_e{
		OPE_IDLE,
		OPE_OPENING,
		OPE_CLOSING,
		OPE_READING,
		OPE_WRITING,
		OPE_SEEKING
	};

	// ファイル情報
	struct File_t{
		bool Using;				// 使用中
		bool Error;				// エラーが起きた
		unsigned int Modifiers;	// アクセス修飾子
		unsigned long long  FilePtr;	// シークポインタ(デバイスと一致していなかったらエラー)
		unsigned long long FileSize;	// ファイルサイズ

		Operation_e Operation;	// 操作内容
		int BufferSize;			// 受信バッファのサイズ
		void *Buffer;			// 受信バッファ
		int BufferRead;			// 受信バッファに受信したバイト数
	};
	
	
	
	/* メンバー */
private:
	clDeviceState *m_Parent;
	
	CRITICAL_SECTION m_CS;			// クリティカルセクション
	
	bool m_AllowRead, m_AllowWrite;	// アクセス許可

	std::wstring m_FilePath;		// 開いているファイルのパス
	volatile File_t m_File;			// 開いているファイル
	





	/* GUIスレッドから呼び出すメソッド */
public:
	// コンストラクタ
	clDeviceStateFile(clDeviceState *parent);
	
	// デストラクタ
	~clDeviceStateFile();

	// コールバックを設定
	void SetCallback(void);

	


	// コールバック
	static void StaticCallback(void *inst, const iBTL::PACKET_t &packet);
	void Callback(const iBTL::PACKET_t &packet);

	// リセット
	void Reset(void);

	// アクセス許可が更新された
	void PermissionChanged(void);




	/* 他スレッドから呼び出すメソッド
	   GUIスレッドから呼び出してはいけない
	   異常が起きた場合は例外を返す        */
public:
	// ファイルを開く
	int fopen(const wchar_t *wpath, const wchar_t *mode);

	// ファイルを閉じる
	bool fclose(unsigned int handle);

	// ファイルから読み取る
	int fread(unsigned int handle, void *buf, unsigned int len);

	// ファイルに書き込む
	int fwrite(unsigned int handle, const void *buf, unsigned int len);

	// ファイルをシークする
	bool fseek(unsigned int handle, unsigned long long addr);

	// ファイルのシークポインタを取得
	unsigned long long ftell(unsigned int handle);

	// ファイルサイズを取得
	unsigned long long fsize(unsigned int handle);


private:
	// データを送信する
	bool TxData(const iBTL::PACKET_t &packet);
	bool TxData(unsigned int dest, unsigned int msg, const void *data, unsigned int len);

	// データの受信準備をする
	void RxSetup(Operation_e ope, void *buf, unsigned int len);

	// データの受信を待つ
	// 結果にかかわらず、受信状態は解除される
	bool RxWait(void);



signals:
	// ファイルが更新された
	void changeFile(std::wstring *path, unsigned long long size);



};

#endif // DEVICE_STATE_FILE_H
