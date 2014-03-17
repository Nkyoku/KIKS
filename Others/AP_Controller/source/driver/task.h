// �^�X�N�̐���

#ifndef TASK_H_
#define TASK_H_

#include "../define.h"
#include "int.h"



// �萔
#define F_TIMER		1000	// �^�C�}�[��1000Hz
#define MAX_TASKS	32		// �Ǘ��ł���^�X�N���̍ő吔



// �^�X�N�L�q�q
typedef struct TaskDesc_id{
	bool (*InitProc)(const void *init_data);	// �������v���V�[�W��
	void (*MainProc)();							// ���C���v���V�[�W��
	void (*ExitProc)();							// �I���v���V�[�W��
} TaskDesc_t;	// �^�X�N�L�q�q

// �^�X�N���
typedef struct TaskInfo_id{
	const TaskDesc_t *Desc;		// �^�X�N�L�q�q
	void *Data;					// �^�X�N���Ƃ̃f�[�^
	unsigned short Interval;	// �Ăяo���Ԋu
	unsigned short Counter;		// ���݂̌v���l
} TaskInfo_t;	// �^�X�N���








/* �^�X�N�Ǘ��֐��Q */

// �^�X�N�Ǘ��̏�����
void Task_Init(void);

// �^�X�N�����ׂĔj��
void Task_Destroy(void);

// �^�X�N�̍쐬
int Task_Create(const TaskDesc_t *task_desc, unsigned short interval, const void *init_data = NULL);

// �^�X�N�̍폜
void Task_Delete(unsigned int task_id);

// �^�X�N�̌Ăяo���Ԋu��ύX
void Task_ChangeInterval(int task_id, unsigned short interval);



// ���ݎ��s���̃^�X�NID���擾
extern int ExecutingTask;
inline int Task_GetThisID(void){
	return ExecutingTask;
}

// �^�X�N���I��
inline void Task_Exit(void){
	Task_Delete(Task_GetThisID());
}	

// �V�X�e�����I��
//   �Ăяo�����^�X�N���V�X�e���ɏ�����Ԃ��ƃV�X�e�����I������
extern int ExitFlag;
inline void Task_SystemExit(int code){
	ExitFlag = code;
}






// ���荞�݃��[�`��
IH Task_OnTimer();

// �^�X�N�Ǘ����[�`��
int Task_Main(void);








extern volatile unsigned int TimerCounter;

// �N�����Ă���̌o�ߎ��Ԃ�ms�Ŏ擾
inline unsigned int GetTime(void);
inline unsigned int GetTime(void){
	return TimerCounter;
}

// ms�P�ʂő҂�
inline void Delay(unsigned int time);
inline void Delay(unsigned int time){
	unsigned int until = GetTime() + time;
	while(GetTime() < until);
}











#endif