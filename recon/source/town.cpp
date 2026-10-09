/* TOWN.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/TOWN.CPP.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: T_DrawView only draws the overlays (store text, inventory, level-up icons of both
 * players, the Diablo message) and counts CowPlaying down; dPiece goes through SetDPiece(); the
 * town sectors fill dungeon[][] too when AddSec is set; P3Tiles is a file static pointing at
 * pMegaTiles (LoadMegaTiles), so T_FillTile/TownFixupBodges take it from there; the town
 * warps are closed from plr[myplr].pTownWarps; GRL_LoadFileInMemSig loads through the
 * FileIO system (directory stripped) into Tmalloc'd memory. */
#include "diabpsx_types.h"
#include "psxsrc/textfileinfo_header.h"   /* GMAN.H inlines: the ".tp"/".dat" literal pool heads TOWN's .sdata (0x8011BB00) */
#include "psxsrc/cplayer_header.h"
#include "source/gen/structs_town.h"
#include "source/gen/externs_town.h"
#include "cstring.h"

struct SysObj {
    long MemHnd;
};

struct FileIO {   /* sizeof 20 */
    struct SysObj SysObj;
    unsigned long MemId;
    long hndPath;
    char *SearchPath;
    void *_vf;   /* vptr slot: FileLen/ReadAtAddr are reached by direct jal here */
    int FileLen(const char *Name);
    BOOL ReadAtAddr(const char *Name, unsigned char *Dest, int Len);
};

#include "source/gen/protos_town.h"
#include "source/diablo.h"

extern "C" {
void DBG_Error(char *Text, char *File, int Line);
char *strrchr(const char *s, int c);
}

#define QUEST_DONE 3
#define Q_PWATER 13
#define LVL_DOWN 0
#define LVL_UP 1
#define LVL_TWARPUP 7

static unsigned char *P3Tiles;
int tile;   /* @0x8011BB0C: TOWN.CPP's uninitialised global, emitted after the literal pool */

/* @0x80074478 TOWN.CPP:129 */
void T_DrawView(int StartX, int StartY)
{
    if (GLUE_Finished() || IsGameLoading())
        return;

    if ((stextflag) && (!qtextflag)) DrawSText();

    if (!chrflag && !questlog) {
        if (invflag)
            DrawInv();
        else {
            if (plr[0].plractive && plr[0]._pStatPts) DrawLevelUpIcon(0);
            if (plr[1].plractive && plr[1]._pStatPts) DrawLevelUpIcon(1);
        }
    }

    if (msgflag && !_spselflag[0] && !_spselflag[1] && !iscflag && !PauseMode) DrawDiabloMsg();

    if (CowPlaying) CowPlaying--;
}

/* @0x80074628 TOWN.CPP:216 */
void T_FillSector(unsigned char *P3Tiles, unsigned char *pSector, int xi, int yi, int w, int h, BOOL AddSec)
{
    int i, j, xx, yy;
    long v1, v2, v3, v4, ii;

    ii = 4;
    yy = yi;
    if (AddSec) {
        unsigned short *Map = (unsigned short *)(pSector + 4);
        for (j = 0; j < h; j++)
            for (i = 0; i < w; i++)
                dungeon[xi / 2 + i][yi / 2 + j] = Map[i + j * w];
    }

    for (j = 0; j < h; j++) {
        xx = xi;
        for (i = 0; i < w; i++) {
            long Dave = *(short *)(pSector + ii);
            if (Dave) {
                Dave--;
                v1 = *(short *)(P3Tiles + Dave * 8 + 0) + 1;
                v2 = *(short *)(P3Tiles + Dave * 8 + 2) + 1;
                v3 = *(short *)(P3Tiles + Dave * 8 + 4) + 1;
                v4 = *(short *)(P3Tiles + Dave * 8 + 6) + 1;
            } else {
                v1 = 0;
                v2 = 0;
                v3 = 0;
                v4 = 0;
            }
            SetDPiece(xx, yy, v1);
            SetDPiece(xx + 1, yy, v2);
            SetDPiece(xx, yy + 1, v3);
            SetDPiece(xx + 1, yy + 1, v4);
            xx += 2;
            ii += 2;
        }
        yy += 2;
    }
}

/* @0x8007486C TOWN.CPP:282 */
void T_FillTile(unsigned char *P3Tiles, int xx, int yy, int t)
{
    long v1, v2, v3, v4;

    v1 = *(short *)(P3Tiles + (t - 1) * 8 + 0) + 1;
    SetDPiece(xx, yy, v1);
    v2 = *(short *)(P3Tiles + (t - 1) * 8 + 2) + 1;
    SetDPiece(xx + 1, yy, v2);
    v3 = *(short *)(P3Tiles + (t - 1) * 8 + 4) + 1;
    SetDPiece(xx, yy + 1, v3);
    v4 = *(short *)(P3Tiles + (t - 1) * 8 + 6) + 1;
    SetDPiece(xx + 1, yy + 1, v4);
    dungeon[xx / 2][yy / 2] = t;
}

/* @0x8007497C TOWN.CPP:343 */
void TownFixupBodges(void)
{
    T_FillTile(P3Tiles, 52, 54, 267);
    T_FillTile(P3Tiles, 40, 63, 267);
}

/* @0x800749BC TOWN.CPP:351 */
void T_Pass3(void)
{
    unsigned char *pSector;
    int xx, yy;

    for (yy = 0; yy < 112; yy += 2) {
        for (xx = 0; xx < 112; xx += 2) {
            SetDPiece(xx, yy, 0);
            SetDPiece(xx + 1, yy, 0);
            SetDPiece(xx, yy + 1, 0);
            SetDPiece(xx + 1, yy + 1, 0);
        }
    }

    for (int y = 0; y < 40; y++)
        for (int x = 0; x < 40; x++)
            dungeon[x][y] = 0;

    /* Retail has four empty sibling blocks here (a local each, no code; the original content is
     * compiled out -- PC: the shareware/quest shortcuts).  Reproduced as dead scopes. */
    { int t1; }
    { int t2; }
    { int t3; }
    { int t4; }

    LoadMegaTiles("TOWN.TIL");
    P3Tiles = pMegaTiles;

    pSector = GRL_LoadFileInMemSig("Sector1s.DUN", 0);
    T_FillSector(P3Tiles, pSector, 46, 46, 25, 25, 1);
    mem_free_dbg(pSector);

    pSector = GRL_LoadFileInMemSig("Sector2s.DUN", 0);
    T_FillSector(P3Tiles, pSector, 46, 0, 25, 23, 1);
    mem_free_dbg(pSector);

    pSector = GRL_LoadFileInMemSig("Sector3s.DUN", 0);
    T_FillSector(P3Tiles, pSector, 0, 46, 23, 25, 1);
    mem_free_dbg(pSector);

    pSector = GRL_LoadFileInMemSig("Sector4s.DUN", 0);
    T_FillSector(P3Tiles, pSector, 0, 0, 23, 23, 1);
    mem_free_dbg(pSector);

    TownFixupBodges();

    if (!(plr[myplr].pTownWarps & 1))
        T_FillTile(P3Tiles, 48, 20, 320);
    if (!(plr[myplr].pTownWarps & 2)) {
        T_FillTile(P3Tiles, 16, 68, 332);
        T_FillTile(P3Tiles, 16, 70, 331);
    }
    if (!(plr[myplr].pTownWarps & 4)) {
        for (xx = 36; xx < 46; xx++)
            T_FillTile(P3Tiles, xx, 78, ENG_random(4) + 1);
    }

    if ((quests[Q_PWATER]._qactive == QUEST_DONE) || (!quests[Q_PWATER]._qactive))
        T_FillTile(P3Tiles, 60, 70, 71);
    else
        T_FillTile(P3Tiles, 60, 70, 342);
}

/* @0x80074D48 TOWN.CPP:453 */
void CreateTown(int entry)
{
    dminx = 10;
    dminy = 10;
    dmaxx = 84;
    dmaxy = 84;

    if (entry == LVL_DOWN) {
        ViewX = 75;
        ViewY = 68;
    } else {
        if (entry == LVL_UP) {
            ViewX = 25;
            ViewY = 31;
        } else {
            if (entry == LVL_TWARPUP) {
                if (TWarpFrom == 5) {
                    ViewX = 49;
                    ViewY = 22;
                }
                if (TWarpFrom == 9) {
                    ViewX = 18;
                    ViewY = 69;
                }
                if (TWarpFrom == 13) {
                    ViewX = 41;
                    ViewY = 81;
                }
            }
        }
    }

    T_Pass3();

    for (int y = 0; y < 112; y++) {
        for (int x = 0; x < 112; x++) {
            dung_map[x][y].dFlags = 0;
            dung_map[x][y].dMonster = 0;
            dung_map[x][y].dObject = 0;
            dung_map[x][y].dItem = 0;
        }
    }
}

/* @0x80074E9C TOWN.CPP:568 */
unsigned char *GRL_LoadFileInMemSig(const char *Name, unsigned long *Len)
{
    FileIO *MyIo = SYSI_GetFs();
    char SmallName[20];
    unsigned char *Dest;

    GRL_StripDir(SmallName, Name);
    int FileLen = MyIo->FileLen(SmallName);
    if (FileLen == -1)
        DBG_Error(NULL, "source/TOWN.cpp", 583);
    if (Len)
        *Len = FileLen;
    Dest = (unsigned char *)Tmalloc(FileLen);
    if (!Dest)
        DBG_Error(NULL, "source/TOWN.cpp", 591);
    if (MyIo->ReadAtAddr(SmallName, Dest, -1) == 0)
        DBG_Error(NULL, "source/TOWN.cpp", 597);
    UPDATEPROGRESS(1);
    return Dest;
}

/* @0x80074F80 TOWN.CPP:612 */
void GRL_StripDir(char *Dest, const char *Src)
{
    char *BSlash = strrchr(Src, '\\');
    char *FSlash = strrchr(Src, '/');

    if (BSlash || FSlash) {
        char *Last;
        if (!BSlash) BSlash = (char *)Src;
        if (!FSlash) FSlash = (char *)Src;
        Last = BSlash;
        if (Last < FSlash) Last = FSlash;
        strcpy(Dest, Last + 1);
    } else
        strcpy(Dest, Src);
}
