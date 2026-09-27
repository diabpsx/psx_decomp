/* COMPMAP.CPP -- Diablo PSX (Climax 1998) reconstruction: compressed per-level DLevel store (PSX-only).
 * Bodies from the retail oracle (asm/nonmatchings/compmap) + SYM (scratch/tuinfo.py COMPMAP.CPP / COMPMAP.H).
 * CompClass is the abstract compressor (DoComp / DoDecomp virtuals, vtable slots 1/2), same shape as msg.cpp. */
#include "diabpsx_types.h"
#include "glibdev/gal.h"
#include "glibdev/gdebug.h"

extern "C" {
void *memcpy(void *Dest, const void *Src, unsigned long n);
void *memset(void *s, int c, unsigned long n);
long GAL_AlignSizeToType(unsigned long Size, unsigned long MemType);   /* @0x800227E0 GAL.C:1769 */
long GAL_SplitBlock(long CurBlock, unsigned long Size);               /* @0x800212E4 GAL.C:195 */
}

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "source/COMPMAP.cpp", line)   /* retail line literals */

#define NUM_OF_MAPS 22

struct TCmdPItem {   /* sizeof 24 */
    unsigned char bCmd, x, y, bId, bDur, bMDur, bCh, bMCh;
    unsigned short wValue, wIndx, wCI;
    unsigned long dwSeed, dwBuff;
};
struct DObjectStr { unsigned char bCmd; };
struct DMonsterStr { unsigned char _mx, _my, _mdir, _menemy; int _mhitpoints; };
struct DLevel {   /* sizeof 4696 */
    TCmdPItem item[127];
    DObjectStr object[127];
    DMonsterStr monster[190];
};

class CompClass {
public:
    virtual int DoComp(unsigned char *Dest, const unsigned char *Src, int SrcLen) const = 0;
    virtual void DoDecomp(unsigned char *Dest, const unsigned char *Src, int DstLen, int SrcLen) const = 0;
};

struct CompressedLevs {   /* sizeof 180 */
    unsigned long Version;
    unsigned long Offset[NUM_OF_MAPS];
    unsigned long Size[NUM_OF_MAPS];
};

class AMap {
public:
    BOOL Compressed;     /* +0x0 */
    long hnd;            /* +0x4 */
    int Size;            /* +0x8 */
    DLevel *CurrLevel;   /* +0xC */

    AMap() { hnd = -1; Init(); }            /* COMPMAP.H:75 */
    ~AMap() { Init(); }                     /* COMPMAP.H:80 */
    BOOL IsCompressed() { return Compressed; }   /* COMPMAP.H:86 */
    void Init();
    int WriteCompressed(unsigned char *Dest, const CompClass &CompObj);
    void SetCompData(const unsigned char *Data, int NewSize);
    DLevel *GetMap();
    void ReleaseMap(DLevel *Dl);
    void CompressMap(const CompClass &CompObj);
    void DecompressMap(const CompClass &CompObj);
};

class CompLevelMaps {
public:
    CompClass *CompObj;              /* +0x0 */
    AMap TheMaps[NUM_OF_MAPS];       /* +0x4 */
    int LastNumOut;                  /* +0x164 */
    DLevel *LastMapOut;              /* +0x168 */
    BOOL MapOut;                     /* +0x16C */

    CompLevelMaps(const CompClass &NewCompObj);
    ~CompLevelMaps();
    void Init();
    void InitAllMaps();
    DLevel *GetMap(int MapNum);
    void ReleaseMap(DLevel *Dl);
    void ImportData(CompressedLevs *Levs);
    int ExportData(unsigned char *U8Dest);
    void MakeSureMapXDecomped(int MapNum);
    void CheckMapNum(int MapNum)     /* COMPMAP.H:129 */
    {
        if (!((unsigned)MapNum < NUM_OF_MAPS))
            DBG_Error(NULL, "source/compmap.h", 129);
    }
};

/* @0x80081608 COMPMAP.CPP:60 */
CompLevelMaps::CompLevelMaps(const CompClass &NewCompObj) : CompObj((CompClass *)&NewCompObj)
{
    Init();
}

/* @0x80081674 COMPMAP.CPP:71 */
CompLevelMaps::~CompLevelMaps()
{
    Init();
}

/* @0x80081704 COMPMAP.CPP:80 */
void CompLevelMaps::Init()
{
    InitAllMaps();
    LastMapOut = NULL;
    MapOut = 0;
}

/* @0x80081734 COMPMAP.CPP:91 */
void CompLevelMaps::InitAllMaps()
{
    for (int f = 0; f < NUM_OF_MAPS; f++)
        TheMaps[f].Init();
}

/* @0x80081788 COMPMAP.CPP:101 */
DLevel *CompLevelMaps::GetMap(int MapNum)
{
    ASSERT(!MapOut, 102);
    MakeSureMapXDecomped(MapNum);
    MapOut = 1;
    LastNumOut = MapNum;
    LastMapOut = TheMaps[MapNum].GetMap();
    return LastMapOut;
}

/* @0x80081804 COMPMAP.CPP:119 */
void CompLevelMaps::ReleaseMap(DLevel *Dl)
{
    ASSERT(MapOut, 120);
    MapOut = 0;
    CheckMapNum(LastNumOut);
    ASSERT(Dl == LastMapOut, 124);
    TheMaps[LastNumOut].ReleaseMap(Dl);
    LastMapOut = NULL;
}

/* @0x800818A4 COMPMAP.CPP:152 */
void CompLevelMaps::ImportData(CompressedLevs *Levs)
{
    ASSERT(Levs->Version == 0x100, 155);
    Init();
    for (int f = 0; f < NUM_OF_MAPS; f++) {
        int Size = Levs->Size[f];
        TheMaps[f].SetCompData((unsigned char *)Levs + Levs->Offset[f], Size);
    }
}

/* @0x80081950 COMPMAP.CPP:176 */
int CompLevelMaps::ExportData(unsigned char *U8Dest)
{
    unsigned char *BinPtr = U8Dest + sizeof(CompressedLevs);

    ((CompressedLevs *)U8Dest)->Version = 0x100;
    for (int f = 0; f < NUM_OF_MAPS; f++) {
        ((CompressedLevs *)U8Dest)->Offset[f] = BinPtr - U8Dest;
        ((CompressedLevs *)U8Dest)->Size[f] = TheMaps[f].WriteCompressed(BinPtr, *CompObj);
        BinPtr += GAL_AlignSizeToType(((CompressedLevs *)U8Dest)->Size[f], 1);
    }
    return BinPtr - U8Dest;
}

/* @0x800819FC COMPMAP.CPP:199 */
void CompLevelMaps::MakeSureMapXDecomped(int MapNum)
{
    for (int f = 0; f < NUM_OF_MAPS; f++) {
        if (f != MapNum) {
            AMap &Map = TheMaps[f];
            if (!Map.IsCompressed())
                Map.CompressMap(*CompObj);
        }
    }
    AMap &Map = TheMaps[MapNum];
    if (Map.IsCompressed())
        Map.DecompressMap(*CompObj);
}

/* @0x80081AA8 COMPMAP.CPP:229 */
void AMap::Init()
{
    if (hnd != -1) {
        unsigned char Freed = GAL_Free(hnd);
        ASSERT(Freed, 234);
    }
    hnd = -1;
    CurrLevel = NULL;
    Compressed = 0;
}

/* @0x80081B14 COMPMAP.CPP:248 */
int AMap::WriteCompressed(unsigned char *Dest, const CompClass &CompObj)
{
    unsigned char *Data;

    if (!Compressed)
        CompressMap(CompObj);
    Data = (unsigned char *)GetMap();
    memcpy(Dest, Data, Size);
    ReleaseMap((DLevel *)Data);
    return Size;
}

/* @0x80081B88 COMPMAP.CPP:265 */
void AMap::SetCompData(const unsigned char *Data, int NewSize)
{
    long NewHnd;
    unsigned char *Dest;

    Init();
    NewHnd = GAL_Alloc(NewSize, 1, NULL);
    ASSERT(NewHnd != -1, 273);
    Dest = (unsigned char *)GAL_Lock(NewHnd);
    ASSERT(Dest, 276);
    memcpy(Dest, Data, NewSize);
    ASSERT(GAL_Unlock(NewHnd), 281);
    hnd = NewHnd;
    Compressed = 1;
    Size = NewSize;
}

/* @0x80081C78 COMPMAP.CPP:293 */
DLevel *AMap::GetMap()
{
    DLevel *NewCurrLevel;

    ASSERT(!CurrLevel, 298);
    if (hnd == -1) {
        long NewHnd;

        NewHnd = GAL_Alloc(sizeof(DLevel), 1, "DL");
        ASSERT(NewHnd != -1, 307);
        NewCurrLevel = (DLevel *)GAL_Lock(NewHnd);
        ASSERT(NewCurrLevel, 310);
        memset(NewCurrLevel, 0xFF, sizeof(DLevel));
        ASSERT(GAL_Unlock(NewHnd), 315);
        hnd = NewHnd;
    }
    NewCurrLevel = (DLevel *)GAL_Lock(hnd);
    ASSERT(NewCurrLevel, 323);
    CurrLevel = NewCurrLevel;
    return NewCurrLevel;
}

/* @0x80081D98 COMPMAP.CPP:339 */
void AMap::ReleaseMap(DLevel *Dl)
{
    ASSERT(Dl == CurrLevel, 342);
    ASSERT(hnd != -1, 346);
    ASSERT(GAL_Unlock(hnd), 351);
    CurrLevel = NULL;
}

/* @0x80081E28 COMPMAP.CPP:361 */
void AMap::CompressMap(const CompClass &CompObj)
{
    long NewHnd;
    unsigned char *Dest;
    DLevel *Dlev;
    long SplitHnd;

    ASSERT(!CurrLevel, 362);
    ASSERT(!Compressed, 363);
    NewHnd = GAL_Alloc(sizeof(DLevel), 1, "DECB");
    ASSERT(NewHnd != -1, 372);
    Dest = (unsigned char *)GAL_Lock(NewHnd);
    ASSERT(Dest, 375);
    Dlev = GetMap();
    Size = CompObj.DoComp(Dest, (unsigned char *)Dlev, sizeof(DLevel));
    ASSERT(Size <= (int)sizeof(DLevel), 382);
    SplitHnd = GAL_SplitBlock(NewHnd, GAL_AlignSizeToType(Size, 1));
    if (SplitHnd != -1)
        ASSERT(GAL_Free(SplitHnd), 392);
    ReleaseMap(Dlev);
    Init();
    ASSERT(GAL_Unlock(NewHnd), 403);
    hnd = NewHnd;
    Compressed = 1;
}

/* @0x80081FEC COMPMAP.CPP:418 */
void AMap::DecompressMap(const CompClass &CompObj)
{
    long NewHnd;
    unsigned char *Dest;
    unsigned char *Src;

    ASSERT(!CurrLevel, 423);
    ASSERT(Compressed, 424);
    NewHnd = GAL_Alloc(sizeof(DLevel), 1, "DECB");
    ASSERT(NewHnd != -1, 434);
    Dest = (unsigned char *)GAL_Lock(NewHnd);
    ASSERT(Dest, 437);
    Src = (unsigned char *)GetMap();
    CompObj.DoDecomp(Dest, Src, sizeof(DLevel), Size);
    ReleaseMap((DLevel *)Src);
    Init();
    hnd = NewHnd;
    Compressed = 0;
}
