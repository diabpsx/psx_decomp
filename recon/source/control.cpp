/* SOURCE/CONTROL.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/CONTROL.CPP.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PARTIAL TU (throughput-first pass): the small getters/setters + 4 header-inline classes
 * (CPad/Dialog/TextDat/CBlocks out-of-line -fno-inline copies) below are done; the big GUI/blit
 * functions (DrawSpellCel, DrawSpellList, CheckPanelInfo, PrintInfo, DrawInfoBox, MY_PlrStringXY,
 * BuildChr, DrawChr, PrintSBookStr, DrawSpellBook, CPrintString, InitControlPan, ToggleSpell,
 * SetSpell, AddPanelString, ChrCheckValidButton, CheckChrBtns, DrawArrows, DrawPlus,
 * ADD_PlrStringXY, DrawChrTSK, DrawSpellBookTSK, DrawSpeedSpellTSK, the DrawLevelUpFlag static
 * ctor/dtor thunks) are NOT yet reconstructed here -- still INCLUDE_ASM in skel/, open per the
 * final report. */
#include "diabpsx_types.h"
#include "source/gen/structs_control.h"
#include "source/gen/externs_control.h"
#include "source/gen/protos_control.h"
#include "source/diablo.h"

/* TU-owned STAT globals (tentative definitions -> gp-rel like retail) */
int SPLICONY;
int SPLICONRIGHT;
int lus;
char plusanim;
int _pnumlines[2];
int CS_XOFF;
int CsNo;
unsigned char CrossCount[2];
unsigned char chrbtnactive;
unsigned char chrflag;
unsigned char sbookflag;
unsigned char chrbtn[2][4];
int scx1;
int scy1;
int scx2;
int scy2;
long talkofs;
char sgszTalkMsg[80];
unsigned char sgbPlrTalkTbl[2];
unsigned char talkbtndown[3];
unsigned char dropGoldFlag;
unsigned char drawhpflag;
unsigned char drawmanaflag;
unsigned char panbtndown;
unsigned char panelflag;
unsigned char lvlbtndown;
unsigned char talkflag;
int dropGoldValue;
int initialDropGoldValue;
int initialDropGoldIndex;
int _pSpell[2];
int _pSplType[2];
int my_cur_spel[2];
int sbooktab;
int cur_spel[2];
TASK *_spselflag[2];
char _panelstr[2][10][64];
int _pstrjust[2][10];
unsigned char *pMultiBtns;
unsigned char *pTalkBtns;
char SpellCol;
struct RECT *InfoBoxRect;
unsigned char *pManaBuff;
unsigned char *pLifeBuff;
unsigned char *pPanelText;
unsigned char *pChrPanel;
unsigned char *pSpellCels;
unsigned char *pPanelButtons;
unsigned char *pChrButtons;
unsigned char *pDurIcons;
unsigned char *pSpellBkCel;
unsigned char *pSBkBtnCel;
unsigned char *pSBkIconCels;
unsigned char *pGBoxBuff;

extern "C" void func_80161F58(void);

/* ---- CPad / Dialog / TextDat / CBlocks header-inline methods (out-of-line copies compiled
 * into this TU, -fno-inline; bodies identical to their declaring headers) ---- */
Dialog::Dialog()
{
    BackGfx = 0x94;
    BevelGfx = 0x1A;
    BorderGfx = 0x1A;
    DialogRed = 0x80;
    DialogGreen = 0x80;
    DialogBlue = 0x80;
    DialogTRed = 0x20;
    DialogTGreen = 0x20;
    DialogTBlue = 0x20;
    DialogOTpos = CBlocks::GetOverlayOtBase();
}

Dialog::~Dialog()
{
}

void Dialog::SetRGB(unsigned char R, unsigned char G, unsigned char B)
{
    DialogRed = R;
    DialogGreen = G;
    DialogBlue = B;
}

short TrimCol(short col)
{
    if (col < 0)
        col = 0;
    if (col >= 256)
        col = 255;
    return col;
}

void SetSpellTrans(char t)
{
    SpellCol = t;
}

void ClearPanel(void)
{
    _pnumlines[sel_data] = 0;
    _pinfoflag[sel_data] = 0;
}

void InitPanelStr(void)
{
    ClearPanel();
}

void DrawCtrlPan(void)
{
    sel_data = 0;
    DrawInfoBox(InfoBoxRect);
}

void DoAutoMap(void)
{
    if (currlevel == 0) {
        InitDiabloMsg(1);
    } else {
        if (automapflag == 0)
            func_80161F58();
        else
            automapflag = 0;
    }
}

void FreeControlPan(void)
{
    MemFreeDbg(pManaBuff);
    MemFreeDbg(pLifeBuff);
    MemFreeDbg(pPanelText);
    MemFreeDbg(pChrPanel);
    MemFreeDbg(pSpellCels);
    MemFreeDbg(pPanelButtons);
    MemFreeDbg(pMultiBtns);
    MemFreeDbg(pTalkBtns);
    MemFreeDbg(pChrButtons);
    MemFreeDbg(pDurIcons);
    MemFreeDbg(pQLogCel);
    MemFreeDbg(pSpellBkCel);
    MemFreeDbg(pSBkBtnCel);
    MemFreeDbg(pSBkIconCels);
    MemFreeDbg(pGBoxBuff);
}

char *get_pieces_str(int nGold)
{
    if (nGold == 1)
        return GetStr(0x30A);
    return GetStr(0x309);
}

static int *pDurIconTbl = D_801110FC;

void ToggleSpell(int pnum)
{
    DEF_ARGS *args;

    if (_spselflag[pnum] != 0) {
        TSK_Kill(_spselflag[pnum]);
        _spselflag[pnum] = 0;
        PostGamePad(pnum + 6, 0, 0, 0);
    } else {
        PostGamePad(pnum + 3, 0, 0, 0);
        GLUE_SetShowPanelFlag(1);
        _spselflag[pnum] = TSK_AddTask(0, (void (*)())DrawSpeedSpellTSK, 0x800, sizeof(DEF_ARGS));
        args = (DEF_ARGS *)_spselflag[pnum]->Data;
        args->a0 = pnum;
    }
}

int DrawDurIcon4Item(const ItemStruct *pItem, int x, int c)
{
    int v;

    if (pItem->_itype == -1)
        return x;
    if (pItem->_iDurability >= 6)
        return x;
    v = x - 40;
    if (!c && pItem->_iClass == 1) {
        if ((unsigned short)(pItem->_itype - 1) < 10)
            (void)pDurIconTbl[pItem->_itype - 1];   /* retail loads then discards it (dead) */
    }
    return v;
}

void SetSpell(int pnum)
{
    RemoveTargetCursor(pnum);
    ToggleSpell(pnum);
    PlaySFX(0x33);
    if (_pSpell[sel_data] != -1) {
        my_cur_spel[pnum] = spelldata[_pSpell[pnum]].sName;
        ClearPanel();
        plr[pnum]._pRSpell = _pSpell[pnum];
        plr[pnum]._pRSplType = _pSplType[pnum];
        force_redraw = 0xFF;
    }
}

void AddPanelString(const char *str, int just)
{
    if (str[0] != 0) {
        strcpy(&_panelstr[sel_data][_pnumlines[sel_data]][0], str);
        _pstrjust[sel_data][_pnumlines[sel_data]] = just;
        if (_pnumlines[sel_data] < 10)
            _pnumlines[sel_data]++;
    }
}

char GetSBookTrans(int ii, unsigned char townok)
{
    char st;

    st = 1;
    if ((plr[myplr]._pISpells >> (ii - 1)) & 1)
        st = 3;
    if (plr[myplr]._pAblSpells & (1 << (ii - 1)))   /* missing (__int64) cast -- PSX predates the devilution bugfix */
        st = 0;
    if (st == 1) {
        if (!CheckSpell(myplr, ii, 1, 1))
            st = 4;
        if ((char)(plr[myplr]._pSplLvl[ii] + plr[myplr]._pISplLvlAdd) <= 0)
            st = 4;
    }
    if (currlevel == 0 && ii == 0x20 && plr[0].plractive && plr[1].plractive)
        st = 4;
    if (townok && currlevel == 0 && st != 4 && !spelldata[ii].sTownSpell)
        st = 4;
    return st;
}

void CheckSBook(void)
{
    int cspel;
    unsigned long long spl;
    unsigned long tspls;
    char st;

    RemoveTargetCursor(options_pad);
    cspel = SpellPages[sbooktab][cur_spel[options_pad]];
    spl = plr[options_pad]._pMemSpells | plr[options_pad]._pISpells | plr[options_pad]._pAblSpells;
    tspls = (unsigned long)(spl >> (cspel - 1));
    if (cspel != -1 && (tspls & 1)) {
        my_cur_spel[options_pad] = cspel;
        st = 1;
        if (plr[options_pad]._pISpells & (1 << (cspel - 1)))
            st = 3;
        if (plr[options_pad]._pAblSpells & (1 << (cspel - 1)))
            st = 0;
        plr[options_pad]._pRSpell = cspel;
        plr[options_pad]._pRSplType = st;
        PlaySFX(0x33);
    }
}

void DrawArrows(void)
{
    TextDat *ThisDat;
    POLY_FT4 *Ft4;
    unsigned char flip;
    int OtPos;
    int x;
    int code;

    ThisDat = GM_UseTexData(0);
    OtPos = CBlocks::GetMaxOtPos() - 4;
    flip = 1;
    x = 0x11E;
    if (CS_XOFF) {
        flip = 0;
        x = 0x1C;
    }
    Ft4 = ThisDat->PrintFt4(0x7E, x, 0xCA, flip, OtPos, 0);
    Ft4->r0 = GOLDR;
    Ft4->g0 = GOLDG;
    code = Ft4->code & 0xFC;
    Ft4->b0 = GOLDB;
    Ft4->code = code;

    Ft4 = ThisDat->PrintFt4(0x7E, x | 1, 0xCB, flip, OtPos, 0);
    Ft4->r0 = 0;
    Ft4->g0 = 0;
    Ft4->b0 = 0;
    Ft4->code = (Ft4->code | 2) & ~1;
}

void ADD_PlrStringXY(const char *pszStr, char col)
{
    CSDATA *ptr;

    ptr = &CS_Tab[CsNo];
    strcpy(ptr->String, pszStr);
    ptr->col = col;
    CsNo = CsNo + 1;
    if (CS_Tab[CsNo].w == 0) {
        CS_Tab[CsNo].String[0] = 0;
        CsNo++;
    }
}

void DrawPlus(int n, int pnum)
{
    int otpos;
    TextDat *ThisDat;
    POLY_FT4 *Ft4;
    int x, y;
    int frm;

    ThisDat = GM_UseTexData(0);
    otpos = CBlocks::GetOverlayOtBase() + 4;
    if (n == 4) {
        CrossCount[pnum]++;
        if (CrossCount[pnum] & 1) {
            if (pnum == 0) {
                frm = ((unsigned)VID_GetTick() >> 3 & 3) + 1;
                x = 0x19;
            } else {
                frm = ((unsigned)VID_GetTick() >> 3 & 3) + 1;
                x = 0x127;
            }
            Ft4 = ThisDat->PrintFt4(frm, x, 0x64, 0, otpos, 0);
            Ft4->r0 = 0xA0;
            Ft4->g0 = 0xA0;
            Ft4->b0 = 0xA0;
            Ft4->code = (Ft4->code | 2) & ~1;
        }
    } else {
        chrbtnactive = 1;
        x = CS_Tab[n + 20].x + 0x42 + CS_XOFF;
        y = CS_Tab[n + 20].y + 0x22;
        Ft4 = ThisDat->PrintFt4(0x83, x, y, 0, otpos, 0);
        if (lus == n) {
            Ft4->r0 = 0x80;
            Ft4->g0 = 0x80;
            Ft4->b0 = 0x80;
        } else {
            Ft4->r0 = 0x20;
            Ft4->g0 = 0x20;
            Ft4->b0 = 0x20;
        }
        Ft4->code &= 0xFC;
    }
}

void DrawChrTSK(TASK *T)
{
    int omp;

    GLUE_SetHomingScrollFlag(0);
    GLUE_SetShowGameScreenFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SuspendGame();
    stream_pause();
    PostGamePad(2, 0, 0, 0);
    omp = myplr;
    myplr = options_pad;
    TSK_Sleep(2);
    goto test;
    for (;;) {
        if (options_pad >= 0) {
            DrawChr();
            TSK_Sleep(1);
test:
            if (chrflag)
                continue;
        }
        break;
    }
    myplr = omp;
    PostGamePad(5, 0, 0, 0);
    PauseMode = 1;
    TSK_Sleep(2);
    PauseMode = 0;
    stream_resume();
    GLUE_ResumeGame();
    GLUE_SetShowPanelFlag(1);
    GLUE_SetShowGameScreenFlag(1);
    GLUE_SetHomingScrollFlag(1);
}

void DrawSpeedSpellTSK(TASK *T)
{
    DEF_ARGS *args;
    int pnum;
    BOOL alive;
    int old_opts;

    alive = 1;
    args = (DEF_ARGS *)T->Data;
    pnum = args->a0;
    TSK_Sleep(1);
    for (;;) {
        if (!alive)
            break;
        if (GLUE_Finished())
            break;
        old_opts = options_pad;
        options_pad = pnum;
        if ((sbookflag | questlog | invflag | chrflag | SelectorActive()) == 0) {
            PostGamePad(pnum + 3, 0, 0, 0);
            DrawSpellList();
        }
        options_pad = old_opts;
        TSK_Sleep(1);
        if (!plr[pnum].plractive)
            alive = 0;
    }
    _spselflag[pnum] = 0;
}

void DrawSpellBookTSK(TASK *T)
{
    int CountDown;
    int omp;

    CountDown = 3;
    if (!Qfromoptions) {
        PostGamePad(2, 0, 0, 0);
        stream_stop();
        GLUE_SuspendGame();
    }
    stream_pause();
    if (!Qfromoptions) {
        for (int i = 1; i != -1; i--) {
            ignore_buttons = 1;
            TSK_Sleep(1);
        }
    }
    while (1) {
        if (!sbookflag)
            break;
        if (options_pad < 0)
            break;
        omp = myplr;
        myplr = options_pad;
        DrawSpellBook((unsigned)CountDown < 1);
        if (CountDown != 0)
            CountDown--;
        myplr = omp;
        TSK_Sleep(1);
    }
    PlaySFX(0x33);
    if (!Qfromoptions) {
        PostGamePad(5, 0, 0, 0);
        stream_resume();
        GLUE_ResumeGame();
        GLUE_SetShowPanelFlag(1);
        GLUE_SetShowGameScreenFlag(1);
        GLUE_SetHomingScrollFlag(1);
    } else {
        GLUE_SetShowGameScreenFlag(1);
        TSK_Sleep(1);
        Qfromoptions = 4;
        ToggleOptions();
    }
}

void PrintSBookStr(int x, int y, int cspel, const char *pszStr, unsigned char bright, unsigned char Staff)
{
    unsigned char r, g, b;

    y = y + 2;
    if (plr[options_pad]._pRSplType == 2)
        cspel = -1;

    if (LANG_GetLang() == 4) {
        if (cspel == my_cur_spel[options_pad]) {
            if (bright == 0x80) {
                r = 0xC8;
                g = 0;
                b = 0;
            } else {
                r = GOLDR;
                g = GOLDG;
                b = 0;
            }
        } else {
            if (bright != 0x80) {
                r = GOLDR;
                g = GOLDG;
                b = 0;
            } else {
                g = 0x80;
                r = 0x80;
                b = 0x80;
            }
        }
    } else {
        if (cspel == my_cur_spel[options_pad]) {
            if (Staff != 0) {
                r = ((int)WHITER * bright) >> 8;
                g = ((int)WHITEG * bright) >> 2;
                b = 0;
            } else {
                r = ((int)REDR * bright) >> 8;
                g = ((int)REDG * bright) >> 8;
                b = ((int)REDB * bright) >> 8;
            }
        } else {
            if (Staff != 0) {
                r = ((int)WHITER * bright) >> 8;
                g = ((int)WHITEG * bright) >> 1;
                b = 0;
            } else {
                r = ((int)WHITER * bright) >> 8;
                g = ((int)WHITEG * bright) >> 8;
                b = ((int)WHITEB * bright) >> 8;
            }
        }
    }
    MediumFont.Print(x, y, (char *)pszStr, TXT_LEFT, &CSRect, r, g, b);
}

void ChrCheckValidButton(int move)
{
    int i;
    int pc;
    int count;

    lus = lus + move;
    pc = plr[options_pad]._pClass;
    for (i = 0; i < 4; i++) {
        switch (i) {
        case 0:
            chrbtn[options_pad][0] = (plr[options_pad]._pBaseStr == MaxStats[pc][0]);
            break;
        case 1:
            chrbtn[options_pad][1] = (plr[options_pad]._pBaseMag == MaxStats[pc][1]);
            break;
        case 2:
            chrbtn[options_pad][2] = (plr[options_pad]._pBaseDex == MaxStats[pc][2]);
            break;
        case 3:
            chrbtn[options_pad][3] = (plr[options_pad]._pBaseVit == MaxStats[pc][3]);
            break;
        }
    }
    if (move == 0)
        move = -1;
    if (lus < 0)
        lus = 3;
    if (lus >= 4)
        lus = 0;
    if (chrbtn[myplr][lus] != 0) {
        for (count = 0; count < 4; count++) {
            lus = lus + move;
            if (lus < 0)
                lus = 3;
            if (lus >= 4)
                lus = 0;
            if (chrbtn[myplr][lus] == 0)
                break;
        }
    }
}

void CheckChrBtns(void)
{
    int pc;

    if (CS_XOFF != 0x140)
        return;
    if (!chrbtnactive)
        return;
    if (plr[options_pad]._pStatPts == 0)
        return;

    ChrCheckValidButton(0);
    if (chrbtn[myplr][lus] == 0) {
        PlaySFX(0x33);
        plr[options_pad]._pStatPts--;
    }
    pc = plr[options_pad]._pClass;
    if (lus == 1) {
        NetSendCmdParam1(1, 4, 1);
        chrbtn[options_pad][lus] = (plr[options_pad]._pBaseMag == MaxStats[pc][lus]);
    } else if (lus == 0) {
        NetSendCmdParam1(1, 3, 1);
        chrbtn[options_pad][lus] = (plr[options_pad]._pBaseStr == MaxStats[pc][lus]);
    } else if (lus == 2) {
        NetSendCmdParam1(1, 5, 1);
        chrbtn[options_pad][lus] = (plr[options_pad]._pBaseDex == MaxStats[pc][lus]);
    } else {
        NetSendCmdParam1(1, 6, 1);
        chrbtn[options_pad][lus] = (plr[options_pad]._pBaseVit == MaxStats[pc][lus]);
    }
    ChrCheckValidButton(0);
    BuildChr();
}

static void CPrintString(int No, char *pszStr, int Just)
{
    unsigned char R, G, B;
    TXT_JUST Justify;

    Justify = (TXT_JUST)Just;
    switch (_infoclr[sel_data]) {
    case 0:
        R = WHITER;
        G = WHITEG;
        B = WHITEB;
        break;
    case 1:
        R = BLUER;
        G = BLUEG;
        B = BLUEB;
        break;
    case 2:
        R = REDR;
        G = REDG;
        B = REDB;
        break;
    default:
        R = GOLDR;
        G = GOLDG;
        B = GOLDB;
        break;
    }
    MediumFont.Print(0, No * 13 + 10, pszStr, Justify, InfoBoxRect, R, G, B);
}

void InitControlPan(void)
{
    int i;
    char *str;
    int cnt;
    unsigned char *p;
    unsigned char v;

    scx1 = 0;
    scy1 = 0;
    scx2 = 0;
    scy2 = 0;
    pManaBuff = 0;
    pLifeBuff = 0;
    pPanelText = LoadFileInMem("CtrlPan\SmalText.CEL", 0);
    pChrPanel = LoadFileInMem("Data\Char.CEL", 0);
    pSpellCels = LoadFileInMem("CtrlPan\SpelIcon.CEL", 0);
    SetSpellTrans(0);
    talkflag = 0;
    if (gbMaxPlayers != 1) {
        pMultiBtns = 0;
        pTalkBtns = 0;
        talkofs = 0;
        sgszTalkMsg[0] = 0;
        v = 1;
        cnt = 1;
        p = &sgbPlrTalkTbl[1];
        do {
            *p = v;
            cnt--;
            p--;
        } while (cnt >= 0);
        cnt = 2;
        p = &talkbtndown[2];
        do {
            *p = 0;
            cnt--;
            p--;
        } while (cnt >= 0);
    }
    panelflag = 0;
    lvlbtndown = 0;
    pPanelButtons = LoadFileInMem("CtrlPan\Panel8bu.CEL", 0);
    panbtndown = 0;
    pChrButtons = 0;
    for (i = 0; i < 4; i++)
        chrbtn[myplr][i] = 0;
    pDurIcons = 0;
    str = GetStr(0x4FA);
    strcpy(&_infostr[sel_data][0], str);
    InitPanelStr();
    drawhpflag = 1;
    drawmanaflag = 1;
    chrflag = 0;
    _spselflag[0] = 0;
    _spselflag[1] = 0;
    pSpellBkCel = 0;
    pSBkBtnCel = 0;
    pSBkIconCels = 0;
    sbooktab = 0;
    sbookflag = 0;
    cur_spel[0] = 0;
    cur_spel[1] = 0;
    my_cur_spel[0] = 0;
    my_cur_spel[1] = 0;
    if (plr[myplr]._pClass == 0)
        SpellPages[0][0] = 0x1A;
    else if (plr[myplr]._pClass == 1)
        SpellPages[0][0] = 0x1C;
    else if (plr[myplr]._pClass == 2)
        SpellPages[0][0] = 0x1B;
    pQLogCel = 0;
    pGBoxBuff = 0;
    dropGoldFlag = 0;
    dropGoldValue = 0;
    initialDropGoldValue = 0;
    initialDropGoldIndex = 0;
}

void DrawLevelUpIcon(int pnum)
{
    if (!optionsflag && DoShowPanel && !stextflag && !qtextflag) {
        lus = 4;
        DrawPlus(4, pnum);
        plusanim++;
        if (plusanim == 24)
            plusanim = 0;
    }
}

void RedBack(void)
{
    TextDat *ThisDat;
    POLY_FT4 *FT4;

    ThisDat = GM_UseTexData(0);
    FT4 = ThisDat->PrintFt4(0xD8, 0, 0, 0, CBlocks::GetMaxOtPos() - 4, 0);
    FT4->x1 = 0x160;
    FT4->x3 = 0x160;
    FT4->y2 = 0xF0;
    FT4->y3 = 0xF0;
    FT4->b0 = FT4->g0 = FT4->r0 = 0x18;
    FT4->x2 = FT4->y1 = FT4->y0 = FT4->x0 = 0;
    FT4->u1--;
    FT4->u3--;
    FT4->v2--;
    FT4->v3--;
    FT4->code = (FT4->code | 2) & ~1;
    FT4->tpage |= 0x40;
    if (leveltype) {
        FT4->r0 = 0;
        FT4->g0 = 0xFF;
        FT4->b0 = 0xFF;
    }
}
