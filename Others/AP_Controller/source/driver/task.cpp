// タスクの制御

#include "task.h"




volatile unsigned int TimerCounter = 0;

unsigned int NumOfTasks = 0;
unsigned int NextIndexOfTask = 0;
TaskInfo_t Task[MAX_TASKS] = {0};

int ExecutingTask = -1;			// 実行中のタスクID
int ExitFlag = -1;				// 終了要求フラグ(0以上で終了)




// タスク管理の初期化
void Task_Init(void){
	TC.channel[0].cmr	= AVR32_TC_CMR0_WAVE_MASK
						| (AVR32_TC_CMR0_WAVSEL_UP_AUTO << AVR32_TC_CMR0_WAVSEL)
						| (AVR32_TC_CMR0_TCCLKS_TIMER_CLOCK5 << AVR32_TC_CMR0_TCCLKS);
	TC.channel[0].rc = (F_CPU / 128) / F_TIMER;
	
	Int_Register(IRQ_TC0, (void*)Task_OnTimer, IL_NORMAL);
	TC.channel[0].ier = AVR32_TC_IER0_CPCS_MASK;
	
	TC.channel[0].ccr = AVR32_TC_CCR0_SWTRG_MASK | AVR32_TC_CCR0_CLKEN_MASK;
}

// タスクをすべて破棄
void Task_Destroy(void){
	for(unsigned int cnt = 0; cnt < MAX_TASKS; cnt++){
		const TaskDesc_t *task_desc = Task[cnt].Desc;
		if (task_desc != NULL){
			if (task_desc->ExitProc != NULL)
				task_desc->ExitProc();
			Task[cnt].Desc = NULL;
		}
	}
	NumOfTasks = 0;
	NextIndexOfTask = 0;
	ExecutingTask = -1;
}
	
// タスクの作成
int Task_Create(const TaskDesc_t *task_desc, unsigned short interval, const void *init_data){
	if (MAX_TASKS <= NumOfTasks) return -1;
	if (task_desc == NULL) return -1;
	
	// リストの中で空いているところを見つける
	int task_id;
	for(task_id = NextIndexOfTask; task_id < MAX_TASKS; task_id++){
		if (Task[task_id].Desc == NULL)
			break;
	}
	if (MAX_TASKS == task_id) return -1;
	
	// タスクを作成
	if ((task_desc->InitProc == NULL) || (task_desc->InitProc(init_data) == true)){
		Task[task_id].Desc = task_desc;
		Task[task_id].Data = NULL;
		interval = interval ? : 1;
		Task[task_id].Interval = interval;
		Task[task_id].Counter = interval;
		NumOfTasks++;
		NextIndexOfTask = task_id + 1;
		return task_id;
	}else{
		return -1;
	}		
}

// タスクの削除
void Task_Delete(unsigned int task_id){
	if (MAX_TASKS <= task_id) return;
	
	const TaskDesc_t *task_desc = Task[task_id].Desc;
	if (task_desc != NULL){
		if (task_desc->ExitProc != NULL)
			task_desc->ExitProc();
		Task[task_id].Desc = NULL;
		NumOfTasks--;
		if (task_id < NextIndexOfTask)
			NextIndexOfTask = task_id;
	}
}

// タスクの呼び出し間隔を変更
void Task_ChangeInterval(int task_id, unsigned short interval){
	if (MAX_TASKS <= task_id) return;
	
	if (Task[task_id].Desc != NULL){
		interval = interval ? : 1;
		Task[task_id].Interval = interval;
		if (interval < Task[task_id].Counter)
			Task[task_id].Counter = interval;
	}
}



// 割り込みルーチン
IH Task_OnTimer(){
	TC.channel[0].sr;
	TimerCounter += 1000 / F_TIMER;
}

// タスク管理ルーチン
int Task_Main(void){
	EnableLevelInt(IL_LOW);
	EnableLevelInt(IL_NORMAL);
	EnableLevelInt(IL_HIGH);
	EnableLevelInt(IL_HIGHEST);
	EnableGlobalInt();
	
	Delay(100);
	
	unsigned int last_time = GetTime(), now_time;
	
	while(1){
		// 次に起動するタスクを調べる
		int wait = 200;
		for(unsigned int cnt = 0; cnt < MAX_TASKS; cnt++){
			if (Task[cnt].Desc != NULL){
				int time = Task[cnt].Counter;
				if (time < wait) wait = time;
				if (time <= 0) break;
			}
			
		}
		
		if (0 < wait)
			Delay(wait / 2 + 1);
		
		now_time = GetTime();
		unsigned int dif = now_time - last_time;
		
		if (dif != 0){
			// 待ち時間が0のタスクを呼び出す
			for(unsigned int cnt = 0; cnt < MAX_TASKS; cnt++){
				if (Task[cnt].Desc != NULL){
					int counter = Task[cnt].Counter - dif;
					if (counter < 0){
						Task[cnt].Counter = counter + Task[cnt].Interval;
						ExecutingTask = cnt;
						//if (Task[cnt].Desc->MainProc() != NULL)
							Task[cnt].Desc->MainProc();
						if (0 <= ExitFlag)
							break;
					}else{
						Task[cnt].Counter = counter;
					}
				}
			}
		}
		if (0 <= ExitFlag)
			break;
		
		ExecutingTask = -1;
		
		last_time = now_time;
	}
	
	Task_Destroy();
	
	DisableGlobalInt();
	
	return ExitFlag;
}

	