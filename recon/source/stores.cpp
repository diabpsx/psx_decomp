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
