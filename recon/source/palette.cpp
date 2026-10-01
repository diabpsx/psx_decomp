/* PALETTE.CPP — Diablo PSX (Climax 1998) reconstruction.
 * No PC twin: retail devilution/devilutionx PALETTE.CPP is a Win32 DirectDraw-palette module
 * (gamma tables, WM_PALETTECHANGED handling) that has no PSX analogue.  The PSX build repurposes
 * the file for the GPU screen-fade effect (a GT4/FT4 "curtain" quad ramped through PrintGt4/PrintFt4
 * and driven by two TSK tasks) -- genuinely PSX-only Climax code, reconstructed from the retail
 * asm oracle + skel/SOURCE/PALETTE.CPP (Ghidra/IDA draft).  LoadPalette/LoadRndLvlPal/ResetPal/
 * SmearScreen compile to empty stubs in this build (PSX has no software palette to load/reset). */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"
#include "psxsrc/textfileinfo_header.h"
#include "source/gen/structs_palette.h"

inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

#define MAXOTPOS 0x1FF

class CBlocks {
public:
    static int GetMaxOtPos() { return MAXOTPOS; }
};

#include "source/gen/externs_palette.h"
#include "source/gen/protos_palette.h"
#include "source/diablo.h"
#define P_setRGB0(p, _r0, _g0, _b0) (p)->r0 = (_r0), (p)->g0 = (_g0), (p)->b0 = (_b0)
#define P_setXYWH(p, _x0, _y0, _w, _h) (p)->x0 = (_x0), (p)->y0 = (_y0), (p)->x1 = (_x0)+(_w), (p)->y1 = (_y0), (p)->x2 = (_x0), (p)->y2 = (_y0)+(_h), (p)->x3 = (_x0)+(_w), (p)->y3 = (_y0)+(_h)

/* TU-owned initialized small data, including the retail initial fade depth. */
static unsigned char sgbFadedIn = 0;
static unsigned char screenbright = 0;
static int faderate = 0;
static BOOL fading = 0;
static int FADE_OT = MAXOTPOS;
int st = 1;
int mode = 0;
static unsigned char FadeCoords[8]  = { 0, 0, 0xB0, 0, 0, 0x78, 0xB0, 0x78 };
static unsigned char FadeCoords2[8] = { 0, 0x58, 0xB0, 0x55, 0, 0x78, 0xB0, 0x78 };

void LoadPalette(const char *pszFileName)
{
}

void LoadRndLvlPal(int l)
{
}

void ResetPal(void)
{
}

void SetFadeLevel(int fadeval)
{
    int nval;

    nval = 0x80 - fadeval;
    if (nval < 0)
        nval = 0;
    if (nval > 0x80)
        nval = 0x80;
    screenbright = nval;
}

BOOL GetFadeState(void)
{
    return fading;
}

void SetPolyXY(POLY_GT4 *gt4, unsigned char *coords)
{
    unsigned char bright1;
    unsigned char bright2;

    bright1 = screenbright;
    bright2 = (bright1 * 8) / 6;
    gt4->x0 = *coords++ * 2;
    gt4->y0 = *coords++ * 2;
    gt4->x1 = *coords++ * 2;
    gt4->y1 = *coords++ * 2;
    gt4->x2 = *coords++ * 2;
    gt4->y2 = *coords++ * 2;
    gt4->x3 = *coords++ * 2;
    gt4->y3 = *coords * 2;
    gt4->r0 = bright1;
    gt4->g0 = bright2;
    gt4->b0 = bright2;
    gt4->r1 = bright1;
    gt4->g1 = bright2;
    gt4->b1 = bright2;
    gt4->r2 = bright1;
    gt4->g2 = bright2;
    gt4->b2 = bright2;
    gt4->r3 = bright1;
    gt4->g3 = bright2;
    gt4->b3 = bright2;
    gt4->u1--;
    gt4->tpage |= 0x40;
    gt4->u3--;
    gt4->v2--;
    gt4->v3--;
    gt4->code |= 2;
    gt4->code &= ~1;
}


void SmearScreen(void)
{
}

void DrawFadedScreen(void)
{
    TextDat *ThisDat;
    POLY_GT4 *GT4a;

    ThisDat = GM_UseTexData(0);
    FADE_OT = CBlocks::GetMaxOtPos();
    GT4a = ThisDat->PrintGt4(0xD8, 0, 0, 0, FADE_OT, 0);
    if (TitleFlag == 0)
        SetPolyXY(GT4a, FadeCoords);
    else
        SetPolyXY(GT4a, FadeCoords2);
}

void BlackPalette(void)
{
    POLY_FT4 *FT4;

    FADE_OT = CBlocks::GetMaxOtPos();
    FT4 = GM_UseTexData(0)->PrintFt4(0xD8, 0, 0, 0, FADE_OT, 0);
    P_setRGB0(FT4, 0, 0, 0);
    FT4->u1--;
    FT4->u3--;
    FT4->v2--;
    FT4->v3--;
    FT4->code &= ~2;
    FT4->code &= ~1;
    if (TitleFlag == 0)
        P_setXYWH(FT4, 0, 0, 0x160, 0xF0);
    else
        P_setXYWH(FT4, 0, 0xB0, 0x160, 0xF0);
    TSK_Sleep(1);
}

void PaletteFadeInTask(TASK *T)
{
    int i;

    i = 0;
    VID_GetTick();
    while (i < 0x81) {
        int dummy;   /* dead local: retail SYM keeps a record-less level at the loop test */
        SetFadeLevel(i);
        DrawFadedScreen();
        i += faderate;
        TSK_Sleep(1);
    }
    SetFadeLevel(0x80);
    DrawFadedScreen();
    TSK_Sleep(1);
    fading = 0;
    SetFadeLevel(0x80);
    DrawFadedScreen();
    TSK_Sleep(1);
}

BOOL PaletteFadeIn(int fr)
{
    if (fading != 0)
        return 0;
    fading = 1;
    faderate = fr;
    sgbFadedIn = 1;
    TSK_AddTask(0x8000, (void (*)())PaletteFadeInTask, 0x800, 0);
    return 1;
}

void PaletteFadeOutTask(TASK *T)
{
    int i = 0x80;

    VID_GetTick();
    while (i >= 0) {
        int dummy;   /* dead local: retail SYM keeps a record-less level at the loop test */
        SetFadeLevel(i);
        SmearScreen();
        DrawFadedScreen();
        i -= faderate;
        TSK_Sleep(1);
    }
    SetFadeLevel(0);
    DrawFadedScreen();
    TSK_Sleep(1);
    SetFadeLevel(0);
    DrawFadedScreen();
    TSK_Sleep(1);
    BlackPalette();
    sgbFadedIn = 0;
    fading = 0;
    BlackPalette();
    BlackPalette();
}

BOOL PaletteFadeOut(int fr)
{
    if (fading != 0)
        return 0;
    faderate = fr;
    fading = 1;
    sgbFadedIn = 0;
    TSK_AddTask(0x8000, (void (*)())PaletteFadeOutTask, 0x800, 0);
    return 1;
}
