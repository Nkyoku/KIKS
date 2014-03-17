// 固定小数点数の定義

#ifndef _FIX_H_
#define _FIX_H_

/*** すべての演算で丸め込みは行われない ***/



#ifdef __MSP430__
#include "../driver/OMSP.h"
#endif




#define crfix16 const fix16 &

#define TO_FIX_L(val) (long)((val) * 65536.0 + (0.0 <= (val) ? 0.5 : -0.5))
#define to_fixf(val) (fix16)((val) * 65536.0 + (0.0 <= (val) ? 0.5 : -0.5))



// 固定小数点数 整数部16bit + 小数部16bit
struct fix16{
	// メンバー変数
public:
	long m_Value;

public:
	// コンストラクタ
	/*fix16(void){}
	fix16(short val)	{m_Value = (long)val << 16;}
	fix16(long val)		{m_Value = val << 16;}
	fix16(double val)	{m_Value = (long)(val * 65536);}
	fix16(crfix16 val)	{m_Value = val.m_Value;}
	
	// デストラクタ
	~fix16(){}*/
	
	// 型変換演算子
	operator short() const{return m_Value >> 16;}
	operator long() const{return m_Value >> 16;}
	
	// 比較演算子
	bool operator==(crfix16 val) const{return m_Value == val.m_Value;}
	bool operator!=(crfix16 val) const{return m_Value != val.m_Value;}
	bool operator<=(crfix16 val) const{return m_Value <= val.m_Value;}
	bool operator>=(crfix16 val) const{return m_Value >= val.m_Value;}
	bool operator<(crfix16 val) const{return m_Value < val.m_Value;}
	bool operator>(crfix16 val) const{return m_Value > val.m_Value;}
	
	// 代入演算子
	fix16 operator<<=(int sa)		{m_Value <<= sa; return *this;}
	fix16 operator>>=(int sa)		{m_Value >>= sa; return *this;}
	fix16 operator=(crfix16 val)	{m_Value = val.m_Value;				return *this;}
	fix16 operator=(short val)		{m_Value = (long)val << 16;			return *this;}
	//fix16 operator=(long val)		{m_Value = (long)val << 16;			return *this;}
	//fix16 operator=(double val)		{m_Value = (long)(val * 65536);		return *this;}
	fix16 operator+=(crfix16 val)	{m_Value += val.m_Value;			return *this;}
	fix16 operator+=(short val)		{m_Value += (long)val << 16;		return *this;}
	//fix16 operator+=(long val)		{m_Value += (long)val << 16;		return *this;}
	//fix16 operator+=(double val)	{m_Value += (long)(val * 65536);	return *this;}
	fix16 operator-=(crfix16 val)	{m_Value -= val.m_Value;			return *this;}
	fix16 operator-=(short val)		{m_Value -= (long)val << 16;		return *this;}
	//fix16 operator-=(long val)		{m_Value -= (long)val << 16;		return *this;}
	//fix16 operator-=(double val)	{m_Value -= TO_FIX_L(val);			return *this;}
#ifndef __MSP430__
	fix16 operator*=(crfix16 val)	{m_Value = ((long long)m_Value * (long long)val.m_Value) >> 16;	return *this;}
	fix16 operator*=(short val)		{m_Value *= (long)val;				return *this;}
	//fix16 operator*=(long val)		{m_Value *= (long)val;				return *this;}
	//fix16 operator*=(double val)	{m_Value = (m_Value * TO_FIX_L(val)) >> 16;	return *this;}
#else
	fix16 operator*=(crfix16 val)	{
		NPXMPC = m_Value;
		NPXMPR = val.m_Value;
		_no_operation();
		_no_operation();
		m_Value = NPXMPPM;
		return *this;
	}
	/*fix16 operator*=(short val)		{
		NPXMPC = m_Value;
		NPXMPR = (long)val;
		_no_operation();
		_no_operation();
		m_Value = NPXMPPL;
		return *this;
	}
	fix16 operator*=(long val)		{
		NPXMPC = m_Value;
		NPXMPR = (long)val;
		_no_operation();
		_no_operation();
		m_Value = NPXMPPL;
		return *this;
	}
	fix16 operator*=(double val)	{
		NPXMPC = m_Value;
		NPXMPR = TO_FIX_L(val);
		_no_operation();
		_no_operation();
		m_Value = NPXMPPM;
		return *this;
	}*/
#endif
#ifndef __MSP430__
	fix16 operator/=(crfix16 val)	{m_Value = (long)(((long long)m_Value * 65536) / val.m_Value); return *this;}
#else
	fix16 operator/=(crfix16 val)	{
		// 割り算は符号なし31bitまで
		NPXDVD = m_Value;
		NPXDVS = val.m_Value;
		_no_operation();
		while((short)NPXDVQH < 0);
		m_Value = NPXDVQ;
		return *this;
	}
#endif
	
	
	// 単項演算子
	fix16 operator-() const{fix16 temp; temp.m_Value = -m_Value; return temp;}
	
	// 二項演算子
	fix16 operator<<(int sa)		const {fix16 temp; temp.m_Value = m_Value << sa; return temp;}
	fix16 operator>>(int sa)		const {fix16 temp; temp.m_Value = m_Value >> sa; return temp;}
	fix16 operator+(crfix16 val)	const {fix16 temp; temp.m_Value = m_Value + val.m_Value;		return temp;}
	fix16 operator+(short val)		const {fix16 temp; temp.m_Value = m_Value + ((long)val << 16);	return temp;}
	fix16 operator+(long val)		const {fix16 temp; temp.m_Value = m_Value + ((long)val << 16);	return temp;}
	fix16 operator-(crfix16 val)	const {fix16 temp; temp.m_Value = m_Value - val.m_Value;		return temp;}
	fix16 operator-(short val)		const {fix16 temp; temp.m_Value = m_Value - ((long)val << 16);	return temp;}
	fix16 operator-(long val)		const {fix16 temp; temp.m_Value = m_Value - ((long)val << 16);	return temp;}
#ifndef __MSP430__
	fix16 operator*(crfix16 val)	const {fix16 temp; temp.m_Value = ((long long)m_Value * (long long)val.m_Value) >> 16; return temp;}
	fix16 operator*(short val)		const {fix16 temp; temp.m_Value = m_Value * (long)val;			return temp;}
	fix16 operator*(long val)		const {fix16 temp; temp.m_Value = m_Value * (long)val;			return temp;}
	fix16 operator*(double val)		const {fix16 temp; temp.m_Value = ((long long)m_Value * (long long)(to_fixl(val))) >> 16; return temp;}
#else
	fix16 operator*(crfix16 val)	const {
		fix16 temp;
		NPXMPC = m_Value;
		NPXMPR = val.m_Value;
		_no_operation();
		_no_operation();
		temp.m_Value = NPXMPPM;
		return temp;
	}
	fix16 operator*(short val)		const {
		fix16 temp;
		NPXMPC = m_Value;
		NPXMPR = (long)val;
		_no_operation();
		_no_operation();
		temp.m_Value = NPXMPPL;
		return temp;
	}
	fix16 operator*(long val)		const {
		fix16 temp;
		NPXMPC = m_Value;
		NPXMPR = (long)val;
		_no_operation();
		_no_operation();
		temp.m_Value = NPXMPPL;
		return temp;
	}
	fix16 operator*(double val)		const {
		fix16 temp;
		NPXMPC = m_Value;
		NPXMPR = TO_FIX_L(val);
		_no_operation();
		_no_operation();
		temp.m_Value = NPXMPPM;
		return temp;
	}
#endif
#ifndef __MSP430__
	fix16 operator/(crfix16 val)	const {fix16 temp; temp.m_Value = (long)(((long long)m_Value * 65536) / val.m_Value); return temp;}
#else
	fix16 operator/(crfix16 val)	const {
		fix16 temp;
		NPXDVD = m_Value;
		NPXDVS = val.m_Value;
		_no_operation();
		while((short)NPXDVQH < 0);
		temp.m_Value = NPXDVQ;
		return temp;
	}
#endif
	
	// 後置インクリメント・デクリメント
	fix16 operator++(int){fix16 temp = *this; m_Value += 65536; return temp;}
	fix16 operator--(int){fix16 temp = *this; m_Value -= 65536; return temp;}
	
	// 前置インクリメント・デクリメント
	fix16 operator++(){m_Value += 65536; return *this;}
	fix16 operator--(){m_Value -= 65536; return *this;}
}
#ifdef __MSP430__
__attribute__ ((aligned(4)))
#endif
;



static inline fix16 to_fix(int val){
	fix16 dst;
	dst.m_Value = (long)val << 16;
	return dst;
}

static inline fix16 to_fix(short val){
	fix16 dst;
	dst.m_Value = (long)val << 16;
	return dst;
}

static inline fix16 to_fix(double val){
	fix16 dst;
	dst.m_Value = TO_FIX_L(val);
	return dst;
}

static inline fix16 fix_add(fix16& src1, fix16& src2){
	fix16 dst;
	dst.m_Value = src1.m_Value + src2.m_Value;  
	return dst;
}

static inline fix16 fix_sub(fix16& src1, fix16& src2){
	fix16 dst;
	dst.m_Value = src1.m_Value - src2.m_Value;  
	return dst;
}

static inline fix16 fix_mul(fix16& src1, fix16& src2){
	fix16 dst;
	NPXMPC = src1.m_Value;
	NPXMPR = src2.m_Value;
	_no_operation();
	_no_operation();
	dst.m_Value = NPXMPPM;
	return dst;
}

static inline fix16 fix_div(fix16& src1, fix16& src2){
	// 割り算は符号なし31bitまで
	fix16 dst;
	NPXDVD = src1.m_Value;
	NPXDVS = src2.m_Value;
	_no_operation();
	while((short)NPXDVQH < 0);
	dst.m_Value = NPXDVQ;
	return dst;
}

static inline fix16 fix_asl(fix16& src1, int sa){
	fix16 dst;
	dst.m_Value = src1.m_Value << sa;  
	return dst;
}

static inline fix16 fix_asr(fix16& src1, int sa){
	fix16 dst;
	dst.m_Value = src1.m_Value >> sa;  
	return dst;
}






// 関連ヘッダーのインクルード
#include "fix_math.h"
#include "fix_matrix.h"


#endif
