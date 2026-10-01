/* OVERLAY.CPP -- Diablo PSX (Climax 1998) reconstruction: overlay (FRONTEND/PREGAME/GAME/FMV) loader.
 * Bodies from the retail oracle (asm/nonmatchings/overlay) + SYM (scratch/tuinfo.py OVERLAY.CPP).
 * OVR_Open (OVERLAY.CPP:110) is the first public definition of the file, hence the static-init thunk
 * name _GLOBAL_.I.OVR_Open__Fv; retail links its code into .STARTUP_text (startup segment). */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "psxsrc/fileio.h"

enum OVER_TYPE { OVR_NONE = 0, OVR_PREGAME = 1, OVR_GAME = 2, OVR_FRONTEND = 3, OVR_FMV = 4 };

struct Overlay {   /* sizeof 16 */
    unsigned char *Addr;   /* +0x0 */
    int Size;              /* +0x4 */
    char *FileName;        /* +0x8 */
    OVER_TYPE Over;        /* +0xC */

    OVER_TYPE GetOverType() { return Over; }   /* OVERLAY.CPP:65 */
    void ClearOut(void);
    void Load(void);
};

extern "C" {
void *memset(void *s, int c, unsigned long n);
void *memcpy(void *dest, const void *src, unsigned long n);
int DrawSync(int mode);
void EnterCriticalSection(void);
void ExitCriticalSection(void);
void FlushCache(void);
}
FileIO *SYSI_GetOverlayFs(void);   /* SYSINIT.CPP:192 */

extern unsigned char *OVR_FrontEndAddress;   /* link-time overlay descriptors (no SYM record) */
extern int OVR_FrontEndSize;
extern unsigned char *OVR_PregameAddress;
extern int OVR_PregameSize;
extern unsigned char *OVR_GameAddress;
extern int OVR_GameSize;
extern unsigned char *OVR_FmvAddress;
extern int OVR_FmvSize;

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/OVERLAY.CPP", line)   /* retail line literals */

void ClearOutOverlays(void);
void LoadOver(Overlay &Ovr);

/* @0x800B0784 OVERLAY.CPP:110 (.STARTUP_text) */
void OVR_Open(void) __attribute__((section(".text.overlay_startup")));
void OVR_Open(void)
{
    ClearOutOverlays();
}

/* @0x800953F8 OVERLAY.CPP:119 */
BOOL OVR_IsMemcardOverlayBlank(void)
{
    ASSERT(0, 120);
    return 1;
}

static Overlay FrontEndOver = { OVR_FrontEndAddress, OVR_FrontEndSize, "frontend.bin", OVR_FRONTEND };
static Overlay PregameOver = { OVR_PregameAddress, OVR_PregameSize, "pregame.bin", OVR_PREGAME };
static Overlay GameOver = { OVR_GameAddress, OVR_GameSize, "game.bin", OVR_GAME };
static Overlay FmvOver = { OVR_FmvAddress, OVR_FmvSize, "fmv.bin", OVR_FMV };
/* Retail's runtime halt/return template, copied to a cleared overlay's end. */
static const unsigned long HaltTab[3] = {0x000101CD, 0x03E00008, 0};
OVER_TYPE CurrentOverlay;   /* zero-initialized after the generated initializer's small literals */

/* @0x80095424 OVERLAY.CPP:129 */
void OVR_LoadPregame(void)
{
    LoadOver(PregameOver);
}

/* @0x8009544C OVERLAY.CPP:137 */
void OVR_LoadFrontend(void)
{
    LoadOver(FrontEndOver);
}

/* @0x80095474 OVERLAY.CPP:146 */
void OVR_LoadGame(void)
{
    LoadOver(GameOver);
}

/* @0x8009549C OVERLAY.CPP:155 */
void OVR_LoadFmv(void)
{
    LoadOver(FmvOver);
}

/* @0x800954C4 OVERLAY.CPP:164 */
void OVR_LoadMemcard(void)
{
    ASSERT(0, 165);
}

/* @0x800954F0 OVERLAY.CPP:174 */
void ClearOutOverlays(void)
{
    FrontEndOver.ClearOut();
    PregameOver.ClearOut();
    GameOver.ClearOut();
    FmvOver.ClearOut();
}

/* @0x80095548 OVERLAY.CPP:187 */
void Overlay::ClearOut(void)
{
    ASSERT(Size >= 12, 188);
    memset(Addr, 0, Size);
    memcpy(Addr + Size - sizeof(HaltTab), HaltTab, sizeof(HaltTab));
    DrawSync(0);
    EnterCriticalSection();
    FlushCache();
    ExitCriticalSection();
}

/* @0x8009560C OVERLAY.CPP:203 */
void Overlay::Load(void)
{
    char OverlayFile[256];

    SYSI_GetOverlayFs()->ReadAtAddr(FileName, Addr, Size);
    DrawSync(0);
    EnterCriticalSection();
    FlushCache();
    ExitCriticalSection();
}

/* @0x80095668 OVERLAY.CPP:225 */
OVER_TYPE OVR_GetCurrentOverlay(void)
{
    return CurrentOverlay;
}

/* @0x80095674 OVERLAY.CPP:234 */
void LoadOver(Overlay &Ovr)
{
    if (CurrentOverlay != Ovr.GetOverType()) {
        ClearOutOverlays();
        Ovr.Load();
        CurrentOverlay = Ovr.GetOverType();
    }
}
