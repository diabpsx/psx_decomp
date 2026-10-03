

/*	Fucked up bodged out hack and downright steal of
	gnu's vsprintf cos those mofo's at sony can't be arsed
	to write one
#include "unproto.h"
*/

#define _IOFBF    	00001
#define _IONBF    	00002
#define _IOLBF    	00004

typedef struct FILE {   /* retail SYM: STRTAG FILE (warcraft2 copy: anonymous) */
  int   _cnt;
  char *_ptr;
  char *_base;
  int   _bufsiz;
  int   _flag;
  int   _file;
  char *_name_to_remove;
} FILE;



/* Copyright (C) 1995 DJ Delorie, see COPYING.DJ for details */
#ifndef __dj_include_libc_file_h__
#define __dj_include_libc_file_h__

#ifdef __cplusplus
extern "C" {
#endif

#ifndef __dj_ENFORCE_ANSI_FREESTANDING

#ifndef __STRICT_ANSI__

#ifndef _POSIX_SOURCE

#define _IOREAD   000010
#define _IOWRT    000020
#define _IOMYBUF  000040
#define _IOEOF    000100
#define _IOERR    000200
#define _IOSTRG   000400
#define _IORW     001000
#define _IOAPPEND 002000
#define _IORMONCL 004000  /* remove on close, for temp files */
/* if _flag & _IORMONCL, ._name_to_remove needs freeing */

int	_flsbuf(int, FILE*);
int	_filbuf(FILE *);
void	_fwalk(void (*)(FILE *));

#define __getc(p) (--(p)->_cnt>=0 ? \
  (int)(*(unsigned char*)(p)->_ptr++) : \
  _filbuf(p))

#define __putc(x,p) (--(p)->_cnt>=0? \
  ((int)((unsigned char)((*(p)->_ptr++=(unsigned)(x))))): \
  )
//  _flsbuf((unsigned)(x),p) )

#undef  fileno
#define fileno(f)	(f->_file)
#undef  feof
#define feof(f)		(((f)->_flag&_IOEOF)!=0)
#undef  ferror
#define ferror(f)	(((f)->_flag&_IOERR)!=0)

#endif /* !_POSIX_SOURCE */
#endif /* !__STRICT_ANSI__ */
#endif /* !__dj_ENFORCE_ANSI_FREESTANDING */

#ifndef __dj_ENFORCE_FUNCTION_CALLS
#endif /* !__dj_ENFORCE_FUNCTION_CALLS */

#ifdef __cplusplus
}
#endif

#endif /* __dj_include_libc_file_h__ */


/* Copyright (C) 1996 DJ Delorie, see COPYING.DJ for details */
/* Copyright (C) 1994 DJ Delorie, see COPYING.DJ for details */
// #include <libc/stubs.h>
#include "glibdev/vrip_sdk.h"   /* <sys/types.h> <stdio.h> <stdarg.h> <ctype.h> <stdlib.h> <string.h> <limits.h> (PsyQ) */
/* #include <stdio.h>: glibdev/vrip_sdk.h */
/* #include <stdarg.h>: glibdev/vrip_sdk.h */
/* #include <stdio.h>: glibdev/vrip_sdk.h */
/* #include <ctype.h>: glibdev/vrip_sdk.h */
// #include <locale.h>
/* #include <stdlib.h>: glibdev/vrip_sdk.h */
/* #include <string.h>: glibdev/vrip_sdk.h */
// #include <math.h>
// #include <libc/file.h>
//  #include <libc/stdiohk.h>
// #include <libc/local.h>


/* 11-bit exponent (VAX G floating point) is 308 decimal digits */
#define	MAXEXP		308
#define MAXEXPLD        4952 /* this includes subnormal numbers */
/* 128 bit fraction takes up 39 decimal digits; max reasonable precision */
#define	MAXFRACT	39

#define	DEFPREC		6
#define	DEFLPREC	6

#define	BUF		(MAXEXPLD+MAXFRACT+1)	/* + decimal point */

#define	PUTC(ch)	(void) putc(ch, (int)fp)

#define ARG(basetype) \
	_ulong = flags&LONGINT ? va_arg(argp, long basetype) : \
	    flags&SHORTINT ? (short basetype)va_arg(argp, int) : \
	    va_arg(argp, int)


static __inline__ int todigit(char c)
{
  if (c<='0') return 0;
  if (c>='9') return 9;
  return c-'0';
}


static __inline__ char tochar(int n)
{
  if (n>=9) return '9';
  if (n<=0) return '0';
  return n+'0';
}

/* have to deal with the negative buffer count kludge */

#define	LONGINT		0x01		/* long integer */
#define	LONGDBL		0x02		/* long double */
#define	SHORTINT	0x04		/* short integer */
#define	ALT		0x08		/* alternate form */
#define	LADJUST		0x10		/* left adjustment */
#define	ZEROPAD		0x20		/* zero (as opposed to blank) pad */
#define	HEXPREFIX	0x40		/* add 0x or 0X prefix */


static char NULL_REP[] = "(null)";

int _doprnt(const char *fmt0, va_list argp, FILE *fp) GLIB_TEXT; int vsprintf(char *str, const char *fmt, va_list ap) GLIB_TEXT;


/* #include <stdio.h>: glibdev/vrip_sdk.h */
/* #include <stdarg.h>: glibdev/vrip_sdk.h */
/* #include <limits.h>: glibdev/vrip_sdk.h */
//#include <libc/file.h>

int vsprintf(char *str, const char *fmt, va_list ap)
{
  FILE f;
  int len;

  f._flag = _IOWRT|_IOSTRG;
  f._ptr = str;
  f._cnt = INT_MAX;
  len = _doprnt(fmt, ap, &f);
  *f._ptr = 0;
  return len;
}

static char buf[BUF];		/* space for %c, %[diouxX], %[eEfgG] */

int _doprnt(const char *fmt0, va_list argp, FILE *fp)
{
  const char *fmt;		/* format string */
  int ch;			/* character from fmt */
  int cnt;			/* return value accumulator */
  int n;			/* random handy integer */
  char *t;			/* buffer pointer */
  unsigned long _ulong;		/* integer arguments %[diouxX] */
  int base;			/* base for [diouxX] conversion */
  int dprec;			/* decimal precision in [diouxX] */
  int fieldsz;			/* field size expanded by sign, etc */
  int flags;			/* flags as above */
  int fpprec;			/* `extra' floating precision in [eEfgG] */
  int prec;			/* precision from format (%.3d), or -1 */
  int realsz;			/* field size expanded by decimal precision */
  int size;			/* size of converted field or string */
  int width;			/* width from format (%8d), or 0 */
  char sign;			/* sign prefix (' ', '+', '-', or \0) */
  const char *digs;		/* digits for [diouxX] conversion */

//  decimal = localeconv()->decimal_point[0];

  if (fp->_flag & _IORW)
  {
    fp->_flag |= _IOWRT;
    fp->_flag &= ~(_IOEOF|_IOREAD);
  }
  if ((fp->_flag & _IOWRT) == 0)
    return (EOF);

  fmt = fmt0;
  digs = "0123456789abcdef";
  for (cnt = 0;; ++fmt)
  {
    n = fp->_cnt;
    for (t = (char *)fp->_ptr; (ch = *fmt) && ch != '%';
	 ++cnt, ++fmt)
      if ((--n < 0
	   && (!(fp->_flag & _IOLBF) || -n >= fp->_bufsiz))
	  || (ch == '\n' && fp->_flag & _IOLBF))
      {
	fp->_cnt = n;
	fp->_ptr = t;
//	(void) _flsbuf((unsigned char)ch, fp);
	n = fp->_cnt;
	t = (char *)fp->_ptr;
      }
      else
	*t++ = ch;
    fp->_cnt = n;
    fp->_ptr = t;
    if (!ch)
      return cnt;
    flags = 0; dprec = 0; fpprec = 0; width = 0;
    prec = -1;
    sign = '\0';
  rflag:
    switch (*++fmt)
    {
    case ' ':
      /*
       * ``If the space and + flags both appear, the space
       * flag will be ignored.''
       *	-- ANSI X3J11
       */
      if (!sign)
	sign = ' ';
      goto rflag;
    case '#':
      flags |= ALT;
      goto rflag;
    case '*':
      /*
       * ``A negative field width argument is taken as a
       * - flag followed by a  positive field width.''
       *	-- ANSI X3J11
       * They don't exclude field widths read from args.
       */
      if ((width = va_arg(argp, int)) >= 0)
	goto rflag;
      width = -width;
      /* FALLTHROUGH */
    case '-':
      flags |= LADJUST;
      goto rflag;
    case '+':
      sign = '+';
      goto rflag;
    case '.':
      if (*++fmt == '*')
	n = va_arg(argp, int);
      else
      {
	n = 0;
	while (isascii(*fmt) && isdigit(*fmt))
	  n = 10 * n + todigit(*fmt++);
	--fmt;
      }
      prec = n < 0 ? -1 : n;
      goto rflag;
    case '0':
      /*
       * ``Note that 0 is taken as a flag, not as the
       * beginning of a field width.''
       *	-- ANSI X3J11
       */
      flags |= ZEROPAD;
      goto rflag;
    case '1': case '2': case '3': case '4':
    case '5': case '6': case '7': case '8': case '9':
      n = 0;
      do {
	n = 10 * n + todigit(*fmt);
      } while (isascii(*++fmt) && isdigit(*fmt));
      width = n;
      --fmt;
      goto rflag;
    case 'L':
      flags |= LONGDBL;
      goto rflag;
    case 'h':
      flags |= SHORTINT;
      goto rflag;
    case 'l':
      flags |= LONGINT;
      goto rflag;
    case 'c':
      *(t = buf) = va_arg(argp, int);
      size = 1;
      sign = '\0';
      goto pforw;
    case 'D':
      flags |= LONGINT;
      /*FALLTHROUGH*/
    case 'd':
    case 'i':
      ARG(int);
      if ((long)_ulong < 0)
      {
	_ulong = -_ulong;
	sign = '-';
      }
      base = 10;
      goto number;
    case 'O':
      flags |= LONGINT;
      /*FALLTHROUGH*/
    case 'o':
      ARG(unsigned);
      base = 8;
      goto nosign;
    case 'p':
      /*
       * ``The argument shall be a pointer to void.  The
       * value of the pointer is converted to a sequence
       * of printable characters, in an implementation-
       * defined manner.''
       *	-- ANSI X3J11
       */
      /* NOSTRICT */
      _ulong = (unsigned long)va_arg(argp, void *);
      base = 16;
      goto nosign;
    case 's':
      if (!(t = va_arg(argp, char *)))
	t = NULL_REP;
      if (prec >= 0)
      {
	/*
	 * can't use strlen; can only look for the
	 * NUL in the first `prec' characters, and
	 * strlen() will go further.
	 */
	char *p			/*, *memchr() */;

	if ((p = memchr(t, 0, prec)))
	{
	  size = p - t;
	  if (size > prec)
	    size = prec;
	}
	else
	  size = prec;
      }
      else
	size = strlen(t);
      sign = '\0';
      goto pforw;
    case 'U':
      flags |= LONGINT;
      /*FALLTHROUGH*/
    case 'u':
      ARG(unsigned);
      base = 10;
      goto nosign;
    case 'X':
      digs = "0123456789ABCDEF";
      /* FALLTHROUGH */
    case 'x':
      ARG(unsigned);
      base = 16;
      /* leading 0x/X only if non-zero */
      if (flags & ALT && _ulong != 0)
	flags |= HEXPREFIX;

      /* unsigned conversions */
    nosign:			sign = '\0';
      /*
       * ``... diouXx conversions ... if a precision is
       * specified, the 0 flag will be ignored.''
       *	-- ANSI X3J11
       */
    number:			if ((dprec = prec) >= 0)
      flags &= ~ZEROPAD;

      /*
       * ``The result of converting a zero value with an
       * explicit precision of zero is no characters.''
       *	-- ANSI X3J11
       */
      t = buf + BUF;
      if (_ulong != 0 || prec != 0)
      {
	do {
	  *--t = digs[_ulong % base];
	  _ulong /= base;
	} while (_ulong);
	digs = "0123456789abcdef";
	if (flags & ALT && base == 8 && *t != '0')
	  *--t = '0';		/* octal leading 0 */
      }
      size = buf + BUF - t;

    pforw:
      /*
       * All reasonable formats wind up here.  At this point,
       * `t' points to a string which (if not flags&LADJUST)
       * should be padded out to `width' places.  If
       * flags&ZEROPAD, it should first be prefixed by any
       * sign or other prefix; otherwise, it should be blank
       * padded before the prefix is emitted.  After any
       * left-hand padding and prefixing, emit zeroes
       * required by a decimal [diouxX] precision, then print
       * the string proper, then emit zeroes required by any
       * leftover floating precision; finally, if LADJUST,
       * pad with blanks.
       */

      /*
       * compute actual size, so we know how much to pad
       * fieldsz excludes decimal prec; realsz includes it
       */
      fieldsz = size + fpprec;
      realsz = dprec > fieldsz ? dprec : fieldsz;
      if (sign)
	realsz++;
      if (flags & HEXPREFIX)
	realsz += 2;

      /* right-adjusting blank padding */
      if ((flags & (LADJUST|ZEROPAD)) == 0 && width)
	for (n = realsz; n < width; n++)
	  PUTC(' ');
      /* prefix */
      if (sign)
	PUTC(sign);
      if (flags & HEXPREFIX)
      {
	PUTC('0');
	PUTC((char)*fmt);
      }
      /* right-adjusting zero padding */
      if ((flags & (LADJUST|ZEROPAD)) == ZEROPAD)
	for (n = realsz; n < width; n++)
	  PUTC('0');
      /* leading zeroes from decimal precision */
      for (n = fieldsz; n < dprec; n++)
	PUTC('0');

      /* the string or number proper */
      n = size;
      if (fp->_cnt - n >= 0 && (fp->_flag & _IOLBF) == 0)
      {
	fp->_cnt -= n;
	memcpy((char *)fp->_ptr, t, n);
	fp->_ptr += n;
      }
      else
	while (--n >= 0)
	  PUTC(*t++);
      /* trailing f.p. zeroes */
      while (--fpprec >= 0)
	PUTC('0');
      /* left-adjusting padding (always blank) */
      if (flags & LADJUST)
	for (n = realsz; n < width; n++)
	  PUTC(' ');
      /* finally, adjust cnt */
      cnt += width > realsz ? width : realsz;
      break;
    case '\0':			/* "%?" prints ?, unless ? is NULL */
      return cnt;
    default:
      PUTC((char)*fmt);
      cnt++;
    }
  }
  /* NOTREACHED */
}



#define MAXP 4096
#define NP   12
#define P    (4294967296.0L * 4294967296.0L * 2.0L)   /* 2^65 */
#undef P
/*
 * Defining FAST_LDOUBLE_CONVERSION results in a little bit faster
 * version, which might be less accurate (about 1 bit) for long
 * double. For 'normal' double it doesn't matter.
 */
/* #define FAST_LDOUBLE_CONVERSION */

