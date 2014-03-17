/*------------------------------------------------------------------------*/
/* Universal string handler for user console interface  (C)ChaN, 2011     */
/*------------------------------------------------------------------------*/

#ifndef _STRFUNC
#define _STRFUNC

#define	_CR_CRLF		1	/* 1: Convert \n ==> \r\n in the output char */

void xputc(char c);
void xputs(const char* str);
void xprintf(const char* fmt, ...);
void xsprintf(char* buff, const char* fmt, ...);
void xfprintf(void (*func)(unsigned char), const char*	fmt, ...);
void put_dump(const void* buff, unsigned long addr, int len, int width);
#define DW_CHAR		sizeof(char)
#define DW_SHORT	sizeof(short)
#define DW_LONG		sizeof(long)

int xatoi(char** str, long* res);

#endif
