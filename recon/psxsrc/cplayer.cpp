/* CPLAYER.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/CPLAYER.CPP).  No PC twin: the PSX
 * player-sprite object (a TextDat per player), its scroll-target logic and the per-frame Print.
 * Sources: retail asm oracle > SYM (scratch/tuinfo.py CPLAYER.CPP; SYM text gives STAT/EXT per function)
 * > skel/PSXSRC/CPLAYER.CPP drafts.  Layouts: tools/symhdr.py -> source/gen/structs_cplayer.h.
 * The GMAN.H/BLOCK.H/PRIMPOOL.H inlines used here are emitted out of line in this object. */
#include "diabpsx_types.h"
#include "psxsrc/textfileinfo_header.h"   /* GMAN.H inlines: the ".tp"/".dat" literal pool heads this TU's .sdata */
#include "source/gen/structs_cplayer.h"
#include "psxsrc/psyq.h"
#include "glibdev/gdebug.h"

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/CPLAYER.CPP", line)   /* retail line literals */

struct TASK {   /* sizeof 92 */
    struct TASK *Next;   /* +0x0 */
    struct TASK *Prev;   /* +0x4 */
    unsigned long Id;   /* +0x8 */
    unsigned long SleepTime;   /* +0xC */
    unsigned long fToInit : 1;
    unsigned long fToDie : 1;
    unsigned long fKillable : 1;
    unsigned long fActive : 1;
    unsigned long fXtraStack : 1;
    void *Stack;   /* +0x14 */
    unsigned long StackSize;   /* +0x18 */
    void *Data;   /* +0x1C */
    int TskEnv[12];   /* +0x20 */
    void (*Main)();   /* +0x50 */
    long hndTask;   /* +0x54 */
    unsigned short XtraLongs;   /* +0x58 */
    unsigned short MaxStackSizeBytes;   /* +0x5A */
};

/* ---- externals ---- */
extern "C" {
long GAL_Alloc(unsigned long Size, unsigned long Type, char *Name);
unsigned char GAL_Free(long Handle);
void TSK_Sleep(int Frames);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);
TASK *TSK_Exist(TASK *T, unsigned long Id, unsigned long Mask);
}
void stream_stop(void);
void GLUE_SuspendGame(void);
void GLUE_ResumeGame(void);
void DoReflection(POLY_FT4 *Ft4, int R, int G, int B);

extern struct PlayerStruct plr[2];
extern struct SPELLFX_DAT SpellFXDat[2];
extern char daylight;
extern unsigned char currlevel;
extern unsigned char leveltype;
extern int PosAdj;
extern unsigned long *ThisOt;
extern BOOL CDWAIT;
extern unsigned char PauseMode;
extern POLY_FT4 *ThisPrimAddr;   /* PRIMPOOL.H @0x8011AAB8 */
extern POLY_FT4 *AddrToAvoid;    /* @0x8011AABC */

/* CPLAYER.H inline (line 65), unused here: its "psxsrc/cplayer.h" literal heads this TU's .rdata. */
inline CPlayer *CPlayer::GetPlayer(int PNum)
{
    if (1 < (unsigned int)PNum)
        DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
    return PActiveArray[PNum];
}

/* ---- TU data ---- */
CPlayer *CPlayer::PActiveArray[2] = { 0, 0 };   /* @0x8011AD50: explicitly initialised, so it precedes the "PLRDAT" literal in .sdata */
static int OWorldX;   /* @0x8011C674 (sbss, SYM STAT) */
static int OWorldY;   /* @0x8011C678 */
static int WWorldX;   /* @0x8011C67C */
static int WWorldY;   /* @0x8011C680 */

static void FilthyTask(TASK *T);
/* @0x80095854 CPLAYER.CPP:72 */
CPlayer::CPlayer(BOOL Town, int mPlayerNum, int NewNumOfPlayers)
{
    InTown = Town;
    PlayerNum = mPlayerNum;
    TexId = -1;
    hndDatMem = -1;
    NumOfPlayers = NewNumOfPlayers;
    LastScrX = 0;
    LastScrY = 0;
    LastOtPos = 0;
    Init();
    switch (PlayerNum) {
    case 0:
        SetDecompArea(0x2C1, 2, 0x2C0, 0);
        break;
    case 1:
        SetDecompArea(0x2C1, 0x66, 0x2C0, 1);
        break;
    default:
        ASSERT(!"Illegal player num", 0x75);
        break;
    }
    PActiveArray[PlayerNum] = this;
    int SizeToAlloc = GetDatMaxSize();
    if (NewNumOfPlayers || mPlayerNum != 1) {
        long hnd = GAL_Alloc(SizeToAlloc, 1, "PLRDAT");
        ASSERT(hnd != -1, 0x85);
        hndDatMem = hnd;
    }
}

/* @0x800959AC CPLAYER.CPP:147 */
CPlayer::~CPlayer()
{
    PActiveArray[PlayerNum] = NULL;
    Dump();
    if (hndDatMem != -1) {
        unsigned char Freed = GAL_Free(hndDatMem);
        ASSERT(Freed, 0x9B);
    }
}

/* @0x80095A3C CPLAYER.CPP:166 */
void CPlayer::Load(int Id)
{
    DumpData();
    SetFileInfo(GetFileInfo(Id), -1);
    Use(hndDatMem, false, GetDatMaxSize());
    TexId = Id;
}

/* @0x80095AA8 CPLAYER.CPP:210.  Line layout below follows the retail SLD records exactly (relative to the
 * opening brace = line 210).  The two PM_WALK blocks are the PAL-beta walk-lead code (refs/skeleton
 * PAL_1997_12_12 CPLAYER.CPP: pdir/wtime locals, TxyAdd adds); in this build their adds are dead, flow
 * deletes them, jump2 then deletes the emptied tests -- but only after allocation, which is what leaves
 * retail's s7 = &plr base (second plr[0] access) and the wtime REG $v0 record with no code. */
void CPlayer::SetScrollTarget(PlayerStruct &Plr, CBlocks &Bg)
{
    int ScrX = Plr._pxoff * 652 / 1000;
    int ScrY = Plr._pyoff * 625 / 1000;
    int WorldX;
    int WorldY;
    int NWorldX = 0;
    int NWorldY = 0;
    int wtime;


    BOOL ok = false;

    if (plr[0].plractive && plr[0]._pmode != PM_DEATH && plr[1].plractive && plr[1]._pmode != PM_DEATH)
    {
        ok = true;
        ScrX = (Plr._pxoff + plr[1]._pxoff) / 2 * 625 / 1000;
        ScrY = (Plr._pyoff + plr[1]._pyoff) / 2 * 625 / 1000;

        NWorldX = (plr[0]._px + plr[1]._px) * 10 + Bg.ScrToWorldX(ScrX, ScrY) + 10;

        NWorldY = (plr[0]._py + plr[1]._py) * 10 + Bg.ScrToWorldY(ScrX, ScrY) + 10;
    }


    else if (plr[1].plractive && plr[1]._pmode != PM_DEATH)
    {
        ok = true;
        ScrX = plr[1]._pxoff * 652 / 1000;
        ScrY = plr[1]._pyoff * 625 / 1000;
        WorldX = plr[1]._px * 20 + Bg.ScrToWorldX(ScrX, ScrY) + 10;
        WorldY = plr[1]._py * 20 + Bg.ScrToWorldY(ScrX, ScrY) + 10;
        if (plr[1]._pmode == PM_WALK)
        {
            /* PAL beta: pdir = plr[1]._pdir; */
            wtime = plr[1]._pVar8;
            if (wtime > 16)
                wtime = 16;
            /* PAL beta: NWorldX += TxyAdd[pdir * 2] * wtime; */
            /* PAL beta: NWorldY += TxyAdd[pdir * 2 + 1] * wtime; */
        }
        NWorldX = WorldX; NWorldX += (WWorldX - OWorldX) / 2;   /* PAL-beta `NWorldX +=` accumulation */
        NWorldY = WorldY; NWorldY += (WWorldY - OWorldY) / 2;
    }


    else if (plr[0]._pmode != PM_DEATH)
    {
        ok = true;
        WorldX = Plr._px * 20 + Bg.ScrToWorldX(ScrX, ScrY) + 10;
        WorldY = Plr._py * 20 + Bg.ScrToWorldY(ScrX, ScrY) + 10;
        if (plr[0]._pmode == PM_WALK)
        {
            /* PAL beta: pdir = plr[0]._pdir; */
            wtime = plr[0]._pVar8;
            if (wtime > 16)
                wtime = 16;
            /* PAL beta: NWorldX += TxyAdd[pdir * 2] * wtime; */
            /* PAL beta: NWorldY += TxyAdd[pdir * 2 + 1] * wtime; */
        }
        NWorldX = WorldX; NWorldX += (WWorldX - OWorldX) / 2;   /* PAL-beta `NWorldX +=` accumulation */
        NWorldY = WorldY; NWorldY += (WWorldY - OWorldY) / 2;
    }








    Bg.WorldToScrX(0, 0);
    Bg.WorldToScrY(0, 0);

    if (ok)
        Bg.SetScrollTarget(NWorldX, NWorldY);
}

/* PRIMPOOL.H inline (header copy, lines 65-71), parsed here: cc1plus emits an inline's literal where its body
 * is parsed, and retail .rdata has "psxsrc/primpool.h" after the constructor's literals and before FindAction's
 * table; defined last among this TU's inlines, it leads the reverse-order out-of-line tail. */
inline void PRIM_GetPrim(POLY_FT4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_FT4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 68);
    *Prim = (POLY_FT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_FT4 *)ThisPrimAddr + 1);
}

/* @0x80095E8C CPLAYER.CPP:316 */
void CPlayer::Print(PlayerStruct &Plr, CBlocks &Bg)
{
    if (!Plr.plractive && currlevel != Plr.DeadLevel)
        return;
    int ScrXOff;
    int ScrYOff;
    int Action;
    int WorldX;
    int WorldY;
    POLY_FT4 *Ft4;

    ScrXOff = Plr._pxoff * 625 / 1000;
    ScrYOff = Plr._pyoff * 625 / 1000;
    WorldX = Plr._px * 20;
    WorldY = Plr._py * 20;
    Action = FindAction(Plr);
    if (Action == 6) {
        int Frame = Plr._pAnimFrame - 1;
        if (Frame < GetNumOfFrames(0, 0)) {
            int FrmNum = Plr._pAnimFrame - 1;
            Frame = GetFrNum(0, 0, Plr._pdir, FrmNum);
            RECT R;
            Bg.GetScrXY(R, WorldX + 10, WorldY + 10, ScrXOff, ScrYOff);
            Ft4 = PrintFt4(Frame, R.x, R.y, 0, 4, 0);
            LastScrX = R.x;
            LastScrY = R.y;
            LastOtPos = 4;
            setSemiTrans(Ft4, 0);
            POLY_FT4 *ShadFt4 = PRIM_GetCopy(Ft4);
            CBlocks::ShadScaleSkew(ShadFt4);
            addPrim(ThisOt + 5, ShadFt4);
            setShadeTex(Ft4, 1);
        }
    } else if (Action != -1) {
        int Frame = Plr._pAnimFrame - 1;
        if (Action == 5) {
            Action = 0;
            Frame = 0;
        }
        if (Action < GetNumOfActions(0)) {
            if (Frame < GetNumOfFrames(0, Action)) {
                RECT R;
                int OtPos;
                POLY_FT4 *ShadFt4;
                Frame = GetFrNum(0, Action, Plr._pdir, Frame);
                Bg.GetScrXY(R, WorldX + 10, WorldY + 10, ScrXOff, ScrYOff);
                PRIM_GetPrim(&Ft4);
                PrepareFt4(Ft4, Frame, R.x, R.y, 0, 0);
                OtPos = Bg.GetOtPos(R.y);
                addPrim(ThisOt + OtPos, Ft4);
                LastScrX = R.x;
                LastScrY = R.y;
                LastOtPos = OtPos;
                if ((SpellFXDat[PlayerNum].teleflag | SpellFXDat[PlayerNum].phaseflag) & 1)
                    setSemiTrans(Ft4, 1);
                else
                    setSemiTrans(Ft4, 0);
                ShadFt4 = PRIM_GetCopy(Ft4);
                CBlocks::ShadScaleSkew(ShadFt4);
                addPrim(ThisOt + OtPos, ShadFt4);
                if (SpellFXDat[PlayerNum].phaseflag & 1) {
                    setShadeTex(Ft4, 0);
                    Ft4->r0 = 0x40;
                    Ft4->g0 = 0x40;
                    Ft4->b0 = 0x40;
                } else {
                    setShadeTex(Ft4, 1);
                }
                if (!leveltype) {
                    int zX = R.x;
                    int zY = R.y + 38;
                    PRIM_GetPrim(&Ft4);
                    PrepareFt4(Ft4, Frame, zX, zY, 0, 1);
                    DoReflection(Ft4, (daylight + 1) * 40, (daylight + 1) * 72, (daylight + 1) * 120);
                }
            }
        }
    }
}

/* @0x800963C4 CPLAYER.CPP:477 */
int CPlayer::FindAction(PlayerStruct &Plr)
{
    int RetVal;

    switch (FindActionEnum(Plr)) {
    case PL_WALK:
    case PL_TWALK:
        RetVal = 1;
        break;
    case PL_STAND:
    case PL_TSTAND:
        RetVal = 0;
        break;
    case PL_ATTACK:
        RetVal = 2;
        break;
    case PL_HIT:
        RetVal = 3;
        break;
    case PL_BLOCK:
        RetVal = 4;
        break;
    case PL_DEATH:
        RetVal = 6;
        break;
    case PL_LMAGIC:
    case PL_QMAGIC:
    case PL_FMAGIC:
        RetVal = 5;
        break;
    default:
        RetVal = -1;
        break;
    }
    return RetVal;
}

/* @0x80096448 CPLAYER.CPP:540 */
PACTION CPlayer::FindActionEnum(PlayerStruct &Plr)
{
    switch (Plr._pmode) {
    case PM_STAND:
    case PM_NEWLVL:
    case PM_QUIT:
        return PL_STAND;
    case PM_WALK:
    case PM_WALK2:
    case PM_WALK3:
        return PL_WALK;
    case PM_ATTACK:
    case PM_RATTACK:
        return PL_ATTACK;
    case PM_BLOCK:
        return PL_BLOCK;
    case PM_SPELL:
        if (leveltype)
            return PL_LMAGIC;
        return PL_STAND;
    case PM_GOTHIT:
        return PL_HIT;
    case PM_DEATH:
        return PL_DEATH;
    }
    return PL_NOACTION;
}

/* @0x800964CC CPLAYER.CPP:585 */
void CPlayer::Init()
{
}

/* @0x800964D4 CPLAYER.CPP:595 */
void CPlayer::Dump()
{
}

/* @0x800964DC CPLAYER.CPP:606 */
void CPlayer::LoadThis(int Id)
{
    SetFileInfo(GetFileInfo(Id), -1);
    DumpData();
    Use(hndDatMem, false, GetDatMaxSize());
    TexId = Id;
}

/* @0x8009654C CPLAYER.CPP:626 */
void CPlayer::NonBlockingLoadNewGFX(int Id)
{
    if (!TSK_Exist(NULL, 0x8002, 0xFFFFFFFF)) {
        PlayerParam *Pp = (PlayerParam *)TSK_AddTask(0x8002, (void (*)())FilthyTask, 0xC78, sizeof(PlayerParam))->Data;
        Pp->ThePlayer = this;
        Pp->Id = Id;
    }
}

/* @0x800965B8 CPLAYER.CPP:641 */
static void FilthyTask(TASK *T)
{
    CPlayer *ThePlayer;
    char FName[15];
    int Id;
    PlayerParam *Pp;

    Pp = (PlayerParam *)T->Data;
    CDWAIT = 1;
    PauseMode = 1;
    ThePlayer = Pp->ThePlayer;
    Id = Pp->Id;
    GLUE_SuspendGame();
    TSK_Sleep(3);
    stream_stop();
    ThePlayer->LoadThis(Id);
    GLUE_ResumeGame();
    PauseMode = 0;
    CDWAIT = 0;
}
