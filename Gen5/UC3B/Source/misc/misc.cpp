
// Adler-32の計算を行う
unsigned int Adler32(const void *data_, int len){
	// 実装はWikipediaより

	unsigned int a = 1, b = 0;
	const unsigned char *data = (const unsigned char*)data_;
	while(0 < len){
		int tlen = len > 5550 ? 5550 : len;
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
unsigned int Adler32(const void *data_, int len, unsigned int checksum){
	unsigned int a = checksum & 0xFFFF;
	unsigned int b = (checksum >> 16) & 0xFFFF;
	const unsigned char *data = (const unsigned char*)data_;
	while(0 < len){
		int tlen = len > 5550 ? 5550 : len;
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

// Xorshiftの計算を行う
unsigned int Xorshift(void){
	static unsigned int x = 123456789;
	static unsigned int y = 362436069;
	static unsigned int z = 521288629;
	static unsigned int w = 88675123;
	unsigned int t;
	
	t = x ^ (x << 11);
	x = y; y = z; z = w;
	return w = (w ^ (w >> 19)) ^ (t ^ (t >> 8)); 
}


