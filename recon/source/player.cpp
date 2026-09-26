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
#define MAX_PLRS 4
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
