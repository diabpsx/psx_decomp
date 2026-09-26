/* MONSTER.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/monster.cpp
 * (+ refs/devilutionx/Source/monster.cpp).  The PSX split moved some of this file's functions into
 * SOURCE/COREMON.CPP (already reconstructed at recon/source/coremon.cpp -- style reference, do not edit).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_monster.h"
#include "source/gen/externs_monster.h"
#include "source/gen/protos_monster.h"
#include "source/diablo.h"

/* monster types (_mMTidx / CMonster::mtype, retail values) */
#define MT_GOLEM    109
#define MT_DIABLO   110
#define MT_COUNSLR  0x69
#define MT_ADVOCATE 0x6C

/* AI ids */
#define AI_GARG     12
#define AI_LAZURUS  28
#define AI_SNAKE    24
#define AI_MEGA     26

/* monster modes */
#define MA_STAND   0
#define Sign(x) ((x) < 0 ? -1 : (x) > 0 ? 1 : 0)
#define MA_WALK    1
#define MA_DEATH   4
#define MA_ATTACK  2
#define MA_GOTHIT  3
#define MA_SPECIAL 5

#define MM_STAND   0
#define MM_DELAY   13
#define MM_SATTACK 7
#define MM_ATTACK  4
#define MM_FADEIN  8
#define MM_FADEOUT 9
#define MM_RATTACK 10
#define MM_GOTHIT  5
#define MM_STONE   15
#define MM_MISSILE 14
#define MM_WALK    1
#define MM_WALK2   2
#define MM_WALK3   3
#define MM_DEATH   6
#define MM_RSATTACK 12
#define MM_HEAL    0x10

#define MGOAL_NORMAL    1
#define CMD_MONSTDEATH 0x24
#define MG_ATTACK       1
#define MG_RUN_AWAY     2
#define MG_WALK_AROUND1 4
#define MG_TALK         6
#define MG_WAITTOTALK   7
#define MG_ATTACK2      5
#define Q_GARBUD    2
#define UMT_GARBUD  0
#define ITYPE_MACE  4
#define IMISC_NONE  0
#define MT_NACID    0x2E
#define MT_XACID    0x31
#define MM_TALK    0x11
#define AI_SNOTSPIL 0x17
#define AI_LACHDANAN 0x1E
#define Q_LTBANNER  7
#define Q_VEIL      4
#define IDI_BANNER  0xC
#define IDI_GLDNELIX 0xF
#define TXT_BOL3    0x16
#define TXT_VEIL1   0x51
#define TXT_VEIL3   0x53
#define TXT_WARLRD1 0x6E
#define TXT_ZHAR1   0x94
#define TXT_ZHAR2   0x95
#define USFX_ZHAR2  0x35B
#define USFX_WARLRD1 0x358
#define Q_BETRAYER      15
#define CMD_KILLGOLEM  0x57
#define MGOAL_INQUIRING 6
#define MGOAL_TALKING   7

#define MFLAG_HIDDEN          0x01
#define MFLAG_LOCK_ANIMATION  0x02
#define MFLAG_ALLOW_SPECIAL   0x04
#define MFLAG_STILL           0x04
#define MFLAG_NOHEAL          0x08
#define MFLAG_TARGETS_MONSTER 0x10

#define MT_INCIN    0x48
#define MT_NMAGMA   0x3C
#define MT_STORM    0x4C
#define MT_UNSEEN   0x1F
#define MT_HELLBURN 0x4B

#define PC_WARRIOR  0
#define PC_SORCERER 2

#define BFLAG_MONSTLR 0x10
#define BFLAG_MONSTACTIVE 0x4

#define MAXMONSTERS 190

/* TU-owned small data (.sdata, gp-relative in retail) */
long nummonsters;

void DeleteMonster(int i)
{
    int temp;

    nummonsters--;
    temp = monstactive[nummonsters];
    monstactive[nummonsters] = monstactive[i];
    monstactive[i] = temp;
}

int M_GetDir(int i)
{
    return GetDirection(monster[i]._mx, monster[i]._my, monster[i]._menemyx, monster[i]._menemyy);
}

void M_StartDelay(int i, int len)
{
    if (len <= 0)
        return;

    if (monster[i]._mAi != AI_LAZURUS) {
        monster[i]._mVar2 = len;
        monster[i]._mmode = MM_DELAY;
    }
}

int M_DoHeal(int i)
{
    MonsterStruct *Monst;

    Monst = &monster[i];
    if (monster[i]._mFlags & MFLAG_NOHEAL)
        return 0;

    if (Monst->_mAnimFrame == 1) {
        Monst->_mFlags &= ~MFLAG_LOCK_ANIMATION;
        Monst->_mFlags |= MFLAG_ALLOW_SPECIAL;
        if (Monst->_mhitpoints + Monst->_mVar1 < Monst->_mmaxhp) {
            Monst->_mhitpoints = Monst->_mhitpoints + Monst->_mVar1;
        } else {
            Monst->_mhitpoints = Monst->_mmaxhp;
            Monst->_mFlags &= ~MFLAG_ALLOW_SPECIAL;
            Monst->_mmode = MM_SATTACK;
        }
    }
    return 0;
}

int M_DoStone(int i)
{
    if (monster[i]._mhitpoints == 0) {
        dung_map[monster[i]._mx][monster[i]._my].dMonster = 0;
        monster[i]._mDelFlag = 1;
    }
    return 0;
}

unsigned char PosOkMissile(int x, int y)
{
    return !GetMISSILE(x, y) && !(dung_map[x][y].dFlags & BFLAG_MONSTLR);
}

unsigned char CheckNoSolid(int x, int y)
{
    return !GetSOLID(x, y);
}

unsigned char CanTalkToMonst(int m)
{
    if (monster[m]._mgoal != MGOAL_INQUIRING)
        return monster[m]._mgoal == MGOAL_TALKING;
    return 1;
}

unsigned char CheckMonsterHit(int m, unsigned char &ret)
{
    if (monster[m]._mAi == AI_GARG && (monster[m]._mFlags & MFLAG_ALLOW_SPECIAL)) {
        monster[m]._mFlags &= ~MFLAG_ALLOW_SPECIAL;
        monster[m]._mmode = MM_SATTACK;
        ret = 1;
        return 1;
    }

    if (monster[m].MType->mtype >= MT_COUNSLR && monster[m].MType->mtype <= MT_ADVOCATE) {
        if (monster[m]._mgoal != MGOAL_NORMAL) {
            ret = 0;
            return 1;
        }
    }

    return 0;
}

BOOL gSameRoom(int m, int i)
{
    MonsterStruct *m1 = &monster[m];
    MonsterStruct *m2 = &monster[i];
    return dung_map[m1->_mx][m1->_my].dTransVal == dung_map[m2->_mx][m2->_my].dTransVal;
}

int M_DoFadein(int i)
{
    if ((monster[i]._mFlags & MFLAG_LOCK_ANIMATION && monster[i]._mAnimFrame == 1)
        || (!(monster[i]._mFlags & MFLAG_LOCK_ANIMATION) && monster[i]._mAnimFrame == monster[i]._mAnimLen)) {
        M_StartStand(i, monster[i]._mdir);
        monster[i]._mFlags &= ~MFLAG_LOCK_ANIMATION;
        return 1;
    }
    return 0;
}

int M_DoFadeout(int i)
{
    int mtype;

    if ((monster[i]._mFlags & MFLAG_LOCK_ANIMATION && monster[i]._mAnimFrame == 1)
        || (!(monster[i]._mFlags & MFLAG_LOCK_ANIMATION) && monster[i]._mAnimFrame == monster[i]._mAnimLen)) {
        mtype = monster[i].MType->mtype;
        if (mtype >= MT_INCIN && mtype <= MT_HELLBURN) {
            monster[i]._mFlags &= ~MFLAG_LOCK_ANIMATION;
        } else {
            monster[i]._mFlags &= ~MFLAG_LOCK_ANIMATION;
            monster[i]._mFlags |= MFLAG_HIDDEN;
        }
        M_StartStand(i, monster[i]._mdir);
        return 1;
    }
    return 0;
}

int M_DoGotHit(int i)
{
    if (monster[i]._mAnimFrame == monster[i]._mAnimLen) {
        M_StartStand(i, monster[i]._mdir);
        return 1;
    }

    return 0;
}

void DoEnding(int p)
{
    myplr = p;
    user_start = 0;

    if (plr[p]._pClass == PC_WARRIOR) {
        play_movie("DIABVIC3.MOV");
    } else if (plr[p]._pClass == PC_SORCERER) {
        play_movie("DIABVIC1.MOV");
    } else {
        play_movie("DIABVIC2.MOV");
    }

    music_stop();

    user_start = 1;
}

void PrepDoEnding(int reason)
{
    int newKillLevel;
    int p;

    gbDoEnding = reason + 1;
    gbRunGame = 0;
    deathflag = 0;

    /* SYM OPEN: bytes near-miss (82==82 insns) -- ours vs oracle swap which of {gnDifficulty+1, the
     * loaded pDiabloKillLevel} lands in v1 vs a0 for the final sltu compare (pure coloring).
     * Falsified: if/else vs ternary forms (both orders), dropping/keeping a `killLevel` pointer
     * local, moving this statement before/after the gbDoEnding/gbRunGame/deathflag stores, the
     * Hellfire-source max()-style single ternary.  Next angle: SYM REG dump (allocno priorities)
     * or a decl-order permuter sweep on this one statement. */
    newKillLevel = gnDifficulty + 1;
    if (plr[myplr].pDiabloKillLevel > newKillLevel)
        newKillLevel = plr[myplr].pDiabloKillLevel;
    plr[myplr].pDiabloKillLevel = newKillLevel;

    for (p = 0; p < 2; p++) {
        plr[p]._pmode = PM_QUIT;
        plr[p]._pInvincible = 1;
        if (gbMaxPlayers > 1) {
            if (plr[p]._pHitPoints >> 6 == 0)
                plr[p]._pHitPoints = 64;
            if (plr[p]._pMana >> 6 == 0)
                plr[p]._pMana = 64;
        }
    }

    HappyMan(FePlayerNo ? 0x30 : 0x18);
}

int M_DoSpStand(int i)
{
    if (monster[i]._mAnimFrame == monster[i].MData->mAFNum2)
        PlayEffect(i, 3);

    if (monster[i]._mAnimFrame == monster[i]._mAnimLen) {
        M_StartStand(i, monster[i]._mdir);
        return 1;
    }

    return 0;
}

int M_DoStand(int i)
{
    MonsterStruct *Monst = &monster[i];

    if (Monst->MType->mtype == MT_GOLEM)
        Monst->Action = 1;
    else
        Monst->Action = 0;
    Monst->_mVar2++;

    return 0;
}

/* missile type ids (source order names, from refs/diablo-hellfire/src/MISSILE.H) */
#define MIT_ARROW        0
#define MIT_FLARE        0x18
#define MIT_MAGMABALL    0x15
#define MIT_THINLIGHTCTRL 0x16
#define MIT_ACID         0x39
#define MIT_DIABAPOCA    0x43
#define MIT_FLAMEC       0x31
#define MIT_CBOLT        0x34
#define MIT_FIREMAN      0x32
#define MIT_KRULL        0x33
#define MIT_FIREBOLT     1
#define MIT_LIGHTCTRL    7
#define MIT_FIREBALL     6
#define MIT_FLASH        0xB
#define MIT_FLASH2       0xC
#define MIT_ACIDPUD      0x3B

void MAI_GoatMc(int i)
{
    MAI_Round(i, 1);
}

void MAI_GoatBow(int i)
{
    MAI_Ranged(i, MIT_ARROW, 0);
}

void MAI_Succ(int i)
{
    MAI_Ranged(i, MIT_FLARE, 0);
}

void MAI_AcidUniq(int i)
{
    MAI_Ranged(i, MIT_ACID, 1);
}

void MAI_Mega(int i)
{
    MAI_RR2(i, MIT_FLAMEC, 0);
}

void MAI_Magma(int i)
{
    MAI_RoundRanged(i, MIT_MAGMABALL, 1, 4, 0);
}

void MAI_Storm(int i)
{
    MAI_RoundRanged(i, MIT_THINLIGHTCTRL, 1, 4, 0);
}

void MAI_Acid(int i)
{
    MAI_RoundRanged(i, MIT_ACID, 0, 4, 1);
}

void MAI_Diablo(int i)
{
    MAI_RoundRanged(i, MIT_DIABAPOCA, 0, 40, 0);
}

unsigned char LineClear(int x1, int y1, int x2, int y2)
{
    return LineClearF(PosOkMissile, x1, y1, x2, y2);
}

unsigned char M_DumbWalk(int i, int md)
{
    unsigned char ok;

    ok = DirOK(i, md);
    if (ok)
        M_WalkDir(i, md);
    return ok;
}


void M_StartHeal(int i)
{
    MonsterStruct *Monst = &monster[i];

    Monst->Action = MA_SPECIAL;
    Monst->_mAnimFrame = Monst->MType->Anims[MA_SPECIAL].Frames;
    Monst->_mFlags |= MFLAG_LOCK_ANIMATION;
    Monst->_mmode = MM_HEAL;
    Monst->_mVar1 = Monst->_mmaxhp / ((ENG_random(5) + 4) << 4);
}

void M_StartEat(int i)
{
    MonsterStruct *pmonster;
    int _mx, _my;

    NewMonsterAnim(i, monster[i].MType->Anims[MA_SPECIAL], monster[i]._mdir, MA_SPECIAL);
    pmonster = &monster[i];
    _mx = pmonster->_mx;
    _my = pmonster->_my;
    monster[i]._mmode = MM_SATTACK;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = _mx;
    monster[i]._mfuty = _my;
    monster[i]._moldx = _mx;
    monster[i]._moldy = _my;
    M_CheckEFlag(i);
}

int M_DoSAttack(int i)
{
    if (monster[i]._mAnimFrame == monster[i].MData->mAFNum2)
        M_TryH2HHit(i, monster[i]._menemy, monster[i].mHit2, monster[i].mMinDamage2, monster[i].mMaxDamage2);
    if (monster[i]._mAnimFrame == monster[i]._mAnimLen) {
        M_StartStand(i, monster[i]._mdir);
        return 1;
    }
    return 0;
}

void M_StartAttack(int i)
{
    int md;
    MonsterStruct *pmonster;
    int _mx, _my;

    md = M_GetDir(i);
    NewMonsterAnim(i, monster[i].MType->Anims[MA_ATTACK], md, MA_ATTACK);
    pmonster = &monster[i];
    _mx = pmonster->_mx;
    _my = pmonster->_my;
    monster[i]._mmode = MM_ATTACK;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = _mx;
    monster[i]._mfuty = _my;
    monster[i]._moldx = _mx;
    monster[i]._moldy = _my;
    monster[i]._mdir = md;
    M_CheckEFlag(i);
}

void M_StartSpAttack(int i)
{
    int md;
    MonsterStruct *pmonster;
    int _mx, _my;

    md = M_GetDir(i);
    NewMonsterAnim(i, monster[i].MType->Anims[MA_SPECIAL], md, MA_SPECIAL);
    pmonster = &monster[i];
    _mx = pmonster->_mx;
    _my = pmonster->_my;
    monster[i]._mmode = MM_SATTACK;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = _mx;
    monster[i]._mfuty = _my;
    monster[i]._moldx = _mx;
    monster[i]._moldy = _my;
    monster[i]._mdir = md;
    M_CheckEFlag(i);
}

unsigned char M_CallWalk2(int i, int md)
{
    int mdtemp = md;
    unsigned char ok;

    ok = DirOK(i, md);
    if (ENG_random(2)) {
        ok = ok || DirOK(i, md = (mdtemp - 1) & 7) || DirOK(i, md = (mdtemp + 1) & 7);
    } else {
        ok = ok || DirOK(i, md = (mdtemp + 1) & 7) || DirOK(i, md = (mdtemp - 1) & 7);
    }

    if (ok)
        M_WalkDir(i, md);

    return ok;
}

void MAI_Cleaver(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mx, my, md;

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        mx = Monst->_mx - Monst->_menemyx;
        my = Monst->_my - Monst->_menemyy;
        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);
        Monst->_mdir = md;
        if (abs(mx) < 2 && abs(my) < 2)
            M_StartAttack(i);
        else
            M_CallWalk(i, md);
        if (Monst->_mmode == MM_STAND)
            Monst->Action = MA_STAND;
    }
}

/* SYM OPEN: bytes PASS; block tree shape matches (2 nested levels) but ours closes at the "return 1"
 * (L17/+c8) where retail's outer AI_LAZURUS level (and the inner one) stay open to the function's
 * end (L24/+fc) -- looks like the scheduler-hoisted-empty-level quirk (methodology fact #34).
 * Falsified: `tmp` at function scope vs block scope (both give a level, only the block-scope form
 * gets the right NESTING, not the right END).  Next angle: an extra trailing statement/decl after
 * the `if (mVar2--==0)` block that the SYM's END address implies is still there but dead/optimized
 * away, or the level is simply emitted for the OUTER if regardless of where its own statements end. */
int M_DoDelay(int i)
{
    int md;

    md = M_GetDir(i);
    monster[i].Action = MA_STAND;
    M_Enemy(i);
    if (monster[i]._mAi == AI_LAZURUS) {
        if (monster[i]._mVar2 > 8 || monster[i]._mVar2 < 0)
            monster[i]._mVar2 = 8;
    }
    if (!monster[i]._mVar2--) {
        int tmp = monster[i]._mAnimFrame;
        M_StartStand(i, monster[i]._mdir);
        monster[i]._mAnimFrame = tmp;
        return 1;
    } else return 0;
}

void M_StartFadein(int i, int md, unsigned char backwards)
{
    NewMonsterAnim(i, monster[i].MType->Anims[MA_SPECIAL], md, MA_SPECIAL);
    monster[i]._mmode = MM_FADEIN;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = monster[i]._mx;
    monster[i]._mfuty = monster[i]._my;
    monster[i]._moldx = monster[i]._mx;
    monster[i]._moldy = monster[i]._my;
    M_CheckEFlag(i);
    monster[i]._mdir = md;
    monster[i]._mFlags &= ~MFLAG_HIDDEN;
    if (backwards) {
        monster[i]._mFlags |= MFLAG_LOCK_ANIMATION;
        monster[i]._mAnimFrame = monster[i]._mAnimLen;
    }
}

void M_StartFadeout(int i, int md, unsigned char backwards)
{
    NewMonsterAnim(i, monster[i].MType->Anims[MA_SPECIAL], md, MA_SPECIAL);
    monster[i]._mmode = MM_FADEOUT;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = monster[i]._mx;
    monster[i]._mfuty = monster[i]._my;
    monster[i]._moldx = monster[i]._mx;
    monster[i]._moldy = monster[i]._my;
    M_CheckEFlag(i);
    monster[i]._mdir = md;
    if (backwards) {
        monster[i]._mFlags |= MFLAG_LOCK_ANIMATION;
        monster[i]._mAnimFrame = monster[i]._mAnimLen;
    }
}

/* OPEN: logic correct (verified against refs/diablo-hellfire), bytes near-miss (120 vs 107 insns).
 * The oracle fuses each direction's `SolidLoc(...) || dFlags&BFLAG_MONSTLR` guard directly into the
 * shared tail (no separate "return 0" per branch -- it flows straight from the mask/compare into the
 * next direction's shared code), where ours keeps each branch's own beqz/li/j return-0 sequence.
 * Next angle: a single fused boolean `if (SolidLoc(..)||(...)) return 0;` chain written WITHOUT
 * if/else-if (four independent `if` statements in sequence, each an early return) may let gcc thread
 * the branches the way the oracle does; not yet tried due to time budget. */
unsigned char DirOK(int i, int mdir)
{
    unsigned int fx = monster[i]._mx + offset_x[mdir];
    unsigned int fy = monster[i]._my + offset_y[mdir];

    if (fy >= 98 || fx >= 98)
        return 0;
    if (!PosOkMonst(i, fx, fy))
        return 0;

    if (mdir == DIR_E) {
        if (SolidLoc(fx, fy + 1) || (dung_map[fx][fy + 1].dFlags & BFLAG_MONSTLR))
            return 0;
    } else if (mdir == DIR_W) {
        if (SolidLoc(fx + 1, fy) || (dung_map[fx + 1][fy].dFlags & BFLAG_MONSTLR))
            return 0;
    } else if (mdir == DIR_N) {
        if (SolidLoc(fx + 1, fy) || SolidLoc(fx, fy + 1))
            return 0;
    } else if (mdir == DIR_S) {
        if (SolidLoc(fx - 1, fy) || SolidLoc(fx, fy - 1))
            return 0;
    }

    return 1;
}

void M_StartRAttack(int i, int missile_type, int dam)
{
    int md;
    MonsterStruct *pmonster;
    int _mx, _my;

    md = M_GetDir(i);
    NewMonsterAnim(i, monster[i].MType->Anims[MA_ATTACK], md, MA_ATTACK);
    pmonster = &monster[i];
    _mx = pmonster->_mx;
    _my = pmonster->_my;
    monster[i]._mmode = MM_RATTACK;
    monster[i]._mVar1 = missile_type;
    monster[i]._mVar2 = dam;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = _mx;
    monster[i]._mfuty = _my;
    monster[i]._moldx = _mx;
    monster[i]._moldy = _my;
    monster[i]._mdir = md;
    M_CheckEFlag(i);
}

void DeleteMonsterList(void)
{
    int i, mi;

    for (i = 0; i < 4; i++) {
        if (monster[i]._mDelFlag) {
            monster[i]._mx = 1;
            monster[i]._my = 0;
            monster[i]._mfutx = 0;
            monster[i]._mfuty = 0;
            monster[i]._moldx = 0;
            monster[i]._moldy = 0;
            monster[i]._mDelFlag = 0;
        }
    }

    i = 4;
    while (i < nummonsters) {
        mi = monstactive[i];
        if (monster[mi]._mDelFlag) {
            DeleteMonster(i);
            i = 0;
        } else {
            i++;
        }
    }
}

/* SYM+bytes OPEN (74 vs 75 insns): the masked mMagicRes value should live directly in a
 * callee-saved reg across the GetStr/strcpy/AddPanelString calls (oracle: one `lhu s0,...;
 * andi s0,s0,63`), ours loads into v0 first then masks into s0 (an extra move) -- a pure
 * allocator tie-break on a single-statement load+mask.  Falsified: caching `tempstr` into a
 * local pointer held across the calls (made it WORSE, 69/75 -- wrong lever, tempstr address is
 * genuinely re-materialized per call site in the oracle, not cached).  Next angle: split the
 * load and mask into two statements, or try `unsigned` vs `int` for res. */
void PrintUniqueHistory(void)
{
    int res;

    res = monster[_pcursmonst[sel_data]].mMagicRes;
    res &= 0x3F;
    if (res == 0) {
        strcpy(tempstr, GetStr(0x2D2));
        AddPanelString(tempstr, 1);
        strcpy(tempstr, GetStr(0x2CD));
        AddPanelString(tempstr, 1);
    } else {
        strcpy(tempstr, GetStr((res & 7) ? 0x3E7 : 0x2D2));
        AddPanelString(tempstr, 1);
        strcpy(tempstr, GetStr((res & 0x38) ? 0x3E6 : 0x2CD));
        AddPanelString(tempstr, 1);
    }
    _pinfoflag[sel_data] = 1;
}

/* SYM OPEN: bytes PASS; retail's block tree is FLAT but ours opens two nested levels for the
 * `if (!dMonster) {...}` body despite NO declarations inside it (violates the usual SYM law).
 * Falsified: merging the two early-return guards into one `||` test (no effect on the block issue,
 * kept since it also byte-matches and is simpler).  Next angle: unknown -- maybe the call to
 * M_ClearSquares(i) as a non-tail statement inside the block is itself the trigger; would need a
 * scratch A/B (single-statement block vs multi-statement) to isolate, not done (time budget). */
void M_SyncStartKill(int i, int x, int y, int pnum)
{
    if (monster[i]._mhitpoints == 0 || monster[i]._mmode == MM_DEATH)
        return;

    if (!dung_map[x][y].dMonster) {
        M_ClearSquares(i);
        monster[i]._mx = x;
        monster[i]._my = y;
        monster[i]._moldx = x;
        monster[i]._moldy = y;
    }
    if (deltaload)
        SyncMonstStartKill(i, pnum, 0);
}

/* SYM+bytes OPEN (48 diffs, 90==90 insns -- instruction COUNT now exact): logic/divide VERIFIED
 * correct -- `(x*100)/202` (D=202 solved from ceil(2^37/D)==0x288DF0CB per the orchestrator's hint)
 * reproduces the oracle's whole magic-multiply sequence exactly once the base pointer is cached as
 * `MonsterStruct *base = monster;` (array decay, NOT `&monster[monst]` -- that indexed-pointer cache
 * made it worse) and `base[monst]._mxoff + (base[monst]._myoff<<1)` (mxoff-first operand order,
 * matching the oracle's `addu v0,a1,a0` with a1=mxoff).  Residual: the prologue (`addiu sp,-24;
 * sw ra`) is scheduled by the oracle much LATER (right before the first `mult`), ours emits it as
 * the classic leading prologue -- a pure gcc instruction-scheduling placement, not reachable by
 * reordering the lx/ly statements (tried swapping which is computed first: regressed to 91/90).
 * Next angle: an RTL scheduler dump (-dS/-dR) to see what dependency is delaying the oracle's sp/ra. */
void M_ChangeLightOffset(int monst)
{
    MonsterStruct *base = monster;
    int lx, ly;

    lx = (base[monst]._mxoff + (base[monst]._myoff << 1)) * 100 / 202;
    ly = ((base[monst]._myoff << 1) - base[monst]._mxoff) * 100 / 202;

    if (lx < 0) {
        lx += 32;
        if (ly >= 0 && base[monst]._mdir == 1)
            lx = 32 - lx;
    }
    if (ly < 0) {
        ly += 32;
    } else if (base[monst]._mdir == 6) {
        ly = 31 - ly;
    }

    lx >>= 2;
    lx += (LightList[base[monst].mlid]._lx & 1) << 3;
    ly >>= 2;
    ly += (LightList[base[monst].mlid]._ly & 1) << 3;

    ChangeLightOff(base[monst].mlid, lx - 8, ly - 8);
}

/* SYM+bytes OPEN (1 diff, 94 vs 93 insns): only residual is a redundant `li v0,12` -- retail
 * reuses the SAME register that (unconditionally, before the branch) already holds MM_RSATTACK=12
 * for BOTH the SetLightFX 8th arg (SetLightFX takes 8 params per its SYM proto -- x,y,s_r,s_g,s_b,
 * d_r,d_g,d_b -- confirmed via symhdr.py proto, so this genuinely is a real 8th arg, not a stale
 * register per the orchestrator's hint) and the later `_mmode = MM_RSATTACK` store.  Falsified: a
 * shared `int mmode = MM_RSATTACK;` local used both places (forced mmode into a callee-saved reg
 * live across the SetLightFX/NewMonsterAnim calls, growing the frame +8 bytes and regressing to 27
 * diffs -- wrong lever, reverted). */
void M_StartRSpAttack(int i, int missile_type, int dam)
{
    int md;
    MonsterStruct *pmonster;
    int _mx, _my;

    md = M_GetDir(i);
    NewMonsterAnim(i, monster[i].MType->Anims[MA_SPECIAL], md, MA_SPECIAL);
    pmonster = &monster[i];
    _mx = pmonster->_mx;
    _my = pmonster->_my;

    if (missile_type == MIT_DIABAPOCA)
        SetLightFX(_mx, _my, 0xA00, 0xA00, 0xA00, 0x40, 0x40, MM_RSATTACK);

    monster[i]._mmode = MM_RSATTACK;
    monster[i]._mVar1 = missile_type;
    monster[i]._mVar2 = 0;
    monster[i]._mVar3 = dam;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = _mx;
    monster[i]._mfuty = _my;
    monster[i]._moldx = _mx;
    monster[i]._moldy = _my;
    monster[i]._mdir = md;
    M_CheckEFlag(i);
}

/* OPEN: bytes far-miss (147 vs 135 insns) -- logic transcribed as a best-effort reading of the raw
 * oracle (hellfire's M_GetKnockback takes no `d` param, computes `d=(mdir+4)&7` internally and has
 * NO _mVar1/2/6/7/xvel/yvel reset or _mVar8++ tail -- all of that is a genuine PSX addition read
 * directly from the disassembly, not sourced from any twin).  Structural issues remain (register
 * numbers assigned to `i` vs `d` differ, several field re-reads look duplicated in the oracle in a
 * way not yet matched).  Not chased further this pass (deprioritized vs the fresh-function list);
 * needs a dedicated pass re-deriving the exact store order from the raw bytes. */
void M_GetKnockback(int i, int d)
{
    if (DirOK(i, d)) {
        M_ClearSquares(i);
        monster[i]._moldx += offset_x[d];
        monster[i]._moldy += offset_y[d];
        NewMonsterAnim(i, monster[i].MType->Anims[MA_GOTHIT], monster[i]._mdir, MA_GOTHIT);
        monster[i]._mmode = MM_GOTHIT;
        monster[i]._mxoff = 0;
        monster[i]._myoff = 0;
        monster[i]._mx = monster[i]._moldx;
        monster[i]._my = monster[i]._moldy;
        monster[i]._mfutx = monster[i]._mx;
        monster[i]._mfuty = monster[i]._my;
        monster[i]._moldx = monster[i]._mx;
        monster[i]._moldy = monster[i]._my;
        M_CheckEFlag(i);
        M_ClearSquares(i);
        monster[i]._mVar1 = 0;
        monster[i]._mVar2 = 0;
        monster[i]._mxvel = 0;
        monster[i]._myvel = 0;
        monster[i]._mVar6 = 0;
        monster[i]._mVar7 = 0;
        dung_map[monster[i]._mx][monster[i]._my].dMonster = i + 1;
        monster[i]._mVar8++;
    }
}

/* OPEN: bytes near-miss (8 diffs, 66==66 insns -- count exact) -- pure instruction-SCHEDULING
 * difference: oracle materializes the `monster` symbol address (lui/addiu) EARLIER, interleaved
 * mid-way through the index*104 scaling chain, ours computes the full index chain first then the
 * symbol address.  SYM already matches.  Same family as M_ChangeLightOffset's sp/ra placement --
 * a scheduler artifact, not reachable by the statement/declaration reorderings tried so far. */
void M_StartKill(int i, int pnum)
{
    MonsterStruct *pmonster = &monster[i];
    int _mx, _my;

    _mx = pmonster->_mx;
    _my = pmonster->_my;

    if (monster[i]._mmode == MM_STONE) {
        MonstPartJump(i);
        RemoveStoneMissiles(i, _mx, _my);
    }

    delta_kill_monster(i, _mx, _my, currlevel);
    if (i != pnum)
        NetSendCmdLocParam1(0, CMD_MONSTDEATH, _mx, _my, i);
    else
        NetSendCmdLocParam1(0, CMD_KILLGOLEM, _mx, _my, currlevel);

    MonstStartKill(i, pnum, 1);
}

void MAI_Zombie(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mx, my, md, v;

    if (Monst->_mmode == MM_STAND) {
        mx = Monst->_mx;
        my = Monst->_my;
        if (dung_map[mx][my].dFlags & BFLAG_MONSTACTIVE) {
            mx -= Monst->_menemyx;
            my -= Monst->_menemyy;
            md = Monst->_mdir;
            v = ENG_random(100);

            if (abs(mx) < 2 && abs(my) < 2) {
                if (v < (10 + 2 * Monst->_mint))
                    M_StartAttack(i);
            } else {
                if (v < (10 + 2 * Monst->_mint)) {
                    if (abs(mx) < (4 + 2 * Monst->_mint) && abs(my) < (4 + 2 * Monst->_mint)) {
                        md = M_GetDir(i);
                        M_CallWalk(i, md);
                    } else {
                        if (ENG_random(100) < (20 + 2 * Monst->_mint))
                            md = ENG_random(8);
                        M_DumbWalk(i, md);
                    }
                }
            }
            if (Monst->_mmode == MM_STAND)
                Monst->Action = MA_STAND;
        }
    }
}

void MAI_SkelSd(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mx, my, md;

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        mx = Monst->_mx - Monst->_menemyx;
        my = Monst->_my - Monst->_menemyy;
        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);
        Monst->_mdir = md;

        if (abs(mx) < 2 && abs(my) < 2) {
            if (Monst->_mVar1 == MM_DELAY || ENG_random(100) < 20 + 2 * Monst->_mint)
                M_StartAttack(i);
            else
                M_StartDelay(i, ENG_random(10) + 10 - 2 * Monst->_mint);
        } else {
            if (Monst->_mVar1 != MM_DELAY && ENG_random(100) < 35 - 4 * Monst->_mint)
                M_StartDelay(i, ENG_random(10) + 15 - 2 * Monst->_mint);
            else
                M_CallWalk(i, md);
        }

        if (Monst->_mmode == MM_STAND)
            Monst->Action = MA_STAND;
    }
}

unsigned char M_CallWalk(int i, int md)
{
    int mdtemp = md;
    unsigned char ok;

    ok = DirOK(i, md);
    if (ENG_random(2)) {
        ok = ok || DirOK(i, md = (mdtemp - 1) & 7) || DirOK(i, md = (mdtemp + 1) & 7);
    } else {
        ok = ok || DirOK(i, md = (mdtemp + 1) & 7) || DirOK(i, md = (mdtemp - 1) & 7);
    }

    if (ENG_random(2)) {
        ok = ok || DirOK(i, md = (((mdtemp + 1) & 7) + 1) & 7) || DirOK(i, md = (((mdtemp - 1) & 7) - 1) & 7);
    } else {
        ok = ok || DirOK(i, md = (((mdtemp - 1) & 7) - 1) & 7) || DirOK(i, md = (((mdtemp + 1) & 7) + 1) & 7);
    }

    if (ok)
        M_WalkDir(i, md);

    return ok;
}

/* OPEN: bytes near-miss (89 vs 86 insns) -- logic verified against hellfire's M_StartWalk (matches
 * exactly, PSX just drops the unused `pn=dPiece[fx][fy]-1` local).  Residual is the SAME
 * scheduling-only class as M_ChangeLightOffset/M_StartKill: with a `MonsterStruct *pmonster`
 * cache the `monster` symbol materializes into the RIGHT register (v0) but at the wrong point in
 * the schedule (oracle interleaves it mid-way through the index*104 chain; ours emits it as one
 * block).  Declaration-order swap (pmonster before/after fx,fy) made no difference. */
void M_StartWalk(int i, int xvel, int yvel, int xadd, int yadd, int EndDir)
{
    int fx, fy;
    MonsterStruct *pmonster = &monster[i];

    fx = pmonster->_mx + xadd;
    fy = pmonster->_my + yadd;
    dung_map[fx][fy].dMonster = -1 - i;
    monster[i]._mmode = MM_WALK;
    monster[i]._moldx = pmonster->_mx;
    monster[i]._moldy = pmonster->_my;
    monster[i]._mfutx = fx;
    monster[i]._mfuty = fy;
    monster[i]._mxvel = xvel;
    monster[i]._myvel = yvel;
    monster[i]._mVar1 = xadd;
    monster[i]._mVar2 = yadd;
    monster[i]._mVar3 = EndDir;
    monster[i]._mdir = EndDir;
    NewMonsterAnim(i, monster[i].MType->Anims[MA_WALK], EndDir, MA_WALK);
    monster[i]._mVar6 = 0;
    monster[i]._mVar7 = 0;
    monster[i]._mVar8 = 0;
    M_CheckEFlag(i);
}

/* OPEN: bytes near-miss (15 diffs, 137 vs 140 insns) -- fully derived from the raw oracle (NOT
 * from hellfire, whose M_StartWalk2/M_StartWalk3 calls don't exist on PSX -- confirmed all 8
 * switch-case bodies + the case LAYOUT ORDER from the jump table bytes at 0x8011A310: N,NE,E,SE,
 * S,SW,W,NW, matching hellfire's switch source order even though the case VALUES are the DIR_
 * enum).  Getting the case order right (ascending 0..7 instead of the jump-table's physical N-first
 * order) alone took the diff from "far miss" to this near-miss.  Residual: per-case instruction
 * SCHEDULING (which value lands in the branch/jump delay slot) -- same scheduling-artifact family
 * as M_StartWalk/M_StartKill/M_ChangeLightOffset. */
void M_WalkDir(int i, int md)
{
    int mwi = monster[i].MType->Anims[MA_WALK].Frames - 1;

    switch (md) {
    case DIR_N:
        M_StartWalk(i, 0, -MWVel[mwi][1], -1, -1, DIR_N);
        break;
    case DIR_NE:
        M_StartWalk(i, MWVel[mwi][1], -MWVel[mwi][0], 0, -1, DIR_NE);
        break;
    case DIR_E:
        M_StartWalk(i, MWVel[mwi][2], 0, 1, -1, DIR_E);
        break;
    case DIR_SE:
        M_StartWalk(i, MWVel[mwi][1], MWVel[mwi][0], 1, 0, DIR_SE);
        break;
    case DIR_S:
        M_StartWalk(i, 0, MWVel[mwi][1], 1, 1, DIR_S);
        break;
    case DIR_SW:
        M_StartWalk(i, -MWVel[mwi][1], MWVel[mwi][0], 0, 1, DIR_SW);
        break;
    case DIR_W:
        M_StartWalk(i, -MWVel[mwi][2], 0, -1, 1, DIR_W);
        break;
    case DIR_NW:
        M_StartWalk(i, -MWVel[mwi][1], MWVel[mwi][0], -1, 0, DIR_NW);
        break;
    }
}

unsigned char M_RoundWalk(int i, int md, int &dir)
{
    int mdtemp;
    unsigned char ok;

    if (dir)
        md = (((md - 1) & 7) - 1) & 7;
    else
        md = (((md + 1) & 7) + 1) & 7;
    mdtemp = md;

    ok = DirOK(i, md);
    if (!ok) {
        if (dir)
            ok = DirOK(i, md = (mdtemp + 1) & 7) || DirOK(i, md = (((mdtemp + 1) & 7) + 1) & 7);
        else
            ok = DirOK(i, md = (mdtemp - 1) & 7) || DirOK(i, md = (((mdtemp - 1) & 7) - 1) & 7);
    }

    if (ok) {
        M_WalkDir(i, md);
    } else {
        dir = !dir;
        ok = M_CallWalk(i, (mdtemp + 4) & 7);
    }
    return ok;
}

void MAI_SkelBow(int i)
{
    int mx, my, md, fx, fy;
    unsigned char walking = 0;
    int v;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        mx = Monst->_mx - Monst->_menemyx;
        my = Monst->_my - Monst->_menemyy;
        md = M_GetDir(i);
        Monst->_mdir = md;

        v = ENG_random(100);
        if (abs(mx) < 4 && abs(my) < 4
            && ((Monst->_mVar2 > 20 && v < 13 + 2 * Monst->_mint)
                || ((Monst->_mVar1 == MM_WALK || Monst->_mVar1 == MM_WALK2 || Monst->_mVar1 == MM_WALK3)
                    && Monst->_mVar2 == 0 && v < 63 + 2 * Monst->_mint))) {
            walking = M_DumbWalk(i, (md + 4) & 7);
        }
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        if (!walking && ENG_random(100) < 3 + 2 * Monst->_mint
            && LineClear(Monst->_mx, Monst->_my, fx, fy)) {
            M_StartRAttack(i, MIT_ARROW, 4);
        }
        if (Monst->_mmode == MM_STAND)
            Monst->Action = MA_STAND;
    }
}

void MAI_Fat(int i)
{
    int mx, my, md, v;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        mx = Monst->_mx - Monst->_menemyx;
        my = Monst->_my - Monst->_menemyy;
        md = M_GetDir(i);
        Monst->_mdir = md;
        v = ENG_random(100);

        if (abs(mx) < 2 && abs(my) < 2) {
            if (v < (15 + 4 * Monst->_mint))
                M_StartAttack(i);
            else if (v < (20 + 4 * Monst->_mint))
                M_StartSpAttack(i);
        } else {
            if ((Monst->_mVar2 > 20 && v < (20 + 4 * Monst->_mint))
                || ((Monst->_mVar1 == MM_WALK || Monst->_mVar1 == MM_WALK2 || Monst->_mVar1 == MM_WALK3)
                    && Monst->_mVar2 == 0 && v < (70 + 4 * Monst->_mint))) {
                M_CallWalk(i, md);
            }
        }

        if (Monst->_mmode == MM_STAND)
            Monst->Action = MA_STAND;
    }
}

void MAI_Round(int i, unsigned char special)
{
    int mx, my, md, v;
    int fx, fy, dist;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = Monst->_mx - fx;
        my = Monst->_my - fy;
        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);

        if (Monst->_msquelch < 255)
            MonstCheckDoors(i);

        v = ENG_random(100);
        if (abs(mx) < 2 && abs(my) < 2
            || Monst->_msquelch != 255
            || dung_map[Monst->_mx][Monst->_my].dTransVal != dung_map[fx][fy].dTransVal) {
            Monst->_mgoal = MG_ATTACK;
        } else if (Monst->_mgoal == MG_WALK_AROUND1
            || (!(abs(mx) < 4 && abs(my) < 4) && !ENG_random(4))) {
            if (Monst->_mgoal != MG_WALK_AROUND1) {
                Monst->_mgoalvar1 = 0;
                Monst->_mgoalvar2 = ENG_random(2);
            }

            Monst->_mgoal = MG_WALK_AROUND1;

            dist = abs(mx) > abs(my) ? abs(mx) : abs(my);

            if ((Monst->_mgoalvar1++ >= (dist << 1) && DirOK(i, md))
                || dung_map[Monst->_mx][Monst->_my].dTransVal != dung_map[fx][fy].dTransVal) {
                Monst->_mgoal = MG_ATTACK;
            } else if (!M_RoundWalk(i, md, Monst->_mgoalvar2))
                M_StartDelay(i, ENG_random(10) + 10);
        }
        if (Monst->_mgoal == MG_ATTACK) {
            if (abs(mx) < 2 && abs(my) < 2) {
                if (v < 23 + 2 * Monst->_mint) {
                    Monst->_mdir = md;
                    if (special && Monst->_mhitpoints < (Monst->_mmaxhp >> 1) && ENG_random(2))
                        M_StartSpAttack(i);
                    else
                        M_StartAttack(i);
                }
            } else if ((Monst->_mVar2 > 20 && v < (28 + 2 * Monst->_mint))
                || ((Monst->_mVar1 == MM_WALK || Monst->_mVar1 == MM_WALK2 || Monst->_mVar1 == MM_WALK3)
                    && Monst->_mVar2 == 0 && v < (78 + 2 * Monst->_mint))) {
                M_CallWalk(i, md);
            }
        }

        if (Monst->_mmode == MM_STAND)
            Monst->Action = MA_STAND;
    }
}

void MAI_Ranged(int i, int missile_type, unsigned char special)
{
    int fx, fy, mx, my, md;
    unsigned char walking = 0;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND) {
        if (Monst->_msquelch == 255 || monster[i]._mFlags & MFLAG_TARGETS_MONSTER) {
            fx = Monst->_menemyx;
            fy = Monst->_menemyy;
            mx = Monst->_mx - fx;
            my = Monst->_my - fy;
            md = M_GetDir(i);

            if (Monst->_msquelch < 255)
                MonstCheckDoors(i);

            Monst->_mdir = md;

            if (Monst->_mVar1 == MM_RATTACK) {
                M_StartDelay(i, ENG_random(20));
            } else if (abs(mx) < 4 && abs(my) < 4 && ENG_random(100) < 70 + 10 * Monst->_mint) {
                walking = M_CallWalk(i, (md + 4) & 7);
            }
            if (Monst->_mmode == MM_STAND) {
                if (LineClear(Monst->_mx, Monst->_my, fx, fy)) {
                    if (special)
                        M_StartRSpAttack(i, missile_type, 4);
                    else
                        M_StartRAttack(i, missile_type, 4);
                } else
                    Monst->Action = MA_STAND;
            }
        } else if (Monst->_msquelch && !(monster[i]._mFlags & MFLAG_TARGETS_MONSTER)) {
            mx = Monst->_lastx;
            my = Monst->_lasty;
            md = GetDirection(Monst->_mx, Monst->_my, mx, my);

            M_CallWalk(i, md);
        }
    }
}

/* OPEN: bytes near-miss (11 diffs, 77 vs 78 insns) -- scheduling-only (which of two independent
 * instructions the sw/lb pair emits first) + one register choice (a0 vs s2 for md across the
 * M_CheckEFlag-analog call).  Declaration order swap (md first vs last) made no difference. */
void MAI_Lazhelp(int i)
{
    int mx, my;
    MonsterStruct *Monst = &monster[i];
    int md;

    mx = Monst->_mx;
    my = Monst->_my;
    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);
        if (dung_map[mx][my].dFlags & BFLAG_MONSTACTIVE) {
            mx = Monst->_mx - Monst->_menemyx;
            my = Monst->_my - Monst->_menemyy;
            if (gbMaxPlayers == 1) {
                if (quests[Q_BETRAYER]._qvar1 <= 5)
                    Monst->_mgoal = MG_TALK;
                else {
                    Monst->_mgoal = MG_ATTACK;
                    Monst->mtalkmsg = 0;
                }
            } else if (gbMaxPlayers != 1) {
                Monst->_mgoal = MG_ATTACK;
            }
        }
        if (Monst->_mgoal == MG_ATTACK) {
            MAI_Succ(i);
        }
        monster[i]._mdir = md;
    }
    if (Monst->_mmode == MM_STAND)
        Monst->Action = MA_STAND;
}

int M_DoWalk(int i)
{
    int rv;

    if (monster[i]._mVar8 == monster[i].MType->Anims[MA_WALK].Frames) {
        dung_map[monster[i]._mx][monster[i]._my].dMonster = 0;
        monster[i]._mx += monster[i]._mVar1;
        monster[i]._my += monster[i]._mVar2;
        dung_map[monster[i]._mx][monster[i]._my].dMonster = i + 1;
        if (monster[i]._uniqtype != 0)
            ChangeLightXY(monster[i].mlid, monster[i]._mx, monster[i]._my);
        M_StartStand(i, monster[i]._mdir);
        rv = 1;
    } else {
        if (monster[i]._mAnimCnt == 0) {
            monster[i]._mVar8++;
            monster[i]._mVar6 += monster[i]._mxvel;
            monster[i]._mVar7 += monster[i]._myvel;
            monster[i]._mxoff = monster[i]._mVar6 >> 4;
            monster[i]._myoff = monster[i]._mVar7 >> 4;
        }
        rv = 0;
    }
    if (monster[i]._uniqtype != 0)
        M_ChangeLightOffset(i);

    return rv;
}

int M_DoWalk2(int i)
{
    int rv;

    if (monster[i]._mVar8 == monster[i].MType->Anims[MA_WALK].Frames) {
        dung_map[monster[i]._mVar1][monster[i]._mVar2].dMonster = 0;
        if (monster[i]._uniqtype != 0)
            ChangeLightXY(monster[i].mlid, monster[i]._mx, monster[i]._my);
        M_StartStand(i, monster[i]._mdir);
        rv = 1;
    } else {
        if (monster[i]._mAnimCnt == 0) {
            monster[i]._mVar8++;
            monster[i]._mVar6 += monster[i]._mxvel;
            monster[i]._mVar7 += monster[i]._myvel;
            monster[i]._mxoff = monster[i]._mVar6 >> 4;
            monster[i]._myoff = monster[i]._mVar7 >> 4;
        }
        rv = 0;
    }
    if (monster[i]._uniqtype != 0)
        M_ChangeLightOffset(i);

    return rv;
}

int M_DoWalk3(int i)
{
    int rv;

    if (monster[i]._mVar8 == monster[i].MType->Anims[MA_WALK].Frames) {
        dung_map[monster[i]._mx][monster[i]._my].dMonster = 0;
        monster[i]._mx = monster[i]._mVar1;
        monster[i]._my = monster[i]._mVar2;
        dung_map[monster[i]._mVar4][monster[i]._mVar5].dFlags &= ~BFLAG_MONSTLR;
        dung_map[monster[i]._mx][monster[i]._my].dMonster = i + 1;
        if (monster[i]._uniqtype != 0)
            ChangeLightXY(monster[i].mlid, monster[i]._mx, monster[i]._my);
        M_StartStand(i, monster[i]._mdir);
        rv = 1;
    } else {
        if (monster[i]._mAnimCnt == 0) {
            monster[i]._mVar8++;
            monster[i]._mVar6 += monster[i]._mxvel;
            monster[i]._mVar7 += monster[i]._myvel;
            monster[i]._mxoff = monster[i]._mVar6 >> 4;
            monster[i]._myoff = monster[i]._mVar7 >> 4;
        }
        rv = 0;
    }
    if (monster[i]._uniqtype != 0)
        M_ChangeLightOffset(i);

    return rv;
}

/* OPEN: bytes near-miss (47 diffs, 104 vs 107 insns) -- logic fully verified against hellfire
 * (3 special-attack combos for Magma/Storm mtype ranges + the AI_SNAKE sound-before-attack quirk).
 * Caching mHit/mMinDamage/mMaxDamage into locals (needed since the oracle holds all 3 in saved
 * regs across the whole function) got the frame close but the specific s3/s4/s5 REGISTER
 * ASSIGNMENT still differs -- a coloring tie-break, not a logic issue. */
int M_DoAttack(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mHit = Monst->mHit;
    int mMinDamage = Monst->mMinDamage;
    int mMaxDamage = Monst->mMaxDamage;

    if (Monst->_mAnimFrame == Monst->MData->mAFNum) {
        M_TryH2HHit(i, Monst->_menemy, mHit, mMinDamage, mMaxDamage);
        if (Monst->_mAi != AI_SNAKE)
            PlayEffect(i, 0);
    }
    if (Monst->MType->mtype >= MT_NMAGMA && Monst->MType->mtype < MT_NMAGMA + 4
        && Monst->_mAnimFrame == 9) {
        M_TryH2HHit(i, Monst->_menemy, mHit + 10, mMinDamage - 2, mMaxDamage - 2);
        PlayEffect(i, 0);
    }
    if (Monst->MType->mtype >= MT_STORM && Monst->MType->mtype < MT_STORM + 4
        && Monst->_mAnimFrame == 13) {
        M_TryH2HHit(i, Monst->_menemy, mHit - 20, mMinDamage + 4, mMaxDamage + 4);
        PlayEffect(i, 0);
    }
    if (Monst->_mAi == AI_SNAKE && Monst->_mAnimFrame == 1)
        PlayEffect(i, 0);

    if (Monst->_mAnimFrame == Monst->_mAnimLen) {
        M_StartStand(i, Monst->_mdir);
        return 1;
    }
    return 0;
}

int M_DoRAttack(int i)
{
    int multimissiles;
    int mi;

    if (monster[i]._mAnimFrame == monster[i].MData->mAFNum) {
        if (monster[i]._mVar1 != -1) {
            if (monster[i]._mVar1 == MIT_CBOLT)
                multimissiles = 3;
            else
                multimissiles = 1;
            for (mi = 0; mi < multimissiles; mi++)
                AddMissile(monster[i]._mx, monster[i]._my, monster[i]._menemyx, monster[i]._menemyy,
                    monster[i]._mdir, monster[i]._mVar1, 1, i, monster[i]._mVar2, 0);
        }
        PlayEffect(i, 0);
    }
    if (monster[i]._mAnimFrame == monster[i]._mAnimLen) {
        M_StartStand(i, monster[i]._mdir);
        return 1;
    }
    return 0;
}

int M_DoRSpAttack(int i)
{
    if (monster[i]._mAnimFrame == monster[i].MData->mAFNum2 && !monster[i]._mAnimCnt) {
        AddMissile(monster[i]._mx, monster[i]._my, monster[i]._menemyx, monster[i]._menemyy,
            monster[i]._mdir, monster[i]._mVar1, 1, i, monster[i]._mVar3, 0);
        PlayEffect(i, 3);
    }

    if (monster[i]._mAi == AI_MEGA && monster[i]._mAnimFrame == 3) {
        if (!monster[i]._mVar2++)
            monster[i]._mFlags |= MFLAG_STILL;
        else if (monster[i]._mVar2 == 15)
            monster[i]._mFlags &= ~MFLAG_STILL;
    }

    if (monster[i]._mAnimFrame == monster[i]._mAnimLen) {
        M_StartStand(i, monster[i]._mdir);
        return 1;
    }
    return 0;
}

/* SYM OPEN: bytes PASS; retail's block tree has 2 nested levels (the DIABLO if-branch + a further
 * nested level inside it) that ours doesn't emit -- same family as M_SyncStartKill's block anomaly
 * (braced blocks with no declarations still get SYM levels in retail). Not resolved (time budget). */
int M_DoDeath(int i)
{
    MonsterStruct *pMonster = &monster[i];
    int _mx = pMonster->_mx;
    int _my = pMonster->_my;

    monster[i]._mVar1++;
    if (monster[i].MType->mtype == MT_DIABLO) {
        /* Retail's Diablo branch is a block with a local that the optimiser removed (SYM: a level
         * with no record); the original local is unknown. */
        int dummy;
        DiabloDieFlag = 1;
        ViewX += Sign(_mx - ViewX);
        ViewY += Sign(_my - ViewY);
        if (monster[i]._mVar1 == 140) {
            gbMaxPlayers = 1;
            PrepDoEnding(monster[i]._mVar8);
        }
    } else {
        if (monster[i]._mAnimFrame == monster[i]._mAnimLen) {
            if (monster[i].MType->mtype != MT_GOLEM)
                AddDead(_mx, _my, monster[i].MType->mdeadval, monster[i]._mdir);
            dung_map[_mx][_my].dMonster = 0;
            monster[i]._mDelFlag = 1;
            M_UpdateLeader(i);
        }
    }
    return 0;
}

/* OPEN: bytes near-miss (40 diffs, 131 vs 133 insns) -- logic transcribed directly from hellfire
 * (nested a/b search loop, InBounds unrolled to explicit 0<=y<98 etc bound checks matching the
 * DirOK/M_GetKnockback precedent).  Residual is register-init ORDER for the s3/s4/s6/s7 saved regs
 * (which zero-init happens first) -- not yet resolved (time budget). */
void M_Teleport(int i)
{
    MonsterStruct *Monst = &monster[i];
    unsigned char done = 0;
    int mulx, muly;
    int x, y;
    int a, b;
    int px, py;

    if (Monst->_mmode == MM_STONE)
        return;

    px = Monst->_menemyx;
    py = Monst->_menemyy;

    mulx = ENG_random(2) * 2 - 1;
    muly = ENG_random(2) * 2 - 1;
    for (a = -1; a <= 1 && !done; a++)
        for (b = -1; b < 1 && !done; b++)
            if (a || b) {
                x = px + a * mulx;
                y = py + b * muly;
                if (y >= 0 && y < 98 && x >= 0 && x < 98
                    && x != Monst->_mx && y != Monst->_my)
                    if (PosOkMonst(i, x, y))
                        done = 1;
            }
    if (done) {
        M_ClearSquares(i);
        dung_map[Monst->_mx][Monst->_my].dMonster = 0;
        dung_map[x][y].dMonster = i + 1;
        Monst->_moldx = x;
        Monst->_moldy = y;
        Monst->_mdir = M_GetDir(i);
        M_CheckEFlag(i);
    }
}

/* SYM OPEN: bytes PASS; retail's block tree is FLAT, ours nests (same family as M_SyncStartKill/
 * M_DoDeath/MAI_Garg's own if/else-if bodies with no declarations getting spurious SYM levels). */
void MAI_Garg(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mx, my;
    int md;

    mx = Monst->_mx - Monst->_lastx;
    my = Monst->_my - Monst->_lasty;
    md = M_GetDir(i);
    if (Monst->_msquelch && (Monst->_mFlags & MFLAG_STILL)) {
        M_Enemy(i);
        mx = Monst->_mx - Monst->_menemyx;
        my = Monst->_my - Monst->_menemyy;

        if (abs(mx) < (Monst->_mint + 2) && abs(my) < (Monst->_mint + 2))
            Monst->_mFlags &= ~MFLAG_STILL;
    } else if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        if (Monst->_mhitpoints < (Monst->_mmaxhp >> 1)) {
            Monst->_mgoal = MG_RUN_AWAY;
        }
        if (Monst->_mgoal == MG_RUN_AWAY) {
            if (abs(mx) < (Monst->_mint + 2) && abs(my) < (Monst->_mint + 2)) {
                if (!M_CallWalk(i, (md + 4) & 7))
                    Monst->_mgoal = MG_ATTACK;
            } else {
                Monst->_mgoal = MG_ATTACK;
                M_StartHeal(i);
            }
        }
        MAI_Round(i, 0);
    }
}

/* OPEN: bytes near-miss (74 diffs, 90==90 insns -- count exact) -- pure register-coloring (which
 * saved reg holds `i` -- $17 vs $19 -- and everything downstream that depends on it).  Declaration
 * order swap (Monst before/after mx,my,md) made no difference. */
void MAI_Warlord(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mx, my, md;

    if (Monst->_mmode == MM_STAND) {
        mx = Monst->_mx;
        my = Monst->_my;
        md = M_GetDir(i);
        if (dung_map[mx][my].dFlags & BFLAG_MONSTACTIVE) {
            mx = Monst->_mx - Monst->_menemyx;
            my = Monst->_my - Monst->_menemyy;
            if (Monst->mtalkmsg == TXT_WARLRD1 && Monst->_mgoal == MG_TALK) {
                Monst->_mmode = MM_TALK;
            }

            if (Monst->mtalkmsg == TXT_WARLRD1 && !effect_is_playing(USFX_WARLRD1) && Monst->_mgoal == MG_WAITTOTALK) {
                Monst->_mgoal = MG_ATTACK;
                Monst->_msquelch = 255;
                Monst->mtalkmsg = 0;
            }
        }
        if (Monst->_mgoal == MG_ATTACK) {
            MAI_SkelSd(i);
        }
        monster[i]._mdir = md;
        if (Monst->_mmode == MM_STAND || Monst->_mmode == MM_TALK)
            Monst->Action = MA_STAND;
    }
}

void MAI_RoundRanged(int i, int missile_type, unsigned char checkdoors, int dam, unsigned char lessmissiles)
{
    int fx, fy, mx, my, md, v, pnum;
    int dist;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        pnum = Monst->_menemy;
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = Monst->_mx - fx;
        my = Monst->_my - fy;
        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);

        if (checkdoors && Monst->_msquelch < 255)
            MonstCheckDoors(i);

        v = ENG_random(10000);
        if (abs(mx) < 2 && abs(my) < 2
            || Monst->_msquelch != 255
            || dung_map[Monst->_mx][Monst->_my].dTransVal != dung_map[fx][fy].dTransVal) {
            Monst->_mgoal = MG_ATTACK;
        } else if (Monst->_mgoal == MG_WALK_AROUND1
            || (!(abs(mx) < 3 && abs(my) < 3) && !ENG_random(4 << lessmissiles))) {
            if (Monst->_mgoal != MG_WALK_AROUND1) {
                Monst->_mgoalvar1 = 0;
                Monst->_mgoalvar2 = ENG_random(2);
            }

            Monst->_mgoal = MG_WALK_AROUND1;

            dist = abs(mx) > abs(my) ? abs(mx) : abs(my);

            if (Monst->_mgoalvar1++ >= (dist << 1) && DirOK(i, md)) {
                Monst->_mgoal = MG_ATTACK;
            } else if (v < (500 + 500 * Monst->_mint) >> lessmissiles
                && LineClear(Monst->_mx, Monst->_my, fx, fy)) {
                M_StartRSpAttack(i, missile_type, dam);
            } else
                M_RoundWalk(i, md, Monst->_mgoalvar2);
        }
        if (Monst->_mgoal == MG_ATTACK) {
            if (((!(abs(mx) < 3 && abs(my) < 3) && v < (1000 + 500 * Monst->_mint) >> lessmissiles)
                || v < (500 + 500 * Monst->_mint) >> lessmissiles)
                && LineClear(Monst->_mx, Monst->_my, fx, fy)) {
                M_StartRSpAttack(i, missile_type, dam);
            } else if (abs(mx) < 2 && abs(my) < 2) {
                if (v < 6000 + 1000 * Monst->_mint) {
                    Monst->_mdir = md;
                    M_StartAttack(i);
                }
            } else if ((v = ENG_random(100)) < (5000 + 1000 * Monst->_mint)
                || ((Monst->_mVar1 == MM_WALK || Monst->_mVar1 == MM_WALK2 || Monst->_mVar1 == MM_WALK3)
                    && Monst->_mVar2 == 0 && v < (8000 + 1000 * Monst->_mint))) {
                M_CallWalk(i, md);
            }
        }

        if (Monst->_mmode == MM_STAND)
            M_StartDelay(i, ENG_random(10) + 5);
    }
}

/* OPEN: bytes near-miss (129 diffs, 254 vs 247 insns) -- logic transcribed from hellfire with 2
 * confirmed PSX simplifications read off the raw oracle: (1) the `dLight[mx][my]!=lightmax`
 * visibility guard at the top is ABSENT entirely (PSX runs the whole AI unconditionally once
 * mmode==MM_STAND); (2) the MG_RUN_AWAY check drops hellfire's `&& !(_mFlags&MFLAG_NOENEMY)`
 * term.  Residual is mostly register-letter noise (s4 vs s5 for `i8) -- declaration-order swap
 * (dist before/after Monst) made no difference. */
void MAI_Sneak(int i)
{
    int mx, my, md, v;
    int dist;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND) {
        mx = Monst->_mx - Monst->_menemyx;
        my = Monst->_my - Monst->_menemyy;
        md = M_GetDir(i);

        dist = 5 - Monst->_mint;

        if (Monst->_mVar1 == MM_GOTHIT) {
            Monst->_mgoal = MG_RUN_AWAY;
            Monst->_mgoalvar1 = 0;
        } else if (!(abs(mx) < dist + 3 && abs(my) < dist + 3) || Monst->_mgoalvar1 > 8) {
            Monst->_mgoal = MG_ATTACK;
            Monst->_mgoalvar1 = 0;
        }

        if (Monst->_mgoal == MG_RUN_AWAY) {
            if (Monst->_mFlags & MFLAG_TARGETS_MONSTER) {
                md = GetDirection(Monst->_mx, Monst->_my,
                    monster[Monst->_menemy]._mx, monster[Monst->_menemy]._my);
            } else {
                md = GetDirection(Monst->_mx, Monst->_my,
                    plr[Monst->_menemy]._pownerx, plr[Monst->_menemy]._pownery);
            }
            md = (md + 4) & 7;
            if (Monst->MType->mtype == MT_UNSEEN) {
                if (ENG_random(2))
                    md = (md - 1) & 7;
                else
                    md = (md + 1) & 7;
            }
        }

        Monst->_mdir = md;

        v = ENG_random(100);
        if (abs(mx) < dist && (Monst->_mFlags & MFLAG_HIDDEN))
            M_StartFadein(i, md, 0);
        else if (!(abs(mx) < dist + 1 && abs(my) < dist + 1) && !(Monst->_mFlags & MFLAG_HIDDEN))
            M_StartFadeout(i, md, 1);
        else if (Monst->_mgoal == MG_RUN_AWAY
            || (abs(mx) < 2 && abs(my) < 2
                && ((Monst->_mVar2 > 20 && v < (14 + 4 * Monst->_mint))
                    || ((Monst->_mVar1 == MM_WALK || Monst->_mVar1 == MM_WALK2 || Monst->_mVar1 == MM_WALK3)
                        && Monst->_mVar2 == 0 && v < (64 + 4 * Monst->_mint))))) {
            Monst->_mgoalvar1++;
            M_CallWalk(i, md);
        }
        if (Monst->_mmode == MM_STAND) {
            if (abs(mx) < 2 && abs(my) < 2 && v < (10 + 4 * Monst->_mint)) {
                M_StartAttack(i);
            } else {
                Monst->Action = MA_STAND;
            }
        }
    }
}

void MAI_Fireman(int i)
{
    int mx, my, md, v, pnum;
    int fx, fy;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        pnum = Monst->_menemy;
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = Monst->_mx - fx;
        my = Monst->_my - fy;
        md = M_GetDir(i);

        if (Monst->_mgoal == MG_ATTACK) {
            if (LineClear(Monst->_mx, Monst->_my, fx, fy)) {
                if (AddMissile(Monst->_mx, Monst->_my, fx, fy, md, MIT_FIREMAN, pnum, i, 0, 0) != -1) {
                    Monst->_mmode = MM_MISSILE;
                    Monst->_mgoal = MG_ATTACK2;
                    Monst->_mgoalvar1 = 0;
                }
            }
        } else if (Monst->_mgoal == MG_ATTACK2) {
            if (Monst->_mgoalvar1 == 3) {
                Monst->_mgoal = MG_ATTACK;
                M_StartFadeout(i, md, 1);
            } else if (LineClear(Monst->_mx, Monst->_my, fx, fy)) {
                M_StartRAttack(i, MIT_KRULL, 4);
                Monst->_mgoalvar1++;
            } else {
                M_StartDelay(i, ENG_random(10) + 5);
                Monst->_mgoalvar1++;
            }
        } else if (Monst->_mgoal == MG_RUN_AWAY) {
            M_StartFadein(i, md, 0);
            Monst->_mgoal = MG_ATTACK2;
        }

        Monst->_mdir = md;

        v = ENG_random(100);

        if (Monst->_mmode == MM_STAND) {
            if (abs(mx) < 2 && abs(my) < 2 && Monst->_mgoal == MG_ATTACK) {
                M_TryH2HHit(i, monster[i]._menemy, monster[i].mHit, monster[i].mMinDamage, monster[i].mMaxDamage);
                Monst->_mgoal = MG_RUN_AWAY;
                if (!M_CallWalk(i, (md + 4) & 7)) {
                    M_StartFadein(i, md, 0);
                    Monst->_mgoal = MG_ATTACK2;
                }
            } else {
                if (!M_CallWalk(i, md)) {
                    if (Monst->_mgoal == MG_ATTACK || Monst->_mgoal == MG_RUN_AWAY) {
                        M_StartFadein(i, md, 0);
                        Monst->_mgoal = MG_ATTACK2;
                    }
                }
            }
        }
    }
}

/* OPEN: bytes near-miss (165 diffs, 298 vs 295 insns) -- logic transcribed from hellfire; the
 * `D_8011C2C0[]` static rodata table (values {1,52,7,6} read directly from the ROM image at
 * 0x8011C2C0) confirmed as `counsmiss[] = {MIT_FIREBOLT,MIT_CBOLT,MIT_LIGHTCTRL,MIT_FIREBALL}`.
 * Residual is the base-pointer-cache lever not fully landing (oracle keeps &monster[i] in a saved
 * reg the whole function, ours spills to stack in places) -- not chased further (time budget). */
void MAI_Counselor(int i)
{
    int fx, fy, mx, my, md, v;
    int dist;
    MonsterStruct *Monst = &monster[i];
    static const unsigned char counsmiss[4] = { MIT_FIREBOLT, MIT_CBOLT, MIT_LIGHTCTRL, MIT_FIREBALL };

    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = Monst->_mx - fx;
        my = Monst->_my - fy;
        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);

        if (Monst->_msquelch < 255)
            MonstCheckDoors(i);

        v = ENG_random(100);
        if (Monst->_mgoal == MG_RUN_AWAY) {
            if (Monst->_mgoalvar1++ > 3) {
                Monst->_mgoal = MG_ATTACK;
                M_StartFadein(i, md, 1);
            } else
                M_CallWalk(i, (md + 4) & 7);
        } else if (Monst->_mgoal == MG_WALK_AROUND1) {
            dist = abs(mx) > abs(my) ? abs(mx) : abs(my);

            if (abs(mx) < 2 && abs(my) < 2
                || Monst->_msquelch != 255
                || dung_map[Monst->_mx][Monst->_my].dTransVal != dung_map[fx][fy].dTransVal) {
                Monst->_mgoal = MG_ATTACK;
                M_StartFadein(i, md, 1);
            } else if (Monst->_mgoalvar1++ >= (dist << 1) && DirOK(i, md)) {
                Monst->_mgoal = MG_ATTACK;
                M_StartFadein(i, md, 1);
            } else
                M_RoundWalk(i, md, Monst->_mgoalvar2);
        } else if (Monst->_mgoal == MG_ATTACK) {
            if (abs(mx) < 2 && abs(my) < 2) {
                Monst->_mdir = md;
                if (Monst->_mhitpoints < (Monst->_mmaxhp >> 1)) {
                    Monst->_mgoal = MG_RUN_AWAY;
                    Monst->_mgoalvar1 = 0;
                    M_StartFadeout(i, md, 0);
                } else if (Monst->_mVar1 == MM_DELAY || ENG_random(100) < 20 + 2 * Monst->_mint) {
                    M_StartRAttack(i, -1, 0);
                    AddMissile(monster[i]._mx, monster[i]._my, 0, 0, monster[i]._mdir, MIT_FLASH, 1, i, 4, 0);
                    AddMissile(monster[i]._mx, monster[i]._my, 0, 0, monster[i]._mdir, MIT_FLASH2, 1, i, 4, 0);
                } else
                    M_StartDelay(i, ENG_random(10) + 10 - 2 * Monst->_mint);
            } else if (v < 50 + 5 * Monst->_mint
                && LineClear(Monst->_mx, Monst->_my, fx, fy)) {
                M_StartRAttack(i, counsmiss[Monst->_mint], ENG_random(Monst->mMaxDamage - Monst->mMinDamage + 1) + Monst->mMinDamage);
            } else if (ENG_random(100) < 30) {
                Monst->_mgoal = MG_WALK_AROUND1;
                Monst->_mgoalvar1 = 0;
                M_StartFadeout(i, md, 0);
            } else
                M_StartDelay(i, ENG_random(10) + 10 - 2 * Monst->_mint);
        }

        if (Monst->_mmode == MM_STAND)
            M_StartDelay(i, ENG_random(10) + 5);
    }
}

/* OPEN: bytes near-miss (56 diffs, 129 vs 127 insns) -- logic verified against hellfire exactly
 * (TXT_ZHAR1=0x94, TXT_ZHAR2=0x95, USFX_ZHAR2=0x35B all confirmed from the raw oracle constants).
 * Residual is register-coloring noise (s3 vs s4 for `i`). */
void MAI_Zhar(int i)
{
    int mx, my, md, dist;
    MonsterStruct *Monst = &monster[i];

    if (Monst->_mmode == MM_STAND) {
        mx = Monst->_mx;
        my = Monst->_my;
        md = M_GetDir(i);
        if (Monst->mtalkmsg == TXT_ZHAR1 && !(dung_map[mx][my].dFlags & BFLAG_MONSTACTIVE) && Monst->_mgoal == MG_WAITTOTALK) {
            Monst->mtalkmsg++;
            Monst->_mgoal = MG_TALK;
        }
        if (dung_map[mx][my].dFlags & BFLAG_MONSTACTIVE) {
            mx = Monst->_mx - Monst->_menemyx;
            my = Monst->_my - Monst->_menemyy;
            dist = abs(mx) > abs(my) ? abs(mx) : abs(my);
            if (Monst->mtalkmsg == TXT_ZHAR2 && !effect_is_playing(USFX_ZHAR2) && Monst->_mgoal == MG_WAITTOTALK) {
                Monst->_mgoal = MG_ATTACK;
                Monst->_msquelch = 255;
                Monst->mtalkmsg = 0;
            }
        }
        if (Monst->_mgoal == MG_ATTACK || Monst->_mgoal == MG_RUN_AWAY || Monst->_mgoal == MG_WALK_AROUND1) {
            MAI_Counselor(i);
        }
        monster[i]._mdir = md;
        if (Monst->_mmode == MM_STAND)
            Monst->Action = MA_STAND;
    }
}

/* OPEN: bytes far-miss (128 diffs, 185 vs 199 insns -- 14 insns short, likely missing/misordered
 * logic).  Confirmed against the RAW ORACLE (not hellfire, which #if-0's most of this out; used
 * devilution's non-HELLFIRE branch as the base twin instead): Q_GARBUD=2/UMT_GARBUD=0 unique-item
 * check, `SetRndSeed(ENG_random(GetRndSeed()))` (a PSX-specific re-seed, NOT `SetRndSeed(_mRndSeed)`
 * -- MonsterStruct has no such field), a `stream_stop()` call gated on `_uniqtype!=0` with no
 * devilution equivalent, and `if (i>=4) { _mxoff=0; _myoff=0; }`.  Register layout differs
 * substantially from what's written here (a1/a2 mapping, frame size) suggesting a real ordering or
 * missing-statement gap, not just coloring -- needs a full re-derivation pass, not attempted further
 * this session (time budget). */
void MonstStartKill(int i, int pnum, unsigned char sendmsg)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx, _my;

    if (pnum >= 0)
        Monst->mWhoHit = 1 << pnum;
    if (pnum < 2 && i > 2)
        AddPlrMonstExper(Monst->mLevel, Monst->mExp, Monst->mWhoHit);
    monstkills[Monst->MType->mtype]++;
    Monst->_mhitpoints = 0;
    RemoveStoneMissiles(i, Monst->_mx, Monst->_my);
    SetRndSeed(ENG_random(GetRndSeed()));
    if (QuestStatus(Q_GARBUD) && Monst->mName == UniqMonst[UMT_GARBUD].mName) {
        CreateTypeItem(Monst->_mx + 1, Monst->_my + 1, 1, ITYPE_MACE, IMISC_NONE, 1, 0);
    } else if (i > 1) {
        SpawnItem(i, Monst->_mx, Monst->_my, sendmsg);
    }

    if (Monst->_uniqtype != 0)
        stream_stop();

    if (Monst->MType->mtype == MT_DIABLO)
        M_DiabloDeath(i, 1, pnum);
    else
        PlayEffect(i, 2);

    if (pnum >= 0)
        md = M_GetDir(i);
    else
        md = Monst->_mdir;
    Monst->_mdir = md;
    NewMonsterAnim(i, Monst->MType->Anims[MA_DEATH], md, MA_DEATH);
    Monst->_mmode = MM_DEATH;
    if (i >= 4) {
        Monst->_mxoff = 0;
        Monst->_myoff = 0;
    }
    _mx = Monst->_moldx;
    _my = Monst->_moldy;
    Monst->_mVar1 = 0;
    Monst->_mx = _mx;
    Monst->_my = _my;
    Monst->_mfutx = _mx;
    Monst->_mfuty = _my;
    Monst->_moldx = _mx;
    Monst->_moldy = _my;
    M_CheckEFlag(i);
    M_ClearSquares(i);
    dung_map[_mx][_my].dMonster = i + 1;
    CheckQuestKill(i, sendmsg);
    M_FallenFear(_mx, _my);
    if (Monst->MType->mtype - MT_NACID < 4)
        AddMissile(_mx, _my, 0, 0, 0, MIT_ACIDPUD, 1, i, Monst->_mint + 1, 0);
}

unsigned char LineClearF(unsigned char (*Clear)(int, int), int x1, int y1, int x2, int y2)
{
    int dx, dy;
    int d;
    int dincH;
    int dincD;
    int xincD, yincD;
    int xorg, yorg;
    unsigned char done = 0;
    int tmp;

    xorg = x1;
    yorg = y1;

    dx = x2 - x1;
    dy = y2 - y1;
    if (abs(dx) > abs(dy)) {
        if (dx < 0) {
            tmp = x1;
            x1 = x2;
            x2 = tmp;
            tmp = y1;
            y1 = y2;
            y2 = tmp;

            dx = -dx;
            dy = -dy;
        }
        if (dy > 0) {
            d = 2 * dy - dx;
            dincH = 2 * dy;
            dincD = 2 * (dy - dx);
            yincD = 1;
        } else {
            d = 2 * dy + dx;
            dincH = 2 * dy;
            dincD = 2 * (dy + dx);
            yincD = -1;
        }

        while (!done && !(x1 == x2 && y1 == y2)) {
            if ((d <= 0) ^ (yincD < 0)) {
                d += dincH;
            } else {
                d += dincD;
                y1 += yincD;
            }
            x1++;
            done = (x1 != xorg || y1 != yorg) && !(*Clear)(x1, y1);
        }
    } else {
        if (dy < 0) {
            tmp = y1;
            y1 = y2;
            y2 = tmp;
            tmp = x1;
            x1 = x2;
            x2 = tmp;

            dy = -dy;
            dx = -dx;
        }
        if (dx > 0) {
            d = 2 * dx - dy;
            dincH = 2 * dx;
            dincD = 2 * (dx - dy);
            xincD = 1;
        } else {
            d = 2 * dx + dy;
            dincH = 2 * dx;
            dincD = 2 * (dx + dy);
            xincD = -1;
        }

        while (!done && !(y1 == y2 && x1 == x2)) {
            if ((d <= 0) ^ (xincD < 0)) {
                d += dincH;
            } else {
                d += dincD;
                x1 += xincD;
            }
            y1++;
            done = (y1 != yorg || x1 != xorg) && !(*Clear)(x1, y1);
        }
    }

    return x1 == x2 && y1 == y2;
}

unsigned char LineClearF1(unsigned char (*Clear)(int, int, int), int monst, int x1, int y1, int x2, int y2)
{
    int dx, dy;
    int d;
    int dincH;
    int dincD;
    int xincD, yincD;
    int xorg, yorg;
    unsigned char done = 0;
    int tmp;

    xorg = x1;
    yorg = y1;

    dx = x2 - x1;
    dy = y2 - y1;
    if (abs(dx) > abs(dy)) {
        if (dx < 0) {
            tmp = x1;
            x1 = x2;
            x2 = tmp;
            tmp = y1;
            y1 = y2;
            y2 = tmp;

            dx = -dx;
            dy = -dy;
        }
        if (dy > 0) {
            d = 2 * dy - dx;
            dincH = 2 * dy;
            dincD = 2 * (dy - dx);
            yincD = 1;
        } else {
            d = 2 * dy + dx;
            dincH = 2 * dy;
            dincD = 2 * (dy + dx);
            yincD = -1;
        }

        while (!done && !(x1 == x2 && y1 == y2)) {
            if ((d <= 0) ^ (yincD < 0)) {
                d += dincH;
            } else {
                d += dincD;
                y1 += yincD;
            }
            x1++;
            done = (x1 != xorg || y1 != yorg) && !Clear(monst, x1, y1);
        }
    } else {
        if (dy < 0) {
            tmp = y1;
            y1 = y2;
            y2 = tmp;
            tmp = x1;
            x1 = x2;
            x2 = tmp;

            dy = -dy;
            dx = -dx;
        }
        if (dx > 0) {
            d = 2 * dx - dy;
            dincH = 2 * dx;
            dincD = 2 * (dx - dy);
            xincD = 1;
        } else {
            d = 2 * dx + dy;
            dincH = 2 * dx;
            dincD = 2 * (dx + dy);
            xincD = -1;
        }

        while (!done && !(y1 == y2 && x1 == x2)) {
            if ((d <= 0) ^ (xincD < 0)) {
                d += dincH;
            } else {
                d += dincD;
                x1 += xincD;
            }
            y1++;
            done = (y1 != yorg || x1 != xorg) && !Clear(monst, x1, y1);
        }
    }

    return x1 == x2 && y1 == y2;
}

void TalktoMonster(int i)
{
    int pnum, itm;
    MonsterStruct *Monst = &monster[i];
    pnum = Monst->_menemy;

    if (Monst->_mmode == MM_TALK)
        return;
    Monst->_mmode = MM_TALK;

    if (Monst->_mAi != AI_SNOTSPIL && Monst->_mAi != AI_LACHDANAN)
        return;

    if (QuestStatus(Q_LTBANNER)) {
        if (quests[Q_LTBANNER]._qvar1 == 2 && PlrHasItem(pnum, IDI_BANNER, &itm)) {
            RemoveInvItem(pnum, itm);
            quests[Q_LTBANNER]._qactive = 3;
            Monst->mtalkmsg = TXT_BOL3;
            Monst->_mgoal = MG_TALK;
            NetSendCmdQuest(1, Q_LTBANNER);
        }
    }
    if (QuestStatus(Q_VEIL)) {
        if (Monst->mtalkmsg >= TXT_VEIL1 && PlrHasItem(pnum, IDI_GLDNELIX, &itm)) {
            RemoveInvItem(pnum, itm);
            Monst->mtalkmsg = TXT_VEIL3;
            Monst->_mgoal = MG_TALK;
        }
    }
}
