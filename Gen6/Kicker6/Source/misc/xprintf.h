/*------------------------------------------------------------------------*/
/* Universal string handler for user console interface  (C)ChaN, 2011     */
/*------------------------------------------------------------------------*/

#ifndef _STRFUNC
#define _STRFUNC

#define	_CR_CRLF		0	/* 1: Convert \n ==> \r\n in the output char */

#define DW_CHAR		sizeof(char)
#define DW_SHORT	sizeof(short)
#define DW_LONG		sizeof(long)



#ifdef _APP_

void xputc(char c);
void xputs(const char* str);
void xprintf(const char* fmt, ...);
void xsprintf(char* buff, const char* fmt, ...);
void xfprintf(void (*func)(unsigned char), const char*	fmt, ...);
void put_dump(const void* buff, unsigned long addr, int len, int width);

char xatoi(char** str, long* res);

#else

static inline void xputc(char c){}
static inline void xputs(const char* str){}
static inline void xprintf(const char* fmt, ...){}
static inline void xsprintf(char* buff, const char* fmt, ...){}
static inline void xfprintf(void (*func)(unsigned char), const char*	fmt, ...){}
static inline void put_dump(const void* buff, unsigned long addr, int len, int width){}

static inline char xatoi(char** str, long* res){return 0;}

#endif

#endif
