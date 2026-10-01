/* TOWNERS.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/towners.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "psxsrc/textfileinfo_header.h"
#include "source/gen/structs_towners.h"
#include "source/gen/externs_towners.h"
#include "source/gen/protos_towners.h"
#include "source/diablo.h"
#include "source/gen/tables_towners.h"

struct TownerStruct towner[16] = { { 0 } };

/* Initialized globals follow the local sound state below in retail small data. */
unsigned long CowPlaying = 0;
static unsigned long sgdwCowClicks;
static int sgnCowMsg;

int GetActiveTowner(int t)
{
    for (int i = 0; i < numtowners; i++) {
        if (towner[i]._ttype == t)
            return i;
    }
    return -1;
}

void SetTownerGPtrs(unsigned char *pData, unsigned char **pAnim)
{
    int i;

    for (i = 7; i >= 0; i--)
        pAnim[i] = pData;
}

void NewTownerAnim(int tnum, unsigned char *pAnim, int numFrames, int Delay)
{
    towner[tnum]._tAnimLen = numFrames;
    towner[tnum]._tAnimFrame = 1;
    towner[tnum]._tAnimCnt = 0;
    towner[tnum]._tAnimDelay = Delay;
}

void InitTownerInfo(int i, long w, unsigned char sel, int t, int x, int y, char ao, int tp)
{
    memset(&towner[i], 0, sizeof(TownerStruct));
    towner[i]._tSelFlag = sel;
    towner[i]._tAnimWidth = w;
    towner[i]._tAnimWidth2 = (w - 64) >> 1;
    towner[i]._tMsgSaid = 0;
    towner[i]._ttype = t;
    towner[i]._tx = x;
    towner[i]._ty = y;
    dung_map[x][y].dMonster = i + 1;
    towner[i]._tAnimOrder = ao;
    towner[i]._tTenPer = tp;
    towner[i]._tSeed = GetRndSeed();
}

void InitQstSnds(int i)
{
    int j;

    j = i;
    if (boyloadflag)
        j++;
    for (int quest = 0; quest < MAXQUESTS; quest++) {
        towner[i].qsts[quest]._qsttype = quests[quest]._qtype;
        towner[i].qsts[quest]._qstmsg = Qtalklist[j][quest];
        if (Qtalklist[j][quest] != -1)
            towner[i].qsts[quest]._qstmsgact = 1;
        else
            towner[i].qsts[quest]._qstmsgact = 0;
    }
}

void InitSmith()
{
    InitTownerInfo(numtowners, 96, 1, TOWN_SMITH, 62, 63, 0, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\Smith\\SmithN.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 16;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_SW], towner[numtowners]._tNFrames, 3);
    towner[numtowners]._tName = 0x1A8;   /* "Griswold the Blacksmith" */
    numtowners++;
}

void InitBarOwner()
{
    bannerflag = 0;
    InitTownerInfo(numtowners, 96, 1, TOWN_TAVERN, 55, 62, 3, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\TwnF\\TwnFN.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 16;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_SW], towner[numtowners]._tNFrames, 3);
    towner[numtowners]._tName = 0x2E5;   /* "Ogden the Tavern owner" */
    numtowners++;
}

void InitTownDead()
{
    InitTownerInfo(numtowners, 96, 1, TOWN_DEADGUY, 24, 32, -1, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\Butch\\Deadguy.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 8;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_N], towner[numtowners]._tNFrames, 6);
    towner[numtowners]._tName = 0x4E0;   /* "Wounded Townsman" */
    numtowners++;
}

void InitWitch()
{
    InitTownerInfo(numtowners, 96, 1, TOWN_WITCH, 80, 20, 5, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\TownWmn1\\Witch.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 19;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_S], towner[numtowners]._tNFrames, 6);
    towner[numtowners]._tName = 0xE;     /* "Adria the Witch" */
    numtowners++;
}

void InitBarmaid()
{
    InitTownerInfo(numtowners, 96, 1, TOWN_BMAID, 43, 66, -1, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\TownWmn1\\WmnN.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 18;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_S], towner[numtowners]._tNFrames, 6);
    towner[numtowners]._tName = 0x184;   /* "Gillian the Barmaid" */
    numtowners++;
}

void InitBoy()
{
    boyloadflag = 1;
    InitTownerInfo(numtowners, 96, 1, TOWN_PEGBOY, 11, 53, -1, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\TownBoy\\PegKid1.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 20;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_S], towner[numtowners]._tNFrames, 6);
    towner[numtowners]._tName = 0x4D8;   /* "Wirt the Peg-legged boy" */
    numtowners++;
}

void InitHealer()
{
    InitTownerInfo(numtowners, 96, 1, TOWN_HEALER, 55, 79, 1, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\Healer\\Healer.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 20;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_SE], towner[numtowners]._tNFrames, 6);
    towner[numtowners]._tName = 0x306;   /* "Pepin the Healer" */
    numtowners++;
}

void InitTeller()
{
    InitTownerInfo(numtowners, 96, 1, TOWN_STORY, 62, 71, 2, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\Strytell\\Strytell.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 25;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_S], towner[numtowners]._tNFrames, 3);
    towner[numtowners]._tName = 0x9C;    /* "Cain the Elder" */
    numtowners++;
}

void InitDrunk()
{
    InitTownerInfo(numtowners, 96, 1, TOWN_DRUNK, 71, 84, 4, 10);
    InitQstSnds(numtowners);
    towner[numtowners]._tNData = LoadFileInMem("Towners\\Drunk\\TwnDrunk.CEL", NULL);
    for (int i = 0; i < 8; i++)
        towner[numtowners]._tNAnim[i] = towner[numtowners]._tNData;
    towner[numtowners]._tNFrames = 18;
    NewTownerAnim(numtowners, towner[numtowners]._tNAnim[DIR_S], towner[numtowners]._tNFrames, 3);
    towner[numtowners]._tName = 0x13E;   /* "Farnham the Drunk" */
    numtowners++;
}

void InitCows()
{
    int i, x, y, d, x2, y2;

    pCowCels = LoadFileInMem("Towners\\Animals\\Cow.CEL", NULL);
    for (i = 0; i < 3; i++) {
        x = TownCowX[i];
        y = TownCowY[i];
        d = TownCowDir[i];
        InitTownerInfo(numtowners, 128, 0, TOWN_COW, x, y, -1, 10);
        towner[numtowners]._tNData = pCowCels;
        SetTownerGPtrs(towner[numtowners]._tNData, towner[numtowners]._tNAnim);
        towner[numtowners]._tNFrames = 12;
        NewTownerAnim(numtowners, towner[numtowners]._tNAnim[d], towner[numtowners]._tNFrames, 3);
        towner[numtowners]._tAnimFrame = ENG_random(11) + 1;
        towner[numtowners]._tSelFlag = 1;
        towner[numtowners]._tdir = d;
        towner[numtowners]._tName = 0xD2;   /* "Cow" */
        x2 = x + cowoffx[d];
        y2 = y + cowoffy[d];
        if (dung_map[x][y2].dMonster == 0)
            dung_map[x][y2].dMonster = -(numtowners + 1);
        if (dung_map[x2][y].dMonster == 0)
            dung_map[x2][y].dMonster = -(numtowners + 1);
        if (dung_map[x2][y2].dMonster == 0)
            dung_map[x2][y2].dMonster = -(numtowners + 1);
        numtowners++;
    }
}

void InitTowners()
{
    numtowners = 0;
    boyloadflag = 0;
    InitSmith();
    InitHealer();
    if (quests[Q_BUTCHER]._qactive != QUEST_NOTAVAIL && quests[Q_BUTCHER]._qactive != QUEST_DONE)
        InitTownDead();
    InitBarOwner();
    InitTeller();
    InitDrunk();
    InitWitch();
    InitBarmaid();
    InitBoy();
    InitCows();
}

void FreeTownerGFX()
{
    int i;

    for (i = 0; i < NUM_TOWNERS; i++) {
        if (towner[i]._tNData == pCowCels) {
            towner[i]._tNData = NULL;
        } else if (towner[i]._tNData) {
            MemFreeDbg(towner[i]._tNData);
        }
    }
    MemFreeDbg(pCowCels);
}

void TownCtrlMsg(int i)
{
    int p;
    int dx, dy;

    if (towner[i]._tbtcnt != 0) {
        p = towner[i]._tVar1;
        dx = abs(towner[i]._tx - plr[p]._px);
        dy = abs(towner[i]._ty - plr[p]._py);
        if (dx >= 2 || dy >= 2)
            towner[i]._tbtcnt = 0;
    }
}

void TownBlackSmith()
{
    int tidx;

    tidx = GetActiveTowner(TOWN_SMITH);
    TownCtrlMsg(tidx);
    if (!qtextflag && quests[Q_ROCK]._qactive == QUEST_DONE)
        IsDplayer(towner[tidx]._tx, towner[tidx]._ty + 1);
}

void TownBarOwner()
{
    int tidx;

    tidx = GetActiveTowner(TOWN_TAVERN);
    TownCtrlMsg(tidx);
    if (!qtextflag && quests[Q_LTBANNER]._qactive == QUEST_DONE && bannerflag)
        IsDplayer(towner[tidx]._tx, towner[tidx]._ty + 1);
}

void TownDead()
{
    int tidx;

    tidx = GetActiveTowner(TOWN_DEADGUY);
    TownCtrlMsg(tidx);
    if (!qtextflag) {
        if (quests[Q_BUTCHER]._qactive == QUEST_ACTIVE && !quests[Q_BUTCHER]._qlog)
            return;
        if (quests[Q_BUTCHER]._qactive != QUEST_INIT) {
            towner[tidx]._tAnimDelay = 1000;
            towner[tidx]._tAnimFrame = 1;
            towner[tidx]._tName = 0x3DA;   /* "Slain Townsman" */
        }
    }
    if (quests[Q_BUTCHER]._qactive != QUEST_INIT)
        towner[tidx]._tAnimCnt = 0;
}

void TownHealer()
{
    TownCtrlMsg(GetActiveTowner(TOWN_HEALER));
}

void TownStory()
{
    TownCtrlMsg(GetActiveTowner(TOWN_STORY));
}

void TownDrunk()
{
    TownCtrlMsg(GetActiveTowner(TOWN_DRUNK));
}

void TownBoy()
{
    TownCtrlMsg(GetActiveTowner(TOWN_PEGBOY));
}

void TownWitch()
{
    TownCtrlMsg(GetActiveTowner(TOWN_WITCH));
}

void TownBarMaid()
{
    TownCtrlMsg(GetActiveTowner(TOWN_BMAID));
}

void TownCow()
{
    TownCtrlMsg(GetActiveTowner(TOWN_COW));
}

void ProcessTowners()
{
    for (int i = 0; i < NUM_TOWNERS; i++) {
        switch (towner[i]._ttype) {
        case TOWN_SMITH:
            TownBlackSmith();
            break;
        case TOWN_HEALER:
            TownHealer();
            break;
        case TOWN_DEADGUY:
            TownDead();
            break;
        case TOWN_TAVERN:
            TownBarOwner();
            break;
        case TOWN_STORY:
            TownStory();
            break;
        case TOWN_DRUNK:
            TownDrunk();
            break;
        case TOWN_PEGBOY:
            TownBoy();
            break;
        case TOWN_WITCH:
            TownWitch();
            break;
        case TOWN_BMAID:
            TownBarMaid();
            break;
        case TOWN_COW:
            TownCow();
            break;
        }
        towner[i]._tAnimCnt++;
        if (towner[i]._tAnimCnt >= towner[i]._tAnimDelay) {
            towner[i]._tAnimCnt = 0;
            if (towner[i]._tAnimOrder >= 0) {
                int ao = towner[i]._tAnimOrder;
                towner[i]._tAnimFrameCnt++;
                if (AnimOrder[ao][towner[i]._tAnimFrameCnt] == -1)
                    towner[i]._tAnimFrameCnt = 0;
                towner[i]._tAnimFrame = AnimOrder[ao][towner[i]._tAnimFrameCnt];
            } else {
                towner[i]._tAnimFrame++;
                if (towner[i]._tAnimFrame > towner[i]._tAnimLen)
                    towner[i]._tAnimFrame = 1;
            }
        }
    }
}

ItemStruct *PlrHasItem(int pnum, int item, int &i)
{
    for (i = 0; i < plr[pnum]._pNumInv; i++) {
        if (plr[pnum].InvList[i].IDidx == item)
            return &plr[pnum].InvList[i];
    }
    return NULL;
}

static void CowSFX(int pnum)
{
    static const int snSFX[3][3] = {
        { PS_WARR52, PS_ROGUE52, PS_MAGE52 },
        { PS_WARR49, PS_ROGUE49, PS_MAGE49 },
        { PS_WARR50, PS_ROGUE50, PS_MAGE50 },
    };
    static int snLastCowSFX = -1;

    sgdwCowClicks++;
    if (!CowPlaying) {
        if (sgdwCowClicks >= 4) {
            sgdwCowClicks = 0;
            snLastCowSFX = snSFX[sgnCowMsg][plr[pnum]._pClass];
            sgnCowMsg++;
            if (sgnCowMsg >= 3)
                sgnCowMsg = 0;
        } else {
            if (sgdwCowClicks == 1)
                snLastCowSFX = TSFX_COW2;
            else
                snLastCowSFX = TSFX_COW1;
            CowPlaying = 100;
        }
        PlaySfxLoc(snLastCowSFX, plr[pnum]._px, plr[pnum]._py);
    }
}

int numtowners = 0;
unsigned char storeflag = 0;
unsigned char boyloadflag = 0;
unsigned char bannerflag = 0;
unsigned char *pCowCels = 0;

void TownerTalk(int first, int t)
{
    sgdwCowClicks = 0;
    sgnCowMsg = 0;
    storeflag = 1;
    options_pad = myplr;
    InitQTextMsg(first);
}

void TalkToTowner(int p, int t)
{
    int i, dx, dy;
    ItemStruct *Item;

    ENG_random(3);
    ENG_random(4);
    ENG_random(5);
    dx = abs(plr[p]._px - towner[t]._tx);
    dy = abs(plr[p]._py - towner[t]._ty);
    if (dx >= 3 || dy >= 3)
        return;
    if (qtextflag)
        return;
    if (stextflag)
        return;
    towner[t]._tMsgSaid = 0;
    if (_pcurs[myplr] >= CURSOR_FIRSTITEM && !DropItemBeforeTrig())
        return;
    if (t == GetActiveTowner(TOWN_TAVERN)) {
        if (!plr[p]._pLvlVisited[1] && !towner[t]._tMsgSaid) {
            towner[t]._tbtcnt = 150;
            towner[t]._tVar1 = p;
            InitQTextMsg(TEXT_INTRO);
            towner[t]._tMsgSaid = 1;
        }
        if ((plr[p]._pLvlVisited[2] || plr[p]._pLvlVisited[4]) && quests[Q_SKELKING]._qactive != QUEST_NOTAVAIL) {
            if (quests[Q_SKELKING]._qvar2 == 0 && !towner[t]._tMsgSaid) {
                quests[Q_SKELKING]._qvar2 = 1;
                quests[Q_SKELKING]._qlog = 1;
                if (quests[Q_SKELKING]._qactive == QUEST_INIT) {
                    quests[Q_SKELKING]._qactive = QUEST_ACTIVE;
                    quests[Q_SKELKING]._qvar1 = 1;
                }
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_KING2);
                towner[t]._tMsgSaid = 1;
                NetSendCmdQuest(1, Q_SKELKING);
            }
            if (quests[Q_SKELKING]._qactive == QUEST_DONE && quests[Q_SKELKING]._qvar2 == 1 && !towner[t]._tMsgSaid) {
                quests[Q_SKELKING]._qvar2 = 2;
                quests[Q_SKELKING]._qvar1 = 2;
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_KING4);
                towner[t]._tMsgSaid = 1;
                NetSendCmdQuest(1, Q_SKELKING);
            }
        }
        if (gbMaxPlayers == 1 && plr[p]._pLvlVisited[3] && quests[Q_LTBANNER]._qactive != QUEST_NOTAVAIL) {
            if ((quests[Q_LTBANNER]._qactive == QUEST_INIT || quests[Q_LTBANNER]._qactive == QUEST_ACTIVE) && quests[Q_LTBANNER]._qvar2 == 0 && !towner[t]._tMsgSaid) {
                quests[Q_LTBANNER]._qvar2 = 1;
                if (quests[Q_LTBANNER]._qactive == QUEST_INIT) {
                    quests[Q_LTBANNER]._qvar1 = 1;
                    quests[Q_LTBANNER]._qactive = QUEST_ACTIVE;
                }
                quests[Q_LTBANNER]._qlog = 1;
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_BANNER2);
                towner[t]._tMsgSaid = 1;
                NetSendCmdQuest(1, Q_LTBANNER);
            }
            if (quests[Q_LTBANNER]._qvar2 == 1 && PlrHasItem(p, IDI_BANNER, i) != NULL && !towner[t]._tMsgSaid) {
                quests[Q_LTBANNER]._qactive = QUEST_DONE;
                quests[Q_LTBANNER]._qvar1 = 3;
                RemoveInvItem(p, i);
                CreateItem(UITEM_HARCREST, towner[t]._tx, towner[t]._ty + 1);
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_BANNER3);
                towner[t]._tMsgSaid = 1;
                NetSendCmdQuest(1, Q_LTBANNER);
            }
        }
        if (!qtextflag) {
            TownerTalk(TEXT_OGDEN1, t);
            if (storeflag)
                StartStore(STORE_TAVERN);
        }
    } else if (t == GetActiveTowner(TOWN_DEADGUY)) {
        if (quests[Q_BUTCHER]._qactive == QUEST_ACTIVE && quests[Q_BUTCHER]._qvar1 == 1) {
            towner[t]._tbtcnt = 150;
            towner[t]._tVar1 = p;
            quests[Q_BUTCHER]._qvar1 = 1;
            unsigned char effect_is_playing(int nSFX);
            if (plr[p]._pClass == PC_WARRIOR && !effect_is_playing(PS_WARR8)) {
                PlaySFX(PS_WARR8);
            } else if (plr[p]._pClass == PC_ROGUE && !effect_is_playing(PS_ROGUE8)) {
                PlaySFX(PS_ROGUE8);
            } else if (plr[p]._pClass == PC_SORCERER && !effect_is_playing(PS_MAGE8)) {
                PlaySFX(PS_MAGE8);
            }
            towner[t]._tMsgSaid = 1;
            NetSendCmdQuest(1, Q_BUTCHER);
        } else if (quests[Q_BUTCHER]._qactive == QUEST_DONE && quests[Q_BUTCHER]._qvar1 == 1) {
            quests[Q_BUTCHER]._qvar1 = 1;
            towner[t]._tbtcnt = 150;
            towner[t]._tVar1 = p;
            towner[t]._tMsgSaid = 1;
            NetSendCmdQuest(1, Q_BUTCHER);
        } else if (quests[Q_BUTCHER]._qactive == QUEST_INIT || quests[Q_BUTCHER]._qactive == QUEST_ACTIVE && quests[Q_BUTCHER]._qvar1 == 0) {
            quests[Q_BUTCHER]._qactive = QUEST_ACTIVE;
            quests[Q_BUTCHER]._qlog = 1;
            quests[Q_BUTCHER]._qmsg = TEXT_BUTCH9;
            quests[Q_BUTCHER]._qvar1 = 1;
            towner[t]._tbtcnt = 50;
            towner[t]._tVar1 = p;
            towner[t]._tVar2 = 3;
            InitQTextMsg(TEXT_BUTCH9);
            towner[t]._tMsgSaid = 1;
            NetSendCmdQuest(1, Q_BUTCHER);
        }
    } else if (t == GetActiveTowner(TOWN_SMITH)) {
        if (gbMaxPlayers == 1) {
            if (plr[p]._pLvlVisited[4] && quests[Q_ROCK]._qactive != QUEST_NOTAVAIL) {
                if (quests[Q_ROCK]._qvar2 == 0) {
                    quests[Q_ROCK]._qvar2 = 1;
                    quests[Q_ROCK]._qlog = 1;
                    if (quests[Q_ROCK]._qactive == QUEST_INIT) {
                        quests[Q_ROCK]._qactive = QUEST_ACTIVE;
                        quests[Q_ROCK]._qvar1 = 1;
                    }
                    towner[t]._tbtcnt = 150;
                    towner[t]._tVar1 = p;
                    InitQTextMsg(TEXT_INFRA5);
                    towner[t]._tMsgSaid = 1;
                    NetSendCmdQuest(1, Q_ROCK);
                }
                if (quests[Q_ROCK]._qvar2 == 1 && PlrHasItem(p, IDI_ROCK, i) != NULL && !towner[t]._tMsgSaid) {
                    quests[Q_ROCK]._qactive = QUEST_DONE;
                    quests[Q_ROCK]._qvar2 = 2;
                    quests[Q_ROCK]._qvar1 = 2;
                    RemoveInvItem(p, i);
                    CreateItem(UITEM_INFRARING, towner[t]._tx, towner[t]._ty + 1);
                    towner[t]._tbtcnt = 150;
                    towner[t]._tVar1 = p;
                    InitQTextMsg(TEXT_INFRA7);
                    towner[t]._tMsgSaid = 1;
                    NetSendCmdQuest(1, Q_ROCK);
                }
            }
            if (plr[p]._pLvlVisited[9] && quests[Q_ANVIL]._qactive != QUEST_NOTAVAIL) {
                if ((quests[Q_ANVIL]._qactive == QUEST_INIT || quests[Q_ANVIL]._qactive == QUEST_ACTIVE) && quests[Q_ANVIL]._qvar2 == 0 && !towner[t]._tMsgSaid) {
                    if (quests[Q_ROCK]._qvar2 == 2 || quests[Q_ROCK]._qactive == QUEST_ACTIVE && quests[Q_ROCK]._qvar2 == 1) {
                        quests[Q_ANVIL]._qvar2 = 1;
                        quests[Q_ANVIL]._qlog = 1;
                        if (quests[Q_ANVIL]._qactive == QUEST_INIT) {
                            quests[Q_ANVIL]._qactive = QUEST_ACTIVE;
                            quests[Q_ANVIL]._qvar1 = 1;
                        }
                        towner[t]._tbtcnt = 150;
                        towner[t]._tVar1 = p;
                        InitQTextMsg(TEXT_ANVIL5);
                        towner[t]._tMsgSaid = 1;
                        NetSendCmdQuest(1, Q_ROCK);
                    }
                }
                if (quests[Q_ANVIL]._qvar2 == 1 && PlrHasItem(p, IDI_ANVIL, i) != NULL && !towner[t]._tMsgSaid) {
                    quests[Q_ANVIL]._qactive = QUEST_DONE;
                    quests[Q_ANVIL]._qvar2 = 2;
                    quests[Q_ANVIL]._qvar1 = 2;
                    RemoveInvItem(p, i);
                    CreateItem(UITEM_GRISWOLD, towner[t]._tx, towner[t]._ty + 1);
                    towner[t]._tbtcnt = 150;
                    towner[t]._tVar1 = p;
                    InitQTextMsg(TEXT_ANVIL7);
                    towner[t]._tMsgSaid = 1;
                    NetSendCmdQuest(1, Q_ANVIL);
                }
            }
        }
        if (!qtextflag) {
            TownerTalk(TEXT_GRISWOLD1, t);
            if (storeflag)
                StartStore(STORE_SMITH);
        }
    } else if (t == GetActiveTowner(TOWN_WITCH)) {
        if (quests[Q_MUSHROOM]._qactive == QUEST_INIT && PlrHasItem(p, IDI_FUNGALTM, i) != NULL) {
            RemoveInvItem(p, i);
            quests[Q_MUSHROOM]._qactive = QUEST_ACTIVE;
            quests[Q_MUSHROOM]._qvar1 = QS_TOMEGIVEN;
            quests[Q_MUSHROOM]._qlog = 1;
            towner[t]._tbtcnt = 150;
            towner[t]._tVar1 = p;
            InitQTextMsg(TEXT_MUSH8);
            towner[t]._tMsgSaid = 1;
            NetSendCmdQuest(1, Q_MUSHROOM);
        } else if (quests[Q_MUSHROOM]._qactive == QUEST_ACTIVE) {
            if (quests[Q_MUSHROOM]._qvar1 >= QS_TOMEGIVEN && quests[Q_MUSHROOM]._qvar1 <= QS_MUSHPICKED) {
                if (PlrHasItem(p, IDI_MUSHROOM, i) != NULL) {
                    RemoveInvItem(p, i);
                    quests[Q_MUSHROOM]._qvar1 = QS_MUSHGIVEN;
                    Qtalklist[TOWN_HEALER][1] = TEXT_MUSH3;
                    Qtalklist[TOWN_WITCH][1] = -1;
                    towner[t]._tbtcnt = 150;
                    towner[t]._tVar1 = p;
                    quests[Q_MUSHROOM]._qmsg = TEXT_MUSH10;
                    InitQTextMsg(TEXT_MUSH10);
                    towner[t]._tMsgSaid = 1;
                    NetSendCmdQuest(1, Q_MUSHROOM);
                } else if (quests[Q_MUSHROOM]._qmsg != TEXT_MUSH9) {
                    towner[t]._tbtcnt = 150;
                    towner[t]._tVar1 = p;
                    quests[Q_MUSHROOM]._qmsg = TEXT_MUSH9;
                    InitQTextMsg(TEXT_MUSH9);
                    towner[t]._tMsgSaid = 1;
                    NetSendCmdQuest(1, Q_MUSHROOM);
                }
            } else {
                Item = PlrHasItem(p, IDI_SPECELIX, i);
                if (Item != NULL) {
                    towner[t]._tbtcnt = 150;
                    towner[t]._tVar1 = p;
                    InitQTextMsg(TEXT_MUSH12);
                    quests[Q_MUSHROOM]._qactive = QUEST_DONE;
                    towner[t]._tMsgSaid = 1;
                    AllItemsUseable[Item->IDidx] = 1;
                    NetSendCmdQuest(1, Q_MUSHROOM);
                } else if (PlrHasItem(p, IDI_BRAIN, i) != NULL && quests[Q_MUSHROOM]._qvar2 != TEXT_MUSH11) {
                    towner[t]._tbtcnt = 150;
                    towner[t]._tVar1 = p;
                    quests[Q_MUSHROOM]._qvar2 = TEXT_MUSH11;
                    InitQTextMsg(TEXT_MUSH11);
                    towner[t]._tMsgSaid = 1;
                    NetSendCmdQuest(1, Q_MUSHROOM);
                }
            }
        }
        if (!qtextflag) {
            TownerTalk(TEXT_ADRIA1, t);
            if (storeflag)
                StartStore(STORE_WITCH);
        }
    } else if (t == GetActiveTowner(TOWN_BMAID)) {
        if (!qtextflag) {
            TownerTalk(TEXT_GILLIAN1, t);
            if (storeflag)
                StartStore(STORE_BARMAID);
        }
    } else if (t == GetActiveTowner(TOWN_DRUNK)) {
        if (!qtextflag) {
            TownerTalk(TEXT_FARNHAM1, t);
            if (storeflag)
                StartStore(STORE_DRUNK);
        }
    } else if (t == GetActiveTowner(TOWN_HEALER)) {
        if (gbMaxPlayers == 1) {
            if (quests[Q_MUSHROOM]._qactive == QUEST_ACTIVE && quests[Q_MUSHROOM]._qmsg == TEXT_MUSH10) {
                if (PlrHasItem(p, IDI_BRAIN, i) != NULL) {
                    RemoveInvItem(p, i);
                    SpawnQuestItem(IDI_SPECELIX, towner[t]._tx, towner[t]._ty + 1, 0, 0);
                    InitQTextMsg(TEXT_MUSH4);
                    quests[Q_MUSHROOM]._qvar1 = QS_BRAINGIVEN;
                    Qtalklist[TOWN_HEALER][1] = -1;
                    NetSendCmdQuest(1, Q_MUSHROOM);
                }
            } else if (plr[p]._pLvlVisited[1]) {
                if (!towner[t]._tMsgSaid) {
                    if (quests[Q_PWATER]._qactive == QUEST_INIT) {
                        quests[Q_PWATER]._qactive = QUEST_ACTIVE;
                        quests[Q_PWATER]._qlog = 1;
                        quests[Q_PWATER]._qmsg = TEXT_POISON3;
                        quests[Q_PWATER]._qvar1 = 1;
                        towner[t]._tbtcnt = 150;
                        towner[t]._tVar1 = p;
                        InitQTextMsg(TEXT_POISON3);
                        towner[t]._tMsgSaid = 1;
                        NetSendCmdQuest(1, Q_PWATER);
                    } else if (quests[Q_PWATER]._qactive == QUEST_DONE && quests[Q_PWATER]._qvar1 != 2) {
                        quests[Q_PWATER]._qvar1 = 2;
                        towner[t]._tbtcnt = 150;
                        towner[t]._tVar1 = p;
                        InitQTextMsg(TEXT_POISON5);
                        CreateItem(UITEM_TRING, towner[t]._tx, towner[t]._ty + 1);
                        towner[t]._tMsgSaid = 1;
                        NetSendCmdQuest(1, Q_PWATER);
                    }
                }
            }
        }
        if (!qtextflag) {
            TownerTalk(TEXT_PEPIN1, t);
            if (storeflag)
                StartStore(STORE_HEALER);
        }
    } else if (t == GetActiveTowner(TOWN_PEGBOY)) {
        if (!qtextflag) {
            TownerTalk(TEXT_WIRT1, t);
            if (storeflag)
                StartStore(STORE_BOY);
        }
    } else if (t == GetActiveTowner(TOWN_STORY)) {
        if (gbMaxPlayers == 1) {
            if (quests[Q_BETRAYER]._qactive == QUEST_INIT && PlrHasItem(p, IDI_LAZSTAFF, i) != NULL) {
                RemoveInvItem(p, i);
                quests[Q_BETRAYER]._qvar1 = 2;
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_VILE1);
                towner[t]._tMsgSaid = 1;
                quests[Q_BETRAYER]._qactive = QUEST_ACTIVE;
                quests[Q_BETRAYER]._qlog = 1;
                NetSendCmdQuest(1, Q_BETRAYER);
            } else if (quests[Q_BETRAYER]._qactive == QUEST_DONE && quests[Q_BETRAYER]._qvar1 == 7) {
                quests[Q_BETRAYER]._qvar1 = 8;
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_VILE3);
                towner[t]._tMsgSaid = 1;
                quests[Q_DIABLO]._qlog = 1;
                NetSendCmdQuest(1, Q_BETRAYER);
            }
        }
        if (gbMaxPlayers != 1) {
            if (quests[Q_BETRAYER]._qactive == QUEST_ACTIVE && !quests[Q_BETRAYER]._qlog) {
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_VILE1);
                towner[t]._tMsgSaid = 1;
                quests[Q_BETRAYER]._qlog = 1;
                NetSendCmdQuest(1, Q_BETRAYER);
            } else if (quests[Q_BETRAYER]._qactive == QUEST_DONE && quests[Q_BETRAYER]._qvar1 == 7) {
                quests[Q_BETRAYER]._qvar1 = 8;
                towner[t]._tbtcnt = 150;
                towner[t]._tVar1 = p;
                InitQTextMsg(TEXT_VILE3);
                towner[t]._tMsgSaid = 1;
                NetSendCmdQuest(1, Q_BETRAYER);
                quests[Q_DIABLO]._qlog = 1;
                NetSendCmdQuest(1, Q_DIABLO);
            }
        }
        if (!qtextflag) {
            TownerTalk(TEXT_STORY1, t);
            if (storeflag)
                StartStore(STORE_STORY);
        }
    } else if (towner[t]._ttype == TOWN_COW && !qtextflag) {
        CowSFX(p);
    }
}
