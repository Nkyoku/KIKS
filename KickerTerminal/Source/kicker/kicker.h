// マシンを管理するクラス

#pragma once

#include <Windows.h>
#include <string>
#include <vector>

//#include "request.h"
//#include "adler32.h"




// 動作モード
enum MODE_e{
	MODE_DFU,			// DFUモード
	MODE_APP,			// APPモード
};

// バージョンを管理する構造体
struct VERSION_t{
	int Version;
	int Revision;
	MODE_e Mode;
};






// キッカーを管理するインターフェース
class iKicker abstract{

	/* 定数・定義 */
protected:
	static const GUID INTERFACE_GUID;	// デバイスのインターフェースGUID


	/* 変数 */
public:
	HANDLE m_hDevice;	// デバイスのハンドル
	HANDLE m_hWinUSB;
	



	/* メンバー */
protected:
	// コンストラクタ
	iKicker(HANDLE hdev, HANDLE husb);

public:
	// デストラクタ
	virtual ~iKicker();

	// キッカーを検索する
	static iKicker* Search(void);

	// キッカーが接続されているか
	virtual bool IsConnected(void) = 0;

	// 動作モードを変更する
	virtual bool ChangeMode(MODE_e mode) = 0;

	// バージョンを取得
	virtual bool GetVersion(VERSION_t &devinfo) = 0;

	// デバッグ出力を取得
	virtual bool GetString(std::wstring &text) = 0;

	// ユーザー領域を書き換える
	virtual bool UserWriteBIN(const std::wstring &file) = 0;

	// フラッシュを書き換える
	virtual bool FlashWriteHEX(const std::wstring &file) = 0;
	
	// フラッシュを読み出す
	virtual bool FlashReadBIN(const std::wstring &file) = 0;




protected:
	// データを送信
	virtual bool Transmit(int cmdid, unsigned int length, const void *data, unsigned int *transfered = nullptr);
	
	// データを受信
	virtual bool Receive(int cmdid, unsigned int length, void *data, unsigned int *transfered = nullptr);




protected:
	// ハンドルを解放する
	static void SafeClose(HANDLE &h){
		if (h != NULL){
			CloseHandle(h);
			h = NULL;
		}
	}


};
