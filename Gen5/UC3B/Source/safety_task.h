/**	@file
	@brief 電源監視、シャットダウン管理等
*/

#ifndef SAFETY_TASK_H_
#define SAFETY_TASK_H_

#include "../define.h"
#include "driver/boot.h"



namespace SafetyTask{
	
	extern volatile int m_RebootMode;	// 再起動要求
	
	
	
	// タスク
	void Task(void *param);
	
	
	
	// 再起動を要求
	static inline void RequestReboot(Boot::BOOT_e mode){
		m_RebootMode = mode;
	}
	
	
	
	
}


#endif
