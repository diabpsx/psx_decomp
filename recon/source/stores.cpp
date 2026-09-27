/* STORES.CPP -- Diablo PSX (Climax 1998) reconstruction (main image). Twin: refs/diablo-hellfire/src/STORES.CPP
 * (original Condor/Blizzard source keeps STORES.CPP's own line numbers -- see PRESTORE.CPP for the
 * per-player macro idiom). Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py).
 *
 * PSX deltas confirmed from the raw oracle (this is a FIRST PASS -- see the caller's final report for
 * what is not yet covered):
 *  - FreeStoreMem is an EMPTY function on PSX (`jr ra` only) -- the PC's 3 DiabloFreePtr calls are gone.
 *  - The PC's static smithitem[]/witchitem[]/healitem[]/golditem/numpremium/premiumitem/boyitem arrays
 *    do NOT exist as such in the PSX SYM. Instead there are SmithItemCount/SellIdx/SWrapCount (ints) and
 *    per-player _numpremium/_premiumitem/_boylevel/_boyitem/_NoWitchItems/_WitchIdxOfs arrays already
 *    owned by another TU (see externs_stores.h) -- the shop-item generation/listing functions
 *    (S_StartSmith, SmithBuyItem, S_StartWitch, WitchBuyItem, HealerBuyItem, S_StartBBoy/BoyBuyItem, ...)
 *    use a SUBSTANTIALLY different (likely disc-streamed, on-demand) design that has NOT been fully
 *    reverse-engineered yet -- see the final report.
 *  - SmithSellOk/SmithRepairOk/WitchSellOk/WitchRechargeOk read PlayerStruct.InvList[i] directly (no
 *    `i<0 -> SpdList` branch the PC has) and test different field offsets than devilution/hellfire
 *    (e.g. SmithSellOk tests IDidx==0x21, not an _iMiscId range) -- transcribed from the raw oracle.
 *  - `stext[24]`, `stextsel/lhold/shold/vhold/sval/smax/up/down/scrlubtn/scrldbtn`, `storenumh`,
 *    `gossipstart/end`, `StoreBackRect(Clipper)` are STAT (file-static, internal linkage) in the SYM,
 *    not EXT -- declared `static` here, not `extern`.
 */
#include "diabpsx_types.h"
#include "source/gen/structs_stores.h"
#include "source/gen/externs_stores.h"
#include "source/gen/protos_stores.h"
#include "source/diablo.h"

#define NUMSTLINES 24

/* file-owned globals (EXT in SYM, gp-rel tentative defs) */
int StorePlrNo;
unsigned char *pSTextBoxCels;
unsigned char *pSTextSlidCels;
int *SStringY;
char WStaffFlag;
char WFlag;
unsigned char InStoreFlag;
char stextflag;
char stextsize;
unsigned char stextscrl;
int SmithItemCount;
int SellIdx;
int SWrapCount;
unsigned long gdwAllTextEntries;
int tile;
struct ItemStruct storehold[48];
char storehidx[48];
char *talkname[9];

/* file-static globals (STAT in SYM: internal linkage, not exported) */
static struct STextStruct stext[NUMSTLINES];
static int stextsel;
static int stextlhold;
static int stextshold;
static int stextvhold;
static int stextsval;
static int stextsmax;
static int stextup;
static int stextdown;
static char stextscrlubtn;
static char stextscrldbtn;
static char SItemListFlag;
static int storenumh;
static int gossipstart;
static int gossipend;
static struct RECT StoreBackRect;
static struct RECT StoreBackRectClipper;
static int talker;   /* @0x8011C8C4 */

/* @0x800695A4 -- empty on PSX: the PC's 3 DiabloFreePtr calls are gone */
void FreeStoreMem(void)
{
}

/* @0x80069CD8 */
void ClearSText(int s, int e)
{
    int i;

    for (i = s; i < e; i++) {
        stext[i]._sx = 0;
        stext[i]._syoff = 0;
        stext[i]._sstr[0] = 0;
        stext[i]._sjust = 0;
        stext[i]._sclr = 0;
        stext[i]._sline = 0;
        stext[i]._ssel = 0;
        stext[i]._sval = -1;
    }
}

/* @0x80069D70 */
void AddSLine(int y)
{
    stext[y]._sx = 0;
    stext[y]._syoff = 0;
    stext[y]._sstr[0] = 0;
    stext[y]._sline = 1;
}

/* @0x80069DC0 */
void AddSTextVal(int y, int val)
{
    stext[y]._sval = val;
}

/* @0x80069DE8 */
void OffsetSTextY(int y, int yo)
{
    stext[y]._syoff = yo;
}

/* @0x80069E10 */
void AddSText(int x, int y, unsigned char j, char *str, char clr, unsigned char sel)
{
    if (*str == 0) {
        return;
    }
    stext[y]._sx = x;
    stext[y]._syoff = 0;
    strcpy(stext[y]._sstr, str);
    stext[y]._sjust = j;
    stext[y]._sclr = clr;
    stext[y]._sline = 0;
    stext[y]._ssel = sel;
}

/* @0x8006E714 */
unsigned char IdItemOk(ItemStruct *i)
{
    if (i->_itype == -1) {
        return 0;
    }
    if (i->_iMagical == 0) {
        return 0;
    }
    if (i->_iIdentified) {
        return 0;
    }
    return 1;
}

/* @0x8006B3D0 -- PSX-specific: reads InvList[i] directly (no i<0 -> SpdList branch), and tests IDidx
 * (not an _iMiscId range) for the oil-item exclusion. */
unsigned char SmithSellOk(int i)
{
    if (plr[myplr].InvList[i]._itype == -1) {
        return 0;
    }
    if (plr[myplr].InvList[i]._itype == 0) {
        return 0;
    }
    if (plr[myplr].InvList[i]._itype == 11) {
        return 0;
    }
    if (plr[myplr].InvList[i]._itype == 14) {
        return 0;
    }
    if (plr[myplr].InvList[i]._itype == 10) {
        return 0;
    }
    if (plr[myplr].InvList[i].IDidx == 0x21) {
        return 0;
    }
    if (plr[myplr].InvList[i]._iMagical == 0) {
        return 1;
    }
    if (plr[myplr].InvList[i]._iIdentified == 0) {
        return 0;
    }
    return plr[myplr].InvList[i]._iIvalue != 0;
}

#define numpremium   _numpremium[StorePlrNo]
#define premiumlevel _premiumlevel[StorePlrNo]
#define premiumitem  _premiumitem[StorePlrNo]
#define boyitem      _boyitem[StorePlrNo]
#define boylevel     _boylevel[StorePlrNo]
#define smithitem    _smithitem[StorePlrNo]
#define witchitem    _witchitem[StorePlrNo]
#define healitem     _healitem[StorePlrNo]
#define golditem     _golditem[StorePlrNo]
#define NoWitchItems _NoWitchItems[StorePlrNo]
#define WitchIdxOfs  _WitchIdxOfs[StorePlrNo]

/* @0x8006BB44 */
unsigned char SmithRepairOk(int i)
{
    if (plr[myplr].InvList[i]._itype == -1) {
        return 0;
    }
    if (plr[myplr].InvList[i]._itype == 0) {
        return 0;
    }
    if (plr[myplr].InvList[i]._itype == 11) {
        return 0;
    }
    if (plr[myplr].InvList[i]._itype == 14) {
        return 0;
    }
    if (plr[myplr].InvList[i]._iDurability == plr[myplr].InvList[i]._iMaxDur) {
        return 0;
    }
    return 1;
}

/* @0x8006C42C */
int CheckWitchItem(int idx)
{
    if (!WStaffFlag) {
        if (witchitem[idx]._iMiscId != 0x17) {
            return 0;
        }
        return 1;
    } else {
        if (witchitem[idx]._iMiscId != 0x17) {
            return 1;
        }
        return 0;
    }
}

/* @0x8006D22C */
unsigned char WitchRechargeOk(int i)
{
    unsigned char rv;

    rv = 0;
    if (plr[myplr].InvList[i]._itype == 10) {
        rv = plr[myplr].InvList[i]._iCharges != plr[myplr].InvList[i]._iMaxCharges;
    }
    return rv;
}

/* @0x8006AA50 */
void S_StartSmith(void)
{
    SItemListFlag = 0;
    stextsize = 0;
    stextscrl = 0;
    AddSText(0, 1, 1, GetStr(0x4CA), 3, 0);
    AddSText(0, 2, 1, GetStr(0x4E), 3, 0);
    AddSText(0, 6, 1, GetStr(0x4DF), 3, 0);
    AddSText(0, 8, 1, GetStr(0x42A), 1, 1);
    AddSText(0, 9, 1, GetStr(0x95), 0, 1);
    AddSText(0, 0xA, 1, GetStr(0x97), 0, 1);
    AddSText(0, 0xB, 1, GetStr(0x3B9), 0, 1);
    AddSText(0, 0xC, 1, GetStr(0x35B), 0, 1);
    AddSText(0, 0xD, 1, GetStr(0x241), 0, 1);
    AddSLine(3);
    storenumh = 0x14;
}

/* @0x8006C2A4 */
void S_StartWitch(void)
{
    SItemListFlag = 0;
    stextsize = 0;
    stextscrl = 0;
    AddSText(0, 1, 1, GetStr(0x4DC), 3, 0);
    AddSText(0, 6, 1, GetStr(0x4DF), 3, 0);
    AddSText(0, 8, 1, GetStr(0x426), 1, 1);
    AddSText(0, 9, 1, GetStr(0x96), 0, 1);
    AddSText(0, 0xA, 1, GetStr(0x98), 0, 1);
    AddSText(0, 0xB, 1, GetStr(0x3B9), 0, 1);
    AddSText(0, 0xC, 1, GetStr(0x3BA), 0, 1);
    AddSText(0, 0xD, 1, GetStr(0x34D), 0, 1);
    AddSText(0, 0xE, 1, GetStr(0x240), 0, 1);
    AddSLine(3);
    storenumh = 0x14;
}

/* @0x8006D870 */
void S_StartNoMoney(void)
{
    SItemListFlag = 0;
    StartStore(stextshold);
    stextsize = 1;
    stextscrl = 0;
    ClearSText(5, 0x17);
    AddSText(0, 0xA, 1, GetStr(0x4E9), 0, 1);
}

/* @0x8006D8D8 */
void S_StartNoRoom(void)
{
    SItemListFlag = 0;
    StartStore(stextshold);
    stextscrl = 0;
    ClearSText(5, 0x17);
    AddSText(0, 0xA, 1, GetStr(0x4EA), 0, 1);
}

/* @0x8006D938 */
void S_StartNoItems(void)
{
    SItemListFlag = 0;
    stextscrl = 0;
    if (WFlag) {
        StartStore(5);
        ClearSText(5, 0x17);
        AddSText(0, 0xA, 1, GetStr(0x2DA), 0, 1);
    } else {
        StartStore(1);
        stextshold = 1;
        ClearSText(5, 0x17);
        AddSText(0, 0xA, 1, GetStr(0x2BD), 0, 1);
    }
}

/* @0x8006979C -- the two RECT* branches (`(RECT*)((short*)&Field.y - 2)`) are transcribed literally
 * from the oracle's raw pointer arithmetic (StoreBackRect/StoreBackRectClipper are 8 bytes apart,
 * confirmed adjacent in the SYM); this reads 4 bytes BEFORE the named .y field on purpose, per the
 * oracle -- not a bug in the reconstruction. */
void PrintSString(int x, int y, unsigned char cjustflag, char *str, char col, int val)
{
    char valstr[32];
    int sy;
    int spinY;
    int printY;
    unsigned char R, G, B;
    RECT *clipRect;

    SWrapCount = 0;
    StoreBackRect.x += x;
    StoreBackRectClipper.x += x;
    switch (SItemListFlag) {
    case 0:
        SStringY = SStringYNorm;
        break;
    case 1:
        SStringY = SStringYBuy0;
        break;
    case 2:
        SStringY = SStringYBuy1;
        break;
    }
    GM_UseTexData(0);
    if (y >= 5) {
        y -= 1;
    }
    if (stextsel - 1 == y) {
        col = (col != 3) ? 3 : 0;
    }
    switch (col) {
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
    StoreBackRectClipper.y -= 4;
    sy = SStringY[y] + stext[y]._syoff;
    spinY = sy + StoreBackRect.y;
    StoreBackRect.y -= 4;
    StoreBackRect.h += 4;
    StoreBackRectClipper.h += 4;
    printY = sy + 3;
    if (val >= 0) {
        clipRect = (RECT *)((short *)&StoreBackRectClipper.y - 2);
    } else {
        clipRect = (RECT *)((short *)&StoreBackRect.y - 2);
    }
    SWrapCount = MediumFont.Print(0, printY, str, (TXT_JUST)cjustflag, clipRect, R, G, B);
    if (stextsel - 1 == y) {
        DrawSpinner(MediumFont.MinX - 8, spinY, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0xFFFF, 1, 0, 8);
    }
    if (val > 0) {
        sprintf(valstr, GetStr(0x4FD), val);
        StoreBackRect.w -= 0x1C;
        MediumFont.Print(0, printY, valstr, JustRight, &StoreBackRect, R, G, B);
        StoreBackRect.w += 0x1C;
    }
    if (stextsel - 1 == y) {
        DrawSpinner(MediumFont.MaxX + 4, spinY, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0xFFFF, 1, 0, 8);
    }
    SStringY = SStringYNorm;
    StoreBackRectClipper.x -= x;
    StoreBackRect.x -= x;
    StoreBackRectClipper.y += 4;
    StoreBackRect.y += 4;
    StoreBackRectClipper.h -= 4;
    StoreBackRect.h -= 4;
}

/* @0x80070748 */
void TakePlrsMoney(long cost)
{
    int i;

    plr[myplr]._pGold = CalculateGold(myplr) - cost;
    for (i = 0; i < 8 && cost > 0; i++) {
        if (plr[myplr].SpdList[i]._itype == 11 && plr[myplr].SpdList[i]._ivalue != 0x1388) {
            if (cost < plr[myplr].SpdList[i]._ivalue) {
                plr[myplr].SpdList[i]._ivalue -= cost;
                SetSpdbarGoldCurs(myplr, i);
                cost = 0;
            } else {
                cost -= plr[myplr].SpdList[i]._ivalue;
                RemoveSpdBarItem(myplr, i);
                i = -1;
            }
        }
    }
    if (cost > 0) {
        for (i = 0; i < 8 && cost > 0; i++) {
            if (plr[myplr].SpdList[i]._itype == 11) {
                if (cost < plr[myplr].SpdList[i]._ivalue) {
                    plr[myplr].SpdList[i]._ivalue -= cost;
                    SetSpdbarGoldCurs(myplr, i);
                    cost = 0;
                } else {
                    cost -= plr[myplr].SpdList[i]._ivalue;
                    RemoveSpdBarItem(myplr, i);
                    i = -1;
                }
            }
        }
    }
    if (cost > 0) {
        for (i = 0; i < plr[myplr]._pNumInv && cost > 0; i++) {
            if (plr[myplr].InvList[i]._itype == 11 && plr[myplr].InvList[i]._ivalue != 0x1388) {
                if (cost < plr[myplr].InvList[i]._ivalue) {
                    plr[myplr].InvList[i]._ivalue -= cost;
                    SetGoldCurs(myplr, i);
                    cost = 0;
                } else {
                    cost -= plr[myplr].InvList[i]._ivalue;
                    RemoveInvItem(myplr, i);
                    i = -1;
                }
            }
        }
        if (cost > 0) {
            for (i = 0; i < plr[myplr]._pNumInv && cost > 0; i++) {
                if (plr[myplr].InvList[i]._itype == 11) {
                    if (cost < plr[myplr].InvList[i]._ivalue) {
                        plr[myplr].InvList[i]._ivalue -= cost;
                        SetGoldCurs(myplr, i);
                        cost = 0;
                    } else {
                        cost -= plr[myplr].InvList[i]._ivalue;
                        RemoveInvItem(myplr, i);
                        i = -1;
                    }
                }
            }
        }
    }
}

/* @0x80071760 */
void PlaceStoreGold(long v)
{
    int i, ii, xx, yy;
    unsigned char done;

    done = 0;
    for (i = 0; i < 40 && !done; i++) {
        yy = 10 * (i / 10);
        xx = i % 10;
        if (plr[myplr].InvGrid[xx + yy] == 0) {
            ii = plr[myplr]._pNumInv;
            GetGoldSeed(myplr, &golditem);
            plr[myplr].InvList[ii] = golditem;
            plr[myplr]._pNumInv++;
            plr[myplr].InvGrid[xx + yy] = plr[myplr]._pNumInv;
            plr[myplr].InvList[ii]._ivalue = v;
            SetGoldCurs(myplr, ii);
            done = 1;
        }
    }
}

/* @0x8006E624 */
void S_StartStory(void)
{
    SItemListFlag = 0;
    stextsize = 0;
    stextscrl = 0;
    AddSText(0, 1, 1, GetStr(0x477), 3, 0);
    AddSText(0, 5, 1, GetStr(0x4DF), 3, 0);
    AddSText(0, 7, 1, GetStr(0x427), 1, 1);
    AddSText(0, 9, 1, GetStr(0x207), 0, 1);
    AddSText(0, 0xB, 1, GetStr(0x38C), 0, 1);
    AddSLine(3);
}

/* @0x8006F6CC */
void S_StartTavern(void)
{
    SItemListFlag = 0;
    stextsize = 0;
    stextscrl = 0;
    AddSText(0, 1, 1, GetStr(0x4CA), 3, 0);
    AddSText(0, 2, 1, GetStr(0x371), 3, 0);
    AddSText(0, 7, 1, GetStr(0x4DF), 3, 0);
    AddSText(0, 9, 1, GetStr(0x42B), 1, 1);
    AddSText(0, 0xB, 1, GetStr(0x242), 0, 1);
    AddSLine(3);
    storenumh = 0x14;
}

/* @0x8006F7C4 */
void S_StartBarMaid(void)
{
    SItemListFlag = 0;
    stextsize = 0;
    stextscrl = 0;
    AddSText(0, 1, 1, GetStr(0x183), 3, 0);
    AddSText(0, 7, 1, GetStr(0x4DF), 3, 0);
    AddSText(0, 9, 1, GetStr(0x429), 1, 1);
    AddSText(0, 0xB, 1, GetStr(0x38C), 0, 1);
    AddSLine(3);
    storenumh = 0x14;
}

/* @0x8006F898 */
void S_StartDrunk(void)
{
    SItemListFlag = 0;
    stextsize = 0;
    stextscrl = 0;
    AddSText(0, 1, 1, GetStr(0x13E), 3, 0);
    AddSText(0, 7, 1, GetStr(0x4DF), 3, 0);
    AddSText(0, 9, 1, GetStr(0x428), 1, 1);
    AddSText(0, 0xB, 1, GetStr(0x38C), 0, 1);
    AddSLine(3);
    storenumh = 0x14;
}

/* @0x8006F96C -- transcribed literally from the oracle's 24-case jump table (s-1 indexed); the
 * `StartStore(0x18)` recursive call inside the smith-buy case lands on the SAME table slot as
 * S_StartBarMaid in this build -- confirmed correct against the raw bytes, semantics unexplained. */
void StartStore(char s)
{
    int i;

    PlaySFX(0x33);
    StorePlrNo = options_pad;
    sbookflag = 0;
    invflag = 0;
    chrflag = 0;
    questlog = 0;
    dropGoldFlag = 0;
    ClearSText(0, NUMSTLINES);
    ReleaseStoreBtn();

    switch (s) {
    case 1:
        S_StartSmith();
        break;
    case 2:
        SmithItemCount = 0;
        if (smithitem[0]._itype != -1) {
            do {
                SmithItemCount++;
            } while (smithitem[SmithItemCount]._itype != -1);
        }
        if (SmithItemCount != 0) {
            S_StartSBuy();
        } else {
            StartStore(0x18);
        }
        break;
    case 3:
        S_StartSSell();
        break;
    case 4:
        S_StartSRepair();
        break;
    case 5:
        S_StartWitch();
        break;
    case 6:
        if (storenumh > 0) {
            S_StartWBuy();
        }
        break;
    case 7:
        S_StartWSell();
        break;
    case 8:
        S_StartWRecharge();
        break;
    case 9:
        S_StartNoMoney();
        break;
    case 10:
        S_StartNoRoom();
        break;
    case 11:
        S_StartNoItems();
        break;
    case 12:
        S_StartConfirm();
        break;
    case 13:
        S_StartBoy();
        break;
    case 14:
        S_StartBBoy();
        break;
    case 15:
        S_StartHealer();
        break;
    case 16:
        S_StartStory();
        break;
    case 17:
        if (storenumh > 0) {
            S_StartHBuy();
        }
        break;
    case 18:
        S_StartSIdentify();
        break;
    case 19:
        if (!S_StartSPBuy()) {
            return;
        }
        break;
    case 20:
        S_StartTalk();
        break;
    case 21:
        S_StartIdShow();
        break;
    case 22:
        S_StartTavern();
        break;
    case 23:
        S_StartDrunk();
        break;
    case 24:
        S_StartBarMaid();
        break;
    }

    i = 0;
    while (i < NUMSTLINES && !stext[i]._ssel) {
        i++;
    }
    if (i == NUMSTLINES) {
        i = -1;
    }
    stextsel = i;
    stextflag = s;
}

/* @0x80070648 */
void SetGoldCurs(int pnum, int i)
{
    if (plr[pnum].InvList[i]._ivalue >= 2500) {
        plr[pnum].InvList[i]._iCurs = 6;
    } else if (plr[pnum].InvList[i]._ivalue <= 1000) {
        plr[pnum].InvList[i]._iCurs = 4;
    } else {
        plr[pnum].InvList[i]._iCurs = 5;
    }
}

/* @0x800706C8 */
void SetSpdbarGoldCurs(int pnum, int i)
{
    if (plr[pnum].SpdList[i]._ivalue >= 2500) {
        plr[pnum].SpdList[i]._iCurs = 6;
    } else if (plr[pnum].SpdList[i]._ivalue <= 1000) {
        plr[pnum].SpdList[i]._iCurs = 4;
    } else {
        plr[pnum].SpdList[i]._iCurs = 5;
    }
}

/* @0x80074314 */
void ReleaseStoreBtn(void)
{
    stextscrlubtn = -1;
    stextscrldbtn = -1;
}

/* @0x80070570 */
void S_SmithEnter(void)
{
    WFlag = 0;
    switch (stextsel) {
    case 8:
        stextshold = 1;
        stextlhold = 8;
        gossipstart = 0xBD;
        talker = 0;
        gossipend = 0xC7;
        StartStore(0x13);
        break;
    case 9:
        StartStore(2);
        break;
    case 10:
        StartStore(0x12);
        break;
    case 11:
        StartStore(3);
        break;
    case 12:
        StartStore(4);
        break;
    case 13:
        stextflag = 0;
        break;
    }
    if ((signed char)stextflag == 0) {
        options_pad = -1;
    }
}

/* @0x8007222C */
void S_WitchEnter(void)
{
    WFlag = 1;
    if (stextsel - 8 < 0 || stextsel - 8 > 6) {
        return;
    }
    switch (stextsel - 8) {
    case 0:
        talker = 6;
        stextshold = 5;
        stextlhold = 8;
        gossipstart = 0xD5;
        gossipend = 0xDF;
        StartStore(0x13);
        break;
    case 1:
        WStaffFlag = 0;
        StartStore(6);
        break;
    case 2:
        WStaffFlag = 1;
        StartStore(6);
        break;
    case 3:
        WStaffFlag = 0;
        StartStore(7);
        break;
    case 4:
        WStaffFlag = 1;
        StartStore(7);
        break;
    case 5:
        StartStore(8);
        break;
    case 6:
        stextflag = 0;
        break;
    }
}

/* @0x8007381C */
void S_HealerEnter(void)
{
    switch (stextsel) {
    case 9:
        talker = 1;
        stextshold = 0xE;
        gossipstart = 0xAA;
        stextlhold = stextsel;
        gossipend = 0xB2;
        StartStore(0x13);
        return;
    case 11:
        StartStore(0x10);
        return;
    case 13:
        stextflag = 0;
        return;
    }
}

/* @0x80071D44 */
void S_SSellEnter(void)
{
    int idx;

    stextshold = 3;
    stextlhold = stextsel;
    stextvhold = stextsval;
    idx = (stextsel - stextup) / 8 + stextsval;
    plr[myplr].HoldItem = storehold[idx];
    SellIdx = idx;
    if (StoreGoldFit(idx)) {
        StartStore(0xB);
    } else {
        StartStore(0xA);
    }
}

/* @0x80072AD4 */
void S_WRechargeEnter(void)
{
    int idx;

    stextshold = 8;
    stextlhold = stextsel;
    stextvhold = stextsval;
    idx = (stextsel - stextup) / 8 + stextsval;
    plr[myplr].HoldItem = storehold[idx];
    SellIdx = idx;
    if (plr[myplr]._pGold < storehold[idx]._iIvalue) {
        StartStore(9);
    } else {
        StartStore(0xB);
    }
}

/* @0x80073B84 */
void S_SIDEnter(void)
{
    int idx;

    if (stextsel == 0x16) {
        StartStore(0xF);
        stextsel = 0xE;
        return;
    }
    stextshold = 0x11;
    stextlhold = stextsel;
    stextvhold = stextsval;
    idx = (stextsel - stextup) / 8 + stextsval;
    plr[myplr].HoldItem = storehold[idx];
    SellIdx = idx;
    if (plr[myplr]._pGold < storehold[idx]._iIvalue) {
        StartStore(9);
    } else {
        StartStore(0xB);
    }
}

/* @0x80073AE8 */
void S_StoryEnter(void)
{
    WFlag = 0;
    switch (stextsel) {
    case 7:
        talker = 4;
        stextshold = 0xF;
        gossipstart = 0x97;
        stextlhold = stextsel;
        gossipend = 0x9F;
        StartStore(0x13);
        return;
    case 9:
        StartStore(0x11);
        return;
    case 11:
        stextflag = 0;
        return;
    }
}

/* @0x80073F08 */
void S_TavernEnter(void)
{
    WFlag = 0;
    switch (stextsel) {
    case 9:
        talker = 3;
        stextshold = 0x15;
        gossipstart = 0xA1;
        stextlhold = stextsel;
        gossipend = 0xA8;
        StartStore(0x13);
        return;
    case 11:
        stextflag = 0;
        return;
    }
}

/* @0x80073F7C */
void S_BarmaidEnter(void)
{
    WFlag = 0;
    switch (stextsel) {
    case 9:
        talker = 7;
        stextshold = 0x17;
        gossipstart = 0xB4;
        stextlhold = stextsel;
        gossipend = 0xBB;
        StartStore(0x13);
        return;
    case 11:
        stextflag = 0;
        return;
    }
}

/* @0x80073FF0 */
void S_DrunkEnter(void)
{
    WFlag = 0;
    switch (stextsel) {
    case 9:
        talker = 5;
        stextshold = 0x16;
        gossipstart = 0xC9;
        stextlhold = stextsel;
        gossipend = 0xD3;
        StartStore(0x13);
        return;
    case 11:
        stextflag = 0;
        return;
    }
}
