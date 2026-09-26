/* TOWNERS.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/towners.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_towners.h"
#include "source/gen/externs_towners.h"
#include "source/gen/protos_towners.h"
#include "source/diablo.h"

/* TU data (.sdata / .sbss, tentative definitions) */
unsigned char storeflag;
unsigned char boyloadflag;
unsigned char bannerflag;
int numtowners;
unsigned long CowPlaying;
unsigned char *pCowCels;
static unsigned long sgdwCowClicks;
static int sgnCowMsg;

static void CowSFX(int pnum)
{
    static int snSFX[3][3] = {
        { PS_WARR52, PS_ROGUE52, PS_MAGE52 },
        { PS_WARR49, PS_ROGUE49, PS_MAGE49 },
        { PS_WARR50, PS_ROGUE50, PS_MAGE50 },
    };
    static int snLastCowSFX;

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
        case TOWN_WITCH:
            TownWitch();
            break;
        case TOWN_BMAID:
            TownBarMaid();
            break;
        case TOWN_PEGBOY:
            TownBoy();
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

void TownerTalk(int first, int t)
{
    sgdwCowClicks = 0;
    sgnCowMsg = 0;
    storeflag = 1;
    options_pad = myplr;
    InitQTextMsg(first);
}
