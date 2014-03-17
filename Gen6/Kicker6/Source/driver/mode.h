/**	@file
	@brief APPモードとDFUモードの切り替え
*/

#ifndef MODE_H_
#define MODE_H_

#include "../define.h"


namespace Mode{
	
	// フラグが立っていればAPPモードへジャンプ
	void JumpToAPPIfNecessary(void);
	
	// DFUモードへ移行
	NORETURN SwitchToDFU(void);
	
	// APPモードへ移行
	NORETURN SwitchToAPP(void);
	
	
	
	
	
	
	
}


#endif
