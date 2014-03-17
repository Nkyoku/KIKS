/**	@file
	@brief USBメインタスクの構造体定義
*/

#ifndef USB_TASK_STRUCT_H_
#define USB_TASK_STRUCT_H_

#include "message_enum.h"
#include "message_struct.h"



// 可変長配列のメンバーがあることを明記する
#define UNSIZED

// 値の決まっていないメンバーがあることを明記する
#define VAR 0



namespace USBTask{
	using namespace BTT;
	
	static const unsigned int NUM_OF_PIPE_LINKS	= 4;
	
	// デバイス情報
#ifdef _DFU_
	static const DEVICE_INFO_RET_t DeviceInfoRet = {
		"KIKS SSL Gen.5 Rev.A (DFU)", "name1", "name2",
		__DATE__, __TIME__,
		5, 1, 0, NUM_OF_PIPE_LINKS, UNSIZED
	};
	static const char DeviceInfoRetCaps[] = "pipe_read,pipe_write,dir_read,dir_write,file_read,file_write";
#else	
	static const DEVICE_INFO_RET_t DeviceInfoRet = {
		"KIKS SSL Gen.5 Rev.A (APP)", "name1", "name2",
		__DATE__, __TIME__,
		5, 1, 0, NUM_OF_PIPE_LINKS, UNSIZED
	};
	static const char DeviceInfoRetCaps[] = "pipe_read,pipe_write,dir_read,file_read";
#endif
	
	
	
	
	
	
	
	
}


#endif
