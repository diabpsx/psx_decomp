/* MULTI.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/MULTI.CPP.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: no Storm networking — NetSendLoPri feeds the message straight to ParseCmd for myplr;
 * InitLevelType returns 4 for every level above 12; SetupLocalCoords only sets _px/_py (no
 * fut/targ coords); NetInit is the local two-controller setup: player 1 exists when FePlayerNo is
 * set, the seed comes from the VID tick (or OptionsSeed / the demo seed). */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "source/gen/structs_multi.h"
#include "source/gen/externs_multi.h"
#include "source/gen/protos_multi.h"
#include "source/diablo.h"


#define PM_NEWLVL 10
#define PCMD_NOTHING -1
#define STARTX 75
#define STARTY 68

static struct TMegaPkt *sgpCurrPkt;
static int sgnCurrMegaPlayer;
static unsigned char sgbSentThisCycle;
static unsigned long sgdwGameLoops;
static unsigned short sgwPackPlrOffsetTbl[2];
static unsigned char sgbPlayerLeftGameTbl[2];
static unsigned long sgdwPlayerLeftReasonTbl[2];
static unsigned char sgbSendDeltaTbl[2];
static struct _gamedata sgGameInitInfo;
static unsigned char sgbTimeout;
static long sglTimeoutStart;
char gszVersionNumber[5] = "NULL";
static unsigned char sgbNetInited = 0;

unsigned char gbMaxPlayers = 0;
unsigned char gbActivePlayers = 0;
unsigned char gbGameDestroyed = 0;
unsigned char gbDeltaSender = 0;
unsigned char gbSelectProvider = 0;
unsigned char gbSomebodyWonGameKludge = 0;

/* @0x80052BA4 MULTI.CPP:168 */
void NetSendLoPri(const unsigned char *pbMsg, unsigned char bLen)
{
    ParseCmd(myplr, (const TCmd *)pbMsg);
}

/* @0x80052BD0 MULTI.CPP:559 */
int InitLevelType(int l)
{
    if (l == 0) return 0;
    if ((l >= 1) && (l <= 4)) return 1;
    if ((l >= 5) && (l <= 8)) return 2;
    if ((l >= 9) && (l <= 12)) return 3;
    return 4;
}

/* @0x80052C1C MULTI.CPP:570 */
void SetupLocalCoords(void)
{
    if (!leveldebug || gbMaxPlayers > 1) {
        currlevel = 0;
        leveltype = 0;
        setlevel = 0;
    }

    int x = STARTX;
    int y = STARTY;

    x += plrxoff[myplr];
    y += plryoff[myplr];

    plr[myplr]._px = x;
    plr[myplr]._py = y;
    plr[myplr].plrlevel = currlevel;
    plr[myplr]._pLvlChanging = 1;
    plr[myplr].pLvlLoad = 0;
    plr[myplr]._pmode = (enum PLR_MODE)PM_NEWLVL;
    plr[myplr].destAction = PCMD_NOTHING;
}

/* @0x80052D7C MULTI.CPP:687 */
void InitNewSeed(long newseed)
{
    SetRndSeed(newseed);
    for (int i = 0; i < 17; i++) {
        glSeedTbl[i] = GetRndSeed();
        gnLevelTypeTbl[i] = InitLevelType(i);
    }
}

/* @0x80052DF0 MULTI.CPP:708 */
unsigned char NetInit(unsigned char bSinglePlayer, unsigned char *pfExitProgram)
{
    *pfExitProgram = 0;

    char szPlayerDescript[128];
    memset(szPlayerDescript, 0, sizeof szPlayerDescript);
    if (!bSinglePlayer) {
        _uiheroinfo heroinfo;
        myplr = 0;
        SetupLocalPlayer();
        game_2_ui_player(&plr[0], &heroinfo, gbValidSaveFile);
    }
    /* Retain the PC single-player provider scope and ID declaration; the PSX
     * build omits its Storm provider/game-creation operations. */
    if (bSinglePlayer) {
        unsigned long dwID;
    }

    SetRndSeed(0);
    sgGameInitInfo.bDiff = gnDifficulty;
    gbGameDestroyed = 0;

    memset(sgbPlayerLeftGameTbl, 0, sizeof(sgbPlayerLeftGameTbl));
    memset(sgdwPlayerLeftReasonTbl, 0, sizeof(sgdwPlayerLeftReasonTbl));
    memset(sgbSendDeltaTbl, 0, sizeof(sgbSendDeltaTbl));
    memset(sgwPackPlrOffsetTbl, 0, sizeof(sgwPackPlrOffsetTbl));

    myplr = 0;
    sgbNetInited = 1;
    sgbTimeout = 0;
    delta_init();
    sgbSentThisCycle = 0;
    sgdwGameLoops = 0;
    gbSomebodyWonGameKludge = 0;
    gbActivePlayers = 1;
    gbMaxPlayers = 1;
    gbDeltaSender = myplr;

    if (FePlayerNo) {
        myplr = 1;
        gbMaxPlayers = 2;
        SetupLocalPlayer();
    }
    myplr = 0;
    SetupLocalPlayer();
    plr[myplr].plractive = 1;
    SetupLocalCoords();
    if (FePlayerNo) {
        myplr = 1;
        SetupLocalCoords();
        myplr = 0;
    }

    gnDifficulty = sgGameInitInfo.bDiff;
    SetRndSeed(sgGameInitInfo.dwSeed);

    long time = VID_GetTick();
    orgseed = veclen2(time, time) << 16;
    orgseed |= VID_GetTick() / 3;
    if (cheat_quest_flag)
        SetQuest();
    if (OptionsSetSeed)
        orgseed = OptionsSeed;
    if (demo_pad_time)
        orgseed = 0x537F0;
    InitNewSeed(orgseed);
    return 1;
}
