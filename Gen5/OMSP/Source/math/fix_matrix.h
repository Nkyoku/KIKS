// 固定小数点数のマトリクス演算

#ifndef _FIX_MATRIX_H_
#define _FIX_MATRIX_H_

/*** すべての演算で丸め込みは行われない ***/

// 乗算対象はすべてRAM上にあること！
// SMPXはROMにアクセスできない



#ifdef __MSP430__
#include "../driver/OMSP.h"
#endif

#include "fix.h"

#include <string.h>



// 固定小数点行列
template <int M1, int N1>
class matrix{
	// メンバー変数
public:
	long m_Values[N1][M1];

public:
	// コンストラクタ
	/*matrix(void){}
	matrix(fix16 vals[])				{memcpy(m_Values, vals, M1 * N1 * sizeof(fix16));}
	matrix(const matrix<M1, N1>& val)	{memcpy(m_Values, val.m_Values, M1 * N1 * sizeof(fix16));}

	// デストラクタ
	~matrix(){}*/
	
	// 要素取り出し
	fix16& m(int x, int y){
		return (fix16&)m_Values[y][x];
	}
	
	// 列数・行数を取得
	short GetCols(void){return M1;}
	short GetRows(void){return N1;}
}
#ifdef __MSP430__
__attribute__ ((aligned(16)))
#endif
;


#ifdef __MSP430__
namespace Matrix{
	// 行列演算を受け付けるか調べる
	static inline bool CanDoOperation(void){
		return !(SMPXSTATUS & 0x1);
	}
	
	// 行列演算の終了を待つ
	static inline void WaitForOperation(void){
		while(SMPXSTATUS & 0x1);
	}
	
	// オーバーフローをチェック
	static inline bool CheckOverflow(void){
		return SMPXSTATUS & 0x2;
	}
	
	// 加算
	template <int M1, int N1>
	static inline void Add(matrix<M1, N1>& dest, const matrix<M1, N1>& src1, const matrix<M1, N1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x4000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 加算2 (転置1)
	template <int M1, int N1>
	static inline void Add_T1(matrix<M1, N1>& dest, const matrix<N1, M1>& src1, const matrix<M1, N1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x5000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 加算3 (転置2)
	template <int M1, int N1>
	static inline void Add_T2(matrix<M1, N1>& dest, const matrix<M1, N1>& src1, const matrix<N1, M1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x6000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 加算4 (転置1, 2)
	template <int M1, int N1>
	static inline void Add_T1T2(matrix<M1, N1>& dest, const matrix<N1, M1>& src1, const matrix<N1, M1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x7000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 減算1
	template <int M1, int N1>
	static inline void Subtract(matrix<M1, N1>& dest, const matrix<M1, N1>& src1, const matrix<M1, N1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x4000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 減算2 (転置1)
	template <int M1, int N1>
	static inline void Subtract_T1(matrix<M1, N1>& dest, const matrix<N1, M1>& src1, const matrix<M1, N1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x1000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 減算3 (転置2)
	template <int M1, int N1>
	static inline void Subtract_T2(matrix<M1, N1>& dest, const matrix<M1, N1>& src1, const matrix<N1, M1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x2000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 減算4 (転置1, 2)
	template <int M1, int N1>
	static inline void Subtract_T1T2(matrix<M1, N1>& dest, const matrix<N1, M1>& src1, const matrix<N1, M1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x3000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// スカラー乗算1
	template <int M1, int N1>
	static inline void SMultiply(matrix<M1, N1>& dest, const matrix<M1, N1>& src1, const fix16& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x8000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// スカラー乗算2 (転置1)
	template <int M1, int N1>
	static inline void SMultiply_T1(matrix<M1, N1>& dest, const matrix<N1, M1>& src1, const fix16& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0x9000 | (M1 << 8) | (N1 << 4) | M1;
	}
	
	// 乗算1
	template <int M1, int N1, int M2>
	static inline void Multiply(matrix<M2, N1>& dest, const matrix<M1, N1>& src1, const matrix<M2, M1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0xC000 | (M1 << 8) | (N1 << 4) | M2;
	}
	
	// 乗算2 (転置1)
	template <int M1, int N1, int M2>
	static inline void Multiply_T1(matrix<M2, M1>& dest, const matrix<M1, N1>& src1, const matrix<M2, N1>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0xD000 | (N1 << 8) | (M1 << 4) | M2;
	}
	
	// 乗算3 (転置2)
	template <int M1, int N1, int N2>
	static inline void Multiply_T2(matrix<N2, N1>& dest, const matrix<M1, N1>& src1, const matrix<M1, N2>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0xE000 | (M1 << 8) | (N1 << 4) | N2;
	}
	
	// 乗算4 (転置1, 2)
	template <int M1, int N1, int N2>
	static inline void Multiply_T1T2(matrix<N2, M1>& dest, const matrix<M1, N1>& src1, const matrix<N1, N2>& src2){
		while(SMPXSTATUS & 0x1);
		SMPXADDR0 = (unsigned short)&dest;
		SMPXADDR1 = (unsigned short)&src1;
		SMPXADDR2 = (unsigned short)&src2;
		SMPXDISPATCH = 0xF000 | (N1 << 8) | (M1 << 4) | N2;
	}
}
#endif



#endif
