/**	@file
	@brief	共通の変数宣言
*/

#ifndef GLOBAL_H_
#define GLOBAL_H_

#ifdef _MAIN_CPP_
// main.cppからincludeされたとき


/* グローバル変数 */
volatile bool g_Shutdown;			// シャットダウンシグナル
unsigned int g_MachineID = 0;		// マシンID
bool g_HiResEncoder = false;		// 高分解能のエンコーダを使用

FATFS g_FatFs_LogVol0;				// FatFsの論理ボリューム0管理領域(MX25L6445E)





#else
// それ以外からincludeされたとき

/* グローバル変数 */

extern volatile bool g_Shutdown;	// シャットダウンシグナル
extern unsigned int g_MachineID;	// マシンID
extern bool g_HiResEncoder;			// 高分解能のエンコーダを使用









#ifdef _FATFS
extern FATFS g_FatFs_LogVol0;		// FatFsの論理ボリューム0管理領域(MX25L6445E)
#endif








#endif

#endif
