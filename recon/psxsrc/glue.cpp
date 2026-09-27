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

extern void BgTask(void *T);

extern "C" void MAIN_RestartGameTask(void);
extern "C" void SPU_Init(void);
extern "C" void MSG_ClearOutCompMap(void);
extern unsigned char plr[];   /* PlayerStruct plr[2] -- only address-of used here */

/* Minimal local layouts (this TU only touches these fields; matches davel.cpp's CPlayer). */
class CPlayer {
public:
    unsigned char pad0[0x80];
    int TexId;   /* +0x80 */
    unsigned char pad1[144 - 0x84];   /* sizeof CPlayer = 144 per retail SYM */

    int GetTexId(void);
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
int D_8011C6B4;   /* HomingScroll flag */
int D_8011AFF4;   /* HasGameStarted flag */
int D_8011C6C0;   /* GLUE_DoQuake Time */
int D_8011C6C4;   /* GLUE_DoQuake Amount */
int DoDrawBg;     /* @0x8011B004 -- other TUs (control/scrollrt/graham/padfuncs) see it as a cross-TU extern (lui/lw) */
int DoShowPanel;  /* @0x8011B000 -- ditto */

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

int GLUE_SetShowGameScreenFlag(BOOL NewFlag)
{
    int OldFlag;

    OldFlag = DoDrawBg;
    DoDrawBg = NewFlag;
    return OldFlag;
}

int GLUE_GetShowGameScreenFlag(void)
{
    return DoDrawBg;
}

int GLUE_SetHomingScrollFlag(BOOL NewFlag)
{
    int OldFlag;

    OldFlag = D_8011C6B4;
    D_8011C6B4 = NewFlag;
    return OldFlag;
}

int GLUE_SetShowPanelFlag(BOOL NewFlag)
{
    int OldFlag;

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
    int i;

    for (i = 0x19E8; i >= 0; i -= 0x19E8) {
        plr[0x1D + i] = 0;
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
