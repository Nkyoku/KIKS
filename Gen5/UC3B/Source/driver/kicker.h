/**	@file
	@brief キッカーボードとの通信
*/

#ifndef KICKER_H_
#define KICKER_H_

#include "../define.h"



namespace Kicker{
	
	// 初期化
	void Init(void);
	
	// データを送る
	void Transmit(const void *data, int len);
	
	// 読み込みを始める
	int BeginRead(const char **s);
	
	// 読み込みを終える
	void EndRead(void);
	
	
	
	
	
	
}



#endif
