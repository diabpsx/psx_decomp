#ifndef DIABPSX_TYPES_H
#define DIABPSX_TYPES_H
/* Shared base types for the Diablo PSX reconstruction (SYM TPDEFs; see tools/symtypes.py).
 * NOTE: the SYM keeps ONE TPDEF record per name; `BOOL` is UCHAR in the GLIB TU but the game/PSX
 * layer stores BOOL fields as 32-bit words (TextDat::OwnDat = `sw`), i.e. the PC `typedef int BOOL`. */
typedef unsigned char  u_char;
typedef unsigned short u_short;
typedef unsigned int   u_int;
typedef unsigned long  u_long;
typedef unsigned short ushort;
typedef char  s8;  typedef short s16;  typedef long s32;
typedef unsigned char u8; typedef unsigned short u16; typedef unsigned long u32;
typedef unsigned int  uint;  typedef unsigned char uchar;  typedef unsigned long ulong;
typedef unsigned char UBYTE; typedef unsigned short UWORD; typedef unsigned int UINT;
typedef unsigned char UCHAR; typedef unsigned short USHORT; typedef unsigned long ULONG;
#ifdef __cplusplus
typedef bool BOOL;      /* C++ TUs: gcc-2.7 `bool` (int-sized; mangles as `b` -- TpLoadCallBack__FPUciib) */
#else
typedef unsigned char BOOL;   /* GLIB C headers (SYM TPDEF BOOL = UCHAR) */
#endif
#ifndef NULL
#define NULL 0
#endif
#endif
