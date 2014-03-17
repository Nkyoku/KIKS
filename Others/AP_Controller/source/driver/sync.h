// 協調動作のための関数群

#ifndef SYNC_H_
#define SYNC_H_

#include "../define.h"




/* セマフォ */

// セマフォ型
class Semaphore_t;

// セマフォを獲得する
inline bool GetSemaphore(Semaphore_t &sem);

// セマフォを解放する
inline void ReleaseSemaphore(Semaphore_t &sem);

// セマフォ型
class Semaphore_t{
	friend bool GetSemaphore(Semaphore_t &sem);
	friend void ReleaseSemaphore(Semaphore_t &sem);
	
private:
	volatile bool Flag;
	Semaphore_t() : Flag(false){}
};

// セマフォを獲得する
inline bool GetSemaphore(Semaphore_t &sem){
	DisableGlobalInt();
	bool ret;
	ret = !sem.Flag;
	if (ret == true)
		sem.Flag = true;
	EnableGlobalInt();
	return ret;
}

// セマフォを解放する
inline void ReleaseSemaphore(Semaphore_t &sem){
	sem.Flag = false;
}








#endif
