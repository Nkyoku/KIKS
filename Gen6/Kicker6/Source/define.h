/**	@file
	@brief  共通の定義・定数
*/

#ifndef DEFINE_H_
#define DEFINE_H_

#include <avr/io.h>
#include <avr/interrupt.h>


// 型
#undef NULL
#define NULL	0
/*
#undef false
#define false	0

#undef true
#define true	1

#undef bool
#define bool	char
*/

// 2のべき乗か判断する
#define ISPOWEROF2(x) (((x) & -(x)) == (x))


// エンディアン変換
#define SWAP16(s) ((((s) << 8) & 0xFF00) | (((s) >> 8) & 0xFF))


// パッキング・アライメント
#define PACK	__attribute__((packed))
#define ALIGN1	__attribute__((aligned(1)))
#define ALIGN2	__attribute__((aligned(2)))
#define ALIGN4	__attribute__((aligned(4)))

// 関数の修飾
#define NORETURN __attribute__((noreturn)) void


// NOP
#define NOP()	__asm__ __volatile__("nop" ::)


// CPUクロック
#define F_CPU		32000000




/*// クリティカルセクション
extern volatile char _cs_counter;	// クリティカルセクションのカウンタ

// クリティカルセクションに入る
static inline void EnterCritical(void){
	cli();
	_cs_counter++;
}

// クリティカルセクションから出る
static inline void LeaveCritical(void){
	_cs_counter--;
	if (_cs_counter <= 0){
		_cs_counter = 0;
		sei();
	}
}*/



// CCPで保護されるIOレジスタにアクセス
static inline void WriteProtectedIOREG(volatile register8_t *reg, unsigned char val){
	unsigned char ccp_ioreg = CCP_IOREG_gc;
	__asm__ __volatile__(
		"out %0, %1"	"\n\t"
		"st Z, %3"
		::"I"(_SFR_IO_ADDR(CCP)), "d"(ccp_ioreg), "z"(reg), "d"(val)
		);
}

// CCPで保護されるSPM操作をする
static inline void WriteProtectedSPM(volatile register8_t *reg, unsigned char val){
	unsigned char ccp_spm = CCP_SPM_gc;
	__asm__ __volatile__(
		"out %0, %1"	"\n\t"
		"st Z, %3"
		::"I"(_SFR_IO_ADDR(CCP)), "d"(ccp_spm), "z"(reg), "d"(val)
		);
}



// 割り込み禁止領域を設定するクラス
class clCS{
private:
	char m_sr;
	
public:
	bool m_first;
	
	// コンストラクタ
	clCS() : m_first(true){
		m_sr = SREG;
		cli();
	}
	
	// デストラクタ
	~clCS(){
		asm volatile("":::"memory");
		SREG = m_sr;
	}
};

// クリティカルセクションを作る
#define CriticalSection	for(clCS _c; _c.m_first == true; _c.m_first = false)

// クリティカルセクションに入る
#define EnterCritical() char _sr = SREG; cli()


#define LeaveCritical() asm volatile("":::"memory"); SREG = _sr









#endif
