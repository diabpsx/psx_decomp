#ifndef PSXSRC_PRIMPOOL_H
#define PSXSRC_PRIMPOOL_H
/* PRIMPOOL.H -- Climax primitive pool.  PRIM_GetPrim is defined in the header (lines 65-71), one
 * out-of-line copy per TU per pointee type (PRIM_GetPrim__FPP8POLY_FT4 x10, __FPP8POLY_GT4, ...). */
#include "psxsrc/psyq.h"
#include "glibdev/gdebug.h"

extern POLY_FT4 *ThisPrimAddr;   /* @0x8011AAB8 (.sdata) */
extern POLY_FT4 *AddrToAvoid;    /* @0x8011AABC */

inline void PRIM_GetPrim(POLY_FT4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_FT4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 68);
    *Prim = (POLY_FT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_FT4 *)ThisPrimAddr + 1);
}
inline void PRIM_GetPrim(POLY_GT4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_GT4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 68);
    *Prim = (POLY_GT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_GT4 *)ThisPrimAddr + 1);
}
#endif
