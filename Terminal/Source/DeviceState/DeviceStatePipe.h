// DeviceState中のパイプ関連の分割

#ifndef DEVICE_STATE_PIPE_H
#define DEVICE_STATE_PIPE_H

#include "DeviceStateBase.h"

#include <QObject>

#include <Windows.h>
#include <vector>



class clDeviceStatePipe : public QObject, public bsDeviceState{
Q_OBJECT

	/* 定数 */
private:
	static const unsigned int MAX_LINKS			= 8;	// 管理ソフト側がサポートするパイプ数
	static const unsigned int TIMEOUT_PERIOD	= 10;	// タイムアウト間隔
	static const unsigned int TIMEOUT_COUNT		= 100000;	// タイムアウト回数

	// パイプリストの項目
	struct PipeItem_t{
		std::wstring PipeName;		// パイプ名
		unsigned int PipeSize;		// サイズ(0ならシーク不可)
		unsigned int WriteUnit;		// 書き込み単位(バイト数)
		unsigned int Modifiers;		// アクセス修飾子
	};

	// 操作の内容
	enum Operation_e{
		OPE_IDLE,
		OPE_OPENING,
		OPE_CLOSING,
		OPE_READING,
		OPE_WRITING,
		OPE_SEEKING
	};

	// リンクリストの項目
	struct LinkItem_t{
		bool Using;				// 使用中
		bool Error;				// エラーが起きた
		PipeItem_t *Info;		// 開いているパイプ情報
		unsigned int Modifiers;	// アクセス修飾子
		int Pointer;			// シークポインタ(デバイスと一致していなかったらエラー)

		Operation_e Operation;	// 操作内容
		int BufferSize;			// 受信バッファのサイズ
		void *Buffer;			// 受信バッファ
		int BufferRead;			// 受信バッファに受信したバイト数
		


	};



	/* メンバー */
private:
	clDeviceState *m_Parent;
	
	CRITICAL_SECTION m_CS;			// クリティカルセクション

	std::vector<PipeItem_t> m_PipeList;	// パイプリスト

	volatile int m_NumOfLinks;		// リンクの数
	volatile int m_NumOfUsingLinks;	// 使用中のリンク数
	volatile LinkItem_t m_LinkList[MAX_LINKS];	// リンクリスト






	/* GUIスレッドから呼び出すメソッド */
public:
	// コンストラクタ
	clDeviceStatePipe(clDeviceState *parent);
	
	// デストラクタ
	~clDeviceStatePipe();

	// コールバックを設定
	void SetCallback(void);

	// リンク数を設定
	void SetNumOfPipeLinks(int pipe_links);





	// コールバック
	static void StaticCallback(void *inst, const iBTL::PACKET_t &packet);
	void Callback(const iBTL::PACKET_t &packet);

	// リセット
	void Reset(void);



signals:
	// パイプリストをクリア
	void clearPipe(void);

	// パイプリストに追加
	void addPipe(const wchar_t *name, int size, int unit, const wchar_t *modifiers);




	/* 他スレッドから呼び出すメソッド
	   GUIスレッドから呼び出してはいけない
	   異常が起きた場合は例外を返す        */
public:
	// パイプを開く
	int popen(const wchar_t *name, const wchar_t *mode);

	// パイプを閉じる
	bool pclose(unsigned int handle);

	// パイプから読み取る
	int pread(unsigned int handle, void *buf, unsigned int len);

	// パイプに書き込む
	int pwrite(unsigned int handle, const void *buf, unsigned int len);

	// パイプをシークする
	bool pseek(unsigned int handle, unsigned int addr);

	// パイプのシークポインタを取得
	unsigned int ptell(unsigned int handle);

	// パイプサイズを取得
	unsigned int psize(unsigned int handle);




private:
	// データを送信する
	bool TxData(volatile LinkItem_t &link, const iBTL::PACKET_t &packet);
	bool TxData(volatile LinkItem_t &link, unsigned int dest, unsigned int msg, const void *data, unsigned int len);

	// データの受信準備をする
	void RxSetup(volatile LinkItem_t &link, Operation_e ope, void *buf, unsigned int len);

	// データの受信を待つ
	// 結果にかかわらず、受信状態は解除される
	bool RxWait(volatile LinkItem_t &link);




};

#endif // DEVICE_STATE_PIPE_H
