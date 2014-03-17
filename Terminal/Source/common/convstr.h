// char, wchar_tとQStringの変換

#pragma once

#include <Windows.h>
#include <string>

// char→std::wstring
inline void CharToWString(std::wstring &dst, const char *src, int src_len = -1){
	static const int CP_SJIS = 932;
	int size;
	size = MultiByteToWideChar(CP_SJIS, MB_PRECOMPOSED, src, src_len, NULL, 0);
	if (1024 < size){
		wchar_t *buf = new wchar_t[size + 1];
		MultiByteToWideChar(CP_SJIS, MB_PRECOMPOSED, src, src_len, buf, size);
		dst.assign(buf);
		delete [] buf;
	}else{
		wchar_t buf[1024];
		MultiByteToWideChar(CP_SJIS, MB_PRECOMPOSED, src, src_len, buf, size);
		dst.assign(buf);
	}
}

// wchar_t→std::string
inline void WCharToString(std::string &dst, const wchar_t *src, int src_len = -1){
	int size;
	size = WideCharToMultiByte(CP_ACP, 0, src, src_len, NULL, 0, NULL, NULL);
	if (1024 < size){
		char *buf = new char[size + 1];
		WideCharToMultiByte(CP_ACP, 0, src, src_len, buf, size, NULL, NULL);
		dst.assign(buf);
		delete [] buf;
	}else{
		char buf[1024];
		WideCharToMultiByte(CP_ACP, 0, src, src_len, buf, size, NULL, NULL);
		dst.assign(buf);
	}
}

// char(UTF-8)→std::wstring
inline void UTF8ToWString(std::wstring &dst, const char *src, int src_len = -1){
	int size;
	size = MultiByteToWideChar(CP_UTF8, 0, src, src_len, NULL, 0);
	if (1024 < size){
		wchar_t *buf = new wchar_t[size + 1];
		MultiByteToWideChar(CP_UTF8, 0, src, src_len, buf, size);
		dst.assign(buf);
		delete [] buf;
	}else{
		wchar_t buf[1024];
		MultiByteToWideChar(CP_UTF8, 0, src, src_len, buf, size);
		dst.assign(buf);
	}
}

// wchar_t→std::string(UTF-8)
inline void WCharToUTF8(std::string &dst, const wchar_t *src, int src_len = -1){
	int size;
	size = WideCharToMultiByte(CP_UTF8, 0, src, src_len, NULL, 0, NULL, NULL);
	if (1024 < size){
		char *buf = new char[size + 1];
		WideCharToMultiByte(CP_UTF8, 0, src, src_len, buf, size, NULL, NULL);
		dst.assign(buf);
		delete [] buf;
	}else{
		char buf[1024];
		WideCharToMultiByte(CP_UTF8, 0, src, src_len, buf, size, NULL, NULL);
		dst.assign(buf);
	}
}

// wchar_t→char
inline void WCharToChar(char *dst, int dst_len, const wchar_t *src, int src_len = -1){
	WideCharToMultiByte(CP_ACP, 0, src, src_len, dst, dst_len, NULL, NULL);
}


