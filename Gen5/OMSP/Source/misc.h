/*	@file
	@brief 諸関数
*/

#ifndef _MISC_H_
#define _MISC_H_



// 最大値・最小値のリミット
template <typename T> static inline T minmax_limit(T val, T bottom, T top){
	if (val < bottom) return bottom;
	if (top < val) return top;
	return val;
}

// 最大値のリミット
template <typename T> static inline T max_limit(T val, T top){
	if (top < val) return top;
	return val;
}

// 最小値のリミット
template <typename T> static inline T mix_limit(T val, T bottom){
	if (val < bottom) return bottom;
	return val;
}

// 変化率に制限をつける
template <typename T> static inline T delta_limit(T last_val, T next_val, T falling, T rising){
	T delta = next_val - last_val;
	if (delta < falling){
		delta = falling;
	}else if (rising < delta){
		delta = rising;
	}
	return last_val + delta;
}



#endif
