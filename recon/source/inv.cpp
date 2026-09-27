/* INV.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/INV.CPP,
 * refs/devilution/Source/inv.cpp.  Large TU (57 functions): the item-manipulation LOGIC group
 * ports from the PC twins; the TextDat/POLY_FT4 DRAWING group (InvDrawSlot*, DrawInv*, DoThatDrawInv,
 * PrintStat) and the gamepad cursor-navigation group (InvGetItemWH/InvAlignObject/InvSetItemCurs/
 * InvMoveCurs*) are PSX-native (no PC twin) and are reconstructed separately from the oracle+SYM.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_inv.h"
#include "source/gen/externs_inv.h"
#include "source/gen/protos_inv.h"
#include "source/diablo.h"

#define MAXBELTITEMS 8

#define ITYPE_NONE -1
#define ITYPE_GOLD 0xB

#define IMISC_BOOK    0x18
#define IMISC_SCROLL  0x15
#define IMISC_SCROLLT 0x16
#define IMISC_STAFF   0x17

#define INVLOC_HAND_LEFT 4

#define CURSOR_HAND 1
#define CMD_PUTITEM 0xA

#define NUM_INV_GRID_ELEM 40
#define ILOC_TWOHAND 2
#define ICLASS_WEAPON 1
#define INVLOC_HAND_RIGHT 5
#define GOLD_MAX_LIMIT 5000
#define GOLD_MEDIUM_LIMIT 2500
#define GOLD_SMALL_LIMIT 1000
#define ICURS_GOLD_SMALL 4
#define ICURS_GOLD_MEDIUM 5
#define ICURS_GOLD_LARGE 6

/* verbatim PsyQ 4.0 LIBGPU.H primitive macros */
struct P_TAG {
    unsigned addr : 24;
    unsigned len : 8;
    unsigned char r0, g0, b0, code;
};
typedef unsigned char u_char;
typedef unsigned long u_long;
#define setlen(p, _len)   (((P_TAG *)(p))->len  = (u_char)(_len))
#define setcode(p, _code) (((P_TAG *)(p))->code = (u_char)(_code))
#define getlen(p)         (u_char)(((P_TAG *)(p))->len)
#define getcode(p)        (u_char)(((P_TAG *)(p))->code)
#define setSemiTrans(p, abe) \
	((abe)?setcode(p, getcode(p)|0x02):setcode(p, getcode(p)&~0x02))
#define setShadeTex(p, tge) \
	((tge)?setcode(p, getcode(p)|0x01):setcode(p, getcode(p)&~0x01))
#define setRGB0(p, _r0, _g0, _b0) (p)->r0 = _r0, (p)->g0 = _g0, (p)->b0 = _b0

/* TU data (.sdata, tentative definitions) — this TU owns these (every %gp_rel oracle reference
 * is inside asm/nonmatchings/inv/); preinv.cpp/coreinv.cpp only `extern` them. */
int InvBackY;
struct TextDat *InvPanelTData;
struct TextDat *InvGfxTData;
int InvCursPos;
int ItemNo;
int ItemW;
int ItemH;
int InvPageNo;
int InvPageFlag;
int InvBackAY;
unsigned char invflag;
unsigned char drawsbarflag;
int D_8011C324;
int D_8011C2FC;
int D_8011C2F8;
int D_8011C304;
struct RECT BRect;
int D_8011C300;
int CursGlow;
int CursGlowDx;
int D_8011C2F4;

void FreeInvGFX(void)
{
}

void RemoveSpdBarItem(int pnum, int iv)
{
    plr[pnum].SpdList[iv]._itype = ITYPE_NONE;
    CalcPlrScrolls(pnum);
    if (plr[pnum]._pRSplType == 2 /* RSPLTYPE_SCROLL */) {
        if (plr[pnum]._pRSpell != -1 /* SPL_INVALID */) {
            if (!(plr[pnum]._pScrlSpells & (1 << (plr[pnum]._pRSpell - 1)))) {
                plr[pnum]._pRSpell = -1;
            }
        }
    }
}

void CheckInvScrn(void)
{
    if (_pcurs[myplr] >= 12 /* CURSOR_FIRSTITEM */) {
        CheckInvPaste(myplr, MouseX, MouseY);
    } else {
        CheckInvCut(myplr, MouseX, MouseY);
    }
}

void CheckItemStats(int pnum)
{
    PlayerStruct *p = &plr[pnum];

    p->HoldItem._iStatFlag = 0;
    if (p->_pStrength >= p->HoldItem._iMinStr
        && p->_pMagic >= (unsigned char)p->HoldItem._iMinMag
        && p->_pDexterity >= p->HoldItem._iMinDex) {
        p->HoldItem._iStatFlag = 1;
    }
}

void CheckBookLevel(int pnum)
{
    int slvl;

    if (plr[pnum].HoldItem._iMiscId != IMISC_BOOK)
        return;
    plr[pnum].HoldItem._iMinMag = spelldata[plr[pnum].HoldItem._iSpell].sMinInt;
    slvl = plr[pnum]._pSplLvl[plr[pnum].HoldItem._iSpell];
    while (slvl != 0) {
        plr[pnum].HoldItem._iMinMag += 20 * plr[pnum].HoldItem._iMinMag / 100;
        slvl--;
        if (plr[pnum].HoldItem._iMinMag + 20 * plr[pnum].HoldItem._iMinMag / 100 > 255) {
            plr[pnum].HoldItem._iMinMag = 255;
            slvl = 0;
        }
    }
}

unsigned char UseScroll(void)
{
    int i;

    if (_pcurs[myplr] != CURSOR_HAND)
        return 0;
    if (leveltype == 0 /* DTYPE_TOWN */ && !spelldata[plr[myplr]._pRSpell].sTownSpell)
        return 0;

    for (i = 0; i < plr[myplr]._pNumInv; i++) {
        if (plr[myplr].InvList[i]._itype != ITYPE_NONE
            && (plr[myplr].InvList[i]._iMiscId == IMISC_SCROLL || plr[myplr].InvList[i]._iMiscId == IMISC_SCROLLT)
            && plr[myplr].InvList[i]._iSpell == plr[myplr]._pRSpell) {
            return 1;
        }
    }
    for (i = 0; i < MAXBELTITEMS; i++) {
        if (plr[myplr].SpdList[i]._itype != ITYPE_NONE
            && (plr[myplr].SpdList[i]._iMiscId == IMISC_SCROLL || plr[myplr].SpdList[i]._iMiscId == IMISC_SCROLLT)
            && plr[myplr].SpdList[i]._iSpell == plr[myplr]._pRSpell) {
            return 1;
        }
    }

    return 0;
}

void UseStaffCharge(PlayerStruct *ptrplr)
{
    if (ptrplr->InvBody[INVLOC_HAND_LEFT]._itype != ITYPE_NONE
        && ptrplr->InvBody[INVLOC_HAND_LEFT]._iMiscId == IMISC_STAFF
        && ptrplr->InvBody[INVLOC_HAND_LEFT]._iSpell == ptrplr->_pRSpell
        && ptrplr->InvBody[INVLOC_HAND_LEFT]._iCharges > 0) {
        ptrplr->InvBody[INVLOC_HAND_LEFT]._iCharges--;
        CalcPlrStaff(ptrplr);
    }
}

unsigned char UseStaff(void)
{
    if (_pcurs[myplr] != CURSOR_HAND)
        return 0;
    if (plr[myplr].InvBody[INVLOC_HAND_LEFT]._itype != ITYPE_NONE
        && plr[myplr].InvBody[INVLOC_HAND_LEFT]._iMiscId == IMISC_STAFF
        && plr[myplr].InvBody[INVLOC_HAND_LEFT]._iSpell == plr[myplr]._pRSpell
        && plr[myplr].InvBody[INVLOC_HAND_LEFT]._iCharges > 0) {
        return 1;
    }

    return 0;
}

void StartGoldDrop(void)
{
    initialDropGoldIndex = _pcursinvitem[sel_data];
    if (_pcursinvitem[sel_data] < 0x2F /* INVITEM_INV_LAST+1 */)
        initialDropGoldValue = plr[myplr].InvList[_pcursinvitem[sel_data] - 7 /* INVITEM_INV_FIRST */]._ivalue;
    else
        initialDropGoldValue = plr[myplr].SpdList[_pcursinvitem[sel_data] - 0x2F /* INVITEM_BELT_FIRST */]._ivalue;
    dropGoldFlag = 1;
    dropGoldValue = 0;
}

int CalculateGold(int pnum)
{
    int i;
    long gold;

    gold = 0;
    for (i = 0; i < MAXBELTITEMS; i++) {
        if (plr[pnum].SpdList[i]._itype == ITYPE_GOLD) {
            gold += plr[pnum].SpdList[i]._ivalue;
            force_redraw = 255;
        }
    }
    for (i = 0; i < plr[pnum]._pNumInv; i++) {
        if (plr[pnum].InvList[i]._itype == ITYPE_GOLD)
            gold += plr[pnum].InvList[i]._ivalue;
    }

    return gold;
}

void RemoveInvItem(int pnum, int iv)
{
    int i, j;

    iv++;

    for (i = 0; i < 40 /* NUM_INV_GRID_ELEM */; i++) {
        if (plr[pnum].InvGrid[i] == iv || plr[pnum].InvGrid[i] == -iv) {
            plr[pnum].InvGrid[i] = 0;
        }
    }

    iv--;
    plr[pnum]._pNumInv--;

    if (plr[pnum]._pNumInv > 0 && plr[pnum]._pNumInv != iv) {
        plr[pnum].InvList[iv] = plr[pnum].InvList[plr[pnum]._pNumInv];

        for (j = 0; j < 40 /* NUM_INV_GRID_ELEM */; j++) {
            if (plr[pnum].InvGrid[j] == plr[pnum]._pNumInv + 1) {
                plr[pnum].InvGrid[j] = iv + 1;
            }
            if (plr[pnum].InvGrid[j] == -(plr[pnum]._pNumInv + 1)) {
                plr[pnum].InvGrid[j] = -(iv + 1);
            }
        }
    }

    CalcPlrScrolls(pnum);

    if (plr[pnum]._pRSplType == 2 /* RSPLTYPE_SCROLL */) {
        if (plr[pnum]._pRSpell != -1 /* SPL_INVALID */) {
            if (!(plr[pnum]._pScrlSpells & (1 << (plr[pnum]._pRSpell - 1)))) {
                plr[pnum]._pRSpell = -1;
            }
            force_redraw = 255;
        }
    }
}

void RemoveScroll(int pnum)
{
    int i;

    for (i = 0; i < plr[pnum]._pNumInv; i++) {
        if (plr[pnum].InvList[i]._itype != ITYPE_NONE
            && (plr[pnum].InvList[i]._iMiscId == IMISC_SCROLL || plr[pnum].InvList[i]._iMiscId == IMISC_SCROLLT)
            && plr[pnum].InvList[i]._iSpell == plr[pnum]._pSpell) {
            RemoveInvItem(pnum, i);
            CalcPlrScrolls(pnum);
            return;
        }
    }
    for (i = 0; i < MAXBELTITEMS; i++) {
        if (plr[pnum].SpdList[i]._itype != ITYPE_NONE
            && (plr[pnum].SpdList[i]._iMiscId == IMISC_SCROLL || plr[pnum].SpdList[i]._iMiscId == IMISC_SCROLLT)
            && plr[pnum].SpdList[i]._iSpell == plr[pnum]._pSpell) {
            RemoveSpdBarItem(pnum, i);
            CalcPlrScrolls(pnum);
            return;
        }
    }
}

unsigned char TryInvPut(void)
{
    int Dist;

    if (numitems >= 0x7A /* MAXITEMS */) {
        PlaySFX(0x3D3);
        return 0;
    }

    if (CanPut(plr[myplr]._px, plr[myplr]._py))
        return 1;

    Dist = 1;
    {
        for (int d = 0; d < 8; d++) {
            int dir;
            if (CanPut(plr[myplr]._px + offset_x[d] * Dist, plr[myplr]._py + offset_y[d] * Dist))
                return 1;
        }
    }
    return 0;
}

void DoTelekinesis(void)
{
    if (_pcursobj[sel_data] != -1)
        NetSendCmdParam1(1, 0x1B /* CMD_OPOBJT */, _pcursobj[sel_data]);
    if (_pcursitem[sel_data] != -1)
        NetSendCmdGItem(1, 0x28 /* CMD_REQUESTAGITEM */, myplr, myplr, _pcursitem[sel_data]);
    if (_pcursmonst[sel_data] != -1 && !M_Talker(_pcursmonst[sel_data]) && monster[_pcursmonst[sel_data]].mtalkmsg == 0)
        NetSendCmdParam1(1, 0x1C /* CMD_KNOCKBACK */, _pcursmonst[sel_data]);
    NewCursor(CURSOR_HAND);
}

void InvGetItem(int pnum, int ii)
{
    int j, jj;

    if (dropGoldFlag) {
        dropGoldFlag = 0;
        dropGoldValue = 0;
    }

    if (dung_map[item[ii]._ix][item[ii]._iy].dItem != 0) {
        if (myplr == pnum && _pcurs[myplr] >= 12 /* CURSOR_FIRSTITEM */)
            NetSendCmdPItem(1, 0x56 /* CMD_SYNCPUTITEM */, plr[myplr]._px, plr[myplr]._py);
        item[ii]._iCreateInfo &= 0x7FFF /* ~CF_PREGEN */;
        plr[pnum].HoldItem = item[ii];
        CheckQuestItem(pnum);
        CheckBookLevel(pnum);
        CheckItemStats(pnum);
        dung_map[item[ii]._ix][item[ii]._iy].dItem = 0;
        j = 0;
        while (j < numitems) {
            jj = itemactive[j];
            if (jj == ii) {
                DeleteItem(jj, j);
                j = 0;
            } else {
                j++;
            }
        }
        _pcursitem[sel_data] = -1;
        NewCursor(plr[pnum].HoldItem._iCurs + 12 /* ICSTART */);
    }
}

unsigned char DropItemBeforeTrig(void)
{
    if (TryInvPut()) {
        NetSendCmdPItem(1, CMD_PUTITEM, cursmx, cursmy);
        NewCursor(CURSOR_HAND);
        return 1;
    }

    return 0;
}

unsigned char AutoPlace(int pnum, int ii, int sx, int sy, unsigned char saveflag)
{
    int i, j, xx, yy;
    unsigned char done;

    done = 1;
    yy = 10 * (ii / 10);
    if (yy < 0) {
        yy = 0;
    }
    for (j = 0; j < sy && done; j++) {
        if (yy >= NUM_INV_GRID_ELEM) {
            done = 0;
        }
        xx = ii % 10;
        if (xx < 0) {
            xx = 0;
        }
        for (i = 0; i < sx && done; i++) {
            if (xx >= 10) {
                done = 0;
            } else {
                done = plr[pnum].InvGrid[xx + yy] == 0;
            }
            xx++;
        }
        yy += 10;
    }
    if (done && saveflag) {
        plr[pnum].InvList[plr[pnum]._pNumInv] = plr[pnum].HoldItem;
        plr[pnum]._pNumInv++;
        yy = 10 * (ii / 10);
        if (yy < 0) {
            yy = 0;
        }
        for (j = 0; j < sy; j++) {
            xx = ii % 10;
            if (xx < 0) {
                xx = 0;
            }
            for (i = 0; i < sx; i++) {
                if (i == 0 && j == sy - 1) {
                    plr[pnum].InvGrid[xx + yy] = plr[pnum]._pNumInv;
                } else {
                    plr[pnum].InvGrid[xx + yy] = -plr[pnum]._pNumInv;
                }
                xx++;
            }
            yy += 10;
        }
        CalcPlrScrolls(pnum);
    }
    return done;
}

unsigned char SpecialAutoPlace(int pnum, int ii, int sx, int sy, unsigned char saveflag)
{
    int i, j, xx, yy;
    unsigned char done;

    done = 1;
    yy = 10 * (ii / 10);
    if (yy < 0) {
        yy = 0;
    }
    for (j = 0; j < sy && done; j++) {
        if (yy >= NUM_INV_GRID_ELEM) {
            done = 0;
        }
        xx = ii % 10;
        if (xx < 0) {
            xx = 0;
        }
        for (i = 0; i < sx && done; i++) {
            if (xx >= 10) {
                done = 0;
            } else {
                done = plr[pnum].InvGrid[xx + yy] == 0;
            }
            xx++;
        }
        yy += 10;
    }
    if (!done) {
        if (sx > 1 || sy > 1) {
            done = 0;
        } else {
            for (i = 0; i < MAXBELTITEMS; i++) {
                if (plr[pnum].SpdList[i]._itype == ITYPE_NONE) {
                    done = 1;
                    break;
                }
            }
        }
    }
    if (done && saveflag) {
        plr[pnum].InvList[plr[pnum]._pNumInv] = plr[pnum].HoldItem;
        plr[pnum]._pNumInv++;
        yy = 10 * (ii / 10);
        if (yy < 0) {
            yy = 0;
        }
        for (j = 0; j < sy; j++) {
            xx = ii % 10;
            if (xx < 0) {
                xx = 0;
            }
            for (i = 0; i < sx; i++) {
                if (i == 0 && j == sy - 1) {
                    plr[pnum].InvGrid[xx + yy] = plr[pnum]._pNumInv;
                } else {
                    plr[pnum].InvGrid[xx + yy] = -plr[pnum]._pNumInv;
                }
                xx++;
            }
            yy += 10;
        }
        CalcPlrScrolls(pnum);
    }
    return done;
}

unsigned char GoldAutoPlace(int pnum)
{
    int i, ii, xx, yy;
    unsigned char done;

    done = 0;
    for (i = 0; i < plr[pnum]._pNumInv && !done; i++) {
        if (plr[pnum].InvList[i]._itype == ITYPE_GOLD) {
            if (plr[pnum].HoldItem._ivalue + plr[pnum].InvList[i]._ivalue <= GOLD_MAX_LIMIT) {
                plr[pnum].InvList[i]._ivalue = plr[pnum].HoldItem._ivalue + plr[pnum].InvList[i]._ivalue;
                if (plr[pnum].InvList[i]._ivalue >= GOLD_MEDIUM_LIMIT)
                    plr[pnum].InvList[i]._iCurs = ICURS_GOLD_LARGE;
                else if (plr[pnum].InvList[i]._ivalue <= GOLD_SMALL_LIMIT)
                    plr[pnum].InvList[i]._iCurs = ICURS_GOLD_SMALL;
                else
                    plr[pnum].InvList[i]._iCurs = ICURS_GOLD_MEDIUM;
                plr[pnum]._pGold = CalculateGold(pnum);
                done = 1;
            }
        }
    }

    if (!done)
        for (i = 0; i < plr[pnum]._pNumInv && !done; i++) {
            if (plr[pnum].InvList[i]._itype == ITYPE_GOLD && plr[pnum].InvList[i]._ivalue < GOLD_MAX_LIMIT) {
                if (plr[pnum].HoldItem._ivalue + plr[pnum].InvList[i]._ivalue <= GOLD_MAX_LIMIT) {
                    plr[pnum].InvList[i]._ivalue = plr[pnum].HoldItem._ivalue + plr[pnum].InvList[i]._ivalue;
                    if (plr[pnum].InvList[i]._ivalue >= GOLD_MEDIUM_LIMIT)
                        plr[pnum].InvList[i]._iCurs = ICURS_GOLD_LARGE;
                    else if (plr[pnum].InvList[i]._ivalue <= GOLD_SMALL_LIMIT)
                        plr[pnum].InvList[i]._iCurs = ICURS_GOLD_SMALL;
                    else
                        plr[pnum].InvList[i]._iCurs = ICURS_GOLD_MEDIUM;
                    plr[pnum]._pGold = CalculateGold(pnum);
                    done = 1;
                }
            }
        }

    if (!done)
        for (i = 39; i >= 0 && !done; i--) {
            yy = 10 * (i / 10);
            xx = i % 10;
            if (plr[pnum].InvGrid[xx + yy] == 0) {
                ii = plr[pnum]._pNumInv;
                plr[pnum].InvList[ii] = plr[pnum].HoldItem;
                plr[pnum]._pNumInv = plr[pnum]._pNumInv + 1;
                plr[pnum].InvGrid[xx + yy] = plr[pnum]._pNumInv;
                if (plr[pnum].HoldItem._ivalue >= GOLD_MEDIUM_LIMIT)
                    plr[pnum].InvList[ii]._iCurs = ICURS_GOLD_LARGE;
                else if (plr[pnum].HoldItem._ivalue <= GOLD_SMALL_LIMIT)
                    plr[pnum].InvList[ii]._iCurs = ICURS_GOLD_SMALL;
                else
                    plr[pnum].InvList[ii]._iCurs = ICURS_GOLD_MEDIUM;
                plr[pnum]._pGold = CalculateGold(pnum);
                done = 1;
            }
        }

    return done;
}

unsigned char WeaponAutoPlace(int pnum)
{
    if (plr[pnum].HoldItem._iLoc != ILOC_TWOHAND) {
        if (plr[pnum].InvBody[INVLOC_HAND_LEFT]._itype != ITYPE_NONE && plr[pnum].InvBody[INVLOC_HAND_LEFT]._iClass == ICLASS_WEAPON)
            return 0;
        if (plr[pnum].InvBody[INVLOC_HAND_RIGHT]._itype != ITYPE_NONE && plr[pnum].InvBody[INVLOC_HAND_RIGHT]._iClass == ICLASS_WEAPON)
            return 0;

        if (plr[pnum].InvBody[INVLOC_HAND_LEFT]._itype == ITYPE_NONE) {
            NetSendCmdChItem(1, INVLOC_HAND_LEFT);
            plr[pnum].InvBody[INVLOC_HAND_LEFT] = plr[pnum].HoldItem;
            return 1;
        }
        if (plr[pnum].InvBody[INVLOC_HAND_RIGHT]._itype == ITYPE_NONE && plr[pnum].InvBody[INVLOC_HAND_LEFT]._iLoc != ILOC_TWOHAND) {
            NetSendCmdChItem(1, INVLOC_HAND_RIGHT);
            plr[pnum].InvBody[INVLOC_HAND_RIGHT] = plr[pnum].HoldItem;
            return 1;
        }
        return 0;
    }

    if (plr[pnum].InvBody[INVLOC_HAND_LEFT]._itype != ITYPE_NONE || plr[pnum].InvBody[INVLOC_HAND_RIGHT]._itype != ITYPE_NONE)
        return 0;
    NetSendCmdChItem(1, INVLOC_HAND_LEFT);
    plr[pnum].InvBody[INVLOC_HAND_LEFT] = plr[pnum].HoldItem;
    return 1;
}

int SwapItem(ItemStruct *a, ItemStruct *b)
{
    ItemStruct h;

    h = *a;
    *a = *b;
    *b = h;

    return h._iCurs + 12 /* CURSOR_FIRSTITEM */;
}

void InvGetItemWH(int Pos)
{
    int v;

    v = plr[myplr].InvGrid[Pos];
    if (v == 0)
        return;
    if (v <= 0)
        v = -v;
    ItemNo = v;
    ItemNo = plr[myplr].InvList[ItemNo - 1]._iCurs;
    ItemW = InvItemWidth[ItemNo + 12] >> 4;
    ItemH = InvItemHeight[ItemNo + 12] >> 4;
}

void InvAlignObject(void)
{
    int w, h;

    if ((unsigned int)(InvCursPos - 25) >= 40)
        return;
    if (_pcurs[myplr] < 12)
        return;

    ItemNo = plr[myplr].HoldItem._iCurs;
    w = (InvItemWidth[ItemNo + 12] >> 4) - 1;
    ItemW = w;
    h = (InvItemHeight[ItemNo + 12] >> 4) - 1;
    ItemH = h;

    if ((unsigned int)(InvCursPos - 25) < 10) {
        if (InvCursPos + w < 0x23) {
            InvCursPos = 0x22 - w;
        }
    }
    if ((unsigned int)(InvCursPos - 0x23) < 10) {
        if (InvCursPos + w < 0x2D) {
            InvCursPos = 0x2C - w;
        }
    }
    if ((unsigned int)(InvCursPos - 0x2D) < 10) {
        if (InvCursPos + w < 0x37) {
            InvCursPos = 0x36 - w;
        }
    }
    if ((unsigned int)(InvCursPos - 0x37) < 10) {
        if (InvCursPos + w < 0x41) {
            InvCursPos = 0x40 - w;
        }
    }
    while (InvCursPos + h * 10 < 0x41) {
        InvCursPos -= 10;
    }
}

unsigned char UseInvItem(int pnum, int cii)
{
    int c;
    int idata;
    int it;
    ItemStruct *Item;
    unsigned char speedlist;

    if (plr[pnum]._pInvincible && plr[pnum]._pHitPoints == 0 && pnum == myplr)
        return 1;
    if (_pcurs[myplr] != CURSOR_HAND)
        return 1;
    if (stextflag)
        return 1;
    if (cii < 6)
        return 0;

    if (cii < 0x2F) {
        c = cii - 7;
        Item = &plr[pnum].InvList[c];
        speedlist = 0;
    } else {
        if (talkflag)
            return 1;
        c = cii - 0x2F;
        Item = &plr[pnum].SpdList[c];
        speedlist = 1;
    }

    it = Item->IDidx;
    switch (it) {
    case 0x11 /* IDI_MUSHROOM */:
        sfxdelay = 10;
        if (plr[pnum]._pClass == 0)
            sfxdnum = 0x331;
        else if (plr[pnum]._pClass == 1)
            sfxdnum = 0x2C3;
        else if (plr[pnum]._pClass == 2)
            sfxdnum = 0x25B;
        return 1;
    case 0x13 /* IDI_FUNGALTM */:
        PlaySFX(0x1C /* IS_IBOOK */);
        sfxdelay = 10;
        if (plr[pnum]._pClass == 0)
            sfxdnum = 0x2EE;
        else if (plr[pnum]._pClass == 1)
            sfxdnum = 0x280;
        else if (plr[pnum]._pClass == 2)
            sfxdnum = 0x218;
        return 1;
    }

    if (!AllItemsUseable[it])
        return 0;

    if (!Item->_iStatFlag) {
        if (plr[pnum]._pClass == 0)
            PlaySFX(0x2D8);
        else if (plr[pnum]._pClass == 1)
            PlaySFX(0x270);
        else if (plr[pnum]._pClass == 2)
            PlaySFX(0x208);
        return 1;
    }

    if (Item->_iMiscId == 0 && Item->_itype == ITYPE_GOLD) {
        StartGoldDrop();
        return 1;
    }
    if (dropGoldFlag) {
        dropGoldFlag = 0;
        dropGoldValue = 0;
    }

    if ((Item->_iMiscId == IMISC_SCROLL || Item->_iMiscId == IMISC_SCROLLT) && gbMaxPlayers == 2
        && Item->_iSpell == 0x20 && plr[pnum ^ 1].plractive)
        return 0;
    if ((Item->_iMiscId == IMISC_SCROLL || Item->_iMiscId == IMISC_SCROLLT) && currlevel == 0
        && !spelldata[Item->_iSpell].sTownSpell) {
        if (plr[pnum]._pClass == 0)
            PlaySFX(0x2EC);
        else if (plr[pnum]._pClass == 1)
            PlaySFX(0x27E);
        else if (plr[pnum]._pClass == 2)
            PlaySFX(0x216);
        return 0;
    }

    idata = ItemCAnimTbl[Item->_iCurs];
    if (Item->_iMiscId == IMISC_BOOK)
        PlaySFX(0x2E /* IS_RBOOK */);
    else if (pnum == myplr)
        PlaySFX(ItemInvSnds[idata]);

    UseItem(pnum, Item->_iMiscId, Item->_iSpell);

    if (speedlist) {
        RemoveSpdBarItem(pnum, c);
        return 1;
    } else {
        if (plr[pnum].InvList[c]._iMiscId == 0x2A)
            return 1;
        RemoveInvItem(pnum, c);
    }
    return 1;
}

void CheckQuestItem(int pnum)
{
    if (plr[pnum].HoldItem.IDidx == 0xA /* IDI_OPTAMULET */) {
        quests[8]._qactive = 3 /* QUEST_DONE */;
        quests[8].pad_for_laz = 1;
    }

    if (plr[pnum].HoldItem.IDidx == 0x11 /* IDI_MUSHROOM */) {
        quests[1].pad_for_laz = 1;
        if (quests[1]._qactive == 2 /* QUEST_ACTIVE */ && quests[1]._qvar1 == 3 /* QS_MUSHSPAWNED */) {
            sfxdelay = 10;
            if (plr[pnum]._pClass == 0)
                sfxdnum = 0x331;
            else if (plr[pnum]._pClass == 1)
                sfxdnum = 0x2C3;
            else if (plr[pnum]._pClass == 2)
                sfxdnum = 0x25B;
            quests[1]._qvar1 = 4 /* QS_MUSHPICKED */;
        }
        NetSendCmdQuest(1, 1);
    }

    if (plr[pnum].HoldItem.IDidx == 0x10 /* IDI_ANVIL */) {
        quests[10].pad_for_laz = 1;
        if (quests[10]._qactive == 1) {
            quests[10]._qactive = 2;
            quests[10]._qvar1 = 1;
        }
        if (quests[10]._qlog == 1) {
            sfxdelay = 10;
            if (plr[myplr]._pClass == 0)
                sfxdnum = 0x32B;
            else if (plr[myplr]._pClass == 1)
                sfxdnum = 0x2BD;
            else if (plr[myplr]._pClass == 2)
                sfxdnum = 0x255;
        }
        NetSendCmdQuest(1, 0xA);
    }

    if (plr[pnum].HoldItem.IDidx == 0xF /* IDI_GLDNELIX */) {
        if (quests[4]._qactive != 3 /* QUEST_DONE */) {
            sfxdelay = 0x1E;
            if (plr[myplr]._pClass == 0)
                sfxdnum = 0x32A;
            else if (plr[myplr]._pClass == 1)
                sfxdnum = 0x2BC;
            else if (plr[myplr]._pClass == 2)
                sfxdnum = 0x254;
        }
    }

    if (plr[pnum].HoldItem.IDidx == 0x9 /* IDI_ROCK */) {
        quests[0].pad_for_laz = 1;
        if (quests[0]._qactive == 1) {
            quests[0]._qactive = 2;
            quests[0]._qvar1 = 2;
        }
        if (quests[0]._qlog == 1) {
            sfxdelay = 10;
            if (plr[myplr]._pClass == 0)
                sfxdnum = 0x329;
            else if (plr[myplr]._pClass == 1)
                sfxdnum = 0x2BB;
            else if (plr[myplr]._pClass == 2)
                sfxdnum = 0x253;
        }
        NetSendCmdQuest(1, 0);
    }

    if (plr[pnum].HoldItem.IDidx == 0x1C /* IDI_ARMOFVAL */) {
        quests[9].pad_for_laz = 1;
        quests[9]._qactive = 3 /* QUEST_DONE */;
        NetSendCmdQuest(1, 9);
        sfxdelay = 0x14;
        if (plr[myplr]._pClass == 0)
            sfxdnum = 0x32D;
        else if (plr[myplr]._pClass == 1)
            sfxdnum = 0x2BF;
        else if (plr[myplr]._pClass == 2)
            sfxdnum = 0x257;
    }
}

char CheckInvHLight(void)
{
    int r;
    unsigned int u;
    char rv;
    ItemStruct *pi;
    PlayerStruct *p;
    int nGold;

    r = InvCursPos;
    if (r >= 0x49)
        return -1;

    _infoclr[sel_data] = 0;
    p = &plr[myplr];
    ClearPanel();
    rv = -1;

    if (_pcurs[myplr] < 12 /* CURSOR_FIRSTITEM */) {
        nGold = 0;
        pi = &p->HoldItem;
        goto tail;
    }

    u = r;
    if (u < 4) {
        rv = 0;
        pi = &p->InvBody[0];
    } else if (u == 4) {
        rv = 1;
        pi = &p->InvBody[1];
    } else if (u == 5) {
        rv = 2;
        pi = &p->InvBody[2];
    } else if (u == 6) {
        rv = 3;
        pi = &p->InvBody[3];
    } else if (u - 7 < 6) {
        rv = 4;
        pi = &p->InvBody[4];
    } else if (u - 13 < 6) {
        pi = &p->InvBody[4];
        if (pi->_itype == ITYPE_NONE) {
            rv = 5;
        } else if (pi->_iLoc == ILOC_TWOHAND) {
            rv = 4;
        } else {
            rv = 5;
        }
        pi = &p->InvBody[5];
    } else if (u - 0x13 < 6) {
        rv = 6;
        pi = &p->InvBody[6];
    } else if (u - 25 < 40) {
        r = abs(p->InvGrid[u - 25]);
        if (r == 0)
            return -1;
        r--;
        rv = r + 7;
        pi = &p->InvList[r];
    } else if (u < 0x41) {
        goto tail;
    } else {
        r = u - 0x41;
        pi = &p->SpdList[r];
        drawsbarflag = 1;
        if (pi->_itype == ITYPE_NONE)
            return -1;
        rv = r + 0x2F;
    }

tail:
    if (pi->_itype == ITYPE_NONE)
        return -1;

    if (pi->_itype == ITYPE_GOLD) {
        nGold = pi->_ivalue;
        sprintf(_infostr[sel_data], GetStr(0x4FF), nGold, get_pieces_str(nGold));
        return rv;
    }

    if (invflag && !pi->_iStatFlag) {
        _infoclr[sel_data] = 2;
    } else if (pi->_iMagical == 1) {
        _infoclr[sel_data] = 1;
    } else if (pi->_iMagical == 2) {
        _infoclr[sel_data] = 3;
    }

    strcpy(_infostr[sel_data], MakeItemStr(pi, pi->_iName, 0x100));
    if (pi->_iIdentified) {
        strcpy(_infostr[sel_data], MakeItemStr(pi, pi->_iIName, 0x100));
        PrintItemDetails(pi);
    } else {
        PrintItemDur(pi);
    }

    return rv;
}

void AutoGetItem(int pnum, int ii)
{
    int i, g;
    int w, h;
    int idx;
    unsigned char done;

    if (dropGoldFlag) {
        dropGoldFlag = 0;
        dropGoldValue = 0;
    }

    if (ii != 0x7F /* MAXITEMS */) {
        if (dung_map[item[ii]._ix][item[ii]._iy].dItem == 0)
            return;
    }

    item[ii]._iCreateInfo &= 0x7FFF /* ~CF_PREGEN */;
    plr[pnum].HoldItem = item[ii];
    CheckQuestItem(pnum);
    CheckBookLevel(pnum);
    CheckItemStats(pnum);
    SetICursor(plr[pnum].HoldItem._iCurs + 12 /* CURSOR_FIRSTITEM */);
    PlaySFX(0x32);
    if (plr[pnum].HoldItem._itype == ITYPE_GOLD) {
        done = GoldAutoPlace(pnum);
    } else {
        done = 0;
        g = plr[pnum]._pgfxnum & 0xF;
        if ((g == 0 /* ANIM_ID_UNARMED */ || g == 1 /* ANIM_ID_UNARMED_SHIELD */)
            && plr[pnum]._pmode <= 3 /* PM_WALK3 */) {
            if (plr[pnum].HoldItem._iStatFlag) {
                if (plr[pnum].HoldItem._iClass == ICLASS_WEAPON) {
                    done = WeaponAutoPlace(pnum);
                    if (done)
                        CalcPlrInv(pnum, 1);
                }
            }
        }
        if (!done) {
            w = icursW28;
            h = icursH28;
            if (w == 1 && h == 1) {
                idx = plr[pnum].HoldItem.IDidx;
                if (plr[pnum].HoldItem._iStatFlag && AllItemsUseable[idx]) {
                    for (i = 0; i < MAXBELTITEMS && !done; i++) {
                        if (plr[pnum].SpdList[i]._itype == ITYPE_NONE) {
                            plr[pnum].SpdList[i] = plr[pnum].HoldItem;
                            CalcPlrScrolls(pnum);
                            drawsbarflag = 1;
                            done = 1;
                        }
                    }
                }
                for (i = 30; i <= 39 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 20; i <= 29 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 10; i <= 19 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 0; i <= 9 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
            }
            if (w == 1 && h == 2) {
                for (i = 29; i >= 20 && !done; i--) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 9; i >= 0 && !done; i--) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 19; i >= 10 && !done; i--) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
            }
            if (w == 1 && h == 3) {
                for (i = 0; i < 20 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
            }
            if (w == 2 && h == 2) {
                for (i = 0; i < 10 && !done; i++) {
                    done = AutoPlace(pnum, AP2x2Tbl[i], w, h, 1);
                }
                for (i = 21; i < 29 && !done; i += 2) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 1; i < 9 && !done; i += 2) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 10; i < 19 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
            }
            if (w == 2 && h == 3) {
                for (i = 0; i < 9 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
                for (i = 10; i < 19 && !done; i++) {
                    done = AutoPlace(pnum, i, w, h, 1);
                }
            }
        }
    }
    if (done) {
        int j, jj;

        dung_map[item[ii]._ix][item[ii]._iy].dItem = 0;
        j = 0;
        while (j < numitems) {
            jj = itemactive[j];
            if (jj == ii) {
                DeleteItem(jj, j);
                j = 0;
            } else {
                j++;
            }
        }
    } else {
        if (pnum == myplr) {
            if (plr[pnum]._pClass == 0)
                PlaySFX(ENG_random(3) + 0x2D9);
            else if (plr[pnum]._pClass == 1)
                PlaySFX(ENG_random(3) + 0x271);
            else if (plr[pnum]._pClass == 2)
                PlaySFX(ENG_random(3) + 0x209);
        }
        plr[pnum].HoldItem = item[ii];
        RespawnItem(ii, 1);
        NetSendCmdPItem(1, 0xB /* CMD_RESPAWNITEM */, item[ii]._ix, item[ii]._iy);
        plr[pnum].HoldItem._itype = ITYPE_NONE;
    }
}

int InvPutItem(int pnum, int x, int y)
{
    int ii;
    unsigned char done;

    if (numitems >= 0x7A) {
        PlaySFX(0x3D3);
        return -1;
    }

    if (FindGetItem(plr[pnum].HoldItem.IDidx, plr[pnum].HoldItem._iCreateInfo, plr[pnum].HoldItem._iSeed) != -1) {
        SyncGetItem(x, y, plr[pnum].HoldItem.IDidx, plr[pnum].HoldItem._iCreateInfo, plr[pnum].HoldItem._iSeed);
    }

    done = 0;
    x = plr[myplr]._px;
    y = plr[myplr]._py;
    if (!CanPut(x, y)) {
        for (int Dist = 1; Dist < 8 && !done; Dist++) {
            for (int d = 0; d < 8 && !done; d++) {
                x = plr[myplr]._px + offset_x[d] * Dist;
                y = plr[myplr]._py + offset_y[d] * Dist;
                if (CanPut(x, y))
                    done = 1;
            }
        }
    }
    if (!CanPut(x, y))
        return -1;

    ii = itemavail[0];
    dung_map[x][y].dItem = ii + 1;
    itemavail[0] = itemavail[0x7E - numitems];
    itemactive[numitems] = ii;
    item[ii] = plr[pnum].HoldItem;
    item[ii]._ix = x;
    item[ii]._iy = y;
    RespawnItem(ii, 1);
    numitems++;
    NewCursor(CURSOR_HAND);
    PlaySFX(0x1F);
    return ii;
}

void SyncGetItem(int x, int y, int idx, unsigned short ci, int iseed)
{
    int ii;

    if (dung_map[x][y].dItem) {
        ii = dung_map[x][y].dItem - 1;
        if (item[ii].IDidx == idx && item[ii]._iSeed == iseed && item[ii]._iCreateInfo == ci) {
            /* ii already correct */
        } else {
            ii = FindGetItem(idx, ci, iseed);
        }
    } else {
        ii = FindGetItem(idx, ci, iseed);
    }

    if (ii != -1) {
        int j, jj;

        dung_map[item[ii]._ix][item[ii]._iy].dItem = 0;
        j = 0;
        while (j < numitems) {
            jj = itemactive[j];
            if (jj == ii) {
                DeleteItem(jj, j);
                j = 0;
            } else {
                j++;
            }
        }
    }
}

int SyncPutItem(int pnum, int x, int y, int idx, unsigned short icreateinfo, int iseed, unsigned char Id, int dur, int mdur, int ch, int mch, int ivalue, unsigned long ibuff)
{
    unsigned char done;
    int d, ii;
    int i, j, l;
    int xx, yy;
    int xp, yp;

    if (numitems >= 0x7A) {
        PlaySFX(0x3D3);
        return -1;
    }

    if (FindGetItem(idx, icreateinfo, iseed) != -1) {
        SyncGetItem(x, y, idx, icreateinfo, iseed);
    }

    d = GetDirection(plr[pnum]._px, plr[pnum]._py, x, y);
    xx = x - plr[pnum]._px;
    yy = y - plr[pnum]._py;
    if (abs(xx) > 1 || abs(yy) > 1) {
        x = plr[pnum]._px + offset_x[d];
        y = plr[pnum]._py + offset_y[d];
    }
    if (!CanPut(x, y)) {
        d = (d - 1) & 7;
        x = plr[pnum]._px + offset_x[d];
        y = plr[pnum]._py + offset_y[d];
        if (!CanPut(x, y)) {
            d = (d + 2) & 7;
            x = plr[pnum]._px + offset_x[d];
            y = plr[pnum]._py + offset_y[d];
            if (!CanPut(x, y)) {
                done = 0;
                for (l = 1; l < 50; l++) {
                    if (done)
                        break;
                    for (j = -l; j <= l; j++) {
                        if (done)
                            break;
                        yp = j + plr[pnum]._py;
                        for (i = -l; i <= l; i++) {
                            if (done)
                                break;
                            xp = i + plr[pnum]._px;
                            if (CanPut(xp, yp)) {
                                done = 1;
                                x = xp;
                                y = yp;
                            }
                        }
                    }
                }
                if (!done)
                    return -1;
            }
        }
    }

    ii = itemavail[0];
    dung_map[x][y].dItem = ii + 1;
    itemavail[0] = itemavail[0x7E - numitems];
    itemactive[numitems] = ii;

    if (idx == 0x17) {
        RecreateEar(ii, icreateinfo, iseed, Id, dur, mdur, ch, mch, ivalue, ibuff);
    } else {
        RecreateItem(ii, idx, icreateinfo, iseed, ivalue, ibuff);
        if (Id)
            item[ii]._iIdentified = 1;
        item[ii]._iDurability = dur;
        item[ii]._iMaxDur = mdur;
        item[ii]._iCharges = ch;
        item[ii]._iMaxCharges = mch;
    }

    item[ii]._ix = x;
    item[ii]._iy = y;
    RespawnItem(ii, 1);
    numitems++;
    return ii;
}

void InvSetItemCurs(void)
{
    int ItemNo;

    ItemNo = plr[myplr].InvGrid[InvCursPos - 25];
    if (ItemNo == 0)
        return;
    if (_pcurs[myplr] >= 12)
        return;
    if ((unsigned int)(InvCursPos - 25) >= 40)
        return;

    if (InvCursPos >= 26) {
        while (plr[myplr].InvGrid[InvCursPos - 26] == ItemNo || plr[myplr].InvGrid[InvCursPos - 26] == -ItemNo) {
            InvCursPos--;
        }
    }

    if (InvCursPos >= 35) {
        while (plr[myplr].InvGrid[InvCursPos - 35] == ItemNo || plr[myplr].InvGrid[InvCursPos - 35] == -ItemNo) {
            InvCursPos -= 10;
        }
    }

    if (InvCursPos < 25)
        InvCursPos = 25;
}

void InvMoveCursLeft(void)
{
    int ItemInc = 0;
    int OldPos;

    OldPos = InvCursPos;

    if (_pcurs[myplr] < 12) {
        switch (InvCursPos) {
        case 0:
        case 4:
        case 6:
            InvCursPos = 7;
            break;
        case 5:
            InvCursPos = 19;
            break;
        case 7:
            InvCursPos = 13;
            break;
        case 13:
            InvCursPos = 5;
            break;
        case 19:
            InvCursPos = 4;
            break;
        default:
            if ((unsigned int)(InvCursPos - 25) < 40 || InvCursPos >= 0x41)
                ItemInc = 1;
            break;
        }
    } else {
        switch (InvCursPos) {
        case 0:
        case 6:
        case 19:
            break;
        case 4:
            InvCursPos = 5;
            break;
        case 5:
            InvCursPos = 4;
            break;
        case 7:
            InvCursPos = 13;
            break;
        case 13:
            InvCursPos = 7;
            break;
        default:
            if ((unsigned int)(InvCursPos - 25) < 40 || InvCursPos >= 0x41)
                ItemInc = 1;
            break;
        }
    }

    if ((unsigned int)(InvCursPos - 25) < 40) {
        InvCursPos -= ItemInc;
        if ((InvCursPos - 25) % 10 == 9 || (InvCursPos - 25) % 10 == -1) {
            InvCursPos += 10;
        }
    } else if (InvCursPos < 0x41) {
        /* nothing */
    } else if (InvCursPos < 0x42) {
        InvCursPos = InvCursPos + 7;
    } else {
        InvCursPos = InvCursPos - ItemInc;
    }

    InvSetItemCurs();
    if (OldPos != InvCursPos)
        PlaySFX(0x32);
}

void InvMoveCursRight(void)
{
    int ItemInc;
    int OldPos;

    OldPos = InvCursPos;

    if (_pcurs[myplr] < 12) {
        ItemInc = 0;
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
                InvCursPos = 6;
                goto tail2;
            case 4:
                InvCursPos = 19;
                goto tail2;
            case 5:
            case 6:
                InvCursPos = 13;
                goto tail2;
            case 7:
                InvCursPos = 4;
                goto tail2;
            case 13:
                InvCursPos = 7;
                goto tail2;
            case 19:
                InvCursPos = 5;
                goto tail2;
            default:
                break;
            }
        }

        if ((unsigned int)(InvCursPos - 25) < 40) {
            ItemInc = 1;
            if (plr[myplr].InvGrid[InvCursPos - 25] != 0) {
                InvGetItemWH(InvCursPos - 25);
                ItemInc = ItemW;
            }
        } else if (InvCursPos < 0x41) {
            /* ItemInc unchanged (0) */
        } else {
            ItemInc = 1;
        }
    } else {
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
            case 6:
            case 19:
                goto tail2;
            case 4:
                InvCursPos = 5;
                goto tail2;
            case 5:
                InvCursPos = 4;
                goto tail2;
            case 7:
                InvCursPos = 13;
                goto tail2;
            case 13:
                InvCursPos = 7;
                goto tail2;
            default:
                break;
            }
        }

        if ((unsigned int)(InvCursPos - 25) < 40) {
            ItemInc = 1;
            if (plr[myplr].InvGrid[InvCursPos - 25] != 0) {
                InvGetItemWH(InvCursPos - 25);
                ItemInc = ItemW;
            }
        }
        /* else: ItemInc left as-is (matches retail's uninitialized-but-unused path) */
    }

tail2:
    if ((unsigned int)(InvCursPos - 25) < 40) {
        if (_pcurs[myplr] < 12) {
            ItemW = 0;
        } else {
            ItemNo = plr[myplr].HoldItem._iCurs;
            ItemW = (InvItemWidth[ItemNo + 12] >> 4) - 1;
        }

        InvCursPos = InvCursPos + ItemInc;
        if ((InvCursPos + ItemW - 25) % 10 == 0) {
            InvCursPos = InvCursPos - 10 + ItemW;
        }
    } else if (InvCursPos >= 0x41) {
        if (InvCursPos < 0x48) {
            InvCursPos = InvCursPos + ItemInc;
        } else {
            InvCursPos = InvCursPos - 7;
        }
    }

    InvSetItemCurs();
    if (OldPos != InvCursPos)
        PlaySFX(0x32);
}

void InvMoveCursUp(void)
{
    int ItemInc = 0;
    int OldPos;

    OldPos = InvCursPos;

    if (_pcurs[myplr] < 12) {
        switch (InvCursPos) {
        case 5:
            InvCursPos = 6;
            break;
        case 0:
        case 4:
        case 6:
        case 7:
            InvCursPos = 0;
            break;
        case 13:
            InvCursPos = 6;
            break;
        case 19:
            InvCursPos = 6;
            break;
        default:
            if ((unsigned int)(InvCursPos - 25) < 40) {
                if (InvCursPos < 35)
                    InvCursPos = 19;
                else
                    ItemInc = 1;
            } else if (InvCursPos >= 0x41) {
                InvCursPos -= 9;
            }
            break;
        }
    } else {
        switch (InvCursPos) {
        case 0:
        case 4:
        case 5:
        case 6:
        case 7:
        case 13:
        case 19:
            break;
        default:
            if ((unsigned int)(InvCursPos - 25) < 40)
                ItemInc = 1;
            else if (InvCursPos >= 0x41)
                InvCursPos -= 9;
            break;
        }
    }

    if ((unsigned int)(InvCursPos - 25) < 40 && ItemInc != 0) {
        if (InvCursPos < 35) {
            switch (plr[myplr].HoldItem._iLoc) {
            case 1:
                InvCursPos = 7;
                break;
            case ILOC_TWOHAND:
                InvCursPos = 7;
                break;
            case 3:
                InvCursPos = 19;
                break;
            case 4:
                InvCursPos = 0;
                break;
            case 5:
                InvCursPos = 4;
                break;
            case 6:
                InvCursPos = 6;
                break;
            case 7:
            case 8:
                break;
            }
        } else {
            InvCursPos = InvCursPos - 10;
        }
    }

    InvSetItemCurs();
    if (OldPos != InvCursPos)
        PlaySFX(0x32);
}

void InvDrawSlots(void)
{
    int Bx, By;

    CursGlow = CursGlow + CursGlowDx;
    if (CursGlow <= 0) {
        CursGlow = 0;
        CursGlowDx = -8;
    }
    if (CursGlow < -0x7F) {
        CursGlow = -0x7F;
        CursGlowDx = 8;
    }

    InvDrawSlot(InvRect[0].X, InvRect[0].Y, 0x5C);
    InvDrawSlotBack(InvRect[0].X, InvRect[0].Y, 0x20, 0x20, InvSlotTable[0]);

    InvDrawSlot(InvRect[4].X, InvRect[4].Y, 0x5B);
    InvDrawSlotBack(InvRect[4].X, InvRect[4].Y, 0x10, 0x10, InvSlotTable[1]);

    InvDrawSlot(InvRect[5].X, InvRect[5].Y, 0x5B);
    InvDrawSlotBack(InvRect[5].X, InvRect[5].Y, 0x10, 0x10, InvSlotTable[2]);

    InvDrawSlot(InvRect[6].X, InvRect[6].Y, 0x5B);
    InvDrawSlotBack(InvRect[6].X, InvRect[6].Y, 0x10, 0x10, InvSlotTable[3]);

    InvDrawSlot(InvRect[7].X, InvRect[7].Y, 0x5D);
    InvDrawSlotBack(InvRect[7].X, InvRect[7].Y, 0x20, 0x30, InvSlotTable[4]);

    InvDrawSlot(InvRect[13].X, InvRect[13].Y, 0x5D);
    InvDrawSlotBack(InvRect[13].X, InvRect[13].Y, 0x20, 0x30, InvSlotTable[5]);

    InvDrawSlot(InvRect[19].X, InvRect[19].Y, 0x5D);
    InvDrawSlotBack(InvRect[19].X, InvRect[19].Y, 0x20, 0x30, InvSlotTable[6]);

    InvDrawSlot(InvRect[25].X, InvRect[25].Y, 0x5F);

    for (Bx = 25; Bx < 65; Bx++) {
        InvDrawSlotBack(InvRect[Bx].X, InvRect[Bx].Y, 0x10, 0x10, InvSlotTable[Bx]);
    }

    InvDrawSlot(InvRect[65].X, InvRect[65].Y, 0x5E);

    for (By = 65; By < 73; By++) {
        InvDrawSlotBack(InvRect[By].X, InvRect[By].Y, 0x10, 0x10, InvSlotTable[By]);
    }
}

void DrawInvCursor(void)
{
    struct POLY_FT4 *Ft4;
    struct TextDat *TData;
    int ItemX, ItemY;
    int LoopX, LoopY;
    int GoldAmount;

    ItemH = 1;
    ItemW = 1;

    if (_pcurs[myplr] < 12)
        goto no_item;

    if (plr[myplr].HoldItem._itype != -1) {
        if (plr[myplr].HoldItem._itype == ITYPE_GOLD) {
            GoldAmount = plr[myplr].HoldItem._ivalue;
            if (GoldAmount < 0x9C4) {
                if (GoldAmount < 0x3E9)
                    plr[myplr].HoldItem._iCurs = 4;
                else
                    plr[myplr].HoldItem._iCurs = 5;
            } else {
                plr[myplr].HoldItem._iCurs = 6;
            }
        }
    }

    ItemNo = plr[myplr].HoldItem._iCurs;
    ItemW = InvItemWidth[ItemNo + 12] >> 4;
    ItemH = InvItemHeight[ItemNo + 12] >> 4;
    ItemX = InvRect[InvCursPos].X;
    ItemY = InvRect[InvCursPos].Y;

    TData = (ItemNo < 0x32) ? InvPanelTData : InvGfxTData;

    if (InvCursPos == 7 || InvCursPos == 0x13 || InvCursPos == 0xD) {
        if (ItemW == 1)
            ItemX = ItemX + 8;
        if (ItemH == 1)
            ItemY = ItemY + 0x10;
        if (ItemH == 2)
            ItemY = ItemY + 8;
    }

    Ft4 = TData->PrintFt4(InvGfxTable[ItemNo], ItemX + 0x7A, ItemY - InvBackY + 0x1A, 0, D_8011C304 + 1, 0);
    Ft4->code = Ft4->code & 0xFC;
    if (plr[myplr].HoldItem._iStatFlag) {
        Ft4->r0 = 0x80;
        Ft4->g0 = 0x80;
        Ft4->b0 = 0x80;
    } else {
        Ft4->r0 = 0;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
    }

    Ft4 = TData->PrintFt4(InvGfxTable[ItemNo], ItemX + 0x82, ItemY - InvBackY + 0x22, 0, D_8011C304 + 1, 0);
    Ft4->r0 = 0x10;
    Ft4->g0 = 0x10;
    Ft4->b0 = 0x10;
    Ft4->code = (Ft4->code | 2) & 0xFE;

    InvSlotTable[InvCursPos] = InvSlotTable[InvCursPos] | 2;
    goto tail;

no_item:
    if (plr[myplr].InvGrid[InvCursPos - 25] != 0) {
        InvSetItemCurs();
        InvGetItemWH(InvCursPos - 25);
    }
    if (InvCursPos < 0x41) {
        ItemH = 1;
        ItemW = 1;
    }
    if (ItemH > 0) {
        for (LoopY = 0; LoopY < ItemH; LoopY++) {
            if (ItemW > 0) {
                for (LoopX = 0; LoopX < ItemW; LoopX++) {
                    InvSlotTable[InvCursPos + LoopX + LoopY * 10] = 2;
                }
            }
        }
    }

    if ((unsigned int)(_pcurs[myplr] - 2) < 2 || _pcurs[myplr] == 4) {
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
                ItemW = 2;
                ItemH = 2;
                break;
            case 4:
            case 5:
            case 6:
                ItemW = 1;
                ItemH = 1;
                break;
            case 7:
            case 13:
            case 19:
                ItemW = 2;
                ItemH = 3;
                break;
            default:
                InvGetItemWH(InvCursPos - 25);
                ItemW = 1;
                ItemH = 1;
                break;
            }
        } else {
            InvGetItemWH(InvCursPos - 25);
            ItemW = 1;
            ItemH = 1;
        }

        ItemX = InvRect[InvCursPos].X + 8;
        ItemY = InvRect[InvCursPos].Y + 8;
        if (ItemW == 2)
            ItemX = InvRect[InvCursPos].X + 0x10;
        if (ItemH == 2)
            ItemY = InvRect[InvCursPos].Y + 0x10;
        if (ItemH == 3)
            ItemY = ItemY + 0x10;

        Ft4 = InvGfxTData->PrintFt4(_pcurs[myplr] - 2, ItemX + 0x80, ItemY - InvBackY + 0x20, 0, 0x100, 0);
    }

tail:
    if (InvCursPos >= 0x19 && ItemH > 0) {
        for (LoopY = 0; LoopY < ItemH; LoopY++) {
            if (ItemW > 0) {
                for (LoopX = 0; LoopX < ItemW; LoopX++) {
                    InvSlotTable[InvCursPos + LoopX + LoopY * 10] |= 2;
                }
            }
        }
    }
}
void DoThatDrawInv(void)
{
    int Loop;
    int ii;
    int ItemX, ItemY, ItemNo;
    struct RECT ClipRect;

    PRIM_FullScreen(0xFB);
    InvPageFlag = 0;
    GLUE_SetShowGameScreenFlag(0);
    GLUE_SetShowPanelFlag(0);

    for (Loop = 0x48; Loop >= 0; Loop--)
        InvSlotTable[Loop] = 0;

    DrawInvBack();

    ClipRect.x = 0x7E;
    ClipRect.y = 0x1E;
    ClipRect.w = 0xB8;
    ClipRect.h = 0x60;
    PRIM_Clip(&ClipRect, D_8011C2F4);

    DrawInvStats();
    DrawInvMsg();
    DrawInvHelpTxt();

    if (plr[myplr].InvBody[0]._itype != -1) {
        InvSlotTable[0] = 1;
        InvDrawItem(InvRect[0].X, InvRect[0].Y, plr[myplr].InvBody[0]._iCurs, !!plr[myplr].InvBody[0]._iStatFlag, 0);
    }

    if (plr[myplr].InvBody[1]._itype != -1) {
        InvSlotTable[4] = 1;
        InvDrawItem(InvRect[4].X, InvRect[4].Y, plr[myplr].InvBody[1]._iCurs, !!plr[myplr].InvBody[1]._iStatFlag, 0);
    }

    if (plr[myplr].InvBody[2]._itype != -1) {
        InvSlotTable[5] = 1;
        InvDrawItem(InvRect[5].X, InvRect[5].Y, plr[myplr].InvBody[2]._iCurs, !!plr[myplr].InvBody[2]._iStatFlag, 0);
    }

    if (plr[myplr].InvBody[3]._itype != -1) {
        InvSlotTable[6] = 1;
        InvDrawItem(InvRect[6].X, InvRect[6].Y, plr[myplr].InvBody[3]._iCurs, !!plr[myplr].InvBody[3]._iStatFlag, 0);
    }

    if (plr[myplr].InvBody[4]._itype != -1) {
        InvSlotTable[7] = 1;
        ItemNo = plr[myplr].InvBody[4]._iCurs;
        ItemX = InvRect[7].X;
        ItemY = InvRect[7].Y;
        if (InvItemWidth[ItemNo + 12] == 0x10)
            ItemX = ItemX + 8;
        if (InvItemHeight[ItemNo + 12] == 0x20)
            ItemY = ItemY + 8;
        InvDrawItem(ItemX, ItemY, ItemNo, !!plr[myplr].InvBody[4]._iStatFlag, 0);

        if (plr[myplr].InvBody[4]._iLoc == ILOC_TWOHAND) {
            InvSlotTable[13] = 1;
            ItemNo = plr[myplr].InvBody[4]._iCurs;
            ItemX = InvRect[13].X;
            ItemY = InvRect[13].Y;
            if (InvItemWidth[ItemNo + 12] == 0x10)
                ItemX = ItemX + 8;
            if (InvItemHeight[ItemNo + 12] == 0x20)
                ItemY = ItemY + 8;
            InvDrawItem(ItemX, ItemY, ItemNo, !!plr[myplr].InvBody[5]._iStatFlag, 1);
        }
    }

    if (plr[myplr].InvBody[5]._itype != -1) {
        InvSlotTable[13] = 1;
        ItemNo = plr[myplr].InvBody[5]._iCurs;
        ItemX = InvRect[13].X;
        ItemY = InvRect[13].Y;
        if (InvItemWidth[ItemNo + 12] == 0x10)
            ItemX = ItemX + 8;
        if (InvItemHeight[ItemNo + 12] == 0x20)
            ItemY = ItemY + 8;
        InvDrawItem(ItemX, ItemY, ItemNo, !!plr[myplr].InvBody[5]._iStatFlag, 0);
    }

    if (plr[myplr].InvBody[6]._itype != -1) {
        InvSlotTable[19] = 1;
        InvDrawItem(InvRect[19].X, InvRect[19].Y, plr[myplr].InvBody[6]._iCurs, !!plr[myplr].InvBody[6]._iStatFlag, 0);
    }

    for (Loop = 0; Loop < 40; Loop++) {
        InvSlotTable[25 + Loop] = plr[myplr].InvGrid[Loop] != 0;
        ii = plr[myplr].InvGrid[Loop];
        if (ii > 0) {
            if (plr[myplr]._pNumInv >= ii) {
                int iv = ii - 1;

                ItemNo = plr[myplr].InvList[iv]._iCurs;
                ItemX = InvRect[25 + Loop].X;
                ItemY = InvRect[25 + Loop].Y + 0x10 - InvItemHeight[ItemNo + 12];
                InvDrawItem(ItemX, ItemY, ItemNo, !!plr[myplr].InvList[iv]._iStatFlag, 0);
            }
        }
    }

    for (Loop = 0; Loop < 8; Loop++) {
        if (plr[myplr].SpdList[Loop]._itype != -1) {
            InvSlotTable[65 + Loop] = 1;
            InvDrawItem(InvRect[65 + Loop].X, InvRect[65 + Loop].Y, plr[myplr].SpdList[Loop]._iCurs, !!plr[myplr].SpdList[Loop]._iStatFlag, 0);
        }
    }

    DrawInvCursor();
    InvDrawSlots();
}

void DrawInvStats(void)
{
    Dialog InvBack;
    char c;
    char chrstr[10];
    long mind, maxd;
    int hper, ac;

    InvBack.SetOTpos(0xF9);
    InvBack.SetBack(5);
    InvBack.SetRGB(BORDERR, BORDERG, BORDERB);
    InvBack.Back(0xA, 0x20, 0x74, 0xB0);

    BRect.x = 0xB;
    BRect.y = 0x20;
    BRect.w = 0x72;
    BRect.h = 0xB0;

    c = (plr[options_pad]._pBaseStr < plr[options_pad]._pStrength) ? 1 : 0;
    if (plr[options_pad]._pStrength < plr[options_pad]._pBaseStr)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), plr[options_pad]._pStrength);
    PrintStat(0xC, 0x419, chrstr, c);

    c = (plr[options_pad]._pBaseMag < plr[options_pad]._pMagic) ? 1 : 0;
    if (plr[options_pad]._pMagic < plr[options_pad]._pBaseMag)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), plr[options_pad]._pMagic);
    PrintStat(0x19, 0x26F, chrstr, c);

    c = (plr[options_pad]._pBaseDex < plr[options_pad]._pDexterity) ? 1 : 0;
    if (plr[options_pad]._pDexterity < plr[options_pad]._pBaseDex)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), plr[options_pad]._pDexterity);
    PrintStat(0x26, 0xFF, chrstr, c);

    c = (plr[options_pad]._pBaseVit < plr[options_pad]._pVitality) ? 1 : 0;
    if (plr[options_pad]._pVitality < plr[options_pad]._pBaseVit)
        c = 2;
    sprintf(chrstr, GetStr(0x4FD), plr[options_pad]._pVitality);
    PrintStat(0x32, 0x4B7, chrstr, c);

    if (plr[options_pad]._pIBonusToHit < 0)
        c = 2;
    else
        c = (0 < plr[options_pad]._pIBonusToHit) ? 1 : 0;
    hper = 0x32 + (plr[options_pad]._pDexterity >> 1) + plr[options_pad]._pIBonusToHit;
    sprintf(chrstr, GetStr(0x503), hper);
    PrintStat(0x40, 0x495, chrstr, c);

    if (plr[options_pad]._pIBonusDam < 0)
        c = 2;
    else
        c = (0 < plr[options_pad]._pIBonusDam) ? 1 : 0;

    mind = plr[options_pad]._pIMinDam;
    mind = mind + (mind * plr[options_pad]._pIBonusDam) / 100;
    mind = mind + plr[options_pad]._pIBonusDamMod;
    if (plr[options_pad].InvBody[4]._itype == 3 && plr[options_pad]._pClass == 1) {
        mind = mind + plr[options_pad]._pDamageMod;
    } else if (plr[options_pad].InvBody[4]._itype == 3) {
        mind = mind + (plr[options_pad]._pDamageMod >> 1);
    } else {
        mind = mind + plr[options_pad]._pDamageMod;
    }

    maxd = plr[options_pad]._pIMaxDam;
    maxd = maxd + (maxd * plr[options_pad]._pIBonusDam) / 100;
    maxd = maxd + plr[options_pad]._pIBonusDamMod;
    if (plr[options_pad].InvBody[4]._itype == 3 && plr[options_pad]._pClass == 1) {
        maxd = maxd + plr[options_pad]._pDamageMod;
    } else if (plr[options_pad].InvBody[4]._itype == 3) {
        maxd = maxd + (plr[options_pad]._pDamageMod >> 1);
    } else {
        maxd = maxd + plr[options_pad]._pDamageMod;
    }

    sprintf(chrstr, GetStr(0x501), mind, maxd);
    PrintStat(0x4D, 0xE1, chrstr, c);

    c = 0;
    if (plr[options_pad]._pHitPoints != plr[options_pad]._pMaxHP) {
        c = (plr[options_pad]._pMaxHPBase < plr[options_pad]._pMaxHP) ? 1 : 0;
    }
    sprintf(chrstr, "%li/%li", plr[options_pad]._pHitPoints >> 6, plr[options_pad]._pMaxHP >> 6);
    PrintStat(0x5C, 0x24D, chrstr, c);

    c = 0;
    if (plr[options_pad]._pMana != plr[options_pad]._pMaxMana) {
        c = (plr[options_pad]._pMaxManaBase < plr[options_pad]._pMaxMana) ? 1 : 0;
    }
    sprintf(chrstr, "%li/%li", plr[options_pad]._pMana >> 6, plr[options_pad]._pMaxMana >> 6);
    PrintStat(0x68, 0x27A, chrstr, c);

    if (plr[options_pad]._pIBonusAC < 0)
        c = 2;
    else
        c = (0 < plr[options_pad]._pIBonusAC) ? 1 : 0;
    ac = plr[options_pad]._pIAC + plr[options_pad]._pIBonusAC + plr[options_pad]._pDexterity / 5;
    sprintf(chrstr, GetStr(0x4FD), ac);
    PrintStat(0x75, 0x2A, chrstr, c);

    if (plr[options_pad]._pMagResist > 0)
        c = 1;
    else
        c = 0;
    if (plr[options_pad]._pMagResist < 0x4B) {
        sprintf(chrstr, GetStr(0x503), plr[options_pad]._pMagResist);
    } else {
        c = 3;
        sprintf(chrstr, GetStr(0x285));
    }
    PrintStat(0x84, 0x273, chrstr, c);

    if (plr[options_pad]._pFireResist > 0)
        c = 1;
    else
        c = 0;
    if (plr[options_pad]._pFireResist < 0x4B) {
        sprintf(chrstr, GetStr(0x503), plr[options_pad]._pFireResist);
    } else {
        c = 3;
        sprintf(chrstr, GetStr(0x285));
    }
    PrintStat(0x91, 0x157, chrstr, c);

    if (plr[options_pad]._pLghtResist > 0)
        c = 1;
    else
        c = 0;
    if (plr[options_pad]._pLghtResist < 0x4B) {
        sprintf(chrstr, GetStr(0x503), plr[options_pad]._pLghtResist);
    } else {
        c = 3;
        sprintf(chrstr, GetStr(0x285));
    }
    PrintStat(0x9E, 0x254, chrstr, c);

    sprintf(chrstr, GetStr(0x4FD), plr[options_pad]._pGold);
    PrintStat(0xAC, 0x191, chrstr, 0);
}

void CheckInvPaste(int pnum, int mx, int my)
{
    int r, sx, sy;
    int i, j, xx, yy, ii;
    unsigned char done, done2h;
    int il, cn, it, iv, ig;
    long gt;
    struct ItemStruct tempitem;

    cn = CURSOR_HAND;
    SetICursor(plr[pnum].HoldItem._iCurs + 12);
    i = mx + (icursW >> 1);
    j = my + (icursH >> 1);
    sx = icursW28;
    sy = icursH28;
    done = 0;
    for (r = 0; (unsigned int)r < 0x49 && !done; r++) {
        if (i >= InvRect[r].X && i < InvRect[r].X + 28) {
            if (j >= InvRect[r].Y - 29 && j < InvRect[r].Y) {
                done = 1;
                r--;
            }
        }
        if (r == 24) {
            if (!(sx & 1))
                i -= 14;
            if (!(sy & 1))
                j -= 14;
        }
        if (r == 64 && !(sy & 1))
            j += 14;
    }
    if (!done)
        goto end;

    il = 7;
    if (r >= 0 && r <= 3)
        il = 4;
    if (r >= 4 && r <= 5)
        il = 5;
    if (r == 6)
        il = 6;
    if (r >= 7 && r <= 18)
        il = 1;
    if (r >= 19 && r <= 24)
        il = 3;
    if (r >= 65 && r <= 72)
        il = 8;

    done = 0;
    if (plr[pnum].HoldItem._iLoc == il)
        done = 1;
    if (il == 1 && plr[pnum].HoldItem._iLoc == ILOC_TWOHAND) {
        il = 2;
        done = 1;
    }
    if (plr[pnum].HoldItem._iLoc == 7 && il == 8 && sx == 1 && sy == 1) {
        done = 1;
        if (!AllItemsUseable[plr[pnum].HoldItem.IDidx])
            done = 0;
        if (!plr[pnum].HoldItem._iStatFlag)
            done = 0;
        if (plr[pnum].HoldItem._itype == ITYPE_GOLD)
            done = 0;
    }

    it = 0;
    if (il == 7) {
        ii = r - 25;
        done = 1;
        if (plr[pnum].HoldItem._itype == ITYPE_GOLD) {
            yy = 10 * (ii / 10);
            xx = ii % 10;
            if (plr[pnum].InvGrid[xx + yy] != 0) {
                iv = plr[pnum].InvGrid[xx + yy];
                if (iv > 0) {
                    if (plr[pnum].InvList[iv - 1]._itype != ITYPE_GOLD)
                        it = iv;
                } else {
                    it = -iv;
                }
            }
        } else {
            yy = 10 * ((ii / 10) - ((sy - 1) >> 1));
            if (yy < 0)
                yy = 0;
            for (j = 0; j < sy && done; j++) {
                if (yy >= 40)
                    done = 0;
                xx = (ii % 10) - ((sx - 1) >> 1);
                if (xx < 0)
                    xx = 0;
                for (i = 0; i < sx && done; i++) {
                    if (xx >= 10) {
                        done = 0;
                    } else {
                        if (plr[pnum].InvGrid[xx + yy] != 0) {
                            iv = plr[pnum].InvGrid[xx + yy];
                            if (iv < 0)
                                iv = -iv;
                            if (it != 0) {
                                if (it != iv)
                                    done = 0;
                            } else {
                                it = iv;
                            }
                        }
                    }
                    xx++;
                }
                yy += 10;
            }
        }
    }

    if (!done)
        goto end;

    if (il != 7 && il != 8 && !plr[pnum].HoldItem._iStatFlag) {
        done = 0;
        if (plr[pnum]._pClass == 0)
            PlaySFX(0x2D8);
        else if (plr[pnum]._pClass == 1)
            PlaySFX(0x270);
        else if (plr[pnum]._pClass == 2)
            PlaySFX(0x208);
    }

    if (!done) {
        goto end;
    }

    if (pnum == myplr)
        PlaySFX(ItemInvSnds[ItemCAnimTbl[plr[pnum].HoldItem._iCurs]]);

    switch (il) {
    case 4: /* head */
        NetSendCmdChItem(0, 0);
        if (plr[pnum].InvBody[0]._itype == ITYPE_NONE)
            plr[pnum].InvBody[0] = plr[pnum].HoldItem;
        else
            cn = SwapItem(&plr[pnum].InvBody[0], &plr[pnum].HoldItem);
        break;
    case 5: /* ring */
        if (r == 4) {
            NetSendCmdChItem(0, 1);
            if (plr[pnum].InvBody[1]._itype == ITYPE_NONE)
                plr[pnum].InvBody[1] = plr[pnum].HoldItem;
            else
                cn = SwapItem(&plr[pnum].InvBody[1], &plr[pnum].HoldItem);
        } else {
            NetSendCmdChItem(0, 2);
            if (plr[pnum].InvBody[2]._itype == ITYPE_NONE)
                plr[pnum].InvBody[2] = plr[pnum].HoldItem;
            else
                cn = SwapItem(&plr[pnum].InvBody[2], &plr[pnum].HoldItem);
        }
        break;
    case 6: /* amulet */
        NetSendCmdChItem(0, 3);
        if (plr[pnum].InvBody[3]._itype == ITYPE_NONE)
            plr[pnum].InvBody[3] = plr[pnum].HoldItem;
        else
            cn = SwapItem(&plr[pnum].InvBody[3], &plr[pnum].HoldItem);
        break;
    case 1: /* one-hand */
        if (r <= 12) {
            if (plr[pnum].InvBody[4]._itype == ITYPE_NONE) {
                if (plr[pnum].InvBody[5]._itype == ITYPE_NONE || plr[pnum].InvBody[5]._iClass != plr[pnum].HoldItem._iClass) {
                    NetSendCmdChItem(0, 4);
                    plr[pnum].InvBody[4] = plr[pnum].HoldItem;
                } else {
                    NetSendCmdChItem(0, 5);
                    cn = SwapItem(&plr[pnum].InvBody[5], &plr[pnum].HoldItem);
                }
                break;
            }
            if (plr[pnum].InvBody[5]._itype == ITYPE_NONE || plr[pnum].InvBody[5]._iClass != plr[pnum].HoldItem._iClass) {
                NetSendCmdChItem(0, 4);
                cn = SwapItem(&plr[pnum].InvBody[4], &plr[pnum].HoldItem);
                break;
            }
            NetSendCmdChItem(0, 5);
            cn = SwapItem(&plr[pnum].InvBody[5], &plr[pnum].HoldItem);
            break;
        }
        if (plr[pnum].InvBody[5]._itype == ITYPE_NONE) {
            if (plr[pnum].InvBody[4]._itype == ITYPE_NONE || plr[pnum].InvBody[4]._iLoc != ILOC_TWOHAND) {
                if (plr[pnum].InvBody[4]._itype == ITYPE_NONE || plr[pnum].InvBody[4]._iClass != plr[pnum].HoldItem._iClass) {
                    NetSendCmdChItem(0, 5);
                    plr[pnum].InvBody[5] = plr[pnum].HoldItem;
                    break;
                }
                NetSendCmdChItem(0, 4);
                cn = SwapItem(&plr[pnum].InvBody[4], &plr[pnum].HoldItem);
                break;
            }
            NetSendCmdDelItem(0, 4);
            NetSendCmdChItem(0, 5);
            SwapItem(&plr[pnum].InvBody[5], &plr[pnum].InvBody[4]);
            cn = SwapItem(&plr[pnum].InvBody[5], &plr[pnum].HoldItem);
            break;
        }
        if (plr[pnum].InvBody[4]._itype != ITYPE_NONE && plr[pnum].InvBody[4]._iClass == plr[pnum].HoldItem._iClass) {
            NetSendCmdChItem(0, 4);
            cn = SwapItem(&plr[pnum].InvBody[4], &plr[pnum].HoldItem);
            break;
        }
        NetSendCmdChItem(0, 5);
        cn = SwapItem(&plr[pnum].InvBody[5], &plr[pnum].HoldItem);
        break;
    case 2: /* two-hand */
        NetSendCmdDelItem(0, 5);
        if (plr[pnum].InvBody[4]._itype != ITYPE_NONE && plr[pnum].InvBody[5]._itype != ITYPE_NONE) {
            tempitem = plr[pnum].HoldItem;
            if (plr[pnum].InvBody[5]._itype == 3)
                plr[pnum].HoldItem = plr[pnum].InvBody[5];
            else
                plr[pnum].HoldItem = plr[pnum].InvBody[4];
            if (pnum == myplr)
                SetCursor(plr[pnum].HoldItem._iCurs + 12);
            else
                SetICursor(plr[pnum].HoldItem._iCurs + 12);
            done2h = 0;
            for (i = 0; i < 40 && !done2h; i++)
                done2h = AutoPlace(pnum, i, icursW28, icursH28, 1);
            plr[pnum].HoldItem = tempitem;
            if (pnum == myplr)
                SetCursor(plr[pnum].HoldItem._iCurs + 12);
            else
                SetICursor(plr[pnum].HoldItem._iCurs + 12);
            if (!done2h)
                goto end;
            if (plr[pnum].InvBody[5]._itype == 3)
                plr[pnum].InvBody[5]._itype = ITYPE_NONE;
            else
                plr[pnum].InvBody[4]._itype = ITYPE_NONE;
        }
        if (plr[pnum].InvBody[4]._itype != ITYPE_NONE || plr[pnum].InvBody[5]._itype != ITYPE_NONE) {
            NetSendCmdChItem(0, 4);
            if (plr[pnum].InvBody[4]._itype == ITYPE_NONE)
                SwapItem(&plr[pnum].InvBody[4], &plr[pnum].InvBody[5]);
            cn = SwapItem(&plr[pnum].InvBody[4], &plr[pnum].HoldItem);
        } else {
            NetSendCmdChItem(0, 4);
            plr[pnum].InvBody[4] = plr[pnum].HoldItem;
        }
        break;
    case 3: /* chest */
        NetSendCmdChItem(0, 6);
        if (plr[pnum].InvBody[6]._itype == ITYPE_NONE)
            plr[pnum].InvBody[6] = plr[pnum].HoldItem;
        else
            cn = SwapItem(&plr[pnum].InvBody[6], &plr[pnum].HoldItem);
        break;
    case 7: /* inv */
        if (plr[pnum].HoldItem._itype == ITYPE_GOLD && it == 0) {
            ii = r - 25;
            yy = 10 * (ii / 10);
            xx = ii % 10;
            if (plr[pnum].InvGrid[yy + xx] > 0) {
                il = plr[pnum].InvGrid[yy + xx];
                il--;
                gt = plr[pnum].InvList[il]._ivalue;
                ig = plr[pnum].HoldItem._ivalue + gt;
                if (ig <= GOLD_MAX_LIMIT) {
                    plr[pnum].InvList[il]._ivalue = ig;
                    plr[pnum]._pGold += plr[pnum].HoldItem._ivalue;
                    if (ig >= GOLD_MEDIUM_LIMIT)
                        plr[pnum].InvList[il]._iCurs = ICURS_GOLD_LARGE;
                    else if (ig <= GOLD_SMALL_LIMIT)
                        plr[pnum].InvList[il]._iCurs = ICURS_GOLD_SMALL;
                    else
                        plr[pnum].InvList[il]._iCurs = ICURS_GOLD_MEDIUM;
                } else {
                    ig = GOLD_MAX_LIMIT - gt;
                    plr[pnum]._pGold += ig;
                    plr[pnum].HoldItem._ivalue -= ig;
                    plr[pnum].InvList[il]._ivalue = GOLD_MAX_LIMIT;
                    plr[pnum].InvList[il]._iCurs = ICURS_GOLD_LARGE;
                    if (plr[pnum].HoldItem._ivalue >= GOLD_MEDIUM_LIMIT)
                        cn = ICURS_GOLD_LARGE + 12;
                    else if (plr[pnum].HoldItem._ivalue <= GOLD_SMALL_LIMIT)
                        cn = ICURS_GOLD_SMALL + 12;
                    else
                        cn = ICURS_GOLD_MEDIUM + 12;
                }
            } else {
                il = plr[pnum]._pNumInv;
                plr[pnum].InvList[il] = plr[pnum].HoldItem;
                plr[pnum]._pNumInv++;
                plr[pnum].InvGrid[yy + xx] = plr[pnum]._pNumInv;
                plr[pnum]._pGold += plr[pnum].HoldItem._ivalue;
                if (plr[pnum].HoldItem._ivalue >= GOLD_MEDIUM_LIMIT)
                    plr[pnum].InvList[il]._iCurs = ICURS_GOLD_LARGE;
                else if (plr[pnum].HoldItem._ivalue <= GOLD_SMALL_LIMIT)
                    plr[pnum].InvList[il]._iCurs = ICURS_GOLD_SMALL;
                else
                    plr[pnum].InvList[il]._iCurs = ICURS_GOLD_MEDIUM;
            }
        } else {
            if (it == 0) {
                plr[pnum].InvList[plr[pnum]._pNumInv] = plr[pnum].HoldItem;
                plr[pnum]._pNumInv++;
                it = plr[pnum]._pNumInv;
            } else {
                il = it - 1;
                if (plr[pnum].HoldItem._itype == ITYPE_GOLD)
                    plr[pnum]._pGold += plr[pnum].HoldItem._ivalue;
                cn = SwapItem(&plr[pnum].InvList[il], &plr[pnum].HoldItem);
                if (plr[pnum].HoldItem._itype == ITYPE_GOLD)
                    plr[pnum]._pGold = CalculateGold(pnum);
                for (i = 0; i < 40; i++) {
                    if (plr[pnum].InvGrid[i] == it)
                        plr[pnum].InvGrid[i] = 0;
                    if (plr[pnum].InvGrid[i] == -it)
                        plr[pnum].InvGrid[i] = 0;
                }
            }
            ii = r - 25;
            yy = 10 * (ii / 10 - ((sy - 1) >> 1));
            if (yy < 0)
                yy = 0;
            for (j = 0; j < sy; j++) {
                xx = ii % 10 - ((sx - 1) >> 1);
                if (xx < 0)
                    xx = 0;
                for (i = 0; i < sx; i++) {
                    if (i != 0 || j != sy - 1)
                        plr[pnum].InvGrid[xx + yy] = -it;
                    else
                        plr[pnum].InvGrid[xx + yy] = it;
                    xx++;
                }
                yy += 10;
            }
        }
        break;
    case 8: /* belt */
        ii = r - 65;
        if (plr[pnum].HoldItem._itype == ITYPE_GOLD) {
            if (plr[pnum].SpdList[ii]._itype != ITYPE_NONE) {
                if (plr[pnum].SpdList[ii]._itype == ITYPE_GOLD) {
                    i = plr[pnum].HoldItem._ivalue + plr[pnum].SpdList[ii]._ivalue;
                    if (i <= GOLD_MAX_LIMIT) {
                        plr[pnum].SpdList[ii]._ivalue += plr[pnum].HoldItem._ivalue;
                        plr[pnum]._pGold += plr[pnum].HoldItem._ivalue;
                        if (i >= GOLD_MEDIUM_LIMIT)
                            plr[pnum].SpdList[ii]._iCurs = ICURS_GOLD_LARGE;
                        else if (i <= GOLD_SMALL_LIMIT)
                            plr[pnum].SpdList[ii]._iCurs = ICURS_GOLD_SMALL;
                        else
                            plr[pnum].SpdList[ii]._iCurs = ICURS_GOLD_MEDIUM;
                    } else {
                        i = GOLD_MAX_LIMIT - plr[pnum].SpdList[ii]._ivalue;
                        plr[pnum]._pGold += i;
                        plr[pnum].HoldItem._ivalue -= i;
                        plr[pnum].SpdList[ii]._ivalue = GOLD_MAX_LIMIT;
                        plr[pnum].SpdList[ii]._iCurs = ICURS_GOLD_LARGE;
                        if (plr[pnum].HoldItem._ivalue >= GOLD_MEDIUM_LIMIT)
                            cn = ICURS_GOLD_LARGE + 12;
                        else if (plr[pnum].HoldItem._ivalue <= GOLD_SMALL_LIMIT)
                            cn = ICURS_GOLD_SMALL + 12;
                        else
                            cn = ICURS_GOLD_MEDIUM + 12;
                    }
                } else {
                    plr[pnum]._pGold += plr[pnum].HoldItem._ivalue;
                    cn = SwapItem(&plr[pnum].SpdList[ii], &plr[pnum].HoldItem);
                }
            } else {
                plr[pnum].SpdList[ii] = plr[pnum].HoldItem;
                plr[pnum]._pGold += plr[pnum].HoldItem._ivalue;
            }
        } else if (plr[pnum].SpdList[ii]._itype == ITYPE_NONE) {
            plr[pnum].SpdList[ii] = plr[pnum].HoldItem;
        } else {
            cn = SwapItem(&plr[pnum].SpdList[ii], &plr[pnum].HoldItem);
            if (plr[pnum].HoldItem._itype == ITYPE_GOLD)
                plr[pnum]._pGold = CalculateGold(pnum);
        }
        drawsbarflag = 1;
        break;
    }

end:
    CalcPlrInv(pnum, 1);
    if (pnum == myplr)
        SetCursor(cn);
    if (!done)
        PlaySFX(0x3D3);
}

void DrawInvTSK(struct TASK *T)
{
    int omp = myplr;
    int osel = sel_data;
    CBlocks *BgBlocks;
    int ThisIsShit;
    int OldPad;
    int OldOt;

    if (!invflag || options_pad == -1) {
        D_8011C324 = 0;
        invflag = 0;
        options_pad = -1;
        goto end;
    }

    myplr = options_pad;
    PAD_GetPad(0, 0)->Flush();
    CDWAIT = 1;
    PauseMode = 1;
    GLUE_SuspendGame();
    if (sghMusic && sghMusic->sec_num < 4) {
        OldOt = 1;
        do {
            PauseMode = OldOt;
            GLUE_SuspendGame();
            TSK_Sleep(1);
        } while (sghMusic->sec_num < 4);
    }
    GLUE_SetShowPanelFlag(0);
    TSK_Sleep(1);
    stream_stop();
    if (SFXTab[1].used) {
        do {
            stream_stop();
            TSK_Sleep(1);
        } while (SFXTab[1].used);
    }
    GLUE_SuspendGame();
    GLUE_SetShowGameScreenFlag(0);
    TSK_Sleep(1);
    VID_SetDBuffer(1);
    if (_spselflag[0])
        TSK_Kill(_spselflag[0]);
    if (_spselflag[1])
        TSK_Kill(_spselflag[1]);
    _spselflag[0] = 0;
    _spselflag[1] = 0;
    _trigflag[sel_data] = 0;
    ClrCursor(0);
    ClrCursor(1);
    BgBlocks = BL_GetCurrentBlocks();
    if (leveltype == 0)
        BgBlocks->DumpMonsters();
    if (!InvGfxTData)
        InvGfxTData = GM_UseTexData(0xCF);
    if (_pcurs[myplr] == 9)
        _pcurs[myplr] = 1;
    InvSetItemCurs();
    ThisIsShit = 1;
    VID_SetDBuffer(0);
    TSK_Sleep(1);
    CDWAIT = 0;
    PauseMode = 0;
    OldPad = options_pad;

mainloop:
    if (ThisIsShit == 0)
        goto cleanup;
    ThisIsShit = 0;
    options_pad = OldPad;
    invflag = 1;

padloop:
    if (!invflag)
        goto after_pad;
    if (options_pad < 0)
        goto after_pad;
    OldOt = MediumFont.SetOTpos(0xFC);
    myplr = options_pad;
    sel_data = options_pad;
    ControlInv();
    if (options_pad != -1) {
        myplr = options_pad;
        sel_data = options_pad;
        DoThatDrawInv();
    }
    MediumFont.SetOTpos(OldOt);
    GLUE_SuspendGame();
    TSK_Sleep(1);
    if (plr[options_pad]._pHitPoints >> 6 > 0)
        goto padloop;
    PostGamePad(5, 0, 0, 0);
    options_pad = -1;

after_pad:
    if ((unsigned int)(_pcurs[myplr] - 2) < 2 || _pcurs[myplr] == 4)
        _pcurs[myplr] = 1;

    if (_pcurs[myplr] < 0xC)
        goto mainloop;
    if (TryInvPut())
        goto send;
    if (StoreAutoPlace())
        goto mainloop;
    if (numitems < 0x7A)
        goto send;
    PlaySFX(0x3D3);
    ThisIsShit = 1;
    goto mainloop;

send:
    NetSendCmdPItem(1, 0xA, 0, 0);
    goto mainloop;

cleanup:
    ClearPanel();
    stream_stop();
    if (SFXTab[1].used) {
        do {
            stream_stop();
            TSK_Sleep(1);
        } while (SFXTab[1].used);
    }
    VID_SetDBuffer(1);
    CDWAIT = 1;
    PauseMode = 1;
    GM_FinishedUsing(InvGfxTData);
    InvGfxTData = 0;
    if (leveltype == 0) {
        GM_ForceTpLoad(0xD0);
    } else {
        BgBlocks->SetTownersGraphics();
        GM_ForceTpLoad(0xCD);
    }
    CDWAIT = 0;
    PauseMode = 0;
    VID_SetDBuffer(0);
    ClearPanel();
    D_8011C324 = 0;
    if (options_pad >= 0 && ScrollFlag[options_pad]) {
        PostGamePad(5, 0, 0, 0);
        options_pad = -1;
    } else {
        _pcurs[myplr] = 1;
    }
    ClrCursor(0);
    ClrCursor(1);
    myplr = omp;
    sel_data = osel;
    invflag = 0;
    GLUE_ResumeGame();
    GLUE_SetShowPanelFlag(1);
    GLUE_SetShowGameScreenFlag(1);
    GLUE_SetHomingScrollFlag(1);

end:;
}

void CheckInvCut(int pnum, int mx, int my)
{
    int r;
    int ii, iv;

    if (dropGoldFlag) {
        dropGoldFlag = 0;
        dropGoldValue = 0;
    }

    plr[pnum].HoldItem._itype = -1;
    r = InvCursPos;

    if ((unsigned int)r < 4) {
        if (plr[pnum].InvBody[0]._itype != -1) {
            NetSendCmdDelItem(0, 0);
            plr[pnum].HoldItem = plr[pnum].InvBody[0];
            plr[pnum].InvBody[0]._itype = -1;
        }
    }
    if (r == 4) {
        if (plr[pnum].InvBody[1]._itype != -1) {
            NetSendCmdDelItem(0, 1);
            plr[pnum].HoldItem = plr[pnum].InvBody[1];
            plr[pnum].InvBody[1]._itype = -1;
        }
    }
    if (r == 5) {
        if (plr[pnum].InvBody[2]._itype != -1) {
            NetSendCmdDelItem(0, 2);
            plr[pnum].HoldItem = plr[pnum].InvBody[2];
            plr[pnum].InvBody[2]._itype = -1;
        }
    }
    if (r == 6) {
        if (plr[pnum].InvBody[3]._itype != -1) {
            NetSendCmdDelItem(0, 3);
            plr[pnum].HoldItem = plr[pnum].InvBody[3];
            plr[pnum].InvBody[3]._itype = -1;
        }
    }
    if ((unsigned int)(r - 7) < 6) {
        if (plr[pnum].InvBody[4]._itype != -1) {
            NetSendCmdDelItem(0, 4);
            plr[pnum].HoldItem = plr[pnum].InvBody[4];
            plr[pnum].InvBody[4]._itype = -1;
        }
    }
    if ((unsigned int)(r - 13) < 6) {
        if (plr[pnum].InvBody[5]._itype != -1) {
            NetSendCmdDelItem(0, 5);
            plr[pnum].HoldItem = plr[pnum].InvBody[5];
            plr[pnum].InvBody[5]._itype = -1;
        }
    }
    if ((unsigned int)(r - 19) < 6) {
        if (plr[pnum].InvBody[6]._itype != -1) {
            NetSendCmdDelItem(0, 6);
            plr[pnum].HoldItem = plr[pnum].InvBody[6];
            plr[pnum].InvBody[6]._itype = -1;
        }
    }

    if ((unsigned int)(r - 25) < 40) {
        ii = plr[pnum].InvGrid[r - 25];
        if (ii != 0) {
            int i;

            iv = (ii > 0) ? ii : -ii;
            for (i = 0; i < 40; i++) {
                if (plr[pnum].InvGrid[i] == iv || plr[pnum].InvGrid[i] == -iv)
                    plr[pnum].InvGrid[i] = 0;
            }
            iv--;
            plr[pnum].HoldItem = plr[pnum].InvList[iv];
            plr[pnum]._pNumInv--;
            ii = plr[pnum]._pNumInv;
            if (ii > 0 && ii != iv) {
                plr[pnum].InvList[iv] = plr[pnum].InvList[ii];
                for (i = 0; i < 40; i++) {
                    if (plr[pnum].InvGrid[i] == ii + 1)
                        plr[pnum].InvGrid[i] = iv + 1;
                    if (plr[pnum].InvGrid[i] == -(ii + 1))
                        plr[pnum].InvGrid[i] = -(iv + 1);
                }
            }
        }
    }

    if (r >= 0x41) {
        iv = r - 0x41;
        if (plr[pnum].SpdList[iv]._itype != -1) {
            plr[pnum].HoldItem = plr[pnum].SpdList[iv];
            plr[pnum].SpdList[iv]._itype = -1;
            drawsbarflag = 1;
        }
    }

    if (plr[pnum].HoldItem._itype != -1) {
        if (plr[pnum].HoldItem._itype == ITYPE_GOLD)
            plr[pnum]._pGold = CalculateGold(pnum);
        CalcPlrInv(pnum, 1);
        CheckItemStats(pnum);
        if (pnum == myplr) {
            PlaySFX(0x1F);
            SetCursor(plr[pnum].HoldItem._iCurs + 12);
        }
    }
}

void InvDrawSlot(int X, int Y, int Frame)
{
    struct POLY_FT4 *Ft4;

    Ft4 = InvGfxTData->PrintFt4(Frame, X + 0x80, Y - InvBackY + 0x20, 0, D_8011C2FC, 0);
    Ft4->code = (Ft4->code | 2) & 0xFE;
    Ft4->r0 = BORDERR;
    Ft4->g0 = BORDERG;
    Ft4->b0 = BORDERB;
}

void InvDrawItem(int ItemX, int ItemY, int ItemNo, unsigned char StatFlag, int TransFlag)
{
    struct POLY_FT4 *Ft4;
    struct TextDat *TData;

    if (ItemNo < 0x32)
        TData = InvGfxTData;
    else
        TData = InvPanelTData;

    Ft4 = TData->PrintFt4(InvGfxTable[ItemNo], ItemX + 0x80, ItemY - InvBackY + 0x20, 0, D_8011C304, 0);

    setShadeTex(Ft4, 0);
    setSemiTrans(Ft4, TransFlag);

    if (StatFlag) {
        setRGB0(Ft4, 0x80, 0x80, 0x80);
    } else {
        setRGB0(Ft4, 0x80, 0, 0);
    }
}

void PrintStat(int Y, int Txt0, char *Txt1, unsigned char Col)
{
    char *str;

    str = GetStr(Txt0);
    MediumFont.Print(0, Y, str, JustLeft, &BRect, WHITER, WHITEG, WHITEG);
    MediumFont.Print(0, Y, Txt1, JustRight, &BRect, WHITER, WHITEG, WHITEG);
}

void DrawInvMsg(void)
{
    Dialog InvBack;
    RECT InfoRect;
    int InfoY;
    int InfoH;
    int OldOt;
    struct POLY_FT4 *Ft4;

    OldOt = MediumFont.SetOTpos(0xFA);
    MediumFont.SetOTpos(OldOt - 1);
    PRIM_FullScreen(OldOt);

    InfoRect.x = 0x80;
    InfoRect.y = 0x81;
    InfoRect.w = 0xB0;
    InfoRect.h = 0x4E;
    InfoH = 0x50;

    InfoY = 0x80;
    if (invflag) {
        DrawInfoBox(&InfoRect);
    }

    InvBack.SetOTpos(0xF9);
    InvBack.SetBack(5);
    InvBack.SetRGB(BORDERR, BORDERG, BORDERB);
    InvBack.Back(0x80, 0x80, 0xB0, InfoH);

    Ft4 = InvPanelTData->PrintFt4(0x94, 0, 0, 0, OldOt, 0);

    Ft4->y2 = 0xD0;
    Ft4->y3 = 0xD0;
    Ft4->r0 = 0x20;
    Ft4->g0 = 0x20;
    Ft4->b0 = 0x20;
    Ft4->x1 = 0x130;
    Ft4->x3 = 0x130;
    Ft4->x0 = InfoY;
    Ft4->y0 = InfoY;
    Ft4->y1 = InfoY;
    Ft4->x2 = InfoY;
    Ft4->tpage = Ft4->tpage | 0x40;
    Ft4->u1 = Ft4->u0 + 1;
    Ft4->u3 = Ft4->u0 + 1;
    Ft4->v2 = Ft4->v0 + 1;
    Ft4->v3 = Ft4->v0 + 1;
    Ft4->code = (Ft4->code | 2) & 0xFE;
    MediumFont.SetOTpos(OldOt);

    PRIM_Clip(&InfoRect, OldOt);
}

void InvDrawSlotBack(int X, int Y, int W, int H, unsigned char Flag)
{
    struct POLY_FT4 *Ft4;

    Ft4 = InvPanelTData->PrintFt4(0x94, X, Y, 0, D_8011C300, 0);

    Ft4->x0 = X + 0x81;
    W = W + 0x7F;
    X = X + W;
    Ft4->x1 = X;
    Ft4->x2 = Ft4->x0;
    Ft4->x3 = X;
    H = H + 0x1F;
    Y = Y - InvBackY;
    Ft4->y0 = Y + 0x21;
    Ft4->y1 = Ft4->y0;
    Y = Y + H;
    Ft4->y2 = Y;
    Ft4->y3 = Y;
    Ft4->tpage = Ft4->tpage | 0x40;
    Ft4->u1 = Ft4->u0 + 1;
    Ft4->u3 = Ft4->u0 + 1;
    Ft4->v2 = Ft4->v0 + 1;
    Ft4->v3 = Ft4->v0 + 1;
    Ft4->code = (Ft4->code | 2) & 0xFE;

    if (Flag == 1) {
        Ft4->r0 = 0xD0;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
        Ft4->tpage = Ft4->tpage | 0x20;
        return;
    }

    if (Flag < 2) {
        if (Flag == 0) {
            Ft4->r0 = 0x20;
            Ft4->g0 = 0x20;
            Ft4->b0 = 0x20;
            Ft4->tpage = Ft4->tpage | 0x40;
        }
        return;
    }

    if (Flag == 2) {
        int cursor;

        Ft4->tpage = Ft4->tpage | 0x20;
        cursor = _pcurs[myplr];
        if (cursor == Flag) {
            Ft4->r0 = 0;
            Ft4->g0 = 0;
            Ft4->b0 = CursGlow - 0x80;
            return;
        }
        if (cursor == 3) {
            Ft4->r0 = CursGlow - 0x80;
            Ft4->b0 = 0;
            Ft4->g0 = CursGlow - 0x80;
            return;
        }
        if (cursor == 4) {
            Ft4->g0 = 0;
            Ft4->r0 = CursGlow - 0x80;
            Ft4->b0 = CursGlow - 0x80;
            return;
        }
        if (cursor < 0xC) {
            Ft4->r0 = CursGlow - 0x80;
            Ft4->g0 = CursGlow - 0x80;
            Ft4->b0 = CursGlow - 0x80;
            return;
        }
        Ft4->r0 = CursGlow - 0x80;
        Ft4->g0 = (CursGlow + 0x80) >> 2;
        Ft4->b0 = (CursGlow + 0x80) >> 2;
        return;
    }

    if (Flag == 3) {
        Ft4->r0 = 0x80;
        Ft4->g0 = (CursGlow >> 2) + 0x20;
        Ft4->tpage = Ft4->tpage | 0x20;
        Ft4->b0 = (CursGlow >> 2) + 0x20;
    }
}

void DrawInvHelpTxt(void)
{
    char TempStr[128];

    TempStr[0] = 0;
    if (LANG_GetLang() == 1) {
        if (_pcurs[myplr] == 2)
            sprintf(TempStr, "%s  _ %s", GetStr(0x331), GetStr(0x208));
        else if (_pcurs[myplr] == 3)
            sprintf(TempStr, "%s  _ %s", GetStr(0x331), GetStr(0x35A));
        else if (_pcurs[myplr] == 4)
            sprintf(TempStr, "%s  _ %s", GetStr(0x331), GetStr(0x34C));
        else if (_pcurs[myplr] >= 0xC)
            sprintf(TempStr, "%s  < %s", GetStr(0x4E6), GetStr(0x11D));
        else
            sprintf(TempStr, "%s", GetStr(0x4E6));
    } else {
        if (_pcurs[myplr] == 2)
            sprintf(TempStr, "_ %s  %s", GetStr(0x208), GetStr(0x331));
        else if (_pcurs[myplr] == 3)
            sprintf(TempStr, "_ %s  %s", GetStr(0x35A), GetStr(0x331));
        else if (_pcurs[myplr] == 4)
            sprintf(TempStr, "_ %s  %s", GetStr(0x34C), GetStr(0x331));
        else if (_pcurs[myplr] >= 0xC)
            sprintf(TempStr, "< %s  %s", GetStr(0x11D), GetStr(0x4E6));
        else
            sprintf(TempStr, "%s", GetStr(0x4E6));
    }

    if (InvBackY == 0) {
        MediumFont.SetChar(0x2E, 0x80);
        sprintf(TempStr, "%s  . %s ", TempStr, GetStr(0x2FE));
    } else {
        MediumFont.SetChar(0x2E, 0x7F);
        sprintf(TempStr, "%s  . %s ", TempStr, GetStr(0x132));
    }

    if (InvPageFlag)
        sprintf(TempStr, "%s  | %s ", TempStr, GetStr(0x2A4));

    MediumFont.Print(0, 0xE0, TempStr, JustCentre, NULL, WHITER, WHITEG, WHITEB);
    MediumFont.SetChar(0x2E, 0x6D);
}

void DrawInvBack(void)
{
    Dialog InvBack;

    InvBack.SetOTpos(D_8011C2F8);
    InvBack.SetBack(5);
    InvBack.SetRGB(BORDERR, BORDERG, BORDERB);
    InvBack.Back(0x80, -InvBackY + 0x80, 0xB0, 0xBE);
    InvBack.Back(0x80, -InvBackY + 0x20, 0xB0, 0x5E);
}

void DrawInv(void)
{
    if (D_8011C324 == 0) {
        D_8011C324 = 1;
        InvPageFlag = 0;
        InvPageNo = 0;
        TSK_AddTask(0, DrawInvTSK, 0x1000, 0);
    }
}

void InvMoveCursDown(void)
{
    int ItemInc;
    int OldPos;

    OldPos = InvCursPos;
    ItemInc = 0;

    if (_pcurs[myplr] < 12) {
        switch (InvCursPos) {
        case 0:
            InvCursPos = 6;
            break;
        case 4:
        case 7:
            InvCursPos = 25;
            break;
        case 5:
        case 13:
            InvCursPos = 34;
            break;
        case 6:
            InvCursPos = 19;
            break;
        case 19:
            InvCursPos = 29;
            break;
        default:
            if ((unsigned int)(InvCursPos - 25) < 40) {
                if (plr[myplr].InvGrid[InvCursPos - 25] != 0) {
                    InvGetItemWH(InvCursPos - 25);
                    if (InvCursPos >= 0x39)
                        InvCursPos = InvCursPos + ItemH * 9;
                    else
                        InvCursPos = InvCursPos + ItemH * 10;
                } else if (InvCursPos >= 0x38) {
                    InvCursPos = InvCursPos + 9;
                } else if (InvCursPos < 0x41) {
                    InvCursPos = InvCursPos + 10;
                }
            }
            break;
        }
    } else {
        switch (InvCursPos) {
        case 4:
        case 7:
            InvCursPos = 25;
            break;
        case 5:
        case 13:
            InvCursPos = 34;
            break;
        case 0:
        case 6:
        case 19:
            InvCursPos = 29;
            break;
        default:
            if ((unsigned int)(InvCursPos - 25) < 40)
                ItemInc = 1;
            else if (InvCursPos >= 0x41)
                ItemInc = 0;
            break;
        }
    }

    if ((unsigned int)(InvCursPos - 25) < 40 && ItemInc != 0) {
        ItemNo = plr[myplr].HoldItem._iCurs;
        ItemW = InvItemWidth[ItemNo + 12] >> 4;
        ItemH = InvItemHeight[ItemNo + 12] >> 4;

        if (InvCursPos < 0x38) {
            if (InvCursPos + (ItemH - 1) * 10 < 0x37) {
                InvCursPos = InvCursPos + 10;
            }
        } else if (InvCursPos != 0x37) {
            InvCursPos = InvCursPos + 9;
        } else {
            InvCursPos = 0x41;
        }
    }

    if (InvCursPos >= 0x49)
        InvCursPos = 0x48;

    InvSetItemCurs();
    if (OldPos != InvCursPos)
        PlaySFX(0x32);
}

void ControlInv(void)
{
    CheckNewPath(myplr);
    InvSetItemCurs();

    if (sfxdelay > 0) {
        sfxdelay--;
        if (sfxdelay == 0)
            PlaySFX(sfxdnum);
    }

    _pcursitem[sel_data] = -1;
    uitemflag = 0;
    ReadPad(-1);

    if (_pcurs[myplr] == 9)
        invflag = 0;

    if (InvCursPos < 0x19)
        InvBackAY = 0;
    else
        InvBackAY = 0x60;

    if (InvBackY > InvBackAY) {
        InvBackY -= 0x10;
        if (InvBackY < InvBackAY)
            InvBackY = InvBackAY;
    } else if (InvBackY < InvBackAY) {
        InvBackY += 0x10;
        if (InvBackAY < InvBackY)
            InvBackY = InvBackAY;
    }

    if (invflag) {
        _pcursinvitem[sel_data] = CheckInvHLight();
        if (_pcursinvitem[sel_data] == -1)
            ClrCursor(options_pad);
    } else {
        ClearPanel();
    }

    if (InvPageFlag) {
        if (DavesPad & 0x400) {
            PlaySFX(0x32);
            if (InvPageNo == 0)
                InvPageNo = 1;
            else
                InvPageNo = 0;
        }
    } else {
        InvPageNo = 0;
    }

    if (uitemflag)
        DrawUniqueInfo();

    if (DavesPad & 0x4)
        InvMoveCursLeft();
    if (DavesPad & 0x8)
        InvMoveCursRight();
    if (DavesPad & 0x1)
        InvMoveCursUp();
    if (DavesPad & 0x2)
        InvMoveCursDown();

    if (DavesPad & 0x40) {
        if ((unsigned int)(_pcurs[myplr] - 2) < 2 || _pcurs[myplr] == 4)
            TryIconCurs();
        else
            CheckInvScrn();
    }

    if (DavesPad & 0x200) {
        ignore_buttons = 1;
        UseInvItem(myplr, _pcursinvitem[sel_data]);
    }

    if (DavesPad & 0x80) {
        if (_pcurs[myplr] >= 12) {
            if (numitems < 0x7A && TryInvPut()) {
                NetSendCmdPItem(1, 0xA, 0, 0);
            } else {
                PlaySFX(0x3D3);
            }
        }
    }

    InvAlignObject();
}
