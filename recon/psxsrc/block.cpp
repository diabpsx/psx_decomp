/* PSXSRC/BLOCK.CPP — Diablo PSX (Climax 1998) reconstruction.  PSX-only (dungeon 3D block/sprite
 * renderer -- no PC twin: devilution's scrollrt.cpp does the equivalent job through Storm's DIB
 * blitter, not a GTE quad renderer).  Reconstructed from the raw oracle + skel/PSXSRC/BLOCK.CPP
 * (Ghidra/IDA drafts) + refs skeleton dirs' DIABPSX/PSXSRC/BLOCK.H (IDA-decompiled inline bodies for
 * the many out-of-line header-inline copies this TU carries -- their VAs match this object's).
 * Follows the PSXHELP/COREFMV pattern: everything (types + externs + protos) declared locally, no
 * gen/*.h. Only a first PASS of the simplest, non-GTE-rendering functions is done this round; the
 * big scanline/quad renderers (PrintMap, PrintMonsters/Towners/Objects/Dead/Items/Missiles,
 * IterateVisibleMap, MakeGt4Table/MakeRectTable/MakeGt4, ctor/dtor, Load, Print, InitColourCycling,
 * GetGCol, DoScroll, ShadScaleSkew, SetPlayerPosBlocks, GetScrXY, SetGraphics helpers not yet
 * covered) are still INCLUDE_ASM in skel/ and NOT reconstructed here -- see the final report. */
#include "diabpsx_types.h"

struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

struct FRAME_HDR;
struct SPR_HDR;
struct CTextFileInfo;
struct LittleGt4;

struct MonstList {   /* sizeof 8 (count@0, list ptr@+4) */
    unsigned short Count;
    unsigned short pad;
    unsigned char *List;
};

struct TextDat {   /* sizeof 112 -- matches recon/psxsrc/gman.cpp's TextDat exactly (its owner);
                       here only the accessor methods this TU emits out-of-line are declared. */
    BOOL OwnDat;             /* +0x0 */
    int TexNum;              /* +0x4 */
    int LastFrame;           /* +0x8 */
    BOOL DatLoaded;          /* +0xC */
    long hndDat;             /* +0x10 */
    long hndHdr;             /* +0x14 */
    long hndPalOffset;       /* +0x18 */
    long hndCreatureOffset;  /* +0x1C */
    long hndBlockOffsets;    /* +0x20 */
    struct FRAME_HDR *Frames;   /* +0x24 */
    struct SPR_HDR *Hdr;        /* +0x28 */
    void *Pals;                 /* +0x2C */
    int *PalOffset;             /* +0x30 */
    int *CreatureOffset;        /* +0x34 */
    unsigned char *CreatureAnims;  /* +0x38 */
    unsigned char *Blocks;      /* +0x3C */
    BOOL Loaded;             /* +0x40 */
    int LoadCount;           /* +0x44 */
    struct CTextFileInfo *FileInfo;   /* +0x48 */
    long hndDecompBuffer;    /* +0x4C */
    int DecX, DecY, PalX, PalY, Scr;   /* +0x50.. */
    int NumOfBuffers[2];
    long hndDecompArrays;

    void *GetCreature(int Creature) const;
    int GetNumOfActions(int Creature) const;
    int GetNumOfFrames(int Creature, int Action) const;
    void *GetPal(int Creature) const;
    void SetFileInfo(const struct CTextFileInfo *Info, int Id);
};

struct CCreatureAction {   /* sizeof 14 */
    unsigned short BaseFrame;
    unsigned char NumOfFrames;
    unsigned char NumOfPhysFrames;
    unsigned char DirRemap[8];
    unsigned char AnimRemap[1];
};

struct CCreatureHdr {   /* sizeof 20; only GetAction is emitted here */
    long NumOfActions;
    struct CCreatureAction Cr;

    struct CCreatureAction *GetAction(int ActNum) const;
};

struct RgbBlockInf {   /* sizeof 24 */
    int FromValR, ToValR, FromValG, ToValG, FromValB, ToValB;
};

struct LittleGt4 {   /* sizeof 16 */
    unsigned char u0, v0;
    unsigned short clut;
    unsigned char u1, v1;
    unsigned short tpage;
    unsigned char u2, v2, u3, v3, w, h, code, Flags;

    void InitFromGt4(struct POLY_GT4 *Gt4, int nw, int nh);
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

struct POLY_FT4;

struct TownToCreature {   /* sizeof 2 */
    unsigned char GameEqu;
    unsigned char CreatureEquate;

    int GetCreature(int GameCreature) const;
};

struct MonstLevel {   /* sizeof 8 */
    int NumOfLists;
    struct MonstList *TheLists;
};

/* CBlocks -- only the methods reconstructed this round are declared; a later pass adds the rest
   (PrintMap/PrintMonsters/etc.) and the full ctor/dtor body. */
class CBlocks {
public:
    struct TextDat TextDat;         /* +0x0 */
    struct TextDat *MonstTexDat;    /* +0x70 */
    struct TextDat *ObjTexDat;      /* +0x74 */
    struct MonstList *MonsterList;  /* +0x78 */
    int RndX, RndY;                 /* +0x7C, +0x80 */
    int MonstTexId;                 /* +0x84 */
    long hndBlocks;                 /* +0x88 */
    int ObjTexId;                   /* +0x8C */
    int ItemTexId;                  /* +0x90 */
    struct TextDat *ItemTexDat;     /* +0x94 */
    int BgTexId;                    /* +0x98 */
    struct TextDat *BgTexDat;       /* +0x9C */
    int pOtPos[2];                  /* +0xA0 */
    BOOL IsTown;                    /* +0xA8 */
    int NumOfBlocks;                /* +0xAC */
    struct LittleGt4 *Gt4s;         /* +0xB0 */
    long hndGt4s;                   /* +0xB4 */
    struct RECT *Rects;             /* +0xB8 */
    long hndRects;                  /* +0xBC */
    struct RECT ClipRect;           /* +0xC0 */
    int StX, StY, Mx, My;           /* +0xC8.. */
    int pBlockX[2], pBlockY[2];     /* +0xD8.. */
    int CursX, CursY;               /* +0xE8.. */
    struct RgbBlockInf GlBlockInf;  /* +0xF0 */

    int FindTownCreature(int GameEqu);
    int FindCreature(int MgNum);
    void SetTownersGraphics();
    void SetMonsterGraphics(int Level, int List);
    void DumpGt4s();
    void DumpRects();
    void SetGraphics(struct TextDat **TDat, int *pId, int Id);
    void DumpGraphics(struct TextDat **TDat, int *Id);
    void MyRoutine(int x, int y);
    void SetRandOffset(int QuakeAmount);
    void SetXY(int nx, int ny);
    void GetXY(int *nx, int *ny);
    void SetScrollTarget(int x, int y);
    int ScrToWorldX(int sx, int sy);
    int ScrToWorldY(int sx, int sy);
    int WorldToScrX(int x, int y);
    int WorldToScrY(int x, int y);
    int GetOtPos(int LogicalY);
    void SetItemGraphics(int Id);
    void SetObjGraphics(int Id);
    void DumpItems();
    void DumpObjs();
    void DumpMonsters();
    void PrintMap(int x, int y);   /* not yet reconstructed -- declared only, defined elsewhere later */
};

void MyRoutine(CBlocks &B, int x, int y);

extern "C" void *SetSp(void *newsp);

TextDat *GM_UseTexData(int Id);
void GM_FinishedUsing(TextDat *Fin);
unsigned char GAL_Free(long Handle);
void DBG_Error(char *Text, char *File, int Line);
unsigned long GU_GetRndRange(unsigned int Range);

extern int NumOfMonsterListLevels;      /* @0x8011AA94 */
extern struct MonstLevel AllLevels[16]; /* @0x800B7558 */
extern struct TownToCreature TownConv[10]; /* @0x800B8B80 */
extern int PosAdj;

/* BLOCK.CPP-owned globals (sole %gp_rel consumers are in this TU). */
static CBlocks *CurrentBlocks;
static void *OldSp;

/* @0x8008D614 BLOCK.CPP:358 */
int CBlocks::FindTownCreature(int GameEqu)
{
    for (int i = 0; i < 10; i++) {
        int c = TownConv[i].GetCreature(GameEqu);
        if (c != -1)
            return c;
    }
    return -1;
}

/* @0x8008D688 BLOCK.CPP:375 */
int CBlocks::FindCreature(int MgNum)
{
    MonstList *ml = MonsterList;
    if (ml->Count) {
        unsigned char *p = ml->List;
        for (unsigned int i = 0; i < ml->Count; i++, p++) {
            if (*p == MgNum)
                return i;
        }
    }
    DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x17E);
    return -1;
}

/* @0x8008D860 BLOCK.CPP:461 */
void CBlocks::SetTownersGraphics()
{
    MonstTexId = 0xCD;
    MonstTexDat = GM_UseTexData(0xCD);
}

/* @0x8008D898 BLOCK.CPP:472 */
void CBlocks::SetMonsterGraphics(int Level, int List)
{
    int levelIdx = Level - 1;
    if (levelIdx < 0 || !(levelIdx < NumOfMonsterListLevels))
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x1DB);

    MonstList *ml;
    if (List < 0 || AllLevels[levelIdx].NumOfLists < List)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x1DD);
    ml = (MonstList *)((char *)AllLevels[levelIdx].TheLists + List * 16);

    unsigned short id = *(unsigned short *)((char *)ml + 2);
    MonstTexId = id;
    MonstTexDat = GM_UseTexData(id);
    MonsterList = ml;
}

/* @0x8008D9E8 BLOCK.CPP:515 */
void CBlocks::DumpGt4s()
{
    if (hndGt4s != -1) {
        if (!GAL_Free(hndGt4s))
            DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x208);
        Gt4s = NULL;
        hndGt4s = -1;
    }
}

/* @0x8008DA50 BLOCK.CPP:531 */
void CBlocks::DumpRects()
{
    if (hndRects != -1) {
        if (!GAL_Free(hndRects))
            DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x218);
        Rects = NULL;
        hndRects = -1;
    }
}

/* @0x8008DAB8 BLOCK.CPP:548 */
void CBlocks::SetGraphics(struct TextDat **TDat, int *pId, int Id)
{
    if (*pId != Id) {
        DumpGraphics(TDat, pId);
        *pId = Id;
        *TDat = GM_UseTexData(Id);
    }
}

/* @0x8008DB14 BLOCK.CPP:563 */
void CBlocks::DumpGraphics(struct TextDat **TDat, int *Id)
{
    if (*TDat) {
        GM_FinishedUsing(*TDat);
        *TDat = NULL;
    }
    *Id = -1;
}

/* @0x8008E07C BLOCK.CPP:801 */
void CBlocks::MyRoutine(int x, int y)
{
    OldSp = SetSp((void *)0x1F8003F0);
    PrintMap(x, y);
    SetSp(OldSp);
}

/* @0x8008E0E4 BLOCK.CPP:810 */
void CBlocks::SetRandOffset(int QuakeAmount)
{
    RndX = GU_GetRndRange(QuakeAmount * 2) - QuakeAmount;
    RndY = GU_GetRndRange(QuakeAmount * 2) - QuakeAmount;
}

/* @0x8008E25C BLOCK.CPP:854 */
void CBlocks::SetXY(int nx, int ny)
{
    Mx = nx;
    SetScrollTarget(Mx, ny);
    My = ny;
}

/* @0x8008E284 BLOCK.CPP:867 */
void CBlocks::GetXY(int *nx, int *ny)
{
    *nx = Mx;
    *ny = My;
}

/* @0x800915E4 BLOCK.CPP:2597 */
int CBlocks::ScrToWorldX(int sx, int sy)
{
    return sx / 2 + sy;
}

/* @0x800915F8 BLOCK.CPP:2608 */
int CBlocks::ScrToWorldY(int sx, int sy)
{
    return sy - sx / 2;
}

/* @0x800919D0 BLOCK.CPP:2789 */
int CBlocks::WorldToScrX(int x, int y)
{
    return x - y;
}

/* @0x800919D8 BLOCK.CPP:2800 */
int CBlocks::WorldToScrY(int x, int y)
{
    return (x + y) / 2;
}

/* @0x8009160C BLOCK.CPP:2619 */
void CBlocks::SetScrollTarget(int x, int y)
{
    StX = (WorldToScrX(x, ClipRect.y) - x) * 65536;
    StY = (WorldToScrY(ClipRect.x, y) - y) * 65536;
}

/* @0x80091CC0 BLOCK.H (header copy):177 */
int CBlocks::GetOtPos(int LogicalY)
{
    int OtPos = ClipRect.y + LogicalY + PosAdj;
    if (OtPos < -0x43) OtPos = -0x43;
    if (OtPos > 0x19B) OtPos = 0x19B;
    return OtPos + 0x4D;
}

/* @0x80091C00 BLOCK.H (header copy):261 */
void CBlocks::SetItemGraphics(int Id)
{
    SetGraphics(&ItemTexDat, &ItemTexId, Id);
}

/* @0x80091C28 BLOCK.H (header copy):260 */
void CBlocks::SetObjGraphics(int Id)
{
    SetGraphics(&ObjTexDat, &ObjTexId, Id);
}

/* @0x80091C50 BLOCK.H (header copy):230 */
void CBlocks::DumpItems()
{
    DumpGraphics(&ItemTexDat, &ItemTexId);
}

/* @0x80091C74 BLOCK.H (header copy):229 */
void CBlocks::DumpObjs()
{
    DumpGraphics(&ObjTexDat, &ObjTexId);
}

/* @0x80091C98 BLOCK.H (header copy):228 */
void CBlocks::DumpMonsters()
{
    MonsterList = NULL;
    DumpGraphics(&MonstTexDat, &MonstTexId);
}

/* @0x800919EC BLOCK.CPP:2805 */
CBlocks *BL_GetCurrentBlocks(void)
{
    return CurrentBlocks;
}

/* @0x800919F8 BLOCK.CPP:115 */
int GetHighlightCol__FiPcUsUsUs(int Index, char *SelList, unsigned short P1Col, unsigned short P2Col, int P12Col)
{
    if (SelList[0] != SelList[1]) {
        if (SelList[0] == Index)
            return P1Col;
    } else {
        if (Index == SelList[0])
            return P12Col & 0xFFFF;
    }
    if (Index == SelList[1])
        return P2Col & 0xFFFF;
    return -1;
}

/* @0x80091ABC BLOCK.CPP:115 */
int GetHighlightCol__FiPiUsUsUs(int Index, int *SelList, unsigned short P1Col, unsigned short P2Col, int P12Col)
{
    if (SelList[0] != SelList[1]) {
        if (SelList[0] == Index)
            return P1Col;
    } else {
        if (Index == SelList[0])
            return P12Col & 0xFFFF;
    }
    if (Index == SelList[1])
        return P2Col & 0xFFFF;
    return -1;
}

/* @0x80091BE4 BLOCK.CPP:239 */
int TownToCreature::GetCreature(int GameCreature) const
{
    if (GameEqu != GameCreature)
        return -1;
    return CreatureEquate;
}

/* @0x80091DE0 GMAN.H (header copy):284 */
void *TextDat::GetCreature(int Creature) const
{
    return (char *)CreatureAnims + CreatureOffset[Creature];
}

/* @0x80091DBC GMAN.H (header copy):252 */
int TextDat::GetNumOfActions(int Creature) const
{
    return *(int *)GetCreature(Creature);
}

/* @0x80091D84 BLOCK.CPP:1350 (GMAN.H header copy):253 */
int TextDat::GetNumOfFrames(int Creature, int Action) const
{
    CCreatureHdr *hdr = (CCreatureHdr *)GetCreature(Creature);
    return hdr->GetAction(Action)->NumOfPhysFrames;
}

/* @0x80091E1C GMAN.H (header copy):232 */
void *TextDat::GetPal(int Creature) const
{
    return (char *)Pals + PalOffset[Creature];
}

/* @0x80091DFC GMAN.H (header copy):240 */
void TextDat::SetFileInfo(const CTextFileInfo *Info, int Id)
{
    FileInfo = (CTextFileInfo *)Info;
    TexNum = Id;
}

/* @0x80091CF8 BLOCK.H (header copy):56 */
void LittleGt4::InitFromGt4(POLY_GT4 *Gt4, int nw, int nh)
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
    unsigned char v3v = Gt4->v3;
    w = (unsigned char)nw;
    h = (unsigned char)nh;
    v3 = v3v;
}
