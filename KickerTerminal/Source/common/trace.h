// デバッグ用の文字列出力

#pragma once

// フォーマットにしたがってデバッグ出力する(UNICODE)
void Trace(const wchar_t *format, ...);

// フォーマットにしたがってデバッグ出力する(マルチバイト)
void Trace(const char *format, ...);

