/**	@file
	@brief シェル
*/

#ifndef SHELL_TASK_H_
#define SHELL_TASK_H_

#include "../define.h"
#include "../driver/int.h"


namespace ShellTask{

	// タスク
	void Task(void *param);
	
	// (内部)一文字入力
	void IntPush(char c);
	
	// コマンドをパース
	void Parse(void);
	
	// 一文字出力
	void PutChar(char c);
	
	
	
	
}


#endif
