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
#define MT_NSCAV    0x10
#define MT_YSCAV    0x13
#define MT_SNEAK    0x1D
#define MT_ILLWEAV  0x20
#define MT_BLINK    0x27
#define MT_SKING    0x32
#define MT_CLEAVER  0x33
#define MT_COUNSLR  0x69
#define MT_ADVOCATE 0x6C

/* object types (door pairs, retail values) */
#define OBJ_L1DOORL 1
#define OBJ_L1DOORR 2
#define OBJ_L2DOORL 42
#define OBJ_L2DOORR 43
#define OBJ_L3DOORL 74
#define OBJ_L3DOORR 75

#define IMMUNE_FIRE 0x10
#define RESIST_MAGIC     0x01
#define RESIST_FIRE      0x02
#define RESIST_LIGHTNING 0x04
#define IMMUNE_MAGIC     0x08
#define IMMUNE_LIGHTNING 0x20
#define D_HELL 2

/* AI ids */
#define AI_GARG     12
#define PACK_MEMBER   1
#define PACK_NOMEMBER 2
#define UN_STICK      0x0002
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
#define MM_SPSTAND  11
#define RUN_DONE    0
#define USFX_CLEAVER 0x349
#define MFLAG_BACKWARDS 0x02
#define MM_HEAL    0x10

#define MGOAL_NORMAL    1
#define CMD_MONSTDEATH 0x24
#define WALKMODE(m) ((m) == MM_WALK || (m) == MM_WALK2 || (m) == MM_WALK3)
#define Mod(val, x) ((val) < 0 ? (val) + (x) : (val) >= (x) ? (val) - (x) : (val))
#define MS_ATTACK   0
#define MS_SATTACK  3
#define MG_EAT      3
#define MAXDUNX     98
#define MAXDUNY     98
#define InBounds(x, y) (0 <= (y) && (y) < MAXDUNY && 0 <= (x) && (x) < MAXDUNX)
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
#define TXT_BOL1    0x14
#define TXT_BOL2    0x15
#define TXT_BOL3    0x16
#define USFX_SNOT3  0x357
#define TXT_VB1     0x23
#define USFX_LAZ1   0x352
#define TXT_VEIL1   0x51
#define TXT_VEIL3   0x53
#define TXT_WARLRD1 0x6E
#define TXT_ZHAR1   0x94
#define TXT_ZHAR2   0x95
#define QUEST_DONE  3
#define Q_DIABLO    5
#define USFX_DIABLOD 0x35C
#define USFX_LACH3  0x351
#define TXT_GARB1   0x90
#define TXT_GARB2   0x91
#define Q_ZHAR      3
#define UMT_ZHAR    2
#define MFLAG_DROP  0x40
#define TXT_GARB4   0x93
#define USFX_GARBUD4 0x34D
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
#define MFLAG_MKILLER         0x20
#define MFLAG_KNOCKBACK       0x80
#define MFLAG_NOLIFESTEAL     0x1000

#define MT_GLOOM    0x28
#define MT_FAMILIAR 0x29
#define MT_INCIN    0x48
#define MT_NMAGMA   0x3C
#define MT_STORM    0x4C
#define MT_UNSEEN   0x1F
#define MT_HELLBURN 0x4B
#define MT_NSNAKE   0x59
#define MT_GSNAKE   0x5C

#define PC_WARRIOR  0
#define PC_SORCERER 2

#define BFLAG_MONSTLR 0x10
#define BFLAG_MONSTACTIVE 0x4

#define MAXMONSTERS 190

/* TU-owned small data (.sdata, gp-relative in retail) */
long nummonsters;
int nummtypes;

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

void PrepDoEnding(int pnum)
{
    gbDoEnding = pnum + 1;
    gbRunGame = 0;
    deathflag = 0;

    plr[myplr].pDiabloKillLevel =
        plr[myplr].pDiabloKillLevel > gnDifficulty + 1UL
            ? plr[myplr].pDiabloKillLevel
            : gnDifficulty + 1UL;

    for (int i = 0; i < 2; i++) {
        plr[i]._pmode = PM_QUIT;
        plr[i]._pInvincible = 1;
        if (gbMaxPlayers > 1) {
            if (plr[i]._pHitPoints >> 6 == 0)
                plr[i]._pHitPoints = 64;
            if (plr[i]._pMana >> 6 == 0)
                plr[i]._pMana = 64;
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
#define MIT_FIREWALL     0x5
#define MIT_FIREMAN      0x32
#define MIT_KRULL        0x33
#define MIT_FIREBOLT     1
#define MIT_LIGHTCTRL    7
#define MIT_FIREBALL     6
#define MIT_FLASH        0xB
#define MIT_FLASH2       0xC
#define MIT_ACIDPUD      0x3B
#define MIT_RHINO        0x14
#define MIT_LIGHTNING    0x8
#define MI_ENEMYPLR      1
#define TARGET_PLAYERS   1
#define PM_GOTHIT   7
#define PM_DEATH    8

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

/* PASS+SYM. fx/fy are `long` (SYM) with devilution's signed `< 0 || >= 98` bounds test (gcc folds
 * each pair into one sltiu); the N/S corner checks are two separate `if (SolidLoc) return 0;`
 * statements, whose identical tails gcc cross-jumps with the E/W dFlags test. */
unsigned char DirOK(int i, int mdir)
{
    long fx = monster[i]._mx + offset_x[mdir];
    long fy = monster[i]._my + offset_y[mdir];

    if (fy < 0 || fy >= 98 || fx < 0 || fx >= 98)
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
        if (SolidLoc(fx + 1, fy))
            return 0;
        if (SolidLoc(fx, fy + 1))
            return 0;
    } else if (mdir == DIR_S) {
        if (SolidLoc(fx - 1, fy))
            return 0;
        if (SolidLoc(fx, fy - 1))
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
        if (res & 7)
            strcpy(tempstr, GetStr(0x3E7));
        else
            strcpy(tempstr, GetStr(0x2D2));
        AddPanelString(tempstr, 1);
        if (res & 0x38)
            strcpy(tempstr, GetStr(0x3E6));
        else
            strcpy(tempstr, GetStr(0x2CD));
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

/* PSX adds the Diablo-Apocalypse light effect before entering ranged-special mode. */
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
        SetLightFX(_mx, _my, 0xA00, 0xA00, 0xA00, 0x40, 0x40, 0x40);

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

/* PASS+SYM. `pmonster` is a pointer-to-CONST: loads through it are RTX_UNCHANGING, so sched2
 * drops their memory dependence on the prologue's stack saves and hoists the `_mx` load (plus
 * its s-reg save) above `sw ra` -- the 4-diff prologue residual shared with the MAI_* talkers. */
void M_StartKill(int i, int pnum)
{
    const MonsterStruct *pmonster;
    int _mx, _my;

    pmonster = monster;
    pmonster += i;
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

/* PASS+SYM (see end of note) -- fully derived from the raw oracle (NOT
 * from hellfire, whose M_StartWalk2/M_StartWalk3 calls don't exist on PSX -- confirmed all 8
 * switch-case bodies + the case LAYOUT ORDER from the jump table bytes at 0x8011A310: N,NE,E,SE,
 * S,SW,W,NW, matching hellfire's switch source order even though the case VALUES are the DIR_
 * enum).  Getting the case order right (ascending 0..7 instead of the jump-table's physical N-first
 * order) alone took the diff from "far miss" to this near-miss.  PASS+SYM once DIR_NW's yvel was
 * fixed to -MWVel[mwi][0] (a real sign bug; the cross-jumped `negu a1; negu a2` tail shows it). */
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
        M_StartWalk(i, -MWVel[mwi][1], -MWVel[mwi][0], -1, 0, DIR_NW);
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

/* PASS+SYM: const-view _mx/_my read (see MAI_Lachdanan) fixes the prologue
 * order; the MAI_Succ dispatch is an if/else with `_mdir = md` in the else
 * (as in MAI_Garbud), which keeps md out of a callee-saved reg. */
void MAI_Lazhelp(int i)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx;
    int _my;

    _mx = ((const MonsterStruct *)Monst)->_mx;
    _my = ((const MonsterStruct *)Monst)->_my;
    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);
        if (dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) {
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
        } else {
            monster[i]._mdir = md;
        }
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

/* PASS+SYM. Logic from hellfire (nested a/b search loop, InBounds unrolled to explicit bound
 * checks). PSX zero-inits y then x up front (retail line 1955; the s7/s3 zeroing in the prologue). */
void M_Teleport(int i)
{
    MonsterStruct *Monst = &monster[i];
    unsigned char done = 0;
    int mulx, muly;
    int x, y;
    int a, b;
    int px, py;

    y = 0;
    x = 0;

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

/* PASS+SYM. Locals per retail SYM (md, Monst, _mx, _my); _mx/_my cached at the top through the
 * const view (see MAI_Lachdanan). Retail's nested SYM block chain is g++'s binding levels kept alive
 * by a declaration in the innermost scope -- reproduced with a block-scope effect_is_playing
 * declaration (retail evidently called it undeclared here, as MAI_SnotSpil does ObjChangeMap). */
void MAI_Warlord(int i)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx, _my;

    _mx = ((const MonsterStruct *)Monst)->_mx;
    _my = ((const MonsterStruct *)Monst)->_my;
    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);
        if (dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) {
            unsigned char effect_is_playing(int nSFX);
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

/* OPEN: bytes near-miss (108 diffs, ours 247 / oracle 247 insns -- LENGTH EXACT). Logic transcribed
 * from hellfire with confirmed PSX simplifications read off the raw oracle: (1) the
 * `dLight[mx][my]!=lightmax` visibility guard at the top is ABSENT entirely (PSX runs the whole AI
 * unconditionally once mmode==MM_STAND); (2) the MG_RUN_AWAY check drops hellfire's
 * `&& !(_mFlags&MFLAG_NOENEMY)` term.
 * THREE REAL BUGS found+fixed across two passes, all confirmed byte-for-byte against the raw oracle
 * disasm (asm/nonmatchings/monster/MAI_Sneak__Fi.s):
 * (a) callaudit.py flagged a call-ORDER mismatch (17 calls vs retail's 18) -- the fadein guard
 *     `abs(mx) < dist && (flags&MFLAG_HIDDEN)` was missing the DIST-macro's second half
 *     (hellfire's `DIST(mx,my,dist)` = `abs(mx)<d && abs(my)<d`, MISSILES.CPP:1952) -- fixed to
 *     `abs(mx) < dist && abs(my) < dist && (...)`. callaudit now reports 0 mismatches tree-wide.
 * (b) the MG_RUN_AWAY block's GetDirection call was structured as a two-way branch (monster-coords
 *     vs player-coords) copied from hellfire's `if(MFLAG_MID) monster-pos else player-pos`, but the
 *     raw oracle only has ONE conditional call -- when `_mFlags & MFLAG_TARGETS_MONSTER` (PSX's name
 *     for the same 0x10 bit) is SET, it calls GetDirection with PLAYER coords only (`Monst->_mx,
 *     Monst->_my, plr[_menemy]._pownerx, plr[_menemy]._pownery`); when CLEAR, `md` keeps its prior
 *     value (from `M_GetDir(i)` at the top) with NO call at all -- fixed by dropping the
 *     monster-coords branch entirely (confirmed against both the raw bytes and the JAP Ghidra
 *     decompile at this exact VA, which shows the identical single-branch shape). (a)+(b) cut
 *     131->113 diffs and 260->244 insns (was 13 OVER length, then 3 short).
 * (c) a genuine POLARITY BUG in the walk-approach condition: `_mgoal==MG_RUN_AWAY || (abs(mx)<2 &&
 *     abs(my)<2 && (COND1||COND2))` had `abs(mx)<2 && abs(my)<2` (DIST/close) where the raw oracle
 *     requires the OPPOSITE -- traced the control flow label-by-label (L80150D0C: `_mgoal==RUN_AWAY`
 *     jumps straight to the CallWalk site; else computes `bVar1 = abs(mx)>=2 || abs(my)>=2` i.e.
 *     `!DIST(mx,my,2)`, then `beqz s1,.L80150DE4` -- when s1==0 (DIST/close true) it SKIPS the walk
 *     entirely, going straight to the final attack-check; only the FAR case falls through to test
 *     COND1/COND2) -- fixed to `!(abs(mx)<2 && abs(my)<2) && (...)`. This closed the length gap
 *     exactly: 244->247 insns (now byte-count EXACT), 113->108 diffs.
 * Residual (108 diffs, length now EXACT): a whole-function register-coloring swap -- retail assigns
 * `i`'s transient home (before `Monst` is computed) to $s5 exactly where SYM says `i` permanently
 * lives; ours puts it in $s4 (the register `mx` will later use), cascading an s4<->s5 / s6<->fp swap
 * through the whole body (content-identical instructions, different register letters throughout,
 * confirmed via symlane: ours has `i` on physical reg $20/s4, retail on $21/s5). FALSIFIED:
 * swapping `dist`/`Monst` declaration order to match SYM's local-record order (i,mx,my,md,v,Monst,
 * dist) -- no byte change, both before and after fix (c). NEXT ANGLE (untried): pure permuter/
 * register-coloring territory now that the length is exact and every structural/logic angle is
 * closed -- would need a statement-permutation search over the whole function body per the
 * methodology doc's "PERMUTER PLATEAU is a SMELL" class. */
void MAI_Sneak(int i)
{
    int mx, my, md, v;
    MonsterStruct *Monst = &monster[i];
    int dist;

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
        if (abs(mx) < dist && abs(my) < dist && (Monst->_mFlags & MFLAG_HIDDEN))
            M_StartFadein(i, md, 0);
        else if (!(abs(mx) < dist + 1 && abs(my) < dist + 1) && !(Monst->_mFlags & MFLAG_HIDDEN))
            M_StartFadeout(i, md, 1);
        else if (Monst->_mgoal == MG_RUN_AWAY
            || (!(abs(mx) < 2 && abs(my) < 2)
                && ((Monst->_mVar2 > 20 && v < (14 + 4 * Monst->_mint))
                    || (WALKMODE(Monst->_mVar1)
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

/* PASS+SYM. Logic verified against hellfire (TXT_ZHAR1=0x94, TXT_ZHAR2=0x95, USFX_ZHAR2=0x35B from
 * the raw oracle). SYM has no `dist`: like devilution, the distance calc is a bare
 * `if (abs(mx) > abs(my)) abs(mx); else abs(my);` whose result is discarded. `_mx/_my` are cached
 * at the top through the const view (see MAI_Lachdanan). */
void MAI_Zhar(int i)
{
    int mx, my, md;
    MonsterStruct *Monst = &monster[i];
    int _mx, _my;

    _mx = ((const MonsterStruct *)Monst)->_mx;
    _my = ((const MonsterStruct *)Monst)->_my;
    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);
        if (Monst->mtalkmsg == TXT_ZHAR1 && !(dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) && Monst->_mgoal == MG_WAITTOTALK) {
            Monst->mtalkmsg = TXT_ZHAR1 + 1;
            Monst->_mgoal = MG_TALK;
        }
        if (dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) {
            mx = _mx - Monst->_menemyx;
            my = _my - Monst->_menemyy;
            if (abs(mx) > abs(my))
                abs(mx);
            else
                abs(my);
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

void SyncMonstStartKill(int i, int pnum, unsigned char sendmsg)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx, _my;

    if (pnum >= 0)
        Monst->mWhoHit = 1 << pnum;

    Monst->_mhitpoints = 0;
    SetRndSeed(ENG_random(GetRndSeed()));

    if (i >= 4)
        SpawnItem(i, Monst->_mx, Monst->_my, sendmsg);

    _mx = Monst->_moldx;
    _my = Monst->_moldy;

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
    Monst->_mVar1 = 0;
    Monst->_mx = _mx;
    Monst->_my = _my;
    Monst->_mfutx = _mx;
    Monst->_mfuty = _my;
    Monst->_moldx = _mx;
    Monst->_moldy = _my;
    M_ClearSquares(i);
    dung_map[_mx][_my].dMonster = i + 1;
}

unsigned char PosOkMonst3(int i, int x, int y)
{
    unsigned char ret;
    int oi;
    int objtype;
    int mi;
    unsigned char fire;
    unsigned char isdoor;

    ret = 1;
    fire = 0;
    isdoor = 0;

    if (ret && dung_map[x][y].dObject != 0) {
        oi = dung_map[x][y].dObject > 0 ? dung_map[x][y].dObject - 1 : -(dung_map[x][y].dObject + 1);
        objtype = object[oi]._otype;
        isdoor = objtype == OBJ_L1DOORL || objtype == OBJ_L1DOORR
            || objtype == OBJ_L2DOORL || objtype == OBJ_L2DOORR
            || objtype == OBJ_L3DOORL || objtype == OBJ_L3DOORR;
        if (object[oi]._oSolidFlag && !isdoor)
            ret = 0;
    }
    if (ret) {
        ret = (!SolidLoc(x, y) || isdoor) && !IsDplayer(x, y) && !dung_map[x][y].dMonster;
    }
    if (ret && dung_map[x][y].dMissile != 0 && i >= 0) {
        mi = dung_map[x][y].dMissile;
        if (mi > 0) {
            if (missile[mi]._mitype == MIT_FIREWALL) {
                fire = 1;
            } else {
                for (mi = 0; mi < nummissiles; mi++) {
                    if (missile[missileactive[mi]]._mitype == MIT_FIREWALL)
                        fire = 1;
                }
            }
        }
        if (fire && (!(monster[i].mMagicRes & IMMUNE_FIRE) || monster[i].MType->mtype == MT_DIABLO))
            ret = 0;
    }

    return ret;
}

void ProcessMonsters(void)
{
    static unsigned int WipeCount;
    bool DoWipe;
    MonsterStruct *Monst;
    int oldmode;
    int i;
    int mi;
    int raflag;
    int mx;
    int my;
    int _menemy;

    DeleteMonsterList();

    /* bytes PASS: DoWipe is `bool` (SYM type BOOL, int-sized -- no andi 0xff
     * on the test), set by `DoWipe = 0; if (...) DoWipe = 1;`, and raflag is
     * zeroed per monster right after the mx/my reads (fills the NOHEAL branch
     * delay slot). SYM OPEN: retail lists WipeCount/DoWipe/Monst/oldmode at
     * FUNCTION level (before the body block) and i..._menemy inside it; the
     * same split shows in MAI_Counselor (counsmiss/_mx/_my) -- every retail
     * function with a static local has it. Not reproduced yet: extra nested
     * block, decl-after-statement, static initializer all falsified. */
    DoWipe = 0;
    if (++WipeCount % 200 == 0)
        DoWipe = 1;
    for (i = 0; i < nummonsters; i++) {
        mi = monstactive[i];
        Monst = &monster[mi];

        if (DoWipe) {
            if (mi >= 4)
                Monst->_mFlags &= ~MFLAG_TARGETS_MONSTER;
        }

        _menemy = Monst->_menemy;
        mx = Monst->_mx;
        my = Monst->_my;
        raflag = 0;

        if (!(monster[mi]._mFlags & MFLAG_NOHEAL) && Monst->_mhitpoints < Monst->_mmaxhp && (Monst->_mhitpoints >> 6) > 0) {
            if (Monst->mLevel > 1)
                Monst->_mhitpoints += Monst->mLevel >> 1;
            else
                Monst->_mhitpoints += Monst->mLevel;
        }

        if ((dung_map[mx][my].dFlags & 0x3) && (dung_map[mx][my].dFlags & BFLAG_MONSTACTIVE) && Monst->_msquelch == 0) {
            if (Monst->MType->mtype == MT_CLEAVER)
                PlaySFX(USFX_CLEAVER);
        }

        if (Monst->_mFlags & MFLAG_TARGETS_MONSTER) {
            Monst->_lastx = monster[_menemy]._mfutx;
            Monst->_menemyx = Monst->_lastx;
            Monst->_lasty = monster[_menemy]._mfuty;
            Monst->_menemyy = Monst->_lasty;
        } else {
            if (!plr[_menemy].plractive) {
                _menemy ^= 1;
                Monst->_menemy = _menemy;
            }
            Monst->_menemyx = plr[_menemy]._px;
            Monst->_menemyy = plr[_menemy]._py;
            if (dung_map[mx][my].dFlags & 0x3) {
                Monst->_msquelch = 255;
                Monst->_lastx = plr[_menemy]._px;
                Monst->_lasty = plr[_menemy]._py;
            } else if (Monst->_msquelch != 0 && Monst->_mAi != MT_DIABLO) {
                Monst->_msquelch--;
            }
        }

        if (!(dung_map[mx][my].dFlags & 0x3) && Monst->_msquelch == 0 && i >= 4)
            continue;

        do {
            AiProc[Monst->_mAi](mi);

            switch (oldmode = Monst->_mmode) {
            case MM_STAND:
                raflag = M_DoStand(mi);
                break;
            case MM_WALK:
                raflag = M_DoWalk(mi);
                break;
            case MM_WALK2:
                raflag = M_DoWalk2(mi);
                break;
            case MM_WALK3:
                raflag = M_DoWalk3(mi);
                break;
            case MM_ATTACK:
                raflag = M_DoAttack(mi);
                break;
            case MM_RATTACK:
                raflag = M_DoRAttack(mi);
                break;
            case MM_GOTHIT:
                raflag = M_DoGotHit(mi);
                break;
            case MM_DEATH:
                raflag = M_DoDeath(mi);
                break;
            case MM_SATTACK:
                raflag = M_DoSAttack(mi);
                break;
            case MM_FADEIN:
                raflag = M_DoFadein(mi);
                break;
            case MM_FADEOUT:
                raflag = M_DoFadeout(mi);
                break;
            case MM_SPSTAND:
                raflag = M_DoSpStand(mi);
                break;
            case MM_RSATTACK:
                raflag = M_DoRSpAttack(mi);
                break;
            case MM_DELAY:
                raflag = M_DoDelay(mi);
                break;
            case MM_MISSILE:
                raflag = RUN_DONE;
                break;
            case MM_STONE:
                raflag = M_DoStone(mi);
                break;
            case MM_HEAL:
                raflag = M_DoHeal(mi);
                break;
            case MM_TALK:
                raflag = M_DoTalk(mi);
                break;
            }

            if (raflag != RUN_DONE)
                GroupUnity(mi);
        } while (raflag != RUN_DONE);

        if (Monst->_mmode != MM_STONE) {
            Monst->_mAnimCnt++;
            if (!(Monst->_mFlags & MFLAG_STILL)) {
                if (Monst->_mAnimCnt >= Monst->_mAnimDelay) {
                    Monst->_mAnimCnt = 0;
                    if (Monst->_mFlags & MFLAG_BACKWARDS) {
                        Monst->_mAnimFrame--;
                        if (!Monst->_mAnimFrame)
                            Monst->_mAnimFrame = Monst->_mAnimLen;
                    } else {
                        Monst->_mAnimFrame++;
                        if (Monst->_mAnimFrame > Monst->_mAnimLen)
                            Monst->_mAnimFrame = 1;
                    }
                }
            }
        }
    }
    DeleteMonsterList();
}

int M_SpawnSkel(int x, int y, int dir)
{
    int i, j;
    int skeltypes;
    int skel;

    skeltypes = 0;
    for (i = 0; i < nummtypes; i++) {
        if (IsSkel(Monsters[i].mtype))
            skeltypes++;
    }

    if (skeltypes) {
        j = ENG_random(skeltypes);
        skeltypes = 0;
        for (i = 0; i < nummtypes && skeltypes <= j; i++) {
            if (IsSkel(Monsters[i].mtype))
                skeltypes++;
        }
        skel = AddMonster(x, y, dir, i - 1, 1);
        if (skel != -1)
            M_StartSpStand(skel, dir);

        return skel;
    }

    return -1;
}

/* SOLVED (was OPEN, 205 vs 186 insns): the fix was the `pmonster` pointer --
 * it is a real but narrowly-scoped local, declared with its initializer
 * INSIDE the `if (_mmode != MM_STONE)` block (not at function top), used
 * ONLY to read `_moldx`/`_moldy` as a single two-field pointer dereference
 * right after the NewMonsterAnim call and BEFORE the _mmode/_mxoff/_myoff
 * writes. Declaring it (and `_moldx`/`_moldy`) block-scoped-with-initializer
 * inside the if, in that exact position, both matched the byte count AND
 * opened the two nested SYM levels retail's block tree has (both start at
 * the same line -- one level per block-scoped decl). Everywhere else in the
 * function plain `monster[i].field` indexing is correct; a full
 * function-wide `Monst` pointer over-optimizes (128 insns, way short). */
void M_StartHit(int i, int pnum, int dam)
{
    if (pnum >= 0)
        monster[i].mWhoHit |= 1 << pnum;

    delta_monster_hp(i, monster[i]._mhitpoints, currlevel);
    NetSendCmdParam2(0, 0x25, i, dam);   /* CMD_MONSTDAMAGE per oracle (differs from msg.cpp's 0x26) */
    PlayEffect(i, 1);

    if (pnum >= 0) {
        monster[i]._menemy = pnum;
        monster[i]._menemyx = plr[pnum]._px;
        monster[i]._menemyy = plr[pnum]._py;
        monster[i]._mFlags &= ~MFLAG_TARGETS_MONSTER;
        monster[i]._mdir = M_GetDir(i);
    }

    if (!(monster[i].MType->mtype >= MT_SNEAK && monster[i].MType->mtype <= MT_ILLWEAV)
        && (dam >> 6) < monster[i].mLevel + 3)
        return;

    if (monster[i].MType->mtype == MT_BLINK) {
        M_Teleport(i);
    } else if (monster[i].MType->mtype >= MT_NSCAV && monster[i].MType->mtype <= MT_YSCAV) {
        monster[i]._mgoal = MGOAL_NORMAL;
    }

    if (monster[i]._mmode != MM_STONE) {
        NewMonsterAnim(i, monster[i].MType->Anims[MA_GOTHIT], monster[i]._mdir, MA_GOTHIT);
        MonsterStruct *pmonster = &monster[i];
        int _moldx = pmonster->_moldx;
        int _moldy = pmonster->_moldy;
        monster[i]._mmode = MM_GOTHIT;
        monster[i]._mxoff = 0;
        monster[i]._myoff = 0;
        monster[i]._mx = _moldx;
        monster[i]._my = _moldy;
        monster[i]._mfutx = _moldx;
        monster[i]._mfuty = _moldy;
        monster[i]._moldx = _moldx;
        monster[i]._moldy = _moldy;
        M_CheckEFlag(i);
        M_ClearSquares(i);
        dung_map[_moldx][_moldy].dMonster = i + 1;
    }
}

/* PASS+SYM. The prologue residual (retail saves s2 + loads _mx BEFORE saving
 * ra/s4/s3) is a const-read artifact: _mx/_my are read through a
 * `const MonsterStruct *` view, making the loads RTX_UNCHANGING so sched2
 * ignores their memory dependence on the stack saves (same lever as
 * M_StartKill's const pmonster; applied to Garbud/SnotSpil/Lazurus/Rhino too).
 * Semantics verified against hellfire (TXT_VEIL1 advance / TXT_VEIL3 tail). */
void MAI_Lachdanan(int i)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx = ((const MonsterStruct *)Monst)->_mx;
    int _my = ((const MonsterStruct *)Monst)->_my;

    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);

        if (Monst->mtalkmsg == TXT_VEIL1) {
            if (!(dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) && Monst->_mgoal == MG_WAITTOTALK) {
                Monst->mtalkmsg = TXT_VEIL1 + 1;
                Monst->_mgoal = MG_TALK;
            }
        }

        if (dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) {
            if (Monst->mtalkmsg == TXT_VEIL3 && !effect_is_playing(USFX_LACH3) && Monst->_mgoal == MG_WAITTOTALK) {
                Monst->mtalkmsg = 0;
                quests[Q_VEIL]._qactive = QUEST_DONE;
                if (!deltaload)
                    NetSendCmdQuest(1, Q_VEIL);
                M_StartKill(i, -1);
            }
        }

        monster[i]._mdir = md;
        if (Monst->_mmode == MM_STAND)
            Monst->Action = 0;
    }
}

/* PASS+SYM (prologue save-order residual fixed by the const-view _mx/_my
 * read, see MAI_Lachdanan). Semantics
 * fully verified: hellfire's mtalkmsg-advance/TXT_GARB4-effect/MAI_Round
 * dispatch shape, PLUS a genuine PSX-only addition confirmed from raw
 * bytes -- both the advance path and the GARB4 path also write
 * quests[Q_GARBUD]._qvar1 (5 then 4) and (advance path only) _qvar2, each
 * followed by `if (!deltaload) NetSendCmdQuest(1, Q_GARBUD)` (multiplayer
 * quest-state sync neither twin has). Also found: the MAI_Round dispatch
 * is a real if/else (`if(goal==ATTACK||WALK_AROUND1) MAI_Round(...); else
 * monster[i]._mdir=md;`) -- NOT hellfire's unconditional _mdir=md after an
 * if-only MAI_Round call; this fixed a real 1-insn/1-branch-target gap. */
void MAI_Garbud(int i)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx;
    int _my;

    _mx = ((const MonsterStruct *)Monst)->_mx;
    _my = ((const MonsterStruct *)Monst)->_my;

    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);

        if (Monst->mtalkmsg < TXT_GARB4 && Monst->mtalkmsg > TXT_GARB1 - 1
            && !(dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) && Monst->_mgoal == MG_WAITTOTALK) {
            Monst->mtalkmsg = Monst->mtalkmsg + 1;
            Monst->_mgoal = MG_TALK;
            quests[Q_GARBUD]._qvar1 = 5;
            quests[Q_GARBUD]._qvar2 = Monst->mtalkmsg;
            if (!deltaload)
                NetSendCmdQuest(1, Q_GARBUD);
        }

        if (dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) {
            if (Monst->mtalkmsg == TXT_GARB4 && !effect_is_playing(USFX_GARBUD4) && Monst->_mgoal == MG_WAITTOTALK) {
                Monst->_mgoal = MG_ATTACK;
                Monst->_msquelch = 255;
                Monst->mtalkmsg = 0;
                quests[Q_GARBUD]._qvar1 = 4;
                if (!deltaload)
                    NetSendCmdQuest(1, Q_GARBUD);
            }
        }

        if (Monst->_mgoal == MG_ATTACK || Monst->_mgoal == MG_WALK_AROUND1) {
            MAI_Round(i, 1);
        } else {
            monster[i]._mdir = md;
        }

        if (Monst->_mmode == MM_STAND)
            Monst->Action = 0;
    }
}

/* SYM not checked; bytes OPEN (112 diffs, 140==140 insns exact): logic fully
 * verified against devilution field-by-field (formulas for _mmaxhp/mHit/
 * mMinDamage/mMaxDamage match exactly; confirmed PSX drops _pathcount=0,
 * replaces M_Enemy(i) with a hardcoded `_menemy=0`, ORs _mFlags with
 * MFLAG_TARGETS_MONSTER|MFLAG_MKILLER as one combined write, and calls
 * NetSendCmdGolem unconditionally with no `if(i==myplr)` gate -- all
 * confirmed from the raw oracle, no branches in this fn so every diff here
 * is pure temp-register choice, not control flow). Falsified: swapping the
 * mmaxhp addition operand order. This is a bigger scheduling mismatch than
 * the single-swap class (112 of 140 insns differ only in temp reg identity:
 * t0 vs t1, and ra-save position) -- likely the whole function's temp-reg
 * numbering is offset by one somewhere near the top; needs a slower
 * side-by-side register-by-register walk, not a quick lever. */
void SpawnGolum(int i, int x, int y, int mi)
{
    dung_map[x][y].dMonster = i + 1;
    monster[i]._mx = x;
    monster[i]._my = y;
    monster[i]._mfutx = x;
    monster[i]._mfuty = y;
    monster[i]._moldx = x;
    monster[i]._moldy = y;
    monster[i]._mmaxhp = 2 * (320 * missile[mi]._mispllvl + plr[i]._pMaxMana / 3);
    monster[i]._mhitpoints = monster[i]._mmaxhp;
    monster[i].mArmorClass = 25;
    monster[i].mHit = 5 * (missile[mi]._mispllvl + 8) + 2 * plr[i]._pLevel;
    monster[i].mMinDamage = 2 * (missile[mi]._mispllvl + 4);
    monster[i].mMaxDamage = 2 * (missile[mi]._mispllvl + 8);
    monster[i]._menemy = 0;
    monster[i]._mFlags |= (MFLAG_TARGETS_MONSTER | MFLAG_MKILLER);
    M_StartSpStand(i, 0);
    NetSendCmdGolem(monster[i]._mx, monster[i]._my, monster[i]._mdir, monster[i]._menemy, monster[i]._mhitpoints, currlevel);
}

/* PASS+SYM (prologue residual fixed by the const-view _mx/_my read, see
 * MAI_Lachdanan). protos_monster.h now prototypes ObjChangeMap, so the
 * implicit-declaration effect described below is reproduced with an explicit
 * block-scope declaration right before the call (same binding-level push).
 * Original note: ObjChangeMap (NOT ObjChangeMapResync, and NOT RedoPlayerVision -- both of
 * those stay prototyped, needed flat/ok for MAI_Lazurus) must stay
 * UN-prototyped in protos_monster.h (retail's SYM block tree here is 7-deep
 * nested, matching a g++2.7 implicit-declaration-per-call artifact for this
 * ONE specific OBJECTS.CPP call -- adding its prototype collapses the tree to
 * flat and breaks SYM; removing it reproduced retail's exact nesting with
 * ZERO bytes-side effect). This is the opposite of the earlier
 * M_CheckEFlag/M_Enemy/M_ClearSquares law (there, MISSING protos caused
 * spurious nesting that had to be fixed by ADDING them) -- so the "always
 * prototype every callee" rule is not universal and is not even per-function
 * (ObjChangeMap vs ObjChangeMapResync, two overloads-of-a-theme, need
 * OPPOSITE treatment): match retail's SYM tree shape first, then decide instead
 * of reflexively adding a proto for every new callee. */
void MAI_SnotSpil(int i)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx;
    int _my;

    _mx = ((const MonsterStruct *)Monst)->_mx;
    _my = ((const MonsterStruct *)Monst)->_my;

    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);

        if (Monst->mtalkmsg == TXT_BOL1 && !(dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) && Monst->_mgoal == MG_WAITTOTALK) {
            Monst->mtalkmsg = TXT_BOL2;
            Monst->_mgoal = MG_TALK;
        }

        if (Monst->mtalkmsg == TXT_BOL2 && quests[Q_LTBANNER]._qvar1 == 3) {
            Monst->mtalkmsg = 0;
            Monst->_mgoal = MG_ATTACK;
        }

        if (dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) {
            if (Monst->mtalkmsg == TXT_BOL3 && !effect_is_playing(USFX_SNOT3) && Monst->_mgoal == MG_WAITTOTALK) {
                void ObjChangeMap(int x1, int y1, int x2, int y2);
                ObjChangeMap(setpc_x, setpc_y, setpc_x + setpc_w + 1, setpc_y + setpc_h + 1);
                quests[Q_LTBANNER]._qvar1 = 3;
                if (!deltaload)
                    NetSendCmdQuest(1, Q_LTBANNER);
                RedoPlayerVision();
                Monst->_mgoal = MG_ATTACK;
                Monst->_msquelch = 255;
                Monst->mtalkmsg = 0;
            }

            if (quests[Q_LTBANNER]._qvar1 == 3) {
                if (Monst->_mgoal == MG_ATTACK || Monst->_mgoal == MG_ATTACK2)
                    MAI_Fallen(i);
            }
        }

        monster[i]._mdir = md;
        if (Monst->_mmode == MM_STAND)
            Monst->Action = 0;
    }
}

/* PASS+SYM (prologue residual fixed by the const-view _mx/_my read, see
 * MAI_Lachdanan).
 * Two real bugs found and fixed during transcription: (1) a missing
 * `if(!deltaload) NetSendCmdQuest(1,Q_BETRAYER)` after the FIRST
 * quests[Q_BETRAYER]._qvar1=5 write (easy to miss since the movie-trigger
 * PlayInGameMovie call itself IS dropped on PSX, but the network sync after
 * it is NOT); (2) the tail `Action=0` gate is `_mmode==MM_STAND ||
 * _mmode==MM_TALK` (not just MM_STAND) -- this function can set _mmode to
 * MM_TALK earlier in its own body, so retail re-checks for that value too. */
void MAI_Lazurus(int i)
{
    int md;
    MonsterStruct *Monst = &monster[i];
    int _mx;
    int _my;

    _mx = ((const MonsterStruct *)Monst)->_mx;
    _my = ((const MonsterStruct *)Monst)->_my;

    if (Monst->_mmode == MM_STAND) {
        md = M_GetDir(i);

        if (dung_map[_mx][_my].dFlags & BFLAG_MONSTACTIVE) {
            if (gbMaxPlayers == 1) {
                if (Monst->mtalkmsg == TXT_VB1 && Monst->_mgoal == MG_TALK
                    && plr[myplr]._px == 35 && plr[myplr]._py == 46) {
                    Monst->_mmode = MM_TALK;
                    quests[Q_BETRAYER]._qvar1 = 5;
                    if (!deltaload)
                        NetSendCmdQuest(1, Q_BETRAYER);
                }

                if (Monst->mtalkmsg == TXT_VB1 && !effect_is_playing(USFX_LAZ1) && Monst->_mgoal == MG_WAITTOTALK) {
                    ObjChangeMapResync(1, 18, 20, 24);
                    RedoPlayerVision();
                    quests[Q_BETRAYER]._qvar1 = 6;
                    if (!deltaload)
                        NetSendCmdQuest(1, Q_BETRAYER);
                    Monst->_mgoal = MG_ATTACK;
                    Monst->_msquelch = 255;
                    Monst->mtalkmsg = 0;
                }
            }

            if (gbMaxPlayers != 1 && Monst->mtalkmsg == TXT_VB1 && Monst->_mgoal == MG_TALK && quests[Q_BETRAYER]._qvar1 < 4) {
                Monst->_mmode = MM_TALK;
            }
        }

        if (Monst->_mgoal == MG_ATTACK || Monst->_mgoal == MG_RUN_AWAY || Monst->_mgoal == MG_WALK_AROUND1) {
            MAI_Counselor(i);
        }

        monster[i]._mdir = md;
        if (Monst->_mmode == MM_STAND || Monst->_mmode == MM_TALK)
            Monst->Action = 0;
    }
}

/* SYM not checked; bytes OPEN (254 diffs, ours 263 / oracle 261, only 2
 * insns OVER now -- was 18 short before this pass). logic/call-list fully
 * verified against hellfire (LineClearF+CheckNoSolid wall check,
 * PACK_MEMBER/PACK_NOMEMBER pack-join/leave with the
 * DIST(mx-mfutx,my-mfuty,4) rejoin gate, the msquelch/_lastx/_lasty leader
 * "keep active" update, the AI_GARG+MFLAG_STILL->MM_SATTACK wake, and the
 * UN_STICK unique-pack loop over monstactive[]). Extended pMonster (the bare
 * array-decay base pointer, matching retail's persistent $s7) to the
 * `_lastx`/`_lasty`/`_msquelch`/`_mAi`/`_mFlags`/`_mmode` LEADER accesses
 * (not the tmp-in-loop ones -- tried both combinations: leader-as-pMonster+
 * tmp-as-monster[] gives 263, the reverse also gives 263, using pMonster
 * for BOTH over-collapses to 247, using it for NEITHER stayed at 279+18-short
 * -- so exactly one of {leader block, tmp-loop block} should use pMonster,
 * picked leader here to match the earlier-confirmed `packsize` pMonster
 * usage). Still 7 saved regs vs retail's 8 (`sp-64` vs `sp-72`) -- one
 * persistent variable's worth of register pressure still unaccounted for.
 * Close but not solved; needs a slower register-by-register walk. */
void GroupUnity(int i)
{
    int leader;
    int tmp;
    int m;
    MonsterStruct *pMonster = monster;
    int _mx;
    int _my;

    _mx = pMonster[i]._mx;
    _my = pMonster[i]._my;

    if (monster[i].leaderflag) {
        leader = monster[i].leader;

        tmp = LineClearF(CheckNoSolid, _mx, _my, monster[leader]._mfutx, monster[leader]._mfuty);

        if (!tmp && monster[i].leaderflag == PACK_MEMBER) {
            pMonster[leader].packsize--;
            monster[i].leaderflag = PACK_NOMEMBER;
        } else if (tmp && monster[i].leaderflag == PACK_NOMEMBER
                   && abs(_mx - monster[leader]._mfutx) < 4
                   && abs(_my - monster[leader]._mfuty) < 4) {
            pMonster[leader].packsize++;
            monster[i].leaderflag = PACK_MEMBER;
        }
    }

    if (monster[i].leaderflag == PACK_MEMBER) {
        if (monster[i]._msquelch > pMonster[leader]._msquelch) {
            pMonster[leader]._lastx = _mx;
            pMonster[leader]._lasty = _my;
            pMonster[leader]._msquelch = monster[i]._msquelch - 1;
        }
        if (pMonster[leader]._mAi == AI_GARG && (pMonster[leader]._mFlags & MFLAG_STILL)) {
            pMonster[leader]._mFlags &= ~MFLAG_STILL;
            pMonster[leader]._mmode = MM_SATTACK;
        }
    } else if (monster[i]._uniqtype && (UniqMonst[monster[i]._uniqtype - 1].mUnqAttr & UN_STICK)) {
        for (m = 0; m < nummonsters; m++) {
            if (monster[tmp = monstactive[m]].leaderflag == PACK_MEMBER && monster[tmp].leader == i) {
                if (monster[i]._msquelch > monster[tmp]._msquelch) {
                    monster[tmp]._lastx = _mx;
                    monster[tmp]._lasty = _my;
                    monster[tmp]._msquelch = monster[i]._msquelch - 1;
                }
                if (monster[tmp]._mAi == AI_GARG && (monster[tmp]._mFlags & MFLAG_STILL)) {
                    monster[tmp]._mFlags &= ~MFLAG_STILL;
                    monster[tmp]._mmode = MM_SATTACK;
                }
            }
        }
    }
}

/* SYM OPEN (record 3 pmonster: ours $v0 / retail $v1 -- pure temp-reg choice);
 * bytes OPEN (16 diffs, 175==175 insns exact -- was 98 diffs/173 insns before
 * this pass). Logic verified against devilution including the documented
 * BUGFIX (`monster[i].mWhoHit |= 1<<i`, using the ATTACKER index for both the
 * array and the shift, not `mid`), the `(monster[i]._mdir+4)&7`
 * opposite-direction calc, and the MT_GOLEM exclusion around the
 * NewMonsterAnim/_mmode=MM_GOTHIT pair. FIX FOUND this pass: the block-scoped
 * `pmonster`/`_mx`/`_my` reads must happen UNCONDITIONALLY, in an anonymous
 * block BEFORE the `if(_mmode==MM_STONE) return;` check -- not gated inside
 * it like M_StartHit's tail (retail reads _moldx/_moldy speculatively before
 * ever testing _mmode; moving the read+early-return to match closed the
 * count from 173 to 175 exactly). NOW PASS+SYM: the `monster` base is loaded
 * as its own statement (`pmonster = monster; pmonster += mid;`, the same
 * spelling as M_StartKill), which hoists the lui/addiu pair into $v1; and the
 * locals live in the function's top block (retail SYM has no inner block). */
void M2MStartHit(int mid, int i, int dam)
{
    MonsterStruct *pmonster;
    int _mx, _my;

    if (i >= 0)
        monster[i].mWhoHit |= 1 << i;

    delta_monster_hp(mid, monster[mid]._mhitpoints, currlevel);
    NetSendCmdParam2(0, 0x25, mid, dam);
    PlayEffect(mid, 1);

    if (!(monster[mid].MType->mtype >= MT_SNEAK && monster[mid].MType->mtype <= MT_ILLWEAV)
        && (dam >> 6) < monster[mid].mLevel + 3)
        return;

    if (i >= 0)
        monster[mid]._mdir = (monster[i]._mdir + 4) & 7;

    if (monster[mid].MType->mtype == MT_BLINK) {
        M_Teleport(mid);
    } else if (monster[mid].MType->mtype >= MT_NSCAV && monster[mid].MType->mtype <= MT_YSCAV) {
        monster[mid]._mgoal = MGOAL_NORMAL;
    }

    pmonster = monster;
    pmonster += mid;
    _mx = pmonster->_moldx;
    _my = pmonster->_moldy;

    if (monster[mid]._mmode == MM_STONE)
        return;

    if (monster[mid].MType->mtype != MT_GOLEM) {
        NewMonsterAnim(mid, monster[mid].MType->Anims[MA_GOTHIT], monster[mid]._mdir, MA_GOTHIT);
        monster[mid]._mmode = MM_GOTHIT;
    }

    monster[mid]._mxoff = 0;
    monster[mid]._myoff = 0;
    monster[mid]._mx = _mx;
    monster[mid]._my = _my;
    monster[mid]._mfutx = _mx;
    monster[mid]._mfuty = _my;
    monster[mid]._moldx = _mx;
    monster[mid]._moldy = _my;
    M_CheckEFlag(mid);
    M_ClearSquares(mid);
    dung_map[_mx][_my].dMonster = mid + 1;
}

/* SYM not checked; bytes OPEN (215 diffs, ours 237 / oracle 242, 5 insns
 * short). Logic verified against devilution's non-HELLFIRE branch, call
 * list confirmed via `jal` scan (MonstPartJump, delta_kill_monster,
 * NetSendCmdLocParam1, AddPlrMonstExper, SpawnItem, M_DiabloDeath, two
 * PlayEffect, NewMonsterAnim, M_CheckEFlag, M_ClearSquares, CheckQuestKill,
 * M_FallenFear, AddMissile -- exact match). PSX-specific findings confirmed
 * from raw bytes: (1) `MonstPartJump(i)` fires when the ATTACKER (i, not
 * mid) is in MM_STONE -- present in neither twin; (2) `monster[mid].mWhoHit
 * |= 1<<i` matches devilution's documented BUGFIX (attacker index used
 * for both slot and shift, not the more "natural" masked/local form);
 * (3) `AddPlrMonstExper` takes no pnum param -- it reads the global `myplr`,
 * so PSX temporarily swaps `myplr=i` around the call and restores it after
 * (matching the oracle's save/lw-before, sw-after pattern exactly);
 * (4) NO `SetRndSeed`/reseed call at all (unlike MonstStartKill/
 * SyncMonstStartKill) -- confirmed absent from the call list; (5) both
 * `PlayEffect(i,2)` (non-HELLFIRE only, inside the else) and the unconditional
 * `PlayEffect(mid,2)` fire, matching devilution's `#ifndef HELLFIRE` shape;
 * (6) `md=(monster[i]._mdir+4)&7` (oracle literally emits `+4`, not
 * devilution's `-4` -- same mod-8 result, matches the actual instruction).
 * SYM shows a persistent `int omp` local ($s0) for the whole tail
 * (mmode=DEATH through the dMonster write) that I could not identify the
 * exact form of. `omp`'s SYM type is plain `int`, not a pointer -- tried an
 * `int omp = mid;` redundant-index local for that tail block: no change
 * (compiler CSEs it away), reverted.
 * OPDIFF PASS (using scratch/block/opdiff.py, the register-blind mnemonic
 * diff -- much clearer than verify_asm's raw LCS alignment for finding
 * REAL structural gaps under the register-coloring noise): found that
 * `python tools/symtypes.py fn M2MStartKill__Fii` lists `pmonster`($s7),
 * `_mx`($s5), `_my`($s6) as REG locals spanning the WHOLE function, not
 * just the tail block -- opdiff showed oracle caching `monster[mid]._mx`/
 * `_my` into stack/persistent slots right at the TOP of the function
 * (before even the MM_STONE/MonstPartJump check), matching the "speculative
 * read before guard" lever used elsewhere in this file. Moved `pmonster`/
 * `_mx`/`_my` to the top (`_mx`/`_my` now read the CURRENT position, not
 * `_moldx`/`_moldy` -- those are a separate, later read inside the tail
 * block) and reused them for `delta_kill_monster`/`NetSendCmdLocParam1`/
 * `SpawnItem`'s position args -- this closed 215->199 diffs and the opdiff
 * structural count 80->53. Residual (199 diffs, opdiff 53, 3 short):
 * `monster[mid].MType->mtype` is checked 3 times (monstkills[], MT_DIABLO,
 * MT_GOLEM) and oracle appears to recompute `&monster[mid]` fresh for each
 * check rather than reusing `pmonster` there -- NOT yet tried; next angle
 * is confirming that and deliberately NOT converting those 3 sites to
 * `pmonster[mid]`. */
void M2MStartKill(int i, int mid)
{
    int md;
    MonsterStruct *pmonster = monster;
    int _mx = pmonster[mid]._mx;
    int _my = pmonster[mid]._my;

    if (monster[i]._mmode == MM_STONE)
        MonstPartJump(i);

    delta_kill_monster(mid, _mx, _my, currlevel);
    NetSendCmdLocParam1(0, CMD_MONSTDEATH, _mx, _my, mid);

    monster[mid].mWhoHit |= 1 << i;
    if (i < 2) {
        int savemyplr = myplr;
        myplr = i;
        AddPlrMonstExper(monster[mid].mLevel, monster[mid].mExp, monster[mid].mWhoHit);
        myplr = savemyplr;
    }

    monstkills[monster[mid].MType->mtype]++;
    monster[mid]._mhitpoints = 0;

    if (mid >= 2)
        SpawnItem(mid, _mx, _my, 1);

    if (monster[mid].MType->mtype == MT_DIABLO) {
        M_DiabloDeath(mid, 1, 0);
    } else {
        PlayEffect(i, 2);
    }
    PlayEffect(mid, 2);

    md = (monster[i]._mdir + 4) & 7;
    if (monster[mid].MType->mtype == MT_GOLEM)
        md = 0;

    monster[mid]._mdir = md;
    NewMonsterAnim(mid, monster[mid].MType->Anims[MA_DEATH], md, MA_DEATH);
    {
        pmonster[mid]._mmode = MM_DEATH;
        pmonster[mid]._mxoff = 0;
        pmonster[mid]._myoff = 0;
        pmonster[mid]._mx = pmonster[mid]._moldx;
        pmonster[mid]._my = pmonster[mid]._moldy;
        pmonster[mid]._mfutx = pmonster[mid]._mx;
        pmonster[mid]._mfuty = pmonster[mid]._my;
        pmonster[mid]._moldx = pmonster[mid]._mx;
        pmonster[mid]._moldy = pmonster[mid]._my;
        M_CheckEFlag(mid);
        M_ClearSquares(mid);
        dung_map[pmonster[mid]._mx][pmonster[mid]._my].dMonster = mid + 1;
    }
    CheckQuestKill(mid, 1);
    M_FallenFear(monster[mid]._mx, monster[mid]._my);

    if (monster[mid].MType->mtype >= MT_NACID && monster[mid].MType->mtype <= MT_XACID)
        AddMissile(monster[mid]._mx, monster[mid]._my, 0, 0, 0, MIT_ACIDPUD, TARGET_PLAYERS, mid, monster[mid]._mint + 1, 0);
}

/* SYM OPEN (length 0x214 vs 0x238); bytes OPEN (51 diffs, ours 133 / oracle
 * 142, 9 insns short). Logic/call-list verified against hellfire: dropped
 * the MAXMONSTERS/MType==NULL asserts (release build), kept the
 * MT_ILLWEAV+MG_RUN_AWAY early-out, `hit=ENG_random(100)` zeroed for
 * MM_STONE, `CheckMonsterHit(mid,&ret)` early-out, the damage-roll `dam=
 * (ENG_random(maxd-mind+1)+mind)<<6`, and the MM_STONE-preserving
 * M2MStartKill/M2MStartHit dispatch (call then re-set _mmode=MM_STONE only
 * when it was ALREADY stone, matching hellfire's literal redundant-reassign
 * shape). One genuine PSX-only addition confirmed from raw bytes: after
 * applying damage, `_mFlags |= MFLAG_TARGETS_MONSTER` unconditionally, then
 * on death (`hitpoints>>6<=0`) it's CLEARED again unless `mtype==MT_GOLEM`
 * -- present in neither twin. Register-swap oddity found but not resolved:
 * SYM wants i=$s2/hit=$s3, ours produces i=$s3/hit=$s2 (simple swap) EXCEPT
 * at one point deep in the death branch ours recomputes a full `x*104`
 * MonsterStruct stride using the register holding `hit`'s value, which
 * makes no source-level sense (hit is never used as an array index) --
 * likely a second live-range reusing the same hard register for a
 * different purpose after `hit`'s natural lifetime ends elsewhere in
 * ours vs oracle's differently-scheduled version. Needs a dedicated
 * register-lifetime trace, not a quick lever. */
void M_TryM2MHit(int i, int mid, int hper, int mind, int maxd)
{
    int hit;
    int dam;
    unsigned char ret;

    if ((monster[mid]._mhitpoints >> 6) <= 0)
        return;
    if (monster[mid].MType->mtype == MT_ILLWEAV && monster[mid]._mgoal == MG_RUN_AWAY)
        return;

    hit = ENG_random(100);
    if (monster[mid]._mmode == MM_STONE)
        hit = 0;

    if (CheckMonsterHit(mid, ret)) {
        return;
    } else {
        if (hit < hper) {
            dam = ENG_random(maxd - mind + 1) + mind;
            dam = dam << 6;

            monster[mid]._mhitpoints -= dam;
            monster[mid]._mFlags |= MFLAG_TARGETS_MONSTER;
            if ((monster[mid]._mhitpoints >> 6) <= 0) {
                if (monster[mid].MType->mtype != MT_GOLEM)
                    monster[mid]._mFlags &= ~MFLAG_TARGETS_MONSTER;
                if (monster[mid]._mmode == MM_STONE) {
                    M2MStartKill(i, mid);
                    monster[mid]._mmode = MM_STONE;
                } else {
                    M2MStartKill(i, mid);
                }
            } else {
                if (monster[mid]._mmode == MM_STONE) {
                    M2MStartHit(mid, i, dam);
                    monster[mid]._mmode = MM_STONE;
                } else {
                    M2MStartHit(mid, i, dam);
                }
            }
        }
    }
    return;
}

/* NEW function this pass, drafted from devilution's non-HELLFIRE branch,
 * PSX-specific deltas confirmed from the JAP_1998_05_29 Ghidra decompile at
 * this exact VA (full body available, unlike most functions which only
 * have partial coverage). Confirmed PSX-specific vs devilution: (1) NO
 * MAXMONSTERS/MType==NULL asserts (release build, consistent with every
 * other fn in this file); (2) the "did I hit" check (`hper>=hit -> return`)
 * is NOT an early return -- it's a big nested `if (hper < hit) { ... }`
 * wrapping the whole rest of the function, matching this file's established
 * nested-if-over-early-return style; (3) NO MT_YZOMBIE/manashield branch at
 * all (Hellfire-only end-game mechanic, absent from base PSX Diablo --
 * confirmed by its total absence from the Ghidra decompile, no missile-scan
 * loop locals in the SYM either); (4) damage/HP updates are applied
 * UNCONDITIONALLY, not gated behind `pnum==myplr` (devilution's Hellfire-era
 * netcode gate doesn't exist yet in this PSX build); (5) the IPL_THORNS
 * check uses the raw literal `_pIFlags & 0x4000000` (matches the bare-literal
 * style already used for this same bit in items.cpp/player.cpp, no #define
 * in this codebase for it); (6) the SKING no-heal-steal-exempt check reads
 * `_mFlags & MFLAG_NOLIFESTEAL` (new define, PSX bit 0x1000) not devilution's
 * differently-named flag; (7) the knockback tail is gated by `_mFlags &
 * MFLAG_KNOCKBACK` (new define, PSX bit 0x80) and reuses the EXACT KnockOk/
 * FePlayerNo/ChkPlrOffsets/PosOkPlayer/SetPlayerOld/WorldToOffset shape
 * MissToMonst's own knockback tail already established in this file (same
 * idiom, confirmed independently here) -- but ends with `WorldToOffset(
 * plrind(ptrplr), ...)` (pointer-to-index via `plrind`) rather than a plain
 * `pnum`, since this function threads a `PlayerStruct *ptrplr = &plr[pnum];`
 * throughout instead of re-indexing `plr[pnum]` repeatedly (matching SYM's
 * `ptrplr`/`_mx`/`_my`/`_px`/`_py` cached-pointer/value locals). Added
 * MFLAG_KNOCKBACK/MFLAG_NOLIFESTEAL/MT_SKING defines and the pointer-taking
 * StartPlrHit/StartPlrBlock/StartPlrKill/PosOkPlayer/SetPlayerOld/plrind
 * prototypes to protos_monster.h (bodies already exist in player.cpp).
 * BYTE-VERIFIED this pass: SYM OPEN (length 0x5f4 vs retail 0x614, 8 insns
 * short); bytes OPEN (186 diffs, ours 381 / oracle 389). Two structural
 * fixes found from the diff/callaudit: (1) the M_TryM2MHit dispatch must be
 * an early-branch (`if (flags&MFLAG_TARGETS_MONSTER) { M_TryM2MHit(...); }
 * else { ... }`) not an if/else with the M2M call in the tail `else` --
 * callaudit flagged the call ORDER (M_TryM2MHit appearing before `abs` in
 * the linear call list, a branch-layout artifact) confirming the M2M path
 * is retail's "cold"/early-checked branch, not a late one; (2) SYM's
 * `pMonster` is a CALLER-SAVED transient ($v0), NOT a function-lifetime
 * persistent pointer -- introducing a real `MonsterStruct *pMonster =
 * &monster[i];` local (kept alive across the whole body) pushed `i` itself
 * out of its natural $s2 slot (SYM: i=$s2) into $s6, cascading a
 * whole-function register mismatch; switching every `pMonster->field` back
 * to direct `monster[i].field` (matching devilution's literal style, no
 * cached pointer at all) let the compiler re-derive the pointer on demand
 * exactly like retail and fixed `i` back onto $s2 -- alone this closed
 * 227->186 diffs and 42->8 insns. callaudit: 0/102 mismatches tree-wide.
 * jtcheck: N/A (no switch in this fn; the 2 pre-existing mismatches
 * flagged for monster.cpp are M_WalkDir/ProcessMonsters, untouched by this
 * pass). Residual (186 diffs, 8 short): `pnum`/`Hit`/`MinDam` still land on
 * the wrong registers (ours s4/fp/s7 vs retail's s3/s6/s5) -- same
 * whole-function register-coloring class documented elsewhere in this file;
 * not chased further this pass (landing a near-miss, not a seal, per the
 * priority). */
void M_TryH2HHit(int i, int pnum, int Hit, int MinDam, int MaxDam)
{
    PlayerStruct *ptrplr = &plr[pnum];

    if (monster[i]._mFlags & MFLAG_TARGETS_MONSTER) {
        M_TryM2MHit(i, pnum, Hit, MinDam, MaxDam);
    } else {
        long hp = ptrplr->_pHitPoints;
        int _mx = monster[i]._mx;
        int _my = monster[i]._my;
        int _px = ptrplr->_px;
        int _py = ptrplr->_py;

        if ((hp >> 6) > 0 && !ptrplr->_pInvincible && !(ptrplr->_pSpellFlags & 1)) {
            int dx = abs(_mx - _px);
            int dy = abs(_my - _py);

            if (dx < 2 && dy < 2) {
                int hper = ENG_random(100);
                int tac = ptrplr->_pIAC + ptrplr->_pIBonusAC;
                int hit = Hit - (tac + ptrplr->_pDexterity / 5 - 30) + (monster[i].mLevel - ptrplr->_pLevel) * 2;
                int blk, blkper;

                if (hit < 15)
                    hit = 15;
                if (currlevel == 14 && hit < 20)
                    hit = 20;
                if (currlevel == 15 && hit < 25)
                    hit = 25;
                if (currlevel == 16 && hit < 30)
                    hit = 30;

                if ((ptrplr->_pmode == PM_STAND || ptrplr->_pmode == PM_ATTACK) && ptrplr->_pBlockFlag)
                    blkper = ENG_random(100);
                else
                    blkper = 100;
                blk = ptrplr->_pDexterity + ptrplr->_pBaseToBlk - (monster[i].mLevel - ptrplr->_pLevel) * 2;
                if (blk < 0)
                    blk = 0;
                if (blk > 100)
                    blk = 100;

                if (hper < hit) {
                    if (blkper < blk) {
                        int dir = GetDirection(_px, _py, _mx, _my);
                        StartPlrBlock(ptrplr, dir);
                    } else {
                        long dam = ENG_random((MaxDam - MinDam + 1) << 6) + (MinDam << 6) + (ptrplr->_pIGetHit << 6);
                        long mdam;

                        if (dam < 64)
                            dam = 64;
                        ptrplr->_pHitPoints -= dam;
                        ptrplr->_pHPBase -= dam;
                        if (ptrplr->_pIFlags & 0x4000000) {
                            mdam = (ENG_random(3) + 1) << 6;
                            monster[i]._mhitpoints -= mdam;
                            if ((monster[i]._mhitpoints >> 6) < 1)
                                M_StartKill(i, pnum);
                            else
                                M_StartHit(i, pnum, mdam);
                        }
                        if (!(monster[i]._mFlags & MFLAG_NOLIFESTEAL) && monster[i].MType->mtype == MT_SKING && gbMaxPlayers != 1)
                            monster[i]._mhitpoints += dam;
                        if (ptrplr->_pHitPoints > ptrplr->_pMaxHP) {
                            ptrplr->_pHitPoints = ptrplr->_pMaxHP;
                            ptrplr->_pHPBase = ptrplr->_pMaxHPBase;
                        }
                        if ((ptrplr->_pHitPoints >> 6) < 1) {
                            StartPlrKill(ptrplr, 0);
                        } else {
                            StartPlrHit(ptrplr, dam, 0);
                            if (monster[i]._mFlags & MFLAG_KNOCKBACK) {
                                unsigned char knockOk = 1;

                                if (ptrplr->_pmode != PM_GOTHIT)
                                    StartPlrHit(pnum, 0, 1);
                                _px += offset_x[monster[i]._mdir];
                                _py += offset_y[monster[i]._mdir];
                                if (FePlayerNo && ptrplr->plractive) {
                                    PlayerStruct *plr2 = &plr[pnum ^ 1];
                                    if (plr2->plractive && !ChkPlrOffsets(_px << 3, _py << 3, plr2->WorldX, plr2->WorldY))
                                        knockOk = 0;
                                }
                                if (knockOk && PosOkPlayer(ptrplr, _px, _py)) {
                                    SetPlayerOld(ptrplr);
                                    WorldToOffset(plrind(ptrplr), (_px << 3) | 4, (_py << 3) | 4);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

/* NEW function this pass, transcribed directly from the JAP_1998_05_29
 * Ghidra decompile at this exact VA (full body available -- a much more
 * reliable source than hellfire's here, since PSX drops several
 * Hellfire-only unique-monster quest branches: hellfire's MU_SNOTSPIL/BOL
 * and MU_WARLORD blocks are ABSENT entirely, confirmed by their total
 * absence from the decompile). Quest/unique indices, MFLAG_DROP=0x40, and
 * the numeric literals for `_qactive`/`_qvar1`/`_qvar2` are transcribed
 * literally from the decompile (`'\x02'`, `'\x03'`, etc render as plain
 * ints here, matching this file's own established style of not naming
 * every qvar magic number -- see MAI_Round's `quests[Q_GARBUD]._qvar1=5`
 * for precedent). One Ghidra-decompiler subtlety resolved by hand: the
 * `UMT_INDEX8`/quest-11 block prints as `if (cond1 && (write, cond2))
 * NetSendCmdQuest(...)` -- a comma-operator artifact of a C construct like
 * `if (mName==...) { quests[11]._qvar1=2; if(!deltaload)
 * NetSendCmdQuest(1,8); }`: the qvar1 WRITE is unconditional once the name
 * matches, only the network send is deltaload-gated (confirmed by the
 * write executing whether or not deltaload is set, per the comma-operator
 * semantics of C's `a, b` evaluating `a` unconditionally). Two
 * struct/extern additions needed: `TextDataStruct` (12-byte PSX layout,
 * already used by minitext.cpp) added to structs_monster.h for `alltext[]`,
 * plus `extern char TransVal;`/`extern struct TextDataStruct alltext[269];`
 * to externs_monster.h and SpawnUnique/InitQTextMsg/DRLG_MRectTrans/
 * ObjChangeMap prototypes to protos_monster.h (bodies live in
 * items.cpp/minitext.cpp/objects.cpp). BYTE-VERIFIED this pass: SYM OPEN
 * (length 0x5b0 vs retail 0x5a4, 3 over); bytes OPEN (143 diffs, ours 364
 * / oracle 361) -- a strong first-pass landing for a 361-insn function
 * transcribed cold. callaudit: 0/103 mismatches tree-wide (call list/order
 * exact on the first try). Tried introducing a persistent `MonsterStruct
 * *Monst = &monster[i];` (SYM lists a `Monst` REG local sharing $s0 with
 * `tren` in disjoint scopes, suggesting a real pointer) and rewriting every
 * `monster[i].field` to `Monst->field` -- made it drastically WORSE (143->
 * 365 diffs, insn count fell to 280, far under target) -- reverted. Same
 * lesson as M_TryH2HHit's `pMonster`: whatever SYM's `Monst`/$s0 really is,
 * it is NOT a function-lifetime cached pointer the source can spell as a
 * literal `MonsterStruct*` local; direct `monster[i].field` indexing
 * (letting the compiler re-derive/CSE the pointer on demand) is closer to
 * retail's real codegen. Residual (143 diffs, 3 over): whole-function
 * register-coloring, same class as every other near-miss in this file --
 * not chased further this pass (landing a near-miss, not a seal, per the
 * priority). */
int M_DoTalk(int i)
{
    int _mx = monster[i]._mx;
    int _my = monster[i]._my;
    unsigned int mName = monster[i].mName;

    M_StartStand(i, monster[i]._mdir);
    monster[i]._mgoal = MG_WAITTOTALK;
    if (!effect_is_playing(alltext[monster[i].mtalkmsg].sfxnr)) {
        InitQTextMsg(monster[i].mtalkmsg);

        if (mName == (unsigned int)UniqMonst[UMT_GARBUD].mName) {
            if (monster[i].mtalkmsg == TXT_GARB1) {
                quests[Q_GARBUD]._qactive = 2;
                quests[Q_GARBUD]._qvar1 = 2;
                quests[Q_GARBUD]._qlog = 1;
                if (!deltaload)
                    NetSendCmdQuest(1, Q_GARBUD);
            }
            if (monster[i].mtalkmsg == TXT_GARB2 && !(monster[i]._mFlags & MFLAG_DROP)) {
                quests[Q_GARBUD]._qvar1 = 3;
                if (!deltaload)
                    NetSendCmdQuest(1, Q_GARBUD);
                SpawnItem(i, _mx + 1, _my + 1, 1);
                monster[i]._mFlags |= MFLAG_DROP;
            }
        }
        if (mName == (unsigned int)UniqMonst[UMT_ZHAR].mName && monster[i].mtalkmsg == TXT_ZHAR1
            && !(monster[i]._mFlags & MFLAG_DROP)) {
            quests[Q_ZHAR]._qactive = 2;
            quests[Q_ZHAR]._qlog = 1;
            quests[Q_ZHAR]._qvar2 = 2;
            if (!deltaload) {
                NetSendCmdQuest(1, Q_ZHAR);
                CreateTypeItem(_mx + 1, _my + 1, 0, 0, 0x18, 1, 0);
            }
            monster[i]._mFlags |= MFLAG_DROP;
        }
        if (mName == (unsigned int)UniqMonst[3].mName && monster[i].mtalkmsg == TXT_BOL1
            && !(monster[i]._mFlags & MFLAG_DROP)) {
            char tren;

            ObjChangeMap(setpc_x, setpc_y, setpc_x + (setpc_w >> 1) + 2, setpc_y + (setpc_h >> 1) - 2);
            tren = TransVal;
            TransVal = 9;
            DRLG_MRectTrans(setpc_x, setpc_y, setpc_x + (setpc_w >> 1) + 4, setpc_y + (setpc_h >> 1));
            quests[Q_LTBANNER]._qvar1 = 2;
            if (quests[Q_LTBANNER]._qactive == 1)
                quests[Q_LTBANNER]._qactive = 2;
            TransVal = tren;
            monster[i]._mFlags |= MFLAG_DROP;
            NetSendCmdQuest(1, Q_LTBANNER);
        }
        if (mName == (unsigned int)UniqMonst[7].mName) {
            if (monster[i].mtalkmsg == TXT_VEIL1) {
                quests[Q_VEIL]._qactive = 2;
                quests[Q_VEIL]._qlog = 1;
                if (!deltaload)
                    NetSendCmdQuest(1, Q_VEIL);
            }
            if (monster[i].mtalkmsg == TXT_VEIL3 && !(monster[i]._mFlags & MFLAG_DROP)) {
                SpawnUnique(6, _mx + 1, _my + 1);
                monster[i]._mFlags |= MFLAG_DROP;
            }
        }
        if (mName == (unsigned int)UniqMonst[8].mName) {
            quests[11]._qvar1 = 2;
            if (!deltaload)
                NetSendCmdQuest(1, 8);
        }
        if (mName == (unsigned int)UniqMonst[4].mName && gbMaxPlayers != 1) {
            quests[Q_BETRAYER]._qvar1 = 6;
            if (!deltaload)
                NetSendCmdQuest(1, Q_BETRAYER);
            monster[i]._mgoal = MG_ATTACK;
            monster[i]._msquelch = 255;
            monster[i].mtalkmsg = 0;
        }
    }
    return 0;
}

/* NEW function this pass. SYM OPEN (length 0x4dc vs 0x4cc); bytes OPEN (46
 * diffs, ours 311 / oracle 307, 4 insns over -- was 312/39-diffs before
 * trying the PlayerStruct *p1 lever, which helped by 1 insn) -- very close for a
 * 307-instruction function transcribed cold from the raw oracle (hellfire
 * has NO twin for this exact shape; devilution's non-HELLFIRE MissToMonst
 * was used for the overall structure, PSX-specific pieces verified
 * byte-by-byte). Confirmed PSX-only additions from raw bytes: (1)
 * `Monst->_mxoff/_myoff/_mAnimFrame` copied from the dying MISSILE's
 * `_mixoff/_miyoff/_miAnimFrame` right after `M_StartStand` -- a seamless
 * visual-transition detail absent from both twins; (2) the whole
 * player-knockback tail is NOT devilution's
 * `_px=newx;_py=newy;FixPlayerLocation();FixPlrWalkTags();dPlayer=...;
 * SetPlayerOld();` -- PSX replaces it with a `KnockOk` flag gated by an
 * OPTIONAL split-screen proximity check (`if (FePlayerNo) { if
 * (plr[pnum].plractive && plr[pnum^1].plractive) if
 * (ChkPlrOffsets(newx<<3, otherWorldX, otherWorldY, newy<<3)) KnockOk=0; }`)
 * followed by `PosOkPlayer`+`SetPlayerOld`+`WorldToOffset(pnum,(newx<<3)|4,
 * (newy<<3)|4)` -- confirmed via the exact call list (`jal` scan) and the
 * `|4` half-tile-center encoding on the WorldToOffset args. `dPlayer[][]`
 * reads are all replaced by `IsDplayer()` calls (called 4 TIMES total in the
 * H2H branch, matching the raw call count exactly -- do not try to cache
 * the result in fewer calls, retail genuinely re-calls it each time,
 * confirmed from the `jal IsDplayer` count). Remaining 5-insn gap: the
 * `plr[pnum].plractive` check appears to reuse an ALREADY-computed
 * PlayerStruct stride from the earlier `_pmode`/`StartPlrHit` prep. Tried
 * wrapping `_pmode`+`StartPlrHit`+the whole FePlayerNo block in one scope
 * with `PlayerStruct *p1=&plr[pnum];` reused for both `_pmode` and
 * `plractive` -- improved 312->311 (39->46 diffs, oddly more diff LINES for
 * fewer total insns, i.e. the remaining mismatch moved around) but did not
 * close it. Next angle: check whether oracle's `s3` reuse crosses the
 * `StartPlrHit` CALL itself (a real callee-saved register surviving the
 * call, which a local pointer variable should already achieve) or whether
 * it's actually a raw stride int reused via `plr+stride` arithmetic rather
 * than a `PlayerStruct*` -- try an `int pstride` int-offset version next,
 * matching the M2MStartKill `omp` lesson (plain int stride, not a typed
 * pointer). */
void MissToMonst(int i, int x, int y)
{
    int oldx;
    int oldy;
    int newx;
    int newy;
    MissileStruct *Miss = &missile[i];
    int m = Miss->_misource;
    MonsterStruct *Monst = &monster[m];
    int pnum;
    unsigned char KnockOk;

    oldx = Miss->_mix;
    oldy = Miss->_miy;

    dung_map[x][y].dMonster = m + 1;

    Monst->_mdir = Miss->_mimfnum;
    Monst->_mx = x;
    Monst->_my = y;
    Monst->_mxoff = Miss->_mixoff;
    Monst->_myoff = Miss->_miyoff;
    Monst->_mAnimFrame = Miss->_miAnimFrame;
    M_StartStand(m, Monst->_mdir);

    if (Monst->MType->mtype >= MT_INCIN && Monst->MType->mtype <= MT_HELLBURN) {
        M_StartFadein(m, Monst->_mdir, 0);
    } else {
        if (!(Monst->_mFlags & MFLAG_TARGETS_MONSTER))
            M_StartHit(m, -1, 0);
        else
            M2MStartHit(m, -1, 0);
    }

    if (!(Monst->_mFlags & MFLAG_TARGETS_MONSTER)) {
        pnum = IsDplayer(oldx, oldy) - 1;
        if (IsDplayer(oldx, oldy)
            && Monst->MType->mtype != MT_GLOOM
            && !(Monst->MType->mtype >= MT_INCIN && Monst->MType->mtype <= MT_HELLBURN)) {
            M_TryH2HHit(m, IsDplayer(oldx, oldy) - 1, 500, Monst->mMinDamage2, Monst->mMaxDamage2);

            if (pnum == IsDplayer(oldx, oldy) - 1
                && !(Monst->MType->mtype >= MT_NSNAKE && Monst->MType->mtype <= MT_GSNAKE)) {
                KnockOk = 1;
                {
                    PlayerStruct *p1 = &plr[pnum];
                    if (p1->_pmode != PM_GOTHIT && p1->_pmode != PM_DEATH)
                        StartPlrHit(pnum, 0, 1);

                    newx = oldx + offset_x[Monst->_mdir];
                    newy = oldy + offset_y[Monst->_mdir];
                    if (FePlayerNo) {
                        int other = pnum ^ 1;
                        if (p1->plractive && plr[other].plractive) {
                            if (ChkPlrOffsets(newx << 3, plr[other].WorldX, plr[other].WorldY, newy << 3))
                                KnockOk = 0;
                        }
                    }
                }
                if (KnockOk) {
                    if (PosOkPlayer(pnum, newx, newy)) {
                        SetPlayerOld(pnum);
                        WorldToOffset(pnum, (newx << 3) | 4, (newy << 3) | 4);
                    }
                }
            }
        }
    } else {
        if (dung_map[oldx][oldy].dMonster > 0
            && Monst->MType->mtype != MT_GLOOM
            && !(Monst->MType->mtype >= MT_INCIN && Monst->MType->mtype <= MT_HELLBURN)) {
            M_TryM2MHit(m, dung_map[oldx][oldy].dMonster - 1, 500, Monst->mMinDamage2, Monst->mMaxDamage2);
            if (!(Monst->MType->mtype >= MT_NSNAKE && Monst->MType->mtype <= MT_GSNAKE)) {
                newx = oldx + offset_x[Monst->_mdir];
                newy = oldy + offset_y[Monst->_mdir];
                if (PosOkMonst(dung_map[oldx][oldy].dMonster - 1, newx, newy)) {
                    pnum = dung_map[newx][newy].dMonster = dung_map[oldx][oldy].dMonster;
                    dung_map[oldx][oldy].dMonster = 0;
                    pnum--;
                    monster[pnum]._mfutx = monster[pnum]._mx = newx;
                    monster[pnum]._mfuty = monster[pnum]._my = newy;
                }
            }
        }
    }
}

/* NEW this pass, hellfire twin used verbatim. SYM OPEN (len 0x39c vs
 * 0x3b4); bytes OPEN (24 diffs, ours 235 / oracle 237, 2 short -- was 52
 * diffs/231 before fixing a real bug: WALKMODE was undefined as a macro in
 * this file, so g++ treated `WALKMODE(Monst->_mVar1)` as an IMPLICIT
 * FUNCTION CALL to a nonexistent `WALKMODE` symbol (silent warning only,
 * would have failed at link time and was semantically wrong regardless --
 * added `#define WALKMODE(m) ((m)==MM_WALK||(m)==MM_WALK2||(m)==MM_WALK3)`
 * near the other MM_ defines, matching the established idiom name from
 * memory notes that had never actually been added to this TU). Logic
 * fully verified: opposite/left/right[md] all written as the established
 * (md+4)&7 / (md-1)&7 / (md+1)&7 idiom (not array lookups), MIT_RHINO
 * missile-transform tail sets `dung_map[...].dMonster=~i` (bitwise NOT,
 * matches devilution's `-(i+1)`) AND `Monst->Action=5` (a PSX-only "flying"
 * render-state marker, absent from both twins, confirmed from raw bytes).
 * NOW PASS+SYM: the missile check's distance test was inverted -- retail
 * (like devilution) fires the gloom missile only when the target is FAR:
 * `(abs(mx) >= 5 || abs(my) >= 5) && v < 4 * _mint + 33`. The old
 * "register-naming artifact" was just that logic bug. Note: retail re-reads
 * _menemyx/_menemyy separately in the two spots (hoisting made it worse). */
void MAI_Bat(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mx, my, md, v, pnum;
    int fx, fy;

    pnum = Monst->_menemy;
    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        mx = Monst->_mx - Monst->_menemyx;
        my = Monst->_my - Monst->_menemyy;
        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);
        Monst->_mdir = md;
        v = ENG_random(100);
        if (Monst->_mgoal == MG_RUN_AWAY) {
            if (!Monst->_mgoalvar1) {
                M_CallWalk(i, (md + 4) & 7);
                ++Monst->_mgoalvar1;
            } else {
                if (ENG_random(2))
                    M_CallWalk(i, (md - 1) & 7);
                else
                    M_CallWalk(i, (md + 1) & 7);
                Monst->_mgoal = MG_ATTACK;
            }
        } else {
            fx = Monst->_menemyx;
            fy = Monst->_menemyy;
            if (Monst->MType->mtype == MT_GLOOM
                && (abs(mx) >= 5 || abs(my) >= 5) && v < 4 * Monst->_mint + 33
                && LineClearF1(PosOkMonst, i, Monst->_mx, Monst->_my, fx, fy)) {
                if (AddMissile(Monst->_mx, Monst->_my, fx, fy, md, MIT_RHINO, pnum, i, 0, 0) != -1) {
                    dung_map[Monst->_mx][Monst->_my].dMonster = ~i;
                    Monst->_mmode = MM_MISSILE;
                    Monst->Action = 5;
                }
            } else if (abs(mx) < 2 && abs(my) < 2) {
                if (v < 8 + 4 * Monst->_mint) {
                    M_StartAttack(i);

                    Monst->_mgoal = MG_RUN_AWAY;
                    Monst->_mgoalvar1 = 0;

                    if (Monst->MType->mtype == MT_FAMILIAR) {
                        AddMissile(Monst->_menemyx, Monst->_menemyy, Monst->_menemyx + 1, 0, -1, MIT_LIGHTNING, MI_ENEMYPLR, i, ENG_random(10) + 1, 0);
                    }
                }
            } else {
                if ((Monst->_mVar2 > 20 && v < (13 + Monst->_mint))
                    || (WALKMODE(Monst->_mVar1) && Monst->_mVar2 == 0 && v < (63 + Monst->_mint))) {
                    M_CallWalk(i, md);
                }
            }
            if (Monst->_mmode == MM_STAND)
                Monst->Action = 0;
        }
    }
}

void MAI_Snake(int i)
{
    MonsterStruct *Monst = &monster[i];
    int fx, fy, mx, my, md, pnum;
    char pattern[] = { +1, +1, 0, -1, -1, 0 };
    int tmp;

    pnum = Monst->_menemy;
    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = Monst->_mx - fx;
        my = Monst->_my - fy;

        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);
        Monst->_mdir = md;
        if (abs(mx) < 2 && abs(my) < 2) {
            if (Monst->_mVar1 == MM_DELAY
                || Monst->_mVar1 == MM_MISSILE
                || ENG_random(100) < 20 + Monst->_mint)
                M_StartAttack(i);
            else
                M_StartDelay(i, ENG_random(10) + 10 - Monst->_mint);
        } else if (abs(mx) < 3 && abs(my) < 3
                   && LineClearF1(PosOkMonst, i, Monst->_mx, Monst->_my, fx, fy)
                   && Monst->_mVar1 != MM_MISSILE) {
            if (AddMissile(Monst->_mx, Monst->_my, fx, fy, md, MIT_RHINO, pnum, i, 0, 0) != -1) {
                PlayEffect(i, MS_ATTACK);
                dung_map[Monst->_mx][Monst->_my].dMonster = ~i;
                Monst->_mmode = MM_MISSILE;
            }
        } else {
            if (Monst->_mVar1 != MM_DELAY && ENG_random(100) < 35 - 2 * Monst->_mint)
                M_StartDelay(i, ENG_random(10) + 15 - Monst->_mint);
            else {
                md = Mod(md + pattern[Monst->_mgoalvar1], 8);
                if (++Monst->_mgoalvar1 > 5)
                    Monst->_mgoalvar1 = 0;
                tmp = Mod(md - Monst->_mgoalvar2, 8);
                if (tmp > 0) {
                    if (tmp < 4)
                        Monst->_mgoalvar2 = Mod(Monst->_mgoalvar2 + 1, 8);
                    else if (tmp == 4)
                        Monst->_mgoalvar2 = md;
                    else
                        Monst->_mgoalvar2 = Mod(Monst->_mgoalvar2 - 1, 8);
                }
                if (!M_DumbWalk(i, Monst->_mgoalvar2))
                    M_CallWalk2(i, Monst->_mdir);
            }
        }
        if (Monst->_mmode == MM_STAND)
            Monst->Action = 0;
    }
}

/* NEW this pass, using JAP_1998_05_29 Ghidra decompile (matches our VAs
 * exactly) plus hellfire for control-flow shape. SYM OPEN (len 0x3c0 vs
 * 0x3c4); bytes OPEN (5 diffs, ours 240 / oracle 241, 1 insn short --
 * pure `done` register naming, s1 vs s3). Confirmed PSX-specific from the
 * JAP decompile (differs from hellfire's LIVE code, matches hellfire's own
 * COMMENTED-OUT alternate line): the eat-tick heals a FIXED +0x40 (not
 * `MType->mMaxHP>>3`), and the "done eating" gate is `_mhitpoints >=
 * (_mmaxhp>>1)+(_mmaxhp>>2)` (75% threshold) rather than `==_mmaxhp`; the
 * mmaxhp-clamp and dDead-clear ("monster buried") lines are ABSENT
 * entirely. `dDead[][]` is uniformly replaced by `GetdDead(x,y)` calls
 * (3 call sites, matches raw `jal` count). Real structural bug fixed
 * during transcription: the trailing `MAI_SkelSd(i)` call is NOT
 * hellfire's simple `else MAI_SkelSd(i)` -- it's a fresh, unconditional
 * `if (Monst->_mmode == MM_STAND) MAI_SkelSd(i);` re-check AFTER the whole
 * `if (goal==EAT && goalvar3) {...}` block (confirmed directly from the
 * JAP Ghidra decompile's shared `LAB_80152014` tail, reached by every exit
 * path including successful completion of the walk/eat logic, not just
 * the "goal!=EAT" failure path).
 * SEALED this pass: PASS bytes (241/241) + SYM ok. Closed the final 1-short
 * gap: retail zero-inits BOTH `done` (early, before `Monst` is even
 * computed) AND `x` (late, right after the `_mmode==MM_STAND` guard,
 * before the hitpoints compare) -- `x` was never explicitly zeroed in the
 * prior draft. Statement-execution order (not declaration order) controls
 * WHICH zero-init gets scheduled early by gcc: `done=0;` must be the very
 * first statement, `Monst=&monster[i];` second, `x=0;` third, while the
 * DECLARATION order must stay Monst,x,y,done to match the SYM local-record
 * order -- so declarations and their assignments were split apart. */
void MAI_Scav(int i)
{
    MonsterStruct *Monst;
    int x, y;
    unsigned char done;

    done = 0;
    Monst = &monster[i];
    x = 0;
    if (Monst->_mmode == MM_STAND) {
        if (Monst->_mhitpoints < (Monst->_mmaxhp >> 1) && Monst->_mgoal != MG_EAT) {
            if (monster[i].leaderflag) {
                --monster[monster[i].leader].packsize;
                monster[i].leaderflag = 0;
            }
            Monst->_mgoal = MG_EAT;
            Monst->_mgoalvar3 = 10;
        }

        if (Monst->_mgoal == MG_EAT && Monst->_mgoalvar3) {
            --Monst->_mgoalvar3;

            if (GetdDead(Monst->_mx, Monst->_my)) {
                M_StartEat(i);
                if (!(monster[i]._mFlags & MFLAG_NOHEAL)) {
                    Monst->_mhitpoints += 0x40;
                }
                if (Monst->_mhitpoints >= (Monst->_mmaxhp >> 1) + (Monst->_mmaxhp >> 2)) {
                    Monst->_mgoal = MG_ATTACK;
                    Monst->_mgoalvar1 = 0;
                    Monst->_mgoalvar2 = 0;
                }
            } else {
                if (!Monst->_mgoalvar1) {
                    if (ENG_random(2)) {
                        for (y = -4; y <= 4 && !done; ++y)
                            for (x = -4; x <= 4 && !done; ++x)
                                if (InBounds(x, y))
                                    done = GetdDead(Monst->_mx + x, Monst->_my + y)
                                        && LineClearF(CheckNoSolid, Monst->_mx, Monst->_my, Monst->_mx + x, Monst->_my + y);
                        --x;
                        --y;
                    } else {
                        for (y = 4; y >= -4 && !done; --y)
                            for (x = 4; x >= -4 && !done; --x)
                                if (InBounds(x, y))
                                    done = GetdDead(Monst->_mx + x, Monst->_my + y)
                                        && LineClearF(CheckNoSolid, Monst->_mx, Monst->_my, Monst->_mx + x, Monst->_my + y);
                        ++x;
                        ++y;
                    }
                    if (done) {
                        Monst->_mgoalvar1 = Monst->_mx + x + 1;
                        Monst->_mgoalvar2 = Monst->_my + y + 1;
                    }
                }
                if (Monst->_mgoalvar1) {
                    x = Monst->_mgoalvar1 - 1;
                    y = Monst->_mgoalvar2 - 1;
                    Monst->_mdir = GetDirection(Monst->_mx, Monst->_my, x, y);
                    M_CallWalk(i, Monst->_mdir);
                }
            }
        }
        if (Monst->_mmode == MM_STAND)
            MAI_SkelSd(i);
    }
}

/* NEW this pass, hellfire structure + JAP_1998_05_29 Ghidra decompile for
 * PSX-specific tweaks. Frame-size gap mostly closed this pass: `_mx`/`_my`
 * are `Monst->_mx`/`Monst->_my` cached UNCONDITIONALLY at the very top,
 * before the `_mmode`/`_msquelch` guard, confirmed from the raw oracle
 * (`lb s3,0x34(s1)` for `_mx` happens right after establishing `Monst`,
 * before the mode check) -- same "speculative read before guard" lever as
 * M_StartHit/M2MStartHit/MAI_SkelKing. Confirmed PSX-specific from
 * the JAP decompile (absent from hellfire): on a successful missile
 * launch, `Monst->Action=5` (the same "flying" marker seen in
 * MAI_Bat/MAI_Snake/M2MStartHit) and `Monst->_mdir = missile[mi]._mimfnum`
 * (re-read from the just-spawned missile, NOT the local `md` used for the
 * AddMissile call itself).
 * FURTHER THIS PASS: found and fixed a real bug -- the cache lines had been
 * left as a no-op self-assignment `_mx = _mx; _my = _my;` (never actually
 * reading `Monst->_mx`/`_my`); fixed to `_mx = Monst->_mx; _my = Monst->_my;`
 * -- this alone dropped 79->12 diffs. Also fixed store ORDER on the missile
 * branch: retail sets `Monst->_mdir = missile[mi]._mimfnum;` BEFORE
 * `Monst->Action = 5;` (opposite of the read order suggested by hellfire) --
 * 12->4 diffs. NOW PASS+SYM: the last 4 diffs (the `_mx` save+load hoisted
 * above the other prologue stores) are fixed by the const-view _mx/_my read
 * (see MAI_Lachdanan); the SYM block tree is fixed by declaring `mi` inside
 * the missile-branch `if` body (retail's nested blocks are just g++'s
 * binding levels kept alive by that inner declaration). */
void MAI_Rhino(int i)
{
    int fx, fy, mx, my, md, v;
    int dist;
    MonsterStruct *Monst = &monster[i];
    int _mx;
    int _my;

    _mx = ((const MonsterStruct *)Monst)->_mx;
    _my = ((const MonsterStruct *)Monst)->_my;
    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = _mx - fx;
        my = _my - fy;
        md = GetDirection(_mx, _my, Monst->_lastx, Monst->_lasty);

        if (Monst->_msquelch < 255)
            MonstCheckDoors(i);

        v = ENG_random(100);
        if (abs(mx) < 2 && abs(my) < 2) {
            Monst->_mgoal = MG_ATTACK;
        } else if (Monst->_mgoal == MG_WALK_AROUND1
                   || (!(abs(mx) < 5 && abs(my) < 5) && ENG_random(4))) {
            if (Monst->_mgoal != MG_WALK_AROUND1) {
                Monst->_mgoalvar1 = 0;
                Monst->_mgoalvar2 = ENG_random(2);
            }

            Monst->_mgoal = MG_WALK_AROUND1;

            dist = abs(mx) > abs(my) ? abs(mx) : abs(my);

            if ((Monst->_mgoalvar1++ >= (dist << 1))
                || dung_map[_mx][_my].dTransVal != dung_map[fx][fy].dTransVal) {
                Monst->_mgoal = MG_ATTACK;
            } else if (!M_RoundWalk(i, md, Monst->_mgoalvar2))
                M_StartDelay(i, ENG_random(10) + 10);
        }
        if (Monst->_mgoal == MG_ATTACK) {
            if (!(abs(mx) < 5 && abs(my) < 5) && v < 43 + 2 * Monst->_mint
                && LineClearF1(PosOkMonst, i, _mx, _my, fx, fy)) {
                int mi = AddMissile(_mx, _my, fx, fy, md, MIT_RHINO, Monst->_menemy, i, 0, 0);
                if (mi != -1) {
                    if (Monst->MData->snd_special)
                        PlayEffect(i, MS_SATTACK);
                    dung_map[_mx][_my].dMonster = ~i;
                    Monst->_mmode = MM_MISSILE;
                    Monst->_mdir = missile[mi]._mimfnum;
                    Monst->Action = 5;
                }
            } else if (abs(mx) < 2 && abs(my) < 2) {
                if (v < 28 + 2 * Monst->_mint) {
                    Monst->_mdir = md;
                    M_StartAttack(i);
                }
            } else if ((v = ENG_random(100)) < (33 + 2 * Monst->_mint)
                       || (WALKMODE(Monst->_mVar1) && Monst->_mVar2 == 0 && v < (83 + 2 * Monst->_mint))) {
                M_CallWalk(i, md);
            } else {
                M_StartDelay(i, ENG_random(10) + 10);
            }
        }

        if (Monst->_mmode == MM_STAND)
            Monst->Action = 0;
    }
}

void MAI_RR2(int i, int mistype, int dam)
{
    int fx, fy, mx, my, md, v;
    int dist;
    MonsterStruct *Monst = &monster[i];

    mx = Monst->_mx - Monst->_menemyx;
    my = Monst->_my - Monst->_menemyy;
    if (!(abs(mx) < 5 && abs(my) < 5))
        MAI_SkelSd(i);
    else if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = Monst->_mx - fx;
        my = Monst->_my - fy;
        md = GetDirection(Monst->_mx, Monst->_my, Monst->_lastx, Monst->_lasty);

        if (Monst->_msquelch < 255)
            MonstCheckDoors(i);

        v = ENG_random(100);
        if ((abs(mx) < 2 && abs(my) < 2)
            || Monst->_msquelch != 255
            || dung_map[Monst->_mx][Monst->_my].dTransVal != dung_map[fx][fy].dTransVal) {
            Monst->_mgoal = MG_ATTACK;
        } else if (Monst->_mgoal == MG_WALK_AROUND1 || !(abs(mx) < 3 && abs(my) < 3)) {
            if (Monst->_mgoal != MG_WALK_AROUND1) {
                Monst->_mgoalvar1 = 0;
                Monst->_mgoalvar2 = ENG_random(2);
            }

            Monst->_mgoal = MG_WALK_AROUND1;
            Monst->_mgoalvar3 = MG_WALK_AROUND1;

            dist = abs(mx) > abs(my) ? abs(mx) : abs(my);

            if (Monst->_mgoalvar1++ >= (dist << 1) && DirOK(i, md)) {
                Monst->_mgoal = MG_ATTACK;
            } else if (v < 80 + 5 * Monst->_mint)
                M_RoundWalk(i, md, Monst->_mgoalvar2);
        }
        if (Monst->_mgoal == MG_ATTACK) {
            if (((!(abs(mx) < 3 && abs(my) < 3) && v < 10 + 5 * Monst->_mint)
                 || v < 5 + 5 * Monst->_mint
                 || Monst->_mgoalvar3 == MG_WALK_AROUND1)
                && LineClear(Monst->_mx, Monst->_my, fx, fy)) {
                M_StartRSpAttack(i, mistype, dam);
            } else if (abs(mx) < 2 && abs(my) < 2) {
                if (ENG_random(100) < 40 + 10 * Monst->_mint) {
                    Monst->_mdir = md;
                    if (ENG_random(2))
                        M_StartAttack(i);
                    else
                        M_StartRSpAttack(i, mistype, dam);
                }
            } else if ((v = ENG_random(100)) < (50 + 10 * Monst->_mint)
                       || (WALKMODE(Monst->_mVar1) && Monst->_mVar2 == 0 && v < (80 + 10 * Monst->_mint))) {
                M_CallWalk(i, md);
            }
            Monst->_mgoalvar3 = MG_ATTACK;
        }

        if (Monst->_mmode == MM_STAND)
            M_StartDelay(i, ENG_random(10) + 5);
    }
}

/* NEW this pass, hellfire structure + JAP_1998_05_29 for PSX-specific
 * spawn-gating. Frame-size gap CLOSED this pass: `_mx`/`_my` are
 * `Monst->_mx`/`Monst->_my` cached UNCONDITIONALLY at the very top of the
 * function (before the `_mmode==MM_STAND` guard even), matching the
 * established "speculative read before guard" lever from M_StartHit/
 * M2MStartHit -- confirmed from the raw oracle (`lb s2,0x34(s1); lb
 * t0,0x35(s1)` happen BEFORE the `_mmode` check), then reused everywhere
 * `Monst->_mx`/`_my` would otherwise be re-read. Confirmed PSX-specific
 * from the JAP decompile (absent from hellfire): the skeleton-spawn is
 * gated on `GetdDead(nx,ny)` (a corpse must be present at the spawn tile)
 * and, on success, `SetdDead(nx,ny,0)` clears it -- hellfire spawns
 * unconditionally once `PosOkMonst && nummonsters<MAXMONSTERS` pass, with
 * no corpse requirement at all; `M_StartSpStand(i,md)` only fires inside
 * the `GetdDead` branch, not unconditionally after `PosOkMonst`.
 * REAL BUG FOUND+FIXED this pass (post-git-stash-incident merge damage,
 * same class as MAI_Rhino): the `_mx`/`_my` cache lines had regressed to a
 * no-op self-assignment `_mx = _mx; _my = _my;` (compiler treats it as dead
 * -- _mx/_my held UNINITIALIZED garbage at every use site: dung_map[][]
 * indexing, LineClear, nx/ny offset math -- a real correctness bug, not
 * just a coloring artifact) -- fixed to `_mx = Monst->_mx; _my = Monst->_my;`.
 * This makes insn COUNT exact (335/335, was 331/335 wrong-length) but the
 * newly-live real values raise register pressure enough that gcc's
 * allocator diverges further from retail's choices: SYM DIFF (`i` lands on
 * $s3 not retail's $s4 -- register numbering shifted by one across the
 * whole function) and bytes regressed to 168 diffs (was 116 with the
 * broken/dead version, which was closer only by chance since the "cache"
 * was inert). OPEN. FALSIFIED: no reordering attempted yet beyond
 * confirming declaration order already matches SYM (fx,fy,mx,my,md,v,dist,
 * Monst,nx,ny,_mx,_my). NEXT ANGLE: retail spills `_my`/`fy` to the stack
 * (SYM AUTO, not REG) while ours may be keeping different locals in
 * registers under the new (correct) live-range pressure -- try forcing
 * `nx`/`ny` (SYM wants them as REG $s2/$s0, ours currently spills them to
 * sp+24/sp+16 per the raw diff) back into registers by shrinking their
 * live range or restructuring the `GetdDead`/`SetdDead`/`M_StartSpStand`
 * block; this is permuter/register-coloring territory per the methodology
 * doc's "PERMUTER PLATEAU is a SMELL" class, not a structural miss. */
void MAI_SkelKing(int i)
{
    int fx, fy, mx, my, md, v;
    int dist;
    MonsterStruct *Monst = &monster[i];
    int nx, ny;
    int _mx, _my;
    int skel;

    _mx = Monst->_mx;
    _my = Monst->_my;
    if (Monst->_mmode == MM_STAND && Monst->_msquelch) {
        fx = Monst->_menemyx;
        fy = Monst->_menemyy;
        mx = _mx - fx;
        my = _my - fy;
        md = GetDirection(_mx, _my, Monst->_lastx, Monst->_lasty);

        if (Monst->_msquelch < 255)
            MonstCheckDoors(i);

        v = ENG_random(100);
        if ((abs(mx) < 2 && abs(my) < 2)
            || Monst->_msquelch != 255
            || dung_map[_mx][_my].dTransVal != dung_map[fx][fy].dTransVal) {
            Monst->_mgoal = MG_ATTACK;
        } else if (Monst->_mgoal == MG_WALK_AROUND1 || (!(abs(mx) < 3 && abs(my) < 3) && !ENG_random(4))) {
            if (Monst->_mgoal != MG_WALK_AROUND1) {
                Monst->_mgoalvar1 = 0;
                Monst->_mgoalvar2 = ENG_random(2);
            }

            Monst->_mgoal = MG_WALK_AROUND1;

            dist = abs(mx) > abs(my) ? abs(mx) : abs(my);

            if ((Monst->_mgoalvar1++ >= (dist << 1) && DirOK(i, md))
                || dung_map[_mx][_my].dTransVal != dung_map[fx][fy].dTransVal) {
                Monst->_mgoal = MG_ATTACK;
            } else if (!M_RoundWalk(i, md, Monst->_mgoalvar2))
                M_StartDelay(i, ENG_random(10) + 10);
        }
        if (Monst->_mgoal == MG_ATTACK) {
            if (gbMaxPlayers == 1
                && ((!(abs(mx) < 3 && abs(my) < 3) && v < 35 + 4 * Monst->_mint) || v < 6)
                && LineClear(_mx, _my, fx, fy)) {
                nx = _mx + offset_x[md];
                ny = _my + offset_y[md];
                if (PosOkMonst(i, nx, ny) && nummonsters < 190) {
                    if (GetdDead(nx, ny)) {
                        skel = M_SpawnSkel(nx, ny, md);
                        if (skel != -1)
                            SetdDead(nx, ny, 0);
                        M_StartSpStand(i, md);
                    }
                }
            } else if (abs(mx) < 2 && abs(my) < 2) {
                if (v < 20 + Monst->_mint) {
                    Monst->_mdir = md;
                    M_StartAttack(i);
                }
            } else if ((v = ENG_random(100)) < (25 + Monst->_mint)
                       || (WALKMODE(Monst->_mVar1) && Monst->_mVar2 == 0 && v < (75 + Monst->_mint))) {
                M_CallWalk(i, md);
            } else
                M_StartDelay(i, ENG_random(10) + 10);
        }

        if (Monst->_mmode == MM_STAND)
            Monst->Action = 0;
    }
}

/* NEW this pass, entirely from JAP_1998_05_29 (hellfire's MAI_Golum uses a
 * completely DIFFERENT targeting mechanism -- MAI_Path/M_Enemy -- confirmed
 * NOT the twin here; PSX genuinely repurposes the player-cursor-selection
 * globals `myplr`/`sel_data`/`_pcursmonst[]` for AI enemy-finding via
 * `CheckArea`+`gSameRoom`, a mechanism absent from both devilution and
 * hellfire). SYM OPEN (length 0x560 vs retail 0x52c); bytes OPEN (297 diffs,
 * ours 344 / oracle 331, 13 over -- was 382 diffs/359 insns before this
 * pass). Real fix applied: `python tools/symtypes.py fn MAI_Golum__Fi`
 * reveals a SYM-named `struct MonsterStruct *pMonster` local ($s1) this
 * reconstruction was entirely missing -- the JAP decompile's repeated
 * `monster[Monst->_menemy].field` accesses in the "chase" branch (mx/my/md
 * computation, the squelch wake, the `_lastx`/`_lasty` update, the 5x5
 * dung_map scan's `monster[mid]._msquelch=255`) are retail's bare
 * array-decay pointer `pMonster = monster;` + `pMonster[Monst->_menemy]`,
 * the SAME idiom already established in GroupUnity/M2MStartHit for this
 * class of repeated-index struct access. Applying it (7 call sites) alone
 * cut 382->297 diffs and 359->344 insns (13 over now, was 28). The earlier
 * `piVar1 = &_pcursmonst[sel_data]` pointer-hoist tried this pass (matching
 * the JAP tail `piVar1 = &_pcursmonst+sel_data; sel_data=iVar7; myplr=iVar8;
 * *piVar1=iVar16;` exactly, computing the address BEFORE the sel_data/myplr
 * restore instead of after) compiled byte-identical to the direct
 * `_pcursmonst[sel_data]=cursm;` form -- no change, reverted to the simpler
 * spelling. `nd` FOUND+APPLIED this pass (297->256 diffs, 344->345 insns,
 * 14 over now): it's in the FIRST DirOK retry loop (right after the
 * CheckArea/gSameRoom miss, `md=plr[i]._pdir; ...`), not the second. The
 * JAP decompile distinguishes `uVar9` (the one-shot `DirOK(i,mdir_00)`
 * check that only decides whether to ENTER the retry loop) from `uVar10`
 * (a SEPARATE flag initialized `=1` BEFORE that check, reset to 0 if the
 * loop is entered, reassigned every iteration, and -- critically -- it is
 * `uVar10`, not `uVar9`, that the code tests at the very end to decide
 * `goto LAB_80156fcc`). My reconstruction had collapsed both into one `ok`
 * variable; split them into `ok` (the initial DirOK call/gate) and `nd`
 * (`nd=1` before the gate, `nd=0`+loop-reassigned if the gate fails, final
 * `if (!nd) goto skip_walk;` instead of `if (!ok)`) -- behaviorally
 * identical (nd stays 1 when the loop is skipped) but matches retail's
 * real variable/register identity. Residual (256 diffs, 14 over): pure
 * scheduling -- the very top of the function reorders which independent
 * sub-expression (the `Monst` pointer's index*sizeof multiply vs the
 * `myplr`/`sel_data<<2`/`&_pcursmonst` prep) is computed first; oracle does
 * Monst-pointer-first, ours does the myplr/pcursmonst prep first. Same
 * "which sub-expression evaluates first" class as M2MStartHit/MissToMonst;
 * not a structural miss (checked: `Monst = &monster[i]` is ALREADY declared
 * before `omp`/`sdata`/`cursm`, so the statement order already matches the
 * oracle's -- this is allocator/scheduler-internal, not source-order-
 * controllable via the angles tried so far). */
void MAI_Golum(int i)
{
    MonsterStruct *Monst = &monster[i];
    int mx, my, md;
    int ok, j, k, mid;
    int cursm;
    int sdata;
    int omp;
    int nd;

    omp = myplr;
    sdata = sel_data;
    cursm = _pcursmonst[sel_data];

    if (Monst->_mx == 1 && Monst->_my == 0)
        return;

    if (Monst->_mmode == MM_DEATH)
        return;
    if (Monst->_mmode == MM_SPSTAND)
        return;
    if (Monst->_mmode >= MM_WALK && Monst->_mmode <= MM_WALK3)
        return;

    sel_data = 0;
    myplr = -1;
    _pcursmonst[0] = -1;

    if (Monst->_menemy != 0 && (monster[Monst->_menemy]._mhitpoints >> 6) < 1)
        Monst->_menemy = 0;

    if (Monst->_mmode != MM_ATTACK) {
        if (Monst->_menemy == 0 || Monst->_msquelch == 0) {
            Monst->_msquelch = 250;
            CheckArea(Monst->_mx, Monst->_my, 4, 0, -1);
            if (_pcursmonst[sel_data] > 0 && gSameRoom(_pcursmonst[sel_data], i)) {
                Monst->_menemy = _pcursmonst[sel_data];
                Monst->_menemyx = monster[_pcursmonst[sel_data]]._mfutx;
                Monst->_menemyy = monster[_pcursmonst[sel_data]]._mfuty;
                goto skip_walk;
            }
            nd = 1;
            Monst->_menemy = 0;
            md = plr[i]._pdir;
            ok = DirOK(i, md);
            if (!ok) {
                mid = 0;
                nd = 0;
                do {
                    md = mid;
                    nd = DirOK(i, md);
                    if (mid + 1 > 7)
                        break;
                    mid = md + 1;
                } while (!nd);
            }
            if (!nd)
                goto skip_walk;
        } else {
            MonsterStruct *pMonster = monster;

            mx = Monst->_mx - pMonster[Monst->_menemy]._mfutx;
            my = Monst->_my - pMonster[Monst->_menemy]._mfuty;
            md = GetDirection(Monst->_mx, Monst->_my, pMonster[Monst->_menemy]._mx, pMonster[Monst->_menemy]._my);
            Monst->_mdir = md;

            if (abs(mx) < 2 && abs(my) < 2) {
                if (pMonster[Monst->_menemy]._msquelch == 0) {
                    pMonster[Monst->_menemy]._msquelch = 255;
                    pMonster[Monst->_menemy]._lastx = Monst->_mx;
                    pMonster[Monst->_menemy]._lasty = Monst->_my;
                    for (j = 0; j < 5; j++) {
                        for (k = 0; k < 5; k++) {
                            mid = dung_map[Monst->_mx - 2 + k][Monst->_my - 2 + j].dMonster;
                            if (mid > 0)
                                pMonster[mid]._msquelch = 255;
                        }
                    }
                }
                M_StartAttack(i);
                goto skip_walk;
            }
            if (pMonster[Monst->_menemy]._msquelch == 0)
                pMonster[Monst->_menemy]._msquelch = 0;
            else
                pMonster[Monst->_menemy]._msquelch--;

            ok = DirOK(i, md);
            if (!ok) {
                mid = (md + 1) & 7;
                ok = 0;
                if (mid != md) {
                    do {
                        mid = mid & 7;
                        ok = DirOK(i, mid);
                        if (ok)
                            md = mid;
                        mid++;
                    } while (mid != md && !ok);
                }
            }
            if (!ok) {
                Monst->_menemy = 0;
                goto skip_walk;
            }
        }
        M_WalkDir(i, md);
    }
skip_walk:
    _pcursmonst[sel_data] = cursm;
    sel_data = sdata;
    myplr = omp;
}

/* NEW this pass, entirely from JAP_1998_05_29 (a full clean decompile at
 * this exact VA -- neither devilution nor hellfire show this function's
 * PSX shape closely enough to use as the primary twin). SYM OPEN (frame 64
 * vs retail 72, missing the SYM-listed `pmonster` local -- tried using a
 * block-scoped `MonsterStruct *pmonster=&monster[mi]` for the stone-transform
 * loop body, which made things WORSE (196->171 got further from 202 when
 * NOT using it, i.e. using plain `monster[mi].field` indexing throughout is
 * closer); `pmonster` must be used somewhere else in the function, not
 * identified yet). Bytes OPEN (156 diffs, ours 196 / oracle 202, 6 short).
 * Real fix applied: the per-monster loop guard is `monster[i]._msquelch`
 * (Diablo's OWN squelch, read via fresh array indexing each iteration, loop
 * -invariant) not `Monst->_msquelch` via the pointer -- using the pointer
 * form cost 25 extra instructions of divergence. The screen-pan velocity
 * calc genuinely needs a `(long long)` cast to force `__divdi3` (64-bit
 * signed division) -- confirmed present in the raw oracle's call list;
 * plain `long`/`int` division compiles to a single MIPS `div` and produces
 * a MUCH shorter (wrong) function. Formula: `_mVar5 = (long long)
 * (_mVar3 - (_mx<<16)) / j` where `j = min(20, abs(the larger of
 * ViewX-_mx, ViewY-_my))`, `_mVar8 = pnum` (confirms this IS the "reason"
 * argument PrepDoEnding later reads, per prior session notes). */
void M_DiabloDeath(int i, unsigned char sendmsg, int pnum)
{
    MonsterStruct *Monst = &monster[i];
    int _mx, _my;
    int steps;
    int j, k;

    PlaySFX(USFX_DIABLOD);
    quests[Q_DIABLO]._qactive = QUEST_DONE;
    if (sendmsg)
        NetSendCmdQuest(1, Q_DIABLO);
    gbProcessPlayers = 0;

    for (steps = 0; steps < nummonsters; steps++) {
        int mi = monstactive[steps];
        if (mi != i && monster[i]._msquelch != 0) {
            int _moldx, _moldy;

            NewMonsterAnim(mi, monster[mi].MType->Anims[MA_DEATH], monster[mi]._mdir, MA_DEATH);
            _moldx = monster[mi]._moldx;
            _moldy = monster[mi]._moldy;
            monster[mi]._mmode = MM_DEATH;
            monster[mi]._mxoff = 0;
            monster[mi]._myoff = 0;
            monster[mi]._mVar1 = 0;
            monster[mi]._mx = _moldx;
            monster[mi]._my = _moldy;
            monster[mi]._mfutx = _moldx;
            monster[mi]._mfuty = _moldy;
            monster[mi]._moldx = _moldx;
            monster[mi]._moldy = _moldy;
            M_CheckEFlag(mi);
            M_ClearSquares(mi);
            dung_map[_moldx][_moldy].dMonster = mi + 1;
        }
    }

    _mx = Monst->_mx;
    _my = Monst->_my;
    Monst->mlid = AddLight(Monst->_mx, Monst->_my, 3);
    DoVision(_mx, _my, 8, 0, 1);

    j = abs(ViewX - _mx);
    k = abs(ViewY - _my);
    if (k < j)
        j = ViewX - _mx;
    else
        j = ViewY - _my;
    k = abs(j);
    j = 20;
    if (k < 21)
        j = k;

    Monst->_mVar3 = 0;
    Monst->_mVar4 = 0;
    Monst->_mVar8 = pnum;
    Monst->_mVar5 = ((long long)(Monst->_mVar3 - (_mx << 16))) / j;
    Monst->_mVar6 = ((long long)(Monst->_mVar4 - (_my << 16))) / j;
}

void PrintMonstHistory(int mt)
{
    int res;

    if (monstkills[mt] >= 15) {
        if (gnDifficulty != D_HELL)
            res = monsterdata[mt].mMagicRes;
        else
            res = monsterdata[mt].mMagicRes2;
        res &= (RESIST_MAGIC | RESIST_FIRE | RESIST_LIGHTNING | IMMUNE_MAGIC | IMMUNE_FIRE | IMMUNE_LIGHTNING);

        if (res == 0) {
            strcpy(tempstr, GetStr(0x2CE));
            AddPanelString(tempstr, 1);
        } else {
            if (res & (RESIST_MAGIC | RESIST_FIRE | RESIST_LIGHTNING)) {
                strcpy(tempstr, GetStr(0x35F));
                if (res & RESIST_MAGIC)
                    strcat(tempstr, GetStr(0x273));
                if (res & RESIST_FIRE) {
                    if (res & RESIST_MAGIC)
                        strcat(tempstr, D_8011C2C8);
                    strcat(tempstr, GetStr(0x157));
                }
                if (res & RESIST_LIGHTNING) {
                    if (res & RESIST_FIRE)
                        strcat(tempstr, D_8011C2C8);
                    strcat(tempstr, GetStr(0x254));
                }
                AddPanelString(tempstr, 1);
            }
            if (res & (IMMUNE_MAGIC | IMMUNE_FIRE | IMMUNE_LIGHTNING)) {
                strcpy(tempstr, GetStr(0x20D));
                if (res & IMMUNE_MAGIC)
                    strcat(tempstr, GetStr(0x273));
                if (res & IMMUNE_FIRE) {
                    if (res & IMMUNE_MAGIC)
                        strcat(tempstr, D_8011C2C8);
                    strcat(tempstr, GetStr(0x157));
                }
                if (res & IMMUNE_LIGHTNING) {
                    if (res & IMMUNE_FIRE)
                        strcat(tempstr, D_8011C2C8);
                    strcat(tempstr, GetStr(0x254));
                }
                AddPanelString(tempstr, 1);
            }
        }
    }
    _pinfoflag[sel_data] = 1;
}
