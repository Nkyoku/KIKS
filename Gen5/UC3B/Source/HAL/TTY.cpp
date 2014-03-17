/**	@file
	@brief コンソール入出力の仮想化
*/

#include "TTY.h"
#include "../driver/debugIF.h"
#include "../driver/usb.h"



// TTYデバイス
extern const clTTY ttyUART = {nsDebugIF::Write, NULL, nsDebugIF::BeginRead, nsDebugIF::EndRead};	// UART TTY
extern const clTTY ttyUSB =  {USB::Debug::Write, NULL, USB::Debug::BeginRead, USB::Debug::EndRead};	// USB TTY



// 複数データを書き込み
void clTTY::Write(const char *s, int len) const{
	if (pWriteString){
		(*pWriteString)(s, len);
	}else{
		for(int cnt = 0; cnt < len; cnt++){
			(*pWriteByte)(*s++);
		}
	}
}
