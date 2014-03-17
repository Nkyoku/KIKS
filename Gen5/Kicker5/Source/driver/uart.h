/**	@file
	@brief ベースボードとの通信
*/

#ifndef UART_H_
#define UART_H_

#include "../define.h"



namespace UART{

	// 初期化
	void Init(void);
	
	// 書き込み
	void Write(char c);
	
	// 複数データを書き込み
	void Write(const char *s);
	
	// 読み込みを始める
	unsigned short BeginRead(const char **s);
	
	// 読み込みを終える
	void EndRead(void);
	
	
	
	
}


#endif
