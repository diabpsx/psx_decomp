/* GAMEPAD.CPP -- Diablo PSX (Climax 1998) reconstruction.  PSX-only: this file has NO PC twin
 * (devilution/hellfire use mouse+keyboard; the PSX GamePad class + its button-assignment/combo
 * machinery is a Climax-original input layer). Reconstructed directly from the raw oracle
 * (asm/nonmatchings/gamepad/*.s) and the SYM (DIABPSX.SYM), using skel/SOURCE/GAMEPAD.CPP's m2c/IDA
 * drafts as secondary shape hints only.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_gamepad.h"
#include "source/gen/externs_gamepad.h"
#include "source/gen/protos_gamepad.h"
#include "source/diablo.h"

/* file-static GamePad instances (SYM class STAT) */
static struct GamePad GPad1;
static struct GamePad GPad2;

/* file-static (SYM class STAT INT, gp-rel) */
static int HappyManFlag;

/* --------------------------------------------------------------------- */
void ClrCursor(int num)
{
    if ((unsigned)num < 2) {
        _infostr[num][0] = 0;
        _pcursmonst[num] = -1;
        _pcursobj[num] = -1;
        _pcursitem[num] = -1;
        _pcursinvitem[num] = -1;
    }
}

/* --------------------------------------------------------------------- */
void HappyMan(int n)
{
    HappyManFlag = n * 2;
}

/* --------------------------------------------------------------------- */
void WorldToOffset(int pnum, int WorldX, int WorldY)
{
    int ox, oy;
    struct PlayerStruct *p;

    ox = WorldX & 7;
    oy = WorldY & 7;
    p = &plr[pnum];

    if (WorldX < 0)
        WorldX = 0;
    if (WorldY < 0)
        WorldY = 0;

    p->_px = WorldX >> 3;
    p->_py = WorldY >> 3;
    p->_pxoff = (ox - oy) * 4;
    p->WorldX = WorldX;
    p->WorldY = WorldY;
    p->_pyoff = (ox + oy - 8) * 2;
}

/* --------------------------------------------------------------------- */
void CloseInvChr(void)
{
    chrflag = 0;
    options_pad = -1;
    PlaySFX(0x33);
    PostGamePad(5, 0, 0, 0);
}

/* --------------------------------------------------------------------- */
int GamePad::GetActionButton(void (*func)())
{
    int i;
    void (*f)();

    for (i = 0; i < 14; i++) {
        f = await_combo ? button_combo[i] : button_down[i];
        if (f == func)
            return pad_txt[i].pnum;
    }
    return 0;
}

/* --------------------------------------------------------------------- */
GamePad *GetGamePad(int pnum)
{
    if (pnum == 0)
        return &GPad1;
    return &GPad2;
}

/* --------------------------------------------------------------------- */
char GetPadStyle(int pnum)
{
    GamePad *g;

    if (pnum != 0)
        g = &GPad2;
    else
        g = &GPad1;
    return g->style;
}

/* --------------------------------------------------------------------- */
int SetWalkStyle(int pnum, int style)
{
    int oldstyle;

    PostGamePad(0xB, 0, (int)txt_actions, 0);
    oldstyle = txt_actions[9].pad_val;
    txt_actions[9].pad_val = style;
    PostGamePad(9, 0, (int)txt_actions, 0);
    return oldstyle;
}

/* --------------------------------------------------------------------- */
void Init_GamePad(void)
{
    TSK_AddTask(0x42, GamePadTask, 0x1000, 0);
}

/* --------------------------------------------------------------------- */
void InitGamePadVars(void)
{
    HappyManFlag = 0;
    RemoveTargetCursor(-1);
    TeleStop(0);
    TeleStop(1);

    ScrollFlag[0] = 0;
    ScrollFlag[1] = 0;
    automapmoved = 0;
    if (_spselflag[0])
        TSK_Kill(_spselflag[0]);
    if (_spselflag[1])
        TSK_Kill(_spselflag[1]);
    _spselflag[0] = 0;
    _spselflag[1] = 0;

    _SpdBeltSelFlag[0] = 0;
    _SpdBeltSelFlag[1] = 0;
    PauseMode = 0;
    chrflag = 0;
    invflag = 0;
    optionsflag = 0;
    sbookflag = 0;
    questlog = 0;
    qtextflag = 0;
    stextflag = 0;

    ClrDiabloMsg();
    ClrCursor(0);
    ClrCursor(1);

    _pcursplr[0] = -1;
    _pcursplr[1] = -1;
    gbActivePlayers = 0;

    if (FePlayerNo != 0) {
        if (plr[0].plractive)
            gbActivePlayers = 1;
        if (plr[1].plractive)
            gbActivePlayers = gbActivePlayers + 1;
    } else {
        plr[1].plractive = 0;
        if (plr[0].plractive)
            gbActivePlayers = 1;
    }

    PostGamePad(5, 0, 0, 0);
}

/* --------------------------------------------------------------------- */
/* PSX button-dispatch entry point: val 2..11 select an operation on
 * GPad1/GPad2 (allow_walking on/off per-pad, SetAllButtons/GetAllButtons/
 * SetUpAction via var2/var3). Reconstructed from the raw jump table
 * (jtbl_80118AF0); the val==11 case body is a best-effort guess (mirrors
 * val==10's SetUpAction dispatch) -- not independently confirmed. */
void PostGamePad(int val, int var1, int var2, int var3)
{
    struct GamePad *p1 = &GPad1;
    struct GamePad *p2 = &GPad2;
    struct GamePad *pad;

    if ((unsigned)(val - 2) < 10) {
        switch (val) {
        case 2:
            p1->allow_walking = 0;
        case 3:
            p2->allow_walking = 0;
            break;
        case 4:
            p1->allow_walking = 0;
            break;
        case 5:
            p1->allow_walking = 1;
        case 6:
            p2->allow_walking = 1;
            break;
        case 7:
            p1->allow_walking = 1;
            break;
        case 8:
            pad = var1 ? p2 : p1;
            pad->SetAllButtons((struct KEY_ASSIGNS *)var2);
            break;
        case 9:
            pad = var1 ? p2 : p1;
            pad->GetAllButtons((struct KEY_ASSIGNS *)var2);
            break;
        case 10:
        case 11:
            pad = var1 ? p2 : p1;
            pad->SetUpAction((void (*)())var2, (void (*)())var3);
            break;
        }
    }
}
