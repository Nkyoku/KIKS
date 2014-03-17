// 固定小数点数演算ライブラリ

#include "fix_math.h"

#ifndef __MSP430__
#include "fix_table.h"
#endif



#ifndef __MSP430__
// 線形補間
template<typename T>
static inline T lerp(const T table[256], unsigned short value){
	short ret1, ret2;
	unsigned char high0 = value >> 8, high1 = high0 + 1;
	ret1 = table[high0];
	ret2 = table[high1];
	long lin = ((long)(ret2 - ret1) * (value & 0xFF)) >> 8;
	return (T)(lin + ret1 + value);
}
#endif



// {log2(x)} 2底の対数を求める
fix16 log2(crfix16 val){
	unsigned long v = val.m_Value;
	short sa = 0;	// シフト量
	
	// 桁を揃える
	if (v & 0xFFFF0000UL){
		// v >= 1.0 → log2(v) >= 0
		while(v & 0xFFFE0000UL){
			sa++;
			v >>= 1;
		};
	}else{
		// v < 1.0 → log2(v) < 0
		v |= 1;
		do{
			sa--;
			v <<= 1;
		}while((v & 0xFFFF0000UL) == 0);
	}

	fix16 ret = to_fix(sa);
#ifndef __MSP430__
	ret.m_Value |= lerp(FIX_MATH_LOG2_TABLE_16_8, (unsigned short)v);
#else
	NPXFLOG2 = v;
	_no_operation();
	_no_operation();
	ret.m_Value |= NPXFRES;
#endif

	return ret;
}

// {2^x} 2のべき乗を求める
fix16 pow2(crfix16 val){
	long v = val.m_Value;
	short sa = v >> 16;
	
	fix16 ret = to_fix((short)1);
#ifndef __MSP430__
	ret.m_Value |= (unsigned short)lerp((short*)FIX_MATH_POW2_TABLE_16_8, (unsigned short)v);
#else
	NPXFPOW2 = v;
	_no_operation();
	_no_operation();
	ret.m_Value |= NPXFRES;
#endif

	if (0 < sa){
		while(0 <= --sa){
			ret <<= 1;
		}
	}else{
		while(++sa <= 0){
			ret >>= 1;
		}
	}
	return ret;
}

// {sin(x)} サインを求める
fix16 sin(crfix16 val){
	// 周期は4.0
	unsigned short quadrant = val.m_Value >> 16;
	unsigned short phase = (unsigned short)val.m_Value;
	fix16 ret;

	if (quadrant & 1) phase = ~phase;	// 正しくは、phase = -phase

#ifndef __MSP430__
	ret.m_Value = lerp(FIX_MATH_SIN_TABLE_16_8, phase);
#else
	NPXFSIN = phase;
	_no_operation();
	_no_operation();
	ret.m_Value = NPXFRES;
#endif

	if (quadrant & 2) ret = -ret;

	return ret;
}

// {tan(x)} タンジェントを求める
fix16 tan(crfix16 val){
	// 周期は2.0
	unsigned short quadrant = val.m_Value >> 16;
	unsigned short phase = (unsigned short)val.m_Value;
	fix16 ret1, ret2;

#ifndef __MSP430__
	ret1.m_Value = lerp(FIX_MATH_SIN_TABLE_16_8, phase);
	ret2.m_Value = lerp(FIX_MATH_SIN_TABLE_16_8, ~phase);
	if (quadrant & 1){
		if (1 < phase){
			return -(ret2 / ret1);
		}else{
			return -32767L;
		}
	}else{
		if (phase < 65534){
			return ret1 / ret2;
		}else{
			return 32767L;
		}
	}
#else
	NPXFSIN = phase;
	_no_operation();
	_no_operation();
	ret1.m_Value = NPXFRES;
	NPXFSIN = ~phase;
	_no_operation();
	_no_operation();
	ret2.m_Value = NPXFRES;
	if (quadrant & 1){
		NPXDVD = ret2.m_Value;
		NPXDVS = ret1.m_Value;
		if (1 < phase){
			while((short)NPXDVQH < 0);
			ret2.m_Value = -NPXDVQ;
			return ret2;
		}else{
			while((short)NPXDVQH < 0);
			return to_fix((short)-32767);
		}
	}else{
		NPXDVD = ret1.m_Value;
		NPXDVS = ret2.m_Value;
		if (phase < 65534){
			while((short)NPXDVQH < 0);
			ret1.m_Value = NPXDVQ;
			return ret1;
		}else{
			while((short)NPXDVQH < 0);
			return to_fix((short)32767);
		}
	}
#endif
}

// {asin(x)} アークサインを求める
fix16 asin(crfix16 val){
	fix16 ret;
	short aquadrant = val;
	short aphase = (short)val.m_Value;

	if (1 <= aquadrant){
		ret = 1L;
	}else if (0 <= aquadrant){
#ifndef __MSP430__
		ret.m_Value = (unsigned short)lerp((short*)FIX_MATH_ASIN_TABLE_16_8, aphase);
#else
		NPXFASIN = aphase;
		_no_operation();
		_no_operation();
		ret.m_Value = NPXFRES;
#endif
	}else{
		fix16 t = -val;
		aquadrant = t;
		aphase = (short)t.m_Value;
		if (1 <= aquadrant){
			ret = 1L;
		}else if (0 <= aquadrant){
#ifndef __MSP430__
		ret.m_Value = (unsigned short)lerp((short*)FIX_MATH_ASIN_TABLE_16_8, aphase);
#else
		NPXFASIN = aphase;
		_no_operation();
		_no_operation();
		ret.m_Value = NPXFRES;
#endif
		}
		ret = -ret;
	}

	return ret;
}




