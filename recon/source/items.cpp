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

extern "C" unsigned char GAL_Free(long Handle);

struct TextDat {
    BOOL OwnDat;
    int TexNum;
    int LastFrame;
    BOOL DatLoaded;
    long hndDat;
    unsigned char rest[112 - 20];

    void DumpDatFile();
};

inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd))
            DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

class CPlayer;
class CPlayer : public TextDat {
public:
    static CPlayer *PActiveArray[2];   /* _7CPlayer.PActiveArray @0x8011AD50, defined by cplayer.cpp */
    unsigned char player_data[144 - 112];

    static CPlayer *GetPlayer(int PNum)
    {
        if (1 < (unsigned int)PNum)
            DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
        return PActiveArray[PNum];
    }
};

/* File-local functions: retail SYM gives these class STAT (static); no other TU calls them. */
static unsigned char ItemMinStats(const PlayerStruct *p, const ItemStruct *x);   /* @0x8003F6DC ITEMS.CPP:1050 */
static void RechargeItem(ItemStruct *i, int r);   /* @0x80045FD0 ITEMS.CPP:3374 */
static void RepairItem(ItemStruct *i, int lvl);   /* @0x80045E1C ITEMS.CPP:3328 */
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

#define IMID_NONE 0
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
#define ICI_ONLYGOOD 0x0040
#define ICI_UPER15 0x0080
#define ICI_UPER1 0x0100
#define ICI_USEFUL 0x0180
#define ICI_UNIQUE 0x0200
#define ICI_PREGEN 0x8000
#define ICI_TOWNMASK 0x7c00
#define IMID_RING 25
#define IMID_AMULET 26
#define IMID_UNIQUE 27
#define IMAGIC_UNIQUE 2
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

/* Retail .bss order (ASPSX rounds each `.lcomm` to 8 bytes): curruitem @0x8012EC58, itemhold @0x8012ECC8,
 * itemactivelist @0x8012ECD8; the statics are emitted in declaration order. */
static ItemStruct curruitem;
static unsigned char itemhold[3][3];   /* @D_8012ECC8 — hellfire file-scope `BOOL itemhold[3][3]`; this
 * project's BOOL is 1-byte (bool), matching the oracle's byte stores */
#define ISEL_NONE 0
#define MAXUITEMS 128
#define IT_SWORD 1
#define IT_AXE 2
#define IT_BOW 3
#define IT_MACE 4
#define IT_SHIELD 5
#define IT_LARMOR 6
#define IT_HELM 7
#define IT_MARMOR 8
#define IT_HARMOR 9
#define IC_GOLD 4
#define PLF_BOW 0x10
#define PLF_WEAPON 0x1000
#define PLF_SHIELD 0x10000
#define PLF_ARMOR 0x100000
#define PLF_RING 0x1
#define IMAGIC_NONE 0
#define ISEL_TOP 2
#define infostr _infostr[sel_data]
#define infoclr _infoclr[sel_data]
#define golditem _golditem[StorePlrNo]
#define ITEM_ROCK 0x4C
#define ITEM_INNSIGN 0x7E
#define ITEM_ANVIL 0x8C
#define IDI_HEAL 0x18
#define IDI_MANA 0x19
#define witchitem _witchitem[StorePlrNo]
#define PLF_STAFF 0x100
#define SPL_FIREBOLT 1
#define SPL_LAST 37
#define Q_BKMUSHRM Q_MUSHROOM
#define QS_BRAINSPAWNED 6
#define ITEM_BOOK2 0x56
#define ITEM_BOOK3 0x57
#define ITEM_BOOK 0x58
#define IMID_MAPOFDOOM 0x2A
#define IMID_EAR 0x2B
#define DTYPE_TOWN 0
#define RSPLTYPE_SCROLL 2
static char itemactivelist[127];
#define premiumitem _premiumitem[StorePlrNo]
#define numpremium _numpremium[StorePlrNo]
#define premiumlevel _premiumlevel[StorePlrNo]
#define MAXPREMIUM 6
#define smithitem _smithitem[StorePlrNo]
#define boyitem _boyitem[StorePlrNo]
#define boylevel _boylevel[StorePlrNo]
#define MAXSMITHITEMS 20
#define MAXWITCHITEMS 20
#define IDI_FULLMANA 0x1E
#define IDI_PORTAL 0x1B
#define healitem _healitem[StorePlrNo]
#define MAXHEALITEMS 20
#define IDI_FULLHEAL 0x1D
#define IDI_RESURRECT 0x22
#define IC_WEAP 1
#define IC_ARMOR 2
#define pinfoflag _pinfoflag[sel_data]
#define PL_CHRG 15
#define MAXINV 40
#define INVLOC_HAND_LEFT 4
#define INVLOC_HAND_RIGHT 5
#define Hand1Item InvBody[INVLOC_HAND_LEFT]
#define Hand2Item InvBody[INVLOC_HAND_RIGHT]
#define IDI_WARRIOR 1
#define IDI_WARRSHLD 2
#define IDI_WARRCLUB 3
#define IDI_ROGUE 4
#define IDI_SORCEROR 5
#define IMID_FULLHEAL 2
#define IMID_HEAL 3
#define IMID_MANA 6
#define IMID_FULLMANA 7
#define IMID_MEAT 28
#define IMID_SPECTRAL 44
#define IAF_LMANA 0x8000000
#define SPELLCAP 15
#define SPL_FROMSB 3
#define INVLOC_CHEST 6
#define MAXRESIST 75
#define MIS_MANASHIELD 13

unsigned char ItemCAnimTbl[169] = {
    20,16,16,16,4,4,4,12,12,12,12,12,12,12,12,21,
    21,25,12,28,28,28,0,0,0,32,0,0,0,24,24,26,
    2,25,22,23,24,25,27,27,29,0,0,0,12,12,12,12,
    12,0,8,8,0,8,8,8,8,8,8,6,8,8,8,6,
    8,8,6,8,8,6,6,6,8,8,8,5,9,13,13,13,
    5,5,5,15,5,5,18,18,18,30,5,5,14,5,14,13,
    16,18,5,5,7,1,3,17,1,15,10,14,3,11,8,0,
    1,7,0,7,15,7,3,3,3,6,6,11,11,11,31,14,
    14,14,6,6,7,3,8,14,0,14,14,0,33,1,1,1,
    1,1,7,7,7,14,14,17,17,17,0,34,1,0,3,17,
    8,8,6,1,3,3,11,3,4
};
unsigned char ItemAnimLs[35] = {
    15,13,16,13,10,13,13,13,13,10,13,13,13,13,13,13,
    13,13,13,1,16,16,16,16,16,16,16,16,13,12,12,13,13,13,8
};
int ItemInvSnds[35] = {
    32,25,35,29,22,30,42,39,42,37,25,41,36,30,33,39,38,32,
    28,32,35,35,35,35,35,35,35,35,27,27,34,40,26,24,41
};
int premiumlvladd[6] = { -1, -1, 0, 0, 1, 2 };
ItemStruct item[128] = { 0 };
char itemactive[127] = { 0 };
char itemavail[127] = { 0 };
unsigned char UniqueItemFlag[128] = { 0 };
char OutStr[128] = { 0 };

static const short Item2Frm[35] = {
    219,220,236,224,259,260,266,304,308,298,225,307,283,226,263,311,
    300,254,233,252,237,241,241,239,238,240,242,237,244,235,251,261,222,232,250
};

long numitems = 0;                 /* @0x8011B888 */
int gnNumGetRecords = 0;           /* @0x8011B88C */
int *ItemAnimSnds = ItemInvSnds;   /* @0x8011B890 */
int idoppely = 16;                 /* @0x8011B894 */

void InitItemGFX(void)
{
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


/* @0x8003E2F0 ITEMS.CPP:588 — PSX: currlevel instead of GetEffLevel, single do/while placement loop,
 * _PlrCreate = FePlayerNo */
void AddInitItems(void)
{
    int j = ENG_random(3) + 3;
    for (int i = 0; i < j; i++) {
        int ii = itemavail[0];
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;

        int xx = ENG_random(DMAXX - 32) + 16;
        int yy = ENG_random(DMAXY - 32) + 16;
        while (!ItemPlace(xx, yy)) {
            xx = ENG_random(DMAXX - 32) + 16;
            yy = ENG_random(DMAXY - 32) + 16;
        }

        item[ii]._ix = xx;
        item[ii]._iy = yy;
        dung_map[xx][yy].dItem = ii + 1;
        item[ii]._iSeed = GetRndSeed();
        SetRndSeed(item[ii]._iSeed);
        if (ENG_random(2)) GetItemAttrs(ii, IDI_HEAL, currlevel);
        else GetItemAttrs(ii, IDI_MANA, currlevel);
        item[ii]._iCreateInfo = currlevel + ICI_PREGEN;
        item[ii]._PlrCreate = FePlayerNo;
        SetupItem(ii);
        item[ii]._iAnimFrame = item[ii]._iAnimLen;
        item[ii]._iAnimFlag = FALSE;
        item[ii]._iSelFlag = ISEL_FLR;
        DeltaAddItem(ii);
        numitems++;
    }
}


/* @0x8003E4F8 ITEMS.CPP:641 — PSX: per-player golditem, _PlrCreate = FePlayerNo in the clear loop, no
 * quest spawns here (only AddInitItems) */
void InitItems(bool re_init)
{
    int i;

    GetItemAttrs(0, 0, 1);
    golditem = item[0];
    golditem._iStatFlag = TRUE;

    numitems = 0;
    for (i = 0; i < MAXITEMS; i++) {
        item[i]._itype = 0;
        item[i]._ix = 0;
        item[i]._iy = 0;
        item[i]._iAnimFlag = FALSE;
        item[i]._iSelFlag = ISEL_NONE;
        item[i]._iIdentified = FALSE;
        item[i]._iPostDraw = FALSE;
        item[i]._PlrCreate = FePlayerNo;
    }

    for (i = 0; i < MAXITEMS; i++) {
        itemavail[i] = i;
        itemactive[i] = 0;
    }

    if (!setlevel) {
        if (currlevel > 0 && currlevel < 16)
            AddInitItems();
    }

    uitemflag = FALSE;
}


/* @0x8003E6B0 ITEMS.CPP:684 — hellfire's loop (continue form) through a cached ptrplr, Diablo 1.09 class
 * set; PSX: lrad starts at 6, light radius passed as lrad + 9200, no p == myplr gates, spell check shifts
 * the spell mask down, no LoadPlrGFX/anim-data, weapon anim ids in PSX case order, sets both redraw flags */
void CalcPlrItemVals(int p, unsigned char Loadgfx)
{
    int mind, maxd, tac, g, i, mi;
    int bdam, btohit, bac;
    int sadd, madd, dadd, vadd;
    int fr, lr, mr;
    int dmod, ghit, lrad;
    int ihp, imana;
    int spllvladd;
    int enac;
    int fmin, fmax, lmin, lmax;
    long iflgs;
    unsigned long long spl, t;
    PlayerStruct *ptrplr;

    mind = 0;
    maxd = 0;
    tac = 0;
    bdam = 0;
    btohit = 0;
    bac = 0;
    iflgs = 0;
    sadd = 0;
    madd = 0;
    dadd = 0;
    vadd = 0;
    spl = 0;
    fr = 0;
    lr = 0;
    mr = 0;
    dmod = 0;
    ghit = 0;
    lrad = 6;
    ihp = 0;
    imana = 0;
    spllvladd = 0;
    enac = 0;
    fmin = 0;
    fmax = 0;
    lmin = 0;
    lmax = 0;
    ptrplr = &plr[p];
    for (i = 0; i < 7; i++) {
        const ItemStruct *itm = &ptrplr->InvBody[i];
        if (itm->_itype == -1) continue;
        if (!itm->_iStatFlag) continue;

        mind += itm->_iMinDam;
        maxd += itm->_iMaxDam;
        tac += itm->_iAC;

        t = 1;
        if (itm->_iSpell != 0)
            spl |= t << (itm->_iSpell - 1);

        if (itm->_iMagical != IMAGIC_NONE && !itm->_iIdentified)
            continue;

        bdam += itm->_iPLDam;
        btohit += itm->_iPLToHit;

        if (itm->_iPLAC) {
            int tmpac = (itm->_iAC * itm->_iPLAC) / 100;
            if (tmpac == 0) tmpac = 1;
            bac += tmpac;
        }

        iflgs |= itm->_iFlags;
        sadd += itm->_iPLStr;
        madd += itm->_iPLMag;
        dadd += itm->_iPLDex;
        vadd += itm->_iPLVit;
        fr += itm->_iPLFR;
        lr += itm->_iPLLR;
        mr += itm->_iPLMR;
        dmod += itm->_iPLDamMod;
        ghit += itm->_iPLGetHit;
        lrad += itm->_iPLLight;
        ihp += itm->_iPLHP;
        imana += itm->_iPLMana;
        spllvladd += itm->_iSplLvlAdd;
        enac += itm->_iPLEnAc;
        fmin += itm->_iFMinDam;
        fmax += itm->_iFMaxDam;
        lmin += itm->_iLMinDam;
        lmax += itm->_iLMaxDam;
    }

    if (mind == 0 && maxd == 0) {
        mind = 1;
        maxd = 1;
        if ((ptrplr->Hand1Item._itype == IT_SHIELD) && (ptrplr->Hand1Item._iStatFlag))
            maxd = 3;
        if ((ptrplr->Hand2Item._itype == IT_SHIELD) && (ptrplr->Hand2Item._iStatFlag))
            maxd = 3;
    }

    ptrplr->_pIMinDam = mind;
    ptrplr->_pIMaxDam = maxd;
    ptrplr->_pIAC = tac;
    ptrplr->_pIBonusDam = bdam;
    ptrplr->_pIBonusToHit = btohit;
    ptrplr->_pIBonusAC = bac;
    ptrplr->_pIFlags = iflgs;
    ptrplr->_pIBonusDamMod = dmod;
    ptrplr->_pIGetHit = ghit;
    if (lrad < 2) lrad = 2;
    if (lrad > 15) lrad = 15;
    if (ptrplr->_pLightRad != lrad) {
        ChangeLightRadius(ptrplr->_plid, lrad + 9200);
        if (lrad < 10) ChangeVisionRadius(ptrplr->_pvid, 10);
        else ChangeVisionRadius(ptrplr->_pvid, lrad);
        ptrplr->_pLightRad = lrad;
    }

    ptrplr->_pStrength = ptrplr->_pBaseStr + sadd;
    if (plr[myplr]._pStrength <= 0) plr[myplr]._pStrength = 0;
    ptrplr->_pMagic = ptrplr->_pBaseMag + madd;
    if (plr[myplr]._pMagic <= 0) plr[myplr]._pMagic = 0;
    ptrplr->_pDexterity = ptrplr->_pBaseDex + dadd;
    if (plr[myplr]._pDexterity <= 0) plr[myplr]._pDexterity = 0;
    ptrplr->_pVitality = ptrplr->_pBaseVit + vadd;
    if (plr[myplr]._pVitality <= 0) plr[myplr]._pVitality = 0;

    if (ptrplr->_pClass == PC_ROGUE)
        ptrplr->_pDamageMod = ((ptrplr->_pStrength + ptrplr->_pDexterity) * ptrplr->_pLevel) / 200;
    else
        ptrplr->_pDamageMod = (ptrplr->_pStrength * ptrplr->_pLevel) / 100;

    ptrplr->_pISpells = spl;
    if ((ptrplr->_pRSplType == SPT_ITEM)
        && (((ptrplr->_pISpells >> (ptrplr->_pRSpell - 1)) & 1) == 0)) {
        ptrplr->_pRSpell = -1;
        ptrplr->_pRSplType = SPT_NONE;
        force_redraw = FULLDRAW;
    }
    ptrplr->_pISplLvlAdd = spllvladd;

    ptrplr->_pIEnAc = enac;

    if (iflgs & 0x80000000) {
        mr = 0;
        fr = 0;
        lr = 0;
    }

    if (mr > MAXRESIST) mr = MAXRESIST;
    ptrplr->_pMagResist = mr;

    if (fr > MAXRESIST) fr = MAXRESIST;
    ptrplr->_pFireResist = fr;

    if (lr > MAXRESIST) lr = MAXRESIST;
    ptrplr->_pLghtResist = lr;

    if (ptrplr->_pClass == PC_WARRIOR) vadd <<= 1;
    if (ptrplr->_pClass == PC_ROGUE) vadd += vadd >> 1;
    ihp += (vadd << 6);

    if (ptrplr->_pClass == PC_SORCERER) madd <<= 1;
    if (ptrplr->_pClass == PC_ROGUE) madd += madd >> 1;
    imana += (madd << 6);

    ptrplr->_pHitPoints = ptrplr->_pHPBase + ihp;
    ptrplr->_pMaxHP = ptrplr->_pMaxHPBase + ihp;

    if ((ptrplr->_pHitPoints >> 6) <= 0) SetPlayerHitPoints(p, 0);

    ptrplr->_pMana = ptrplr->_pManaBase + imana;
    ptrplr->_pMaxMana = ptrplr->_pMaxManaBase + imana;

    ptrplr->_pIFMinDam = fmin;
    ptrplr->_pIFMaxDam = fmax;
    ptrplr->_pILMinDam = lmin;
    ptrplr->_pILMaxDam = lmax;

    if (iflgs & 0x1) ptrplr->_pInfraFlag = TRUE;
    else ptrplr->_pInfraFlag = FALSE;

    ptrplr->_pBlockFlag = FALSE;
    ptrplr->_pwtype = 0;

    g = 0;
    if (ptrplr->Hand1Item._itype != -1
        && ptrplr->Hand1Item._iClass == IC_WEAP
        && ptrplr->Hand1Item._iStatFlag)
        g = ptrplr->Hand1Item._itype;
    if (ptrplr->Hand2Item._itype != -1
        && ptrplr->Hand2Item._iClass == IC_WEAP
        && ptrplr->Hand2Item._iStatFlag)
        g = ptrplr->Hand2Item._itype;

    switch (g) {
    case IT_SWORD:
        g = 2;
        break;
    case IT_MACE:
        g = 6;
        break;
    case IT_BOW:
        ptrplr->_pwtype = 1;
        g = 4;
        break;
    case IT_AXE:
        g = 5;
        break;
    case IT_STAFF:
        g = 8;
        break;
    }

    if (ptrplr->Hand1Item._itype == IT_SHIELD && ptrplr->Hand1Item._iStatFlag) {
        ptrplr->_pBlockFlag = TRUE;
        g++;
    }
    if (ptrplr->Hand2Item._itype == IT_SHIELD && ptrplr->Hand2Item._iStatFlag) {
        ptrplr->_pBlockFlag = TRUE;
        g++;
    }
    if (ptrplr->InvBody[INVLOC_CHEST]._itype == IT_MARMOR && ptrplr->InvBody[INVLOC_CHEST]._iStatFlag) g += 16;
    if (ptrplr->InvBody[INVLOC_CHEST]._itype == IT_HARMOR && ptrplr->InvBody[INVLOC_CHEST]._iStatFlag) g += 32;

    if (ptrplr->_pgfxnum != g && Loadgfx) {
        ptrplr->_pgfxnum = g;
        ptrplr->_pGFXLoad = 0;
        SetPlrAnims(p);
        ptrplr->_pAnimLen = ptrplr->_pNFrames;
        ptrplr->_pAnimFrame = 1;
        ptrplr->peq = 0;
        ptrplr->_pAnimCnt = 0;
        ptrplr->_pAnimDelay = 3;
    } else {
        ptrplr->_pgfxnum = g;
    }

    for (i = 0; i < nummissiles; i++) {
        mi = missileactive[i];
        if (missile[mi]._mitype == MIS_MANASHIELD && missile[mi]._misource == p) {
            missile[mi]._miVar1 = ptrplr->_pHitPoints;
            missile[mi]._miVar2 = ptrplr->_pHPBase;
        }
    }

    drawmanaflag = TRUE;
    drawhpflag = TRUE;
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
        ptrplr->_pRSpell = -1;
        ptrplr->_pRSplType = SPT_NONE;
    }
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

/* @0x8003F6DC ITEMS.CPP:1050 */
static unsigned char ItemMinStats(const PlayerStruct *p, const ItemStruct *x)
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

/* @0x8003F834 ITEMS.CPP:1086 — hellfire + a 20-slot bound on the per-player witchitem walk */
void CalcPlrBookVals(int p)
{
    int i, slvl;

    void WitchBookLevel(int);
    if (currlevel == 0) {
        for (i = 1; witchitem[i]._itype != -1 && i < 20; i++)
            WitchBookLevel(i);
    }

    for (i = 0; i < plr[p]._pNumInv; i++) {
        if ((plr[p].InvList[i]._itype == IT_MISC) && (plr[p].InvList[i]._iMiscId == IMID_BOOK)) {
            plr[p].InvList[i]._iMinMag = spelldata[plr[p].InvList[i]._iSpell].sMinInt;
            slvl = plr[p]._pSplLvl[plr[p].InvList[i]._iSpell];
            while (slvl != 0) {
                plr[p].InvList[i]._iMinMag += ((plr[p].InvList[i]._iMinMag * 20) / 100);
                slvl--;
                if ((plr[p].InvList[i]._iMinMag + ((plr[p].InvList[i]._iMinMag * 20) / 100)) > 255) {
                    plr[p].InvList[i]._iMinMag = 255;
                    slvl = 0;
                }
            }
            plr[p].InvList[i]._iStatFlag = ItemMinStats(&plr[p], &plr[p].InvList[i]);
        }
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

/* item types / power flags (hellfire ITEMS.H) */

/* @0x8003FBC8 ITEMS.CPP:1130 — PSX: text ids (_iName/_iIName = iName), staff charges stay 40 */
void SetPlrHandItem(ItemStruct *h, int idata)
{
    const ItemDataStruct *pAllItem = &AllItemsList[idata];

    memset(h, 0, sizeof(ItemStruct));
    h->_itype = pAllItem->itype;
    h->_iCurs = pAllItem->iCurs;
    h->_iName = pAllItem->iName;
    h->_iIName = pAllItem->iName;
    h->_iLoc = pAllItem->iLoc;
    h->_iClass = pAllItem->iClass;
    h->_iMinDam = pAllItem->iMinDam;
    h->_iMaxDam = pAllItem->iMaxDam;
    h->_iAC = pAllItem->iMinAC;
    h->_iMiscId = pAllItem->iMiscId;
    h->_iSpell = pAllItem->iSpell;
    if (pAllItem->iMiscId == IMID_STAFF) h->_iCharges = 40;
    h->_iMaxCharges = h->_iCharges;
    h->_iDurability = pAllItem->iDurability;
    h->_iMaxDur = pAllItem->iDurability;
    h->_iMinStr = pAllItem->iMinStr;
    h->_iMinMag = pAllItem->iMinMag;
    h->_iMinDex = pAllItem->iMinDex;
    h->_ivalue = pAllItem->iValue;
    h->_iIvalue = pAllItem->iValue;
    h->_iPrePower = -1;
    h->_iSufPower = -1;
    h->IDidx = idata;
    h->_iMagical = IMAGIC_NONE;
    h->_iStatFlag = TRUE;
}

/* @0x8003FCE0 ITEMS.CPP:1408 */
void GetPlrHandSeed(ItemStruct *h)
{
    h->_iSeed = GetRndSeed();
}

/* @0x8003FD0C ITEMS.CPP:1178 — PSX: the inventory scan is not gated on pnum == myplr */
void GetGoldSeed(int pnum, ItemStruct *h)
{
    int i, ii, s;
    unsigned char doneflag;

    do {
        doneflag = TRUE;
        s = GetRndSeed();
        for (i = 0; i < numitems; i++) {
            ii = itemactive[i];
            if (item[ii]._iSeed == s) doneflag = FALSE;
        }
        for (i = 0; i < plr[pnum]._pNumInv; i++)
            if (plr[pnum].InvList[i]._iSeed == s) doneflag = FALSE;
    } while (!doneflag);
    h->_iSeed = s;
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


/* @0x8003FEAC ITEMS.CPP:1225 — hellfire minus monk/bard/barbarian; the sorcerer keeps mana potions;
 * 2-player (FePlayerNo) adds a resurrect scroll in belt slot 2 */
void CreatePlrItems(int p)
{
    int i;
    ItemStruct *pi;

    pi = &plr[p].InvBody[0];
    for (i = NUM_INVLOC; i--; pi++)
        pi->_itype = -1;

    memset(plr[p].InvGrid, 0, sizeof(plr[p].InvGrid));
    pi = &plr[p].InvList[0];
    for (i = MAXINV; i--; pi++)
        pi->_itype = -1;
    plr[p]._pNumInv = 0;

    pi = &plr[p].SpdList[0];
    for (i = MAXSPD; i--; pi++)
        pi->_itype = -1;

    switch (plr[p]._pClass) {
    case PC_WARRIOR:
        SetPlrHandItem(&plr[p].Hand1Item, IDI_WARRIOR);
        GetPlrHandSeed(&plr[p].Hand1Item);

        SetPlrHandItem(&plr[p].Hand2Item, IDI_WARRSHLD);
        GetPlrHandSeed(&plr[p].Hand2Item);

        SetPlrHandItem(&plr[p].HoldItem, IDI_WARRCLUB);
        GetPlrHandSeed(&plr[p].HoldItem);
        AutoPlace(p, 0, 1, 3, TRUE);

        SetPlrHandItem(&plr[p].SpdList[0], IDI_HEAL);
        GetPlrHandSeed(&plr[p].SpdList[0]);
        SetPlrHandItem(&plr[p].SpdList[1], IDI_HEAL);
        GetPlrHandSeed(&plr[p].SpdList[1]);
        break;

    case PC_ROGUE:
        SetPlrHandItem(&plr[p].Hand1Item, IDI_ROGUE);
        GetPlrHandSeed(&plr[p].Hand1Item);
        SetPlrHandItem(&plr[p].SpdList[0], IDI_HEAL);
        GetPlrHandSeed(&plr[p].SpdList[0]);
        SetPlrHandItem(&plr[p].SpdList[1], IDI_HEAL);
        GetPlrHandSeed(&plr[p].SpdList[1]);
        break;

    case PC_SORCERER:
        SetPlrHandItem(&plr[p].Hand1Item, IDI_SORCEROR);
        GetPlrHandSeed(&plr[p].Hand1Item);
        SetPlrHandItem(&plr[p].SpdList[0], IDI_MANA);
        GetPlrHandSeed(&plr[p].SpdList[0]);
        SetPlrHandItem(&plr[p].SpdList[1], IDI_MANA);
        GetPlrHandSeed(&plr[p].SpdList[1]);
        break;
    }

    if (FePlayerNo) {
        GetItemAttrs(0, IDI_RESURRECT, 1);
        plr[p].SpdList[2] = item[0];
        plr[p].SpdList[2]._iStatFlag = TRUE;
        plr[p].SpdList[2]._iCreateInfo = 1;
        plr[p].SpdList[2]._PlrCreate = FePlayerNo;
        SetPlrHandItem(&plr[p].SpdList[2], IDI_RESURRECT);
        GetPlrHandSeed(&plr[p].SpdList[2]);
    }

    SetPlrHandItem(&plr[p].HoldItem, IDI_GOLD);
    GetPlrHandSeed(&plr[p].HoldItem);
    plr[p].HoldItem._ivalue = 100;
    plr[p].HoldItem._iCurs = ITEM_1GOLD;
    plr[p]._pGold = plr[p].HoldItem._ivalue;
    i = plr[p]._pNumInv;
    plr[p].InvList[i] = plr[p].HoldItem;
    plr[p]._pNumInv++;
    plr[p].InvGrid[30] = plr[p]._pNumInv;

    CalcPlrInv(p, FALSE);
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


/* @0x80040B7C ITEMS.CPP:1512 — PSX: declarations at the top (no SYM levels), bs = 0 init, FePlayerNo spell
 * skips (as GetStaffSpell), wrap also counts FIREBOLT, names are text ids */
void GetBookSpell(int i, int lvl)
{
    int rv, s, bs;

    bs = 0;
    if (lvl == 0) lvl = 1;
    rv = ENG_random(SPL_LAST) + 1;

    s = SPL_FIREBOLT;
    while (rv > 0) {
        if ((spelldata[s].sBookLvl != -1) && (lvl >= spelldata[s].sBookLvl)) {
            rv--;
            bs = s;
        }

        s++;
        if (FePlayerNo != 1) {
            if (s == SPL_RESURRECT) s++;
            if (s == SPL_HEALOTHER) s++;
        }
        if (FePlayerNo != 0) {
            if (s == SPL_TELE) s++;
            if (s == SPL_PHASE) s++;
        }
        if (s >= SPL_LAST) {
            s = SPL_FIREBOLT;
            rv--;
            bs = SPL_FIREBOLT;
        }
    }
    item[i]._iName = spelldata[bs].sNameText;
    item[i]._iIName = spelldata[bs].sNameText;
    item[i]._iSpell = bs;
    item[i]._iMinMag = spelldata[bs].sMinInt;
    item[i]._ivalue += spelldata[bs].sBookCost;
    item[i]._iIvalue += spelldata[bs].sBookCost;
    if (spelldata[bs].sType == 0) item[i]._iCurs = ITEM_BOOK3;
    if (spelldata[bs].sType == 1) item[i]._iCurs = ITEM_BOOK;
    if (spelldata[bs].sType == 2) item[i]._iCurs = ITEM_BOOK2;
}


/* @0x80040DDC ITEMS.CPP:1564 — PSX: no pre local (the random is tested directly), no name building
 * (istr stays as an unused 128-byte frame slot, SYM AUTO), _iPrePower = preidx, no InfoFit block */
void GetStaffPower(int i, int lvl, int bs, unsigned char onlygood)
{
    int l[256], nl;
    int j;
    int preidx;
    char istr[128];
    unsigned char addok;

    int pre = ENG_random(10);   /* hellfire's pre; no SYM record (only feeds the test) */
    preidx = -1;

    if ((pre == 0) || (onlygood)) {
        nl = 0;
        for (j = 0; PL_Prefix[j].PLPower != -1; j++) {
            if (((PL_Prefix[j].PLIType & PLF_STAFF) != 0) && (PL_Prefix[j].PLMinLvl <= lvl)) {
                addok = TRUE;
                if ((onlygood) && (!PL_Prefix[j].PLOk)) addok = FALSE;

                if (addok) {
                    l[nl] = j;
                    nl++;
                    if (PL_Prefix[j].PLDouble) {
                        l[nl] = j;
                        nl++;
                    }
                }
            }
        }
        if (nl != 0) {
            preidx = l[ENG_random(nl)];
            item[i]._iMagical = 1;
            SaveItemPower(i, PL_Prefix[preidx].PLPower, PL_Prefix[preidx].PLParam1, PL_Prefix[preidx].PLParam2, PL_Prefix[preidx].PLMinVal, PL_Prefix[preidx].PLMaxVal, PL_Prefix[preidx].PLMultVal);
            item[i]._iPrePower = preidx;
        }
    }
    CalcItemValue(i);
}


/* @0x80040FC4 ITEMS.CPP:1634 — PSX keeps the 1-in-4 GetItemPower(PLF_STAFF) branch hellfire commented out;
 * spell skips depend on FePlayerNo (resurrect/heal other in 1-player, phasing/teleport in 2-player);
 * wrapping past SPL_LAST also counts FIREBOLT; names are text ids (no sprintf/InfoFit) */
void GetStaffSpell(int i, int lvl, unsigned char onlygood)
{
    int rv, s, l, bs;
    int maxc, minc;

    bs = 0;
    if (ENG_random(4) == 0) GetItemPower(i, lvl >> 1, lvl, PLF_STAFF, onlygood);
    else {
        l = lvl >> 1;
        if (l == 0) l = 1;
        rv = ENG_random(SPL_LAST) + 1;

        s = SPL_FIREBOLT;
        while (rv > 0) {
            if ((spelldata[s].sStaffLvl != -1) && (l >= spelldata[s].sStaffLvl)) {
                rv--;
                bs = s;
            }
            s++;
            if (FePlayerNo == 0) {
                if (s == SPL_RESURRECT) s++;
                if (s == SPL_HEALOTHER) s++;
            } else {
                if (s == SPL_TELE) s++;
                if (s == SPL_PHASE) s++;
            }
            if (s >= SPL_LAST) {
                s = SPL_FIREBOLT;
                rv--;
                bs = SPL_FIREBOLT;
            }
        }
        if (bs >= SPL_LAST) DBG_Error(NULL, "source/ITEMS.cpp", 1687);
        if (!spelldata[bs].sNameText) DBG_Error(NULL, "source/ITEMS.cpp", 1688);
        item[i]._iSpell = bs;
        minc = spelldata[bs].sStaffMin;
        maxc = spelldata[bs].sStaffMax;
        item[i]._iCharges = ENG_random(maxc - minc + 1) + minc;
        item[i]._iMaxCharges = item[i]._iCharges;
        item[i]._iMinMag = spelldata[bs].sMinInt;
        int v = (spelldata[bs].sStaffCost * item[i]._iCharges) / 5;
        item[i]._ivalue += v;
        item[i]._iIvalue += v;
        GetStaffPower(i, lvl, bs, onlygood);
    }
}

/* @0x8004129C ITEMS.CPP:1750 — PSX: text-id names, no _iFlags2/oil, no trailing _iFlags reset, gold from
 * currlevel with three independent difficulty tests (rndv = 0 up front), _PlrCreate = FePlayerNo */
/* Retail defines SinTab here: its .rdata (0x80116178) follows GetStaffSpell's "source/ITEMS.cpp" literal
 * and precedes the PrintItem* formats. */
const short SinTab[32] = {
    0,49,97,142,181,212,236,251,255,251,236,212,181,142,97,49,
    0,-49,-97,-142,-181,-212,-236,-251,-255,-251,-236,-212,-181,-142,-97,-49
};

void GetItemAttrs(int i, int idata, int lvl)
{
    int rndv = 0;

    item[i]._itype = AllItemsList[idata].itype;
    item[i]._iCurs = AllItemsList[idata].iCurs;
    item[i]._iName = AllItemsList[idata].iName;
    item[i]._iIName = AllItemsList[idata].iName;
    item[i]._iLoc = AllItemsList[idata].iLoc;
    item[i]._iClass = AllItemsList[idata].iClass;
    item[i]._iMinDam = AllItemsList[idata].iMinDam;
    item[i]._iMaxDam = AllItemsList[idata].iMaxDam;
    item[i]._iAC = ENG_random(AllItemsList[idata].iMaxAC - AllItemsList[idata].iMinAC + 1) + AllItemsList[idata].iMinAC;
    item[i]._iFlags = AllItemsList[idata].iFlags;
    item[i]._iMiscId = AllItemsList[idata].iMiscId;
    item[i]._iSpell = AllItemsList[idata].iSpell;
    item[i]._iMagical = IMAGIC_NONE;

    item[i]._ivalue = AllItemsList[idata].iValue;
    item[i]._iIvalue = AllItemsList[idata].iValue;

    item[i]._iVAdd1 = 0;
    item[i]._iVMult1 = 0;
    item[i]._iVAdd2 = 0;
    item[i]._iVMult2 = 0;

    item[i]._iPLDam = 0;
    item[i]._iPLToHit = 0;
    item[i]._iPLAC = 0;

    item[i]._iPLStr = 0;
    item[i]._iPLMag = 0;
    item[i]._iPLDex = 0;
    item[i]._iPLVit = 0;

    item[i]._iCharges = 0;
    item[i]._iMaxCharges = 0;

    item[i]._iDurability = AllItemsList[idata].iDurability;
    item[i]._iMaxDur = AllItemsList[idata].iDurability;
    item[i]._iMinStr = AllItemsList[idata].iMinStr;
    item[i]._iMinMag = AllItemsList[idata].iMinMag;
    item[i]._iMinDex = AllItemsList[idata].iMinDex;

    item[i]._iPLFR = 0;
    item[i]._iPLLR = 0;
    item[i]._iPLMR = 0;

    item[i].IDidx = idata;

    item[i]._iPLDamMod = 0;
    item[i]._iPLGetHit = 0;
    item[i]._iPLLight = 0;

    item[i]._iSplLvlAdd = 0;

    item[i]._iRequest = FALSE;

    item[i]._iFMinDam = 0;
    item[i]._iFMaxDam = 0;
    item[i]._iLMinDam = 0;
    item[i]._iLMaxDam = 0;

    item[i]._iPLEnAc = 0;

    item[i]._iPLMana = 0;
    item[i]._iPLHP = 0;

    item[i]._iPrePower = -1;
    item[i]._iSufPower = -1;

    if (item[i]._iMiscId == IMID_BOOK) GetBookSpell(i, lvl);

    if (item[i]._itype == IT_GOLD) {
        if (gnDifficulty == 0)
            rndv = (currlevel * 5) + ENG_random(currlevel * 10);
        if (gnDifficulty == 1)
            rndv = ((currlevel + 16) * 5) + ENG_random((currlevel + 16) * 10);
        if (gnDifficulty == 2)
            rndv = ((currlevel + 32) * 5) + ENG_random((currlevel + 32) * 10);

        if (leveltype == 4) rndv += (rndv >> 3);
        if (rndv > 5000) rndv = 5000;
        item[i]._ivalue = rndv;
        if (rndv >= GOLD_VT2) {
            item[i]._iCurs = ITEM_5GOLD;
        } else {
            if (rndv <= GOLD_VT1) item[i]._iCurs = ITEM_1GOLD;
            else item[i]._iCurs = ITEM_3GOLD;
        }
    }
    item[i]._PlrCreate = FePlayerNo;
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

/* @0x800418B4 ITEMS.CPP:1875 — the Diablo 1.09 (non-hellfire) case set in its source order; PSX drops TARGAC
 * (57), r2 = 0 up front; flag values = the PSX ISPL_ bits read off the oracle */
void SaveItemPower(int i, int power, int param1, int param2, int minval, int maxval, int multval)
{
    int r, r2 = 0;

    r = RndPL(param1, param2);
    switch (power) {
    case 0:   /* IPL_TOHIT */
        item[i]._iPLToHit += r;
        break;
    case 1:   /* IPL_TOHIT_CURSE */
        item[i]._iPLToHit -= r;
        break;
    case 2:   /* IPL_DAMP */
        item[i]._iPLDam += r;
        break;
    case 3:   /* IPL_DAMP_CURSE */
        item[i]._iPLDam -= r;
        break;
    case 4:   /* IPL_TOHIT_DAMP */
        r = RndPL(param1, param2);
        item[i]._iPLDam += r;
        if (param1 == 20)
            r2 = RndPL(1, 5);
        if (param1 == 36)
            r2 = RndPL(6, 10);
        if (param1 == 51)
            r2 = RndPL(11, 15);
        if (param1 == 66)
            r2 = RndPL(16, 20);
        if (param1 == 81)
            r2 = RndPL(21, 30);
        if (param1 == 96)
            r2 = RndPL(31, 40);
        if (param1 == 111)
            r2 = RndPL(41, 50);
        if (param1 == 126)
            r2 = RndPL(51, 75);
        if (param1 == 151)
            r2 = RndPL(76, 100);
        item[i]._iPLToHit += r2;
        break;
    case 5:   /* IPL_TOHIT_DAMP_CURSE */
        item[i]._iPLDam -= r;
        if (param1 == 25)
            r2 = RndPL(1, 5);
        if (param1 == 50)
            r2 = RndPL(6, 10);
        item[i]._iPLToHit -= r2;
        break;
    case 6:   /* IPL_ACP */
        item[i]._iPLAC += r;
        break;
    case 7:   /* IPL_ACP_CURSE */
        item[i]._iPLAC -= r;
        break;
    case 75:   /* IPL_SETAC */
        item[i]._iAC = r;
        break;
    case 79:   /* IPL_AC_CURSE */
        item[i]._iAC -= r;
        break;
    case 8:   /* IPL_FIRERES */
        item[i]._iPLFR += r;
        break;
    case 9:   /* IPL_LIGHTRES */
        item[i]._iPLLR += r;
        break;
    case 10:   /* IPL_MAGICRES */
        item[i]._iPLMR += r;
        break;
    case 11:   /* IPL_ALLRES */
        item[i]._iPLFR += r;
        item[i]._iPLLR += r;
        item[i]._iPLMR += r;
        if (item[i]._iPLFR < 0)
            item[i]._iPLFR = 0;
        if (item[i]._iPLLR < 0)
            item[i]._iPLLR = 0;
        if (item[i]._iPLMR < 0)
            item[i]._iPLMR = 0;
        break;
    case 14:   /* IPL_SPLLVLADD */
        item[i]._iSplLvlAdd = r;
        break;
    case 15:   /* IPL_CHARGES */
        item[i]._iCharges *= param1;
        item[i]._iMaxCharges = item[i]._iCharges;
        break;
    case 66:   /* IPL_SPELL */
        item[i]._iSpell = param1;
        item[i]._iCharges = param1; // BUGFIX: should be param2. This code was correct in v1.04, and the bug was introduced between 1.04 and 1.09b.
        item[i]._iMaxCharges = param2;
        break;
    case 16:   /* IPL_FIREDAM */
        item[i]._iFlags |= 0x10;
        item[i]._iFMinDam = param1;
        item[i]._iFMaxDam = param2;
        break;
    case 17:   /* IPL_LIGHTDAM */
        item[i]._iFlags |= 0x20;
        item[i]._iLMinDam = param1;
        item[i]._iLMaxDam = param2;
        break;
    case 19:   /* IPL_STR */
        item[i]._iPLStr += r;
        break;
    case 20:   /* IPL_STR_CURSE */
        item[i]._iPLStr -= r;
        break;
    case 21:   /* IPL_MAG */
        item[i]._iPLMag += r;
        break;
    case 22:   /* IPL_MAG_CURSE */
        item[i]._iPLMag -= r;
        break;
    case 23:   /* IPL_DEX */
        item[i]._iPLDex += r;
        break;
    case 24:   /* IPL_DEX_CURSE */
        item[i]._iPLDex -= r;
        break;
    case 25:   /* IPL_VIT */
        item[i]._iPLVit += r;
        break;
    case 26:   /* IPL_VIT_CURSE */
        item[i]._iPLVit -= r;
        break;
    case 27:   /* IPL_ATTRIBS */
        item[i]._iPLStr += r;
        item[i]._iPLMag += r;
        item[i]._iPLDex += r;
        item[i]._iPLVit += r;
        break;
    case 28:   /* IPL_ATTRIBS_CURSE */
        item[i]._iPLStr -= r;
        item[i]._iPLMag -= r;
        item[i]._iPLDex -= r;
        item[i]._iPLVit -= r;
        break;
    case 29:   /* IPL_GETHIT_CURSE */
        item[i]._iPLGetHit += r;
        break;
    case 30:   /* IPL_GETHIT */
        item[i]._iPLGetHit -= r;
        break;
    case 31:   /* IPL_LIFE */
        item[i]._iPLHP += r << 6;
        break;
    case 32:   /* IPL_LIFE_CURSE */
        item[i]._iPLHP -= r << 6;
        break;
    case 33:   /* IPL_MANA */
        item[i]._iPLMana += r << 6;
        drawmanaflag = TRUE;
        break;
    case 34:   /* IPL_MANA_CURSE */
        item[i]._iPLMana -= r << 6;
        drawmanaflag = TRUE;
        break;
    case 35:   /* IPL_DUR */
        r2 = item[i]._iMaxDur * r / 100;
        item[i]._iMaxDur += r2;
        item[i]._iDurability += r2;
        break;
    case 36:   /* IPL_DUR_CURSE */
        r2 = item[i]._iMaxDur * r / 100;
        item[i]._iMaxDur -= r2;
        if (item[i]._iMaxDur < 1)
            item[i]._iMaxDur = 1;
        item[i]._iDurability = item[i]._iMaxDur;
        break;
    case 37:   /* IPL_INDESTRUCTIBLE */
        item[i]._iDurability = 255;
        item[i]._iMaxDur = 255;
        break;
    case 38:   /* IPL_LIGHT */
        item[i]._iPLLight += param1;
        break;
    case 39:   /* IPL_LIGHT_CURSE */
        item[i]._iPLLight -= param1;
        break;
    case 42:   /* IPL_FIRE_ARROWS */
        item[i]._iFlags |= 0x8;
        item[i]._iFMinDam = param1;
        item[i]._iFMaxDam = param2;
        break;
    case 43:   /* IPL_LIGHT_ARROWS */
        item[i]._iFlags |= 0x2000000;
        item[i]._iLMinDam = param1;
        item[i]._iLMaxDam = param2;
        break;
    case 45:   /* IPL_THORNS */
        item[i]._iFlags |= 0x4000000;
        break;
    case 46:   /* IPL_NOMANA */
        item[i]._iFlags |= 0x8000000;
        drawmanaflag = TRUE;
        break;
    case 47:   /* IPL_NOHEALPLR */
        item[i]._iFlags |= 0x100;
        break;
    case 52:   /* IPL_ABSHALFTRAP */
        item[i]._iFlags |= 0x10000000;
        break;
    case 53:   /* IPL_KNOCKBACK */
        item[i]._iFlags |= 0x800;
        break;
    case 69:   /* IPL_3XDAMVDEM */
        item[i]._iFlags |= 0x40000000;
        break;
    case 70:   /* IPL_ALLRESZERO */
        item[i]._iFlags |= 0x80000000;
        break;
    case 54:   /* IPL_NOHEALMON */
        item[i]._iFlags |= 0x1000;
        break;
    case 55:   /* IPL_STEALMANA */
        if (param1 == 3)
            item[i]._iFlags |= 0x2000;
        if (param1 == 5)
            item[i]._iFlags |= 0x4000;
        drawmanaflag = TRUE;
        break;
    case 56:   /* IPL_STEALLIFE */
        if (param1 == 3)
            item[i]._iFlags |= 0x8000;
        if (param1 == 5)
            item[i]._iFlags |= 0x10000;
        drawhpflag = TRUE;
        break;
    case 58:   /* IPL_FASTATTACK */
        if (param1 == 1)
            item[i]._iFlags |= 0x20000;
        if (param1 == 2)
            item[i]._iFlags |= 0x40000;
        if (param1 == 3)
            item[i]._iFlags |= 0x80000;
        if (param1 == 4)
            item[i]._iFlags |= 0x100000;
        break;
    case 59:   /* IPL_FASTRECOVER */
        if (param1 == 1)
            item[i]._iFlags |= 0x200000;
        if (param1 == 2)
            item[i]._iFlags |= 0x400000;
        if (param1 == 3)
            item[i]._iFlags |= 0x800000;
        break;
    case 60:   /* IPL_FASTBLOCK */
        item[i]._iFlags |= 0x1000000;
        break;
    case 61:   /* IPL_DAMMOD */
        item[i]._iPLDamMod += r;
        break;
    case 62:   /* IPL_RNDARROWVEL */
        item[i]._iFlags |= 0x4;
        break;
    case 63:   /* IPL_SETDAM */
        item[i]._iMinDam = param1;
        item[i]._iMaxDam = param2;
        break;
    case 64:   /* IPL_SETDUR */
        item[i]._iDurability = param1;
        item[i]._iMaxDur = param1;
        break;
    case 67:   /* IPL_FASTSWING */
        item[i]._iFlags |= 0x80000;
        break;
    case 68:   /* IPL_ONEHAND */
        item[i]._iLoc = 1;
        break;
    case 72:   /* IPL_DRAINLIFE */
        item[i]._iFlags |= 0x40;
        break;
    case 73:   /* IPL_RNDSTEALLIFE */
        item[i]._iFlags |= 0x2;
        break;
    case 74:   /* IPL_INFRAVISION */
        item[i]._iFlags |= 0x1;
        break;
    case 65:   /* IPL_NOMINSTR */
        item[i]._iMinStr = 0;
        break;
    case 44:   /* IPL_INVCURS */
        item[i]._iCurs = param1;
        break;
    case 76:   /* IPL_ADDACLIFE */
        /* retail stores the partial sum first (nested assignment) */
        item[i]._iPLHP = ((item[i]._iPLHP = plr[myplr]._pIBonusAC + plr[myplr]._pIAC) + plr[myplr]._pDexterity / 5) << 6;
        break;
    case 77:   /* IPL_ADDMANAAC */
        item[i]._iAC += (plr[myplr]._pMaxManaBase >> 6) / 10;
        break;
    case 78:   /* IPL_FIRERESCLVL */
        item[i]._iPLFR = 30 - plr[myplr]._pLevel;
        if (item[i]._iPLFR < 0)
            item[i]._iPLFR = 0;
        break;
    }
    if (!item[i]._iVAdd1 && !item[i]._iVMult1) {
        item[i]._iVAdd1 = PLVal(r, param1, param2, minval, maxval);
        item[i]._iVMult1 = multval;
    } else {
        item[i]._iVAdd2 = PLVal(r, param1, param2, minval, maxval);
        item[i]._iVMult2 = multval;
    }
}


/* @0x80042FE4 ITEMS.CPP:2165 — hellfire minus the name building / InfoFit block (text ids on PSX);
 * _iPrePower/_iSufPower = the table index; istr stays as an unused frame array (SYM AUTO) */
void GetItemPower(int i, int minlvl, int maxlvl, long flgs, unsigned char onlygood)
{
    int pre, post;
    int l[256], nl;
    int j;
    int preidx, sufidx;
    char istr[128];
    unsigned char goe;

    pre = ENG_random(4);
    post = ENG_random(3);
    if ((pre != 0) && (post == 0)) {
        if (ENG_random(2)) post = 1;
        else pre = 0;
    }

    preidx = -1;
    sufidx = -1;
    goe = 0;

    if ((!onlygood) && (ENG_random(3))) onlygood = TRUE;

    if (pre == 0) {
        nl = 0;
        for (j = 0; PL_Prefix[j].PLPower != -1; j++) {
            if (((PL_Prefix[j].PLIType & flgs) != 0) &&
                (PL_Prefix[j].PLMinLvl >= minlvl) &&
                (PL_Prefix[j].PLMinLvl <= maxlvl)
            ) {
                if (onlygood && !PL_Prefix[j].PLOk) continue;
                if ((flgs == PLF_STAFF) && (PL_Prefix[j].PLPower == PL_CHRG)) continue;

                l[nl] = j;
                nl++;
                if (PL_Prefix[j].PLDouble) {
                    l[nl] = j;
                    nl++;
                }
            }
        }
        if (nl != 0) {
            preidx = l[ENG_random(nl)];
            item[i]._iMagical = 1;
            SaveItemPower(i, PL_Prefix[preidx].PLPower, PL_Prefix[preidx].PLParam1, PL_Prefix[preidx].PLParam2, PL_Prefix[preidx].PLMinVal, PL_Prefix[preidx].PLMaxVal, PL_Prefix[preidx].PLMultVal);
            item[i]._iPrePower = preidx;
            goe = PL_Prefix[preidx].PLGOE;
        }
    }
    if (post != 0) {
        nl = 0;
        for (j = 0; PL_Suffix[j].PLPower != -1; j++) {
            if (((PL_Suffix[j].PLIType & flgs) != 0) &&
                (PL_Suffix[j].PLMinLvl >= minlvl) &&
                (PL_Suffix[j].PLMinLvl <= maxlvl) &&
                ((goe | PL_Suffix[j].PLGOE) != 0x11)
            ) {
                if (onlygood && !PL_Suffix[j].PLOk) continue;

                l[nl] = j;
                nl++;
            }
        }
        if (nl != 0) {
            sufidx = l[ENG_random(nl)];
            item[i]._iMagical = 1;
            SaveItemPower(i, PL_Suffix[sufidx].PLPower, PL_Suffix[sufidx].PLParam1, PL_Suffix[sufidx].PLParam2, PL_Suffix[sufidx].PLMinVal, PL_Suffix[sufidx].PLMaxVal, PL_Suffix[sufidx].PLMultVal);
            item[i]._iSufPower = sufidx;
        }
    }
    if ((preidx != -1) || (sufidx != -1)) CalcItemValue(i);
}

/* @0x80043434 ITEMS.CPP:2274 — PSX: no SpellsOk parameter, a staff always gets a spell */
void GetItemBonus(int i, int idata, int minlvl, int maxlvl, unsigned char onlygood)
{
    if (item[i]._iClass == IC_GOLD) return;
    if (minlvl > 25) minlvl = 25;

    switch (item[i]._itype) {
    case IT_SWORD:
    case IT_AXE:
    case IT_MACE:
        GetItemPower(i, minlvl, maxlvl, PLF_WEAPON, onlygood);
        break;
    case IT_BOW:
        GetItemPower(i, minlvl, maxlvl, PLF_BOW, onlygood);
        break;
    case IT_SHIELD:
        GetItemPower(i, minlvl, maxlvl, PLF_SHIELD, onlygood);
        break;
    case IT_LARMOR:
    case IT_HELM:
    case IT_MARMOR:
    case IT_HARMOR:
        GetItemPower(i, minlvl, maxlvl, PLF_ARMOR, onlygood);
        break;
    case IT_STAFF:
        GetStaffSpell(i, maxlvl, onlygood);
        break;
    case IT_RING:
    case IT_AMULET:
        GetItemPower(i, minlvl, maxlvl, PLF_RING, onlygood);
        break;
    }
}


/* @0x80043530 ITEMS.CPP:2598 — PSX drops the DROPLOG debug call and the _iAnimData/_iAnimWidth/
 * _iAnimWidth2 sets (PSX's item sprite system reaches ItemCAnimTbl directly, no itemanims[] pointer);
 * `item[i].ItemFrame = Item2Frm[it]` (PSX sprite frame base) replaces hellfire's _iAnimLen = ItemAnimLs[it];
 * adds `item[i]._PlrCreate = FePlayerNo` */
void SetupItem(int i)
{
    int it;

    it = ItemCAnimTbl[item[i]._iCurs];
    item[i]._iIdentified = FALSE;
    item[i]._iPostDraw = FALSE;
    item[i].ItemFrame = Item2Frm[it];
    if (plr[myplr].pLvlLoad == 0) {
        item[i]._iAnimFrame = 1;
        item[i]._iAnimFlag = TRUE;
        item[i]._iSelFlag = ISEL_NONE;
    } else {
        item[i]._iAnimFrame = item[i]._iAnimLen;
        item[i]._iAnimFlag = FALSE;
        item[i]._iSelFlag = ISEL_FLR;
    }
    item[i]._PlrCreate = FePlayerNo;
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

/* @0x80043894 ITEMS.CPP:2669 — PSX drops the GetEffLevel() call (uses `currlevel` directly) and gates
 * SPL_RESURRECT/HEALOTHER on FePlayerNo==0, SPL_TELE/PHASE on FePlayerNo!=0 (same family as RndItem) */
int RndUItem(int m)
{
    int ril[512];
    int ri, i;
    unsigned char okflag;

    if (m != -1) {
        if ((monster[m].MData->mTreasure & T_U) && (gbMaxPlayers == 1))
            return -((monster[m].MData->mTreasure & T_MASK) + 1);
    }

    ri = 0;
    for (i = 0; AllItemsList[i].iLoc != -1; i++) {
        okflag = TRUE;
        if (!AllItemsList[i].iRnd) okflag = FALSE;
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

/* @0x80043C40 ITEMS.CPP:2735 — PSX drops the `level` param (uses `currlevel` directly like RndAllItems)
 * and adds a client-only (FePlayerNo!=0) exclusion: for scroll/staff/book-category queries (imid in
 * {IMID_SCROLL,IMID_TSCROLL,IMID_STAFF,IMID_BOOK}) whose iMiscId matches, drop items whose spell is
 * SPL_TELE/SPL_PHASE (same network-safety family as RndItem/RndAllItems/RndWitchItem) */
int RndTypeItems(int itype, int imid)
{
    int ril[512];
    int ri, i;
    unsigned char okflag;

    ri = 0;
    for (i = 0; AllItemsList[i].iLoc != -1; i++) {
        okflag = TRUE;
        if (!AllItemsList[i].iRnd) okflag = FALSE;
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


/* @0x80043DB0 ITEMS.CPP:2757 */
int CheckUnique(int i, int lvl, int uper, unsigned char recreate)
{
    int j, idata;
    unsigned char uok[MAXUITEMS];
    int numu, u;

    if (ENG_random(100) > uper) return -1;

    numu = 0;
    memset(uok, 0, sizeof(uok));
    for (j = 0; UniqueItemList[j].UIItemId != -1; j++) {
        idata = item[i].IDidx;
        if (UniqueItemList[j].UIItemId != AllItemsList[idata].iItemId) continue;
        if (lvl < UniqueItemList[j].UIMinLvl) continue;
        if (!recreate && UniqueItemFlag[j] && (gbMaxPlayers == 1)) continue;
        uok[j] = TRUE;
        numu++;
    }

    if (numu == 0) return -1;
    u = ENG_random(10);
    j = 0;
    while (numu > 0) {
        if (uok[j]) numu--;
        if (numu > 0) {
            j++;
            if (j == MAXUITEMS) j = 0;
        }
    }
    return j;
}

/* @0x80043F54 ITEMS.CPP:2541 — PSX: _uid carries a saved seed in its high bits (OUid): a recreated unique
 * keeps it, a fresh one counts UniqueItemFlag[] and packs uid | count<<24 into the seed; text-id name.
 * NEAR-MISS (count-exact, pure s1/s2 swap): retail i->s2, uid->s1; ours i->s1, uid->s2 (cc1plus -dg:
 * allocno i(72) outranks uid(74)). Falsified: 5 uid/OUid init spellings, `_uid >> 8` / `& 0xFFFFFF00` /
 * `OUid & ~0xFF` tests. Next: raise uid's ref count / shorten i's live range (-dg priority table). */
void GetUniqueItem(int i, int _uid)
{
    long uid;
    long OUid;

    OUid = _uid;
    uid = OUid;
    uid &= 0xFF;

    SaveItemPower(i, UniqueItemList[uid].UIPower1, UniqueItemList[uid].UIParam1, UniqueItemList[uid].UIParam2, 0, 0, 1);
    if (UniqueItemList[uid].UINumPL > 1)
        SaveItemPower(i, UniqueItemList[uid].UIPower2, UniqueItemList[uid].UIParam3, UniqueItemList[uid].UIParam4, 0, 0, 1);
    if (UniqueItemList[uid].UINumPL > 2)
        SaveItemPower(i, UniqueItemList[uid].UIPower3, UniqueItemList[uid].UIParam5, UniqueItemList[uid].UIParam6, 0, 0, 1);
    if (UniqueItemList[uid].UINumPL > 3)
        SaveItemPower(i, UniqueItemList[uid].UIPower4, UniqueItemList[uid].UIParam7, UniqueItemList[uid].UIParam8, 0, 0, 1);
    if (UniqueItemList[uid].UINumPL > 4)
        SaveItemPower(i, UniqueItemList[uid].UIPower5, UniqueItemList[uid].UIParam9, UniqueItemList[uid].UIParam10, 0, 0, 1);
    if (UniqueItemList[uid].UINumPL > 5)
        SaveItemPower(i, UniqueItemList[uid].UIPower6, UniqueItemList[uid].UIParam11, UniqueItemList[uid].UIParam12, 0, 0, 1);
    item[i]._iIName = UniqueItemList[uid].UIName;
    item[i]._iIvalue = UniqueItemList[uid].UIValue;
    if (_uid & ~0xFF) {
        if (!UniqueItemFlag[uid]) UniqueItemFlag[uid]++;
        item[i]._iSeed = OUid;
    } else {
        UniqueItemFlag[uid]++;
        item[i]._iSeed = GetRndSeed() & 0xFFFF00;
        item[i]._iSeed |= uid | (UniqueItemFlag[uid] << 24);
    }
    item[i]._iUid = uid;
    item[i]._iMagical = IMAGIC_UNIQUE;
    item[i]._iCreateInfo |= ICI_UNIQUE;
    item[i]._PlrCreate = FePlayerNo;
}

/* @0x800442B4 ITEMS.CPP:2628 — PSX: UniqueItemFlag gate, currlevel instead of GetEffLevel, NetSendCmdDItem */
void SpawnUnique(int uid, int x, int y)
{
    int ii, itype;

    if (numitems < MAXITEMS && !UniqueItemFlag[uid]) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        itype = 0;
        while (AllItemsList[itype].iItemId != UniqueItemList[uid].UIItemId) itype++;
        GetItemAttrs(ii, itype, currlevel);
        GetUniqueItem(ii, uid);
        SetupItem(ii);
        if (!deltaload) NetSendCmdDItem(FALSE, ii);
        numitems++;
    }
}

/* @0x800443F4 ITEMS.CPP:2851 */
void ItemRndDur(int ii)
{
    if (item[ii]._iDurability == 0) return;
    if (item[ii]._iDurability == INFINITE_DUR) return;
    item[ii]._iDurability = ENG_random(item[ii]._iMaxDur >> 1) + (item[ii]._iMaxDur >> 2) + 1;
}

/* @0x80044490 ITEMS.CPP:2862 — PSX: the seed arrives as _iseed and is kept in a local iseed (SYM REG);
 * `_PlrCreate = FePlayerNo` after SetRndSeed and again after GetItemAttrs; a recreated item skips the
 * bonus pass (outer `&& !recreate`) yet keeps the dead inner `recreate ? iseed & 0xFF : CheckUnique`
 * select retail still compiles; the IMID_UNIQUE/recreate arm drops hellfire's IL_INV guard */
void SetupAllItems(int ii, int idx, int _iseed, int lvl, int uper, unsigned char onlygood, unsigned char recreate, unsigned char pregen)
{
    int iblvl, uid;
    int iseed = _iseed;

    item[ii]._iSeed = iseed;
    SetRndSeed(iseed);
    item[ii]._PlrCreate = FePlayerNo;
    GetItemAttrs(ii, idx, lvl >> 1);
    item[ii]._iCreateInfo = lvl;
    item[ii]._PlrCreate = FePlayerNo;
    if (pregen) item[ii]._iCreateInfo |= ICI_PREGEN;
    if (onlygood) item[ii]._iCreateInfo |= ICI_ONLYGOOD;
    if (uper == 15) item[ii]._iCreateInfo |= ICI_UPER15;
    else if (uper == 1) item[ii]._iCreateInfo |= ICI_UPER1;
    if (item[ii]._iMiscId != IMID_UNIQUE && !recreate) {
        iblvl = -1;
        if (ENG_random(100) <= 10) iblvl = lvl;
        else if (ENG_random(100) <= lvl) iblvl = lvl;
        if ((iblvl == -1) && (item[ii]._iMiscId == IMID_STAFF)) iblvl = lvl;
        if ((iblvl == -1) && (item[ii]._iMiscId == IMID_RING)) iblvl = lvl;
        if ((iblvl == -1) && (item[ii]._iMiscId == IMID_AMULET)) iblvl = lvl;
        if (onlygood) iblvl = lvl;
        if (uper == 15) iblvl = lvl + 4;
        if (iblvl != -1) {
            if (recreate) uid = iseed & 0xFF;
            else uid = CheckUnique(ii, iblvl, uper, recreate);
            if (uid == -1)
                GetItemBonus(ii, idx, iblvl >> 1, iblvl, onlygood);
            else {
                GetUniqueItem(ii, uid);
                item[ii]._iCreateInfo |= ICI_UNIQUE;
            }
        }
        if (item[ii]._iMagical != IMAGIC_UNIQUE) ItemRndDur(ii);
    } else {
        GetUniqueItem(ii, iseed);
    }
    SetupItem(ii);
}


/* @0x800447C8 ITEMS.CPP:2746 — hellfire order; PSX: onlygood = FALSE up front, NetSendCmdDItem before the
 * numitems++ */
void SpawnItem(int m, int x, int y, unsigned char sendmsg)
{
    int ii, idx;
    unsigned char onlygood = FALSE;

    if ((monster[m]._uniqtype != 0) ||
        ((monster[m].MData->mTreasure & T_U) && (gbMaxPlayers != 1))) {
        idx = RndUItem(m);
        if (idx < 0) {
            SpawnUnique(-(idx + 1), x, y);
            return;
        }
        onlygood = TRUE;
    } else {
        if (quests[Q_BKMUSHRM]._qactive == QUEST_ACTIVE
                 && quests[Q_BKMUSHRM]._qvar1 == QS_MUSHGIVEN) {
            idx = IDI_BRAIN;
            quests[Q_BKMUSHRM]._qvar1 = QS_BRAINSPAWNED;
        } else {
            idx = RndItem(m);
            if (idx == 0) return;
            if (idx > 0) {
                idx--;
                onlygood = FALSE;
            } else {
                SpawnUnique(-(idx + 1), x, y);
                return;
            }
        }
    }
    if (numitems < MAXITEMS) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        if (monster[m]._uniqtype != 0) SetupAllItems(ii, idx, GetRndSeed(), monster[m].MData->mLevel, 15, onlygood, FALSE, FALSE);
        else SetupAllItems(ii, idx, GetRndSeed(), monster[m].MData->mLevel, 1, onlygood, FALSE, FALSE);

        if (sendmsg) NetSendCmdDItem(FALSE, ii);
        numitems++;
    }
}

/* @0x80044A20 ITEMS.CPP:2964 — PSX drops GetEffLevel() (uses currlevel directly); in town (currlevel==0)
 * only uid==2 or uid==8 are allowed — any other uid is rejected with a PlaySFX(0x3D3) + early return
 * (unless numitems is already near the cap); sets item[ii]._iMagical=IMAGIC_UNIQUE directly and, unless
 * this is a delta-load or uid 7/3, broadcasts NetSendCmdDItem. The town filter is a switch over the four
 * town-reward uniques: its case-range decision tree ({2},{4,5},{8}, leaf compares cross-jumped into one
 * `beq uid,v0`) is retail's `uid<6 / uid<4 / li v0,2|8` shape. */
void CreateItem(int uid, int x, int y)
{
    int ii, idx;

    if (numitems < MAXITEMS) {
        if (currlevel == 0) {
            switch (uid) {
            case UITEM_INFRARING:
            case UITEM_TRING:
            case UITEM_HARCREST:
            case UITEM_GRISWOLD:
                break;
            default:
                if (numitems < 0x7B) {
                    PlaySFX(0x3D3);
                    return;
                }
            }
        }

        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        idx = 0;
        while (AllItemsList[idx].iItemId != UniqueItemList[uid].UIItemId) idx++;
        GetItemAttrs(ii, idx, currlevel);
        GetUniqueItem(ii, uid);
        SetupItem(ii);
        item[ii]._iMagical = IMAGIC_UNIQUE;
        if (!deltaload && uid != 7 && uid != 3) NetSendCmdDItem(0, ii);
        numitems++;
    }
}

/* @0x80044BD8 ITEMS.CPP:2862 */
void CreateRndItem(int x, int y, unsigned char onlygood, unsigned char sendmsg, unsigned char delta)
{
    int ii, idx;

    if (onlygood) idx = RndUItem(-1);
    else idx = RndAllItems();
    if (numitems < MAXITEMS) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        SetupAllItems(ii, idx, GetRndSeed(), currlevel << 1, 1, onlygood, 0, delta);
        if (sendmsg) NetSendCmdDItem(0, ii);
        if (delta) DeltaAddItem(ii);
        numitems++;
    }
}

/* @0x80044D20 ITEMS.CPP:3018 — PSX uses hellfire's `#if 0`'d ORIGINAL body (IDI_HEAL/IDI_MANA/IDI_PORTAL
 * coin-flips), not the active switch(random(34,7)) rewrite, and drops the "added 7/30/97" IDI_OILACC line */
void SetupAllUseful(int ii, int iseed, int lvl)
{
    int idx;

    item[ii]._iSeed = iseed;
    SetRndSeed(iseed);

    if (ENG_random(2)) idx = 0x18;
    else idx = 0x19;

    if ((lvl > 1) && (ENG_random(3) == 0)) idx = 0x1b;

    GetItemAttrs(ii, idx, lvl);
    item[ii]._iCreateInfo = lvl + ICI_USEFUL;
    item[ii]._PlrCreate = FePlayerNo;
    SetupItem(ii);
}

/* @0x80044E04 ITEMS.CPP:2915 — PSX drops GetEffLevel() (uses currlevel directly) and the CHEATS block */
void CreateRndUseful(int pnum, int x, int y, unsigned char sendmsg)
{
    int ii;

    if (numitems < MAXITEMS) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        SetupAllUseful(ii, GetRndSeed(), currlevel);
        if (sendmsg) NetSendCmdDItem(0, ii);
        numitems++;
    }
}

/* @0x80044EC4 ITEMS.CPP:3078 — PSX drops GetEffLevel() (uses currlevel directly) and the CHEATS block;
 * RndTypeItems here has only 2 params (itype,imisc) */
void CreateTypeItem(int x, int y, unsigned char onlygood, int itype, int imisc, unsigned char sendmsg, unsigned char delta)
{
    int ii, idx;

    if (itype != IT_GOLD) idx = RndTypeItems(itype, imisc);
    else idx = 0;
    if (numitems < MAXITEMS) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        SetupAllItems(ii, idx, GetRndSeed(), currlevel << 1, 1, onlygood, 0, delta);
        if (sendmsg) NetSendCmdDItem(0, ii);
        if (delta) DeltaAddItem(ii);
        numitems++;
    }
}

/* @0x80045008 ITEMS.CPP:3172 — PSX's _iName is a text-ID (unsigned short), not a char buffer: instead of
 * hellfire's `sprintf(item[ii]._iName,"Ear of %s",tempstr)` it just stores the "Ear of %s"-template id
 * 0x122; the tempstr byte-pack is still computed identically (real write to the GLOBAL tempstr buffer,
 * so gcc can't dead-code it even though this function no longer consumes it) */
void RecreateEar(int ii, unsigned short ic, int iseed, unsigned char Id, int dur, int mdur, int ch, int mch, int ivalue, int ibuff)
{
    SetPlrHandItem(&item[ii], 0x17);
    tempstr[0] = (ic >> 8) & 0x7f;
    tempstr[1] = ic & 0x7f;
    tempstr[2] = (iseed >> 24) & 0x7f;
    tempstr[3] = (iseed >> 16) & 0x7f;
    tempstr[4] = (iseed >> 8) & 0x7f;
    tempstr[5] = iseed & 0x7f;
    tempstr[6] = Id & 0x7f;
    tempstr[7] = dur & 0x7f;
    tempstr[8] = mdur & 0x7f;
    tempstr[9] = ch & 0x7f;
    tempstr[10] = mch & 0x7f;
    tempstr[11] = (ivalue >> 8) & 0x7f;
    tempstr[12] = (ibuff >> 24) & 0x7f;
    tempstr[13] = (ibuff >> 16) & 0x7f;
    tempstr[14] = (ibuff >> 8) & 0x7f;
    tempstr[15] = ibuff & 0x7f;
    tempstr[16] = 0;
    item[ii]._iName = 0x122;
    item[ii]._iCurs = ((ivalue >> 6) & 0x3) + 0x13;
    item[ii]._ivalue = ivalue & 0x3f;
    item[ii]._iCreateInfo = ic;
    item[ii]._iSeed = iseed;
    item[ii]._PlrCreate = FePlayerNo;
}

/* @0x80045208 ITEMS.CPP:3000 — PSX: currlevel, NetSendCmdDItem unless anvil/rock/mushroom or deltaload */
void SpawnQuestItem(int itemid, int x, int y, int randarea, int selflag)
{
    int i, j;
    unsigned char failed;

    if (randarea) {
        int tries = 0;
        do {
            if (++tries > 1000 && randarea > 1)
                --randarea;
            x = ENG_random(DMAXX);
            y = ENG_random(DMAXY);
            failed = FALSE;
            for (i = 0; i < randarea && !failed; i++)
                for (j = 0; j < randarea && !failed; j++)
                    failed = !ItemSpaceOk(x + i, y + j);
        } while (failed);
    }

    if (numitems < MAXITEMS) {
        i = itemavail[0];
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = i;
        item[i]._ix = x;
        item[i]._iy = y;
        dung_map[x][y].dItem = i + 1;
        GetItemAttrs(i, itemid, currlevel);
        SetupItem(i);
        item[i]._iPostDraw = TRUE;
        if (selflag != ISEL_NONE) {
            item[i]._iSelFlag = selflag;
            item[i]._iAnimFrame = item[i]._iAnimLen;
            item[i]._iAnimFlag = FALSE;
        }
        if (itemid != IDI_ANVIL && itemid != IDI_ROCK && itemid != IDI_MUSHROOM && !deltaload)
            NetSendCmdDItem(FALSE, i);

        numitems++;
    }
}


/* @0x80045454 ITEMS.CPP:3055 — hellfire minus GetEffLevel (currlevel); PSX: `ostand = 0` init (retail
 * addu a1,zero), no yy local: the _iy store is the dItem row index */
void SpawnRock(void)
{
    int i, ii, ostand = 0;
    int xx;
    unsigned char done = FALSE;

    for (i = 0; i < numobjects && !done; i++) {
        ostand = objectactive[i];
        done = (object[ostand]._otype == 23);   /* OBJ_STAND */
    }

    if (done) {
        ii = itemavail[0];
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        xx = item[ii]._ix = object[ostand]._ox;
        dung_map[xx][item[ii]._iy = object[ostand]._oy].dItem = ii + 1;
        GetItemAttrs(ii, IDI_ROCK, currlevel);
        SetupItem(ii);
        item[ii]._iSelFlag = ISEL_TOP;
        item[ii]._iPostDraw = TRUE;
        item[ii]._iAnimFrame = 11;

        numitems++;
    }
}


/* @0x80045600 ITEMS.CPP:3088 — PSX: ItemFrame = Item2Frm[it] instead of the anim data/width fields */
void RespawnItem(int i, unsigned char FlipFlag)
{
    int it;

    it = ItemCAnimTbl[item[i]._iCurs];
    item[i].ItemFrame = Item2Frm[it];
    item[i]._iAnimLen = ItemAnimLs[it];
    item[i]._iPostDraw = FALSE;
    item[i]._iRequest = FALSE;
    if (FlipFlag) {
        item[i]._iAnimFrame = 1;
        item[i]._iAnimFlag = TRUE;
        item[i]._iSelFlag = ISEL_NONE;
    } else {
        item[i]._iAnimFrame = item[i]._iAnimLen;
        item[i]._iAnimFlag = FALSE;
        item[i]._iSelFlag = ISEL_FLR;
    }
    if (item[i]._iCurs == ITEM_ROCK) {
        item[i]._iSelFlag = ISEL_FLR;
        PlaySfxLoc(ItemAnimSnds[it], item[i]._ix, item[i]._iy);
    }
    if (item[i]._iCurs == ITEM_INNSIGN) item[i]._iSelFlag = ISEL_FLR;
    if (item[i]._iCurs == ITEM_ANVIL) item[i]._iSelFlag = ISEL_FLR;
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

/* @0x8004580C ITEMS.CPP:3141 — hellfire verbatim; DIRTEDGED2 = 16, dItem -> dung_map[][].dItem */
void ItemDoppel(void)
{
    int idoppelx;
    ItemStruct *i;

    if (gbMaxPlayers == 1) return;

    for (idoppelx = 16; idoppelx < (16 + 80); idoppelx++) {
        if (dung_map[idoppelx][idoppely].dItem) {
            i = &item[dung_map[idoppelx][idoppely].dItem - 1];
            if ((i->_ix != idoppelx) || (i->_iy != idoppely))
                dung_map[idoppelx][idoppely].dItem = 0;
        }
    }
    idoppely++;
    if (idoppely == 16 + 80) idoppely = 16;
}

/* @0x8012ECD8 (bss) — SYM STAT char[127] (name from the JAP SYM dump) */

/* @0x800458CC ITEMS.CPP:3173 — PSX-only rewrite: de-duplicated active list, rock frame by select flag,
 * animation frozen while paused / CD-waiting, drop sounds only for visible tiles (SinTab<0 = anim end).
 * Retail shape (raw + SYM block tree): three nested ifs (anim / visible / SinTab) with the finish stores
 * in both the SinTab body and the invisible else arm (jump2 cross-jumps them into the one retail tail);
 * `count` (a0) carries the new frame, the item base is the record-less `(item + ii)` address (s0) shared
 * by cse across both arms, and the frame snapshot is the record-less const `frame` (s1) declared after
 * the frame-4 sound so cse folds its pseudo into the compare's zero-extend. */
void ProcessItems(void)
{
    int i, ii, numitemslist, count;

    numitemslist = 0;
    for (i = 0; i < numitems; i++) {
        ii = itemactive[i];
        count = 0;
        for (int j = 0; j < numitemslist; j++) {
            if (ii == itemactivelist[j]) count++;
        }
        if (count == 0) itemactivelist[numitemslist++] = ii;
    }

    for (i = 0; i < numitemslist; i++) {
        ii = itemactivelist[i];
        if (item[ii]._iCurs == ITEM_ROCK) {
            item[ii]._iAnimFlag = FALSE;
            if (item[ii]._iSelFlag == ISEL_FLR) item[ii].ItemFrame = 0x12A;
            if (item[ii]._iSelFlag == ISEL_TOP) item[ii].ItemFrame = 0x12B;
        }
        if (item[ii]._iAnimFlag && !PauseMode && !CDWAIT) {
            count = (unsigned char)item[ii]._iAnimFrame + 1;
            (item + ii)->_iAnimFrame = count;
            if (dung_map[(item + ii)->_ix][(item + ii)->_iy].dFlags & 3) {
                if ((unsigned char)count == 4) PlaySfxLoc(0x15, (item + ii)->_ix, (item + ii)->_iy);
                const int frame = (unsigned char)count;
                if (SinTab[frame & 0x1F] < 0) {
                    int it = ItemCAnimTbl[(item + ii)->_iCurs];
                    PlaySfxLoc(ItemAnimSnds[it], (item + ii)->_ix, (item + ii)->_iy);
                    (item + ii)->_iAnimFrame = item[ii]._iAnimLen;
                    (item + ii)->_iAnimFlag = FALSE;
                    (item + ii)->_iSelFlag = ISEL_FLR;
                }
            } else {
                (item + ii)->_iAnimFrame = item[ii]._iAnimLen;
                (item + ii)->_iAnimFlag = FALSE;
                (item + ii)->_iSelFlag = ISEL_FLR;
            }
        }
    }

    ItemDoppel();
}

/* @0x80045B70 ITEMS.CPP:3255 — empty on PSX (PC itemanims[] free loop removed) */
void FreeItemGFX(void)
{
}


/* @0x80045B78 ITEMS.CPP:3279 — PSX: gold text from the language table (GetStr 0x4FF), item names via
 * MakeItemStr(text id), infoclr reset to white first */
void GetItemStr(int i)
{
    switch (item[i]._itype) {
    case IT_GOLD: {
        int nGold = item[i]._ivalue;
        const char *get_pieces_str(int nGold);
        sprintf(infostr, GetStr(0x4FF), nGold, get_pieces_str(nGold));
    }
        break;

    default:
        int s = item[i]._itype;
        if (item[i]._iIdentified) strcpy(infostr, MakeItemStr(&item[i], item[i]._iIName, 256));
        else strcpy(infostr, MakeItemStr(&item[i], item[i]._iName, 256));
        infoclr = 0;
        if (item[i]._iMagical == 1) infoclr = 1;
        if (item[i]._iMagical == IMAGIC_UNIQUE) infoclr = 3;
        break;
    }
}

/* @0x80045D20 ITEMS.CPP:3540 — PSX adds a PlaySfxLoc(0x3D, ...) feedback sound not present in hellfire */
void CheckIdentify(int pnum, int cii)
{
    ItemStruct *pi;
    PlayerStruct *p;

    p = &plr[pnum];
    PlaySfxLoc(0x3D, p->_px, p->_py);
    if (cii < NUM_INVLOC)
        pi = &plr[pnum].InvBody[cii];
    else
        pi = &plr[pnum].InvList[cii - NUM_INVLOC];
    pi->_iIdentified = TRUE;
    CalcPlrInv(pnum, TRUE);

    if (pnum == myplr)
        NewCursor(GLOVE_CURS);
}

/* @0x80045E1C ITEMS.CPP:3555 */
static void RepairItem(ItemStruct *i, int lvl)
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
    if (cii < NUM_INVLOC)
        pi = &p->InvBody[cii];
    else
        pi = &p->InvList[cii - NUM_INVLOC];
    RepairItem(pi, p->_pLevel);
    CalcPlrInv(pnum, TRUE);

    if (pnum == myplr)
        NewCursor(GLOVE_CURS);
}

/* @0x80045FD0 ITEMS.CPP:3601 */
static void RechargeItem(ItemStruct *i, int r)
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

/* @0x80046038 ITEMS.CPP:3391 — PSX: no InvList arm (cii always an InvBody slot), IS_REPAIR sound + a
 * PlaySFX(0x32) confirmation inside the recharge block */
void DoRecharge(int pnum, int cii)
{
    PlayerStruct *p = &plr[pnum];
    ItemStruct *pi;

    PlaySfxLoc(IS_REPAIR, p->_px, p->_py);
    /* both arms are the same address (InvList == InvBody + NUM_INVLOC): gcc cross-jumps them away, the
     * surviving label splits the basic block (retail SYM if-level at +0x78) */
    if (cii < NUM_INVLOC) pi = &p->InvBody[cii];
    else pi = &p->InvList[cii - NUM_INVLOC];
    if ((pi->_itype == IT_STAFF) && (pi->_iSpell != 0)) {
        int r = spelldata[pi->_iSpell].sBookLvl;
        r = ENG_random(p->_pLevel / r) + 1;

        RechargeItem(pi, r);
        CalcPlrInv(pnum, TRUE);
        PlaySFX(0x32);
    }

    if (pnum == myplr) NewCursor(GLOVE_CURS);
}

/* @0x8004615C ITEMS.CPP:3516 — PSX: the per-id description is ONE language-table string (GetStr id), not
 * hellfire's pairs of literal strcpy lines; ids 8/9 have no text */
void PrintItemOil(char IDidx)
{
    int StrVal = -1;

    switch (IDidx) {
    case 2: StrVal = 0x170; break;
    case 3: StrVal = 0x352; break;
    case 4: StrVal = 0x34F; break;
    case 5: StrVal = 0xEA; break;
    case 6: StrVal = 0x351; break;
    case 7: StrVal = 0x172; break;
    case 10: StrVal = 0x215; break;
    case 11: StrVal = 0x214; break;
    case 12: StrVal = 0x213; break;
    case 13: StrVal = 0x216; break;
    case 14:
    case 15: StrVal = 0xF2; break;
    case 16: StrVal = 0xF1; break;
    case 17: StrVal = 0xF3; break;
    case 18: StrVal = 0x350; break;
    case 19: StrVal = 0x171; break;
    }
    if (StrVal != -1) {
        strcpy(tempstr, GetStr(StrVal));
        AddPanelString(tempstr, 1);
    }
}

/* @0x80046258 ITEMS.CPP:3637 — PSX: every power line is a language-table string (GetStr id); numeric
 * parts are appended at tstr (= tempstr + strlen, sometimes backed up over the text's placeholder).
 * PASS: update tstr in place before each sprintf, including backing over placeholders. The
 * instrumented allocator shows these ordinary pointer updates raise tstr(76) from 14 to 28 refs,
 * giving it retail's s1 before x(74) takes s2; bytes, SYM, calls and the jump table all match. */
void PrintItemPower(char plidx, const ItemStruct *x)
{
    int v;
    char *tstr = tempstr;

    if (!x->_iIdentified) return;

    switch (plidx) {
    case 0:
    case 1:
        strcpy(tempstr, GetStr(0xAB));
        tstr += strlen(tempstr);
        sprintf(tstr, "%+i%%", x->_iPLToHit);
        break;
    case 2:
    case 3:
        sprintf(tempstr, "%+i%%", x->_iPLDam);
        strcat(tempstr, GetStr(0xE1));
        break;
    case 4:
    case 5:
        sprintf(tempstr, "%s:%+i%%, %+i%%%s", GetStr(0x495), x->_iPLToHit, x->_iPLDam, GetStr(0xE1));
        break;
    case 6:
    case 7:
        sprintf(tempstr, GetStr(0x525), x->_iPLAC);
        break;
    case 75:
        sprintf(tempstr, GetStr(0x2C), x->_iAC);
        break;
    case 79:
        sprintf(tempstr, GetStr(0x2C), x->_iAC);
        break;
    case 8:
        if (x->_iPLFR < 75) sprintf(tempstr, GetStr(0x364), x->_iPLFR);
        else sprintf(tempstr, GetStr(0x363));
        break;
    case 9:
        if (x->_iPLLR < 75) sprintf(tempstr, GetStr(0x366), x->_iPLLR);
        else sprintf(tempstr, GetStr(0x365));
        break;
    case 10:
        if (x->_iPLMR < 75) sprintf(tempstr, GetStr(0x368), x->_iPLMR);
        else sprintf(tempstr, GetStr(0x367));
        break;
    case 11:
        if (x->_iPLFR < 75) sprintf(tempstr, GetStr(0x362), x->_iPLFR);
        else sprintf(tempstr, GetStr(0x361));
        break;
    case 14:
        if (x->_iSplLvlAdd == 1) strcpy(tempstr, GetStr(0x3F5));
        if (x->_iSplLvlAdd == 2) strcpy(tempstr, GetStr(0x3F6));
        if (x->_iSplLvlAdd < 1) strcpy(tempstr, GetStr(0x3F4));
        break;
    case 15:
        strcpy(tempstr, GetStr(0x137));
        break;
    case 66:
        sprintf(tempstr, GetStr(0x502), x->_iMaxCharges, GetStr(spelldata[x->_iSpell].sNameText));
        break;
    case 16:
        strcpy(tempstr, GetStr(0x155));
        tstr += strlen(tempstr);
        sprintf(tstr, "%i-%i", x->_iFMinDam, x->_iFMaxDam);
        break;
    case 17:
        strcpy(tempstr, GetStr(0x253));
        tstr += strlen(tempstr);
        sprintf(tstr, "%i-%i", x->_iLMinDam, x->_iLMaxDam);
        break;
    case 19:
    case 20:
        sprintf(tempstr, GetStr(0x523), x->_iPLStr);
        break;
    case 21:
    case 22:
        sprintf(tempstr, GetStr(0x522), x->_iPLMag);
        break;
    case 23:
    case 24:
        sprintf(tempstr, GetStr(0x521), x->_iPLDex);
        break;
    case 25:
    case 26:
        sprintf(tempstr, GetStr(0x524), x->_iPLVit);
        break;
    case 27:
    case 28:
        sprintf(tempstr, GetStr(0x520), x->_iPLStr);
        break;
    case 29:
    case 30:
        strcpy(tempstr, GetStr(0x51F));
        tstr += strlen(tempstr);
        tstr -= 3;
        sprintf(tstr, "%+i", x->_iPLGetHit);
        break;
    case 31:
    case 32:
        sprintf(tempstr, GetStr(0x1F4), x->_iPLHP >> 6);
        break;
    case 33:
    case 34:
        sprintf(tempstr, GetStr(0x27F), x->_iPLMana >> 6);
        break;
    case 35:
        strcpy(tempstr, GetStr(0x1EF));
        break;
    case 36:
        strcpy(tempstr, GetStr(0xF0));
        break;
    case 38:
        v = x->_iPLLight * 10;
        sprintf(tempstr, GetStr(0x338), v);
        break;
    case 39:
        v = -x->_iPLLight * 10;
        sprintf(tempstr, GetStr(0x2DD), v);
        break;
    case 42:
        strcpy(tempstr, GetStr(0x151));
        tstr += strlen(tempstr);
        tstr -= 5;
        sprintf(tstr, "%i-%i", x->_iFMinDam, x->_iFMaxDam);
        break;
    case 43:
        strcpy(tempstr, GetStr(0x251));
        tstr += strlen(tempstr);
        tstr -= 5;
        sprintf(tstr, "%i-%i", x->_iLMinDam, x->_iLMaxDam);
        break;
    case 45: strcpy(tempstr, GetStr(0x31)); break;
    case 46: strcpy(tempstr, GetStr(0x4AA)); break;
    case 47: strcpy(tempstr, GetStr(0x4E8)); break;
    case 52: strcpy(tempstr, GetStr(0x5)); break;
    case 53: strcpy(tempstr, GetStr(0x233)); break;
    case 69: strcpy(tempstr, GetStr(0x4FB)); break;
    case 70: strcpy(tempstr, GetStr(0x11)); break;
    case 54: strcpy(tempstr, GetStr(0x1F0)); break;
    case 55:
        if (x->_iFlags & 0x2000) strcpy(tempstr, GetStr(0x1F6));
        if (x->_iFlags & 0x4000) strcpy(tempstr, GetStr(0x1F8));
        break;
    case 56:
        if (x->_iFlags & 0x8000) strcpy(tempstr, GetStr(0x1F5));
        if (x->_iFlags & 0x10000) strcpy(tempstr, GetStr(0x1F7));
        break;
    case 57: strcpy(tempstr, GetStr(0xDF)); break;
    case 58:
        if (x->_iFlags & 0x20000) strcpy(tempstr, GetStr(0x33C));
        if (x->_iFlags & 0x40000) strcpy(tempstr, GetStr(0x145));
        if (x->_iFlags & 0x80000) strcpy(tempstr, GetStr(0x140));
        if (x->_iFlags & 0x100000) strcpy(tempstr, GetStr(0x143));
        break;
    case 59:
        if (x->_iFlags & 0x200000) strcpy(tempstr, GetStr(0x147));
        if (x->_iFlags & 0x400000) strcpy(tempstr, GetStr(0x142));
        if (x->_iFlags & 0x800000) strcpy(tempstr, GetStr(0x144));
        break;
    case 60: strcpy(tempstr, GetStr(0x146)); break;
    case 61:
        strcpy(tempstr, GetStr(0xB));
        tstr += strlen(tempstr);
        sprintf(tstr, "%i", x->_iPLDamMod);
        break;
    case 62: strcpy(tempstr, GetStr(0x14E)); break;
    case 63: strcpy(tempstr, GetStr(0x4A6)); break;
    case 64: strcpy(tempstr, GetStr(0x13)); break;
    case 67: strcpy(tempstr, GetStr(0x141)); break;
    case 68: strcpy(tempstr, GetStr(0x2F1)); break;
    case 72: strcpy(tempstr, GetStr(0xC9)); break;
    case 73: strcpy(tempstr, GetStr(0x24E)); break;
    case 65: strcpy(tempstr, GetStr(0x2DB)); break;
    case 74: strcpy(tempstr, GetStr(0x3B1)); break;
    case 76: strcpy(tempstr, GetStr(0x2B)); break;
    case 77: strcpy(tempstr, GetStr(0)); break;
    case 78:
        if (x->_iPLFR > 0) sprintf(tempstr, GetStr(0x364), x->_iPLFR);
        else tempstr[0] = 0;
        break;
    default:
        tempstr[0] = 0;
        break;
    }
}


/* @0x80046A1C ITEMS.CPP:3994 — PSX: GetStr text ids; scrolls/books add a "can't use" line when the inventory
 * is open and the item is not usable; potions (IMID 1..20) or a usable IDidx 20 get PrintItemOil */
void PrintItemMisc(const ItemStruct *x)
{
    if (x->_iMiscId == IMID_SCROLL) {
        strcpy(tempstr, GetStr(0x32A));
        AddPanelString(tempstr, 1);
        if (invflag && !x->_iStatFlag) AddPanelString(GetStr(0x35E), 1);
    }
    if (x->_iMiscId == IMID_TSCROLL) {
        strcpy(tempstr, GetStr(0x32A));
        AddPanelString(tempstr, 1);
        if (invflag && !x->_iStatFlag) AddPanelString(GetStr(0x35E), 1);
    }
    if (((x->_iMiscId >= 1) && (x->_iMiscId <= 20)) || (x->IDidx == 20 && AllItemsUseable[x->IDidx])) {
        PrintItemOil(x->_iMiscId);
        strcpy(tempstr, GetStr(0x32B));
        AddPanelString(tempstr, 1);
    }
    if (x->_iMiscId == IMID_BOOK) {
        strcpy(tempstr, GetStr(0x32A));
        AddPanelString(tempstr, 1);
        if (invflag && !x->_iStatFlag) AddPanelString(GetStr(0x35E), 1);
    }
    if (x->_iMiscId == IMID_MAPOFDOOM) {
        strcpy(tempstr, GetStr(0x32C));
        AddPanelString(tempstr, 1);
    }
    if (x->_iMiscId == IMID_EAR) {
        sprintf(tempstr, GetStr(0x247), x->_ivalue);
        AddPanelString(tempstr, 1);
    }
}

/* @0x80046C7C ITEMS.CPP:4055 — PSX: weapon line as PrintItemDur; an identified unique armor (other than
 * text 0x2AF) shows only durability (the " x/y," is written over the last 6 chars of text 0x11F);
 * power lines index PL_Prefix/PL_Suffix by the stored table index */
void PrintItemDetails(const ItemStruct *x)
{
    if (x->_iClass == IC_WEAP) {
        if (x->_iMaxDur == INFINITE_DUR)
            sprintf(tempstr, "%s:%i-%i  %s", GetStr(0xE1), x->_iMinDam, x->_iMaxDam, GetStr(0x217));
        else {
            char tsrt[40];
            sprintf(tempstr, "%s:%i-%i  ", GetStr(0xE1), x->_iMinDam, x->_iMaxDam);
            sprintf(tsrt, GetStr(0x11F), x->_iDurability, x->_iMaxDur);
            tsrt[strlen(tsrt) - 1] = 0;
            strcat(tempstr, tsrt);
        }
        AddPanelString(tempstr, 1);
    }
    if (x->_iClass == IC_ARMOR) {
        if (x->_iMagical == IMAGIC_UNIQUE && x->_iIdentified && x->_iIName != 0x2AF) {
            if (x->_iMaxDur == INFINITE_DUR)
                strcpy(tempstr, GetStr(0x217));
            else {
                char *tstr;
                strcpy(tempstr, GetStr(0x11F));
                tstr = &tempstr[strlen(tempstr)];
                sprintf(tstr - 6, "%i/%i,", x->_iDurability, x->_iMaxDur);
            }
        } else {
            if (x->_iMaxDur == INFINITE_DUR)
                sprintf(tempstr, GetStr(0x2E), x->_iAC);
            else
                sprintf(tempstr, GetStr(0x2D), x->_iAC, x->_iDurability, x->_iMaxDur);
        }
        AddPanelString(tempstr, 1);
    }
    if ((x->_iMiscId == IMID_STAFF) && (x->_iMaxCharges != 0)) {
        sprintf(tempstr, GetStr(0xE6), x->_iMinDam, x->_iMaxDam, x->_iDurability, x->_iMaxDur);
        sprintf(tempstr, GetStr(0xB2), x->_iCharges, x->_iMaxCharges);
        AddPanelString(tempstr, 1);
    }
    if (x->_iPrePower != -1) {
        PrintItemPower(PL_Prefix[x->_iPrePower].PLPower, x);
        AddPanelString(tempstr, 1);
    }
    if (x->_iSufPower != -1) {
        PrintItemPower(PL_Suffix[x->_iSufPower].PLPower, x);
        AddPanelString(tempstr, 1);
    }
    if (x->_iMagical == IMAGIC_UNIQUE) {
        AddPanelString(GetStr(0x4A3), 1);
        uitemflag = TRUE;
        curruitem = *x;
    }
    PrintItemMisc(x);
    if ((x->_iMinStr + x->_iMinMag + x->_iMinDex) != 0) {
        strcpy(tempstr, GetStr(0x35D));
        if (x->_iMinStr != 0) sprintf(tempstr, GetStr(0x51C), tempstr, x->_iMinStr);
        if (x->_iMinMag != 0) sprintf(tempstr, GetStr(0x51B), tempstr, x->_iMinMag);
        if (x->_iMinDex != 0) sprintf(tempstr, GetStr(0x51A), tempstr, x->_iMinDex);
        AddPanelString(tempstr, 1);
    }
    pinfoflag = TRUE;
}


/* @0x800470F8 ITEMS.CPP:4153 — PSX: language-table formats; a weapon's durability part is formatted into
 * tsrt, its last char dropped, then appended */
void PrintItemDur(const ItemStruct *x)
{
    if (x->_iClass == IC_WEAP) {
        if (x->_iMaxDur == INFINITE_DUR)
            sprintf(tempstr, "%s:%i-%i  %s", GetStr(0xE1), x->_iMinDam, x->_iMaxDam, GetStr(0x217));
        else {
            char tsrt[40];
            sprintf(tempstr, "%s:%i-%i  ", GetStr(0xE1), x->_iMinDam, x->_iMaxDam);
            sprintf(tsrt, GetStr(0x11F), x->_iDurability, x->_iMaxDur);
            tsrt[strlen(tsrt) - 1] = 0;
            strcat(tempstr, tsrt);
        }
        AddPanelString(tempstr, 1);
        if ((x->_iMiscId == IMID_STAFF) && (x->_iMaxCharges != 0)) {
            sprintf(tempstr, GetStr(0xB2), x->_iCharges, x->_iMaxCharges);
            AddPanelString(tempstr, 1);
        }
        if (x->_iMagical) {
            AddPanelString(GetStr(0x2BF), 1);
        }
    }
    if (x->_iClass == IC_ARMOR) {
        if (x->_iMaxDur == INFINITE_DUR)
            sprintf(tempstr, GetStr(0x2E), x->_iAC);
        else
            sprintf(tempstr, GetStr(0x2D), x->_iAC, x->_iDurability, x->_iMaxDur);
        AddPanelString(tempstr, 1);
        if (x->_iMagical) {
            AddPanelString(GetStr(0x2BF), 1);
        }
        if ((x->_iMiscId == IMID_STAFF) && (x->_iMaxCharges != 0)) {
            sprintf(tempstr, GetStr(0xB2), x->_iCharges, x->_iMaxCharges);
            AddPanelString(tempstr, 1);
        }
    }
    if ((x->_itype == IT_RING) || (x->_itype == IT_AMULET)) {
        AddPanelString(GetStr(0x2BF), 1);
    }
    PrintItemMisc(x);
    if ((x->_iMinStr + x->_iMinMag + x->_iMinDex) != 0) {
        strcpy(tempstr, GetStr(0x35D));
        if (x->_iMinStr != 0) sprintf(tempstr, GetStr(0x51C), tempstr, x->_iMinStr);
        if (x->_iMinMag != 0) sprintf(tempstr, GetStr(0x51B), tempstr, x->_iMinMag);
        if (x->_iMinDex != 0) sprintf(tempstr, GetStr(0x51A), tempstr, x->_iMinDex);
        AddPanelString(tempstr, 1);
    }
    pinfoflag = TRUE;
}


/* @0x80047464 ITEMS.CPP:4234 — PSX-only (hellfire has no CastScroll): pad-driven scroll casting.
 * 1-player: heal other / resurrect refused; 2-player: teleport/phasing refused, heal other / resurrect
 * need the other player (pnum ^ 1) and aim at him */
/* Retail ITEMS.CPP defines ScrollFlag here: its .sdata cell (0x8011B8B8) sits between the
 * PrintItem* format literals and UseItem's "No Ta" literal. */
int ScrollFlag[2] = { 0, 0 };      /* @0x8011B8B8 */

void CastScroll(int pnum, int Spell)
{
    PlayerStruct *ptrplr;

    if (leveltype == DTYPE_TOWN && !spelldata[Spell].sTownSpell) return;
    if (FePlayerNo == 0) {
        if (Spell == SPL_HEALOTHER || Spell == SPL_RESURRECT) {
            PlaySFX(0x3D3);
            return;
        }
    } else {
        if (Spell == SPL_TELE || Spell == SPL_PHASE) {
            PlaySFX(0x3D3);
            return;
        }
        if ((Spell == SPL_RESURRECT || Spell == SPL_HEALOTHER) && plr[pnum ^ 1].plractive) return;
    }
    ScrollFlag[pnum] = TRUE;
    if (Spell == 5 && invflag) {
        NewCursor(2);
        ScrollFlag[pnum] = FALSE;
    } else invflag = FALSE;

    ptrplr = &plr[pnum];
    ptrplr->_pSplType = RSPLTYPE_SCROLL;
    ptrplr->_pSpell = Spell;
    /* the if-level is record-less (its BLOCK note hoists to the basic-block start +0x148); dx/dy live in
     * the else-block */
    if (TargetingSpell(Spell)) {
        ptrplr->_pTSplType = RSPLTYPE_SCROLL;
        ptrplr->_pTSpell = Spell;
        InitTargetCursor(pnum);
    } else {
        int dx = ptrplr->_px + offset_x[ptrplr->_pdir];
        int dy = ptrplr->_py + offset_y[ptrplr->_pdir];
        if (FePlayerNo == 0 && (Spell == SPL_HEALOTHER || Spell == SPL_RESURRECT)) return;
        if (Spell == SPL_HEALOTHER || Spell == SPL_RESURRECT) {
            dx = plr[pnum ^ 1]._px;
            dy = plr[pnum ^ 1]._py;
            _pcursplr[sel_data] = pnum ^ 1;
        }
        StartSpell(ptrplr, 0, dx, dy);
    }
}


/* @0x800476F0 ITEMS.CPP:4313 — hellfire's case set/order through a cached ptrplr; PSX: potions scale by
 * <<6 (HP/MANA shift), rogue +50% / warrior x2 / sorcerer x2 only, mana potion uses |MaxMana>>8| and
 * at least 1, no mana on EMAG / no heal on EVIT, scrolls go through CastScroll */
void UseItem(int p, int Mid, int spl)
{
    long l;
    unsigned long long t;
    PlayerStruct *ptrplr = &plr[p];

    switch (Mid) {
    case IMID_MEAT:
    case IMID_HEAL:
        l = ptrplr->_pMaxHP >> 8;
        l = ((ENG_random(l) + (l >> 1)) << 6);
        if (ptrplr->_pClass == PC_WARRIOR) l = l << 1;
        if (ptrplr->_pClass == PC_ROGUE) l += (l >> 1);
        ptrplr->_pHitPoints += l;
        if (ptrplr->_pHitPoints > ptrplr->_pMaxHP) ptrplr->_pHitPoints = ptrplr->_pMaxHP;
        ptrplr->_pHPBase += l;
        if (ptrplr->_pHPBase > ptrplr->_pMaxHPBase) ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
        drawhpflag = TRUE;
        break;
    case IMID_FULLHEAL:
        ptrplr->_pHitPoints = ptrplr->_pMaxHP;
        ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
        drawhpflag = TRUE;
        break;
    case IMID_MANA:
        l = ptrplr->_pMaxMana >> 8;
        if (l < 0) l = -l;
        l = ((ENG_random(l) + (l >> 1)) << 6);
        if (ptrplr->_pClass == PC_SORCERER) l = l << 1;
        if (ptrplr->_pClass == PC_ROGUE) l += (l >> 1);
        if (l <= 0) l = 1;
        if (!(ptrplr->_pIFlags & IAF_LMANA)) {
            ptrplr->_pMana += l;
            if (ptrplr->_pMana > ptrplr->_pMaxMana) ptrplr->_pMana = ptrplr->_pMaxMana;
            ptrplr->_pManaBase += l;
            if (ptrplr->_pManaBase > ptrplr->_pMaxManaBase) ptrplr->_pManaBase = ptrplr->_pMaxManaBase;
            drawmanaflag = TRUE;
        }
        break;
    case IMID_FULLMANA:
        if (!(ptrplr->_pIFlags & IAF_LMANA)) {
            ptrplr->_pMana = ptrplr->_pMaxMana;
            ptrplr->_pManaBase = ptrplr->_pMaxManaBase;
            drawmanaflag = TRUE;
        }
        break;
    case IMID_ESTR:
        ModifyPlrStr(p, 1);
        break;
    case IMID_EMAG:
        ModifyPlrMag(p, 1);
        break;
    case IMID_EDEX:
        ModifyPlrDex(p, 1);
        break;
    case IMID_EVIT:
        ModifyPlrVit(p, 1);
        break;
    case IMID_BOOK:
        t = 1;
        ptrplr->_pMemSpells |= (t << (spl - 1));
        if (ptrplr->_pSplLvl[spl] < SPELLCAP) ptrplr->_pSplLvl[spl]++;
        ptrplr->_pMana += spelldata[spl].sManaCost << 6;
        if (ptrplr->_pMana > ptrplr->_pMaxMana) ptrplr->_pMana = ptrplr->_pMaxMana;
        ptrplr->_pManaBase += spelldata[spl].sManaCost << 6;
        if (ptrplr->_pManaBase > ptrplr->_pMaxManaBase) ptrplr->_pManaBase = ptrplr->_pMaxManaBase;
        if (p == myplr) CalcPlrBookVals(p);
        drawmanaflag = TRUE;
        break;
    case IMID_REJUV:
        l = ptrplr->_pMaxHP >> 8;
        l = ((ENG_random(l) + (l >> 1)) << 6);
        if (ptrplr->_pClass == PC_WARRIOR) l = l << 1;
        if (ptrplr->_pClass == PC_ROGUE) l += (l >> 1);
        ptrplr->_pHitPoints += l;
        if (ptrplr->_pHitPoints > ptrplr->_pMaxHP) ptrplr->_pHitPoints = ptrplr->_pMaxHP;
        ptrplr->_pHPBase += l;
        if (ptrplr->_pHPBase > ptrplr->_pMaxHPBase) ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
        drawhpflag = TRUE;
        l = ptrplr->_pMaxMana >> 8;
        l = ((ENG_random(l) + (l >> 1)) << 6);
        if (ptrplr->_pClass == PC_SORCERER) l = l << 1;
        if (ptrplr->_pClass == PC_ROGUE) l += (l >> 1);
        if (!(ptrplr->_pIFlags & IAF_LMANA)) {
            ptrplr->_pMana += l;
            if (ptrplr->_pMana > ptrplr->_pMaxMana) ptrplr->_pMana = ptrplr->_pMaxMana;
            ptrplr->_pManaBase += l;
            if (ptrplr->_pManaBase > ptrplr->_pMaxManaBase) ptrplr->_pManaBase = ptrplr->_pMaxManaBase;
            drawmanaflag = TRUE;
        }
        break;
    case IMID_FREJUV:
        ptrplr->_pHitPoints = ptrplr->_pMaxHP;
        ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
        drawhpflag = TRUE;
        if (!(ptrplr->_pIFlags & IAF_LMANA)) {
            ptrplr->_pMana = ptrplr->_pMaxMana;
            ptrplr->_pManaBase = ptrplr->_pMaxManaBase;
            drawmanaflag = TRUE;
        }
        break;
    case IMID_SCROLL:
        if (spelldata[spl].sTargeted) {
            ptrplr->_pTSpell = spl;
            ptrplr->_pTSplType = SPT_NONE;
        } else {
            ClrPlrPath(p);
            ptrplr->_pSpell = spl;
            ptrplr->_pTSplType = SPT_NONE;
            ptrplr->_pSplFrom = SPL_FROMSB;
            ptrplr->destParam1 = cursmx;
            ptrplr->destParam2 = cursmy;
        }
        CastScroll(p, spl);
        break;
    case IMID_TSCROLL:
        if (spelldata[spl].sTargeted) {
            ptrplr->_pTSpell = spl;
            ptrplr->_pTSplType = SPT_NONE;
        } else {
            ClrPlrPath(p);
            ptrplr->_pSpell = spl;
            ptrplr->_pSplType = SPT_NONE;
            ptrplr->_pSplFrom = SPL_FROMSB;
            ptrplr->destParam1 = cursmx;
            ptrplr->destParam2 = cursmy;
        }
        CastScroll(p, spl);
        break;
    case IMID_MAPOFDOOM:
        if (!(!"No Ta")) DBG_Error(NULL, "source/ITEMS.cpp", 4499);
        break;
    case IMID_SPECTRAL:
        ModifyPlrStr(p, 3);
        ModifyPlrMag(p, 3);
        ModifyPlrDex(p, 3);
        ModifyPlrVit(p, 3);
        break;
    }
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


/* @0x80047F18 ITEMS.CPP:4602 — the Diablo 1.0x form (no player-stat caps / noSpells), per-player store,
 * _PlrCreate = FePlayerNo */
void SpawnOnePremium(int i, int plvl)
{
    int itype;
    int maxval;
    ItemStruct holditem;

    holditem = item[0];
    maxval = 140000;
    if (plvl > 30) plvl = 30;
    if (plvl < 1) plvl = 1;

    do {
        item[0]._iSeed = GetRndSeed();
        SetRndSeed(item[0]._iSeed);
        itype = RndPremiumItem(plvl >> 2, plvl) - 1;
        GetItemAttrs(0, itype, plvl);
        GetItemBonus(0, itype, plvl >> 1, plvl, TRUE);
    } while (item[0]._iIvalue > maxval);
    premiumitem[i] = item[0];
    premiumitem[i]._iCreateInfo = plvl | ICI_PREMIUM;
    premiumitem[i]._PlrCreate = FePlayerNo;
    premiumitem[i]._iIdentified = TRUE;
    premiumitem[i]._iStatFlag = StoreStatOk(&premiumitem[i]);
    item[0] = holditem;
}

/* @0x8004820C ITEMS.CPP:4651 — MAXPREMIUM = 6 on PSX (shift 2/3/4/5 down, respawn slots 3 and 5) */
void SpawnPremium(int lvl)
{
    int i;

    if (numpremium < MAXPREMIUM) {
        for (i = 0; i < MAXPREMIUM; i++) {
            if (premiumitem[i]._itype == -1)
                SpawnOnePremium(i, premiumlevel + premiumlvladd[i]);
        }
        numpremium = MAXPREMIUM;
    }
    while (premiumlevel < lvl) {
        premiumlevel++;
        premiumitem[0] = premiumitem[2];
        premiumitem[1] = premiumitem[3];
        premiumitem[2] = premiumitem[4];
        SpawnOnePremium(3, premiumlevel + premiumlvladd[3]);
        premiumitem[4] = premiumitem[5];
        SpawnOnePremium(5, premiumlevel + premiumlvladd[5]);
    }
}

/* @0x800485AC ITEMS.CPP:4683 — hellfire verbatim on the per-player witchitem[] */
void WitchBookLevel(int ii)
{
    if (witchitem[ii]._iMiscId != IMID_BOOK)
        return;

    witchitem[ii]._iMinMag = spelldata[witchitem[ii]._iSpell].sMinInt;
    int slvl = plr[myplr]._pSplLvl[witchitem[ii]._iSpell];

    while (slvl != 0) {
        witchitem[ii]._iMinMag += ((witchitem[ii]._iMinMag * 20) / 100);
        slvl--;
        if ((witchitem[ii]._iMinMag + ((witchitem[ii]._iMinMag * 20) / 100)) > 255) {
            witchitem[ii]._iMinMag = 255;
            slvl = 0;
        }
    }
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

/* @0x80048BA0 ITEMS.CPP:4832 — PSX-specific rewrite: no hellfire equivalent shape (no bookminlevel/
 * spelldata precheck); instead a do/while re-rolls SetupAllItems until the item is a book of the right
 * spell, same idiom as CreateMagicWeapon/CreateMagicArmor */
void CreateSpellBook(int x, int y, int ispell, unsigned char sendmsg, unsigned char delta)
{
    int ii, idx;
    unsigned char done = FALSE;

    idx = RndTypeItems(IT_MISC, IMID_BOOK);
    if (numitems < MAXITEMS) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        do {
            SetupAllItems(ii, idx, GetRndSeed(), currlevel << 1, 1, 1, 0, delta);
            if (item[ii]._iMiscId == IMID_BOOK && item[ii]._iSpell == ispell) done = TRUE;
        } while (!done);
        if (sendmsg) NetSendCmdDItem(0, ii);
        if (delta) DeltaAddItem(ii);
        numitems++;
    }
}

/* @0x80048D30 — PSX: no GetEffLevel() call, currlevel used inline; RndTypeItems takes only
 * (itype, imid) on PSX, third efflevel arg dropped (matches RndTypeItems__Fii elsewhere) */
void CreateMagicArmor(int x, int y, int imisc, int icurs, unsigned char sendmsg, unsigned char delta)
{
    int ii, idx;
    unsigned char done = FALSE;

    if (numitems < MAXITEMS) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        idx = RndTypeItems(imisc, IMID_NONE);
        do {
            SetupAllItems(ii, idx, GetRndSeed(), currlevel << 1, 1, 1, 0, delta);
            if (item[ii]._iCurs == icurs) done = TRUE;
            else idx = RndTypeItems(imisc, IMID_NONE);
        } while (!done);
        if (sendmsg) NetSendCmdDItem(0, ii);
        if (delta) DeltaAddItem(ii);
        numitems++;
    }
}

/* @0x80048EAC — PSX: same shape as CreateMagicArmor; hellfire's IT_STAFF->IMID_STAFF special
 * case is dropped, RndTypeItems always called with IMID_NONE (2-arg form, no efflevel) */
void CreateMagicWeapon(int x, int y, int imisc, int icurs, unsigned char sendmsg, unsigned char delta)
{
    int ii, idx;
    unsigned char done = FALSE;

    if (numitems < MAXITEMS) {
        ii = itemavail[0];
        GetSuperItemSpace(x, y, ii);
        itemavail[0] = itemavail[MAXITEMS - numitems - 1];
        itemactive[numitems] = ii;
        idx = RndTypeItems(imisc, IMID_NONE);
        do {
            SetupAllItems(ii, idx, GetRndSeed(), currlevel << 1, 1, 1, 0, delta);
            if (item[ii]._iCurs == icurs) done = TRUE;
            else idx = RndTypeItems(imisc, IMID_NONE);
        } while (!done);
        if (sendmsg) NetSendCmdDItem(0, ii);
        if (delta) DeltaAddItem(ii);
        numitems++;
    }
}

/* @0x8012EC58 (bss) — file-static in retail (no SYM EXT record; the oracle reaches it as D_8012EC8C) */

/* @0x80049028 ITEMS.CPP:5051 — PSX: no chrflag/questlog gate, no DrawUBack/PrintUString/DrawULine
 * (the unique info goes through the item panel strings: AddPanelString per power) */
void DrawUniqueInfo(void)
{
    int u;

    u = curruitem._iUid;
    PrintItemPower(UniqueItemList[u].UIPower1, &curruitem);
    AddPanelString(tempstr, 1);
    if (UniqueItemList[u].UINumPL > 1) {
        PrintItemPower(UniqueItemList[u].UIPower2, &curruitem);
        AddPanelString(tempstr, 1);
    }
    if (UniqueItemList[u].UINumPL > 2) {
        PrintItemPower(UniqueItemList[u].UIPower3, &curruitem);
        AddPanelString(tempstr, 1);
    }
    if (UniqueItemList[u].UINumPL > 3) {
        PrintItemPower(UniqueItemList[u].UIPower4, &curruitem);
        AddPanelString(tempstr, 1);
    }
    if (UniqueItemList[u].UINumPL > 4) {
        PrintItemPower(UniqueItemList[u].UIPower5, &curruitem);
        AddPanelString(tempstr, 1);
    }
    if (UniqueItemList[u].UINumPL > 5) {
        PrintItemPower(UniqueItemList[u].UIPower6, &curruitem);
        AddPanelString(tempstr, 1);
    }
}

/* @0x80049198 ITEMS.CPP:5246 — PSX-only: builds the displayed item name from text ids per language
 * (LANG_GetLang: 0/3 prefix-name-suffix fmt 0x516, 1 name-prefix-suffix, 2 prefix[-]name "%s %s",
 * 4 via ltstr + 0x2E0). Uniques return the plain name — in the local ItemStr (retail returns a
 * pointer to its own stack array there). */
char *MakeItemStr(ItemStruct *ItemPtr, unsigned short ItemNo, unsigned short MaxLen)
{
    int PreIdx, SufIdx;
    char PreStr[64];
    char ItemStr[64];
    char SufStr[64];
    char ltstr[64];

    if (ItemPtr->_iMiscId == IMID_UNIQUE || ItemPtr->_iMagical == IMAGIC_UNIQUE) {
        strcpy(ItemStr, GetStr(ItemNo));
        return ItemStr;
    }
    SufIdx = -1;
    PreIdx = -1;
    if (ItemPtr->_iIdentified) {
        PreIdx = ItemPtr->_iPrePower;
        SufIdx = ItemPtr->_iSufPower;
    }
    PreStr[0] = 0;
    ItemStr[0] = 0;
    SufStr[0] = 0;
    OutStr[0] = 0;
    if (PreIdx != -1) strcpy(PreStr, GetStr(PL_Prefix[PreIdx].PLName));
    if (SufIdx != -1) strcpy(SufStr, GetStr(PL_Suffix[SufIdx].PLName));

    switch (ItemPtr->_iMiscId) {
    case IMID_STAFF:
        if (ItemNo == 0x3CA) {
            strcpy(ItemStr, GetStr(0x3CA));
        } else if (ItemPtr->_iSpell) {
            strcat(ItemStr, GetStr(0x402));
            strcpy(SufStr, GetStr(spelldata[ItemPtr->_iSpell].sNameText));
        } else strcat(ItemStr, GetStr(ItemNo));
        break;
    case 0:     /* table bounds: the retail switch spans 0..44 (jump table) */
    case 1:
    case 44:
        strcat(ItemStr, GetStr(ItemNo));
        break;
    case IMID_BOOK:
        strcat(ItemStr, GetStr(0x7C));
        if (LANG_GetLang()) strcat(ItemStr, " ");
        strcat(ItemStr, GetStr(ItemNo));
        break;
    default:
        strcat(ItemStr, GetStr(ItemNo));
        break;
    }

    switch (LANG_GetLang()) {
    case 1:
        strcat(OutStr, ItemStr);
        strcat(OutStr, " ");
        if (PreStr[0]) strcat(OutStr, PreStr);
        strcat(OutStr, " ");
        if (SufStr[0]) strcat(OutStr, SufStr);
        break;
    case 2:
        if (PreStr[0]) {
            strcat(OutStr, PreStr);
            if (MediumFont.GetStrWidth(PreStr) + MediumFont.GetStrWidth(ItemStr) >= 0x95) strcat(OutStr, "-");
        }
        strcat(OutStr, ItemStr);
        if (SufStr[0]) sprintf(OutStr, "%s %s", OutStr, SufStr);
        break;
    case 0:
    case 3:
        if (PreStr[0]) {
            strcat(OutStr, PreStr);
            strcat(OutStr, " ");
        }
        strcat(OutStr, ItemStr);
        if (SufStr[0]) sprintf(OutStr, GetStr(0x516), OutStr, SufStr);
        break;
    case 4:
        if (PreStr[0]) {
            strcat(OutStr, PreStr);
            strcat(OutStr, GetStr(0x2B1));
        }
        strcat(OutStr, ItemStr);
        strcpy(ltstr, OutStr);
        if (SufStr[0]) sprintf(OutStr, "%s %s %s", ltstr, GetStr(0x2E0), SufStr);
        break;
    case 5:
        break;
    }
    return OutStr;
}

/* @0x80049608 ITEMS.CPP:4752 — PSX drops the "&& iSpell!=0" qualifier on the IT_STAFF check (the whole
 * oil-selling comment block is compiled out on both platforms) */
/* Defined after MakeItemStr in retail: both cells follow its "%s %s" literal (0x8011B8D8/0x8011B8DC). */
BOOL FIRSTTIME = TRUE;             /* @0x8011B8D8 */
unsigned char uitemflag = 0;       /* @0x8011B8DC */

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

/* @0x80049804 ITEMS.CPP:5075 — PSX rewrite, no hellfire equivalent of this shape: a pre-pass finds the
 * first IMID_PMANA item (network-safe substitute); the main loop swaps SPL_RESURRECT/SPL_HEALOTHER (when
 * FePlayerNo==0, i.e. host) or SPL_PHASE/SPL_TELE (when FePlayerNo!=0, i.e. client) scroll ids for that
 * substitute item so the two sides of a multiplayer game don't roll different randoms for quest-critical
 * scrolls */
int RndWitchItem(int lvl)
{
    int ril[512];
    int ri, i;
    int pi = 0;

    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iMiscId == IMID_PMANA && !pi) pi = i;
    }

    ri = 0;
    for (i = 1; AllItemsList[i].iLoc != -1; i++) {
        if (AllItemsList[i].iRnd && WitchItemOk(i) && (lvl >= AllItemsList[i].iMinMLvl)) {
            int is = i;
            if (FePlayerNo == 0) {
                if (AllItemsList[i].iSpell == SPL_RESURRECT || AllItemsList[i].iSpell == SPL_HEALOTHER) is = pi;
            } else {
                if (AllItemsList[i].iSpell == SPL_PHASE || AllItemsList[i].iSpell == SPL_TELE) is = pi;
            }
            ril[ri++] = is;
        }
    }
    return ril[ENG_random(ri)] + 1;
}

/* @0x800499B0 ITEMS.CPP:4796 */
void BubbleSwapItem(ItemStruct *a, ItemStruct *b)
{
    ItemStruct h;

    h = *a;
    *a = *b;
    *b = h;
}

/* @0x80049AB8 ITEMS.CPP:5095 — `_witchitem[StorePlrNo]` in place of hellfire's flat `witchitem` */
void SortWitch(void)
{
    int j, k;
    unsigned char sorted;

    for (k = 3; _witchitem[StorePlrNo][k + 1]._itype != -1 && k + 1 < 20; k++)
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


/* @0x8004A540 ITEMS.CPP:5883 — Diablo 1.0x form, 20 slots, no itype local, _PlrCreate = FePlayerNo last */
void SpawnSmith(int lvl)
{
    int i, nsi;
    ItemStruct holditem = item[0];

    nsi = ENG_random(MAXSMITHITEMS - 10) + 10;
    for (i = 0; i < nsi; i++) {
        do {
            item[0]._iSeed = GetRndSeed();
            SetRndSeed(item[0]._iSeed);
            GetItemAttrs(0, RndSmithItem(lvl) - 1, lvl);
        } while (item[0]._iIvalue > 140000);
        smithitem[i] = item[0];
        smithitem[i]._iCreateInfo = lvl | ICI_SMITH;
        smithitem[i]._iIdentified = TRUE;
        smithitem[i]._iStatFlag = StoreStatOk(&smithitem[i]);
        smithitem[i]._PlrCreate = FePlayerNo;
    }
    for (i = nsi; i < MAXSMITHITEMS; i++) smithitem[i]._itype = -1;
    SortSmith();
    item[0] = holditem;
}


/* @0x8004A86C ITEMS.CPP:5924 — Diablo 1.0x shape (no book pass, witchitem 0..2 premade) on the
 * per-player witchitem, item[0] saved/restored, _PlrCreate = FePlayerNo */
void SpawnWitch(int lvl)
{
    int itype, iblvl;
    int i, nsi;
    ItemStruct holditem = item[0];

    GetItemAttrs(0, IDI_MANA, 1);
    witchitem[0] = item[0];
    witchitem[0]._iCreateInfo = lvl;
    witchitem[0]._iStatFlag = TRUE;
    GetItemAttrs(0, IDI_FULLMANA, 1);
    witchitem[1] = item[0];
    witchitem[1]._iCreateInfo = lvl;
    witchitem[1]._iStatFlag = TRUE;
    GetItemAttrs(0, IDI_PORTAL, 1);
    witchitem[2] = item[0];
    witchitem[2]._iCreateInfo = lvl;
    witchitem[2]._iStatFlag = TRUE;
    nsi = ENG_random(MAXWITCHITEMS - 12) + 10;
    for (i = 3; i < nsi; i++) {
        do {
            item[0]._iSeed = GetRndSeed();
            SetRndSeed(item[0]._iSeed);
            itype = RndWitchItem(lvl) - 1;
            GetItemAttrs(0, itype, lvl);
            iblvl = -1;
            if (ENG_random(100) <= 5) iblvl = lvl << 1;
            if ((iblvl == -1) && (item[0]._iMiscId == IMID_STAFF)) iblvl = lvl << 1;
            if (iblvl != -1) GetItemBonus(0, itype, iblvl >> 1, iblvl, TRUE);
        } while (item[0]._iIvalue > 140000);
        witchitem[i] = item[0];
        witchitem[i]._iCreateInfo = lvl | ICI_WITCH;
        witchitem[i]._PlrCreate = FePlayerNo;
        witchitem[i]._iIdentified = TRUE;
        WitchBookLevel(i);
        witchitem[i]._iStatFlag = StoreStatOk(&witchitem[i]);
    }
    for (i = nsi; i < MAXWITCHITEMS; i++) witchitem[i]._itype = -1;
    SortWitch();
    item[0] = holditem;
}


/* @0x8004AE5C ITEMS.CPP:5993 — hellfire on the per-player healitem; 2-player (FePlayerNo) adds the
 * resurrect scroll; item[0] saved/restored; no itype local; _PlrCreate = FePlayerNo */
void SpawnHealer(int lvl)
{
    int i, nsi, srnd;
    ItemStruct holditem = item[0];

    GetItemAttrs(0, IDI_HEAL, 1);
    healitem[0] = item[0];
    healitem[0]._iCreateInfo = lvl;
    healitem[0]._iStatFlag = TRUE;
    GetItemAttrs(0, IDI_FULLHEAL, 1);
    healitem[1] = item[0];
    healitem[1]._iCreateInfo = lvl;
    healitem[1]._iStatFlag = TRUE;
    if (FePlayerNo != 0) {
        GetItemAttrs(0, IDI_RESURRECT, 1);
        healitem[2] = item[0];
        healitem[2]._iCreateInfo = lvl;
        healitem[2]._iStatFlag = TRUE;
        srnd = 3;
    } else srnd = 2;

    nsi = ENG_random(MAXHEALITEMS - 12) + 10;
    for (i = srnd; i < nsi; i++) {
        item[0]._iSeed = GetRndSeed();
        SetRndSeed(item[0]._iSeed);
        GetItemAttrs(0, RndHealerItem(lvl) - 1, lvl);
        healitem[i] = item[0];
        healitem[i]._iCreateInfo = lvl | ICI_HEALER;
        healitem[i]._PlrCreate = FePlayerNo;
        healitem[i]._iIdentified = TRUE;
        healitem[i]._iStatFlag = StoreStatOk(&healitem[i]);
    }
    for (i = nsi; i < MAXHEALITEMS; i++) healitem[i]._itype = -1;
    SortHealer();
    item[0] = holditem;
}

/* @0x8004B3FC ITEMS.CPP:6047 — Diablo 1.0x form (BOY_MAX_VALUE 90000), per-player boyitem/boylevel */
void SpawnBoy(int lvl)
{
    int itype;
    ItemStruct holditem = item[0];

    if (boylevel < (lvl >> 1) || boyitem._itype == -1) {
        do {
            item[0]._iSeed = GetRndSeed();
            SetRndSeed(item[0]._iSeed);
            itype = RndBoyItem(lvl) - 1;
            GetItemAttrs(0, itype, lvl);
            GetItemBonus(0, itype, lvl, 2 * lvl, TRUE);
        } while (item[0]._iIvalue > 90000);
        boyitem = item[0];
        boyitem._iCreateInfo = lvl | ICI_BOY;
        boyitem._PlrCreate = FePlayerNo;
        boyitem._iIdentified = TRUE;
        boyitem._iStatFlag = StoreStatOk(&boyitem);
        boylevel = lvl >> 1;
    }
    item[0] = holditem;
}

/* @0x8004B700 ITEMS.CPP:4808 — PSX uses the per-player `_smithitem[StorePlrNo]` array in place of
 * hellfire's flat `smithitem` global; PSX bounds the end scan at 20 slots (k + 1 < 20) */
void SortSmith(void)
{
    int j, k;
    unsigned char sorted;

    for (k = 0; _smithitem[StorePlrNo][k + 1]._itype != -1 && k + 1 < 20; k++)
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

/* @0x8004B884 ITEMS.CPP:5434 — `_healitem[StorePlrNo]` in place of hellfire's flat `healitem` */
void SortHealer(void)
{
    int j, k;
    unsigned char sorted;

    for (k = 2; _healitem[StorePlrNo][k + 1]._itype != -1 && k + 1 < 20; k++)
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

/* @0x8004BA14 ITEMS.CPP:6127 — PSX adds a 6th param `PlrCreate`: if != -1, temporarily overrides
 * FePlayerNo for the duration of this call (so the nested GetItemAttrs/SetupAllItems/etc. network-safety
 * checks act as if running as that player), restoring it afterward; sets item[ii]._PlrCreate = the
 * (possibly-overridden) FePlayerNo just before restoring. Field-store order in the GOLD arm is
 * ivalue/createinfo/seed (not hellfire's seed/createinfo/ivalue). */
/* The early uavail normalization is overwritten in the dungeon-item arm, but it is part of the
 * original source shape: GCC removes the dead stores late while retaining retail's hoisted UNIQUE mask. */
void RecreateItem(int ii, int idx, unsigned short icreateinfo, int iseed, int ivalue, int PlrCreate)
{
    int OldFePlayerNo = FePlayerNo;
    int uper;
    unsigned char onlygood, uavail, pregen;

    FePlayerNo = OldFePlayerNo;
    if (PlrCreate != -1) FePlayerNo = PlrCreate;
    if (icreateinfo & ICI_UNIQUE)
        uavail = TRUE;
    else
        uavail = FALSE;

    if (idx == IDI_GOLD) {
        SetPlrHandItem(&item[ii], idx);
        item[ii]._ivalue = ivalue;
        item[ii]._iCreateInfo = icreateinfo;
        item[ii]._iSeed = iseed;
        if (item[ii]._ivalue >= GOLD_VT2) {
            item[ii]._iCurs = ITEM_5GOLD;
        } else {
            if (ivalue <= GOLD_VT1) item[ii]._iCurs = ITEM_1GOLD;
            else item[ii]._iCurs = ITEM_3GOLD;
        }
    } else {
        if (icreateinfo == 0) {
            SetPlrHandItem(&item[ii], idx);
            SetPlrHandSeed(&item[ii], iseed);
        } else {
            if (icreateinfo & ICI_TOWNMASK) RecreateTownItem(ii, idx, icreateinfo, iseed, ivalue);
            else {
                if ((icreateinfo & ICI_USEFUL) == ICI_USEFUL) {
                    SetupAllUseful(ii, iseed, icreateinfo & ICI_LVLMASK);
                } else {
                    uper = 0;
                    onlygood = FALSE;
                    uavail = FALSE;
                    pregen = FALSE;
                    if (icreateinfo & ICI_UPER1) uper = 1;
                    if (icreateinfo & ICI_UPER15) uper = 15;
                    if (icreateinfo & ICI_ONLYGOOD) onlygood = TRUE;
                    if (icreateinfo & ICI_UNIQUE) uavail = TRUE;
                    if (icreateinfo & ICI_PREGEN) pregen = TRUE;
                    SetupAllItems(ii, idx, iseed, icreateinfo & ICI_LVLMASK, uper, onlygood, uavail, pregen);
                }
            }
        }
    }

    item[ii]._PlrCreate = FePlayerNo;
    FePlayerNo = OldFePlayerNo;
}
