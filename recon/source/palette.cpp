/* PALETTE.CPP — Diablo PSX (Climax 1998) reconstruction.
 * No PC twin: retail devilution/devilutionx PALETTE.CPP is a Win32 DirectDraw-palette module
 * (gamma tables, WM_PALETTECHANGED handling) that has no PSX analogue.  The PSX build repurposes
 * the file for the GPU screen-fade effect (a GT4/FT4 "curtain" quad ramped through PrintGt4/PrintFt4
 * and driven by two TSK tasks) -- genuinely PSX-only Climax code, reconstructed from the retail
 * asm oracle + skel/SOURCE/PALETTE.CPP (Ghidra/IDA draft).  LoadPalette/LoadRndLvlPal/ResetPal/
 * SmearScreen compile to empty stubs in this build (PSX has no software palette to load/reset). */
#include "diabpsx_types.h"
#include "source/gen/structs_palette.h"

#define MAXOTPOS 0x1FF

class CBlocks {
public:
    static int GetMaxOtPos() { return MAXOTPOS; }
};

#include "source/gen/externs_palette.h"
#include "source/gen/protos_palette.h"
#include "source/diablo.h"

/* file statics (SYM: sgbFadedIn/screenbright/faderate/fading/FADE_OT/FadeCoords/FadeCoords2) -- all
 * TU-owned, gp-rel in the oracle -> tentative definitions here. */
static unsigned char sgbFadedIn;
static unsigned char screenbright;
static int faderate;
static BOOL fading;
static int FADE_OT;
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
    BOOL ok;

    nval = 0x80 - fadeval;
    ok = nval < 0x81;
    if (nval < 0) {
        nval = 0;
        ok = nval < 0x81;
    }
    if (!ok)
        nval = 0x80;
    screenbright = (unsigned char)nval;
}

BOOL GetFadeState(void)
{
    return fading;
}

void SetPolyXY(POLY_GT4 *gt4, unsigned char *coords)
{
    unsigned char bright1;
    unsigned char bright2;
    unsigned char u1;
    unsigned char u3;

    bright2 = (unsigned char)((screenbright * 8) / 6);
    gt4->x0 = *coords++ * 2;
    u1 = gt4->u1;
    bright1 = screenbright;
    gt4->y0 = *coords++ * 2;
    u1 -= 1;
    gt4->x1 = *coords++ * 2;
    gt4->y1 = *coords++ * 2;
    gt4->x2 = *coords++ * 2;
    gt4->y2 = *coords++ * 2;
    gt4->x3 = coords[0] * 2;
    u3 = gt4->u3;
    u3 -= 1;
    gt4->r0 = bright1;
    gt4->r1 = bright1;
    gt4->r2 = bright1;
    gt4->r3 = bright1;
    gt4->u1 = u1;
    gt4->tpage |= 0x40;
    gt4->y3 = coords[1] * 2;
    gt4->g0 = bright2;
    gt4->b0 = bright2;
    gt4->g1 = bright2;
    gt4->b1 = bright2;
    gt4->g2 = bright2;
    gt4->b2 = bright2;
    gt4->g3 = bright2;
    gt4->b3 = bright2;
    gt4->u3 = u3;
    gt4->v2 -= 1;
    gt4->v3 -= 1;
    gt4->code = (gt4->code | 2) & 0xFE;
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
    unsigned char u1, u3, v2, v3, code;

    FADE_OT = CBlocks::GetMaxOtPos();
    FT4 = GM_UseTexData(0)->PrintFt4(0xD8, 0, 0, 0, FADE_OT, 0);
    u1 = FT4->u1;
    u3 = FT4->u3;
    v2 = FT4->v2;
    v3 = FT4->v3;
    code = FT4->code;
    FT4->r0 = 0;
    FT4->g0 = 0;
    FT4->b0 = 0;
    u1 -= 1;
    u3 -= 1;
    v2 -= 1;
    v3 -= 1;
    code &= 0xFC;
    FT4->u1 = u1;
    FT4->u3 = u3;
    FT4->v2 = v2;
    FT4->v3 = v3;
    FT4->code = code;
    if (TitleFlag == 0) {
        FT4->x0 = 0;
        FT4->y0 = 0;
        FT4->x1 = 0x160;
        FT4->y1 = 0;
        FT4->y2 = 0xF0;
    } else {
        FT4->y0 = 0xB0;
        FT4->y1 = 0xB0;
        FT4->x0 = 0;
        FT4->x1 = 0x160;
        FT4->y2 = 0x1A0;
    }
    FT4->x2 = 0;
    FT4->x3 = FT4->x1;
    FT4->y3 = FT4->y2;
    TSK_Sleep(1);
}

void PaletteFadeInTask(TASK *T)
{
    int i;

    i = 0;
    VID_GetTick();
    while (i < 0x81) {
        SetFadeLevel(i);
        DrawFadedScreen();
        TSK_Sleep(1);
        i += faderate;
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
    int i;

    i = 0x80;
    VID_GetTick();
    while (i >= 0) {
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
