/**	@file
	@brief APP���[�h��DFU���[�h�̐؂�ւ�
*/

#ifndef MODE_H_
#define MODE_H_

#include "../define.h"


namespace Mode{
	
	// �t���O�������Ă����APP���[�h�փW�����v
	void JumpToAPPIfNecessary(void);
	
	// DFU���[�h�ֈڍs
	NORETURN SwitchToDFU(void);
	
	// APP���[�h�ֈڍs
	NORETURN SwitchToAPP(void);
	
	
	
	
	
	
	
}


#endif
