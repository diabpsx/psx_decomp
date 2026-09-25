#ifndef PSXSRC_PSYQ_H
#define PSXSRC_PSYQ_H
/* Minimal PsyQ 4.0 declarations used by the reconstruction (libgpu/libetc).  Layouts from SYM. */
#include "diabpsx_types.h"
typedef struct { short x, y, w, h; } RECT;
typedef struct {                          /* sizeof 40 */
    u_long tag;  u_char r0, g0, b0, code;
    short x0, y0; u_char u0, v0; u_short clut;
    short x1, y1; u_char u1, v1; u_short tpage;
    short x2, y2; u_char u2, v2; u_short pad1;
    short x3, y3; u_char u3, v3; u_short pad2;
} POLY_FT4;
typedef struct {                          /* sizeof 52 */
    u_long tag;  u_char r0, g0, b0, code;
    short x0, y0; u_char u0, v0; u_short clut;
    u_char r1, g1, b1, p1;
    short x1, y1; u_char u1, v1; u_short tpage;
    u_char r2, g2, b2, p2;
    short x2, y2; u_char u2, v2; u_short pad2;
    u_char r3, g3, b3, p3;
    short x3, y3; u_char u3, v3; u_short pad3;
} POLY_GT4;
typedef struct {                          /* sizeof 40 */
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
int DrawSync(int mode);
u_short GetClut(int x, int y);
#ifdef __cplusplus
}
#endif
#endif
