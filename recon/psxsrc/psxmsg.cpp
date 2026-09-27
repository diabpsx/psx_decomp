/* PSXMSG.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  The PSX replacement for the PC
 * interface_msg_pump/ShowProgress: PSX_WndProc picks the cut screen (hellfire INTERFAC.CPP ProgressLoad's
 * per-message background choice, reduced to a CutScreen index) and runs the Go* level transition;
 * PSX_PostWndProc runs the Post* half after the new level is in.
 * Reconstructed from the raw oracle (asm/nonmatchings/psxmsg/*.s) + the SYM + refs/diablo-hellfire/src/INTERFAC.CPP. */
#include "diabpsx_types.h"

struct TASK;

struct ItemDataStruct {   /* sizeof 32 */
    unsigned char iRnd;   /* +0x0 */
    char iClass;   /* +0x1 */
    char iLoc;   /* +0x2 */
    unsigned char iCurs;   /* +0x3 */
    char itype;   /* +0x4 */
    char iItemId;   /* +0x5 */
    unsigned short iName;   /* +0x6 */
    unsigned short iSName;   /* +0x8 */
    char iMinMLvl;   /* +0xA */
    unsigned char iDurability;   /* +0xB */
    unsigned char iMinDam;   /* +0xC */
    unsigned char iMaxDam;   /* +0xD */
    unsigned char iMinAC;   /* +0xE */
    unsigned char iMaxAC;   /* +0xF */
    char iMinStr;   /* +0x10 */
    char iMinMag;   /* +0x11 */
    char iMinDex;   /* +0x12 */
    long iFlags;   /* +0x14 */
    unsigned char iMiscId;   /* +0x18 */
    unsigned char iSpell;   /* +0x19 */
    unsigned char iUsable;   /* +0x1A */
    unsigned short iValue;   /* +0x1C */
    unsigned short iMaxValue;   /* +0x1E */
};

struct QuestStruct {   /* sizeof 20 */
    unsigned char _qlevel;   /* +0x0 */
    unsigned char _qtype;   /* +0x1 */
    unsigned char _qactive;   /* +0x2 */
    unsigned char _qlvltype;   /* +0x3 */
    int _qtx;   /* +0x4 */
    int _qty;   /* +0x8 */
    unsigned char _qslvl;   /* +0xC */
    unsigned char _qidx;   /* +0xD */
    unsigned char _qmsg;   /* +0xE */
    unsigned char _qvar1;   /* +0xF */
    unsigned char _qvar2;   /* +0x10 */
    unsigned char _qlog;   /* +0x11 */
    unsigned char pad_for_laz;   /* +0x12 */
};

struct PlayerStruct {   /* sizeof 6632 -- only the field this TU reads is spelled out */
    char _pad0[0x24];
    int plrlevel;   /* +0x24 */
    char _pad1[6632 - 0x28];
};

#define WM_DIABNEXTLVL  0x42
#define WM_DIABPREVLVL  0x43
#define WM_DIABRTNLVL   0x44
#define WM_DIABSETLVL   0x45
#define WM_DIABWARPLVL  0x46
#define WM_DIABTOWNWARP 0x47
#define WM_DIABTWARPUP  0x48
#define WM_DIABRETOWN   0x49
#define WM_DIABNEWGAME  0x4A
#define WM_DIABLOADGAME 0x4B
#define WM_DIAVNEWLVL   0x4D

#define Q_MUSHROOM  1
#define Q_BETRAYER  15
#define SL_BONECHAMB     2
#define SL_VILEBETRAYER  5
#define QUEST_ACTIVE 3
#define IMISC_MUSHROOM 0x2C   /* AllItemsList[].iMiscId value re-enabled on load (PSX quest item) */

/* ---------------------------------------------------------------- externs */
extern const struct ItemDataStruct AllItemsList[157];   /* @0x801113A4 */
extern unsigned char AllItemsUseable[157];   /* @0x800D1B40 */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern unsigned char leveltype;   /* @0x8011C10D */
extern unsigned char LevPals[17];   /* @0x800B9A58 */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern int gnLevelTypeTbl[17];   /* @0x800CF7A0 */
extern int myplr;   /* @0x8011BA08 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern int FePlayerNo;   /* @0x8011B378 */

extern "C" {
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
TASK *TSK_Exist(TASK *T, unsigned long Id, unsigned long Mask);   /* @0x800206D8 TASKER.C */
void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
void play_movie(char *pszMovie);   /* @0x800AD128 COREFMV.CPP:197 */
}
void GLUE_StartBg(int TextId, BOOL IsTown, int Level);   /* @0x8009BB1C GLUE.CPP:353 */
void GLUE_SetFinished(BOOL NewFinished);   /* @0x8009BB10 GLUE.CPP:342 */
void PutUpCutScreen(int lev);   /* @0x800A4B58 LOADING.CPP:315 */
int RestoreLoadedData(BOOL firstflag);   /* @0x8015C9CC LOADSAVE.CPP:1358 (FRONTEND overlay) */
unsigned long VID_GetTick(void);   /* @0x800840F8 VID.CPP:264 */
void CheckPlrDead(int pnum);   /* @0x80062198 PLAYER.CPP:2355 */
void FreeGameMem(void);   /* @0x80037FAC DIABLO.CPP:292 */
void InitAutomapOnce(void);   /* @0x8015F6BC PREAUTO.CPP:219 (PREGAME overlay) */
void InitGamePadVars(void);   /* @0x8007AE80 GAMEPAD.CPP:2021 */
void InitInv(void);   /* @0x8015F470 PREINV.CPP:103 (PREGAME overlay) */
void InitItemGFX(void);   /* @0x8003E24C ITEMS.CPP:556 */
void InitQuestText(void);   /* @0x8004D964 MINITEXT.CPP:119 */
void InitStores(void);   /* @0x80162CDC PRESTORE.CPP:114 (PREGAME overlay) */
void SetupTownStores(void);   /* @0x80162DD0 PRESTORE.CPP:139 (PREGAME overlay) */
void LoadGameLevel(unsigned char firstflag, int lvldir);   /* @0x80039270 DIABLO.CPP:2785 */
void OVR_LoadGame(void);   /* @0x80095474 OVERLAY.CPP:146 */
void OVR_LoadPregame(void);   /* @0x80095424 OVERLAY.CPP:129 */
void RestoreObjectLight(void);   /* @0x8005F9C4 OBJECTS.CPP:4484 */
void SetReturnLvlPos(void);   /* @0x800681CC QUESTS.CPP:458 */
void SyncPortals(void);   /* @0x80080FE8 PORTAL.CPP:189 */

void GoForwardLevel(void);
void GoSetLevel(void);
void GoBackLevel(void);
void GoWarpLevel(void);
void GoNewGame(void);
void GoLoadGame(void);
void GoNewLevel(void);
void PostGoForwardLevel(void);
void PostGoBackLevel(void);
void PostNewGame(void);
void PostLoadGame(void);
void PostNewLevel(void);
void LevelToLevelInit(void);

/* ---------------------------------------------------------------- data (TU-owned) */
static int CutScreen = 0;   /* @0x8011AD7C */
static unsigned short Level2Bgdata[25] = {   /* @0x8011073C: [leveltype * 5 + palette] -> backdrop text id */
    39, 39, 39, 39, 39, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38
};

/* @0x80096B5C PSXMSG.CPP:194 */
void PSX_WndProc(unsigned int Msg, long wParam, unsigned long lParam)
{
    switch (Msg) {
    case WM_DIABNEXTLVL:
        switch (gnLevelTypeTbl[currlevel]) {
        case 0:
            CutScreen = 0;
            break;
        case 1:
            CutScreen = 1;
            break;
        case 2:
            CutScreen = 2;
            break;
        case 3:
            CutScreen = 3;
            break;
        case 4:
            if (currlevel < 15)
                CutScreen = 4;
            else
                CutScreen = 8;
            break;
        default:
            CutScreen = 1;
            break;
        }
        break;
    case WM_DIABPREVLVL:
        if (gnLevelTypeTbl[currlevel - 1] == 0) {
            CutScreen = 0;
        } else {
            switch (gnLevelTypeTbl[currlevel]) {
            case 0:
                CutScreen = 0;
                break;
            case 1:
                CutScreen = 1;
                break;
            case 2:
                CutScreen = 2;
                break;
            case 3:
                CutScreen = 3;
                break;
            case 4:
                CutScreen = 4;
                break;
            default:
                CutScreen = 1;
                break;
            }
        }
        break;
    case WM_DIABSETLVL:
        if (setlvlnum == SL_BONECHAMB)
            CutScreen = 2;
        else if (setlvlnum == SL_VILEBETRAYER)
            CutScreen = 6;
        else
            CutScreen = 1;
        break;
    case WM_DIABRTNLVL:
        if (setlvlnum == SL_BONECHAMB)
            CutScreen = 2;
        else if (setlvlnum == SL_VILEBETRAYER)
            CutScreen = 6;
        else
            CutScreen = 1;
        break;
    case WM_DIABWARPLVL:
        CutScreen = 5;
        break;
    case WM_DIABLOADGAME:
        if (setlvlnum == SL_BONECHAMB)
            CutScreen = 2;
        else if (setlvlnum == SL_VILEBETRAYER)
            CutScreen = 6;
        else {
            switch (gnLevelTypeTbl[currlevel]) {
            case 0:
                CutScreen = 0;
                break;
            case 1:
                CutScreen = 1;
                break;
            case 2:
                CutScreen = 2;
                break;
            case 3:
                CutScreen = 3;
                break;
            case 4:
                CutScreen = 4;
                break;
            default:
                CutScreen = 1;
                break;
            }
        }
        break;
    case WM_DIABNEWGAME:
        CutScreen = 7;
        break;
    case WM_DIABTOWNWARP:
    case WM_DIABTWARPUP:
        switch (gnLevelTypeTbl[plr[myplr].plrlevel]) {
        case 0:
            CutScreen = 0;
            break;
        case 2:
            CutScreen = 2;
            break;
        case 3:
            CutScreen = 3;
            break;
        case 4:
            CutScreen = 4;
            break;
        }
        break;
    case WM_DIABRETOWN:
        CutScreen = 0;
        break;
    default:
        CutScreen = 9;
        break;
    }

    switch (Msg) {
    case WM_DIABNEXTLVL:
    case WM_DIABTOWNWARP:
        GoForwardLevel();
        break;
    case WM_DIABSETLVL:
        GoSetLevel();
        break;
    case WM_DIABPREVLVL:
    case WM_DIABRTNLVL:
    case WM_DIABTWARPUP:
        GoBackLevel();
        break;
    case WM_DIABWARPLVL:
        GoWarpLevel();
        break;
    case WM_DIABNEWGAME:
        GoNewGame();
        break;
    case WM_DIABLOADGAME:
        GoLoadGame();
        break;
    case WM_DIAVNEWLVL:
        GoNewLevel();
        break;
    default:
        if (!(!"Msg not implemented"))
            DBG_Error(NULL, "psxsrc/PSXMSG.CPP", 383);
        break;
    }
}

/* @0x80096EE0 PSXMSG.CPP:395 */
void PSX_PostWndProc(unsigned int Msg, long wParam, unsigned long lParam)
{
    switch (Msg) {
    case WM_DIABNEXTLVL:
    case WM_DIABTOWNWARP:
        PostGoForwardLevel();
        break;
    case WM_DIABPREVLVL:
    case WM_DIABRTNLVL:
    case WM_DIABSETLVL:
    case WM_DIABWARPLVL:
    case WM_DIABTWARPUP:
        SetReturnLvlPos();
        PostGoBackLevel();
        break;
    case WM_DIABNEWGAME:
        PostNewGame();
        break;
    case WM_DIABLOADGAME:
        PostLoadGame();
        break;
    case WM_DIAVNEWLVL:
        PostNewLevel();
        break;
    default:
        if (!(!"Msg not implemented"))
            DBG_Error(NULL, "psxsrc/PSXMSG.CPP", 431);
        break;
    }
}

/* @0x80096F98 PSXMSG.CPP:440 */
void GoSetLevel(void)
{
    LevelToLevelInit();
    if (!(currlevel > 0 && currlevel < 17))
        DBG_Error(NULL, "psxsrc/PSXMSG.CPP", 444);
    if (quests[Q_BETRAYER]._qvar1 < 7 && setlvlnum == SL_VILEBETRAYER)
        play_movie("FPRST3.MOV");
    PutUpCutScreen(CutScreen);
}

/* @0x80097030 PSXMSG.CPP:453 */
void GoBackLevel(void)
{
    LevelToLevelInit();
    if (!(currlevel > 0 && currlevel < 17))
        DBG_Error(NULL, "psxsrc/PSXMSG.CPP", 457);
    PutUpCutScreen(CutScreen);
}

/* @0x8009708C PSXMSG.CPP:464 */
void GoWarpLevel(void)
{
    LevelToLevelInit();
    PutUpCutScreen(CutScreen);
}

/* @0x800970B8 PSXMSG.CPP:475 */
void PostLoadGame(void)
{
    OVR_LoadGame();
    SyncPortals();
    int palnum = (LevPals[currlevel] == 0x80) ? 0 : LevPals[currlevel];
    GLUE_StartBg(Level2Bgdata[leveltype * 5 + palnum], leveltype == 0, currlevel);
}

/* @0x80097130 PSXMSG.CPP:491 */
void GoLoadGame(void)
{
    LevelToLevelInit();
    RestoreLoadedData(1);
    CheckPlrDead(0);
    CheckPlrDead(1);
    InitGamePadVars();
    PutUpCutScreen(CutScreen);
    OVR_LoadPregame();
    for (int p = 0; p < FePlayerNo + 1; p++) {
        if (quests[Q_MUSHROOM]._qactive == QUEST_ACTIVE && !(quests[Q_MUSHROOM]._qvar1 >= 2 && quests[Q_MUSHROOM]._qvar1 <= 4)) {
            for (int i = 1; AllItemsList[i].iLoc != -1; i++) {
                if (AllItemsList[i].iMiscId == IMISC_MUSHROOM)
                    AllItemsUseable[i] = 1;
            }
        }
    }
    InitStores();
    SetupTownStores();
    LoadGameLevel(0, 4);
    InitInv();
    InitItemGFX();
    InitQuestText();
    InitAutomapOnce();
    RestoreObjectLight();
}

/* @0x80097288 PSXMSG.CPP:546 */
void PostNewLevel(void)
{
    int palnum;

    OVR_LoadGame();
    palnum = VID_GetTick() % 5;
    if (LevPals[currlevel] != 0x80)
        palnum = LevPals[currlevel];
    GLUE_StartBg(Level2Bgdata[leveltype * 5 + palnum], leveltype == 0, currlevel);
    LevPals[currlevel] = palnum;
}

/* @0x8009733C PSXMSG.CPP:556 */
void GoNewLevel(void)
{
    LevelToLevelInit();
    PutUpCutScreen(CutScreen);
    FreeGameMem();
    OVR_LoadPregame();
    LoadGameLevel(1, 0);
}

/* @0x80097384 PSXMSG.CPP:574 */
void PostGoBackLevel(void)
{
    int palnum;

    palnum = VID_GetTick() % 5;
    if (LevPals[currlevel] != 0x80)
        palnum = LevPals[currlevel];
    GLUE_StartBg(Level2Bgdata[leveltype * 5 + palnum], leveltype == 0, currlevel);
    LevPals[currlevel] = palnum;
}

/* @0x80097430 PSXMSG.CPP:585 */
void GoForwardLevel(void)
{
    LevelToLevelInit();
    if (!(currlevel < 16))
        DBG_Error(NULL, "psxsrc/PSXMSG.CPP", 587);
    PutUpCutScreen(CutScreen);
}

/* @0x80097484 PSXMSG.CPP:592 */
void PostGoForwardLevel(void)
{
    int palnum;

    palnum = VID_GetTick() % 5;
    if (LevPals[currlevel] != 0x80)
        palnum = LevPals[currlevel];
    GLUE_StartBg(Level2Bgdata[leveltype * 5 + palnum], leveltype == 0, currlevel);
    LevPals[currlevel] = palnum;
}

/* @0x80097530 PSXMSG.CPP:604 */
void GoNewGame(void)
{
    PutUpCutScreen(CutScreen);
}

/* @0x80097554 PSXMSG.CPP:613 */
void PostNewGame(void)
{
    GLUE_StartBg(39, 1, -1);
}

/* @0x8009757C PSXMSG.CPP:623 */
void LevelToLevelInit(void)
{
    GLUE_SetFinished(1);
    while (TSK_Exist(NULL, 0x4001, 0xFFFFFFFF))
        TSK_Sleep(1);
    TSK_Sleep(2);
}
