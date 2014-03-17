// Intel-HEXファイルを読み込む

#pragma once



// Intel-HEXファイルを読み込んでバッファに格納
bool LoadIntelHEX(const wchar_t *filepath, char *buf, char *used, unsigned int size, unsigned int start_address);



// 16進の文字列を数値に変換
//unsigned int HexToInt(const wchar_t *string, wchar_t **next_ptr, unsigned int place);


