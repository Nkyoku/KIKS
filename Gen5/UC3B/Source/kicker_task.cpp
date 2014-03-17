/**	@file
	@brief キッカータスク
*/

#include "kicker_task.h"
#include "driver/kicker.h"
#include "driver/gpio.h"
#include "logger.h"

#include "xprintf.h"
#include "global.h"

#include <string.h>



namespace KickerTask{
	
	/* 定数 */
	static const unsigned int PERIOD	= 200;	// タスクの周期
	
	static const unsigned int KICKER_RX_BUFSIZE	= 64;
	
	
	/* 変数 */
	volatile int m_TaskFlag;		// タスクのフラグ
	
	struct Rx_t{
		char Buf[KICKER_RX_BUFSIZE];
		unsigned int Next;
		bool Comment;
	} Rx;	// 受信バッファ
	
	xSemaphoreHandle m_Semaphore;	// セマフォ
	
	volatile unsigned int m_Timeout;	// 最後に通信があってからの経過時間
	volatile bool m_ChargeDisable;		// 充電が無効
	
	volatile bool m_Trouble;			// 問題発生中
	volatile int m_Voltage;				// キャパシタ電圧
	volatile int m_Temperature;			// 温度
	
	volatile signed int m_Strength;		// キックの強さ
	
	


	// (内部)コマンドを送信
	//void IntTx(char cmd, int value);
	
	// (内部)一文字入力
	static void IntRxPush(char c);

	// (内部)返値をパース
	static void IntRxParse(void);

	// タスク
	void Task(void *param){
		// セマフォ作成
		vSemaphoreCreateBinary(m_Semaphore);
		
		m_TaskFlag = TASK_FLAG_ALIVE;
		
		unsigned int last_time = xTaskGetTickCount();
		while(true){
			// 何か指示があるまでタイムアウト付きで待つ
			portBASE_TYPE result;
			result = xSemaphoreTake(m_Semaphore, TASK_DELAY_MS(PERIOD));
			if (result != pdFALSE){
				// 何かの要因で起こされた
				int flag = m_TaskFlag;
				if (flag & TASK_FLAG_KILLREQ){
					// タスク終了
					m_TaskFlag = 0;
					vTaskDelete(NULL);
				}
				if (flag & TASK_FLAG_STOPREQ){
					// 充電を停止
					__sync_and_and_fetch(&m_TaskFlag, ~TASK_FLAG_STOPREQ);
					IntTx('c', 0);	// 間違った数字で充電コマンドを送ると充電が停止する
				}
				if (flag & TASK_FLAG_KICKREQ){
					// キックを要求
					__sync_and_and_fetch(&m_TaskFlag, ~TASK_FLAG_KICKREQ);
					int str = m_Strength;
					if (0 < str){
						xprintf("Straight(%d)\n", str);
						IntTx('s', str);	// ストレートキック
					}else{
						xprintf("Chip(%d)\n", -str);
						IntTx('h', -str);	// チップキック
					}
				}
			}
			
			if (m_ChargeDisable == false){
				// 充電を有効に
				IntTx('c', 0x876);
			}
			
			if (IsRunning() == true){
				SetOut(PIN_nLED3, OUT_LOW);
			}else{
				SetOut(PIN_nLED3, OUT_HIGH);
			}
			
			// 受信
			const char *rxbuf;
			int rxlen = Kicker::BeginRead(&rxbuf);
			if (rxbuf != NULL){
				for(int cnt = 0; cnt < rxlen; cnt++){
					IntRxPush(*rxbuf++);
				}
				Kicker::EndRead();
			}
			
			// 経過した時間を加算
			unsigned int now_time = xTaskGetTickCount();
			m_Timeout = __builtin_satadd_w(m_Timeout, now_time - last_time);
			last_time = now_time;
		}
	}
	
	// キックを指示
	// 正数でストレート、負数でチップキック
	void Kick(int strength){
		m_Strength = strength;
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_KICKREQ);
		xSemaphoreGive(m_Semaphore);
	}
	
	
	
	// (内部)コマンドを送信
	void IntTx(char cmd, int value){
		{
			int len;
			char buf[10];
			xsprintf(buf, "n%d\n", (short)value);
			len = strlen(buf);
			Kicker::Transmit(buf, len);
		}
		{
			char buf[6] = {'c', cmd, cmd, cmd, cmd, '\n'};
			Kicker::Transmit(buf, 6);
		}
	}
	
	// (内部)一文字入力
	void IntRxPush(char c){
		if (c <= 0x0A){			// LF
			if (0 < Rx.Next){
				Rx.Buf[Rx.Next++] = '\0';
				IntRxParse();
			}
			Rx.Next	= 0;
			Rx.Comment = false;
		}else if (c == '*'){	// コメント
			Rx.Comment = true;
		}else if (Rx.Comment == false){
			if (Rx.Next < (KICKER_RX_BUFSIZE - 1))
				Rx.Buf[Rx.Next++] = c;
		}
	}

	// (内部)返値をパース
	void IntRxParse(void){
		//xprintf("Rx'%s'", Rx.Buf);
		
		// コマンド文字と数値に分解
		char *buf = Rx.Buf;
		int value = 0;
		int len = Rx.Next;
		char cmd = *buf++;
		if (1 < len){
			if (xatoi(&buf, (long*)&value) == 0)
				value = -1;
		}else{
			value = -1;
		}
		
		unsigned int timeout = 0;
		switch(cmd){
		case 'v':	// 電圧
			m_Voltage = value;
			portENTER_CRITICAL();
			Logger::AddTime(xTaskGetTickCount());
			Logger::AddDataHalf(Logger::ID_CAP_VOLTAGE, value);
			portEXIT_CRITICAL();
			break;
		
		case 't':	// 温度
			m_Temperature = value;
			break;
		
		case 'k':
			xprintf("Kicker:Kicked(%d)\n", value);
			break;
		
		case 'e':
			if (value == 0){
				m_Trouble = false;	// 異常なし
			}else{
				m_Trouble = true;
				xprintf("Kicker:Error(%d)\n", value);
			}
			break;
		
		default:
			timeout = m_Timeout;
			break;
		}
		m_Timeout = timeout;
	}
	







	
	


}
