/* startup segment (.STARTUP_text) -- Diablo PSX (Climax 1998) reconstruction.
 * The retail link groups each module's once-only init code into .STARTUP_text.  This TU carries the four
 * startup functions whose home TU (GMAN.CPP / MEM.CPP / PADS.CPP) is reconstructed elsewhere without them;
 * the other six (DEC_Open, InitScreens, OVR_Open, PA_Open, SYSI_Init, VID_OpenModule) byte-match in
 * decomp.cpp / vid.cpp / overlay.cpp / pause.cpp / sysinit.cpp.
 * Bodies from the retail oracle (asm/nonmatchings/startup) + SYM. */
#include "diabpsx_types.h"

struct TextDat;
struct MEM_HDR;

struct MEM_INIT_INFO {   /* sizeof 40 */
    void *Mem;                        /* +0x00 */
    unsigned long Size;               /* +0x04 */
    unsigned long Type;               /* +0x08 */
    char *TypeString;                 /* +0x0C */
    unsigned short Alignment;         /* +0x10 */
    void (*MemMove)();                /* +0x14 */
    MEM_INIT_INFO *NextInitBlock;     /* +0x18 */
    unsigned short Flags;             /* +0x1C */
    MEM_HDR *Empty;                   /* +0x20 */
    MEM_HDR *Used;                    /* +0x24 */
};

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
unsigned char GAL_AddMemType(MEM_INIT_INFO *M);   /* GAL.C:290 */
void GAL_SetVerbosity(GAL_VERB_LEV G);            /* GAL.C:2356 */
void InitTAP(unsigned char *bufA, long lenA, unsigned char *bufB, long lenB);
void StartTAP(void);
void PadInit(int mode);
}

extern TextDat *AllDats[372];                /* @0x800B9454 (GMAN.CPP) */
extern LNK_OPTS OPT_LinkerOpts;              /* @0x8010DBD8 (link options block) */
extern void *OPT_FreeMemStart;               /* @0x8010DBE4 */
extern unsigned long OPT_FreeMemSize;        /* @0x8010DBE8 */
LNK_OPTS *Gaz;                               /* @0x8011AAD8 (.sdata; gp-relative only in MEM.CPP code -> owned) */
extern MEM_INIT_INFO PsxMem;                 /* @0x800B7920 (MEM.CPP static) */
extern MEM_INIT_INFO PsxFastMem;             /* @0x800B7948 (MEM.CPP static) */
extern unsigned char RawPadData0[34];        /* @0x800B7F0C */
extern unsigned char RawPadData1[34];        /* @0x800B7F30 */

static void SetupWorkRam();

/* @0x800B0754 GMAN.CPP:1398 */
void GM_Open(void)
{
    for (int f = 0; f < 372; f++)
        AllDats[f] = NULL;
}

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

/* PADS.CPP:103 */
void PAD_Open(void)
{
    InitTAP(RawPadData0, 34, RawPadData1, 34);
    StartTAP();
    PadInit(1);
}
