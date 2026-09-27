/* TITLESCR.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the front-end title
 * screen.  DrawFlameLogo animates the six flame sprites over the logo (frame advanced by the
 * elapsed ticks, wrapping after 57) and, on attract screen 5, adds two fixed sprites. */
#include "diabpsx_types.h"

struct POLY_FT4 {   /* sizeof 40 */
    unsigned long tag;
    unsigned char r0, g0, b0, code;
    short x0, y0;
    unsigned char u0, v0;
    unsigned short clut;
    short x1, y1;
    unsigned char u1, v1;
    unsigned short tpage;
    short x2, y2;
    unsigned char u2, v2;
    unsigned short pad1;
    short x3, y3;
    unsigned char u3, v3;
    unsigned short pad2;
};

class TextDat {
public:
    struct POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
};

class CScreen {   /* sizeof 124: TextDat (112), LoadedId, TpX, TpY */
public:
    unsigned char data[124];
    void Load(int Id, int tpx, int tpy);
    void Display(int Id, int tpx, int tpy, int fadeval);
};

unsigned long VID_GetTick(void);

extern TextDat *FlameTData;
extern int AttractNo;

static int TitleAnimCount = 0;
static int flametick = 0;
int flamecol = 0;
static int frmlist[6] = { 58, 87, 0, 29, 116, 145 };
static int xoff[6] = { -71, 184, 184, 184, 184, 184 };

/* @0x8009E1F0 TITLESCR.CPP:65 */
void DrawFlameLogo(void)
{
    struct POLY_FT4 *FT4;
    int diff;
    int x;
    int *frm;
    int *xp;

    diff = VID_GetTick() - flametick;
    frm = frmlist;
    flametick = VID_GetTick();
    xp = xoff;
    TitleAnimCount += diff;
    if (TitleAnimCount > 56)
        TitleAnimCount = 0;

    for (int i = 0; i < 6; i++) {
        x = *xp;
        FT4 = FlameTData->PrintFt4(*frm + (TitleAnimCount >> 1), x - 8, 100, 0, 0x20, 0);
        xp++;
        FT4->code = (FT4->code | 2) & ~1;
        frm++;
        FT4->r0 = flamecol;
        FT4->g0 = flamecol;
        FT4->tpage |= 0x20;
        FT4->b0 = flamecol;
    }

    if (AttractNo == 5) {
        FT4 = FlameTData->PrintFt4(0xAF, 0x114, 0x98, 0, 0x20, 0);
        FT4->r0 = 0x80;
        FT4->g0 = 0x80;
        FT4->b0 = 0x80;
        FT4->code = (FT4->code | 2) & ~1;
        FT4->tpage |= 0x20;
        FT4 = FlameTData->PrintFt4(0xAE, 0xA0, 0xE4, 0, 0x20, 0);
        FT4->r0 = 0x80;
        FT4->g0 = 0x80;
        FT4->b0 = 0x80;
        FT4->tpage |= 0x20;
        FT4->code = (FT4->code | 2) & ~1;
    }
}

/* @0x8009E3A0 TITLESCR.CPP:107 */
void TitleScreen(CScreen *FeScreen)
{
    DrawFlameLogo();
    FeScreen->Load(0x12, 0xB, 0);
    FeScreen->Display(0x12, 0xB, 0, 0);
}
