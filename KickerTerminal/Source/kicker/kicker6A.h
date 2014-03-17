// 第6世代リビジョンAのキッカーを管理するクラス

#pragma once

#include "kicker.h"

#include <Windows.h>

#include <deque>
#include <algorithm>



class clKicker6A : public iKicker{
	friend class iKicker;

	/* 定数 */
protected:
	static const int USB_VID	= 0x16C0;
	static const int USB_PID	= 0x05DF;
	static const int USB_REV	= 0x0601;

	//static const int TIMEOUT	= 1000;		// コントロール転送のタイムアウト時間[ms]

	// コマンド一覧
	enum CMDID_e{
		CMDID_GET_NAME		= 1,
		CMDID_RESET			= 2,
		CMDID_STRING		= 3,
		CMDID_SET_PAGE		= 10,
		CMDID_READ			= 11,
		CMDID_WRITE			= 12,
		CMDID_WRITE_EEPROM	= 13,
	};

	

	// ファームウェア
	static const int XMEGA_PAGE_SIZE	= 256;			// ページサイズ
	static const int XMEGA_APP_SIZE		= 32 * 1024;	// アプリケーション領域のサイズ
	static const int XMEGA_APP_PAGES	= XMEGA_APP_SIZE / XMEGA_PAGE_SIZE;
	static const unsigned int XMEGA_APP_START	= 0x00000000;

	static const int XMEGA_EEPROM_PAGE_SIZE	= 32;		// EEPROMのページサイズ
	static const int XMEGA_EEPROM_SIZE	= 1024;			// EEPROMのサイズ
	static const int XMEGA_EEPROM_PAGES	= XMEGA_EEPROM_SIZE / XMEGA_EEPROM_PAGE_SIZE;


	/* メンバー変数 */
protected:
	MODE_e m_Mode;
	
	


	

	/* メソッド */
protected:
	// USBの情報を比較する
	static bool Compare(int usb_vid, int usb_pid, int usb_rev);

protected:
	// コンストラクタ
	clKicker6A(HANDLE hdev, HANDLE husb);

public:
	// デストラクタ
	virtual ~clKicker6A();

	// デバイスが接続されているか
	virtual bool IsConnected(void) override;

	// 動作モードを変更する
	virtual bool ChangeMode(MODE_e mode) override;

	// バージョンを取得
	virtual bool GetVersion(VERSION_t &devinfo) override;
	
	// デバッグ出力を取得
	virtual bool GetString(std::wstring &text) override;

	// ユーザー領域を書き換える
	virtual bool UserWriteBIN(const std::wstring &file) override;

	// フラッシュを書き換える
	virtual bool FlashWriteHEX(const std::wstring &file) override;
	
	// フラッシュを読み出す
	virtual bool FlashReadBIN(const std::wstring &file) override;











};
