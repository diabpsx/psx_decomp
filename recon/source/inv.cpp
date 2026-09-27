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
    int Dist, d;

    if (numitems >= 0x7A /* MAXITEMS */) {
        PlaySFX(0x3D3);
        return 0;
    }

    if (CanPut(plr[myplr]._px, plr[myplr]._py))
        return 1;

    Dist = 1;
    for (d = 0; d < 8; d++) {
        if (CanPut(plr[myplr]._px + offset_x[d] * Dist, plr[myplr]._py + offset_y[d] * Dist))
            return 1;
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
                if (i != 0 || j != sy - 1) {
                    plr[pnum].InvGrid[xx + yy] = -plr[pnum]._pNumInv;
                } else {
                    plr[pnum].InvGrid[xx + yy] = plr[pnum]._pNumInv;
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
                if (i != 0 || j != sy - 1) {
                    plr[pnum].InvGrid[xx + yy] = -plr[pnum]._pNumInv;
                } else {
                    plr[pnum].InvGrid[xx + yy] = plr[pnum]._pNumInv;
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
    } else if (plr[pnum].InvBody[INVLOC_HAND_LEFT]._itype == ITYPE_NONE && plr[pnum].InvBody[INVLOC_HAND_RIGHT]._itype == ITYPE_NONE) {
        NetSendCmdChItem(1, INVLOC_HAND_LEFT);
        plr[pnum].InvBody[INVLOC_HAND_LEFT] = plr[pnum].HoldItem;
        return 1;
    }

    return 0;
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
    ItemStruct *Item;
    unsigned char speedlist;

    if (plr[pnum]._pInvincible && plr[pnum]._pHitPoints == 0 && pnum == myplr)
        return 1;
    if (_pcurs[myplr] != CURSOR_HAND)
        return 0;
    if (stextflag)
        return 0;
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

    switch (Item->IDidx) {
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

    if (!AllItemsUseable[Item->IDidx])
        return 0;

    if (!Item->_iStatFlag) {
        if (plr[pnum]._pClass == 0)
            PlaySFX(0x2D8);
        else if (plr[pnum]._pClass == 1)
            PlaySFX(0x270);
        else if (plr[pnum]._pClass == 2)
            PlaySFX(0x208);
        else
            return 0;
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

    if (Item->_iMiscId == IMISC_SCROLL || Item->_iMiscId == IMISC_SCROLLT) {
        if (gbMaxPlayers == 2 && Item->_iSpell == 0x20) {
            if (plr[pnum ^ 1].plractive)
                return 0;
        }
        if (currlevel == 0 && !spelldata[Item->_iSpell].sTownSpell) {
            if (plr[pnum]._pClass == 0)
                PlaySFX(0x2EC);
            else if (plr[pnum]._pClass == 1)
                PlaySFX(0x27E);
            else if (plr[pnum]._pClass == 2)
                PlaySFX(0x216);
            else
                return 0;
            return 0;
        }
    }

    {
        int idata = ItemCAnimTbl[Item->_iCurs];
        if (Item->_iMiscId == IMISC_BOOK)
            PlaySFX(0x2E /* IS_RBOOK */);
        else if (pnum == myplr)
            PlaySFX(ItemInvSnds[idata]);
    }

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
            quests[0]._qvar1 = 1;
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
        quests[9]._qactive = 3 /* QUEST_DONE */;
        quests[9].pad_for_laz = 3;
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
    int i, idx;
    int w, h;
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
        if ((unsigned int)(plr[pnum]._pgfxnum & 0xF) < 2 /* ANIM_ID_UNARMED or _SHIELD */
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
        dung_map[item[ii]._ix][item[ii]._iy].dItem = 0;
        i = 0;
        while (i < numitems) {
            if (itemactive[i] == ii) {
                DeleteItem(itemactive[i], i);
                i = 0;
            } else {
                i++;
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
    int Dist, d;

    if (numitems >= 0x7A) {
        PlaySFX(0x3D3);
        return -1;
    }

    if (FindGetItem(plr[pnum].HoldItem.IDidx, plr[pnum].HoldItem._iCreateInfo, plr[pnum].HoldItem._iSeed) != -1) {
        SyncGetItem(x, y, plr[pnum].HoldItem.IDidx, plr[pnum].HoldItem._iCreateInfo, plr[pnum].HoldItem._iSeed);
    }

    x = plr[pnum]._px;
    y = plr[pnum]._py;
    if (!CanPut(x, y)) {
        done = 0;
        for (Dist = 1; Dist < 8 && !done; Dist++) {
            for (d = 0; d < 8 && !done; d++) {
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
    int ItemInc;
    int OldPos;

    OldPos = InvCursPos;

    if (_pcurs[myplr] < 12) {
        ItemInc = 0;
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
            case 4:
            case 6:
                InvCursPos = 7;
                goto after;
            case 5:
                InvCursPos = 19;
                goto after;
            case 7:
                InvCursPos = 13;
                goto after;
            case 13:
                InvCursPos = 5;
                goto after;
            case 19:
                InvCursPos = 4;
                goto after;
            default:
                break;
            }
        }
    } else {
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
            case 6:
            case 19:
                goto after;
            case 4:
                InvCursPos = 5;
                goto after;
            case 5:
                InvCursPos = 4;
                goto after;
            case 7:
                InvCursPos = 13;
                goto after;
            case 13:
                InvCursPos = 7;
                goto after;
            default:
                break;
            }
        }
    }

    if ((unsigned int)(InvCursPos - 25) < 40) {
        ItemInc = 1;
    } else if (InvCursPos < 0x41) {
        /* nothing */
    } else {
        ItemInc = 1;
    }

after:
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
    int ItemInc;
    int OldPos;

    OldPos = InvCursPos;

    if (_pcurs[myplr] < 12) {
        ItemInc = 0;
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
                goto tail3;
            case 4:
            case 6:
            case 7:
                InvCursPos = 0;
                goto tail3;
            case 5:
                InvCursPos = 6;
                goto tail3;
            case 13:
            case 19:
                InvCursPos = 6;
                goto tail3;
            default:
                break;
            }
        }

        if ((unsigned int)(InvCursPos - 25) < 40) {
            if (InvCursPos < 35) {
                InvCursPos = 19;
            } else {
                ItemInc = 1;
                goto tail3;
            }
        } else if (InvCursPos < 0x41) {
            /* nothing */
        } else {
            InvCursPos = InvCursPos - 9;
        }
    } else {
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
            case 4:
            case 5:
            case 6:
            case 7:
            case 13:
            case 19:
                goto tail3;
            default:
                break;
            }
        }

        if ((unsigned int)(InvCursPos - 25) < 40) {
            ItemInc = 1;
            goto tail3;
        } else if (InvCursPos < 0x41) {
            /* nothing */
        } else {
            InvCursPos = InvCursPos - 9;
        }
    }

tail3:
    if ((unsigned int)(InvCursPos - 25) < 40 && ItemInc != 0) {
        if (InvCursPos < 35) {
            int key = (signed char)(plr[myplr].HoldItem._iLoc - 1);
            if ((unsigned int)key < 8) {
                switch (key) {
                case 0:
                case 1:
                    InvCursPos = 7;
                    break;
                case 2:
                    InvCursPos = 19;
                    break;
                case 3:
                    InvCursPos = 0;
                    break;
                case 4:
                    InvCursPos = 4;
                    break;
                case 5:
                    InvCursPos = 6;
                    break;
                default:
                    break;
                }
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
    struct TextDat *TData;
    struct POLY_FT4 *Ft4;
    unsigned char a0, v0;

    if (ItemNo < 0x32)
        TData = InvGfxTData;
    else
        TData = InvPanelTData;

    Ft4 = TData->PrintFt4(InvGfxTable[ItemNo], ItemX + 0x80, ItemY - InvBackY + 0x20, 0, D_8011C304, 0);

    a0 = Ft4->code;
    v0 = a0 & 0xFE;
    Ft4->code = v0;
    if (TransFlag == 0) {
        v0 = a0 & 0xFC;
        Ft4->code = v0;
    } else {
        v0 = v0 | 2;
    }

    v0 = StatFlag;
    if (v0) {
        v0 = 0x80;
        Ft4->r0 = v0;
        Ft4->g0 = v0;
        Ft4->b0 = v0;
    } else {
        Ft4->r0 = 0;
        Ft4->g0 = 0;
        Ft4->b0 = 0;
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
    char *s0;

    TempStr[0] = 0;
    if (LANG_GetLang() == 1) {
        if (_pcurs[myplr] == 2) {
            GetStr(0x331);
            s0 = GetStr(0x208);
            sprintf(TempStr, "%s  _ %s", s0, s0);
            goto done;
        }
        if (_pcurs[myplr] == 3) {
            GetStr(0x331);
            s0 = GetStr(0x35A);
            sprintf(TempStr, "%s  _ %s", s0, s0);
            goto done;
        }
        if (_pcurs[myplr] < 0xC)
            goto special;
        GetStr(0x4E6);
        s0 = GetStr(0x11D);
        sprintf(TempStr, "%s  < %s", s0, s0);
        goto done;
    } else {
        if (_pcurs[myplr] == 2) {
            GetStr(0x208);
            s0 = GetStr(0x331);
            sprintf(TempStr, "_ %s  %s", s0, s0);
            goto done;
        }
        if (_pcurs[myplr] == 3) {
            GetStr(0x35A);
            s0 = GetStr(0x331);
            sprintf(TempStr, "_ %s  %s", s0, s0);
            goto done;
        }
        if (_pcurs[myplr] < 0xC)
            goto special;
        GetStr(0x11D);
        s0 = GetStr(0x4E6);
        sprintf(TempStr, "< %s  %s", s0, s0);
        goto done;
    }

special:
    s0 = GetStr(0x4E6);
    sprintf(TempStr, "%s", s0);

done:
    if (InvBackY == 0) {
        MediumFont.SetChar(0x2E, 0x80);
        s0 = GetStr(0x2FE);
    } else {
        MediumFont.SetChar(0x2E, 0x7F);
        s0 = GetStr(0x132);
    }
    sprintf(TempStr, "%s  . %s ", TempStr, s0);

    if (InvPageFlag) {
        s0 = GetStr(0x2A4);
        sprintf(TempStr, "%s  | %s ", TempStr, s0);
    }

    MediumFont.Print(0, 0xE0, TempStr, JustCentre, &BRect, WHITER, WHITEG, WHITEB);
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
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
                InvCursPos = 6;
                goto tail4;
            case 4:
            case 7:
                InvCursPos = 25;
                goto tail4;
            case 5:
            case 13:
                InvCursPos = 34;
                goto tail4;
            case 6:
                InvCursPos = 19;
                goto tail4;
            case 19:
                InvCursPos = 29;
                goto tail4;
            default:
                break;
            }
        }

        if ((unsigned int)(InvCursPos - 25) < 40) {
            if (plr[myplr].InvGrid[InvCursPos - 25] != 0) {
                InvGetItemWH(InvCursPos - 25);
                if (InvCursPos < 0x39) {
                    InvCursPos = InvCursPos + ItemH * 10;
                } else {
                    InvCursPos = InvCursPos + ItemH * 9;
                }
                goto tail4;
            } else {
                if (InvCursPos < 0x38) {
                    InvCursPos = InvCursPos + 10;
                } else if (InvCursPos < 0x41) {
                    InvCursPos = InvCursPos + 9;
                }
                goto tail4;
            }
        }
    } else {
        if ((unsigned int)InvCursPos < 20) {
            switch (InvCursPos) {
            case 0:
            case 6:
            case 19:
                InvCursPos = 29;
                goto tail4;
            case 4:
            case 7:
                InvCursPos = 25;
                goto tail4;
            case 5:
            case 13:
                InvCursPos = 34;
                goto tail4;
            default:
                break;
            }
        }

        if ((unsigned int)(InvCursPos - 25) < 40) {
            ItemInc = 1;
            goto tail4;
        } else if (InvCursPos < 0x41) {
            /* nothing */
        } else {
            ItemInc = 0;
        }
    }

tail4:
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
