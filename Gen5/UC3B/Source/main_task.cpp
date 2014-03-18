/**	@file
	@brief メインタスク
*/

#include "main_task.h"
#include "driver/int.h"
#include "driver/gpio.h"
#include "driver/adc.h"
#include "driver/spartan6.h"
#include "driver/boot.h"
#include "misc/misc.h"
#include "logger.h"
#include "controller.h"
#include "smem.h"
#include "kicker_task.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "ff.h"

#include "xprintf.h"
#include "global.h"

#include <ctype.h>
#include <string.h>
#include <stdlib.h>




// FPGAからの割り込み
// FreeRTOSの内部変数的に、この関数はグローバル空間にないといけない
static NAKED InterruptFromFPGA(void);



namespace MainTask{
	
	/* 定数 */
	static const bool SILENT_MODE = false;	// ブザーを鳴らさない
	static const int PERIOD = 4;			// 動作間隔[ms]
	static const int UPDATE_INTERVAL = 12;	// 情報の更新間隔[ms]
	
	static const char BITSTREAM_PATH[] = "0:\\PLD_GAME.BIT";
	static const char COPROCESSOR_PATH[] = "0:\\COP_GAME.BIN";
	
	static const unsigned int COPROCESSOR_SIZE = 16384;	// コプロセッサのプログラムのサイズ
	
	
	/* 変数 */
	xSemaphoreHandle Semaphore;		// ウェークアップ用セマフォ
	
	volatile int m_TaskFlag;		// メインタスクのフラグ
	volatile int m_CopFlag;			// コプロセッサのフラグ
	
	bool m_CopExist;				// コプロセッサが存在する
	struct COP_FIFO_STATE_t{		// コプロセッサのFIFO情報
		unsigned int Time;			// コプロセッサの時間
		unsigned int ReceivingID;	// 受信中の情報
		//unsigned int ReceivingData;
		unsigned int ReceivingSize;
		unsigned int ReceivingRemain;
		unsigned short Buffer[3];
	} m_CopFIFOState;
	short m_CopControlVia;
	
	// ブザー関連
	int BuzProgLength = 0;			// 発音の残りの時間
	const BUZPROG_t *BuzProgBuffer = NULL;
	const BUZPROG_t *BuzProgNextBuffer = NULL;
	//static const BUZPROG_t BUZPROG_STARTUP[] = {{3000, 50, 100}, {3000, 300, -1}};
	static const BUZPROG_t BUZPROG_STARTUP[] = {{2000, 166, 0}, {1000, 166, -1}};
	static const BUZPROG_t BUZPROG_CONNECT[] = {{2000, 50, 100}, {3000, 50, -1}};
	static const BUZPROG_t BUZPROG_DISCONNECT[] = {{700, 100, 100}, {700, 200, -1}};
	static const BUZPROG_t BUZPROG_SHUTDOWN[] = {{3000, 200, 100}, {3000, 200, 100}, {3000, 200, 100}, {3000, 200, 100}, {3000, 600, -1}};
	
	
	
	// メインタスクを起動
	void MainCreate(void){
		portENTER_CRITICAL();
		
		if (~m_TaskFlag & TASK_FLAG_ALIVE){
			m_TaskFlag = TASK_FLAG_ALIVE;
			
			portEXIT_CRITICAL();
			
			// 割り込みを設定
			// INIT_BピンをFPGAからの割り込み要求として扱う
			AVR32_GPIO.port[PIN_FPGA_nINIT >> 5].ierc = 1 << (PIN_FPGA_nINIT & 0x1F);
			AVR32_GPIO.port[PIN_FPGA_nINIT >> 5].imr0s = 1 << (PIN_FPGA_nINIT & 0x1F);
			AVR32_GPIO.port[PIN_FPGA_nINIT >> 5].imr1c = 1 << (PIN_FPGA_nINIT & 0x1F);
			
			// 割り込み登録
			Int::Register(IRQ_GPIO01, (void*)InterruptFromFPGA, IL_HIGH);
			
			// タスク作成
			xTaskCreate(TaskBody, "Main", 2048, NULL, PRIORITY_NORMAL, NULL);
		}else{
			portEXIT_CRITICAL();
		}
	}
	
	// タスクをISRから起こす
	NOINLINE portBASE_TYPE WakeFromISR(void){
		portBASE_TYPE HigherPriorityTaskWoken = pdFALSE;
		xSemaphoreGiveFromISR(Semaphore, &HigherPriorityTaskWoken);
		return HigherPriorityTaskWoken;
	}
	
	
	
	
	// タスク本体
	void TaskBody(void *param){
		xputs("MainTask Starting\n");
		
		// セマフォ作成
		vSemaphoreCreateBinary(Semaphore);
		
		bool safe_mode = Boot::IsSafeAPP();
		//bool safe_mode = true;
		
		// FPGAをコンフィギュレーションする
		if (safe_mode == true){
			// セーフモードの場合はユーザーから転送されるか、処理を自動進行するか待つ
			xputs("Transfer bitstream now >>>\n");
			while(FPGA::IsRunning() == false){
				int flag = m_TaskFlag;
				if (flag & TASK_FLAG_KILLREQ) goto selfkill;
				if (flag & TASK_FLAG_STEPREQ) break;
				vTaskDelay(TASK_DELAY_MS(10));
			}
			__sync_and_and_fetch(&m_TaskFlag, ~(TASK_FLAG_STEPREQ | TASK_FLAG_SKIPREQ));
		}
		if (FPGA::IsRunning() == false){
			// ファイルからコンフィギュレーションする
			if (ConfigFromFile(BITSTREAM_PATH) == false){
				// 失敗
				goto selfkill;
			}
		}
		
		// OpenMSP430がインプリメントされているか調べる
		unsigned short reg_exist;
		if (FPGA::Read(FPGA::OMSP_EXIST, &reg_exist, 1) == false){
			xputs("FPGA::Read failed\n");
			goto selfkill;
		}
		if (reg_exist == 0x0430){		// O430
			xputs("Coprocessor exists\n");
			m_CopExist = true;
		}else if (reg_exist == 0x7474){	// なしなし
			xputs("Coprocessor doesn't exist\n");
			m_CopExist = false;
		}else{
			xprintf("Invalid ExistValue:%04x\n", reg_exist);
			goto selfkill;
		}
		
		// コプロセッサにプログラムをダウンロード
		if (m_CopExist == true){
			bool skip = false;
			if (safe_mode == true){
				xputs("Transfer coprocessor now >>>\n");
				m_CopFlag = COP_FLAG_PROGRAMABLE;
				while(~m_CopFlag & COP_FLAG_PROGRAMMED){
					int flag = m_TaskFlag;
					if (flag & TASK_FLAG_KILLREQ) goto selfkill;
					if (flag & TASK_FLAG_SKIPREQ){
						skip = true;
					}
					if (flag & (TASK_FLAG_STEPREQ | TASK_FLAG_SKIPREQ)) break;
					vTaskDelay(TASK_DELAY_MS(10));
				}
				__sync_and_and_fetch(&m_TaskFlag, ~(TASK_FLAG_STEPREQ | TASK_FLAG_SKIPREQ));
			}
			if ((skip == false) && (~m_CopFlag & COP_FLAG_PROGRAMMED)){
				// ファイルから転送する
				m_CopFlag = COP_FLAG_PROGRAMABLE;
				if (ProgramFromFile(COPROCESSOR_PATH) == false){
					// 失敗
				}
				__sync_and_and_fetch(&m_CopFlag, ~COP_FLAG_PROGRAMABLE);
			}
		}
		if (~m_CopFlag & COP_FLAG_PROGRAMMED){
			// コプロセッサ無しで動作する
			xputs("Running at brainless :-D\n");
		}
		
		// 動作開始
		TaskLoopRunning();
		if (~m_TaskFlag & TASK_FLAG_KILLREQ){
			// シャットダウン
			TaskLoopShutdown();
		}
		
	selfkill:
		TaskSelfKill();
	}
	
	// 動作中のループ
	void TaskLoopRunning(void){
		// 電源系統をON
		SetOut(PIN_PWR_12V, OUT_HIGH);
		vTaskDelay(TASK_DELAY_MS(10));
		SetOut(PIN_PWR_MOTOR1, OUT_HIGH);
		vTaskDelay(TASK_DELAY_MS(10));
		SetOut(PIN_PWR_MOTOR2, OUT_HIGH);
		vTaskDelay(TASK_DELAY_MS(10));
		
		// レジスタ初期化
		unsigned long tick = xTaskGetTickCount();
		FPGA::Write(FPGA::OMSP_TICKH, &tick, 2);
		
		vTaskDelay(TASK_DELAY_MS(10));
		
		// モーター制御を委譲
		FPGA::Write(FPGA::QMOTOR_CR, 0x00F8);
		FPGA::Write(FPGA::DRMOT_CR, 0x0018);
		
		// 共有メモリーに必要な情報をセット
		FPGA::Write(FPGA::SMEM_BASE + offsetof(SMEM_t, MachineID)/2, g_MachineID);
		FPGA::Write(FPGA::SMEM_BASE + offsetof(SMEM_t, HiResEncoder)/2, g_HiResEncoder ? 1 : 0);
		
		// 割り込みを有効化
		AVR32_GPIO.port[PIN_FPGA_nINIT >> 5].iers = 1 << (PIN_FPGA_nINIT & 0x1F);
		
		// 起動音を鳴らす
		SetBuzzer(BUZPROG_STARTUP);
		
		xputs("MainTask Running\n");
		
		unsigned int last_time = xTaskGetTickCount();
		unsigned int acc = 0;
		while(~m_TaskFlag & TASK_FLAG_KILLREQ){
			// ウェークアップかタイムアウトを待つ
			portBASE_TYPE result;
			result = xSemaphoreTake(Semaphore, TASK_DELAY_MS(PERIOD));
			if (result == pdTRUE){
				// 割り込みが起きた
			}
			
			// キックをする必要があるか調べる
			short kick_enable;
			if (FPGA::Read(FPGA::SMEM_BASE + offsetof(SMEM_t, KickEnable)/2, &kick_enable, 1) == true){
				if (kick_enable != 0){
					FPGA::Write(FPGA::SMEM_BASE + offsetof(SMEM_t, KickEnable)/2, 0);
					KickerTask::Kick(kick_enable);
				}
			}
			
			// コントローラのセット
			ControllerState_t controller_state;
			if (Controller::GetState(controller_state) == true){
				//xprintf("con(%d,%d,%d,%d)\n", controller_state.Velocity, controller_state.Direction, controller_state.Rotation, controller_state.Kick);
				FPGA::Write(FPGA::SMEM_BASE + offsetof(SMEM_t, TerminalVelocity)/2, &controller_state, sizeof(ControllerState_t)/2);
			}
			
			// 経過時間を取得
			unsigned int now_time = xTaskGetTickCount();
			unsigned int past_time = now_time - last_time;
			last_time = now_time;
			acc += past_time;
			
			// ブザーの処理
			ProcBuzzer(past_time);
			
			if (TASK_DELAY_MS(UPDATE_INTERVAL) <= acc){
				int led_out = 0;
				acc = 0;
				
				// バッテリー電圧をセット
				FPGA::Write(FPGA::SMEM_BASE + offsetof(SMEM_t, BatteryVoltage)/2, ADC::GetBatteryVoltage());
				
				// OpenMSP430が起動していなかったら起動
				int cop_flag = m_CopFlag;
				if ((cop_flag & COP_FLAG_PROGRAMMED) && (~cop_flag & COP_FLAG_RUNNING)){
					portENTER_CRITICAL();
					if (m_CopFlag & COP_FLAG_PROGRAMMED){
						// リセット解除
						FPGA::Write(FPGA::OMSP_CR, 0x3);
						m_CopFlag = COP_FLAG_RUNNING | COP_FLAG_PROGRAMMED | COP_FLAG_PROGRAMABLE;
						xputs("Cop started\n");
					}
					portEXIT_CRITICAL();
				}
				
				if (m_CopFlag & COP_FLAG_RUNNING){
					// パイプのポーリング
					PollLoggerFIFO();
				}
				
				short control_via;
				if (FPGA::Read(FPGA::SMEM_BASE + offsetof(SMEM_t, ControlVia)/2, &control_via, 1) == true){
					if (control_via != m_CopControlVia){
						// 接続・切断音を鳴らす
						SetBuzzer((control_via != CONTROL_VIA_NONE) ? BUZPROG_CONNECT : BUZPROG_DISCONNECT);
						m_CopControlVia = control_via;
					}
				}
				
				// ログの送信
				unsigned short buf[15];
				if (FPGA::Read(FPGA::QMOTOR_SR, buf, 11) == true){
					if (FPGA::Read(FPGA::IOM_GPIB, buf + 11, 2) == true){
						if (FPGA::Read(FPGA::DRMOT_SR, buf + 5, 2) == true){
							using namespace Logger;
							portENTER_CRITICAL();
							AddTime(xTaskGetTickCount());
							unsigned short ot_oc = buf[0];
							AddDataHalf(ID_BALL_DETECT, buf[11] >> 14 & 0x1);
							AddDataHalf(ID_MOTOR1_SENSOR, (buf[11] << 2 & 0x7C) | (ot_oc >> 4 & 0x3));
							AddDataHalf(ID_MOTOR2_SENSOR, (buf[11] >> 3 & 0x7C) | (ot_oc >> 6 & 0x3));
							AddDataHalf(ID_MOTOR3_SENSOR, (buf[12] << 2 & 0x7C) | (ot_oc >> 8 & 0x3));
							AddDataHalf(ID_MOTOR4_SENSOR, (buf[12] >> 3 & 0x7C) | (ot_oc >> 10 & 0x3));
							AddDataHalf(ID_MOTOR5_SENSOR, (buf[12] >> 8 & 0x1C) | (buf[5] >> 4 & 0x3));
							AddDataHalf(ID_MOTOR1_DUTY, buf[1]);
							AddDataHalf(ID_MOTOR2_DUTY, buf[2]);
							AddDataHalf(ID_MOTOR3_DUTY, buf[3]);
							AddDataHalf(ID_MOTOR4_DUTY, buf[4]);
							AddDataHalf(ID_MOTOR5_DUTY, buf[6]);
							AddDataHalf(ID_MOTOR1_SPEED, buf[7]);
							AddDataHalf(ID_MOTOR2_SPEED, buf[8]);
							AddDataHalf(ID_MOTOR3_SPEED, buf[9]);
							AddDataHalf(ID_MOTOR4_SPEED, buf[10]);
							portEXIT_CRITICAL();
						}
					}
				}
				
				// バッテリー電圧を判定
				switch(ADC::GetBatteryLevel()){
				case ADC::BATLEVEL_HIGH:
					led_out |= 0x40;
					break;
				case ADC::BATLEVEL_MIDDLE:
					led_out |= 0x20;
					break;
				case ADC::BATLEVEL_LOW:
					led_out |= 0x10;
					break;
					
				case ADC::BATLEVEL_SWOFF:
					return;	// 低電圧のためシャットダウン
				}
				
				// LED点灯情報をまとめて、ここで設定
				FPGA::Write(FPGA::IOM_GPOA, led_out);
			}
		}
	}
	
	// 低電圧・過熱状態のループ
	void TaskLoopShutdown(void){
		// 過熱・低電圧のため、電源断を待つ
		xputs("MainTask Abnormal State\n");
		
		// 割り込みを無効化
		AVR32_GPIO.port[PIN_FPGA_nINIT >> 5].ierc = 1 << (PIN_FPGA_nINIT & 0x1F);
		
		// コプロセッサフラグをクリア
		m_CopFlag = 0;
		
		// レジスタをクリア
		FPGA::Write(FPGA::QMOTOR_CR, 0);
		FPGA::Write(FPGA::DRMOT_CR, 0);
		FPGA::Write(FPGA::OMSP_CR, 0);
		FPGA::Write(FPGA::IOM_GPOB, 0);
		
		vTaskDelay(TASK_DELAY_MS(5));
		
		// 各部署の電源を落とす
		SetOut(PIN_PWR_MOTOR1, OUT_LOW);
		SetOut(PIN_PWR_MOTOR2, OUT_LOW);
		SetOut(PIN_PWR_12V, OUT_HIGH);
		
		// シャットダウン音を鳴らす
		SetBuzzer(BUZPROG_SHUTDOWN);
		
		int blink_cnt = 0;
		unsigned int last_time = xTaskGetTickCount();
		while(~m_TaskFlag & TASK_FLAG_KILLREQ){
			vTaskDelay(TASK_DELAY_MS(PERIOD));
			
			// ブザーの処理
			unsigned int now_time = xTaskGetTickCount();
			ProcBuzzer(now_time - last_time);
			last_time = now_time;
			
			// LED点滅
			blink_cnt = (blink_cnt + TASK_DELAY_MS(PERIOD)) & 0x3FF;
			int led_out;
			if (0x1FF < blink_cnt){
				led_out = 0x1F;
			}else{
				led_out = 0x10;
			}
			
			// LED点灯情報をまとめて、ここで設定
			FPGA::Write(FPGA::IOM_GPOA, led_out);
		}
	}
	
	// タスクを自己終了する
	NORETURN TaskSelfKill(void){
		// 割り込みを無効化
		AVR32_GPIO.port[PIN_FPGA_nINIT >> 5].ierc = 1 << (PIN_FPGA_nINIT & 0x1F);
		
		// コプロセッサフラグをクリア
		m_CopFlag = 0;
		
		// 電源系統オフ
		SetOut(PIN_PWR_MOTOR1, OUT_LOW);
		SetOut(PIN_PWR_MOTOR2, OUT_LOW);
		SetOut(PIN_PWR_12V, OUT_LOW);
		
		vTaskDelay(TASK_DELAY_MS(10));
		
		// FPGAリセット
		FPGA::Reset();
		
		// セマフォ削除
		vSemaphoreDelete(Semaphore);
		
		xputs("MainTask Deleting\n");
		
		// フラグをクリア
		m_TaskFlag = 0;
		
		// タスクを自己終了
		vTaskDelete(NULL);
		
		while(true);
	}
	
	
	
	
	/* ブザー */
	
	// ブザープログラムを設定
	void SetBuzzer(const BUZPROG_t *buffer){
		if (SILENT_MODE == false){
			if (BuzProgBuffer == NULL){
				// 発音を開始
				BuzProgBuffer = buffer;
				if (buffer == NULL){
					FPGA::Write(FPGA::IOM_BZ, 0x0000);
				}else{
					BuzProgLength = buffer->Duration;
					int freq = 0x8000 | buffer->Frequency * 21990 / 65536;
					FPGA::Write(FPGA::IOM_BZ, freq);
				}
			}else{
				// 次のバッファに設定
				BuzProgNextBuffer = buffer;
			}
		}
	}
	
	// ブザーの処理
	void ProcBuzzer(unsigned int elapsed){
		if (SILENT_MODE == true) return;
		if (elapsed == 0) return;
		
		const BUZPROG_t *buffer = BuzProgBuffer;
		if (buffer != NULL){
			int duration = BuzProgLength;
			if (0 <= duration){
				// 発音中
				duration -= elapsed;
				if (duration <= 0){
					int rest = buffer->Rest;
					if (rest < 0){
						// 再生終了・次のバッファへ
						const BUZPROG_t *next = BuzProgNextBuffer;
						BuzProgBuffer = NULL;
						BuzProgNextBuffer = NULL;
						SetBuzzer(next);
					}else if (rest == 0){
						// 休止なしで次の音へ
						BuzProgBuffer = NULL;
						buffer++;
						SetBuzzer(buffer);
					}else{
						// 休止
						BuzProgLength = -buffer->Rest;
						FPGA::Write(FPGA::IOM_BZ, 0x0000);
					}
				}else{
					BuzProgLength = duration;
				}
			}else{	
				// 消音中
				duration += elapsed;
				if (0 <= duration){
					// 次の音へ
					BuzProgBuffer = NULL;
					buffer++;
					SetBuzzer(buffer);
				}else{
					BuzProgLength = duration;
				}
			}
		}
	}
	
	
	
	
	
	/* ロガーFIFO */
	
	// ロガーFIFOのポーリング
	void PollLoggerFIFO(void){
		static const unsigned int CONTINUES = 128;	// 連続で読み出す最大のワード数
		
		COP_FIFO_STATE_t *fifo = &m_CopFIFOState;
		
		// FIFO中のワード数を取得
		unsigned short rxcnt_half;
		if (FPGA::Read(FPGA::PIPE_RXCNT, &rxcnt_half, 1) == true){
			unsigned int rxcnt = rxcnt_half;
			if (0 < rxcnt){
				// 受信
				unsigned short temp[CONTINUES];
				
				unsigned int time = fifo->Time;
				unsigned int receiving_id = fifo->ReceivingID;
				unsigned int receiving_size = fifo->ReceivingSize;
				unsigned int receiving_remain = fifo->ReceivingRemain;
				
				while(0 < rxcnt){
					// CONTINUESワードずつ読み出し
					unsigned int tlen = rxcnt <= CONTINUES ? rxcnt : CONTINUES;
					rxcnt -= tlen;
					if (FPGA::Read(FPGA::PIPE_RXDATA, temp, tlen, true) == false){
						break;
					}
					
					portENTER_CRITICAL();
					unsigned short *p = temp;
					while(0 < tlen--){
						unsigned short c = *p++;
						if (c & 0x0001){
							// First word
							receiving_remain = (c >> 14);
							if (receiving_remain == 0){
								receiving_id = (c >> 9)/* & 0x1F*/;
							}else{
								receiving_id = (c >> 4) & 0x3FF;
							}
							if (Logger::CheckID(receiving_id) == false){
								receiving_id = Logger::ID_ERROR;
								receiving_remain = 0;
							}else{
								fifo->Buffer[0] = c;
								receiving_size = receiving_remain + 1;
							}
							
						}else{
							// Second/Third word
							if (0 < receiving_remain){
								fifo->Buffer[receiving_size - receiving_remain] = c;
								receiving_remain--;
							}
						}
						if (receiving_remain == 0){
							switch(receiving_id){
							case Logger::ID_ERROR:		// 要求されていないデータ
								break;
								
							case Logger::ID_COPTIME:	// 時刻データ
								time = Logger::ParseData(fifo->Buffer, receiving_size);
								break;
								
							default:
								Logger::AddTime(time);
								Logger::AddDataRaw(fifo->Buffer, receiving_size);
								break;
							}
							receiving_id = Logger::ID_ERROR;
							/*
							
							if (receiving_id != ID_ERROR){
								// データが完成
								if ()
								
								if (receiving_id < Logger::_ID_BYTE_MAX_){
									switch(receiving_id){
									case Logger::ID_COPTIME:	
										time = receiving_data;
										break;
									}
								}else{
									Logger::AddTime(time);
									switch(receiving_size){
									case 0:
										Logger::AddDataByte(receiving_id, receiving_data);
										break;
									case 1:	
										Logger::AddDataHalf(receiving_id, receiving_data);
										break;
									case 2:
										Logger::AddDataWord(receiving_id, receiving_data);
										break;
									}
								}
								receiving_id = 0;
							}*/
						}
					}
					portEXIT_CRITICAL();
				}
				
				fifo->Time = time;
				fifo->ReceivingID = receiving_id;
				fifo->ReceivingSize = receiving_size;
				fifo->ReceivingRemain = receiving_remain;
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// f_forward → FPGA::Conf::Write
	static UINT conf_write(const BYTE *data, UINT len){
		if (len == 0){
			return 1;
		}else{
			unsigned int written = 0;
			FPGA::Conf::Write(data, len, written);
			return written;
		}
	}
	
	// ファイルからコンフィギュレーション
	bool ConfigFromFile(const char *path){
		FIL fp;
		if (f_open(&fp, path, FA_READ | FA_OPEN_EXISTING) == FR_OK){
			xputs("Start configration\n");
			if (FPGA::Conf::Open() == true){
				vTaskDelay(TASK_DELAY_MS(10));
				f_forward(&fp, conf_write, FPGA::MAX_BITSTREAM_SIZE, NULL);
				f_close(&fp);
				FPGA::Conf::Close();
				
				if (FPGA::IsRunning() == true){
					xputs("Configration succeeded\n");
					return true;
				}
			}
			xputs("Configration failed\n");
		}else{
			xputs("File isn't existed\n");
		}
		return false;
	}
	
	
	
	
	
	
	// f_forward → MainTask::Cop::Write
	static UINT cop_write(const BYTE *data, UINT len){
		if (len == 0){
			return 1;
		}else{
			unsigned int written = 0;
			Cop::Write(data, len, written);
			return written;
		}
	}
	
	// ファイルからプログラム
	bool ProgramFromFile(const char *path){
		FIL fp;
		if (f_open(&fp, path, FA_READ | FA_OPEN_EXISTING) == FR_OK){
			if (f_size(&fp) == COPROCESSOR_SIZE){
				xputs("Start programming\n");
				if (Cop::Open() == true){
					vTaskDelay(TASK_DELAY_MS(10));
					f_forward(&fp, cop_write, COPROCESSOR_SIZE, NULL);
					f_close(&fp);
					Cop::Close();
					
					if (m_CopFlag & COP_FLAG_PROGRAMMED){
						xputs("Programming succeeded\n");
						return true;
					}
				}
				xputs("Programming failed\n");
			}else{
				xputs("File size isn't match\n");
			}
			f_close(&fp);
		}else{
			xputs("File isn't existed\n");
		}
		return false;
	}
	
	
	
	
	/* コプロセッサのプログラムのためのパイプインターフェース */
	namespace Cop{
		// シークポインタ
		signed int Pointer = -1;
		
		// パイプ情報
		extern const BTT::PIPE_INFO_t Info = {
			"COPROCESSOR", COPROCESSOR_SIZE, 2, BTT::WRITABLE
		};
		
		// 開く
		bool Open(void){
			portENTER_CRITICAL();
			if ((Pointer < 0) && (m_CopFlag & COP_FLAG_PROGRAMABLE)){
				Pointer = 0;
				m_CopFlag = COP_FLAG_PROGRAMABLE;
				portEXIT_CRITICAL();
				
				// OpenMSP430を停止しプログラミングモードへ
				FPGA::Write(FPGA::OMSP_CR, 0x2);
				
				xputs("Cop:open\n");
				return true;
			}
			portEXIT_CRITICAL();
			return false;
		}
		
		// 閉じる
		void Close(void){
			portENTER_CRITICAL();
			if ((0 < Pointer) && (m_CopFlag & COP_FLAG_PROGRAMABLE)){
				if ((unsigned int)Pointer == COPROCESSOR_SIZE){
					// プログラム完了
					m_CopFlag = COP_FLAG_PROGRAMMED | COP_FLAG_PROGRAMABLE;
					xputs("Cop:finished\n");
				}else{
					// プログラム未完
					m_CopFlag = COP_FLAG_PROGRAMABLE;
					xputs("Cop:unfinished\n");
				}
				Pointer = -1;
			}
			portEXIT_CRITICAL();
		}
		
		// 書き込み
		bool Write(const void *data, unsigned int len, unsigned int &written){
			signed int addr_s = Pointer;
			unsigned int addr = addr_s;
			if (addr_s < 0) return false;
			if (len & 2) return false;
			if (~m_CopFlag & COP_FLAG_PROGRAMABLE) return false;
			
			if (COPROCESSOR_SIZE <= addr){
				written = 0;
			}else{
				if (COPROCESSOR_SIZE < (addr + len)){
					len = COPROCESSOR_SIZE - addr;
				}
				
				written = len;
				Pointer = addr + len;
				
				FPGA::Write(FPGA::OMSP_PROG, data, len / 2, true);
			}
			return true;
		}
	}
	
	
	
}



// FPGAからの割り込み
static NAKED InterruptFromFPGA(void){
	portENTER_SWITCHING_ISR();
	
	// 割り込みフラグをクリア
	AVR32_GPIO.port[PIN_FPGA_nINIT >> 5].ifrc = 1 << (PIN_FPGA_nINIT & 0x1F);
	
	MainTask::WakeFromISR();
	
	// WakeFromISR()の戻り値はr12に格納されていて、portEXIT_SWITCHING_ISR()はその値を直接利用する。
	// そのため、WakeFromISR()には__noinline__アトリビュートがついている
	portEXIT_SWITCHING_ISR();
}


