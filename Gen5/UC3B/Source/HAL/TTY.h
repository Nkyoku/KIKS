/**	@file
	@brief コンソール入出力の仮想化
*/

#ifndef TTY_H_
#define TTY_H_

#include "../define.h"



// コンソール入出力の仮想化クラス
struct clTTY{
//private:
	
	// 関数テーブル
	void (*pWriteByte)(char);
	void (*pWriteString)(const char*, int);
	int (*pBeginRead)(const char**);
	void (*pEndRead)(void);
	
//public:
	// コンストラクタ
	//clTTY(void (*pwb)(char), void (*pws)(const char*, int), int (*pbr)(const char**), void (*per)(void))
	//	: pWriteByte(pwb), pWriteString(pws), pBeginRead(pbr), pEndRead(per){}
	
	// 書き込み
	void Write(char c) const{
		(*pWriteByte)(c);
	}
	
	// 複数データを書き込み
	void Write(const char *s, int len) const;
	
	// 読み込みを始める
	int BeginRead(const char **s) const{
		return (*pBeginRead)(s);
	}
	
	// 読み込みを終える
	void EndRead(void) const{
		(*pEndRead)();
	}
};



extern const clTTY ttyUART;	// UART TTY
extern const clTTY ttyUSB;	// USB TTY



#endif
