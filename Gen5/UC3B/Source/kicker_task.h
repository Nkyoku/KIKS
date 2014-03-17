/**	@file
	@brief �L�b�J�[�^�X�N
*/

#ifndef KICKER_TASK_H_
#define KICKER_TASK_H_

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"



namespace KickerTask{
	
	/* �萔 */
	static const unsigned int TIMEOUT	= 300;	// �L�b�J�[�����X�g�����Ɣ��肷��܂ł̎���
	
	
	/* �ϐ� */
	enum TASK_FLAG_e{
		TASK_FLAG_ALIVE = 1,		// �^�X�N�͐����Ă���
		TASK_FLAG_KILLREQ = 2,		// �^�X�N�ɏI����v��
		TASK_FLAG_STOPREQ = 4,		// �[�d�̒�~��v��
		TASK_FLAG_KICKREQ = 8,		// �L�b�N��v��
	};
	extern volatile int m_TaskFlag;
	
	extern xSemaphoreHandle m_Semaphore;
	extern volatile unsigned int m_Timeout;
	extern volatile bool m_ChargeDisable;
	extern volatile signed int m_Strength;
	
	extern volatile bool m_Trouble;
	
	
	
	// �^�X�N
	void Task(void *param);
	
	
	
	
	
	// �ڑ�����Ă��邩
	static inline bool IsConnected(void){
		return m_Timeout < TIMEOUT;
	}
	
	// ����Ɉُ�͖�����
	static inline bool IsRunning(void){
		return !m_Trouble && IsConnected();
	}
	
	// �^�X�N���N�����Ă��邩
	static inline bool IsAlive(void){
		return m_TaskFlag & TASK_FLAG_ALIVE;
	}
	
	// �^�X�N�̏I����v��
	static inline void RequestExit(void){
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_KILLREQ);
		xSemaphoreGive(m_Semaphore);
	}
	
	// �[�d�̒�~��v��
	static inline void StopCharging(void){
		m_ChargeDisable = true;
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_STOPREQ);
		xSemaphoreGive(m_Semaphore);
	}
	
	// �L�b�N���w��
	// �����ŃX�g���[�g�A�����Ń`�b�v�L�b�N
	void Kick(int strength);
	
	
	
	
	
	// (����)�R�}���h�𑗐M
	void IntTx(char cmd, int value);
	

	








}




#endif
