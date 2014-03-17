// デバッグ用の文字列出力

#include <Windows.h>
#include <stdio.h>

#ifdef _DEBUG

// フォーマットにしたがってデバッグ出力する(UNICODE)
void Trace(const wchar_t *format, ...){
	va_list	arg;
    wchar_t buf[4096];
    va_start(arg, format);
    vswprintf_s(buf, 4096, format, arg);
    va_end(arg);
    OutputDebugString(buf);
	OutputDebugString(L"\n");
	fputws(buf, stderr);
}

// フォーマットにしたがってデバッグ出力する(マルチバイト)
void Trace(const char *format, ...){
	va_list	arg;
    char buf[4096];
    va_start(arg, format);
    vsprintf_s(buf, 4096, format, arg);
    va_end(arg);
    OutputDebugStringA(buf);
	OutputDebugStringA("\n");
	fputs(buf, stderr);
}

#endif