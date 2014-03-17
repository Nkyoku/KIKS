/**	@file
	@brief APPモードとDFUモードの切り替え
*/

#ifndef BOOT_H_
#define BOOT_H_

#include "../define.h"


namespace Boot{
	
	// 起動フラグ
	enum BOOT_e{
		BOOT_COLDSTART = 0,	// コールドスタート
		BOOT_DFU,			// DFUモードでリセット
		BOOT_APP,			// APPモードでリセット
		BOOT_SAFE_APP,		// セーフAPPモードでリセット
	};
	
	
	// フラグが立っていればAPPモードへジャンプ
	void JumpToAPPIfNecessary(void);
	
	// APPモードで起動フラグをセットする
	void CheckFlagAtAPP(void);
	
	// モードを移行
	NORETURN SwitchTo(BOOT_e mode);
	
	// DFUモードへ移行
	static inline NORETURN SwitchToDFU(void){
		SwitchTo(BOOT_DFU);
	}
	
	// APPモードへ移行
	static inline NORETURN SwitchToAPP(void){
		SwitchTo(BOOT_APP);
	}
	
	// セーフAPPモードへ移行
	static inline NORETURN SwitchToSafeAPP(void){
		SwitchTo(BOOT_SAFE_APP);
	}
	
	// セーフモードか？
	static inline bool IsSafeAPP(void){
		return AVR32_PM.gplp[0] != BOOT_APP;
	}
	
	
	
	
	
}


#endif
