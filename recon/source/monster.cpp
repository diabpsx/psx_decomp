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
#define MT_COUNSLR  0x69
#define MT_ADVOCATE 0x6C

/* AI ids */
#define AI_GARG     12
#define AI_LAZURUS  28

/* monster modes */
#define MA_STAND   0
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
#define MM_DEATH   6
#define MM_RSATTACK 12
#define MM_HEAL    0x10

#define MGOAL_NORMAL    1
#define CMD_MONSTDEATH 0x24
#define CMD_KILLGOLEM  0x57
#define MGOAL_INQUIRING 6
#define MGOAL_TALKING   7

#define MFLAG_HIDDEN          0x01
#define MFLAG_LOCK_ANIMATION  0x02
#define MFLAG_ALLOW_SPECIAL   0x04
#define MFLAG_NOHEAL          0x08

#define MT_INCIN    0x48
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
    if (monster[i]._mVar2-- == 0) {
        int tmp = monster[i]._mAnimFrame;
        M_StartStand(i, monster[i]._mdir);
        monster[i]._mAnimFrame = tmp;
        return 1;
    }
    return 0;
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
