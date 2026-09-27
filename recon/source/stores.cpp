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
unsigned char *pSTextBoxCels = 0;
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

/* Static Dialog object: declaring it makes the compiler synthesize the ctor/dtor/_GLOBAL__ static-
 * init/destroy thunks automatically -- see __6Dialog_800743f0, ___6Dialog_800743c8,
 * _GLOBAL__I/D_pSTextBoxCels in the raw oracle (all boilerplate, not hand-written per-class code). */
static Dialog SBack;

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

/* @0x80074228 -- CPad idiom copied from psxhelp.cpp/pause.cpp: PAD_GetPad(options_pad, 0) then
 * repeated Pad->GetDown() & mask checks (GetDown() is genuinely re-invoked per check, not cached). */
void CheckStoreBtn(void)
{
    struct CPad *Pad;

    if (CDWAIT == 0 && qtextflag == 0) {
        Pad = PAD_GetPad(options_pad, 0);
        if (Pad->GetDown() & 1) {
            STextUp();
        }
        if (Pad->GetDown() & 2) {
            STextDown();
        }
        if ((Pad->GetDown() & 0x40) && stextsel != -1) {
            STextEnter();
        }
        if (Pad->GetDown() & 0x100) {
            STextESC();
        }
        if ((signed char)stextflag == 0) {
            options_pad = -1;
        }
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

/* @0x800720C8 */
void S_SRepairEnter(void)
{
    int idx;

    stextshold = 4;
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

/* @0x80072818 */
void S_WSellEnter(void)
{
    int idx;

    stextlhold = stextsel;
    stextvhold = stextsval;
    stextshold = 7;
    if (WStaffFlag != 0) {
        idx = (stextsel - stextup) / 8;
    } else {
        idx = (stextsel - stextup) / 4;
    }
    idx += stextsval;
    plr[myplr].HoldItem = storehold[idx];
    SellIdx = idx;
    if (StoreGoldFit(idx)) {
        StartStore(0xB);
    } else {
        StartStore(0xA);
    }
}

/* @0x80070B94 */
void SmithBuyItem(void)
{
    int idx;

    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    if (plr[myplr].HoldItem._iMagical == 0) {
        plr[myplr].HoldItem._iIdentified = 0;
    }
    StoreAutoPlace();
    idx = (stextlhold - stextup) / 4 + stextvhold;
    if (idx == 0x13) {
        _smithitem[StorePlrNo][19]._itype = -1;
    } else {
        if (_smithitem[StorePlrNo][idx + 1]._itype != -1) {
            do {
                _smithitem[StorePlrNo][idx] = _smithitem[StorePlrNo][idx + 1];
                idx++;
            } while (_smithitem[StorePlrNo][idx + 1]._itype != -1);
        }
        _smithitem[StorePlrNo][idx]._itype = -1;
    }
    CalcPlrInv(myplr, 1);
}

/* @0x80072958 -- offset 0x3A9 (fixed, no idx multiply) decodes to InvBody[4] per byte-offset math;
 * matches the "equipped, not in list" sentinel path when storehidx[idx] < 0. */
void WitchRechargeItem(void)
{
    int i;
    int idx;

    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    idx = (stextlhold - stextup) / 8 + stextvhold;
    storehold[idx]._iCharges = storehold[idx]._iMaxCharges;
    i = storehidx[idx];
    if (i < 0) {
        plr[myplr].InvBody[4]._iCharges = plr[myplr].InvBody[4]._iMaxCharges;
    } else {
        plr[myplr].InvList[i]._iCharges = plr[myplr].InvList[i]._iMaxCharges;
    }
    CalcPlrInv(myplr, 1);
}

/* @0x800733B0 -- irregular fallthrough switch transcribed literally from the m2c/raw shape: each
 * "case -N" is really an independent re-test of i, but since only one can match, chained
 * fallthrough-if is functionally identical to the retail's Duff's-device-style codegen. */
void StoryIdItem(void)
{
    int i;
    int idx;

    idx = (stextlhold - stextup) / 8 + stextvhold;
    i = storehidx[idx];
    switch (i) {
    case -1:
        plr[myplr].InvBody[0]._iIdentified = 1;
        if (i == -2) {
    case -2:
            plr[myplr].InvBody[6]._iIdentified = 1;
        }
        if (i == -3) {
    case -3:
            plr[myplr].InvBody[4]._iIdentified = 1;
        }
        if (i == -4) {
    case -4:
            plr[myplr].InvBody[5]._iIdentified = 1;
        }
        if (i == -5) {
    case -5:
            plr[myplr].InvBody[1]._iIdentified = 1;
        }
        if (i == -6) {
    case -6:
            plr[myplr].InvBody[2]._iIdentified = 1;
        }
        if (i == -7) {
    case -7:
            plr[myplr].InvBody[3]._iIdentified = 1;
        }
        break;
    default:
        plr[myplr].InvList[i]._iIdentified = 1;
        break;
    }
    plr[myplr].HoldItem._iIdentified = 1;
    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    CalcPlrInv(myplr, 1);
}

/* @0x80072DD0 */
void BoyBuyItem(void)
{
    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    StoreAutoPlace();
    stextshold = 0xC;
    _boyitem[StorePlrNo]._itype = -1;
    CalcPlrInv(myplr, 1);
}

/* @0x80072E70 */
void HealerBuyItem(void)
{
    int idx;

    idx = (stextlhold - stextup) / 4 + stextvhold;
    if (gbMaxPlayers == 1 ? idx < 2 : idx < 3) {
        plr[myplr].HoldItem._iSeed = GetRndSeed();
    }
    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    if (plr[myplr].HoldItem._iMagical == 0) {
        plr[myplr].HoldItem._iIdentified = 0;
    }
    StoreAutoPlace();
    CalcPlrInv(myplr, 1);
    if (!(gbMaxPlayers == 1 ? idx < 2 : idx < 3)) {
        if (idx == 0x13) {
            _healitem[StorePlrNo][19]._itype = -1;
        } else {
            if (_healitem[StorePlrNo][idx + 1]._itype != -1) {
                do {
                    _healitem[StorePlrNo][idx] = _healitem[StorePlrNo][idx + 1];
                    idx++;
                } while (_healitem[StorePlrNo][idx + 1]._itype != -1);
            }
            _healitem[StorePlrNo][idx]._itype = -1;
        }
        CalcPlrInv(myplr, 1);
    }
}

/* @0x80071E54 */
void SmithRepairItem(void)
{
    int i;
    int idx;

    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    idx = (stextlhold - stextup) / 8 + stextvhold;
    storehold[idx]._iDurability = storehold[idx]._iMaxDur;
    i = storehidx[idx];
    switch (i) {
    case -1:
        plr[myplr].InvBody[0]._iDurability = plr[myplr].InvBody[0]._iMaxDur;
        if (i == -2) {
    case -2:
            plr[myplr].InvBody[6]._iDurability = plr[myplr].InvBody[6]._iMaxDur;
        }
        if (i == -3) {
    case -3:
            plr[myplr].InvBody[4]._iDurability = plr[myplr].InvBody[4]._iMaxDur;
        }
        if (i == -4) {
    case -4:
            plr[myplr].InvBody[5]._iDurability = plr[myplr].InvBody[5]._iMaxDur;
            return;
        }
        return;
    default:
        plr[myplr].InvList[i]._iDurability = plr[myplr].InvList[i]._iMaxDur;
        break;
    }
}

/* @0x80071078 */
void SmithBuyPItem(void)
{
    int idx;
    int i;
    int xx;

    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    if (plr[myplr].HoldItem._iMagical == 0) {
        plr[myplr].HoldItem._iIdentified = 0;
    }
    StoreAutoPlace();
    xx = 0;
    idx = (stextlhold - stextup) / 8 + stextvhold;
    i = 0;
    if (idx >= 0) {
        do {
            if (_premiumitem[StorePlrNo][i]._itype != -1) {
                idx--;
                xx = i;
            }
            i++;
        } while (idx >= 0);
    }
    _premiumitem[StorePlrNo][xx]._itype = -1;
    _numpremium[StorePlrNo]--;
    SpawnPremium(plr[myplr]._pLevel);
}

/* @0x80071A00 */
void StoreSellItem(void)
{
    int idx;
    int i;
    long cost;

    if (WFlag != 0 && WStaffFlag == 0) {
        idx = (stextlhold - stextup) / 4 + stextvhold;
    } else {
        idx = (stextlhold - stextup) / 8 + stextvhold;
    }
    i = storehidx[idx];
    if (i >= 0) {
        RemoveInvItem(myplr, i);
    } else {
        RemoveSpdBarItem(myplr, ~i);
    }
    cost = storehold[idx]._iIvalue;
    storenumh--;
    if (idx != storenumh && idx < storenumh) {
        for (i = idx; i < storenumh; i++) {
            storehold[i] = storehold[i + 1];
            storehidx[i] = storehidx[i + 1];
        }
    }
    plr[myplr]._pGold += cost;
    i = 0;
    if (plr[myplr]._pNumInv > 0) {
        while (cost > 0) {
            if (plr[myplr].InvList[i]._itype == 11) {
                if (plr[myplr].InvList[i]._ivalue != 5000) {
                    if (cost + plr[myplr].InvList[i]._ivalue < 5001) {
                        plr[myplr].InvList[i]._ivalue = cost + plr[myplr].InvList[i]._ivalue;
                        SetGoldCurs(myplr, i);
                        cost = 0;
                    } else {
                        cost = cost - 5000 + plr[myplr].InvList[i]._ivalue;
                        plr[myplr].InvList[i]._ivalue = 5000;
                        SetGoldCurs(myplr, i);
                    }
                }
            }
            i++;
            if (i >= plr[myplr]._pNumInv) {
                goto block_26;
            }
        }
    } else {
block_26:
        if (cost > 0) {
            while (cost >= 5001) {
                PlaceStoreGold(5000);
                cost -= 5000;
            }
            PlaceStoreGold(cost);
        }
    }
}

/* @0x8007230C */
void WitchBuyItem(void)
{
    int idx;

    idx = SellIdx;
    if (WStaffFlag == 0 && idx < 3) {
        plr[myplr].HoldItem._iSeed = GetRndSeed();
    }
    TakePlrsMoney(plr[myplr].HoldItem._iIvalue);
    StoreAutoPlace();
    if (WStaffFlag != 0 || idx >= 3) {
        if (idx == 0x13) {
            _witchitem[StorePlrNo][19]._itype = -1;
        } else {
            if (_witchitem[StorePlrNo][idx + 1]._itype != -1) {
                do {
                    _witchitem[StorePlrNo][idx] = _witchitem[StorePlrNo][idx + 1];
                    idx++;
                } while (_witchitem[StorePlrNo][idx + 1]._itype != -1);
            }
            _witchitem[StorePlrNo][idx]._itype = -1;
        }
    }
    CalcPlrInv(myplr, 1);
}

/* @0x80073700 -- literal transcription of the m2c irregular switch: case 2 has no break and falls
 * through into the shared "default" tail (StartStore(stextshold); return;), which is also reached
 * via goto from every other buy/sell case. */
void S_ConfirmEnter(void)
{
    if (stextsel == 0x11) {
        switch (stextshold) {
        case 2:
            SmithBuyItem();
            StartStore(stextshold);
            return;
        case 18:
            SmithBuyPItem();
            StartStore(stextshold);
            return;
        case 3:
        case 7:
            StoreSellItem();
            StartStore(stextshold);
            return;
        case 4:
            SmithRepairItem();
            StartStore(stextshold);
            return;
        case 6:
            WitchBuyItem();
            StartStore(stextshold);
            return;
        case 8:
            WitchRechargeItem();
            StartStore(stextshold);
            return;
        case 13:
            BoyBuyItem();
            StartStore(stextshold);
            return;
        case 16:
            HealerBuyItem();
            StartStore(stextshold);
            return;
        case 17:
            StoryIdItem();
            StartStore(0x14);
            return;
        default:
            StartStore(stextshold);
            return;
        }
    } else {
        StartStore(stextshold);
        stextsel = stextlhold;
        stextsval = stextvhold;
    }
}

/* @0x80070E14 */
void S_SBuyEnter(void)
{
    int idx;
    int i;
    unsigned char done;
    int w, h;

    if (SmithItemCount == 0) {
        StartStore(1);
        return;
    }
    stextshold = 2;
    stextlhold = stextsel;
    stextvhold = stextsval;
    if (SItemListFlag == 1) {
        idx = (stextsel - stextup) / 4;
    } else {
        idx = (stextsel - stextup) / 8;
    }
    idx += stextsval;
    if (plr[myplr]._pGold < _smithitem[StorePlrNo][idx]._iIvalue) {
        StartStore(9);
        return;
    }
    plr[myplr].HoldItem = _smithitem[StorePlrNo][idx];
    SellIdx = idx;
    SetCursor(plr[myplr].HoldItem._iCurs + 0xC);
    i = 0;
    do {
        w = cursW;
        if (w < 0) {
            w += 0xF;
        }
        h = cursH;
        if (h < 0) {
            h += 0xF;
        }
        done = func_80159F24(myplr, i++, w >> 4, h >> 4, 0) & 0xFF;
    } while (i < 0x28 && done == 0);
    StartStore(done != 0 ? 0xB : 0xA);
    SetCursor(1);
}

/* @0x80072590 */
void S_WBuyEnter(void)
{
    int idx;
    int i;
    unsigned char done;
    int w, h;

    if (_NoWitchItems[StorePlrNo] == 0) {
        StartStore(5);
        return;
    }
    stextshold = 6;
    stextlhold = stextsel;
    stextvhold = stextsval;
    if (WStaffFlag != 0) {
        idx = (stextsel - stextup) / 8;
    } else {
        idx = (stextsel - stextup) / 4;
    }
    idx += stextsval + _WitchIdxOfs[StorePlrNo];
    if (plr[myplr]._pGold < _witchitem[StorePlrNo][idx]._iIvalue) {
        StartStore(9);
        return;
    }
    plr[myplr].HoldItem = _witchitem[StorePlrNo][idx];
    SellIdx = idx;
    SetCursor(plr[myplr].HoldItem._iCurs + 0xC);
    i = 0;
    do {
        w = cursW;
        if (w < 0) {
            w += 0xF;
        }
        h = cursH;
        if (h < 0) {
            h += 0xF;
        }
        done = func_8015A24C(myplr, i++, w >> 4, h >> 4, 0) & 0xFF;
    } while (i < 0x28 && done == 0);
    StartStore(done != 0 ? 0xB : 0xA);
    SetCursor(1);
}

/* @0x8007319C */
void S_BBuyEnter(void)
{
    int i;
    unsigned char done;
    int w, h;
    long half;

    if (stextsel == 5) {
        stextlhold = stextsel;
        stextshold = 0xD;
        stextvhold = stextsval;
        if (plr[myplr]._pGold < _boyitem[StorePlrNo]._iIvalue + (_boyitem[StorePlrNo]._iIvalue >> 1)) {
            StartStore(9);
            return;
        }
        plr[myplr].HoldItem = _boyitem[StorePlrNo];
        half = plr[myplr].HoldItem._iIvalue >> 1;
        plr[myplr].HoldItem._iIvalue += half;
        SetCursor(plr[myplr].HoldItem._iCurs + 0xC);
        i = 0;
        do {
            w = cursW;
            if (w < 0) {
                w += 0xF;
            }
            h = cursH;
            if (h < 0) {
                h += 0xF;
            }
            done = func_80159F24(myplr, i++, w >> 4, h >> 4, 0) & 0xFF;
        } while (i < 0x28 && done == 0);
        StartStore(done != 0 ? 0xB : 0xA);
        SetCursor(1);
        return;
    }
    stextflag = 0;
}

/* @0x80072C38 -- m2c/ida both mis-detect this as taking an int arg; the raw oracle shows a genuine
 * void(void) function (TakePlrsMoney's second m2c "arg" is also spurious -- it's the known
 * single-arg TakePlrsMoney(long)). */
void S_BoyEnter(void)
{
    if (_boyitem[StorePlrNo]._itype != -1 && stextsel == 0xC) {
        if (plr[myplr]._pGold < 0x32) {
            stextshold = 0xC;
            stextlhold = 0xC;
            stextvhold = stextsval;
            StartStore(9);
            return;
        }
        TakePlrsMoney(0x32);
        StartStore(0xD);
        return;
    }
    if ((stextsel == 6 && _boyitem[StorePlrNo]._itype != -1) ||
        (stextsel == 8 && _boyitem[StorePlrNo]._itype == -1)) {
        talker = 8;
        stextshold = 0xC;
        gossipstart = 0xE1;
        gossipend = 0xEA;
        stextlhold = stextsel;
        StartStore(0x13);
        return;
    }
    stextflag = 0;
}

/* @0x80070258 */
void STextUp(void)
{
    if (stextsel != -1) {
        if (stextscrl != 0) {
            if (stextsel == stextup) {
                if (stextsval != 0) {
                    stextsval -= 1;
                }
            } else {
                stextsel -= 1;
                if ((stext[stextsel]._ssel) == 0) {
                    do {
                        if (stextsel == 0) {
                            stextsel = 0x17;
                        } else {
                            stextsel -= 1;
                        }
                    } while ((stext[stextsel]._ssel) == 0);
                }
            }
        } else {
            if (stextsel == 0) {
                stextsel = 0x17;
            } else {
                stextsel -= 1;
            }
            if ((stext[stextsel]._ssel) == 0) {
                do {
                    if (stextsel == 0) {
                        stextsel = 0x17;
                    } else {
                        stextsel -= 1;
                    }
                } while ((stext[stextsel]._ssel) == 0);
            }
        }
    }
    PlaySFX(0x32);
}

/* @0x800703DC */
void STextDown(void)
{
    if (stextsel != -1) {
        if (stextscrl != 0) {
            if (stextsel == stextdown) {
                if (stextsval < stextsmax) {
                    stextsval += 1;
                }
            } else {
                stextsel += 1;
                if (stext[stextsel]._ssel == 0) {
                    do {
                        if (stextsel == 0x17) {
                            stextsel = 0;
                        } else {
                            stextsel += 1;
                        }
                    } while (stext[stextsel]._ssel == 0);
                }
            }
        } else {
            if (stextsel == 0x17) {
                stextsel = 0;
            } else {
                stextsel += 1;
            }
            if (stext[stextsel]._ssel == 0) {
                do {
                    if (stextsel == 0x17) {
                        stextsel = 0;
                    } else {
                        stextsel += 1;
                    }
                } while (stext[stextsel]._ssel == 0);
            }
        }
    }
    PlaySFX(0x32);
}

/* @0x800700B4 -- switch on stextflag (1-indexed, per the raw/ida decode -- the m2c draft's case
 * labels are off-by-one, "stextflag - 1", and its second "case 23" is actually ida's case 24 (0x18);
 * transcribed from ida's values directly). Shared tail blocks are written out literally at each
 * convergence point (no goto/label) so gcc's tail-merge collapses the duplicates, per the
 * S_ConfirmEnter lesson (an explicit C label emits an extra debug LABEL record retail doesn't have). */
void STextESC(void)
{
    PlaySFX(0x33);
    switch (stextflag) {
    case 1:
    case 5:
    case 12:
    case 14:
    case 15:
    case 21:
    case 22:
    case 23:
        stextflag = 0;
        options_pad = -1;
        stream_stop();
        return;
    case 2:
        StartStore(1);
        stextsel = 9;
        return;
    case 3:
        StartStore(1);
        stextsel = 0xB;
        return;
    case 4:
        StartStore(1);
        stextsel = 0xC;
        return;
    case 6:
        StartStore(5);
        if (WStaffFlag != 0) {
            stextsel = 0xA;
        } else {
            stextsel = 9;
        }
        return;
    case 7:
        StartStore(5);
        if (WStaffFlag == 0) {
            stextsel = 0xB;
        } else {
            stextsel = 0xC;
        }
        return;
    case 8:
        StartStore(5);
        stextsel = 0xD;
        return;
    case 9:
    case 10:
    case 11:
    case 24:
        StartStore(stextshold);
        stextsel = stextlhold;
        stextsval = stextvhold;
        return;
    case 13:
        StartStore(0xC);
        stextsel = 6;
        return;
    case 16:
        StartStore(0xE);
        stextsel = 0xB;
        return;
    case 17:
        StartStore(0xF);
        stextsel = 9;
        return;
    case 18:
        StartStore(1);
        stextsel = 0xA;
        return;
    case 19:
        StartStore(stextshold);
        stextsel = stextlhold;
        return;
    case 20:
        StartStore(0x11);
        return;
    default:
        return;
    }
}

/* @0x80074064 -- ida's 1-indexed switch on stextflag is the authority (m2c's index is off-by-one). */
void STextEnter(void)
{
    PlaySFX(0x33);
    switch (stextflag) {
    case 1:
        S_SmithEnter();
        return;
    case 2:
        S_SBuyEnter();
        return;
    case 18:
        S_SPBuyEnter();
        return;
    case 3:
        S_SSellEnter();
        return;
    case 4:
        S_SRepairEnter();
        return;
    case 5:
        S_WitchEnter();
        return;
    case 6:
        S_WBuyEnter();
        return;
    case 7:
        S_WSellEnter();
        return;
    case 8:
        S_WRechargeEnter();
        return;
    case 9:
    case 10:
    case 24:
        StartStore(stextshold);
        stextsel = stextlhold;
        stextsval = stextvhold;
        return;
    case 11:
        S_ConfirmEnter();
        return;
    case 12:
        S_BoyEnter();
        return;
    case 13:
        S_BBuyEnter();
        return;
    case 14:
        S_HealerEnter();
        return;
    case 15:
        S_StoryEnter();
        return;
    case 16:
        S_HBuyEnter();
        return;
    case 17:
        S_SIDEnter();
        return;
    case 19:
        S_TalkEnter();
        return;
    case 20:
        StartStore(0x11);
        return;
    case 21:
        S_TavernEnter();
        return;
    case 23:
        S_BarmaidEnter();
        return;
    case 22:
        S_DrunkEnter();
        return;
    default:
        return;
    }
}

/* @0x80073D08 -- SetRndSeed's extra m2c "args" are spurious (real signature is SetRndSeed(long),
 * matching the existing extern); ida's single-arg call is the authority. */
void S_TalkEnter(void)
{
    int i;
    int tq;
    int sn;
    int la;

    if (stextsel == 0x16) {
        StartStore(stextshold);
        stextsel = stextlhold;
        return;
    }
    tq = 0;
    i = 0;
    do {
        if (quests[i]._qactive == 2 && Qtalklist[talker][i] != -1 && quests[i]._qlog != 0) {
            tq += 1;
        }
        i += 1;
    } while (i < 0x10);
    sn = 0xA - (tq >> 1);
    if (stextsel == sn - 2) {
        SetRndSeed(towner[talker]._tSeed);
        InitQTextMsg(ENG_random(gossipend - gossipstart + 1) + gossipstart);
        return;
    }
    i = 0;
    do {
        if (quests[i]._qactive == 2) {
            la = Qtalklist[talker][i];
            if (la != -1 && quests[i]._qlog != 0) {
                if (sn == stextsel) {
                    InitQTextMsg(la);
                }
                sn = sn + 1;
            }
        }
        i = i + 1;
    } while (i < 0x10);
}

/* @0x8007123C */
void S_SPBuyEnter(void)
{
    int idx;
    int i;
    int found;
    unsigned char done;
    int w, h;

    stextshold = 0x12;
    stextlhold = stextsel;
    stextvhold = stextsval;
    idx = (stextsel - stextup) / 8 + stextsval;
    found = 0;
    i = 0;
    if (idx >= 0) {
        do {
            if (_premiumitem[StorePlrNo][i]._itype != -1) {
                idx--;
                found = i;
            }
            i++;
        } while (idx >= 0);
    }
    if (plr[myplr]._pGold < _premiumitem[StorePlrNo][found]._iIvalue) {
        StartStore(9);
        return;
    }
    plr[myplr].HoldItem = _premiumitem[StorePlrNo][found];
    SellIdx = found;
    SetCursor(plr[myplr].HoldItem._iCurs + 0xC);
    i = 0;
    do {
        w = cursW;
        if (w < 0) {
            w += 0xF;
        }
        h = cursH;
        if (h < 0) {
            h += 0xF;
        }
        done = func_80159F24(myplr, i++, w >> 4, h >> 4, 0) & 0xFF;
    } while (i < 0x28 && done == 0);
    StartStore(done != 0 ? 0xB : 0xA);
    SetCursor(1);
}

/* @0x8006FCC8 */
void DrawStoreHelpText(void)
{
    switch (stextflag) {
    case 1:
    case 5:
    case 12:
    case 14:
    case 15:
    case 19:
    case 21:
    case 22:
    case 23:
        MediumFont.Print(0, 0xDE, GetStr(0x4E6), JustCentre, 0, WHITER, WHITEG, WHITEB);
        break;
    case 24:
        break;
    }
}

/* @0x8006FD64 */
void DrawSText(void)
{
    if (InStoreFlag == 0) {
        InStoreFlag = 1;
        TSK_AddTask(0, DrawSTextTSK, 0x1000, 0);
    }
}

/* @0x8006FDA4 -- m2c's decompile (single GLUE_Finished() check outside the loop) does NOT match the
 * raw oracle: the real shape is a plain do-while re-checking GLUE_Finished() every iteration and
 * breaking out entirely once it returns true, transcribed directly from the raw bytes below. */
void DrawSTextTSK(struct TASK *T)
{
    InStoreFlag = 1;
    GLUE_SetHomingScrollFlag(0);
    GLUE_SetShowPanelFlag(0);
    GLUE_SuspendGame();
    if ((signed char)stextflag != 0) {
        do {
            if ((GLUE_Finished() ^ 1) == 0) {
                break;
            }
            if (qtextflag == 0 && CDWAIT == 0 && TextPtr != 0) {
                DoThatDrawSText();
            }
            TSK_Sleep(1);
        } while ((signed char)stextflag != 0);
    }
    if (qtextflag == 0) {
        DoThatDrawSText();
    }
    InStoreFlag = 0;
    if (qtextflag == 0) {
        GLUE_ResumeGame();
        GLUE_SetShowPanelFlag(1);
        GLUE_SetHomingScrollFlag(1);
        PauseMode = 0;
    }
}

/* @0x8006FEAC -- switch on stextflag (real values, not the m2c "stextflag-2" offset labels); the
 * `if (stext[i+1]._sval > 0) { }` in the m2c draft has an empty body (dead compare retained by the
 * oracle's compiler); transcribed as omitted since it has no observable effect either way. */
void DoThatDrawSText(void)
{
    int i;

    StoreBackRect.y = 0x18;
    StoreBackRectClipper.y = 0x18;
    StoreBackRect.w = 0x118;
    StoreBackRect.x = 0x14;
    StoreBackRect.h = 0xC9;
    StoreBackRectClipper.x = 0x14;
    StoreBackRectClipper.w = 0xBC;
    StoreBackRectClipper.h = 0xC9;
    if (stextscrl != 0) {
        switch (stextflag) {
        case 2:
            S_ScrollSBuy(stextsval);
            break;
        case 18:
            S_ScrollSPBuy(stextsval);
            break;
        case 3:
        case 4:
        case 7:
        case 8:
        case 17:
            S_ScrollSSell(stextsval);
            break;
        case 6:
            S_ScrollWBuy(stextsval + _WitchIdxOfs[StorePlrNo]);
            break;
        case 16:
            S_ScrollHBuy(stextsval);
            break;
        }
    }
    i = 0;
    do {
        if (stext[i]._sline) {
            DrawSLine(i);
        }
        if (stext[i]._sstr[0] != 0) {
            PrintSString(stext[i]._sx, i, stext[i]._sjust, stext[i]._sstr, stext[i]._sclr, stext[i]._sval);
        }
        i++;
        if (stext[i]._sval > 0) {
        }
    } while (i < 0x18);
    DrawQTextBack();
    DrawStoreArrows();
    DrawStoreHelpText();
}

/* @0x80069C44 */
void DrawSLine(int y)
{
    int yy;

    yy = SStringY[y] + StoreBackRect.y;
    SBack.SetBorder(0x1A);
    SBack.SetRGB(BORDERR >> 1, BORDERG >> 1, BORDERB >> 1);
    SBack.Line(StoreBackRect.x, yy, StoreBackRect.w);
}

/* @0x8006961C */
void DrawStoreArrows(void)
{
    int otpos;
    int show;
    int v1;
    struct TextDat *td;
    struct POLY_FT4 *ft4;

    otpos = CBlocks::GetOverlayOtBase() + 0xA;
    v1 = (unsigned char)stextflag;
    show = 0;
    if ((unsigned int)(v1 - 2) < 2 || (signed char)v1 == 4 ||
        (unsigned int)(v1 - 6) < 2 || (signed char)v1 == 8 ||
        (unsigned int)(v1 - 0x10) < 2 || (signed char)v1 == 0x12) {
        show = 1;
    }
    if (show != 0 && storenumh != 0) {
        td = GM_UseTexData(0);
        if (stextsval != 0) {
            ft4 = td->PrintFt4(0x7F, StoreBackRect.x, StoreBackRect.y + 0x31, 0, otpos, 0);
            ft4->code &= 0xFC;
            ft4->r0 = GOLDR;
            ft4->g0 = GOLDG;
            ft4->b0 = GOLDB;
        }
        if (stextsval < stextsmax) {
            ft4 = td->PrintFt4(0x80, StoreBackRect.x, (StoreBackRect.y + StoreBackRect.h) - 0x12, 0, otpos, 0);
            ft4->code &= 0xFC;
            ft4->r0 = GOLDR;
            ft4->g0 = GOLDG;
            ft4->b0 = GOLDB;
        }
    }
}

/* @0x8006ABD8 -- hellfire's S_ScrollSBuy (STORES.CPP:568) is the twin; PSX macro `smithitem` =
 * _smithitem[StorePlrNo] (see the per-player macro block above). MakeItemStr's 3rd arg is a real
 * MaxLen param (confirmed via items.cpp's already-reconstructed MakeItemStr), not an m2c mis-count. */
void S_ScrollSBuy(int idx)
{
    int l;
    int ls;
    signed char iclr;

    ClearSText(5, 0x15);
    stextup = 5;
    l = 5;
    do {
        if (_smithitem[StorePlrNo][idx]._itype != -1) {
            ls = l;
            iclr = _smithitem[StorePlrNo][idx]._iMagical != 0;
            if (_smithitem[StorePlrNo][idx]._iStatFlag == 0) {
                iclr = 2;
            }
            if (_smithitem[StorePlrNo][idx]._iMagical) {
                AddSText(0xC, l, 0, MakeItemStr(&_smithitem[StorePlrNo][idx], _smithitem[StorePlrNo][idx]._iIName, (StoreBackRect.w - 0x44) & 0xFFFF), iclr, 1);
            } else {
                AddSText(0xC, l, 0, MakeItemStr(&_smithitem[StorePlrNo][idx], _smithitem[StorePlrNo][idx]._iName, (StoreBackRect.w - 0x44) & 0xFFFF), iclr, 1);
            }
            AddSTextVal(l, _smithitem[StorePlrNo][idx]._iIvalue);
            PrintStoreItem(&_smithitem[StorePlrNo][idx], l + 1, iclr);
            stextdown = ls;
            idx++;
        }
        l += 4;
    } while (l < 0xF);
    if (!stext[stextsel]._ssel && stextsel != 0x16) {
        stextsel = stextdown;
    }
}

/* @0x8006B4B8 */
void S_ScrollSSell(int idx)
{
    int l;
    int step;

    step = 8;
    if (SItemListFlag == 1) {
        step = 4;
    }
    ClearSText(5, 0x15);
    stextup = 5;
    for (l = 5; l < 0xF && idx < storenumh; idx++, l += step) {
        if (storehold[idx]._itype != -1) {
            int ls;
            int v;
            char iclr;
            char *StrPtr;

            ls = l;
            iclr = storehold[idx]._iMagical != 0;
            if (storehold[idx]._iMagical == 2) {
                iclr = 3;
            }
            if (storehold[idx]._iStatFlag == 0) {
                iclr = 2;
            }
            if (storehold[idx]._iMagical != 0 && storehold[idx]._iIdentified != 0) {
                v = storehold[idx]._iIvalue;
                StrPtr = MakeItemStr(&storehold[idx], storehold[idx]._iIName, 0x100);
            } else {
                StrPtr = MakeItemStr(&storehold[idx], storehold[idx]._iName, 0x100);
                v = storehold[idx]._ivalue;
            }
            AddSText(0xC, l, 0, StrPtr, iclr, 1);
            AddSTextVal(l, v);
            PrintStoreItem(&storehold[idx], l + MediumFont.GetWrap(StrPtr, &StoreBackRectClipper), iclr);
            stextdown = ls;
        }
    }
    stextsmax = storenumh - 2;
    if (WStaffFlag == 0 && WFlag != 0) {
        stextsmax = storenumh - 3;
    }
    if (stextsmax < 0) {
        stextsmax = 0;
    }
}

/* @0x8006C4D0 */
void S_ScrollWBuy(int idx)
{
    int l;
    int step;

    step = 4;
    if (WStaffFlag != 0) {
        step = 8;
    }
    ClearSText(5, 0x15);
    stextup = 5;
    for (l = 5; l < 0xF; l += step) {
        if (_witchitem[StorePlrNo][idx]._itype != -1) {
            int ls;
            char iclr;
            char *StrPtr;

            iclr = _witchitem[StorePlrNo][idx]._iMagical != 0;
            ls = l;
            if (_witchitem[StorePlrNo][idx]._iStatFlag == 0) {
                iclr = 2;
            }
            if (_witchitem[StorePlrNo][idx]._iMagical) {
                StrPtr = MakeItemStr(&_witchitem[StorePlrNo][idx], _witchitem[StorePlrNo][idx]._iIName, 0x100);
            } else {
                StrPtr = MakeItemStr(&_witchitem[StorePlrNo][idx], _witchitem[StorePlrNo][idx]._iName, 0x100);
            }
            AddSText(0xC, l, 0, StrPtr, iclr, 1);
            AddSTextVal(l, _witchitem[StorePlrNo][idx]._iIvalue);
            PrintStoreItem(&_witchitem[StorePlrNo][idx], l + MediumFont.GetWrap(StrPtr, &StoreBackRectClipper), iclr);
            stextdown = ls;
            idx++;
        }
    }
    if (!stext[stextsel]._ssel && stextsel != 0x16) {
        stextsel = stextdown;
    }
}

/* @0x8006E304 */
void S_ScrollHBuy(int idx)
{
    int l;

    ClearSText(5, 0x15);
    stextup = 5;
    for (l = 5; l < 0xF; l += 4) {
        if (_healitem[StorePlrNo][idx]._itype != -1) {
            int ls;
            int iclr;
            char *StrPtr;

            ls = l;
            iclr = (_healitem[StorePlrNo][idx]._iStatFlag == 0) * 2;
            StrPtr = MakeItemStr(&_healitem[StorePlrNo][idx], _healitem[StorePlrNo][idx]._iName, (StoreBackRect.w - 0x44) & 0xFFFF);
            AddSText(0xC, l, 0, StrPtr, iclr, 1);
            AddSTextVal(l, _healitem[StorePlrNo][idx]._iIvalue);
            PrintStoreItem(&_healitem[StorePlrNo][idx], l + MediumFont.GetWrap(StrPtr, &StoreBackRectClipper), iclr);
            stextdown = ls;
            idx++;
        }
    }
    if (!stext[stextsel]._ssel && stextsel != 0x16) {
        stextsel = stextdown;
    }
}

/* @0x8006AFB0 */
void S_ScrollSPBuy(int idx)
{
    int boughtitems;
    int l;
    int nidx;

    ClearSText(5, 0x15);
    boughtitems = idx;
    stextup = 5;
    nidx = 0;
    if (boughtitems != 0) {
        do {
            if (_premiumitem[StorePlrNo][nidx]._itype != -1) {
                boughtitems--;
            }
            nidx++;
        } while (boughtitems != 0);
    }
    for (l = 5; l < 0xF && nidx < 6; nidx++, l += 8) {
        if (_premiumitem[StorePlrNo][nidx]._itype == -1) {
            l -= 8;
        } else {
            char iclr;
            char *StrPtr;

            iclr = _premiumitem[StorePlrNo][nidx]._iMagical != 0;
            if (_premiumitem[StorePlrNo][nidx]._iStatFlag == 0) {
                iclr = 2;
            }
            StrPtr = MakeItemStr(&_premiumitem[StorePlrNo][nidx], _premiumitem[StorePlrNo][nidx]._iIName, 0x100);
            AddSText(0xC, l, 0, StrPtr, iclr, 1);
            AddSTextVal(l, _premiumitem[StorePlrNo][nidx]._iIvalue);
            PrintStoreItem(&_premiumitem[StorePlrNo][nidx], l + MediumFont.GetWrap(StrPtr, &StoreBackRectClipper), iclr);
            stextdown = l;
        }
    }
    if (!stext[stextsel]._ssel && stextsel != 0x16) {
        stextsel = stextdown;
    }
}

/* @0x80069ECC -- twin: hellfire STORES.CPP:436 PrintStoreItem, PSX deltas: localized GetStr() ids
 * instead of literal C strings, an added "Required:" separator-comma gate keyed off _iMiscId, and a
 * word-wrap-aware padding-space insert before the printed durability text (GetStrWidth check against
 * StoreBackRect.w). D_8011BAAC/D_8011BAB0 are un-named oracle string constants; transcribed as their
 * evident literal content (",  " and " ") since the oracle only exposes their addresses, not source
 * names. */
void PrintStoreItem(const struct ItemStruct *x, int l, char iclr)
{
    char sstr[128];
    int li;

    li = 0;
    sstr[0] = 0;
    if (x->_iIdentified != 0) {
        if (x->_iMagical != 2) {
            if (x->_iPrePower != -1) {
                PrintItemPower(PL_Prefix[x->_iPrePower].PLPower, x);
                if (tempstr[0] != 0) {
                    strcat(sstr, tempstr);
                }
            }
        }
        if (x->_iSufPower != -1) {
            PrintItemPower(PL_Suffix[x->_iSufPower].PLPower, x);
            if (sstr[0] != 0) {
                if (tempstr[0] != 0) {
                    strcat(sstr, ",  ");
                    li = 1;
                    goto block_9;
                }
            }
            if (tempstr[0] != 0) {
                strcat(sstr, tempstr);
            }
block_9:;
        }
    }
    if (x->_iMiscId == 0x17) {
        if (x->_iMaxCharges != 0) {
            sprintf(tempstr, GetStr(0xB2), x->_iCharges, x->_iMaxCharges);
            if (sstr[0] != 0) {
                strcat(sstr, ",  ");
                li += 1;
            }
            strcat(sstr, tempstr);
        }
    }
    if (sstr[0] != 0) {
        AddSText(0xC, l, 0, sstr, iclr, 0);
        l = l + 1 + li;
        li = 0;
    }
    sstr[0] = 0;
    if (x->_iClass == 1) {
        sprintf(sstr, "%s:%i-%i", GetStr(0xE1), x->_iMinDam, x->_iMaxDam);
    }
    if (x->_iClass == 2) {
        sprintf(sstr, GetStr(0x2F), x->_iAC);
    }
    if (x->_iMaxDur == 0xFF || x->_iMaxDur == 0) {
        if (sstr[0] != 0) {
            strcat(sstr, ",  ");
        }
        strcat(sstr, GetStr(0x218));
    } else {
        sprintf(tempstr, GetStr(0x11F), x->_iDurability, x->_iMaxDur);
        if (((short)StoreBackRect.w * 2) - 0x44 >= MediumFont.GetStrWidth(tempstr) + MediumFont.GetStrWidth(sstr)) {
            strcat(sstr, " ");
        }
        strcat(sstr, tempstr);
    }
    if (x->_itype == 0) {
        sstr[0] = 0;
    }
    if ((unsigned int)(x->_iMiscId - 0x15) >= 2 && (unsigned int)(x->_iMiscId - 2) >= 2 &&
        (unsigned int)(x->_iMiscId - 4) >= 2 && (unsigned int)(x->_iMiscId - 6) >= 2 &&
        (unsigned int)(x->_iMiscId - 0xA) >= 2 && (unsigned int)(x->_iMiscId - 0xC) >= 2 &&
        (unsigned int)(x->_iMiscId - 0xE) >= 2 && (unsigned int)(x->_iMiscId - 0x10) >= 2 &&
        (unsigned int)(x->_iMiscId - 0x12) >= 2 && x->_iMiscId != 0x18) {
        strcat(sstr, ",  ");
    }
    if (x->_iMinStr + x->_iMinMag + x->_iMinDex == 0) {
        strcat(sstr, GetStr(0x2D1));
    } else {
        strcpy(tempstr, GetStr(0x35D));
        if (x->_iMinStr != 0) {
            sprintf(tempstr, GetStr(0x51C), tempstr, x->_iMinStr);
        }
        if (x->_iMinMag != 0) {
            sprintf(tempstr, GetStr(0x51B), tempstr, x->_iMinMag);
        }
        if (x->_iMinDex != 0) {
            sprintf(tempstr, GetStr(0x51A), tempstr, x->_iMinDex);
        }
        strcat(sstr, tempstr);
    }
    AddSText(0xC, l, 0, sstr, iclr, 0);
    l = l + 2 + li;
    if (x->_iMagical == 2 && x->_iIdentified != 0) {
        if (x->_iMaxDur == 0xFF || x->_iMaxDur == 0) {
            AddSText(0xC, l + 1, 0, GetStr(0x4A3), iclr, 0);
        } else {
            AddSText(0xC, l, 0, GetStr(0x4A3), iclr, 0);
        }
    }
}

/* @0x800738B4 */
void S_HBuyEnter(void)
{
    int idx;
    int i;
    unsigned char done;
    int w, h;

    if (stextsel == 0x16) {
        StartStore(0xE);
        stextsel = 0xB;
        return;
    }
    stextshold = 0x10;
    stextlhold = stextsel;
    stextvhold = stextsval;
    idx = (stextsel - stextup) / 4 + stextsval;
    if (plr[myplr]._pGold < _healitem[StorePlrNo][idx]._iIvalue) {
        StartStore(9);
        return;
    }
    plr[myplr].HoldItem = _healitem[StorePlrNo][idx];
    SellIdx = idx;
    SetCursor(plr[myplr].HoldItem._iCurs + 0xC);
    i = 0;
    do {
        w = cursW;
        if (w < 0) {
            w += 0xF;
        }
        h = cursH;
        if (h < 0) {
            h += 0xF;
        }
        done = func_8015A24C(myplr, i++, w >> 4, h >> 4, 0) & 0xFF;
    } while (i < 0x28 && done == 0);
    StartStore(done != 0 ? 0xB : 0xA);
    SetCursor(1);
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
