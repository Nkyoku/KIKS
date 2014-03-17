// INIファイルにアクセスする

#include "ini.h"

#include <stdio.h>
#include <stdlib.h>



// コンストラクタ
clINI::clINI(void){
	return;		// 何もしない
}

// デストラクタ
clINI::~clINI(void){
	Close();
}

// INIファイルを開く(フルパス)
bool clINI::Open(const wchar_t *path){
	int result;
	result = wcsncpy_s(m_FilePath, MAX_PATH, path, MAX_PATH);
	if (result != 0){
		m_FilePath[0] = L'\0';
	}
	return result == 0;
}

// INIファイルを開く(ディレクトリ+ファイル名)
bool clINI::Open(const wchar_t *dir, const wchar_t *name){
	int result;
	result = _wmakepath_s(m_FilePath, MAX_PATH, nullptr, dir, name, nullptr);
	if (result != 0){
		m_FilePath[0] = L'\0';
	}
	return result == 0;
}

// INIファイルを閉じる
void clINI::Close(void){
	// 何もしない
}

// INIファイルから文字列を読み取り
void clINI::Read(const wchar_t *section, const wchar_t *key, wchar_t *dest_string, int dst_size){
	if (m_FilePath[0] != L'\0'){
		int result;
		result = GetPrivateProfileString(section, key, L"", dest_string, dst_size, m_FilePath);
		if (0 <= result){
			// 成功
			return;
		}
	}
	dest_string[0] = L'\0';
}

// INIファイルから整数を読み取り
void clINI::Read(const wchar_t *section, const wchar_t *key, int &dest_integer){
	if (m_FilePath[0] != L'\0'){
		dest_integer = GetPrivateProfileInt(section, key, 0, m_FilePath);
	}else{
		dest_integer = 0;
	}
}

// INIファイルから小数点数を読み取り
void clINI::Read(const wchar_t *section, const wchar_t *key, double &dest_double){
	if (m_FilePath[0] != L'\0'){
		int result;
		wchar_t buf[32];
		result = GetPrivateProfileString(section, key, L"", buf, sizeof(buf), m_FilePath);
		if (0 <= result){
			// 成功
			dest_double = _wtof(buf);
		}else{
			dest_double = 0.0;
		}
	}else{
		dest_double = 0.0;
	}
}

// INIファイルに文字列を書き込み
void clINI::Write(const wchar_t *section, const wchar_t *key, const wchar_t *sec_string){
	if (m_FilePath[0] != L'\0'){
		WritePrivateProfileString(section, key, sec_string, m_FilePath);
	}
}
#include "trace.h"
// INIファイルに整数を書き込み
void clINI::Write(const wchar_t *section, const wchar_t *key, int src_integer){
	if (m_FilePath[0] != L'\0'){
		wchar_t buf[13];
		_itow_s(src_integer, buf, 10);
		Write(section, key, buf);
	}
}

// INIファイルに小数点数を書き込み
void clINI::Write(const wchar_t *section, const wchar_t *key, double src_double){
	if (m_FilePath[0] != L'\0'){
		wchar_t buf[32];
		swprintf_s(buf, L"%.6e", src_double);
		Write(section, key, buf);
	}
}



