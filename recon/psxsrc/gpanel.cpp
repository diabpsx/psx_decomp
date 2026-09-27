/* PSXSRC/GPANEL.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC, splat segment gpanel).
 * No PC twin: the bottom status panel (health/mana flasks, spell icon, speed/belt bar, message
 * window, equipment-durability icons) — GPanel::Print drives the per-frame draw.
 * Reconstructed from the retail oracle disassembly plus the m2c/Hex-Rays drafts recorded in
 * skel/PSXSRC/GPANEL.CPP (generated from the retail SYM before this file existed).
 * Field layouts (PanelXY, GPanel, PlayerStruct, ItemStruct slices, POLY_FT4) are read directly
 * off the retail SYM (STRTAG/MOS records) or matched to recon/source/gen/structs_player.h and
 * the existing psxsrc/block.cpp POLY_FT4 — not guessed. */
#include "diabpsx_types.h"

/* ---- shared game-engine layouts (kept minimal/local; matches block.cpp/davel.cpp's POLY_FT4) ---- */
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

struct RECT { short x, y, w, h; };   /* sizeof 8 */

struct FRAME_HDR;   /* opaque; only used as a pointer, +6 is a UCHAR palette-index field */

struct TextDat {   /* sizeof 112 -- matches block.cpp's TextDat (its owner); only fields/methods
                       this TU's out-of-line accessor copies touch are declared. */
    unsigned char pad0[0x24];
    struct FRAME_HDR *Frames;   /* +0x24 */
    unsigned char pad1[0x2C - 0x28];
    void *Pals;                 /* +0x2C */
    int *PalOffset;             /* +0x30 */
    unsigned char pad2[112 - 0x34];

    struct FRAME_HDR *GetFr(int FrNum);
    void *GetPal(int PalNum);
    struct POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
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
    unsigned short GetPal(int Frm);
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
    unsigned char pad2[108 - 0x42];   /* sizeof ItemStruct = 108 */
};

/* PlayerStruct field slice (offsets from structs_player.h) */
struct PlayerStruct {
    unsigned char pad0[0x54];
    unsigned char _pClassGfx;   /* +0x54 -- spell class index used by spspelstate[] */
    unsigned char pad1[0x64 - 0x55];
    int _pTSpellGfx;            /* +0x64 -- current spell icon index */
    unsigned char pad2[0x11C - 0x68];
    long _pHitPoints;    /* +0x11C */
    long _pMaxHP;        /* +0x120 */
    unsigned char pad3[0x130 - 0x124];
    long _pMana;         /* +0x130 */
    long _pMaxMana;      /* +0x134 */
    unsigned char pad4[0x1B0 - 0x138];
    struct ItemStruct InvBody[7];   /* +0x1B0 (0=head,4=lhand,5=rhand,6=chest) */
    unsigned char pad5[6632 - (0x1B0 + 7 * 108)];   /* sizeof PlayerStruct = 6632 */
};

extern "C" int GM_UseTexData__Fi(int Id);
extern "C" int GLUE_Finished__Fv(void);
extern "C" int VID_GetTick__Fv(void);
extern "C" void DrawInfoBox__FP4RECT(struct RECT *R);
extern "C" void *PRIM_GetNextPolyG4__Fv(void);
extern "C" void DrawSpinner__FiiUcUcUciiibiT8T8Uc(int X, int Y, unsigned char R, unsigned char G, unsigned char B, int A, int C, int D, int E, int OtPos, int F, int G2, int H);

extern char stextflag;
extern unsigned char qtextflag, chrflag, questlog, invflag, sbookflag;
extern unsigned char gbMaxPlayers;
extern int spspelstate[4];
extern int _pcurr_inv[4];
extern int sel_data;
extern unsigned char _SpdBeltSelFlag[4];
extern int *ThisOt;
extern unsigned char D_800B9BCC[], D_800B9BCD[], D_800B9BCE[];
extern signed char SpellITbl[];
struct D_80110868_T { signed char b[16]; };   /* 16-byte table, block-copied (lwl/lwr) to a stack local in DrawSpell */
extern struct D_80110868_T D_80110868;
extern int InvGfxTable[];


/* TU-owned small data: speed-bar needle physics state (persists between frames) */
int D_8011AD94, D_8011AD98, D_8011AD9C, D_8011ADA0;
int D_8011ADA4, D_8011ADA8, D_8011ADAC, D_8011ADB0;

/* -------------------------------------------------------------------------------------------- */

unsigned short GPanel::GetPal(int Frm)
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

short SpdTrimCol(short col)
{
    if (col < 0) col = 0;
    if (col > 255) col = 255;
    return col;
}

void GPanel::DrawFlask(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    int HealthHeight, ManaHeight;
    int HealthAnim, ManaAnim, xof;
    int BarY;
    struct POLY_FT4 *Ft4;

    HealthHeight = (int)(Plr->_pHitPoints * 0x2B) / (int)Plr->_pMaxHP;
    HealthAnim = HealthAnimCount >> 2;
    ManaAnim = ManaAnimCount >> 2;
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

    Ft4 = PanelTData->PrintFt4(0x36, XY->MainX, XY->MainY, 0, GPanelOt, 0);
    Ft4->r0 = 0x7F;
    Ft4->g0 = 0x7F;
    Ft4->b0 = 0x7F;
    Ft4->code = (Ft4->code | 2) & 0xFE;
    Ft4->tpage = Ft4->tpage | 0x20;
    Ft4 = PanelTData->PrintFt4(0x37, XY->MainX, XY->MainY, 0, GPanelOt, 0);
    Ft4->r0 = 0x7F;
    Ft4->g0 = 0x7F;
    Ft4->b0 = 0x7F;
    Ft4->code = (Ft4->code | 2) & 0xFE;
    Ft4->tpage = Ft4->tpage | 0x20;
    PanelTData->PrintFt4(0x31, XY->MainX, XY->MainY, XY->FlaskFlip, GPanelOt + 1, 0);
    PanelTData->PrintFt4(0x32, XY->MainX, XY->MainY, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x33, XY->MainX, XY->MainY, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x34, XY->MainX, XY->MainY, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x35, XY->MainX, XY->MainY, 0, GPanelOt, 0);
    if (HealthHeight > 0) {
        BarY = XY->MainY - (HealthHeight + 8);
        xof = XY->MainX + ((-(XY->FlaskFlip != 0) & 0x18) - 0xB);
        Ft4 = PanelTData->PrintFt4(0x38, xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0x7F;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
        Ft4->y1 = (short)(Ft4->y0 + HealthHeight);
        Ft4->u1 = (unsigned char)((Ft4->u0 + HealthHeight) - 1);
        Ft4->y3 = (short)(Ft4->y2 + HealthHeight);
        Ft4->u3 = (unsigned char)((Ft4->u2 + HealthHeight) - 1);
        Ft4->tpage = Ft4->tpage | 0x20;
        Ft4->code = Ft4->code & 0xFC;
        Ft4 = PanelTData->PrintFt4(HealthAnim + 0x84, xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0x7F;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
        Ft4->code = Ft4->code & 0xFC;
        Ft4->tpage = Ft4->tpage | 0x20;
    }
    if (ManaHeight > 0) {
        BarY = XY->MainY - (ManaHeight + 8);
        xof = XY->MainX + ((-(XY->FlaskFlip != 0) & ~1) + 2);
        Ft4 = PanelTData->PrintFt4(0x38, xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0;
        Ft4->g0 = 0;
        Ft4->b0 = 0x7F;
        Ft4->y1 = (short)(Ft4->y0 + ManaHeight);
        Ft4->u1 = (unsigned char)((Ft4->u0 + ManaHeight) - 1);
        Ft4->y3 = (short)(Ft4->y2 + ManaHeight);
        Ft4->u3 = (unsigned char)((Ft4->u2 + ManaHeight) - 1);
        Ft4->tpage = Ft4->tpage | 0x20;
        Ft4->code = Ft4->code & 0xFC;
        Ft4 = PanelTData->PrintFt4(ManaAnim + 0x8C, xof, BarY, XY->FlaskFlip, GPanelOt, 0);
        Ft4->r0 = 0;
        Ft4->g0 = 0;
        Ft4->b0 = 0x7F;
        Ft4->code = Ft4->code & 0xFC;
        Ft4->tpage = Ft4->tpage | 0x20;
    }
}

struct FRAME_HDR *TextDat::GetFr(int FrNum)
{
    return (struct FRAME_HDR *)((char *)Frames + (FrNum & 0xFFFF) * 0xC);
}

void *TextDat::GetPal(int PalNum)
{
    return (char *)Pals + PalOffset[PalNum];
}

void GPanel::DrawSpell(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    struct D_80110868_T SpellXTbl = D_80110868;
    int X, Y, SpellNo;
    struct POLY_FT4 *Ft4;
    unsigned char c;

    Y = XY->MainY;
    X = XY->MainX + 1;
    Ft4 = PanelTData->PrintFt4(0xDA, (X + XY->SpellXOfs) - 5, (Y + XY->SpellYOfs) - 6, 0, GPanelOt, 0);
    Ft4->r0 = 0x7F;
    Ft4->g0 = 0x7F;
    Ft4->b0 = 0x7F;
    Ft4->code = (Ft4->code | 2) & 0xFE;
    Ft4->tpage = Ft4->tpage | 0x20;
    SpellNo = Plr->_pTSpellGfx;
    if (SpellNo != -1) {
        struct POLY_FT4 *Ft4b;

        Ft4b = PanelTData->PrintFt4(SpellITbl[SpellNo] + 0xA5, X + XY->SpellXOfs, Y + SpellXTbl.b[GPanelOt >> 1] + XY->SpellYOfs, 0, GPanelOt, 0);
        if (VID_GetTick__Fv() & 1) {
            Ft4b->r0 = (char)0x80;
            c = 0xA0;
        } else {
            Ft4b->r0 = (char)0x9C;
            c = 0x80;
        }
        Ft4b->g0 = c;
        Ft4b->b0 = c;
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

    if (Item->_itype == -1 || Item->_iDurability >= 5) {
        return 0;
    }
    switch (Item->_itype - 1) {
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
    Ft4 = PanelTData->PrintFt4(ItemType + 0x29, X, Y, 0, GPanelOt + 1, 0);
    {
        int idx0 = (Item->_iDurability - 1) * 3;
        unsigned char NewR, NewG, NewB;

        NewR = D_800B9BCC[idx0];
        NewG = D_800B9BCD[idx0];
        Ft4->code = (Ft4->code | 2) & 0xFE;
        NewB = D_800B9BCE[idx0];
        Ft4->r0 = NewR;
        Ft4->g0 = NewG;
        Ft4->b0 = NewB;
    }

    Ft4 = PanelTData->PrintFt4(0x94, X, Y, 0, GPanelOt + 1, 0);
    Ft4->y0 = (short)(Y - 2);
    Ft4->y2 = (short)(Y - 2);
    Ft4->x0 = (short)(X + 0x14);
    Ft4->x2 = (short)(X + 0x14);
    Ft4->x1 = (short)(X + 0x18);
    Ft4->y1 = (short)(Y + 0x17);
    Ft4->x3 = (short)(X + 0x18);
    Ft4->y3 = (short)(Y + 0x17);
    Ft4->r0 = 0;
    Ft4->g0 = 0;
    Ft4->b0 = 0;
    Ft4->code = (Ft4->code | 2) & 0xFE;

    if (Item->_iDurability > 0) {
        int Loop = 0;
        int Idx = 0;
        int Xs, Xe, y0;

        Xs = X + 0x15;
        Xe = X + 0x17;
        y0 = Y - 1;
        do {
            struct POLY_FT4 *F2;
            unsigned char NewR, NewG, NewB;
            int y1;

            F2 = PanelTData->PrintFt4(0x94, X, Y, 1, GPanelOt + 1, 0);
            NewR = D_800B9BCC[Idx];
            NewG = D_800B9BCD[Idx];
            NewB = D_800B9BCE[Idx];
            y1 = y0 + (3 - Loop) * 5;
            F2->y0 = (short)y1;
            F2->y2 = (short)y1;
            F2->x0 = (short)Xs;
            F2->x2 = (short)Xe;
            F2->x1 = (short)Xs;
            F2->y1 = (short)(y1 + 5);
            F2->x3 = (short)Xe;
            F2->y3 = (short)(y1 + 5);
            F2->code = (F2->code | 2) & 0xFE;
            F2->r0 = NewR;
            F2->g0 = NewG;
            F2->b0 = NewB;
            Loop++;
            Idx += 3;
        } while (Loop < Item->_iDurability);
    }
    return 1;
}

void GPanel::DrawDurIcon(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    if (chrflag == 0) {
        if (questlog != 0) {
            if (invflag != 0 || sbookflag != 0) {
                return;
            }
        }
    } else {
        if (invflag != 0 || sbookflag != 0) {
            return;
        }
    }
    if (gbMaxPlayers != 1 && spspelstate[Plr->_pClassGfx] != 0) {
        return;
    }
    DrawDurThingy(XY->HeadDurX, XY->HeadDurY, &Plr->InvBody[0], 3);
    DrawDurThingy(XY->BodyDurX, XY->BodyDurY, &Plr->InvBody[6], 2);
    DrawDurThingy(XY->Hand0DurX, XY->Hand0DurY, &Plr->InvBody[4], -1);
    DrawDurThingy(XY->Hand1DurX, XY->Hand1DurY, &Plr->InvBody[5], -1);
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

void GPanel::DrawSpeedBar(struct PanelXY *XY, struct PlayerStruct *Plr)
{
    struct ItemStruct *Belt = (struct ItemStruct *)Plr;   /* placeholder; see notes below */
    int X, Y, Loop;
    int Xe;
    (void)Belt;

    X = XY->MainX + XY->SpeedBarXOfs;
    Y = XY->MainY + XY->SpeedBarYOfs;
    if (_pcurr_inv[sel_data] != -1) {
        int nx, ny, ox, oy;

        nx = D_8011AD94 + D_8011ADA4;
        ny = D_8011AD98 + D_8011ADA8;
        D_8011AD94 = nx;
        D_8011AD98 = ny;
        ox = D_8011AD9C + D_8011ADAC;
        oy = D_8011ADA0 + D_8011ADB0;
        D_8011AD9C = ox;
        D_8011ADA0 = oy;
        if (nx >= 0x41) {
            D_8011ADA4 = -4;
        }
        if (ny >= 0x41) {
            D_8011ADA8 = -4;
        }
        if (ox >= 0x41) {
            D_8011ADAC = -4;
        }
        if (nx < -0x40) {
            D_8011ADA4 = 4;
        }
        if (ny < -0x40) {
            D_8011ADA8 = 4;
        }
        if (ox < -0x40) {
            D_8011ADAC = 4;
        }
        if (oy < -0x40) {
            D_8011ADB0 = 4;
        }
        {
            struct POLY_FT4 *G4 = (struct POLY_FT4 *)PRIM_GetNextPolyG4__Fv();
            int *Item;
            short yy, yy2;

            G4->code = 8;
            G4->tpage = 0x38;
            yy = (short)Y;
            G4->y0 = yy;
            Item = &_pcurr_inv[sel_data];
            G4->x0 = (short)(X + (*Item * 0x11));
            G4->y2 = yy;
            G4->x2 = (short)((X + (*Item * 0x11)) + 0x11);
            yy2 = (short)(Y + 0x14);
            G4->y1 = yy2;
            G4->x1 = (short)(X + (*Item * 0x11));
            G4->y3 = yy2;
            G4->x3 = (short)((X + (*Item * 0x11)) + 0x11);
            G4->r0 = (unsigned char)(SpdTrimCol((short)(D_8011AD94 + 0xBF)) >> 1);
            G4->g0 = SpdTrimCol(0);
            G4->b0 = SpdTrimCol((short)(D_8011AD94 + 0x80));
            G4->u0 = (unsigned char)(SpdTrimCol((short)(D_8011AD98 + 0xBF)) >> 1);
            G4->v0 = SpdTrimCol(0);
            G4->clut = SpdTrimCol((short)(D_8011AD98 + 0x80));
            G4->u1 = (unsigned char)(SpdTrimCol((short)(D_8011AD9C + 0xBF)) >> 1);
            G4->v1 = SpdTrimCol(0);
            G4->tpage = SpdTrimCol((short)(D_8011AD9C + 0x80));
            G4->u2 = (unsigned char)(SpdTrimCol((short)(D_8011ADA0 + 0xBF)) >> 1);
            G4->v2 = SpdTrimCol(0);
            G4->pad1 = SpdTrimCol((short)(D_8011ADA0 + 0x80));
            {
                int *Ot = &ThisOt[GPanelOt];
                G4->tag = (G4->tag & 0xFF000000) | (*Ot & 0xFFFFFF);
                *Ot = (*Ot & 0xFF000000) | ((int)G4 & 0xFFFFFF);
            }
            if (_SpdBeltSelFlag[sel_data] != 0) {
                DrawSpinner__FiiUcUcUciiibiT8T8Uc(X + (*Item * 0x11) + 5, Y + 0xD, 0xA0, 0x40, 0xF0, 0x20, 0x60, 0, 0, GPanelOt - 1, 1, 0, 8);
            }
        }
    }
    Xe = X + 0x11;
    Loop = 0;
    PanelTData->PrintFt4(0x99, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x9A, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x9B, X, Y, 0, GPanelOt, 0);
    PanelTData->PrintFt4(0x9C, X, Y, 0, GPanelOt, 0);
    do {
        int cur;

        Loop++;
        PanelTData->PrintFt4(0x9D, Xe, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0x9E, Xe, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0x9F, Xe, Y, 0, GPanelOt, 0);
        cur = Xe;
        Xe += 0x11;
        PanelTData->PrintFt4(0xA0, cur, Y, 0, GPanelOt, 0);
    } while (Loop < 6);
    {
        unsigned char *SpdList = (unsigned char *)Plr;
        int Loop2, X2;

        Loop2 = 0;
        PanelTData->PrintFt4(0xA1, Xe, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0xA2, Xe, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0xA3, Xe, Y, 0, GPanelOt, 0);
        PanelTData->PrintFt4(0xA4, Xe, Y, 0, GPanelOt, 0);
        X2 = XY->MainX + 2 + XY->SpeedBarXOfs;
        Y = XY->MainY + 2 + XY->SpeedBarYOfs;
        do {
            if (*(short *)(SpdList + 0x15DC) != -1) {
                PanelTData->PrintFt4(InvGfxTable[*(unsigned char *)(SpdList + 0x15FC)], X2, Y, 0, GPanelOt + 1, 0);
            }
            X2 += 0x11;
            Loop2++;
            SpdList += 0x6C;
        } while (Loop2 < 8);
    }
    {
        struct POLY_FT4 *Ft4b = PanelTData->PrintFt4(0x94, X, Y, 0, GPanelOt - 1, 0);
        short x1, y1;

        x1 = (short)(X + 1);
        Ft4b->x0 = x1;
        Ft4b->x2 = x1;
        y1 = (short)(Y + 0x14);
        Ft4b->y1 = y1;
        Ft4b->y3 = y1;
        Ft4b->r0 = 0x14;
        Ft4b->g0 = 0x14;
        Ft4b->b0 = 0x14;
        Ft4b->x1 = (short)(X + 0x89);
        Ft4b->x3 = (short)(X + 0x89);
        Ft4b->y0 = (short)Y;
        Ft4b->y2 = (short)Y;
        Ft4b->u1 = (unsigned char)(Ft4b->u0 + 1);
        Ft4b->v1 = (unsigned char)(Ft4b->u0 + 1);
        Ft4b->u2 = (unsigned char)(Ft4b->v0 + 1);
        Ft4b->v2 = (unsigned char)(Ft4b->v0 + 1);
        Ft4b->tpage = Ft4b->tpage | 0x40;
        Ft4b->code = (Ft4b->code | 2) & 0xFE;
    }
}
