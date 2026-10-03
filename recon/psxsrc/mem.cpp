/* MEM.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  Memory helpers: an empty GAL
 * iteration filter and SlowMemMove (a plain memmove). */
#include "diabpsx_types.h"

extern "C" void *memmove(void *dst, const void *src, unsigned int n);
static void SlowMemMove(void *Dest, void *Source, unsigned long size);

struct MEM_HDR;
struct MEM_INIT_INFO {
    void *Mem;
    unsigned long Size;
    unsigned long Type;
    const char *TypeString;
    unsigned short Alignment;
    void (*MemMove)(void *, void *, unsigned long);
    MEM_INIT_INFO *NextInitBlock;
    unsigned short Flags;
    MEM_HDR *Empty;
    MEM_HDR *Used;
};

static const char WorkRam[] = "Work Ram";
static const char FastRam[] = "Fast Ram";
static MEM_INIT_INFO PsxMem = { 0, 0, 0, WorkRam, 4, SlowMemMove, 0, 0, 0, 0 };
static MEM_INIT_INFO PsxFastMem = { 0, 0, 0, FastRam, 4, SlowMemMove, 0, 0, 0, 0 };

/* @0x80084424 MEM.CPP:96 */
void MyFilter(unsigned long MemType, unsigned long Size, const char *Name)
{
}

/* @0x8008442C MEM.CPP:150 */
static void SlowMemMove(void *Dest, void *Source, unsigned long size)
{
    memmove(Dest, Source, size);
}
