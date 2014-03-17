/**	@file
	@brief 時刻の管理
*/

#include "time.h"
#include "int.h"

#include "gpio.h"

#include "xprintf.h"

#include "FreeRTOS.h"
#include "task.h"



namespace Time{
	
	bool Synchronized;				// 時刻を同期した
	volatile unsigned long Counter;	// 現在時刻(UNIX時間)
	
	
	
	// 割り込みハンドラ
	static IH OnTimer(void){
		AVR32_PWM.isr;
		Counter++;
#ifdef _DFU_
		SetToggle(PIN_LED1, PIN_LED2);
#else
		SetToggle(PIN_LED1);
#endif
	}
	
	
	// 初期化
	void Init(void){
		// PWM初期化
		Int::Register(IRQ_PWM, (void*)OnTimer, IL_NORMAL);
		
		AVR32_PWM.mr	= (AVR32_PWM_MR_PREA_MCK_DIV_128 << AVR32_PWM_MR_PREA) | (50 << AVR32_PWM_MR_DIVA);
		AVR32_PWM.ier	= AVR32_PWM_IER_CHID0_MASK;
		AVR32_PWM.channel[0].cmr	= AVR32_PWM_CMR0_CPRE_CLKA << AVR32_PWM_CMR0_CPRE;
		AVR32_PWM.channel[0].cprd	= F_CPU / 128 / 50;
		AVR32_PWM.ena	= AVR32_PWM_ENA_CHID0_MASK;
	}
	
	// グレゴリオ暦を取得
	// output == NULLのとき、FatFs形式で時刻を返す
	unsigned int GetCalender(TIME_t *output){
		bool sync = Synchronized;
		if ((output == NULL) && (sync == false)) return 0;
		
		unsigned int cnt = Counter;
		unsigned int year, month, day, hour, min, sec;
			
		static const unsigned int D1970	= 719162;			// 1970/1/1の0/3/1からの日数
		static const unsigned int Y400	= 365 * 400 + 97;	// 400年間の日数
		static const unsigned int Y100	= 365 * 100 + 24;	// 100年間の日数
		static const unsigned int Y4	= 365 * 4 + 1;		// 4年間の日数
		static const unsigned int Y1	= 365;				// 1年間の日数
		static const unsigned int M5	= 31 * 3 + 30 * 2;	// 5ヶ月間の日数
		static const unsigned int M2	= 31 + 30;			// 2ヶ月間の日数
		static const unsigned int M1	= 31;				// 1ヶ月間の日数

		unsigned int out_day, in_day;

		out_day	= (cnt / 86400) + D1970 + M5 * 2;
		in_day	= cnt % 86400;
					
		// 時刻の計算
		sec		= in_day % 60;		in_day /= 60;
		min		= in_day % 60;		in_day /= 60;
		hour	= in_day;

		// 年の計算
		unsigned int year400, year100, year4;
		year400 = out_day / Y400;
		out_day -= Y400 * year400;
		year100 = out_day / Y100;
		out_day -= Y100 * year100;
		year4 = out_day / Y4;
		out_day -= Y4 * year4;
		year = out_day / Y1;
		out_day -= Y1 * year;
					
		year += year400 * 400 + year100 * 100 + year4 * 4;
					
		// 月の計算
		unsigned int month5, month2;
		month5 = out_day / M5;
		out_day -= M5 * month5;
		month2 = out_day / M2;
		out_day -= M2 * month2;
		month = out_day / M1;
		out_day -= M1 * month;
					
		month += month5 * 5 + month2 * 2 + 3;
		if (12 < month){
			month -= 12;
			year++;
		}
			
		// 残りは日
		day = out_day + 1;
		
		if (output != NULL){
			output->Year	= year;
			output->Month	= month;
			output->Day		= day;
			output->Hour	= hour;
			output->Minute	= min;
			output->Second	= sec;
			xprintf("%04d/%d/%d %02d:%02d:%02d\n", *output);
			return 0;
		}else{
			unsigned int fs;
			union{
				unsigned int word;
				struct{
					unsigned Year	: 7;
					unsigned Month	: 4;
					unsigned Day	: 5;
					unsigned Hour	: 5;
					unsigned Minute	: 6;
					unsigned Second	: 5;
				} bit;
			} fs_t;
			fs_t.bit.Year	= year - 1980;
			fs_t.bit.Month	= month;
			fs_t.bit.Day	= day;
			fs_t.bit.Hour	= hour;
			fs_t.bit.Minute	= min;
			fs_t.bit.Second	= sec / 2;
			fs = fs_t.word;
			
			/*fs  = (year - 1980) << 25;
			fs |= (month & 0xF) << 21;
			fs |= (day & 0x1F) << 16;
			fs |= (hour & 0x1F) << 11;
			fs |= (min & 0x3F) << 5;
			fs |= (sec >> 1) & 0x1F;*/
			return fs;
		}
	}
	
	
}
