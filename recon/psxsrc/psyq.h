#ifndef PSXSRC_PSYQ_H
#define PSXSRC_PSYQ_H
/* Minimal PsyQ 4.0 declarations used by the reconstruction (libgpu/libetc). */
#include "diabpsx_types.h"
typedef struct { short x, y, w, h; } RECT;
#ifdef __cplusplus
extern "C" {
#endif
int LoadImage(RECT *rect, u_long *p);
int DrawSync(int mode);
#ifdef __cplusplus
}
#endif
#endif
