#ifndef PSXSRC_PRIMPOOL_H
#define PSXSRC_PRIMPOOL_H
/* PRIMPOOL.H -- Climax PSX primitive pool (C:\diabpsx\PSXSRC\PRIMPOOL.H).  PRIM_GetPrim is defined in the
 * header as a template (every instantiation is attributed to line 65; one out-of-line copy per TU per
 * type under -fno-inline: PRIM_GetPrim__FPP8POLY_FT4 x10, __FPP8POLY_GT4, __FPP7POLY_G4, __FPP7POLY_F4,
 * __FPP7LINE_F2), with PRIM_CopyPrim (75) and PRIM_GetCopy (84) after it; its DBG_Error carries this
 * header's name and line 68 into every TU that parses it. */
#include "psxsrc/psyq.h"
#include "glibdev/gdebug.h"

extern POLY_FT4 *ThisPrimAddr;   /* PRIMPOOL.CPP @0x8011AAB8 (.sdata) */
extern POLY_FT4 *AddrToAvoid;    /* @0x8011AABC */

/* PRIMPOOL.H:65.  Two states of this one line are in the retail objects: BLOCK/GMAN/CPLAYER (and the rest) hold the
 * instantiations in the deferred-inline queue at their first use (`inline`), LOADING/MISPRINT/PLAYER have them
 * flushed at the end of the file ahead of the static-initialiser thunks with the literal last in .rdata (no
 * `inline`): those objects were compiled against the earlier spelling (docs/TOOLCHAIN.md). */
#ifdef PRIMPOOL_NONINLINE
template <class T> void PRIM_GetPrim(T **Prim)
#else
template <class T> inline void PRIM_GetPrim(T **Prim)
#endif
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(T) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 68);
    *Prim = (T *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((T *)ThisPrimAddr + 1);
}

inline void PRIM_CopyPrim(POLY_FT4 *Dest, POLY_FT4 *Source)   /* PRIMPOOL.H:75 */
{
    unsigned long *Dest32 = (unsigned long *)Dest;
    unsigned long *Source32 = (unsigned long *)Source;
    for (unsigned int f = 0; f < 10; f++)
        *Dest32++ = *Source32++;
}

template <class T> inline T *PRIM_GetCopy(T *Prim)   /* PRIMPOOL.H:84 */
{
    T *RetPrim;
    PRIM_GetPrim(&RetPrim);
    PRIM_CopyPrim(RetPrim, Prim);
    return RetPrim;
}

/* PRIMPOOL.CPP */
void PRIM_Clip(RECT *R, int Depth);
void PRIM_FullScreen(int Depth);
POLY_G4 *PRIM_GetNextPolyG4(void);
POLY_FT4 *PRIM_GetNextPolyFt4(void);
POLY_GT4 *PRIM_GetNextPolyGt4(void);

#endif
