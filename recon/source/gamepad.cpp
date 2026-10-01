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

/* GAMEPAD.CPP data, in retail .sdata address order (= definition order). flyflag is the first
 * explicitly-initialised public global, which names the static-init thunk _GLOBAL_.I.flyflag.
 * _pfind_list (60 zero bytes in GAMEPAD's .data, not .bss) is an explicitly initialised array. */
unsigned char flyflag = 0;              /* @0x8011BBC1 */
unsigned char _SpdBeltSelFlag[2] = { 0, 0 };   /* @0x8011BBC4 */
static int HappyManFlag = 0;            /* @0x8011BBC8 (STAT) */
static char seen_combo = -1;            /* @0x8011BBCC (STAT) */
BOOL ignore_buttons = 0;                /* @0x8011BBD0 */
int _pcurr_inv[2] = { 0, 0 };           /* @0x8011BBD4 */
struct found_objects _pfind_list[2][10] = { 0 };   /* @0x800E38A8 (.data) */
char _pfind_index[2] = { 0, 0 };        /* @0x8011BBDC */
unsigned char automapmoved = 0;         /* @0x8011BBDE */

/* file-static GamePad instances (SYM class STAT), constructed by the static-init thunk */
static struct GamePad GPad1(0);         /* @0x8012FB68 */
static struct GamePad GPad2(1);         /* @0x8012FC48 */

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
void GamePad::flyabout(void)
{
    int cp, owx, owy, wx, wy;
    struct CBlocks *gblocks;
    int step;

    wx = 0;
    wy = 0;
    cp = Pad->GetCur() & 0xF;
    owx = player->WorldX;
    owy = player->WorldY;
    gblocks = BL_GetCurrentBlocks();
    step = 4;
    if (await_combo)
        step = 8;

    if (cp & 1)
        wy = -step;
    else if (cp & 2)
        wy = step;
    if (cp & 4)
        wx -= step;
    else if (cp & 8)
        wx += step;

    if (owx + wx < 0)
        wx = 0;
    if (owy + wy < 0)
        wy = 0;
    if (owx + wx >= 873)
        wx = 0;
    if (owy + wy >= 873)
        wy = 0;

    WorldToOffset(pnum, owx + wx, owy + wy);
    WorldToOffset(pnum ^ 1, plr[(char)(pnum ^ 1)].WorldX + wx, plr[(char)(pnum ^ 1)].WorldY + wy);
    if (!plr[(char)(pnum ^ 1)].plractive) {
        plr[(char)(pnum ^ 1)]._pdir++;
        plr[(char)(pnum ^ 1)]._pdir &= 7;
    }
    ChangeLightXY(player->_plid, player->_px, player->_py);
    ChangeVisionXY(player->_pvid, player->_px, player->_py);
    ChangeLightXY(plr[pnum]._plid, plr[pnum]._px, plr[pnum]._py);
    ChangeVisionXY(plr[pnum]._pvid, plr[pnum]._px, plr[pnum]._py);
    PM_ChangeLightOff(pnum);
    if ((owx != owx + wx || owy != owy + wy) && player->_pmode < PM_WALK3)
        StartStand(pnum, player->_pdir = GetDirection(owx, owy, owx + wx, owy + wy));
    if (gplayer && gblocks) {
        gplayer->SetScrollTarget(plr[pnum], *gblocks);
        gblocks->MoveToScrollTarget();
    }
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
    for (int i = 0; i < 14; i++) {
        if (await_combo) {
            if (button_combo[i] == func)
                return pad_txt[i].pnum;
        } else {
            if (button_down[i] == func)
                return pad_txt[i].pnum;
        }
    }
    return 0;
}

/* --------------------------------------------------------------------- */
void GamePad::Handle(void)
{
    int cp;

    Pad = PAD_GetPad(pnum, 0);
    if (FeFlag) {
        if (qtextflag) {
            TSK_Sleep(1);
            options_pad = pnum;
            CheckStoreBtn();
        }
        return;
    }
    if (!player->plractive || IsGameLoading() || player->_pmode == PM_DEATH || (player->_pHitPoints >> 6) <= 0) {
        ClrCursor(pnum);
        return;
    }
    if ((!spell.Active() && !(invflag | chrflag)) || (_spselflag[pnum] && sbookflag)) {
        if (TryIconCurs())
            _pcursplr[sel_data] = -1;
    }
    ClearPanel();
    player->_pLvlChanging = 0;
    if (options_pad != -1 && pnum != options_pad)
        return;
    if (allow_walking <= 0 && player->_pmode < PM_WALK2)
        StartStand(pnum, player->_pdir);
    if (player->_pmode == PM_NEWLVL)
        player->_pmode = PM_STAND;
    await_combo = 0;
    cp = Pad->GetCur();
    if (!_SpdBeltSelFlag[pnum]) {
        if (pad_up_action == select_belt_item)
            allow_walking = 1;
        pad_up_action = 0;
        pad_up_button = 0;
    } else
        allow_walking = 0;
    if (!any_belt_items()) {
        _pcurr_inv[sel_data] = -1;
        if (_SpdBeltSelFlag[pnum])
            allow_walking = 1;
        _SpdBeltSelFlag[pnum] = 0;
    }

    if (qtextflag || stextflag) {
        CheckStoreBtn();
    } else {
        if (!PauseMode && gbRunGame) {
            check_around_player();
            if (cp & combo_key) {
                if (!(invflag | (questlog | chrflag)))
                    await_combo = 1;
            } else {
                await_combo = 0;
                if (seen_combo == pnum)
                    seen_combo = -1;
            }
            if (allow_walking > 0) {
                if (automapflag && player->_pmode == PM_STAND) {
                    int abut = GetActionButton(pad_func_AutoMap);
                    if (!abut) {
                        int owait = await_combo;
                        await_combo = 1;
                        abut = GetActionButton(pad_func_AutoMap);
                        await_combo = owait;
                    }
                    if ((cp & abut) && (cp & 0xF) && player->_pmode == PM_STAND) {
                        automapmoved = 1;
                        if (cp & 1)
                            AutomapUp();
                        if (cp & 2)
                            AutomapDown();
                        if (cp & 4)
                            AutomapLeft();
                        if (cp & 8)
                            AutomapRight();
                        return;
                    }
                    automapmoved = 0;
                }
                show_combos();
                spell.Show();
                if (flyflag) {
                    if (!spell.Active())
                        flyabout();
                } else {
                    int dir = pad_UpIsUpRight(Pad->GetCur() & 0xF, style);
                    if (dir != -1)
                        walk(dir);
                    else if (player->_pmode != PM_STAND && player->_pmode < PM_ATTACK && !automapmoved)
                        StartStand(pnum, player->_pdir);
                }
            }
        }
        if (!invflag) {
            if ((player->_pmode != PM_SPELL && !select_flag && !PauseMode) || sbookflag)
                TestButtons();
        } else if (Pad->GetDown() & 0x100) {
            CloseInvChr();
            StartStand(pnum, player->_pdir);
        }
    }

    if (goldcheat && invflag && _pcursinvitem[sel_data]) {
        char inv;
        if ((Pad->GetCur() & 0x2420) == 0x2420) {
            inv = _pcursinvitem[sel_data];
            if (player->InvList[inv - 7]._itype == 11)
                player->InvList[inv - 7]._ivalue += 500;
        }
    }
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
/* PSX button-dispatch entry point (jtbl_80118AF0, val 2..11): 2/3/4 walking off (both/GP1/GP2),
 * 5/6/7 walking on, 8 nothing, 9 SetAllButtons, 10 SetUpAction, 11 GetAllButtons (SetWalkStyle
 * posts 11 then reads txt_actions back). Case body order == retail layout (2>4, 3, 5>7, 6, 9, 11, 10). */
void PostGamePad(int val, int var1, int var2, int var3)
{
    struct GamePad *GP1 = &GPad1;
    struct GamePad *GP2 = &GPad2;

    switch (val) {
    case 2:
        GP1->allow_walking = 0;
    case 4:
        GP2->allow_walking = 0;
        break;
    case 3:
        GP1->allow_walking = 0;
        break;
    case 5:
        GP1->allow_walking = 1;
    case 7:
        GP2->allow_walking = 1;
        break;
    case 6:
        GP1->allow_walking = 1;
        break;
    case 8:
        break;
    case 9:
        switch (var1) {
        case 0: GP1->SetAllButtons((struct KEY_ASSIGNS *)var2); break;
        case 1: GP2->SetAllButtons((struct KEY_ASSIGNS *)var2); break;
        }
        break;
    case 11:
        switch (var1) {
        case 0: GP1->GetAllButtons((struct KEY_ASSIGNS *)var2); break;
        case 1: GP2->GetAllButtons((struct KEY_ASSIGNS *)var2); break;
        }
        break;
    case 10:
        switch (var1) {
        case 0: GP1->SetUpAction((void (*)(int))var2, (void (*)(int))var3); break;
        case 1: GP2->SetUpAction((void (*)(int))var2, (void (*)(int))var3); break;
        }
        break;
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
void GamePad::RunFunc(int pad)
{
    int i;

    if (FeFlag)
        return;
    if ((player->_pHitPoints >> 6) == 0)
        return;

    i = get_key_pad(pad);
    if (await_combo) {
        if (button_combo[i]) {
            if (leveltype == 0) {
                if (button_combo[i] == pad_func_AutoMap) {
                    if (seen_combo == -1)
                        button_combo[i](pnum);
                } else
                    button_combo[i](pnum);
            } else
                button_combo[i](pnum);
        }
    } else {
        if (button_down[i])
            button_down[i](pnum);
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
    wx %= 8;
    wy %= 8;

    /* case body order == retail layout (jtbl_80118AB0) */
    switch (dir) {
    case 4:
        if (wx < 4 && wy < 4)
            dir = -1;
        break;
    case 5:
        if (wy < 4)
            dir = -1;
        break;
    case 6:
        if (wx >= 4 && wy < 4)
            dir = -1;
        break;
    case 7:
        if (wx >= 4)
            dir = -1;
        break;
    case 0:
        if (wx >= 4 && wy >= 4)
            dir = -1;
        break;
    case 1:
        if (wy >= 4)
            dir = -1;
        break;
    case 2:
        if (wx < 4 && wy >= 4)
            dir = -1;
        break;
    case 3:
        if (wx < 4)
            dir = -1;
        break;
    }
    return dir;
}

/* --------------------------------------------------------------------- */
/* PSX button-assignment table load: `actions->txt` is a language-table string id; a sparse
 * switch (gcc binary compare tree) buckets each entry into SetMoveStyle (0x2A6), combo_menu_active
 * (0xC3), combo_key (0xC6) or a button binding. Loop = count biv + pointer biv (`actions++, i++`,
 * in that order: retail increments the actions-derived giv before i). */
void GamePad::SetAllButtons(struct KEY_ASSIGNS *actions)
{
    int i;

    for (i = 0; i < 14; i++) {
        button_down[i] = 0;
        button_combo[i] = 0;
    }

    for (i = 0; i < 20; actions++, i++) {
        switch (actions->txt) {
        case 0x2A6:
            SetMoveStyle(actions->pad_val);
            break;
        case 0xC3:
            combo_menu_active = actions->pad_val;
            break;
        case 0xC6:
            combo_key = actions->pad_val;
            break;
        case 9:
        case 0x32:
        case 0x33:
        case 0x45:
        case 0xA2:
        case 0xAE:
        case 0x21F:
        case 0x33B:
        case 0x33F:
        case 0x340:
        case 0x3F3:
        case 0x3F7:
        case 0x48D:
        case 0x4AB:
            if (actions->pad_val)
                SetDownButton(actions->pad_val, actions->func);
            if (actions->combo_val)
                SetComboDownButton(actions->combo_val, actions->func);
            break;
        }
    }

    button_down[get_key_pad(0x20)] = pad_func_select;
    button_down[get_key_pad(1)] = pad_func_up;
    button_down[get_key_pad(2)] = pad_func_down;
    button_down[get_key_pad(4)] = pad_func_left;
    button_down[get_key_pad(8)] = pad_func_right;
}

/* --------------------------------------------------------------------- */
void GamePad::GetAllButtons(struct KEY_ASSIGNS *actions)
{
    int i;
    int oc = await_combo;

    for (i = 0; i < 20; actions++, i++) {
        switch (actions->txt) {
        case 0x2A6:
            actions->pad_val = style;
            break;
        case 0xC3:
            actions->pad_val = combo_menu_active;
            break;
        case 0xC6:
            actions->pad_val = combo_key;
            break;
        case 9:
        case 0x32:
        case 0x33:
        case 0x45:
        case 0xA2:
        case 0xAE:
        case 0x21F:
        case 0x33B:
        case 0x33F:
        case 0x340:
        case 0x3F3:
        case 0x3F7:
        case 0x48D:
        case 0x4AB:
            await_combo = 0;
            actions->pad_val = GetActionButton(actions->func);
            await_combo = 1;
            actions->combo_val = GetActionButton(actions->func);
            break;
        }
    }
    await_combo = oc;
}


/* --------------------------------------------------------------------- */
BOOL GamePad::CheckCentre(int dir)
{
    int wx = player->WorldX;
    int wy = player->WorldY;
    int ret = 0;

    wx %= 8;
    wy %= 8;

    switch (dir) {
    case 4:
        if (wx == 4 || wy == 4)
            ret = 1;
        break;
    case 5:
        if (wx == 4)
            ret = 1;
        break;
    case 6:
        if (wx == 4 || wy == 4)
            ret = 1;
        break;
    case 0:
        if (wx == 4 || wy == 4)
            ret = 1;
        break;
    case 1:
        if (wx == 4)
            ret = 1;
        break;
    case 2:
        if (wx == 4 || wy == 4)
            ret = 1;
        break;
    case 3:
    case 7:
        if (wy == 4)
            ret = 1;
        break;
    }
    return ret;
}

/* --------------------------------------------------------------------- */
BOOL GamePad::newDirOk(int dir)
{
    char ox = offset_x[dir];
    char oy = offset_y[dir];
    int x = player->_px;
    int y = player->_py;
    x += ox;
    y += oy;
    if (!PosOkPlayer(pnum, x, y)) {
        int wx = player->WorldX;
        int wy = player->WorldY;
        wx += ox;
        wy += oy;
        if (CheckDirs(dir, wx, wy) == -1)
            return 0;
    }
    return 1;
}

/* --------------------------------------------------------------------- */
int GamePad::CheckDiagBodge(int dir)
{
    int x, y, lnd, rnd, wx, wy;
    char *poffset_x, *poffset_y;
    BOOL pl, pr, pf, pll, prr;

    pll = 1;
    prr = 1;
    lnd = (dir - 1) & 7;
    rnd = (dir + 1) & 7;
    x = player->_px;
    y = player->_py;
    wx = player->WorldX;
    wy = player->WorldY;
    pl = newDirOk(lnd);
    pr = newDirOk(rnd);
    pf = newDirOk(dir);
    poffset_x = offset_x;
    poffset_y = offset_y;

    if (!PosOkPlayer(pnum, x + poffset_x[(lnd - 1) & 7], y + poffset_y[(lnd - 1) & 7])) {
        int ndir = (((lnd - 1) & 7) - 1) & 7;
        pll = CheckDirs(ndir, wx + poffset_x[dir], wy + poffset_y[dir]) != -1;
    }
    if (!PosOkPlayer(pnum, x + poffset_x[(rnd + 1) & 7], y + poffset_y[(rnd + 1) & 7])) {
        int ndir = (((rnd + 1) & 7) + 1) & 7;
        prr = CheckDirs(ndir, wx + poffset_x[dir], wy + poffset_y[dir]) != -1;
    }

    if (pf) {
        if (pl && pr) {
            if (pll && prr)
                return dir;
            if (!pll && prr)
                return rnd;
            if (pll)
                return lnd;
        }
        if (!pl && pr)
            return (dir + 1) & 7;
        if (pl && !pr)
            return (dir - 1) & 7;
        if (!pl && !pr)
            return -1;
        return dir;
    }
    if (!pl) {
        if (pr)
            return rnd;
    } else {
        if (!pr)
            return lnd;
        if (CheckDirs(lnd) != -1)
            return rnd;
    }
    if (pl && !pf && CheckDirs(rnd) != -1)
        return lnd;
    return -1;
}

/* --------------------------------------------------------------------- */
int GamePad::CheckIsoBodge(int dir)
{
    int x, y, newdir, wx, wy, lnd, rnd;
    char *poffset_x, *poffset_y;
    char ox, oy;

    newdir = dir;
    poffset_x = offset_x;
    poffset_y = offset_y;
    lnd = (((newdir - 1) & 7) - 1) & 7;
    rnd = (((newdir + 1) & 7) + 1) & 7;
    wx = player->WorldX;
    wy = player->WorldY;
    ox = poffset_x[newdir];
    oy = poffset_y[newdir];
    x = player->_px;
    y = player->_py;
    x += ox;
    y += oy;

    if (!PosOkPlayer(pnum, x, y)) {
        const int checked = CheckDirs(newdir, wx + ox, wy + oy);
        if (checked != -1)
            return newdir;
        if (PosOkPlayer(pnum, player->_px + poffset_x[(newdir - 1) & 7], player->_py + poffset_y[(newdir - 1) & 7])
            && PosOkPlayer(pnum, player->_px + poffset_x[lnd], player->_py + poffset_y[lnd])) {
            newdir = lnd;
            if (PosOkPlayer(pnum, player->_px + poffset_x[newdir], player->_py + poffset_y[newdir]))
                return newdir;
            newdir = CheckDirs(newdir);
        } else {
            if (PosOkPlayer(pnum, player->_px + poffset_x[(newdir + 1) & 7], player->_py + poffset_y[(newdir + 1) & 7])
                && PosOkPlayer(pnum, player->_px + poffset_x[rnd], player->_py + poffset_y[rnd])) {
                newdir = rnd;
                if (PosOkPlayer(pnum, player->_px + poffset_x[newdir], player->_py + poffset_y[newdir]))
                    return newdir;
                newdir = CheckDirs(newdir);
            } else
                newdir = CheckDirs(newdir, wx + ox, wy + oy);
        }
    } else {
        if (!CheckCentre(newdir)) {
            switch (CheckSide(newdir)) {
            case 2:
                if (!PosOkPlayer(pnum, player->_px + poffset_x[(newdir + 1) & 7], player->_py + poffset_y[(newdir + 1) & 7])) {
                    if (CheckDirs(rnd) == -1)
                        newdir = lnd;
                }
                break;
            case 1:
                if (!PosOkPlayer(pnum, player->_px + poffset_x[(newdir - 1) & 7], player->_py + poffset_y[(newdir - 1) & 7])) {
                    if (CheckDirs(lnd) == -1)
                        newdir = rnd;
                }
                break;
            }
        }
    }
    return newdir;
}

/* --------------------------------------------------------------------- */
int GamePad::CheckBodge(int dir)
{
    int fx = player->_px + offset_x[dir];
    int fy = player->_py + offset_y[dir];
    struct map_info *dm = &dung_map[fx][fy];

    if (leveltype != 0 && (dm->dMonster > 0 || IsDplayer(fx, fy))) {
        int wx = player->WorldX + offset_x[dir];
        int wy = player->WorldY + offset_y[dir];
        player->_pdir = dir;
        if (!PosOkPlayer(pnum, wx >> 3, wy >> 3))
            return -1;
        return CheckDirs(dir);
    }

    switch (dir) {
    case 0:
    case 2:
    case 4:
    case 6:
        dir = CheckDiagBodge(dir);
        break;
    case 1:
    case 3:
    case 5:
    case 7:
        dir = CheckIsoBodge(dir);
        break;
    }
    return dir;
}

/* --------------------------------------------------------------------- */
void GamePad::walk(int cmd)
{
    int xv, yv, dir;

    if (player->_pInvincible && player->_pHitPoints == 0) {
        StartPlrKill(pnum, -1);
        return;
    }
    if (player->_pmode >= PM_ATTACK)
        return;
    if (spell.Active())
        return;
    if (pad_up_button)
        return;

    dir = CheckBodge(cmd);
    struct PlayerStruct *plr2 = &plr[(char)(pnum ^ 1)];
    if (dir != -1 && player->plractive && plr2->plractive) {
        int wx = player->WorldX + offset_x[dir];
        int wy = player->WorldY + offset_y[dir];
        if (!ChkPlrOffsets(wx, wy, plr2->WorldX, plr2->WorldY))
            dir = -1;
    }
    if (dir == -1) {
        StartStand(pnum, cmd);
        return;
    }

    xv = offset_x[dir];
    yv = offset_y[dir];
    if (dir != player->_pdir || player->_pmode == PM_STAND) {
        NewPlrAnim(pnum, 8, player->_pWFrames, 0);
        player->_pVar8 = 0;
        player->_pVar3 = dir;
        PlrClrTrans(player->_px, player->_py);
        PlrDoTrans(player->_px, player->_py);
    }
    player->_pdir = dir;
    if (xv || yv) {
        player->_pmode = PM_WALK;
        player->_pVar1 = xv;
        player->_pVar2 = yv;
        ScrollInfo._sdx = player->_px - ViewX;
        ScrollInfo._sdy = player->_py - ViewY;
        if (svgamode) {
            if (abs(ScrollInfo._sdx) < 3 && abs(ScrollInfo._sdy) < 3) {
                if (dir - 3 > 0)
                    ScrollInfo._sdir = dir - 2;
                else
                    ScrollInfo._sdir = dir + 5;
            } else
                ScrollInfo._sdir = 0;
        } else {
            if (abs(ScrollInfo._sdx) < 2 && abs(ScrollInfo._sdy) < 2) {
                if (dir - 3 > 0)
                    ScrollInfo._sdir = dir - 2;
                else
                    ScrollInfo._sdir = dir + 5;
            } else
                ScrollInfo._sdir = 0;
        }
    }
}

/* --------------------------------------------------------------------- */
void GamePad::check_around_player(void)
{
    int x = player->_px;
    int y = player->_py;

    if (player->_pmode == PM_SPELL)
        return;
    if (spell.Active())
        return;

    _pcursmonst[sel_data] = -1;
    _pcursobj[sel_data] = -1;
    _pcursitem[sel_data] = -1;

    if (invflag) {
        _pcursitem[options_pad ^ 1] = -1;
        return;
    }

    if (pad_up_action == select_belt_item) {
        if (_pcurr_inv[sel_data] != -1) {
            struct ItemStruct *pi;

            _pcursinvitem[sel_data] = _pcurr_inv[sel_data];
            ClearPanel();
            pi = &player->SpdList[_pcurr_inv[sel_data]];
            strcpy(tempstr, MakeItemStr(pi, pi->_iIName, 0x100));
            strcpy(_infostr[sel_data], tempstr);
            _infoclr[sel_data] = 0;
            if (pi->_iMagical == 1)
                _infoclr[sel_data] = 1;
            else if (pi->_iMagical == 2)
                _infoclr[sel_data] = 3;
            return;
        }
        pad_up_action = 0;
    } else {
        _pcursinvitem[sel_data] = -1;
    }

    if (_pcurr_inv[sel_data] == -1 || player->SpdList[_pcurr_inv[sel_data]]._itype == -1)
        get_next_inv();

    if (_pcursinvitem[sel_data] == -1) {
        CheckArea(x, y, 6, 0, pnum);
        CheckPanelInfo();
        cursmx = player->_px;
        cursmy = player->_py;
        CheckTrigForce();
        cursmx = player->_px;
        cursmy = player->_py;
        CheckTown();
        cursmx = player->_px;
        cursmy = player->_py;
        CheckRportal();
    }
}

/* --------------------------------------------------------------------- */
void GamePad::show_combos(void)
{
    int y = 84;
    struct RECT crect;
    enum TXT_JUST J = pnum ? JustRight : JustLeft;

    if (!combo_menu_active || !await_combo || !(player->_pHitPoints >> 6) || demo_pad_time)
        return;
    if (seen_combo >= 0 && seen_combo != pnum)
        return;

    crect.x = 50;
    crect.y = 0;
    crect.w = 224;
    crect.h = 240;
    ClrDiabloMsg();
    PostGamePad(11, pnum, (int)txt_actions, 0);
    for (int i = 0; i < 14; i++) {
        if (button_combo[i]) {
            if (pnum)
                sprintf(tempstr, "%s - %c + %c", get_action_str(GetActionButton(button_combo[i]), 1),
                        pad_txt[get_key_pad(combo_key)].font_num,
                        pad_txt[get_key_pad(GetActionButton(button_combo[i]))].font_num);
            else
                sprintf(tempstr, "%c + %c - %s", pad_txt[get_key_pad(combo_key)].font_num,
                        pad_txt[get_key_pad(GetActionButton(button_combo[i]))].font_num,
                        get_action_str(GetActionButton(button_combo[i]), 1));
            MediumFont.Print(0, y, tempstr, J, &crect, WHITER, WHITEG, WHITEG);
            y += 16;
        }
    }
    seen_combo = pnum;
}

/* --------------------------------------------------------------------- */
/* case body order == retail layout */
void GamePad::ButtonDown(int button)
{
    switch (button) {
    case 0x40:
        if (pad_up_action == select_belt_item) {
            PlaySFX(0x33);
            pad_up_action = 0;
            allow_walking = 1;
            _SpdBeltSelFlag[pnum] = 0;
        } else if (sbookflag)
            CheckSBook();
        else if (questlog)
            QuestlogEnter();
        else if (chrflag)
            CheckChrBtns();
        else if (_spselflag[pnum]) {
            SetSpell(pnum);
            options_pad = -1;
        } else if (!(optionsflag | invflag))
            RunFunc(0x40);
        break;
    case 4:
        if (pad_up_action == select_belt_item) {
            PlaySFX(0x32);
            get_last_inv();
        } else
            RunFunc(4);
        break;
    case 8:
        if (pad_up_action == select_belt_item) {
            get_next_inv();
            PlaySFX(0x32);
        } else
            RunFunc(8);
        break;
    case 2:
        RunFunc(2);
        break;
    case 0x20:
        if (!PauseMode) {
            if (questlog)
                QuestlogESC();
            else {
                msgholdflag = 1;
                RunFunc(0x20);
            }
        }
        break;
    case 0x100:
        if (pad_up_action == select_belt_item) {
            PlaySFX(0x33);
            allow_walking = 1;
            pad_up_action = 0;
            _SpdBeltSelFlag[pnum] = 0;
            break;
        }
        if (select_flag) {
            select_flag = 0;
            break;
        }
        if (invflag | chrflag) {
            CloseInvChr();
            break;
        }
        if (questlog) {
            QuestlogESC();
            break;
        }
        if (sbookflag) {
            BOOL fromopt = Qfromoptions;
            sbookflag = 0;
            if (!fromopt) {
                PostGamePad(5, 0, 0, 0);
                options_pad = -1;
            }
            break;
        }
        if (optionsflag)
            break;
        if (_spselflag[pnum]) {
            PlaySFX(0x33);
            ToggleSpell(pnum);
            break;
        }
        /* fall through */
    case 1:
    case 0x80:
    case 0x200:
    case 0x400:
    case 0x800:
    case 0x1000:
    case 0x2000:
        RunFunc(button);
        break;
    }
}

/* --------------------------------------------------------------------- */
void GamePad::TestButtons(void)
{
    int hand = 1;
    int joydown;

    if (ignore_buttons) {
        ignore_buttons = 0;
        return;
    }
    if (GetFadeState())
        return;

    joydown = Pad->GetDown() & 0x3FFF;
    Pad->GetUp();

    while (hand) {
        if (pnum != myplr)
            return;
        if (pnum != sel_data)
            return;
        if (joydown & hand) {
            ButtonDown(hand);
            if (invflag | stextflag | qtextflag | sbookflag | questlog | optionsflag)
                return;
        }
        hand <<= 1;
    }
}

/* --------------------------------------------------------------------- */
char pad_UpIsUpRight(int pval, char other)
{
    int walk_dir;

    walk_dir = -1;
    /* case body order == retail layout; values from jtbl_80118A68 (index pval-1) */
    switch (pval) {
    case 5: walk_dir = 4; break;
    case 10: walk_dir = 0; break;
    case 6: walk_dir = 2; break;
    case 9: walk_dir = 6; break;
    case 4: walk_dir = 3; break;
    case 8: walk_dir = 7; break;
    case 2: walk_dir = 1; break;
    case 1: walk_dir = 5; break;
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
            GPad2.Handle();
            sel_data = 0;
            myplr = 0;
            GPad1.Handle();
        }
        myplr = omp;
        sel_data = oms;
        TSK_Sleep(1);
    }
}
