/* DIALOG.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the Dialog box
 * renderer -- frame-size cache (GetSizes), the tiled background with its random gouraud shading
 * (Back, GShadeTab/RandBTab), border lines (Line), the textured tile primitive (DialogPrint) and
 * the drop shadows.  The GMAN.H TextDat::GetFr/GetPal inlines are emitted out of line here. */
#include "diabpsx_types.h"

/* ---------------------------------------------------------------- PsyQ libgpu ---- */
struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};
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
struct POLY_G4 {   /* sizeof 36 */
    unsigned long tag;
    unsigned char r0, g0, b0, code;
    short x0, y0;
    unsigned char r1, g1, b1, pad1;
    short x1, y1;
    unsigned char r2, g2, b2, pad2;
    short x2, y2;
    unsigned char r3, g3, b3, pad3;
    short x3, y3;
};
struct POLY_GT4 {   /* sizeof 52 */
    unsigned long tag;
    unsigned char r0, g0, b0, code;
    short x0, y0;
    unsigned char u0, v0;
    unsigned short clut;
    unsigned char r1, g1, b1, p1;
    short x1, y1;
    unsigned char u1, v1;
    unsigned short tpage;
    unsigned char r2, g2, b2, p2;
    short x2, y2;
    unsigned char u2, v2;
    unsigned short pad2;
    unsigned char r3, g3, b3, p3;
    short x3, y3;
    unsigned char u3, v3;
    unsigned short pad3;
};
struct P_TAG {
    unsigned addr : 24;
    unsigned len : 8;
    unsigned char r0, g0, b0, code;
};
#define setlen(p, _len)   (((P_TAG *)(p))->len = (unsigned char)(_len))
#define setcode(p, _code) (((P_TAG *)(p))->code = (unsigned char)(_code))
#define setaddr(p, _addr) (((P_TAG *)(p))->addr = (unsigned long)(_addr))
#define getaddr(p) (((P_TAG *)(p))->addr)
#define addPrim(ot, p) setaddr(p, getaddr(ot)), setaddr(ot, p)

/* ---------------------------------------------------------------- engine types ---- */
struct FRAME_HDR {   /* sizeof 12 */
    unsigned int FrOffset : 32;
    int X : 8;
    int Y : 8;
    unsigned int PalNum : 8;
    unsigned int NotTrans : 1;
    unsigned int Rotated : 1;
    unsigned int InVRAM : 1;
    unsigned int CompType : 2;
    unsigned int Floor : 1;
    unsigned int Cycle : 1;
    unsigned int pad : 1;
    unsigned int W : 9;
    unsigned int H : 9;
    unsigned int PentaGram : 1;
    unsigned int pad2 : 13;
};
struct FRAME_TP {   /* word 0 of a FRAME_HDR as U/V/Tpage (GMAN.H view) */
    unsigned U : 8, V : 8, Tpage : 16;
};
struct PAL {   /* sizeof 8 */
    unsigned int InVram : 1;
    unsigned int NumOfCols : 31;
    unsigned short Cols[1];
};
struct TP_LOAD_HDR {   /* sizeof 4 */
    unsigned int U : 8;
    unsigned int V : 8;
    unsigned int tpage : 16;
};

extern "C" BOOL GAL_Free(long Hnd);
extern "C" void DBG_Error(char *Text, char *File, int Line);

struct SPR_HDR;
struct CTextFileInfo;
class TextDat {   /* sizeof 112 */
public:
    BOOL OwnDat;                        /* +0x0 */
    int TexNum;                         /* +0x4 */
    int LastFrame;                      /* +0x8 */
    BOOL DatLoaded;                     /* +0xC */
    long hndDat;                        /* +0x10 */
    long hndHdr;                        /* +0x14 */
    long hndPalOffset;                  /* +0x18 */
    long hndCreatureOffset;             /* +0x1C */
    long hndBlockOffsets;               /* +0x20 */
    FRAME_HDR *Frames;                  /* +0x24 */
    SPR_HDR *Hdr;                       /* +0x28 */
    void *Pals;                         /* +0x2C */
    int *PalOffset;                     /* +0x30 */
    int *CreatureOffset;                /* +0x34 */
    unsigned char *CreatureAnims;       /* +0x38 */
    unsigned char *Blocks;              /* +0x3C */
    BOOL Loaded;                        /* +0x40 */
    int LoadCount;                      /* +0x44 */
    CTextFileInfo *FileInfo;            /* +0x48 */
    long hndDecompBuffer;               /* +0x4C */
    int DecX;                           /* +0x50 */
    int DecY;                           /* +0x54 */
    int PalX;                           /* +0x58 */
    int PalY;                           /* +0x5C */
    int Scr;                            /* +0x60 */
    int NumOfBuffers[2];                /* +0x64 */
    long hndDecompArrays;               /* +0x6C */

    FRAME_HDR *GetFr(int FrNum) { return Frames + (unsigned short)FrNum; }
    PAL *GetPal(int PalNum) { return (PAL *)((unsigned char *)Pals + PalOffset[PalNum]); }
    inline void DumpDatFile();
};
/* GMAN.H:290-296 -- never called here; compiling it emits "psxsrc/gman.h" into .DIALOG_rdata */
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

class Dialog {   /* sizeof 16 */
public:
    int BevelGfx;       /* +0x0 */
    int BorderGfx;      /* +0x4 */
    int BackGfx;        /* +0x8 */
    int DialogOTpos;    /* +0xC */

    void GetSizes();
    void Back(int DX, int DY, int DW, int DH);
    void Line(int DX, int DY, int DW);
    int SetOTpos(int OT);
};

/* ---------------------------------------------------------------- externals ---- */
extern "C" unsigned long GU_GetRnd(void);
TextDat *GM_UseTexData(int Id);
POLY_G4 *PRIM_GetNextPolyG4(void);
POLY_FT4 *PRIM_GetNextPolyFt4(void);
POLY_GT4 *PRIM_GetNextPolyGt4(void);
extern unsigned long *ThisOt;

/* ---------------------------------------------------------------- TU data ---- */
static char GShadePX = 0;                   /* @0x8011ABF5 */
static char GShadePY = 0;                   /* @0x8011ABF6 */
unsigned char BORDERR = 0xF0;               /* @0x8011ABF7 */
unsigned char BORDERG = 0xB8;               /* @0x8011ABF8 */
unsigned char BORDERB = 0xA0;               /* @0x8011ABF9 */
unsigned char BACKR = 0x80;                 /* @0x8011ABFA */
unsigned char BACKG = 0x80;                 /* @0x8011ABFB */
unsigned char BACKB = 0x84;                 /* @0x8011ABFC */
unsigned char DialogRed = 0;                /* @0x8011ABFD */
unsigned char DialogGreen = 0;              /* @0x8011ABFE */
unsigned char DialogBlue = 0;               /* @0x8011ABFF */
unsigned char DialogTRed = 0;               /* @0x8011AC00 */
unsigned char DialogTGreen = 0;             /* @0x8011AC01 */
unsigned char DialogTBlue = 0;              /* @0x8011AC02 */
TextDat *DialogTData = 0;                   /* @0x8011AC04 */
int DialogBackGfx = 0;                      /* @0x8011AC08 */
int DialogBackW = 0;
int DialogBackH = 0;
int DialogBorderGfx = 0;
int DialogBorderTLW = 0;
int DialogBorderTLH = 0;
int DialogBorderTRW = 0;
int DialogBorderTRH = 0;
int DialogBorderBLW = 0;
int DialogBorderBLH = 0;
int DialogBorderBRW = 0;
int DialogBorderBRH = 0;
int DialogBorderTW = 0;
int DialogBorderTH = 0;
int DialogBorderBW = 0;
int DialogBorderBH = 0;
int DialogBorderLW = 0;
int DialogBorderLH = 0;
int DialogBorderRW = 0;
int DialogBorderRH = 0;
int DialogBevelGfx = 0;
int DialogBevelCW = 0;
int DialogBevelCH = 0;
int DialogBevelLRW = 0;
int DialogBevelLRH = 0;
int DialogBevelUDW = 0;
int DialogBevelUDH = 0;
int MY_DialogOTpos = 0;                     /* @0x8011AC74 */
static char GShadeTab[64] = {               /* @0x800B8AD0 .data */
    -16, -24, 0, -20, -10, -40, -30, -11, -25, -47, -6, -12, -6, -54, 0, -31,
    -20, -53, 68, -35, -5, -11, 22, -18, -25, 37, -16, 0, -4, -41, 23, -31,
    -34, 0, -38, 0, 18, 1, -5, -18, -34, 0, 8, -45, 50, -8, 50, -30,
    -45, -59, -22, 14, 4, 35, 38, -11, 0, 3, 22, -7, -20, -7, 0, 0,
};
int Cxy[28];                                /* @0x800B8B10 .data (uninitialized: emitted after) */
static unsigned char DialogGBack;           /* @0x8011C64C sbss */
static char GShadeX;                        /* @0x8011C64D */
static char GShadeY;                        /* @0x8011C64E */
static unsigned char RandBTab[8];           /* @0x8011C654 */

/* @0x8008AD90 DIALOG.CPP:112 */
short TrimCol(short col)
{
    if (col < 0)
        col = 0;
    if (col > 255)
        col = 255;
    return col;
}

/* @0x8008ADC8 DIALOG.CPP:206 */
POLY_GT4 *DialogPrint(int Frm, int X, int Y, int SW, int SH, int UW, int UH, int UOfs, int VOfs, int Trans)
{
    FRAME_HDR *Fr;
    POLY_GT4 *GT4 = NULL;
    POLY_FT4 *FT4;
    TP_LOAD_HDR *Tp;
    int x0, x1, x2, x3, y0, y1, y2, y3;
    int u0, u1, u2, u3, v0, v1, v2, v3;
    int U, V, W, H;

    Frm &= 0xFFFF;
    if (DialogGBack == 2) {
        if ((RandBTab[(char)(GShadeY % 8)] >> (GShadeX % 8)) & 1) {
            if (Frm == 7)
                Frm = 14;
            if (Frm == 12)
                Frm = 17;
            if (Frm == 10)
                Frm = 16;
            if (Frm == 9)
                Frm = 15;
        }
    }
    Fr = DialogTData->GetFr(Frm);
    W = Fr->W;
    H = Fr->H;
    X += Fr->X;
    Y += Fr->Y;
    Tp = (TP_LOAD_HDR *)Fr;
    U = Tp->U;
    V = Tp->V;
    if (!(((unsigned long *)Fr)[1] & 0x2000000)) {
        x0 = X;
        x1 = X + SW;
        y0 = Y;
        u0 = U;
        v0 = V;
        u1 = u0 + W + UOfs;
        y1 = y0;
        x2 = x0;
        u2 = u0;
        y2 = y1 + SH;
        v1 = v0;
        v2 = v1 + H + VOfs;
        x3 = x1;
        y3 = y2;
        u3 = u1;
        v3 = v2;
    } else {
        x0 = X - 1;
        x1 = X + SW - 1;
        y0 = Y;
        u0 = U;
        v0 = V + W + UOfs - 1;
        u1 = u0;
        y1 = y0;
        x2 = x0;
        u2 = u1 + H + VOfs;
        y2 = y1 + SH;
        v1 = V;
        v2 = v0;
        x3 = x1;
        y3 = y2;
        u3 = u2;
        v3 = v1;
    }
    if (DialogGBack == 0) {
        FT4 = PRIM_GetNextPolyFt4();
        FT4->u0 = u0;
        FT4->v0 = v0;
        FT4->u1 = u1;
        FT4->v1 = v1;
        FT4->u2 = u2;
        FT4->v2 = v2;
        FT4->u3 = u3;
        FT4->v3 = v3;
        FT4->x0 = x0;
        FT4->y0 = y0;
        FT4->x1 = x1;
        FT4->y1 = y1;
        FT4->x2 = x2;
        FT4->y2 = y2;
        FT4->x3 = x3;
        FT4->y3 = y3;
        {
            PAL *Pal = DialogTData->GetPal(Fr->PalNum);
            if (Pal->InVram)
                FT4->clut = ((unsigned short *)Pal)[1];
            else if (!(!"Pallete Prob!!"))
                DBG_Error(NULL, "psxsrc/DIALOG.CPP", 0x13A);
        }
        setlen(FT4, 9);
        setcode(FT4, 0x2C);
        if (Trans)
            setcode(FT4, 0x2E);
        FT4->code &= ~1;
        if (Frm == 0x94) {
            FT4->r0 = DialogTRed;
            FT4->g0 = DialogTGreen;
            FT4->b0 = DialogTBlue;
            FT4->u1 = FT4->u0 + 1;
            FT4->u3 = FT4->u0 + 1;
            FT4->v2 = FT4->v0 + 1;
            FT4->v3 = FT4->v0 + 1;
            FT4->tpage = ((FRAME_TP *)Fr)->Tpage | 0x40;
        } else {
            FT4->r0 = DialogRed;
            FT4->g0 = DialogGreen;
            FT4->b0 = DialogBlue;
            FT4->tpage = ((FRAME_TP *)Fr)->Tpage;
        }
        addPrim(ThisOt + MY_DialogOTpos, FT4);
    } else {
        short G1, G2, G3, G4;

        GT4 = PRIM_GetNextPolyGt4();
        GT4->u0 = u0;
        GT4->v0 = v0;
        GT4->u1 = u1;
        GT4->v1 = v1;
        GT4->u2 = u2;
        GT4->v2 = v2;
        GT4->u3 = u3;
        GT4->v3 = v3;
        GT4->x0 = x0;
        GT4->y0 = y0;
        GT4->x1 = x1;
        GT4->y1 = y1;
        GT4->x2 = x2;
        GT4->y2 = y2;
        GT4->x3 = x3;
        GT4->y3 = y3;
        {
            PAL *Pal = DialogTData->GetPal(Fr->PalNum);
            if (Pal->InVram)
                GT4->clut = ((unsigned short *)Pal)[1];
            else if (!(!"Pallete Prob!!"))
                DBG_Error(NULL, "psxsrc/DIALOG.CPP", 0x161);
        }
        setlen(GT4, 12);
        setcode(GT4, 0x3C);
        if (Trans)
            setcode(GT4, 0x3E);
        GT4->code &= ~1;
        G1 = GShadeTab[(char)(GShadeY % 8) * 8 + (char)(GShadeX % 8)];
        G2 = GShadeTab[(char)(GShadeY % 8) * 8 + (char)(GShadeX % 8) + 1];
        G3 = GShadeTab[(char)((GShadeY + 1) % 8) * 8 + (char)(GShadeX % 8)];
        G4 = GShadeTab[(char)((GShadeY + 1) % 8) * 8 + (char)(GShadeX % 8) + 1];
        if (DialogGBack == 2) {
            GT4->r0 = TrimCol(DialogRed - G1);
            GT4->g0 = TrimCol(DialogGreen - G1);
            GT4->b0 = TrimCol(DialogBlue - G1);
            GT4->r1 = TrimCol(DialogRed - G2);
            GT4->g1 = TrimCol(DialogGreen - G2);
            GT4->b1 = TrimCol(DialogBlue - G2);
            GT4->r2 = TrimCol(DialogRed - G3);
            GT4->g2 = TrimCol(DialogGreen - G3);
            GT4->b2 = TrimCol(DialogBlue - G3);
            GT4->r3 = TrimCol(DialogRed - G4);
            GT4->g3 = TrimCol(DialogGreen - G4);
            GT4->b3 = TrimCol(DialogBlue - G4);
        } else {
            GT4->r0 = TrimCol(BACKR + G1);
            GT4->g0 = TrimCol(BACKG + G1);
            GT4->b0 = TrimCol(BACKB + G1);
            GT4->r1 = TrimCol(BACKR + G2);
            GT4->g1 = TrimCol(BACKG + G2);
            GT4->b1 = TrimCol(BACKB + G2);
            GT4->r2 = TrimCol(BACKR + G3);
            GT4->g2 = TrimCol(BACKG + G3);
            GT4->b2 = TrimCol(BACKB + G3);
            GT4->r3 = TrimCol(BACKR + G4);
            GT4->g3 = TrimCol(BACKG + G4);
            GT4->b3 = TrimCol(BACKB + G4);
        }
        GT4->tpage = ((FRAME_TP *)Fr)->Tpage;
        addPrim(ThisOt + MY_DialogOTpos, GT4);
    }
    return GT4;
}

/* @0x8008B748 DIALOG.CPP:393 */
POLY_G4 *GetDropShadowG4(unsigned char r0, unsigned char g0, unsigned char b0, unsigned char r1, unsigned char g1, unsigned char b1, unsigned char r2, unsigned char g2, unsigned char b2, unsigned char r3, unsigned char g3, unsigned char b3)
{
    POLY_G4 *G4 = PRIM_GetNextPolyG4();

    setlen(G4, 8);
    setcode(G4, 0x3A);
    G4->r0 = r0;
    G4->g0 = g0;
    G4->b0 = b0;
    G4->r1 = r1;
    G4->g1 = g1;
    G4->b1 = b1;
    G4->r2 = r2;
    G4->g2 = g2;
    G4->b2 = b2;
    G4->r3 = r3;
    G4->g3 = g3;
    G4->b3 = b3;
    addPrim(ThisOt + MY_DialogOTpos, G4);
    return G4;
}

/* @0x8008B880 DIALOG.CPP:408 */
void DropShadows(int x, int y, int w, int h)
{
    POLY_G4 *G4;
    unsigned char dbr = BACKR / 7;
    unsigned char dbg = BACKG / 7;
    unsigned char dbb = BACKB / 7;
    unsigned char br = BACKR >> 1;
    unsigned char bg = BACKG >> 1;
    unsigned char bb = BACKB >> 1;

    G4 = GetDropShadowG4(dbr, dbg, dbb, dbr, dbg, dbb, br, bg, bb, br, bg, bb);
    G4->x0 = x;
    G4->y0 = y;
    G4->x1 = x + w;
    G4->y1 = y;
    G4->x2 = x + 4;
    G4->y2 = y + 4;
    G4->x3 = x + w - 4;
    G4->y3 = y + 4;
    G4 = GetDropShadowG4(br, bg, bb, dbr, dbg, dbb, br, bg, bb, dbr, dbg, dbb);
    G4->x0 = x + w - 4;
    G4->y0 = y + 4;
    G4->x1 = x + w;
    G4->y1 = y;
    G4->x2 = x + w - 4;
    G4->y2 = y + h - 4;
    G4->x3 = x + w;
    G4->y3 = y + h;
    G4 = GetDropShadowG4(br, bg, bb, br, bg, bb, dbr, dbg, dbb, dbr, dbg, dbb);
    G4->x0 = x + 4;
    G4->y0 = y + h - 4;
    G4->x1 = x + w - 4;
    G4->y1 = y + h - 4;
    G4->x2 = x;
    G4->y2 = y + h;
    G4->x3 = x + w;
    G4->y3 = y + h;
    G4 = GetDropShadowG4(dbr, dbg, dbb, br, bg, bb, dbr, dbg, dbb, br, bg, bb);
    G4->x0 = x;
    G4->y0 = y;
    G4->x1 = x + 4;
    G4->y1 = y + 4;
    G4->x2 = x;
    G4->y2 = y + h;
    G4->x3 = x + 4;
    G4->y3 = y + h - 4;
}

/* @0x8008BB24 DIALOG.CPP:476 */
void InitDialog()
{
    for (int i = 0; i < 6; i++)
        GU_GetRnd();
    for (int y = 0; y < 8; y++) {
        unsigned char bits = 0;
        for (int x = 0; x < 8; x++) {
            if (GU_GetRnd() % 3 == 0)
                bits |= 1;
            bits <<= 1;
        }
        RandBTab[y] = bits;
    }
    for (int i = 0; i < 14; i++) {
        Cxy[i * 2] = GU_GetRnd() % 224 + 16;
        Cxy[i * 2 + 1] = GU_GetRnd() % 144;
    }
}

/* @0x8008BC5C DIALOG.CPP:499 */
void Dialog::GetSizes()
{
    FRAME_HDR *Fr;

    DialogTData = GM_UseTexData(0);
    DialogBackGfx = BackGfx;
    Fr = DialogTData->GetFr(DialogBackGfx);
    DialogBackW = Fr->W;
    DialogBackH = Fr->H;
    DialogBorderGfx = BorderGfx;
    Fr = DialogTData->GetFr(DialogBorderGfx);
    DialogBorderTLW = Fr->W;
    DialogBorderTLH = Fr->H;
    Fr = DialogTData->GetFr(DialogBorderGfx + 2);
    DialogBorderTRW = Fr->W;
    DialogBorderTRH = Fr->H;
    Fr = DialogTData->GetFr(DialogBorderGfx + 5);
    DialogBorderBLW = Fr->W;
    DialogBorderBLH = Fr->H;
    Fr = DialogTData->GetFr(DialogBorderGfx + 7);
    DialogBorderBRW = Fr->W;
    DialogBorderBRH = Fr->H;
    Fr = DialogTData->GetFr(DialogBorderGfx + 1);
    DialogBorderTW = Fr->W;
    DialogBorderTH = Fr->H;
    Fr = DialogTData->GetFr(DialogBorderGfx + 6);
    DialogBorderBW = Fr->W;
    DialogBorderBH = Fr->H;
    Fr = DialogTData->GetFr(DialogBorderGfx + 3);
    DialogBorderLW = Fr->W;
    DialogBorderLH = Fr->H;
    Fr = DialogTData->GetFr(DialogBorderGfx + 4);
    DialogBorderRW = Fr->W;
    DialogBorderRH = Fr->H;
    DialogBevelGfx = BevelGfx;
    Fr = DialogTData->GetFr(DialogBevelGfx);
    DialogBevelCW = Fr->W;
    DialogBevelCH = Fr->H;
    Fr = DialogTData->GetFr(DialogBevelGfx + 1);
    DialogBevelUDW = Fr->W;
    DialogBevelUDH = Fr->H;
    Fr = DialogTData->GetFr(DialogBevelGfx + 3);
    DialogBevelLRW = Fr->W;
    DialogBevelLRH = Fr->H;
    MY_DialogOTpos = DialogOTpos;
}

/* @0x8008BEE0 DIALOG.CPP:569 -- OPEN: not reconstructed yet (1094-insn tiler) */

/* @0x8008CFF8 DIALOG.CPP:999 */
void Dialog::Line(int DX, int DY, int DW)
{
    int X, Y, W, Bx, Xr, Xl;
    RECT ClipRect;
    char trans = 0;

    DialogGBack = 0;
    GetSizes();
    X = DX;
    Y = DY;
    W = DW;
    DialogGBack = 0;
    if (DialogBorderGfx != 18)
        DialogGBack = 2;
    GShadeX = 1;
    GShadeY = 1;
    if (DW >= DialogBorderTW) {
        Bx = DW / 2 - DialogBorderTW / 2;
        Xr = Bx % DialogBorderTW;
        GShadeX = 1;
        if (Xr > 0) {
            GShadeY = 1;
            DialogPrint(DialogBorderGfx + 1, DX, DY - DialogBorderTH, Xr, DialogBorderTH, Xr, DialogBorderTH, 0, 0, trans);
        }
        GShadeX++;
        Bx = Xr;
        if (DialogBorderTW < DW) {
            for (Xl = 0; Xl < (DW - Xr) / DialogBorderTW; Xl++) {
                GShadeY = 1;
                DialogPrint(DialogBorderGfx + 1, X + Bx, Y - DialogBorderTH, DialogBorderTW, DialogBorderTH, DialogBorderTW, DialogBorderTH, 0, 0, trans);
                GShadeX++;
                Bx += DialogBorderTW;
            }
        }
        Xl = W - Bx;
        if (Xl > 0) {
            GShadeY = 1;
            DialogPrint(DialogBorderGfx + 1, X + Bx, Y - DialogBorderTH, Xl, DialogBorderTH, Xl, DialogBorderTH, 0, 0, trans);
        }
    } else {
        Xr = DW % DialogBorderTW;
        GShadeX = 1;
        if (Xr > 0) {
            GShadeY = 1;
            DialogPrint(DialogBorderGfx + 1, DX, DY - DialogBorderTH, Xr, DialogBorderTH, Xr, DialogBorderTH, 0, 0, trans);
        }
    }
}

/* @0x8008D228 DIALOG.CPP:1099 */
int Dialog::SetOTpos(int OT)
{
    int OldOT = DialogOTpos;

    DialogOTpos = OT;
    MY_DialogOTpos = OT;
    return OldOT;
}
