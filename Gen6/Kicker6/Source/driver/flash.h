/**	@file
	@brief NVMの制御
*/

#ifndef FLASH_H_
#define FLASH_H_



#include "../define.h"

namespace Flash{
	
	static const unsigned short PAGE_SIZE	= 256;			// ページサイズ
	static const unsigned long FLASH_SIZE	= 36L * 1024L;	// 内蔵フラッシュのサイズ
	static const unsigned long APP_SIZE		= 32L * 1024L;	// APP領域のサイズ
	static const unsigned long DFU_SIZE		= 4L * 1024L;	// DFU領域のサイズ
	static const unsigned short FLASH_PAGES	= FLASH_SIZE / PAGE_SIZE;
	static const unsigned short APP_PAGES	= APP_SIZE / PAGE_SIZE;
	static const unsigned short DFU_PAGES	= DFU_SIZE / PAGE_SIZE;
	
	
	// フラッシュライト
	bool Write(unsigned char page, const void *data);
	
	// EEPROMにページ書き込み
	bool EEPROMPageWrite(unsigned char page, const void *data);
	
	
	// EEPROMからバイト読み出し
	unsigned char EEPROMReadByte(unsigned short addr);
	unsigned char EEPROMReadByte(unsigned short addr, unsigned char def);
	
	// EEPROMからワード読み出し
	unsigned short EEPROMReadWord(unsigned short addr, unsigned short def);
	
	
}



#endif
