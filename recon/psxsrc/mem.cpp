/* MEM.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  Memory helpers: an empty GAL
 * iteration filter and SlowMemMove (a plain memmove). */
#include "diabpsx_types.h"

extern "C" void *memmove(void *dst, const void *src, unsigned int n);

/* @0x80084424 MEM.CPP:96 */
void MyFilter(unsigned long MemType, unsigned long Size, const char *Name)
{
}

/* @0x8008442C MEM.CPP:150 */
void SlowMemMove(void *Dest, void *Source, unsigned long size)
{
    memmove(Dest, Source, size);
}
