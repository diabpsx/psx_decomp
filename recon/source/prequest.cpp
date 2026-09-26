/* PREQUEST.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/quests.cpp
 * (InitQuests/DrawButcher/DrawSkelKing/DrawWarLord/DrawSChamber/DrawLTBanner/DrawBlind/DrawBlood/
 * DRLG_CheckQuests) + refs/devilutionx/Source/levels/drlg_quests.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas vs devilution: quest .DUN files load by short CD-local name ("Warlord2.DUN", no
 * "Levels\\L4Data\\" prefix); DrawSkelKing additionally clears SetSOLID/SetMISSILE around the throne
 * room entrance; InitQuests ends with an extra single-player-only check that clears
 * AllItemsUseable[] for a player-held Specular Elixir (IDI_SPECELIX) once the Black Mushroom quest
 * is not yet done. */
#include "diabpsx_types.h"
#include "source/gen/structs_prequest.h"
#include "source/gen/externs_prequest.h"
#include "source/gen/protos_prequest.h"
#include "source/diablo.h"

/* quest _qtype ids not already in diablo.h (devilution enum quest_id) */
#define Q_BLIND   8
#define Q_BLOOD   9
#define Q_WARLORD 11
#define Q_SCHAMB  14

/* questlist[]._qflags (devilution enum quest_flag) */
#define QUEST_ANY 1

void InitQuests(void)
{
    int i, gri, deltaq;

    if (gbMaxPlayers == 1) {
        for (i = 0; i < MAXQUESTS; i++) {
            quests[i]._qactive = QUEST_NOTAVAIL;
        }
    } else {
        for (i = 0; i < MAXQUESTS; i++) {
            if (!(questlist[i]._qflags & QUEST_ANY)) {
                quests[i]._qactive = QUEST_NOTAVAIL;
            }
        }
    }

    deltaq = 0;
    questlog = 0;
    WaterDone = 0;

    for (i = 0; i < ALLQUESTS; i++) {
        if (gbMaxPlayers > 1 && !(questlist[i]._qflags & QUEST_ANY))
            continue;

        quests[i]._qtype = questlist[i]._qdtype;
        if (gbMaxPlayers > 1) {
            quests[i]._qlevel = questlist[i]._qdmultlvl;
            if (!delta_quest_inited(deltaq)) {
                quests[i]._qactive = QUEST_INIT;
                quests[i]._qvar1 = 0;
                quests[i]._qlog = 0;
            }
            deltaq++;
        } else {
            quests[i]._qactive = QUEST_INIT;
            quests[i]._qlevel = questlist[i]._qdlvl;
            quests[i]._qvar1 = 0;
            quests[i]._qlog = 0;
        }
        quests[i]._qslvl = questlist[i]._qslvl;
        quests[i]._qtx = 0;
        quests[i]._qty = 0;
        quests[i]._qidx = i;
        quests[i]._qlvltype = questlist[i]._qlvlt;
        quests[i]._qvar2 = 0;
        quests[i]._qmsg = questlist[i]._qdmsg;
        quests[i].pad_for_laz = 0;
    }

    if (gbMaxPlayers == 1) {
        SetRndSeed(glSeedTbl[15]);
        if (ENG_random(2) != 0)
            quests[Q_PWATER]._qactive = QUEST_NOTAVAIL;
        else
            quests[Q_SKELKING]._qactive = QUEST_NOTAVAIL;

        gri = QuestGroup1[ENG_random(3)];
        quests[gri]._qactive = QUEST_NOTAVAIL;
        gri = QuestGroup2[ENG_random(3)];
        quests[gri]._qactive = QUEST_NOTAVAIL;
        gri = QuestGroup3[ENG_random(3)];
        quests[gri]._qactive = QUEST_NOTAVAIL;
        gri = QuestGroup4[ENG_random(2)];
        quests[gri]._qactive = QUEST_NOTAVAIL;
    }

    if (quests[Q_SKELKING]._qactive == QUEST_NOTAVAIL)
        quests[Q_SKELKING]._qvar2 = 2;
    if (quests[Q_ROCK]._qactive == QUEST_NOTAVAIL)
        quests[Q_ROCK]._qvar2 = 2;
    quests[Q_LTBANNER]._qvar1 = 1;

    if (gbMaxPlayers != 1)
        quests[Q_BETRAYER]._qvar1 = 2;
    if (gbMaxPlayers == 1) {
        ItemStruct *Item = PlrHasItem(0, IDI_SPECELIX, i);
        if (Item != NULL && quests[Q_MUSHROOM]._qactive != QUEST_DONE)
            AllItemsUseable[Item->IDidx] = 0;
    }
}

void DrawButcher(void)
{
    int x, y;

    x = 2 * setpc_x;
    y = 2 * setpc_y;
    DRLG_RectTrans(x + 19, y + 19, x + 26, y + 26);
}

void DrawSkelKing(int q, int x, int y)
{
    QuestStruct * const p = quests + q;

    p->_qtx = 2 * x + 28;
    p->_qty = 2 * y + 23;

    if (x > 0) {
        if (y >= 3) {
            SetSOLID(2 * x + 27, 2 * y + 23);
            SetMISSILE(2 * x + 27, 2 * y + 23);
            SetSOLID(2 * x + 27, 2 * y + 21);
        }
    }
}

void DrawWarLord(int x, int y)
{
    int rw, rh;
    int i, j;
    unsigned char *sp, *setp;

    setp = GRL_LoadFileInMemSig("Warlord2.DUN", NULL);
    rw = setp[0];
    rh = setp[2];
    sp = setp + 4;
    setpc_x = x;
    setpc_y = y;
    setpc_w = rw;
    setpc_h = rh;
    for (j = y; j < rh + y; j++) {
        for (i = x; i < rw + x; i++) {
            dungeon[i][j] = (*sp != 0) ? *sp : 6;
            sp += 2;
        }
    }
    MemFreeDbg(setp);
}

void DrawSChamber(int q, int x, int y)
{
    int i, j;
    int rw, rh;
    int xx, yy;
    unsigned char *sp, *setp;

    setp = GRL_LoadFileInMemSig("Bonestr1.DUN", NULL);
    rw = setp[0];
    rh = setp[2];
    sp = setp + 4;
    setpc_x = x;
    setpc_y = y;
    setpc_w = rw;
    setpc_h = rh;
    for (j = y; j < rh + y; j++) {
        for (i = x; i < rw + x; i++) {
            dungeon[i][j] = (*sp != 0) ? *sp : 3;
            sp += 2;
        }
    }
    xx = 2 * x + 22;
    yy = 2 * y + 23;
    quests[q]._qtx = xx;
    quests[q]._qty = yy;
    MemFreeDbg(setp);
}

void DrawLTBanner(int x, int y)
{
    int rw, rh;
    int i, j;
    unsigned char *sp, *setp;

    setp = GRL_LoadFileInMemSig("Banner1.DUN", NULL);
    rw = *setp;
    sp = setp + 2;
    rh = *sp;
    sp += 2;
    setpc_x = x;
    setpc_y = y;
    setpc_w = rw;
    setpc_h = rh;
    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*sp != 0) {
                pdungeon[x + i][y + j] = *sp;
            }
            sp += 2;
        }
    }
    MemFreeDbg(setp);
}

void DrawBlind(int x, int y)
{
    int rw, rh;
    int i, j;
    unsigned char *sp, *setp;

    setp = GRL_LoadFileInMemSig("Blind1.DUN", NULL);
    rw = *setp;
    sp = setp + 2;
    rh = *sp;
    sp += 2;
    setpc_x = x;
    setpc_y = y;
    setpc_w = rw;
    setpc_h = rh;
    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*sp != 0) {
                pdungeon[x + i][y + j] = *sp;
            }
            sp += 2;
        }
    }
    MemFreeDbg(setp);
}

void DrawBlood(int x, int y)
{
    int rw, rh;
    int i, j;
    unsigned char *sp, *setp;

    setp = GRL_LoadFileInMemSig("Blood2.DUN", NULL);
    rw = *setp;
    sp = setp + 2;
    rh = *sp;
    sp += 2;
    setpc_x = x;
    setpc_y = y;
    setpc_w = rw;
    setpc_h = rh;
    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*sp != 0) {
                dungeon[x + i][y + j] = *sp;
            }
            sp += 2;
        }
    }
    MemFreeDbg(setp);
}

void DRLG_CheckQuests(int x, int y)
{
    int i;

    for (i = 0; i < MAXQUESTS; i++) {
        if (QuestStatus(i)) {
            switch (quests[i]._qtype) {
            case Q_BUTCHER:
                DrawButcher();
                break;
            case Q_SKELKING:
                DrawSkelKing(i, x, y);
                break;
            case Q_SCHAMB:
                DrawSChamber(i, x, y);
                break;
            case Q_BLIND:
                DrawBlind(x, y);
                break;
            case Q_BLOOD:
                DrawBlood(x, y);
                break;
            case Q_LTBANNER:
                DrawLTBanner(x, y);
                break;
            case Q_WARLORD:
                DrawWarLord(x, y);
                break;
            }
        }
    }
}
