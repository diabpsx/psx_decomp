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
