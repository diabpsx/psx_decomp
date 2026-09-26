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
