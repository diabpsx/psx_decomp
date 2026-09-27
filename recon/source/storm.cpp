/* STORM.CPP — Diablo PSX (Climax 1998) reconstruction.  The PSX stand-in for the PC Storm library's
 * memory API (C linkage, as storm.h declares it): allocations go to the Tmalloc heap. */
#include "diabpsx_types.h"

void *Tmalloc(int Size);
void Tfree(void *Addr);

extern "C" {

/* @0x8007B1D0 STORM.CPP:63 */
void *SMemAlloc(unsigned long bytes, char *filename, int linenumber, unsigned long flags)
{
    return Tmalloc(bytes);
}

/* @0x8007B1F0 STORM.CPP:74 */
BOOL SMemFree(void *ptr, char *filename, int linenumber, unsigned long flags)
{
    Tfree(ptr);
    return 1;
}

}
