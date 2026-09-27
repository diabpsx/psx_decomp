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

unsigned char IsDplayer(int x, int y)
{
    do {
        if (!plr[0].plractive)
            break;
        if (plr[0]._px != x)
            break;
        if (plr[0]._py != y)
            break;
        return 1;
    } while (0);
    unsigned char result = 0;
    if (plr[1].plractive && plr[1]._px == x)
        result = (plr[1]._py == y) * 2;
    return result;
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
    for (int i = y - 1; i <= y + 1; i++) {
        for (int j = x - 1; j <= x + 1; j++) {
            TransList[dung_map[j][i].dTransVal] = FALSE;
        }
    }
}

void PlrDoTrans(int x, int y)
{
    if (leveltype != DTYPE_CATHEDRAL && leveltype != DTYPE_CATACOMBS) {
        TransList[1] = TRUE;
    } else {
        for (int i = y - 1; i <= y + 1; i++) {
            for (int j = x - 1; j <= x + 1; j++) {
                if (!GetSOLID(j, i) && dung_map[j][i].dTransVal) {
                    TransList[dung_map[j][i].dTransVal] = TRUE;
                }
            }
        }
    }
}

void SetPlayerOld(PlayerStruct *ptrplr)
{
    ptrplr->_poldx = ptrplr->_px;
    ptrplr->_poldy = ptrplr->_py;
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
void PRIM_GetPrim(POLY_FT4 **Prim)
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

int CPlayer::GetLastScrX() const
{
    return LastScrX;
}

int CPlayer::GetLastScrY() const
{
    return LastScrY;
}

int CPlayer::GetLastOtPos() const
{
    return LastOtPos;
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

#define ISPL_NOMANA 0x8000000

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

#define MAXEXP 2000000000L
#define CMD_PLRLEVEL 0x33

/* PSX has no FPU -- devilution's `exp *= 1 + ((double)lvl - _pLevel) / 10;` becomes a literal
 * Q16.16 fixed-point multiply (gcc's own magic-constant /10 and /20, transcribed as-is).
 * PSX also has no separate `pnum`: it temporarily repoints the GLOBAL myplr at ptrplr's index
 * (plrind) so the rest of the body can keep devilution's `plr[myplr]`-style logic unchanged, then
 * restores myplr on the way out -- EXCEPT the early "_pHitPoints<=0" return bypasses the restore
 * (retail quirk: myplr is left pointing at ptrplr's index in that case; preserved faithfully). */
void AddPlrExperience(PlayerStruct *ptrplr, int lvl, long exp)
{
    int savedmyplr = myplr;
    myplr = plrind(ptrplr);

    if (ptrplr->_pHitPoints <= 0)
        return;

    long fixedmul = (((long)(lvl - ptrplr->_pLevel) << 16) / 10) + 0x10000;
    exp = (long)((fixedmul * exp) >> 16);
    if (exp < 0)
        exp = 0;

    if (gbMaxPlayers > 1) {
        int powerLvlCap = ptrplr->_pLevel < 0 ? 0 : ptrplr->_pLevel;
        if (powerLvlCap >= 50)
            powerLvlCap = 50;
        if (exp >= ExpLvlsTbl[powerLvlCap] / 20) {
            exp = ExpLvlsTbl[powerLvlCap] / 20;
        }
        int expCap = 200 * powerLvlCap;
        if (exp >= expCap) {
            exp = expCap;
        }
    }

    ptrplr->_pExperience += exp;
    if ((unsigned long)ptrplr->_pExperience > MAXEXP) {
        ptrplr->_pExperience = MAXEXP;
    }

    if (ptrplr->_pExperience >= ExpLvlsTbl[49]) {
        ptrplr->_pLevel = 50;
        return;
    }

    int newLvl = 0;
    while (ptrplr->_pExperience >= ExpLvlsTbl[newLvl]) {
        newLvl++;
    }
    if (newLvl != ptrplr->_pLevel) {
        for (int i = newLvl - ptrplr->_pLevel; i > 0; i--) {
            NextPlrLevel(ptrplr);
        }
    }

    NetSendCmdParam1(FALSE, CMD_PLRLEVEL, ptrplr->_pLevel);
    myplr = savedmyplr;
}

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

/* PSX no-op (see StartStand's comment above -- no dPlayer occupancy grid to clear). */
void RemovePlrFromMap(PlayerStruct *ptrplr)
{
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
    PostGamePad((int)((char *)ptrplr + 3 * sizeof(PlayerStruct)) != (int)plr, 0, 0, 0);
    ptrplr->_pmode = PM_SPELL;
    SetPlayerOld(ptrplr);
    ptrplr->_pVar1 = cx;
    ptrplr->_pVar2 = cy;
    ptrplr->_pdir = GetDirection(ptrplr->_px, ptrplr->_py, cx, cy);
    ptrplr->_pVar4 = GetSpellLevel(ptrplr, ptrplr->_pSpell);
    ptrplr->_pVar8 = 1;
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

void SyncPlrKill(PlayerStruct *ptrplr, int earflag)
{
    StartPlayerKill(ptrplr, earflag);
}

/* PSX-only "town portal absorbs death" gate around StartPlayerKill (not in devilution): if HP hits
 * 0 while in town, just top off to 64 HP; otherwise scan for a still-open MIS type-13 (town portal)
 * missile owned by this player -- if found, stash `val` in its _miVar8 and bail out instead of
 * actually killing the player. `_misource` is XOR-compared against plrind(ptrplr) (the usual
 * plrind-style equality-via-xor idiom). */
#define MIS_TOWNPORTAL 13

void StartPlrKill(PlayerStruct *ptrplr, int val)
{
    int pind = plrind(ptrplr);

    if (ptrplr->_pHitPoints == 0 && currlevel == 0) {
        SetPlayerHitPoints(ptrplr, 64);
        return;
    }

    short *pmi = missileactive;
    for (int i = 0; i < nummissiles; i++, pmi++) {
        int mi = *pmi;
        if (missile[mi]._mitype == MIS_TOWNPORTAL) {
            int caster = missile[mi]._misource;
            if (pind) {
                caster ^= 1;
            }
            if (caster == 0 && !missile[mi]._miDelFlag) {
                if (val != -1) {
                    missile[mi]._miVar8 = val;
                }
                return;
            }
        }
    }

    SetPlayerHitPoints(ptrplr, 0);
    StartPlayerKill(ptrplr, val);
}

/* PSX drops the myplr NetSendCmdParam1(CMD_SETSTR,...) network-sync tail every Modify/SetPlr* stat
 * function has in devilution (no netcode on this build). */
/* SYM confirms retail caches a named `PlayerStruct *player = &plr[p];` local (REG $a2) and an `int
 * ms` -- not a repeated `plr[p]` re-index. */
void ModifyPlrStr(int p, int l)
{
    PlayerStruct *player = &plr[p];
    if (player->_pBaseStr + l > MaxStats[player->_pClass][0]) {
        l = MaxStats[player->_pClass][0] - player->_pBaseStr;
    }
    player->_pStrength += l;
    player->_pBaseStr += l;

    int ms;
    if (player->_pClass == CLASS_ROGUE) {
        ms = (player->_pStrength + player->_pDexterity) * player->_pLevel / 200;
        player->_pDamageMod = ms;
    } else {
        ms = player->_pStrength * player->_pLevel / 100;
        player->_pDamageMod = ms;
    }

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

void ClrPlrPath(PlayerStruct *ptrplr)
{
    memset(ptrplr->walkpath, 0xFF, 25);
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

/* PSX has no persistent dPlayer[][]/dMonster[][]/dObject[][] arrays -- dMonster/dObject are FIELDS
 * of dung_map[x][y], and the player-occupancy grid is replaced by calling IsDplayer(x,y) in place
 * of every `dPlayer[x][y]` read (literally, textually -- the source keeps devilution's `>0 ? -1 :
 * -(+1)` decode even though IsDplayer can never return negative, hence the seemingly-redundant
 * repeated calls: retail really does call IsDplayer(x,y) four times, never caching it).
 * Also drops the whole bounds-check (x>=0 etc, callers already clamp). */
unsigned char PosOkPlayer(PlayerStruct *ptrplr, int x, int y)
{
    if (SolidLoc(x, y)) {
        return FALSE;
    }

    if (IsDplayer(x, y)) {
        int p;
        if (IsDplayer(x, y) > 0) {
            p = IsDplayer(x, y) - 1;
        } else {
            p = -(IsDplayer(x, y) + 1);
        }
        if (p != plrind(ptrplr) && plr[p]._pHitPoints != 0) {
            return FALSE;
        }
    }

    if (dung_map[x][y].dMonster != 0) {
        if (currlevel == 0) {
            return FALSE;
        }
        if (dung_map[x][y].dMonster <= 0) {
            return FALSE;
        }
        if ((monster[dung_map[x][y].dMonster - 1]._mhitpoints >> 6) > 0) {
            return FALSE;
        }
    }

    if (dung_map[x][y].dObject != 0) {
        char bv;
        if (dung_map[x][y].dObject > 0) {
            bv = dung_map[x][y].dObject - 1;
        } else {
            bv = -(dung_map[x][y].dObject + 1);
        }
        if (object[bv]._oSolidFlag) {
            return FALSE;
        }
    }

    return TRUE;
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

/* PSX narrows the class cascade to 3 (warrior/rogue/sorcerer), matching the rest of the file. */
void CheckStats(int p)
{
    PlayerStruct *player = &plr[p];
    int c = 0;
    if (player->_pClass == CLASS_WARRIOR) {
        c = CLASS_WARRIOR;
    } else if (player->_pClass == CLASS_ROGUE) {
        c = CLASS_ROGUE;
    } else if (player->_pClass == CLASS_SORCERER) {
        c = CLASS_SORCERER;
    }

    for (int i = 0; i < 4; i++) {
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
}

#define INVLOC_HEAD 0
#define INVLOC_HAND_LEFT 4
#define INVLOC_HAND_RIGHT 5
#define ITYPE_NONE (-1)
#define ITYPE_SHIELD 5
#define DUR_INDESTRUCTIBLE 255

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

#define INVLOC_CHEST 6

/* SYM shows retail keeps a SEPARATE `PlayerStruct *p = ptrplr;` local (matching devilution's
 * original `p = &plr[pnum];`), not just the incoming `ptrplr` param reused directly. */
void ArmorDur(PlayerStruct *ptrplr)
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

/* PSX stubs: both are bare `return FALSE;` (the state-machine handler exists but does nothing on
 * this build -- PM_STAND/PM_NEWLVL need no per-frame processing here). */
int PM_DoStand(PlayerStruct *ptrplr)
{
    return FALSE;
}

int PM_DoNewLvl(PlayerStruct *ptrplr)
{
    return FALSE;
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

#define ISPL_FASTBLOCK 0x1000000

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

#define ISPL_FIRE_ARROWS 0x8
#define ISPL_LIGHT_ARROWS 0x2000000
#define MIS_ARROW 0
#define MIS_FARROW 0x1B
#define MIS_LARROW 0x38

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

#define ICLASS_WEAPON 1

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

/* PSX-only death sequencing: D_8011C878[plrind(ptrplr)] is a small per-player post-death countdown
 * (unnamed in the SYM, TU-owned) that must count down to exactly 1 before this player's vision/
 * cursor/active-count cleanup actually runs; not present in devilution's PM_DoDeath at all. */
int PM_DoDeath(PlayerStruct *ptrplr)
{
    int pind = plrind(ptrplr);
    TryDropPlayerItems(ptrplr);

    if (ptrplr->_pVar8 < ptrplr->_pDFrames * 2) {
        if (D_8011C878[pind] >= 2 && ismyplr(ptrplr) && --D_8011C878[pind] == 1) {
            RemovePlrFromMap(ptrplr);
            ptrplr->plractive = 0;
            if (--gbActivePlayers == 0) {
                deathflag = 1;
                PA_SetPauseOk(FALSE);
            } else {
                dovision = 0;
                int foundIdx = 0;
                for (int i = 0; i < numvision; i++) {
                    if (VisionList[i]._lid == ptrplr->_plid) {
                        foundIdx = i;
                        VisionList[i]._ldel = 1;
                        dovision = 1;
                    }
                    if (dovision) {
                        break;
                    }
                }
                DoUnVision(VisionList[foundIdx]._lx, VisionList[foundIdx]._ly, VisionList[foundIdx]._lradius, pind);
                ptrplr->_plid = -1;
            }
            ClrCursor(plrind(ptrplr));
        }
        ptrplr->_pAnimDelay = 10000;
        ptrplr->_pAnimFrame = ptrplr->_pAnimLen;
    }

    if (ptrplr->_pVar8 < 100) {
        ptrplr->_pVar8++;
    }
    return 0;
}

void StartPlayerKill(PlayerStruct *ptrplr, int earflag)
{
    automapflag = 0;
    if (gbActivePlayers == 1) {
        automapflag = 0;
        PA_SetPauseOk(FALSE);
    }

    if (ptrplr->_pHitPoints == 0 && ptrplr->_pmode == PM_DEATH) {
        return;
    }

    if (ptrplr->_pClass == 0) {
        PlaySfxLoc(0xB, ptrplr->_px, ptrplr->_py);
    } else if (ptrplr->_pClass == 1) {
        PlaySfxLoc(0x2AB, ptrplr->_px, ptrplr->_py);
    } else if (ptrplr->_pClass == 2) {
        PlaySfxLoc(0x243, ptrplr->_px, ptrplr->_py);
    }

    if (gbActivePlayers == 1) {
        GLUE_SetHomingScrollFlag(FALSE);
    }

    int pind = plrind(ptrplr);
    TASK **slot = &_spselflag[pind];
    if (*slot) {
        TSK_Kill(*slot);
        PauseMode = 1;
    } else {
        PauseMode = 0;
    }
    *slot = 0;

    int sleepArg = 2;
    do {
        TSK_Sleep(sleepArg);
        sleepArg = 1;
    } while (sghStream != 0);
    PauseMode = 0;

    /* SYM shows a SEPARATE `PlayerStruct *p = ptrplr;` local for the rest of the function
     * (matches devilution's original `p = &plr[pnum];`). */
    PlayerStruct *p = ptrplr;
    if (p->_pgfxnum) {
        p->_pgfxnum = 0;
        SetPlrAnims(p);
        p->_pGFXLoad = 0;
    }

    NewPlrAnim(p, 1, p->_pDFrames, 1);
    p->_pmode = PM_DEATH;
    p->_pBlockFlag = 0;
    p->_pInvincible = 1;
    SetPlayerHitPoints(p, 0);
    p->DeadLevel = currlevel;
    p->_pVar8 = 1;
    SetPlayerOld(p);
    drawhpflag = 1;

    pind = plrind(ptrplr);
    D_8011C878[pind] = 30;
    StartPlayerDropItems(ptrplr, earflag);
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

/* PSX-specific "held spell still available?" re-check after casting: for RSplType==2 (scroll) tests
 * _pScrlSpells, for ==3 (charges) tests _pISpells, both as a 64-bit bit-test on (_pRSpell-1); resets
 * the queued repeat-spell to none (-1 / RSPLTYPE_INVALID=4) if the bit isn't set. `_pSpell` literal
 * ids used directly (23=teleport, 10=phase, 2=heal, 0x22=healother) match TeleStart/PhaseStart/
 * HealStart/HealotherStart's trigger checks seen elsewhere in this TU. */
int PM_DoSpell(PlayerStruct *ptrplr)
{
    if (invflag) {
        return 0;
    }

    if (ptrplr->_pVar8 < ptrplr->_pSFNum) {
        do_spell_anim(ptrplr->_pVar8, ptrplr->_pSpell, ptrplr->_pClass, ptrplr);
    } else if (ptrplr->_pVar8 == ptrplr->_pSFNum) {
        if (ptrplr->_pSpell == 24) {
            ApocaStart(ptrplr != plr);
        }
        CastSpell(ptrplr != plr, ptrplr->_pSpell, ptrplr->_px, ptrplr->_py, ptrplr->_pVar1, ptrplr->_pVar2, 0, ptrplr->_pVar4);

        if (ptrplr->_pSplFrom == 0) {
            if (ptrplr->_pRSplType == 2 && !((ptrplr->_pScrlSpells >> (ptrplr->_pRSpell - 1)) & 1)) {
                ptrplr->_pRSpell = -1;
                ptrplr->_pRSplType = 4;
            }
            if (ptrplr->_pRSplType == 3 && !((ptrplr->_pISpells >> (ptrplr->_pRSpell - 1)) & 1)) {
                ptrplr->_pRSpell = -1;
                ptrplr->_pRSplType = 4;
            }
        }
    }

    if (ptrplr->_pSpell == 23 && ptrplr->_pVar8 == 1) {
        TeleStart(ptrplr);
    }
    if (ptrplr->_pSpell == 10 && ptrplr->_pVar8 == 1) {
        PhaseStart(ptrplr);
    }
    if (ptrplr->_pSpell == 2 && ptrplr->_pVar8 == 1) {
        HealStart(ptrplr);
    }
    if (ptrplr->_pSpell == 0x22 && ptrplr->_pVar8 == 1) {
        HealotherStart(ptrplr);
    }

    ptrplr->_pVar8++;
    if (leveltype == 0) {
        if (ptrplr->_pVar8 <= ptrplr->_pSFrames) {
            return 0;
        }
        int pind;
        if (_spselflag[plrind(ptrplr)] == 0) {
            pind = SelectorActive() == 0;
        } else {
            pind = 0;
        }
        if (pind) {
            PostGamePad(ptrplr == plr ? 6 : 7, 0, 0, 0);
        }
        StartWalkStand(ptrplr);
    } else {
        if (ptrplr->_pAnimFrame != ptrplr->_pSFrames) {
            return 0;
        }
        int pind;
        if (_spselflag[plrind(ptrplr)] == 0) {
            pind = SelectorActive() == 0;
        } else {
            pind = 0;
        }
        if (pind) {
            PostGamePad(ptrplr == plr ? 6 : 7, 0, 0, 0);
        }
        StartStand(ptrplr, ptrplr->_pdir);
    }

    ClearPlrPVars(ptrplr);
    if (ptrplr->_pSpell != 10) {
        PhaseEnd(ptrplr);
    }
    return 1;
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

CPlayer *CPlayer::GetPlayer(int PNum)
{
    if (1 < (unsigned int)PNum) {
        DBG_Error((char *)0x0, "psxsrc/cplayer.h", 0x41);
    }
    return _7CPlayer_PActiveArray[PNum];
}
