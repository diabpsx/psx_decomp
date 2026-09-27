/* ITEMS.CPP — Diablo PSX (Climax 1998) reconstruction (main image).  Twin: refs/diablo-hellfire/src/ITEMS.CPP
 * (the original Synergistic/Blizzard-lineage source; keeps its line numbers/decl order/spellings — see
 * 00_current_diablo.md checkpoint q). devilution/devilutionx are second-tier references.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas found so far: InitItemGFX/FreeItemGFX are EMPTY on PSX (itemanims[]/CEL loading is a PC-only
 * asset path — the PSX item-graphics system uses ItemCAnimTbl/ItemAnimLs instead); random(22,n) -> ENG_random(n).
 */
#include "diabpsx_types.h"
#include "source/gen/structs_items.h"
#include "source/gen/externs_items.h"
#include "source/gen/protos_items.h"
#include "source/diablo.h"

/* ITEMS.H (hellfire) cursor ids for the gold pile graphic */
#define GOLD_VT1 1000
#define GOLD_VT2 2500
#define ITEM_1GOLD 4
#define ITEM_3GOLD 5
#define ITEM_5GOLD 6

#define MAXITEMS 127
#define ISEL_FLR 1
#define BFLAG_SETPC 0x08

#define IT_MISC 0
#define IT_STAFF 10
#define IT_GOLD 11
#define IT_RING 12
#define IT_AMULET 13
#define IT_FOOD 14

#define IMID_PHEAL 2
#define IMID_PLHEAL 3
#define IMID_PMANA 6
#define IMID_PFMANA 7
#define SPL_TOWN 7
#define SPL_HEAL 2
#define SPL_RESURRECT 32
#define SPL_HEALOTHER 34

#define IMID_SCROLL 21
#define IMID_TSCROLL 22
#define IMID_STAFF 23
#define IMID_BOOK 24
#define ICI_SMITH 0x0400
#define ICI_PREMIUM 0x0800
#define ICI_BOY 0x1000
#define ICI_WITCH 0x2000
#define ICI_HEALER 0x4000
#define ICI_LVLMASK 0x003f
#define IMID_ESTR 10
#define IMID_EMAG 11
#define IMID_EDEX 12
#define IMID_EVIT 13
#define IMID_REJUV 18
#define IMID_FREJUV 19
#define INFINITE_DUR 255
#define DMAXX 96
#define DMAXY 96
#define OSEL_NONE 0
#define MAXSPD 8
#define SPT_ABILITY 0
#define SPT_MEMORIZED 1
#define SPT_SCROLL 2
#define SPT_ITEM 3
#define SPT_NONE 4
#define FULLDRAW 0xff
#define NUM_INVLOC 7
#define GLOVE_CURS 1
#define IS_REPAIR 0x42
#define IRND_DOUBLE 2
#define SPL_PHASE 10
#define SPL_TELE 23
#define IDI_GOLD 0
#define T_U 0x8000
#define T_NONE 0x4000
#define T_MASK 0x0fff

#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

/* @0x8003E24C ITEMS.CPP:556 — empty on PSX (PC CEL-loading loop removed) */
void InitItemGFX(void)
{
}

/* @0x80045B70 ITEMS.CPP:3255 — empty on PSX (PC itemanims[] free loop removed) */
void FreeItemGFX(void)
{
}

/* @0x80047D04 ITEMS.CPP:4740 — retail folds the if/else-if chain into an && funnel (§3.12 lever 7) */
unsigned char StoreStatOk(ItemStruct *h)
{
    unsigned char sf;

    sf = plr[myplr]._pStrength >= h->_iMinStr;
    if (plr[myplr]._pMagic < h->_iMinMag) sf = FALSE;
    if (plr[myplr]._pDexterity < h->_iMinDex) sf = FALSE;
    return sf;
}

/* @0x80049608 ITEMS.CPP:4752 — PSX drops the "&& iSpell!=0" qualifier on the IT_STAFF check (the whole
 * oil-selling comment block is compiled out on both platforms) */
unsigned char SmithItemOk(int i)
{
    unsigned char rv;

    rv = AllItemsList[i].itype != IT_MISC;
    if (AllItemsList[i].itype == IT_GOLD) rv = FALSE;
    if (AllItemsList[i].itype == IT_FOOD) rv = FALSE;
    if (AllItemsList[i].itype == IT_STAFF) rv = FALSE;
    if (AllItemsList[i].itype == IT_RING) rv = FALSE;
    if (AllItemsList[i].itype == IT_AMULET) rv = FALSE;
    return rv;
}

/* @0x80049774 ITEMS.CPP:5044 — PSX drops the oil-range check and the gbMaxPlayers==1 SPL_RESURRECT/
 * SPL_HEALOTHER checks (hellfire additions not present in this vanilla-Diablo-era build) */
unsigned char WitchItemOk(int i)
{
    unsigned char rv;

    rv = AllItemsList[i].itype == IT_MISC;
    if (AllItemsList[i].itype == IT_STAFF) rv = TRUE;

    if (AllItemsList[i].iMiscId == IMID_PMANA) rv = FALSE;
    if (AllItemsList[i].iMiscId == IMID_PFMANA) rv = FALSE;

    if (AllItemsList[i].iSpell == SPL_TOWN) rv = FALSE;
    if (AllItemsList[i].iMiscId == IMID_PHEAL) rv = FALSE;
    if (AllItemsList[i].iMiscId == IMID_PLHEAL) rv = FALSE;

    return rv;
}

/* @0x80047D98 ITEMS.CPP:4857 — PSX adds an unconditional IT_STAFF exclusion and gates RING/AMULET on
 * FePlayerNo (front-end player slot) instead of hellfire's gbMaxPlayers!=1 + IMID_OIL check */
unsigned char PremiumItemOk(int i)
{
    unsigned char rv;

    rv = AllItemsList[i].itype != IT_MISC;
    if (AllItemsList[i].itype == IT_GOLD) rv = FALSE;
    if (AllItemsList[i].itype == IT_FOOD) rv = FALSE;
    if (AllItemsList[i].itype == IT_STAFF) rv = FALSE;
    if (FePlayerNo) {
        if (AllItemsList[i].itype == IT_RING) rv = FALSE;
        if (AllItemsList[i].itype == IT_AMULET) rv = FALSE;
    }
    return rv;
}

/* @0x80049D64 ITEMS.CPP:5378 — PSX simplifies hellfire's stat-gated elixirs (no MaxStats[]/plr check, just
 * the iMiscId test) and gates the elixir + resurrect/healother-scroll blocks on FePlayerNo==0 rather than
 * gbMaxPlayers; HEALOTHER also resolves to FALSE here (not TRUE as in hellfire) */
unsigned char HealerItemOk(int i)
{
    unsigned char rv;

    rv = FALSE;
    if (AllItemsList[i].itype != IT_MISC) return FALSE;

    if (AllItemsList[i].iMiscId == IMID_SCROLL && AllItemsList[i].iSpell == SPL_HEAL) rv = TRUE;

    if (AllItemsList[i].iMiscId == IMID_TSCROLL && AllItemsList[i].iSpell == SPL_RESURRECT && FePlayerNo == 0) rv = FALSE;
    if (AllItemsList[i].iMiscId == IMID_TSCROLL && AllItemsList[i].iSpell == SPL_HEALOTHER && FePlayerNo == 0) rv = FALSE;

    if (FePlayerNo == 0) {
        if (AllItemsList[i].iMiscId == IMID_ESTR) rv = TRUE;
        if (AllItemsList[i].iMiscId == IMID_EMAG) rv = TRUE;
        if (AllItemsList[i].iMiscId == IMID_EDEX) rv = TRUE;
        if (AllItemsList[i].iMiscId == IMID_EVIT) rv = TRUE;
    }

    if (AllItemsList[i].iMiscId == IMID_PHEAL) rv = TRUE;
    if (AllItemsList[i].iMiscId == IMID_REJUV) rv = TRUE;
    if (AllItemsList[i].iMiscId == IMID_FREJUV) rv = TRUE;
    if (AllItemsList[i].iMiscId == IMID_PLHEAL) rv = FALSE;
    if (AllItemsList[i].iMiscId == IMID_PHEAL) rv = FALSE;
    if (AllItemsList[i].iMiscId == IMID_PMANA) rv = FALSE;
    if (AllItemsList[i].iMiscId == IMID_PFMANA) rv = FALSE;

    return rv;
}

/* @0x80045FD0 ITEMS.CPP:3601 */
void RechargeItem(ItemStruct *i, int r)
{
    if (i->_iCharges == i->_iMaxCharges) return;

    do {
        i->_iMaxCharges--;
        if (i->_iMaxCharges == 0) {
            return;
        }
        i->_iCharges += r;
    } while (i->_iCharges < i->_iMaxCharges);

    if (i->_iCharges > i->_iMaxCharges) i->_iCharges = i->_iMaxCharges;
}

/* @0x800443F4 ITEMS.CPP:2851 */
void ItemRndDur(int ii)
{
    if (item[ii]._iDurability == 0) return;
    if (item[ii]._iDurability == INFINITE_DUR) return;
    item[ii]._iDurability = ENG_random(item[ii]._iMaxDur >> 1) + (item[ii]._iMaxDur >> 2) + 1;
}

/* @0x80040AC4 ITEMS.CPP:1772 */
void CalcItemValue(int i)
{
    int v = item[i]._iVMult1 + item[i]._iVMult2;
    if (v > 0) v = item[i]._ivalue * v;
    if (v < 0) v = item[i]._ivalue / v;
    v += item[i]._iVAdd1 + item[i]._iVAdd2;
    if (v <= 0) v = 1;
    item[i]._iIvalue = v;
}

/* @0x800409FC ITEMS.CPP:1754 */
void GetSuperItemLoc(int x, int y, int &xx, int &yy)
{
    for (int l = 1; l < 50; l++) {
        for (int j = -l; j <= l; j++) {
            yy = y + j;
            for (int i = -l; i <= l; i++) {
                xx = x + i;
                if (ItemSpaceOk(xx, yy))
                    return;
            }
        }
    }
}

/* @0x8004040C ITEMS.CPP:1616 — PSX replaces the dPlayer[][] read with a call to IsDplayer(i,j) and the
 * final nSolidTable[dPiece] lookup with GetSOLID(i,j) (per GetSOLID/dung_map deltas established elsewhere) */
unsigned char ItemSpaceOk(int i, int j)
{
    int oi;

    if ((unsigned)i >= DMAXX) return FALSE;
    if ((unsigned)j >= DMAXY) return FALSE;
    if (dung_map[i][j].dMonster != 0) return FALSE;
    if (IsDplayer(i, j)) return FALSE;
    if (dung_map[i][j].dItem != 0) return FALSE;
    if (dung_map[i][j].dObject != 0) {
        if (dung_map[i][j].dObject > 0) oi = dung_map[i][j].dObject - 1;
        else oi = -(dung_map[i][j].dObject + 1);
        if (object[oi]._oSolidFlag) return FALSE;
    }
    if (dung_map[i + 1][j + 1].dObject > 0) {
        oi = dung_map[i + 1][j + 1].dObject - 1;
        if (object[oi]._oSelFlag != OSEL_NONE) return FALSE;
    }
    if (dung_map[i + 1][j + 1].dObject < 0) {
        oi = -(dung_map[i + 1][j + 1].dObject + 1);
        if (object[oi]._oSelFlag != OSEL_NONE) return FALSE;
    }
    if ((dung_map[i + 1][j].dObject > 0) && (dung_map[i][j + 1].dObject > 0)) {
        oi = dung_map[i + 1][j].dObject - 1;
        if (object[oi]._oSelFlag != OSEL_NONE) {
            oi = dung_map[i][j + 1].dObject - 1;
            if (object[oi]._oSelFlag != OSEL_NONE) return FALSE;
        }
    }
    return GetSOLID(i, j) == 0;
}

static unsigned char itemhold[3][3];   /* @D_8012ECC8 — hellfire file-scope `BOOL itemhold[3][3]`; this
 * project's BOOL is 1-byte (bool), matching the oracle's byte stores */

/* @0x8004068C ITEMS.CPP:1670 */
unsigned char GetItemSpace(int x, int y, char inum)
{
    int i, j, xx, yy, rs;
    unsigned char savail;

    yy = 0;
    for (j = y - 1; j <= y + 1; j++) {
        xx = 0;
        for (i = x - 1; i <= x + 1; i++) {
            itemhold[xx][yy] = ItemSpaceOk(i, j);
            xx++;
        }
        yy++;
    }

    savail = FALSE;
    for (yy = 0; yy < 3; yy++) {
        for (xx = 0; xx < 3; xx++) {
            if (itemhold[xx][yy]) savail = TRUE;
        }
    }

    rs = ENG_random(15) + 1;

    if (!savail) return FALSE;

    xx = 0;
    yy = 0;
    while (rs > 0) {
        if (itemhold[xx][yy]) rs--;
        if (rs > 0) {
            xx++;
            if (xx == 3) {
                xx = 0;
                yy++;
                if (yy == 3) yy = 0;
            }
        }
    }
    xx = xx + x - 1;
    yy = yy + y - 1;
    item[inum]._ix = xx;
    item[inum]._iy = yy;
    dung_map[xx][yy].dItem = inum + 1;
    return TRUE;
}

/* @0x800408A4 ITEMS.CPP:1725 */
void GetSuperItemSpace(int x, int y, char inum)
{
    int xx, yy;

    if (GetItemSpace(x, y, inum)) return;

    for (int l = 2; l < 50; l++) {
        for (int j = -l; j <= l; j++) {
            yy = y + j;
            for (int i = -l; i <= l; i++) {
                xx = x + i;
                if (!ItemSpaceOk(xx, yy)) continue;

                item[inum]._ix = xx;
                item[inum]._iy = yy;
                dung_map[xx][yy].dItem = inum + 1;
                return;
            }
        }
    }
}

/* @0x8003F754 ITEMS.CPP:1311 */
void CalcPlrItemMin(int pnum)
{
    int i;
    ItemStruct *pi;
    PlayerStruct *p = &plr[pnum];

    pi = &p->InvList[0];
    for (i = p->_pNumInv; i--; pi++)
        pi->_iStatFlag = ItemMinStats(p, pi);

    pi = &p->SpdList[0];
    for (i = MAXSPD; i--; pi++) {
        if (pi->_itype == -1) continue;
        pi->_iStatFlag = ItemMinStats(p, pi);
    }
}

/* @0x8003F130 ITEMS.CPP:1205 */
void CalcPlrScrolls(int p)
{
    int i;
    unsigned long long t;

    plr[p]._pScrlSpells = 0;
    for (i = 0; i < plr[p]._pNumInv; i++) {
        if (plr[p].InvList[i]._itype != -1) {
            if (((plr[p].InvList[i]._iMiscId == IMID_SCROLL) ||
                 (plr[p].InvList[i]._iMiscId == IMID_TSCROLL)) &&
                (plr[p].InvList[i]._iStatFlag)) {
                t = 1;
                plr[p]._pScrlSpells |= (t << (plr[p].InvList[i]._iSpell - 1));
            }
        }
    }
    for (i = 0; i < MAXSPD; i++) {
        if (plr[p].SpdList[i]._itype != -1) {
            if (((plr[p].SpdList[i]._iMiscId == IMID_SCROLL) ||
                 (plr[p].SpdList[i]._iMiscId == IMID_TSCROLL)) &&
                (plr[p].SpdList[i]._iStatFlag)) {
                t = 1;
                plr[p]._pScrlSpells |= (t << (plr[p].SpdList[i]._iSpell - 1));
            }
        }
    }

    if ((plr[p]._pRSplType == SPT_SCROLL) &&
        ((plr[p]._pScrlSpells & (1 << (plr[p]._pRSpell - 1))) == 0)) {
        plr[p]._pRSpell = -1;
        plr[p]._pRSplType = SPT_NONE;
        force_redraw = FULLDRAW;
    }
}

/* @0x8003F4B0 ITEMS.CPP:1243 — PSX adds an else-branch (not in hellfire): if the wielded staff (InvBody[4]
 * = the left-hand slot) has run out of charges AND it was the readied spell (_pRSplType==SPT_ITEM,
 * _pRSpell==the staff's spell), the readied spell is reset (_pRSpell=1, _pRSplType=SPT_NONE) */
void CalcPlrStaff(PlayerStruct *ptrplr)
{
    ptrplr->_pISpells = 0;
    if (ptrplr->InvBody[4]._itype == -1) return;
    if (!ptrplr->InvBody[4]._iStatFlag) return;
    if (ptrplr->InvBody[4]._iCharges > 0) {
        unsigned long long t = 1;
        ptrplr->_pISpells |= t << (ptrplr->InvBody[4]._iSpell - 1);
    } else if (ptrplr->InvBody[4]._iSpell == ptrplr->_pRSpell && ptrplr->_pRSplType == SPT_ITEM) {
        ptrplr->_pRSpell = 1;
        ptrplr->_pRSplType = SPT_NONE;
    }
}

/* @0x8003FB18 ITEMS.CPP:1360 — PSX drops the `p==myplr` guards around CalcPlrBookVals/Scrolls/Staff and
 * around the RecalcStoreStats currlevel check (single local player, presumably gated elsewhere) */
void CalcPlrInv(int p, unsigned char Loadgfx)
{
    CalcPlrItemMin(p);
    CalcSelfItems(p);
    CalcPlrItemVals(p, Loadgfx);
    CalcPlrItemMin(p);
    CalcPlrBookVals(p);
    CalcPlrScrolls(p);
    CalcPlrStaff(&plr[p]);
    if (currlevel == 0) RecalcStoreStats();
}

/* @0x8003F57C ITEMS.CPP:1255 */
void CalcSelfItems(int pnum)
{
    int i;
    ItemStruct *pi;
    PlayerStruct *p = &plr[pnum];
    unsigned char sf, changeflag;
    int sa = 0;
    int ma = 0;
    int da = 0;

    pi = &p->InvBody[0];
    for (i = NUM_INVLOC; i--; pi++) {
        if (pi->_itype == -1) continue;
        pi->_iStatFlag = TRUE;
        if (!pi->_iIdentified) continue;
        sa += pi->_iPLStr;
        ma += pi->_iPLMag;
        da += pi->_iPLDex;
    }

    do {
        changeflag = FALSE;
        pi = &p->InvBody[0];
        for (i = NUM_INVLOC; i--; pi++) {
            if (pi->_itype == -1) continue;
            if (!pi->_iStatFlag) continue;
            sf = TRUE;
            if ((p->_pBaseStr + sa) < pi->_iMinStr) sf = FALSE;
            if ((p->_pBaseMag + ma) < pi->_iMinMag) sf = FALSE;
            if ((p->_pBaseDex + da) < pi->_iMinDex) sf = FALSE;
            if (!sf) {
                changeflag = TRUE;
                pi->_iStatFlag = FALSE;
                if (pi->_iIdentified) {
                    sa -= pi->_iPLStr;
                    ma -= pi->_iPLMag;
                    da -= pi->_iPLDex;
                }
            }
        }
    } while (changeflag);
}

/* @0x800499B0 ITEMS.CPP:4796 */
void BubbleSwapItem(ItemStruct *a, ItemStruct *b)
{
    ItemStruct h;

    h = *a;
    *a = *b;
    *b = h;
}

/* @0x80045E1C ITEMS.CPP:3555 */
void RepairItem(ItemStruct *i, int lvl)
{
    int d, rep;

    if (i->_iDurability == i->_iMaxDur) return;
    if (i->_iMaxDur <= 0) {
        i->_itype = -1;
        return;
    }
    rep = 0;
    do {
        rep += ENG_random(lvl) + lvl;
        d = i->_iMaxDur / (9 + lvl);
        if (d < 1) d = 1;
        i->_iMaxDur -= d;
        if (i->_iMaxDur == 0) {
            i->_itype = -1;
            return;
        }
    } while ((i->_iDurability + rep) < i->_iMaxDur);
    i->_iDurability += rep;
    if (i->_iDurability > i->_iMaxDur)
        i->_iDurability = i->_iMaxDur;
}

/* @0x80045F0C ITEMS.CPP:3583 — PSX drops the `cii<NUM_INVLOC ? InvBody[cii] : InvList[cii-NUM_INVLOC]`
 * selector and always repairs `InvBody[cii]` */
void DoRepair(int pnum, int cii)
{
    PlayerStruct *p = &plr[pnum];
    PlaySfxLoc(IS_REPAIR, p->_px, p->_py);

    ItemStruct *pi;
    pi = &p->InvBody[cii];
    RepairItem(pi, p->_pLevel);
    CalcPlrInv(pnum, TRUE);

    if (pnum == myplr)
        NewCursor(GLOVE_CURS);
}

/* @0x80045D20 ITEMS.CPP:3540 — PSX adds a PlaySfxLoc(0x3D, ...) feedback sound not present in hellfire */
void CheckIdentify(int pnum, int cii)
{
    ItemStruct *pi;

    PlaySfxLoc(0x3D, plr[pnum]._px, plr[pnum]._py);
    if (cii < NUM_INVLOC)
        pi = &plr[pnum].InvBody[cii];
    else
        pi = &plr[pnum].InvList[cii - NUM_INVLOC];
    pi->_iIdentified = TRUE;
    CalcPlrInv(pnum, TRUE);

    if (pnum == myplr)
        NewCursor(GLOVE_CURS);
}

/* @0x8004966C ITEMS.CPP:5461 — PSX drops the `ri < 512` bounds checks (ril[512] sized exactly to fit) */
int RndSmithItem(int lvl)
{
    int ril[512];
    int ri, i;

    ri = 0;
    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iRnd && SmithItemOk(i) && (lvl >= AllItemsList[i].iMinMLvl)) {
            ril[ri++] = i;
            if (AllItemsList[i].iRnd == IRND_DOUBLE) ril[ri++] = i;
        }
    }
    return ril[ENG_random(ri)] + 1;
}

/* @0x80049F18 ITEMS.CPP:5417 — PSX drops the `ri < 512` bounds check */
int RndHealerItem(int lvl)
{
    int ril[512];
    int ri, i;

    ri = 0;
    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iRnd && HealerItemOk(i) && (lvl >= AllItemsList[i].iMinMLvl)) ril[ri++] = i;
    }
    return ril[ENG_random(ri)] + 1;
}

/* @0x80049804 ITEMS.CPP:5075 — PSX rewrite, no hellfire equivalent of this shape: a pre-pass finds the
 * first IMID_PMANA item (network-safe substitute); the main loop swaps SPL_RESURRECT/SPL_HEALOTHER (when
 * FePlayerNo==0, i.e. host) or SPL_PHASE/SPL_TELE (when FePlayerNo!=0, i.e. client) scroll ids for that
 * substitute item so the two sides of a multiplayer game don't roll different randoms for quest-critical
 * scrolls */
int RndWitchItem(int lvl)
{
    int ril[512];
    int ri, i, manaItem;

    manaItem = -1;
    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iMiscId == IMID_PMANA && manaItem == -1) manaItem = i;
    }

    ri = 0;
    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iRnd && WitchItemOk(i) && (lvl >= AllItemsList[i].iMinMLvl)) {
            int val = i;
            if (FePlayerNo == 0) {
                if (AllItemsList[i].iSpell == SPL_RESURRECT || AllItemsList[i].iSpell == SPL_HEALOTHER) val = manaItem;
            } else {
                if (AllItemsList[i].iSpell == SPL_PHASE || AllItemsList[i].iSpell == SPL_TELE) val = manaItem;
            }
            ril[ri++] = val;
        }
    }
    return ril[ENG_random(ri)] + 1;
}

/* @0x80049C48 ITEMS.CPP:5215 — PSX adds `if (lvl==0) lvl=1;` and a DBG_Error assert when no candidate
 * was found (ri==0) before indexing ril[] */
int RndBoyItem(int lvl)
{
    int ril[512];
    int ri, i;

    if (lvl == 0) lvl = 1;

    ri = 0;
    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iRnd && PremiumItemOk(i) && (lvl >= AllItemsList[i].iMinMLvl)) ril[ri++] = i;
    }
    if (ri == 0) DBG_Error(NULL, "source/ITEMS.cpp", 0x160B);
    return ril[ENG_random(ri)] + 1;
}

/* @0x80047E14 ITEMS.CPP:4876 */
int RndPremiumItem(int minlvl, int maxlvl)
{
    int ril[512];
    int ri, i;

    ri = 0;
    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iRnd && PremiumItemOk(i) &&
            (AllItemsList[i].iMinMLvl >= minlvl) &&
            (AllItemsList[i].iMinMLvl <= maxlvl)) {
            ril[ri++] = i;
        }
    }
    return ril[ENG_random(ri)] + 1;
}

/* @0x80043ADC ITEMS.CPP:2706 — PSX inlines GetEffLevel() as plain `currlevel` (no call) and, instead of
 * substituting an item id like RndWitchItem, decrements `ri` (drops a just-added candidate) for
 * SPL_RESURRECT/SPL_HEALOTHER when FePlayerNo==0 (host) and SPL_TELE/SPL_PHASE when FePlayerNo!=0 (client)
 * — the same network-safety scroll exclusion, applied per-candidate instead of per-substitution */
int RndAllItems(void)
{
    int ril[512];
    int ri, i;

    if (ENG_random(100) >= 26) return IDI_GOLD;

    ri = 0;
    for (i = 0; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iRnd && ((currlevel << 1) >= AllItemsList[i].iMinMLvl)) ril[ri++] = i;
        if (AllItemsList[i].iSpell == SPL_RESURRECT && FePlayerNo == 0) ri--;
        if (AllItemsList[i].iSpell == SPL_HEALOTHER && FePlayerNo == 0) ri--;
        if (AllItemsList[i].iSpell == SPL_TELE && FePlayerNo != 0) ri--;
        if (AllItemsList[i].iSpell == SPL_PHASE && FePlayerNo != 0) ri--;
    }
    return ril[ENG_random(ri)];
}

/* @0x80043660 ITEMS.CPP:2626 — PSX drops the CHEATS block entirely; the SPL_RESURRECT/HEALOTHER
 * (FePlayerNo==0) / SPL_TELE/SPL_PHASE (FePlayerNo!=0) network-safety decrements are the same as
 * RndAllItems/RndWitchItem */
int RndItem(int m)
{
    int ril[512];
    int ri, i;

    if (monster[m].MData->mTreasure & T_U)
        return -((monster[m].MData->mTreasure & T_MASK) + 1);
    if (monster[m].MData->mTreasure & T_NONE) return 0;

    if (ENG_random(100) > 40) return 0;
    if (ENG_random(100) > 25) return IDI_GOLD + 1;

    ri = 0;
    for (i = 0; AllItemsList[i].iLoc != -1; i++) {
        if ((AllItemsList[i].iRnd == IRND_DOUBLE) && (monster[m].mLevel >= AllItemsList[i].iMinMLvl)) ril[ri++] = i;
        if (AllItemsList[i].iRnd && (monster[m].mLevel >= AllItemsList[i].iMinMLvl)) ril[ri++] = i;
        if (AllItemsList[i].iSpell == SPL_RESURRECT && FePlayerNo == 0) ri--;
        if (AllItemsList[i].iSpell == SPL_HEALOTHER && FePlayerNo == 0) ri--;
        if (AllItemsList[i].iSpell == SPL_TELE && FePlayerNo != 0) ri--;
        if (AllItemsList[i].iSpell == SPL_PHASE && FePlayerNo != 0) ri--;
    }
    return ril[ENG_random(ri)] + 1;
}

/* @0x80043C40 ITEMS.CPP:2735 — PSX drops the `level` param (uses `currlevel` directly like RndAllItems)
 * and adds a client-only (FePlayerNo!=0) exclusion: for scroll/staff/book-category queries (imid in
 * {IMID_SCROLL,IMID_TSCROLL,IMID_STAFF,IMID_BOOK}) whose iMiscId matches, drop items whose spell is
 * SPL_TELE/SPL_PHASE (same network-safety family as RndItem/RndAllItems/RndWitchItem) */
int RndTypeItems(int itype, int imid)
{
    int ril[512];
    int ri, i;

    ri = 0;
    for (i = 0; AllItemsList[i].iLoc != -1; i++) {
        unsigned char okflag = AllItemsList[i].iRnd != 0;
        if ((currlevel << 1) < AllItemsList[i].iMinMLvl) okflag = FALSE;
        if (AllItemsList[i].itype != itype) okflag = FALSE;
        if ((imid != -1) && (AllItemsList[i].iMiscId != imid)) okflag = FALSE;

        if (FePlayerNo != 0) {
            if (imid == IMID_SCROLL || imid == IMID_BOOK || (unsigned)(imid - IMID_TSCROLL) < 2) {
                if (AllItemsList[i].iMiscId == imid) {
                    if (AllItemsList[i].iSpell == SPL_TELE || AllItemsList[i].iSpell == SPL_PHASE) okflag = FALSE;
                }
            }
        }

        if (okflag) ril[ri++] = i;
    }
    return ril[ENG_random(ri)];
}

/* @0x8004B700 ITEMS.CPP:4808 — PSX uses the per-player `_smithitem[StorePlrNo]` array in place of
 * hellfire's flat `smithitem` global */
void SortSmith(void)
{
    int j, k;
    unsigned char sorted;

    for (k = 0; _smithitem[StorePlrNo][k + 1]._itype != -1; k++)
        ;
    sorted = FALSE;
    while ((k > 0) && (!sorted)) {
        sorted = TRUE;
        for (j = 0; j < k; j++) {
            if (_smithitem[StorePlrNo][j].IDidx > _smithitem[StorePlrNo][j + 1].IDidx) {
                BubbleSwapItem(&_smithitem[StorePlrNo][j], &_smithitem[StorePlrNo][j + 1]);
                sorted = FALSE;
            }
        }
        k--;
    }
}

/* @0x80049AB8 ITEMS.CPP:5095 — `_witchitem[StorePlrNo]` in place of hellfire's flat `witchitem` */
void SortWitch(void)
{
    int j, k;
    unsigned char sorted;

    for (k = 3; _witchitem[StorePlrNo][k + 1]._itype != -1; k++)
        ;
    sorted = FALSE;
    while ((k > 3) && (!sorted)) {
        sorted = TRUE;
        for (j = 3; j < k; j++) {
            if (_witchitem[StorePlrNo][j].IDidx > _witchitem[StorePlrNo][j + 1].IDidx) {
                BubbleSwapItem(&_witchitem[StorePlrNo][j], &_witchitem[StorePlrNo][j + 1]);
                sorted = FALSE;
            }
        }
        k--;
    }
}

/* @0x8004B884 ITEMS.CPP:5434 — `_healitem[StorePlrNo]` in place of hellfire's flat `healitem` */
void SortHealer(void)
{
    int j, k;
    unsigned char sorted;

    for (k = 2; _healitem[StorePlrNo][k + 1]._itype != -1; k++)
        ;
    sorted = FALSE;
    while ((k > 2) && (!sorted)) {
        sorted = TRUE;
        for (j = 2; j < k; j++) {
            if (_healitem[StorePlrNo][j].IDidx > _healitem[StorePlrNo][j + 1].IDidx) {
                BubbleSwapItem(&_healitem[StorePlrNo][j], &_healitem[StorePlrNo][j + 1]);
                sorted = FALSE;
            }
        }
        k--;
    }
}

/* @0x80043894 ITEMS.CPP:2669 — PSX drops the GetEffLevel() call (uses `currlevel` directly) and gates
 * SPL_RESURRECT/HEALOTHER on FePlayerNo==0, SPL_TELE/PHASE on FePlayerNo!=0 (same family as RndItem) */
int RndUItem(int m)
{
    int ril[512];
    int ri, i;

    if (m != -1) {
        if ((monster[m].MData->mTreasure & T_U) && (gbMaxPlayers == 1))
            return -((monster[m].MData->mTreasure & T_MASK) + 1);
    }

    ri = 0;
    for (i = 0; AllItemsList[i].iLoc != -1; i++) {
        unsigned char okflag = AllItemsList[i].iRnd != 0;
        if (m != -1) {
            if (monster[m].mLevel < AllItemsList[i].iMinMLvl) okflag = FALSE;
        } else {
            if ((currlevel << 1) < AllItemsList[i].iMinMLvl) okflag = FALSE;
        }
        if (AllItemsList[i].itype == IT_MISC) okflag = FALSE;
        if (AllItemsList[i].itype == IT_GOLD) okflag = FALSE;
        if (AllItemsList[i].itype == IT_FOOD) okflag = FALSE;
        if (AllItemsList[i].iMiscId == IMID_BOOK) okflag = TRUE;
        if (AllItemsList[i].iSpell == SPL_RESURRECT && FePlayerNo == 0) okflag = FALSE;
        if (AllItemsList[i].iSpell == SPL_HEALOTHER && FePlayerNo == 0) okflag = FALSE;
        if (AllItemsList[i].iSpell == SPL_TELE && FePlayerNo != 0) okflag = FALSE;
        if (AllItemsList[i].iSpell == SPL_PHASE && FePlayerNo != 0) okflag = FALSE;
        if (okflag) ril[ri++] = i;
    }
    return ril[ENG_random(ri)];
}

/* @0x8004A258 ITEMS.CPP:5507 — PSX adds `item[ii]._PlrCreate = FePlayerNo` (network item-ownership tag,
 * not in hellfire) */
void RecreateSmithItem(int ii, int idx, int lvl, int iseed)
{
    SetRndSeed(iseed);
    int itype = RndSmithItem(lvl) - 1;
    GetItemAttrs(ii, itype, lvl);
    item[ii]._iSeed = iseed;
    item[ii]._iCreateInfo = lvl | ICI_SMITH;
    item[ii]._iIdentified = TRUE;
    item[ii]._PlrCreate = FePlayerNo;
}

/* @0x8004A308 ITEMS.CPP:5581 — idx values are IDI_HEAL(0x18)/IDI_FULLHEAL(0x1D)/IDI_RESURRECT(0x22);
 * PSX adds `item[ii]._PlrCreate = FePlayerNo` (see RecreateSmithItem) */
void RecreateHealerItem(int ii, int idx, int lvl, int iseed)
{
    if ((idx == 0x18) || (idx == 0x1D) || (idx == 0x22)) {
        GetItemAttrs(ii, idx, lvl);
    } else {
        SetRndSeed(iseed);
        int itype = RndHealerItem(lvl) - 1;
        GetItemAttrs(ii, itype, lvl);
    }
    item[ii]._iSeed = iseed;
    item[ii]._iCreateInfo = lvl | ICI_HEALER;
    item[ii]._iIdentified = TRUE;
    item[ii]._PlrCreate = FePlayerNo;
}

/* @0x8004A3DC ITEMS.CPP:5534 — PSX's GetItemBonus has no hellfire SpellsOk 6th param; adds
 * `item[ii]._PlrCreate = FePlayerNo` (see RecreateSmithItem) */
void RecreateBoyItem(int ii, int idx, int lvl, int iseed)
{
    SetRndSeed(iseed);
    int itype = RndBoyItem(lvl) - 1;
    GetItemAttrs(ii, itype, lvl);
    GetItemBonus(ii, itype, lvl, lvl << 1, TRUE);
    item[ii]._iSeed = iseed;
    item[ii]._iCreateInfo = lvl | ICI_BOY;
    item[ii]._iIdentified = TRUE;
    item[ii]._PlrCreate = FePlayerNo;
}

/* @0x8004A014 ITEMS.CPP:5520 */
void RecreatePremiumItem(int ii, int idx, int plvl, int iseed)
{
    SetRndSeed(iseed);
    int itype = RndPremiumItem(plvl >> 2, plvl) - 1;
    GetItemAttrs(ii, itype, plvl);
    GetItemBonus(ii, itype, plvl >> 1, plvl, TRUE);
    item[ii]._iSeed = iseed;
    item[ii]._iCreateInfo = plvl | ICI_PREMIUM;
    item[ii]._iIdentified = TRUE;
    item[ii]._PlrCreate = FePlayerNo;
}

/* @0x8004A0F0 ITEMS.CPP:5549 — PSX drops the hellfire "book range" (IDI_FIRST_BOOK..IDI_LAST_BOOK) special
 * case and the CHEATS block; idx values are IDI_MANA(0x19)/IDI_FULLMANA(0x1E)/IDI_PORTAL(0x1B) */
void RecreateWitchItem(int ii, int idx, int lvl, int iseed)
{
    if ((idx == 0x19) || (idx == 0x1E) || (idx == 0x1B)) {
        GetItemAttrs(ii, idx, lvl);
    } else {
        SetRndSeed(iseed);
        int itype = RndWitchItem(lvl) - 1;
        GetItemAttrs(ii, itype, lvl);
        int iblvl = -1;
        if (ENG_random(100) < 6) iblvl = lvl << 1;
        if ((iblvl == -1) && (item[ii]._iMiscId == IMID_STAFF)) iblvl = lvl << 1;
        if (iblvl != -1) GetItemBonus(ii, itype, iblvl >> 1, iblvl, TRUE);
    }
    item[ii]._iSeed = iseed;
    item[ii]._iCreateInfo = lvl | ICI_WITCH;
    item[ii]._iIdentified = TRUE;
    item[ii]._PlrCreate = FePlayerNo;
}

/* @0x8004A4B4 ITEMS.CPP:5599 — PSX checks ICI_PREMIUM/BOY/WITCH/HEALER/SMITH in that order (hellfire
 * checks SMITH first); `ivalue` (5th param) is unused here */
void RecreateTownItem(int ii, int idx, unsigned short icreateinfo, int iseed, int ivalue)
{
    if (icreateinfo & ICI_PREMIUM) RecreatePremiumItem(ii, idx, icreateinfo & ICI_LVLMASK, iseed);
    else if (icreateinfo & ICI_BOY) RecreateBoyItem(ii, idx, icreateinfo & ICI_LVLMASK, iseed);
    else if (icreateinfo & ICI_WITCH) RecreateWitchItem(ii, idx, icreateinfo & ICI_LVLMASK, iseed);
    else if (icreateinfo & ICI_HEALER) RecreateHealerItem(ii, idx, icreateinfo & ICI_LVLMASK, iseed);
    else if (icreateinfo & ICI_SMITH) RecreateSmithItem(ii, idx, icreateinfo & ICI_LVLMASK, iseed);
}

/* @0x80048788 ITEMS.CPP:5496 */
void SpawnStoreGold(void)
{
    GetItemAttrs(0, 0, 1);
    _golditem[StorePlrNo] = item[0];
    _golditem[StorePlrNo]._iStatFlag = TRUE;
}

/* @0x80048858 ITEMS.CPP:5728 — PSX's per-player arrays are sized smaller than hellfire's MAXSMITHITEMS/
 * MAXPREMIUM/etc (20/6/20/20 here, matching the declared array sizes) */
void RecalcStoreStats(void)
{
    int i;

    for (i = 0; i < 20; i++)
        if (_smithitem[StorePlrNo][i]._itype != -1) _smithitem[StorePlrNo][i]._iStatFlag = StoreStatOk(&_smithitem[StorePlrNo][i]);
    for (i = 0; i < 6; i++)
        if (_premiumitem[StorePlrNo][i]._itype != -1) _premiumitem[StorePlrNo][i]._iStatFlag = StoreStatOk(&_premiumitem[StorePlrNo][i]);
    for (i = 0; i < 20; i++)
        if (_witchitem[StorePlrNo][i]._itype != -1) _witchitem[StorePlrNo][i]._iStatFlag = StoreStatOk(&_witchitem[StorePlrNo][i]);
    for (i = 0; i < 20; i++)
        if (_healitem[StorePlrNo][i]._itype != -1) _healitem[StorePlrNo][i]._iStatFlag = StoreStatOk(&_healitem[StorePlrNo][i]);
    _boyitem[StorePlrNo]._iStatFlag = StoreStatOk(&_boyitem[StorePlrNo]);
}

/* @0x8003F6DC ITEMS.CPP:1050 */
unsigned char ItemMinStats(const PlayerStruct *p, const ItemStruct *x)
{
    if (p->_pMagic < x->_iMinMag) return FALSE;
    if (p->_pStrength < x->_iMinStr) return FALSE;
    if (p->_pDexterity < x->_iMinDex) return FALSE;
    return TRUE;
}

/* @0x8003F728 ITEMS.CPP:1058 */
void SetItemMinStats(const PlayerStruct *p, ItemStruct *x)
{
    x->_iStatFlag = ItemMinStats(p, x);
}

/* @0x8003FCE0 ITEMS.CPP:1408 */
void GetPlrHandSeed(ItemStruct *h)
{
    h->_iSeed = GetRndSeed();
}

/* @0x8003FE74 ITEMS.CPP:1437 */
void SetPlrHandSeed(ItemStruct *h, int iseed)
{
    h->_iSeed = iseed;
}

/* @0x8003FE7C ITEMS.CPP:1444 */
void SetPlrHandGoldCurs(ItemStruct *h)
{
    if (h->_ivalue >= GOLD_VT2) {
        h->_iCurs = ITEM_5GOLD;
    } else {
        if (h->_ivalue <= GOLD_VT1) h->_iCurs = ITEM_1GOLD;
        else h->_iCurs = ITEM_3GOLD;
    }
}

/* @0x8004180C ITEMS.CPP:2069 */
int RndPL(int param1, int param2)
{
    return ENG_random(param2 - param1 + 1) + param1;
}

/* @0x80041840 ITEMS.CPP:2077 */
int PLVal(int pv, int p1, int p2, int minv, int maxv)
{
    if (p1 == p2) return minv;
    if (minv == maxv) return minv;
    return (((pv - p1) * 100) / (p2 - p1)) * (maxv - minv) / 100 + minv;
}

/* @0x800457B8 ITEMS.CPP:3426 */
void DeleteItem(int ii, int i)
{
    itemavail[MAXITEMS - numitems] = ii;
    numitems--;
    if ((numitems > 0) && (i != numitems)) {
        itemactive[i] = itemactive[numitems];
    }
}

/* @0x8003E254 ITEMS.CPP:578 — PSX order: dMonster, dItem, dObject, dFlags&SETPC, !GetSOLID (no dPlayer field
 * in dung_map; nSolidTable[dPiece] -> GetSOLID(x,y)) */
unsigned char ItemPlace(int xp, int yp)
{
    if (dung_map[xp][yp].dMonster != 0) return FALSE;
    if (dung_map[xp][yp].dItem != 0) return FALSE;
    if (dung_map[xp][yp].dObject != 0) return FALSE;
    if (dung_map[xp][yp].dFlags & BFLAG_SETPC) return FALSE;
    if (GetSOLID(xp, yp)) return FALSE;
    return TRUE;
}

/* @0x80048B3C ITEMS.CPP:5746 */
int ItemNoFlippy(void)
{
    int r;

    r = itemactive[numitems - 1];
    item[r]._iAnimFrame = item[r]._iAnimLen;
    item[r]._iAnimFlag = FALSE;
    item[r]._iSelFlag = ISEL_FLR;

    return r;
}
