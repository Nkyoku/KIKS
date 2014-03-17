/*	@file
	@brief XBeeの制御
*/

#ifndef _XBEE_H_
#define _XBEE_H_


namespace XBee{
	
	// 初期化
	void Init(void);
	
	// ポーリング
	// 引数には受信関数を指定する
	void Receive(void (*func)(unsigned short, const char*));
	
}


#endif
