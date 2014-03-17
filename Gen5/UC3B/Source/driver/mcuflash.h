/**	@file
	@brief 内蔵フラッシュの制御
*/

#ifndef MCUFLASH_H_
#define MCUFLASH_H_

#include "../define.h"

#include "../HAL/Pipe.h"



namespace MCUFlash{
	
	static const unsigned int PAGE_SIZE		= 512;			// ページサイズ
	static const unsigned int FLASH_SIZE	= 512 * 1024;	// 内蔵フラッシュのサイズ
	static const unsigned int APP_START		= 64 * 1024;	// APP領域の開始位置(DFU領域のサイズ)
	static const unsigned int FF_START		= 128 * 1024;	// SPIフラッシュの代替領域の開始位置
	static const unsigned int APP_SIZE		= FLASH_SIZE - APP_START;	// APP領域のサイズ
	static const unsigned int FF_SIZE		= FLASH_SIZE - FF_START;	// 代替領域のサイズ
	
	// DFU領域のサイズの変更点はTrampoline.hにもある
	
	
	// シークポインタ
	extern signed int Pointer;
	
	// パイプ情報
	extern const BTT::PIPE_INFO_t Info;
	
	// 開く
	bool Open(void);
	
	// 閉じる
	void Close(void);
	
	// 書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written);
	
	// 読み込む
	bool Read(void *data, unsigned int len, unsigned int &read);
	
	// シークする
	bool Seek(unsigned int addr);
	
	
	
}



#endif
