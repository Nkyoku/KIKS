/**	@file
	@brief 時刻の管理
*/

#ifndef TIME_H_
#define TIME_H_

#include "../define.h"



namespace Time{
	
	extern bool Synchronized;
	extern volatile unsigned long Counter;
	
	// 現在時刻を格納する
	struct TIME_t{
		unsigned int Year;
		unsigned int Month;
		unsigned int Day;
		unsigned int Hour;
		unsigned int Minute;
		unsigned int Second;
	};
	
	
	
	// 初期化
	void Init(void);
	
	// UNIX時間を取得
	static inline unsigned long GetTime(void){
		return Counter;
	}
	
	// UNIX時間を設定
	static inline void SetTime(unsigned long time){
		Synchronized = true;
		Counter = time;
	}
	
	// グレゴリオ暦を取得
	// output == NULLのとき、FatFs形式で時刻を返す
	unsigned int GetCalender(TIME_t *output);
	
	
	
	
	
	
	
}



#endif
