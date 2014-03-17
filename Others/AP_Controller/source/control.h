// �R���g���[���Ƃ��Ă̓���

#ifndef CONTROL_H_
#define CONTROL_H_

#include "define.h"
#include "driver/task.h"




// �萔
#define F_CONTROL_TASK		30		// �R���g���[���̃^�X�N�̕p�x




// �R���g���[����������
void Control_Init(void);



// �R���g���[���̏��������[�`��
bool Control_TaskInit(const void *init_data);

// �R���g���[���̃��C�����[�`��
void Control_TaskMain(void);

// �R���g���[���̏I�����[�`��
void Control_TaskExit(void);



// �r�b�g���𐔂���
inline int POPCNT(int bits);
inline int POPCNT(int bits){
	bits = (bits & 0x55555555) + (bits >> 1 & 0x55555555);
	bits = (bits & 0x33333333) + (bits >> 2 & 0x33333333);
	bits = (bits & 0x0f0f0f0f) + (bits >> 4 & 0x0f0f0f0f);
	bits = (bits & 0x00ff00ff) + (bits >> 8 & 0x00ff00ff);
	return (bits & 0x0000ffff) + (bits >>16 & 0x0000ffff);
}	

// �g���n�~���O�������v�Z
unsigned char CalcHamming(unsigned int word);








#endif
