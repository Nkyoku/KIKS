// メイン

#include "main.h"

#include "define.h"
#include "driver/int.h"
#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/task.h"
#include "driver/usb/usb.h"
#include "driver/debug.h"
#include "driver/xbee.h"
#include "driver/ui.h"
#include "control.h"




bool Independent = true;
enum Generation_e{
	GN_Regacy,		// 旧世代
	GN_NextStep,	// 新世代
};
Generation_e Mode = GN_Regacy;






int main(void){
	int exit_code = EC_End;
	
	
	
	DisableGlobalInt();
	
	/* 初期化処理 */
	
	// 下層
	GPIO_Init();
	Int_Init();
	Clock_Init();
	USB_Init();
	
	// 中層
	Task_Init();
	
	// 上層
	Debug_Init();
	UI_Init();
	XBee_Init();
	
	Control_Init();
	
	
	
	
	
	
	
	/* メインルーチン */
	exit_code = Task_Main();
	
	
	
	/* 終了処理 */
	
	
	
	
	
	
	
	switch(exit_code){
	case EC_Reset:
		PM.gplp[0] = 1;
		__builtin_mtdr(AVR32_DC, AVR32_DC_DBE_MASK);
		__builtin_mtdr(AVR32_DC, AVR32_DC_RES_MASK);	// ソフトウェアリセット
		while(1);
		
	case EC_Bootloader:
		// ブートローダーモードへ移行
		PM.gplp[0] = 0;
		__builtin_mtdr(AVR32_DC, AVR32_DC_DBE_MASK);
		__builtin_mtdr(AVR32_DC, AVR32_DC_RES_MASK);	// ソフトウェアリセット
		while(1);
		
	default:
		while(1);
	}		
	
	return 0;
}
	