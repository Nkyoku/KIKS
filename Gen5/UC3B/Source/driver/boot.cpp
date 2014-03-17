/**	@file
	@brief APPモードとDFUモードの切り替え
*/

#include "boot.h"
#include "gpio.h"
#include "int.h"
#include "../asm/Trampoline.h"

#include <string.h>



namespace Boot{
	
	// フラグが立っていればAPPモードへジャンプ
	void JumpToAPPIfNecessary(void){
		SetPull(PIN_SETTING_APPLICATION, PIN_nSW1, PULL_UP);
		for(int cnt = 10; 0 < cnt; cnt--){
			NOP();	// プルアップが効くまで待つ
		}
		
		int gplp0 = AVR32_PM.gplp[0];
		static const int MASK	= AVR32_PM_RCAUSE_JTAGHARD_MASK
								| AVR32_PM_RCAUSE_CPUERR_MASK | AVR32_PM_RCAUSE_SLEEP_MASK
								| AVR32_PM_RCAUSE_JTAG_MASK | AVR32_PM_RCAUSE_WDT_MASK
								| AVR32_PM_RCAUSE_EXT_MASK | AVR32_PM_RCAUSE_BOD_MASK;
		if (AVR32_PM.rcause & MASK){
			gplp0 = BOOT_COLDSTART;
		}
		
		if (gplp0 == BOOT_COLDSTART){
			if (GetIn(PIN_SETTING_APPLICATION) == IN_LOW){
				// コールドスタート時に設定ピンがLowだったらアプリケーションを起動
				gplp0 = BOOT_APP;
			}
		}
		
		if ((gplp0 == BOOT_APP) || (gplp0 == BOOT_SAFE_APP)){
			// シグネチャを確認
			const void *app_start = (const void*)(AVR32_FLASH_ADDRESS + SIGNATURE_OFFSET);
			if (memcmp(app_start, SIGNATURE_STRING, sizeof(SIGNATURE_STRING)) == 0){
				// シグネチャが一致
				// ファームウェアは正しいと思われる
				if (GetIn(PIN_nSW1) == IN_LOW){
					// APPモードで起動時にスイッチが押されていたらセーフAPPモードで起動
					gplp0 = BOOT_SAFE_APP;
				}
				AVR32_PM.gplp[0] = gplp0;
				__asm__ __volatile__(
					"mov r8, %[offset21]	\n"
					"orh r8, 0x8000			\n"
					"mov pc, r8"
					:: [offset21]"i"(PROGRAM_START_OFFSET)
					);
				while(true);
			}else{
				// シグネチャが一致しない
				gplp0 = BOOT_COLDSTART;
			}
		}
		AVR32_PM.gplp[0] = gplp0;
	}
	
	// APPモードで起動フラグをセットする
	void CheckFlagAtAPP(void){
		// DFUが書き込まれていないときにはフラグが異常になっている
		if (AVR32_PM.gplp[0] == BOOT_COLDSTART){
			AVR32_PM.gplp[0] = BOOT_APP;
		}
	}
	
	// モードを移行
	NORETURN SwitchTo(BOOT_e mode){
		DisableGlobalInt();
		AVR32_PM.gplp[0] = mode;
		__builtin_mtdr(AVR32_DC, AVR32_DC_DBE_MASK); 
		__builtin_mtdr(AVR32_DC, AVR32_DC_RES_MASK);
		while(true);
	}
	
	
	
	
}
