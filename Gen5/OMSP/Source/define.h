/**	@file
	@brief 諸定義
*/

#ifndef _DEFINE_H_
#define _DEFINE_H_

#include "driver/OMSP.h"



/*** 定数 ***/
#define F_CPU				(50000000)	// OMSPコアの動作周波数[Hz]
#define XBEE_BAUDRATE		(57600)		// XBeeのボーレート[baud]
#define CONTROLLER_TIMEOUT	(500)		// コントローラのタイムアウト時間[ms]
#define INT_INTERVAL		(2)			// 定期割り込みの間隔[ms] (1～16)









#endif
