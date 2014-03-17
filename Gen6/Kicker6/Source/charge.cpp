/**	@file
	@brief 充電管理
*/

#include "charge.h"
#include "define.h"
#include "driver/adc.h"
#include "driver/gpio.h"
#include "driver/flash.h"
#include "xprintf.h"

#include <util/delay.h>




/* ペリフェラル定義 */
#define CHARGE_TC			TCD1
#define KICK_TC				TCC1
#define SREC_TC				TCE0
#define SREC_EV_MUX_SET()	EVSYS.CH0MUX = EVSYS_CHMUX_TCE0_OVF_gc
#define SREC_EV_SEL			
#define SREC_DMA			DMA.CH1
#define SREC_DMA_TRIG		DMA_CH_TRIGSRC_EVSYS_CH0_gc


#define NS_TO_CYCLE(ns)	(unsigned short)((double)F_CPU * (ns) / 1.0e+9)




namespace Charge{
	
	
	/* 定数 */
	static const unsigned char SUPPLY_LIMIT		= 130;		// 充電が開始できる電源電圧の10倍[V]
	static const unsigned char SUPPLY_RETURN	= 140;		// 充電が再開できる電源電圧の10倍[V]
	static const unsigned char BOOST_START		= 20;		// 昇圧を開始する電源電圧からの減少分の10倍[V]
	static const unsigned char UPPER_LIMIT		= 200;		// (標準)充電終止電圧[V]
	static const unsigned char LOWER_LIMIT		= 197;		// (標準)充電開始電圧[V]
	static const unsigned char KICK_LIMIT		= 150;		// キック許可電圧[V]
	
	static const unsigned char CHARGE_PULSES		= 64;	// 1回の充電操作で何回パルスを出すか
	static const unsigned short MAX_BUCK_CYCLES		= 300;	// 降圧充電を行う最大サイクル数
	static const unsigned short MAX_BOOST_CYCLES	= 6000;	// 昇圧充電を行う最大サイクル数
	static const unsigned short T_BUCK_OFF	= 2000;			// 降圧 標準オフ時間[ns]
	static const unsigned short T_BUCK_ON	= 5000;			// 降圧 最大オン時間[ns]
	static const unsigned short T_BOOST_OFF	= 2000;			// 昇圧 標準オフ時間[ns]
	static const unsigned short T_BOOST_ON	= 5000;			// 昇圧 最大オン時間[ns]
	static const unsigned short T_BOOST_COOL= 4000;			// 昇圧 標準クーリング時間[ns]
															// 小さすぎる値を指定しないこと
															// これらの値は、指定値より延びる
	
	static const unsigned long T_KICK_MAX	= 10000000;		// キッカーの最大オン時間[ns]
	static const unsigned long T_KICK_SW_ON	= 20000;		// キッカーの最小オンパルス幅[ns]
	static const unsigned long T_KICK_SW_OFF= 50000;		// キッカーの最小オフパルス幅[ns]
	static const unsigned char KICK_UPPER_LIMIT	= 100;		// キッカーの電流制限(上昇)[A]
	static const unsigned char KICK_LOWER_LIMIT	= 97;		// キッカーの電流制限(下降)[A]
	
	static const unsigned short NUM_OF_RECORDS = 2048;		// 電流を測定するサンプル数
	static const unsigned long F_SREC = 100000;				// ソレノイド電流の測定周波数[Hz]
	
	enum State_e{
		State_Idle,		// 指示待ち
		State_Buck,		// 降圧充電
		State_Boost,	// 昇圧充電
		State_Stop,		// 充電停止
		State_Kick,		// キック中
		State_Error,	// 異常
	};
	
	
	/* 変数 */
	State_e m_State = State_Idle;	// ステートマシン
	bool m_ChargeEnabled;	// 充電が有効
	unsigned short m_ChargeCycles;
	unsigned char m_UpperLimit/* = UPPER_LIMIT*/;
	unsigned char m_LowerLimit/* = LOWER_LIMIT*/;
	unsigned char m_KickLimit = KICK_LIMIT;
	char m_KickType = KICK_NONE;
	unsigned char m_KickPower = 0;
	
	unsigned short m_RecordLength;		// 電流の測定サンプル数
	char m_RecordData[NUM_OF_RECORDS];	// 電流の測定データ
	
	
	
	// 充電停止
	static void StopConvert(void);
	
	// 降圧充電
	static void BuckConvert(void);
	
	// 昇圧充電
	static void BoostConvert(void);
	
	// キック
	static void KickProc(void);
	
	
	
	
	// 初期化
	void Init(void){
		// キャリブレーション値を読み込む
		m_UpperLimit = Flash::EEPROMReadByte(0x0000, UPPER_LIMIT);
		m_LowerLimit = Flash::EEPROMReadByte(0x0001, LOWER_LIMIT);
		
		// 充電タイマー初期化
		//CHARGE_TC.CTRLB = TC_WGMODE_NORMAL_gc;
		CHARGE_TC.CTRLA	= TC_CLKSEL_DIV1_gc;
		
		// キックタイマー初期化
		KICK_TC.PER		= NS_TO_CYCLE((double)T_KICK_MAX / 8);
		
		// ソレノイド電流測定用タイマー初期化
		SREC_TC.PER		= F_CPU / F_SREC - 1;
		SREC_TC.CTRLA	= TC_CLKSEL_DIV1_gc;
		SREC_EV_MUX_SET();
		
		// ソレノイド電流測定用DMA初期化
		SREC_DMA.ADDRCTRL	= DMA_CH_SRCRELOAD_NONE_gc | DMA_CH_SRCDIR_FIXED_gc | DMA_CH_DESTRELOAD_NONE_gc | DMA_CH_DESTDIR_INC_gc;
		SREC_DMA.TRIGSRC	= SREC_DMA_TRIG;
		SREC_DMA.SRCADDR0	= (unsigned short)&ADCA.CH0RESL & 0xFF;
		SREC_DMA.SRCADDR1	= (unsigned short)&ADCA.CH0RESL >> 8;
		SREC_DMA.SRCADDR2	= 0;
		
		
		//m_ChargeEnabled = true;
		
		StopConvert();
	}
	
	// 充電中か？
	bool IsCharging(void){
		return (m_State == State_Buck) || (m_State == State_Boost);
	}
	
	// 異常が発生しているか？
	bool IsErrorOccured(void){
		return (m_State == State_Error);
	}
	
	// 充電を有効にする
	void ChargeEnable(bool enable){
		m_ChargeEnabled = enable;
	}
	
	// 充電電圧を設定
	void SetVoltage(unsigned char upper, unsigned char lower){
		m_UpperLimit = upper;
		if (upper < lower) lower = 0;
		m_LowerLimit = lower;
	}
	
	// キックする
	void KickEnable(char type, unsigned short power){
		m_KickType = type;
		if ((power >> 8) != 0){
			m_KickPower = 255;
		}else{
			m_KickPower = power;
		}
	}
	
	// 処理
	void Proc(void){
		if (m_ChargeEnabled == false){
			if (m_State != State_Error){
				m_State = State_Idle;
			}
		}
		
		switch(m_State){
		case State_Idle:	// 指示待ち・電源電圧低下
			if (m_ChargeEnabled == true){
				if (SUPPLY_RETURN <= ADC::GetSupplyVoltage()){
					m_ChargeCycles = 0;					
					m_State = State_Buck;	// 充電を開始
					xputs("->Buck\n");
				}
			}
			break;
		
		case State_Buck:	// 降圧充電
			{
				unsigned short supply = ADC::GetSupplyVoltage();
				unsigned short cap = (unsigned short)ADC::GetCapacitorVoltage() * 10 + BOOST_START;
				if (supply <= SUPPLY_LIMIT){
					m_State = State_Idle;	// 電源電圧が低下
					xputs("->Idle\n");
					break;
				}
				if (supply <= cap){
					m_ChargeCycles = 0;
					m_State = State_Boost;	// 昇圧充電へ
					xputs("->Boost\n");
					break;
				}
				if (MAX_BUCK_CYCLES <= ++m_ChargeCycles){
					m_State = State_Error;	// エラー
					xputs("->Error\n");
				}
				// 降圧充電
				BuckConvert();
			}
			break;
		
		case State_Boost:	// 昇圧充電
			{
				unsigned char supply = ADC::GetSupplyVoltage();
				if (supply <= SUPPLY_LIMIT){
					m_State = State_Idle;	// 電源電圧が低下
					xputs("->Idle\n");
					break;
				}
				unsigned char cap = ADC::GetCapacitorVoltage();
				if (m_UpperLimit <= cap){
					m_State = State_Stop;	// 充電を停止
					xputs("->Stop\n");
					break;
				}
				if ((m_KickLimit <= cap) && (m_KickType != KICK_NONE)){
					m_State = State_Kick;	// キックを開始
					xputs("->Kick\n");
					break;
				}
				if (MAX_BOOST_CYCLES <= ++m_ChargeCycles){
					m_State = State_Error;	// エラー
					xputs("->Error\n");
				}
				// 昇圧充電
				BoostConvert();
			}
			break;
			
		case State_Stop:	// 充電停止
			{
				unsigned char cap = ADC::GetCapacitorVoltage();
				if (cap <= m_LowerLimit){
					m_ChargeCycles = 0;
					m_State = State_Buck;	// 充電を開始
					xputs("->Buck\n");
					break;
				}
				if ((m_KickLimit <= cap) && (m_KickType != KICK_NONE)){
					m_State = State_Kick;	// キックを開始
					xputs("->Kick\n");
					break;
				}
			}
			break;
		
		case State_Kick:	// キック中
			break;
		
		case State_Error:	// 異常
			break;
		}
		
		if (m_State == State_Kick){
			// キック
			KickProc();
			m_State = State_Idle;
			xputs("->Idle\n");
		}
		
		// キックフラグを無効に
		m_KickType = KICK_NONE;
	}
	
	
	
	// 充電停止
	static void StopConvert(void){
		SetOut(PIN_GATE_BOOST, OUT_LOW);
		SetOut(PIN_GATE_BUCK_H, OUT_LOW);
		SetOut(PIN_GATE_BUCK_L, OUT_LOW);
	}
	
	// 降圧充電
	static void BuckConvert(void){
		// 1サイクルの降圧充電
		SetOut(PIN_GATE_BOOST, OUT_LOW);
		SetOut(PIN_GATE_BUCK_H, OUT_LOW);
		SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
		for(unsigned char cnt = CHARGE_PULSES; 0 < cnt; cnt--){
			// OFF出力
			_delay_us(0.001 * T_BUCK_OFF);
			
			CriticalSection{
				CHARGE_TC.PER = NS_TO_CYCLE(T_BUCK_ON);
				CHARGE_TC.CNT = 0;
				CHARGE_TC.INTFLAGS = TC0_OVFIF_bm;
				
				// ON出力
				SetOut(PIN_GATE_BUCK_L, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_H, OUT_HIGH);
				while(~CHARGE_TC.INTFLAGS & TC0_OVFIF_bm){
					if (GetIn(PIN_CUR_TRIP) == IN_LOW){
						break;
					}
				}
				SetOut(PIN_GATE_BUCK_H, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
			}
		}
		
		SetOut(PIN_GATE_BUCK_L, OUT_LOW);
	}
	
	// 昇圧充電
	static void BoostConvert(void){
		// 1サイクルの昇圧充電
		SetOut(PIN_GATE_BOOST, OUT_LOW);
		SetOut(PIN_GATE_BUCK_H, OUT_LOW);
		SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
		for(unsigned char cnt = CHARGE_PULSES; 0 < cnt; cnt--){
			// OFF出力
			_delay_us(0.001 * T_BOOST_OFF);
			
			CriticalSection{
				CHARGE_TC.PER = NS_TO_CYCLE(T_BOOST_ON);
				CHARGE_TC.CNT = 0;
				CHARGE_TC.INTFLAGS = TC0_OVFIF_bm;
				
				// ON出力
				SetOut(PIN_GATE_BUCK_L, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_H, OUT_HIGH);
				SetOut(PIN_GATE_BOOST, OUT_HIGH);
				while(~CHARGE_TC.INTFLAGS & TC0_OVFIF_bm){
					if (GetIn(PIN_CUR_TRIP) == IN_LOW){
						break;
					}
				}
				
				// クーリング
				SetOut(PIN_GATE_BOOST, OUT_LOW);
				_delay_us(0.001 * T_BOOST_COOL);
				
				SetOut(PIN_GATE_BUCK_H, OUT_LOW);
				NOP();
				SetOut(PIN_GATE_BUCK_L, OUT_HIGH);
			}
		}
		
		SetOut(PIN_GATE_BUCK_L, OUT_LOW);
	}
	
	// キック
	static void KickProc(void){
		// 定数
		//static const unsigned short MAX_KICK_COUNT	= NS_TO_CYCLE((double)T_KICK_MAX / 8);
		//static const unsigned short MIN_ON_COUNT	= NS_TO_CYCLE((double)T_KICK_SW_ON / 8);
		//static const unsigned short MIN_OFF_COUNT	= NS_TO_CYCLE((double)T_KICK_SW_OFF / 8);
		static const unsigned short LAST_ON_COUNT	= NS_TO_CYCLE((double)(T_KICK_MAX - T_KICK_SW_ON) / 8);
		static const unsigned char UPPER_VALUE		= (unsigned char)((double)KICK_UPPER_LIMIT / 1.30208);	// 電流換算 1.30208[A/1]
		static const unsigned char LOWER_VALUE		= (unsigned char)((double)KICK_LOWER_LIMIT / 1.30208);
		
		cli();
		
		// ADCをソレノイド電流測定用に変更
		ADC::ConfSolenoid();
		ADC::WaitVoltage();
		
		// 目標エネルギー計算
		unsigned char present_energy, target_energy;
		present_energy = ADC::GetEnergy();
		if (m_KickPower < present_energy){
			target_energy = present_energy - m_KickPower;
		}else{
			target_energy = 1;	// 0はさすがに難しい
		}
		
		// キックタイマー初期化
		//KICK_TC.CTRLA	= 0;
		KICK_TC.CNT		= 1;
		KICK_TC.INTFLAGS= TC1_OVFIF_bm;
		KICK_TC.CCA		= 0xFFFF;
		KICK_TC.CCB		= 0xFFFF;
		KICK_TC.CCABUF	= 0;
		KICK_TC.CCBBUF	= 0;
		if (m_KickType == KICK_STRAIGHT){
			KICK_TC.CTRLB = TC1_CCBEN_bm | TC_WGMODE_SINGLESLOPE_gc;
		}else{
			KICK_TC.CTRLB = TC1_CCAEN_bm | TC_WGMODE_SINGLESLOPE_gc;
		}
		
		// DMA設定
		SREC_DMA.DESTADDR0	= (unsigned short)m_RecordData & 0xFF;
		SREC_DMA.DESTADDR1	= (unsigned short)m_RecordData >> 8;
		SREC_DMA.DESTADDR2	= 0;
		SREC_DMA.TRFCNT		= NUM_OF_RECORDS;
		SREC_DMA.CTRLA		= DMA_CH_ENABLE_bm | DMA_CH_SINGLE_bm | DMA_CH_BURSTLEN_1BYTE_gc;
		
		// キック開始
		KICK_TC.CTRLC = TC1_CMPB_bm | TC1_CMPA_bm;
		KICK_TC.CTRLA = TC_CLKSEL_DIV8_gc;
		bool gate = true;
		char goal_count = 0;
		while(~KICK_TC.INTFLAGS & TC0_OVFIF_bm){
			// 電流取得
			char cur = ADC::GetCurrent8Bit();
			if (cur < 0) cur = 0;
			
			if (gate == true){
				if (UPPER_VALUE <= (unsigned char)cur){
					KICK_TC.CTRLA = 0;
					KICK_TC.CTRLC = 0;
					gate = false;
				}
			}else{
				if ((unsigned char)cur <= LOWER_VALUE){
					if (KICK_TC.CNT <= LAST_ON_COUNT){
						KICK_TC.CTRLC = TC1_CMPB_bm | TC1_CMPA_bm;
						KICK_TC.CTRLA = TC_CLKSEL_DIV8_gc;
						gate = true;
					}else{
						// オンにするには時間が足りない
						break;
					}
				}
			}
			
			sei();
			
			if (gate == true){
				_delay_us(0.001 * T_KICK_SW_ON);
			}else{
				_delay_us(0.001 * T_KICK_SW_OFF);
			}
			
			cli();
			
			// 電圧取得
			if (ADC::GetEnergy() <= target_energy){
				// 目標値到達
				goal_count++;
				if (3 <= goal_count) break;
			}else{
				goal_count = 0;
			}
		}
		
		// タイマーをリセット
		KICK_TC.CTRLA	= 0;
		KICK_TC.CTRLB	= 0;
		KICK_TC.CTRLC	= 0;
		
		// DMA停止
		SREC_DMA.CTRLA	= 0;
		while(SREC_DMA.CTRLA & DMA_CH_ENABLE_bm);
		m_RecordLength = NUM_OF_RECORDS - SREC_DMA.TRFCNT;
		if (m_RecordLength == 0) m_RecordLength = NUM_OF_RECORDS;	// TRFCNTはすべてのデータを転送し終わるとリロードされてしまう
		
		sei();
		
		char max = -128;
		long ave = 0;
		for(unsigned short cnt = 0; cnt < m_RecordLength; cnt++){
			char d = m_RecordData[cnt];
			if (max < d) max = d;
			ave += d;
		}
		ave /= m_RecordLength;
		
		xprintf("Energy=%d->%d(%d)\n", present_energy, ADC::GetEnergy(), target_energy);
		xprintf("Samples=%d\n", m_RecordLength);
		xprintf("Max=%d, Average=%d\n", max, ave);
		
		// ADCをリセット
		ADC::ConfReset();
	}
	
	
	
	
	
}

