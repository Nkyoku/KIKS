/*------------------------------------------------------------------------/
/  Universal string handler for user console interface
/-------------------------------------------------------------------------/
/
/  Copyright (C) 2011, ChaN, all right reserved.
/
/ * This software is a free software and there is NO WARRANTY.
/ * No restriction on use. You can use, modify and redistribute it for
/   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
/ * Redistributions of source code must retain the above copyright notice.
/
/-------------------------------------------------------------------------*/

#include "xprintf.h"
#include <stdarg.h>

#ifdef _APP_



static char *outptr;

/*----------------------------------------------*/
/* Put a character                              */
/*----------------------------------------------*/

namespace USBIF{
	void PutDebugOut(char c);
}

void xputc(char c){
	if (_CR_CRLF && c == '\n') xputc('\r');		/* CR -> CRLF */

	if (outptr){
		*outptr++ = (char)c;
		return;
	}

	USBIF::PutDebugOut(c);
}



static inline void _xputc(char c){
	if (outptr){
		*outptr++ = (char)c;
	}else{
		USBIF::PutDebugOut(c);
	}
}



/*----------------------------------------------*/
/* Put a null-terminated string                 */
/*----------------------------------------------*/

void xputs(const char* str){
	while (*str)
		_xputc(*str++);
}



/*----------------------------------------------*/
/* Formatted string output                      */
/*----------------------------------------------*/
/*  xprintf("%d", 1234);			"1234"
    xprintf("%6d,%3d%%", -200, 5);	"  -200,  5%"
    xprintf("%-6u", 100);			"100   "
    xprintf("%ld", 12345678L);		"12345678"
    xprintf("%04x", 0xA3);			"00a3"
    xprintf("%08LX", 0x123ABC);		"00123ABC"
    xprintf("%016b", 0x550F);		"0101010100001111"
    xprintf("%s", "String");		"String"
    xprintf("%-4s", "abc");			"abc "
    xprintf("%4s", "abc");			" abc"
    xprintf("%c", 'a');				"a"
    xprintf("%f", 10.0);            <xprintf lacks floating point support>
*/

static void xvprintf(const char* fmt, va_list arp){
	unsigned char r, i, j, w, f;
	unsigned long v;
	char s[16], c, d, *p;

	for (;;) {
		c = *fmt++;					/* Get a char */
		if (!c) break;				/* End of format? */
		if (c != '%') {				/* Pass through it if not a % sequense */
			_xputc(c); continue;
		}
		f = 0;
		c = *fmt++;					/* Get first char of the sequense */
		if (c == '0') {				/* Flag: '0' padded */
			f = 1; c = *fmt++;
		} else {
			if (c == '-') {			/* Flag: left justified */
				f = 2; c = *fmt++;
			}
		}
		for (w = 0; c >= '0' && c <= '9'; c = *fmt++)	/* Minimum width */
			w = w * 10 + c - '0';
		if (c == 'l' || c == 'L') {	/* Prefix: Size is long int */
			f |= 4; c = *fmt++;
		}
		if (!c) break;				/* End of format? */
		d = c;
		if (d >= 'a') d -= 0x20;
		switch (d) {				/* Type is... */
		case 'S' :					/* String */
			p = va_arg(arp, char*);
			for (j = 0; p[j]; j++) ;
			while (!(f & 2) && j++ < w) _xputc(' ');
			xputs(p);
			while (j++ < w) _xputc(' ');
			continue;
		//case 'C' :					/* Character */
		//	_xputc((char)va_arg(arp, int)); continue;
		//case 'B' :					/* Binary */
		//	r = 2; break;
		//case 'O' :					/* Octal */
		//	r = 8; break;
		case 'D' :					/* Signed decimal */
		case 'U' :					/* Unsigned decimal */
			r = 10; break;
		case 'X' :					/* Hexdecimal */
			r = 16; break;
		default:					/* Unknown type (passthrough) */
			_xputc(c); continue;
		}

		/* Get an argument and put it in numeral */
		v = (f & 4) ? va_arg(arp, long) : ((d == 'D') ? (long)va_arg(arp, int) : (long)va_arg(arp, unsigned int));
		if (d == 'D' && (v & 0x80000000)) {
			v = 0 - v;
			f |= 8;
		}
		i = 0;
		do {
			d = (char)(v % r); v /= r;
			if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
			s[i++] = d + '0';
		} while (v && i < sizeof(s));
		if (f & 8) s[i++] = '-';
		j = i; d = (f & 1) ? '0' : ' ';
		while (!(f & 2) && j++ < w) _xputc(d);
		do _xputc(s[--i]); while(i);
		while (j++ < w) _xputc(' ');
	}
}


void xprintf(const char* fmt, ...){
	va_list arp;

	va_start(arp, fmt);
	xvprintf(fmt, arp);
	va_end(arp);
}


void xsprintf(char* buff, const char*	fmt, ...){
	va_list arp;

	outptr = buff;		/* Switch destination for memory */

	va_start(arp, fmt);
	xvprintf(fmt, arp);
	va_end(arp);

	*outptr = 0;		/* Terminate output string with a \0 */
	outptr = 0;			/* Switch destination for device */
}


/*----------------------------------------------*/
/* Dump a line of binary dump                   */
/*----------------------------------------------*/
//	buff	Pointer to the array to be dumped
//	addr	Heading address value
//	len		Number of items to be dumped
//	width	Size of the items (DF_CHAR, DF_SHORT, DF_LONG)
void put_dump(const void* buff, unsigned long addr, int len, int width){
	int i;
	const unsigned char *bp;
	const unsigned short *sp;
	const unsigned long *lp;

	//xprintf("%08lX", addr);		/* address */

	switch (width) {
	case DW_CHAR:
		bp = (const unsigned char*)buff;
		for (i = 0; i < len; i++)		/* Hexdecimal dump */
			xprintf(" %02X", bp[i]);
		//xputc(' ');
		//for (i = 0; i < len; i++)		/* ASCII dump */
		//	xputc((bp[i] >= ' ' && bp[i] <= '~') ? bp[i] : '.');
		break;
	case DW_SHORT:
		sp = (const unsigned short*)buff;
		do								/* Hexdecimal dump */
			xprintf(" %04X", *sp++);
		while (--len);
		break;
	case DW_LONG:
		lp = (const unsigned long*)buff;
		do								/* Hexdecimal dump */
			xprintf(" %08LX", *lp++);
		while (--len);
		break;
	}

	//xputc('\n');
}




/*----------------------------------------------*/
/* Get a value of the string                    */
/*----------------------------------------------*/

char xatoi(char **str, long *res){
	unsigned long val;
	unsigned char c, r, s = 0;

	*res = 0;

	while ((c = **str) == ' ') (*str)++;	/* Skip leading spaces */

	if (c == '-') {		/* negative? */
		s = 1;
		c = *(++(*str));
	}

	if (c == '0') {
		c = *(++(*str));
		switch (c) {
		case 'x':		/* hexdecimal */
			r = 16; c = *(++(*str));
			break;
		case 'b':		/* binary */
			r = 2; c = *(++(*str));
			break;
		default:
			if (c <= ' ') return 1;	/* single zero */
			if (c < '0' || c > '9') return 0;	/* invalid char */
			r = 8;		/* octal */
		}
	} else {
		if (c < '0' || c > '9') return 0;	/* EOL or invalid char */
		r = 10;			/* decimal */
	}

	val = 0;
	while (c > ' ') {
		if (c >= 'a') c -= 0x20;
		c -= '0';
		if (c >= 17) {
			c -= 7;
			if (c <= 9) return 0;	/* invalid char */
		}
		if (c >= r) return 0;		/* invalid char for current radix */
		val = val * r + c;
		c = *(++(*str));
	}
	if (s) val = 0 - val;			/* apply sign if needed */

	*res = val;
	return 1;
}



#endif
