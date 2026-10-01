/* PSXSRC/GLUE.CPP вЂ” Diablo PSX (Climax 1998) reconstruction (PSXSRC, splat segment glue).
 * No PC twin: this is a PSX-only "glue" layer between the DAVE/MAIN task scheduler and the
 * game engine (CBlocks/CPlayer) вЂ” background game task (BgTask), player-character-graphics
 * lookup (FindPlayerChar/MakeSurePlayerDressedProperly), and small flag get/set glue funcs.
 * Reconstructed from the retail oracle disassembly plus the m2c/Hex-Rays drafts recorded in
 * skel/PSXSRC/GLUE.CPP (generated from the retail SYM before this file existed).
 * TU-owned data and globals use the retail SYM names and layouts. */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"

/* ---- externs from other TUs (types kept minimal/opaque; only the fields this TU touches) ---- */
struct TASK { unsigned char pad[92]; };   /* sizeof 92 per retail SYM; only used as an untyped handle here */
struct DEF_ARGS { int a0, a1, a2, a3; };   /* sizeof 16 per retail SYM (BgTask's per-task arg block) */

extern "C" struct TASK *TSK_Exist(void *List, int Type, int Id);
extern "C" void TSK_MakeTaskInactive(struct TASK *T);
extern "C" void TSK_MakeTaskActive(struct TASK *T);
extern "C" void *TSK_AddTask(int List, void *Func, int StackSize, int Arg);
extern "C" void TSK_Sleep(int Ticks);
extern "C" unsigned char GRL_PostMessage__FUlUilUl(unsigned long Wnd, unsigned int Msg, long a2, unsigned long a3);
extern unsigned long ghMainWnd;

extern int NumOfMonsterListLevels;
struct MonstList {   /* retail SYM: sizeof 16 */
    unsigned short NumOfMonsters;
    unsigned short TexNum;
    unsigned char *TheList;
    char *ListName;
    unsigned long QuestBits;
};
struct MonstLevel {   /* sizeof 8 */
    int NumOfLists;
    struct MonstList *TheLists;
};
extern struct MonstLevel AllLevels[];

struct TASK;
extern void BgTask(struct TASK *T);
class CBlocks;
class CPlayer;

void MAIN_RestartGameTask(void);
void SPU_Init(void);
void MSG_ClearOutCompMap(void);
struct PlayerStruct;
extern PlayerStruct plr[2];

/* Minimal PlayerStruct field slice (offsets from recon/source/gen/structs_player.h). */
struct PlayerStruct {
    int _pmode;                /* +0x0 */
    unsigned char pad0[0x1D - 0x4];
    unsigned char plractive;   /* +0x1D */
    unsigned char pad1[0x42 - 0x1E];
    char _pdir;                /* +0x42 */
    unsigned char _pgfxnum;    /* +0x43 */
    unsigned char pad2[0xF6 - 0x44];
    char _pClass;              /* +0xF6 */
    unsigned char pad3[6632 - 0xF7];   /* sizeof PlayerStruct = 6632 per retail SYM */
};

/* Retail PInf layout: pointer and three texture IDs, sizeof 12. */
struct PInf {
    char *Tx;
    unsigned short GameTex, TownTex, TwoPlayerTex;
};
#include "psxsrc/gen/table_glue_player_info.h"
extern "C" int strcmp(const char *, const char *);
extern "C" int sprintf(char *, const char *, ...);
extern int FePlayerNo;
extern "C" void StartStand__FP12PlayerStructi(struct PlayerStruct *P, int Dir);

struct RECT { short x, y, w, h; };   /* sizeof 8 */
struct TextDat;
struct PanelXY;
struct GPanel {   /* sizeof 28 per retail SYM (fields from the SYM STRTAG record) */
    int HealthAnimCount;    /* +0x0 */
    int ManaAnimCount;      /* +0x4 */
    int GlobeAnimCount;     /* +0x8 */
    struct RECT MsgRect;    /* +0xC */
    struct TextDat *PanelTData;   /* +0x14 */
    int GPanelOt;           /* +0x18 */

    GPanel(int Ofs);
    void Print(struct PanelXY *XY, struct PlayerStruct *Plr);
};
extern struct PanelXY DefP1PanelXY, DefP2PanelXY, DefP1PanelXY2, DefP2PanelXY2;
extern int sel_data;

/* ---- BgTask externs ---- */
extern "C" int GetFadeState__Fv(void);
extern "C" void penta_cycle_task__FP4TASK(struct TASK *T);
extern "C" void color_cycle__FP4TASK(struct TASK *T);
extern "C" void DaveLTask__FP4TASK(struct TASK *T);
extern "C" void UPDATEPROGRESS__Fi(int Amount);
extern unsigned char currlevel;
extern unsigned char leveltype;
extern unsigned char setlevel;
extern unsigned char setlvlnum;
extern unsigned char PauseMode;
extern unsigned char deathflag;
struct Quests { unsigned char pad[0xF3]; };   /* only +0xF2 read here */
extern struct Quests quests;
extern void *gplayer;
static unsigned char JustLoadedPlayer = 0;   /* @0x8011AFF0; retail SYM STAT UCHAR, .sdata */

extern "C" int GM_UseTexData__Fi(int Id);
extern int MissDat;
extern "C" void music_start__Fi(int LevelType);
extern "C" void PaletteFadeIn__Fi(int Ticks);
extern "C" void PlaySFX__Fi(int Id);
extern "C" void ResetFlames__Fv(void);
extern "C" void DrawAndBlit__Fv(void);
extern "C" void DrawLBird__Fv(void);
extern "C" void GO_DoGameOver__Fv(void);
extern "C" void VID_GetTick__Fv(void);
extern "C" void FinishProgress__Fv(void);
extern "C" void TakeDownCutScreen__Fv(void);

/* Original CPlayer header layout and GetPlayer inline retain the header pool. */
class CPlayer : public TextDat {
public:
    long hndDatMem;
    unsigned short NumOfPlayers;
    BOOL InTown;
    unsigned short PlayerNum, Tpage;
    int TexId, LastScrX, LastScrY, LastOtPos;
    static CPlayer *PActiveArray[2];
    static CPlayer *GetPlayer(int PNum)
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }

    CPlayer(BOOL InTown, int Which, int PlayerNum);
    ~CPlayer();
    int GetTexId(void);
    void Load(int Id);
    void NonBlockingLoadNewGFX(int Id);
    void SetScrollTarget(struct PlayerStruct &Plr, class CBlocks &Blocks);
    void Print(struct PlayerStruct &Plr, class CBlocks &Blocks);
};

class CBlocks {
public:
    unsigned char pad0[0xA8];
    int Town;              /* +0xA8 */
    unsigned char pad1[0xC8 - 0xAC];
    int ScrollTargetX;     /* +0xC8 */
    int ScrollTargetY;     /* +0xCC */
    int ScrollX;           /* +0xD0 */
    int ScrollY;           /* +0xD4 */
    unsigned char pad2[264 - 0xD8];   /* sizeof CBlocks = 264 per retail SYM */

    CBlocks(int TextId, int MLev, int c, int Level, int List);
    ~CBlocks();
    void SetTown(BOOL Val);
    void MoveToScrollTarget(void);
    void SetTownersGraphics(void);
    void SetRandOffset(int Amount);
    void DoScroll(void);
    void Print(void);
};

/* TU-owned small data */
static BOOL GlueFinished;
static BOOL DoHomingScroll;
static TextDat *TownerGfx;
static int CurrentMonsterList;
static int QuakeTime;
static int QuakeAmount;
static BOOL GameStarted = false;
static const char *const PlayerFormat = "%c%c%c";
extern BOOL DoShowPanel;
extern BOOL DoDrawBg;
static const char ArmourChar[4] = "LMH";
static const char CharChar[4] = "WRS";

/* -------------------------------------------------------------------------------------------- */

void MakeSurePlayerDressedProperly(CPlayer &Player, PlayerStruct &Plr, BOOL InTown, BOOL Blocking);



void GLUE_SetMonsterList(int List)
{
    CurrentMonsterList = List;
}

int GLUE_GetMonsterList(void)
{
    return CurrentMonsterList;
}

void GLUE_SuspendGame(void)
{
    struct TASK *T;

    T = TSK_Exist(0, 0x4000, -1);
    if (T == 0) {
        DBG_Error(0, "psxsrc/GLUE.CPP", 0x10E);
    }
    TSK_MakeTaskInactive(T);
}

void GLUE_ResumeGame(void)
{
    struct TASK *T;

    T = TSK_Exist(0, 0x4000, -1);
    if (T == 0) {
        DBG_Error(0, "psxsrc/GLUE.CPP", 0x11D);
    }
    TSK_MakeTaskActive(T);
}

void GLUE_PreTown(void)
{
    GRL_PostMessage__FUlUilUl(ghMainWnd, 0x4A, 0, 0);
}

void GLUE_PreDun(void)
{
}

BOOL GLUE_Finished(void)
{
    return GlueFinished;
}

void GLUE_SetFinished(BOOL NewFinished)
{
    GlueFinished = NewFinished;
}

void GLUE_StartBg(int TextId, BOOL IsTown, int Level)
{
    struct DEF_ARGS *Args;

    Args = *(struct DEF_ARGS **)((char *)TSK_AddTask(0x8000, (void *)BgTask, 0x2000, 0x10) + 0x1C);
    Args->a0 = TextId;
    Args->a1 = IsTown;
    Args->a2 = Level;
}

BOOL GLUE_SetShowGameScreenFlag(BOOL NewFlag)
{
    BOOL OldFlag;

    OldFlag = DoDrawBg;
    DoDrawBg = NewFlag;
    return OldFlag;
}

BOOL GLUE_GetShowGameScreenFlag(void)
{
    return DoDrawBg;
}

BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag)
{
    BOOL OldFlag;

    OldFlag = DoHomingScroll;
    DoHomingScroll = NewFlag;
    return OldFlag;
}

BOOL GLUE_SetShowPanelFlag(BOOL NewFlag)
{
    BOOL OldFlag;

    OldFlag = DoShowPanel;
    DoShowPanel = NewFlag;
    return OldFlag;
}

BOOL GLUE_HasGameStarted(void)
{
    return GameStarted;
}

void DoShowPanelGFX(struct GPanel *P1, struct GPanel *P2)
{
    if (plr[0].plractive != 0) {
        if (plr[1].plractive != 0) {
            sel_data = 0;
            P1->Print(&DefP1PanelXY2, &plr[0]);
            sel_data = 1;
            P2->Print(&DefP2PanelXY2, &plr[1]);
        } else {
            sel_data = 0;
            P1->Print(&DefP1PanelXY, &plr[0]);
        }
        return;
    }
    if (plr[1].plractive != 0) {
        sel_data = 1;
        P2->Print(&DefP2PanelXY, &plr[1]);
    }
}

void GLUE_DoQuake(int Time, int Amount)
{
    QuakeTime = Time;
    QuakeAmount = Amount;
}

void BgTask(struct TASK *T)
{
    struct DEF_ARGS *Args;
    BOOL IsTown;
    int TextId;
    int Level;
    int ObjId;
    int List;
    struct PlayerStruct *plr1;
    struct PlayerStruct *plr2;

    ObjId = -1;
    List = -1;
    Args = *(struct DEF_ARGS **)((char *)T + 0x1C);
    QuakeTime = 0;
    QuakeAmount = 0;
    IsTown = Args->a1 != 0;
    Level = Args->a2;
    TextId = Args->a0;
    GLUE_SetShowGameScreenFlag(0);
    GLUE_SetHomingScrollFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SetFinished(0);
    plr1 = &plr[0];
    plr2 = &plr[1];
    if ((unsigned int)(currlevel - 0xF) < 2) {
        TSK_AddTask(0x8000, (void *)penta_cycle_task__FP4TASK, 0xC78, 0);
    }
    TSK_AddTask(0x8000, (void *)color_cycle__FP4TASK, 0xC78, 0);
    TSK_Sleep(2);
    while (GetFadeState__Fv() != 0) {
        TSK_Sleep(1);
    }
    if (IsTown) {
        Level = 0;
    } else {
        ObjId = 0xCE;
        List = GLUE_GetMonsterList();
    }
    CBlocks MyBlocks(TextId, ObjId, 0, Level, List);
    MyBlocks.SetTown(IsTown);
    UPDATEPROGRESS__Fi(4);
    CPlayer MyPlayer(IsTown, 0, FePlayerNo);
    CPlayer MyPlayer2(IsTown, 1, FePlayerNo);
    MakeSurePlayerDressedProperly(MyPlayer, *plr1, IsTown, 1);
    if (FePlayerNo != 0) {
        MakeSurePlayerDressedProperly(MyPlayer2, *plr2, IsTown, 1);
    }
    UPDATEPROGRESS__Fi(1);
    FinishProgress__Fv();
    TakeDownCutScreen__Fv();
    if (leveltype != 0) {
        MissDat = GM_UseTexData__Fi(0xD0);
    } else {
        MyBlocks.SetTownersGraphics();
        MissDat = GM_UseTexData__Fi(0xCD);
    }
    music_start__Fi(leveltype);
    PaletteFadeIn__Fi(8);
    MyPlayer.SetScrollTarget(plr[0], MyBlocks);
    MyBlocks.MoveToScrollTarget();
    GLUE_SetShowGameScreenFlag(1);
    GLUE_SetHomingScrollFlag(1);
    GLUE_SetShowPanelFlag(1);
    TSK_AddTask(0x8000, (void *)DaveLTask__FP4TASK, 0x1000, 0);
    struct GPanel P1Panel(0);
    struct GPanel P2Panel(0);
    gplayer = &MyPlayer;
    VID_GetTick__Fv();
    JustLoadedPlayer = 0;
    GameStarted = 1;
    if (setlevel != 0 && setlvlnum == 1) {
        if (*((unsigned char *)&quests + 0xF2) == 2) {
            PlaySFX__Fi(0x354);
        }
    }

    while ((GLUE_Finished() ^ 1) != 0) {
        VID_GetTick__Fv();
        VID_GetTick__Fv();
        ResetFlames__Fv();
        if (DoDrawBg != 0) {
            if (PauseMode == 0 && QuakeTime != 0) {
                MyBlocks.SetRandOffset(QuakeAmount);
                QuakeTime -= 1;
            }
            MyPlayer.SetScrollTarget(plr[0].plractive ? plr[0] : plr[1], MyBlocks);
            if (DoHomingScroll != 0 && deathflag == 0) {
                MyBlocks.DoScroll();
            }
            MyBlocks.Print();
            DrawAndBlit__Fv();
            if (DoShowPanel != 0) {
                DoShowPanelGFX(&P1Panel, &P2Panel);
            }
            MakeSurePlayerDressedProperly(MyPlayer, plr[0], IsTown, 0);
            MyPlayer.Print(plr[0], MyBlocks);
            if (FePlayerNo != 0) {
                MakeSurePlayerDressedProperly(MyPlayer2, plr[1], IsTown, 0);
                MyPlayer2.Print(plr[1], MyBlocks);
            }
            if (IsTown) {
                DrawLBird__Fv();
            }
            if (deathflag != 0) {
                GO_DoGameOver__Fv();
            }
        }
        TSK_Sleep(1);
    }
    GameStarted = 0;
}

static const char WepChar[10] = "NUSDBAMHT";

struct PInf *FindPlayerChar(char *Id)
{
    for (int f = 0; f < 0x51; f++) {
        if (strcmp(PlayerInfo[f].Tx, Id) == 0)
            return &PlayerInfo[f];
    }
    DBG_Error(0, "psxsrc/GLUE.CPP", 0x288);
    return 0;
}

struct PInf *FindPlayerChar(int Char, int Wep, int Arm)
{
    char TxBuff[20];

    sprintf(TxBuff, PlayerFormat, CharChar[Char], ArmourChar[Arm], WepChar[Wep]);
    return FindPlayerChar(TxBuff);
}

BOOL DoShowPanel = false;
BOOL DoDrawBg = false;

struct PInf *FindPlayerChar(struct PlayerStruct *P)
{
    return FindPlayerChar((int)P->_pClass, P->_pgfxnum & 0xF, (int)(P->_pgfxnum << 24) >> 28);
}

int FindPlayerChar(struct PlayerStruct *P, BOOL InTown)
{
    char Class;

    if (P->_pmode == 8) {
        Class = P->_pClass;
        switch (Class) {
        case 1:
            return 0x126;
        case 0:
            return 0x124;
        case 2:
            return 0x125;
        }
        DBG_Error(0, "psxsrc/GLUE.CPP", 0x2AF);
        return -1;
    } else {
        struct PInf *Inf = FindPlayerChar(P);

        if (InTown != 0) {
            return Inf->TownTex;
        }
        if (FePlayerNo == 0) {
            return Inf->GameTex;
        }
        return Inf->TwoPlayerTex;
    }
}

void MakeSurePlayerDressedProperly(CPlayer &Player, PlayerStruct &Plr, BOOL InTown, BOOL Blocking)
{
    int Id;

    Id = FindPlayerChar(&Plr, InTown);
    if (Id != Player.GetTexId()) {
        if (Blocking != 0) {
            Player.Load(Id);
        } else {
            Player.NonBlockingLoadNewGFX(Id);
        }
        if (Plr.plractive != 0 && Plr._pmode != 8) {
            StartStand__FP12PlayerStructi(&Plr, Plr._pdir);
        }
    }
}

struct MonstList *GLUE_GetCurrentList(int Level)
{
    struct MonstLevel *MLev;
    int List;

    Level--;
    if (Level < 0 || !(Level < NumOfMonsterListLevels)) {
        DBG_Error(0, "psxsrc/GLUE.CPP", 0x2EC);
    }
    MLev = &AllLevels[Level];
    List = GLUE_GetMonsterList();
    if (List < 0 || MLev->NumOfLists < List) {
        DBG_Error(0, "psxsrc/GLUE.CPP", 0x2EF);
    }
    return &MLev->TheLists[List];
}

void GLUE_StartGameExit(void)
{
    {
        int i;
        for (i = 0; i < 2; i++) {
            plr[i].plractive = 0;
        }
    }
    GLUE_SuspendGame();
    GLUE_SetFinished(1);
    MAIN_RestartGameTask();
    TSK_Sleep(3);
    GLUE_ResumeGame();
    SPU_Init();
    MSG_ClearOutCompMap();
}

void GLUE_Init(void)
{
}

int CPlayer::GetTexId(void)
{
    return TexId;
}

void CBlocks::SetTown(BOOL Val)
{
    Town = Val;
}

void CBlocks::MoveToScrollTarget(void)
{
    ScrollX = ScrollTargetX;
    ScrollY = ScrollTargetY;
}
