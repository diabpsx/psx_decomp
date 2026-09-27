/* CTRL.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the controller
 * configuration screen -- txt_actions[] (action text / pad button / combo button per line), the
 * Advanced/Beginner default tables, pad-driven line selection and button assignment, and its draw.
 * Header inlines (CPad getters/setters, Dialog ctor/dtor/SetRGB/SetBorder, CBlocks::GetOverlayOtBase)
 * are emitted out of line in this object (-fno-inline). */
#include "psxsrc/ctrl.h"

/* ---- TU-owned data (SYM STAT/EXT; %gp_rel in the oracle -> defined here) ---- */
static char ctrl_select_line;       /* .sbss */
static char ctrl_select_side;       /* .sbss */
static char ckeyheld;               /* .sbss */
static RECT CtrlRect;               /* .sbss */
unsigned char ctrlflag = 0;         /* .sdata -- names the _GLOBAL_ ctor/dtor thunks */
/* @0x800CC40C: text id, pad button mask, action handler, combo button mask (values from the retail image) */
KEY_ASSIGNS txt_actions[20] = {
    { 0x3BD, 0, NULL, 0 },
    { 0x3BC, 0, NULL, 0 },
    { 0x2A6, 0, NULL, 0 },
    { 0xC3, 1, NULL, 0 },
    { 0xC6, 0x2000, NULL, 0 },
    { 0x52C, 0, NULL, 0 },
    { 0x32, 0x40, (void (*)())pad_func_Attack, 0 },
    { 0x9, 0x80, (void (*)())pad_func_Action, 0 },
    { 0xA2, 0x200, (void (*)())pad_func_Cast_Spell, 0 },
    { 0x48D, 0, (void (*)())pad_func_Quick_Spell, 0x200 },
    { 0x3F3, 0x800, (void (*)())pad_func_SpellBook, 0 },
    { 0x33, 0, (void (*)())pad_func_AutoMap, 0x800 },
    { 0x33F, 0x400, (void (*)())pad_func_Quick_Use_Health, 0 },
    { 0x340, 0x1000, (void (*)())pad_func_Quick_Use_Mana, 0 },
    { 0x4AB, 0x100, (void (*)())pad_func_Use_Item, 0 },
    { 0x45, 0, (void (*)())pad_func_BeltList, 0x100 },
    { 0x21F, 0, (void (*)())pad_func_Inv, 0x80 },
    { 0xAE, 0, (void (*)())pad_func_Chr, 0x40 },
    { 0x3F7, 0, (void (*)())pad_func_SplBook, 0 },
    { 0x33B, 0, (void (*)())pad_func_QLog, 0 },
};
/* @0x800CC364: button name (sdata literals; "C" is shared by entries 0 and 3), pad bit, font glyph */
pad_assigns pad_txt[14] = {
    { "C", 0x40, 0x5F },
    { "S", 0x80, 0x3C },
    { "T", 0x200, 0x3E },
    { "C", 0x100, 0x24 },
    { "L1", 0x400, 0x7C },
    { "L2", 0x800, 0x7E },
    { "R1", 0x1000, 0x7F },
    { "R2", 0x2000, 0x1F },
    { "START", 0x10, 0 },
    { "SELECT", 0x20, 0 },
    { "UP", 0x1, 0 },
    { "DOWN", 0x2, 0 },
    { "LEFT", 0x4, 0 },
    { "RIGHT", 0x8, 0 },
};
static int toppos = 0;
static Dialog CtrlBack;             /* bss; constructed by _GLOBAL__I_ctrlflag */
static int AdvancedDefaults[20][2] = {
    { 0, 0 }, { 0, 0 }, { 1, 0 }, { 0, 0 }, { 0x2000, 0 }, { 0, 0 }, { 0x40, 0 }, { 0x100, 0 },
    { 0x200, 0 }, { 0, 0x200 }, { 0x800, 0 }, { 0, 0x800 }, { 0x400, 0 }, { 0x1000, 0 }, { 0x80, 0 },
    { 0, 0x40 }, { 0, 0x80 }, { 0, 0x100 }, { 0, 0x400 }, { 0, 0x1000 },
};
static int BeginnerDefaults[20][2] = {
    { 0, 0 }, { 0, 0 }, { 1, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 }, { 0x40, 0 }, { 0x100, 0 },
    { 0x200, 0 }, { 0x80, 0 }, { 0x800, 0 }, { 0x2000, 0 }, { 0x400, 0 }, { 0x1000, 0 }, { 0, 0 },
    { 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
};
static BOOL waitnomore = 0;

/* @0x8009C548 CTRL.CPP:304 */
void SetDemoKeys(int *buffer)
{
    KEY_ASSIGNS *ta = txt_actions;

    PostGamePad(0xB, 0, (int)ta, 0);
    ta += 6;
    for (int i = 0; i < 4; i++) {
        *buffer++ = ta->pad_val;
        *buffer++ = ta->combo_val;
        ta++;
    }
    ta -= 4;
    ta->pad_val = 0x40;
    ta->combo_val = 0;
    ta++;
    ta->pad_val = 0x80;
    ta->combo_val = 0;
    ta++;
    ta->pad_val = 0x200;
    ta->combo_val = 0;
    ta++;
    ta->pad_val = 0x100;
    ta->combo_val = 0;
    PostGamePad(9, 0, (int)txt_actions, 0);
}

/* @0x8009C620 CTRL.CPP:324 */
void RestoreDemoKeys(int *buffer)
{
    KEY_ASSIGNS *ta = txt_actions;

    PostGamePad(0xB, 0, (int)ta, 0);
    ta += 6;
    for (int i = 0; i < 4; i++) {
        ta->pad_val = *buffer++;
        ta->combo_val = *buffer++;
        ta++;
    }
    PostGamePad(9, 0, (int)txt_actions, 0);
}

/* @0x8009C6B0 CTRL.CPP:338 */
char *get_action_str(int pval, int combo)
{
    KEY_ASSIGNS *ac = txt_actions;

    for (int i = 0; i < 20; i++) {
        if ((combo ? ac->combo_val : ac->pad_val) - pval == 0)   /* `== pval` gets the compare distributed into both arms by fold */
            return GetStr(ac->txt);
        ac++;
    }
    return NULL;
}

/* @0x8009C728 CTRL.CPP:360 */
int get_key_pad(int n)
{
    int i;
    pad_assigns *pa = pad_txt;

    for (i = 0; i < 14; i++) {
        if (pa->pnum == n)
            return i;
        pa++;
    }
    return -1;
}

/* @0x8009C760 CTRL.CPP:375 */
static BOOL checkvalid(void)
{
    int start = 6;
    int end = 8;
    KEY_ASSIGNS *ta = txt_actions;

    for (int i = 0; i < 20; i++) {
        if (i >= start && i <= end && !ta->pad_val && !ta->combo_val)
            return false;
        ta++;
    }
    return true;
}

/* @0x8009C7C4 CTRL.CPP:396 */
BOOL RemoveCtrlScreen(void)
{
    if (!checkvalid())
        return false;
    PostGamePad(9, options_pad, (int)txt_actions, 0);
    ctrlflag = 0;
    ctrl_select_line = 0;
    cmenu = 0;
    return true;
}

/* @0x8009C820 CTRL.CPP:413 */
static unsigned char Init_ctrl_pos(void)
{
    if (!ctrlflag) {
        if (FeFlag)
            options_pad = they_pressed;
        ctrl_select_side = 0;
        ckeyheld = 0;
        toppos = 0;
        CtrlBack.SetBorder(0x12);
        CtrlBack.SetRGB(BORDERR, BORDERG, BORDERB);
        ctrl_select_line = 0;
        ctrlflag = 1;
        PostGamePad(0xB, options_pad, (int)txt_actions, 0);
    }
    return 1;
}

/* @0x8009C8D8 CTRL.CPP:434 */
static int remove_padval(int p)
{
    for (int i = 0; i < 20; i++) {
        if (txt_actions[i].pad_val == p) {
            txt_actions[i].pad_val = 0;
            return i;
        }
    }
    return -1;
}

/* @0x8009C918 CTRL.CPP:450 */
static int remove_comboval(int p, BOOL all)
{
    int n = -1;

    for (int i = 0; i < 20; i++) {
        if (txt_actions[i].combo_val == p || all) {
            txt_actions[i].combo_val = 0;
            n = -1;
        }
    }
    return n;
}

/* @0x8009C960 CTRL.CPP:468 */
static unsigned char set_buttons(int cline, int n)
{
    KEY_ASSIGNS *ta = &txt_actions[cline];
    int cval = n & txt_actions[4].pad_val;
    int i;
    int p;

    if (n & ~txt_actions[4].pad_val)
        p = ta->pad_val;
    else
        p = ta->combo_val;
    if (cval == n && ta->txt != 0xC6)
        return 0;
    if (!ckeyheld) {
        if (ta->pad_val == n) {
            ta->pad_val = 0;
            return 1;
        }
        i = remove_padval(n);
        ta->pad_val = n;
        if (i != -1)
            txt_actions[i].pad_val = p;
        ta->combo_val = 0;
        if (cline == 4)
            remove_comboval(n, 0);
    } else {
        waitnomore = 1;
        if (ta->combo_val == n) {
            ta->combo_val = 0;
            return 1;
        }
        i = remove_comboval(n, 0);
        if (n != txt_actions[4].pad_val)
            ta->combo_val = n;
        ta->pad_val = 0;
        if (i != -1)
            txt_actions[i].combo_val = p;
    }
    if (!txt_actions[4].pad_val)
        remove_comboval(0, 1);
    return 1;
}

/* @0x8009CAD8 CTRL.CPP:521 */
void restore_controller_settings(CTRL_SET s)
{
    KEY_ASSIGNS *ta = txt_actions;

    switch (s) {
    case CTRL_BEGINNER:
        for (int i = 0; i < 20; i++) {
            ta->pad_val = BeginnerDefaults[i][0];
            ta->combo_val = BeginnerDefaults[i][1];
            ta++;
        }
        break;
    case CTRL_ADVANCED:
        for (int i = 0; i < 20; i++) {
            ta->pad_val = AdvancedDefaults[i][0];
            ta->combo_val = AdvancedDefaults[i][1];
            ta++;
        }
        break;
    }
}

/* @0x8009CB7C CTRL.CPP:551 */
static BOOL only_one_button(int p)
{
    int hand = 1;
    int count = 0;

    while (hand) {
        if (hand & p)
            count++;
        hand <<= 1;
    }
    return count < 2;
}

/* @0x8009CBA8 CTRL.CPP:587 */
static unsigned char main_ctrl_setup(void)
{
    CPad *Pad = PAD_GetPad(options_pad, 0);
    int lv;

    if (FeFlag)
        Pad->SetPadTick(8);
    else
        Pad->SetPadTick(5);
    Pad->SetPadTickMask(3);
    lv = Pad->GetCur() & txt_actions[4].pad_val;
    if (!txt_actions[4].pad_val) {
        waitnomore = 0;
        ckeyheld = 0;
    }
    if (lv) {
        ckeyheld = 1;
    } else if (Pad->GetUp() & txt_actions[4].pad_val) {
        ckeyheld = 0;
        waitnomore = 0;
    }
    if (Pad->GetTick() & 1) {
        PlaySFX(0x32);
        ctrl_select_line--;
        if (txt_actions[ctrl_select_line].txt == 0x52C) {
            ctrl_select_line--;
            if (ctrl_select_line >= 5)
                toppos--;
        }
        if (ctrl_select_line < 0)
            ctrl_select_line += 20;
        if (toppos)
            toppos--;
        if (ctrl_select_line == 19)
            toppos = 16;
    }
    if (Pad->GetTick() & 2) {
        PlaySFX(0x32);
        ctrl_select_line = (char)(ctrl_select_line + 1) % 20;
        if (txt_actions[ctrl_select_line].txt == 0x52C) {
            ctrl_select_line++;
            if (ctrl_select_line >= 5)
                toppos++;
        }
        if (ctrl_select_line >= 5)
            toppos++;
        else if (ctrl_select_line == 0)
            toppos = 0;
    }
    if ((Pad->GetDown() & 0x100) && !ctrl_select_side) {
        if (!RemoveCtrlScreen()) {
            PlaySFX(0x3D3);
            return 1;
        }
        PlaySFX(0x33);
        return 0;
    }
    if (Pad->GetDown() & 4) {
        if (txt_actions[ctrl_select_line].txt == 0xC3 || txt_actions[ctrl_select_line].txt == 0x2A6) {
            txt_actions[ctrl_select_line].pad_val ^= 1;
            PlaySFX(0x33);
            return 1;
        }
        if (txt_actions[ctrl_select_line].txt == 0x3BC)
            return 1;
        if (txt_actions[ctrl_select_line].txt == 0x3BD)
            return 1;
        PlaySFX(0x32);
        if (ctrl_select_side)
            ctrl_select_side = 0;
    }
    if (Pad->GetDown() & 8) {
        if (txt_actions[ctrl_select_line].txt == 0xC3 || txt_actions[ctrl_select_line].txt == 0x2A6) {
            txt_actions[ctrl_select_line].pad_val ^= 1;
            PlaySFX(0x33);
            return 1;
        }
        if (txt_actions[ctrl_select_line].txt == 0x3BC)
            return 1;
        if (txt_actions[ctrl_select_line].txt == 0x3BD)
            return 1;
        PlaySFX(0x32);
        if (!ctrl_select_side)
            ctrl_select_side = 1;
    }
    if (Pad->GetDown() & 0x40) {
        if (txt_actions[ctrl_select_line].txt == 0x3BC) {
            PlaySFX(0x33);
            restore_controller_settings(CTRL_ADVANCED);
            return 1;
        }
        if (txt_actions[ctrl_select_line].txt == 0x3BD) {
            PlaySFX(0x33);
            restore_controller_settings(CTRL_BEGINNER);
            return 1;
        }
    }
    if (ctrl_select_line < 4)
        ctrl_select_side = 0;
    if (ctrl_select_side && ctrl_select_line >= 2 && ctrlflag) {
        lv = Pad->GetDown() & 0x3FC0;
        if (lv && only_one_button(lv)) {
            if (set_buttons(ctrl_select_line, lv))
                PlaySFX(0x33);
        }
    }
    return 1;
}

/* @0x8009D084 CTRL.CPP:793 */
static void PrintCtrlString(int x, int y, unsigned char cjustflag, int str_num, char col)
{
    KEY_ASSIGNS *ta = &txt_actions[str_num];
    int i;
    unsigned char r = 0;
    unsigned char g = 0;
    unsigned char b = 0;
    int str = ta->txt;
    int len;

    if (y < 24 || y > 154)
        return;
    switch (col) {
    case 0:
        r = WHITER;
        g = WHITEG;
        b = WHITEB;
        break;
    case 1:
        r = BLUER;
        g = BLUEG;
        b = BLUEB;
        break;
    case 2:
        r = REDR;
        g = REDG;
        b = REDB;
        break;
    case 3:
        r = GOLDR;
        g = GOLDG;
        b = GOLDB;
        break;
    }
    y -= 4;
    strcpy(tempstr, GetStr(str));
    len = MediumFont.GetStrWidth(tempstr);
    MediumFont.Print(6, y, tempstr, JustLeft, &CtrlRect, r, g, b);
    if (str == 0x2A6) {
        i = ta->pad_val;
        strcpy(tempstr, i ? GetStr(4) : GetStr(0x358));
    } else if (str == 0xC3) {
        i = ta->pad_val;
        strcpy(tempstr, i ? GetStr(0xC5) : GetStr(0xC4));
    } else {
        tempstr[0] = 0;
        if (str != 0xC6 && !waitnomore && txt_actions[4].pad_val && ctrl_select_side == 1 && str_num == ctrl_select_line && ckeyheld)
            sprintf(tempstr, "%c +", pad_txt[get_key_pad(txt_actions[4].pad_val)].font_num);
        else if (txt_actions[4].pad_val && ta->combo_val)
            sprintf(tempstr, "%c + %c", pad_txt[get_key_pad(txt_actions[4].pad_val)].font_num, pad_txt[get_key_pad(ta->combo_val)].font_num);
        else if (str_num && ta->pad_val) {
            if (pad_txt[get_key_pad(ta->pad_val)].font_num)
                sprintf(tempstr, "%c", pad_txt[get_key_pad(ta->pad_val)].font_num);
        } else if (str != 0x3BC && str != 0x3BD && str != 0x52C)
            sprintf(tempstr, GetStr(0x103));
    }
    if (str_num == ctrl_select_line) {
        int x1;
        int x2;
        int nlen = MediumFont.GetStrWidth(tempstr);
        int otpos;
        if (ctrl_select_side == 1) {
            x1 = 0x126;
            x2 = 0x118 - nlen;
        } else {
            x1 = 0x13;
            x2 = len + 0x18;
        }
        otpos = CBlocks::GetOverlayOtBase();
        otpos += 4;
        DrawSpinner(x1 - 4, y + 0x32, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, otpos, 1, 0, 8);
        DrawSpinner(x2, y + 0x32, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, otpos, 1, 0, 8);
    }
    strcat(tempstr, "   ");
    MediumFont.Print(0, y, tempstr, JustRight, &CtrlRect, r, g, b);
}

/* @0x8009D5D8 CTRL.CPP:918 */
void DrawCtrlSetup(void)
{
    int i;
    int pnum;

    if (!Init_ctrl_pos())
        return;
    if (!ctrlflag)
        return;
    if (!_spselflag[options_pad]) {
        int otpos = CBlocks::GetOverlayOtBase();
        int oldDot = CtrlBack.SetOTpos(otpos);
        int OldPrintOT;
        if (!main_ctrl_setup())
            return;
        OldPrintOT = MediumFont.SetOTpos(otpos + 1);
        CtrlBack.SetBorder(0x12);
        CtrlBack.SetRGB(BORDERR, BORDERG, BORDERB);
        if (FeFlag) {
            LargeFont.Print(0, 0x2E, GetStr(0xCB), JustCentre, NULL, BLUER, BLUEG, BLUEB);
        } else {
            buttoncol = 0;
            setRECT(&CtrlRect, 0x10, 0x20, 0x119, 0x10);
            CtrlBack.Back(0x10, 0x20, 0x119, 0x10);
            MediumFont.Print(0, 0xB, GetStr(0xCB), JustCentre, &CtrlRect, GOLDR, GOLDG, GOLDB);
        }
        CtrlBack.Back(0x10, 0x34, 0x119, 0x9A);
        buttoncol = 1;
        for (i = 0; i < 20; i++) {
            setRECT(&CtrlRect, 0x10, 0x34, 0x119, 0x9A);
            strcpy(tempstr, FeFlag ? (!options_pad ? GetStr(0x312) : GetStr(0x313)) : plr[pnum = options_pad]._pName);
            MediumFont.Print(0, 0xC, tempstr, JustCentre, &CtrlRect, BLUER, BLUEG, BLUEB);
            if (i == ctrl_select_line)
                PrintCtrlString(0, (i - toppos) * 16 + 0x20, 1, i, 3);
            else
                PrintCtrlString(0, (i - toppos) * 16 + 0x20, 1, i, 0);
        }
        if (!ctrl_select_side) {
            if (ctrl_select_line < 2)
                PrintSelectBack(0x4E6);
            else
                PrintSelectBack(0x4A0);
        } else {
            int lena;
            int len;
            sprintf(tempstr, GetStr(0x32D), "  ");
            lena = MediumFont.GetStrWidth(tempstr);
            len = lena + MediumFont.GetStrWidth(GetStr(txt_actions[ctrl_select_line].txt));
            MediumFont.Print((256 - len) / 2 + 0x20, 0xE0, tempstr, JustLeft, NULL, WHITER, WHITEG, WHITEB);
            MediumFont.Print((256 - len) / 2 + 0x20 + lena, 0xE0, GetStr(txt_actions[ctrl_select_line].txt), JustLeft, NULL, GOLDR, GOLDG, GOLDB);
        }
        buttoncol = 0;
        CtrlBack.SetOTpos(oldDot);
        MediumFont.SetOTpos(OldPrintOT);
    }
}
