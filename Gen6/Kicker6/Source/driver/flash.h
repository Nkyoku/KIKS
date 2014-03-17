/**	@file
	@brief NVM�̐���
*/

#ifndef FLASH_H_
#define FLASH_H_



#include "../define.h"

namespace Flash{
	
	static const unsigned short PAGE_SIZE	= 256;			// �y�[�W�T�C�Y
	static const unsigned long FLASH_SIZE	= 36L * 1024L;	// �����t���b�V���̃T�C�Y
	static const unsigned long APP_SIZE		= 32L * 1024L;	// APP�̈�̃T�C�Y
	static const unsigned long DFU_SIZE		= 4L * 1024L;	// DFU�̈�̃T�C�Y
	static const unsigned short FLASH_PAGES	= FLASH_SIZE / PAGE_SIZE;
	static const unsigned short APP_PAGES	= APP_SIZE / PAGE_SIZE;
	static const unsigned short DFU_PAGES	= DFU_SIZE / PAGE_SIZE;
	
	
	// �t���b�V�����C�g
	bool Write(unsigned char page, const void *data);
	
	// EEPROM�Ƀy�[�W��������
	bool EEPROMPageWrite(unsigned char page, const void *data);
	
	
	// EEPROM����o�C�g�ǂݏo��
	unsigned char EEPROMReadByte(unsigned short addr);
	unsigned char EEPROMReadByte(unsigned short addr, unsigned char def);
	
	// EEPROM���烏�[�h�ǂݏo��
	unsigned short EEPROMReadWord(unsigned short addr, unsigned short def);
	
	
}



#endif
