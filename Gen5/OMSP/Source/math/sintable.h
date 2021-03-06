﻿static const unsigned short SIN_TABLE[128] = {
	0x0000,0x056E,0x0ADB,0x1046,0x15AF,0x1B15,0x2077,0x25D3,0x2B2A,0x307A,0x35C3,0x3B03,0x403A,0x4567,0x4A8A,0x4FA1,
	0x54AC,0x59AA,0x5E9A,0x637B,0x684D,0x6D0F,0x71C0,0x765F,0x7AED,0x7F67,0x83CE,0x8820,0x8C5D,0x9085,0x9497,0x9891,
	0x9C74,0xA03F,0xA3F1,0xA78A,0xAB09,0xAE6E,0xB1B8,0xB4E6,0xB7F8,0xBAEF,0xBDC8,0xC084,0xC322,0xC5A2,0xC804,0xCA47,
	0xCC6B,0xCE6F,0xD053,0xD218,0xD3BB,0xD53F,0xD6A1,0xD7E2,0xD902,0xDA01,0xDADD,0xDB99,0xDC32,0xDCA9,0xDCFE,0xDD31,
	0xDD43,0xDD31,0xDCFE,0xDCA9,0xDC32,0xDB99,0xDADD,0xDA01,0xD902,0xD7E2,0xD6A1,0xD53F,0xD3BB,0xD218,0xD053,0xCE6F,
	0xCC6B,0xCA47,0xC804,0xC5A2,0xC322,0xC084,0xBDC8,0xBAEF,0xB7F8,0xB4E6,0xB1B8,0xAE6E,0xAB09,0xA78A,0xA3F1,0xA03F,
	0x9C74,0x9891,0x9497,0x9085,0x8C5D,0x8820,0x83CE,0x7F67,0x7AED,0x765F,0x71C0,0x6D0F,0x684D,0x637B,0x5E9A,0x59AA,
	0x54AC,0x4FA1,0x4A8A,0x4567,0x403A,0x3B03,0x35C3,0x307A,0x2B2A,0x25D3,0x2077,0x1B15,0x15AF,0x1046,0x0ADB,0x056E
};



// 256で一周のサイン関数
static inline long sin256(unsigned char rot){
	long result = SIN_TABLE[rot & 0x7F];
	if (rot & 0x80) result = -result;
	return result;
}

// 256で一周のコサイン関数
static inline long cos256(unsigned char rot){
	rot += 0x40;
	long result = SIN_TABLE[rot & 0x7F];
	if (rot & 0x80) result = -result;
	return result;
}





