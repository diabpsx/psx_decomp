#ifndef PSXSRC_BLOCK_H
#define PSXSRC_BLOCK_H
/* BLOCK.H -- Climax PSX dungeon-block renderer object (C:\diabpsx\PSXSRC\BLOCK.H).  Layouts from the retail
 * SYM (CBlocks sizeof 264 over its TextDat base, LittleGt4 16, RgbBlockInf 24); the in-class methods are the
 * ones the retail SYM attributes to BLOCK.H lines 56-261, emitted out of line in every TU that calls them
 * (-fno-inline).  BLOCK.H parses GMAN.H first (CBlocks is a TextDat). */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "psxsrc/gman.h"

struct LittleGt4 {                    /* sizeof 16 */
    unsigned char u0, v0;
    unsigned short clut;
    unsigned char u1, v1;
    unsigned short tpage;
    unsigned char u2, v2, u3, v3, w, h, code, Flags;

#line 55
    void InitFromGt4(POLY_GT4 *Gt4, int nw, int nh)                     /* BLOCK.H:56 */
    {
        clut = Gt4->clut;
        tpage = Gt4->tpage;
        code = Gt4->code;
        u0 = Gt4->u0;
        v0 = Gt4->v0;
        u1 = Gt4->u1;
        v1 = Gt4->v1;
        u2 = Gt4->u2;
        v2 = Gt4->v2;
        u3 = Gt4->u3;
        v3 = Gt4->v3;
        w = nw;
        h = nh;
    }
};

struct RgbBlockInf {                  /* sizeof 24 */
    int FromValR, ToValR, FromValG, ToValG, FromValB, ToValB;
};

struct MonstList;
struct CacheInfo;
struct map_info;
struct RGBData;

extern int PosAdj;                    /* BLOCK.CPP @0x8011ACAC */

class CBlocks : public TextDat {      /* the SYM shows the base as member `TextDat TextDat @+0` */
public:
    TextDat *MonstTexDat;             /* +0x70 */
    TextDat *ObjTexDat;               /* +0x74 */
    MonstList *MonsterList;           /* +0x78 */
    int RndX, RndY;                   /* +0x7C, +0x80 */
    int MonstTexId;                   /* +0x84 */
    long hndBlocks;                   /* +0x88 */
    int ObjTexId;                     /* +0x8C */
    int ItemTexId;                    /* +0x90 */
    TextDat *ItemTexDat;              /* +0x94 */
    int BgTexId;                      /* +0x98 */
    TextDat *BgTexDat;                /* +0x9C */
    int pOtPos[2];                    /* +0xA0 */
    BOOL IsTown;                      /* +0xA8 */
    int NumOfBlocks;                  /* +0xAC */
    LittleGt4 *Gt4s;                  /* +0xB0 */
    long hndGt4s;                     /* +0xB4 */
    RECT *Rects;                      /* +0xB8 */
    long hndRects;                    /* +0xBC */
    RECT ClipRect;                    /* +0xC0 */
    int StX, StY, Mx, My;             /* +0xC8.. */
    int pBlockX[2], pBlockY[2];       /* +0xD8.. */
    int CursX, CursY;                 /* +0xE8.. */
    RgbBlockInf GlBlockInf;           /* +0xF0 */

    CBlocks(int BgId, int ObjId, int ItemId, int Level, int List);
    ~CBlocks();
    int FindTownCreature(int GameEqu);
    int FindCreature(int MgNum);
    void SetTownersGraphics();
    void SetMonsterGraphics(int Level, int List);
    void DumpGt4s();
    void DumpRects();
    void SetGraphics(TextDat **TDat, int *pId, int Id);
    void DumpGraphics(TextDat **TDat, int *Id);
    void Load(int Id);
    void MakeRectTable();
    void MakeGt4Table();
    void MakeGt4(POLY_GT4 *GT4, FRAME_HDR *Fr);
    void SetRandOffset(int QuakeAmount);
    void Print();
    void SetXY(int nx, int ny);
    void GetXY(int *nx, int *ny);
    void InitColourCycling();
    void GetGCol(int x, int y, unsigned char *Rgb, RGBData *Data);
    void PrintMap(int x, int y);
    void IterateVisibleMap(int x, int y, int (*Func)(CacheInfo *, map_info *, int, int), bool VisCheck);
    void PrintMonsters(int MxInt, int MyInt);
    void PrintTowners(int MxInt, int MyInt);
    void PrintObjects(int MxInt, int MyInt);
    void PrintDead(int MxInt, int MyInt);
    void PrintItems(int MxInt, int MyInt);
    void PrintMissiles(int MxInt, int MyInt);
    int ScrToWorldX(int sx, int sy);
    int ScrToWorldY(int sx, int sy);
    void SetScrollTarget(int x, int y);
    void DoScroll();
    void SetPlayerPosBlocks(int PlayerNum, int bx, int by);
    void GetScrXY(RECT &R, int x, int y, int sxoff, int syoff);
    static void ShadScaleSkew(POLY_FT4 *Ft4);
    int WorldToScrX(int x, int y);
    int WorldToScrY(int x, int y);

#line 171
    static int GetMaxOtPos() { return 0x1FF; }                             /* BLOCK.H:171 */
#line 174
    static int GetOverlayOtBase() { return 0x1E8; }                        /* BLOCK.H:174 */
#line 176
    int GetOtPos(int LogicalY)                                             /* BLOCK.H:177 */
    {
        int OtPos = ClipRect.y + LogicalY + PosAdj;

        if (OtPos < -0x43)
            OtPos = -0x43;

        if (OtPos > 0x19B)
            OtPos = 0x19B;



        return OtPos + 0x4D;
    }
#line 205
    void MoveToScrollTarget() { Mx = StX; My = StY; }                      /* BLOCK.H:205 */
#line 212
    void SetTown(BOOL Val) { IsTown = Val; }                               /* BLOCK.H:212 */
    void DumpMonsters()                                                    /* BLOCK.H:228 */
    {
        MonsterList = NULL;
        DumpGraphics(&MonstTexDat, &MonstTexId);
    }
#line 229
    void DumpObjs() { DumpGraphics(&ObjTexDat, &ObjTexId); }               /* BLOCK.H:229 */
#line 230
    void DumpItems() { DumpGraphics(&ItemTexDat, &ItemTexId); }            /* BLOCK.H:230 */
#line 260
    void SetObjGraphics(int Id) { SetGraphics(&ObjTexDat, &ObjTexId, Id); }       /* BLOCK.H:260 */
#line 261
    void SetItemGraphics(int Id) { SetGraphics(&ItemTexDat, &ItemTexId, Id); }    /* BLOCK.H:261 */
};

#endif
