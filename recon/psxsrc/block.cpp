/* PSXSRC/BLOCK.CPP -- Diablo PSX (Climax 1998) reconstruction.  PSX-only (dungeon 3D block/sprite
 * renderer -- no PC twin).  Reconstructed from the raw oracle + SYM (tuinfo) + refs skeleton
 * DIABPSX/PSXSRC/BLOCK.CPP/.H (Ghidra drafts).  All 68 object functions are C++ here; CBlocks is
 * real inheritance `: public TextDat` (SYM shows the base as member `TextDat TextDat @+0`; the dtor
 * forwards __in_chrg to ___7TextDat and the ctor calls __7TextDat).  Types beyond the local ones come
 * from psxsrc/psyq.h and psxsrc/gen/structs_block.h (tools/symhdr.py struct; regenerate with
 * scratch/block/genhdr.py).  All 68 functions PASS bytes + SYM (2026-10-03). */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "psxsrc/gen/structs_block.h"
/* verbatim PsyQ 4.0 LIBGPU.H primitive macros (psyq.h's shared copies drift: casts, setcode-based ?:) */
#undef getaddr
#undef getlen
#undef setSemiTrans
#undef setShadeTex
#define getlen(p)    		(u_char)(((P_TAG *)(p))->len)
#define getcode(p)   		(u_char)(((P_TAG *)(p))->code)
#define getaddr(p)   		(u_long)(((P_TAG *)(p))->addr)
#define setSemiTrans(p, abe) ((abe)?setcode(p, getcode(p)|0x02):setcode(p, getcode(p)&~0x02))
#define setShadeTex(p, tge) ((tge)?setcode(p, getcode(p)|0x01):setcode(p, getcode(p)&~0x01))
#define setRGB0(p, _r0, _g0, _b0) (p)->r0 = (_r0), (p)->g0 = (_g0), (p)->b0 = (_b0)

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
/* word 0 of FRAME_HDR (FrOffset) read as U/V/Tpage bytes -- same view as gman.h */
struct FRAME_TP {
    unsigned int U     : 8;
    unsigned int V     : 8;
    unsigned int Tpage : 16;
};
struct SPR_HDR {   /* sizeof 40 */
    unsigned int DecompOffset : 32;
    unsigned int CreatureOffset : 32;
    unsigned int PalOffset : 32;
    unsigned int FrameOffset : 32;
    unsigned int BaseFrame : 32;
    unsigned int DestTPage : 32;
    unsigned int ComponentOffset : 32;
    unsigned int NumOfCreatures : 32;
    unsigned int NumOfFrames : 16;
    unsigned int NumOfPals : 16;
    unsigned int TWidth : 8;
    unsigned int THeight : 8;
    unsigned int IsTiles : 8;
    unsigned int Spare : 8;
};
struct CTextFileInfo {   /* sizeof 4 */
    char *FileName;
};
struct LittleGt4;

struct MonstList {   /* sizeof 16 */
    unsigned short NumOfMonsters;   /* +0x0 */
    unsigned short TexNum;          /* +0x2 */
    unsigned char *TheList;         /* +0x4 */
    char *ListName;                 /* +0x8 */
    unsigned long QuestBits;        /* +0xC */
};

struct CCreatureHdr;
struct PAL {   /* retail SYM: sizeof 8 */
    unsigned int InVram : 1;
    unsigned int NumOfCols : 31;
    unsigned short Cols[1];
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

    TextDat();
    ~TextDat();
    void DumpDatFile();
    CCreatureHdr *GetCreature(int Creature);
    int GetNumOfActions(int Creature);
    int GetNumOfFrames(int Creature, int Action);
    PAL *GetPal(int PalNum);
    void SetFileInfo(const struct CTextFileInfo *NewInfo, int Id);
    void Use(long NewHndDat, BOOL DatLoaded, int size);
    int GetNumOfFrames();
    struct FRAME_HDR *GetFr(int FrNum);
    POLY_FT4 *PrintMonster(int Creature, int Action, int Dir, int Frame, int x, int y, int OtPos);
    void SetPal(struct FRAME_HDR *Fr, POLY_FT4 *FT4);
    POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
    void PrepareFt4(POLY_FT4 *FT4, int Frm, int X, int Y, int XFlip, int YFlip);
    int GetFrNum(int Creature, int Action, int Direction, int Frame);
    BOOL IsDirAliased(int Creature, int Action, int Direction);
    BOOL IsCompressed(int Creature, int Action, int Dir, int Frame);
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

struct TownToCreature {   /* sizeof 2 */
    unsigned char GameEqu;
    unsigned char CreatureEquate;

    int GetCreature(int GameCreature);
};

struct MonstLevel {   /* sizeof 8 */
    int NumOfLists;
    struct MonstList *TheLists;
};

struct CPart {   /* sizeof 8 */
    unsigned long Piece;
    short X;
    short Y;
};
class CBlock {   /* sizeof 12 */
public:
    unsigned long NumOfParts;
    struct CPart Parts[1];
    void GetBoundingBox(struct TextDat &TDat, struct RECT &R);
};

extern "C" long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);
extern "C" void *GAL_Lock(long Handle);
extern "C" unsigned char GAL_Unlock(long Handle);

/* CBlocks -- only the methods reconstructed this round are declared; a later pass adds the rest
   (PrintMap/PrintMonsters/etc.) and the full ctor/dtor body. */
class CBlocks : public TextDat {   /* SYM shows the base as member `TextDat TextDat @+0` */
public:
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
    void PrintMap(int x, int y);
    void Load(int Id);
    void MakeGt4Table();
    void MakeGt4(struct POLY_GT4 *GT4, struct FRAME_HDR *Fr);
    void MakeRectTable();
    void InitColourCycling();
    void SetPlayerPosBlocks(int PlayerNum, int bx, int by);
    void DoScroll();
    void IterateVisibleMap(int x, int y, int (*Func)(struct CacheInfo *, struct map_info *, int, int), bool VisCheck);
    void Print();
    void PrintItems(int MxInt, int MyInt);
    void PrintTowners(int MxInt, int MyInt);
    void PrintDead(int MxInt, int MyInt);
    void PrintMonsters(int MxInt, int MyInt);
    void PrintObjects(int MxInt, int MyInt);
    void PrintMissiles(int MxInt, int MyInt);
    void GetGCol(int x, int y, unsigned char *Rgb, struct RGBData *Data);
    void GetScrXY(struct RECT &R, int x, int y, int sxoff, int syoff);
    static void ShadScaleSkew(struct POLY_FT4 *Ft4);
    CBlocks(int BgId, int ObjId, int ItemId, int Level, int List);
    ~CBlocks();
};

void MyRoutine(CBlocks &B, int x, int y);

extern "C" void *SetSp(void *newsp);

TextDat *GM_UseTexData(int Id);
void GM_FinishedUsing(TextDat *Fin);
extern "C" unsigned char GAL_Free(long Handle);
extern "C" void DBG_Error(char *Text, char *File, int Line);
extern "C" unsigned long GU_GetRndRange(unsigned int Range);
extern unsigned short water_clut;
extern unsigned short penta_clut;
extern unsigned char leveltype;
void UPDATEPROGRESS(int inc);

/* Original unused GMAN.H inline: its diagnostic filename is the first retail pool item. */
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd))
            DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

extern int NumOfMonsterListLevels;      /* @0x8011AA94 */
extern struct MonstLevel AllLevels[16]; /* @0x800B7558 */
struct TownToCreature TownConv[10] = {   /* @0x800B8B80 */
    { 0, 7 }, { 1, 6 }, { 2, 4 }, { 3, 11 }, { 4, 8 },
    { 5, 5 }, { 6, 12 }, { 7, 10 }, { 8, 9 }, { 9, 3 }
};
/* SYM EXT INT @0x8011ACAC (.sdata, initialised -15) */
int PosAdj = -15;

/* BLOCK.CPP-owned globals (SYM EXT, .sdata). */
CBlocks *CurrentBlocks = 0;
int OldSp = 0;

extern unsigned char PauseMode;
extern char stextflag;
extern unsigned char qtextflag;

/* Original project headers make these cross-TU declarations visible before
 * every BLOCK.CPP body; keep that scope while the definitions follow retail order. */
extern struct TextDat *MissDat;
extern struct CTextFileInfo *TX_DatTab[];
struct FileIO;
FileIO *SYSI_GetFs(void);
extern struct PlayerStruct plr[2];
extern int restore_r, restore_g, restore_b;
extern unsigned short dungeon[48][48];
void PRIM_Clip(RECT *R, int Depth);
void PRIM_FullScreen(int Depth);
extern "C" void ABL_SetBlockRGBXY(RgbBlockInf *Inf, int x, int y, BOOL DoTrans);
extern "C" void ABL_PrintPart(CPart *Part, LittleGt4 *Gt4, POLY_GT4 *Dest);
extern struct map_info dung_map[112][112];
extern struct MonsterStruct monster[190];
extern struct MissileStruct missile[125];
extern struct ObjectStruct object[127];
extern struct ItemStruct item[128];
extern char dMissArray[32][4];
unsigned char GetdDead(int x, int y);
extern int UniqTransPals[194];
struct STONEPAL {
    unsigned char NoStonePals;
    int StonePal;
};
extern struct STONEPAL StonePals[32];
void StartPartJump(int mi, int height, int scale, int colour, int OtPos);
extern struct TownerStruct towner[16];
extern BOOL FRIGFLAG;
extern unsigned long *ThisOt;
extern int _pcursmonst[2];
unsigned short SCR_NeedHighlightPal(unsigned short Clut, unsigned short PixVal, int NumOfCols);
typedef POLY_FT4 *(*OBJ_PFUNC)(ObjectStruct *OStr, int Sx, int Sy, TextDat *ObjDat, int OtPos);
extern OBJ_PFUNC ObjPrintFuncs[98];
extern struct ObjDataStruct AllObjects[99];
extern struct OBJ_LOAD_INFO ObjMasterLoadList[56];
extern char _pcursobj[2];
extern struct DeadStruct dead[31];
extern struct CMonster Monsters[16];
extern int TransPals[134];
extern unsigned char dung_map_r[56][56];
extern unsigned char dung_map_g[56][56];
extern unsigned char dung_map_b[56][56];
extern "C" void GTE_RotateFT4(POLY_FT4 *Ft4, int x, int y, int angle);
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB,
                 int spinradius, int spinbright, int angle, bool Sparkle, int OtPos,
                 bool cross, bool iso, unsigned char SinStep);
void PlaySfxLoc(int psfx, int x, int y);
extern unsigned char ItemCAnimTbl[169];
extern int *ItemAnimSnds;
extern short SinTab[32];
extern char _pcursitem[2];
extern int gr_scrxoff, gr_scryoff;
unsigned short SCR_GetBlackClut(void);
extern unsigned long ThisPrimAddr;
extern unsigned long AddrToAvoid;
int GetHighlightCol(int Index, char *SelList, unsigned short P1Col,
                    unsigned short P2Col, unsigned short P12Col);
int GetHighlightCol(int Index, int *SelList, unsigned short P1Col,
                    unsigned short P2Col, unsigned short P12Col);
void PRIM_GetPrim(POLY_FT4 **Prim);
void PRIM_GetPrim(POLY_GT4 **Prim);
void PRIM_CopyPrim(POLY_FT4 *Dest, POLY_FT4 *Source);
POLY_FT4 *PRIM_GetCopy(POLY_FT4 *Prim);
/* BLOCK.CPP-owned selection counters (SYM EXT UCHAR @0x8011AC8D..95, .sdata) and colours (SYM file STAT
   USHORT @0x8011AC96..A6, .sdata initialised -- values read from DIABPSX.BIN). */
unsigned char P1ObjSelCount = 0, P2ObjSelCount = 0, P12ObjSelCount = 0;
unsigned char P1ItemSelCount = 0, P2ItemSelCount = 0, P12ItemSelCount = 0;
unsigned char P1MonstSelCount = 0, P2MonstSelCount = 0, P12MonstSelCount = 0;
static unsigned short P1ObjSelCol = 0x3C00, P2ObjSelCol = 0x000F, P12ObjSelCol = 0x3C0F;
static unsigned short P1ItemSelCol = 0x3C00, P2ItemSelCol = 0x000F, P12ItemSelCol = 0x3C0F;
static unsigned short P1MonstSelCol = 0x3C00, P2MonstSelCol = 0x000F, P12MonstSelCol = 0x3C0F;

/* @0x8008D41C BLOCK.CPP:310 */
void UpdateSel(unsigned short *Col, unsigned short Add, unsigned char *Count)
{
    *Col &= 0x7FFF;
    if (*Count < 0x10)
        *Col += Add;
    else
        *Col -= Add;
    *Col |= 0x8000;
}

/* @0x8008D45C BLOCK.CPP:321 */
void CycleSelCols(void)
{
    if (PauseMode == 0 && stextflag == 0 && qtextflag == 0) {
        UpdateSel(&P1ObjSelCol, 0x400, &P1ObjSelCount);
        P1ObjSelCount = (P1ObjSelCount + 1) & 0x1F;
        UpdateSel(&P2ObjSelCol, 1, &P2ObjSelCount);
        P2ObjSelCount = (P2ObjSelCount + 1) & 0x1F;
        UpdateSel(&P12ObjSelCol, 0x401, &P12ObjSelCount);
        P12ObjSelCount = (P12ObjSelCount + 1) & 0x1F;
        UpdateSel(&P1ItemSelCol, 0x400, &P1ItemSelCount);
        P1ItemSelCount = (P1ItemSelCount + 1) & 0x1F;
        UpdateSel(&P2ItemSelCol, 1, &P2ItemSelCount);
        P2ItemSelCount = (P2ItemSelCount + 1) & 0x1F;
        UpdateSel(&P12ItemSelCol, 0x401, &P12ItemSelCount);
        P12ItemSelCount = (P12ItemSelCount + 1) & 0x1F;
        UpdateSel(&P1MonstSelCol, 0x400, &P1MonstSelCount);
        P1MonstSelCount = (P1MonstSelCount + 1) & 0x1F;
        UpdateSel(&P2MonstSelCol, 1, &P2MonstSelCount);
        P2MonstSelCount = (P2MonstSelCount + 1) & 0x1F;
        UpdateSel(&P12MonstSelCol, 0x401, &P12MonstSelCount);
        P12MonstSelCount = (P12MonstSelCount + 1) & 0x1F;
    }
}

/* @0x8008D614 BLOCK.CPP:358 */
int CBlocks::FindTownCreature(int GameEqu)
{
    for (unsigned int f = 0; f < 10; f++) {
        int Creature = TownConv[f].GetCreature(GameEqu);
        if (Creature != -1)
            return Creature;
    }
    return -1;
}

/* @0x8008D688 BLOCK.CPP:375 */
int CBlocks::FindCreature(int MgNum)
{
    for (unsigned int f = 0; f < MonsterList->NumOfMonsters; f++) {
        if (MonsterList->TheList[f] == MgNum)
            return f;
    }
    DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x17E);
    return -1;
}

/* @0x8008D6FC BLOCK.CPP:392 */
CBlocks::CBlocks(int BgId, int ObjId, int ItemId, int Level, int List)
{
    CursX = -1;
    CursY = -1;
    ClipRect.x = 1;
    ClipRect.w = 0x13E;
    RndX = 0;
    RndY = 0;
    IsTown = 0;
    ClipRect.y = 0;
    ClipRect.h = 0xF0;
    SetScrollTarget(0, 0);
    SetXY(0, 0);
    MonstTexId = -1;
    MonstTexDat = NULL;
    MonsterList = NULL;
    ObjTexId = -1;
    ObjTexDat = NULL;
    ItemTexId = -1;
    ItemTexDat = NULL;
    BgTexId = -1;
    BgTexDat = NULL;
    Load(BgId);
    InitColourCycling();
    BgTexId = BgId;
    BgTexDat = (struct TextDat *)this;
    if (ItemId != -1)
        SetItemGraphics(ItemId);
    UPDATEPROGRESS(1);
    if (ObjId != -1)
        SetObjGraphics(ObjId);
    UPDATEPROGRESS(1);
    if (Level != -1 && List != -1 && Level != 0)
        SetMonsterGraphics(Level, List);
    UPDATEPROGRESS(1);
    CurrentBlocks = this;
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
    Level--;
    if (Level < 0 || !(Level < NumOfMonsterListLevels))
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x1DB);
    MonstLevel *MLev = &AllLevels[Level];
    if (List < 0 || MLev->NumOfLists < List)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x1DD);
    MonstList *MList = &MLev->TheLists[List];
    MonstTexId = MList->TexNum;
    MonstTexDat = GM_UseTexData(MonstTexId);
    MonsterList = MList;
}

extern struct TextDat *MissDat;

/* @0x8008D960 BLOCK.CPP:493 */
CBlocks::~CBlocks()
{
    DumpMonsters();
    DumpObjs();
    DumpItems();
    DumpGt4s();
    DumpRects();
    if (MissDat)
        GM_FinishedUsing(MissDat);
    MissDat = NULL;
    CurrentBlocks = NULL;
}

/* @0x8008D9E8 BLOCK.CPP:515 */
void CBlocks::DumpGt4s()
{
    if (hndGt4s != -1) {
        unsigned char ret = GAL_Free(hndGt4s);
        if (!ret)
            DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x208);
        Gt4s = NULL;
        hndGt4s = -1;
    }
}

/* @0x8008DA50 BLOCK.CPP:531 */
void CBlocks::DumpRects()
{
    if (hndRects != -1) {
        unsigned char ret = GAL_Free(hndRects);
        if (!ret)
            DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x218);
        Rects = NULL;
        hndRects = -1;
    }
}

/* @0x8008DAB8 BLOCK.CPP:548 */
void CBlocks::SetGraphics(struct TextDat **TDat, int *pId, int Id)
{
    if (Id != *pId) {
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

extern struct CTextFileInfo *TX_DatTab[];
struct FileIO;
FileIO *SYSI_GetFs(void);

/* @0x8008DB64 BLOCK.CPP:624 */
void CBlocks::Load(int Id)
{
    if (!Loaded) {
        FileIO *Fs = SYSI_GetFs();
        SetFileInfo(TX_DatTab[Id], -1);
        Use(-1, 1, 0);
        if (hndBlockOffsets == -1)
            DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x277);
        NumOfBlocks = *(int *)Blocks;
        MakeGt4Table();
        MakeRectTable();
    }
}

/* @0x8008DC1C BLOCK.CPP:648 */
void CBlocks::MakeRectTable()
{
    unsigned char *MyBlocks;
    int *BlockOffsets;

    hndRects = GAL_Alloc(NumOfBlocks * 8, 0x8001, "RECTTAB");
    if (hndRects == -1)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x296);

    Rects = (RECT *)GAL_Lock(hndRects);
    if (!Rects)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x299);

    BlockOffsets = (int *)GAL_Lock(hndBlockOffsets);
    if (!BlockOffsets)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x29F);

    MyBlocks = Blocks;
    if (!MyBlocks)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x2A2);

    for (int f = 0; f < NumOfBlocks; f++)
        ((CBlock *)&MyBlocks[BlockOffsets[f]])->GetBoundingBox(*this, Rects[f]);

    GAL_Unlock(hndBlockOffsets);
    if (!hndBlockOffsets)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x2AD);
}

/* @0x8008DD70 BLOCK.CPP:698 */
void CBlocks::MakeGt4Table()
{
    hndGt4s = GAL_Alloc(Hdr->NumOfFrames * 16, 0x8001, "GT4TAB");
    if (hndGt4s == -1)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x2BC);

    Gt4s = (LittleGt4 *)GAL_Lock(hndGt4s);
    if (!Gt4s)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x2BE);

    for (unsigned int f = 0; f < Hdr->NumOfFrames; f++) {
        POLY_GT4 ThisGt4;
        MakeGt4(&ThisGt4, &Frames[f]);
        Gt4s[f].InitFromGt4(&ThisGt4, Frames[f].W, Frames[f].H);
        Gt4s[f].Flags = 0;
        if (Frames[f].Floor)
            Gt4s[f].Flags |= 1;
        if (Frames[f].Floor || Frames[f].NotTrans)
            Gt4s[f].Flags |= 2;
        if (Frames[f].Cycle && !leveltype)
            Gt4s[f].Flags |= 0x10;
    }
}

/* @0x8008DF54 BLOCK.CPP:729 — the nine-bit width is a const unsigned-short temporary:
 * it folds out of SYM and preserves retail's W-mask before H-mask instruction order. */
void CBlocks::MakeGt4(POLY_GT4 *GT4, FRAME_HDR *Fr)
{
    const unsigned long WH = ((unsigned long *)Fr)[2];
    int H = WH >> 9;
    setPolyGT4(GT4);
    const unsigned short W = WH & 0x1FF;
    H &= 0x1FF;
    setXYWH(GT4, 0, 0, W, H);
    GT4->clut = ((unsigned short *)GetPal(Fr->PalNum))[1];
    int Rotated = Fr->Rotated;
    int Tpage = ((FRAME_TP *)Fr)->Tpage;
    int zU = ((FRAME_TP *)Fr)->U;
    int zV = ((FRAME_TP *)Fr)->V;
    int zW = Fr->W;
    int zH = Fr->H;
    setSemiTrans(GT4, 0);
    if (!Rotated) {
        GT4->u0 = zU;
        GT4->v0 = zV;
        GT4->u1 = zU + zW;
        GT4->v1 = zV;
        GT4->u2 = zU;
        GT4->v2 = zV + zH;
        GT4->u3 = zU + zW;
        GT4->v3 = zV + zH;
    } else {
        GT4->v0 = zV + zW - 1;
        GT4->v2 = zV + zW - 1;
        GT4->u0 = zU;
        GT4->u2 = zU + zH;
        GT4->u1 = zU;
        GT4->v1 = zV - 1;
        GT4->u3 = zU + zH;
        GT4->v3 = zV - 1;
    }
    GT4->tpage = Tpage;
    setShadeTex(GT4, 0);
}

/* @0x8008E07C BLOCK.CPP:801 -- mangled FR7CBlocksii = a FREE function taking CBlocks& (not a method) */
void MyRoutine(CBlocks &B, int x, int y)
{
    OldSp = (int)SetSp((void *)0x1F8003F0);
    B.PrintMap(x, y);
    SetSp((void *)OldSp);
}

/* @0x8008E0E4 BLOCK.CPP:810 */
void CBlocks::SetRandOffset(int QuakeAmount)
{
    RndX = GU_GetRndRange(QuakeAmount * 2) - QuakeAmount;
    RndY = GU_GetRndRange(QuakeAmount * 2) - QuakeAmount;
}

extern struct PlayerStruct plr[2];   /* @0x800DA538 */
static BOOL InfraFlag;               /* @0x8011C65C file STAT */

/* @0x8008E140 BLOCK.CPP:816 */
void CBlocks::Print()
{
    if (plr[0]._pInfraFlag || plr[1]._pInfraFlag)
        InfraFlag = 1;
    else
        InfraFlag = 0;
    int MxInt = (short)(Mx >> 16) - RndX;
    int MyInt = (short)(My >> 16) - RndY;
    MyRoutine(*this, MxInt, MyInt);
    if (!leveltype) {
        PrintItems(MxInt, MyInt);
        PrintTowners(MxInt, MyInt);
    } else {
        PrintDead(MxInt, MyInt);
        PrintMonsters(MxInt, MyInt);
        PrintObjects(MxInt, MyInt);
        PrintItems(MxInt, MyInt);
    }
    PrintMissiles(MxInt, MyInt);
    RndX = 0;
    RndY = 0;
}

/* @0x8008E25C BLOCK.CPP:854 */
void CBlocks::SetXY(int nx, int ny)
{
    Mx = nx;
    My = ny;
    SetScrollTarget(Mx, ny);
}

/* @0x8008E284 BLOCK.CPP:867 */
void CBlocks::GetXY(int *nx, int *ny)
{
    *nx = Mx;
    *ny = My;
}

/* @0x8008E29C BLOCK.CPP:879 */
void CBlocks::InitColourCycling()
{
    int CycleIndex = -1;
    for (int f = 0; f < GetNumOfFrames() && CycleIndex == -1; f++) {
        if (Frames[f].Cycle) {
            unsigned short *pal = (unsigned short *)GetPal(Frames[f].PalNum);
            CycleIndex = pal[1];
        }
    }
    if (CycleIndex != -1)
        water_clut = CycleIndex;

    CycleIndex = -1;
    for (int f = 0; f < GetNumOfFrames() && CycleIndex == -1; f++) {
        if (Frames[f].PentaGram) {
            unsigned short *pal = (unsigned short *)GetPal(Frames[f].PalNum);
            CycleIndex = pal[1];
        }
    }
    if (CycleIndex != -1)
        penta_clut = CycleIndex;
}

/* @0x8008E3E8 BLOCK.CPP:958 */
void CBlocks::GetGCol(int x, int y, unsigned char *Rgb, RGBData *Data)
{
    int rgb_itxr, rgb_itxg, rgb_itxb;
    int rgb_leftr, rgb_leftg, rgb_leftb;
    int rgb_rightr, rgb_rightg, rgb_rightb;
    int rgb_cordr, rgb_cordg, rgb_cordb;

    if (x > 64)
        x = 64;
    if (y > 128)
        y = 128;
    if (x < 0)
        x = 0;
    if (y < 0)
        y = 0;
    rgb_leftr = (y * Data->rgb_ity1.r) >> 16;
    rgb_leftr += Data->rgbb.r1;
    rgb_rightr = (y * Data->rgb_ity2.r) >> 16;
    rgb_rightr += Data->rgbb.r2;
    rgb_leftg = (y * Data->rgb_ity1.g) >> 16;
    rgb_leftg += Data->rgbb.g1;
    rgb_rightg = (y * Data->rgb_ity2.g) >> 16;
    rgb_rightg += Data->rgbb.g2;
    rgb_leftb = (y * Data->rgb_ity1.b) >> 16;
    rgb_leftb += Data->rgbb.b1;
    rgb_rightb = (y * Data->rgb_ity2.b) >> 16;
    rgb_rightb += Data->rgbb.b2;
    rgb_itxr = (rgb_rightr - rgb_leftr) << 10;
    rgb_itxg = (rgb_rightg - rgb_leftg) << 10;
    rgb_itxb = (rgb_rightb - rgb_leftb) << 10;
    rgb_cordr = (x * rgb_itxr) >> 16;
    rgb_cordr += rgb_leftr;
    rgb_cordg = (x * rgb_itxg) >> 16;
    rgb_cordg += rgb_leftg;
    rgb_cordb = (x * rgb_itxb) >> 16;
    rgb_cordb += rgb_leftb;
    Rgb[0] = rgb_cordr;
    Rgb[1] = rgb_cordg;
    Rgb[2] = rgb_cordb;
}

extern int restore_r;                       /* @0x8011B8F8 */
extern int restore_g;                       /* @0x8011B8FC */
extern int restore_b;                       /* @0x8011B900 */
extern unsigned short dungeon[48][48];      /* @0x800E40C4 */
/* BLOCK.CPP-owned tuning globals (SYM EXT, .sdata, values from DIABPSX.BIN). */
int OtShift = 0;
int OldLighting = 1;
int GMXAdj2 = -40;
int GMYAdj2 = 40;
int Adjust = 0;
int ax = 0;
int ay = 0;
static int LightMethod = 0;
void PRIM_Clip(RECT *R, int Depth);
void PRIM_FullScreen(int Depth);
extern "C" void ABL_SetBlockRGBXY(RgbBlockInf *Inf, int x, int y, BOOL DoTrans);
extern "C" void ABL_PrintPart(CPart *Part, LittleGt4 *Gt4, POLY_GT4 *Dest);

/* @0x8008E528 BLOCK.CPP:1025 */
void CBlocks::PrintMap(int x, int y)
{
    int XPos;
    int YPos;
    int xx;
    int BlankBlock;
    unsigned char *MyBlocks;
    int *BlockOffsets;
    int XPix;
    int YPix;
    int nx;
    int ny;
    int CLeft;
    int CRight;
    int CTop;
    int CBottom;

    BlockOffsets = (int *)GAL_Lock(hndBlockOffsets);
    if (!BlockOffsets)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x40C);
    MyBlocks = Blocks;
    if (!MyBlocks)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x40F);
    CycleSelCols();
    switch (leveltype) {
    case 0:
        BlankBlock = 3;
        break;
    case 1:
        BlankBlock = 0x16;
        break;
    case 2:
        BlankBlock = 0xC;
        break;
    case 3:
        BlankBlock = 8;
        break;
    case 4:
        BlankBlock = 0x14;
        break;
    default:
        BlankBlock = 0;
        break;
    }
    XPix = x % 40;
    YPix = y % 40;
    XPos = x / 40;
    YPos = y / 40;
    if (x < 0) {
        XPos--;
        XPix += 40;
    }
    nx = WorldToScrX(x, y) - WorldToScrX(x - XPix, y - YPix);
    ny = WorldToScrY(x, y) - WorldToScrY(x - XPix, y - YPix);
    if (!IsTown) {
        nx -= WorldToScrX(320, 320);
        ny -= WorldToScrX(320, 320);
        XPos -= 8;
        YPos -= 8;
    }
    x = GMXAdj2 - nx;
    y = GMYAdj2 - ny;
    x += ClipRect.x;
    y += ClipRect.y;
    CLeft = ClipRect.x;
    CRight = ClipRect.x + ClipRect.w;
    CTop = ClipRect.y;
    CBottom = ClipRect.y + ClipRect.h;
    if (XPix - YPix < 0) {
        XPos--;
        x -= 40;
        xx = 1;
    } else
        xx = 0;

    while (x < CRight) {
        int ThisY;
        int ThisXPos;
        int ThisYPos;
        int Height;

        ThisY = y;
        if (xx & 1)
            ThisY -= 20;
        ThisXPos = XPos;
        ThisYPos = YPos;
        Height = 0;
        while (y < CBottom && ++Height < 11) {
            CPart *Parts;
            CBlock *MyBlock;
            int BlockNum;
            RGBData MyRgbData;
            int bx;
            int by;

            if ((unsigned)ThisYPos < 47 && (unsigned)ThisXPos < 47) {
                BlockNum = dungeon[ThisXPos][ThisYPos];
                MyRgbData.rgbb.r1 = dung_map_r[ThisXPos - 1][ThisYPos];
                MyRgbData.rgbb.g1 = dung_map_g[ThisXPos - 1][ThisYPos];
                MyRgbData.rgbb.b1 = dung_map_b[ThisXPos - 1][ThisYPos];
                MyRgbData.rgbb.r2 = dung_map_r[ThisXPos][ThisYPos - 1];
                MyRgbData.rgbb.g2 = dung_map_g[ThisXPos][ThisYPos - 1];
                MyRgbData.rgbb.b2 = dung_map_b[ThisXPos][ThisYPos - 1];
                MyRgbData.rgbb.r3 = dung_map_r[ThisXPos][ThisYPos + 1];
                MyRgbData.rgbb.g3 = dung_map_g[ThisXPos][ThisYPos + 1];
                MyRgbData.rgbb.b3 = dung_map_b[ThisXPos][ThisYPos + 1];
                MyRgbData.rgbb.r4 = dung_map_r[ThisXPos + 1][ThisYPos];
                MyRgbData.rgbb.g4 = dung_map_g[ThisXPos + 1][ThisYPos];
                MyRgbData.rgbb.b4 = dung_map_b[ThisXPos + 1][ThisYPos];
            } else {
                MyRgbData.rgbb.r1 = MyRgbData.rgbb.r2 = MyRgbData.rgbb.r3 = MyRgbData.rgbb.r4 = restore_r;
                MyRgbData.rgbb.g1 = MyRgbData.rgbb.g2 = MyRgbData.rgbb.g3 = MyRgbData.rgbb.g4 = restore_g;
                MyRgbData.rgbb.b1 = MyRgbData.rgbb.b2 = MyRgbData.rgbb.b3 = MyRgbData.rgbb.b4 = restore_b;
                BlockNum = BlankBlock;
            }
            if (ThisXPos - 1 < 1) {
                MyRgbData.rgbb.r1 = restore_r;
                MyRgbData.rgbb.g1 = restore_g;
                MyRgbData.rgbb.b1 = restore_b;
            }
            bx = (ThisXPos + 8) * 2;
            by = (ThisYPos + 8) * 2;
            if (BlockNum) {
                RECT *BlockR;
                int clipx;
                int clipy;

                BlockNum--;
                BlockR = &Rects[BlockNum];
                MyBlock = (CBlock *)(MyBlocks + BlockOffsets[BlockNum]);
                clipx = BlockR->x + x;
                clipy = BlockR->y + ThisY;
                if (clipx + BlockR->w >= CLeft && clipx < CRight && clipy + BlockR->h >= CTop && clipy < CBottom) {
                    int NumOfParts;
                    BOOL DoTrans;
                    int OtPos;
                    BOOL PFlag;

                    DoTrans = 0;
                    MyRgbData.rgb_ity1.r = (MyRgbData.rgbb.r3 - MyRgbData.rgbb.r1) << 9;
                    MyRgbData.rgb_ity1.g = (MyRgbData.rgbb.g3 - MyRgbData.rgbb.g1) << 9;
                    MyRgbData.rgb_ity1.b = (MyRgbData.rgbb.b3 - MyRgbData.rgbb.b1) << 9;
                    MyRgbData.rgb_ity2.r = (MyRgbData.rgbb.r4 - MyRgbData.rgbb.r2) << 9;
                    MyRgbData.rgb_ity2.g = (MyRgbData.rgbb.g4 - MyRgbData.rgbb.g2) << 9;
                    MyRgbData.rgb_ity2.b = (MyRgbData.rgbb.b4 - MyRgbData.rgbb.b2) << 9;
                    NumOfParts = MyBlock->NumOfParts;
                    if (dung_map[bx][by].dTransVal) {
                        for (int p = 0; p < 2; p++) {
                            if (plr[p].plractive) {
                                if (plr[p]._py - 6 < by && by < plr[p]._py + 6) {
                                    if (plr[p]._px - 6 < bx && bx < plr[p]._px + 6)
                                        DoTrans = 1;
                                }
                                if (plr[p]._py - 4 < by && by < plr[p]._py + 4 && plr[p]._px - 4 < bx && bx < plr[p]._px + 4 && !DoTrans)
                                    DoTrans = 1;
                            }
                        }
                    }
                    ABL_SetBlockRGBXY(&GlBlockInf, x, ThisY, DoTrans);
                    Parts = &MyBlock->Parts[NumOfParts - 1];
                    OtPos = ThisY - 40;
                    if (OtPos < -0x43)
                        OtPos = -0x43;
                    if (OtPos > 0x19B)
                        OtPos = 0x19B;
                    OtPos += 0x4D;
                    PFlag = (dung_map[bx][by].dFlags >> 5) & 1;
                    for (int f = 0; f < NumOfParts; f++) {
                        POLY_GT4 *DestGt4;
                        LittleGt4 *ThisGt4;
                        unsigned char Flags;
                        int W;
                        int H;

                        ThisGt4 = &Gt4s[Parts->Piece];
                        PRIM_GetPrim(&DestGt4);
                        ABL_PrintPart(Parts, ThisGt4, DestGt4);
                        Flags = ThisGt4->Flags;
                        if (Flags & 0x10)
                            addPrim(&ThisOt[1], DestGt4);
                        else if (Flags & 1)
                            addPrim(&ThisOt[3], DestGt4);
                        else
                            addPrim(&ThisOt[OtPos], DestGt4);
                        W = ThisGt4->w;
                        H = ThisGt4->h;
                        if (PFlag) {
                            int r;
                            int g;
                            int b;

                            r = MyRgbData.rgbb.r1;
                            g = MyRgbData.rgbb.g1;
                            b = MyRgbData.rgbb.b1;
                            DestGt4->r0 = r;
                            DestGt4->g0 = g;
                            DestGt4->b0 = b;
                            r = MyRgbData.rgbb.r2;
                            g = MyRgbData.rgbb.g2;
                            b = MyRgbData.rgbb.b2;
                            DestGt4->r1 = r;
                            DestGt4->g1 = g;
                            DestGt4->b1 = b;
                            r = MyRgbData.rgbb.r3;
                            g = MyRgbData.rgbb.g3;
                            b = MyRgbData.rgbb.b3;
                            DestGt4->r2 = r;
                            DestGt4->g2 = g;
                            DestGt4->b2 = b;
                            r = MyRgbData.rgbb.r4;
                            g = MyRgbData.rgbb.g4;
                            b = MyRgbData.rgbb.b4;
                            DestGt4->r3 = r;
                            DestGt4->g3 = g;
                            DestGt4->b3 = b;
                        } else {
                            GetGCol(Parts->X, 128 - Parts->Y, &DestGt4->r0, &MyRgbData);
                            GetGCol(Parts->X + W, 128 - Parts->Y, &DestGt4->r1, &MyRgbData);
                            GetGCol(Parts->X, H + (128 - Parts->Y), &DestGt4->r2, &MyRgbData);
                            GetGCol(Parts->X + W, H + (128 - Parts->Y), &DestGt4->r3, &MyRgbData);
                        }
                        Parts--;
                    }
                }
            }
            ThisXPos++;
            ThisYPos++;
            ThisY += 40;
        }
        if (!(xx & 1))
            YPos--;
        else
            XPos++;
        x += 40;
        xx++;
    }
    PRIM_Clip(&ClipRect, 1);
    PRIM_FullScreen(100);
    GAL_Unlock(hndBlockOffsets);
    if (!hndBlockOffsets)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x53D);
}

extern struct map_info dung_map[112][112];   /* @0x800E7A28 */

/* @0x8008F098 BLOCK.CPP:1350 */
void CBlocks::IterateVisibleMap(int x, int y, int (*Func)(CacheInfo *, map_info *, int, int), bool VisCheck)
{
    int XPos;
    int YPos;
    int xx;
    BOOL Infra = InfraFlag;
    int MyXShifter;
    int MyYShifter;
    int Total;
    BOOL DoVisCheck = VisCheck;
    int XPix;
    int YPix;
    int CRight;
    CachedInfoList *List;

    if (Infra)
        DoVisCheck = 0;
    Total = 0;
    if (!IsTown) {
        x -= 320;
        y -= 320;
        MyXShifter = 8;
        MyYShifter = 8;
    } else {
        MyXShifter = 0;
        MyYShifter = 0;
    }
    XPix = x % 40;
    YPix = y % 40;
    XPos = x / 40;
    YPos = y / 40;
    if (x < 0) {
        XPos--;
        XPix += 40;
    }
    x = YPix - XPix - 40;
    x += ClipRect.x;
    CRight = ClipRect.x + ClipRect.w;
    if (XPix - YPix < 0) {
        XPos--;
        x -= 40;
        xx = 1;
    } else
        xx = 0;

    List = (CachedInfoList *)0x1F800000;
    while (1) {
        if (!(x < CRight))
            break;
        int ThisXPos = XPos;
        int ThisYPos = YPos;
        int Height = 0;
        while (1) {
            if (!(ThisYPos < 46))
                break;
            if (!(ThisXPos < 46))
                break;
            if (!(++Height < 11))
                break;
            if (ThisYPos >= 0 && ThisYPos < 46 && ThisXPos >= 0 && ThisXPos <= 46) {
                map_info *p0, *p1, *p2, *p3;
                int myx = (ThisXPos + MyXShifter) * 2;
                int myy = (ThisYPos + MyYShifter) * 2;
                p0 = &dung_map[myx][myy];
                p1 = &dung_map[myx + 1][myy];
                p2 = &dung_map[myx][myy + 1];
                p3 = &dung_map[myx + 1][myy + 1];
                if (DoVisCheck) {
                    if (p0->dFlags & 3)
                        Total += Func(&List->Items[Total], p0, myx, myy);
                    if (p1->dFlags & 3)
                        Total += Func(&List->Items[Total], p1, myx + 1, myy);
                    if (p2->dFlags & 3)
                        Total += Func(&List->Items[Total], p2, myx, myy + 1);
                    if (p3->dFlags & 3)
                        Total += Func(&List->Items[Total], p3, myx + 1, myy + 1);
                } else {
                    Total += Func(&List->Items[Total], p0, myx, myy);
                    Total += Func(&List->Items[Total], p1, myx + 1, myy);
                    Total += Func(&List->Items[Total], p2, myx, myy + 1);
                    Total += Func(&List->Items[Total], p3, myx + 1, myy + 1);
                }
            }
            ThisXPos++;
            ThisYPos++;
        }
        if (!(xx & 1))
            YPos--;
        else
            XPos++;
        x += 40;
        xx++;
    }
    List->NumOfItems = Total;
}

extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern struct MissileStruct missile[125];   /* @0x80102C58 */
extern struct ObjectStruct object[127];     /* @0x800D8C4C */
extern struct ItemStruct item[128];         /* @0x800D1D54 */
extern char dMissArray[32][4];              /* @0x80105174 */
unsigned char GetdDead(int x, int y);       /* DPIECE.CPP:174 */

/* @0x8008F510 BLOCK.CPP:1510 */
int AddMonst(CacheInfo *Info, map_info *p0, int bx, int by)
{
    int nMonster = p0->dMonster;
    int Index = 0;
    int bFlags = p0->dFlags;
    if (nMonster > 0) {
        MonsterStruct *MyMonst;
        int mi = nMonster - 1;
        MyMonst = &monster[mi];
        Index = 1;
        Info->uMStr.MyMonst = (unsigned long)MyMonst;
        Info->uMStr.Index = mi;
    }
    if (bFlags & 0x40) {
        if (p0->dMissile > 0) {
            if (missile[p0->dMissile - 1]._mitype == 0x14) {
                int ThisIndex = missile[p0->dMissile - 1]._misource;
                Info[Index].uMStr.MyMonst = (unsigned long)&monster[ThisIndex];
                Info[Index].uMStr.Index = ThisIndex;
                Index++;
            }
        }
    }
    return Index;
}

extern int UniqTransPals[194];              /* @0x8010A794 */
extern struct STONEPAL StonePals[32];       /* @0x8010AA9C */
void StartPartJump(int mi, int height, int scale, int colour, int OtPos);

/* @0x8008F5F8 BLOCK.CPP:1555 */
void CBlocks::PrintMonsters(int x, int y)
{
    TextDat *CMonstGraphics;
    int Total;
    int Wx;
    int Wy;
    int Cx;
    int Cy;
    TextDat *GolemGraphics;
    CachedInfoList *InfoList = (CachedInfoList *)0x1F800000;

    IterateVisibleMap(x, y, AddMonst, 1);
    Total = InfoList->NumOfItems;
    CMonstGraphics = MonstTexDat;
    Wx = WorldToScrX(x - 7, y - 11);
    Wy = WorldToScrY(x - 7, y - 11);
    Cx = ClipRect.x;
    Cy = ClipRect.y;
    GolemGraphics = GM_UseTexData(0xD0);
    for (int f = 0; f < Total; f++) {
        int Index;

        Index = InfoList->Items[f].uMStr.Index;
        if (Index < 4) {
            MonsterStruct *MyMonst;
            int Frame;
            int Action;
            int Dir;
            int PhysFrame;
            int Creature;
            int ScrXOff;
            int ScrYOff;
            POLY_FT4 *Ft4;
            POLY_FT4 *ShadFt4;
            BOOL StartAnim;
            static int AddVal[4];   /* @0x8011CBD0 */
            int bx;
            int by;

            StartAnim = 0;
            MyMonst = (MonsterStruct *)(InfoList->Items[f].uMStr.MyMonst | 0x80000000);
            bx = MyMonst->_mx / 2 - 8;
            by = MyMonst->_my / 2 - 8;
            ScrXOff = MyMonst->_mxoff * 625 / 1000;
            ScrYOff = MyMonst->_myoff * 625 / 1000;
            /* Block-local, record-less products (x/y parameters die at the Wx/Wy setup, retail s0/s1).
               Sx/Sy/OtPos are declared after the 625/1000 divisions: retail's spill slots put the
               division constant ahead of Sx/Sy/OtPos. */
            int x = MyMonst->_mx * 20;
            int y = MyMonst->_my * 20;
            int Sx = Cx + WorldToScrX(x, y) + ScrXOff - Wx;
            int Sy = Cy + WorldToScrY(x, y) + ScrYOff - Wy;
            Creature = 1;
            int OtPos = GetOtPos(Sy);
            Action = MyMonst->Action;
            Frame = MyMonst->_mAnimFrame - 1;
            if (Action == 5) {
                Action = 0;
                StartAnim = 1;
                if (Frame == 0)
                    AddVal[Index] = 0;
            }
            if (!(Action < GolemGraphics->GetNumOfActions(Creature))) {
                if (Frame == 1)
                    StartPartJump(Index, 0, 0x8000, 0x606060, OtPos);
            } else {
                int blockr;
                int blockg;
                int blockb;

                blockr = dung_map_r[bx][by];
                blockg = dung_map_g[bx][by];
                blockb = dung_map_b[bx][by];
                Dir = MyMonst->_mdir;
                PhysFrame = GolemGraphics->GetFrNum(Creature, Action, Dir, Frame);
                Ft4 = GolemGraphics->PrintFt4(PhysFrame, Sx, Sy, GolemGraphics->IsDirAliased(Creature, Action, Dir), OtPos, 0);
                setRGB0(Ft4, blockr, blockg, blockb);
                setShadeTex(Ft4, 0);
                if (StartAnim) {
                    int AVal = AddVal[Index];
                    Ft4->y0 -= AVal;
                    Ft4->y1 -= AVal;
                    Ft4->x0 += AVal >> 2;
                    Ft4->x2 += AVal >> 2;
                    Ft4->x1 -= AVal >> 2;
                    Ft4->x3 -= AVal >> 2;
                    AVal++;
                    if (AVal > 40)
                        AVal = 40;
                    AddVal[Index] = AVal;
                }
                ShadFt4 = PRIM_GetCopy(Ft4);
                ShadScaleSkew(ShadFt4);
                addPrim(&ThisOt[OtPos], ShadFt4);
            }
        }
    }
    GM_FinishedUsing(GolemGraphics);
    BOOL MyInfraFlag;
    MyInfraFlag = InfraFlag;
    for (int DoCompress = 0; DoCompress < 2; DoCompress++) {
        int MaxDecompress = 8;
        for (int f = 0; f < Total; f++) {
            int Frame;
            int Action;
            int Dir;
            int Creature;
            int ScrXOff;
            int ScrYOff;
            RECT R;
            int GType;
            int Sx;
            int Sy;
            int Index;
            int transfile;
            int Mg;

            Index = InfoList->Items[f].uMStr.Index;
            if (Index >= 4) {
                MonsterStruct *MyMonst = (MonsterStruct *)(InfoList->Items[f].uMStr.MyMonst | 0x80000000);
                if (!(MyMonst->_mFlags & 1)) {
                    int bx;
                    int by;
                    int mx;
                    int my;
                    BOOL PrintIt;
                    BOOL Compressed;

                    ScrXOff = MyMonst->_mxoff * 625 / 1000;
                    ScrYOff = MyMonst->_myoff * 625 / 1000;
                    Frame = MyMonst->_mAnimFrame - 1;
                    Mg = MyMonst->MData->GraphicType;
                    GType = Mg;
                    mx = MyMonst->_mx;
                    my = MyMonst->_my;
                    Dir = MyMonst->_mdir;
                    if (MyMonst->MType->mtype == 40 && MyMonst->_mmode == 14) {
                        Action = 0;
                        Frame = 0;
                    } else
                        Action = MyMonst->Action;
                    Creature = 0;
                    for (unsigned int g = 0; g < MonsterList->NumOfMonsters; g++) {
                        if (MonsterList->TheList[g] == GType) {
                            Creature = g;
                            break;
                        }
                    }
                    Compressed = CMonstGraphics->IsCompressed(Creature, Action, Dir, Frame);
                    PrintIt = Compressed != 0;
                    if (!DoCompress)
                        PrintIt ^= 1;
                    if (PrintIt) {
                        int OtPos;
                        POLY_FT4 *Ft4;
                        int blockr;
                        int blockg;
                        int blockb;
                        POLY_FT4 *ShadFt4;
                        int paloff;
                        int Col;

                        if (Compressed) {
                            if (MaxDecompress)
                                MaxDecompress--;
                            else {
                                int NumFrames = CMonstGraphics->GetNumOfFrames(Creature, Action);
                                if (NumFrames != 1) {
                                    /* zero-test arm first: dbr then drops the join's redundant sll (retail) */
                                    if (!Frame)
                                        Frame = 1;
                                    else
                                        Frame--;
                                }
                            }
                        }
                        bx = mx / 2 - 8;
                        by = my / 2 - 8;
                        Sx = Cx + WorldToScrX(mx * 20, my * 20) + ScrXOff - Wx;
                        Sy = Cy + WorldToScrY(mx * 20, my * 20) + ScrYOff - Wy;
                        OtPos = GetOtPos(Sy);
                        Ft4 = CMonstGraphics->PrintMonster(Creature, Action, Dir, Frame, Sx, Sy, OtPos);
                        if (!(dung_map[mx][my].dFlags & 3) && MyInfraFlag) {
                            blockr = 0x90;
                            blockg = 0;
                            blockb = 0;
                        } else {
                            blockr = dung_map_r[bx][by];
                            blockg = dung_map_g[bx][by];
                            blockb = dung_map_b[bx][by];
                        }
                        setRGB0(Ft4, blockr, blockg, blockb);
                        ShadFt4 = PRIM_GetCopy(Ft4);
                        ShadScaleSkew(ShadFt4);
                        addPrim(&ThisOt[OtPos], ShadFt4);
                        paloff = Action == 4;
                        if (MyMonst->_uniqtype)
                            /* shift spelling: keeps the -1 out of pointer_int_sum's constant split (retail addiu -1) */
                            transfile = UniqTransPals[((MyMonst->_uniqtype - 1) << 1) + paloff];
                        else
                            transfile = TransPals[MyMonst->MData->TransFile * 2 + paloff];
                        if (MyMonst->_mmode == 15 || (Mg == 10 && (MyMonst->_mFlags & 4))) {
                            int SPal = StonePals[Mg].StonePal;
                            if (Action == 4 && SPal == 2)
                                SPal = 3;
                            if (Mg == 29)
                                SPal += Action;
                            transfile = SPal;
                            ObjTexDat->SetPal(ObjTexDat->GetFr(transfile), Ft4);
                        } else if (transfile) {
                            /* record-less single-use holder: retail's three record-less levels at 0x8008FF70 */
                            FRAME_HDR *Fr = ObjTexDat->GetFr(transfile);
                            ObjTexDat->SetPal(Fr, Ft4);
                        }
                        if (Mg == 1) {
                            ShadFt4->y0 += 20;
                            ShadFt4->y1 += 20;
                            ShadFt4->y2 += 20;
                            ShadFt4->y3 += 20;
                        }
                        Col = GetHighlightCol(Index, _pcursmonst, P1ObjSelCol | 0x8000, P2ObjSelCol | 0x8000, P12ObjSelCol | 0x8000);
                        if (Col != -1) {
                            Ft4->clut = SCR_NeedHighlightPal(Ft4->clut, Col, 16);
                            setSemiTrans(Ft4, 1);
                        }
                    }
                }
            }
        }
    }
}

/* @0x8009009C BLOCK.CPP:1915 */
int AddTowners(CacheInfo *Info, map_info *p0, int bx, int by)
{
    int nMonster = p0->dMonster;
    if (nMonster > 0) {
        MonsterStruct *MyMonst;
        int mi = nMonster - 1;
        MyMonst = &monster[mi];
        Info->uMStr.MyMonst = (unsigned long)MyMonst;
        Info->uMStr.Index = mi;
        return 1;
    }
    return 0;
}

extern struct TownerStruct towner[16];      /* @0x800CFE80 */
extern BOOL FRIGFLAG;                       /* @0x8011BB48 */
extern unsigned long *ThisOt;               /* @0x8011AAB4 */
extern int _pcursmonst[2];                  /* @0x8011B758 */
unsigned short SCR_NeedHighlightPal(unsigned short Clut, unsigned short PixVal, int NumOfCols);

/* @0x800900F8 BLOCK.CPP:1941 */
void CBlocks::PrintTowners(int x, int y)
{
    static int YPos = 0;         /* @0x8011ACD8 */
    static int YVel = 0xA0000;   /* @0x8011ACDC */
    int Total;
    int Wx;
    int Wy;
    int Cx;
    int Cy;
    CachedInfoList *InfoList = (CachedInfoList *)0x1F800000;

    YVel -= 0x8000;
    YPos += YVel;
    if (YPos < 0) {
        YPos = 0;
        YVel = 0xA0000;
    }
    IterateVisibleMap(x, y, AddTowners, 1);
    Total = InfoList->NumOfItems;
    /* x - 7 / y - 11 passed as arguments, not assigned: retail loads a0 = this first */
    Wx = WorldToScrX(x - 7, y - 11);
    Wy = WorldToScrY(x - 7, y - 11);
    Cx = ClipRect.x;
    Cy = ClipRect.y;
    for (int f = 0; f < Total; f++) {
        int Creature;
        int mi;
        POLY_FT4 *Ft4;
        TextDat *ThisData;
        int PhysFrame;
        int GameFrame;
        int Dir;
        int Sx;
        int Sy;
        int OtPos;
        int Col;

        if (!MonstTexDat)
            DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x7C2);
        mi = InfoList->Items[f].uMStr.Index;
        ThisData = MonstTexDat;
        GameFrame = towner[mi]._tAnimFrame - 1;
        Dir = towner[mi]._tdir;
        Creature = FindTownCreature(towner[mi]._ttype);
        PhysFrame = ThisData->GetFrNum(Creature, 0, Dir, GameFrame);
        PRIM_GetPrim(&Ft4);
        /* accumulated *20 (tx*4 + tx, *4): retail builds the product in x's own register */
        x = towner[mi]._tx * 4;
        x += towner[mi]._tx;
        x *= 4;
        y = towner[mi]._ty * 4;
        y += towner[mi]._ty;
        y *= 4;
        Sx = Cx + WorldToScrX(x, y) - Wx;
        Sy = Cy + WorldToScrY(x, y) - Wy;
        OtPos = GetOtPos(Sy);
        ThisData->PrepareFt4(Ft4, PhysFrame, Sx, Sy, 0, 0);
        if (FRIGFLAG) {
            Ft4->y0 -= (short)(YPos >> 16);
            Ft4->y1 -= (short)(YPos >> 16);
        }
        addPrim(&ThisOt[OtPos], Ft4);
        Col = GetHighlightCol(mi, _pcursmonst, P1MonstSelCol | 0x8000, P2MonstSelCol | 0x8000, P12MonstSelCol | 0x8000);
        if (Col != -1) {
            Ft4->clut = SCR_NeedHighlightPal(Ft4->clut, Col, 16);
            setSemiTrans(Ft4, 1);
        }
        if (Creature != 4) {
            POLY_FT4 *ShadFt4 = PRIM_GetCopy(Ft4);
            ShadScaleSkew(ShadFt4);
            addPrim(&ThisOt[OtPos], ShadFt4);
        }
    }
}

/* @0x800904B0 BLOCK.CPP:2051 */
int AddObject(CacheInfo *Info, map_info *p0, int bx, int by)
{
    int bObject = p0->dObject;
    if (bObject > 0) {
        ObjectStruct *OStr = &object[bObject - 1];
        Info->uOStr.MyObject = (unsigned long)OStr;
        Info->uOStr.Index = bObject - 1;
        return 1;
    }
    return 0;
}

extern OBJ_PFUNC ObjPrintFuncs[98];              /* @0x800E39E4 */
extern struct ObjDataStruct AllObjects[99];      /* @0x800D84B0 */
extern struct OBJ_LOAD_INFO ObjMasterLoadList[56];   /* @0x801169F0 */
extern char _pcursobj[2];                        /* @0x8011B760 */

/* @0x8009050C BLOCK.CPP:2076 */
void CBlocks::PrintObjects(int x, int y)
{
    int Total;
    int Wx;
    int Wy;
    int Cx;
    int Cy;
    CachedInfoList *InfoList = (CachedInfoList *)0x1F800000;

    IterateVisibleMap(x, y, AddObject, 0);
    Total = InfoList->NumOfItems;
    /* x - 7 / y - 11 as fresh single-set values: sched1 interleaves a0/x-7/a1/y-11/a2 as retail. */
    Wx = WorldToScrX(x - 7, y - 11);
    Wy = WorldToScrY(x - 7, y - 11);
    Cx = ClipRect.x;
    Cy = ClipRect.y;
    for (int z = 0; z < 2; z++) {
        for (int f = 0; f < Total; f++) {
            int Sx;
            int Sy;
            int LoadIndex;
            ObjectStruct *OStr;
            BOOL DoCreature;
            OBJ_PFUNC PFunc;
            int Index;

            OStr = (ObjectStruct *)(InfoList->Items[f].uOStr.MyObject | 0x80000000);
            Index = InfoList->Items[f].uOStr.Index;
            PFunc = ObjPrintFuncs[OStr->_otype];
            if (z)
                DoCreature = PFunc != 0;
            else
                DoCreature = PFunc == 0;
            if (DoCreature) {
                int AnimFrame;
                int OtPos;
                POLY_FT4 *Ft4;
                int Creature;
                int PhysFrame;
                TextDat *ObjDat;
                int bx;
                int by;
                int Col;
                int blockr;
                int blockg;
                int blockb;

                LoadIndex = AllObjects[OStr->_otype].ofindex;
                if (ObjMasterLoadList[LoadIndex].TexDat)
                    ObjDat = BgTexDat;
                else
                    ObjDat = ObjTexDat;
                /* Block-local, record-less product holders (retail SYM has none; the mid-block
                   declaration opens retail's record-less level at the products).  Keeping them
                   apart from the x/y parameters lets x - 7 / y - 11 tie with x/y (retail s0/s1). */
                int x = OStr->_ox * 20;
                int y = OStr->_oy * 20;
                bx = OStr->_ox / 2 - 8;
                by = OStr->_oy / 2 - 8;
                Sx = Cx + WorldToScrX(x, y) - Wx;
                Sy = Cy + WorldToScrY(x, y) - Wy;
                OtPos = GetOtPos(Sy);
                AnimFrame = OStr->_oAnimFrame - 1;
                LoadIndex = AllObjects[OStr->_otype].ofindex;
                Creature = ObjMasterLoadList[LoadIndex].Creature;
                ObjDat->GetCreature(Creature);
                PhysFrame = ObjDat->GetFrNum(Creature, 0, 0, AnimFrame);
                if (PFunc)
                    Ft4 = PFunc(OStr, Sx, Sy, ObjDat, OtPos);
                else {
                    Ft4 = ObjDat->PrintFt4(PhysFrame, Sx, Sy, 0, OtPos, 0);
                    if (ObjDat->GetFr(PhysFrame)->NotTrans) {
                        POLY_FT4 *ShadFt4 = PRIM_GetCopy(Ft4);
                        ShadScaleSkew(ShadFt4);
                        addPrim(&ThisOt[OtPos], ShadFt4);
                    }
                }
                setShadeTex(Ft4, 0);
                Col = GetHighlightCol(Index, _pcursobj, P1ObjSelCol | 0x8000, P2ObjSelCol | 0x8000, P12ObjSelCol | 0x8000);
                if (Col != -1) {
                    Ft4->clut = SCR_NeedHighlightPal(Ft4->clut, Col, 16);
                    setSemiTrans(Ft4, 1);
                }
                blockr = dung_map_r[bx][by];
                blockg = dung_map_g[bx][by];
                blockb = dung_map_b[bx][by];
                setRGB0(Ft4, blockr, blockg, blockb);
            }
        }
    }
}

/* @0x80090968 BLOCK.CPP:2193 */
int AddDead(CacheInfo *Info, map_info *p0, int bx, int by)
{
    int bDead = GetdDead(bx, by);
    if (bDead >= 0x10)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0x896);
    if (bDead) {
        Info->uDStr.x = bx;
        Info->uDStr.y = by;
        Info->uDStr.Index = bDead;
        return 1;
    }
    return 0;
}

extern struct DeadStruct dead[31];          /* @0x800CEB10 */
extern struct CMonster Monsters[16];        /* @0x8010A3BC */
extern int TransPals[134];                  /* @0x8010A57C */
extern unsigned char dung_map_r[56][56];    /* @0x80100228 */
extern unsigned char dung_map_g[56][56];    /* @0x80100E68 */
extern unsigned char dung_map_b[56][56];    /* @0x80101AA8 */

/* @0x800909F4 BLOCK.CPP:2217 */
void CBlocks::PrintDead(int x, int y)
{
    int Total;
    int Wx;
    int Wy;
    int Cx;
    int Cy;
    CachedInfoList *InfoList;

    IterateVisibleMap(x, y, AddDead, 0);
    InfoList = (CachedInfoList *)0x1F800000;
    Total = InfoList->NumOfItems;
    Wx = WorldToScrX(x - 7, y - 11);
    Wy = WorldToScrY(x - 7, y - 11);
    Cx = ClipRect.x;
    Cy = ClipRect.y;
    for (int f = 0; f < Total; f++) {
        int bDead;
        int dx;
        int dy;
        int Frame;
        int Creature;
        POLY_FT4 *Ft4;
        int transfile;
        int Sx;
        int Sy;
        int Mg;
        CMonster *MyMonst;

        bDead = InfoList->Items[f].uDStr.Index & 0x1F;
        MyMonst = &Monsters[(dead - 1)[bDead]._deadtype];
        Mg = MyMonst->MData->GraphicType;
        if (Mg != 13) {
            int bx;
            int by;
            int blockr;
            int blockg;
            int blockb;

            Creature = FindCreature(Mg);
            dx = InfoList->Items[f].uDStr.x + 16;
            dy = InfoList->Items[f].uDStr.y + 16;
            Frame = MonstTexDat->GetNumOfFrames(Creature, 4) - 1;
            Sx = Cx + WorldToScrX((dx - 16) * 20, (dy - 16) * 20) - Wx;
            Sy = Cy + WorldToScrY((dx - 16) * 20, (dy - 16) * 20) - Wy;
            GetOtPos(Sy);
            Ft4 = MonstTexDat->PrintMonster(Creature, 4, 0, Frame, Sx, Sy, 4);
            transfile = MyMonst->MData->TransFile;
            if (transfile) {
                FRAME_HDR *Fr = ObjTexDat->GetFr(TransPals[transfile * 2 + 1]);
                ObjTexDat->SetPal(Fr, Ft4);
            }
            bx = dx / 2 - 16;
            by = dy / 2 - 16;
            blockr = dung_map_r[bx][by];
            blockg = dung_map_g[bx][by];
            blockb = dung_map_b[bx][by];
            setRGB0(Ft4, blockr, blockg, blockb);
            setShadeTex(Ft4, 0);
        }
    }
}

/* @0x80090CB8 BLOCK.CPP:2308 */
int AddItem(CacheInfo *Info, map_info *p0, int bx, int by)
{
    int bItem = p0->dItem;
    if (bItem) {
        Info->uIStr.MyItem = (unsigned long)&item[bItem - 1];
        Info->uIStr.Index = bItem - 1;
        return 1;
    }
    return 0;
}

extern "C" void GTE_RotateFT4(POLY_FT4 *Ft4, int x, int y, int angle);
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, bool Sparkle, int OtPos, bool cross, bool iso, unsigned char SinStep);
void PlaySfxLoc(int psfx, int x, int y);
extern unsigned char ItemCAnimTbl[169];     /* @0x800D1BE0 */
extern int *ItemAnimSnds;                   /* @0x8011B890 */
extern short SinTab[32];                    /* @0x80116178 */
extern char _pcursitem[2];                  /* @0x8011B764 */

/* @0x80090D14 BLOCK.CPP:2329 */
void CBlocks::PrintItems(int x, int y)
{
    int Total;
    int Wx;
    int Wy;
    int Cx;
    int Cy;
    CachedInfoList *InfoList = (CachedInfoList *)0x1F800000;

    IterateVisibleMap(x, y, AddItem, 0);
    Total = InfoList->NumOfItems;
    Wx = WorldToScrX(x - 7, y - 11);
    Wy = WorldToScrY(x - 7, y - 11);
    Cx = ClipRect.x;
    Cy = ClipRect.y;
    for (int z = 0; z < 2; z++) {
        BOOL DoAnim = z == 0;
        for (int f = 0; f < Total; f++) {
            int Sx;
            int Sy;
            ItemStruct *IStr;
            int OtPos;
            POLY_FT4 *Ft4;
            int Index;
            int bx;
            int by;
            int Col;
            int blockr;
            int blockg;
            int blockb;

            Ft4 = NULL;
            IStr = (ItemStruct *)(InfoList->Items[f].uIStr.MyItem | 0x80000000);
            Index = InfoList->Items[f].uIStr.Index;
            /* Block-local, record-less products: x/y parameters die at the Wx/Wy setup (retail s0/s1). */
            int x = IStr->_ix * 20;
            int y = IStr->_iy * 20;
            bx = IStr->_ix / 2 - 8;
            by = IStr->_iy / 2 - 8;
            Sx = Cx + WorldToScrX(x, y) - Wx;
            Sy = Cy + WorldToScrY(x, y) - Wy;
            OtPos = GetOtPos(Sy);
            if (DoAnim) {
                if (IStr->_iAnimFlag) {
                    FRAME_HDR *Fr;
                    int W;
                    int H;
                    short height;

                    Ft4 = ItemTexDat->PrintFt4(IStr->ItemFrame, Sx, Sy, 0, OtPos, 0);
                    Fr = ItemTexDat->GetFr(IStr->ItemFrame);
                    W = Fr->W;
                    H = Fr->H;
                    if (!Fr->Rotated) {
                        Ft4->v2--;
                        Ft4->v3--;
                    } else {
                        Ft4->v0--;
                        Ft4->v2--;
                    }
                    /* Record-less retail holder (s6, BLOCK.CPP:2409; its mid-block declaration opens the
                       record-less level at 0x80090F6C).  A char holder copy-propagates away like retail. */
                    char Ang = IStr->_iAnimFrame & 0x1F;
                    W >>= 1;
                    H >>= 1;
                    GTE_RotateFT4(Ft4, Ft4->x0 + W, Ft4->y0 + H, Ang << 8);
                    /* == SinTab[Ang] >> 2 for every 16-bit entry; the scaled spelling keeps CSE from
                       folding the extendhisi2 shift pair into one sra 18, so combine forms retail's lh; sra 2. */
                    height = SinTab[Ang] * 4 >> 4;
                    if (height < 0) {
                        int it = ItemCAnimTbl[IStr->_iCurs];
                        PlaySfxLoc(ItemAnimSnds[it], IStr->_ix, IStr->_iy);
                        IStr->_iAnimFrame = item[Index]._iAnimLen;
                        IStr->_iAnimFlag = 0;
                        IStr->_iSelFlag = 1;
                        height = 0;
                    }
                    if (height > 0)
                        height = -height;
                    Ft4->y0 += height;
                    Ft4->y1 += height;
                    Ft4->y2 += height;
                    Ft4->y3 += height;
                    W >>= 1;
                    H >>= 1;
                    W += Fr->X;
                    H += Fr->Y + height;
                    if (!IStr->IDidx)
                        DrawSpinner(Sx + W, Sy + H, 0x80, 0x60, 0x20, 0x30, -height * 2, -(Ang * 4), 0, OtPos + 1, 1, 0, 8);
                    else
                        DrawSpinner(Sx + W, Sy + H, 0x60, 0x60, 0x60, 0x10, -height * 2, -(Ang * 4), 0, OtPos + 1, 1, 0, 8);
                }
            } else {
                if (!IStr->_iAnimFlag) {
                    if (IStr->IDidx == 9 && IStr->_iSelFlag == 2)
                        Ft4 = ItemTexDat->PrintFt4(IStr->ItemFrame, Sx, Sy, 0, OtPos, 0);
                    else
                        Ft4 = ItemTexDat->PrintFt4(IStr->ItemFrame, Sx, Sy, 0, OtPos, 0);
                }
            }
            Col = GetHighlightCol(Index, _pcursitem, P1ItemSelCol | 0x8000, P2ItemSelCol | 0x8000, P12ItemSelCol | 0x8000);
            if (Col != -1) {
                Ft4->clut = SCR_NeedHighlightPal(Ft4->clut, Col, 16);
                setSemiTrans(Ft4, 1);
            } else
                setSemiTrans(Ft4, 0);
            blockr = dung_map_r[bx][by];
            blockg = dung_map_g[bx][by];
            blockb = dung_map_b[bx][by];
            if (!leveltype)
                blockr = blockg = blockb = 0x80;
            setRGB0(Ft4, blockr, blockg, blockb);
            setShadeTex(Ft4, 0);
        }
    }
}

/* @0x800912D4 BLOCK.CPP:2489 */
int AddMissile(CacheInfo *Info, map_info *p0, int bx, int by)
{
    int bFlags = p0->dFlags;
    if (bFlags & 0x40) {
        if (p0->dMissile > 0) {
            int MissIndex = p0->dMissile - 1;
            if (missile[MissIndex]._mitype != 0x14) {
                Info->uMissStr.MyMiss = (unsigned long)&missile[MissIndex];
                Info->uMissStr.Index = MissIndex;
                return 1;
            }
        }
        if ((signed char)p0->dMissile < 0) {
            int dMiss = p0->dMissile & 0x1F;
            int nMiss = (((signed char)p0->dMissile >> 5) & 3) + 1;
            int MissIndex;
            int Index = 0;
            int f;
            for (f = 0; f < nMiss; f++) {
                MissIndex = dMissArray[dMiss][f] - 1;
                Index++;
                Info->uMissStr.MyMiss = (unsigned long)&missile[MissIndex];
                Info->uMissStr.Index = MissIndex;
                Info++;
            }
            return Index;
        }
    }
    return 0;
}

/* @0x800913EC BLOCK.CPP:2531 */
void CBlocks::PrintMissiles(int x, int y)
{
    CachedInfoList *InfoList;
    int Wx;
    int Wy;
    int Cx;
    int Cy;
    int Total;

    IterateVisibleMap(x, y, AddMissile, 0);
    InfoList = (CachedInfoList *)0x1F800000;
    Total = InfoList->NumOfItems;
    Wx = WorldToScrX(x - 7, y - 11);
    Wy = WorldToScrY(x - 7, y - 11);
    Cx = ClipRect.x;
    Cy = ClipRect.y;
    for (int f = 0; f < Total; f++) {
        int Sx;
        int Sy;
        MissileStruct *MissStr = (MissileStruct *)(InfoList->Items[f].uMissStr.MyMiss | 0x80000000);
        Sy = MissStr->_miy * 20;
        int mx = MissStr->_mix * 20;   /* record-less loop-local holder (retail: own local reg, no SYM record) */
        Sx = Cx + WorldToScrX(mx, Sy) - Wx;
        Sy = Cy + WorldToScrY(mx, Sy) - Wy;
        Sx += MissStr->_mixoff * 625 / 1000;
        Sy += MissStr->_miyoff * 625 / 1000;
        ((void (*)(MissileStruct *, int, int, int))MissStr->PrintPtr)(MissStr, Sx, Sy, GetOtPos(Sy));
    }
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

/* @0x8009160C BLOCK.CPP:2619 */
void CBlocks::SetScrollTarget(int x, int y)
{
    StX = (x - ScrToWorldX(ClipRect.w / 2, ClipRect.h / 2)) * 65536;
    StY = (y - ScrToWorldY(ClipRect.w / 2, ClipRect.h / 2)) * 65536;
}

extern int gr_scrxoff;
extern int gr_scryoff;
static int dx[3];   /* @0x8011CBE0 file STAT */
static int dy[3];   /* @0x8011CBF0 file STAT */

/* @0x800916D0 BLOCK.CPP:2633 */
void CBlocks::DoScroll()
{
    int XDiff = StX - Mx;
    int YDiff = StY - My;
    int divnum = 16;

    dx[0] = dx[1];
    dx[1] = dx[2];
    dx[2] = XDiff;
    dy[0] = dy[1];
    dy[1] = dy[2];
    dy[2] = YDiff;
    XDiff = (dx[0] + dx[1] + dx[2]) / 3;
    YDiff = (dy[0] + dy[1] + dy[2]) / 3;
    XDiff /= divnum;
    YDiff /= divnum;
    Mx += XDiff;
    My += YDiff;
    gr_scrxoff = Mx;
    gr_scryoff = My;
}

unsigned short SCR_GetBlackClut(void);

/* @0x800917BC BLOCK.CPP:2702 */
void CBlocks::SetPlayerPosBlocks(int PlayerNum, int bx, int by)
{
    if (PlayerNum < 0 || PlayerNum >= 2)
        DBG_Error(NULL, "psxsrc/BLOCK.CPP", 0xA8F);
    if (!IsTown) {
        bx -= 16;
        by -= 16;
    }
    pBlockX[PlayerNum] = bx / 2;
    pBlockY[PlayerNum] = by / 2;
}

/* @0x8009185C BLOCK.CPP:2723 */
void CBlocks::GetScrXY(RECT &R, int x, int y, int sxoff, int syoff)
{
    int Sx = ClipRect.x + WorldToScrX(x, y) + sxoff - WorldToScrX((short)(Mx >> 16), (short)(My >> 16));
    int Sy = ClipRect.y + WorldToScrY(x, y) + syoff - WorldToScrY((short)(Mx >> 16), (short)(My >> 16));
    R.x = Sx;
    R.y = Sy;
}

/* @0x80091930 BLOCK.CPP:2745 */
void CBlocks::ShadScaleSkew(POLY_FT4 *Ft4)
{
    int H;
    int NewTop;
    int W;

    setRGB0(Ft4, 64, 64, 64);
    H = Ft4->y2 - Ft4->y0;
    W = H;
    H = (H * 3) >> 3;
    W = (W * 9) >> 5;
    NewTop = Ft4->y2 - H;
    Ft4->y0 = NewTop;
    Ft4->y1 = NewTop;
    Ft4->x0 -= W;
    setShadeTex(Ft4, 0);
    Ft4->x1 -= W;
    setSemiTrans(Ft4, 1);
    Ft4->clut = SCR_GetBlackClut();
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

/* @0x800919EC BLOCK.CPP:2805 */
CBlocks *BL_GetCurrentBlocks(void)
{
    return CurrentBlocks;
}

/* @0x800919F8 BLOCK.CPP:115 */
int GetHighlightCol(int Index, char *SelList, unsigned short P1Col, unsigned short P2Col, unsigned short P12Col)
{
    if (SelList[0] == SelList[1]) {
        if (SelList[0] == Index)
            return P12Col;
    }
    if (Index == SelList[0])
        return P1Col & 0xFFFF;
    if (Index == SelList[1])
        return P2Col & 0xFFFF;
    return -1;
}

extern unsigned long ThisPrimAddr;
extern unsigned long AddrToAvoid;

/* @0x80091A40 PRIMPOOL.H (header copy):65 */
void PRIM_GetPrim(POLY_FT4 **Prim)
{
    if (!(ThisPrimAddr + 0x190 < AddrToAvoid))
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (POLY_FT4 *)ThisPrimAddr;
    ThisPrimAddr = ThisPrimAddr + 0x28;
}

/* @0x80091ABC BLOCK.CPP:115 */
int GetHighlightCol(int Index, int *SelList, unsigned short P1Col, unsigned short P2Col, unsigned short P12Col)
{
    if (SelList[0] == SelList[1]) {
        if (SelList[0] == Index)
            return P12Col;
    }
    if (Index == SelList[0])
        return P1Col & 0xFFFF;
    if (Index == SelList[1])
        return P2Col & 0xFFFF;
    return -1;
}

/* @0x80091B04 PRIMPOOL.H (header copy):84 */
POLY_FT4 *PRIM_GetCopy(POLY_FT4 *Prim)
{
    POLY_FT4 *RetPrim;
    PRIM_GetPrim(&RetPrim);
    PRIM_CopyPrim(RetPrim, Prim);
    return RetPrim;
}

/* @0x80091B40 PRIMPOOL.H (header copy):65 */
void PRIM_GetPrim(POLY_GT4 **Prim)
{
    if (!(ThisPrimAddr + 0x208 < AddrToAvoid))
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (POLY_GT4 *)ThisPrimAddr;
    ThisPrimAddr = ThisPrimAddr + 0x34;
}

/* @0x80091BBC PRIMPOOL.H (header copy):75 */
void PRIM_CopyPrim(POLY_FT4 *Dest, POLY_FT4 *Source)
{
    unsigned long *Dest32 = (unsigned long *)Dest;
    unsigned long *Source32 = (unsigned long *)Source;
    for (unsigned int f = 0; f < 10; f++)
        *Dest32++ = *Source32++;
}

/* @0x80091BE4 BLOCK.CPP:239 */
int TownToCreature::GetCreature(int GameCreature)
{
    if (GameCreature != GameEqu)
        return -1;
    return CreatureEquate;
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

/* @0x80091CC0 BLOCK.H (header copy):177 */
int CBlocks::GetOtPos(int LogicalY)
{
    int OtPos = ClipRect.y + LogicalY + PosAdj;
    if (OtPos < -0x43) OtPos = -0x43;
    if (OtPos > 0x19B) OtPos = 0x19B;
    return OtPos + 0x4D;
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
    v3 = Gt4->v3;
    w = nw;
    h = nh;
}

/* @0x80091D84 BLOCK.CPP:1350 (GMAN.H header copy):253 */
int TextDat::GetNumOfFrames(int Creature, int Action)
{
    CCreatureHdr *hdr = (CCreatureHdr *)GetCreature(Creature);
    return hdr->GetAction(Action)->NumOfFrames;
}

/* @0x80091DBC GMAN.H (header copy):252 */
int TextDat::GetNumOfActions(int Creature)
{
    return *(int *)GetCreature(Creature);
}

/* @0x80091DE0 GMAN.H (header copy):284 */
CCreatureHdr *TextDat::GetCreature(int Creature)
{
    return (CCreatureHdr *)((char *)CreatureAnims + CreatureOffset[Creature]);
}

/* @0x80091DFC GMAN.H (header copy):240 */
void TextDat::SetFileInfo(const CTextFileInfo *NewInfo, int NewTexNum)
{
    FileInfo = (CTextFileInfo *)NewInfo;
    TexNum = NewTexNum;
}

/* @0x80091E08 GMAN.H (header copy):233 */
int TextDat::GetNumOfFrames()
{
    return Hdr->NumOfFrames;
}

/* @0x80091E1C GMAN.H (header copy):232 */
PAL *TextDat::GetPal(int PalNum)
{
    return (PAL *)((char *)Pals + PalOffset[PalNum]);
}

/* @0x80091E38 GMAN.H (header copy):229 */
FRAME_HDR *TextDat::GetFr(int FrNum)
{
    return Frames + (unsigned short)FrNum;
}
