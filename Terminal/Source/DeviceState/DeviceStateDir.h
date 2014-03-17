// DeviceState中のディレクトリ関連の分割

#ifndef DEVICE_STATE_DIR_H
#define DEVICE_STATE_DIR_H

#include "DeviceStateBase.h"

#include <QObject>

#include <Windows.h>
#include <vector>



class clDeviceStateDir : public QObject, public bsDeviceState{
Q_OBJECT

	/* 定数 */
private:
	static const unsigned int TIMEOUT_PERIOD	= 10;	// タイムアウト間隔
	static const unsigned int TIMEOUT_COUNT		= 100000;	// タイムアウト回数

	// 操作の内容
	/*enum Operation_e{
		OPE_IDLE,
		OPE_MOVING,
		OPE_REMOVING,
		OPE_CREATING,
	};*/

	



	/* メンバー */
private:
	clDeviceState *m_Parent;
	
	bool m_AllowRead, m_AllowWrite;	// アクセス許可
	
	//volatile bool m_Operation;		// 操作内容
	volatile bool m_ErrorOccured;	// エラーが起きた






	/* GUIスレッドから呼び出すメソッド */
public:
	// コンストラクタ
	clDeviceStateDir(clDeviceState *parent);
	
	// デストラクタ
	~clDeviceStateDir();

	// コールバックを設定
	void SetCallback(void);

	// コールバック
	static void StaticCallback(void *inst, const iBTL::PACKET_t &packet);
	void Callback(const iBTL::PACKET_t &packet);

	// リセット
	void Reset(void);

	// アクセス許可が更新された
	void PermissionChanged(void);



public slots:
	// ツリーを更新する
	void updateRequest(const std::wstring &path = L"");
	
	// ファイル・ディレクトリの移動・リネーム
	void moveRequest(const std::wstring &dst_path, const std::wstring &src_path);

	// ファイル・ディレクトリのコピー
	void copyRequest(const std::wstring &dst_path, const std::wstring &src_path);

	// ファイル・ディレクトリの削除
	void deleteRequest(const std::wstring &path);

	// ディレクトリの作成
	void mkdirRequest(const std::wstring &path);



signals:
	// ツリーを初期化
	void initTree(const std::wstring &path = L"");

	// ドライブを追加
	void addDrive(char letter, const std::wstring &name, bool sfn, unsigned long long size);

	// ドライブの使用量が変化した
	void changeDriveStatus(char letter, unsigned long long usage);

	// カレントアイテムを移動する
	void moveToItem(const std::wstring &wpath);

	// ファイル・ディレクトリをカレントアイテムへ追加
	void addItem(const std::wstring &name, unsigned long long size, bool dir, unsigned int date);

	// カレントアイテムを上の階層へ
	void moveUp(void);
	


	
	
	
private:
	// データを送信する
	bool TxData(const iBTL::PACKET_t &packet);
	bool TxData(unsigned int dest, unsigned int msg, const void *data, unsigned int len);

	// データの受信準備をする
	//void RxSetup(Operation_e ope, void *buf, unsigned int len);

	// データの受信を待つ
	// 結果にかかわらず、受信状態は解除される
	//bool RxWait(void);




};

#endif // DEVICE_STATE_DIR_H
