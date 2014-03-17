// 固定小数点数演算ライブラリ

#ifndef _FIX_MATH_H_
#define _FIX_MATH_H_

#include "fix.h"
#include <stdlib.h>



// {log2(x)} 2底の対数を求める
fix16 log2(crfix16 val);

// {2^x} 2のべき乗を求める
fix16 pow2(crfix16 val);

// {|x|} 絶対値を計算
static inline fix16 abs(crfix16 val){
	fix16 temp;
	temp.m_Value = labs(val.m_Value);
	return temp;
}

// {√x} 平方根を求める
static inline fix16 sqrt(crfix16 val){
	return pow2(log2(val) >> 1);
}

// {1/√x} 逆数平方根を求める
static inline fix16 rsqrt(crfix16 val){
	return pow2(-(log2(val) >> 1));
}

// {x^2} 平方を求める
static inline fix16 sqr(crfix16 val){
	return val * val;
}

// {sin(x)} サインを求める
fix16 sin(crfix16 val);

// {cos(x)} コサインを求める
static inline fix16 cos(crfix16 val){
	return sin(val + 1L);
}

// {tan(x)} タンジェントを求める
fix16 tan(crfix16 val);

// {asin(x)} アークサインを求める
fix16 asin(crfix16 val);

// {acos(x)} アークコサインを求める
static inline fix16 acos(crfix16 val){
	return asin(-val) + 1L;
}






#endif
