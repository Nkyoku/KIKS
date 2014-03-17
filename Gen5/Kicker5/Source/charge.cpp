/**	@file
	@brief 充電管理
*/

#include "charge.h"
#include "define.h"
#include "driver/adc.h"
#include "driver/gpio.h"
#include "xprintf.h"

#include <util/delay.h>




/* ペリフェラル定義 */
#define KICK_TC		TCC0
#define BOOST_TC	TCC0
#define BUCK_TC		TCE0


#define NS_TO_CYCLE(ns)	(unsigned short)((double)F_CPU * (ns) / 1.0e+9)




namespace Charge{
	
	
	/* 定数 */
	static const unsigned char SUPPLY_LIMIT		= 130;		// 充電が開始できる電源電圧の10倍[V]
	static const unsigned char SUPPLY_RETURN	= 140;		// 充電が再開できる電源電圧の10倍[V]
	static const unsigned char BOOST_START		= 25;		// 昇圧を開始する電源電圧からの減少分の10倍[V]
	static const unsigned char UPPER_LIMIT		= 205;		// (標準)充電終止電圧[V]
	static const unsigned char LOWER_LIMIT		= 200;		// (標準)充電開始電圧[V]
	static const unsigned char KICK_LIMIT		= 150;		// キック許可電圧[V]
	
	static const unsigned long MAX_BUCK_CYCLES	= 200;		// 降圧充電を行う最大サイクル数
	static const unsigned long MAX_BOOST_CYCLES	= 10000;	// 昇圧充電を行う最大サイクル数
	static const unsigned long BUCK_TOFF	= 1000000;		// 降圧 オフ時間[ns]
	static const unsigned long BUCK_TON		= 200;			// 降圧 オン時間[ns]
	/*static const unsigned long T_BOOST_OFF	= 400000;		// 昇圧 オフ時間 最大[ns]
	static const unsigned long T_BOOST_ON0	= 62500;		// 昇圧 オン時間 初回[ns]
	static const unsigned long T_BOOST_ON	= 25000;		// 昇圧 オン時間[ns]*/
	static const double BOOST_IT			= 5.0;
	static const double BOOST_IB			= 1.0;
	static const double BOOST_L				= 200e-6;
	
	static const unsigned long MAX_KICK_TIME	= 7000;		// キックの最大時間[us]
	static const unsigned long MIN_KICK_TIME	= 800;		// キックの最大時間[us]
	static const unsigned long KICK_PERIOD	= 20000;		// キックの周期[us]
	static const unsigned long KICK_UNIT	= 1000000 / (F_CPU / 1024);	// キック強度の最小単位[us]
	
	
	
	
	/* 変数 */
	State_e m_State = State_Idle;	// ステートマシン
	StateList_t m_StateList[] = {
		{StateIdle::Enter, StateIdle::Execute, NULL},
		{StateBuck::Enter, StateBuck::Execute, StateBuck::Leave},
		{StateBoost::Enter, StateBoost::Execute, StateBoost::Leave},
		{StateStop::Enter, StateStop::Execute, NULL},
		{StateKick::Enter, StateKick::Execute, NULL},
		{StateError::Enter, StateError::Execute, NULL},
	};
	bool m_ChargeEnabled;	// 充電が有効
	unsigned short m_ChargeCycles;
	unsigned char m_UpperLimit = UPPER_LIMIT;
	unsigned char m_LowerLimit = LOWER_LIMIT;
	unsigned char m_KickLimit = KICK_LIMIT;
	KICK_e m_KickType = KICK_NONE;
	unsigned char m_KickPower = 0;
	
	
	
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
	void KickEnable(KICK_e type, unsigned short power){
		m_KickType = type;
		if ((power >> 8) != 0){
			m_KickPower = 255;
		}else{
			m_KickPower = power;
		}
	}
	
	// 初期化
	void Init(void){
		// Idleステートの初期化
		StateIdle::Enter(0, 0);
		
		// テスト用に最初から充電
		//ChargeEnable(true);
	}
	
	// 処理
	void Proc(void){
		unsigned char present = m_State;
		unsigned char next;
		unsigned char vol_sup = ADC::GetSupplyVoltage();
		unsigned char vol_cap = ADC::GetCapacitorVoltage();
		
		// ステートを実行
		next = (char)m_StateList[present].Execute(vol_sup, vol_cap);
		
		if (next != present){
			void (*enter)(unsigned char, unsigned char) = m_StateList[next].Enter;
			void (*leave)(void) = m_StateList[present].Leave;
			if (leave != NULL) leave();
			if (enter != NULL) enter(vol_sup, vol_cap);
			m_State = (State_e)next;
			m_ChargeCycles = 0;
		}
		
		// キックフラグを無効に
		m_KickType = KICK_NONE;
	}
	
	
	
	/* 指示待ち */
	namespace StateIdle{
		void Enter(unsigned char vol_sup, unsigned char vol_cap){
			xputs("->Idle\n");
		}
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap){
			if (m_ChargeEnabled == true){
				if (SUPPLY_RETURN <= vol_sup){
					return State_Buck;	// 充電を開始
				}
			}
			return State_Idle;
		}
	}
	
	/* 降圧充電 */
	namespace StateBuck{
		void Enter(unsigned char vol_sup, unsigned char vol_cap){
			//xputs("->Buck\n");
			xprintf("->Buck(%d)\n", vol_cap);
			
			// 発振を開始
			BUCK_TC.CTRLC	= 0;
			BUCK_TC.CNT		= 0;
			BUCK_TC.CTRLGCLR= TC0_CCBBV_bm | TC0_PERBV_bm;
			BUCK_TC.PER		= F_CPU * (double)(BUCK_TON + BUCK_TOFF) * 1.0e-9;
			BUCK_TC.CCB		= 0;
			BUCK_TC.CCBBUF	= F_CPU * (double)BUCK_TON * 1.0e-9;
			BUCK_TC.CTRLB	= TC0_CCBEN_bm | TC_WGMODE_SINGLESLOPE_gc;
			BUCK_TC.CTRLA	= TC_CLKSEL_DIV1_gc;
		}
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap){
			unsigned short cap = (unsigned short)vol_cap * 10 + BOOST_START;
			if ((vol_sup <= SUPPLY_LIMIT) || (m_ChargeEnabled == false)){
				return State_Idle;		// 電源電圧が低下・充電停止
			}
			if (vol_sup <= cap){
				return State_Boost;		// 昇圧充電へ
			}
			if (MAX_BUCK_CYCLES <= ++m_ChargeCycles){
				return State_Error;		// エラー
			}
			
			return State_Buck;
		}
		void Leave(void){
			//xputs("Buck->\n");
			
			// 発振を停止
			BUCK_TC.CTRLB	= 0;
			BUCK_TC.CTRLA	= 0;
		}
	}
	
	/* 昇圧充電 */
	namespace StateBoost{
		static unsigned short CalcTon0(unsigned char vol_sup){
			// オン時間0の計算
			static const unsigned short num = BOOST_IT * BOOST_L * F_CPU * 10 / 16;
			return (num / vol_sup) << 4;
		}
		static unsigned short CalcTon(unsigned char vol_sup){
			// オン時間の計算
			static const unsigned short num = (BOOST_IT - BOOST_IB) * BOOST_L * F_CPU * 10 / 16;
			return (num / vol_sup) << 4;
		}
		static unsigned short CalcToff(unsigned char vol_sup, unsigned char vol_cap){
			// オフ時間の計算
			static const unsigned short num = (BOOST_IT - BOOST_IB) * BOOST_L * F_CPU * 10 / 16;
			short den = (unsigned short)vol_cap * 10 + 14;
			den -= vol_sup;
			if (den < 10) den = 10;
			return (num / (unsigned short)den) << 4;
		}
		void Enter(unsigned char vol_sup, unsigned char vol_cap){
			//xputs("->Boost\n");
			xprintf("->Boost(%d, %u)\n", vol_cap, m_ChargeCycles);
			
			SetOut(PIN_PWR_CHARGER, OUT_HIGH);
			
			// 発振を開始
			unsigned short ton0 = CalcTon0(vol_sup);
			unsigned short ton = CalcTon(vol_sup);
			unsigned short toff = CalcToff(vol_sup, vol_cap);
			BOOST_TC.CTRLC	= TC0_CMPA_bm;
			BOOST_TC.CTRLGCLR= TC0_CCABV_bm | TC0_PERBV_bm;
			BOOST_TC.CNT	= 1;
			BOOST_TC.PER	= ton0 + toff;
			BOOST_TC.PERBUF	= ton + toff;
			BOOST_TC.CCA	= ton0;
			BOOST_TC.CCABUF	= ton;
			CriticalSection{
				BOOST_TC.CTRLB	= TC0_CCAEN_bm | TC_WGMODE_SINGLESLOPE_gc;
				BOOST_TC.CTRLA	= TC_CLKSEL_DIV1_gc;
			}
		}
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap){
			if ((vol_sup <= SUPPLY_LIMIT) || (m_ChargeEnabled == false)){
				return State_Idle;		// 電源電圧が低下・充電停止
			}
			if (m_UpperLimit <= vol_cap){
				return State_Stop;		// 充電を停止
			}
			if ((m_KickLimit <= vol_cap) && (m_KickType != KICK_NONE)){
				return State_Kick;		// キックを開始
			}
			if (MAX_BOOST_CYCLES <= ++m_ChargeCycles){
				return State_Error;		// エラー
			}
			
			// パルス幅の計算
			unsigned short ton = CalcTon(vol_sup);
			unsigned short toff = CalcToff(vol_sup, vol_cap);
			BOOST_TC.CTRLGSET = TC0_LUPD_bm;
			BOOST_TC.PERBUF	= ton + toff;
			BOOST_TC.CCABUF = ton;
			BOOST_TC.CTRLGCLR = TC0_LUPD_bm;
			
			return State_Boost;
		}
		void Leave(void){
			//xputs("Boost->\n");
			
			// 発振を停止
			BOOST_TC.CTRLB	= 0;
			BOOST_TC.CTRLA	= 0;
			
			SetOut(PIN_PWR_CHARGER, OUT_LOW);
		}
	}
	
	/* 充電停止 */
	namespace StateStop{
		void Enter(unsigned char vol_sup, unsigned char vol_cap){
			//xputs("->Stop\n");
			xprintf("->Stop(%d, %u)\n", vol_cap, m_ChargeCycles);
		}
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap){
			if ((vol_sup <= SUPPLY_LIMIT) || (m_ChargeEnabled == false)){
				return State_Idle;		// 電源電圧が低下・充電停止
			}
			if (vol_cap <= m_LowerLimit){
				return State_Buck;		// 充電を開始
			}
			if ((m_KickLimit <= vol_cap) && (m_KickType != KICK_NONE)){
				return State_Kick;		// キックを開始
			}
			return State_Stop;
		}
	}
	
	/* キック中 */
	namespace StateKick{
		void Enter(unsigned char vol_sup, unsigned char vol_cap){
			xprintf("->Kick(%d)\n", m_KickPower);
			
			// キック時間計算
			unsigned short gate = m_KickPower;
			if (gate < (unsigned short)(MIN_KICK_TIME / KICK_UNIT)){
				gate = MIN_KICK_TIME / KICK_UNIT;
			}else if ((unsigned short)(MAX_KICK_TIME / KICK_UNIT) < gate){
				gate = MAX_KICK_TIME / KICK_UNIT;
			}
			
			// キックタイマー初期化
			KICK_TC.CTRLC	= 0;
			KICK_TC.CNT		= 1;
			KICK_TC.CTRLGCLR= TC0_CCCBV_bm | TC0_CCBBV_bm | TC0_PERBV_bm;
			KICK_TC.PER		= (unsigned short)(KICK_PERIOD / KICK_UNIT) + 1;
			KICK_TC.CCB		= gate;
			KICK_TC.CCC		= gate;
			KICK_TC.CCBBUF	= 0;
			KICK_TC.CCCBUF	= 0;
			if (m_KickType == KICK_STRAIGHT){
				KICK_TC.CTRLB = TC0_CCBEN_bm | TC_WGMODE_SINGLESLOPE_gc;
			}else{
				KICK_TC.CTRLB = TC0_CCCEN_bm | TC_WGMODE_SINGLESLOPE_gc;
			}
			
			// キック開始
			CriticalSection{
				KICK_TC.CTRLC = TC0_CMPC_bm | TC0_CMPB_bm;
				KICK_TC.CTRLA = TC_CLKSEL_DIV1024_gc;
				KICK_TC.INTFLAGS= TC0_OVFIF_bm;
			}
		}
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap){
			if (KICK_TC.INTFLAGS & TC0_OVFIF_bm){
				// タイマーを停止
				KICK_TC.CTRLB	= 0;
				KICK_TC.CTRLA	= 0;
				return State_Idle;
			}
			return State_Kick;
		}
	}
	
	/* 異常 */
	namespace StateError{
		void Enter(unsigned char vol_sup, unsigned char vol_cap){
			//xputs("->Error\n");
			xprintf("->Error(%u, %u)\n", vol_cap, vol_sup);
		}
		State_e Execute(unsigned char vol_sup, unsigned char vol_cap){
			return State_Error;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

