/**	@file
	@brief フラッシュ書き換え
*/



#include "flash.h"
#include "../define.h"

#include <util/delay.h>
#include <string.h>



namespace Flash{
	
	// フラッシュライト
	bool Write(unsigned char page, const void *data_){
		if (APP_PAGES < page) return false;
		
		NVM.CTRLB = 0;
		
		CriticalSection{
			// ページバッファ消去
			NVM.CMD = NVM_CMD_ERASE_FLASH_BUFFER_gc;
			WriteProtectedSPM(&NVM.CTRLA, NVM_CMDEX_bm);
			while(NVM.STATUS & NVM_NVMBUSY_bm);
			
			// ページバッファ転送
			NVM.CMD = NVM_CMD_LOAD_FLASH_BUFFER_gc;
			const char *data = (const char *)data_;
			unsigned short addr = PAGE_SIZE * page;
			for(unsigned short cnt = 0; cnt < (PAGE_SIZE / 2); cnt++){
				char dataL = *data++;
				char dataH = *data++;
				__asm__ __volatile__(
					"push r31"			"\n\t"
					"push r30"			"\n\t"
					"movw r30, %A0"		"\n\t"
					"mov r0, %1"		"\n\t"
					"mov r1, %2"		"\n\t"
					"spm"				"\n\t"
					"eor r1, r1"		"\n\t"
					"pop r30"			"\n\t"
					"pop r31"
					::"r"(addr), "r"(dataL), "r"(dataH)
					);
				addr += 2;
			}
			
			// ページ書き込み
			NVM.CMD = NVM_CMD_ERASE_WRITE_APP_PAGE_gc;
			__asm__ __volatile__(
				"push r31"				"\n\t"
				"push r30"				"\n\t"
				"in __tmp_reg__, %1"	"\n\t"
				"out %1, %B0"			"\n\t"
				"mov r31, %A0"			"\n\t"
				"ldi r30, 0x9D"			"\n\t"
				"out %2, r30"			"\n\t"
				"eor r30, r30"			"\n\t"
				"spm"					"\n\t"
				"out %1, __tmp_reg__"	"\n\t"
				"pop r30"				"\n\t"
				"pop r31"
				::"r"(page), "I"(_SFR_IO_ADDR(RAMPZ)), "I"(_SFR_IO_ADDR(CCP))
				);
			while(NVM.STATUS & NVM_NVMBUSY_bm);
			
			NVM.CMD = NVM_CMD_NO_OPERATION_gc;
		}
		
		return true;
	}
	
	// EEPROMにページ書き込み
	bool EEPROMPageWrite(unsigned char page, const void *data_){
		if ((EEPROM_SIZE / EEPROM_PAGE_SIZE) < page) return false;
		
		CriticalSection{
			while(NVM.STATUS & NVM_NVMBUSY_bm);
			
			// ページバッファ消去
			NVM.CMD = NVM_CMD_ERASE_EEPROM_BUFFER_gc;
			WriteProtectedIOREG(&NVM.CTRLA, NVM_CMDEX_bm);
			while(NVM.STATUS & NVM_NVMBUSY_bm);
			
			// ページバッファ転送
			NVM.CMD = NVM_CMD_LOAD_EEPROM_BUFFER_gc;
			NVM.ADDR1 = 0;
			NVM.ADDR2 = 0;
			const char *data = (const char*)data_;
			for(char byte_addr = 0; byte_addr < EEPROM_PAGE_SIZE; byte_addr++){
				NVM.ADDR0 = byte_addr;
				NVM.DATA0 = *data++;
			}
			
			// ページ書き込み
			unsigned short page_addr = (unsigned short)page * EEPROM_PAGE_SIZE;
			NVM.ADDR0 = page_addr & 0xFF;
			NVM.ADDR1 = (page_addr >> 8) & 0xFF;
			NVM.CMD = NVM_CMD_ERASE_WRITE_EEPROM_PAGE_gc;
			WriteProtectedIOREG(&NVM.CTRLA, NVM_CMDEX_bm);
			while(NVM.STATUS & NVM_NVMBUSY_bm);
			
			NVM.CMD = NVM_CMD_NO_OPERATION_gc;
		}
		
		return true;
	}
	
	// EEPROMからバイト読み出し
	unsigned char EEPROMReadByte(unsigned short addr){
		while(NVM.STATUS & NVM_NVMBUSY_bm);
		NVM.ADDR0 = addr & 0xFF;
		NVM.ADDR1 = (addr >> 8) & 0xFF;
		NVM.ADDR2 = 0;
		NVM.CMD = NVM_CMD_READ_EEPROM_gc;
		WriteProtectedIOREG(&NVM.CTRLA, NVM_CMDEX_bm);
		return NVM.DATA0;
	}
	unsigned char EEPROMReadByte(unsigned short addr, unsigned char def){
		unsigned char ret = EEPROMReadByte(addr);
		if (ret == 0xFF) ret = def;
		return ret;
	}
	
	// EEPROMからワード読み出し
	unsigned short EEPROMReadWord(unsigned short addr, unsigned short def){
		union{
			unsigned char byte[2];
			unsigned short word;
		} ret;
		ret.byte[0] = EEPROMReadByte(addr);
		ret.byte[1] = EEPROMReadByte(addr + 1);
		if (ret.word == 0xFFFF) ret.word = def;
		return ret.word;
	}
	
	
	
}




