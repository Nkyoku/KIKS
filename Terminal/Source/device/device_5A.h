// デバイスを管理するクラス(Gen.5 Rev.A)

#pragma once

#include "device.h"



class clDevice5A : protected iDevice{
	friend class iDevice;

	/* 定数 */
private:
	static const int USB_VID	= 0x16C0;
	static const int USB_PID	= 0x27D8;
	static const int USB_REV	= 0x0501;

	static const int AVR32_PAGE_SIZE	= 512;
	static const int AVR32_FLASH_START	= 0x80000000;
	static const int AVR32_FLASH_SIZE	= 0x80000;
	static const int AVR32_APP_OFFSET	= 0x10000;
	static const int AVR32_APP_SIZE		= AVR32_FLASH_SIZE - AVR32_APP_OFFSET;
	
	static const int OMSP_PROGRAM_SIZE	= 0x4000;
	static const int OMSP_PROGRAM_START	= 0x10000 - OMSP_PROGRAM_SIZE;


	

	/* メソッド */
public:
	// USBの情報を比較する
	static bool MatchingUSB(int vid, int pid, int rev);



private:
	// コンストラクタ
	clDevice5A(iBTL *btl);

public:
	// デストラクタ
	virtual ~clDevice5A();



public:
	





public:
	// プロセッサのプログラムを読み込む
	virtual bool LoadProcessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path) override;

	// コプロセッサのプログラムを読み込む
	virtual bool LoadCoprocessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path) override;

	/*
	// HEXファイルをロードする
	virtual bool LoadHEX(std::wstring &file, std::deque<TRANSFER_t> &transfer) override;

	// BITファイルをロードする
	virtual bool LoadBIT(std::wstring &file, std::deque<TRANSFER_t> &transfer) override;

	// コプロセッサのHEXファイルをロードする
	virtual bool LoadCopHEX(std::wstring &file, std::deque<TRANSFER_t> &transfer) override;
	*/



	// ログ情報を持つファイル名を取得
	virtual bool GetLogInfo(std::wstring &dst_name) override;



};
