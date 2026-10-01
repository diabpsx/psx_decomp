/* TRIGS.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/trigs.cpp
 * (the runtime trigger-checking half only -- the InitXTriggers() family is a separate TU,
 * recon/source/pretrigs.cpp).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: retail replaced the PC's per-frame linear scan of dPiece[cursmx][cursmy] against the
 * fixed level-up/down/twarp piece-id lists with a precomputed lookup: BuildLevTrigs()/ScanMap()/
 * ScanBlocks() build a per-level index (TrigList/BlockList) once when the level loads, and
 * FindLevTrig()/FindBlock()/ChangeBlock() query it at runtime instead of walking the piece-id list.
 * CheckTrigForce() also gained an 8-neighbour offset_x/offset_y probe (the PSX pad cursor isn't
 * pixel-precise) trying each Force*Trig() around the cursor tile until one hits. */
#include "diabpsx_types.h"
#include "psxsrc/cplayer_header.h"
#include "source/gen/structs_trigs.h"
#include "source/gen/externs_trigs.h"
#include "source/gen/protos_trigs.h"
#include "source/diablo.h"

extern "C" int sprintf(char *buf, const char *fmt, ...);

#define DTYPE_TOWN      0
#define DTYPE_CATHEDRAL 1
#define DTYPE_CATACOMBS 2
#define DTYPE_CAVES     3
#define DTYPE_HELL      4

#define SL_SKELKING     1
#define SL_BONECHAMB    2
#define SL_POISONWATER  4

#define Q_SKELKING 12
#define Q_PWATER   13
#define Q_SCHAMB   14

#define WM_DIABNEXTLVL  0x42
#define WM_DIABPREVLVL  0x43
#define WM_DIABRTNLVL   0x44
#define WM_DIABTOWNWARP 0x47
#define WM_DIABTWARPUP  0x48

#define PC_WARRIOR   0
#define PC_ROGUE     1
#define PC_SORCERER  2

#define PS_WARR43  0x2FC
#define PS_ROGUE43 0x28E
#define PS_MAGE43  0x226

#define EMSG_REQUIRES_LVL_8  0x28
#define EMSG_REQUIRES_LVL_13 0x29
#define EMSG_REQUIRES_LVL_17 0x2A

#define CURSOR_FIRSTITEM 0xC

#define BFLAG_POPULATED 0x08

#define TRUE  1
#define FALSE 0

#include "source/gen/tables_trigs.h"

/* Retail initialized small-data state, in original placement order. */
static int NoBlocks = 0;
static short *levlist = 0;
BOOL FRIGFLAG = 0;
static int FRIGCheat = 0;
static int FRIGTime = 0;
static int FRIGState = 0;
static int FRIGFlip = 0;
static int FRIGFlipit = 0;
static int FRIGFirst = 0;
int FRIGX = 55;
int FRIGY = 71;
int FRIGZ = 24;
int fot = 0;
unsigned char _trigflag[2] = {0};
int numtrigs = 0;
unsigned char townwarps[3] = {0};
int TWarpFrom = 0;

/* @0x80075018 */
void InitVPTriggers(void)
{
    numtrigs = 1;
    trigs[0]._tx = 0x23;
    trigs[0]._ty = 0x20;
    trigs[0]._tmsg = WM_DIABRTNLVL;
    _trigflag[sel_data] = 0;
}

/* @0x80075060 */
BOOL FindLevTrig(int x, int y, int l)
{
    int i;

    i = 0;
    while (TrigList[l][i] != -1) {
        if (x == TrigList[l][i] && y == TrigList[l][i + 1])
            return TRUE;
        i += 2;
    }
    return FALSE;
}

/* @0x800750F8 */
void ScanMap(short *list, int l)
{
    int NoTrigs = 0;

    while (*list != -1) {
        for (int y = 0; y < 112; y++) {
            for (int x = 0; x < 112; x++) {
                if (GetDPiece(x, y) == *list) {
                    if (NoTrigs >= 32)
                        DBG_Error(NULL, "source/TRIGS.cpp", 0x99);
                    TrigList[l][NoTrigs * 2] = x;
                    TrigList[l][NoTrigs * 2 + 1] = y;
                    NoTrigs++;
                    x = 112;
                    y = 112;
                    TrigList[l][NoTrigs * 2] = -1;
                    TrigList[l][NoTrigs * 2 + 1] = -1;
                }
            }
        }
        list++;
    }
}

/* @0x80075200 */
int FindBlock(int x, int y)
{
    struct BLOCK *ptr;

    ptr = BlockList;
    if (dPiece != NULL)
        return GetDPiece(x, y);
    while (ptr->block != 0) {
        if (ptr->x == x && ptr->y == y)
            return ptr->block;
        ptr++;
    }
    return 0;
}

/* @0x8007529C */
void ChangeBlock(int x, int y, int bl)
{
    struct BLOCK *ptr = BlockList;
    short *list;

    for (int b = 0; b < NoBlocks; b++) {
        if (x == ptr->x && y == ptr->y) {
            ptr->block = bl;
            return;
        }
        ptr++;
    }
    if (levlist) {
        list = levlist;
        while (*list != -1) {
            if (bl == *list++) {
                if (NoBlocks >= 160)
                    DBG_Error(NULL, "source/TRIGS.cpp", 0xD9);
                ptr->x = x;
                ptr->y = y;
                ptr->block = bl;
                ptr++;
                ptr->block = 0;
                NoBlocks++;
            }
        }
    }
}

/* @0x800753E0 */
void ScanBlocks(short *list)
{
    struct BLOCK *ptr;

    levlist = list;
    ptr = &BlockList[NoBlocks];
    while (*list != -1) {
        int bl = *list;
        list++;
        for (int y = 0; y < 112; y++) {
            for (int x = 0; x < 112; x++) {
                if (GetDPiece(x, y) == bl) {
                    if (NoBlocks >= 160)
                        DBG_Error(NULL, "source/TRIGS.cpp", 0xF3);
                    ptr->x = x;
                    ptr->y = y;
                    ptr->block = bl;
                    ptr++;
                    ptr->block = 0;
                    NoBlocks++;
                }
            }
        }
    }
}

/* @0x800754E8 */
void BuildLevTrigs(void)
{
    NoBlocks = 0;
    levlist = NULL;

    switch (leveltype) {
    case DTYPE_TOWN:
        ScanMap(TownDownList, 0);
        ScanMap(TownWarp1List, 1);
        ScanMap(TownWarp2List, 2);
        ScanMap(TownWarp3List, 3);
        break;
    case DTYPE_CATHEDRAL:
        ScanMap(L1UpList, 0);
        ScanMap(L1DownList, 1);
        ScanBlocks(L1BlockList);
        break;
    case DTYPE_CATACOMBS:
        ScanMap(L2UpList, 0);
        ScanMap(L2DownList, 1);
        ScanMap(L2TWarpUpList, 2);
        ScanBlocks(L2BlockList);
        break;
    case DTYPE_CAVES:
        ScanMap(L3UpList, 0);
        ScanMap(L3DownList, 1);
        ScanMap(L3TWarpUpList, 2);
        ScanBlocks(L3BlockList);
        break;
    case DTYPE_HELL:
        ScanMap(L4UpList, 0);
        ScanMap(L4DownList, 1);
        ScanMap(L4TWarpUpList, 2);
        ScanMap(L4PentaList, 3);
        ScanBlocks(L4BlockList);
        break;
    }
}

/* @0x8007567C */
void DrawFRIG(void)
{
    if (FRIGFirst == 0) {
        FRIGFirst = 1;
        FRIGFLAG = 1;
    }
}

/* @0x8007569C */
unsigned char ForceTownTrig(void)
{
    if (FindLevTrig(cursmx, cursmy, 0)) {
        strcpy(_infostr[sel_data], GetStr(0x113));
        cursmx = 25;
        cursmy = 29;
        return TRUE;
    }

    if (townwarps[0]) {
        if (FindLevTrig(cursmx, cursmy, 1)) {
            strcpy(_infostr[sel_data], GetStr(0x110));
            cursmx = 49;
            cursmy = 21;
            return TRUE;
        }
    }

    if (townwarps[1]) {
        if (FindLevTrig(cursmx, cursmy, 2)) {
            strcpy(_infostr[sel_data], GetStr(0x111));
            cursmx = 17;
            cursmy = 69;
            return TRUE;
        }
    }

    if (townwarps[2]) {
        if (FindLevTrig(cursmx, cursmy, 3)) {
            strcpy(_infostr[sel_data], GetStr(0x114));
            cursmx = 41;
            cursmy = 80;
            return TRUE;
        }
    }

    return FALSE;
}

/* @0x80075888 */
unsigned char ForceL1Trig(void)
{
    int j;

    if (FindLevTrig(cursmx, cursmy, 0)) {
        if (currlevel > 1)
            sprintf(_infostr[sel_data], GetStr(0x4A7), currlevel - 1);
        else
            strcpy(_infostr[sel_data], GetStr(0x4A8));
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABPREVLVL) {
                cursmx = trigs[j]._tx;
                cursmy = trigs[j]._ty;
                return TRUE;
            }
        }
    }

    if (FindLevTrig(cursmx, cursmy, 1)) {
        sprintf(_infostr[sel_data], GetStr(0x115), currlevel + 1);
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABNEXTLVL) {
                cursmx = trigs[j]._tx;
                cursmy = trigs[j]._ty;
                return TRUE;
            }
        }
    }

    return FALSE;
}

/* @0x80075A48 */
unsigned char ForceL2Trig(void)
{
    int j;
    int dx, dy;

    if (FindLevTrig(cursmx, cursmy, 0)) {
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABPREVLVL) {
                dx = abs(trigs[j]._tx - cursmx);
                dy = abs(trigs[j]._ty - cursmy);
                if (dx < 4 && dy < 4) {
                    sprintf(_infostr[sel_data], GetStr(0x4A7), currlevel - 1);
                    cursmx = trigs[j]._tx;
                    cursmy = trigs[j]._ty;
                    return TRUE;
                }
            }
        }
    }

    if (FindLevTrig(cursmx, cursmy, 1)) {
        sprintf(_infostr[sel_data], GetStr(0x115), currlevel + 1);
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABNEXTLVL) {
                cursmx = trigs[j]._tx;
                cursmy = trigs[j]._ty;
                return TRUE;
            }
        }
    }

    if (currlevel == 5) {
        if (FindLevTrig(cursmx, cursmy, 2)) {
            for (j = 0; j < numtrigs; j++) {
                if (trigs[j]._tmsg == WM_DIABTWARPUP) {
                    dx = abs(trigs[j]._tx - cursmx);
                    dy = abs(trigs[j]._ty - cursmy);
                    if (dx < 4 && dy < 4) {
                        strcpy(_infostr[sel_data], GetStr(0x4A8));
                        cursmx = trigs[j]._tx;
                        cursmy = trigs[j]._ty;
                        return TRUE;
                    }
                }
            }
        }
    }

    return FALSE;
}

/* @0x80075D48 */
unsigned char ForceL3Trig(void)
{
    int j;
    int dx, dy;

    if (FindLevTrig(cursmx, cursmy, 0)) {
        sprintf(_infostr[sel_data], GetStr(0x4A7), currlevel - 1);
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABPREVLVL) {
                cursmx = trigs[j]._tx;
                cursmy = trigs[j]._ty;
                return TRUE;
            }
        }
    }

    if (FindLevTrig(cursmx, cursmy, 1) || FindLevTrig(cursmx + 1, cursmy, 1) || FindLevTrig(cursmx + 2, cursmy, 1)) {
        sprintf(_infostr[sel_data], GetStr(0x115), currlevel + 1);
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABNEXTLVL) {
                cursmx = trigs[j]._tx;
                cursmy = trigs[j]._ty;
                return TRUE;
            }
        }
    }

    if (currlevel == 9) {
        if (FindLevTrig(cursmx, cursmy, 2)) {
            for (j = 0; j < numtrigs; j++) {
                if (trigs[j]._tmsg == WM_DIABTWARPUP) {
                    dx = abs(trigs[j]._tx - cursmx);
                    dy = abs(trigs[j]._ty - cursmy);
                    if (dx < 4 && dy < 4) {
                        strcpy(_infostr[sel_data], GetStr(0x4A8));
                        cursmx = trigs[j]._tx;
                        cursmy = trigs[j]._ty;
                        return TRUE;
                    }
                }
            }
        }
    }

    return FALSE;
}

/* @0x80076054 */
unsigned char ForceL4Trig(void)
{
    int j;
    int dx, dy;

    if (FindLevTrig(cursmx, cursmy, 0)) {
        sprintf(_infostr[sel_data], GetStr(0x4A7), currlevel - 1);
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABPREVLVL) {
                cursmx = trigs[j]._tx;
                cursmy = trigs[j]._ty;
                return TRUE;
            }
        }
    }

    if (FindLevTrig(cursmx, cursmy, 1)) {
        sprintf(_infostr[sel_data], GetStr(0x115), currlevel + 1);
        for (j = 0; j < numtrigs; j++) {
            if (trigs[j]._tmsg == WM_DIABNEXTLVL) {
                cursmx = trigs[j]._tx;
                cursmy = trigs[j]._ty;
                return TRUE;
            }
        }
    }

    if (currlevel == 13) {
        if (FindLevTrig(cursmx, cursmy, 2)) {
            for (j = 0; j < numtrigs; j++) {
                if (trigs[j]._tmsg == WM_DIABTWARPUP) {
                    dx = abs(trigs[j]._tx - cursmx);
                    dy = abs(trigs[j]._ty - cursmy);
                    if (dx < 4 && dy < 4) {
                        strcpy(_infostr[sel_data], GetStr(0x4A8));
                        cursmx = trigs[j]._tx;
                        cursmy = trigs[j]._ty;
                        return TRUE;
                    }
                }
            }
        }
    }

    if (currlevel == 15) {
        if (FindLevTrig(cursmx, cursmy, 3)) {
            strcpy(_infostr[sel_data], GetStr(0x112));
            for (j = 0; j < numtrigs; j++) {
                if (trigs[j]._tmsg == WM_DIABNEXTLVL) {
                    cursmx = trigs[j]._tx;
                    cursmy = trigs[j]._ty;
                    return TRUE;
                }
            }
        }
    }

    return FALSE;
}

/* @0x80076390 */
void Freeupstairs(void)
{
    int j;
    int tx, ty, xx, yy;

    for (j = 0; j < numtrigs; j++) {
        tx = trigs[j]._tx;
        ty = trigs[j]._ty;

        for (yy = -2; yy <= 2; yy++) {
            for (xx = -2; xx <= 2; xx++) {
                dung_map[tx + xx][ty + yy].dFlags |= BFLAG_POPULATED;
            }
        }
    }
}

/* @0x80076440 */
unsigned char ForceSKingTrig(void)
{
    if (FindLevTrig(cursmx, cursmy, 0)) {
        sprintf(_infostr[sel_data], GetStr(0x3B), quests[Q_SKELKING]._qlevel);
        cursmx = trigs[0]._tx;
        cursmy = trigs[0]._ty;
        return TRUE;
    }

    return FALSE;
}

/* @0x800764CC */
unsigned char ForceSChambTrig(void)
{
    if (FindLevTrig(cursmx, cursmy, 1)) {
        sprintf(_infostr[sel_data], GetStr(0x3B), quests[Q_SCHAMB]._qlevel);
        cursmx = trigs[0]._tx;
        cursmy = trigs[0]._ty;
        return TRUE;
    }

    return FALSE;
}

/* @0x80076558 */
unsigned char ForcePWaterTrig(void)
{
    if (FindLevTrig(cursmx, cursmy, 1)) {
        sprintf(_infostr[sel_data], GetStr(0x3B), quests[Q_PWATER]._qlevel);
        cursmx = trigs[0]._tx;
        cursmy = trigs[0]._ty;
        return TRUE;
    }

    return FALSE;
}

/* @0x800765E4 */
void CheckTrigForce(void)
{
    int ocursmx, ocursmy;

    ocursmx = cursmx;
    ocursmy = cursmy;
    FRIGFirst = 0;
    _trigflag[sel_data] = 0;

    if (!setlevel) {
        for (int i = 0; i < 8 && !_trigflag[sel_data]; i++) {
            cursmx = ocursmx + offset_x[i];
            cursmy = ocursmy + offset_y[i];
            switch (leveltype) {
            case DTYPE_TOWN:
                _trigflag[sel_data] = ForceTownTrig();
                break;
            case DTYPE_CATHEDRAL:
                _trigflag[sel_data] = ForceL1Trig();
                break;
            case DTYPE_CATACOMBS:
                _trigflag[sel_data] = ForceL2Trig();
                break;
            case DTYPE_CAVES:
                _trigflag[sel_data] = ForceL3Trig();
                break;
            case DTYPE_HELL:
                _trigflag[sel_data] = ForceL4Trig();
                break;
            }
            if (leveltype != DTYPE_TOWN && !_trigflag[sel_data]) {
                _trigflag[sel_data] = ForceQuests();
            }
        }
    } else {
        for (int i = 0; i < 8 && !_trigflag[sel_data]; i++) {
            cursmx = ocursmx + offset_x[i];
            cursmy = ocursmy + offset_y[i];
            switch (setlvlnum) {
            case SL_SKELKING:
                _trigflag[sel_data] = ForceSKingTrig();
                break;
            case SL_BONECHAMB:
                _trigflag[sel_data] = ForceSChambTrig();
                break;
            case SL_POISONWATER:
                _trigflag[sel_data] = ForcePWaterTrig();
                break;
            }
        }
    }

    if (_trigflag[sel_data]) {
        ClearPanel();
    }
}

/* @0x800768F0 */
void FadeGameOut(void)
{
    PA_SetPauseOk(0);
    GLUE_SetHomingScrollFlag(0);
    PauseMode = 1;
    music_fade();
    stream_stop();
    if (PaletteFadeOut(8)) {
        while (GetFadeState()) {
            TSK_Sleep(1);
        }
    }
    GLUE_SetHomingScrollFlag(1);
    GLUE_SetShowGameScreenFlag(0);
    GLUE_SetShowPanelFlag(0);
    BlackPalette();
    music_stop();
    PauseMode = 0;
}

/* @0x80076994 */
BOOL IsTrigger(int x, int y)
{
    int i;

    if (numtrigs > 0) {
        i = 0;
        do {
            if (x == trigs[i]._tx && y == trigs[i]._ty)
                return TRUE;
            i++;
        } while (i < numtrigs);
    }

    for (i = 0; i < 16; i++) {
        if (currlevel == quests[i]._qlevel && quests[i]._qslvl != 0 && quests[i]._qactive != 0
            && x == quests[i]._qtx && y == quests[i]._qty)
            return TRUE;
    }

    return FALSE;
}

/* @0x80076A8C */
BOOL CheckTrigLevel(int level)
{
    if (plr[0]._pLevel >= level || plr[1]._pLevel >= level)
        return TRUE;
    return FALSE;
}

/* @0x80076AC8 */
void CheckTriggers(int pnum)
{
    int x, y;

    if (plr[0].plractive == 0)
        myplr = 1;

    for (int i = 0; i < numtrigs; i++) {
        if (plr[pnum]._px != trigs[i]._tx)
            continue;
        if (plr[pnum]._py != trigs[i]._ty)
            continue;
        if (qtextflag)
            continue;
        if (PauseMode)
            continue;
        if (gbMaxPlayers == 2 && plr[pnum ^ 1].plractive && plr[pnum ^ 1].destAction == 0xD)
            continue;

        switch (trigs[i]._tmsg) {
        case WM_DIABNEXTLVL:
            if (_pcurs[myplr] >= CURSOR_FIRSTITEM) {
                if (DropItemBeforeTrig())
                    return;
            }
            FadeGameOut();
            StartNewLvl(myplr, trigs[i]._tmsg, currlevel + 1);
            break;
        case WM_DIABPREVLVL:
            if (_pcurs[myplr] >= CURSOR_FIRSTITEM) {
                if (DropItemBeforeTrig())
                    return;
            }
            FadeGameOut();
            StartNewLvl(myplr, trigs[i]._tmsg, currlevel - 1);
            break;
        case WM_DIABTOWNWARP:
            if (gbMaxPlayers != 1) {
                unsigned char abortflag = FALSE;
                int dx = 0, dy = 0;
                char m = 0;
                if (trigs[i]._tlvl == 5 && !CheckTrigLevel(8)) {
                    abortflag = TRUE;
                    dx = plr[pnum]._px;
                    dy = plr[pnum]._py + 1;
                    m = EMSG_REQUIRES_LVL_8;
                }
                if (trigs[i]._tlvl == 9 && !CheckTrigLevel(13)) {
                    abortflag = TRUE;
                    dx = plr[pnum]._px + 1;
                    dy = plr[pnum]._py;
                    m = EMSG_REQUIRES_LVL_13;
                }
                if (trigs[i]._tlvl == 13 && !CheckTrigLevel(17)) {
                    abortflag = TRUE;
                    dx = plr[pnum]._px;
                    dy = plr[pnum]._py + 1;
                    m = EMSG_REQUIRES_LVL_17;
                }
                if (abortflag) {
                    if (plr[pnum]._pClass == PC_WARRIOR)
                        PlaySFX(PS_WARR43);
                    else if (plr[pnum]._pClass == PC_ROGUE)
                        PlaySFX(PS_ROGUE43);
                    else if (plr[pnum]._pClass == PC_SORCERER)
                        PlaySFX(PS_MAGE43);
                    InitDiabloMsg(m);
                    NetSendCmdLoc(1, 1, dx, dy);
                    return;
                }
            }
            FadeGameOut();
            StartNewLvl(myplr, trigs[i]._tmsg, trigs[i]._tlvl);
            break;
        case WM_DIABTWARPUP:
            TWarpFrom = currlevel;
            FadeGameOut();
            StartNewLvl(myplr, trigs[i]._tmsg, 0);
            break;
        case WM_DIABRTNLVL:
            FadeGameOut();
            StartNewLvl(myplr, trigs[i]._tmsg, ReturnLvl);
            break;
        }

        if (plr[0].plractive) {
            PlacePlayer(0, ViewX, ViewY, 1);
            x = plr[0]._px;
            y = plr[0]._py;
        } else {
            x = ViewX;
            y = ViewY;
        }
        if (FePlayerNo && plr[0].plractive) {
            if (plr[1].plractive) {
                PlacePlayer(1, plr[0]._px, plr[0]._py, 0);
                ChangeLight(plr[1]._plid, plr[1]._px, plr[1]._py, plr[1]._pLightRad + 0x23F0);
            }
        } else if (plr[1].plractive)
            PlacePlayer(1, x, y, 0);
    }
}
