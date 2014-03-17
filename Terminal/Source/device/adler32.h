#pragma once


// Adler-32の計算を行う
static inline unsigned int CalcAdler32(const void *data_, int len){
	// 実装はWikipediaより

	unsigned int a = 1, b = 0;
	const unsigned char *data = (const unsigned char*)data_;
	while(0 < len){
		size_t tlen = len > 5550 ? 5550 : len;
		len -= tlen;
		do{
			a += *data++;
			b += a;
		}while(--tlen);
		a %= 65521;
		b %= 65521;
	}
	return (b << 16) | a;
}

