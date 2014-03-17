/**	@file
	@brief パイプ
*/

#ifndef PIPE_H_
#define PIPE_H_

#include "../define.h"
#include "../message_struct.h"



// パイプの仮想化クラス
struct clPipe{
//private:
	
	// メンバー
	const BTT::PIPE_INFO_t *Info;
	
	// 関数テーブル
	bool (*pOpen)(void);
	void (*pClose)(void);
	bool (*pWrite)(const void*, unsigned int, unsigned int&);
	bool (*pRead)(void*, unsigned int, unsigned int&);
	bool (*pSeek)(unsigned int);
	unsigned int *pSeekPointer;
	
	
	
	
//public:
	// コンストラクタ
	//clTTY(void (*pwb)(char), void (*pws)(const char*, int), int (*pbr)(const char**), void (*per)(void))
	//	: pWriteByte(pwb), pWriteString(pws), pBeginRead(pbr), pEndRead(per){}
	
	// 開く
	bool Open(void) const{
		return (*pOpen)();
	}
	
	// 閉じる
	void Close(void) const{
		return (*pClose)();
	}
	
	// 書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written) const{
		return (*pWrite)(data, len, written);
	}
	
	// 読み込む
	bool Read(void *data, unsigned int len, unsigned int &read) const{
		return (*pRead)(data, len, read);
	}
	
	// シークする
	bool Seek(unsigned int addr) const{
		return (*pSeek)(addr);
	}
};



extern const clPipe pipeList[];				// パイプの一覧
extern const unsigned int pipeListLength;	// 一覧の項目数



/* 何もしないパイプ */
namespace DefPipe{
	// シークポインタ
	extern const signed int Pointer;
	
	// 常に成功する開く
	bool AlwaysOpen(void);
	
	// 常に失敗する開く
	bool Open(void);
	
	// 閉じる
	void Close(void);
	
	// 常に失敗する書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written);
	
	// 常に失敗する読み込み
	bool Read(void *data, unsigned int len, unsigned int &read);
	
	// 常に失敗するシーク
	bool Seek(unsigned int addr);
}



#endif
