#ifndef PSXSRC_SPLTARGT_H
#define PSXSRC_SPLTARGT_H
/* SPLTARGT.H -- Climax PSX gamepad spell-target cursor (C:\diabpsx\PSXSRC\SPLTARGT.H).  Layout from the
 * retail SYM (sizeof 72); Active is the in-class method the retail SYM attributes to SPLTARGT.H:17, emitted
 * out of line per calling TU (-fno-inline). */
#include "diabpsx_types.h"

struct PlayerStruct;

struct SpellTarget {   /* sizeof 72 */
    unsigned char forcespell;   /* +0x0 */
    BOOL active;                /* +0x4 */
    short _sx;                  /* +0x8 */
    short _sy;                  /* +0xA */
    short _nsx;                 /* +0xC */
    short _nsy;                 /* +0xE */
    unsigned char _stx;         /* +0x10 */
    unsigned char _sty;         /* +0x11 */
    BOOL changed;               /* +0x14 */
    PlayerStruct *player;       /* +0x18 */
    int pnum;                   /* +0x1C */
    int angle;                  /* +0x20 */
    int spotid;                 /* +0x24 */
    short lastx[8];             /* +0x28 */
    short lasty[8];             /* +0x38 */

#line 17
    BOOL Active() { return active; }   /* SPLTARGT.H:17 */
    void ClearTrails(void);
    void Init(int plrn);
    void Remove(void);
    void DrawArrow(int x1, int y1);
    void Show(void);
    void ForceTarget(int monst, int x, int y);
};

#endif
