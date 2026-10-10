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

enum FILE_SYSTEM { FS_PC = 0, FS_CD = 1 };
enum DEV_KIT { DK_SONY_ISA = 0, DK_SONY_PCI = 1, DK_CLIMAX = 2 };
struct LNK_OPTS {   /* sizeof 32 */
    unsigned long RamSize;
    unsigned long StackSize;
    void *OrgAddress;
    void *FreeMemAddress;
    unsigned long FreeMemSize;
    FILE_SYSTEM FileSystem;
    DEV_KIT DevKit;
    unsigned long NoQuests;
};

enum GAL_VERB_LEV { GAL_SILENT = 0, GAL_NOISY = 1 };


extern "C" {
void *memset(void *s, int c, unsigned long n);
unsigned char GAL_AddMemType(MEM_INIT_INFO *M);
void GAL_SetVerbosity(GAL_VERB_LEV G);
}
extern LNK_OPTS OPT_LinkerOpts;
extern void *OPT_FreeMemStart;
extern unsigned long OPT_FreeMemSize;
/* Retail MEM.CPP small data in order: the three initialised words, then the uninitialised Gaz and
 * LastFmem that cc1plus emits at the end of the TU. */
unsigned int GSYS_MemStart = 0;   /* @0x8011AACC */
unsigned int GSYS_MemEnd = 0;   /* @0x8011AAD0 */
int LowestFmem = 0xA00000;   /* @0x8011AAD4 */
LNK_OPTS *Gaz;   /* @0x8011AAD8 */
int LastFmem;   /* @0x8011AADC */
void MEM_SetupMem(void) __attribute__((section(".text.startup_mem")));
static void SetupWorkRam(void) __attribute__((section(".text.startup_mem")));

/* MEM.CPP:85 */
void MEM_SetupMem(void)
{
    Gaz = &OPT_LinkerOpts;
    SetupWorkRam();
}

/* MEM.CPP:123 */
static void SetupWorkRam(void)
{
    PsxMem.Mem = OPT_FreeMemStart;
    PsxMem.Size = OPT_FreeMemSize;
    PsxMem.Type = 1;
    PsxFastMem.Mem = (void *)0x1F800000;
    PsxFastMem.Size = 0x400;
    PsxFastMem.Type = 2;
    memset(PsxMem.Mem, 0, PsxMem.Size);
    GAL_AddMemType(&PsxFastMem);
    GAL_AddMemType(&PsxMem);
    GAL_SetVerbosity(GAL_NOISY);
}
