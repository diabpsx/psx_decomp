/* SETMAPS.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/setmaps.cpp
 * (+ refs/devilutionx/Source/levels/setmaps.cpp).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: the "ObjIndex: Active object not found..." assert string is the retail all-caps/underscore
 * spelling ("OBJINDEX__ACTIVE_OBJECT_NOT_FOUND_AT_ %d %d"), quest-map filenames differ slightly from
 * devilution ("Vile11.DUN"/"Vile21.DUN" vs devilution's "Vile1.DUN"/"Vile2.DUN"), and LoadSetMap folds a
 * WaterDone (fade-flag) update + a VILEBETRAYER map-size variant directly into the switch (both handled
 * by devilution/devilutionx elsewhere, in quests.cpp's ResyncQuests). */
#include "diabpsx_types.h"
#include "source/gen/structs_setmaps.h"
#include "source/gen/externs_setmaps.h"
#include "source/gen/protos_setmaps.h"
#include "source/diablo.h"

#define MAXDUNX 96
#define MAXDUNY 96

#define SL_SKELKING     1
#define SL_BONECHAMB    2
#define SL_MAZE         3
#define SL_POISONWATER  4
#define SL_VILEBETRAYER 5

/* BUGFIX (retail too): constant transition tables should be const. */
unsigned char SkelKingTrans1[] = {
    19, 47, 26, 55,
    26, 49, 30, 53
};

unsigned char SkelKingTrans2[] = {
    33, 19, 47, 29,
    37, 29, 43, 39
};

unsigned char SkelKingTrans3[] = {
    27, 53, 35, 61,
    27, 35, 34, 42,
    45, 35, 53, 43,
    45, 53, 53, 61,
    31, 39, 49, 57
};

unsigned char SkelKingTrans4[] = {
    49, 45, 58, 51,
    57, 31, 62, 37,
    63, 31, 69, 40,
    59, 41, 73, 55,
    63, 55, 69, 65,
    73, 45, 78, 51,
    79, 43, 89, 53
};

unsigned char SkelChamTrans1[] = {
    43, 19, 50, 26,
    51, 19, 59, 26,
    35, 27, 42, 34,
    43, 27, 49, 34,
    50, 27, 59, 34
};

unsigned char SkelChamTrans2[] = {
    19, 31, 34, 47,
    34, 35, 42, 42
};

unsigned char SkelChamTrans3[] = {
    43, 35, 50, 42,
    51, 35, 62, 42,
    63, 31, 66, 46,
    67, 31, 78, 34,
    67, 35, 78, 42,
    67, 43, 78, 46,
    35, 43, 42, 51,
    43, 43, 49, 51,
    50, 43, 59, 51
};

/* @0x801552D8 */
int ObjIndex(int x, int y)
{
    int i;
    int oi;

    for (i = 0; i < numobjects; i++) {
        oi = objectactive[i];
        if (object[oi]._ox == x && object[oi]._oy == y)
            return oi;
    }
    app_fatal("OBJINDEX__ACTIVE_OBJECT_NOT_FOUND_AT_ %d %d", x, y);
    return -1;
}

/* @0x8015538C */
void AddSKingObjs(void)
{
    SetObjMapRange(ObjIndex(64, 34), 20, 7, 23, 10, 1);
    SetObjMapRange(ObjIndex(64, 59), 20, 14, 21, 16, 2);
    SetObjMapRange(ObjIndex(27, 37), 8, 1, 15, 11, 3);
    SetObjMapRange(ObjIndex(46, 35), 8, 1, 15, 11, 3);
    SetObjMapRange(ObjIndex(49, 53), 8, 1, 15, 11, 3);
    SetObjMapRange(ObjIndex(27, 53), 8, 1, 15, 11, 3);
}

/* @0x801554BC */
void AddSChamObjs(void)
{
    SetObjMapRange(ObjIndex(37, 30), 17, 0, 21, 5, 1);
    SetObjMapRange(ObjIndex(37, 46), 13, 0, 16, 5, 2);
}

/* @0x80155538 */
void AddVileObjs(void)
{
    SetObjMapRange(ObjIndex(26, 45), 1, 1, 9, 10, 1);
    SetObjMapRange(ObjIndex(45, 46), 11, 1, 20, 10, 2);
    SetObjMapRange(ObjIndex(35, 36), 7, 11, 13, 18, 3);
}

/* @0x801555E4 */
void DRLG_SetMapTrans(char *sFileName)
{
    int i, j, rw, rh;
    unsigned char *pLevelMap, *lm;
    long mapoff;

    pLevelMap = GRL_LoadFileInMemSig(sFileName, NULL);
    lm = pLevelMap;

    rw = *lm;
    lm += 2;
    rh = *lm;
    mapoff = ((rw * rh) << 1) + 2;
    rw = rw << 1;
    rh = rh << 1;
    mapoff += (((rw * rh) << 1) * 3);
    lm += mapoff;
    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            dung_map[i + 16][j + 16].dTransVal = *lm;
            lm += 2;
        }
    }
    MemFreeDbg(pLevelMap);
}

/**
 * Load a quest map, the given map is specified via the global setlvlnum.
 * @0x801556A8
 */
void LoadSetMap(void)
{
    switch (setlvlnum) {
        BOOL isdone;
        int x, y;

    case SL_SKELKING:
        if (quests[Q_SKELKING]._qactive == QUEST_INIT) {
            quests[Q_SKELKING]._qactive = QUEST_ACTIVE;
            quests[Q_SKELKING]._qvar1 = 1;
        }
        LoadPreL1Dungeon("Levels\\L1Data\\SklKng1.DUN", 83, 45);
        LoadL1Dungeon("Levels\\L1Data\\SklKng2.DUN", 83, 45);
        LoadPalette("Levels\\L1Data\\L1_2.pal");
        DRLG_AreaTrans(sizeof(SkelKingTrans1) / 4, SkelKingTrans1);
        DRLG_ListTrans(sizeof(SkelKingTrans2) / 4, SkelKingTrans2);
        DRLG_AreaTrans(sizeof(SkelKingTrans3) / 4, SkelKingTrans3);
        DRLG_ListTrans(sizeof(SkelKingTrans4) / 4, SkelKingTrans4);
        AddL1Objs(0, 0, MAXDUNX, MAXDUNY);
        AddSKingObjs();
        InitSKingTriggers();
        break;
    case SL_BONECHAMB:
        LoadPreL2Dungeon("Levels\\L2Data\\Bonecha2.DUN", 69, 39);
        LoadL2Dungeon("Levels\\L2Data\\Bonecha1.DUN", 69, 39);
        LoadPalette("Levels\\L2Data\\L2_2.pal");
        DRLG_ListTrans(sizeof(SkelChamTrans1) / 4, SkelChamTrans1);
        DRLG_AreaTrans(sizeof(SkelChamTrans2) / 4, SkelChamTrans2);
        DRLG_ListTrans(sizeof(SkelChamTrans3) / 4, SkelChamTrans3);
        AddL2Objs(0, 0, MAXDUNX, MAXDUNY);
        AddSChamObjs();
        InitSChambTriggers();
        break;
    case SL_MAZE:
        LoadPreL1Dungeon("Levels\\L1Data\\Lv1MazeA.DUN", 20, 50);
        LoadL1Dungeon("Levels\\L1Data\\Lv1MazeB.DUN", 20, 50);
        LoadPalette("Levels\\L1Data\\L1_5.pal");
        AddL1Objs(0, 0, MAXDUNX, MAXDUNY);
        DRLG_SetMapTrans("Levels\\L1Data\\Lv1MazeA.DUN");
        break;
    case SL_POISONWATER:
        if (quests[Q_PWATER]._qactive == QUEST_INIT)
            quests[Q_PWATER]._qactive = QUEST_ACTIVE;
        LoadPreL3Dungeon("Levels\\L3Data\\Foulwatr.DUN", 19, 50);
        LoadL3Dungeon("Levels\\L3Data\\Foulwatr.DUN", 20, 50);
        LoadPalette("Levels\\L3Data\\L3pfoul.pal");
        InitPWaterTriggers();
        if (quests[Q_PWATER]._qactive == QUEST_DONE)
            WaterDone = 1;
        else
            WaterDone = 0;
        break;
    case SL_VILEBETRAYER:
        isdone = quests[Q_BETRAYER]._qactive == QUEST_DONE;
        x = isdone ? 36 : 35;
        y = 36;
        if (isdone) {
            y = 33;
            quests[Q_BETRAYER]._qvar2 = 4;
        } else if (quests[Q_BETRAYER]._qactive == QUEST_ACTIVE) {
            quests[Q_BETRAYER]._qvar2 = 3;
        }
        LoadPreL1Dungeon("Vile11.DUN", x, y);
        LoadL1Dungeon("Vile21.DUN", x, y);
        LoadPalette("Levels\\L1Data\\L1_2.pal");
        AddL1Objs(0, 0, MAXDUNX, MAXDUNY);
        AddVileObjs();
        DRLG_SetMapTrans("Vile11.DUN");
        InitNoTriggers();
        break;
    }
}
