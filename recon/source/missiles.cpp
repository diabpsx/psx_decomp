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
#define MM_STONE  13
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
    int j, i, mid, tx, ty, cr;
    int CrawlNum[19] = { 0, 3, 12, 45, 94, 159, 240, 337, 450, 579, 724, 885, 1062, 1255, 1464, 1689, 1930, 2187, 2460 };

    if (rad > 19)
        rad = 19;

    for (i = 1; i < rad; i++) {
        cr = CrawlNum[i] + 2;
        for (j = (unsigned char)CrawlTable[CrawlNum[i]]; j > 0; j--) {
            tx = sx + CrawlTable[cr - 1];
            ty = sy + CrawlTable[cr];
            if (tx > 0 && tx < MAXDUNX && ty > 0 && ty < MAXDUNY) {
                mid = dung_map[tx][ty].dMonster;
                if (mid > 0 && !CheckBlock(sx, sy, tx, ty))
                    return mid - 1;
            }
            cr += 2;
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
    unsigned char urtoll[3] = { 3, 4, 5 };
    unsigned char ultolr[3] = { 3, 2, 1 };
    unsigned char lrtoul[3] = { 7, 6, 5 };
    unsigned char lltour[3] = { 7, 0, 1 };
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
            md = urtoll[md];
        else
            md = ultolr[md];
    } else if (y1 > y2)
        md = lrtoul[md];
    else
        md = lltour[md];
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
    unsigned char urtoll[5] = { 6, 7, 8, 9, 10 };
    unsigned char ultolr[5] = { 6, 5, 4, 3, 2 };
    unsigned char lrtoul[5] = { 14, 15, 0, 1, 2 };
    unsigned char lltour[5] = { 14, 13, 12, 11, 10 };
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
            md = urtoll[md];
        else
            md = ultolr[md];
    } else if (y1 > y2)
        md = lrtoul[md];
    else
        md = lltour[md];
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
    double dxp, dyp, dr;

    dxp = (dx + sy - sx - dy) << 21;
    dyp = (dy + dx - sx - sy) << 21;
    dr = sqrt(dxp * dxp + dyp * dyp);
    missile[i]._mixvel = (long)((dxp * (v << 16)) / dr);
    missile[i]._miyvel = (long)((dyp * (v << 15)) / dr);
}

void PutMissile(int i)
{
    /* PSX-only multi-occupancy scheme, NOT present in devilution/hellfire: a tile's dMissile byte
     * is either 0 (empty), a positive (single missile, i+1) or a NEGATIVE encoded reference into
     * dMissArray[32][4] (bits 0-4 = row, bits 5-6 = slot-in-use count) once a 2nd+ missile lands on
     * the same tile. Decoded from the raw oracle (no PC twin); best-effort transcription, not yet
     * byte-verified -- this is one of the largest remaining near-misses to grind. Bound check here
     * is against the dung_map ARRAY bound (112), not the playable MAXDUNX/MAXDUNY (96). */
    int x, y;
    signed char old;
    int row, group;

    x = missile[i]._mix;
    y = missile[i]._miy;
    if (x <= 0 || y <= 0 || x >= 112 || y >= 112)
        missile[i]._miDelFlag = 1;
    if (!missile[i]._miDelFlag) {
        dung_map[x][y].dFlags |= BFLAG_MISSILE;
        old = dung_map[x][y].dMissile;
        if (old == 0) {
            dung_map[x][y].dMissile = i + 1;
        } else if (old >= 0) {
            row = 0;
            while (dMissArray[row][0] != 0 && row < 32)
                row++;
            if (row < 32) {
                dMissArray[row][0] = old;
                dMissArray[row][1] = i + 1;
                dung_map[x][y].dMissile = (char)(0x20 - row);
            }
        } else {
            group = (old & 0x60) >> 5;
            row = old & 0x1F;
            if (missile[dMissArray[row][group] - 1]._mitype != missile[i]._mitype) {
                if (group + 1 < 4) {
                    dMissArray[row][group + 1] = i + 1;
                    dung_map[x][y].dFlags += 0x20;
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
    unsigned char limit;

    if (code == 0)
        return 0;
    if (hicode < 10) {
        limit = hicode != 0 ? hicode : 16;
        if (dir < limit)
            return ValueTable[locode];
        return 0;
    }
    if (dir < locode)
        return StringTable[hicode - 10][dir];
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
    /* near-miss: oracle loop keeps `mon` live in $a0 for the whole loop (no saved-reg spill) and
     * tests i<nummissiles via a gp-rel load each iteration; ours spills mon to a callee-saved reg.
     * Falsified: direct-index form (no pointer local, worse: 39/34), pointer-to-missile local
     * (36/34, kept below as closest). Next angle: hoist `nummissiles` into a local copy before the
     * loop (oracle re-reads it via $gp each pass -- may need the read INSIDE the loop condition
     * written differently, e.g. `while` with the test as the raw condition vs a `for`). */
    int i;
    int mi;
    MissileStruct *pmissile;

    for (i = 0; i < nummissiles; i++) {
        mi = missileactive[i];
        pmissile = &missile[mi];
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
    int xx, yy, l, j, i;

    for (l = 1; l < 50; l++) {
        for (j = -l; j <= l; j++) {
            yy = dy + j;
            for (i = -l; i <= l; i++) {
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
    int CrawlNum[19] = { 0, 3, 12, 45, 94, 159, 240, 337, 450, 579, 724, 885, 1062, 1255, 1464, 1689, 1930, 2187, 2460 };

    missile[mi]._miDelFlag = 1;
    for (k = 0; k < 6; k++) {
        l = CrawlNum[k];
        j = l + 1;
        for (i = CrawlTable[l]; i > 0; i--) {
            tx = dx + CrawlTable[j];
            ty = dy + CrawlTable[j + 1];
            if (tx > 0 && tx < MAXDUNX && ty > 0 && ty < MAXDUNY) {
                /* PSX drops the dItem/dMissile terms devilution's dPiece/dMonster/dObject/dPlayer
                 * check has, and substitutes GetSOLID/IsDplayer for nSolidTable[dPiece]/dPlayer. */
                if ((GetSOLID(tx, ty) | IsDplayer(tx, ty) | dung_map[tx][ty].dMonster | dung_map[tx][ty].dObject) == 0) {
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
    /* PSX-only addition: mienemy carries an extra bit-1 flag (not just the TARGET_ enum) that
     * triggers a light source here -- no PC twin has this AddLight call. Near-miss: oracle keeps
     * `mienemy` in a dedicated saved reg across the whole fn (re-tested after the if/else); ours
     * coalesces it into the same reg as `dam`. Falsified: duplicating the check into both arms
     * (gcc tail-merged it right back, worse). */
    if (mienemy & 2)
        missile[mi]._mlid = AddLight(sx, sy, 0x243);
}

void AddFirewall(int mi, int sx, int sy, int dx, int dy, int midir, char mienemy, int id, int dam)
{
    /* PSX drops hellfire's `if (mienemy != MI_ENEMYMONST || id < 0) mirange += currlevel;` branch
     * entirely -- always applies the pISplDur-scaled adjustment (confirmed: no currlevel add
     * anywhere in the oracle, just one unconditional mult/mflo/sra-7 sequence). */
    int k;

    missile[mi]._midam = ((ENG_random(10) + ENG_random(10) + 2 + plr[id]._pLevel) << 4) >> 1;
    GetMissileVel(mi, sx, sy, dx, dy, 16);
    missile[mi]._mirange = 10;
    for (k = missile[mi]._mispllvl; k > 0; k--)
        missile[mi]._mirange += 10;
    missile[mi]._miVar2 = 0;
    missile[mi]._mirange = missile[mi]._mirange + ((plr[id]._pISplDur * missile[mi]._mirange) >> 7);
    missile[mi]._mirange = missile[mi]._mirange << 4;
    missile[mi]._miVar1 = missile[mi]._mirange - missile[mi]._miAnimLen;
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
    SetMissDir(mi, GetDirection16(sx, sy, dx, dy));
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
    int oldidx;
    signed char dm;

    dm = dung_map[sx][sy].dMissile;
    if (dm > 0) {
        oldidx = dm - 1;
        missile[oldidx]._miy--;
        PutMissile(oldidx);
    }

    missile[mi]._mix = sx;
    missile[mi]._miy = sy;
    missile[mi]._misx = sx;
    missile[mi]._misy = sy;
    missile[mi]._mirange = 100;
    missile[mi]._miVar2 = 0;
    missile[mi]._miVar1 = missile[mi]._mirange - missile[mi]._miAnimLen;
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
    missile[mi]._mlid = AddLight(sx, sy, 5);
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
        SetMissAnim(mi, 0x1A); /* MFILE_EXP1 -- PSX misfiledata code, from the oracle literal */
    else
        SetMissAnim(mi, 5); /* MFILE_CBOLT */
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
    if ((missile[mi]._mixvel >> 16) == 0 && (missile[mi]._miyvel >> 16) == 0)
        missile[mi]._mirange = 1;
    else
        missile[mi]._mirange = 256;
    missile[mi]._miVar1 = sx;
    missile[mi]._miVar2 = sy;
    missile[mi]._mlid = AddLight(sx, sy, 8);
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
