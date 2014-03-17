// ��������̂��߂̊֐��Q

#ifndef SYNC_H_
#define SYNC_H_

#include "../define.h"




/* �Z�}�t�H */

// �Z�}�t�H�^
class Semaphore_t;

// �Z�}�t�H���l������
inline bool GetSemaphore(Semaphore_t &sem);

// �Z�}�t�H���������
inline void ReleaseSemaphore(Semaphore_t &sem);

// �Z�}�t�H�^
class Semaphore_t{
	friend bool GetSemaphore(Semaphore_t &sem);
	friend void ReleaseSemaphore(Semaphore_t &sem);
	
private:
	volatile bool Flag;
	Semaphore_t() : Flag(false){}
};

// �Z�}�t�H���l������
inline bool GetSemaphore(Semaphore_t &sem){
	DisableGlobalInt();
	bool ret;
	ret = !sem.Flag;
	if (ret == true)
		sem.Flag = true;
	EnableGlobalInt();
	return ret;
}

// �Z�}�t�H���������
inline void ReleaseSemaphore(Semaphore_t &sem){
	sem.Flag = false;
}








#endif
