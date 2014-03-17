/**	@file
	@brief メインタスク
*/

#ifndef MAIN_TASK_H_
#define MAIN_TASK_H_

#include "define.h"

#include "../HAL/Pipe.h"



namespace MainTask{
	
	
	
	enum TASK_FLAG_e{
		TASK_FLAG_ALIVE = 1,		// タスクは生きている
		TASK_FLAG_KILLREQ = 2,		// タスクに終了を要求
		TASK_FLAG_STEPREQ = 4,		// タスクに処理の進行を要求
		TASK_FLAG_SKIPREQ = 8,		// タスクに処理の省略を要求
	};
	extern volatile int m_TaskFlag;
	
	enum COP_FLAG_e{
		COP_FLAG_RUNNING = 1,		// コプロセッサが動作中
		COP_FLAG_PROGRAMMED = 2,	// コプロセッサのプログラムが完了した
		COP_FLAG_PROGRAMABLE = 4,	// 外部からコプロセッサのプログラムをすることができる
	};
	
	// ブザープログラム
	struct BUZPROG_t{
		unsigned short Frequency;	// 周波数
		unsigned short Duration;	// 時間
		signed short Rest;			// 休止時間
	};
	
	
	
	
	
	// メインタスクを起動
	void MainCreate(void);
	
	// メインタスクの終了を要求
	static inline void RequestExit(void){
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_KILLREQ);
	}
	
	// タスクが起動しているか
	static inline bool IsAlive(void){
		return m_TaskFlag & TASK_FLAG_ALIVE;
	}
	
	// セーフモードのときに、処理を自動で進める要求をする
	static inline void StepInSafeMode(void){
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_STEPREQ);
	}
	
	// セーフモードのときに、処理を省略する要求をする
	static inline void SkipInSafeMode(void){
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_SKIPREQ);
	}
	
	
	
	
	
	// タスクを起こす
	void Wake(void);
	
	
	
	
	
	// タスク本体
	void TaskBody(void *param);
	
	// 動作中のループ
	void TaskLoopRunning(void);
	
	// 低電圧・過熱状態のループ
	void TaskLoopShutdown(void);
	
	// タスクを自己終了する
	NORETURN TaskSelfKill(void);
	
	
	
	/* ブザー */
	
	// ブザープログラムを設定
	void SetBuzzer(const BUZPROG_t *buffer = NULL);
	
	// ブザーの処理
	void ProcBuzzer(unsigned int elapsed);
	
	
	
	/* ロガーFIFO */
	
	// ロガーFIFOのポーリング
	void PollLoggerFIFO(void);
	
	
	
	/* ファイルからコンフィギュレーション・プログラム */
	
	// ファイルからコンフィギュレーション
	bool ConfigFromFile(const char *path);
	
	// ファイルからプログラム
	bool ProgramFromFile(const char *path);
	
	
	
	/* コプロセッサのプログラムのためのパイプインターフェース */
	namespace Cop{
		// シークポインタ
		extern signed int Pointer;
		
		// パイプ情報
		extern const BTT::PIPE_INFO_t Info;
		
		// 開く
		bool Open(void);
		
		// 閉じる
		void Close(void);
		
		// 書き込み
		bool Write(const void *data, unsigned int len, unsigned int &written);
	}
	
}


#endif
