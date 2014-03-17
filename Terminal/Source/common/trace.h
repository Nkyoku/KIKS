// デバッグ用の文字列出力

#pragma once

#ifdef _DEBUG

// フォーマットにしたがってデバッグ出力する(UNICODE)
void Trace(const wchar_t *format, ...);

// フォーマットにしたがってデバッグ出力する(マルチバイト)
void Trace(const char *format, ...);

#else

// フォーマットにしたがってデバッグ出力する(UNICODE)
static inline void Trace(const wchar_t *format, ...){
}

// フォーマットにしたがってデバッグ出力する(マルチバイト)
static inline void Trace(const char *format, ...){
}

#endif
