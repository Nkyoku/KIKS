/**	@file
	@brief キッカータスク
*/

#ifndef KICKER_TASK_H_
#define KICKER_TASK_H_

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"



namespace KickerTask{
	
	/* 定数 */
	static const unsigned int TIMEOUT	= 300;	// キッカーをロストしたと判定するまでの時間
	
	
	/* 変数 */
	enum TASK_FLAG_e{
		TASK_FLAG_ALIVE = 1,		// タスクは生きている
		TASK_FLAG_KILLREQ = 2,		// タスクに終了を要求
		TASK_FLAG_STOPREQ = 4,		// 充電の停止を要求
		TASK_FLAG_KICKREQ = 8,		// キックを要求
	};
	extern volatile int m_TaskFlag;
	
	extern xSemaphoreHandle m_Semaphore;
	extern volatile unsigned int m_Timeout;
	extern volatile bool m_ChargeDisable;
	extern volatile signed int m_Strength;
	
	extern volatile bool m_Trouble;
	
	
	
	// タスク
	void Task(void *param);
	
	
	
	
	
	// 接続されているか
	static inline bool IsConnected(void){
		return m_Timeout < TIMEOUT;
	}
	
	// 動作に異常は無いか
	static inline bool IsRunning(void){
		return !m_Trouble && IsConnected();
	}
	
	// タスクが起動しているか
	static inline bool IsAlive(void){
		return m_TaskFlag & TASK_FLAG_ALIVE;
	}
	
	// タスクの終了を要求
	static inline void RequestExit(void){
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_KILLREQ);
		xSemaphoreGive(m_Semaphore);
	}
	
	// 充電の停止を要求
	static inline void StopCharging(void){
		m_ChargeDisable = true;
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_STOPREQ);
		xSemaphoreGive(m_Semaphore);
	}
	
	// キックを指示
	// 正数でストレート、負数でチップキック
	void Kick(int strength);
	
	
	
	
	
	// (内部)コマンドを送信
	void IntTx(char cmd, int value);
	

	








}




#endif
