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
unsigned char automapmoved;   /* TU-owned (%gp_rel in the oracle) @0x8011BBDE */
unsigned char _SpdBeltSelFlag[2];   /* TU-owned (%gp_rel in the oracle) @0x8011BBC4 */
BOOL ignore_buttons;   /* TU-owned (%gp_rel in the oracle) @0x8011BBD0 */

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

/* --------------------------------------------------------------------- */
GamePad::GamePad(int player_num)
{
    player = &plr[player_num];
    pad_up_button = 0;
    pad_up_action = 0;
    pnum = player_num;
    allow_walking = 1;
    combo_key = 0;
    await_combo = 0;
    restore_controller_settings(CTRL_BEGINNER);
    SetAllButtons(txt_actions);
    ClrCursor(player_num);
    SetQSpell(pnum, -1, 4);
}

/* --------------------------------------------------------------------- */
int GamePad::CheckDirs(int dir, int wx, int wy)
{
    int mx, my;

    if (wx >= 0)
        mx = wx;
    else
        mx = wx + 7;
    mx = (mx >> 3) << 3;
    mx = wx - mx;

    if (wy >= 0)
        my = wy;
    else
        my = wy + 7;
    my = (my >> 3) << 3;
    my = wy - my;

    if ((unsigned)dir < 8) {
        switch (dir) {
        case 0:
            if (mx < 4 && my < 4)
                dir = -1;
            break;
        case 1:
            if (my < 4)
                dir = -1;
            break;
        case 2:
            if (mx < 4)
                break;
            if (my < 4)
                dir = -1;
            break;
        case 3:
            if (mx >= 4)
                dir = -1;
            break;
        case 4:
            if (mx < 4)
                break;
            if (my >= 4)
                dir = -1;
            break;
        case 5:
            if (my >= 4)
                dir = -1;
            break;
        case 6:
            if (mx >= 4)
                break;
            if (my >= 4)
                dir = -1;
            break;
        case 7:
            if (mx < 4)
                dir = -1;
            break;
        }
    }

    return dir;
}

/* --------------------------------------------------------------------- */
/* PSX button-assignment table load: `actions[i].txt` is a language-table
 * string id; the numeric ranges below bucket each entry into: a generic
 * SetDownButton/SetComboDownButton pair, SetMoveStyle (id 0x2A6), the
 * combo-menu-active flag (id 0xC3), the combo_key value (id 0xC6), or
 * "not one of ours, skip". Reconstructed by tracing every branch of the
 * raw oracle (asm/nonmatchings/gamepad/SetAllButtons__7GamePadP11KEY_ASSIGNS.s)
 * -- the numeric id boundaries themselves are Climax's text-catalog layout,
 * not something derivable from first principles. */
void GamePad::SetAllButtons(struct KEY_ASSIGNS *actions)
{
    int i;
    int txt;

    for (i = 0; i < 14; i++) {
        button_down[i] = 0;
        button_combo[i] = 0;
    }

    for (i = 0; i < 20; i++) {
        txt = actions[i].txt;

        if (txt == 0x21F)
            goto setbutton;
        if (txt < 0x220) {
            if (txt == 0x45)
                goto setbutton;
            if (txt < 0x46) {
                if (txt == 9)
                    goto setbutton;
                if (txt < 9)
                    continue;
                if (txt >= 0x34)
                    continue;
                if (txt >= 0x32)
                    goto setbutton;
                continue;
            }
            if (txt == 0xAE)
                goto setbutton;
            if (txt < 0xAF) {
                if (txt == 0xA2)
                    goto setbutton;
                continue;
            }
            if (txt == 0xC3) {
                combo_menu_active = (unsigned char)actions[i].pad_val;
                continue;
            }
            if (txt == 0xC6) {
                combo_key = actions[i].pad_val;
                continue;
            }
            continue;
        }
        if (txt < 0x341) {
            if (txt >= 0x33F)
                goto setbutton;
            if (txt == 0x2A6) {
                SetMoveStyle((char)actions[i].pad_val);
                continue;
            }
            if (txt == 0x33B)
                goto setbutton;
            continue;
        }
        if (txt == 0x3F7)
            goto setbutton;
        if (txt < 0x3F8) {
            if (txt == 0x3F3)
                goto setbutton;
            continue;
        }
        if (txt == 0x48D || txt == 0x4AB)
            goto setbutton;
        continue;

    setbutton:
        if (actions[i].pad_val)
            SetDownButton(actions[i].pad_val, actions[i].func);
        if (actions[i].combo_val)
            SetComboDownButton(actions[i].combo_val, actions[i].func);
    }

    button_down[get_key_pad(0x20)] = pad_func_select;
    button_down[get_key_pad(1)] = pad_func_up;
    button_down[get_key_pad(2)] = pad_func_down;
    button_down[get_key_pad(4)] = pad_func_left;
    button_down[get_key_pad(8)] = pad_func_right;
}

/* --------------------------------------------------------------------- */
/* mod-toward-negative-infinity helper matching the raw's `(x>=0?x:x+7)>>3<<3`
 * remainder idiom, shared by CheckDirs(3-arg) and CheckCentre. */
static int centre_mod8(int v)
{
    int t;

    if (v >= 0)
        t = v;
    else
        t = v + 7;
    t = (t >> 3) << 3;
    return v - t;
}

/* --------------------------------------------------------------------- */
unsigned char GamePad::CheckCentre(int dir)
{
    int mx, my, t;
    int centred;

    mx = player->WorldX;
    my = player->WorldY;

    if (mx >= 0)
        t = mx;
    else
        t = mx + 7;
    t = (t >> 3) << 3;
    mx = mx - t;

    if (my >= 0)
        t = my;
    else
        t = my + 7;
    t = (t >> 3) << 3;
    my = my - t;

    centred = 0;

    if ((unsigned)dir < 8) {
        switch (dir) {
        case 0:
            if (mx == 4)
                centred = 1;
            else if (my == 4)
                centred = 1;
            break;
        case 1:
            if (mx == 4)
                centred = 1;
            break;
        case 2:
            if (mx == 4)
                centred = 1;
            else if (my == 4)
                centred = 1;
            break;
        case 3:
            if (mx == 4)
                centred = 1;
            else if (my == 4)
                centred = 1;
            break;
        case 4:
            if (mx == 4)
                centred = 1;
            break;
        case 5:
            if (mx == 4)
                centred = 1;
            else if (my == 4)
                centred = 1;
            break;
        case 6:
        case 7:
            if (my == 4)
                centred = 1;
            break;
        }
    }

    return centred;
}

/* --------------------------------------------------------------------- */
unsigned char GamePad::newDirOk(int dir)
{
    int oy, ox;

    oy = offset_y[dir];
    ox = offset_x[dir];

    if (PosOkPlayer(pnum, player->_px + ox, player->_py + oy))
        return 1;
    if (CheckDirs(dir, player->WorldX + ox, player->WorldY + oy) == -1)
        return 0;
    return 1;
}

/* --------------------------------------------------------------------- */
void GamePad::TestButtons(void)
{
    unsigned short button = 1;
    unsigned short up_state;

    if (ignore_buttons) {
        ignore_buttons = 0;
        return;
    }
    if (GetFadeState())
        return;

    Pad->GetDown();
    up_state = Pad->GetUp() & 0x3FFF;

    while (button != 0) {
        if (pnum != myplr)
            return;
        if (pnum != sel_data)
            return;
        if (up_state & button) {
            ButtonDown(button);
            if (invflag || stextflag || qtextflag || sbookflag || questlog || optionsflag)
                return;
        }
        button <<= 1;
    }
}

/* --------------------------------------------------------------------- */
int pad_UpIsUpRight(int pval, char other)
{
    int walk_dir;

    walk_dir = -1;
    switch (pval) {
    case 1: walk_dir = 4; break;
    case 2: walk_dir = 0; break;
    case 3: walk_dir = 2; break;
    case 4: walk_dir = 6; break;
    case 5: walk_dir = 3; break;
    case 6: walk_dir = 7; break;
    case 7: walk_dir = 1; break;
    case 8: walk_dir = 5; break;
    case 9:
    case 10:
        break;
    }

    if (walk_dir != -1 && other != 0) {
        do {
            walk_dir = (walk_dir - 1) & 7;
            other--;
        } while (other != 0);
    }

    if (HappyManFlag != 0) {
        walk_dir = (HappyManFlag >> 1) & 7;
        HappyManFlag--;
    }

    return walk_dir;
}

/* --------------------------------------------------------------------- */
void GamePadTask(struct TASK *T)
{
    int omp, oms;

    for (;;) {
        oms = sel_data;
        omp = myplr;
        if (!GLUE_Finished() && !CDWAIT && !demo_finish && (unsigned)IS_GameOver() < 1) {
            sel_data = 1;
            myplr = 1;
            Handle(&GPad2);
            sel_data = 0;
            myplr = 0;
            Handle(&GPad1);
        }
        myplr = omp;
        sel_data = oms;
        TSK_Sleep(1);
    }
}
