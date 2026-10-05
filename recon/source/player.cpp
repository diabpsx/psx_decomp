/* PLAYER.CPP -- Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/PLAYER.CPP
 * (original Synergistic/Blizzard source -- BEST twin per 00_current_diablo.md checkpoint q: keeps
 * PSX's line numbers/decl order/parenthesisation for most of this file) with refs/devilution and
 * refs/devilutionx/Source/player.cpp as secondary twins (used where Hellfire's added Hive/Crypt/
 * multiplayer content makes it diverge from the shorter PSX body -- flagged per function below).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_player.h"
#include "source/gen/externs_player.h"
#include "source/gen/protos_player.h"

extern "C" unsigned char GAL_Free(long Handle);

inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd))
            DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

class CPlayerHeaderProducer {
public:
    static void Check(int PNum)
    {
        if (1 < (unsigned int)PNum)
            DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
    }
};

/* File-local functions: retail SYM gives these class STAT (static); no other TU calls them. */
static void ArmorDur(PlayerStruct *ptrplr);   /* @0x80064320 PLAYER.CPP:3326 */
static void CheckCheatStats(PlayerStruct *ptrplr);   /* @0x800650CC PLAYER.CPP:3877 */
static void PlrDeadItem(PlayerStruct *ptrplr, ItemStruct *itm, int xx, int yy);   /* @0x800615DC PLAYER.CPP:1987 */
static void PRIM_GetPrim(POLY_FT4 **Prim);
#include "source/diablo.h"

/* ---- local constants (values confirmed from the oracle / hellfire source) ---- */
#define MAXCHARLEVEL 51
#define MAX_PLRS 2   /* PSX split-screen caps at 2 local players (devilution/hellfire MAX_PLRS=4) */
#define NUM_CLASSES 3
#define MAXBELTITEMS 8
#define NUM_INV_GRID_ELEM 40

/* _pmode set (see PLR_MODE in structs_player.h) */

/* class ids (_pClass) */
#define CLASS_WARRIOR   0
#define CLASS_ROGUE     1
#define CLASS_SORCERER  2

#define TRUE  1
#define FALSE 0

/* dungeon types (leveltype) */
#define DTYPE_TOWN       0
#define DTYPE_CATHEDRAL  1
#define DTYPE_CATACOMBS  2
#define DTYPE_CAVES      3
#define DTYPE_HELL       4

/* directions (matches source/diablo.h DIR_*) */

/* item space / drop directions probe table (see plrxoff2/plryoff2 externs) */

/* ---- PSX split-screen (2-player local) helpers -- no PC twin, transcribed from the oracle ---- */


#define ISPL_NOMANA 0x8000000
#define MAXEXP 2000000000L
#define CMD_PLRLEVEL 0x33
#define MIS_TOWNPORTAL 13
#define INVLOC_HEAD 0
#define INVLOC_HAND_LEFT 4
#define INVLOC_HAND_RIGHT 5
#define ITYPE_NONE (-1)
#define ITYPE_SHIELD 5
#define DUR_INDESTRUCTIBLE 255
#define INVLOC_CHEST 6
#define ISPL_FASTBLOCK 0x1000000
#define ISPL_FIRE_ARROWS 0x8
#define ISPL_LIGHT_ARROWS 0x2000000
#define MIS_ARROW 0
#define MIS_FARROW 0x1B
#define MIS_LARROW 0x38
#define ICLASS_WEAPON 1
struct P_TAG { unsigned addr : 24; unsigned len : 8; unsigned char r0, g0, b0, code; };
#define setaddr(p, _addr)	(((P_TAG *)(p))->addr = (unsigned long)(_addr))
#define setcode(p, _code)	(((P_TAG *)(p))->code = (unsigned char)(_code))
#define getcode(p)   		(unsigned char)(((P_TAG *)(p))->code)
#define getaddr(p)   		(unsigned long)(((P_TAG *)(p))->addr)
#define addPrim(ot, p)		setaddr(p, getaddr(ot)), setaddr(ot, p)
#define setSemiTrans(p, abe) 	((abe)?setcode(p, getcode(p)|0x02):setcode(p, getcode(p)&~0x02))
#define setShadeTex(p, tge) 	((tge)?setcode(p, getcode(p)|0x01):setcode(p, getcode(p)&~0x01))
#define setRGB0(p, _r0, _g0, _b0) (p)->r0 = _r0, (p)->g0 = _g0, (p)->b0 = _b0

int plrxoff[9] = { 0, 2, 0, 2, 1, 0, 1, 2, 1 };
int plryoff[9] = { 0, 2, 2, 0, 1, 1, 0, 1, 2 };
int plrxoff2[9] = { 0, 1, 0, 1, 2, 0, 1, 2, 2 };
int plryoff2[9] = { 0, 0, 1, 1, 0, 2, 2, 1, 2 };
char PlrGFXAnimLens[3][11] = {
    { 10,16,8,2,20,20,6,20,8,9,14 },
    { 8,18,8,4,20,16,7,20,8,10,12 },
    { 8,16,8,6,20,12,8,20,8,12,8 }
};
int StrengthTbl[3] = { 30, 20, 15 };
int MagicTbl[3] = { 10, 15, 35 };
int DexterityTbl[3] = { 20, 30, 15 };
int VitalityTbl[3] = { 25, 20, 20 };
int ToBlkTbl[3] = { 30, 20, 10 };
int MaxStats[3][4] = {
    { 250,50,60,100 }, { 55,70,250,80 }, { 45,250,85,80 }
};
long ExpLvlsTbl[51] = {
    0,2000,4620,8040,12489,18258,25712,35309,47622,63364,83419,
    108879,141086,181683,231075,313656,424067,571190,766569,1025154,
    1366227,1814568,2401895,3168651,4166200,5459523,7130496,9281874,
    12042092,15571031,20066900,25774405,32994399,42095202,53525811,
    67831218,85670061,107834823,135274799,169122009,210720231,261657253,
    323800420,399335440,490808349,601170414,733825617,892680222,
    1082908612,1310707109,1583495809
};
PlayerStruct plr[2] = { 0 };
/* Retail initialized small-data order; zero values belong to this source TU. */
int myplr = 0;
unsigned char deathflag = 0;
char light_rad = 0;

unsigned char IsDplayer(int x, int y)
{
    if (plr[0].plractive && plr[0]._px == x && plr[0]._py == y)
        return 1;
    if (plr[1].plractive && plr[1]._px == x && plr[1]._py == y)
        return 2;
    return 0;
}

BOOL ismyplr(PlayerStruct *ptrplr)
{
    return &plr[myplr] == ptrplr;
}

int plrind(PlayerStruct *ptrplr)
{
    return ptrplr != plr;
}

/* offsets: _pHitPoints>>6==0 -> "dead" gfx set; PSX drops devilution's LoadPlrGFX file-loading
 * entirely (GLIB texture-pool GFX has no per-death-state file load). */
void InitPlayerGFX(PlayerStruct *ptrplr)
{
    if ((ptrplr->_pHitPoints >> 6) == 0)
        ptrplr->_pgfxnum = 0;
}

/* PSX has no separately-allocated player GFX buffer to free (GLIB texture pool owns it) --
 * devilution's mem_freeing FreePlayerGFX collapses to clearing the load-state flag. */
void FreePlayerGFX(PlayerStruct *ptrplr)
{
    ptrplr->_pGFXLoad = 0;
}

/* PSX stores an equipment-index BYTE (peq) for the GLIB texture pool instead of devilution's
 * BYTE* frame-data pointer (_pAnimData) -- no 5th `width` arg either (unused by the PSX renderer). */
void NewPlrAnim(PlayerStruct *ptrplr, int Peq, int numFrames, int Delay)
{
    ptrplr->peq = Peq;
    ptrplr->_pAnimLen = numFrames;
    ptrplr->_pAnimFrame = 1;
    ptrplr->_pAnimCnt = 0;
    ptrplr->_pAnimDelay = Delay;
}

/* PSX oracle clears _pVar1-5 and _pVar8 but leaves _pVar6/_pVar7 untouched (devilution clears
 * all 8) -- transcribed literally, a genuine PSX behavioural delta, not a typo on our part. */
void ClearPlrPVars(PlayerStruct *ptrplr)
{
    ptrplr->_pVar1 = 0;
    ptrplr->_pVar2 = 0;
    ptrplr->_pVar3 = 0;
    ptrplr->_pVar4 = 0;
    ptrplr->_pVar5 = 0;
    ptrplr->_pVar8 = 0;
}

void SetPlrAnims(PlayerStruct *ptrplr)
{
    int gn, pc;

    pc = ptrplr->_pClass;
    if (leveltype == 0) {
        ptrplr->_pNFrames = PlrGFXAnimLens[pc][7];
        ptrplr->_pWFrames = PlrGFXAnimLens[pc][8];
        ptrplr->_pDFrames = PlrGFXAnimLens[pc][4];
        ptrplr->_pSFrames = PlrGFXAnimLens[pc][5];
        ptrplr->_pSFNum = PlrGFXAnimLens[pc][10];
    } else {
        ptrplr->_pNFrames = PlrGFXAnimLens[pc][0];
        ptrplr->_pWFrames = PlrGFXAnimLens[pc][2];
        ptrplr->_pAFrames = PlrGFXAnimLens[pc][1];
        ptrplr->_pHFrames = PlrGFXAnimLens[pc][6];
        ptrplr->_pSFrames = PlrGFXAnimLens[pc][5];
        ptrplr->_pDFrames = PlrGFXAnimLens[pc][4];
        ptrplr->_pBFrames = PlrGFXAnimLens[pc][3];
        ptrplr->_pAFNum = PlrGFXAnimLens[pc][9];
        ptrplr->_pSFNum = PlrGFXAnimLens[pc][10];
    }

    gn = ptrplr->_pgfxnum & 0xF;
    if (pc == CLASS_WARRIOR) {
        if (gn == 4) {
            if (leveltype != 0)
                ptrplr->_pNFrames = 8;
            ptrplr->_pAFNum = 11;
        } else if (gn == 5) {
            ptrplr->_pAFrames = 20;
            ptrplr->_pAFNum = 10;
        } else if (gn == 8) {
            ptrplr->_pAFrames = 16;
            ptrplr->_pAFNum = 11;
        }
    } else if (pc == CLASS_ROGUE) {
        if (gn == 5) {
            ptrplr->_pAFrames = 22;
            ptrplr->_pAFNum = 13;
        } else if (gn == 4) {
            ptrplr->_pAFrames = 12;
            ptrplr->_pAFNum = 7;
        } else if (gn == 8) {
            ptrplr->_pAFrames = 16;
            ptrplr->_pAFNum = 11;
        }
    } else if (pc == CLASS_SORCERER) {
        if (gn == 0) {
            ptrplr->_pAFrames = 20;
        } else if (gn == 1) {
            ptrplr->_pAFNum = 9;
        } else if (gn == 4) {
            ptrplr->_pAFrames = 20;
            ptrplr->_pAFNum = 16;
        } else if (gn == 5) {
            ptrplr->_pAFrames = 24;
            ptrplr->_pAFNum = 16;
        }
    }
}

void CreatePlayer(PlayerStruct *ptrplr, char c)
{
    int i;
    char vc;

    SetRndSeed(GTIMSYS_GetTimer());
    ptrplr->_pClass = c;

    vc = StrengthTbl[c];
    if (vc < 0)
        vc = 0;
    ptrplr->_pStrength = vc;
    ptrplr->_pBaseStr = vc;
    vc = MagicTbl[c];
    if (vc < 0)
        vc = 0;
    ptrplr->_pMagic = vc;
    ptrplr->_pBaseMag = vc;
    vc = DexterityTbl[c];
    if (vc < 0)
        vc = 0;
    ptrplr->_pDexterity = vc;
    ptrplr->_pBaseDex = vc;
    vc = VitalityTbl[c];
    if (vc < 0)
        vc = 0;
    ptrplr->_pVitality = vc;
    ptrplr->_pBaseVit = vc;

    ptrplr->_pStatPts = 0;

    ptrplr->pTownWarps = 0;
    ptrplr->pDungMsgs = 0;
    ptrplr->pLvlLoad = 0;
    ptrplr->pDiabloKillLevel = 0;

    if (ptrplr->_pClass == CLASS_ROGUE)
        ptrplr->_pDamageMod = ((ptrplr->_pStrength + ptrplr->_pDexterity) * ptrplr->_pLevel) / 200;
    else
        ptrplr->_pDamageMod = (ptrplr->_pStrength * ptrplr->_pLevel) / 100;
    ptrplr->_pBaseToBlk = ToBlkTbl[c];

    ptrplr->_pHitPoints = (ptrplr->_pVitality + 10) << 6;
    if (ptrplr->_pClass == CLASS_WARRIOR)
        ptrplr->_pHitPoints = ptrplr->_pHitPoints << 1;
    if (ptrplr->_pClass == CLASS_ROGUE)
        ptrplr->_pHitPoints += (ptrplr->_pHitPoints >> 1);
    ptrplr->_pMaxHP = ptrplr->_pHitPoints;
    ptrplr->_pHPBase = ptrplr->_pHitPoints;
    ptrplr->_pMaxHPBase = ptrplr->_pHitPoints;

    ptrplr->_pMana = ptrplr->_pMagic << 6;
    if (ptrplr->_pClass == CLASS_SORCERER)
        ptrplr->_pMana = ptrplr->_pMana << 1;
    if (ptrplr->_pClass == CLASS_ROGUE)
        ptrplr->_pMana += (ptrplr->_pMana >> 1);
    ptrplr->_pMaxMana = ptrplr->_pMana;
    ptrplr->_pManaBase = ptrplr->_pMana;
    ptrplr->_pMaxManaBase = ptrplr->_pMana;

    ptrplr->_pLevel = 1;
    ptrplr->_pMaxLvl = ptrplr->_pLevel;

    ptrplr->_pExperience = 0;
    ptrplr->_pMaxExp = ptrplr->_pExperience;
    ptrplr->_pNextExper = ExpLvlsTbl[1];
    ptrplr->_pScrlSpells = 0;

    ptrplr->_pArmorClass = 0;
    ptrplr->_pMagResist = 0;
    ptrplr->_pFireResist = 0;
    ptrplr->_pLghtResist = 0;

    ptrplr->_pLightRad = 6;

    ptrplr->_pInfraFlag = FALSE;

    if (c == CLASS_WARRIOR)
        ptrplr->_pAblSpells = (unsigned long long)1 << (26 - 1);
    else if (c == CLASS_ROGUE)
        ptrplr->_pAblSpells = (unsigned long long)1 << (28 - 1);
    else if (c == CLASS_SORCERER)
        ptrplr->_pAblSpells = (unsigned long long)1 << (27 - 1);

    if (c == CLASS_SORCERER)
        ptrplr->_pMemSpells = (unsigned long long)1 << (1 - 1);
    else
        ptrplr->_pMemSpells = 0;

    for (i = 0; i < 64; i++)
        ptrplr->_pSplLvl[i] = 0;
    ptrplr->_pSpellFlags = 0;
    if (ptrplr->_pClass == CLASS_SORCERER)
        ptrplr->_pSplLvl[1] = 2;

    if (c == CLASS_WARRIOR)
        ptrplr->_pgfxnum = 3;
    else if (c == CLASS_ROGUE)
        ptrplr->_pgfxnum = 4;
    else if (c == CLASS_SORCERER)
        ptrplr->_pgfxnum = 8;

    for (i = 0; i < 17; i++)
        ptrplr->_pLvlVisited[i] = FALSE;
    for (i = 0; i < 10; i++)
        ptrplr->_pSLvlVisited[i] = FALSE;

    ptrplr->_pLvlChanging = FALSE;
    ptrplr->pTownWarps = 0;
    ptrplr->pLvlLoad = 0;

    InitDungMsgs(ptrplr);
    CreatePlrItems(ptrplr);
    SetRndSeed(0);
}

int CalcStatDiff(PlayerStruct *ptrplr)
{
    int c = ptrplr->_pClass;
    int d = MaxStats[c][0] - ptrplr->_pBaseStr;
    d += MaxStats[c][1] - ptrplr->_pBaseMag;
    d += MaxStats[c][2] - ptrplr->_pBaseDex;
    d += MaxStats[c][3] - ptrplr->_pBaseVit;
    return d;
}


/* PSX plays a level-up SFX (0x3DF) right after the level bump -- not present in devilution; also
 * drops the Hellfire-only CalcPlrInv(TRUE)/barbarian-mana/`_pMana>0` guard branches. */
void NextPlrLevel(PlayerStruct *ptrplr)
{
    ptrplr->_pLevel++;
    ptrplr->_pMaxLvl++;
    PlaySFX(0x3DF);

    if (CalcStatDiff(ptrplr) < 5) {
        ptrplr->_pStatPts = CalcStatDiff(ptrplr);
    } else {
        ptrplr->_pStatPts += 5;
    }

    ptrplr->_pNextExper = ExpLvlsTbl[ptrplr->_pLevel];

    long l = ptrplr->_pClass == CLASS_SORCERER ? 64 : 128;
    if (gbMaxPlayers == 1) {
        l++;
    }
    ptrplr->_pMaxHP += l;
    ptrplr->_pHitPoints = ptrplr->_pMaxHP;
    ptrplr->_pMaxHPBase += l;
    ptrplr->_pHPBase = ptrplr->_pMaxHPBase;

    if (ismyplr(ptrplr)) {
        drawhpflag = TRUE;
    }

    l = ptrplr->_pClass == CLASS_WARRIOR ? 64 : 128;
    if (gbMaxPlayers == 1) {
        l++;
    }
    ptrplr->_pMaxMana += l;
    ptrplr->_pMaxManaBase += l;

    if (!(ptrplr->_pIFlags & ISPL_NOMANA)) {
        ptrplr->_pMana = ptrplr->_pMaxMana;
        ptrplr->_pManaBase = ptrplr->_pMaxManaBase;
    }

    if (ismyplr(ptrplr)) {
        drawmanaflag = TRUE;
    }
}


/* PSX has no FPU -- devilution's `exp *= 1 + ((double)lvl - _pLevel) / 10;` becomes a literal
 * Q16.16 fixed-point multiply (gcc's own magic-constant /10 and /20, transcribed as-is).
 * PSX also has no separate `pnum`: it temporarily repoints the GLOBAL myplr at ptrplr's index
 * (plrind) so the rest of the body can keep devilution's `plr[myplr]`-style logic unchanged, then
 * restores myplr on the way out -- EXCEPT the early "_pHitPoints<=0" return bypasses the restore
 * (retail quirk: myplr is left pointing at ptrplr's index in that case; preserved faithfully). */
#define max(a, b) (((a) > (b)) ? (a) : (b))
#define min(a, b) (((a) < (b)) ? (a) : (b))

void AddPlrExperience(PlayerStruct *ptrplr, int lvl, long exp)
{
    int omp = myplr;
    myplr = ptrplr != plr;

    if (ptrplr->_pHitPoints <= 0)
        return;

    unsigned long long v = ((((lvl - ptrplr->_pLevel) << 16) / 10) + 0x10000) * exp;
    long e = v >> 16;
    if (e < 0)
        e = 0;

    if (gbMaxPlayers > 1) {
        long lLevel = max(0, ptrplr->_pLevel);
        lLevel = min(lLevel, 50);
        long lMax = ExpLvlsTbl[lLevel] / 20;
        e = min(e, lMax);
        lMax = lLevel * 200;
        e = min(e, lMax);
    }

    ptrplr->_pExperience += e;
    if ((unsigned long)ptrplr->_pExperience > 2000000000)
        ptrplr->_pExperience = 2000000000;
    if (ptrplr->_pExperience >= ExpLvlsTbl[50 - 1]) {
        ptrplr->_pLevel = 50;
    } else {
        int l;
        for (l = 0; ptrplr->_pExperience >= ExpLvlsTbl[l]; l++)
            ;
        if (l != ptrplr->_pLevel) {
            l -= ptrplr->_pLevel;
            for (int i = 0; i < l; i++)
                NextPlrLevel(ptrplr);
        }
        NetSendCmdParam1(FALSE, 0x33, ptrplr->_pLevel);
    }
    myplr = omp;
}

void AddPlrMonstExper(int lvl, long exp, char pmask)
{
    int totplrs = 0;
    for (int i = 0; i < MAX_PLRS; i++) {
        if ((pmask >> i) & 1)
            totplrs++;
    }
    if (totplrs) {
        long e = exp / totplrs;
        if ((pmask >> myplr) & 1)
            AddPlrExperience(myplr, lvl, e);
    }
}

void InitPlayer(PlayerStruct *ptrplr, unsigned char FirstTime)
{
    if (FirstTime) {
        ptrplr->_pRSplType = 4;
        ptrplr->_pRSpell = -1;
        ptrplr->_pSBkSpell = -1;
        ptrplr->DeadLevel = 100;
        ptrplr->_pSpell = ptrplr->_pRSpell;
        ptrplr->_pSplType = ptrplr->_pRSplType;
        if ((ptrplr->_pgfxnum & 0xF) == 4)
            ptrplr->_pwtype = 1;
        else
            ptrplr->_pwtype = 0;
    }

    if (TRUE) {
        SetPlrAnims(ptrplr);
        ptrplr->_pxoff = 0;
        ptrplr->_pyoff = 0;
        ptrplr->_pxvel = 0;
        ptrplr->_pyvel = 0;
        ClearPlrPVars(ptrplr);

        if ((ptrplr->_pHitPoints >> 6) > 0) {
            ptrplr->_pmode = PM_STAND;
            NewPlrAnim(ptrplr, 0, ptrplr->_pNFrames, 3);
            ptrplr->_pAnimFrame = ENG_random(ptrplr->_pNFrames - 1) + 1;
            ptrplr->_pAnimCnt = ENG_random(3);
        } else {
            ptrplr->_pmode = PM_DEATH;
            NewPlrAnim(ptrplr, 1, ptrplr->_pDFrames, 1);
            ptrplr->_pAnimFrame = ptrplr->_pAnimLen - 1;
            ptrplr->_pVar8 = ptrplr->_pAnimLen << 1;
        }

        ptrplr->_pdir = 0;

        if (ismyplr(ptrplr)) {
            if (!FirstTime || currlevel != 0) {
                if (plrind(ptrplr) == 1 && plr[0].plractive)
                    PlacePlayer(plrind(ptrplr), ViewX + 1, ViewY + 1, FALSE);
                else
                    PlacePlayer(plrind(ptrplr), ViewX, ViewY, FALSE);
            }
        } else {
            int i;
            PlacePlayer(plrind(ptrplr), ViewX, ViewY, FALSE);
        }
    }

    ptrplr->walkpath[0] = -1;
    ptrplr->destAction = -1;
    WorldToOffset(ptrplr, (ptrplr->_px << 3) + 4, (ptrplr->_py << 3) + 4);
    light_rad = ptrplr->_pLightRad;
    light_fix(ptrplr->_plid);
    ptrplr->_plid = AddLight(ptrplr->_px, ptrplr->_py, light_rad + 9200);
    ChangeLightOff(ptrplr->_plid, 0, 0);
    ManashieldFlag = 0;
    ManashieldFlag2 = 0;
    ptrplr->_pvid = AddVision(ptrplr->_px, ptrplr->_py, 10, plrind(ptrplr));

    if (ptrplr->_pClass == CLASS_WARRIOR)
        ptrplr->_pAblSpells = (unsigned long long)1 << (26 - 1);
    else if (ptrplr->_pClass == CLASS_ROGUE)
        ptrplr->_pAblSpells = (unsigned long long)1 << (28 - 1);
    else if (ptrplr->_pClass == CLASS_SORCERER)
        ptrplr->_pAblSpells = (unsigned long long)1 << (27 - 1);

    ptrplr->_pNextExper = ExpLvlsTbl[ptrplr->_pLevel];
    ptrplr->_pInvincible = FALSE;

    if (ismyplr(ptrplr)) {
        D_8011C878[plrind(ptrplr)] = 0;
        deathflag = FALSE;
        ScrollInfo._sxoff = 0;
        ScrollInfo._syoff = 0;
        ScrollInfo._sdir = 0;
    }
}

/* PSX oracle is `jr ra; nop` -- ViewX/ViewY aren't primed here (each player's own screen tracks its
 * own view directly; unlike PC there's no single shared ViewX/ViewY camera to seed at level start). */
void InitMultiView(void)
{
}

/* PSX tail-calls the GLIB dpiece-flag accessor instead of devilution's nSolidTable[dPiece[x][y]]
 * lookup (and drops the bounds check -- callers already clamp). */
unsigned char SolidLoc(int x, int y)
{
    return GetSOLID(x, y);
}

/* PSX keeps dTransVal as a FIELD of dung_map[x][y] (not a separate array) -- loop nesting is
 * devilution's original i(y) outer / j(x) inner. */
void PlrClrTrans(int x, int y)
{
    int i, j;

    for (j = y - 1; j <= y + 1; j++) {
        for (i = x - 1; i <= x + 1; i++) {
            TransList[dung_map[i][j].dTransVal] = FALSE;
        }
    }
}

void PlrDoTrans(int x, int y)
{
    int i, j;

    if (leveltype == DTYPE_CATHEDRAL || leveltype == DTYPE_CATACOMBS) {
        for (j = y - 1; j <= y + 1; j++) {
            for (i = x - 1; i <= x + 1; i++) {
                if (!GetSOLID(i, j) && dung_map[i][j].dTransVal) {
                    TransList[dung_map[i][j].dTransVal] = TRUE;
                }
            }
        }
    } else {
        TransList[1] = TRUE;
    }
}

void SetPlayerOld(PlayerStruct *ptrplr)
{
    ptrplr->_poldx = ptrplr->_px;
    ptrplr->_poldy = ptrplr->_py;
}

/* PSX drops devilution's LoadPlrGFX/_pNAnim[dir] lookup (texture-pool anim needs no per-dir gfx
 * load), FixPlayerLocation/FixPlrWalkTags/dPlayer-occupancy write (no such grid maintained here --
 * RemovePlrFromMap below is a matching no-op), and calls StartPlrKill (not SyncPlrKill). `_pdir` is
 * stored unconditionally before the invincible/dead/local-player kill check. */
void StartStand(PlayerStruct *ptrplr, int dir)
{
    ptrplr->_pdir = dir;
    if (ptrplr->_pInvincible && ptrplr->_pHitPoints == 0 && ismyplr(ptrplr)) {
        StartPlrKill(ptrplr, -1);
        return;
    }
    NewPlrAnim(ptrplr, 0, ptrplr->_pNFrames, 3);
    ptrplr->_pmode = PM_STAND;
    ptrplr->_pVar5 = 1;
    SetPlayerOld(ptrplr);
}

/* PSX drops devilution's CheckEFlag() call and the ScrollInfo/_sdir/ViewX/ViewY camera reset
 * (per-player split-screen doesn't recentre a shared camera the way the PC does). */
void StartWalkStand(PlayerStruct *ptrplr)
{
    ptrplr->_pmode = PM_STAND;
    if (ismyplr(ptrplr)) {
        ScrollInfo._sxoff = 0;
        ScrollInfo._syoff = 0;
        ScrollInfo._sdir = 0;
        ViewX = ptrplr->_px;
        ViewY = ptrplr->_py;
    }
}
#undef max
#undef min

/* PSX drops devilution's whole interpolated-offset/abs-clamp light math (xmul/ymul/lx/ly/offx/offy)
 * -- it derives the light offset directly from the low nibble of the WorldX/WorldY tile coords. */
void PM_ChangeLightOff(PlayerStruct *ptrplr)
{
    ChangeLightOff(ptrplr->_plid, (ptrplr->WorldX & 0xF) - 8, (ptrplr->WorldY & 0xF) - 8);
}

/* PSX drops devilution's whole _pVar6/_pVar7 sub-pixel accumulator + scroll-offset delta logic --
 * just bumps the frame counter and re-derives the light offset. */
void PM_ChangeOffset(PlayerStruct *ptrplr)
{
    ptrplr->_pVar8++;
    PM_ChangeLightOff(ptrplr);
}

/* PSX merges devilution's StartAttack/StartRangeAttack into one function, dispatched at runtime
 * on `_pwtype` (weapon type) and whether the target tile holds a breakable object: `d` (direction)
 * is unused. `_pVar6/_pVar7` hold the raw target world tile (read via `dung_map[.].dObject`, NOT
 * the usual `IsDplayer`-substitute pattern -- this checks OBJECTS, not players). Drops devilution's
 * LoadPlrGFX/FixPlayerLocation like every other Start* function. */
void StartAttack(PlayerStruct *ptrplr, int d)
{
    int co = dung_map[ptrplr->_pVar6][ptrplr->_pVar7].dObject;
    unsigned char closeattack = 0;

    if (ptrplr->_pInvincible && ptrplr->_pHitPoints == 0 && ismyplr(ptrplr)) {
        StartPlrKill(ptrplr, -1);
        return;
    }

    if (co > 0) {
        co--;
        if (object[co]._oBreak == 1) {
            closeattack = 1;
        }
    }

    if (ptrplr->_pwtype != 0 && !closeattack) {
        if (ptrplr->_pVar6 <= 0) {
            return;
        }
        if (ptrplr->_pVar7 <= 0) {
            return;
        }
        ptrplr->_pmode = PM_RATTACK;
        ptrplr->_pVar1 = ptrplr->_pVar6;
        ptrplr->_pVar2 = ptrplr->_pVar7;
    } else {
        ptrplr->_pmode = PM_ATTACK;
    }

    SetPlayerOld(ptrplr);
    NewPlrAnim(ptrplr, 2, ptrplr->_pAFrames, 0);
}

/* PSX's `dir` param is unused (the block-facing direction isn't looked up -- Peq is a fixed literal
 * 3), and drops LoadPlrGFX/FixPlayerLocation like the other Start* functions. IS_ISWORD's PSX sound
 * id is 0x2A. */
void StartPlrBlock(PlayerStruct *ptrplr, int dir)
{
    if (ptrplr->_pInvincible && ptrplr->_pHitPoints == 0 && ismyplr(ptrplr)) {
        StartPlrKill(ptrplr, -1);
        return;
    }
    PlaySfxLoc(0x2A, ptrplr->_px, ptrplr->_py);
    NewPlrAnim(ptrplr, 3, ptrplr->_pBFrames, 2);
    ptrplr->_pmode = PM_BLOCK;
    SetPlayerOld(ptrplr);
}

/* PSX: `d` is unused -- `_pdir` is instead re-derived from GetDirection(px,py,cx,cy); the
 * per-sType _pFAnim/_pLAnim/_pTAnim[d] lookups become fixed Peq literals 4/5/6 (texture pool);
 * FixPlayerLocation is dropped. The PostGamePad first arg is a pointer-arithmetic boolean
 * `((char*)ptrplr + 3*sizeof(PlayerStruct)) != plr` that is ALWAYS true for both valid player
 * pointers (MAX_PLRS=2) -- transcribed literally byte-for-byte off the oracle; its real source
 * intent is unclear (possibly a leftover always-true guard), open for re-derivation. */
void StartSpell(PlayerStruct *ptrplr, int d, int cx, int cy)
{
    if (ptrplr->_pInvincible && ptrplr->_pHitPoints == 0 && ismyplr(ptrplr)) {
        StartPlrKill(ptrplr, -1);
        return;
    }
    if (leveltype != DTYPE_TOWN) {
        switch (spelldata[ptrplr->_pSpell].sType) {
        case 0:
            NewPlrAnim(ptrplr, 4, ptrplr->_pSFrames, 0);
            break;
        case 1:
            NewPlrAnim(ptrplr, 5, ptrplr->_pSFrames, 0);
            break;
        case 2:
            NewPlrAnim(ptrplr, 6, ptrplr->_pSFrames, 0);
            break;
        }
    }
    PlaySfxLoc(spelldata[ptrplr->_pSpell].sSFX, ptrplr->_px, ptrplr->_py);
    ptrplr->_pmode = PM_SPELL;
    PostGamePad((int)((char *)ptrplr + 3 * sizeof(PlayerStruct)) != (int)plr, 0, 0, 0);
    SetPlayerOld(ptrplr);
    ptrplr->_pVar1 = cx;
    ptrplr->_pVar2 = cy;
    ptrplr->_pdir = GetDirection(ptrplr->_px, ptrplr->_py, cx, cy);
    ptrplr->_pVar4 = GetSpellLevel(ptrplr, ptrplr->_pSpell);
    ptrplr->_pVar8 = 1;
}

/* PSX no-op (see StartStand's comment above -- no dPlayer occupancy grid to clear). */
void RemovePlrFromMap(PlayerStruct *ptrplr)
{
}

/* PSX resets the gamepad cursor-select array first (`_pcursplr[sel_data] = -1`, not in devilution),
 * narrows the class-hit-sound cascade to 3 classes (no rogue/monk/bard/barbarian split), and drops
 * LoadPlrGFX/FixPlayerLocation/FixPlrWalkTags/dPlayer-occupancy like the other Start* functions. */
void StartPlrHit(PlayerStruct *ptrplr, int dam, unsigned char forcehit)
{
    _pcursplr[sel_data] = -1;

    if (ptrplr->_pInvincible && ptrplr->_pHitPoints == 0 && ismyplr(ptrplr)) {
        StartPlrKill(ptrplr, -1);
        return;
    }

    if (ptrplr->_pClass == CLASS_WARRIOR) {
        PlaySfxLoc(0x316, ptrplr->_px, ptrplr->_py);
    } else if (ptrplr->_pClass == CLASS_ROGUE) {
        PlaySfxLoc(0x2A8, ptrplr->_px, ptrplr->_py);
    } else if (ptrplr->_pClass == CLASS_SORCERER) {
        PlaySfxLoc(0x240, ptrplr->_px, ptrplr->_py);
    }

    drawhpflag = TRUE;

    if ((dam >> 6) < ptrplr->_pLevel && !forcehit) {
        return;
    }

    /* PSX-only guard: don't interrupt the current animation before it's half played. */
    if (ptrplr->_pAnimFrame < (ptrplr->_pAnimLen >> 1)) {
        return;
    }

    NewPlrAnim(ptrplr, 7, ptrplr->_pHFrames, 0);
    ptrplr->_pmode = PM_GOTHIT;
    ptrplr->_pVar8 = 1;
    SetPlayerOld(ptrplr);
}

void RespawnDeadItem(ItemStruct *itm, int x, int y)
{
    int ii;

    if (numitems < 127) {
        if (FindGetItem(itm->IDidx, itm->_iCreateInfo, itm->_iSeed) >= 0)
            SyncGetItem(x, y, itm->IDidx, itm->_iCreateInfo, itm->_iSeed);

        ii = itemavail[0];
        dung_map[x][y].dItem = ii + 1;
        itemavail[0] = itemavail[127 - numitems - 1];
        itemactive[numitems] = ii;

        item[ii] = *itm;
        item[ii]._ix = x;
        item[ii]._iy = y;

        RespawnItem(ii, TRUE);
        numitems++;

        itm->_itype = -1;
    }
}

static void PlrDeadItem(PlayerStruct *ptrplr, ItemStruct *itm, int xx, int yy)
{
    if (itm->_itype == -1)
        return;

    int x = ptrplr->_px + xx;
    int y = ptrplr->_py + yy;

    if ((xx != 0) || (yy != 0)) {
        if (ItemSpaceOk(x, y)) {
            RespawnDeadItem(itm, x, y);
            ptrplr->HoldItem = *itm;
            NetSendCmdPItem(FALSE, 11, x, y);
            return;
        }
    }

    for (int l = 1; l < 50; l++) {
        for (int j = -l; j <= l; j++) {
            y = ptrplr->_py + j;
            for (int i = -l; i <= l; i++) {
                x = ptrplr->_px + i;
                if (!ItemSpaceOk(x, y))
                    continue;
                RespawnDeadItem(itm, x, y);
                ptrplr->HoldItem = *itm;
                NetSendCmdPItem(FALSE, 11, x, y);
                return;
            }
        }
    }
}

/* ==== wave-3 additions ==== */

void StartPlayerDropItems(PlayerStruct *ptrplr, int EarFlag)
{
    PlayerDeathCount[plrind(ptrplr)] = 5;
    PlayerEar[plrind(ptrplr)] = EarFlag;
}

void TryDropPlayerItems(PlayerStruct *ptrplr)
{
    unsigned char diablolevel;
    int pnum = plrind(ptrplr);
    const int pnum4 = pnum << 2;

    diablolevel = currlevel == 16;
    if (PlayerDeathCount[pnum] > 0)
        PlayerDeathCount[pnum]--;
    if (PlayerDeathCount[pnum] == 0) {
        PlayerStruct *p;
        ItemStruct *pi;
        int i;
        PlayerDeathCount[pnum] = -1;
        p = ptrplr;
        if (_pcurs[myplr] >= 12) {
            PlrDeadItem(ptrplr, &ptrplr->HoldItem, 0, 0);
            NewCursor(1);
        }
        if (diablolevel)
            return;
        DropHalfPlayersGold(ptrplr);
        {
            pi = ptrplr->InvBody;
            i = 7;
            while (--i != -1) {
                int pdd = (p->_pdir + i) & 7;
                PlrDeadItem(ptrplr, pi, offset_x[pdd], offset_y[pdd]);
                pi++;
            }
        }
        CalcPlrInv(ptrplr, FALSE);
    }
}

void StartPlayerKill(PlayerStruct *ptrplr, int earflag)
{
    ItemStruct ear;
    PlayerStruct *p = ptrplr;

    automapflag = 0;
    if (gbActivePlayers == 1) {
        automapflag = 0;
        PA_SetPauseOk(FALSE);
    }

    if (ptrplr->_pHitPoints == 0 && ptrplr->_pmode == PM_DEATH)
        return;

    if (ptrplr->_pClass == CLASS_WARRIOR)
        PlaySfxLoc(0xB, ptrplr->_px, ptrplr->_py);
    else if (ptrplr->_pClass == CLASS_ROGUE)
        PlaySfxLoc(0x2AB, ptrplr->_px, ptrplr->_py);
    else if (ptrplr->_pClass == CLASS_SORCERER)
        PlaySfxLoc(0x243, ptrplr->_px, ptrplr->_py);

    if (gbActivePlayers == 1)
        GLUE_SetHomingScrollFlag(FALSE);

    int pn = plrind(ptrplr);
    if (_spselflag[pn])
        TSK_Kill(_spselflag[pn]);
    _spselflag[pn] = 0;
    PauseMode = 1;
    TSK_Sleep(2);
    while (sghStream)
        TSK_Sleep(1);
    PauseMode = 0;

    if (p->_pgfxnum) {
        p->_pgfxnum = 0;
        p->_pGFXLoad = 0;
        SetPlrAnims(ptrplr);
    }

    NewPlrAnim(ptrplr, 1, p->_pDFrames, 1);
    p->_pmode = PM_DEATH;
    p->_pBlockFlag = FALSE;
    p->_pInvincible = TRUE;
    SetPlayerHitPoints(ptrplr, 0);
    p->_pVar8 = 1;
    p->DeadLevel = currlevel;
    SetPlayerOld(ptrplr);
    drawhpflag = TRUE;
    D_8011C878[plrind(ptrplr)] = 30;
    StartPlayerDropItems(ptrplr, earflag);
}

void DropHalfPlayersGold(PlayerStruct *ptrplr)
{
    long hGold = ptrplr->_pGold;
    int i;

    if (hGold > 0) {
        for (i = 0; i < ptrplr->_pNumInv && hGold > 0; i++) {
            if (ptrplr->InvList[i]._itype == 11) {
                int newgold = ptrplr->InvList[i]._ivalue;
                hGold -= newgold;
                newgold >>= 1;
                if (newgold) {
                    SetGoldCurs(ptrplr, i);
                    SetPlrHandItem(&ptrplr->HoldItem, 0);
                    GetGoldSeed(ptrplr, &ptrplr->HoldItem);
                    SetPlrHandGoldCurs(&ptrplr->HoldItem);
                    ptrplr->HoldItem._ivalue = newgold;
                    PlrDeadItem(ptrplr, &ptrplr->HoldItem, 0, 0);
                } else {
                    newgold = 1;
                }
                ptrplr->InvList[i]._ivalue = newgold;
            }
        }
    }
    ptrplr->_pGold = CalculateGold(ptrplr);
}

/* PSX-only "town portal absorbs death" gate around StartPlayerKill (not in devilution): if HP hits
 * 0 while in town, just top off to 64 HP; otherwise scan for a still-open MIS type-13 (town portal)
 * missile owned by this player -- if found, stash `val` in its _miVar8 and bail out instead of
 * actually killing the player. `_misource` is XOR-compared against plrind(ptrplr) (the usual
 * plrind-style equality-via-xor idiom). */

void StartPlrKill(PlayerStruct *ptrplr, int earflag)
{
    int i, mx;

    plrind(ptrplr);

    if ((ptrplr->_pHitPoints == 0) && (currlevel == 0)) {
        SetPlayerHitPoints(ptrplr, 64);
        return;
    }

    for (i = 0; i < nummissiles; i++) {
        mx = missileactive[i];
        if (missile[mx]._mitype == 13 && missile[mx]._misource == (ptrplr != plr) && !missile[mx]._miDelFlag) {
            if (earflag != -1)
                missile[mx]._miVar8 = earflag;
            return;
        }
    }

    SetPlayerHitPoints(ptrplr, 0);
    StartPlayerKill(ptrplr, earflag);
}

void SyncPlrKill(PlayerStruct *ptrplr, int earflag)
{
    StartPlayerKill(ptrplr, earflag);
}

void RemovePlrMissiles(PlayerStruct *ptrplr)
{
    int i, mx;

    if ((currlevel != 0) && ismyplr(ptrplr) && (monster[myplr]._mx != 1 || monster[myplr]._my != 0)) {
        M_StartKill(myplr, myplr);
        extern void AddDead(int, int, char, int);
        AddDead(monster[myplr]._mx, monster[myplr]._my, monster[myplr].MType->mdeadval, monster[myplr]._mdir);
        dung_map[monster[myplr]._mx][monster[myplr]._my].dMonster = 0;
        monster[myplr]._mDelFlag = TRUE;
        DeleteMonsterList();
    }

    for (i = 0; i < nummissiles; i++) {
        mx = missileactive[i];
        if ((missile[mx]._mitype == 30) && (missile[mx]._misource == (ptrplr != plr)))
            monster[missile[mx]._miVar2]._mmode = missile[mx]._miVar1;
        if ((missile[mx]._mitype == 13) && (missile[mx]._misource == (ptrplr != plr))) {
            ClearMissileSpot(mx);
            DeleteMissile(mx, i);
        }
        if ((missile[mx]._mitype == 34) && (missile[mx]._misource == (ptrplr != plr))) {
            ClearMissileSpot(mx);
            DeleteMissile(mx, i);
        }
    }
}

void InitLevelChange(PlayerStruct *ptrplr)
{
    RemovePlrMissiles(ptrplr);
    if (ismyplr(ptrplr) && qtextflag) {
        LANG_ReloadMainTXT();
        qtextflag = FALSE;
        stream_stop();
    }
    RemovePlrFromMap(ptrplr);
    SetPlayerOld(ptrplr);
    ptrplr->_pLvlVisited[ptrplr->plrlevel] = TRUE;
    ClrPlrPath(ptrplr);
    ptrplr->destAction = -1;
    ptrplr->_pLvlChanging = TRUE;
    ptrplr->pLvlLoad = 10;
    visible_level = -1;
}

void CheckPlrDead(int pnum)
{
    PlayerStruct *ptrplr = &plr[pnum];
    if (ptrplr->_pmode == PM_DEATH) {
        ptrplr->_pAnimFrame = ptrplr->_pAnimLen;
        ptrplr->plractive = FALSE;
    }
}

void StartNewLvl(PlayerStruct *ptrplr, int fom, int lvl)
{
    BOOL oldpause;

    if (ptrplr->plractive) {
        CheckPlrDead(0);
        CheckPlrDead(1);
        oldpause = PA_SetPauseOk(FALSE);
        InitGamePadVars();
        InitLevelChange(&plr[0]);
        InitLevelChange(&plr[1]);
        switch (fom) {
        case 0x48: /* WM_DIABTWARPUP */
            plr[myplr].pTownWarps |= 1 << (leveltype - 2);
            plr[myplr ^ 1].pTownWarps |= 1 << (leveltype - 2);
        case 0x42: /* WM_DIABNEXTLVL */
        case 0x43: /* WM_DIABPREVLVL */
        case 0x44:
        case 0x47: /* WM_DIABRTNLVL */
        case 0x4C:
            ptrplr->plrlevel = lvl;
            break;
        case 0x45: /* WM_DIABSETLVL */
            setlvlnum = lvl;
            break;
        case 0x46:
            break;
        }
        if (ismyplr(ptrplr)) {
            ptrplr->_pInvincible = TRUE;
            ptrplr->_pmode = PM_NEWLVL;
            GRL_PostMessage(ghMainWnd, fom, 0, 0);
        }
        PA_SetPauseOk(oldpause);
    }
}

void RestartTownLvl(PlayerStruct *ptrplr)
{
    InitLevelChange(&plr[0]);
    InitLevelChange(&plr[1]);
    ptrplr->plrlevel = 0;
    SetPlayerHitPoints(ptrplr, 64);
    ptrplr->_pMana = 0;
    ptrplr->_pManaBase = ptrplr->_pMana - (ptrplr->_pMaxMana - ptrplr->_pMaxManaBase);
    CalcPlrInv(ptrplr, FALSE);
    if (ismyplr(ptrplr)) {
        ptrplr->_pInvincible = TRUE;
        ptrplr->_pmode = PM_NEWLVL;
        GRL_PostMessage(ghMainWnd, 0x49, 0, 0);
    }
}

void StartWarpLvl(PlayerStruct *ptrplr, int pidx)
{
    BOOL oldpause;

    if (ptrplr->plractive) {
        oldpause = PA_SetPauseOk(FALSE);
        CheckPlrDead(0);
        CheckPlrDead(1);
        InitLevelChange(&plr[0]);
        InitLevelChange(&plr[1]);
        InitGamePadVars();
        if (gbMaxPlayers != 1) {
            if (ptrplr->plrlevel != 0)
                ptrplr->plrlevel = 0;
            else
                ptrplr->plrlevel = portal[pidx].level;
        }
        if (ismyplr(ptrplr)) {
            SetCurrentPortal(pidx);
            ptrplr->_pInvincible = TRUE;
            ptrplr->_pmode = PM_NEWLVL;
            GRL_PostMessage(ghMainWnd, 0x46, 0, 0);
        }
        PA_SetPauseOk(oldpause);
    }
}

/* PSX stubs: both are bare `return FALSE;` (the state-machine handler exists but does nothing on
 * this build -- PM_STAND/PM_NEWLVL need no per-frame processing here). */
int PM_DoStand(PlayerStruct *ptrplr)
{
    return FALSE;
}

unsigned char ChkPlrOffsets(int wx1, int wy1, int wx2, int wy2)
{
    int x, y;

    if (plr[0]._pmode == PM_DEATH || plr[1]._pmode == PM_DEATH)
        return TRUE;
    const int t = wx1 - wy1;
    wy1 = ((wx1 + wy1) >> 1) << 2;
    x = t - (wx2 - wy2);
    y = ((wx2 + wy2) >> 1) << 2;
    x = abs(x << 2);
    y = abs(wy1 - y);
    if (x >= 317 || y >= 221)
        return FALSE;
    return TRUE;
}

int PM_DoWalk(PlayerStruct *ptrplr)
{
    int owx = ptrplr->WorldX;
    int owy = ptrplr->WorldY;

    if ((ptrplr->_pAnimFrame == 3)
        || (ptrplr->_pWFrames == 8 && ptrplr->_pAnimFrame == 7)
        || (ptrplr->_pWFrames != 8 && ptrplr->_pAnimFrame == 4))
        PlaySfxLoc(0, ptrplr->_px, ptrplr->_py);

    ChangeLightOff(ptrplr->_plid, 0, 0);
    ptrplr->WorldX += ptrplr->_pVar1;
    ptrplr->WorldY += ptrplr->_pVar2;
    WorldToOffset(ptrplr, ptrplr->WorldX, ptrplr->WorldY);

    if (!PosOkPlayer(ptrplr, ptrplr->_px, ptrplr->_py)) {
        WorldToOffset(ptrplr, owx, owy);
        if (ptrplr->walkpath[0] != -1)
            StartWalkStand(ptrplr);
        else
            StartStand(ptrplr, ptrplr->_pVar3);
        ClearPlrPVars(ptrplr);
        return 1;
    }

    if (plr[0].plractive && plr[1].plractive
        && !ChkPlrOffsets(plr[0].WorldX, plr[0].WorldY, plr[1].WorldX, plr[1].WorldY)) {
        WorldToOffset(ptrplr, owx, owy);
        if (ptrplr->walkpath[0] != -1)
            StartWalkStand(ptrplr);
        else
            StartStand(ptrplr, ptrplr->_pVar3);
        ClearPlrPVars(ptrplr);
        ChangeLightOff(ptrplr->_plid, 0, 0);
        return 1;
    }

    PM_ChangeOffset(ptrplr);
    ChangeLightXY(ptrplr->_plid, ptrplr->_px, ptrplr->_py);
    ChangeVisionXY(ptrplr->_pvid, ptrplr->_px, ptrplr->_py);
    return 0;
}


unsigned char WeaponDur(PlayerStruct *ptrplr, int durrnd)
{
    if (!ismyplr(ptrplr) || ENG_random(durrnd) != 0) {
        return FALSE;
    }

    /* PSX adds a DUR_INDESTRUCTIBLE guard for the weapon case too (devilution's non-Hellfire
     * WeaponDur decrements weapon durability unconditionally, without checking indestructible) --
     * and it's an EARLY RETURN (return FALSE immediately), not a "skip to the next slot" guard. */
    if (ptrplr->InvBody[INVLOC_HAND_LEFT]._itype != ITYPE_NONE && ptrplr->InvBody[INVLOC_HAND_LEFT]._iClass == ICLASS_WEAPON) {
        if (ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability == DUR_INDESTRUCTIBLE) {
            return FALSE;
        }
        ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability--;
        if (ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability == 0) {
            NetSendCmdDelItem(TRUE, INVLOC_HAND_LEFT);
            ptrplr->InvBody[INVLOC_HAND_LEFT]._itype = ITYPE_NONE;
            CalcPlrInv(ptrplr, TRUE);
            return TRUE;
        }
    }

    if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._itype != ITYPE_NONE && ptrplr->InvBody[INVLOC_HAND_RIGHT]._iClass == ICLASS_WEAPON) {
        if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability == DUR_INDESTRUCTIBLE) {
            return FALSE;
        }
        ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability--;
        if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability == 0) {
            NetSendCmdDelItem(TRUE, INVLOC_HAND_RIGHT);
            ptrplr->InvBody[INVLOC_HAND_RIGHT]._itype = ITYPE_NONE;
            CalcPlrInv(ptrplr, TRUE);
            return TRUE;
        }
    }

    if (ptrplr->InvBody[INVLOC_HAND_LEFT]._itype == ITYPE_NONE && ptrplr->InvBody[INVLOC_HAND_RIGHT]._itype == ITYPE_SHIELD) {
        if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability == DUR_INDESTRUCTIBLE) {
            return FALSE;
        }
        ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability--;
        if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability == 0) {
            NetSendCmdDelItem(TRUE, INVLOC_HAND_RIGHT);
            ptrplr->InvBody[INVLOC_HAND_RIGHT]._itype = ITYPE_NONE;
            CalcPlrInv(ptrplr, TRUE);
            return TRUE;
        }
    }

    if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._itype == ITYPE_NONE && ptrplr->InvBody[INVLOC_HAND_LEFT]._itype == ITYPE_SHIELD) {
        if (ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability == DUR_INDESTRUCTIBLE) {
            return FALSE;
        }
        ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability--;
        if (ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability == 0) {
            NetSendCmdDelItem(TRUE, INVLOC_HAND_LEFT);
            ptrplr->InvBody[INVLOC_HAND_LEFT]._itype = ITYPE_NONE;
            CalcPlrInv(ptrplr, TRUE);
            return TRUE;
        }
    }

    return FALSE;
}

unsigned char PlrHitMonst(PlayerStruct *ptrplr, int m)
{
    int hit, hper, mind, maxd;
    int ddp;
    long dam, skdam = 0;
    int phanditype;
    int tmac;
    unsigned char rv;
    unsigned char ret;

    if ((monster[m]._mhitpoints >> 6) <= 0)
        return FALSE;

    if (monster[m].MType->mtype == 0x20 && monster[m]._mgoal == 2)
        return FALSE;

    if (monster[m]._mmode == 14)
        return FALSE;

    rv = FALSE;
    hit = ENG_random(100);
    if (monster[m]._mmode == 15)
        hit = 0;

    tmac = monster[m].mArmorClass - ptrplr->_pIEnAc;
    hper = 50 + ptrplr->_pLevel - tmac + (ptrplr->_pDexterity >> 1);
    if (ptrplr->_pClass == CLASS_WARRIOR)
        hper += 20;
    hper += ptrplr->_pIBonusToHit;
    if (hper < 5)
        hper = 5;
    if (hper > 95)
        hper = 95;

    if (CheckMonsterHit(m, ret))
        return ret;

    if (hit < hper) {
        mind = ptrplr->_pIMinDam;
        maxd = ptrplr->_pIMaxDam;
        dam = ENG_random(maxd - mind + 1) + mind;
        dam += (dam * ptrplr->_pIBonusDam) / 100;
        dam += ptrplr->_pIBonusDamMod + ptrplr->_pDamageMod;
        if (ptrplr->_pClass == CLASS_WARRIOR) {
            ddp = ptrplr->_pLevel;
            if (ENG_random(100) < ddp)
                dam = dam << 1;
        }

        phanditype = -1;
        if (ptrplr->InvBody[4]._itype == 1 || ptrplr->InvBody[5]._itype == 1)
            phanditype = 1;
        if (ptrplr->InvBody[4]._itype == 4 || ptrplr->InvBody[5]._itype == 4)
            phanditype = 4;

        switch (monster[m].MData->mMonstClass) {
        case 0:
            if (phanditype == 1)
                dam -= dam >> 1;
            if (phanditype == 4)
                dam += dam >> 1;
            break;
        case 2:
            if (phanditype == 4)
                dam -= dam >> 1;
            if (phanditype == 1)
                dam += dam >> 1;
            break;
        }

        if ((ptrplr->_pIFlags & 0x40000000) && monster[m].MData->mMonstClass == 1)
            dam *= 3;

        dam <<= 6;
        if (ismyplr(ptrplr))
            monster[m]._mhitpoints -= dam;

        if (ptrplr->_pIFlags & 2) {
            skdam = ENG_random(dam >> 3);
            ptrplr->_pHitPoints += skdam;
            if (ptrplr->_pHitPoints > ptrplr->_pMaxHP)
                ptrplr->_pHitPoints = ptrplr->_pMaxHP;
            ptrplr->_pHPBase += skdam;
            if (ptrplr->_pHPBase > ptrplr->_pMaxHPBase)
                ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
            drawhpflag = TRUE;
        }
        if ((ptrplr->_pIFlags & 0x6000) && !(ptrplr->_pIFlags & 0x8000000)) {
            if (ptrplr->_pIFlags & 0x2000)
                skdam = 3 * dam / 100;
            if (ptrplr->_pIFlags & 0x4000)
                skdam = dam / 20;
            ptrplr->_pMana += skdam;
            if (ptrplr->_pMana > ptrplr->_pMaxMana)
                ptrplr->_pMana = ptrplr->_pMaxMana;
            ptrplr->_pManaBase += skdam;
            if (ptrplr->_pManaBase > ptrplr->_pMaxManaBase)
                ptrplr->_pManaBase = ptrplr->_pMaxManaBase;
            drawmanaflag = TRUE;
        }
        if (ptrplr->_pIFlags & 0x18000) {
            if (ptrplr->_pIFlags & 0x8000)
                skdam = 3 * dam / 100;
            if (ptrplr->_pIFlags & 0x10000)
                skdam = dam / 20;
            ptrplr->_pHitPoints += skdam;
            if (ptrplr->_pHitPoints > ptrplr->_pMaxHP)
                ptrplr->_pHitPoints = ptrplr->_pMaxHP;
            ptrplr->_pHPBase += skdam;
            if (ptrplr->_pHPBase > ptrplr->_pMaxHPBase)
                ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
            drawhpflag = TRUE;
        }
        if (ptrplr->_pIFlags & 0x100)
            monster[m]._mFlags |= 8;

        if ((monster[m]._mhitpoints >> 6) <= 0) {
            if (monster[m]._mmode == 15) {
                M_StartKill(m, ptrplr);
                monster[m]._mmode = 15;
            } else {
                M_StartKill(m, ptrplr);
            }
        } else {
            if (monster[m]._mmode == 15) {
                M_StartHit(m, ptrplr, dam);
                monster[m]._mmode = 15;
            } else {
                if (ptrplr->_pIFlags & 0x800)
                    M_GetKnockback(m, ptrplr->_pdir);
                M_StartHit(m, ptrplr, dam);
            }
        }
        rv = TRUE;
    }
    return rv;
}

unsigned char PlrHitPlr(PlayerStruct *ptrplr, char p)
{
    int hit, hper, mind, maxd;
    int ddp;
    long dam, skdam;
    int tac;
    int blk, blkper;
    unsigned char rv;

    if (p == plrind(ptrplr))
        return FALSE;
    rv = FALSE;
    if (plr[p]._pInvincible)
        return rv;
    if ((plr[p]._pSpellFlags & 1) != 0)
        return rv;

    hit = ENG_random(100);
    tac = plr[p]._pIAC + plr[p]._pIBonusAC;
    tac += (plr[p]._pDexterity / 5);
    hper = 50 + ptrplr->_pLevel - tac + (ptrplr->_pDexterity >> 1);
    if (ptrplr->_pClass == CLASS_WARRIOR)
        hper += 20;
    hper += ptrplr->_pIBonusToHit;
    if (hper < 5)
        hper = 5;
    if (hper > 95)
        hper = 95;
    if (((plr[p]._pmode == PM_STAND) || (plr[p]._pmode == PM_ATTACK)) && (plr[p]._pBlockFlag))
        blk = ENG_random(100);
    else
        blk = 100;
    blkper = plr[p]._pBaseToBlk + plr[p]._pDexterity - ((ptrplr->_pLevel - plr[p]._pLevel) << 1);
    if (blkper < 0)
        blkper = 0;
    if (blkper > 100)
        blkper = 100;
    if (hit < hper) {
        if (blk < blkper) {
            StartPlrBlock(p, GetDirection(plr[p]._px, plr[p]._py, ptrplr->_px, ptrplr->_py));
        } else {
            mind = ptrplr->_pIMinDam;
            maxd = ptrplr->_pIMaxDam;
            dam = ENG_random(maxd - mind + 1) + mind;
            dam += (dam * ptrplr->_pIBonusDam) / 100;
            dam += ptrplr->_pIBonusDamMod + ptrplr->_pDamageMod;
            if (ptrplr->_pClass == CLASS_WARRIOR) {
                ddp = ptrplr->_pLevel;
                if (ENG_random(100) < ddp)
                    dam = dam << 1;
            }
            dam = dam << 6;
            if (ptrplr->_pIFlags & 2) {
                skdam = ENG_random(dam >> 3);
                ptrplr->_pHitPoints += skdam;
                if (ptrplr->_pHitPoints > ptrplr->_pMaxHP)
                    ptrplr->_pHitPoints = ptrplr->_pMaxHP;
                ptrplr->_pHPBase += skdam;
                if (ptrplr->_pHPBase > ptrplr->_pMaxHPBase)
                    ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
                drawhpflag = TRUE;
            }
            if (ismyplr(ptrplr))
                NetSendCmdDamage(TRUE, p, dam);
            StartPlrHit(p, dam, FALSE);
        }
        rv = TRUE;
    }
    return rv;
}

unsigned char PlrHitObj(PlayerStruct *ptrplr, int mx, int my)
{
    int oi;

    if (dung_map[mx][my].dObject > 0)
        oi = dung_map[mx][my].dObject - 1;
    else
        oi = -(dung_map[mx][my].dObject + 1);
    if (object[oi]._oBreak == 1) {
        BreakObject(ptrplr, oi);
        return TRUE;
    }
    return FALSE;
}

int PM_DoAttack(PlayerStruct *ptrplr)
{
    int dx, dy, m;
    char p;
    unsigned char didhit = FALSE;
    int frame;

    frame = ptrplr->_pAnimFrame;

    if ((ptrplr->_pIFlags & 0x20000) && (frame == 1))
        ptrplr->_pAnimFrame++;

    if ((ptrplr->_pIFlags & 0x40000) && (frame == 1 || frame == 3))
        ptrplr->_pAnimFrame++;

    if ((ptrplr->_pIFlags & 0x80000) && (frame == 1 || frame == 3 || frame == 5))
        ptrplr->_pAnimFrame++;

    if ((ptrplr->_pIFlags & 0x100000) && (frame == 1 || frame == 4))
        ptrplr->_pAnimFrame += 2;

    if (ptrplr->_pAnimFrame == (ptrplr->_pAFNum - 1))
        PlaySfxLoc(ptrplr->_pwtype ? 4 : 9, ptrplr->_px, ptrplr->_py);

    if (ptrplr->_pAnimFrame == ptrplr->_pAFNum) {
        dx = ptrplr->_pVar6;
        dy = ptrplr->_pVar7;

        if (dung_map[dx][dy].dMonster != 0) {
            if (dung_map[dx][dy].dMonster > 0)
                m = dung_map[dx][dy].dMonster - 1;
            else
                m = -(dung_map[dx][dy].dMonster + 1);
            if (CanTalkToMonst(m)) {
                ptrplr->_pVar1 = 0;
                return 0;
            }
        }

        if (ptrplr->_pIFlags & 0x10)
            AddMissile(dx, dy, 1, 0, 0, 0x40, 0, ptrplr != plr, 0, 0);
        if (ptrplr->_pIFlags & 0x20)
            AddMissile(dx, dy, 2, 0, 0, 0x40, 0, ptrplr != plr, 0, 0);

        if (dung_map[dx][dy].dMonster != 0) {
            if (dung_map[dx][dy].dMonster > 0)
                m = dung_map[dx][dy].dMonster - 1;
            else
                m = -(dung_map[dx][dy].dMonster + 1);
            didhit = PlrHitMonst(ptrplr, m);
        } else {
            if (IsDplayer(dx, dy) && !FriendlyMode) {
                if (IsDplayer(dx, dy) > 0)
                    p = IsDplayer(dx, dy) - 1;
                else
                    p = -(IsDplayer(dx, dy) + 1);
                didhit = PlrHitPlr(ptrplr, p);
            } else {
                if (dung_map[dx][dy].dObject > 0)
                    didhit = PlrHitObj(ptrplr, dx, dy);
            }
        }

        if (didhit && WeaponDur(ptrplr, 30)) {
            StartStand(ptrplr, ptrplr->_pdir);
            ClearPlrPVars(ptrplr);
            return 1;
        }
    }

    if (ptrplr->_pAnimFrame == ptrplr->_pAFrames) {
        StartStand(ptrplr, ptrplr->_pdir);
        ClearPlrPVars(ptrplr);
        return 1;
    } else
        return 0;
}


/* PSX drops devilution's ISPL_QUICKATTACK/ISPL_FASTATTACK origFrame-skip logic entirely (goes
 * straight from entry to the `_pAnimFrame==_pAFNum` fire check). */
int PM_DoRangeAttack(PlayerStruct *ptrplr)
{
    int mistype;
    if (ptrplr->_pAnimFrame == ptrplr->_pAFNum) {
        mistype = (ptrplr->_pIFlags & ISPL_FIRE_ARROWS) ? MIS_FARROW : MIS_ARROW;
        if (ptrplr->_pIFlags & ISPL_LIGHT_ARROWS) {
            mistype = MIS_LARROW;
        }
        AddMissile(ptrplr->_px, ptrplr->_py, ptrplr->_pVar1, ptrplr->_pVar2, ptrplr->_pdir, mistype, 0, ptrplr != plr, 4, 0);

        PlaySfxLoc(4, ptrplr->_px, ptrplr->_py);

        if (WeaponDur(ptrplr, 40)) {
            StartStand(ptrplr, ptrplr->_pdir);
            ClearPlrPVars(ptrplr);
            return 1;
        }
    }

    if (ptrplr->_pAnimFrame >= ptrplr->_pAFrames) {
        StartStand(ptrplr, ptrplr->_pdir);
        ClearPlrPVars(ptrplr);
        return 1;
    }
    return 0;
}


/* PSX replaces the `pnum != myplr` early-out with `!ismyplr(ptrplr)` (ptr form). */
void ShieldDur(PlayerStruct *ptrplr)
{
    if (!ismyplr(ptrplr)) {
        return;
    }

    if (ptrplr->InvBody[INVLOC_HAND_LEFT]._itype == ITYPE_SHIELD) {
        if (ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability == DUR_INDESTRUCTIBLE) {
            return;
        }
        ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability--;
        if (ptrplr->InvBody[INVLOC_HAND_LEFT]._iDurability == 0) {
            NetSendCmdDelItem(TRUE, INVLOC_HAND_LEFT);
            ptrplr->InvBody[INVLOC_HAND_LEFT]._itype = ITYPE_NONE;
            CalcPlrInv(ptrplr, TRUE);
        }
    }

    if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._itype == ITYPE_SHIELD) {
        if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability != DUR_INDESTRUCTIBLE) {
            ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability--;
            if (ptrplr->InvBody[INVLOC_HAND_RIGHT]._iDurability == 0) {
                NetSendCmdDelItem(TRUE, INVLOC_HAND_RIGHT);
                ptrplr->InvBody[INVLOC_HAND_RIGHT]._itype = ITYPE_NONE;
                CalcPlrInv(ptrplr, TRUE);
            }
        }
    }
}


int PM_DoBlock(PlayerStruct *ptrplr)
{
    if ((ptrplr->_pIFlags & ISPL_FASTBLOCK) && ptrplr->_pAnimFrame != 1) {
        ptrplr->_pAnimFrame = ptrplr->_pBFrames;
    }

    if (ptrplr->_pAnimFrame >= ptrplr->_pBFrames) {
        StartStand(ptrplr, ptrplr->_pdir);
        ClearPlrPVars(ptrplr);

        if (ENG_random(10) == 0) {
            ShieldDur(ptrplr);
        }
        return 1;
    }
    return 0;
}

/* PsyQ libgpu primitive macros (psxsrc/psyq.h spelling; that header's POLY_FT4 typedef clashes with
 * gen/structs_player.h, so the few macros this TU needs are restated here). */
/* verbatim PsyQ 4.0 LIBGPU.H primitive-handling macros (u_char/u_long spelled out) */

void do_spell_anim(int aframe, int spell, int clss, PlayerStruct *ptrplr)
{
    CPlayer *test = CPlayer::GetPlayer(ptrplr != plr);
    int OtPos = test->GetLastOtPos();
    int ScrX = test->GetLastScrX() + 16;
    int ScrY = test->GetLastScrY() - 2;
    TextDat *missdat = MissDat;
    TextDat *objdat;
    POLY_FT4 *FT4a;
    POLY_FT4 *FT4b;
    int frame;

    switch (spell) {
    case 1:
    case 6:
    case 12:
    case 15:
    case 20:
    case 24:
    case 29:
        objdat = GM_UseTexData(0xCE);
        frame = aframe + 30;
        PRIM_GetPrim(&FT4a);
        objdat->PrepareFt4(FT4a, frame, ScrX + 56, ScrY + 72, 0, 0);
        setRGB0(FT4a, 128, 128, 128);
        setSemiTrans(FT4a, 0);
        setShadeTex(FT4a, 0);
        addPrim(ThisOt + OtPos, FT4a);
        GM_FinishedUsing(objdat);
        ChangeLightColour(ptrplr->_plid, 0x90);
        break;
    case 2:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 19:
    case 21:
    case 23:
    case 26:
    case 27:
    case 28:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
        ScrY += 16;
        if (leveltype)
            frame = missdat->GetFrNum(0x11, 0, 0, aframe);
        else
            frame = missdat->GetFrNum(0, 0, 0, aframe);
        frame &= 0xFFFF;
        PRIM_GetPrim(&FT4a);
        missdat->PrepareFt4(FT4a, frame, ScrX - 16, ScrY - aframe * 2, 0, 0);
        if (leveltype)
            frame = missdat->GetFrNum(0x12, 0, 0, aframe);
        else
            frame = missdat->GetFrNum(1, 0, 0, aframe);
        frame &= 0xFFFF;
        PRIM_GetPrim(&FT4b);
        missdat->PrepareFt4(FT4b, frame, ScrX - 16, ScrY - aframe * 2, 0, 0);
        setRGB0(FT4a, 64, 64, 240);
        setRGB0(FT4b, 64, 64, 240);
        setSemiTrans(FT4a, 1);
        setSemiTrans(FT4b, 1);
        setShadeTex(FT4a, 0);
        setShadeTex(FT4b, 0);
        addPrim(ThisOt + OtPos, FT4a);
        addPrim(ThisOt + OtPos - 1, FT4b);
        ChangeLightColour(ptrplr->_plid, 0x3C0);
        break;
    case 3:
    case 14:
    case 18:
    case 30:
        objdat = GM_UseTexData(0xCE);
        frame = (aframe * 2) / 5 + 24;
        PRIM_GetPrim(&FT4a);
        objdat->PrepareFt4(FT4a, frame, ScrX - 16, ScrY + 4, 0, 0);
        setRGB0(FT4a, 128, 128, 240);
        setSemiTrans(FT4a, 0);
        setShadeTex(FT4a, 0);
        addPrim(ThisOt + OtPos, FT4a);
        GM_FinishedUsing(objdat);
        ChangeLightColour(ptrplr->_plid, 0x40);
        break;
    default:
        if (!(!"bad spell cast!"))
            DBG_Error(NULL, "source/PLAYER.cpp", 0xCB1);
        break;
    }
}

/* PSX-specific "held spell still available?" re-check after casting: for RSplType==2 (scroll) tests
 * _pScrlSpells, for ==3 (charges) tests _pISpells, both as a 64-bit bit-test on (_pRSpell-1); resets
 * the queued repeat-spell to none (-1 / RSPLTYPE_INVALID=4) if the bit isn't set. `_pSpell` literal
 * ids used directly (23=teleport, 10=phase, 2=heal, 0x22=healother) match TeleStart/PhaseStart/
 * HealStart/HealotherStart's trigger checks seen elsewhere in this TU. */
int PM_DoSpell(PlayerStruct *ptrplr)
{
    if (invflag)
        return 0;

    if (ptrplr->_pVar8 < ptrplr->_pSFNum) {
        do_spell_anim(ptrplr->_pVar8, ptrplr->_pSpell, ptrplr->_pClass, ptrplr);
    } else if (ptrplr->_pVar8 == ptrplr->_pSFNum) {
        if (ptrplr->_pSpell == 24)
            ApocaStart(ptrplr != plr);
        CastSpell(ptrplr != plr, ptrplr->_pSpell, ptrplr->_px, ptrplr->_py, ptrplr->_pVar1, ptrplr->_pVar2, 0, ptrplr->_pVar4);

        if (ptrplr->_pSplFrom == 0) {
            if (ptrplr->_pRSplType == 2 && ((ptrplr->_pScrlSpells >> (ptrplr->_pRSpell - 1)) & 1) == 0) {
                ptrplr->_pRSpell = -1;
                ptrplr->_pRSplType = 4;
            }
            if (ptrplr->_pRSplType == 3 && ((ptrplr->_pISpells >> (ptrplr->_pRSpell - 1)) & 1) == 0) {
                ptrplr->_pRSpell = -1;
                ptrplr->_pRSplType = 4;
            }
        }
    }

    if (ptrplr->_pSpell == 23 && ptrplr->_pVar8 == 1)
        TeleStart(ptrplr);
    if (ptrplr->_pSpell == 10 && ptrplr->_pVar8 == 1)
        PhaseStart(ptrplr);
    if (ptrplr->_pSpell == 2 && ptrplr->_pVar8 == 1)
        HealStart(ptrplr);
    if (ptrplr->_pSpell == 0x22 && ptrplr->_pVar8 == 1)
        HealotherStart(ptrplr);

    ptrplr->_pVar8++;
    if (leveltype == 0) {
        if (ptrplr->_pVar8 > ptrplr->_pSFrames) {
            if (_spselflag[plrind(ptrplr)] == 0 && !SelectorActive())
                PostGamePad(ptrplr != plr ? 7 : 6, 0, 0, 0);
            StartWalkStand(ptrplr);
            ClearPlrPVars(ptrplr);
            if (ptrplr->_pSpell != 10)
                PhaseEnd(ptrplr);
            return 1;
        }
    } else {
        if (ptrplr->_pAnimFrame == ptrplr->_pSFrames) {
            if (_spselflag[plrind(ptrplr)] == 0 && !SelectorActive())
                PostGamePad(ptrplr != plr ? 7 : 6, 0, 0, 0);
            StartStand(ptrplr, ptrplr->_pdir);
            ClearPlrPVars(ptrplr);
            if (ptrplr->_pSpell != 10)
                PhaseEnd(ptrplr);
            return 1;
        }
    }
    return 0;
}


/* SYM shows retail keeps a SEPARATE `PlayerStruct *p = ptrplr;` local (matching devilution's
 * original `p = &plr[pnum];`), not just the incoming `ptrplr` param reused directly. */
static void ArmorDur(PlayerStruct *ptrplr)
{
    if (!ismyplr(ptrplr)) {
        return;
    }

    PlayerStruct *p = ptrplr;
    if (p->InvBody[INVLOC_CHEST]._itype == ITYPE_NONE && p->InvBody[INVLOC_HEAD]._itype == ITYPE_NONE) {
        return;
    }

    int a = ENG_random(3);
    if (p->InvBody[INVLOC_CHEST]._itype != ITYPE_NONE && p->InvBody[INVLOC_HEAD]._itype == ITYPE_NONE) {
        a = 1;
    }
    if (p->InvBody[INVLOC_CHEST]._itype == ITYPE_NONE && p->InvBody[INVLOC_HEAD]._itype != ITYPE_NONE) {
        a = 0;
    }

    ItemStruct *pi;
    if (a != 0) {
        pi = p->InvBody + INVLOC_CHEST;
    } else {
        pi = p->InvBody + INVLOC_HEAD;
    }
    if (pi->_iDurability == DUR_INDESTRUCTIBLE) {
        return;
    }

    pi->_iDurability--;
    if (pi->_iDurability != 0) {
        return;
    }

    if (a != 0) {
        NetSendCmdDelItem(TRUE, INVLOC_CHEST);
    } else {
        NetSendCmdDelItem(TRUE, INVLOC_HEAD);
    }
    pi->_itype = ITYPE_NONE;
    CalcPlrInv(ptrplr, TRUE);
}

int PM_DoGotHit(PlayerStruct *ptrplr)
{
    int rv;
    if (ptrplr->_pVar8 == ptrplr->_pHFrames) {
        StartStand(ptrplr, ptrplr->_pdir);
        ClearPlrPVars(ptrplr);
        if (ENG_random(4) != 0) {
            ArmorDur(ptrplr);
        }
        rv = 1;
    } else {
        ptrplr->_pVar8++;
        rv = 0;
    }
    ChangeLightColour(ptrplr->_plid, 0x23F0);
    return rv;
}

/* PSX-only death sequencing: D_8011C878[plrind(ptrplr)] is a small per-player post-death countdown
 * (unnamed in the SYM, TU-owned) that must count down to exactly 1 before this player's vision/
 * cursor/active-count cleanup actually runs; not present in devilution's PM_DoDeath at all. */
int PM_DoDeath(PlayerStruct *ptrplr)
{
    int pnum = plrind(ptrplr);

    TryDropPlayerItems(ptrplr);
    if (ptrplr->_pVar8 >= ptrplr->_pDFrames * 2) {
        if (D_8011C878[pnum] >= 2 && ismyplr(ptrplr)) {
            if (--D_8011C878[pnum] == 1) {
                RemovePlrFromMap(ptrplr);
                ptrplr->plractive = FALSE;
                if (--gbActivePlayers == 0) {
                    deathflag = TRUE;
                    PA_SetPauseOk(FALSE);
                } else {
                    int vid = ptrplr->_pvid;
                    LightListStruct *vl;
                    dovision = FALSE;
                    for (int i = 0; i < numvision && !dovision; i++) {
                        if (VisionList[i]._lid == vid) {
                            vid = i;
                            VisionList[i]._ldel = TRUE;
                            dovision = TRUE;
                        }
                    }
                    vl = &VisionList[vid];
                    DoUnVision(vl->_lx, vl->_ly, vl->_lradius, pnum);
                    ptrplr->_pvid = -1;
                }
                ClrCursor(plrind(ptrplr));
            }
        }
        ptrplr->_pAnimDelay = 10000;
        ptrplr->_pAnimFrame = ptrplr->_pAnimLen;
    }

    if (ptrplr->_pVar8 < 100)
        ptrplr->_pVar8++;
    return 0;
}

int PM_DoNewLvl(PlayerStruct *ptrplr)
{
    return FALSE;
}

void CheckNewPath(PlayerStruct *ptrplr)
{
    int i, dx, dy, d, oi;

    if (ptrplr->walkpath[0] != -1)
        return;
    if (ptrplr->destAction == -1)
        return;

    switch (ptrplr->destAction) {
    case 9: /* PCMD_ATTACK */
        d = GetDirection(ptrplr->_px, ptrplr->_py, ptrplr->destParam1, ptrplr->destParam2);
        StartAttack(ptrplr, d);
        break;
    case 12: /* PCMD_SPELL */
        d = GetDirection(ptrplr->_px, ptrplr->_py, ptrplr->destParam1, ptrplr->destParam2);
        StartSpell(ptrplr, d, ptrplr->destParam1, ptrplr->destParam2);
        ptrplr->_pVar4 = ptrplr->destParam3;
        break;
    case 26: /* PCMD_SPELLXYD */
        StartSpell(ptrplr != plr, ptrplr->destParam3, ptrplr->destParam1, ptrplr->destParam2);
        ptrplr->_pVar3 = ptrplr->destParam3;
        ptrplr->_pVar4 = ptrplr->destParam4;
        break;
    case 24: /* PCMD_SPELLID */
        i = ptrplr->destParam1;
        d = GetDirection(ptrplr->_px, ptrplr->_py, monster[i]._mfutx, monster[i]._mfuty);
        StartSpell(plrind(ptrplr), d, monster[i]._mfutx, monster[i]._mfuty);
        ptrplr->_pVar4 = ptrplr->destParam2;
        break;
    case 25: /* PCMD_SPELLPID */
        i = ptrplr->destParam1;
        d = GetDirection(ptrplr->_px, ptrplr->_py, plr[i]._px, plr[i]._py);
        StartSpell(plrind(ptrplr), d, plr[i]._px, plr[i]._py);
        ptrplr->_pVar4 = ptrplr->destParam2;
        break;
    case 13: /* PCMD_OPOBJ */
        OperateObject(ptrplr, ptrplr->destParam1, FALSE);
        break;
    case 14: /* PCMD_DISARM */
        oi = ptrplr->destParam1;
        TryDisarm(ptrplr, oi);
        OperateObject(ptrplr, oi, FALSE);
        break;
    case 18: /* PCMD_TELEK */
        oi = ptrplr->destParam1;
        if (object[oi]._oBreak != 1)
            OperateObject(ptrplr, oi, TRUE);
        break;
    case 15: /* PCMD_REQGETITEM */
        i = ptrplr->destParam1;
        dx = abs(ptrplr->_px - item[i]._ix);
        dy = abs(ptrplr->_py - item[i]._iy);
        if (!item[i]._iRequest) {
            NetSendCmdGItem(TRUE, 0x27, myplr, myplr, i);
            item[i]._iRequest = TRUE;
        }
        break;
    case 16: /* PCMD_REQAGETITEM */
        i = ptrplr->destParam1;
        dx = abs(ptrplr->_px - item[i]._ix);
        dy = abs(ptrplr->_py - item[i]._iy);
        NetSendCmdGItem(TRUE, 0x28, myplr, myplr, i);
        break;
    case 17: /* PCMD_TALK */
        if (stextflag)
            break;
        i = ptrplr->destParam1;
        if (leveltype) {
            if (currlevel != 15 || !setlevel) {
                if (monster[i].mtalkmsg != 0 && monster[i].mtalkmsg != 0x24) {
                    TalktoMonster(i);
                    options_pad = plrind(ptrplr);
                }
            }
        } else {
            TalkToTowner(ptrplr, i);
        }
        if (options_pad == -1 && !qtextflag && !stextflag)
            options_pad = -1;
        else
            options_pad = plrind(ptrplr);
        break;
    }
    ptrplr->destAction = -1;
}

unsigned char PlrDeathModeOK(int p)
{
    if (p != myplr) {
        return TRUE;
    }
    if (plr[p]._pmode == PM_DEATH) {
        return TRUE;
    } else if (plr[p]._pmode == PM_QUIT) {
        return TRUE;
    } else if (plr[p]._pmode == PM_NEWLVL) {
        return TRUE;
    }
    return FALSE;
}

void ValidatePlayer(void)
{
    int i, gt, pc;
    unsigned long long msk = 0;
    unsigned long long b = 1;

    if (plr[myplr]._pLevel > 50)
        plr[myplr]._pLevel = 50;
    if (plr[myplr]._pExperience > plr[myplr]._pNextExper)
        plr[myplr]._pExperience = plr[myplr]._pNextExper;
    gt = 0;
    for (i = 0; i < plr[myplr]._pNumInv; i++) {
        if (plr[myplr].InvList[i]._itype == 11) {
            if (!goldcheat && plr[myplr].InvList[i]._ivalue > 5000)
                plr[myplr].InvList[i]._ivalue = 5000;
            gt += plr[myplr].InvList[i]._ivalue;
        }
    }
    if (gt != plr[myplr]._pGold)
        plr[myplr]._pGold = gt;
    pc = plr[myplr]._pClass;
    if (plr[myplr]._pBaseStr > MaxStats[pc][0])
        plr[myplr]._pBaseStr = MaxStats[pc][0];
    if (plr[myplr]._pBaseMag > MaxStats[pc][1])
        plr[myplr]._pBaseMag = MaxStats[pc][1];
    if (plr[myplr]._pBaseDex > MaxStats[pc][2])
        plr[myplr]._pBaseDex = MaxStats[pc][2];
    if (plr[myplr]._pBaseVit > MaxStats[pc][3])
        plr[myplr]._pBaseVit = MaxStats[pc][3];

    if (!allspellsflag) {
        for (i = 1; i < 37; i++) {
            if (spelldata[i].sBookLvl != -1) {
                msk |= (b << (i - 1));
                if (plr[myplr]._pSplLvl[i] > 15)
                    plr[myplr]._pSplLvl[i] = 15;
            }
        }
        plr[myplr]._pMemSpells &= msk;
    }
}

static void CheckCheatStats(PlayerStruct *ptrplr)
{
    if (ptrplr->_pStrength > 750)
        ptrplr->_pStrength = 750;
    if (ptrplr->_pDexterity > 750)
        ptrplr->_pDexterity = 750;
    if (ptrplr->_pMagic > 750)
        ptrplr->_pMagic = 750;
    if (ptrplr->_pVitality > 750)
        ptrplr->_pVitality = 750;
    if (ptrplr->_pHitPoints > 128000)
        ptrplr->_pHitPoints = 128000;
    if (ptrplr->_pMana > 128000)
        ptrplr->_pMana = 128000;
}

void ProcessPlayers(void)
{
    int raflag;
    int pnum;
    int tplayer = myplr;

    if (sfxdelay > 0) {
        sfxdelay--;
        if (sfxdelay == 0)
            PlaySFX(sfxdnum);
    }

    for (pnum = 0; pnum < MAX_PLRS; pnum++) {
        PlayerStruct *ptrplr = &plr[pnum];
        myplr = pnum;
        sel_data = pnum;
        if (ptrplr->pLvlLoad)
            ptrplr->pLvlLoad--;
        if (!ptrplr->plractive)
            continue;
        if (IsGameLoading())
            continue;

        ValidatePlayer();
        CheckCheatStats(ptrplr);

        if ((!PlrDeathModeOK(pnum)) && ((ptrplr->_pHitPoints >> 6) <= 0))
            StartPlrKill(pnum, 0);

        if ((ptrplr->_pIFlags & 0x40) && (currlevel != 0)) {
            ptrplr->_pHitPoints -= 4;
            ptrplr->_pHPBase -= 4;
            if ((ptrplr->_pHitPoints >> 6) <= 0)
                StartPlrKill(pnum, 0);
            drawhpflag = TRUE;
        }

        if (ptrplr->_pIFlags & 0x8000000) {
            if (ptrplr->_pManaBase > 0) {
                ptrplr->_pManaBase -= ptrplr->_pMana;
                ptrplr->_pMana = 0;
                drawmanaflag = TRUE;
            }
        }

        raflag = 0;
        do {
            switch (ptrplr->_pmode) {
            case PM_STAND:
                raflag = PM_DoStand(ptrplr);
                break;
            case PM_WALK:
                raflag = PM_DoWalk(ptrplr);
                break;
            case PM_ATTACK:
                raflag = PM_DoAttack(ptrplr);
                break;
            case PM_RATTACK:
                raflag = PM_DoRangeAttack(ptrplr);
                break;
            case PM_BLOCK:
                raflag = PM_DoBlock(ptrplr);
                break;
            case PM_SPELL:
                raflag = PM_DoSpell(ptrplr);
                break;
            case PM_GOTHIT:
                raflag = PM_DoGotHit(ptrplr);
                break;
            case PM_DEATH:
                raflag = PM_DoDeath(ptrplr);
                break;
            case PM_NEWLVL:
                raflag = PM_DoNewLvl(ptrplr);
                break;
            }
            CheckNewPath(ptrplr);
        } while (raflag != 0);

        ptrplr->_pAnimCnt++;
        if (ptrplr->_pAnimCnt > ptrplr->_pAnimDelay) {
            ptrplr->_pAnimCnt = 0;
            ptrplr->_pAnimFrame++;
            if (ptrplr->_pAnimFrame > ptrplr->_pAnimLen)
                ptrplr->_pAnimFrame = 1;
        }
    }
    sel_data = tplayer;
    myplr = tplayer;
}

void ClrPlrPath(PlayerStruct *ptrplr)
{
    memset(ptrplr->walkpath, 0xFF, 25);
}

/* PSX has no persistent dPlayer[][]/dMonster[][]/dObject[][] arrays -- dMonster/dObject are FIELDS
 * of dung_map[x][y], and the player-occupancy grid is replaced by calling IsDplayer(x,y) in place
 * of every `dPlayer[x][y]` read (literally, textually -- the source keeps devilution's `>0 ? -1 :
 * -(+1)` decode even though IsDplayer can never return negative, hence the seemingly-redundant
 * repeated calls: retail really does call IsDplayer(x,y) four times, never caching it).
 * Also drops the whole bounds-check (x>=0 etc, callers already clamp). */
unsigned char PosOkPlayer(PlayerStruct *ptrplr, int px, int py)
{
    int mi;
    int p;
    char bv;
    map_info *dm = &dung_map[px][py];

    if (SolidLoc(px, py))
        return FALSE;

    if (IsDplayer(px, py)) {
        if (IsDplayer(px, py) > 0)
            p = IsDplayer(px, py) - 1;
        else
            p = -(IsDplayer(px, py) + 1);
        if (p != plrind(ptrplr) && plr[p]._pHitPoints != 0)
            return FALSE;
    }

    if (dm->dMonster != 0) {
        if (currlevel == 0)
            return FALSE;
        if (dm->dMonster > 0) {
            mi = dm->dMonster - 1;
            if ((monster[mi]._mhitpoints >> 6) > 0)
                return FALSE;
        } else
            return FALSE;
    }

    if (dm->dObject != 0) {
        if (dm->dObject > 0)
            bv = dm->dObject - 1;
        else
            bv = -(dm->dObject + 1);
        if (object[bv]._oSolidFlag)
            return FALSE;
    }

    return TRUE;
}

void MakePlrPath(PlayerStruct *ptrplr, int xx, int yy, unsigned char endspace)
{
}

void CheckPlrSpell(void)
{
    int sd;
    SpellTarget *spl = GetSpellTarget(myplr);
    unsigned char addflag = FALSE;
    PlayerStruct *player = &plr[myplr];
    int rspell;

    if (spl->Active()) {
        cursmx = spl->_stx;
        cursmy = spl->_sty;
    } else {
        cursmx = player->_px + offset_x[player->_pdir];
        cursmy = player->_py + offset_y[player->_pdir];
    }

    rspell = player->_pRSpell;
    if (rspell == -1) {
        if (player->_pClass == CLASS_WARRIOR)
            PlaySFX(0x2F3);
        else if (player->_pClass == CLASS_ROGUE)
            PlaySFX(0x285);
        else if (player->_pClass == CLASS_SORCERER)
            PlaySFX(0x21D);
        return;
    }

    if (leveltype == DTYPE_TOWN && !spelldata[rspell].sTownSpell) {
        if (player->_pClass == CLASS_WARRIOR)
            PlaySFX(0x2EC);
        else if (player->_pClass == CLASS_ROGUE)
            PlaySFX(0x27E);
        else if (player->_pClass == CLASS_SORCERER)
            PlaySFX(0x216);
        return;
    }

    switch (player->_pRSplType) {
    case 0:
    case 1:
        addflag = CheckSpell(myplr, player->_pRSpell, player->_pRSplType, FALSE);
        break;
    case 2:
        addflag = UseScroll();
        break;
    case 3:
        addflag = UseStaff();
        break;
    }

    if (addflag) {
        if (player->_pRSpell == 6) {
            sd = GetDirection(player->_px, player->_py, cursmx, cursmy);
            NetSendCmdLocParam3(TRUE, 0x54, cursmx, cursmy, player->_pRSpell, sd, GetSpellLevel(myplr, player->_pRSpell));
        } else if (_pcursmonst[sel_data] != -1 && !spl->active) {
            NetSendCmdParam3(TRUE, 0x16, _pcursmonst[sel_data], player->_pRSpell, GetSpellLevel(myplr, player->_pRSpell));
        } else if (_pcursplr[sel_data] != -1) {
            NetSendCmdParam3(TRUE, 0x17, _pcursplr[sel_data], player->_pRSpell, GetSpellLevel(myplr, player->_pRSpell));
        } else {
            NetSendCmdLocParam2(TRUE, 0xE, cursmx, cursmy, player->_pRSpell, GetSpellLevel(myplr, player->_pRSpell));
        }
    } else {
        if (player->_pRSplType == 1) {
            int SplLvl = player->_pSplLvl[player->_pRSpell] + player->_pISplLvlAdd;
            if (SplLvl == 0) {
                if (player->_pClass == CLASS_WARRIOR)
                    PlaySFX(0x2ED);
                else if (player->_pClass == CLASS_ROGUE)
                    PlaySFX(0x27F);
                else if (player->_pClass == CLASS_SORCERER)
                    PlaySFX(0x217);
            } else {
                if (player->_pClass == CLASS_WARRIOR)
                    PlaySFX(0x2F4);
                else if (player->_pClass == CLASS_ROGUE)
                    PlaySFX(0x286);
                else if (player->_pClass == CLASS_SORCERER)
                    PlaySFX(0x21E);
            }
        }
    }
}

/* PSX drops the whole devilution PosOkPortal fallback-search spiral, the dPlayer occupancy write,
 * and the myplr/_ptargx/_ptargy/ViewX/ViewY block entirely -- just probes the 8 ring offsets and
 * applies whichever one worked (or the last one tried, HELLFIRE-style unconditional apply). */
void SyncInitPlrPos(PlayerStruct *ptrplr)
{
    int i;
    if (gbMaxPlayers != 1) {
        for (i = 0; i < 8; i++) {
            if (PosOkPlayer(ptrplr, ptrplr->_px + plrxoff2[i], ptrplr->_py + plryoff2[i]))
                break;
        }
        ptrplr->_px += plrxoff2[i];
        ptrplr->_py += plryoff2[i];
    }
}

void SyncInitPlr(PlayerStruct *ptrplr)
{
    SetPlrAnims(ptrplr);
    SyncInitPlrPos(ptrplr);
}

/* PSX narrows the class cascade to 3 (warrior/rogue/sorcerer), matching the rest of the file. */
void CheckStats(int p)
{
    int c;
    int i;
    PlayerStruct *player = &plr[p];

    c = 0;
    if (player->_pClass == CLASS_WARRIOR) {
        c = CLASS_WARRIOR;
    } else if (player->_pClass == CLASS_ROGUE) {
        c = CLASS_ROGUE;
    } else if (player->_pClass == CLASS_SORCERER) {
        c = CLASS_SORCERER;
    }

    for (i = 0; i < 4; i++) {
        switch (i) {
        case 0:
            if (player->_pBaseStr > MaxStats[c][0]) {
                player->_pBaseStr = MaxStats[c][0];
            } else if (player->_pBaseStr < 0) {
                player->_pBaseStr = 0;
            }
            break;
        case 1:
            if (player->_pBaseMag > MaxStats[c][1]) {
                player->_pBaseMag = MaxStats[c][1];
            } else if (player->_pBaseMag < 0) {
                player->_pBaseMag = 0;
            }
            break;
        case 2:
            if (player->_pBaseDex > MaxStats[c][2]) {
                player->_pBaseDex = MaxStats[c][2];
            } else if (player->_pBaseDex < 0) {
                player->_pBaseDex = 0;
            }
            break;
        case 3:
            if (player->_pBaseVit > MaxStats[c][3]) {
                player->_pBaseVit = MaxStats[c][3];
            } else if (player->_pBaseVit < 0) {
                player->_pBaseVit = 0;
            }
            break;
        }
    }
    if (player->_pMana > player->_pMaxMana)
        player->_pMana = player->_pMaxMana;
    if (player->_pManaBase > player->_pMaxManaBase)
        player->_pManaBase = player->_pMaxManaBase;
}

/* PSX drops the myplr NetSendCmdParam1(CMD_SETSTR,...) network-sync tail every Modify/SetPlr* stat
 * function has in devilution (no netcode on this build). */
/* SYM confirms retail caches a named `PlayerStruct *player = &plr[p];` local (REG $a2) and an `int
 * ms` -- not a repeated `plr[p]` re-index. */
void ModifyPlrStr(int p, int l)
{
    PlayerStruct *player = &plr[p];
    int ms = MaxStats[player->_pClass][0];
    if (player->_pBaseStr + l > ms) {
        l = ms - player->_pBaseStr;
    }
    player->_pStrength += l;
    player->_pBaseStr += l;

    if (player->_pClass == CLASS_ROGUE)
        player->_pDamageMod = (player->_pStrength + player->_pDexterity) * player->_pLevel / 200;
    else
        player->_pDamageMod = player->_pStrength * player->_pLevel / 100;

    CalcPlrInv(p, TRUE);
}

void ModifyPlrMag(int p, int l)
{
    PlayerStruct *player = &plr[p];
    int ms = MaxStats[player->_pClass][1];
    if (player->_pBaseMag + l > ms) {
        l = ms - player->_pBaseMag;
    }
    player->_pMagic += l;
    player->_pBaseMag += l;

    l <<= 6;
    if (player->_pClass == CLASS_SORCERER) {
        l <<= 1;
    }
    player->_pMaxManaBase += l;
    player->_pMaxMana += l;
    if (!(player->_pIFlags & ISPL_NOMANA)) {
        player->_pManaBase += l;
        player->_pMana += l;
    }

    CalcPlrInv(p, TRUE);
}

void ModifyPlrDex(int p, int l)
{
    PlayerStruct *player = &plr[p];
    int ms = MaxStats[player->_pClass][2];
    if (player->_pBaseDex + l > ms) {
        l = ms - player->_pBaseDex;
    }
    player->_pDexterity += l;
    player->_pBaseDex += l;
    CalcPlrInv(p, TRUE);

    if (player->_pClass == CLASS_ROGUE) {
        player->_pDamageMod = (player->_pStrength + player->_pDexterity) * player->_pLevel / 200;
    }
}

void ModifyPlrVit(int p, int l)
{
    PlayerStruct *player = &plr[p];
    int ms = MaxStats[player->_pClass][3];
    if (player->_pBaseVit + l > ms) {
        l = ms - player->_pBaseVit;
    }
    player->_pVitality += l;
    player->_pBaseVit += l;

    l <<= 6;
    if (player->_pClass == CLASS_WARRIOR) {
        l <<= 1;
    }
    player->_pHPBase += l;
    player->_pMaxHPBase += l;
    player->_pHitPoints += l;
    player->_pMaxHP += l;

    CalcPlrInv(p, TRUE);
}

void SetPlayerHitPoints(PlayerStruct *ptrplr, int newhp)
{
    ptrplr->_pHitPoints = newhp;
    ptrplr->_pHPBase = newhp - (ptrplr->_pMaxHP - ptrplr->_pMaxHPBase);
    if (ismyplr(ptrplr))
        drawhpflag = TRUE;
}

void SetPlrStr(int p, int v)
{
    PlayerStruct *player = &plr[p];
    player->_pBaseStr = v;
    CalcPlrInv(p, TRUE);

    if (player->_pClass == CLASS_ROGUE) {
        player->_pDamageMod = (player->_pStrength + player->_pDexterity) * player->_pLevel / 200;
    } else {
        player->_pDamageMod = player->_pStrength * player->_pLevel / 100;
    }
}

void SetPlrMag(int p, int v)
{
    PlayerStruct *player = &plr[p];
    player->_pBaseMag = v;

    v <<= 6;
    if (player->_pClass == CLASS_SORCERER) {
        v <<= 1;
    }
    player->_pMaxManaBase = v;
    player->_pMaxMana = v;
    CalcPlrInv(p, TRUE);
}

void SetPlrDex(int p, int v)
{
    PlayerStruct *player = &plr[p];
    player->_pBaseDex = v;
    CalcPlrInv(p, TRUE);

    if (player->_pClass == CLASS_ROGUE) {
        player->_pDamageMod = (player->_pStrength + player->_pDexterity) * player->_pLevel / 200;
    } else {
        player->_pDamageMod = player->_pStrength * player->_pLevel / 100;
    }
}

void SetPlrVit(int p, int v)
{
    PlayerStruct *player = &plr[p];
    player->_pBaseVit = v;

    v <<= 6;
    if (player->_pClass == CLASS_WARRIOR) {
        v <<= 1;
    }
    player->_pHPBase = v;
    player->_pMaxHPBase = v;
    CalcPlrInv(p, TRUE);
}

void InitDungMsgs(PlayerStruct *ptrplr)
{
    ptrplr->pDungMsgs = 0;
}

void PlayDungMsgs(void)
{
    PlayerStruct *player = &plr[myplr];

    if (currlevel == 1 && !player->_pLvlVisited[1] && gbMaxPlayers == 1 && !(player->pDungMsgs & 1)) {
        sfxdelay = 40;
        if (player->_pClass == CLASS_WARRIOR) {
            sfxdnum = 0x338;
        } else if (player->_pClass == CLASS_ROGUE) {
            sfxdnum = 0x2C5;
        } else if (player->_pClass == CLASS_SORCERER) {
            sfxdnum = 0x25D;
        }
        player->pDungMsgs |= 1;
    } else if (currlevel == 5 && !player->_pLvlVisited[5] && gbMaxPlayers == 1 && !(player->pDungMsgs & 2)) {
        sfxdelay = 40;
        if (player->_pClass == CLASS_WARRIOR) {
            sfxdnum = 0x337;
        } else if (player->_pClass == CLASS_ROGUE) {
            sfxdnum = 0x2C4;
        } else if (player->_pClass == CLASS_SORCERER) {
            sfxdnum = 0x25C;
        }
        player->pDungMsgs |= 2;
    } else if (currlevel == 9 && !player->_pLvlVisited[9] && gbMaxPlayers == 1 && !(player->pDungMsgs & 4)) {
        sfxdelay = 40;
        if (player->_pClass == CLASS_WARRIOR) {
            sfxdnum = 0x339;
        } else if (player->_pClass == CLASS_ROGUE) {
            sfxdnum = 0x2C6;
        } else if (player->_pClass == CLASS_SORCERER) {
            sfxdnum = 0x25E;
        }
        player->pDungMsgs |= 4;
    } else if (currlevel == 13 && !player->_pLvlVisited[13] && gbMaxPlayers == 1 && !(player->pDungMsgs & 8)) {
        sfxdelay = 40;
        if (player->_pClass == CLASS_WARRIOR) {
            sfxdnum = 0x33A;
        } else if (player->_pClass == CLASS_ROGUE) {
            sfxdnum = 0x2C7;
        } else if (player->_pClass == CLASS_SORCERER) {
            sfxdnum = 0x25F;
        }
        player->pDungMsgs |= 8;
    } else if (currlevel == 16 && !player->_pLvlVisited[16] && gbMaxPlayers == 1 && !(player->pDungMsgs & 16)) {
        sfxdelay = 40;
        if (player->_pClass == CLASS_WARRIOR) {
            sfxdnum = 0x348;
        } else if (player->_pClass == CLASS_ROGUE) {
            sfxdnum = 0x348;
        } else if (player->_pClass == CLASS_SORCERER) {
            sfxdnum = 0x348;
        }
        player->pDungMsgs |= 16;
    } else {
        sfxdelay = 0;
    }
}

/* ---- pointer<->index dispatch trampolines (PSX split-screen glue; no PC twin -- these convert
 * between the PlayerStruct* forms used inside this TU and the int-pnum forms other TUs export).
 * plrind(ptrplr) returns 0/1 for &plr[0]/&plr[1] (see plrind__FP12PlayerStruct below). ---- */

void CreatePlrItems(PlayerStruct *ptrplr)
{
    CreatePlrItems(plrind(ptrplr));
}

void WorldToOffset(PlayerStruct *ptrplr, int x, int y)
{
    WorldToOffset(plrind(ptrplr), x, y);
}

void SetSpdbarGoldCurs(PlayerStruct *ptrplr, int i)
{
    SetSpdbarGoldCurs(plrind(ptrplr), i);
}

int GetSpellLevel(PlayerStruct *ptrplr, int val)
{
    return GetSpellLevel(plrind(ptrplr), val);
}

void BreakObject(PlayerStruct *ptrplr, int val)
{
    BreakObject(plrind(ptrplr), val);
}

void CalcPlrInv(PlayerStruct *ptrplr, unsigned char bl)
{
    CalcPlrInv(plrind(ptrplr), bl);
}

void RemoveSpdBarItem(PlayerStruct *ptrplr, int val)
{
    RemoveSpdBarItem(plrind(ptrplr), val);
}

void M_StartKill(int m, PlayerStruct *ptrplr)
{
    M_StartKill(m, plrind(ptrplr));
}

void SetGoldCurs(PlayerStruct *ptrplr, int i)
{
    SetGoldCurs(plrind(ptrplr), i);
}

void HealStart(PlayerStruct *ptrplr)
{
    HealStart(plrind(ptrplr));
}

void HealotherStart(PlayerStruct *ptrplr)
{
    HealotherStart(plrind(ptrplr));
}

int CalculateGold(PlayerStruct *ptrplr)
{
    return CalculateGold(plrind(ptrplr));
}

void M_StartHit(int m, PlayerStruct *ptrplr, int dam)
{
    M_StartHit(m, plrind(ptrplr), dam);
}

void TeleStart(PlayerStruct *ptrplr)
{
    TeleStart(plrind(ptrplr));
}

void PhaseStart(PlayerStruct *ptrplr)
{
    PhaseStart(plrind(ptrplr));
}

void RemoveInvItem(PlayerStruct *ptrplr, int i)
{
    RemoveInvItem(plrind(ptrplr), i);
}

void PhaseEnd(PlayerStruct *ptrplr)
{
    PhaseEnd(plrind(ptrplr));
}

void OperateObject(PlayerStruct *ptrplr, int oi, unsigned char bl)
{
    OperateObject(plrind(ptrplr), oi, bl);
}

void TryDisarm(PlayerStruct *ptrplr, int oi)
{
    TryDisarm(plrind(ptrplr), oi);
}

void TalkToTowner(PlayerStruct *ptrplr, int val)
{
    TalkToTowner(plrind(ptrplr), val);
}

unsigned char PosOkPlayer(int pnum, int x, int y)
{
    return PosOkPlayer(&plr[pnum], x, y);
}

int CalcStatDiff(int pnum)
{
    return CalcStatDiff(&plr[pnum]);
}

void StartNewLvl(int pnum, int fom, int lvl)
{
    StartNewLvl(&plr[pnum], fom, lvl);
}

void CreatePlayer(int pnum, char c)
{
    CreatePlayer(&plr[pnum], c);
}

void StartStand(int pnum, int dir)
{
    StartStand(&plr[pnum], dir);
}

void SetPlayerHitPoints(int pnum, int val)
{
    SetPlayerHitPoints(&plr[pnum], val);
}

void MakePlrPath(int pnum, int xx, int yy, unsigned char endspace)
{
    MakePlrPath(&plr[pnum], xx, yy, endspace);
}

void StartWarpLvl(int pnum, int pidx)
{
    StartWarpLvl(&plr[pnum], pidx);
}

void SyncPlrKill(int pnum, int earflag)
{
    SyncPlrKill(&plr[pnum], earflag);
}

void StartPlrKill(int pnum, int val)
{
    StartPlrKill(&plr[pnum], val);
}

void NewPlrAnim(int pnum, int Peq, int numFrames, int Delay)
{
    NewPlrAnim(&plr[pnum], Peq, numFrames, Delay);
}

void AddPlrExperience(int pnum, int lvl, long exp)
{
    AddPlrExperience(&plr[pnum], lvl, exp);
}

void StartPlrBlock(int pnum, int dir)
{
    StartPlrBlock(&plr[pnum], dir);
}

void StartPlrHit(int pnum, int dam, unsigned char forcehit)
{
    StartPlrHit(&plr[pnum], dam, forcehit);
}

void StartSpell(int pnum, int d, int cx, int cy)
{
    StartSpell(&plr[pnum], d, cx, cy);
}

void InitPlayer(int pnum, unsigned char FirstTime)
{
    InitPlayer(&plr[pnum], FirstTime);
}

void PM_ChangeLightOff(int pnum)
{
    PM_ChangeLightOff(&plr[pnum]);
}

void CheckNewPath(int pnum)
{
    CheckNewPath(&plr[pnum]);
}

void FreePlayerGFX(int pnum)
{
    FreePlayerGFX(&plr[pnum]);
}

void InitDungMsgs(int pnum)
{
    InitDungMsgs(&plr[pnum]);
}

void InitPlayerGFX(int pnum)
{
    InitPlayerGFX(&plr[pnum]);
}

void SyncInitPlrPos(int pnum)
{
    SyncInitPlrPos(&plr[pnum]);
}

void SetPlrAnims(int pnum)
{
    SetPlrAnims(&plr[pnum]);
}

void ClrPlrPath(int pnum)
{
    ClrPlrPath(&plr[pnum]);
}

void SyncInitPlr(int pnum)
{
    SyncInitPlr(&plr[pnum]);
}

void RestartTownLvl(int pnum)
{
    RestartTownLvl(&plr[pnum]);
}

void SetPlayerOld(int pnum)
{
    SetPlayerOld(&plr[pnum]);
}

void GetGoldSeed(PlayerStruct *ptrplr, ItemStruct *h)
{
    GetGoldSeed(plrind(ptrplr), h);
}

/* ---- out-of-line copies of header-inline accessors landing in this TU (this TU's other code
 * calls these; the real definitions live in PSXSRC/{PRIMPOOL,SPLTARGT,CPLAYER}.H) ---- */

/* PsyQ addPrim-style primitive-pool cursor advance (identical body wherever it's instantiated --
 * confirmed byte-identical across every PRIM_GetPrim__FPP8POLY_FT4 VA in refs/skeleton). */
static void PRIM_GetPrim(POLY_FT4 **Prim)
{
    if (AddrToAvoid <= ThisPrimAddr + 10) {
        DBG_Error((char *)0x0, "psxsrc/primpool.h", 0x44);
    }
    *Prim = ThisPrimAddr;
    ThisPrimAddr = ThisPrimAddr + 1;
}

BOOL SpellTarget::Active()
{
    return active;
}

CPlayer *CPlayer::GetPlayer(int PNum)
{
    if (1 < (unsigned int)PNum) {
        DBG_Error((char *)0x0, "psxsrc/cplayer.h", 0x41);
    }
    return _7CPlayer_PActiveArray[PNum];
}

int CPlayer::GetLastOtPos() const
{
    return LastOtPos;
}

int CPlayer::GetLastScrY() const
{
    return LastScrY;
}

int CPlayer::GetLastScrX() const
{
    return LastScrX;
}
