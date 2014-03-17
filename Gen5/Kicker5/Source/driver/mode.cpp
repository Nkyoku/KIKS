/**	@file
	@brief APPモードとDFUモードの切り替え
*/

#include "../define.h"



namespace Mode{
	
	// フラグが立っていればAPPモードへジャンプ
	void JumpToAPPIfNecessary(void){
		unsigned char status = RST.STATUS;
		RST.STATUS = 0x3F;
		if (status & RST_WDRF_bm){
			// リセット要因がWDTのときは、アプリケーションにジャンプ
			__asm__ __volatile__("jmp 0");
			while(true);
		}
	}
	
	// DFUモードへ移行
	NORETURN SwitchToDFU(void){
		cli();
		CCP = CCP_IOREG_gc;
		RST.CTRL = RST_SWRST_bm;	// ソフトウェアリセット
		while(true);
	}
	
	// APPモードへ移行
	NORETURN SwitchToAPP(void){
		cli();
		WriteProtectedIOREG(&WDT.CTRL, WDT_PER_8CLK_gc | WDT_ENABLE_bm | WDT_CEN_bm);
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		WriteProtectedIOREG(&WDT.WINCTRL, WDT_WPER_8KCLK_gc | WDT_WEN_bm | WDT_WCEN_bm);
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		__asm__ __volatile__("wdr");	// WDTリセットを故意に起こす
		/*CCP = CCP_IOREG_gc;
		WDT.CTRL = WDT_PER_8CLK_gc | WDT_ENABLE_bm | WDT_CEN_bm;
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		CCP = CCP_IOREG_gc;
		WDT.WINCTRL = WDT_WPER_8KCLK_gc | WDT_WEN_bm | WDT_WCEN_bm;
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		__asm__ __volatile__("wdr");	// WDTリセットを故意に起こす*/
		while(true);
	}
	
	
	
	
	
	
}
