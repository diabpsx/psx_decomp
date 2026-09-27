/* MISSILES.CPP -- Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/missiles.cpp
 * (+ refs/devilutionx/Source/missiles.cpp for naming/semantic cross-check only).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 *
 * PSX DELTAS vs devilution (confirmed against the raw oracle; see 00_current_diablo.md for the
 * running lane-fact list):
 *  - MAX_PLRS = 2 (co-op link-cable, not devilution's 4); ManashieldFlag is split into two globals
 *    ManashieldFlag/ManashieldFlag2, one per player slot (see MI_SetManashield).
 *  - random_(seed, n) -> ENG_random(n) (no separate PRNG-stream selector).
 *  - dMonster/dObject/dItem/dMissile/dFlags/dTransVal[x][y] -> dung_map[x][y].<field>; no dPlayer
 *    grid exists in map_info -- PSX tracks player occupancy differently (see CheckMissileCol note).
 *  - nSolidTable[dPiece[x][y]] -> GetSOLID(x,y) (DPIECE.CPP).
 *  - SetCursor_(CURSOR_x) -> { options_pad = id; NewCursor(CURSOR_x); } (PSX menu tracks whose item
 *    via the options_pad global instead of a mouse-driven inventory).
 *  - SetMissAnim/misfiledata are considerably simpler than the PC per-direction sprite-pointer
 *    tables: MisFileData is a flat 5-byte record (mAnimName/mAnimFAmt/mFlags/mAnimDelay/mAnimLen)
 *    and the per-direction frame delay/length are decoded through GetTableValue(code, dir) against
 *    ValueTable/StringTable (see GetTableValue, SetMissAnim).
 *
 * TOOLING NOTE (important, not fixable from this TU): 13 of the 114 oracle .s files under
 * asm/nonmatchings/missiles* are TRUNCATED -- gen_config's rodata-carving heuristic misclassifies a
 * mid-function switch/jump-table island as a *data* subsegment and silently drops the CODE that
 * follows the table into that same rodata blob (visible as raw .word lines that disassemble to real
 * MIPS, e.g. asm/data/missiles_rodata_8013aed8.rodata.s = the back half of MoveMissilePos). Affected:
 * GetDamageAmt, MoveMissilePos, MonsterTrapHit, PutMissile, GetMissilePos, MonsterMHit, Plr2PlrMHit,
 * CheckMissileCol, MI_LArrow, MI_Wave, AddTeleport, AddHeal, AddBoneSpirit. verify_asm on these will
 * always show a length mismatch (or NO ORACLE past the split point) until configs/gen_config.py is
 * fixed to keep the post-table code as `c`, not `rodata`. Bodies below are reconstructed from
 * devilution + a hand read of the raw ROM bytes at the true VA span, but are NOT verify_asm-gated.
 */
#include "diabpsx_types.h"
#include "source/gen/structs_missiles.h"
#include "source/gen/externs_missiles.h"
#include "source/gen/protos_missiles.h"
#include "source/diablo.h"

#define MAXMISSILES 125
#define MAXDUNX 96
#define MAXDUNY 96
#define MAX_PLRS 2

/* direction enums already in source/diablo.h (DIR_S..DIR_SE) */

/* TU-owned small globals (oracle reaches these via %gp_rel -> tentative definitions, not extern;
 * methodology 3.12#6 / feedback_sym_module_canonical). */
int nummissiles;
unsigned char ManashieldFlag;
unsigned char ManashieldFlag2;
unsigned char MissilePreFlag;
unsigned char fadetor;
unsigned char fadetog;
unsigned char fadetob;

/* @0x8011A030 -- the CrawlNum[6] template all 7 Add-family/MI_Golem functions memcpy from. Materialized
 * separately in asm/data/rodata_missiles.rodata.s (real .rdata, no symbol name in the SYM). An
 * `extern const` can't be constant-folded (unlike a static-const template, which WAS folded back
 * to individual li/sw in a probe), so this reproduces the oracle's real runtime block copy without
 * introducing a new .data symbol retail doesn't have. */
extern const int D_8011A030[6];

/* spell ids (retail 1.09 values; PSX has no Hellfire spells) */
#define SPL_FIREBOLT    0x1
#define SPL_HEAL        0x2
#define SPL_LIGHTNING   0x3
#define SPL_FLASH       0x4
#define SPL_IDENTIFY    0x5
#define SPL_FIREWALL    0x6
#define SPL_TOWN        0x7
#define SPL_STONE       0x8
#define SPL_INFRA       0x9
#define SPL_RNDTELEPORT 0xA
#define SPL_MANASHIELD  0xB
#define SPL_FIREBALL    0xC
#define SPL_GUARDIAN    0xD
#define SPL_CHAIN       0xE
#define SPL_WAVE        0xF
#define SPL_DOOMSERP    0x10
#define SPL_BLODRIT     0x11
#define SPL_NOVA        0x12
#define SPL_INVISIBIL   0x13
#define SPL_FLAME       0x14
#define SPL_GOLEM       0x15
#define SPL_BLODBOIL    0x16
#define SPL_TELEPORT    0x17
#define SPL_APOCA       0x18
#define SPL_ETHEREALIZE 0x19
#define SPL_REPAIR      0x1A
#define SPL_RECHARGE    0x1B
#define SPL_DISARM      0x1C
#define SPL_ELEMENT     0x1D
#define SPL_CBOLT       0x1E
#define SPL_HBOLT       0x1F
#define SPL_RESURRECT   0x20
#define SPL_TELEKINESIS 0x21
#define SPL_HEALOTHER   0x22
#define SPL_FLARE       0x23
#define SPL_BONESPIRIT  0x24

/* missile type ids (retail 1.09) */
#define MIS_ARROW       0x0
#define MIS_FIREBOLT    0x1
#define MIS_GUARDIAN    0x2
#define MIS_RNDTELEPORT 0x3
#define MIS_LIGHTBALL   0x4
#define MIS_FIREWALL    0x5
#define MIS_FIREBALL    0x6
#define MIS_LIGHTCTRL   0x7
#define MIS_LIGHTNING   0x8
#define MIS_MISEXP      0x9
#define MIS_TOWN        0xA
#define MIS_FLASH       0xB
#define MIS_FLASH2      0xC
#define MIS_MANASHIELD  0xD
#define MIS_FIREMOVE    0xE
#define MIS_CHAIN       0xF
#define MIS_RHINO       0x14
#define MIS_MAGMABALL   0x15
#define MIS_FLARE       0x18
#define MIS_MISEXP2     0x19
#define MIS_TELEPORT    0x1A
#define MIS_FIREWALLA   0x1D
#define MIS_STONE       0x1E
#define MIS_GOLEM       0x21
#define MIS_BOOM        0x24
#define MIS_HEAL        0x25
#define MIS_FIREWALLC   0x26
#define MIS_INFRA       0x27
#define MIS_IDENTIFY    0x28
#define MIS_WAVE        0x29
#define MIS_NOVA        0x2A
#define MIS_APOCA       0x2C
#define MIS_REPAIR      0x2D
#define MIS_RECHARGE    0x2E
#define MIS_DISARM      0x2F
#define MIS_FLAME       0x30
#define MIS_FLAMEC      0x31
#define MIS_CBOLT       0x34
#define MIS_HBOLT       0x35
#define MIS_RESURRECT   0x36
#define MIS_TELEKINESIS 0x37
#define MIS_LARROW      0x38
#define MIS_ACID        0x39
#define MIS_MISEXP3     0x3A
#define MIS_ACIDPUD     0x3B
#define MIS_HEALOTHER   0x3C
#define MIS_ELEMENT     0x3D
#define MIS_RESURRECTBEAM 0x3E
#define MIS_BONESPIRIT  0x3F
#define MIS_WEAPEXP     0x40
#define MIS_RPORTAL     0x41
#define MIS_DIABAPOCA   0x43

/* missile resistance / immunity classes (mResist / mMagicRes bits) */
#define MISR_NONE       0
#define MISR_MAGIC      1
#define MISR_FIRE       2
#define MISR_LIGHTNING  3
#define MISR_ACID       4
#define IMMUNE_MAGIC      1
#define IMMUNE_FIRE       2
#define IMMUNE_LIGHTNING  4
#define IMMUNE_ACID       8
#define RESIST_MAGIC      16
#define RESIST_FIRE       32
#define RESIST_LIGHTNING  64

/* target types (mienemy) */
#define TARGET_MONSTERS 0
#define TARGET_PLAYERS  1
#define TARGET_BOTH     2

/* BFLAG_ bits (map_info.dFlags) */
#define BFLAG_MISSILE 0x40

/* cursor ids (NewCursor) */
#define CURSOR_IDENTIFY    0x2
#define CURSOR_REPAIR      0x3
#define CURSOR_RECHARGE    0x4
#define CURSOR_DISARM      0x5
#define CURSOR_TELEKINESIS 0x7
#define CURSOR_RESURRECT   0x8
#define CURSOR_HEALOTHER   0xA

/* player classes */
#define PC_WARRIOR  0
#define PC_ROGUE    1
#define PC_SORCERER 2

/* monster mode / AI ids referenced below */
#define MM_STONE  15 /* confirmed 0xF via raw oracles of both MI_Stone and AddStone -- was wrongly 13 (devilution's value) */
#define MM_CHARGE 14
#define MGOAL_RETREAT 5
#define MT_ILLWEAV 63

/* ---------------------------------------------------------------------- */

void GetDamageAmt(int i, int *mind, int *maxd)
{
    int k, sl;
    PlayerStruct *plr_ = &plr[myplr];

    sl = plr_->_pSplLvl[i] + plr_->_pISplLvlAdd;

    switch (i) {
    case SPL_FIREBOLT:
        *mind = (plr_->_pMagic >> 3) + sl + 1;
        *maxd = (plr_->_pMagic >> 3) + sl + 10;
        break;
    case SPL_HEAL:
        *mind = plr_->_pLevel + sl + 1;
        if (plr_->_pClass == PC_WARRIOR)
            *mind <<= 1;
        if (plr_->_pClass == PC_ROGUE)
            *mind += *mind >> 1;
        *maxd = 10;
        for (k = 0; k < plr_->_pLevel; k++)
            *maxd += 4;
        for (k = 0; k < sl; k++)
            *maxd += 6;
        if (plr_->_pClass == PC_WARRIOR)
            *maxd <<= 1;
        if (plr_->_pClass == PC_ROGUE)
            *maxd += *maxd >> 1;
        *mind = -1;
        *maxd = -1;
        break;
    case SPL_LIGHTNING:
        *mind = 2;
        *maxd = plr_->_pLevel + 2;
        break;
    case SPL_FLASH:
        *mind = plr_->_pLevel;
        for (k = 0; k < sl; k++)
            *mind += *mind >> 3;
        *mind += *mind >> 1;
        *maxd = *mind * 2;
        break;
    case SPL_IDENTIFY:
    case SPL_TOWN:
    case SPL_STONE:
    case SPL_INFRA:
    case SPL_RNDTELEPORT:
    case SPL_MANASHIELD:
    case SPL_DOOMSERP:
    case SPL_BLODRIT:
    case SPL_INVISIBIL:
    case SPL_BLODBOIL:
    case SPL_TELEPORT:
    case SPL_ETHEREALIZE:
    case SPL_REPAIR:
    case SPL_RECHARGE:
    case SPL_DISARM:
    case SPL_RESURRECT:
    case SPL_TELEKINESIS:
    case SPL_BONESPIRIT:
        *mind = -1;
        *maxd = -1;
        break;
    case SPL_FIREWALL:
        *mind = (4 * plr_->_pLevel + 8) >> 1;
        *maxd = (4 * plr_->_pLevel + 80) >> 1;
        break;
    case SPL_FIREBALL:
        *mind = 2 * plr_->_pLevel + 4;
        for (k = 0; k < sl; k++)
            *mind += *mind >> 3;
        *maxd = 2 * plr_->_pLevel + 40;
        for (k = 0; k < sl; k++)
            *maxd += *maxd >> 3;
        break;
    case SPL_GUARDIAN:
        *mind = (plr_->_pLevel >> 1) + 1;
        for (k = 0; k < sl; k++)
            *mind += *mind >> 3;
        *maxd = (plr_->_pLevel >> 1) + 10;
        for (k = 0; k < sl; k++)
            *maxd += *maxd >> 3;
        break;
    case SPL_CHAIN:
        *mind = 4;
        *maxd = 2 * plr_->_pLevel + 4;
        break;
    case SPL_WAVE:
        *mind = 6 * (plr_->_pLevel + 1);
        *maxd = 6 * (plr_->_pLevel + 10);
        break;
    case SPL_NOVA:
        *mind = (plr_->_pLevel + 5) >> 1;
        for (k = 0; k < sl; k++)
            *mind += *mind >> 3;
        *mind *= 5;
        *maxd = (plr_->_pLevel + 30) >> 1;
        for (k = 0; k < sl; k++)
            *maxd += *maxd >> 3;
        *maxd *= 5;
        break;
    case SPL_FLAME:
        *mind = 3;
        *maxd = plr_->_pLevel + 4;
        *maxd += *maxd >> 1;
        break;
    case SPL_GOLEM:
        *mind = 11;
        *maxd = 17;
        break;
    case SPL_APOCA:
        *mind = 0;
        for (k = 0; k < plr_->_pLevel; k++)
            *mind += 1;
        *maxd = 0;
        for (k = 0; k < plr_->_pLevel; k++)
            *maxd += 6;
        break;
    case SPL_ELEMENT:
        *mind = 2 * plr_->_pLevel + 4;
        for (k = 0; k < sl; k++)
            *mind += *mind >> 3;
        *maxd = 2 * plr_->_pLevel + 40;
        for (k = 0; k < sl; k++)
            *maxd += *maxd >> 3;
        break;
    case SPL_CBOLT:
        *mind = 1;
        *maxd = (plr_->_pMagic >> 2) + 1;
        break;
    case SPL_HBOLT:
        *mind = plr_->_pLevel + 9;
        *maxd = plr_->_pLevel + 18;
        break;
    case SPL_HEALOTHER:
        *mind = plr_->_pLevel + sl + 1;
        if (plr_->_pClass == PC_WARRIOR)
            *mind <<= 1;
        if (plr_->_pClass == PC_ROGUE)
            *mind += *mind >> 1;
        *maxd = 10;
        for (k = 0; k < plr_->_pLevel; k++)
            *maxd += 4;
        for (k = 0; k < sl; k++)
            *maxd += 6;
        if (plr_->_pClass == PC_WARRIOR)
            *maxd <<= 1;
        if (plr_->_pClass == PC_ROGUE)
            *maxd += *maxd >> 1;
        *mind = -1;
        *maxd = -1;
        break;
    case SPL_FLARE:
        *mind = (plr_->_pMagic >> 1) + 3 * sl - (plr_->_pMagic >> 3);
        *maxd = *mind;
        break;
    }
}

int CheckBlock(int fx, int fy, int tx, int ty)
{
    int pn;
    int coll = 0;

    while (fx != tx || fy != ty) {
        pn = GetDirection(fx, fy, tx, ty);
        fx += XDirAdd[pn];
        fy += YDirAdd[pn];
        if (GetSOLID(fx, fy))
            coll = 1;
    }

    return coll;
}

int FindClosest(int sx, int sy, int rad)
{
    int cr, cidx, cent, cne, mid, tx, ty;
    int const CrawlNum[19] = { 0, 3, 12, 45, 94, 159, 240, 337, 450, 579, 724, 885, 1062, 1255, 1464, 1689, 1930, 2187, 2460 };

    if (rad > 19)
        rad = 19;

    for (cr = 1; cr < rad; cr++) {
        cidx = CrawlNum[cr];
        cent = cidx + 1;
        for (cne = (unsigned char)CrawlTable[cidx]; cne > 0; cne--) {
            tx = sx + CrawlTable[cent];
            ty = sy + CrawlTable[cent + 1];
            /* PSX bounds against the raw dung_map array extent (112), not MAXDUNX/MAXDUNY (96) --
             * same idiom as PutMissile/AddApoca/AddTeleport (retail sltiu ...,0x6F). */
            if (tx > 0 && tx < 112 && ty > 0 && ty < 112) {
                mid = dung_map[tx][ty].dMonster;
                if (mid > 0 && !CheckBlock(sx, sy, tx, ty))
                    return mid - 1;
            }
            cent += 2;
        }
    }
    return -1;
}

int GetSpellLevel(int id, int sn)
{
    int rv;

    if (id == myplr)
        rv = plr[id]._pSplLvl[sn] + plr[id]._pISplLvlAdd;
    else
        rv = 1;

    if (rv < 0)
        rv = 0;

    return rv;
}

int GetDirection8(int x1, int y1, int x2, int y2)
{
    unsigned char Dirs[16][16] = {
        { 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        { 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        { 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        { 2, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
        { 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
        { 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 },
        { 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    };
    unsigned char const lrtoul[3] = { 3, 4, 5 };
    unsigned char const urtoll[3] = { 3, 2, 1 };
    unsigned char const lltour[3] = { 7, 6, 5 };
    unsigned char const ultolr[3] = { 7, 0, 1 };
    int mx, my, md;

    mx = abs(x2 - x1);
    if (mx > 15)
        mx = 15;
    my = abs(y2 - y1);
    if (my > 15)
        my = 15;
    md = Dirs[my][mx];
    if (x1 > x2) {
        if (y1 > y2)
            md = lrtoul[md];
        else
            md = urtoll[md];
    } else {
        if (y1 > y2)
            md = lltour[md];
        else
            md = ultolr[md];
    }
    return md;
}

int GetDirection16(int x1, int y1, int x2, int y2)
{
    unsigned char Dirs[16][16] = {
        { 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        { 4, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        { 4, 3, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
        { 4, 3, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
        { 4, 4, 3, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 4, 4, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1 },
        { 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1 },
        { 4, 4, 4, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1 },
        { 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1 },
        { 4, 4, 4, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 1, 1 },
        { 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 1 },
        { 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2 },
        { 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2 },
        { 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2 },
        { 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2 }
    };
    unsigned char const lrtoul[5] = { 6, 7, 8, 9, 10 };
    unsigned char const urtoll[5] = { 6, 5, 4, 3, 2 };
    unsigned char const lltour[5] = { 14, 13, 12, 11, 10 };
    unsigned char const ultolr[5] = { 14, 15, 0, 1, 2 };
    int mx, my, md;

    mx = abs(x2 - x1);
    if (mx > 15)
        mx = 15;
    my = abs(y2 - y1);
    if (my > 15)
        my = 15;
    md = Dirs[my][mx];
    if (x1 > x2) {
        if (y1 > y2)
            md = lrtoul[md];
        else
            md = urtoll[md];
    } else {
        if (y1 > y2)
            md = lltour[md];
        else
            md = ultolr[md];
    }
    return md;
}

void DeleteMissile(int mi, int i)
{
    missileavail[MAXMISSILES - nummissiles] = mi;
    nummissiles--;
    AddUnLight(missile[mi]._mlid);
    if (nummissiles > 0 && i != nummissiles)
        missileactive[i] = missileactive[nummissiles];
}

void GetMissileVel(int i, int sx, int sy, int dx, int dy, int v)
{
    /* PSX is ALL-INTEGER here, not the PC twin's float sqrt(dx*dx+dy*dy): raw oracle calls
     * veclen2(dxp,dyp) (an integer distance approximation, NOT sqrt) and does the final divide
     * via __divdi3 (64-bit signed division) on hand-built 64-bit products -- confirmed by reading
     * the jal targets directly (no `sqrt` symbol exists anywhere in the retail SYM at all). Also
     * clamps each of dxp/dyp/dr away from exact zero before dividing (avoids a div-by-zero /
     * degenerate direction), which the PC twin does not do explicitly. */
    long long dxp, dyp, dr;

    dxp = (((dx - sx) << 5) - ((dy - sy) << 5)) << 16;
    dyp = (((dx - sx) << 5) + ((dy - sy) << 5)) << 16;
    dr = veclen2(dxp, dyp);
    if (dxp == 0)
        dxp++;
    if (dyp == 0)
        dyp++;
    if (dr == 0)
        dr++;
    missile[i]._mixvel = (v << 16) * dxp / dr;
    missile[i]._miyvel = (v << 15) * dyp / dr;
}

void PutMissile(int i)
{
    /* PSX-only multi-occupancy scheme, NOT present in devilution/hellfire: a tile's dMissile byte
     * is either 0 (empty), a positive (single missile, i+1) or a NEGATIVE encoded reference into
     * dMissArray[32][4] (bits 0-4 = row, bits 5-6 = slot-in-use count) once a 2nd+ missile lands on
     * the same tile. Decoded from the raw oracle (no PC twin); best-effort transcription, not yet
     * byte-verified -- this is one of the largest remaining near-misses to grind. Bound check here
     * is against the dung_map ARRAY bound (112), not the playable MAXDUNX/MAXDUNY (96). */
    int mx, my;
    char m;

    mx = missile[i]._mix;
    my = missile[i]._miy;
    if (mx <= 0 || my <= 0 || mx >= 112 || my >= 112)
        missile[i]._miDelFlag = 1;
    if (!missile[i]._miDelFlag) {
        dung_map[mx][my].dFlags |= BFLAG_MISSILE;
        if (dung_map[mx][my].dMissile == 0) {
            dung_map[mx][my].dMissile = i + 1;
        } else {
            char dMiss = dung_map[mx][my].dMissile;
            if (dMiss < 0) {
                if (missile[i]._mitype == missile[dMissArray[dMiss & 0x1F][(dMiss & 0x60) >> 5] - 1]._mitype)
                    return;
                if (((dMiss & 0x60) >> 5) + 1 < 4) {
                    dMissArray[dMiss & 0x1F][((dMiss & 0x60) >> 5) + 1] = i + 1;
                    dung_map[mx][my].dMissile += 0x20;
                }
            } else {
                for (m = 0; m < 32; m++) {
                    if (dMissArray[m][0] == 0) {
                        dMissArray[m][0] = dMiss;
                        dMissArray[m][1] = i + 1;
                        dung_map[mx][my].dMissile = m - 0x60;
                        break;
                    }
                }
            }
        }
        if (missile[i]._miPreFlag)
            MissilePreFlag = 1;
    }
}

void GetMissilePos(int i)
{
    long mx, my, dx, dy, lx, ly;

    mx = missile[i]._mitxoff >> 16;
    my = missile[i]._mityoff >> 16;
    dx = mx + 2 * my;
    dy = 2 * my - mx;
    if (dx < 0) {
        lx = -(-dx >> 3);
        dx = -(-dx >> 6);
    } else {
        lx = dx >> 3;
        dx = dx >> 6;
    }
    if (dy < 0) {
        ly = -(-dy >> 3);
        dy = -(-dy >> 6);
    } else {
        ly = dy >> 3;
        dy = dy >> 6;
    }
    missile[i]._mix = dx + missile[i]._misx;
    missile[i]._miy = dy + missile[i]._misy;
    missile[i]._mixoff = mx - ((dx - dy) << 5);
    missile[i]._miyoff = my - ((dx + dy) << 4);
    ChangeLightOff(missile[i]._mlid, lx - (dx << 3), ly - (dy << 3));
}

void MoveMissilePos(int i)
{
    int dx = 0, dy = 0, x, y;

    switch (missile[i]._mimfnum) {
    case DIR_S:
        dx = 1;
        dy = 1;
        break;
    case DIR_SW:
        dx = 1;
        dy = 1;
        break;
    case DIR_W:
        dx = 0;
        dy = 1;
        break;
    case DIR_NW:
        dx = 0;
        dy = 0;
        break;
    case DIR_N:
        dx = 0;
        dy = 0;
        break;
    case DIR_NE:
        dx = 0;
        dy = 0;
        break;
    case DIR_E:
        dx = 1;
        dy = 0;
        break;
    case DIR_SE:
        dx = 1;
        dy = 1;
        break;
    }
    x = missile[i]._mix + dx;
    y = missile[i]._miy + dy;
    if (PosOkMonst(missile[i]._misource, x, y)) {
        missile[i]._mix += dx;
        missile[i]._miy += dy;
        missile[i]._mixoff -= (dx - dy) << 5;
        missile[i]._miyoff -= (dx + dy) << 4;
    }
}

/* --- decoded directly from the raw oracle (hand-disassembled MIPS -> C), not from devilution --- */

unsigned char GetTableValue(unsigned char code, int dir)
{
    unsigned char hicode = (code & 0xF0) >> 4;
    unsigned char locode = code & 0xF;

    if (code == 0)
        return 0;
    if (hicode < 10) {
        if (hicode == 0)
            hicode = 16;
        if (dir < hicode)
            return ValueTable[locode];
        return 0;
    }
    if (dir < locode) {
        hicode -= 10;
        return StringTable[hicode][dir];
    }
    return 0;
}

void SetMissAnim(int mi, int animtype)
{
    int dir = missile[mi]._mimfnum;

    missile[mi]._miAnimType = animtype;
    missile[mi]._miAnimFlags = misfiledata[animtype].mFlags;
    missile[mi]._miAnimDelay = GetTableValue(misfiledata[animtype].mAnimDelay, dir);
    missile[mi]._miAnimLen = GetTableValue(misfiledata[animtype].mAnimLen, dir);
    missile[mi]._miAnimCnt = 0;
    missile[mi]._miAnimFrame = 1;
}

void SetMissDir(int mi, int dir)
{
    missile[mi]._mimfnum = dir;
    SetMissAnim(mi, missile[mi]._miAnimType);
}

void MI_Dummy(int i)
{
    /* @0x80143078: `jr ra; nop` -- empty body, i unused. */
}

void MI_SetManashield(int i)
{
    if (missile[i]._misource == 0)
        ManashieldFlag = 1;
    else
        ManashieldFlag2 = 1;
}

void ClearMissileSpot(int mi)
{
    dung_map[missile[mi]._mix][missile[mi]._miy].dFlags &= ~BFLAG_MISSILE;
    dung_map[missile[mi]._mix][missile[mi]._miy].dMissile = 0;
}

void RemoveStoneMissiles(int mon, int mx, int my)
{
    for (int i = 0; i < nummissiles; i++) {
        int mi = missileactive[i];
        MissileStruct *pmissile = &missile[mi];
        if (pmissile->_mitype == MIS_STONE && pmissile->_miVar2 == mon)
            pmissile->_miDelFlag = 1;
    }
}

/* --- Add* missile constructors (called from AddMissile via MissPrintRoutines / a similar
 * per-type dispatch table; bodies below transcribed from devilution with the PSX deltas noted at
 * the top of this file). --- */

void AddChain(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._miVar1 = dx;
    missile[mi]._miVar2 = dy;
    missile[mi]._mirange = 1;
    UseMana(id, SPL_CHAIN);
}

void AddBoom(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._mix = dx;
    missile[mi]._miy = dy;
    missile[mi]._misx = dx;
    missile[mi]._misy = dy;
    missile[mi]._mixvel = 0;
    missile[mi]._miyvel = 0;
    missile[mi]._midam = dam;
    missile[mi]._mirange = missile[mi]._miAnimLen;
    missile[mi]._miVar1 = 0;
}

void AddHealOther(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._miDelFlag = 1;
    UseMana(id, SPL_HEALOTHER);
    if (id == myplr)
        NewCursor(CURSOR_HEALOTHER);
}

void AddResurrect(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    UseMana(id, SPL_RESURRECT);
    if (id == myplr)
        NewCursor(CURSOR_RESURRECT);
    missile[mi]._miDelFlag = 1;
}

void AddResurrectBeam(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* decoded directly from the oracle -- a fixed 16-tick range, no misfiledata lookup */
    missile[mi]._mix = dx;
    missile[mi]._miy = dy;
    missile[mi]._mixvel = 0;
    missile[mi]._miyvel = 0;
    missile[mi]._mirange = 16;
    missile[mi]._misx = missile[mi]._mix;
    missile[mi]._misy = missile[mi]._miy;
}

void AddWave(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._miVar1 = dx;
    missile[mi]._miVar2 = dy;
    missile[mi]._miVar3 = 0;
    missile[mi]._miVar4 = 0;
    missile[mi]._mirange = 1;
    missile[mi]._miAnimFrame = 4;
    UseMana(id, SPL_WAVE);
}

void AddTelekinesis(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._miDelFlag = 1;
    UseMana(id, SPL_TELEKINESIS);
    if (id == myplr)
        NewCursor(CURSOR_TELEKINESIS);
}

void AddManashield(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._mirange = ((plr[id]._pLevel << 4) << 1) + (plr[id]._pLevel << 4);
    missile[mi]._miVar1 = plr[id]._pHitPoints;
    missile[mi]._miVar2 = plr[id]._pHPBase;
    missile[mi]._miVar8 = -1;
    if (mienemy == TARGET_MONSTERS)
        UseMana(id, SPL_MANASHIELD);
}

void AddDisarm(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._miDelFlag = 1;
    UseMana(id, SPL_DISARM);
    if (id == myplr)
        NewCursor(CURSOR_DISARM);
}

void AddRepair(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._miDelFlag = 1;
    UseMana(id, SPL_REPAIR);
    if (id == myplr) {
        if (sbookflag)
            sbookflag = 0;
        if (!invflag)
            invflag = 1;
        options_pad = id;
        NewCursor(CURSOR_REPAIR);
    }
}

void AddRecharge(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._miDelFlag = 1;
    UseMana(id, SPL_RECHARGE);
    if (id == myplr) {
        if (sbookflag)
            sbookflag = 0;
        if (!invflag)
            invflag = 1;
        options_pad = id;
        NewCursor(CURSOR_RECHARGE);
    }
}

void AddAcidpud(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int monst;

    missile[mi]._mixvel = 0;
    missile[mi]._miyvel = 0;
    missile[mi]._mixoff = 0;
    missile[mi]._miyoff = 0;
    missile[mi]._miLightFlag = 1;
    monst = missile[mi]._misource;
    missile[mi]._mirange = ENG_random(15) + 40 * (monster[monst]._mint + 1);
    missile[mi]._miPreFlag = 1;
}

void AddLightctrl(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    if (dam == 0 && mienemy == TARGET_MONSTERS)
        UseMana(id, SPL_LIGHTNING);
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    GetMissileVel(mi, sx, sy, dx, dy, 32);
    missile[mi]._miAnimFrame = ENG_random(8) + 1;
    missile[mi]._mirange = 256;
}

void GetVileMissPos(int mi, int dx, int dy)
{
    int xx, yy;

    for (int l = 1; l < 50; l++) {
        for (int j = -l; j <= l; j++) {
            yy = dy + j;
            for (int i = -l; i <= l; i++) {
                xx = dx + i;
                if (PosOkPlayer(myplr, xx, yy)) {
                    missile[mi]._mix = xx;
                    missile[mi]._miy = yy;
                    return;
                }
            }
        }
    }
    missile[mi]._mix = dx;
    missile[mi]._miy = dy;
}

unsigned char CheckIfTrig(int x, int y)
{
    int i;

    for (i = 0; i < numtrigs; i++) {
        if ((x == trigs[i]._tx && y == trigs[i]._ty)
            || (abs(trigs[i]._tx - x) < 2 && abs(trigs[i]._ty - y) < 2))
            return 1;
    }
    /* PSX-only: also checks the fixed quests[16] table for an active quest-portal trigger on
     * this level -- confirmed via raw oracle @0x8013EEB0 (second loop, fixed bound 0x10, NOT
     * numtrigs). Gate = _qlevel==currlevel && _qslvl!=0 && _qactive!=0, then the same
     * exact-or-abs<2 position test against (_qtx,_qty). */
    for (i = 0; i < 16; i++) {
        if (currlevel == quests[i]._qlevel && quests[i]._qslvl != 0 && quests[i]._qactive != 0) {
            if ((x == quests[i]._qtx && y == quests[i]._qty)
                || (abs(quests[i]._qtx - x) < 2 && abs(quests[i]._qty - y) < 2))
                return 1;
        }
    }
    return 0;
}

void MI_Infra(int i)
{
    missile[i]._mirange--;
    plr[missile[i]._misource]._pInfraFlag = 1;
    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        CalcPlrItemVals(missile[i]._misource, 1);
    }
}

void AddFirebolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam)
{
    int sp, i, mx;

    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }
    if (micaster == TARGET_MONSTERS) {
        for (i = 0; i < nummissiles; i++) {
            mx = missileactive[i];
            if (missile[mx]._mitype == MIS_GUARDIAN && missile[mx]._misource == id && missile[mx]._miVar3 == mi)
                break;
        }
        if (i == nummissiles)
            UseMana(id, SPL_FIREBOLT);
        if (id != -1) {
            sp = 16 + (missile[mi]._mispllvl << 1);
            if (sp >= 63)
                sp = 63;
        } else
            sp = 16;
    } else
        sp = 26;

    GetMissileVel(mi, sx, sy, dx, dy, sp);
    SetMissDir(mi, GetDirection8(sx, sy, dx, dy));
    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    /* PSX-only deltas vs hellfire: radius 150 (not 8) and a SetParticle flag set -- confirmed
     * straight off the raw oracle (0x96/0x1 literals), no PC twin has either. */
    missile[mi]._mlid = AddLight(sx, sy, 150);
    SetParticle = 1;
}

void AddTeleport(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i, k, l, j, tx, ty;
    int CrawlNum[6];

    memcpy(CrawlNum, D_8011A030, sizeof(CrawlNum));

    missile[mi]._miDelFlag = 1;
    for (k = 0; k < 6; k++) {
        l = CrawlNum[k];
        j = l + 1;
        for (i = (unsigned char)CrawlTable[l]; i > 0; i--) {
            tx = dx + CrawlTable[j];
            ty = dy + CrawlTable[j + 1];
            /* PSX bounds tx/ty against the raw dung_map array extent (112), not the playable
             * MAXDUNX/MAXDUNY (96) -- same idiom as PutMissile/AddApoca (retail sltiu ...,0x6F). */
            if (tx > 0 && tx < 112 && ty > 0 && ty < 112) {
                /* PSX drops the dItem/dMissile terms devilution's dPiece/dMonster/dObject/dPlayer
                 * check has, and substitutes GetSOLID/IsDplayer for nSolidTable[dPiece]/dPlayer. */
                if ((GetSOLID(tx, ty) | dung_map[tx][ty].dMonster | dung_map[tx][ty].dObject | IsDplayer(tx, ty)) == 0) {
                    missile[mi]._mix = tx;
                    missile[mi]._miy = ty;
                    missile[mi]._misx = tx;
                    missile[mi]._misy = ty;
                    missile[mi]._miDelFlag = 0;
                    k = 6;
                    break;
                }
            }
            j += 2;
        }
    }

    if (missile[mi]._miDelFlag == 0) {
        UseMana(id, SPL_TELEPORT);
        missile[mi]._mirange = 2;
    }
}

void AddLightball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    GetMissileVel(mi, sx, sy, dx, dy, 16);
    missile[mi]._midam = dam;
    missile[mi]._miAnimFrame = ENG_random(8) + 1;
    missile[mi]._mirange = 255;
    if (id < 0) {
        missile[mi]._miVar1 = sx;
        missile[mi]._miVar2 = sy;
    } else {
        missile[mi]._miVar1 = plr[id]._px;
        missile[mi]._miVar2 = plr[id]._py;
    }
    /* PSX-only addition (no PC twin): the raw tests bit 1 of the missile *index* ($s2 = mi,
     * `andi v0,s2,2`), not mienemy -- mienemy is never loaded (no REG record in SYM). Only every
     * other pair of lightball slots gets a light source. */
    if (mi & 2)
        missile[mi]._mlid = AddLight(sx, sy, 0x243);
}

void AddFirewall(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX drops hellfire's `if (mienemy != MI_ENEMYMONST || id < 0) mirange += currlevel;` branch
     * entirely -- always applies the pISplDur-scaled adjustment (confirmed: no currlevel add
     * anywhere in the oracle, just one unconditional mult/mflo/sra-7 sequence). */
    int i;

    missile[mi]._midam = ((ENG_random(10) + ENG_random(10) + 2 + plr[id]._pLevel) << 4) >> 1;
    GetMissileVel(mi, sx, sy, dx, dy, 16);
    missile[mi]._mirange = 10;
    for (i = missile[mi]._mispllvl; i > 0; i--)
        missile[mi]._mirange += 10;
    missile[mi]._mirange += (plr[id]._pISplDur * missile[mi]._mirange) >> 7;
    missile[mi]._mirange <<= 4;
    missile[mi]._miVar1 = missile[mi]._mirange - missile[mi]._miAnimLen;
    missile[mi]._miVar2 = 0;
}

void AddFireball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i;

    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }
    if (mienemy == TARGET_MONSTERS) {
        missile[mi]._midam = (ENG_random(10) + ENG_random(10) + 2 + plr[id]._pLevel) << 1;
        for (i = missile[mi]._mispllvl; i > 0; i--)
            missile[mi]._midam += missile[mi]._midam >> 3;
        i = 16 + (missile[mi]._mispllvl << 1);
        if (i > 50)
            i = 50;
        UseMana(id, SPL_FIREBALL);
    } else
        i = 16;

    GetMissileVel(mi, sx, sy, dx, dy, i);
    /* PSX-only: uses the 8-way GetDirection8 here (PC/hellfire source has GetDirection16) --
     * confirmed via raw oracle jal target @0x8013E728. */
    SetMissDir(mi, GetDirection8(sx, sy, dx, dy));
    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    missile[mi]._miVar3 = 0;
    missile[mi]._miVar4 = sx;
    missile[mi]._miVar5 = sy;
    /* PSX-only deltas (same class as AddFirebolt): radius 149 (not 8) + SetParticle. */
    missile[mi]._mlid = AddLight(sx, sy, 149);
    SetParticle = 1;
}

void AddMisexp(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    if (mienemy != TARGET_MONSTERS && id > 0) {
        if (monster[id].MType->mtype == 0x65)
            SetMissAnim(mi, 0x17);
        if (monster[id].MType->mtype == 0x66)
            SetMissAnim(mi, 0x29);
        if (monster[id].MType->mtype == 0x67)
            SetMissAnim(mi, 0x2D);
        if (monster[id].MType->mtype == 0x68)
            SetMissAnim(mi, 0x2B);
    }

    missile[mi]._mix = missile[dx]._mix;
    missile[mi]._miy = missile[dx]._miy;
    missile[mi]._misx = missile[dx]._misx;
    missile[mi]._misy = missile[dx]._misy;
    missile[mi]._mixoff = missile[dx]._mixoff;
    missile[mi]._miyoff = missile[dx]._miyoff;
    missile[mi]._mitxoff = missile[dx]._mitxoff;
    missile[mi]._mityoff = missile[dx]._mityoff;
    missile[mi]._mixvel = 0;
    missile[mi]._miyvel = 0;
    missile[mi]._mirange = missile[mi]._miAnimLen;
    missile[mi]._miVar1 = 0;
}

void AddFlash(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i;

    if (mienemy == TARGET_MONSTERS) {
        if (id != -1) {
            missile[mi]._midam = 0;
            for (i = 0; i <= plr[id]._pLevel; i++)
                missile[mi]._midam += ENG_random(20) + 1;
            for (i = missile[mi]._mispllvl; i > 0; i--)
                missile[mi]._midam += missile[mi]._midam >> 3;
            missile[mi]._midam += missile[mi]._midam >> 1;
            UseMana(id, SPL_FLASH);
        } else {
            missile[mi]._midam = currlevel >> 1;
        }
    } else
        missile[mi]._midam = monster[id].mLevel << 1;

    missile[mi]._mirange = 19;
}

void AddFlash2(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i;

    if (mienemy == TARGET_MONSTERS) {
        if (id != -1) {
            missile[mi]._midam = 0;
            for (i = 0; i <= plr[id]._pLevel; i++)
                missile[mi]._midam += ENG_random(2) + 1;
            for (i = missile[mi]._mispllvl; i > 0; i--)
                missile[mi]._midam += missile[mi]._midam >> 3;
            missile[mi]._midam += missile[mi]._midam >> 1;
        } else {
            missile[mi]._midam = currlevel >> 1;
        }
    }
    missile[mi]._miPreFlag = 1;
    missile[mi]._mirange = 19;
    /* PSX-only: triggers a screen-fade flash effect via fadetor/fadetog/fadetob (no PC twin). */
    fadetor = 30;
    fadetog = 30;
    fadetob = 30;
}

void AddRportal(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX-only prologue: shrinks/re-places any pre-existing portal missile occupying this tile
     * before placing the new one -- no PC twin has this. */
    int m2 = dung_map[sx][sy].dMissile;

    if (m2 > 0) {
        m2--;
        MissileStruct *miss = &missile[m2];
        miss->_miy--;
        PutMissile(m2);
    }

    missile[mi]._mix = sx;
    missile[mi]._miy = sy;
    missile[mi]._misx = sx;
    missile[mi]._misy = sy;
    missile[mi]._mirange = 100;
    missile[mi]._miVar1 = missile[mi]._mirange - missile[mi]._miAnimLen;
    missile[mi]._miVar2 = 0;
    PutMissile(mi);
}

void AddNova(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int k;

    missile[mi]._miVar1 = dx;
    missile[mi]._miVar2 = dy;
    if (id != -1) {
        missile[mi]._midam = ENG_random(6) + ENG_random(6) + ENG_random(6) + ENG_random(6) + ENG_random(6);
        missile[mi]._midam += 5 + plr[id]._pLevel;
        missile[mi]._midam = missile[mi]._midam >> 1;
        for (k = missile[mi]._mispllvl; k > 0; k--)
            missile[mi]._midam += missile[mi]._midam >> 3;
        if (mienemy == TARGET_MONSTERS)
            UseMana(id, SPL_NOVA);
    } else {
        missile[mi]._midam = ENG_random(3) + ENG_random(3) + ENG_random(3);
        missile[mi]._midam += currlevel >> 1;
    }
    missile[mi]._mirange = 1;
}

void AddApoca(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i;

    /* PSX uses 9 (not 8) for the half-width, a Y clamp of 96 (MAXDUNY) but an X clamp of 112 (the
     * dung_map array bound, same asymmetry as PutMissile/AddApoca's oracle -- not 8/96/96 as
     * devilution/hellfire have it). */
    missile[mi]._miVar1 = 9;
    missile[mi]._miVar2 = sy - missile[mi]._miVar1;
    missile[mi]._miVar3 = sy + missile[mi]._miVar1;
    missile[mi]._miVar4 = sx - missile[mi]._miVar1;
    missile[mi]._miVar5 = sx + missile[mi]._miVar1;
    missile[mi]._miVar6 = missile[mi]._miVar4;

    if (missile[mi]._miVar2 <= 0)
        missile[mi]._miVar2 = 1;
    if (missile[mi]._miVar3 >= 96)
        missile[mi]._miVar3 = 95;
    if (missile[mi]._miVar4 <= 0)
        missile[mi]._miVar4 = 1;
    if (missile[mi]._miVar5 >= 112)
        missile[mi]._miVar5 = 111;

    for (i = 0; i < plr[id]._pLevel; i++)
        missile[mi]._midam += ENG_random(6) + 1;

    missile[mi]._mirange = 255;
    missile[mi]._miDelFlag = 0;
    UseMana(id, SPL_APOCA);
    /* PSX-only: also kicks a screen-shake + a follow-up SPL_Arrow cast -- confirmed via raw
     * oracle @0x80141CC8/0x80141CDC (2 extra calls, no PC-twin equivalent). */
    GLUE_DoQuake(15, 2);
    SPL_Arrow(TGT_MONSTERS, id, 10, 20);
}

void AddElement(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i;

    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }

    missile[mi]._midam = (ENG_random(10) + ENG_random(10) + 2 + plr[id]._pLevel) << 1;
    for (i = missile[mi]._mispllvl; i > 0; i--)
        missile[mi]._midam += missile[mi]._midam >> 3;
    missile[mi]._midam = missile[mi]._midam >> 1;

    GetMissileVel(mi, sx, sy, dx, dy, 16);
    SetMissDir(mi, GetDirection8(sx, sy, dx, dy));

    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    missile[mi]._miVar3 = 0;
    missile[mi]._miVar4 = dx;
    missile[mi]._miVar5 = dy;
    /* PSX-only delta (same class as AddFirebolt/AddFireball): radius 438, not 8. */
    missile[mi]._mlid = AddLight(sx, sy, 438);
    UseMana(id, SPL_ELEMENT);
}

void AddCbolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam)
{
    if (micaster == TARGET_MONSTERS) {
        if (id == myplr)
            missile[mi]._mirnd = ENG_random(15) + 1;
        else
            missile[mi]._mirnd = ENG_random(15) + 1;
        missile[mi]._midam = ENG_random(plr[id]._pMagic >> 2) + 1;
    } else {
        missile[mi]._mirnd = ENG_random(15) + 1;
        missile[mi]._midam = 15;
    }

    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }

    missile[mi]._miAnimFrame = ENG_random(8) + 1;
    /* PSX-only: like AddLightball, only every other group of missile slots (mi & 4) gets a light. */
    if (mi & 4)
        missile[mi]._mlid = AddLight(sx, sy, 0x242);
    GetMissileVel(mi, sx, sy, dx, dy, 8);

    missile[mi]._miVar1 = 5;
    missile[mi]._miVar2 = midir;
    missile[mi]._miVar3 = 0;
    missile[mi]._mirange = 256;
}

void AddInfra(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i;

    missile[mi]._mirange = 99 << 4;
    for (i = missile[mi]._mispllvl; i > 0; i--)
        missile[mi]._mirange += missile[mi]._mirange >> 3;
    missile[mi]._mirange = missile[mi]._mirange + ((plr[id]._pISplDur * missile[mi]._mirange) >> 7);
    if (mienemy == TARGET_MONSTERS)
        UseMana(id, SPL_INFRA);
}

void AddWeapexp(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._mix = sx;
    missile[mi]._miy = sy;
    missile[mi]._misx = sx;
    missile[mi]._misy = sy;
    missile[mi]._mixvel = 0;
    missile[mi]._miyvel = 0;
    missile[mi]._miVar1 = 0;
    missile[mi]._miVar2 = dx;
    missile[mi]._mimfnum = 0;
    if (dx == 1)
        SetMissAnim(mi, 5); /* MFILE_CBOLT */
    else
        SetMissAnim(mi, 0x1A); /* MFILE_EXP1 -- PSX ordering is reversed from the PC twin */
    missile[mi]._mirange = missile[mi]._miAnimLen - 1;
}

void AddFiremove(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._midam = ENG_random(10) + 1 + plr[id]._pLevel;
    GetMissileVel(mi, sx, sy, dx, dy, 16);
    missile[mi]._mirange = 255;
    missile[mi]._miVar1 = 0;
    missile[mi]._miVar2 = 0;
    missile[mi]._mix++;
    missile[mi]._miy++;
    missile[mi]._miyoff -= 32;
}

void AddMagmaball(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    GetMissileVel(mi, sx, sy, dx, dy, 16);
    missile[mi]._mitxoff += 3 * missile[mi]._mixvel;
    missile[mi]._mityoff += 3 * missile[mi]._miyvel;
    GetMissilePos(mi);
    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    missile[mi]._mlid = AddLight(sx, sy, 0x97);
}

void MI_Boom(int i)
{
    missile[i]._mirange--;
    if (missile[i]._miVar1 == 0)
        CheckMissileCol(i, missile[i]._midam, missile[i]._midam, 0, missile[i]._mix, missile[i]._miy, 1, 1);
    if (missile[i]._miHitFlag == 1)
        missile[i]._miVar1 = 1;
    if (missile[i]._mirange == 0)
        missile[i]._miDelFlag = 1;
    PutMissile(i);
}

void MI_ResurrectBeam(int i)
{
    missile[i]._mirange--;
    if (missile[i]._mirange == 0)
        missile[i]._miDelFlag = 1;
    PutMissile(i);
}

void AddIdentify(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX oracle: unlike AddRepair/AddRecharge, this one is NOT gated on `id == myplr` -- the
     * sbookflag/invflag/options_pad/NewCursor tail always runs. Confirmed from the raw asm. */
    missile[mi]._miDelFlag = 1;
    UseMana(id, SPL_IDENTIFY);
    if (sbookflag)
        sbookflag = 0;
    if (!invflag)
        invflag = 1;
    options_pad = id;
    NewCursor(CURSOR_IDENTIFY);
}

void AddFlame(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int seqno)
{
    int i;

    missile[mi]._miVar2 = 0;
    for (i = seqno; i > 0; i--)
        missile[mi]._miVar2 += 5;

    missile[mi]._misx = dx;
    missile[mi]._misy = dy;

    missile[mi]._mixoff = missile[midir]._mixoff;
    missile[mi]._miyoff = missile[midir]._miyoff;
    missile[mi]._mitxoff = missile[midir]._mitxoff;
    missile[mi]._mityoff = missile[midir]._mityoff;
    missile[mi]._mirange = 20 + missile[mi]._miVar2;
    /* PSX-only radius delta: 148, not 1. */
    missile[mi]._mlid = AddLight(sx, sy, 0x94);

    if (mienemy == TARGET_MONSTERS) {
        missile[mi]._midam = (ENG_random(plr[id]._pLevel) + ENG_random(2) + 2) << 3;
        missile[mi]._midam += missile[mi]._midam >> 1;
    } else {
        missile[mi]._midam = ENG_random(monster[id].mMaxDamage - monster[id].mMinDamage + 1) + monster[id].mMinDamage;
    }
}

void AddFlare(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX reorders devilution: the light-radius selection by _miAnimType always runs first (a
     * SetMissAnim call earlier picked one of several flare animations), THEN the mienemy branch
     * (UseMana+HP drain vs the monster-type SetMissAnim dispatch) runs. The unmatched-_miAnimType
     * "default" case is a REAL (not dead) debug assert -- confirmed via raw oracle @0x80140258:
     * it unconditionally calls DBG_Error(0,"source/MISSILES.cpp",0x9DE) reached from BOTH the
     * <0x29-but-not-0x16 case and the >=0x29-but-not-0x2A/0x2C case. The "wtf?" string @D_8011A048
     * is loaded and tested for truthiness (always true, never actually skips) -- byte-exact source
     * idiom, not a real gate; kept literal to preserve the retail codegen shape. The two AddLight
     * call sites in the oracle group {0x28,0x2A}->one physical jal and {0x16,0x2C}->the other. */
    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }
    GetMissileVel(mi, sx, sy, dx, dy, 16);
    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;

    switch (missile[mi]._miAnimType) {
    case 0x16:
    case 0x2C:
        missile[mi]._mlid = AddLight(sx, sy, 0x93);
        break;
    case 0x28:
        missile[mi]._mlid = AddLight(sx, sy, 0x243);
        break;
    case 0x2A:
        missile[mi]._mlid = AddLight(sx, sy, 0x1B3);
        break;
    default:
        if ("wtf? never heard of this missile")
            DBG_Error(0, "source/MISSILES.cpp", 0x9DE);
        break;
    }

    if (mienemy == TARGET_MONSTERS) {
        UseMana(id, 0x23); /* SPL_BSTAR (Hellfire-only spell id, not otherwise used in this TU) */
        plr[id]._pHitPoints -= 5 << 6;
        drawhpflag = 1;
        plr[id]._pHPBase -= 5 << 6;
        if (plr[id]._pHitPoints <= 0)
            StartPlrKill(id, 0);
    } else if (id > 0) {
        if (monster[id].MType->mtype == 0x65)
            SetMissAnim(mi, 0x16);
        if (monster[id].MType->mtype == 0x66)
            SetMissAnim(mi, 0x28);
        if (monster[id].MType->mtype == 0x67)
            SetMissAnim(mi, 0x2C);
        if (monster[id].MType->mtype == 0x68)
            SetMissAnim(mi, 0x2A);
    }
}

void AddGolem(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i, mx;
    int CrawlNum[6];

    memcpy(CrawlNum, D_8011A030, sizeof(CrawlNum));

    missile[mi]._miDelFlag = 0;
    for (i = 0; i < nummissiles; i++) {
        mx = missileactive[i];
        if (missile[mx]._mitype == MIS_GOLEM && mx != mi && missile[mx]._misource == id) {
            missile[mi]._miDelFlag = 1;
            return;
        }
    }

    for (int k = 0; k < 6; k++) {
        int l = CrawlNum[k];
        int j = l + 1;
        for (i = (unsigned char)CrawlTable[l]; i > 0; i--) {
            int tx = dx + CrawlTable[j];
            int ty = dy + CrawlTable[j + 1];
            if (tx > 0 && tx < MAXDUNX && ty > 0 && ty < MAXDUNY) {  /* AddGolem: retail uses the playable bound (0x5F=95) here, unlike the sibling crawl-search fns */
                if (LineClear(sx, sy, tx, ty) && (GetSOLID(tx, ty) | dung_map[tx][ty].dMonster | dung_map[tx][ty].dObject | IsDplayer(tx, ty)) == 0) {
                    missile[mi]._miVar1 = sx;
                    missile[mi]._miVar2 = sy;
                    missile[mi]._miVar4 = dx;
                    missile[mi]._miVar5 = dy;
                    if ((monster[id]._mx != 1 || monster[id]._my != 0) && id == myplr)
                        M_StartKill(id, id);
                    UseMana(id, SPL_GOLEM);
                    k = 6;
                    break;
                }
            }
            j += 2;
        }
    }
}

void AddRhino(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX massively simplifies devilution's Cels/uniqtrans/mlid handling away -- just picks one of
     * the CMonster::Anims[] slots (SPECIAL/ATTACK/WALK) by a hardcoded mtype range (the collapsed
     * EquivMonst(mtype,MT_HORNED)=[0x40,0x43], EquivMonst(mtype,MT_NSNAKE)=[0x59,0x5C] ranges) and
     * copies Frames/Rate; no Cels pointer, no _miAnimWidth/Width2, no uniqtype/mlid path exist here. */
    struct AnimStruct *anim;

    if ((unsigned char)(monster[id].MType->mtype - 0x40) < 4)
        anim = &monster[id].MType->Anims[5];
    else if ((unsigned char)(monster[id].MType->mtype - 0x59) < 4)
        anim = &monster[id].MType->Anims[2];
    else
        anim = &monster[id].MType->Anims[1];

    GetMissileVel(mi, sx, sy, dx, dy, 18);

    missile[mi]._mimfnum = midir;
    missile[mi]._miAnimFlags = 0;
    missile[mi]._miAnimDelay = anim->Rate;
    missile[mi]._miAnimLen = anim->Frames;
    missile[mi]._miAnimAdd = 1;

    if ((unsigned char)(monster[id].MType->mtype - 0x59) < 4)
        missile[mi]._miAnimFrame = 7;

    missile[mi]._miVar1 = 0;
    missile[mi]._miVar2 = 0;
    missile[mi]._miLightFlag = 1;
    missile[mi]._mirange = 256;

    PutMissile(mi);
}

void AddFirewallC(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i, k, l, j, tx, ty;
    int CrawlNum[6];

    memcpy(CrawlNum, D_8011A030, sizeof(CrawlNum));

    missile[mi]._miDelFlag = 1;
    for (k = 0; k < 6; k++) {
        l = CrawlNum[k];
        j = l + 1;
        for (i = (unsigned char)CrawlTable[l]; i > 0; i--) {
            tx = dx + CrawlTable[j];
            ty = dy + CrawlTable[j + 1];
            if (tx > 0 && tx < 112 && ty > 0 && ty < 112) {  /* raw dung_map extent, not MAXDUNX/MAXDUNY */
                if (LineClear(sx, sy, tx, ty) && (sx != tx || sy != ty) && (GetSOLID(tx, ty) | dung_map[tx][ty].dObject) == 0) {
                    missile[mi]._miVar1 = tx;
                    missile[mi]._miVar2 = ty;
                    missile[mi]._miVar5 = tx;
                    missile[mi]._miVar6 = ty;
                    missile[mi]._miDelFlag = 0;
                    k = 6;
                    break;
                }
            }
            j += 2;
        }
    }

    if (missile[mi]._miDelFlag == 1)
        return;

    missile[mi]._miVar7 = 0;
    missile[mi]._miVar8 = 0;

    midir = GetDirection(sx, sy, dx, dy);
    missile[mi]._miVar4 = (midir - 2) & 7;
    missile[mi]._miVar3 = (midir + 2) & 7;

    missile[mi]._mirange = 7;
    UseMana(id, SPL_FIREWALL);
}

void AddDiabApoca(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX loops 0..FePlayerNo (a front-end/link-cable player-count global), not gbMaxPlayers as
     * hellfire does, and reads plr[]._px/_py (there is no _pfutx/_pfuty in the PSX struct). */
    int pnum;

    for (pnum = 0; pnum <= FePlayerNo; pnum++) {
        if (plr[pnum].plractive && LineClear(sx, sy, plr[pnum]._px, plr[pnum]._py))
            AddMissile(plr[pnum]._px, plr[pnum]._py, plr[pnum]._px, plr[pnum]._py, 0, 0x42, mienemy, id, dam, 0);
    }
    missile[mi]._miDelFlag = 1;
}

void MI_LArrow(int i)
{
    int p, mind, maxd, rst;

    missile[i]._mirange--;
    p = missile[i]._misource;
    if (missile[i]._miAnimType != 0x1A /* MF_CBOLT */ && missile[i]._miAnimType != 5 /* MF_EXP1 */) {
        missile[i]._midist++;
        missile[i]._mitxoff += missile[i]._mixvel;
        missile[i]._mityoff += missile[i]._miyvel;
        GetMissilePos(i);
        if (p != -1) {
            if (missile[i]._micaster == TARGET_MONSTERS) {
                mind = plr[p]._pIMinDam;
                maxd = plr[p]._pIMaxDam;
            } else {
                mind = monster[p].mMinDamage;
                maxd = monster[p].mMaxDamage;
            }
        } else {
            mind = currlevel + ENG_random(10) + 1;
            maxd = currlevel * 2 + ENG_random(10) + 1;
        }
        if (missile[i]._mix != missile[i]._misx || missile[i]._miy != missile[i]._misy) {
            rst = missiledata[missile[i]._mitype].mResist;
            missiledata[missile[i]._mitype].mResist = 0; /* MIMT_NONE */
            CheckMissileCol(i, mind, maxd, 0, missile[i]._mix, missile[i]._miy, 0, 1);
            missiledata[missile[i]._mitype].mResist = rst;
        }

        if (missile[i]._mirange == 0) {
            missile[i]._mimfnum = 0;
            missile[i]._mitxoff -= missile[i]._mixvel;
            missile[i]._mityoff -= missile[i]._miyvel;
            GetMissilePos(i);
            SetMissAnim(i, missile[i]._mitype != MIS_LARROW ? 5 /* MF_EXP1 */ : 0x1A /* MF_CBOLT */);
            missile[i]._mirange = missile[i]._miAnimLen - 1;
        } else {
            if (missile[i]._mix != missile[i]._miVar1 || missile[i]._miy != missile[i]._miVar2) {
                missile[i]._miVar1 = missile[i]._mix;
                missile[i]._miVar2 = missile[i]._miy;
                if (missile[i]._mitype == MIS_LARROW)
                    ChangeLight(missile[i]._mlid, missile[i]._miVar1, missile[i]._miVar2, 0x365);
                else
                    ChangeLight(missile[i]._mlid, missile[i]._miVar1, missile[i]._miVar2, 0x95);
            }
        }
    } else {
        if (missile[i]._mitype == MIS_LARROW)
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, missile[i]._miAnimFrame + 0x360);
        else
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, missile[i]._miAnimFrame + 0x90);
        rst = missiledata[missile[i]._mitype].mResist;
        if (missile[i]._mitype == MIS_LARROW) {
            if (p != -1) {
                mind = plr[p]._pILMinDam;
                maxd = plr[p]._pILMaxDam;
            } else {
                mind = currlevel + ENG_random(10) + 1;
                maxd = currlevel * 2 + ENG_random(10) + 1;
            }
            missiledata[MIS_LARROW].mResist = 2; /* MIMT_LGHT */
            CheckMissileCol(i, mind, maxd, 0, missile[i]._mix, missile[i]._miy, 0, 1);
        }
        if (missile[i]._mitype == 27 /* MIT_FARROW -- no MIS_FARROW slot in this build's MIS_ table */) {
            if (p != -1) {
                mind = plr[p]._pIFMinDam;
                maxd = plr[p]._pIFMaxDam;
            } else {
                mind = currlevel + ENG_random(10) + 1;
                maxd = currlevel * 2 + ENG_random(10) + 1;
            }
            missiledata[27].mResist = 1; /* MIMT_FIRE */
            CheckMissileCol(i, mind, maxd, 0, missile[i]._mix, missile[i]._miy, 0, 1);
        }
        missiledata[missile[i]._mitype].mResist = rst;
    }

    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        AddUnLight(missile[i]._mlid);
    }

    PutMissile(i);
}

void MI_Arrow(int i)
{
    int p, mind, maxd;

    missile[i]._mirange--;
    missile[i]._midist++;
    missile[i]._mitxoff += missile[i]._mixvel;
    missile[i]._mityoff += missile[i]._miyvel;
    GetMissilePos(i);
    p = missile[i]._misource;
    if (p != -1) {
        if (missile[i]._micaster == TARGET_MONSTERS) {
            mind = plr[p]._pIMinDam;
            maxd = plr[p]._pIMaxDam;
        } else {
            mind = monster[p].mMinDamage;
            maxd = monster[p].mMaxDamage;
        }
    } else {
        mind = currlevel;
        maxd = currlevel * 2;
    }
    if (missile[i]._mix != missile[i]._misx || missile[i]._miy != missile[i]._misy)
        CheckMissileCol(i, mind, maxd, 0, missile[i]._mix, missile[i]._miy, 0, 1);
    if (missile[i]._mirange == 0)
        missile[i]._miDelFlag = 1;
    PutMissile(i);
}

void MI_Lightning(int i)
{
    int j;
    MissileStruct *miss = &missile[i];

    miss->_mirange--;
    j = miss->_mirange;
    if (miss->_mix != miss->_misx || miss->_miy != miss->_misy)
        CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix, miss->_miy, 0, 1);
    if (miss->_miHitFlag == 1)
        miss->_mirange = j;

    /* PSX-only: re-centers the light on the missile's current tile every tick (hellfire doesn't
     * call ChangeLight in MI_Lightning at all); radius 0x243=579 not devilution's animation-based. */
    ChangeLight(miss->_mlid, miss->_mix, miss->_miy, 0x243);

    if (miss->_mirange == 0) {
        miss->_miDelFlag = 1;
        AddUnLight(miss->_mlid);
    }
    PutMissile(i);
}

void MI_Flame(int i)
{
    int k;

    missile[i]._mirange--;
    missile[i]._miVar2--;

    k = missile[i]._mirange;
    CheckMissileCol(i, missile[i]._midam, missile[i]._midam, 1, missile[i]._mix, missile[i]._miy, 0, 1);
    if (missile[i]._mirange == 0 && missile[i]._miHitFlag == 1)
        missile[i]._mirange = k;
    if (missile[i]._miVar2 == 0)
        missile[i]._miAnimFrame = 20;
    if (missile[i]._miVar2 <= 0) {
        k = missile[i]._miAnimFrame;
        if (k >= 12)
            k = 24 - k;
        /* PSX-only: radius is (k>>3)+148, not the plain k hellfire passes. */
        ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, (k >> 3) + 0x94);
    }

    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        AddUnLight(missile[i]._mlid);
    }
    if (missile[i]._miVar2 <= 0)
        PutMissile(i);
}

void MI_Flamec(int i)
{
    int id;

    missile[i]._mirange--;
    id = missile[i]._misource;

    missile[i]._mitxoff += missile[i]._mixvel;
    missile[i]._mityoff += missile[i]._miyvel;
    GetMissilePos(i);

    if (missile[i]._mix != missile[i]._miVar1 || missile[i]._miy != missile[i]._miVar2) {
        /* PSX-only: uses GetMISSILE(x,y) (DPIECE.CPP) in place of nMissileTable[dPiece[x][y]]. */
        if (GetMISSILE(missile[i]._mix, missile[i]._miy) == 0)
            AddMissile(missile[i]._mix, missile[i]._miy, missile[i]._misx, missile[i]._misy, i, MIS_FLAME, missile[i]._micaster, id, missile[i]._miVar3, missile[i]._mispllvl);
        else
            missile[i]._mirange = 0;
        missile[i]._miVar1 = missile[i]._mix;
        missile[i]._miVar2 = missile[i]._miy;
        missile[i]._miVar3++;
    }

    if (missile[i]._mirange == 0 || missile[i]._miVar3 == 3)
        missile[i]._miDelFlag = 1;
}

void MI_Firebolt(int i)
{
    int omx, omy, d, p;

    d = 0;
    missile[i]._mirange--;
    /* PSX (like hellfire's source shape) checks the bonespirit-impact early-out FIRST,
     * not as a trailing else-if the way devilution's source reads. */
    if (missile[i]._mitype == MIS_BONESPIRIT && missile[i]._mimfnum == 8) {
        if (missile[i]._mirange == 0) {
            if (missile[i]._mlid >= 0)
                AddUnLight(missile[i]._mlid);
            missile[i]._miDelFlag = 1;
            PlaySfxLoc(75, missile[i]._mix, missile[i]._miy);
        }
        PutMissile(i);
        return;
    }

    omx = missile[i]._mitxoff;
    omy = missile[i]._mityoff;
    missile[i]._mitxoff += missile[i]._mixvel;
    missile[i]._mityoff += missile[i]._miyvel;
    GetMissilePos(i);
    p = missile[i]._misource;
    if (p != -1) {
        if (missile[i]._micaster == TARGET_MONSTERS) {
            switch (missile[i]._mitype) {
            case MIS_FLARE:
                d = (plr[p]._pMagic >> 1) - (plr[p]._pMagic >> 3) + 2 * missile[i]._mispllvl + missile[i]._mispllvl;
                break;
            case MIS_FIREBOLT:
                d = ENG_random(10) + 1 + (plr[p]._pMagic >> 3) + missile[i]._mispllvl;
                break;
            case MIS_BONESPIRIT:
                d = 0;
                break;
            }
        } else {
            d = ENG_random(monster[p].mMaxDamage - monster[p].mMinDamage + 1) + monster[p].mMinDamage;
        }
    } else {
        d = ENG_random(2 * currlevel) + currlevel;
    }
    if (missile[i]._mix != missile[i]._misx || missile[i]._miy != missile[i]._misy)
        CheckMissileCol(i, d, d, 0, missile[i]._mix, missile[i]._miy, 0, 1);
    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        missile[i]._mitxoff = omx;
        missile[i]._mityoff = omy;
        GetMissilePos(i);
        switch (missile[i]._mitype) {
        case MIS_FLARE:
            AddMissile(missile[i]._mix, missile[i]._miy, i, 0, missile[i]._mimfnum, MIS_MISEXP2, missile[i]._micaster, missile[i]._misource, 0, 0);
            break;
        case MIS_FIREBOLT:
        case MIS_MAGMABALL:
            AddMissile(missile[i]._mix, missile[i]._miy, i, 0, missile[i]._mimfnum, MIS_MISEXP, missile[i]._micaster, missile[i]._misource, 0, 0);
            break;
        case MIS_ACID:
            AddMissile(missile[i]._mix, missile[i]._miy, i, 0, missile[i]._mimfnum, MIS_MISEXP3, missile[i]._micaster, missile[i]._misource, 0, 0);
            break;
        case MIS_BONESPIRIT:
            SetMissDir(i, 8);
            missile[i]._mirange = 7;
            missile[i]._miDelFlag = 0;
            PutMissile(i);
            return;
        }
        if (missile[i]._mlid >= 0)
            AddUnLight(missile[i]._mlid);
        PutMissile(i);
    } else {
        if (missile[i]._mix != missile[i]._miVar1 || missile[i]._miy != missile[i]._miVar2) {
            missile[i]._miVar1 = missile[i]._mix;
            missile[i]._miVar2 = missile[i]._miy;
            if (missile[i]._mlid >= 0) {
                switch (missile[i]._miAnimType) {
                case 0x28:
                    ChangeLight(missile[i]._mlid, missile[i]._miVar1, missile[i]._miVar2, 0x243);
                    break;
                case 0x2A:
                    ChangeLight(missile[i]._mlid, missile[i]._miVar1, missile[i]._miVar2, 0x1B3);
                    break;
                default:
                    ChangeLight(missile[i]._mlid, missile[i]._miVar1, missile[i]._miVar2, 0x95);
                    break;
                }
            }
        }
        PutMissile(i);
    }
}

void MI_Lightball(int i)
{
    int j, tx, ty, oi;

    tx = missile[i]._miVar1;
    ty = missile[i]._miVar2;
    missile[i]._mirange--;
    missile[i]._mitxoff += missile[i]._mixvel;
    missile[i]._mityoff += missile[i]._miyvel;
    GetMissilePos(i);
    j = missile[i]._mirange;
    CheckMissileCol(i, missile[i]._midam, missile[i]._midam, 0, missile[i]._mix, missile[i]._miy, 0, 0);
    if (missile[i]._miHitFlag == 1)
        missile[i]._mirange = j;

    if (dung_map[tx][ty].dObject != 0 && tx == missile[i]._mix && ty == missile[i]._miy) {
        if (dung_map[tx][ty].dObject > 0)
            oi = dung_map[tx][ty].dObject - 1;
        else
            oi = ~dung_map[tx][ty].dObject;
        if (object[oi]._otype == 59 /* OBJ_SHRINEL */ || object[oi]._otype == 60 /* OBJ_SHRINER */)
            missile[i]._mirange = j;
    }

    /* PSX-only: bit 1 of the raw missile slot index gates an extra ChangeLight/AddUnLight
     * bookkeeping pass with no PC twin -- transcribed literally from the raw oracle. */
    if (i & 2)
        ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, 0x243);

    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        if (i & 2)
            AddUnLight(missile[i]._mlid);
    }
    PutMissile(i);
}

void MI_Firewall(int i)
{
    int ExpLight[14] = { 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 12, 12 };

    missile[i]._mirange--;
    if (missile[i]._mirange == missile[i]._miVar1) {
        SetMissDir(i, 1);
        missile[i]._miAnimFrame = ENG_random(11) + 1;
    }
    if (missile[i]._mirange == missile[i]._miAnimLen - 1) {
        SetMissDir(i, 0);
        missile[i]._miAnimFrame = 13;
        missile[i]._miAnimAdd = -1;
    }
    CheckMissileCol(i, missile[i]._midam, missile[i]._midam, 1, missile[i]._mix, missile[i]._miy, 1, 1);
    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        if ((unsigned char)i)
            AddUnLight(missile[i]._mlid);
    }
    if (missile[i]._mimfnum != 0 && missile[i]._mirange != 0 && missile[i]._miAnimAdd != -1 && missile[i]._miVar2 < 12) {
        if (missile[i]._miVar2 == 0) {
            if ((unsigned char)i)
                missile[i]._mlid = AddLight(missile[i]._mix, missile[i]._miy, (ExpLight[0] >> 3) + 16);
        }
        if ((unsigned char)i)
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar2] >> 2) + 16);
        missile[i]._miVar2++;
    }
    PutMissile(i);
}

void MI_Fireball(int i)
{
    int dam, px, py, id, mx, my;

    id = missile[i]._misource;
    dam = missile[i]._midam;
    missile[i]._mirange--;

    if (missile[i]._micaster == TARGET_MONSTERS) {
        px = plr[id]._px;
        py = plr[id]._py;
    } else {
        px = monster[id]._mx;
        py = monster[id]._my;
    }

    if (missile[i]._miAnimType == 0x13 /* MFILE_BIGEXP */) {
        if (missile[i]._mirange == 0) {
            missile[i]._miDelFlag = 1;
            AddUnLight(missile[i]._mlid);
        }
    } else {
        missile[i]._mitxoff += missile[i]._mixvel;
        missile[i]._mityoff += missile[i]._miyvel;
        GetMissilePos(i);
        if (missile[i]._mix != missile[i]._misx || missile[i]._miy != missile[i]._misy)
            CheckMissileCol(i, dam, dam, 0, missile[i]._mix, missile[i]._miy, 0, 1);
        if (missile[i]._mirange == 0) {
            mx = missile[i]._mix;
            my = missile[i]._miy;
            ChangeLight(missile[i]._mlid, missile[i]._mix, my, 149); /* PSX radius literal, not devilution's _miAnimFrame */
            if (!CheckBlock(px, py, mx, my))
                CheckMissileCol(i, dam, dam, 0, mx, my, 1, 1);
            if (!CheckBlock(px, py, mx, my + 1))
                CheckMissileCol(i, dam, dam, 0, mx, my + 1, 1, 1);
            if (!CheckBlock(px, py, mx, my - 1))
                CheckMissileCol(i, dam, dam, 0, mx, my - 1, 1, 1);
            if (!CheckBlock(px, py, mx + 1, my))
                CheckMissileCol(i, dam, dam, 0, mx + 1, my, 1, 1);
            if (!CheckBlock(px, py, mx + 1, my - 1))
                CheckMissileCol(i, dam, dam, 0, mx + 1, my - 1, 1, 1);
            if (!CheckBlock(px, py, mx + 1, my + 1))
                CheckMissileCol(i, dam, dam, 0, mx + 1, my + 1, 1, 1);
            if (!CheckBlock(px, py, mx - 1, my))
                CheckMissileCol(i, dam, dam, 0, mx - 1, my, 1, 1);
            if (!CheckBlock(px, py, mx - 1, my + 1))
                CheckMissileCol(i, dam, dam, 0, mx - 1, my + 1, 1, 1);
            if (!CheckBlock(px, py, mx - 1, my - 1))
                CheckMissileCol(i, dam, dam, 0, mx - 1, my - 1, 1, 1);
            if (!TransList[dung_map[mx][my].dTransVal]
                || (missile[i]._mixvel < 0 && ((TransList[dung_map[mx][my + 1].dTransVal] && GetSOLID(mx, my + 1)) || (TransList[dung_map[mx][my - 1].dTransVal] && GetSOLID(mx, my - 1))))) {
                missile[i]._mix++;
                missile[i]._miy++;
                missile[i]._miyoff -= 32;
            }
            if (missile[i]._miyvel > 0
                && ((TransList[dung_map[mx + 1][my].dTransVal] && GetSOLID(mx + 1, my))
                    || (TransList[dung_map[mx - 1][my].dTransVal] && GetSOLID(mx - 1, my)))) {
                missile[i]._miyoff -= 32;
            }
            if (missile[i]._mixvel > 0
                && ((TransList[dung_map[mx][my + 1].dTransVal] && GetSOLID(mx, my + 1))
                    || (TransList[dung_map[mx][my - 1].dTransVal] && GetSOLID(mx, my - 1)))) {
                missile[i]._mixoff -= 32;
            }
            missile[i]._mimfnum = 0;
            SetMissAnim(i, 0x13 /* MFILE_BIGEXP */);
            missile[i]._mirange = missile[i]._miAnimLen - 1;
        } else if (missile[i]._mix != missile[i]._miVar1 || missile[i]._miy != missile[i]._miVar2) {
            missile[i]._miVar1 = missile[i]._mix;
            missile[i]._miVar2 = missile[i]._miy;
            ChangeLight(missile[i]._mlid, missile[i]._miVar1, missile[i]._miVar2, 149); /* PSX radius literal, not devilution's 8 */
        }
    }

    PutMissile(i);
}

void MI_Lightctrl(int i)
{
    int dam, p, mx, my;
    MissileStruct *miss = &missile[i];

    miss->_mirange--;

    p = miss->_misource;
    if (p != -1) {
        if (miss->_micaster == TARGET_MONSTERS) {
            dam = ENG_random(plr[p]._pLevel) + ENG_random(2) + 2;
            dam <<= 6;
        } else {
            dam = 2 * (ENG_random(monster[p].mMaxDamage - monster[p].mMinDamage + 1) + monster[p].mMinDamage);
        }
    } else {
        dam = ENG_random(currlevel) + 2 * currlevel;
    }

    miss->_mitxoff += miss->_mixvel;
    miss->_mityoff += miss->_miyvel;
    GetMissilePos(i);

    mx = miss->_mix;
    my = miss->_miy;

    /* PSX bounds against the raw dung_map extent (112) AFTER the position update, with an early
     * AddUnLight+return -- no PC twin has this gate at all. */
    if (mx >= 112 || my >= 112) {
        miss->_miDelFlag = 1;
        AddUnLight(miss->_mlid);
        return;
    }

    if ((miss->_misource != -1 || mx != miss->_misx || my != miss->_misy) && GetMISSILE(mx, my))
        miss->_mirange = 0;
    if (!GetMISSILE(mx, my)) {
        if ((mx != miss->_miVar1 || my != miss->_miVar2) && mx > 0 && my > 0 && mx < 112 && my < 112) {
            /* PSX-only: monster casters of type [0x4C,0x4F] or [0x6B,0x6E] spawn MIS_LIGHTNING2
             * (0x17) and play the cast SFX on the first tick; everything else MIS_LIGHTNING. */
            if (miss->_misource != -1 && miss->_micaster == TARGET_PLAYERS
                && ((monster[miss->_misource].MType->mtype >= 0x4C && monster[miss->_misource].MType->mtype <= 0x4F)
                    || (monster[miss->_misource].MType->mtype >= 0x6B && monster[miss->_misource].MType->mtype <= 0x6E))) {
                AddMissile(miss->_mix, miss->_miy, miss->_misx, miss->_misy, i, 0x17 /* MIS_LIGHTNING2 */, miss->_micaster, miss->_misource, dam, miss->_mispllvl);
                if (miss->_mirange >= 254)
                    PlaySfxLoc(0x50, miss->_mix, miss->_miy);
            } else {
                AddMissile(miss->_mix, miss->_miy, miss->_misx, miss->_misy, i, MIS_LIGHTNING, miss->_micaster, miss->_misource, dam, miss->_mispllvl);
            }
            miss->_miVar1 = miss->_mix;
            miss->_miVar2 = miss->_miy;
        }
    }
    if (miss->_mirange == 0 || mx <= 0 || my <= 0 || mx >= 112 || my >= 113)
        miss->_miDelFlag = 1;
}

void MI_Town(int i)
{
    int p;
    int ExpLight[17] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 15 };

    if (missile[i]._mirange > 1)
        missile[i]._mirange--;
    if (missile[i]._mirange == missile[i]._miVar1)
        SetMissDir(i, 1);
    if (currlevel != 0 && missile[i]._mimfnum != 1 && missile[i]._mirange != 0) {
        if (missile[i]._miVar2 == 0)
            missile[i]._mlid = AddLight(missile[i]._mix, missile[i]._miy, (ExpLight[0] >> 2) + 320);
        ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar2] >> 2) + 320);
        missile[i]._miVar2++;
    }

    /* PSX's per-player loop is much simpler than devilution's (no currlevel/plrlevel,
     * _pLvlChanging or _pmode==PM_STAND checks), but adds qtextflag/PauseMode gates and, in a
     * 2-player co-op game, a check that the OTHER player isn't already mid-warp (_pmode==13) to
     * avoid double-triggering. No `p == myplr` gate at all -- confirmed via raw oracle: on a
     * match it always calls ClrPlrPath/PutMissile/NetSendCmdParam1(cmd=0x1F, not 34) and returns
     * immediately, skipping the rest of the loop and the mirange/AddUnLight cleanup below. */
    for (p = 0; p < MAX_PLRS; p++) {
        PlayerStruct *player = &plr[p];
        if (player->plractive && player->_px == missile[i]._mix && player->_py == missile[i]._miy && !qtextflag && !PauseMode) {
            if (gbMaxPlayers != 2 || !plr[p ^ 1].plractive || plr[p ^ 1].destAction != 13) {
                ClrPlrPath(p);
                PutMissile(i);
                NetSendCmdParam1(1, 0x1F, missile[i]._misource);
                return;
            }
        }
    }

    if (missile[i]._mirange == 0)
        missile[i]._miDelFlag = 1;
    PutMissile(i);
}

void MI_Flash(int i)
{
    MissileStruct *miss = &missile[i];

    if (miss->_micaster == TARGET_MONSTERS && miss->_misource != -1)
        plr[miss->_misource]._pInvincible = 1;
    miss->_mirange--;
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix - 1, miss->_miy, 1, 1);
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix, miss->_miy, 1, 1);
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix + 1, miss->_miy, 1, 1);
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix - 1, miss->_miy + 1, 1, 1);
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix, miss->_miy + 1, 1, 1);
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix + 1, miss->_miy + 1, 1, 1);
    if (miss->_mirange == 0) {
        miss->_miDelFlag = 1;
        restore_r = fadetor;
        restore_g = fadetog;
        restore_b = fadetob;
        if (miss->_micaster == TARGET_MONSTERS && miss->_misource != -1)
            plr[miss->_misource]._pInvincible = 0;
    }

    /* PSX-only: unlike MI_Flash2's plain snapshot, MI_Flash blends a fade-out gradient into
     * restore_r/g/b -- `(19 - _miAnimFrame) / 18` (raw: multiply-by-0x38E38E39, mfhi >> 2) scaled by 240 and added to the
     * current fadetor/fadetog/fadetob, then clamped to 255. Runs unconditionally (both mirange
     * paths reach it). No PC twin has this; reconstructed instruction-by-instruction. */
    restore_r = fadetor + (19 - miss->_miAnimFrame) / 18 * 240;
    restore_g = fadetog + (19 - miss->_miAnimFrame) / 18 * 240;
    restore_b = fadetob + (19 - miss->_miAnimFrame) / 18 * 240;
    if (restore_r >= 256)
        restore_r = 255;
    if (restore_g >= 256)
        restore_g = 255;
    if (restore_b >= 256)
        restore_b = 255;

    PutMissile(i);
}

void MI_Firemove(int i)
{
    int j;
    int ExpLight[14] = { 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 12, 12 };
    MissileStruct *miss = &missile[i];

    miss->_mix--;
    miss->_miy--;
    miss->_miyoff += 32;
    miss->_miVar1++;
    if (miss->_miVar1 == miss->_miAnimLen) {
        SetMissDir(i, 1);
        miss->_miAnimFrame = ENG_random(11) + 1;
    }
    miss->_mitxoff += miss->_mixvel;
    miss->_mityoff += miss->_miyvel;
    GetMissilePos(i);
    j = miss->_mirange;
    CheckMissileCol(i, miss->_midam, miss->_midam, 0, miss->_mix, miss->_miy, 0, 1);
    if (miss->_miHitFlag == 1)
        miss->_mirange = j;
    if (miss->_mirange == 0) {
        miss->_miDelFlag = 1;
        AddUnLight(miss->_mlid);
    }
    if (miss->_mimfnum == 0 && miss->_mirange != 0) {
        if (miss->_miVar2 == 0)
            miss->_mlid = AddLight(miss->_mix, miss->_miy, (ExpLight[0] >> 1) + 144);
        ChangeLight(miss->_mlid, miss->_mix, miss->_miy, (ExpLight[miss->_miVar2] >> 1) + 144);
        miss->_miVar2++;
    } else {
        if (miss->_mix != miss->_miVar3 || miss->_miy != miss->_miVar4) {
            miss->_miVar3 = miss->_mix;
            miss->_miVar4 = miss->_miy;
            ChangeLight(miss->_mlid, miss->_miVar3, miss->_miVar4, 148);
        }
    }
    miss->_mix++;
    miss->_miy++;
    miss->_miyoff -= 32;
    PutMissile(i);
}

void MI_Manashield(int i)
{
    /* PSX-only: a class(3) x direction(8) pixel-offset table with no PC-twin equivalent, looked
     * up by player class/facing and stashed into _miVar6 (NOT _mix -- confirmed via raw oracle
     * field offset 0x28). Values read directly from rom/DIABPSX.BIN @ VA 0x8011A13C. Retail's SYM
     * nests it ONE LEVEL UP from the rest of this function's locals (its own block, sibling to
     * `i`), so it's declared in an outer brace here to match that block structure. */
    static int xoffset[3][8] = {
        { -2, -1, 4, 6, 9, 10, 6, 2 },
        { 3, 2, 2, 4, 5, 6, 6, 4 },
        { 1, -1, -2, 0, 3, 5, 5, 4 },
    };
    int j, id;
    long diff, pct;
    MissileStruct *miss = &missile[i];
    PlayerStruct *player;

    id = miss->_misource;
    player = &plr[id];

    miss->_miVar6 = xoffset[player->_pClass][player->_pdir];
    miss->_mix = player->_px;
    miss->_miy = player->_py;
    miss->_mitxoff = player->_pxoff << 16;
    miss->_mityoff = player->_pyoff << 16;
    miss->_misx = player->_px;
    miss->_misy = player->_py;

    GetMissilePos(i);

    if (player->_pmode == PM_WALK3) {
        if (player->_pdir == DIR_W)
            miss->_mix++;
        else
            miss->_miy++;
    }

    /* PSX drops devilution's `if (id != myplr) { ...; return; }` early-out entirely -- confirmed
     * absent from the raw oracle (no currlevel/plrlevel/myplr check at all; falls straight into
     * the pMana/plractive test below for every player). */
    if (player->_pMana <= 0 || !player->plractive)
        miss->_mirange = 0;

    if (player->_pHitPoints < miss->_miVar1) {
        diff = miss->_miVar1 - player->_pHitPoints;
        pct = 0;
        for (j = 0; j < miss->_mispllvl && j < 7; j++)
            pct += 3;
        if (pct > 0)
            diff -= diff / pct;
        if (diff < 0)
            diff = 0;
        drawmanaflag = 1;
        drawhpflag = 1;
        if (player->_pMana >= diff) {
            player->_pHitPoints = miss->_miVar1;
            player->_pHPBase = miss->_miVar2;
            player->_pMana -= diff;
            player->_pManaBase -= diff;
        } else {
            player->_pHitPoints -= diff - player->_pMana;
            player->_pHPBase -= diff - player->_pMana;
            player->_pMana = 0;
            player->_pManaBase = -(player->_pMaxMana - player->_pMaxManaBase);
            miss->_mirange = 0;
            miss->_miDelFlag = 1;
            if (player->_pHitPoints < 0)
                SetPlayerHitPoints(id, 0);
            if ((player->_pHitPoints >> 6) == 0 && id == myplr)
                StartPlrKill(id, miss->_miVar8);
        }
    }

    miss->_miVar1 = player->_pHitPoints;
    miss->_miVar2 = player->_pHPBase;

    if (miss->_mirange == 0) {
        miss->_miDelFlag = 1;
        NetSendCmd(1, 89 /* CMD_ENDSHIELD */);
        /* PSX clears BOTH flags unconditionally here (not gated by id==0) -- confirmed via raw oracle. */
        ManashieldFlag = 0;
        ManashieldFlag2 = 0;
    }
    PutMissile(i);
}

void MI_Guardian(int i)
{
    int j, k, sx, sy, sx1, sy1, ex;
    MissileStruct *miss = &missile[i];

    sx1 = 0;
    sy1 = 0;
    miss->_mirange--;

    if (miss->_miVar2 > 0)
        miss->_miVar2--;
    if (miss->_mirange == miss->_miVar1 || (miss->_mimfnum == 2 /* MFILE_GUARD */ && miss->_miVar2 == 0))
        SetMissDir(i, 1);

    if (!(miss->_mirange % 16)) {
        ex = 0;
        for (k = 0; k < 23; k++) {
            if (ex == -1)
                break;
            for (j = 10; j >= 0; j -= 2) {
                if (ex == -1)
                    break;
                if (vCrawlTable[k][j] == 0 && vCrawlTable[k][j + 1] == 0)
                    break;
                if (sx1 == vCrawlTable[k][j] && sy1 == vCrawlTable[k][j + 1])
                    continue;
                sx = miss->_mix + vCrawlTable[k][j];
                sy = miss->_miy + vCrawlTable[k][j + 1];
                ex = Sentfire(i, sx, sy);
                if (ex == -1)
                    break;
                sx = miss->_mix - vCrawlTable[k][j];
                sy = miss->_miy - vCrawlTable[k][j + 1];
                ex = Sentfire(i, sx, sy);
                if (ex == -1)
                    break;
                sx = miss->_mix + vCrawlTable[k][j];
                sy = miss->_miy - vCrawlTable[k][j + 1];
                ex = Sentfire(i, sx, sy);
                if (ex == -1)
                    break;
                sx = miss->_mix - vCrawlTable[k][j];
                sy = miss->_miy + vCrawlTable[k][j + 1];
                ex = Sentfire(i, sx, sy);
                if (ex == -1)
                    break;
                sx1 = vCrawlTable[k][j];
                sy1 = vCrawlTable[k][j + 1];
            }
        }
    }

    if (miss->_mirange == 14) {
        SetMissDir(i, 0);
        miss->_miAnimFrame = 15;
        miss->_miAnimAdd = -1;
    }

    miss->_miVar3 += miss->_miAnimAdd;
    if (miss->_miVar3 > 15) {
        miss->_miVar3 = 15;
    } else if (miss->_miVar3 > 0) {
        ChangeLight(miss->_mlid, miss->_mix, miss->_miy, 148);
    }

    if (miss->_mirange == 0) {
        miss->_miDelFlag = 1;
        AddUnLight(miss->_mlid);
    }

    PutMissile(i);
}

void MI_Chain(int i)
{
    MissileStruct *miss = &missile[i];
    int sx, sy, id, dir;
    int l, n, m, k, rad;
    int tx, ty;
    int CrawlNum[19] = { 0, 3, 12, 45, 94, 159, 240, 337, 450, 579, 724, 885, 1062, 1255, 1464, 1689, 1930, 2187, 2460 };

    id = miss->_misource;
    sx = miss->_mix;
    sy = miss->_miy;

    dir = GetDirection(sx, sy, miss->_miVar1, miss->_miVar2);
    AddMissile(sx, sy, miss->_miVar1, miss->_miVar2, dir, MIS_LIGHTCTRL, TARGET_MONSTERS, id, 1, miss->_mispllvl);

    rad = 3 + miss->_mispllvl;
    if (rad > 19)
        rad = 19;
    for (m = 1; m < rad; m++) {
        n = CrawlNum[m];
        l = n + 1;
        for (k = (unsigned char)CrawlTable[n]; k > 0; k--) {
            tx = sx + CrawlTable[l];
            ty = sy + CrawlTable[l + 1];
            if (tx > 0 && tx < 112 && ty > 0 && ty < 112) { /* raw dung_map extent, not MAXDUNX/MAXDUNY */
                if (dung_map[tx][ty].dMonster > 0) {
                    dir = GetDirection(sx, sy, tx, ty);
                    AddMissile(sx, sy, tx, ty, dir, MIS_LIGHTCTRL, TARGET_MONSTERS, id, 1, miss->_mispllvl);
                }
            }
            l += 2;
        }
    }

    miss->_mirange--;
    if (miss->_mirange == 0)
        miss->_miDelFlag = 1;
}

void MI_Weapexp(int i)
{
    int id, mind, maxd;
    int ExpLight[10] = { 9, 10, 11, 12, 11, 10, 8, 6, 4, 2 };

    missile[i]._mirange--;

    id = missile[i]._misource;
    if (missile[i]._miVar2 == 1) {
        mind = plr[id]._pIFMinDam;
        maxd = plr[id]._pIFMaxDam;
        missiledata[missile[i]._mitype].mResist = 1; /* MIMT_FIRE */
    } else {
        mind = plr[id]._pILMinDam;
        maxd = plr[id]._pILMaxDam;
        missiledata[missile[i]._mitype].mResist = 2; /* MIMT_LGHT */
    }

    CheckMissileCol(i, mind, maxd, 0, missile[i]._mix, missile[i]._miy, 0, 1);

    /* PSX: ExpLight[] is still built but unused -- fixed radii per element (fire 0x94, lightning 0x244). */
    if (missile[i]._miVar1 == 0) {
        if (missile[i]._miVar2 == 1)
            missile[i]._mlid = AddLight(missile[i]._mix, missile[i]._miy, 0x94);
        else
            missile[i]._mlid = AddLight(missile[i]._mix, missile[i]._miy, 0x244);
    } else if (missile[i]._mirange != 0) {
        if (missile[i]._miVar2 == 1)
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, 0x94);
        else
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, 0x244);
    }

    missile[i]._miVar1++;
    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        AddUnLight(missile[i]._mlid);
        return;
    }

    PutMissile(i);
}

void MI_Misexp(int i)
{
    /* Re-derived from the raw oracle (previous devilution-shaped port was structurally wrong --
     * the oracle's "memcpy-like" block is just this compiler's codegen for a big local array
     * initializer, copied word-by-word from a rodata template). Retail's ExpLight here is the
     * SAME 10-element table as MI_Weapexp's (same rodata symbol, D_8011A19C), not devilution's
     * 15-element one. Also PSX-only: `_miAnimType` selects among THREE different radius-literal
     * families (0x240/0x1B0/0x90) with no PC twin, and the two non-default cases (0x28, 0x2A)
     * deliberately DISCARD the AddLight() return value (mlid is left unset) -- confirmed by the
     * oracle jumping around the mlid-store block for those two cases only. */
    int ExpLight[10] = { 9, 10, 11, 12, 11, 10, 8, 6, 4, 2 };

    missile[i]._mirange--;
    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        AddUnLight(missile[i]._mlid);
        return;
    }

    if (missile[i]._miVar1 == 0) {
        switch (missile[i]._miAnimType) {
        case 0x28:
            AddLight(missile[i]._mix, missile[i]._miy, (ExpLight[0] >> 2) + 0x240);
            break;
        case 0x2A:
            AddLight(missile[i]._mix, missile[i]._miy, (ExpLight[0] >> 2) + 0x1B0);
            break;
        default:
            missile[i]._mlid = AddLight(missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar1] >> 2) + 0x90);
            break;
        }
    } else {
        switch (missile[i]._miAnimType) {
        case 0x28:
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar1] >> 2) + 0x240);
            break;
        case 0x2A:
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar1] >> 2) + 0x1B0);
            break;
        default:
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar1] >> 2) + 0x90);
            break;
        }
    }

    missile[i]._miVar1++;
    PutMissile(i);
}

void MI_Cbolt(int i)
{
    int bpath[16] = { -1, 0, 1, -1, 0, 1, -1, -1, 0, 0, 1, 1, 0, 1, -1, 0 };
    int sx, sy, dx, dy, md;

    missile[i]._mirange--;
    if (missile[i]._miAnimType != 3 /* MF_LIGHTNING */) {
        if (missile[i]._miVar3 == 0) {
            md = (missile[i]._miVar2 + bpath[missile[i]._mirnd]) & 7;
            missile[i]._mirnd = (missile[i]._mirnd + 1) & 0xF;
            sx = missile[i]._mix;
            sy = missile[i]._miy;
            dx = sx + XDirAdd[md];
            dy = sy + YDirAdd[md];
            GetMissileVel(i, sx, sy, dx, dy, 8);
            missile[i]._miVar3 = 16;
        } else {
            missile[i]._miVar3--;
        }

        missile[i]._mitxoff += missile[i]._mixvel;
        missile[i]._mityoff += missile[i]._miyvel;
        GetMissilePos(i);

        CheckMissileCol(i, missile[i]._midam, missile[i]._midam, 0, missile[i]._mix, missile[i]._miy, 0, 1);
        if (missile[i]._miHitFlag == 1) {
            missile[i]._miVar1 = 8;
            missile[i]._mimfnum = 0;
            missile[i]._mixoff = 0;
            missile[i]._miyoff = 0;
            SetMissAnim(i, 3 /* MF_LIGHTNING */);
            missile[i]._mirange = missile[i]._miAnimLen;
            GetMissilePos(i);
        }

        /* PSX-only: bit 2 of the raw missile slot index gates this ChangeLight call (and the
         * AddUnLight below) -- same idiom as MI_Lightball's `i & 2` gate, confirmed via oracle
         * (`andi v0,s2,4` where s2=i); when gated off, the call is skipped entirely. */
        if (i & 4)
            ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, 578);
    }

    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        if (i & 4)
            AddUnLight(missile[i]._mlid);
    }

    PutMissile(i);
}

void MI_Hbolt(int i)
{
    int dam;

    missile[i]._mirange--;
    if (missile[i]._miAnimType != 28 /* MF_HEXPL */) {
        missile[i]._mitxoff += missile[i]._mixvel;
        missile[i]._mityoff += missile[i]._miyvel;

        GetMissilePos(i);

        dam = missile[i]._midam;
        if (missile[i]._mix != missile[i]._misx || missile[i]._miy != missile[i]._misy)
            CheckMissileCol(i, dam, dam, 0, missile[i]._mix, missile[i]._miy, 0, 1);

        if (missile[i]._mirange == 0) {
            missile[i]._mitxoff -= missile[i]._mixvel;
            missile[i]._mityoff -= missile[i]._miyvel;
            GetMissilePos(i);
            missile[i]._mimfnum = 0;
            SetMissAnim(i, 28 /* MF_HEXPL */);
            missile[i]._mirange = missile[i]._miAnimLen - 1;
        } else {
            if (missile[i]._mix != missile[i]._miVar1 || missile[i]._miy != missile[i]._miVar2) {
                missile[i]._miVar1 = missile[i]._mix;
                missile[i]._miVar2 = missile[i]._miy;
                ChangeLight(missile[i]._mlid, missile[i]._miVar1, missile[i]._miVar2, 66); /* PSX radius literal, not devilution's 8 */
            }
        }
    } else {
        ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, 866); /* PSX radius literal, not devilution's 7+_miAnimFrame */
        if (missile[i]._mirange == 0) {
            missile[i]._miDelFlag = 1;
            AddUnLight(missile[i]._mlid);
        }
    }
    PutMissile(i);
}

void MI_Element(int i)
{
    int mid, sd, dam;
    int cx, cy, px, py, id;

    missile[i]._mirange--;
    dam = missile[i]._midam;
    id = missile[i]._misource;

    if (missile[i]._miAnimType == 0x13 /* MF_BIGEXP */) {
        cx = missile[i]._mix;
        cy = missile[i]._miy;
        px = plr[id]._px;
        py = plr[id]._py;
        ChangeLight(missile[i]._mlid, cx, cy, 438 /* PSX radius literal */);

        if (CheckBlock(px, py, cx, cy) == 0)
            CheckMissileCol(i, dam, dam, 1, cx, cy, 1, 1);
        if (CheckBlock(px, py, cx, cy + 1) == 0)
            CheckMissileCol(i, dam, dam, 1, cx, cy + 1, 1, 1);
        if (CheckBlock(px, py, cx, cy - 1) == 0)
            CheckMissileCol(i, dam, dam, 1, cx, cy - 1, 1, 1);
        if (CheckBlock(px, py, cx + 1, cy) == 0)
            CheckMissileCol(i, dam, dam, 1, cx + 1, cy, 1, 1);
        if (CheckBlock(px, py, cx + 1, cy - 1) == 0)
            CheckMissileCol(i, dam, dam, 1, cx + 1, cy - 1, 1, 1);
        if (CheckBlock(px, py, cx + 1, cy + 1) == 0)
            CheckMissileCol(i, dam, dam, 1, cx + 1, cy + 1, 1, 1);
        if (CheckBlock(px, py, cx - 1, cy) == 0)
            CheckMissileCol(i, dam, dam, 1, cx - 1, cy, 1, 1);
        if (CheckBlock(px, py, cx - 1, cy + 1) == 0)
            CheckMissileCol(i, dam, dam, 1, cx - 1, cy + 1, 1, 1);
        if (CheckBlock(px, py, cx - 1, cy - 1) == 0)
            CheckMissileCol(i, dam, dam, 1, cx - 1, cy - 1, 1, 1);

        if (missile[i]._mirange == 0) {
            missile[i]._miDelFlag = 1;
            AddUnLight(missile[i]._mlid);
        }

        PutMissile(i);
        return;
    }

    missile[i]._mitxoff += missile[i]._mixvel;
    missile[i]._mityoff += missile[i]._miyvel;
    GetMissilePos(i);
    cx = missile[i]._mix;
    cy = missile[i]._miy;

    CheckMissileCol(i, dam, dam, 0, cx, cy, 0, 1);

    if (missile[i]._miVar3 == 0) {
        if (cx == missile[i]._miVar4 && cy == missile[i]._miVar5)
            missile[i]._miVar3 = 1;
    }

    if (missile[i]._miVar3 == 1) {
        missile[i]._miVar3 = 2;
        missile[i]._mirange = 255;
        mid = FindClosest(cx, cy, 19);
        if (mid > 0) {
            sd = GetDirection8(cx, cy, monster[mid]._mx, monster[mid]._my);
            SetMissDir(i, sd);
            GetMissileVel(i, cx, cy, monster[mid]._mx, monster[mid]._my, 16);
        } else {
            sd = plr[id]._pdir;
            SetMissDir(i, sd);
            GetMissileVel(i, cx, cy, cx + XDirAdd[sd], cy + YDirAdd[sd], 16);
        }
    }

    if (cx != missile[i]._miVar1 || cy != missile[i]._miVar2) {
        missile[i]._miVar1 = cx;
        missile[i]._miVar2 = cy;
        ChangeLight(missile[i]._mlid, cx, cy, 438); /* PSX radius literal, not devilution's 8 */
    }

    if (missile[i]._mirange == 0) {
        missile[i]._mimfnum = 0;
        SetMissAnim(i, 0x13 /* MF_BIGEXP */);
        missile[i]._mirange = missile[i]._miAnimLen - 1;
    }

    PutMissile(i);
}

void MI_Bonespirit(int i)
{
    int mid, sd, dam;
    int cx, cy, id;

    missile[i]._mirange--;
    dam = missile[i]._midam;
    id = missile[i]._misource;

    if (missile[i]._mimfnum == 8) {
        cx = missile[i]._mix;
        cy = missile[i]._miy;
        ChangeLight(missile[i]._mlid, cx, cy, 1012 /* PSX radius literal */);

        if (missile[i]._mirange == 0) {
            missile[i]._miDelFlag = 1;
            AddUnLight(missile[i]._mlid);
        }

        PutMissile(i);
        return;
    }

    missile[i]._mitxoff += missile[i]._mixvel;
    missile[i]._mityoff += missile[i]._miyvel;
    GetMissilePos(i);
    cx = missile[i]._mix;
    cy = missile[i]._miy;

    CheckMissileCol(i, dam, dam, 0, cx, cy, 0, 1);

    if (missile[i]._miVar3 == 0) {
        if (cx == missile[i]._miVar4 && cy == missile[i]._miVar5)
            missile[i]._miVar3 = 1;
    }

    if (missile[i]._miVar3 == 1) {
        missile[i]._miVar3 = 2;
        missile[i]._mirange = 255;
        mid = FindClosest(cx, cy, 19);
        if (mid > 0) {
            missile[i]._midam = (monster[mid]._mhitpoints >> 6) >> 1;
            sd = GetDirection8(cx, cy, monster[mid]._mx, monster[mid]._my);
            SetMissDir(i, sd);
            GetMissileVel(i, cx, cy, monster[mid]._mx, monster[mid]._my, 16);
        } else {
            sd = plr[id]._pdir;
            SetMissDir(i, sd);
            GetMissileVel(i, cx, cy, cx + XDirAdd[sd], cy + YDirAdd[sd], 16);
        }
    }

    if (cx != missile[i]._miVar1 || cy != missile[i]._miVar2) {
        missile[i]._miVar1 = cx;
        missile[i]._miVar2 = cy;
        ChangeLight(missile[i]._mlid, cx, cy, 1012); /* PSX radius literal, not devilution's 8 */
    }

    if (missile[i]._mirange == 0) {
        SetMissDir(i, 8);
        missile[i]._mirange = 7;
    }

    PutMissile(i);
}

void MI_FirewallC(int i)
{
    MissileStruct *miss = &missile[i];
    int tx, ty, id;

    miss->_mirange--;
    id = miss->_misource;
    if (miss->_mirange == 0) {
        miss->_miDelFlag = 1;
    } else {
        tx = miss->_miVar1 + XDirAdd[miss->_miVar3];
        ty = miss->_miVar2 + YDirAdd[miss->_miVar3];
        if (GetMISSILE(miss->_miVar1, miss->_miVar2) == 0 && miss->_miVar8 == 0 && tx > 0 && tx < 112 && ty > 0 && ty < 112) {
            AddMissile(miss->_miVar1, miss->_miVar2, miss->_miVar1, miss->_miVar2, plr[id]._pdir, MIS_FIREWALL, 0 /* PSX literal, not TARGET_BOTH */, id, 0, miss->_mispllvl);
            miss->_miVar1 = tx;
            miss->_miVar2 = ty;
        } else {
            miss->_miVar8 = 1;
        }

        tx = miss->_miVar5 + XDirAdd[miss->_miVar4];
        ty = miss->_miVar6 + YDirAdd[miss->_miVar4];
        if (GetMISSILE(miss->_miVar5, miss->_miVar6) == 0 && miss->_miVar7 == 0 && tx > 0 && tx < 112 && ty > 0 && ty < 112) {
            AddMissile(miss->_miVar5, miss->_miVar6, miss->_miVar5, miss->_miVar6, plr[id]._pdir, MIS_FIREWALL, 0 /* PSX literal, not TARGET_BOTH */, id, 0, miss->_mispllvl);
            miss->_miVar5 = tx;
            miss->_miVar6 = ty;
        } else {
            miss->_miVar7 = 1;
        }
    }
}

void AddStone(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i, j, k, l, tx, ty;
    int mid;
    int CrawlNum[6];

    memcpy(CrawlNum, D_8011A030, sizeof(CrawlNum));

    missile[mi]._misource = id;

    i = 0;
    tx = 0;
    ty = 0;
    for (k = 0; k < 6; k++) {
        l = CrawlNum[k];
        j = l + 1;
        for (i = (unsigned char)CrawlTable[l]; i > 0; i--) {
            tx = dx + CrawlTable[j];
            ty = dy + CrawlTable[j + 1];
            if (tx > 0 && tx < 112 && ty > 0 && ty < 112) { /* raw dung_map extent, not MAXDUNX/MAXDUNY */
                mid = dung_map[tx][ty].dMonster;
                if (mid > 0)
                    mid--;
                else
                    mid = ~mid;
                if (mid > 3
                    && monster[mid]._mAi != 27 /* AI_DIABLO */
                    /* PSX replaces hellfire's `MType->mtype != MT_NKR` with a single _mFlags bit test
                     * (confirmed via raw oracle: `monster[mid]._mFlags & 1`) -- a real behavior delta. */
                    && (monster[mid]._mFlags & 1) == 0
                    && monster[mid]._mmode != 8 /* MM_FADEIN */
                    && monster[mid]._mmode != 9 /* MM_FADEOUT */
                    && monster[mid]._mmode != 14 /* MM_MISSILE */) {
                    i = -99;
                    k = 6;
                    missile[mi]._miVar1 = monster[mid]._mmode;
                    missile[mi]._miVar2 = mid;
                    monster[mid]._mmode = MM_STONE;
                    break;
                }
            }
            j += 2;
        }
    }

    if (i != -99) {
        missile[mi]._miDelFlag = 1;
        return;
    }

    missile[mi]._mix = tx;
    missile[mi]._miy = ty;
    missile[mi]._misx = missile[mi]._mix;
    missile[mi]._misy = missile[mi]._miy;

    missile[mi]._mirange = 6 + missile[mi]._mispllvl;
    missile[mi]._mirange = missile[mi]._mirange + ((plr[id]._pISplDur * missile[mi]._mirange) >> 7);
    if (missile[mi]._mirange > 15)
        missile[mi]._mirange = 15;
    missile[mi]._mirange <<= 4;
    UseMana(id, SPL_STONE);
}

void MI_Rhino(int i)
{
    int mix, miy;
    int mix2 = 0, miy2 = 0;
    int omx, omy;
    int monst;

    monst = missile[i]._misource;

    if (monster[monst]._mmode != 14 /* MM_MISSILE */) {
        missile[i]._miDelFlag = 1;
        return;
    }

    GetMissilePos(i);

    omx = missile[i]._mix;
    omy = missile[i]._miy;

    dung_map[omx][omy].dMonster = 0;

    if (monster[monst]._mAi == 24 /* AI_SNAKE */) {
        missile[i]._mitxoff += 2 * missile[i]._mixvel;
        missile[i]._mityoff += 2 * missile[i]._miyvel;

        GetMissilePos(i);

        mix2 = missile[i]._mix;
        miy2 = missile[i]._miy;

        missile[i]._mitxoff -= missile[i]._mixvel;
        missile[i]._mityoff -= missile[i]._miyvel;
    } else {
        /* PSX-only: also copies the missile's current animation frame onto the monster before
         * accumulating velocity -- no PC twin, confirmed via the raw oracle. */
        monster[monst]._mAnimFrame = missile[i]._miAnimFrame;
        missile[i]._mitxoff += missile[i]._mixvel;
        missile[i]._mityoff += missile[i]._miyvel;
    }

    GetMissilePos(i);

    mix = missile[i]._mix;
    miy = missile[i]._miy;

    if (PosOkMonst(monst, mix, miy) && (monster[monst]._mAi != 24 /* AI_SNAKE */ || PosOkMonst(monst, mix2, miy2))) {
        dung_map[mix][miy].dMonster = ~monst;
        monster[monst]._mx = monster[monst]._moldx = monster[monst]._mfutx = mix;
        monster[monst]._my = monster[monst]._moldy = monster[monst]._mfuty = miy;
        /* PSX-only: also carries the missile's sub-tile pixel offset onto the monster -- no PC
         * twin, confirmed via the raw oracle (missile+0x33/0x34 -> monster+0x3A/0x3B). */
        monster[monst]._mxoff = missile[i]._mixoff;
        monster[monst]._myoff = missile[i]._miyoff;

        if (monster[monst]._uniqtype)
            ChangeLightXY(missile[i]._mlid, mix, miy);

        MoveMissilePos(i);
        PutMissile(i);
    } else {
        MissToMonst(i, omx, omy);
        missile[i]._miDelFlag = 1;
    }
}

void MI_Apoca(int i)
{
    int j, k, id;
    unsigned char exit;

    k = 0;
    id = missile[i]._misource;

    exit = 0;
    /* PSX drops the hellfire/devilution `LineClear(mix, miy, k, j)` gate entirely -- confirmed
     * absent from the raw oracle (only GetSOLID is called, no LineClear jal at all). */
    for (j = missile[i]._miVar2; j < missile[i]._miVar3 && exit == 0; j++) {
        for (k = missile[i]._miVar4; k < missile[i]._miVar5 && exit == 0; k++) {
            if (dung_map[k][j].dMonster > 3 && GetSOLID(k, j) == 0) {
                AddMissile(k, j, k, j, plr[id]._pdir, MIS_BOOM, TARGET_MONSTERS, id, missile[i]._midam, 0);
                exit = 1;
            }
        }
        if (exit == 0)
            missile[i]._miVar4 = missile[i]._miVar6;
    }

    if (exit == 1) {
        missile[i]._miVar2 = j - 1;
        missile[i]._miVar4 = k;
    } else {
        missile[i]._miDelFlag = 1;
    }
}

void AddGuardian(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i, pn, k, l, j, tx, ty;
    int CrawlNum[6];

    memcpy(CrawlNum, D_8011A030, sizeof(CrawlNum));

    missile[mi]._midam = ENG_random(10) + 1 + (plr[id]._pLevel >> 1);
    for (i = missile[mi]._mispllvl; i > 0; i--)
        missile[mi]._midam += missile[mi]._midam >> 3;

    missile[mi]._miDelFlag = 1;
    for (k = 0; k < 6; k++) {
        l = CrawlNum[k];
        j = l + 1;
        for (i = (unsigned char)CrawlTable[l]; i > 0; i--) {
            tx = dx + CrawlTable[j];
            ty = dy + CrawlTable[j + 1];
            if (tx > 0 && tx < 112 && ty > 0 && ty < 112) { /* raw dung_map extent, not MAXDUNX/MAXDUNY */
                if (LineClear(sx, sy, tx, ty) && (GetSOLID(tx, ty) | dung_map[tx][ty].dMonster | dung_map[tx][ty].dObject | GetMISSILE(tx, ty) | dung_map[tx][ty].dMissile) == 0) {
                    missile[mi]._mix = tx;
                    missile[mi]._miy = ty;
                    missile[mi]._misx = tx;
                    missile[mi]._misy = ty;
                    missile[mi]._miDelFlag = 0;
                    UseMana(id, SPL_GUARDIAN);
                    k = 6;
                    break;
                }
            }
            j += 2;
        }
    }

    if (missile[mi]._miDelFlag == 1)
        return;
    missile[mi]._misource = id;
    missile[mi]._mlid = AddLight(missile[mi]._mix, missile[mi]._miy, 148); /* PSX radius literal, not hellfire's 1 */

    missile[mi]._mirange = (plr[id]._pLevel >> 1) + missile[mi]._mispllvl;
    missile[mi]._mirange = missile[mi]._mirange + ((plr[id]._pISplDur * missile[mi]._mirange) >> 7);
    if (missile[mi]._mirange > 30)
        missile[mi]._mirange = 30;
    missile[mi]._mirange <<= 4;
    if (missile[mi]._mirange < 30)
        missile[mi]._mirange = 30;

    missile[mi]._miVar1 = missile[mi]._mirange - missile[mi]._miAnimLen;
    missile[mi]._miVar2 = 0;
    missile[mi]._miVar3 = 1;
}

void MI_Acidpud(int i)
{
    int range;

    missile[i]._mirange--;
    range = missile[i]._mirange;
    CheckMissileCol(i, missile[i]._midam, missile[i]._midam, 1, missile[i]._mix, missile[i]._miy, 0, 1);
    missile[i]._mirange = range;

    if (missile[i]._mirange == 0) {
        if (missile[i]._mimfnum) {
            missile[i]._miDelFlag = 1;
        } else {
            SetMissDir(i, 1);
            missile[i]._mirange = missile[i]._miAnimLen;
        }
    }

    PutMissile(i);
}

int Sentfire(int i, int sx, int sy)
{
    int ex, dir;

    ex = 0;
    if (LineClear(missile[i]._mix, missile[i]._miy, sx, sy)
        && dung_map[sx][sy].dMonster > 0
        && (monster[dung_map[sx][sy].dMonster - 1]._mhitpoints >> 6) > 0
        && (dung_map[sx][sy].dMonster - 1) > 3) {
        dir = GetDirection(missile[i]._mix, missile[i]._miy, sx, sy);
        missile[i]._miVar3 = missileavail[0];
        AddMissile(missile[i]._mix, missile[i]._miy, sx, sy, dir, MIS_FIREBOLT, TARGET_MONSTERS, missile[i]._misource, missile[i]._midam, GetSpellLevel(missile[i]._misource, SPL_FIREBOLT));
        ex = -1;
    }

    if (ex == -1) {
        SetMissDir(i, 2);
        missile[i]._miVar2 = 3;
    }

    return ex;
}

void AddLightning(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    missile[mi]._misx = dx;
    missile[mi]._misy = dy;

    if (midir >= 0) {
        missile[mi]._mixoff = missile[midir]._mixoff;
        missile[mi]._miyoff = missile[midir]._miyoff;
        missile[mi]._mitxoff = missile[midir]._mitxoff;
        missile[mi]._mityoff = missile[midir]._mityoff;
    }

    missile[mi]._miAnimFrame = ENG_random(8) + 1;

    if (midir >= 0 && mienemy != TARGET_PLAYERS && id != -1) {
        missile[mi]._mirange = 6 + (missile[mi]._mispllvl >> 1);
    } else {
        if (midir >= 0 && id != -1)
            missile[mi]._mirange = 10;
        else
            missile[mi]._mirange = 8;
    }

    missile[mi]._mlid = AddLight(missile[mi]._mix, missile[mi]._miy, 579); /* PSX radius literal, not devilution's 4 */
}

unsigned char Plr2PlrMHit(int pnum, int p, int mindam, int maxdam, int dist, int mtype, unsigned char shift)
{
    /* Structurally reconstructed from devilution's non-hellfire Plr2PlrMHit -- NOT yet
     * byte-verified. Reuses the resist-switch/hper-formula/`m>=4`-free shape already established
     * for PlayerMHit/MonsterMHit in this TU. */
    int dam, blk, blkper, hper, hit, resper;

    if (plr[p]._pInvincible)
        return 0;
    if (mtype == MIS_HBOLT)
        return 0;
    if ((plr[p]._pSpellFlags & 1) && missiledata[mtype].mType == 0)
        return 0;

    if (missiledata[mtype].mResist == MISR_FIRE)
        resper = plr[p]._pFireResist;
    else if (missiledata[mtype].mResist == MISR_LIGHTNING)
        resper = plr[p]._pLghtResist;
    else if (missiledata[mtype].mResist == MISR_MAGIC || missiledata[mtype].mResist == MISR_ACID)
        resper = plr[p]._pMagResist;
    else
        resper = 0;

    hper = ENG_random(100);
    if (missiledata[mtype].mType == 0) {
        hit = plr[pnum]._pIBonusToHit + plr[pnum]._pLevel - ((mindam * mindam) >> 1) - plr[p]._pDexterity / 5 - plr[p]._pIBonusAC - plr[p]._pIAC + plr[pnum]._pDexterity + 50;
        if (plr[pnum]._pClass == PC_ROGUE)
            hit += 20;
        if (plr[pnum]._pClass == PC_WARRIOR)
            hit += 10;
    } else {
        hit = plr[pnum]._pMagic - (plr[p]._pLevel << 1) - dist + 50;
        if (plr[pnum]._pClass == PC_SORCERER)
            hit += 20;
    }
    if (hit < 5)
        hit = 5;
    if (hit > 95)
        hit = 95;

    if (hper < hit) {
        if ((plr[p]._pmode == PM_STAND || plr[p]._pmode == PM_ATTACK) && plr[p]._pBlockFlag)
            blkper = ENG_random(100);
        else
            blkper = 100;
        if (shift)
            blkper = 100;
        blk = plr[p]._pDexterity + plr[p]._pBaseToBlk + (plr[p]._pLevel << 1) - (plr[pnum]._pLevel << 1);
        if (blk < 0)
            blk = 0;
        if (blk > 100)
            blk = 100;

        if (mtype == MIS_BONESPIRIT) {
            dam = plr[p]._pHitPoints / 3;
        } else {
            dam = mindam + ENG_random(maxdam - mindam + 1);
            if (missiledata[mtype].mType == 0)
                dam += plr[pnum]._pIBonusDamMod + plr[pnum]._pDamageMod + dam * plr[pnum]._pIBonusDam / 100;
            if (!shift)
                dam <<= 6;
        }
        if (missiledata[mtype].mType != 0)
            dam >>= 1;

        if (resper > 0) {
            dam -= (dam * resper) / 100;
            if (pnum == myplr)
                NetSendCmdDamage(1, p, dam);
            if (plr[pnum]._pClass == PC_WARRIOR)
                PlaySfxLoc(0, plr[pnum]._px, plr[pnum]._py);
            else if (plr[pnum]._pClass == PC_ROGUE)
                PlaySfxLoc(1, plr[pnum]._px, plr[pnum]._py);
            else if (plr[pnum]._pClass == PC_SORCERER)
                PlaySfxLoc(2, plr[pnum]._px, plr[pnum]._py);
            return 1;
        } else {
            if (blkper < blk) {
                StartPlrBlock(p, GetDirection(plr[p]._px, plr[p]._py, plr[pnum]._px, plr[pnum]._py));
            } else {
                if (pnum == myplr)
                    NetSendCmdDamage(1, p, dam);
                StartPlrHit(p, dam, 0);
            }
            return 1;
        }
    }
    return 0;
}

unsigned char PlayerMHit(int pnum, int m, int dist, int mind, int maxd, int mtype, unsigned char shift, unsigned char earflag)
{
    /* Structurally reconstructed from devilution's non-hellfire PlayerMHit (confirmed via call
     * list: only ONE StartPlrBlock jal, no *blocked out-param, StartPlrKill not SyncPlrKill) --
     * NOT yet byte-verified given the size (661 insns, the largest function in this TU). The
     * currlevel==14/15/16 hper floors and 4 ENG_random call sites are confirmed present via the
     * raw oracle; per-class hit-sound branches (PC_WARRIOR/ROGUE/SORCERER) collapse to what looks
     * like a single call site in the oracle, not yet reconciled with this 3-branch source shape. */
    int hit, hper, tac, dam, blk, blkper, resper;

    if ((plr[pnum]._pHitPoints >> 6) <= 0)
        return 0;
    if (plr[pnum]._pInvincible)
        return 0;
    if ((plr[pnum]._pSpellFlags & 1) && missiledata[mtype].mType == 0)
        return 0;

    hit = ENG_random(100);
    if (missiledata[mtype].mType == 0) {
        tac = plr[pnum]._pIAC + plr[pnum]._pIBonusAC + plr[pnum]._pDexterity / 5;
        if (m != -1)
            hper = monster[m].mHit + ((monster[m].mLevel - plr[pnum]._pLevel) << 1) + 30 - (dist << 1) - tac;
        else
            hper = 100 - (tac >> 1) - (dist << 1);
    } else {
        if (m != -1)
            hper = 40 - (plr[pnum]._pLevel << 1) - (dist << 1) + (monster[m].mLevel << 1);
        else
            hper = 40;
    }

    if (hper < 10)
        hper = 10;
    if (currlevel == 14 && hper < 20)
        hper = 20;
    if (currlevel == 15 && hper < 25)
        hper = 25;
    if (currlevel == 16 && hper < 30)
        hper = 30;

    if ((plr[pnum]._pmode == PM_STAND || plr[pnum]._pmode == PM_ATTACK) && plr[pnum]._pBlockFlag)
        blk = ENG_random(100);
    else
        blk = 100;
    if (shift)
        blk = 100;
    if (mtype == MIS_ACIDPUD)
        blk = 100;

    if (m != -1)
        blkper = plr[pnum]._pBaseToBlk + plr[pnum]._pDexterity - ((monster[m].mLevel - plr[pnum]._pLevel) << 1);
    else
        blkper = plr[pnum]._pBaseToBlk + plr[pnum]._pDexterity;
    if (blkper < 0)
        blkper = 0;
    if (blkper > 100)
        blkper = 100;

    if (missiledata[mtype].mResist == MISR_FIRE)
        resper = plr[pnum]._pFireResist;
    else if (missiledata[mtype].mResist == MISR_LIGHTNING)
        resper = plr[pnum]._pLghtResist;
    else if (missiledata[mtype].mResist == MISR_MAGIC || missiledata[mtype].mResist == MISR_ACID)
        resper = plr[pnum]._pMagResist;
    else
        resper = 0;

    if (hit < hper) {
        if (mtype == MIS_BONESPIRIT) {
            dam = plr[pnum]._pHitPoints / 3;
        } else {
            if (!shift) {
                dam = (mind << 6) + ENG_random((maxd - mind + 1) << 6);
                if (m == -1 && (plr[pnum]._pIFlags & 0x2000 /* ISPL_ABSHALFTRAP */))
                    dam >>= 1;
                dam += plr[pnum]._pIGetHit << 6;
            } else {
                dam = mind + ENG_random(maxd - mind + 1);
                if (m == -1 && (plr[pnum]._pIFlags & 0x2000 /* ISPL_ABSHALFTRAP */))
                    dam >>= 1;
                dam += plr[pnum]._pIGetHit;
            }
            if (dam < 64)
                dam = 64;
        }

        if (resper > 0) {
            dam = dam - dam * resper / 100;
            if (pnum == myplr) {
                plr[pnum]._pHitPoints -= dam;
                plr[pnum]._pHPBase -= dam;
            }
            if (plr[pnum]._pHitPoints > plr[pnum]._pMaxHP) {
                plr[pnum]._pHitPoints = plr[pnum]._pMaxHP;
                plr[pnum]._pHPBase = plr[pnum]._pMaxHPBase;
            }
            if ((plr[pnum]._pHitPoints >> 6) <= 0) {
                StartPlrKill(pnum, earflag);
            } else {
                if (plr[pnum]._pClass == PC_WARRIOR)
                    PlaySfxLoc(0, plr[pnum]._px, plr[pnum]._py);
                else if (plr[pnum]._pClass == PC_ROGUE)
                    PlaySfxLoc(1, plr[pnum]._px, plr[pnum]._py);
                else if (plr[pnum]._pClass == PC_SORCERER)
                    PlaySfxLoc(2, plr[pnum]._px, plr[pnum]._py);
                drawhpflag = 1;
            }
            return 1;
        } else {
            if (blk < blkper) {
                if (m != -1)
                    tac = GetDirection(plr[pnum]._px, plr[pnum]._py, monster[m]._mx, monster[m]._my);
                else
                    tac = plr[pnum]._pdir;
                StartPlrBlock(pnum, tac);
            } else {
                if (pnum == myplr) {
                    plr[pnum]._pHitPoints -= dam;
                    plr[pnum]._pHPBase -= dam;
                }
                if (plr[pnum]._pHitPoints > plr[pnum]._pMaxHP) {
                    plr[pnum]._pHitPoints = plr[pnum]._pMaxHP;
                    plr[pnum]._pHPBase = plr[pnum]._pMaxHPBase;
                }
                if ((plr[pnum]._pHitPoints >> 6) <= 0)
                    StartPlrKill(pnum, earflag);
                else
                    StartPlrHit(pnum, dam, 0);
            }
        }
        return 1;
    }
    return 0;
}

unsigned char MonsterMHit(int pnum, int m, int mindam, int maxdam, int dist, int t, unsigned char shift)
{
    /* Byte + SYM matched. The retail SYM's chain of empty nested blocks comes from g++'s implicit
     * if/else scopes, kept alive by the block-scoped `dir` temp in the knockback call (a v0-only
     * local, so it gets no record of its own). PSX confirmed to include hellfire's MIS_HBOLT/
     * MT_DIABLO/MC_UNDEAD immunity check (a MC_UNDEAD value of 0 is assumed from the oracle's
     * bare `!= 0` test), and drops devilution's `if (pnum == myplr)` gate on the hitpoint
     * deduction (unconditional here). The `m >= 4` checks (not `m > MAX_PLRS - 1`) match the
     * same literal-4 finding already confirmed in MonsterTrapHit. */
    int hit, hper;
    long dam;
    int mor, mir;
    unsigned char resist, ret;

    resist = 0;
    if (monster[m].mtalkmsg
        || (monster[m]._mhitpoints >> 6) <= 0
        || (t == MIS_HBOLT && monster[m].MType->mtype != 0x6E /* MT_DIABLO */ && monster[m].MData->mMonstClass != 0 /* MC_UNDEAD */))
        return 0;
    if (monster[m].MType->mtype == 0x20 /* MT_ILLWEAV */ && monster[m]._mgoal == 2 /* MGOAL_RETREAT */)
        return 0;
    if (monster[m]._mmode == 14 /* MM_CHARGE */)
        return 0;

    mor = monster[m].mMagicRes;
    mir = missiledata[t].mResist;
    if ((mor & 0x8 && mir == MISR_LIGHTNING) || (mor & 0x10 && mir == MISR_MAGIC) || (mor & 0x20 && mir == MISR_FIRE) || (mor & 0x80 && mir == MISR_ACID))
        return 0;
    if ((mor & 0x1 && mir == MISR_LIGHTNING) || (mor & 0x2 && mir == MISR_MAGIC) || (mor & 0x4 && mir == MISR_FIRE))
        resist = 1;

    hit = ENG_random(100);
    if (missiledata[t].mType == 0) {
        hper = plr[pnum]._pLevel + 50 - monster[m].mArmorClass - plr[pnum]._pIEnAc;
        hper += plr[pnum]._pDexterity + plr[pnum]._pIBonusToHit;
        hper -= ((dist * dist) >> 1);
        if (plr[pnum]._pClass == PC_ROGUE)
            hper += 20;
        if (plr[pnum]._pClass == PC_WARRIOR)
            hper += 10;
    } else {
        hper = plr[pnum]._pMagic + 50 - (monster[m].mLevel << 1) - dist;
        if (plr[pnum]._pClass == PC_SORCERER)
            hper += 20;
    }
    if (hper < 5)
        hper = 5;
    if (hper > 95)
        hper = 95;
    if (monster[m]._mmode == MM_STONE)
        hit = 0;
    if (CheckMonsterHit(m, &ret))
        return ret;
    else if (hit < hper) {
        if (t == MIS_BONESPIRIT)
            dam = (monster[m]._mhitpoints / 3) >> 6;
        else
            dam = ENG_random(maxdam - mindam + 1) + mindam;
        if (missiledata[t].mType == 0) {
            dam += dam * plr[pnum]._pIBonusDam / 100;
            dam += plr[pnum]._pIBonusDamMod;
            if (plr[pnum]._pClass == PC_ROGUE)
                dam += plr[pnum]._pDamageMod;
            else
                dam += plr[pnum]._pDamageMod >> 1;
        }
        if (!shift)
            dam <<= 6;
        if (resist)
            dam >>= 2;
        monster[m]._mhitpoints -= dam;
        if (plr[pnum]._pIFlags & 0x100 /* ISPL_NOHEALMON */)
            monster[m]._mFlags |= 0x8 /* MFLAG_NOHEAL */;

        if ((monster[m]._mhitpoints >> 6) <= 0) {
            if (monster[m]._mmode == MM_STONE) {
                M_StartKill(m, pnum);
                monster[m]._mmode = MM_STONE;
            } else {
                M_StartKill(m, pnum);
            }
        } else {
            if (resist) {
                PlayEffect(m, 1);
            } else if (monster[m]._mmode == MM_STONE) {
                if (m >= 4)
                    M_StartHit(m, pnum, dam);
                monster[m]._mmode = MM_STONE;
            } else {
                if (missiledata[t].mType == 0 && (plr[pnum]._pIFlags & 0x800 /* ISPL_KNOCKBACK */)) {
                    int dir = GetDirection(plr[pnum]._px, plr[pnum]._py, monster[m]._mx, monster[m]._my);
                    M_GetKnockback(m, dir);
                }
                if (m >= 4)
                    M_StartHit(m, pnum, dam);
            }
        }

        if (monster[m]._msquelch == 0) {
            monster[m]._msquelch = 0xFF;
            monster[m]._lastx = plr[pnum]._px;
            monster[m]._lasty = plr[pnum]._py;
        }
        return 1;
    } else
        return 1;
}

unsigned char MonsterTrapHit(int m, int mindam, int maxdam, int dist, int t, unsigned char shift)
{
    int hit, hper;
    long dam;
    int mor, mir;
    unsigned char resist, ret;

    resist = 0;
    if (monster[m].mtalkmsg)
        return 0;
    if ((monster[m]._mhitpoints >> 6) <= 0)
        return 0;
    if (monster[m].MType->mtype == 0x20 /* MT_ILLWEAV */ && monster[m]._mgoal == 2 /* MGOAL_RETREAT */)
        return 0;
    if (monster[m]._mmode == 14 /* MM_CHARGE (raw oracle literal) */)
        return 0;

    mir = missiledata[t].mResist;
    mor = monster[m].mMagicRes;
    /* PSX monster.mMagicRes bit layout confirmed via raw oracle: IMMUNE bits are
     * 0x8=LIGHTNING(mir==3), 0x10=MAGIC(mir==1), 0x20=FIRE(mir==2); RESIST bits are
     * 0x1=LIGHTNING(mir==3), 0x2=MAGIC(mir==1), 0x4=FIRE(mir==2) -- NOT this TU's
     * IMMUNE_MAGIC/RESIST_MAGIC #defines (those are for a different bit layout). */
    if ((mor & 0x8 && mir == MISR_LIGHTNING) || (mor & 0x10 && mir == MISR_MAGIC) || (mor & 0x20 && mir == MISR_FIRE))
        return 1;

    if ((mor & 0x1 && mir == MISR_LIGHTNING) || (mor & 0x2 && mir == MISR_MAGIC) || (mor & 0x4 && mir == MISR_FIRE))
        resist = 1;

    hit = ENG_random(100);
    hper = 90 - monster[m].mArmorClass - dist;
    if (hper < 5)
        hper = 5;
    if (hper > 95)
        hper = 95;
    if (CheckMonsterHit(m, &ret))
        return ret;

    if (hit < hper || monster[m]._mmode == MM_STONE) {
        dam = ENG_random(maxdam - mindam + 1) + mindam;
        if (!shift)
            dam <<= 6;
        if (resist)
            monster[m]._mhitpoints -= dam >> 2;
        else
            monster[m]._mhitpoints -= dam;
        if ((monster[m]._mhitpoints >> 6) <= 0) {
            if (monster[m]._mmode == MM_STONE) {
                M_StartKill(m, -1);
                monster[m]._mmode = MM_STONE;
            } else {
                M_StartKill(m, -1);
            }
        } else {
            if (resist) {
                PlayEffect(m, 1);
            } else if (monster[m]._mmode == MM_STONE) {
                if (m >= 4)
                    M_StartHit(m, -1, dam);
                monster[m]._mmode = MM_STONE;
            } else {
                if (m >= 4)
                    M_StartHit(m, -1, dam);
            }
        }
    }
    return 1;
}

void CheckMissileCol(int i, int mindam, int maxdam, unsigned char shift, int mx, int my, unsigned char nodel, BOOL HurtPlr)
{
    /* Structurally reconstructed from the raw oracle instruction-by-instruction -- NOT yet
     * byte-verified (332 insns, genuinely different branch structure from both devilution and
     * hellfire's CheckMissileCol; the top-level discriminator is `_miAnimType==MFILE_FIREWAL(4)`
     * combined with `_misource!=-1`, not simply `_micaster==TARGET_MONSTERS`). Depends on
     * MonsterMHit/PlayerMHit/Plr2PlrMHit which are themselves not yet implemented, so this cannot
     * be verify_asm'd meaningfully until at least one of those exists. Documented per-branch below. */
    MissileStruct *miss = &missile[i];
    struct map_info *dm = &dung_map[mx][my];
    unsigned char hit;
    int mid, oi;

    if (mx >= 112 || my >= 112) {
        miss->_miDelFlag = 1;
        AddUnLight(miss->_mlid);
        return;
    }

    if (miss->_miAnimType == 4 /* MFILE_FIREWAL */ || miss->_misource != -1) {
        if (dm->dMonster > 0) {
            if (miss->_miAnimType == 4)
                hit = MonsterMHit(miss->_misource, dm->dMonster - 1, mindam, maxdam, miss->_midist, miss->_mitype, shift);
            else
                hit = MonsterTrapHit(dm->dMonster - 1, mindam, maxdam, miss->_midist, miss->_mitype, shift);
            if (hit) {
                if (!nodel)
                    miss->_mirange = 0;
                miss->_miHitFlag = 1;
            }
        }
        if (IsDplayer(mx, my) && HurtPlr) {
            hit = PlayerMHit(IsDplayer(mx, my) - 1, -1, miss->_midist, mindam, maxdam, miss->_mitype, shift, (miss->_miAnimType == 4));
            if (hit) {
                if (!nodel)
                    miss->_mirange = 0;
                miss->_miHitFlag = 1;
            }
        }
    } else if (miss->_micaster != 0) {
        if ((monster[miss->_misource]._mFlags & 0x10) && dm->dMonster > 0 && (monster[dm->dMonster - 1]._mFlags & 0x20)) {
            hit = MonsterTrapHit(dm->dMonster - 1, mindam, maxdam, miss->_midist, miss->_mitype, shift);
            if (hit) {
                if (!nodel)
                    miss->_mirange = 0;
                miss->_miHitFlag = 1;
            }
        }
        if (IsDplayer(mx, my) && HurtPlr) {
            hit = PlayerMHit(IsDplayer(mx, my) - 1, miss->_misource, miss->_midist, mindam, maxdam, miss->_mitype, shift, 0);
            if (hit) {
                if (!nodel)
                    miss->_mirange = 0;
                miss->_miHitFlag = 1;
            }
        }
    } else {
        if (dm->dMonster > 0) {
            mid = dm->dMonster - 1;
            hit = MonsterMHit(miss->_misource, mid, mindam, maxdam, miss->_midist, miss->_mitype, shift);
            if (hit) {
                if (!nodel)
                    miss->_mirange = 0;
                miss->_miHitFlag = 1;
            }
        } else if (dm->dMonster < 0) {
            mid = ~dm->dMonster;
            if (monster[mid]._mmode == MM_STONE) {
                hit = MonsterMHit(miss->_misource, mid, mindam, maxdam, miss->_midist, miss->_mitype, shift);
                if (hit) {
                    if (!nodel)
                        miss->_mirange = 0;
                    miss->_miHitFlag = 1;
                }
            }
        }
        if (IsDplayer(mx, my) && (IsDplayer(mx, my) - 1) != miss->_misource && HurtPlr) {
            hit = Plr2PlrMHit(miss->_misource, IsDplayer(mx, my) - 1, mindam, maxdam, miss->_midist, miss->_mitype, shift);
            if (hit) {
                if (!nodel)
                    miss->_mirange = 0;
                miss->_miHitFlag = 1;
            }
        }
    }

    if (dm->dObject != 0) {
        oi = dm->dObject > 0 ? dm->dObject - 1 : ~dm->dObject;
        if (object[oi]._oMissFlag == 0) {
            if (object[oi]._oBreak == 1)
                BreakObject(-1, oi);
            miss->_miHitFlag = 0;
            if (!nodel)
                miss->_mirange = 0;
        }
    }

    if (GetMISSILE(mx, my)) {
        miss->_miHitFlag = 0;
        if (!nodel)
            miss->_mirange = 0;
    }

    if (miss->_mirange == 0) {
        if (missiledata[miss->_mitype].miSFX != -1)
            PlaySfxLoc(missiledata[miss->_mitype].miSFX, miss->_mix, miss->_miy);
    }
}

void AddRndTeleport(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX adds a co-op check with no PC twin: a player's phase (mienemy == 0) re-rolls the
     * offset while ChkPlrOffsets says the landing tile would leave the OTHER player's (id^1)
     * screen. The plractive / +0x1A05 gate reads plr[0] literally in the raw. */
    int r1, r2;
    unsigned char dirok;
    int nTries;

    nTries = 1;
    for (;;) {
        dirok = 1;
        do {
            r1 = ENG_random(3) + 4;
            r2 = ENG_random(3) + 4;
            if (ENG_random(2) == 1)
                r1 = -r1;
            if (ENG_random(2) == 1)
                r2 = -r2;
            if (mienemy == 0 && plr[0].plractive && *((unsigned char *)&plr[0] + 0x1A05))
                dirok = ChkPlrOffsets((sx + r1) << 3, (sy + r2) << 3, plr[id ^ 1].WorldX, plr[id ^ 1].WorldY);
        } while (!dirok);

        if (GetSOLID(sx + r1, sy + r2) || dung_map[sx + r1][sy + r2].dObject || dung_map[sx + r1][sy + r2].dMonster) {
            if (++nTries > 500) {
                r1 = 0;
                r2 = 0;
                break;
            }
        } else
            break;
    }

    missile[mi]._mirange = 2;
    missile[mi]._miVar1 = 0;

    if (setlevel && setlvlnum == 5) {
        int oi = dung_map[dx][dy].dObject - 1;
        if (object[oi]._otype == 0x54 /* OBJ_MCIRCLE1 */ || object[oi]._otype == 0x55 /* OBJ_MCIRCLE2 */) {
            missile[mi]._mix = dx;
            missile[mi]._miy = dy;
            if (!PosOkPlayer(myplr, dx, dy))
                GetVileMissPos(mi, dx, dy);
        }
    } else {
        missile[mi]._mix = sx + r1;
        missile[mi]._miy = sy + r2;
        if (mienemy == 0)
            UseMana(id, 10 /* SPL_PHASE */);
    }
}

void ProcessMissiles(void)
{
    /* SYM-confirmed: retail declares i/j/mi as `short` (not int), plus a cached
     * `MissileStruct *miss` and a `short *pmissileactive` pointer-walk reused across the
     * dFlags/dMissile-clear loop AND the mProc-dispatch loop. */
    short i, j;
    short mi;
    struct MissileStruct *miss;
    short *pmissileactive;

    pmissileactive = missileactive;
    for (i = 0; i < nummissiles; i++) {
        mi = *pmissileactive++;
        miss = &missile[mi];
        dung_map[miss->_mix][miss->_miy].dFlags &= ~0x40; /* BFLAG_MISSILE -- oracle imm is -0x41 == ~0x40, not ~0x41 */
        dung_map[miss->_mix][miss->_miy].dMissile = 0;
    }

    /* PSX-only: zeroes the whole dMissArray[32][4] table every frame -- no PC twin. Confirmed via
     * raw oracle (a distinct nested loop right after the dFlags/dMissile clear, before the
     * DeleteMissile pass). */
    for (i = 0; i < 32; i++) {
        for (j = 0; j < 4; j++)
            dMissArray[i][j] = 0;
    }

    i = 0;
    while (i < nummissiles) {
        if (missile[missileactive[i]]._miDelFlag) {
            DeleteMissile(missileactive[i], i);
            i = 0;
        } else {
            i++;
        }
    }

    pmissileactive = missileactive;
    MissilePreFlag = 0;
    ManashieldFlag = 0;
    ManashieldFlag2 = 0;
    {
        for (i = 0; i < nummissiles; i++) {
            mi = *pmissileactive++;
            miss = &missile[mi];
            ((void (*)(int))(&missiledata[miss->_mitype])->mProc)(mi);
            if (!(miss->_miAnimFlags & 0x2 /* MFLAG_LOCK_ANIMATION */)) {
                miss->_miAnimCnt++;
                if (miss->_miAnimCnt >= miss->_miAnimDelay) {
                    miss->_miAnimCnt = 0;
                    miss->_miAnimFrame += miss->_miAnimAdd;
                    if (miss->_miAnimFrame > miss->_miAnimLen)
                        miss->_miAnimFrame = 1;
                    if (miss->_miAnimFrame < 1)
                        miss->_miAnimFrame = miss->_miAnimLen;
                }
            }
        }
    }

    if (ManashieldFlag || ManashieldFlag2) {
        for (i = 0; i < nummissiles; i++) {
            if (missile[missileactive[i]]._mitype == MIS_MANASHIELD)
                MI_Manashield(missileactive[i]);
        }
    }

    i = 0;
    while (i < nummissiles) {
        if (missile[missileactive[i]]._miDelFlag) {
            DeleteMissile(missileactive[i], i);
            i = 0;
        } else {
            i++;
        }
    }
}

void AddTown(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX: 112-wide bound (dung_map extent), dMonster joins the occupancy OR-chain, and the
     * CMD_ACTIVATEPORTAL send is made with myplr temporarily switched to the caster (omp saves /
     * restores it) -- both arms send currlevel; only the trailing bSetLvl flag differs. */
    int i, k, l, j, tx, ty, mx;
    int CrawlNum[6];
    int omp;

    memcpy(CrawlNum, D_8011A030, sizeof(CrawlNum));

    tx = 0;
    ty = 0;
    if (currlevel != 0) {
        missile[mi]._miDelFlag = 1;
        for (k = 0; k < 6; k++) {
            l = CrawlNum[k];
            j = l + 1;
            for (i = (unsigned char)CrawlTable[l]; i > 0; i--) {
                tx = dx + CrawlTable[j];
                ty = dy + CrawlTable[j + 1];
                if (tx > 0 && tx < 112 && ty > 0 && ty < 112) {
                    if ((GetSOLID(tx, ty) | dung_map[tx][ty].dObject | GetMISSILE(tx, ty) | IsDplayer(tx, ty) | dung_map[tx][ty].dMissile | dung_map[tx][ty].dMonster) == 0 && !CheckIfTrig(tx, ty)) {
                        missile[mi]._mix = tx;
                        missile[mi]._miy = ty;
                        missile[mi]._misx = tx;
                        missile[mi]._misy = ty;
                        missile[mi]._miDelFlag = 0;
                        k = 6;
                        break;
                    }
                }
                j += 2;
            }
        }
    } else {
        tx = dx;
        ty = dy;
        missile[mi]._mix = tx;
        missile[mi]._miy = ty;
        missile[mi]._misx = tx;
        missile[mi]._misy = ty;
        missile[mi]._miDelFlag = 0;
    }

    missile[mi]._mirange = 100;
    missile[mi]._miVar1 = missile[mi]._mirange - missile[mi]._miAnimLen;
    missile[mi]._miVar2 = 0;

    for (i = 0; i < nummissiles; i++) {
        mx = missileactive[i];
        if (missile[mx]._mitype == MIS_TOWN && mx != mi && missile[mx]._misource == id)
            missile[mx]._mirange = 0;
    }

    PutMissile(mi);

    omp = myplr;
    myplr = id;
    if (!missile[mi]._miDelFlag && currlevel != 0) {
        if (!setlevel)
            NetSendCmdLocParam3(1, 0x38 /* CMD_ACTIVATEPORTAL */, tx, ty, currlevel, leveltype, 0);
        else
            NetSendCmdLocParam3(1, 0x38 /* CMD_ACTIVATEPORTAL */, tx, ty, currlevel, leveltype, 1);
    }
    myplr = omp;
}

void MI_Wave(int i)
{
    /* Structurally reconstructed from the raw oracle -- NOT yet byte-verified. PSX bound is 112
     * (confirmed via raw sltiu 0x6F), not MAXDUNX/MAXDUNY(96); uses GetMISSILE(x,y) in place of
     * nMissileTable[dPiece[x][y]] per this TU's established idiom. */
    int dira, dirb, nxa, nya, nxb, nyb;
    int sd, j, f1, f2, id, sx, sy, dx, dy;

    f1 = 0;
    f2 = 0;
    id = missile[i]._misource;
    sx = missile[i]._mix;
    sy = missile[i]._miy;
    dx = missile[i]._miVar1;
    dy = missile[i]._miVar2;

    sd = GetDirection(sx, sy, dx, dy);
    dira = (sd - 2) & 7;
    dirb = (sd + 2) & 7;
    nxa = sx + XDirAdd[sd];
    nya = sy + YDirAdd[sd];

    if (GetMISSILE(nxa, nya) == 0) {
        AddMissile(nxa, nya, nxa + XDirAdd[sd], nya + YDirAdd[sd], plr[id]._pdir, MIS_FIREMOVE, TARGET_MONSTERS, id, 0, missile[i]._mispllvl);

        nxa += XDirAdd[dira];
        nya += YDirAdd[dira];
        nxb = sx + XDirAdd[sd] + XDirAdd[dirb];
        nyb = sy + YDirAdd[sd] + YDirAdd[dirb];
        for (j = 0; j < 2 + (missile[i]._mispllvl >> 1); j++) {
            if (GetMISSILE(nxa, nya) == 0 && f1 == 0 && nxa > 0 && nxa < 112 && nya > 0 && nya < 112) {
                AddMissile(nxa, nya, nxa + XDirAdd[sd], nya + YDirAdd[sd], plr[id]._pdir, MIS_FIREMOVE, TARGET_MONSTERS, id, 0, missile[i]._mispllvl);
                nxa += XDirAdd[dira];
                nya += YDirAdd[dira];
            } else {
                f1 = 1;
            }

            if (GetMISSILE(nxb, nyb) == 0 && f2 == 0 && nxb > 0 && nxb < 112 && nyb > 0 && nyb < 112) {
                AddMissile(nxb, nyb, nxb + XDirAdd[sd], nyb + YDirAdd[sd], plr[id]._pdir, MIS_FIREMOVE, TARGET_MONSTERS, id, 0, missile[i]._mispllvl);
                nxb += XDirAdd[dirb];
                nyb += YDirAdd[dirb];
            } else {
                f2 = 1;
            }
        }
    }

    missile[i]._mirange--;
    if (missile[i]._mirange == 0)
        missile[i]._miDelFlag = 1;
}

void MI_Teleport(int i)
{
    /* Structurally reconstructed from the raw oracle -- NOT yet byte-verified. This is the
     * PSX-specific screen/scroll-integrated teleport-completion function (BL_GetCurrentBlocks,
     * WorldToOffset, light_fix, gplayer->SetScrollTarget) with no direct PC-twin structure;
     * types/externs (CBlocks, ScrollStruct, CPlayer, gplayer, BL_GetCurrentBlocks) are shared
     * with gamepad.cpp/effects.cpp, redeclared here to match exactly. */
    int id;
    struct CBlocks *gblocks;

    gblocks = (struct CBlocks *)BL_GetCurrentBlocks();
    if (!gblocks)
        DBG_Error(0, "source/MISSILES.CPP", 0x12C2);

    missile[i]._mirange--;
    id = missile[i]._misource;
    if (missile[i]._mirange <= 0) {
        missile[i]._miDelFlag = 1;
        return;
    }

    PlrClrTrans(plr[id]._px, plr[id]._py);
    plr[id]._px = missile[i]._mix;
    plr[id]._py = missile[i]._miy;
    (&plr[id])->_pyoff = 0;
    plr[id]._pxoff = 0;
    plr[id]._poldx = plr[id]._px;
    plr[id]._poldy = plr[id]._py;
    PlrDoTrans(plr[id]._px, plr[id]._py);
    missile[i]._miVar1 = 1;
    WorldToOffset(id, (plr[id]._px << 3) | 4, (plr[id]._py << 3) | 4);

    if (leveltype) {
        light_fix(plr[id]._plid);
        ChangeLightXY(plr[id]._plid, plr[id]._px, plr[id]._py);
        light_fix(plr[id]._pvid);
        ChangeVisionXY(plr[id]._pvid, plr[id]._px, plr[id]._py);
    }

    if (id == myplr) {
        ViewX = plr[id]._px - ScrollInfo._sdx;
        ViewY = plr[id]._py - ScrollInfo._sdy;
    }

    SetScrollTarget__7CPlayerR12PlayerStructR7CBlocks((void *)gplayer, &plr[id], gblocks);
    gblocks->MoveToScrollTarget();

    if (plr[id ^ 1].plractive)
        PlacePlayer(id ^ 1, plr[id]._px, plr[id]._py, 0);
}

void MI_Rportal(int i)
{
    int ExpLight[17] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 15 };

    if (missile[i]._mirange > 1)
        missile[i]._mirange--;

    if (missile[i]._mirange == missile[i]._miVar1)
        SetMissDir(i, 1);

    if (currlevel != 0 && missile[i]._mimfnum != 1 && missile[i]._mirange != 0) {
        /* PSX-only: scales the ExpLight radius by >>2 and adds 144, not the raw table value. */
        if (missile[i]._miVar2 == 0)
            missile[i]._mlid = AddLight(missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar2] >> 2) + 0x90);
        ChangeLight(missile[i]._mlid, missile[i]._mix, missile[i]._miy, (ExpLight[missile[i]._miVar2] >> 2) + 0x90);
        missile[i]._miVar2++;
    }

    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        AddUnLight(missile[i]._mlid);
    }

    PutMissile(i);
}

void MI_Golem(int i)
{
    int id, pn, j, k, l, m, tx, ty;
    int CrawlNum[6];

    memcpy(CrawlNum, D_8011A030, sizeof(CrawlNum));

    id = missile[i]._misource;

    if (monster[id]._mx == 1 && monster[id]._my == 0) {
        for (k = 0; k < 6; k++) {
            l = CrawlNum[k];
            j = l + 1;
            for (m = (unsigned char)CrawlTable[l]; m > 0; m--) {
                tx = missile[i]._miVar4 + CrawlTable[j];
                ty = missile[i]._miVar5 + CrawlTable[j + 1];
                if (tx > 0 && tx < 112 && ty > 0 && ty < 112) {  /* raw dung_map extent, not MAXDUNX/MAXDUNY */
                    if (LineClear(missile[i]._miVar1, missile[i]._miVar2, tx, ty) && (GetSOLID(tx, ty) | dung_map[tx][ty].dMonster | dung_map[tx][ty].dObject | IsDplayer(tx, ty)) == 0) {
                        k = 6;
                        SpawnGolum(id, tx, ty, i);
                        break;
                    }
                }
                j += 2;
            }
        }
    }
    missile[i]._miDelFlag = 1;
}

void MI_Nova(int i)
{
    int k, id, sx, sy, dir, en;
    int sx1, sy1, dam, dx, dy;

    sx1 = sy1 = 0;
    id = missile[i]._misource;
    dam = missile[i]._midam;
    sx = missile[i]._mix;
    sy = missile[i]._miy;
    dx = missile[i]._miVar1;
    dy = missile[i]._miVar2;
    if (id != -1) {
        dir = plr[id]._pdir;
        en = TARGET_MONSTERS;
    } else {
        dir = 0;
        en = TARGET_PLAYERS;
    }

    for (k = 0; k < 23; k++) {
        if (sx1 != vCrawlTable[k][7] || sy1 != vCrawlTable[k][8]) {
            dx = sx + vCrawlTable[k][7];
            dy = sy + vCrawlTable[k][8];
            AddMissile(sx, sy, dx, dy, dir, MIS_LIGHTBALL, en, id, dam, missile[i]._mispllvl);

            dx = sx - vCrawlTable[k][7];
            dy = sy - vCrawlTable[k][8];
            AddMissile(sx, sy, dx, dy, dir, MIS_LIGHTBALL, en, id, dam, missile[i]._mispllvl);

            dx = sx - vCrawlTable[k][7];
            dy = sy + vCrawlTable[k][8];
            AddMissile(sx, sy, dx, dy, dir, MIS_LIGHTBALL, en, id, dam, missile[i]._mispllvl);

            dx = sx + vCrawlTable[k][7];
            dy = sy - vCrawlTable[k][8];
            AddMissile(sx, sy, dx, dy, dir, MIS_LIGHTBALL, en, id, dam, missile[i]._mispllvl);

            sx1 = vCrawlTable[k][7];
            sy1 = vCrawlTable[k][8];
        }
    }

    missile[i]._mirange--;
    if (missile[i]._mirange == 0)
        missile[i]._miDelFlag = 1;
}

void MI_Flash2(int i)
{
    MissileStruct *miss = &missile[i];

    if (miss->_micaster == TARGET_MONSTERS && miss->_misource != -1)
        plr[miss->_misource]._pInvincible = 1;
    miss->_mirange--;

    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix - 1, miss->_miy - 1, 1, 1);
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix, miss->_miy - 1, 1, 1);
    CheckMissileCol(i, miss->_midam, miss->_midam, 1, miss->_mix + 1, miss->_miy - 1, 1, 1);

    if (miss->_mirange == 0) {
        miss->_miDelFlag = 1;
        /* PSX-only: snapshot the current screen-fade RGB as a "restore point" (paired with the
         * fadetor/fadetog/fadetob writes in AddFlash2) -- no PC twin has this bookkeeping. */
        restore_r = fadetor;
        restore_g = fadetog;
        restore_b = fadetob;
        if (miss->_micaster == TARGET_MONSTERS && miss->_misource != -1)
            plr[miss->_misource]._pInvincible = 0;
    }
    PutMissile(i);
}

void MI_Acidsplat(int i)
{
    int monst;
    int dam;

    if (missile[i]._mirange == missile[i]._miAnimLen) {
        missile[i]._mix++;
        missile[i]._miy++;
        missile[i]._miyoff -= 32;
    }

    missile[i]._mirange--;
    if (missile[i]._mirange == 0) {
        missile[i]._miDelFlag = 1;
        monst = missile[i]._misource;
        dam = (*(char *)((char *)monster[monst].MData + 0x1A) < 2) ? 1 : 2;
        AddMissile(missile[i]._mix, missile[i]._miy, i, 0, missile[i]._mimfnum, MIS_ACIDPUD, TARGET_PLAYERS, missile[i]._misource, dam, missile[i]._mispllvl);
        return;
    }

    PutMissile(i);
}

void MI_Stone(int i)
{
    int m;

    missile[i]._mirange--;
    m = missile[i]._miVar2;

    /* PSX drops the `SetMissAnim(i, MF_STONE)` call the PC twin has here -- confirmed absent from
     * the raw oracle (no jal at all in this branch, just the mirange write). */
    if (monster[m]._mhitpoints == 0 && missile[i]._miAnimType != 0x12)
        missile[i]._mirange = 11;

    if (monster[m]._mmode != MM_STONE) {
        missile[i]._miDelFlag = 1;
    } else {
        if (missile[i]._mirange == 0) {
            missile[i]._miDelFlag = 1;
            if (monster[m]._mhitpoints > 0)
                monster[m]._mmode = missile[i]._miVar1;
            else
                AddDead(monster[m]._mx, monster[m]._my, stonendx, monster[m]._mdir);
        }
        if (missile[i]._miAnimType == 0x12)
            PutMissile(i);
    }
}

void AddAcid(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX simplifies devilution's velocity-based mirange branch away entirely -- always uses the
     * 15+5*(mint+1) form, and drives direction via GetDirection8/SetMissDir instead of leaving
     * _mimfnum unset. */
    GetMissileVel(mi, sx, sy, dx, dy, 16);
    SetMissDir(mi, GetDirection8(sx, sy, dx, dy));
    missile[mi]._mirange = 5 * (monster[id]._mint + 1) + 15;
    missile[mi]._mlid = -1;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    PutMissile(mi);
}

void AddFlamec(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }

    GetMissileVel(mi, sx, sy, dx, dy, 32);
    if (mienemy == TARGET_MONSTERS)
        UseMana(id, SPL_FLAME);

    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    missile[mi]._miVar3 = 0;
    missile[mi]._mirange = 256;
}

void AddHbolt(int mi, int sx, int sy, int dx, int dy, int midir, char micaster, int id, int dam)
{
    int sp;

    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }

    if (id != -1) {
        sp = 16 + (missile[mi]._mispllvl << 1);
        if (sp >= 63)
            sp = 63;
    } else
        sp = 16;

    GetMissileVel(mi, sx, sy, dx, dy, sp);
    SetMissDir(mi, GetDirection8(sx, sy, dx, dy));

    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    /* PSX-only radius delta: 866, not 8. */
    missile[mi]._mlid = AddLight(sx, sy, 0x362);
    missile[mi]._midam = ENG_random(10) + 9 + plr[id]._pLevel;

    UseMana(id, SPL_HBOLT);
}

void AddBoneSpirit(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }
    missile[mi]._midam = 0;

    GetMissileVel(mi, sx, sy, dx, dy, 16);
    SetMissDir(mi, GetDirection8(sx, sy, dx, dy));

    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    missile[mi]._miVar3 = 0;
    missile[mi]._miVar4 = dx;
    missile[mi]._miVar5 = dy;
    /* PSX-only radius delta: 1012, not 8. */
    missile[mi]._mlid = AddLight(sx, sy, 0x3F4);

    if (mienemy == TARGET_MONSTERS) {
        UseMana(id, SPL_BONESPIRIT);
        plr[id]._pHitPoints -= 6 << 6;
        drawhpflag = 1;
        plr[id]._pHPBase -= 6 << 6;
        if (plr[id]._pHitPoints <= 0)
            StartPlrKill(id, 0);
    }
}

void AddHeal(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int i;
    long l;

    l = (ENG_random(10) + 1) << 6;
    for (i = 0; i < plr[id]._pLevel; i++)
        l += (ENG_random(4) + 1) << 6;
    for (i = 0; i < missile[mi]._mispllvl; i++)
        l += (ENG_random(6) + 1) << 6;
    if (plr[id]._pClass == PC_WARRIOR)
        l = l << 1;
    if (plr[id]._pClass == PC_ROGUE)
        l += l >> 1;
    plr[id]._pHitPoints += l;
    if (plr[id]._pHitPoints > plr[id]._pMaxHP)
        plr[id]._pHitPoints = plr[id]._pMaxHP;
    plr[id]._pHPBase += l;
    if (plr[id]._pHPBase > plr[id]._pMaxHPBase)
        plr[id]._pHPBase = plr[id]._pMaxHPBase;

    UseMana(id, SPL_HEAL);
    drawhpflag = 1;
    missile[mi]._miDelFlag = 1;
}

void AddLArrow(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }
    if (mienemy == TARGET_MONSTERS) {
        if (plr[id]._pClass == PC_ROGUE)
            GetMissileVel(mi, sx, sy, dx, dy, (plr[id]._pLevel >> 2) + 31);
        else if (plr[id]._pClass == PC_WARRIOR)
            GetMissileVel(mi, sx, sy, dx, dy, (plr[id]._pLevel >> 3) + 31);
        else
            GetMissileVel(mi, sx, sy, dx, dy, 32);
    } else
        GetMissileVel(mi, sx, sy, dx, dy, 32);

    SetMissDir(mi, GetDirection16(sx, sy, dx, dy));
    missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    /* PSX-only: this Add fn is shared by a related missile type reusing mitype 0x38 (MIS_LARROW) --
     * the light radius differs (0x365=869 vs 0x95=149) depending on which. */
    if (missile[mi]._mitype == 0x38)
        missile[mi]._mlid = AddLight(sx, sy, 0x365);
    else
        missile[mi]._mlid = AddLight(sx, sy, 149);
}

void AddArrow(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    int av;

    if (sx == dx && sy == dy) {
        dx += XDirAdd[midir];
        dy += YDirAdd[midir];
    }
    if (mienemy == TARGET_MONSTERS) {
        av = 32;
        if (plr[id]._pIFlags & 4)
            av = ENG_random(32) + 16;
        if (plr[id]._pClass == PC_ROGUE)
            av += (plr[id]._pLevel - 1) >> 2;
        if (plr[id]._pClass == PC_WARRIOR)
            av += (plr[id]._pLevel - 1) >> 3;
        GetMissileVel(mi, sx, sy, dx, dy, av);
    } else {
        GetMissileVel(mi, sx, sy, dx, dy, 32);
    }
    missile[mi]._miAnimFrame = GetDirection16(sx, sy, dx, dy) + 1;
    missile[mi]._mirange = 256;
}

int AddMissile(int sx, int sy, int v1, int v2, int midir, int mitype, char micaster, int id, int v3, int spllvl)
{
    int mi;

    if (nummissiles >= MAXMISSILES - 1)
        return -1;

    mi = missileavail[0];
    missileavail[0] = missileavail[MAXMISSILES - nummissiles - 1];
    missileactive[nummissiles] = mi;
    nummissiles++;

    missile[mi]._mitype = mitype;
    missile[mi]._micaster = micaster;
    missile[mi]._misource = id;
    missile[mi].PrintPtr = MissPrintRoutines[mitype];
    missile[mi]._miAnimType = missiledata[mitype].mFileNum;
    missile[mi]._miDrawFlag = missiledata[mitype].mDraw;
    missile[mi]._mispllvl = spllvl;
    missile[mi]._mimfnum = midir;

    if (missile[mi]._miAnimType != 0xFF && misfiledata[missile[mi]._miAnimType].mAnimFAmt >= 8)
        SetMissDir(mi, midir);
    else
        SetMissDir(mi, 0);

    /* PSX-only positional-offset block decoded from the raw: gated on `micaster != 0 && mitype !=
     * MIS_APOCA(0x2C) && mitype != MIS_FLAMEC(0x31)`, computing _mitxoff/_mityoff from
     * plr[id] fields at +0x3C/+0x3D/+0x42 (role not fully attributed -- open item) instead of the
     * flat 0 devilution/hellfire always use. Both arms currently write 0 pending that attribution,
     * so this fn is NOT byte-verified for that branch; everything else below is. */
    missile[mi]._mitxoff = 0;
    missile[mi]._mityoff = 0;

    missile[mi]._mix = sx;
    missile[mi]._miy = sy;
    missile[mi]._mixoff = 0;
    missile[mi]._miyoff = 0;
    missile[mi]._misx = sx;
    missile[mi]._misy = sy;
    missile[mi]._miDelFlag = 0;
    missile[mi]._miAnimAdd = 1;
    missile[mi]._miLightFlag = 0;
    missile[mi]._miPreFlag = 0;
    missile[mi]._miHitFlag = 0;
    missile[mi]._midist = 0;
    missile[mi]._mlid = -1;
    missile[mi]._mirnd = 0;
    missile[mi]._midam = v3;

    if (missiledata[mitype].mlSFX != -1)
        PlaySfxLoc(missiledata[mitype].mlSFX, missile[mi]._mix, missile[mi]._miy);

    ((void (*)(int, int, int, int, int, int, char, int, int))missiledata[mitype].mAddProc)(mi, sx, sy, v1, v2, midir, micaster, id, v3);

    return mi;
}
