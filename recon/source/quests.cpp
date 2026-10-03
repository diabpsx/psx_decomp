/* QUESTS.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/QUESTS.CPP
 * (the original authored source; devilution/devilutionx as fallback). PSX deltas: base-Diablo class
 * set only (WARRIOR/ROGUE/SORCEROR, no MONK/BARD/BARBARIAN); FindBlock(x,y)==0x172 replaces
 * dPiece[x][y]==370; questxoff/questyoff replaced by cursor.cpp's shared offset_x/offset_y probe;
 * infostr/sel_data per-player macros (cursor.cpp convention); the CheckQuests lava-palette (qfade)
 * tail is absent on PSX; DrawQuestLog/PrintQLString use a Climax "Dialog" UI object (own class here,
 * not present in the PC source) with per-TU out-of-line copies of its small inline methods.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "psxsrc/cplayer_header.h"
#include "psxsrc/textfileinfo_header.h"
#include "source/gen/structs_quests.h"
#include "source/gen/externs_quests.h"
#include "source/gen/protos_quests.h"

/* File-local functions: retail SYM gives these class STAT (static); no other TU calls them. */
static void CheckRPortalOK(int *rx, int *ry);
static void RemoveQLog(void);
#include "source/diablo.h"

extern "C" int sprintf(char *buf, const char *fmt, ...);

/* quest ids (devilution enum quest_id) not already in diablo.h */
#define Q_GARBUD   2
#define Q_ZHAR     3
#define Q_VEIL     4
#define Q_DIABLO   5
#define Q_BLIND    8
#define Q_BLOOD    9
#define Q_WARLORD  11
#define Q_SCHAMB   14

#define QUEST_ANY    1
/* diablo.h already has QUEST_NOTAVAIL=0 QUEST_INIT=1 QUEST_ACTIVE=2 QUEST_DONE=3 (PSX's 4-state
 * model; hellfire's separate NOTDONE(3)/DONE(4) states collapsed onto a single DONE=3 here). */
#define QUEST_NOTACTIVE QUEST_INIT

#define QS_VBRPOFF 0
#define QS_VBRP1   1
#define QS_VBRP2   2
#define QS_VBRP3   3
#define QS_VBRP4   4

#define SL_VILEBETRAYER 5
#define WM_DIABSETLVL 0x45
#define WM_DIABNEXTLVL 0x42
#define MIT_RPORTAL 0x41
#define MI_ENEMYMONST 0

#define QUEST_OFFSETS 8
#define OBJ_ALTBOY 0x53
#define IS_QUESTDN 0xC

#define CLASS_WARRIOR 0
#define CLASS_ROGUE   1
#define CLASS_SORCEROR 2

#define MT_SKING   0x32
#define MT_CLEAVER 0x33

#define infostr (_infostr[sel_data])

unsigned char questlog = 0;
int ALLQUESTS = MAXQUESTS;
int QuestGroup4[2] = { Q_VEIL, Q_WARLORD };
static int QS_PX = 28, QS_PY = 32, QS_PW = 256, QS_PH = 176;
BOOL WaterDone = 0;
static int qtoffset = 0;
unsigned char *pQLogCel = 0;
int ReturnLvlX = 0, ReturnLvlY = 0, ReturnLvl = 0, ReturnLvlT = 0;
unsigned char rporttest = 0;
int qline = 0, numqlines = 0, qtopline = 0;
static RECT QSRect;
static int qlist[16];
static Dialog QSBack;

struct QuestData questlist[16] = {
    { 5, -1, 255, 0, 100, 0, 0, 0x73, 0x461 },  /* ROCK */
    { 9, -1, 255, 1, 100, 0, 0, 0x80, 0x53 },   /* MUSHROOM */
    { 4, -1, 255, 2, 100, 0, 0, 0x90, 0x17f },  /* GARBUD */
    { 8, -1, 255, 3, 100, 0, 0, 0x94, 0x4f7 },  /* ZHAR */
    { 14, -1, 255, 4, 100, 0, 0, 0x51, 0x235 }, /* VEIL */
    { 15, -1, 255, 5, 100, 0, 1, 0x19, 0x100 }, /* DIABLO */
    { 2, 2, 255, 6, 100, 0, 1, 0x3f, 0x440 },   /* BUTCHER */
    { 4, -1, 255, 7, 100, 0, 0, 0xc, 0x2e4 },   /* LTBANNER */
    { 7, -1, 255, 8, 100, 0, 0, 0xed, 0x1ac },  /* BLIND */
    { 5, -1, 255, 9, 100, 0, 0, 0xec, 0x4ad },  /* BLOOD */
    { 10, -1, 255, 10, 100, 0, 0, 0x58, 0x19 }, /* ANVIL */
    { 13, -1, 255, 11, 100, 0, 0, 0xee, 0x4ba },/* WARLORD */
    { 3, 3, 1, 12, 100, 1, 1, 0x1, 0x447 },     /* SKELKING */
    { 2, -1, 3, 13, 100, 4, 0, 0x27, 0x31c },   /* PWATER */
    { 6, -1, 2, 14, 100, 2, 0, 0xeb, 0x445 },   /* SCHAMB */
    { 15, 15, 1, 15, 100, 5, 1, 0x17, 0x1d },   /* BETRAYER */
};
int questtrigstr[5] = { 0x22f, 0x445, 0x286, 0x39, 0x4a2 };
int QuestGroup1[3] = { Q_BUTCHER, Q_LTBANNER, Q_GARBUD };
int QuestGroup2[3] = { Q_BLIND, Q_ROCK, Q_BLOOD };
int QuestGroup3[3] = { Q_MUSHROOM, Q_ZHAR, Q_ANVIL };
QuestStruct quests[16] = { 0 };

static void CheckRPortalOK(int *rx, int *ry)
{
    int nx, ny;

    nx = *rx;
    ny = *ry;
    if (nx == ViewX && ny == ViewY) {
        nx -= 1;
        ny -= 1;
    }
    *rx = nx;
    *ry = ny;
}

void CheckQuests(void)
{
    int i;
    int rportx, rporty;
    int omp;

    omp = myplr;
    if (QuestStatus(Q_BETRAYER) && gbMaxPlayers != 1 && quests[Q_BETRAYER]._qvar1 == QS_VBRP2) {
        AddObject(OBJ_ALTBOY, (setpc_x << 1) + 0x14, (setpc_y << 1) + 0x16);
        quests[Q_BETRAYER]._qvar1 = QS_VBRP3;
        if (deltaload == 0) {
            NetSendCmdQuest(1, Q_BETRAYER);
        }
    }
    if (gbMaxPlayers != 1) {
        return;
    }
    if (currlevel == quests[Q_BETRAYER]._qlevel && setlevel == 0 && quests[Q_BETRAYER]._qvar1 >= QS_VBRP2
        && (quests[Q_BETRAYER]._qactive == QUEST_ACTIVE || quests[Q_BETRAYER]._qactive == QUEST_DONE)) {
        if (quests[Q_BETRAYER]._qvar2 == QS_VBRPOFF || quests[Q_BETRAYER]._qvar2 == QS_VBRP2) {
            rportx = (quests[Q_BETRAYER]._qtx << 1) + 0x10;
            rporty = (quests[Q_BETRAYER]._qty << 1) + 0x10;
            CheckRPortalOK(&rportx, &rporty);
            quests[Q_BETRAYER]._qtx = rportx;
            quests[Q_BETRAYER]._qty = rporty;
            AddMissile(rportx, rporty, rportx, rporty, 0, MIT_RPORTAL, MI_ENEMYMONST, myplr, 0, 0);
            quests[Q_BETRAYER]._qvar2 = QS_VBRP1;
            if (quests[Q_BETRAYER]._qactive == QUEST_ACTIVE) {
                quests[Q_BETRAYER]._qvar1 = QS_VBRP3;
            }
            if (deltaload == 0) {
                NetSendCmdQuest(1, Q_BETRAYER);
            }
        }
    }
    if (quests[Q_BETRAYER]._qactive == QUEST_DONE && setlevel != 0 && setlvlnum == SL_VILEBETRAYER
        && quests[Q_BETRAYER]._qvar2 == QS_VBRP4) {
        AddMissile(0x23, 0x20, 0x23, 0x20, 0, MIT_RPORTAL, MI_ENEMYMONST, myplr, 0, 0);
        quests[Q_BETRAYER]._qvar2 = QS_VBRP3;
        if (deltaload == 0) {
            NetSendCmdQuest(1, Q_BETRAYER);
        }
    }
    if (setlevel != 0) {
        if (setlvlnum == quests[Q_PWATER]._qslvl && quests[Q_PWATER]._qactive != QUEST_NOTACTIVE
            && leveltype == quests[Q_PWATER]._qlvltype
            && ((nummonsters == 4 && quests[Q_PWATER]._qactive != QUEST_DONE) || quests[Q_PWATER]._qactive == QUEST_DONE)
            && WaterDone == 0) {
            quests[Q_PWATER]._qactive = QUEST_DONE;
            PlaySFX(IS_QUESTDN);
            WaterDone = 1;
            if (deltaload == 0) {
                NetSendCmdQuest(1, Q_PWATER);
            }
        }
        return;
    }
    for (i = 0; i < MAXQUESTS; i++) {
        for (int pl = 0; pl < 2; pl++) {
            struct PlayerStruct *player = &plr[pl];
            if (*(unsigned char *)((char *)player + 0x1D) != 0) {
                myplr = pl;
                if (currlevel == quests[i]._qlevel && quests[i]._qslvl != 0 && quests[i]._qactive != QUEST_NOTAVAIL
                    && *(short *)((char *)player + 0x30) == quests[i]._qtx
                    && *(short *)((char *)player + 0x32) == quests[i]._qty) {
                    if (quests[i]._qlvltype != 255) {
                        setlvltype = quests[i]._qlvltype;
                    }
                    FadeGameOut();
                    StartNewLvl(myplr, WM_DIABSETLVL, quests[i]._qslvl);
                }
            }
        }
    }
    myplr = omp;
}

unsigned char ForceQuests(void)
{
    if (gbMaxPlayers != 1) {
        return 0;
    }

    for (int i = 0; i < MAXQUESTS; i++) {
        if (i == Q_BETRAYER) continue;
        if (currlevel != quests[i]._qlevel) continue;
        if (quests[i]._qslvl == 0) continue;

        int ql = quests[quests[i]._qidx]._qslvl - 1;
        int qx = quests[i]._qtx;
        int qy = quests[i]._qty;
        for (int j = 0; j < QUEST_OFFSETS; j++) {
            if (qx + offset_x[j] != cursmx) continue;
            if (qy + offset_y[j] != cursmy) continue;

            sprintf(infostr, GetStr(0x498), GetStr(questtrigstr[ql]));
            cursmx = qx;
            cursmy = qy;
            return 1;
        }
    }

    return 0;
}

unsigned char QuestStatus(int i)
{
    if (setlevel) return 0;
    if (currlevel != quests[i]._qlevel) return 0;
    if (quests[i]._qactive == QUEST_NOTAVAIL) return 0;
    if (gbMaxPlayers != 1 && !(questlist[i]._qflags & QUEST_ANY)) return 0;
    return 1;
}

#define MTIDX(m) (*(unsigned char *)((char *)monster[m].MType + 0x12))
#define PCLASS(pnum) (*(signed char *)((char *)&plr[pnum] + 0xF6))

void CheckQuestKill(int m, unsigned char sendmsg)
{
    if (MTIDX(m) == MT_SKING) {
        quests[Q_SKELKING]._qactive = QUEST_DONE;
        sfxdelay = 30;
        if (PCLASS(myplr) == CLASS_WARRIOR) sfxdnum = 0x324;
        else if (PCLASS(myplr) == CLASS_ROGUE) sfxdnum = 0x2B6;
        else if (PCLASS(myplr) == CLASS_SORCEROR) sfxdnum = 0x24E;
        if (sendmsg) NetSendCmdQuest(1, Q_SKELKING);
    } else if (MTIDX(m) == MT_CLEAVER) {
        quests[Q_BUTCHER]._qactive = QUEST_DONE;
        sfxdelay = 30;
        if (PCLASS(myplr) == CLASS_WARRIOR) sfxdnum = 0x322;
        else if (PCLASS(myplr) == CLASS_ROGUE) sfxdnum = 0x2B4;
        else if (PCLASS(myplr) == CLASS_SORCEROR) sfxdnum = 0x24C;
        if (sendmsg) NetSendCmdQuest(1, Q_BUTCHER);
    } else if (monster[m].mName == *(unsigned short *)(UniqMonst + 2)) {
        quests[Q_GARBUD]._qactive = QUEST_DONE;
        sfxdelay = 30;
        if (PCLASS(myplr) == CLASS_WARRIOR) sfxdnum = 0x30E;
        else if (PCLASS(myplr) == CLASS_ROGUE) sfxdnum = 0x2A0;
        else if (PCLASS(myplr) == CLASS_SORCEROR) sfxdnum = 0x238;
    } else if (monster[m].mName == *(unsigned short *)(UniqMonst + 0x32)) {
        quests[Q_ZHAR]._qactive = QUEST_DONE;
        sfxdelay = 30;
        if (PCLASS(myplr) == CLASS_WARRIOR) sfxdnum = 0x30F;
        else if (PCLASS(myplr) == CLASS_ROGUE) sfxdnum = 0x2A1;
        else if (PCLASS(myplr) == CLASS_SORCEROR) sfxdnum = 0x239;
    } else if (monster[m].mName == *(unsigned short *)(UniqMonst + 0x62) && gbMaxPlayers != 1) {
        int i, j;
        quests[Q_BETRAYER]._qactive = QUEST_DONE;
        quests[Q_BETRAYER]._qvar1 = 7;
        sfxdelay = 30;
        quests[Q_DIABLO]._qactive = QUEST_ACTIVE;
        for (j = 0; j < 96; j++) {
            for (i = 0; i < 96; i++) {
                if (FindBlock(i, j) == 0x172) {
                    if (quests[Q_BETRAYER]._qactive == QUEST_DONE) {
                        trigs[numtrigs]._tx = i;
                        trigs[numtrigs]._ty = j;
                        trigs[numtrigs]._tmsg = WM_DIABNEXTLVL;
                        numtrigs++;
                    }
                }
            }
        }
        if (PCLASS(myplr) == CLASS_WARRIOR) sfxdnum = 0x325;
        else if (PCLASS(myplr) == CLASS_ROGUE) sfxdnum = 0x2B7;
        else if (PCLASS(myplr) == CLASS_SORCEROR) sfxdnum = 0x24F;
        if (sendmsg) {
            NetSendCmdQuest(1, Q_BETRAYER);
            NetSendCmdQuest(1, Q_DIABLO);
        }
    } else if (monster[m].mName == *(unsigned short *)(UniqMonst + 0x62) && gbMaxPlayers == 1) {
        quests[Q_BETRAYER]._qactive = QUEST_DONE;
        sfxdelay = 30;
        InitVPTriggers();
        quests[Q_BETRAYER]._qvar1 = 7;
        quests[Q_BETRAYER]._qvar2 = QS_VBRP4;
        quests[Q_DIABLO]._qactive = QUEST_ACTIVE;
        if (PCLASS(myplr) == CLASS_WARRIOR) sfxdnum = 0x325;
        else if (PCLASS(myplr) == CLASS_ROGUE) sfxdnum = 0x2B7;
        else if (PCLASS(myplr) == CLASS_SORCEROR) sfxdnum = 0x24F;
    } else if (monster[m].mName == *(unsigned short *)(UniqMonst + 0xC2)) {
        quests[Q_WARLORD]._qactive = QUEST_DONE;
        sfxdelay = 30;
        if (PCLASS(myplr) == CLASS_WARRIOR) sfxdnum = 0x330;
        else if (PCLASS(myplr) == CLASS_ROGUE) sfxdnum = 0x2C2;
        else if (PCLASS(myplr) == CLASS_SORCEROR) sfxdnum = 0x25A;
    }
}

void SetReturnLvlPos(void)
{
    switch (setlvlnum) {
    case 1:
        ReturnLvlX = quests[Q_SKELKING]._qtx + 1;
        ReturnLvlY = quests[Q_SKELKING]._qty;
        ReturnLvl = quests[Q_SKELKING]._qlevel;
        ReturnLvlT = 1;
        break;
    case 2:
        ReturnLvlX = quests[Q_SCHAMB]._qtx + 1;
        ReturnLvlY = quests[Q_SCHAMB]._qty;
        ReturnLvl = quests[Q_SCHAMB]._qlevel;
        ReturnLvlT = 2;
        break;
    case 4:
        ReturnLvlX = quests[Q_PWATER]._qtx;
        ReturnLvlY = quests[Q_PWATER]._qty + 1;
        ReturnLvl = quests[Q_PWATER]._qlevel;
        ReturnLvlT = 1;
        break;
    case 5:
        ReturnLvlX = quests[Q_BETRAYER]._qtx + 1;
        ReturnLvlY = quests[Q_BETRAYER]._qty - 1;
        ReturnLvl = quests[Q_BETRAYER]._qlevel;
        ReturnLvlT = 4;
        break;
    }
}

void GetReturnLvlPos(void)
{
    if (quests[Q_BETRAYER]._qactive == QUEST_DONE) {
        quests[Q_BETRAYER]._qvar2 = QS_VBRP2;
    }
    ViewX = ReturnLvlX;
    ViewY = ReturnLvlY;
    currlevel = (unsigned char)ReturnLvl;
    leveltype = (unsigned char)ReturnLvlT;
}

void ResyncQuests(void)
{
    int i;
    int tren;

    // for Poison Water quest only - inits the poison/not poison water pal
    // (hellfire QUESTS.CPP 786-795).  The PSX PAL beta (1997-12-12) has this
    // block calling TSK_AddTask(0, TSK_Lava2Water, 0x800, 0) when the quest
    // is done; this build no longer has TSK_Lava2Water, but the emptied block
    // is still compiled: retail's SLD spans the same 89 lines as the beta and
    // its block-0 schedule (saves before the QuestStatus argument) needs it.
    if (setlevel) {
        if (setlvlnum == quests[Q_PWATER]._qslvl && quests[Q_PWATER]._qactive != QUEST_NOTACTIVE && leveltype == quests[Q_PWATER]._qlvltype) {
            if (quests[Q_PWATER]._qactive == QUEST_DONE) {
                // TSK_AddTask(0, TSK_Lava2Water, 0x800, 0);
            }
        }
    }

    if (QuestStatus(Q_LTBANNER)) {
        if (quests[Q_LTBANNER]._qvar1 == 1) {
            ObjChangeMapResync(setpc_x + setpc_w - 2, setpc_y + setpc_h - 2, setpc_x + setpc_w + 1, setpc_y + setpc_h + 1);
        }
        if (quests[Q_LTBANNER]._qvar1 == 2) {
            ObjChangeMapResync(setpc_x + setpc_w - 2, setpc_y + setpc_h - 2, setpc_x + setpc_w + 1, setpc_y + setpc_h + 1);
            ObjChangeMapResync(setpc_x, setpc_y, setpc_x + (setpc_w >> 1) + 2, (setpc_y + (setpc_h >> 1)) - 2);
            for (i = 0; i < numobjects; i++) {
                SyncObjectAnim(objectactive[i]);
            }
            {
                tren = TransVal;
                TransVal = 9;
                DRLG_MRectTrans(setpc_x, setpc_y, setpc_x + (setpc_w >> 1) + 4, setpc_y + (setpc_h >> 1));
                TransVal = tren;
            }
        }
        if (quests[Q_LTBANNER]._qvar1 == 3) {
            ObjChangeMapResync(setpc_x, setpc_y, setpc_x + setpc_w + 1, setpc_y + setpc_h + 1);
            for (i = 0; i < numobjects; i++) {
                SyncObjectAnim(objectactive[i]);
            }
            {
                tren = TransVal;
                TransVal = 9;
                DRLG_MRectTrans(setpc_x, setpc_y, setpc_x + (setpc_w >> 1) + 4, setpc_y + (setpc_h >> 1));
                TransVal = tren;
            }
        }
    }
    if (currlevel == quests[Q_MUSHROOM]._qlevel) {
        if (quests[Q_MUSHROOM]._qactive == QUEST_NOTACTIVE && quests[Q_MUSHROOM]._qvar1 == 0) {
            SpawnQuestItem(0x13, 0, 0, 5, 1);
            quests[Q_MUSHROOM]._qvar1 = 1;
        } else if (quests[Q_MUSHROOM]._qactive == QUEST_ACTIVE) {
            if (quests[Q_MUSHROOM]._qvar1 >= 5) {
                Qtalklist[1][1] = 0x7B;
                Qtalklist[6][1] = -1;
            } else if (quests[Q_MUSHROOM]._qvar1 >= 7) {
                Qtalklist[1][1] = -1;
            }
        }
    }
    if (currlevel == quests[Q_VEIL]._qlevel + 1 && quests[Q_VEIL]._qactive == QUEST_ACTIVE && quests[Q_VEIL]._qvar1 == 0) {
        quests[Q_VEIL]._qvar1 = 1;
        SpawnQuestItem(0xF, 0, 0, 5, 1);
    }
    if (setlevel != 0 && setlvlnum == SL_VILEBETRAYER) {
        if (quests[Q_BETRAYER]._qvar1 >= 4) {
            ObjChangeMapResync(1, 0xB, 0x14, 0x12);
        }
        if (quests[Q_BETRAYER]._qvar1 >= 6) {
            ObjChangeMapResync(1, 0x12, 0x14, 0x18);
        }
        if (quests[Q_BETRAYER]._qvar1 >= 7) {
            InitVPTriggers();
        }
        for (i = 0; i < numobjects; i++) {
            SyncObjectAnim(objectactive[i]);
        }
    }
    if (currlevel == quests[Q_BETRAYER]._qlevel && setlevel == 0
        && (quests[Q_BETRAYER]._qvar2 == QS_VBRP1 || quests[Q_BETRAYER]._qvar2 >= QS_VBRP3)
        && quests[Q_BETRAYER]._qactive >= QUEST_ACTIVE && quests[Q_BETRAYER]._qactive <= QUEST_DONE) {
        quests[Q_BETRAYER]._qvar2 = QS_VBRP2;
    }
}

void PrintQLString(int x, int y, unsigned char cjustflag, char *str, char col)
{
    unsigned char r = 0, g = 0, b = 0;
    y *= 8;
    switch (col) {
    case 0: r = WHITER; g = WHITEG; b = WHITEB; break;
    case 1: r = BLUER; g = BLUEG; b = BLUEB; break;
    case 2: r = REDR; g = REDG; b = REDB; break;
    case 3: r = GOLDR; g = GOLDG; b = GOLDB; break;
    }
    MediumFont.Print(0, y | 3, str, JustCentre, &QSRect, r, g, b);
    if (qline == y / 8) {
        int len = MediumFont.GetStrWidth(str);
        x = (QS_PW - len) / 2;
        DrawSpinner(x + QS_PX - 0xB, y + QS_PY + 3, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0xFFFF, 1, 0, 8);
        DrawSpinner(x + len + QS_PX + 3, y + QS_PY + 3, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0xFFFF, 1, 0, 8);
    }
}

void DrawQuestLog(void)
{
    int i, l, q, totlines;

    if (qtextflag == 0) {
        PrintSelectBack(0x4E6);
    }
    QSBack.SetBack(0x94);
    QSBack.SetBorder(0x12);
    QSBack.SetRGB(BACKR >> 1, BACKG >> 1, BACKB >> 1);
    QSBack.Back(QS_PX + 0x10, QS_PY + 8, QS_PW - 0x20, QS_PH - 0x10);
    QSBack.SetBorder(0x12);
    QSBack.SetBack(5);
    QSBack.SetRGB(BORDERR, BORDERG, BORDERB);
    QSBack.Back(QS_PX, QS_PY, QS_PW, QS_PH);
    QSRect.x = (short)QS_PX;
    QSRect.y = (short)QS_PY;
    QSRect.w = (short)QS_PW;
    QSRect.h = (short)QS_PH;
    if (qtextflag == 0) {
        PrintQLString(0, 2, 1, GetStr(0x33B), 1);
    }
    totlines = 7;
    if (numqlines < 7) {
        totlines = numqlines;
    }
    l = qtopline;
    for (i = 0; i < totlines; i++) {
        q = qlist[i + qtoffset];
        if (qtextflag == 0) {
            PrintQLString(0, l, 1, GetStr(questlist[q]._qlstr), 0);
        }
        l += 2;
    }
}

void DrawQuestLogTSK(TASK *T)
{
    (void)T;
    GLUE_SetShowGameScreenFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SuspendGame();
    stream_stop();
    TSK_Sleep(1);
    while (questlog) {
        if (qtextflag == 0 && CDWAIT == 0) DrawQuestLog();
        TSK_Sleep(1);
    }
    if (Qfromoptions == 0) {
        RemoveQLog();
    }
    if (qtextflag == 0) {
        GLUE_SetShowGameScreenFlag(1);
        GLUE_SetHomingScrollFlag(1);
        GLUE_SetShowGameScreenFlag(1);
    }
    Qfromoptions = 0;
}

void StartQuestlog(void)
{
    int i;

    numqlines = 0;
    for (i = 0; i < ALLQUESTS; i++) {
        if (quests[i]._qactive == QUEST_ACTIVE && quests[i]._qlog != 0) {
            qlist[numqlines] = i;
            numqlines++;
        }
    }
    if (numqlines < 7) {
        qtopline = ((7 - numqlines) >> 1) * 2 + 6;
    } else {
        qtopline = 6;
    }
    if (numqlines != 0) {
        qline = qtopline;
    }
    questlog = 1;
    qtoffset = 0;
    PostGamePad(2, 0, 0, 0);
    GLUE_SetHomingScrollFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SuspendGame();
    TSK_AddTask(0, DrawQuestLogTSK, 0x800, 0);
}

void QuestlogUp(void)
{
    if (numqlines > 1) {
        if (numqlines < 7) {
            if (qline == qtopline)
                qline = qline + ((numqlines - 1) << 1);
            else
                qline -= 2;
        } else if (qline == qtopline) {
            qtoffset--;
            if (qtoffset < 0) {
                qtoffset = numqlines - 7;
                qline += 12;
            }
        } else {
            qline -= 2;
        }
        PlaySFX(0x32);
    }
}

void QuestlogDown(void)
{
    if (numqlines > 1) {
        if (numqlines < 7) {
            if (qline == ((numqlines - 1) << 1) + qtopline)
                qline = ((numqlines - 1) << 1) + qtopline;
            if (qline == (numqlines - 1) * 2 + qtopline)
                qline = qtopline;
            else
                qline += 2;
        } else if (qline == qtopline + 12) {
            qtoffset++;
            if (numqlines - 7 < qtoffset) {
                qtoffset = 0;
                qline = qtopline;
            }
        } else {
            qline += 2;
        }
        PlaySFX(0x32);
    }
}

static void RemoveQLog(void)
{
    if (questlog != 0) {
        GLUE_SetShowGameScreenFlag(1);
        if (Qfromoptions != 0) {
            options_pad = Qfromoptions - 1;
            TSK_Sleep(1);
            Qfromoptions = 3;
            ToggleOptions();
        } else {
            PostGamePad(5, 0, 0, 0);
            GLUE_SetHomingScrollFlag(1);
            if (qtextflag == 0) {
                GLUE_ResumeGame();
                GLUE_SetShowPanelFlag(1);
                options_pad = -1;
            }
        }
        questlog = 0;
    }
}

void QuestlogEnter(void)
{
    int q;

    if (TextPtr != 0 && CDWAIT == 0) {
        if (numqlines != 0) {
            q = qlist[((qline + qtoffset * 2) - qtopline) >> 1];
            PlaySFX(0x33);
            InitQTextMsg(quests[q]._qmsg);
            questlog = 0;
            return;
        }
        if (Qfromoptions == 0) {
            PlaySFX(0x33);
        }
    }
}

void QuestlogESC(void)
{
    PlaySFX(0x33);
    RemoveQLog();
}

void SetMultiQuest(int q, int s, unsigned char l, int v1)
{
    if (quests[q]._qactive != QUEST_DONE) {
        if (quests[q]._qactive < s) {
            quests[q]._qactive = (unsigned char)s;
        }
        quests[q]._qlog = quests[q]._qlog | l;
        if (quests[q]._qvar1 < v1) {
            quests[q]._qvar1 = (unsigned char)v1;
        }
    }
}
