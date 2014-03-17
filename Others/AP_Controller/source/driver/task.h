// タスクの制御

#ifndef TASK_H_
#define TASK_H_

#include "../define.h"
#include "int.h"



// 定数
#define F_TIMER		1000	// タイマーは1000Hz
#define MAX_TASKS	32		// 管理できるタスク数の最大数



// タスク記述子
typedef struct TaskDesc_id{
	bool (*InitProc)(const void *init_data);	// 初期化プロシージャ
	void (*MainProc)();							// メインプロシージャ
	void (*ExitProc)();							// 終了プロシージャ
} TaskDesc_t;	// タスク記述子

// タスク情報
typedef struct TaskInfo_id{
	const TaskDesc_t *Desc;		// タスク記述子
	void *Data;					// タスクごとのデータ
	unsigned short Interval;	// 呼び出し間隔
	unsigned short Counter;		// 現在の計数値
} TaskInfo_t;	// タスク情報








/* タスク管理関数群 */

// タスク管理の初期化
void Task_Init(void);

// タスクをすべて破棄
void Task_Destroy(void);

// タスクの作成
int Task_Create(const TaskDesc_t *task_desc, unsigned short interval, const void *init_data = NULL);

// タスクの削除
void Task_Delete(unsigned int task_id);

// タスクの呼び出し間隔を変更
void Task_ChangeInterval(int task_id, unsigned short interval);



// 現在実行中のタスクIDを取得
extern int ExecutingTask;
inline int Task_GetThisID(void){
	return ExecutingTask;
}

// タスクを終了
inline void Task_Exit(void){
	Task_Delete(Task_GetThisID());
}	

// システムを終了
//   呼び出したタスクがシステムに処理を返すとシステムが終了する
extern int ExitFlag;
inline void Task_SystemExit(int code){
	ExitFlag = code;
}






// 割り込みルーチン
IH Task_OnTimer();

// タスク管理ルーチン
int Task_Main(void);








extern volatile unsigned int TimerCounter;

// 起動してからの経過時間をmsで取得
inline unsigned int GetTime(void);
inline unsigned int GetTime(void){
	return TimerCounter;
}

// ms単位で待つ
inline void Delay(unsigned int time);
inline void Delay(unsigned int time){
	unsigned int until = GetTime() + time;
	while(GetTime() < until);
}











#endif