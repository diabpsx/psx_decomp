/* PSXSRC/GLUE.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC, splat segment glue).
 * No PC twin: this is a PSX-only "glue" layer between the DAVE/MAIN task scheduler and the
 * game engine (CBlocks/CPlayer) — background game task (BgTask), player-character-graphics
 * lookup (FindPlayerChar/MakeSurePlayerDressedProperly), and small flag get/set glue funcs.
 * Reconstructed from the retail oracle disassembly plus the m2c/Hex-Rays drafts recorded in
 * skel/PSXSRC/GLUE.CPP (generated from the retail SYM before this file existed).
 * TU-owned small data (gp-relative in retail, D_ prefix = unnamed at the confirmed VA). */
#include "diabpsx_types.h"

/* ---- externs from other TUs (types kept minimal/opaque; only the fields this TU touches) ---- */
struct TASK { unsigned char pad[92]; };   /* sizeof 92 per retail SYM; only used as an untyped handle here */
struct DEF_ARGS { int a0, a1, a2, a3; };   /* sizeof 16 per retail SYM (BgTask's per-task arg block) */

extern "C" struct TASK *TSK_Exist(void *List, int Type, int Id);
extern "C" void TSK_MakeTaskInactive(struct TASK *T);
extern "C" void TSK_MakeTaskActive(struct TASK *T);
extern "C" void *TSK_AddTask(int List, void *Func, int StackSize, int Arg);
extern "C" void TSK_Sleep(int Ticks);
extern "C" void DBG_Error(int a0, const char *File, int Line);
extern "C" int GRL_PostMessage__FUlUilUl(unsigned long Wnd, unsigned int Msg, unsigned long a2, unsigned long a3);
extern unsigned long ghMainWnd;
extern const char D_80110B58[];   /* @0x80110B58 -- "GLUE.CPP" (DBG_Error filename literal) */

extern int NumOfMonsterListLevels;
struct MonstListLevel {   /* sizeof 8 */
    int Count;
    void *List;
};
extern struct MonstListLevel AllLevels[];

struct TASK;
extern void BgTask(struct TASK *T);
class CBlocks;
class CPlayer;

extern "C" void MAIN_RestartGameTask(void);
extern "C" void SPU_Init(void);
extern "C" void MSG_ClearOutCompMap(void);
extern unsigned char plr[];   /* PlayerStruct plr[2] -- only address-of used here */

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

/* PlayerInfo[i]: only .Id (a char* at +0) is read here; sizeof 12 per retail stride (0xC). */
struct PInf {
    char *Id;
    unsigned short w4, w6, w8;
};
extern struct PInf PlayerInfo[0x51];
extern "C" int strcmp(const char *, const char *);
extern "C" int sprintf(char *, const char *, ...);
extern const char D_8011AFF8[];    /* "%c%c%c" */
extern const char D_8011B00C[];    /* class-char lookup */
extern const char D_8011B008[];
extern const char D_80110B68[];
extern int FePlayerNo;
extern "C" void StartStand__FP12PlayerStructi(struct PlayerStruct *P, int Dir);

struct RECT { short x, y, w, h; };   /* sizeof 8 */
struct TextDat;
struct GPanel {   /* sizeof 28 per retail SYM (fields from the SYM STRTAG record) */
    int HealthAnimCount;    /* +0x0 */
    int ManaAnimCount;      /* +0x4 */
    int GlobeAnimCount;     /* +0x8 */
    struct RECT MsgRect;    /* +0xC */
    struct TextDat *PanelTData;   /* +0x14 */
    int GPanelOt;           /* +0x18 */
};
struct PanelXY;
extern struct PanelXY DefP1PanelXY, DefP2PanelXY, DefP1PanelXY2, DefP2PanelXY2;
extern int sel_data;
extern "C" void Print__6GPanelP7PanelXYP12PlayerStruct(struct GPanel *P, struct PanelXY *XY, void *Plr);

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
int D_8011AFF0;   /* TU-owned; only written here (paired with D_8011AFF4/HasGameStarted) */

extern "C" void __7CBlocksiiiii(struct CBlocks *This, int a, int b, int c, int d, int e);
extern "C" void SetTownersGraphics__7CBlocks(struct CBlocks *This);
extern "C" int GM_UseTexData__Fi(int Id);
extern int MissDat;
extern "C" void music_start__Fi(int LevelType);
extern "C" void PaletteFadeIn__Fi(int Ticks);
extern "C" void SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks(struct CPlayer *Player, struct PlayerStruct *Plr, struct CBlocks *Blocks);
extern "C" void PlaySFX__Fi(int Id);
extern "C" void ResetFlames__Fv(void);
extern "C" void SetRandOffset__7CBlocksi(struct CBlocks *This, int Amount);
extern "C" void DoScroll__7CBlocks(struct CBlocks *This);
extern "C" void Print__7CBlocks(struct CBlocks *This);
extern "C" void DrawAndBlit__Fv(void);
extern "C" void Print__7CPlayerR12PlayerStructR7CBlocks(struct CPlayer *Player, struct PlayerStruct *Plr, struct CBlocks *Blocks);
extern "C" void DrawLBird__Fv(void);
extern "C" void GO_DoGameOver__Fv(void);
extern "C" void VID_GetTick__Fv(void);
extern "C" void __7CPlayerbii(struct CPlayer *This, BOOL InTown, int Which, int PlayerNum);
extern "C" void ___7CPlayer(struct CPlayer *This, int Flag);
extern "C" void ___7CBlocks(struct CBlocks *This, int Flag);
extern "C" void FinishProgress__Fv(void);
extern "C" void TakeDownCutScreen__Fv(void);
struct GPanel;
extern "C" void __6GPaneli(struct GPanel *This, int Arg);

/* Minimal local layouts (this TU only touches these fields; matches davel.cpp's CPlayer). */
class CPlayer {
public:
    unsigned char pad0[0x80];
    int TexId;   /* +0x80 */
    unsigned char pad1[144 - 0x84];   /* sizeof CPlayer = 144 per retail SYM */

    int GetTexId(void);
    void Load(int Id);
    void NonBlockingLoadNewGFX(int Id);
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

    void SetTown(BOOL Val);
    void MoveToScrollTarget(void);
};

/* TU-owned small data */
int D_8011C6BC;   /* MonsterList (GLUE_Set/GetMonsterList) */
int D_8011C6B0;   /* Finished flag */
BOOL DoHomingScroll;   /* @0x8011C6B4 */
int D_8011AFF4;   /* HasGameStarted flag */
int D_8011C6C0;   /* GLUE_DoQuake Time */
int D_8011C6C4;   /* GLUE_DoQuake Amount */
BOOL DoDrawBg;    /* @0x8011B004 */
BOOL DoShowPanel; /* @0x8011B000 */

/* -------------------------------------------------------------------------------------------- */

void GLUE_SetMonsterList(int List)
{
    D_8011C6BC = List;
}

int GLUE_GetMonsterList(void)
{
    return D_8011C6BC;
}

void GLUE_SuspendGame(void)
{
    struct TASK *T;

    T = TSK_Exist(0, 0x4000, -1);
    if (T == 0) {
        DBG_Error(0, D_80110B58, 0x10E);
    }
    TSK_MakeTaskInactive(T);
}

void GLUE_ResumeGame(void)
{
    struct TASK *T;

    T = TSK_Exist(0, 0x4000, -1);
    if (T == 0) {
        DBG_Error(0, D_80110B58, 0x11D);
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

int GLUE_Finished(void)
{
    return D_8011C6B0;
}

void GLUE_SetFinished(BOOL NewFinished)
{
    D_8011C6B0 = NewFinished;
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

int GLUE_GetShowGameScreenFlag(void)
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

int GLUE_HasGameStarted(void)
{
    return D_8011AFF4;
}

void GLUE_DoQuake(int Time, int Amount)
{
    D_8011C6C0 = Time;
    D_8011C6C4 = Amount;
}

struct MonstListLevel *GLUE_GetCurrentList(int Level)
{
    int MLev;
    struct MonstListLevel *List;
    int Cur;

    MLev = Level - 1;
    if (MLev < 0 || !(MLev < NumOfMonsterListLevels)) {
        DBG_Error(0, D_80110B58, 0x2EC);
    }
    List = &AllLevels[MLev];
    Cur = GLUE_GetMonsterList();
    if (Cur < 0 || List->Count < Cur) {
        DBG_Error(0, D_80110B58, 0x2EF);
    }
    return (struct MonstListLevel *)((char *)List->List + Cur * 0x10);
}

void GLUE_StartGameExit(void)
{
    {
        int i;
        for (i = 0x19E8; i >= 0; i -= 0x19E8) {
            plr[0x1D + i] = 0;
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

struct PInf *FindPlayerChar(char *Id)
{
    struct PInf *f;
    int i;
    int idx;

    f = PlayerInfo;
    i = 0;
    idx = 0;
    do {
        i++;
        if (strcmp(*(char **)((char *)PlayerInfo + idx), Id) != 0) {
            f = (struct PInf *)((char *)f + 0xC);
            idx += 0xC;
            continue;
        }
        return f;
    } while (i < 0x51);
    DBG_Error(0, D_80110B58, 0x288);
    return 0;
}

struct PInf *FindPlayerChar(int Char, int Wep, int Arm)
{
    char TxBuff[20];

    sprintf(TxBuff, D_8011AFF8, D_8011B00C[Char], D_8011B008[Arm], D_80110B68[Wep]);
    return FindPlayerChar(TxBuff);
}

struct PInf *FindPlayerChar(struct PlayerStruct *P)
{
    return FindPlayerChar((int)P->_pClass, P->_pgfxnum & 0xF, (int)(P->_pgfxnum << 24) >> 28);
}

int FindPlayerChar(struct PlayerStruct *P, BOOL InTown)
{
    char Class;
    struct PInf *Inf;

    if (P->_pmode == 8) {
        Class = P->_pClass;
        if (Class == 1) {
            return 0x126;
        }
        if (Class < 2) {
            if (Class == 0) {
                return 0x124;
            }
            DBG_Error(0, D_80110B58, 0x2AF);
            return -1;
        }
        if (Class == 2) {
            return 0x125;
        }
        DBG_Error(0, D_80110B58, 0x2AF);
        return -1;
    }
    Inf = FindPlayerChar(P);
    if (InTown != 0) {
        return Inf->w6;
    }
    if (FePlayerNo != 0) {
        return Inf->w8;
    }
    return Inf->w4;
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

void DoShowPanelGFX(struct GPanel *P1, struct GPanel *P2)
{
    if (plr[0x1D] != 0) {
        if (plr[0x1A05] != 0) {
            sel_data = 0;
            Print__6GPanelP7PanelXYP12PlayerStruct(P1, &DefP1PanelXY2, &plr[0]);
            sel_data = 1;
            Print__6GPanelP7PanelXYP12PlayerStruct(P2, &DefP2PanelXY2, &plr[0x19E8]);
        } else {
            sel_data = 0;
            Print__6GPanelP7PanelXYP12PlayerStruct(P1, &DefP1PanelXY, &plr[0]);
        }
        return;
    }
    if (plr[0x1A05] != 0) {
        sel_data = 1;
        Print__6GPanelP7PanelXYP12PlayerStruct(P2, &DefP2PanelXY, &plr[0x19E8]);
    }
}

void BgTask(struct TASK *T)
{
    struct CBlocks Blocks;
    struct CPlayer P1, P2;
    struct GPanel Panel1Obj, Panel2Obj;
    struct GPanel *Panel1 = &Panel1Obj;
    struct GPanel *Panel2 = &Panel2Obj;
    struct DEF_ARGS *Args;
    int TextId, Level, MLev;
    BOOL IsTown;
    void *List;
    void *Plr;

    MLev = -1;
    List = (void *)-1;
    Args = *(struct DEF_ARGS **)((char *)T + 0x1C);
    D_8011C6C0 = 0;
    D_8011C6C4 = 0;
    Level = Args->a2;
    TextId = Args->a0;
    IsTown = Args->a1 != 0;
    GLUE_SetShowGameScreenFlag(0);
    GLUE_SetHomingScrollFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SetFinished(0);
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
        MLev = 0xCE;
        List = (void *)GLUE_GetMonsterList();
    }
    __7CBlocksiiiii(&Blocks, TextId, MLev, 0, Level, (int)List);
    Blocks.SetTown(IsTown);
    UPDATEPROGRESS__Fi(4);
    __7CPlayerbii(&P1, IsTown, 0, FePlayerNo);
    __7CPlayerbii(&P2, IsTown, 1, FePlayerNo);
    MakeSurePlayerDressedProperly(P1, *(struct PlayerStruct *)&plr[0], IsTown, 1);
    if (FePlayerNo != 0) {
        MakeSurePlayerDressedProperly(P2, *(struct PlayerStruct *)&plr[0x19E8], IsTown, 1);
    }
    UPDATEPROGRESS__Fi(1);
    FinishProgress__Fv();
    TakeDownCutScreen__Fv();
    if (leveltype != 0) {
        MissDat = GM_UseTexData__Fi(0xD0);
    } else {
        SetTownersGraphics__7CBlocks(&Blocks);
        MissDat = GM_UseTexData__Fi(0xCD);
    }
    music_start__Fi(leveltype);
    PaletteFadeIn__Fi(8);
    SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks(&P1, (struct PlayerStruct *)&plr[0], &Blocks);
    Blocks.MoveToScrollTarget();
    GLUE_SetShowGameScreenFlag(1);
    GLUE_SetHomingScrollFlag(1);
    GLUE_SetShowPanelFlag(1);
    TSK_AddTask(0x8000, (void *)DaveLTask__FP4TASK, 0x1000, 0);
    __6GPaneli(Panel1, 0);
    __6GPaneli(Panel2, 0);
    gplayer = &P1;
    VID_GetTick__Fv();
    D_8011AFF0 = 0;
    D_8011AFF4 = 1;
    if (setlevel != 0 && setlvlnum == 1) {
        if (*((unsigned char *)&quests + 0xF2) == 2) {
            PlaySFX__Fi(0x354);
        }
    }

    while ((GLUE_Finished__Fv() ^ 1) != 0) {
        VID_GetTick__Fv();
        VID_GetTick__Fv();
        ResetFlames__Fv();
        if (DoDrawBg != 0) {
            if (PauseMode == 0 && D_8011C6C0 != 0) {
                SetRandOffset__7CBlocksi(&Blocks, D_8011C6C4);
                D_8011C6C0 -= 1;
            }
            Plr = &plr[0];
            if (plr[0x1D] == 0) {
                Plr = &plr[0x19E8];
            }
            SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks(&P1, (struct PlayerStruct *)Plr, &Blocks);
            if (DoHomingScroll != 0 && deathflag == 0) {
                DoScroll__7CBlocks(&Blocks);
            }
            Print__7CBlocks(&Blocks);
            DrawAndBlit__Fv();
            if (DoShowPanel != 0) {
                DoShowPanelGFX(Panel1, Panel2);
            }
            MakeSurePlayerDressedProperly(P1, *(struct PlayerStruct *)&plr[0], IsTown, 0);
            Print__7CPlayerR12PlayerStructR7CBlocks(&P1, (struct PlayerStruct *)&plr[0], &Blocks);
            if (FePlayerNo != 0) {
                MakeSurePlayerDressedProperly(P2, *(struct PlayerStruct *)&plr[0x19E8], IsTown, 0);
                Print__7CPlayerR12PlayerStructR7CBlocks(&P2, (struct PlayerStruct *)&plr[0x19E8], &Blocks);
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
    D_8011AFF4 = 0;
    ___7CPlayer(&P2, 2);
    ___7CPlayer(&P1, 2);
    ___7CBlocks(&Blocks, 2);
}
