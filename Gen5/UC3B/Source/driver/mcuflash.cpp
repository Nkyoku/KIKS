/**	@file
	@brief 内蔵フラッシュの制御
*/



#include "mcuflash.h"

#include "xprintf.h"

#include <string.h>



// 確認のため、値をチェック
#if AVR32_FLASH_SIZE != 0x80000
#error Internal flash size is not 512KB!
#endif

#if AVR32_FLASHC_PAGE_SIZE != 512
#error Flash page size is not 512B
#endif



namespace MCUFlash{
	
	// シークポインタ
	signed int Pointer = -1;
	
	// パイプ情報
#ifdef _DFU_
	extern const BTT::PIPE_INFO_t Info = {
		"MCUFLASH",
		APP_SIZE,
		PAGE_SIZE,
		BTT::RWS
	};
#else
	extern const BTT::PIPE_INFO_t Info = {
		"MCUFLASH",
		APP_SIZE,
		PAGE_SIZE,
		BTT::RS
	};
#endif
	
	// 開く
	bool Open(void){
		if (Pointer < 0){
			Pointer = 0;
			return true;
		}else{
			return false;
		}
	}
	
	// 閉じる
	void Close(void){
		Pointer = -1;
	}
	
	// 書き込み
#ifdef _DFU_
	bool Write(const void *data, unsigned int len, unsigned int &written){
		// ポインタとサイズの確認
		signed int addr_s = Pointer;
		unsigned int addr = Pointer;
		if (addr_s < 0) return false;
		if (addr & (PAGE_SIZE - 1)) return false;
		if (len & (PAGE_SIZE - 1)) return false;
		
		if (APP_SIZE <= addr){
			// 書き込めるデータは無い
			written = 0;
		}else{
			if (APP_SIZE < (addr + len)){
				len = APP_SIZE - addr;
			}
			
			written = len;
			Pointer = addr + len;
			addr += APP_START;
			
			while(0 < len){
				if (FLASH_SIZE <= addr) break;
				
				// すでに書き込まれている内容と比較
				const int *src = (const int*)data;
				int *dst = (int*)(AVR32_FLASH_ADDRESS + addr);
				if (memcmp(src, dst, PAGE_SIZE) != 0){
					unsigned int page_num = addr / PAGE_SIZE;
					
					// 内容が異なるので書き換え
				
					// ページバッファをクリア
					AVR32_FLASHC.fcmd = (0xA5 << AVR32_FLASHC_FCMD_KEY) | (0 << AVR32_FLASHC_FCMD_PAGEN) | AVR32_FLASHC_FCMD_CMD_CPB;
					while(~AVR32_FLASHC.fsr & AVR32_FLASHC_FSR_FRDY_MASK);
				
					// ページバッファへコピー
					for(int cnt = (PAGE_SIZE / 4); 0 < cnt; cnt--){
						*dst++ = *src++;
					}
				
					// Quick Page Readでページがすでに消去されているか調べる
					AVR32_FLASHC.fcmd = (0xA5 << AVR32_FLASHC_FCMD_KEY) | (page_num << AVR32_FLASHC_FCMD_PAGEN) | AVR32_FLASHC_FCMD_CMD_QPR;
					while(~AVR32_FLASHC.fsr & AVR32_FLASHC_FSR_FRDY_MASK);
				
					bool erased = false;
					if (~AVR32_FLASHC.fsr & AVR32_FLASHC_FSR_QPRR_MASK){
						// ページが消去されていないので、まずページ消去を行う
						AVR32_FLASHC.fcmd = (0xA5 << AVR32_FLASHC_FCMD_KEY) | (page_num << AVR32_FLASHC_FCMD_PAGEN) | AVR32_FLASHC_FCMD_CMD_EP;
						while(~AVR32_FLASHC.fsr & AVR32_FLASHC_FSR_FRDY_MASK);
						erased = true;
					}
				
					// ページを書き込む
					AVR32_FLASHC.fcmd = (0xA5 << AVR32_FLASHC_FCMD_KEY) | (page_num << AVR32_FLASHC_FCMD_PAGEN) | AVR32_FLASHC_FCMD_CMD_WP;
					while(~AVR32_FLASHC.fsr & AVR32_FLASHC_FSR_FRDY_MASK);
				
					if (erased == true){
						xprintf("Erase & ");
					}
					xprintf("Write(%X)\n", addr);
				}else{
					xprintf("Match(%X)\n", addr);
				}
				
				len -= PAGE_SIZE;
				addr += PAGE_SIZE;
				data = (const char*)data + PAGE_SIZE;
			}
		}
		
		return true;
	}
#else
	bool Write(const void *data, unsigned int len, unsigned int &written){
		return false;
	}
#endif
	
	// 読み込む
	bool Read(void *data, unsigned int len, unsigned int &read){
		signed int addr_s = Pointer;
		unsigned int addr = Pointer;
		if (addr_s < 0) return false;
		
		if (APP_SIZE <= addr){
			// 読み出すデータは無い
			read = 0;
		}else{
			const char *flash = (const char*)(AVR32_FLASH_ADDRESS + APP_START + addr);
		
			if (APP_SIZE < (addr + len)){
				len = APP_SIZE - addr;
			}
			
			memcpy(data, flash, len);
			
			Pointer = addr + len;
			read = len;
		}
		return true;
	}
	
	// シークする
	bool Seek(unsigned int addr){
		if (0 <= Pointer){
			Pointer = addr;
			return true;
		}else{
			return false;
		}
	}
	
	
	
}
