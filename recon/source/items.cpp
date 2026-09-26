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
