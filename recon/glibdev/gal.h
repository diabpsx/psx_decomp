#ifndef GLIBDEV_GAL_H
#define GLIBDEV_GAL_H
/* GAL.C — Climax GLIB memory allocator (C lane; signatures from SYM). */
#include "diabpsx_types.h"
#ifdef __cplusplus
extern "C" {
#endif
long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);   /* @0x800215DC */
void *GAL_Lock(long Handle);                      /* @0x80021774 */
unsigned char GAL_Unlock(long Handle);            /* @0x800217DC */
unsigned char GAL_Free(long Handle);              /* @0x80021860 returns UCHAR */
unsigned char GAL_SetMemName(long Hnd, char *Text);   /* @0x80022270 */
#ifdef __cplusplus
}
#endif
#endif
