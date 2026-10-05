/* PSXSRC/GPANEL.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC, splat segment gpanel).
 * No PC twin: the bottom status panel (health/mana flasks, spell icon, speed/belt bar, message
 * window, equipment-durability icons) — GPanel::Print drives the per-frame draw.
 * Reconstructed from the retail oracle disassembly plus the m2c/Hex-Rays drafts recorded in
 * skel/PSXSRC/GPANEL.CPP (generated from the retail SYM before this file existed).
 * Field layouts (PanelXY, GPanel, PlayerStruct, ItemStruct slices, POLY_FT4) are read directly
 * off the retail SYM (STRTAG/MOS records) or matched to recon/source/gen/structs_player.h and
 * the existing psxsrc/block.cpp POLY_FT4 — not guessed. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"

/* ---- shared game-engine layouts (kept minimal/local) ---- */

struct FRAME_HDR {   /* retail SYM: sizeof 12 */
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
struct PAL {   /* retail SYM: sizeof 8 */
    unsigned int InVram : 1;
    unsigned int NumOfCols : 31;
    unsigned short Cols[1];
};

struct TextDat {   /* sizeof 112 -- matches block.cpp's TextDat (its owner); only fields/methods
                       this TU's out-of-line accessor copies touch are declared. */
    BOOL OwnDat;
    int TexNum, LastFrame;
    BOOL DatLoaded;
    long hndDat, hndHdr, hndPalOffset, hndCreatureOffset, hndBlockOffsets;
    struct FRAME_HDR *Frames;   /* +0x24 */
    unsigned char pad1[0x2C - 0x28];
    void *Pals;                 /* +0x2C */
    int *PalOffset;             /* +0x30 */
    unsigned char pad2[112 - 0x34];

    struct FRAME_HDR *GetFr(int FrNum)
    {
        return (struct FRAME_HDR *)((char *)Frames + (FrNum & 0xFFFF) * 0xC);
    }
    PAL *GetPal(int PalNum)
    {
        return (PAL *)((char *)Pals + PalOffset[PalNum]);
    }
    struct POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
    void DumpDatFile();
};

/* Original GMAN.H / CPLAYER.H inlines: unused bodies naturally retain their
 * filename literals before DrawSpell's initializer pool. */
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}
class CPlayer : public TextDat {
public:
    long hndDatMem;
    unsigned short NumOfPlayers;
    BOOL InTown;
    unsigned short PlayerNum, Tpage;
    int TexId, LastScrX, LastScrY, LastOtPos;
    static CPlayer *PActiveArray[2];
    static CPlayer *GetPlayer(int PNum)
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }
};

struct PanelXY {   /* sizeof 88, real field names from the retail SYM STRTAG record */
    int MainX;                  /* +0x0 */
    int MainY;                  /* +0x4 */
    int FlaskFlip;               /* +0x8 */
    int SpeedBarXOfs;            /* +0xC */
    int SpeedBarYOfs;            /* +0x10 */
    int SpellXOfs;               /* +0x14 */
    int SpellYOfs;                /* +0x18 */
    int LevelUpXOfs;              /* +0x1C */
    int LevelUpYOfs;               /* +0x20 */
    int MsgX;                    /* +0x24 */
    int MsgY;                    /* +0x28 */
    int MsgW;                    /* +0x2C */
    int MsgH;                    /* +0x30 */
    int HeadDurX;                 /* +0x34 */
    int HeadDurY;                  /* +0x38 */
    int BodyDurX;                  /* +0x3C */
    int BodyDurY;                   /* +0x40 */
    int Hand0DurX;                  /* +0x44 */
    int Hand0DurY;                   /* +0x48 */
    int Hand1DurX;                   /* +0x4C */
    int Hand1DurY;                    /* +0x50 */
    unsigned char WhichPlayerDoesThisPanelReallyBelongToThen;   /* +0x54 */
};

/* Retail GPANEL.DATA: four PanelXY layouts followed by DurColors.
 * The final byte member's three trailing bytes are ordinary struct padding. */
PanelXY DefP1PanelXY = { /* @0x800B9A6C */
    24, 200, 0, -12, -1, -9, -80, -8, -112,
    162, 166, 144, 52, 44, 176, 70, 176, 96, 176, 122, 176, 1
};
PanelXY DefP1PanelXY2 = { /* @0x800B9AC4 */
    24, 200, 0, -12, -1, -9, -80, -8, -112,
    12, 24, 140, 104, 44, 176, 70, 176, 96, 176, 122, 176, 1
};
PanelXY DefP2PanelXY = { /* @0x800B9B1C */
    294, 200, 1, -125, -1, -9, -80, -8, -112,
    12, 166, 140, 52, 178, 176, 204, 176, 230, 176, 256, 176, 2
};
PanelXY DefP2PanelXY2 = { /* @0x800B9B74 */
    294, 200, 1, -125, -1, -9, -80, -8, -112,
    166, 24, 140, 104, 178, 176, 204, 176, 230, 176, 256, 176, 2
};

class CBlocks {
public:
    static int GetMaxOtPos() { return 0x1FF; }
};

struct GPanel {   /* sizeof 28 per retail SYM (fields from the SYM STRTAG record) */
    int HealthAnimCount;    /* +0x0 */
    int ManaAnimCount;      /* +0x4 */
    int GlobeAnimCount;     /* +0x8 */
    struct RECT MsgRect;    /* +0xC */
    struct TextDat *PanelTData;   /* +0x14 */
    int GPanelOt;           /* +0x18 */

    GPanel(int Ofs);
    unsigned int GetPal(int Frm);
    void DrawFlask(struct PanelXY *XY, struct PlayerStruct *Plr);
    void DrawSpell(struct PanelXY *XY, struct PlayerStruct *Plr);
    void DrawSpeedBar(struct PanelXY *XY, struct PlayerStruct *Plr);
    void DrawMsgWindow(struct PanelXY *XY, struct PlayerStruct *Plr);
    int DrawDurThingy(int X, int Y, struct ItemStruct *Item, int ItemType);
    void DrawDurIcon(struct PanelXY *XY, struct PlayerStruct *Plr);
    void Print(struct PanelXY *XY, struct PlayerStruct *Plr);
};

/* ItemStruct field slice (offsets from structs_player.h) */
struct ItemStruct {
    unsigned char pad0[0x2C];
    short _itype;         /* +0x2C */
    unsigned char pad1[0x3E - 0x2E];
    short _iDurability;   /* +0x3E */
    short _iMaxDur;       /* +0x40 */
    unsigned char pad2[0x4C - 0x42];
    unsigned char _iCurs; /* +0x4C */
    unsigned char pad3[108 - 0x4D];   /* sizeof ItemStruct = 108 */
};

/* PlayerStruct field slice (offsets from structs_player.h) */
struct PlayerStruct {
    unsigned char pad0[0x54];
    unsigned char _pClassGfx;   /* +0x54 -- spell class index used by spspelstate[] */
    unsigned char pad1[0x64 - 0x55];
    int _pRSpell;               /* +0x64 -- current spell icon index */
    unsigned char pad2[0x11C - 0x68];
    long _pHitPoints;    /* +0x11C */
    long _pMaxHP;        /* +0x120 */
    unsigned char pad3[0x130 - 0x124];
    long _pMana;         /* +0x130 */
    long _pMaxMana;      /* +0x134 */
    unsigned char pad4[0x1B0 - 0x138];
    struct ItemStruct InvBody[7];   /* +0x1B0 (0=head,4=lhand,5=rhand,6=chest) */
    unsigned char pad5[0x15B0 - (0x1B0 + 7 * 108)];
    struct ItemStruct SpdList[8]; /* +0x15B0 */
    unsigned char pad6[6632 - (0x15B0 + 8 * 108)];   /* sizeof PlayerStruct = 6632 */
};

extern "C" int GM_UseTexData__Fi(int Id);
extern "C" BOOL GLUE_Finished__Fv(void);
extern "C" int VID_GetTick__Fv(void);
extern "C" void DrawInfoBox__FP4RECT(struct RECT *R);
extern "C" POLY_G4 *PRIM_GetNextPolyG4__Fv(void);
extern "C" void DrawSpinner__FiiUcUcUciiibiT8T8Uc(int X, int Y, unsigned char R, unsigned char G, unsigned char B, int A, int C, int D, int E, int OtPos, int F, int G2, int H);

extern char stextflag;
extern unsigned char qtextflag, chrflag, questlog, invflag, sbookflag;
extern unsigned char gbMaxPlayers;
extern int spspelstate[4];
extern int _pcurr_inv[4];
extern int sel_data;
extern unsigned char _SpdBeltSelFlag[4];
extern int *ThisOt;
static unsigned char DurColors[6][3] = {
    {255, 0, 0}, {240, 64, 0}, {255, 255, 0},
    {255, 255, 255}, {0, 0, 0}, {0, 0, 0}
};
extern signed char SpellITbl[];
extern int InvGfxTable[];


/* TU-owned small data: speed-bar needle physics state (persists between frames) */
int D_8011AD94 = -64;
int D_8011AD98 = -23;
int D_8011AD9C = 19;
int D_8011ADA0 = 48;
int D_8011ADA4 = 4;
int D_8011ADA8 = 4;
int D_8011ADAC = 4;
int D_8011ADB0 = 4;

/* -------------------------------------------------------------------------------------------- */

unsigned int GPanel::GetPal(int Frm)
{
    struct FRAME_HDR *Fr;
    void *Pal;

    Fr = PanelTData->GetFr(Frm & 0xFFFF);
    Pal = PanelTData->GetPal(*((unsigned char *)Fr + 6));
    return *(unsigned short *)((char *)Pal + 2);
}

GPanel::GPanel(int Ofs)
{
    PanelTData = (struct TextDat *)GM_UseTexData__Fi(0);
    HealthAnimCount = Ofs + 1;
    ManaAnimCount = Ofs + 0x17;
    GlobeAnimCount = Ofs + 0xF;
    GPanelOt = CBlocks::GetMaxOtPos() - 2;
}

void GPanel::DrawFlask(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    int HealthHeight, ManaHeight;
    int HealthAnim, ManaAnim;
    int BarY;
    struct POLY_FT4 *Ft4;
    int X, Y;
    int xof;

    HealthHeight = (int)(Plr->_pHitPoints * 0x2B) / (int)Plr->_pMaxHP;
    HealthAnim = HealthAnimCount >> 2;
    ManaAnim = ManaAnimCount >> 2;
    X = XY->MainX;
    Y = XY->MainY;
    ManaHeight = 0;
    if (Plr->_pMana > 0) {
        if (Plr->_pMaxMana > 0) {
            ManaHeight = (int)(Plr->_pMana * 0x2B) / (int)Plr->_pMaxMana;
        }
    }
    if (HealthHeight >= 0x2C) {
        HealthHeight = 0x2B;
    }
    if (ManaHeight >= 0x2C) {
        ManaHeight = 0x2B;
    }
    if (HealthHeight < 0) {
        HealthHeight = 0;
    }
    if (ManaHeight < 0) {
        ManaHeight = 0;
    }

    Ft4 = PanelTData->PrintFt4(0x36, X, Y, 0, GPanelOt, 0);
    Ft4->r0 = 0x7F;
    Ft4->g0 = 0x7F;
    Ft4->b0 = 0x7F;
    Ft4->code = (Ft4->code | 2) & 0xFE;
    Ft4->tpage = Ft4->tpage | 0x20;
    Ft4 = PanelTData->PrintFt4(0x37, X, Y, 0, GPanelOt, 0);
    Ft4->r0 = 0x7F;
    Ft4->g0 = 0x7F;
    Ft4->b0 = 0x7F;
    Ft4->code = (Ft4->code | 2) & 0xFE;
    Ft4->tpage = Ft4->tpage | 0x20;
    PanelTData->PrintFt4(0x31, X, Y, XY->FlaskFlip, GPanelOt + 1, 0);
    PanelTData->PrintFt4(0x32, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x33, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x34, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x35, X, Y, 0, GPanelOt, 0);
    if (HealthHeight > 0) {
        BarY = -(HealthHeight + 8) + Y;
        if (!XY->FlaskFlip)
            xof = 0;
        else
            xof = 0x18;
        Ft4 = PanelTData->PrintFt4(0x38, X - 0xB + xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0x7F;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
        Ft4->y2 = (short)(Ft4->y0 + HealthHeight);
        Ft4->y3 = (short)(Ft4->y1 + HealthHeight);
        Ft4->u2 = (unsigned char)((Ft4->u0 + HealthHeight) - 1);
        Ft4->u3 = (unsigned char)((Ft4->u1 + HealthHeight) - 1);
        Ft4->code = Ft4->code & 0xFC;
        Ft4->tpage = Ft4->tpage | 0x20;
        Ft4 = PanelTData->PrintFt4(HealthAnim + 0x84, X - 0xB + xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0x7F;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
        Ft4->code = Ft4->code & 0xFC;
        Ft4->tpage = Ft4->tpage | 0x20;
    }
    if (ManaHeight > 0) {
        BarY = -(ManaHeight + 8) + Y;
        if (!XY->FlaskFlip)
            xof = 0;
        else
            xof = -2;
        Ft4 = PanelTData->PrintFt4(0x38, X + 2 + xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0;
        Ft4->g0 = 0;
        Ft4->b0 = 0x7F;
        Ft4->y2 = (short)(Ft4->y0 + ManaHeight);
        Ft4->y3 = (short)(Ft4->y1 + ManaHeight);
        Ft4->u2 = (unsigned char)((Ft4->u0 + ManaHeight) - 1);
        Ft4->u3 = (unsigned char)((Ft4->u1 + ManaHeight) - 1);
        Ft4->code = Ft4->code & 0xFC;
        Ft4->tpage = Ft4->tpage | 0x20;
        Ft4 = PanelTData->PrintFt4(ManaAnim + 0x8C, X + 2 + xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0;
        Ft4->g0 = 0;
        Ft4->b0 = 0x7F;
        Ft4->code = Ft4->code & 0xFC;
        Ft4->tpage = Ft4->tpage | 0x20;
    }
}

static unsigned char SpdTrimCol(short col)
{
    if (col < 0) col = 0;
    if (col > 255) col = 255;
    return col;
}

void GPanel::DrawSpeedBar(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    int X, Y, Loop;
    struct POLY_FT4 *Ft4;
    int Bx, By;

    X = XY->MainX;
    Y = XY->MainY;
    X += XY->SpeedBarXOfs;
    Y += XY->SpeedBarYOfs;
    if (_pcurr_inv[sel_data] != -1) {
        struct POLY_G4 *G4;
        D_8011AD94 += D_8011ADA4;
        D_8011AD98 += D_8011ADA8;
        D_8011AD9C += D_8011ADAC;
        D_8011ADA0 += D_8011ADB0;
        if (D_8011AD94 >= 0x41) {
            D_8011ADA4 = -4;
        }
        if (D_8011AD98 >= 0x41) {
            D_8011ADA8 = -4;
        }
        if (D_8011AD9C >= 0x41) {
            D_8011ADAC = -4;
        }
        if (D_8011ADA0 >= 0x41) {
            D_8011ADB0 = -4;
        }
        if (D_8011AD94 < -0x40) {
            D_8011ADA4 = 4;
        }
        if (D_8011AD98 < -0x40) {
            D_8011ADA8 = 4;
        }
        if (D_8011AD9C < -0x40) {
            D_8011ADAC = 4;
        }
        if (D_8011ADA0 < -0x40) {
            D_8011ADB0 = 4;
        }
        G4 = PRIM_GetNextPolyG4__Fv();
        setlen(G4, 8);
        setcode(G4, 0x38);
        /* Retail reads each vertex's selector before its coordinate stores. */
        const int selected = _pcurr_inv[sel_data];
        G4->y0 = Y;
        G4->x0 = X + selected * 0x11;
        const int selected1 = _pcurr_inv[sel_data];
        G4->y1 = Y;
        G4->x1 = X + selected1 * 0x11 + 0x11;
        const int selected2 = _pcurr_inv[sel_data];
        G4->y2 = Y + 0x14;
        G4->x2 = X + selected2 * 0x11;
        const int selected3 = _pcurr_inv[sel_data];
        G4->y3 = Y + 0x14;
        G4->x3 = X + selected3 * 0x11 + 0x11;
        G4->r0 = (unsigned char)SpdTrimCol((short)(D_8011AD94 + 0xBF)) >> 1;
        G4->g0 = SpdTrimCol(0);
        G4->b0 = SpdTrimCol((short)(D_8011AD94 + 0x80));
        G4->r1 = (unsigned char)SpdTrimCol((short)(D_8011AD98 + 0xBF)) >> 1;
        G4->g1 = SpdTrimCol(0);
        G4->b1 = SpdTrimCol((short)(D_8011AD98 + 0x80));
        G4->r2 = (unsigned char)SpdTrimCol((short)(D_8011AD9C + 0xBF)) >> 1;
        G4->g2 = SpdTrimCol(0);
        G4->b2 = SpdTrimCol((short)(D_8011AD9C + 0x80));
        G4->r3 = (unsigned char)SpdTrimCol((short)(D_8011ADA0 + 0xBF)) >> 1;
        G4->g3 = SpdTrimCol(0);
        G4->b3 = SpdTrimCol((short)(D_8011ADA0 + 0x80));
        addPrim(&ThisOt[GPanelOt - 2], G4);
        if (_SpdBeltSelFlag[sel_data] != 0) {
            DrawSpinner__FiiUcUcUciiibiT8T8Uc(X + _pcurr_inv[sel_data] * 0x11 + 5, Y + 0xD, 0xA0, 0x40, 0xF0, 0x20, 0x60, 0, 0, GPanelOt - 1, 1, 0, 8);
        }
    }
    Bx = X;
    By = Y;
    PanelTData->PrintFt4(0x99, Bx, By, 0, GPanelOt, 0);
    X += 0x11;
    Loop = 0;
    PanelTData->PrintFt4(0x9A, Bx, By, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x9B, Bx, By, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x9C, Bx, By, 0, GPanelOt, 0);
    for (; Loop < 6; Loop++) {
        PanelTData->PrintFt4(0x9D, X, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0x9E, X, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0x9F, X, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0xA0, X, Y, 0, GPanelOt, 0);
        X += 0x11;
    }
    PanelTData->PrintFt4(0xA1, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0xA2, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0xA3, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0xA4, X, Y, 0, GPanelOt, 0);
    Loop = 0;
    X = XY->MainX;
    Y = XY->MainY;
    const int InnerX = X + 2;
    const int InnerY = Y + 2;
    X = InnerX + XY->SpeedBarXOfs;
    Y = InnerY + XY->SpeedBarYOfs;
    do {
        if (Plr->SpdList[Loop]._itype != -1) {
            PanelTData->PrintFt4(InvGfxTable[Plr->SpdList[Loop]._iCurs], X, Y, 0, GPanelOt + 1, 0);
        }
        X += 0x11;
        Loop++;
    } while (Loop < 8);
    Ft4 = PanelTData->PrintFt4(0x94, Bx, By, 0, GPanelOt - 1, 0);
    setXYWH(Ft4, Bx + 1, By, 0x88, 0x14);
    Ft4->r0 = 0x14;
    Ft4->g0 = 0x14;
    Ft4->b0 = 0x14;
    Ft4->u1 = Ft4->u0 + 1;
    Ft4->u3 = Ft4->u0 + 1;
    Ft4->v2 = Ft4->v0 + 1;
    Ft4->v3 = Ft4->v0 + 1;
    Ft4->tpage |= 0x40;
    Ft4->code = (Ft4->code | 2) & 0xFE;
}

void GPanel::DrawSpell(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    int X, Y, Anim;
    struct POLY_FT4 *Ft4;
    int SpellNo;
    char YT[16] = "\000\000\001\001\001\001\001\000\000\000\377\377\377\377\377\000";

    Y = XY->MainY;
    X = XY->MainX + 1;
    Ft4 = PanelTData->PrintFt4(0xDA, (X + XY->SpellXOfs) - 5, (Y + XY->SpellYOfs) - 6, 0, GPanelOt, 0);
    Ft4->r0 = 0x7F;
    Ft4->g0 = 0x7F;
    Ft4->b0 = 0x7F;
    Ft4->code = (Ft4->code | 2) & 0xFE;
    Ft4->tpage = Ft4->tpage | 0x20;
    SpellNo = Plr->_pRSpell;
    if (SpellNo != -1) {
        Anim = HealthAnimCount >> 1;
        Y += YT[Anim];
        Ft4 = PanelTData->PrintFt4(SpellITbl[SpellNo] + 0xA5, X + XY->SpellXOfs, Y + XY->SpellYOfs, 0, GPanelOt, 0);
        if (VID_GetTick__Fv() & 1) {
            Ft4->r0 = (char)0x80;
            Ft4->g0 = (char)0x80;
            Ft4->b0 = (char)0x80;
        } else {
            Ft4->r0 = (char)0x9C;
            Ft4->g0 = (char)0xA0;
            Ft4->b0 = (char)0xA0;
        }
    }
}

void GPanel::DrawMsgWindow(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    (void)Plr;
    MsgRect.x = (short)XY->MsgX;
    MsgRect.y = (short)XY->MsgY;
    MsgRect.w = (short)XY->MsgW;
    MsgRect.h = (short)XY->MsgH;
    DrawInfoBox__FP4RECT(&MsgRect);
}

int GPanel::DrawDurThingy(int X, int Y, struct ItemStruct *Item, int ItemType)
{
    struct POLY_FT4 *Ft4;
    unsigned char NewR, NewG, NewB;

    if (Item->_itype == -1 || Item->_iDurability >= 5) {
        return 0;
    }
    switch ((short)(Item->_itype - 1)) {
    case 4:
        ItemType = 0;
        break;
    case 0:
        ItemType = 1;
        break;
    case 1:
        ItemType = 5;
        break;
    case 2:
        ItemType = 6;
        break;
    case 3:
        ItemType = 4;
        break;
    case 9:
        ItemType = 7;
        break;
    }
    {   /* retail SYM: Loop is declared in a block opening after the switch */
        int Loop;
        Ft4 = PanelTData->PrintFt4(ItemType + 0x29, X, Y, 0, GPanelOt + 1, 0);
        NewR = DurColors[Item->_iDurability - 1][0];
        NewG = DurColors[Item->_iDurability - 1][1];
        NewB = DurColors[Item->_iDurability - 1][2];
        Ft4->code = (Ft4->code | 2) & 0xFE;
        Ft4->r0 = NewR;
        Ft4->g0 = NewG;
        Ft4->b0 = NewB;

        Ft4 = PanelTData->PrintFt4(0x94, X, Y, 0, GPanelOt + 1, 0);
        setXYWH(Ft4, X + 0x14, Y - 2, 4, 25);
        Ft4->r0 = 0;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
        Ft4->code = (Ft4->code | 2) & 0xFE;

        for (Loop = 0; Loop < Item->_iDurability; Loop++) {
            Ft4 = PanelTData->PrintFt4(0x94, X, Y, 1, GPanelOt + 1, 0);
            NewR = DurColors[Loop][0];
            NewG = DurColors[Loop][1];
            NewB = DurColors[Loop][2];
            setXYWH(Ft4, X + 0x15, (short)(Y - 1) + (3 - Loop) * 5, 2, 5);
            Ft4->r0 = NewR;
            Ft4->g0 = NewG;
            Ft4->b0 = NewB;
            Ft4->code = (Ft4->code | 2) & 0xFE;
        }
    }
    return 1;
}

void GPanel::DrawDurIcon(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    int X, Y;

    if ((chrflag != 0 || questlog != 0) && (invflag != 0 || sbookflag != 0)) {
        return;
    }
    if (gbMaxPlayers != 1 && spspelstate[XY->WhichPlayerDoesThisPanelReallyBelongToThen] != 0) {
        return;
    }
    X = XY->HeadDurX;
    Y = XY->HeadDurY;
    DrawDurThingy(X, Y, &Plr->InvBody[0], 3);
    X = XY->BodyDurX;
    Y = XY->BodyDurY;
    DrawDurThingy(X, Y, &Plr->InvBody[6], 2);
    X = XY->Hand0DurX;
    Y = XY->Hand0DurY;
    DrawDurThingy(X, Y, &Plr->InvBody[4], -1);
    X = XY->Hand1DurX;
    Y = XY->Hand1DurY;
    DrawDurThingy(X, Y, &Plr->InvBody[5], -1);
}

void GPanel::Print(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    if (GLUE_Finished__Fv() == 0 && stextflag == 0 && qtextflag == 0) {
        if (chrflag == 0 && questlog == 0 && invflag == 0) {
            DrawFlask(XY, Plr);
            DrawSpell(XY, Plr);
            DrawSpeedBar(XY, Plr);
            DrawMsgWindow(XY, Plr);
            DrawDurIcon(XY, Plr);
        }
        HealthAnimCount = (HealthAnimCount + 1) & 0x1F;
        ManaAnimCount = (ManaAnimCount + 1) & 0x1F;
    }
}

/* ---- merge alternates (claude/cool-knuth-frvuxm into master, 2026-09-28): the losing side of each
 * conflict hunk, kept for reference. Winner = PASS (bytes+SYM) first, then SLD line agreement. ---- */
#if 0 /* MERGE ALT SpdTrimCol: master side -- lost because: both PASS; branch SLD span 4 == retail 4, master 8 */
    if ((col << 16) < 0) {
        col = 0;
    }
    if (col >= 0x100) {
        col = 0xFF;
    }
#endif
