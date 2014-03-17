// 第6世代リビジョンAのキッカーを管理するクラス

#pragma once

#include "kicker6A.h"



class clKicker5 : public clKicker6A{
	friend class iKicker;

	/* 定数 */
protected:
	static const int USB_REV	= 0x0501;
	
	
	
	/* メンバー変数 */
	


	

	/* メソッド */
protected:
	// USBの情報を比較する
	static bool Compare(int usb_vid, int usb_pid, int usb_rev);

protected:
	// コンストラクタ
	clKicker5(HANDLE hdev, HANDLE husb);

public:
	// デストラクタ
	virtual ~clKicker5();
	
	// バージョンを取得
	virtual bool GetVersion(VERSION_t &version) override;
	
	// ユーザー領域を書き換える
	virtual bool UserWriteBIN(const std::wstring &file) override;

};
