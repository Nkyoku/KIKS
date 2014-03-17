/*	@file
	@brief 一定時間待つ
*/

#include "../define.h"



// 少し待つ
void delay_moment(unsigned short cnt){
	while(0 < cnt--){
		_nop();
	}
}

// 一定時間待つ
void delay_ms(unsigned short ms){
	unsigned short start = TICK16;
	unsigned short end = start + ms;
	if (end < start){
		while(start <= TICK16);	// 16bit型の最大値をまたぐ
	}
	while(TICK16 <= end);
}


