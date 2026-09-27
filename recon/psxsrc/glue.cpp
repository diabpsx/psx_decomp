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

struct GPanel { unsigned char pad[28]; };   /* sizeof 28 per retail SYM; opaque here */
struct PanelXY;
extern struct PanelXY DefP1PanelXY, DefP2PanelXY, DefP1PanelXY2, DefP2PanelXY2;
extern int sel_data;
extern "C" void Print__6GPanelP7PanelXYP12PlayerStruct(struct GPanel *P, struct PanelXY *XY, void *Plr);

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

    i = 0;
    f = PlayerInfo;
    idx = 0;
    for (;;) {
        i++;
        if (strcmp(*(char **)((char *)PlayerInfo + idx), Id) == 0) {
            return f;
        }
        f = (struct PInf *)((char *)f + 0xC);
        idx += 0xC;
        if (i >= 0x51) {
            DBG_Error(0, D_80110B58, 0x288);
            return 0;
        }
    }
}

struct PInf *FindPlayerChar(int Char, int Wep, int Arm)
{
    char TxBuff[20];

    sprintf(TxBuff, D_8011AFF8, D_8011B00C[Char], D_8011B008[Arm], D_80110B68[Wep]);
    return FindPlayerChar(TxBuff);
}

struct PInf *FindPlayerChar(struct PlayerStruct *P)
{
    unsigned char temp_a1;

    temp_a1 = P->_pgfxnum;
    return FindPlayerChar((int)P->_pClass, temp_a1 & 0xF, (int)(temp_a1 << 24) >> 28);
}

unsigned short FindPlayerChar(struct PlayerStruct *P, BOOL InTown)
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
            return (unsigned short)-1;
        }
        if (Class == 2) {
            return 0x125;
        }
        DBG_Error(0, D_80110B58, 0x2AF);
        return (unsigned short)-1;
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
    unsigned short Id;

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
    struct GPanel *P;
    struct PanelXY *XY;
    void *Plr;

    P = P1;
    if (plr[0x1D] != 0) {
        if (plr[0x1A05] != 0) {
            sel_data = 0;
            Print__6GPanelP7PanelXYP12PlayerStruct(P1, &DefP1PanelXY2, &plr[0]);
            P = P2;
            XY = &DefP2PanelXY2;
            sel_data = 1;
            Plr = &plr[0x19E8];
        } else {
            sel_data = 0;
            XY = &DefP1PanelXY;
            Plr = &plr[0];
        }
        Print__6GPanelP7PanelXYP12PlayerStruct(P, XY, Plr);
        return;
    }
    if (plr[0x1A05] != 0) {
        sel_data = 1;
        P = P2;
        XY = &DefP2PanelXY;
        Plr = &plr[0x19E8];
        Print__6GPanelP7PanelXYP12PlayerStruct(P, XY, Plr);
    }
}
