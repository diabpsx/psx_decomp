#ifndef PSXSRC_PSYQ_H
#define PSXSRC_PSYQ_H
/* Minimal PsyQ 4.0 declarations used by the reconstruction (libgpu/libetc).  Layouts from SYM. */
#include "diabpsx_types.h"
typedef struct RECT { short x, y, w, h; } RECT;
typedef struct DR_LOAD { u_long tag; u_long code[3]; u_long p[13]; } DR_LOAD;
typedef struct P_TAG { unsigned addr : 24; unsigned len : 8; u_char r0, g0, b0, code; } P_TAG;
typedef struct POLY_FT4 {                          /* sizeof 40 */
    u_long tag;  u_char r0, g0, b0, code;
    short x0, y0; u_char u0, v0; u_short clut;
    short x1, y1; u_char u1, v1; u_short tpage;
    short x2, y2; u_char u2, v2; u_short pad1;
    short x3, y3; u_char u3, v3; u_short pad2;
} POLY_FT4;
typedef struct POLY_G4 {                          /* sizeof 36; PsyQ 4.0 LIBGPU.H */
    u_long tag; u_char r0, g0, b0, code;
    short x0, y0; u_char r1, g1, b1, pad1;
    short x1, y1; u_char r2, g2, b2, pad2;
    short x2, y2; u_char r3, g3, b3, pad3;
    short x3, y3;
} POLY_G4;
typedef struct POLY_GT4 {                          /* sizeof 52 */
    u_long tag;  u_char r0, g0, b0, code;
    short x0, y0; u_char u0, v0; u_short clut;
    u_char r1, g1, b1, p1;
    short x1, y1; u_char u1, v1; u_short tpage;
    u_char r2, g2, b2, p2;
    short x2, y2; u_char u2, v2; u_short pad2;
    u_char r3, g3, b3, p3;
    short x3, y3; u_char u3, v3; u_short pad3;
} POLY_GT4;
typedef struct POLY_GT3 {                          /* sizeof 40 */
    u_long tag;  u_char r0, g0, b0, code;
    short x0, y0; u_char u0, v0; u_short clut;
    u_char r1, g1, b1, p1;
    short x1, y1; u_char u1, v1; u_short tpage;
    u_char r2, g2, b2, p2;
    short x2, y2; u_char u2, v2; u_short pad2;
} POLY_GT3;
#ifdef __cplusplus
extern "C" {
#endif
int LoadImage(RECT *rect, u_long *p);
u_short GetTPage(int tp, int abr, int x, int y);
void SetDrawLoad(DR_LOAD *p, RECT *rect);
int DrawSync(int mode);
u_short GetClut(int x, int y);
#ifdef __cplusplus
}
#endif
/* libgpu.h primitive macros (PsyQ 4.0) */
#define setlen(p, _len)   (((P_TAG *)(p))->len = (u_char)(_len))
#define setcode(p, _code) (((P_TAG *)(p))->code = (u_char)(_code))
#define setPolyFT4(p) setlen(p, 9),  setcode(p, 0x2c)
#define setPolyGT3(p) setlen(p, 9),  setcode(p, 0x34)
#define setPolyGT4(p) setlen(p, 12), setcode(p, 0x3c)
#define setaddr(p, _addr) (((P_TAG *)(p))->addr = (u_long)(_addr))
#define getaddr(p) (((P_TAG *)(p))->addr)
#define addPrim(ot, p) setaddr(p, getaddr(ot)), setaddr(ot, p)
#define setSemiTrans(p, abe) ((abe) ? (((P_TAG *)(p))->code |= 0x02) : (((P_TAG *)(p))->code &= ~0x02))
#define setShadeTex(p, tge) ((tge) ? (((P_TAG *)(p))->code |= 0x01) : (((P_TAG *)(p))->code &= ~0x01))
#define getTPage(tp, abr, x, y) ((((tp)&0x3)<<7)|(((abr)&0x3)<<5)|(((y)&0x100)>>4)|(((x)&0x3ff)>>6)|(((y)&0x200)<<2))
#define getlen(p) (((P_TAG *)(p))->len)
#define setXYWH(p, _x0, _y0, _w, _h) (p)->x0 = (_x0), (p)->y0 = (_y0), (p)->x1 = (_x0)+(_w), (p)->y1 = (_y0), (p)->x2 = (_x0), (p)->y2 = (_y0)+(_h), (p)->x3 = (_x0)+(_w), (p)->y3 = (_y0)+(_h)
#define setUVWH(p, _u0, _v0, _w, _h) (p)->u0 = (_u0), (p)->v0 = (_v0), (p)->u1 = (_u0)+(_w), (p)->v1 = (_v0), (p)->u2 = (_u0), (p)->v2 = (_v0)+(_h), (p)->u3 = (_u0)+(_w), (p)->v3 = (_v0)+(_h)
#define setRECT(r, _x, _y, _w, _h) (r)->x = (_x), (r)->y = (_y), (r)->w = (_w), (r)->h = (_h)
#endif
