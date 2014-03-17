#ifndef MISC_H_
#define MISC_H_

// Adler-32の計算を行う
unsigned int Adler32(const void *data, int len);
unsigned int Adler32(const void *data, int len, unsigned int checksum);

// Xorshiftの計算を行う
unsigned int Xorshift(void);

#endif
