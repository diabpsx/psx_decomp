#ifndef GLIBDEV_VRIP_SDK_H
#define GLIBDEV_VRIP_SDK_H
/* PsyQ libc declarations VRIP.C includes (<sys/types.h> <stdio.h> <stdarg.h> <ctype.h>
 * <stdlib.h> <string.h> <limits.h>), transcribed from the PsyQ 4.0 COFF/INCLUDE headers.
 * va_list is `char *`: retail SYM types _doprnt's argp / vsprintf's ap as PTR CHAR. */
#ifndef GLIB_TEXT
#define GLIB_TEXT __attribute__((section(".text.lib")))
#endif

/* SYS/TYPES.H */
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;

/* STDIO.H */
#define EOF (-1)
#ifndef _SIZE_T
#define _SIZE_T
typedef unsigned int size_t;
#endif
extern void putc(char, int);

/* STDARG.H (va_list as char *) */
#define __va_rounded_size(TYPE) (((sizeof (TYPE) + sizeof (int) - 1) / sizeof (int)) * sizeof (int))
#define va_arg(AP, TYPE) (AP = ((char *) (AP)) += __va_rounded_size (TYPE), *((TYPE *) ((char *) (AP) - __va_rounded_size (TYPE))))
typedef char *va_list;

/* CTYPE.H */
#define _N 0x04
extern char _ctype_[];
#define isdigit(c) ((_ctype_+1)[(unsigned char)(c)]&_N)
#define isascii(c) ((unsigned)(c)<=0x7f)

/* STRINGS.H / MEMORY.H */
#ifndef NULL
#define NULL 0
#endif
extern void *memcpy();
extern void *memchr(unsigned char *, unsigned char, int);
extern int strlen();

/* LIMITS.H */
#define INT_MAX 2147483647

#endif
