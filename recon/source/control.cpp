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
int _pSpell[2];
int _pSplType[2];
int my_cur_spel[2];
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
