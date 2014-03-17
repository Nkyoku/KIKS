// INIファイルにアクセスする

#pragma once

#include <Windows.h>

#include <string>



// アプリケーションのあるディレクトリ
extern std::wstring g_ApplicationDir;



class clINI{
private:
	// INIファイルのパス
	wchar_t m_FilePath[MAX_PATH];

public:
	// コンストラクタ
	clINI(void);

	// デストラクタ
	~clINI(void);

	// INIファイルを開く
	bool Open(const wchar_t *path);
	bool Open(const wchar_t *dir, const wchar_t *name);

	// INIファイルを閉じる
	void Close(void);

	// INIファイルから文字列を読み取り
	void Read(const wchar_t *section, const wchar_t *key, wchar_t *dest_string, int dst_size = MAX_PATH);

	// INIファイルから整数を読み取り
	void Read(const wchar_t *section, const wchar_t *key, int &dest_integer);

	// INIファイルから小数点数を読み取り
	void Read(const wchar_t *section, const wchar_t *key, double &dest_double);

	// INIファイルに文字列を書き込み
	void Write(const wchar_t *section, const wchar_t *key, const wchar_t *sec_string);

	// INIファイルに整数を書き込み
	void Write(const wchar_t *section, const wchar_t *key, int src_integer);

	// INIファイルに小数点数を書き込み
	void Write(const wchar_t *section, const wchar_t *key, double src_double);
};





