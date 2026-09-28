/* SOURCE/CONTROL.CPP -- Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/CONTROL.CPP.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * All 51 functions of the segment are written.  Open near-misses (see the report / comments):
 * DrawSpellCel (allocation + reassociation), PrintInfo (X - (P - 1) reassociation, 4 diffs;
 * SYM: the pre-branch InfoBoxRect load keeps a Rect record), ChrCheckValidButton / CheckChrBtns
 * (loop-invariant &chrbtn / &MaxStats[pc] hoist), RedBack (one load scheduled early).
 * SetSpell / GetSBookTrans / DrawSpellBook / CheckSBook differ only in maspsx-vs-ASPSX assembly
 * (nop / `b` vs `bgez $0`) and pass on the ASPSX lane (tools/aspsx_gate.py). */
#include "diabpsx_types.h"
#include "source/gen/structs_control.h"
#include "source/gen/externs_control.h"
#include "source/gen/protos_control.h"
#include "source/diablo.h"

#define infostr _infostr[sel_data]
#define pnumlines _pnumlines[sel_data]
#define panelstr _panelstr[sel_data]
#define pstrjust _pstrjust[sel_data]
#define infoclr _infoclr[sel_data]
#define pinfoflag _pinfoflag[sel_data]
#define trigflag _trigflag[sel_data]
#define cursinvitem _pcursinvitem[sel_data]
#define cursmonst _pcursmonst[sel_data]
#define cursobj _pcursobj[sel_data]
#define cursitem _pcursitem[sel_data]
#define cursplr _pcursplr[sel_data]
#define spselflag _spselflag[sel_data]
#define pSplType _pSplType[sel_data]
#define setRGB0(p, _r0, _g0, _b0) (p)->r0 = (_r0), (p)->g0 = (_g0), (p)->b0 = (_b0)
#define setXYWH(p, _x0, _y0, _w, _h) (p)->x0 = (_x0), (p)->y0 = (_y0), (p)->x1 = (_x0)+(_w), (p)->y1 = (_y0), (p)->x2 = (_x0), (p)->y2 = (_y0)+(_h), (p)->x3 = (_x0)+(_w), (p)->y3 = (_y0)+(_h)

/* DrawLevelUpFlag is the first explicitly-initialised public definition -> names the
 * static-init thunk _GLOBAL__I_DrawLevelUpFlag (lane fact 64). */
unsigned char DrawLevelUpFlag = 0;
BOOL initchr = 0;
int NoCSEntries = 28;

/* TU-owned STAT globals (tentative definitions -> gp-rel like retail) */
static int SPLICONNO = 6;
static int SPLICONY = 110;
int lus;
char plusanim;
int _pnumlines[2];
int CS_XOFF;
static int SPALOFF = 0x80;
static int paloffset1 = -64;
static int paloffset2 = -21;
static int paloffset3 = 64;
static int paloffset4 = 21;
static int pinc1 = 4;
static int pinc2 = 4;
static int pinc3 = 4;
static int pinc4 = 4;
int CsNo;
unsigned char CrossCount[2];
unsigned char chrbtnactive;
unsigned char chrflag;
unsigned char sbookflag;
extern unsigned char chrbtn[][4];   /* unsized here, defined at the end of the TU: users see an incomplete
                                       * array, so &chrbtn is materialised as its own register (CheckChrBtns) */
int scx;
int scy;
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
struct RECT CSRect;
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
/* static no-initialiser defs emit .lcomm; kept LAST so maspsx's sdata scan (which stops at
 * an .lcomm) still sees every tentative sdata def above */
static int SPLICONRIGHT = SPLICONNO * 9 + 128;
static Dialog CSBack;

extern "C" void func_80161F58(void);

/* ---- CPad / Dialog / TextDat / CBlocks header-inline methods (out-of-line copies compiled
 * into this TU, -fno-inline; bodies identical to their declaring headers) ---- */
inline Dialog::Dialog()
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

short TrimCol(short col)
{
    if (col < 0)
        col = 0;
    if (col >= 256)
        col = 255;
    return col;
}

void DrawSpellCel(long xp, long yp, unsigned char Trans, long nCel, unsigned char w, char sel)
{
    TextDat *ThisDat;
    FRAME_HDR *Fr;
    POLY_FT4 *Ft4;
    POLY_GT4 *GT4;
    TP_LOAD_HDR *Tp;
    int SpellW, SpellH;
    unsigned char r, g, b;
    int x0, x1, x2, x3;
    int y0, y1, y2, y3;
    int u0, u1, u2, u3;
    int v0, v1, v2, v3;
    int otpos;

    ThisDat = GM_UseTexData(0);
    otpos = CBlocks::GetOverlayOtBase() + 1;
    nCel--;
    if (w == 1 && !sbookflag) {
        int dummy;   /* stand-in for the record-less declaration that opens retail's level here (lane fact 61) */

        xp *= 18;
        yp *= 18;
        xp += SPLICONRIGHT;
        yp += SPLICONY;
        xp += 32;
        yp += 32;
    }
    if (sel) {
        r = REDR >> 1;
        g = REDG >> 1;
        b = REDB >> 1;
    } else {
        r = SpellColors[SpellCol * 3] >> 1;
        g = SpellColors[SpellCol * 3 + 1] >> 1;
        b = SpellColors[SpellCol * 3 + 2] >> 1;
    }
    if (!Trans) {
        int X, Y, SW, SH;
        PAL *Pal;
        int st;

        Fr = ThisDat->GetFr(165);
        Tp = (TP_LOAD_HDR *)Fr;
        paloffset1 += pinc1;
        paloffset2 += pinc2;
        paloffset3 += pinc3;
        paloffset4 += pinc4;
        if (paloffset1 > 64)
            pinc1 = -4;
        if (paloffset2 > 64)
            pinc2 = -4;
        if (paloffset3 > 64)
            pinc3 = -4;
        if (paloffset4 > 64)
            pinc4 = -4;
        if (paloffset1 < -64)
            pinc1 = 4;
        if (paloffset2 < -64)
            pinc2 = 4;
        if (paloffset3 < -64)
            pinc3 = 4;
        if (paloffset4 < -64)
            pinc4 = 4;
        SH = Fr->H;
        X = xp + Fr->X;
        SW = Fr->W;
        Y = yp + Fr->Y;
        GT4 = PRIM_GetNextPolyGt4();
        setPolyGT4(GT4);
        if (!(((unsigned long *)Fr)[1] & 0x2000000)) {
            x0 = X;
            y0 = Y;
            x1 = X + SW;
            y1 = Y;
            x2 = X;
            y2 = Y + SH;
            x3 = x1;
            y3 = y2;
            u0 = Tp->U;
            v0 = Tp->V;
            u1 = u0 + SW;
            v1 = v0;
            u2 = u0;
            v2 = v1 + SH;
            u3 = u1;
            v3 = v2;
        } else {
            x0 = X + SW;
            y0 = Y;
            x1 = x0;
            y1 = Y + SH;
            x2 = X;
            y2 = Y;
            x3 = X;
            y3 = y1;
            u0 = Tp->U;
            v0 = Tp->V - 1;
            u1 = u0 + SH;
            v1 = v0;
            u2 = u0;
            v2 = SW - (1 - Tp->V);
            u3 = u1;
            v3 = v2;
        }
        GT4->u0 = u0;
        GT4->v0 = v0;
        GT4->u1 = u1;
        GT4->v1 = v1;
        GT4->u2 = u2;
        GT4->v2 = v2;
        GT4->u3 = u3;
        GT4->v3 = v3;
        GT4->x0 = x0;
        GT4->y0 = y0;
        GT4->x1 = x1;
        GT4->y1 = y1;
        GT4->x2 = x2;
        GT4->y2 = y2;
        GT4->x3 = x3;
        GT4->y3 = y3;
        Pal = ThisDat->GetPal(Fr->PalNum);
        if (Pal->InVram) {
            unsigned short *Clut = (unsigned short *)Pal;   /* coalesced copy: record-less level (GMAN SetPal idiom) */
            GT4->clut = Clut[1];
        } else if (!(!"Pallete Prob!!"))
            DBG_Error(NULL, "source/CONTROL.cpp", 657);
        st = 1;
        switch (w) {
        case 1:
            GT4->r0 = TrimCol(r + paloffset1);
            GT4->g0 = TrimCol(g + paloffset1);
            GT4->b0 = TrimCol(b + paloffset1);
            GT4->r1 = TrimCol(r + paloffset2);
            GT4->g1 = TrimCol(g + paloffset2);
            GT4->b1 = TrimCol(b + paloffset2);
            GT4->r2 = TrimCol(r + paloffset3);
            GT4->g2 = TrimCol(g + paloffset3);
            GT4->b2 = TrimCol(b + paloffset3);
            GT4->r3 = TrimCol(r + paloffset4);
            GT4->g3 = TrimCol(g + paloffset4);
            GT4->b3 = TrimCol(b + paloffset4);
            DrawSpinner(X + SW / 2 - 3, Y + SH / 2 + 3, 160, 64, 240, 32, 96, 0, 0, 0xFFFF, st, 0, 8);
            break;
        case 2:
            GT4->r0 = r;
            GT4->g0 = g;
            GT4->b0 = b;
            GT4->r1 = r;
            GT4->g1 = g;
            GT4->b1 = b;
            GT4->r2 = r;
            GT4->g2 = g;
            GT4->b2 = b;
            GT4->r3 = r;
            GT4->g3 = g;
            GT4->b3 = b;
            DrawSpinner(X + SW / 2 - 3, Y + SH / 2 + 3, 160, 64, 240, 32, 96, 0, 0, 0xFFFF, st, 0, 8);
            break;
        default:
            GT4->r0 = BACKR >> 1;
            GT4->g0 = BACKG >> 1;
            GT4->b0 = BACKB >> 1;
            GT4->r1 = BACKR >> 1;
            GT4->g1 = BACKG >> 1;
            GT4->b1 = BACKB >> 1;
            GT4->r2 = BACKR >> 1;
            GT4->g2 = BACKG >> 1;
            GT4->b2 = BACKB >> 1;
            GT4->r3 = BACKR >> 1;
            GT4->g3 = BACKG >> 1;
            st = 2;
            GT4->b3 = BACKB >> 1;
            break;
        }
        GT4->tpage = Tp->tpage;
        setSemiTrans(GT4, 0);
        setShadeTex(GT4, 0);
        addPrim(&ThisOt[otpos - 1], GT4);
        Fr = ThisDat->GetFr(nCel + 166);
        SpellW = Fr->W;
        SpellH = Fr->H;
        Ft4 = ThisDat->PrintFt4(nCel + 166, xp, yp, 0, otpos, 0);
        setSemiTrans(Ft4, 0);
        setShadeTex(Ft4, 0);
        Ft4->r0 = 128 / st;
        Ft4->g0 = 128 / st;
        Ft4->b0 = 128 / st;
        Ft4->x0 = Fr->X + xp;
        Ft4->y0 = Fr->Y + yp;
        Ft4->x1 = Fr->X + xp + SpellW;
        Ft4->y1 = Fr->Y + yp;
        Ft4->x2 = Fr->X + xp;
        Ft4->y2 = Fr->Y + yp + SpellH;
        Ft4->x3 = Fr->X + xp + SpellW;
        Ft4->y3 = Fr->Y + yp + SpellH;
    } else {
        Fr = ThisDat->GetFr(nCel + 166);
        SpellW = Fr->W;
        SpellH = Fr->H;
        Ft4 = ThisDat->PrintFt4(nCel + 166, xp, yp, 0, otpos, 0);
        Ft4->r0 = 128;
        Ft4->g0 = 128;
        Ft4->b0 = 128;
        setShadeTex(Ft4, 0);
        setSemiTrans(Ft4, 1);
        Ft4->x0 = Fr->X - (-1 - xp);
        Ft4->y0 = Fr->Y - (-1 - yp);
        Ft4->x1 = Fr->X + xp - (1 - SpellW);
        Ft4->y1 = Fr->Y - (-1 - yp);
        Ft4->x2 = Fr->X - (-1 - xp);
        Ft4->y2 = Fr->Y + yp - (1 - SpellH);
        Ft4->x3 = Fr->X + xp - (1 - SpellW);
        Ft4->y3 = Fr->Y + yp - (1 - SpellH);
        Fr = ThisDat->GetFr(165);
        SpellW = Fr->W;
        SpellH = Fr->H;
        Ft4 = ThisDat->PrintFt4(165, xp, yp, 0, otpos, 0);
        Ft4->r0 = r;
        Ft4->g0 = g;
        Ft4->b0 = b;
        setShadeTex(Ft4, 0);
        if (!sbookflag) {
            setSemiTrans(Ft4, 1);
            Ft4->x0 = Fr->X - (-1 - xp);
            Ft4->y0 = Fr->Y - (-1 - yp);
            Ft4->x1 = Fr->X + xp - (1 - SpellW);
            Ft4->y1 = Fr->Y - (-1 - yp);
            Ft4->x2 = Fr->X - (-1 - xp);
            Ft4->y2 = Fr->Y + yp - (1 - SpellH);
            Ft4->x3 = Fr->X + xp - (1 - SpellW);
            Ft4->y3 = Fr->Y + yp - (1 - SpellH);
        }
    }
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

/* hellfire's local `int pSpell, c, s;` meets the PSX per-player macro
 * `#define pSpell _pSpell[sel_data]` and becomes a variable-length local array
 * `int _pSpell[sel_data]` (SYM: `int (*_pSpell)[1]` in $s1, alloca'd frame + $fp). */
#define pSpell _pSpell[sel_data]
void CheckPanelInfo(void)
{
    int pSpell, c, s;
    int v;
    int pnum = sel_data;

    panelflag = 0;
    ClearPanel();
    if (!_spselflag[pnum]) {
        if (MouseX >= 565 && MouseX < 621 && MouseY >= 416 && MouseY < 472) {
            strcpy(infostr, GetStr(0x3B3));
            infoclr = 0;
            panelflag = 1;
            pinfoflag = 1;
            strcpy(tempstr, GetStr(0x4FA));
            AddPanelString(tempstr, 1);
            pSpell = plr[myplr]._pRSpell;
            if (pSpell != -1) {
                switch (plr[myplr]._pRSplType) {
                case 0:
                    sprintf(tempstr, GetStr(0x518), GetStr(spelldata[pSpell].sSkillText));
                    AddPanelString(tempstr, 1);
                    break;
                case 1:
                    sprintf(tempstr, GetStr(0x519), GetStr(spelldata[pSpell].sNameText));
                    AddPanelString(tempstr, 1);
                    v = plr[myplr]._pSplLvl[pSpell] + plr[myplr]._pISplLvlAdd;
                    if (v < 0)
                        v = 0;
                    if (v == 0)
                        sprintf(tempstr, GetStr(0x3F8));
                    else
                        sprintf(tempstr, GetStr(0x3F9), v);
                    AddPanelString(tempstr, 1);
                    break;
                case 2:
                    sprintf(tempstr, GetStr(0x3AF), GetStr(spelldata[pSpell].sNameText));
                    AddPanelString(tempstr, 1);
                    c = 0;
                    for (s = 0; s < plr[myplr]._pNumInv; s++) {
                        if (plr[myplr].InvList[s]._itype != -1
                            && (plr[myplr].InvList[s]._iMiscId == 0x15 || plr[myplr].InvList[s]._iMiscId == 0x16)) {
                            if (plr[myplr].InvList[s]._iSpell == pSpell)
                                c++;
                        }
                    }
                    for (s = 0; s < 8; s++) {
                        if (plr[myplr].SpdList[s]._itype != -1
                            && (plr[myplr].SpdList[s]._iMiscId == 0x15 || plr[myplr].SpdList[s]._iMiscId == 0x16)) {
                            if (plr[myplr].SpdList[s]._iSpell == pSpell)
                                c++;
                        }
                    }
                    if (c == 1)
                        strcpy(tempstr, GetStr(2));
                    else
                        sprintf(tempstr, GetStr(0x500), c);
                    AddPanelString(tempstr, 1);
                    break;
                case 3:
                    sprintf(tempstr, GetStr(0x405), GetStr(spelldata[pSpell].sNameText));
                    AddPanelString(tempstr, 1);
                    if (plr[myplr].InvBody[4]._iCharges == 1)
                        strcpy(tempstr, GetStr(1));
                    else
                        sprintf(tempstr, GetStr(0x4FE), plr[myplr].InvBody[4]._iCharges);
                    AddPanelString(tempstr, 1);
                    break;
                }
            }
        }
    }
    if (invflag)
        cursinvitem = CheckInvHLight();
}
#undef pSpell

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

static int DrawDurIcon4Item(const ItemStruct *pItem, int x, int c)
{
    /* hellfire's DrawDurIcon4Item minus the DrawCel: the switch survives only as its
     * (dead) jump-table load */
    if (pItem->_itype == -1)
        return x;
    if (pItem->_iDurability > 5)
        return x;
    if (c == 0) {
        if (pItem->_iClass == 1)
            switch (pItem->_itype) {
            case 1:
                c = 2;
                break;
            case 2:
                c = 6;
                break;
            case 3:
                c = 7;
                break;
            case 4:
                c = 5;
                break;
            case 10:
                c = 8;
                break;
            }
        else
            c = 1;
    }
    if (pItem->_iDurability > 2)
        c += 8;
    return x - 40;
}

#define pSpell _pSpell[sel_data]
void DrawSpellList(void)
{
    int x, y, i, j, t;
    unsigned long long mask, spl;
    int s, c, v;
    int NoSpells;
    unsigned char trans;
    PlayerStruct *player;
    CPad *P;
    int lx, ly;
    int NoYSpells, NoXSpells;
    int PLEFT, PRIGHT;

    spl = 0;
    v = 0;
    player = &plr[options_pad];
    if (invflag | stextflag | qtextflag | chrflag | optionsflag)
        return;
    sel_data = options_pad;
    if ((plr[0].plractive && !plr[1].plractive) || (!plr[0].plractive && plr[1].plractive)) {
        SPLICONNO = 12;
        SPLICONY = 110;
        SPLICONRIGHT = 252;
        if (plr[1].plractive)
            SPLICONRIGHT = 222;
    } else {
        SPLICONNO = 6;
        SPLICONY = 142;
        if (options_pad)
            SPLICONRIGHT = 227;
        else
            SPLICONRIGHT = 122;
    }
    if (options_pad == 0) {
        x = -SPLICONNO;
        y = 0;
        scx = scx2;
        scy = scy2;
    } else {
        x = 0;
        y = 0;
        scx = scx1;
        scy = scy1;
    }
    pSpell = -1;
    NoSpells = 0;
    infostr[0] = 0;
    ClearPanel();
    for (j = 0; j < 4; j++) {
        switch (j) {
        case 0:
            SetSpellTrans(0);
            spl = player->_pAblSpells;
            break;
        case 1:
            spl = player->_pMemSpells;
            break;
        case 2:
            SetSpellTrans(2);
            spl = player->_pScrlSpells;
            break;
        case 3:
            SetSpellTrans(3);
            spl = player->_pISpells;
            break;
        }
        mask = 1;
        for (i = 1; i < 37; i++) {
            if ((spl & mask) && spelldata[i].sName) {
                BOOL Flag;

                if (j == 1) {
                    v = player->_pSplLvl[i] + player->_pISplLvlAdd;
                    if (v < 0)
                        v = 0;
                    if (v > 0)
                        t = 1;
                    else
                        t = 4;
                    SetSpellTrans(t);
                }
                if (currlevel == 0 && !spelldata[i].sTownSpell)
                    SetSpellTrans(4);
                Flag = 0;
                if (options_pad == 0)
                    Flag = x == -SPLICONNO - scx && y == scy;
                else if (x == scx && y == scy)
                    Flag = 1;
                if (Flag) {
                    pSpell = i;
                    pSplType = j;
                    switch (j) {
                    case 0:
                        sprintf(infostr, GetStr(0x518), GetStr(spelldata[pSpell].sSkillText));
                        break;
                    case 1:
                        sprintf(infostr, GetStr(0x519), GetStr(spelldata[pSpell].sNameText));
                        if (pSpell == 0x1F) {
                            strcpy(tempstr, GetStr(0xE0));
                            AddPanelString(tempstr, 1);
                        }
                        if (v == 0)
                            strcpy(tempstr, GetStr(0x3F8));
                        else
                            sprintf(tempstr, GetStr(0x3F9), v);
                        AddPanelString(tempstr, 1);
                        break;
                    case 2:
                        sprintf(infostr, GetStr(0x3AF), GetStr(spelldata[pSpell].sNameText));
                        c = 0;
                        for (s = 0; s < player->_pNumInv; s++) {
                            if (player->InvList[s]._itype != -1
                                && (player->InvList[s]._iMiscId == 0x15 || player->InvList[s]._iMiscId == 0x16)) {
                                if (player->InvList[s]._iSpell == pSpell)
                                    c++;
                            }
                        }
                        for (s = 0; s < 8; s++) {
                            if (player->SpdList[s]._itype != -1
                                && (player->SpdList[s]._iMiscId == 0x15 || player->SpdList[s]._iMiscId == 0x16)) {
                                if (player->SpdList[s]._iSpell == pSpell)
                                    c++;
                            }
                        }
                        if (c == 1)
                            strcpy(tempstr, GetStr(2));
                        else
                            sprintf(tempstr, GetStr(0x500), c);
                        AddPanelString(tempstr, 1);
                        break;
                    case 3:
                        sprintf(infostr, "%s%s%s", GetStr(0x402), GetStr(0x2E0), GetStr(spelldata[pSpell].sNameText));
                        if (player->InvBody[4]._iCharges == 1)
                            strcpy(tempstr, GetStr(1));
                        else
                            sprintf(tempstr, GetStr(0x4FE), player->InvBody[4]._iCharges);
                        AddPanelString(tempstr, 1);
                        break;
                    }
                }
                trans = 1;
                if (options_pad == 0)
                    trans = x == -SPLICONNO - scx ? y != scy : 1;
                else if (x == scx && y == scy)
                    trans = 0;
                if (my_cur_spel[options_pad] == spelldata[i].sName && plr[options_pad]._pRSplType == j)
                    DrawSpellCel(x, y - (1 - FePlayerNo), trans, SpellITbl[i], 1, 1);
                else
                    DrawSpellCel(x, y - (1 - FePlayerNo), trans, SpellITbl[i], 1, 0);
                NoSpells++;
                if (options_pad == 0) {
                    x++;
                    if (x == 0) {
                        y--;
                        x = -SPLICONNO;
                    }
                } else {
                    x--;
                    if (x == -SPLICONNO) {
                        x = 0;
                        y--;
                    }
                }
            }
            mask <<= 1;
        }
    }
    P = PAD_GetPad(options_pad, 0);
    NoYSpells = NoSpells / SPLICONNO;
    NoXSpells = NoSpells - SPLICONNO * NoYSpells;
    PLEFT = 4;
    lx = scx;
    ly = scy;
    P->SetPadTick(4);
    P->SetPadTickMask(15);
    scx = -scx;
    scy = -scy;
    PRIGHT = 8;
    if (options_pad == 0) {
        PLEFT = 8;
        PRIGHT = 4;
    }
    if (P->GetTick() & PLEFT) {
        scx++;
        if (scy == NoYSpells) {
            if (scx >= NoXSpells)
                scx = 0;
        } else if (scx >= SPLICONNO)
            scx = 0;
    }
    if (P->GetTick() & PRIGHT) {
        scx--;
        if (scx < 0)
            scx = scy == NoYSpells ? NoXSpells - 1 : SPLICONNO - 1;
    }
    if (P->GetTick() & 2) {
        scy--;
        if (scy < 0) {
            if (scx >= NoXSpells)
                scy = NoYSpells - 1;
            else
                scy = NoYSpells;
        }
    }
    if (P->GetTick() & 1) {
        scy++;
        if (scy == NoYSpells && scx >= NoXSpells)
            scy = 0;
        if (scy > NoYSpells)
            scy = 0;
    }
    if (scy > NoYSpells) {
        scx = NoXSpells - 1;
        if (scx < 0)
            scx = 0;
        if (scy > 0)
            scy--;
    }
    if (scy == NoYSpells && scx >= NoXSpells) {
        scx = NoXSpells - 1;
        if (scx < 0) {
            scx = 0;
            if (scy > 0)
                scy--;
        }
    }
    scx = -scx;
    scy = -scy;
    if (lx != scx || ly != scy)
        PlaySFX(0x32);
    if (options_pad == 0) {
        scx2 = scx;
        scy2 = scy;
    } else {
        scx1 = scx;
        scy1 = scy;
    }
}
#undef pSpell

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

static void DrawSpellBook(BOOL DrawBg)
{
    int i, ii, x, y;
    int mind, maxd;
    int sx, sy;
    unsigned long long tspls;
    char st;
    char c;
    int v;
    unsigned char bright;
    char Num[4];
    int bw;
    CPad *P;
    int lsbooktab, lcur_spel;

    GLUE_SetShowGameScreenFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SuspendGame();
    if (!DrawBg)
        return;
    PrintSelectBack(0x4E6);
    if (plr[myplr]._pClass == 0)
        SpellPages[0][0] = 0x1A;
    else if (plr[myplr]._pClass == 1)
        SpellPages[0][0] = 0x1C;
    else if (plr[myplr]._pClass == 2)
        SpellPages[0][0] = 0x1B;
    bw = 46;
    x = 24;
    y = 194;
    CSBack.SetBack(0x94);
    CSBack.SetBorder(0x12);
    for (i = 0; i < 5; i++) {
        CSBack.SetRGB(BACKR >> 1, BACKG >> 1, BACKB >> 1);
        c = 64;
        if (i == sbooktab) {
            CSBack.SetRGB(255, 255, 255);
            c = -1;
        }
        CSRect.x = x;
        CSRect.y = y;
        CSRect.w = bw;
        CSRect.h = 9;
        CSBack.Back(x, y, bw, 9);
        sprintf(Num, "%d", i + 1);
        MediumFont.Print(0, 8, Num, JustCentre, &CSRect, c, c, c);
        x += 10 + bw;
    }
    CSBack.SetRGB(BACKR / 3 * 2, BACKG / 3 * 2, BACKB / 3 * 2);
    CSBack.SetBack(0x94);
    CSBack.SetBorder(0x12);
    y = 38;
    sx = 20;
    sy = 46;
    tspls = plr[myplr]._pISpells | plr[myplr]._pMemSpells | plr[myplr]._pAblSpells;
    for (i = 1; i < 6; i++) {
        CSBack.Back(47, y + 6, 252, 24);
        CSRect.x = 47;
        CSRect.y = y + 6;
        CSRect.w = 252;
        CSRect.h = 24;
        ii = SpellPages[sbooktab][i - 1];
        bright = 0x80;
        if (ii != -1 && ((tspls >> (ii - 1)) & 1)) {
            st = GetSBookTrans(ii, 1);
            SetSpellTrans(st);
            if (ii == my_cur_spel[options_pad]) {
                if (i == cur_spel[options_pad] + 1) {
                    bright = 0xFF;
                    DrawSpellCel(sx, sy, 0, SpellITbl[ii], 1, 1);
                } else
                    DrawSpellCel(sx, sy, 1, SpellITbl[ii], 2, 1);
            } else {
                if (i == cur_spel[options_pad] + 1) {
                    bright = 0xFF;
                    DrawSpellCel(sx, sy, 0, SpellITbl[ii], 1, 0);
                } else
                    DrawSpellCel(sx, sy, 1, SpellITbl[ii], 2, 0);
            }
            st = GetSBookTrans(ii, 0);
            PrintSBookStr(0, 9, ii, GetStr(spelldata[ii].sNameText), bright, st == 3);
            switch (st) {
            case 0:
                strcpy(tempstr, GetStr(0x3D5));
                break;
            case 3:
                sprintf(tempstr, GetStr(0x4FE), plr[myplr].InvBody[4]._iCharges);
                break;
            default:
                v = GetManaAmount(myplr, ii) >> 6;
                GetDamageAmt(ii, &mind, &maxd);
                if (mind != -1)
                    sprintf(tempstr, "%s:%i    %s:%i - %i", GetStr(0x27A), v, GetStr(0xE1), mind, maxd);
                else
                    sprintf(tempstr, "%s:%i    %s: -", GetStr(0x27A), v, GetStr(0xE1));
                if (ii == 0x24)
                    sprintf(tempstr, GetStr(0x27C), v);
                PrintSBookStr(0, 20, ii, tempstr, bright, st == 3);
                v = plr[myplr]._pSplLvl[ii] + plr[myplr]._pISplLvlAdd;
                if (v < 0)
                    v = 0;
                if (v == 0)
                    sprintf(tempstr, GetStr(0x3F8));
                else
                    sprintf(tempstr, GetStr(0x3F9), v);
                break;
            }
            PrintSBookStr(0x88, 9, ii, tempstr, bright, st == 3);
        }
        y += 30;
        sy += 30;
    }
    x = 22;
    y = 48;
    for (i = 0; i < 5; i++) {
        if (i == cur_spel[options_pad])
            CSBack.SetRGB(255, 255, 255);
        else
            CSBack.SetRGB(BACKR >> 1, BACKG >> 1, BACKB >> 1);
        CSBack.Back(x, y, 16, 15);
        y += 30;
    }
    CSBack.SetBack(5);
    CSBack.SetBorder(0x12);
    CSBack.SetRGB(BORDERR, BORDERG, BORDERB);
    CSRect.x = 14;
    CSRect.y = 22;
    CSRect.w = 292;
    CSRect.h = 188;
    CSBack.Back(14, 22, 292, 188);
    MediumFont.Print(0, 14, GetStr(0x3F7), JustCentre, &CSRect, BLUER, BLUEG, BLUEB);
    P = PAD_GetPad(options_pad, 0);
    lsbooktab = sbooktab;
    lcur_spel = cur_spel[options_pad];
    P->SetPadTick(10);
    P->SetPadTickMask(15);
    if (P->GetTick() & 1)
        cur_spel[options_pad]--;
    if (P->GetTick() & 2)
        cur_spel[options_pad]++;
    if (cur_spel[options_pad] < 0)
        cur_spel[options_pad] = 4;
    if (cur_spel[options_pad] >= 5)
        cur_spel[options_pad] = 0;
    if (P->GetTick() & 4)
        sbooktab--;
    if (P->GetTick() & 8)
        sbooktab++;
    if (sbooktab < 0)
        sbooktab = 4;
    if (sbooktab >= 5)
        sbooktab = 0;
    if (lsbooktab != sbooktab)
        PlaySFX(0x32);
    if (lcur_spel != cur_spel[options_pad])
        PlaySFX(0x32);
    v = 0;
    if (P->GetDown() & 0x100)
        v = 1;
    else if (P->GetDown() & 0x20)
        v = 1;
    if (v) {
        PlaySFX(0x33);
        sbookflag = 0;
        if (optionsflag) {
            cmenu = 1;
            GLUE_SetShowGameScreenFlag(1);
            GLUE_SetShowPanelFlag(0);
        }
    }
}

void CheckSBook(void)
{
    unsigned long long tspls;
    char st;
    int cspel;

    RemoveTargetCursor(options_pad);
    cspel = SpellPages[sbooktab][cur_spel[options_pad]];
    tspls = plr[options_pad]._pISpells | plr[options_pad]._pMemSpells | plr[options_pad]._pAblSpells;
    {
    if (cspel != -1) {
        BOOL splok;

        if (cspel >= 0x1A && cspel <= 0x1C)
            splok = 1;
        else
            splok = (unsigned long)(tspls >> (cspel - 1)) & 1;
        if (splok) {
            my_cur_spel[options_pad] = cspel;
            st = 1;
            if ((plr[options_pad]._pISpells >> (cspel - 1)) & 1)
                st = 3;
            if (plr[options_pad]._pAblSpells & (1 << (cspel - 1)))
                st = 0;
            plr[options_pad]._pRSpell = my_cur_spel[options_pad];
            plr[options_pad]._pRSplType = st;
        }
        PlaySFX(0x33);
    }
    }
}

void DrawArrows(void)
{
    TextDat *ThisDat;
    POLY_FT4 *Ft4;
    unsigned char flip;
    int x;
    int otpos;

    ThisDat = GM_UseTexData(0);
    flip = 1;
    otpos = CBlocks::GetMaxOtPos() - 4;
    x = 0x11E;
    if (CS_XOFF) {
        flip = 0;
        x = 0x1C;
    }
    Ft4 = ThisDat->PrintFt4(0x7E, x, 0xCA, flip, otpos, 0);
    Ft4->r0 = GOLDR;
    Ft4->g0 = GOLDG;
    Ft4->b0 = GOLDB;
    setSemiTrans(Ft4, 0);
    setShadeTex(Ft4, 0);

    Ft4 = ThisDat->PrintFt4(0x7E, x | 1, 0xCB, flip, otpos, 0);
    Ft4->r0 = 0;
    Ft4->g0 = 0;
    Ft4->b0 = 0;
    Ft4->code = (Ft4->code | 2) & ~1;
}

static void PrintInfo(void)
{
    int NoOfLines;
    int nOffset1;
    int nlines;
    int PageOffset;
    RECT *Rect;
    int K1;

    if (talkflag)
        return;
    nOffset1 = 0;
    NoOfLines = 0;
    Rect = InfoBoxRect;
    nlines = 0;
    if (invflag) {
        if (infostr[0])
            NoOfLines = MediumFont.GetWrap(infostr, Rect);
        for (int i = 0; i < pnumlines; i++)
            NoOfLines += MediumFont.GetWrap(panelstr[i], InfoBoxRect);
    } else if (gbActivePlayers == 1) {
        if (infostr[0])
            nlines = MediumFont.GetWrap(infostr, Rect);
        for (int i = 0; i < pnumlines; i++)
            nlines += MediumFont.GetWrap(panelstr[i], InfoBoxRect);
        nlines = 4 - nlines;
    }
    PageOffset = 0;
    InvPageFlag = 0;
    if (invflag && NoOfLines > 6) {
        InvPageFlag = 1;
        if (InvPageNo)
            PageOffset = NoOfLines - 6;
    }
    if (!invflag && nlines < 0) {
        if (gbActivePlayers == 1) {
            InfoBoxRect->y += nlines * 12;
            InfoBoxRect->h -= nlines * 12;
            nlines = 0;
        } else {
            InfoBoxRect->h -= nlines * 12;
            nlines = 0;
        }
    }
    if (infostr[0])
        nOffset1 += CPrintString(invflag ? nlines - PageOffset : nlines, infostr, 1) - 1;
    for (int i = 0; i < pnumlines; i++) {
        if (invflag)
            nOffset1 += CPrintString(i + nOffset1 + nlines - (PageOffset - (K1 = 1)), panelstr[i], pstrjust[i]) - 1;
        else
            nOffset1 += CPrintString(i + nOffset1 + nlines + 1, panelstr[i], pstrjust[i]) - 1;
    }
}

void DrawInfoBox(RECT *InfoRect)
{
    int pnum = sel_data;

    InfoBoxRect = InfoRect;
    if (!panelflag && !trigflag && cursinvitem == -1 && !_spselflag[pnum]) {
        infostr[0] = 0;
        infoclr = 0;
        ClearPanel();
    }
    if (!invflag && (_spselflag[pnum] || trigflag)) {
        infoclr = 0;
    } else if (_pcurs[myplr] >= 12) {
        if (plr[myplr].HoldItem._itype == 11) {
            int nGold = plr[myplr].HoldItem._ivalue;
            sprintf(infostr, GetStr(0x4FF), nGold, get_pieces_str(nGold));
        } else if (!plr[myplr].HoldItem._iStatFlag) {
            ClearPanel();
            AddPanelString(GetStr(0x35E), 1);
            pinfoflag = 1;
        } else {
            if (plr[myplr].HoldItem._iIdentified)
                strcpy(infostr, MakeItemStr(&plr[myplr].HoldItem, plr[myplr].HoldItem._iIName, 256));
            else
                strcpy(infostr, MakeItemStr(&plr[myplr].HoldItem, plr[myplr].HoldItem._iName, 256));
            if (plr[myplr].HoldItem._iMagical == 1)
                infoclr = 1;
            if (plr[myplr].HoldItem._iMagical == 2)
                infoclr = 3;
        }
    } else if (cursinvitem == -1 || invflag) {
        if (cursmonst != -1) {
            if (leveltype != 0 && !optionsflag) {
                infoclr = 0;
                strcpy(infostr, GetStr(monster[cursmonst].mName));
                ClearPanel();
                if (monster[cursmonst]._uniqtype != 0) {
                    infoclr = 3;
                    void PrintUniqueHistory();   /* hellfire's block-local declaration: its level is in the SYM */
                    PrintUniqueHistory();
                } else
                    PrintMonstHistory(monster[cursmonst].MType->mtype);
            } else
                strcpy(infostr, GetStr(towner[cursmonst]._tName));
        } else if (cursobj != -1) {
            GetObjectStr(cursobj);
        } else if (cursitem != -1) {
            GetItemStr(cursitem);
        } else if (cursplr != -1) {
            infoclr = 3;
            strcpy(infostr, plr[cursplr]._pName);
            ClearPanel();
            sprintf(tempstr, GetStr(0x247), plr[cursplr]._pLevel);
            AddPanelString(tempstr, 1);
            sprintf(tempstr, GetStr(0x1F1), plr[cursplr]._pHitPoints >> 6, plr[cursplr]._pMaxHP >> 6);
            AddPanelString(tempstr, 1);
        }
    }
    if (infostr[0] != 0 || pnumlines != 0)
        PrintInfo();
}

static void MY_PlrStringXY(void)
{
    CSDATA *ptr;
    char r, g, b;
    int x, y;
    int w;
    int len;
    RECT Angle;

    r = 0;
    g = 0;
    b = 0;
    ptr = &CS_Tab[CsNo];
    switch (ptr->col) {
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
    x = ptr->x;
    y = ptr->y;
    w = ptr->w;
    x += 48;
    y += 2;
    x += CS_XOFF;
    if (x < 0)
        return;
    if (x < 321) {
        if (w) {
            CSBack.SetBack(0x94);
            CSBack.SetBorder(0x12);
            CSBack.SetRGB(BACKR, BACKG, BACKB);
            CSBack.Back(x + 16, y + 32, w, 11);
            CSRect.x = x + 16;
            CSRect.y = y + 32;
            CSRect.w = w;
            CSRect.h = 11;
        }
        if (ptr->String)
            MediumFont.Print(0, 9, ptr->String, JustCentre, &CSRect, r, g, b);
        CSRect.x = 16;
        CSRect.y = 32;
        CSRect.w = 280;
        CSRect.h = 176;
        r = WHITER;
        g = WHITEG;
        b = WHITEB;
        Angle.x = 0;
        Angle.y = 32;
        Angle.w = x + 8;
        Angle.h = 176;
        if (ptr->Text1) {
            if (!ptr->Text2) {
                len = MediumFont.GetStrWidth(GetStr(ptr->Text1));
                if (ptr->Text1 != 0x29)
                    MediumFont.Print(x - len - 6, y + 9, GetStr(ptr->Text1), JustLeft, &CSRect, r, g, b);
                else
                    MediumFont.Print(x - 6, y + 9, GetStr(0x29), JustRight, &Angle, r, g, b);
            }
            if (ptr->Text1 && ptr->Text2) {
                if (CsNo >= 11 && CsNo <= 13) {
                    MediumFont.GetStrWidth(GetStr(ptr->Text2));
                    MediumFont.Print(x + w + 5, y + 13, GetStr(ptr->Text2), JustLeft, &CSRect, r, g, b);
                    MediumFont.GetStrWidth(GetStr(ptr->Text1));
                    MediumFont.Print(x + w + 5, y, GetStr(ptr->Text1), JustLeft, &CSRect, r, g, b);
                } else {
                    len = MediumFont.GetStrWidth(GetStr(ptr->Text2));
                    MediumFont.Print(x - len - 30, y + 13, GetStr(ptr->Text2), JustLeft, &CSRect, r, g, b);
                    len = MediumFont.GetStrWidth(GetStr(ptr->Text1));
                    MediumFont.Print(x - len - 14, y, GetStr(ptr->Text1), JustLeft, &CSRect, r, g, b);
                }
            }
        }
        if (ptr->Text3) {
            if (ptr->Text3 == 0x41) {
                len = MediumFont.GetStrWidth(GetStr(0x41));
                CSRect.x = x - (short)(len - 16);
                CSRect.y = y + 12;
                CSRect.w = w + len;
                CSRect.h = 24;
                MediumFont.Print(0, 13, GetStr(ptr->Text3), JustRight, &CSRect, r, g, b);
            } else if (ptr->Text3 == 0x2C2) {
                len = MediumFont.GetStrWidth(GetStr(0x2C2));
                CSRect.x = x + 16;
                CSRect.y = y + 12;
                CSRect.w = w + len;
                CSRect.h = 24;
                MediumFont.Print(0, 13, GetStr(ptr->Text3), JustLeft, &CSRect, r, g, b);
            } else {
                len = MediumFont.GetStrWidth(GetStr(ptr->Text3));
                MediumFont.Print(x + (w - len) / 2, y - 7, GetStr(ptr->Text3), JustLeft, &CSRect, r, g, b);
            }
        }
    }
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
    TextDat *ThisDat;
    POLY_FT4 *Ft4;
    int otpos;
    int x, y;

    ThisDat = GM_UseTexData(0);
    otpos = CBlocks::GetOverlayOtBase();
    otpos += 4;
    if (n == 4) {
        CrossCount[pnum]++;
        if (CrossCount[pnum] & 1) {
            if (pnum == 0)
                Ft4 = ThisDat->PrintFt4((VID_GetTick() >> 3 & 3) + 1, 0x19, 0x64, 0, otpos, 0);
            else
                Ft4 = ThisDat->PrintFt4((VID_GetTick() >> 3 & 3) + 1, 0x127, 0x64, 0, otpos, 0);
            Ft4->r0 = 0xA0;
            Ft4->g0 = 0xA0;
            Ft4->b0 = 0xA0;
            Ft4->code = (Ft4->code | 2) & ~1;
        }
    } else {
        x = CS_Tab[n + 20].x + 0x42;
        y = CS_Tab[n + 20].y;
        chrbtnactive = 1;
        Ft4 = ThisDat->PrintFt4(0x83, x + CS_XOFF, y + 0x22, 0, otpos, 0);
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

#define P plr[options_pad]
void BuildChr(void)
{
    char c;
    char chrstr[64];
    long mind, maxd;
    int hper, ac;

    CsNo = 0;
    ADD_PlrStringXY(P._pName, 0);
    ADD_PlrStringXY(P._pName, 0);
    if (P._pClass == 0) {
        ADD_PlrStringXY(GetStr(0x4BE), 0);
        ADD_PlrStringXY(GetStr(0x4BE), 0);
    } else if (P._pClass == 1) {
        ADD_PlrStringXY(GetStr(0x375), 0);
        ADD_PlrStringXY(GetStr(0x375), 0);
    } else if (P._pClass == 2) {
        ADD_PlrStringXY(GetStr(0x3E8), 0);
        ADD_PlrStringXY(GetStr(0x3E8), 0);
    }

    sprintf(chrstr, GetStr(0x4FD), P._pLevel);
    ADD_PlrStringXY(chrstr, 0);

    sprintf(chrstr, GetStr(0x504), P._pExperience);
    ADD_PlrStringXY(chrstr, 0);

    if (P._pLevel == 50) {
        strcpy(chrstr, GetStr(0x2BA));
        c = 3;
    } else {
        sprintf(chrstr, GetStr(0x504), P._pNextExper);
        c = 0;
    }
    ADD_PlrStringXY(chrstr, c);

    sprintf(chrstr, GetStr(0x4FD), P._pGold);
    ADD_PlrStringXY(chrstr, 0);

    c = 0;
    if (P._pIBonusAC > 0)
        c = 1;
    if (P._pIBonusAC < 0)
        c = 2;
    ac = P._pIAC + P._pIBonusAC;
    ac += P._pDexterity / 5;
    sprintf(chrstr, GetStr(0x4FD), ac);
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    if (P._pIBonusToHit > 0)
        c = 1;
    if (P._pIBonusToHit < 0)
        c = 2;
    hper = 50 + (P._pDexterity >> 1) + P._pIBonusToHit;
    sprintf(chrstr, GetStr(0x503), hper);
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    if (P._pIBonusDam > 0)
        c = 1;
    if (P._pIBonusDam < 0)
        c = 2;
    mind = P._pIMinDam;
    mind += (mind * P._pIBonusDam) / 100;
    mind += P._pIBonusDamMod;
    if (P.InvBody[4]._itype == 3) {
        if (P._pClass == 1)
            mind += P._pDamageMod;
        else
            mind += P._pDamageMod >> 1;
    } else
        mind += P._pDamageMod;
    maxd = P._pIMaxDam;
    maxd += (maxd * P._pIBonusDam) / 100;
    maxd += P._pIBonusDamMod;
    if (P.InvBody[4]._itype == 3) {
        if (P._pClass == 1)
            maxd += P._pDamageMod;
        else
            maxd += P._pDamageMod >> 1;
    } else
        maxd += P._pDamageMod;
    sprintf(chrstr, GetStr(0x501), mind, maxd);
    ADD_PlrStringXY(chrstr, c);

    if (P._pMagResist == 0)
        c = 0;
    else
        c = 1;
    if (P._pMagResist < 75)
        sprintf(chrstr, GetStr(0x503), P._pMagResist);
    else {
        c = 3;
        sprintf(chrstr, GetStr(0x285));
    }
    ADD_PlrStringXY(chrstr, c);

    if (P._pFireResist == 0)
        c = 0;
    else
        c = 1;
    if (P._pFireResist < 75)
        sprintf(chrstr, GetStr(0x503), P._pFireResist);
    else {
        c = 3;
        sprintf(chrstr, GetStr(0x285));
    }
    ADD_PlrStringXY(chrstr, c);

    if (P._pLghtResist == 0)
        c = 0;
    else
        c = 1;
    if (P._pLghtResist < 75)
        sprintf(chrstr, GetStr(0x503), P._pLghtResist);
    else {
        c = 3;
        sprintf(chrstr, GetStr(0x285));
    }
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    sprintf(chrstr, GetStr(0x4FD), P._pBaseStr);
    if (MaxStats[P._pClass][0] == P._pBaseStr)
        c = 3;
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    sprintf(chrstr, GetStr(0x4FD), P._pBaseMag);
    if (MaxStats[P._pClass][1] == P._pBaseMag)
        c = 3;
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    sprintf(chrstr, GetStr(0x4FD), P._pBaseDex);
    if (MaxStats[P._pClass][2] == P._pBaseDex)
        c = 3;
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    sprintf(chrstr, GetStr(0x4FD), P._pBaseVit);
    if (MaxStats[P._pClass][3] == P._pBaseVit)
        c = 3;
    ADD_PlrStringXY(chrstr, c);

    chrstr[0] = 0;
    if (P._pStatPts > 0)
        sprintf(chrstr, GetStr(0x4FD), P._pStatPts);
    ADD_PlrStringXY(chrstr, 2);

    c = 0;
    if (P._pStrength > P._pBaseStr)
        c = 1;
    if (P._pStrength < P._pBaseStr)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), P._pStrength);
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    if (P._pMagic > P._pBaseMag)
        c = 1;
    if (P._pMagic < P._pBaseMag)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), P._pMagic);
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    if (P._pDexterity > P._pBaseDex)
        c = 1;
    if (P._pDexterity < P._pBaseDex)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), P._pDexterity);
    ADD_PlrStringXY(chrstr, c);

    c = 0;
    if (P._pVitality > P._pBaseVit)
        c = 1;
    if (P._pVitality < P._pBaseVit)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), P._pVitality);
    ADD_PlrStringXY(chrstr, c);

    if (P._pStatPts > 0) {
        int CalcStatDiff(int);
        if (CalcStatDiff(options_pad) < P._pStatPts)
            P._pStatPts = CalcStatDiff(options_pad);
    }

    if (P._pMaxHP > P._pMaxHPBase)
        c = 1;
    else
        c = 0;
    sprintf(chrstr, GetStr(0x4FD), P._pMaxHP >> 6);
    ADD_PlrStringXY(chrstr, c);
    if (P._pHitPoints != P._pMaxHP)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), P._pHitPoints >> 6);
    ADD_PlrStringXY(chrstr, c);

    if (P._pMaxMana > P._pMaxManaBase)
        c = 1;
    else
        c = 0;
    sprintf(chrstr, "%i", P._pMaxMana >> 6);
    ADD_PlrStringXY(chrstr, c);
    if (P._pMana != P._pMaxMana)
        c = 2;
    sprintf(chrstr, "%i", P._pMana >> 6);
    ADD_PlrStringXY(chrstr, c);

    ChrCheckValidButton(0);
    CsNo = 0;
}
#undef P

void DrawChr(void)
{
    char chrstr[64];
    int pc;
    CPad *P;

    chrbtnactive = 0;
    CSBack.SetBorder(0x12);
    CSBack.SetRGB(0x40, 0x40, 0x40);
    if (initchr) {
        initchr = 0;
        if (plr[options_pad]._pStatPts == 0)
            CS_XOFF = 0;
        else
            CS_XOFF = 0x140;
        BuildChr();
    }
    for (CsNo = 0; CsNo < NoCSEntries; CsNo++)
        MY_PlrStringXY();
    CSBack.SetBack(5);
    CSBack.SetBorder(0x12);
    CSBack.SetRGB(BORDERR, BORDERG, BORDERB);
    CSBack.Back(16, 32, 280, 176);
    CSRect.x = 16;
    CSRect.y = 32;
    CSRect.w = 280;
    CSRect.h = 176;
    PrintSelectBack((plr[options_pad]._pStatPts > 0 && CS_XOFF) ? 0x4E6 : 0x4A0);
    DrawArrows();
    if (plr[options_pad]._pStatPts > 0) {
        pc = plr[options_pad]._pClass;
        if (plr[options_pad]._pBaseStr < MaxStats[pc][0])
            DrawPlus(0, 0);
        if (plr[options_pad]._pBaseMag < MaxStats[pc][1])
            DrawPlus(1, 0);
        if (plr[options_pad]._pBaseDex < MaxStats[pc][2])
            DrawPlus(2, 0);
        if (plr[options_pad]._pBaseVit < MaxStats[pc][3])
            DrawPlus(3, 0);
    }
    plusanim++;
    if (plusanim == 24)
        plusanim = 0;
    P = PAD_GetPad(options_pad, 0);
    P->SetPadTick(10);
    P->SetPadTickMask(15);
    if (P->GetTick() & 4) {
        if (CS_XOFF)
            PlaySFX(0x32);
        CS_XOFF = 0;
    }
    if (P->GetTick() & 8) {
        if (!CS_XOFF)
            PlaySFX(0x32);
        CS_XOFF = 0x140;
    }
    if (chrbtnactive && CS_XOFF == 0x140) {
        int llus = lus;
        int move = -(P->GetTick() & 1);
        if (P->GetTick() & 2)
            move = 1;
        ChrCheckValidButton(move);
        if (llus != lus)
            PlaySFX(0x32);
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

    alive = 1;
    args = (DEF_ARGS *)T->Data;
    pnum = args->a0;
    TSK_Sleep(1);
    while (alive && !GLUE_Finished()) {
        int old_opts = options_pad;

        options_pad = pnum;
        if ((questlog | sbookflag | invflag | chrflag | SelectorActive()) == 0) {
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
    int i;

    CountDown = 3;
    if (!Qfromoptions) {
        PostGamePad(2, 0, 0, 0);
        stream_stop();
        GLUE_SuspendGame();
    }
    stream_pause();
    if (!Qfromoptions) {
        for (i = 1; i != -1; i--) {
            ignore_buttons = 1;
            TSK_Sleep(1);
        }
    }
    while (1) {
        if (!sbookflag)
            break;
        if (options_pad < 0)
            break;
        int omp = myplr;

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
                b = 0x80;
                g = 0x80;
                r = 0x80;
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
    int pc;
    int count;

    lus = lus + move;
    pc = plr[options_pad]._pClass;
    for (int i = 0; i < 4; i++) {
        switch (i) {
        case 0:
            if (plr[options_pad]._pBaseStr == MaxStats[pc][i])
                chrbtn[options_pad][i] = 1;
            else
                chrbtn[options_pad][i] = 0;
            break;
        case 1:
            if (plr[options_pad]._pBaseMag == MaxStats[pc][i])
                chrbtn[options_pad][i] = 1;
            else
                chrbtn[options_pad][i] = 0;
            break;
        case 2:
            if (plr[options_pad]._pBaseDex == MaxStats[pc][i])
                chrbtn[options_pad][i] = 1;
            else
                chrbtn[options_pad][i] = 0;
            break;
        case 3:
            if (plr[options_pad]._pBaseVit == MaxStats[pc][i])
                chrbtn[options_pad][i] = 1;
            else
                chrbtn[options_pad][i] = 0;
            break;
        }
    }
    if (move == 0)
        move = -1;
    if (lus < 0)
        lus = 3;
    if (lus >= 4)
        lus = 0;
    count = 0;
    while (chrbtn[myplr][lus]) {
            lus = lus + move;
            if (lus < 0)
                lus = 3;
            if (lus >= 4)
                lus = 0;
            count++;
        if (count >= 4)
            break;
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
    switch (lus) {
    case 0:
        NetSendCmdParam1(1, 3, 1);
        if (plr[options_pad]._pBaseStr == MaxStats[pc][lus])
            chrbtn[options_pad][lus] = 1;
        else
            chrbtn[options_pad][lus] = 0;
        break;
    case 1:
        NetSendCmdParam1(1, 4, 1);
        if (plr[options_pad]._pBaseMag == MaxStats[pc][lus])
            chrbtn[options_pad][lus] = 1;
        else
            chrbtn[options_pad][lus] = 0;
        break;
    case 2:
        NetSendCmdParam1(1, 5, 1);
        if (plr[options_pad]._pBaseDex == MaxStats[pc][lus])
            chrbtn[options_pad][lus] = 1;
        else
            chrbtn[options_pad][lus] = 0;
        break;
    case 3:
        NetSendCmdParam1(1, 6, 1);
        if (plr[options_pad]._pBaseVit == MaxStats[pc][lus])
            chrbtn[options_pad][lus] = 1;
        else
            chrbtn[options_pad][lus] = 0;
        break;
    }
    ChrCheckValidButton(0);
    BuildChr();
}

int CPrintString(int No, char *pszStr, int Just)
{
    TXT_JUST Justify;
    unsigned char R, G, B;

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
    return MediumFont.Print(0, No * 13 + 10, pszStr, Justify, InfoBoxRect, R, G, B);
}

void InitControlPan(void)
{
    int i;

    scx1 = 0;
    scy1 = 0;
    scx2 = 0;
    scy2 = 0;
    pManaBuff = 0;
    pLifeBuff = 0;
    pPanelText = LoadFileInMem("CtrlPan\\SmalText.CEL", 0);
    pChrPanel = LoadFileInMem("Data\\Char.CEL", 0);
    pSpellCels = LoadFileInMem("CtrlPan\\SpelIcon.CEL", 0);
    SetSpellTrans(0);
    talkflag = 0;
    if (gbMaxPlayers != 1) {
        pMultiBtns = 0;
        pTalkBtns = 0;
        talkofs = 0;
        sgszTalkMsg[0] = 0;
        for (i = 0; i < 2; i++)
            sgbPlrTalkTbl[i] = 1;
        for (i = 0; i < 3; i++)
            talkbtndown[i] = 0;
    }
    panelflag = 0;
    lvlbtndown = 0;
    pPanelButtons = LoadFileInMem("CtrlPan\\Panel8bu.CEL", 0);
    panbtndown = 0;
    pChrButtons = 0;
    for (i = 0; i < 4; i++)
        chrbtn[myplr][i] = 0;
    pDurIcons = 0;
    strcpy(infostr, GetStr(0x4FA));
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
    setXYWH(FT4, 0, 0, 0x160, 0xF0);
    setRGB0(FT4, 0x18, 0x18, 0x18);
    setSemiTrans(FT4, 1);
    setShadeTex(FT4, 0);
    FT4->u1--;
    FT4->u3--;
    FT4->v2--;
    FT4->v3--;
    FT4->tpage |= 0x40;
    if (leveltype) {
        FT4->r0 = 0;
        FT4->g0 = 0xFF;
        FT4->b0 = 0xFF;
    }
}

/* definition after its users -- see the unsized declaration at the top */
unsigned char chrbtn[2][4];
