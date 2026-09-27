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
static char seen_combo;

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
    int x, y;
    struct PlayerStruct *player;

    x = WorldX & 7;
    y = WorldY & 7;
    player = &plr[pnum];

    if (WorldX < 0)
        WorldX = 0;
    if (WorldY < 0)
        WorldY = 0;

    player->_px = WorldX >> 3;
    player->_py = WorldY >> 3;
    player->_pxoff = (x - y) * 4;
    player->WorldX = WorldX;
    player->WorldY = WorldY;
    player->_pyoff = (x + y - 8) * 2;
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
int GamePad::GetActionButton(void (*func)(int))
{
    signed char combo;
    int *p;
    void (*f)(int);
    int i;

    combo = await_combo;
    p = &pad_txt[0].pnum;
    i = 0;
    do {
        f = combo ? button_combo[i] : button_down[i];
        if (f == func)
            return *p;
        i++;
        p = (int *)((char *)p + 12);
    } while ((int)p < (int)((char *)&pad_txt[0].pnum + 168));
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
    GamePad *GPad;

    if (pnum != 0)
        GPad = &GPad2;
    else
        GPad = &GPad1;
    return GPad->style;
}

/* --------------------------------------------------------------------- */
int SetWalkStyle(int pnum, int style)
{
    int ret;
    struct KEY_ASSIGNS *ta = txt_actions;

    PostGamePad(0xB, 0, (int)ta, 0);
    ret = txt_actions[9].pad_val;
    txt_actions[9].pad_val = style;
    PostGamePad(9, 0, (int)ta, 0);
    return ret;
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
            pad->SetUpAction((void (*)(int))var2, (void (*)(int))var3);
            break;
        }
    }
}

/* --------------------------------------------------------------------- */
void GamePad::SetMoveStyle(char style_num)
{
    style = style_num;
}

/* --------------------------------------------------------------------- */
void GamePad::SetDownButton(int pad_val, void (*func)(int))
{
    button_down[get_key_pad(pad_val)] = func;
}

/* --------------------------------------------------------------------- */
void GamePad::SetComboDownButton(int pad_val, void (*func)(int))
{
    button_combo[get_key_pad(pad_val)] = func;
}

/* --------------------------------------------------------------------- */
void GamePad::SetUpAction(void (*func)(int), void (*upfunc)(int))
{
    pad_up_button = GetActionButton(func);
    pad_up_action = upfunc;
}

/* --------------------------------------------------------------------- */
int GamePad::CheckDirs(int dir)
{
    return CheckDirs(dir, player->WorldX, player->WorldY);
}

/* --------------------------------------------------------------------- */
int GamePad::CheckSide(int dir)
{
    dir = (dir - 1) & 7;
    dir = (dir - 1) & 7;
    if (CheckDirs(dir) == -1)
        return 1;
    return 2;
}

/* --------------------------------------------------------------------- */
void GamePad::RunFunc(int key)
{
    int idx;
    void (*f)(int);

    if (FeFlag)
        return;

    if ((player->_pHitPoints >> 6) == 0)
        return;

    idx = get_key_pad(key);

    if (await_combo) {
        f = button_combo[idx];
        if (f == 0)
            return;
        if (leveltype == 0 && f == pad_func_AutoMap) {
            if (seen_combo != -1) {
                f(pnum);
            } else {
                f = button_down[idx];
                if (f != 0)
                    f(pnum);
            }
        } else {
            f(pnum);
        }
    } else {
        f = button_down[idx];
        if (f != 0)
            f(pnum);
    }
}
