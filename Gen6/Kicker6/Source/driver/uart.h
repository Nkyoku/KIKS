/**	@file
	@brief �x�[�X�{�[�h�Ƃ̒ʐM
*/

#ifndef UART_H_
#define UART_H_

#include "../define.h"



namespace UART{

	// ������
	void Init(void);
	
	// ��������
	void Write(char c);
	
	// �����f�[�^����������
	void Write(const char *s);
	
	// �ǂݍ��݂��n�߂�
	unsigned short BeginRead(const char **s);
	
	// �ǂݍ��݂��I����
	void EndRead(void);
	
	
	
	
}


#endif
