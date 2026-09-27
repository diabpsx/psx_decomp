/* COREMON.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/monster.cpp (+ inv.cpp CanPut).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_coremon.h"
#include "source/gen/externs_coremon.h"
#include "source/gen/protos_coremon.h"
#include "source/diablo.h"

/* monster types (_mMTidx / CMonster::mtype, retail values) */
#define MT_WSKELAX 8
#define MT_XSKELAX 11
#define MT_WSKELBW 20
#define MT_XSKELBW 23
#define MT_WSKELSD 24
#define MT_XSKELSD 27
#define MT_GOLEM   109
#define MT_DIABLO  110

/* AI ids */
#define AI_GARG     12
#define AI_GARBUD   18
#define AI_ZHAR     22
#define AI_SNOTSPIL 23
#define AI_LAZURUS  28
#define AI_LACHDAN  29
#define AI_LAZHELP  30
#define AI_WARLORD  31

/* animation slots (CMonster::Anims) */
#define MA_STAND   0
#define MA_WALK    1
#define MA_ATTACK  2
#define MA_GOTHIT  3
#define MA_DEATH   4
#define MA_SPECIAL 5

/* monster modes */
#define MM_STAND   0
#define MM_SATTACK 7
#define MM_SPSTAND 11

#define MGOAL_NORMAL 1
#define DIFF_NIGHTMARE 1
#define DIFF_HELL      2
#define SPL_GOLEM 21

#define MFLAG_LOCK_ANIMATION  0x02
#define MFLAG_ALLOW_SPECIAL   0x04
#define MFLAG_TARGETS_MONSTER 0x10

#define BFLAG_MONSTLR 0x10

#define IMMUNE_FIRE 0x10
#define MIS_FIREWALL 5

#define MAXMONSTERS 190
#define MAX_PLRS    2

void M_CheckEFlag(int i)
{
}

void M_ClearSquares(int i)
{
    int mx = monster[i]._moldx;
    int my = monster[i]._moldy;
    int mt = -1 - i;
    int mt2 = i + 1;

    for (int y = my - 1; y <= my + 1; y++) {
        for (int x = mx - 1; x <= mx + 1; x++) {
            if (x < 96 && y < 96 && (dung_map[x][y].dMonster == mt || dung_map[x][y].dMonster == mt2))
                dung_map[x][y].dMonster = 0;
        }
    }

    dung_map[mx + 1][my].dFlags &= ~BFLAG_MONSTLR;
    dung_map[mx][my + 1].dFlags &= ~BFLAG_MONSTLR;
}

unsigned char IsSkel(int mt)
{
    if (currlevel == 16 && mt >= 112 && mt <= 115)
        return 1;
    return mt >= MT_WSKELAX && mt <= MT_XSKELAX
        || mt >= MT_WSKELBW && mt <= MT_XSKELBW
        || mt >= MT_WSKELSD && mt <= MT_XSKELSD;
}

void NewMonsterAnim(int i, AnimStruct &anim, int md, int AnimType)
{
    MonsterStruct *Monst = &monster[i];
    Monst->_mAnimLen = anim.Frames;
    Monst->_mAnimCnt = 0;
    Monst->_mAnimFrame = 1;
    Monst->_mAnimDelay = anim.Rate;
    Monst->_mdir = md;
    Monst->_mFlags &= ~(MFLAG_LOCK_ANIMATION | MFLAG_ALLOW_SPECIAL);
    Monst->Action = AnimType;
}

unsigned char M_Talker(int i)
{
    unsigned char _mAi = monster[i]._mAi;
    if (_mAi == AI_LAZURUS || _mAi == AI_WARLORD || _mAi == AI_GARBUD || _mAi == AI_ZHAR
        || _mAi == AI_SNOTSPIL || _mAi == AI_LACHDAN || _mAi == AI_LAZHELP)
        return 1;
    return 0;
}

void M_Enemy(int i)
{
    MonsterStruct *Monst = &monster[i];
    int closest = -1;
    int _mx = Monst->_mx;
    int _my = Monst->_my;
    int _menemy = Monst->_menemy;
    PlayerStruct *plr1 = &plr[0];
    PlayerStruct *plr2 = &plr[1];

    if (plr1->plractive) {
        if (plr2->plractive) {
            PlayerStruct *enemy = &plr[_menemy];
            int y = enemy->_py - _my;
            if (abs(enemy->_px - _mx) >= 2 || abs(y) >= 2) {
                int x1 = abs(plr1->_px - _mx);
                int y1 = abs(plr1->_py - _my);
                int x2 = abs(plr2->_px - _mx);
                int y2 = abs(plr2->_py - _my);
                if (x1 < y1)
                    x1 = y1;
                if (x2 < y2)
                    x2 = y2;
                closest = x2 < x1;
            } else
                closest = _menemy;
        } else
            closest = 0;
    } else if (plr2->plractive)
        closest = 1;

    if (closest != -1) {
        Monst->_menemy = closest;
        Monst->_menemyx = plr[closest]._px;
        Monst->_menemyy = plr[closest]._py;
        Monst->_mFlags &= ~0x400;
    } else
        Monst->_mFlags |= 0x400;
}

void ClearMVars(int i)
{
    monster[i]._mVar1 = 0;
    monster[i]._mVar2 = 0;
    monster[i]._mVar3 = 0;
    monster[i]._mVar4 = 0;
    monster[i]._mVar5 = 0;
    monster[i]._mVar6 = 0;
    monster[i]._mVar7 = 0;
    monster[i]._mVar8 = 0;
}

void InitMonster(int i, int rd, int mtype, int x, int y)
{
    CMonster *monst = &Monsters[mtype];
    MonsterStruct *pmonster = &monster[i];

    pmonster->_mdir = rd;
    pmonster->_mx = x;
    pmonster->_my = y;
    pmonster->_mfutx = x;
    pmonster->_mfuty = y;
    pmonster->_moldx = x;
    pmonster->_moldy = y;
    pmonster->_mMTidx = mtype;
    pmonster->_mmode = MM_STAND;
    pmonster->mName = monst->MData->mName;
    pmonster->MType = monst;
    pmonster->MData = monst->MData;
    pmonster->Action = MA_STAND;
    pmonster->_mAnimDelay = monst->Anims[MA_STAND].Rate;
    pmonster->_mAnimCnt = ENG_random(pmonster->_mAnimDelay - 1);
    pmonster->_mAnimLen = monst->Anims[MA_STAND].Frames;
    pmonster->_mAnimFrame = ENG_random(pmonster->_mAnimLen - 1) + 1;

    if (monst->mtype == MT_DIABLO)
        pmonster->_mmaxhp = (ENG_random(1) + 1666) << 6;
    else
        pmonster->_mmaxhp = (ENG_random(monst->mMaxHP - monst->mMinHP + 1) + monst->mMinHP) << 6;

    if (gbMaxPlayers == 1) {
        pmonster->_mmaxhp >>= 1;
        if (pmonster->_mmaxhp < 64)
            pmonster->_mmaxhp = 64;
    }

    pmonster->_mhitpoints = pmonster->_mmaxhp;
    pmonster->_mAi = monst->MData->mAi;
    pmonster->_mint = monst->MData->mInt;
    pmonster->_mgoal = MGOAL_NORMAL;
    pmonster->_mgoalvar1 = 0;
    pmonster->_mgoalvar2 = 0;
    pmonster->_mgoalvar3 = 0;
    pmonster->_mDelFlag = 0;
    pmonster->_uniqtype = 0;
    pmonster->_msquelch = 0;
    pmonster->mWhoHit = 0;
    pmonster->mLevel = monst->MData->mLevel;
    pmonster->mExp = monst->MData->mExp;

    if (i < MAX_PLRS) {
        int slvl = plr[i]._pSplLvl[SPL_GOLEM] + plr[i]._pISplLvlAdd;
        if (slvl < 0)
            slvl = 0;
        pmonster->mHit = monst->MData->mHit;
        pmonster->mMinDamage = monst->MData->mMinDamage;
        pmonster->mMaxDamage = monst->MData->mMaxDamage;
        monster[i]._mmaxhp = 2 * (plr[i]._pMaxMana / 3) + ((slvl << 9) + (slvl << 7));
        monster[i].mArmorClass = 25;
        monster[i].mHit = (unsigned char)plr[i]._pLevel * 2 + 40 + 5 * slvl;
        monster[i].mMinDamage = 2 * slvl + 8;
        monster[i].mMaxDamage = 2 * slvl + 16;
    } else {
        pmonster->mHit = monst->MData->mHit;
        pmonster->mMinDamage = monst->MData->mMinDamage;
        pmonster->mMaxDamage = monst->MData->mMaxDamage;
    }
    pmonster->mHit2 = monst->MData->mHit2;
    pmonster->mMinDamage2 = monst->MData->mMinDamage2;
    pmonster->mMaxDamage2 = monst->MData->mMaxDamage2;
    pmonster->mArmorClass = monst->MData->mArmorClass;
    pmonster->mMagicRes = monst->MData->mMagicRes;
    pmonster->leader = 0;
    pmonster->leaderflag = 0;
    pmonster->_mFlags = monst->MData->mFlags;
    pmonster->mtalkmsg = 0;

    if (pmonster->_mAi == AI_GARG) {
        pmonster->Action = MA_SPECIAL;
        pmonster->_mAnimFrame = 1;
        pmonster->_mFlags |= MFLAG_ALLOW_SPECIAL;
        pmonster->_mmode = MM_SATTACK;
    }

    if (gnDifficulty == DIFF_NIGHTMARE) {
        pmonster->_mmaxhp = 3 * pmonster->_mmaxhp + 100;
        pmonster->_mhitpoints = pmonster->_mmaxhp;
        pmonster->mLevel += 15;
        pmonster->mExp = 2 * pmonster->mExp + 2000;
        pmonster->mHit += 85;
        pmonster->mMinDamage = 2 * pmonster->mMinDamage + 4;
        pmonster->mMaxDamage = 2 * pmonster->mMaxDamage + 4;
        pmonster->mHit2 += 85;
        pmonster->mMinDamage2 = 2 * pmonster->mMinDamage2 + 4;
        pmonster->mMaxDamage2 = 2 * pmonster->mMaxDamage2 + 4;
        pmonster->mArmorClass += 50;
    }

    if (gnDifficulty == DIFF_HELL) {
        pmonster->_mmaxhp = 4 * pmonster->_mmaxhp + 200;
        pmonster->_mhitpoints = pmonster->_mmaxhp;
        pmonster->mLevel += 30;
        pmonster->mExp = 4 * pmonster->mExp + 4000;
        pmonster->mHit += 120;
        pmonster->mMinDamage = 4 * pmonster->mMinDamage + 6;
        pmonster->mMaxDamage = 4 * pmonster->mMaxDamage + 6;
        pmonster->mHit2 += 120;
        pmonster->mMinDamage2 = 4 * pmonster->mMinDamage2 + 6;
        pmonster->mMaxDamage2 = 4 * pmonster->mMaxDamage2 + 6;
        pmonster->mArmorClass += 80;
        pmonster->mMagicRes = monst->MData->mMagicRes2;
    }
}

int AddMonster(int x, int y, int dir, int mtype, unsigned char InMap)
{
    int i;

    if (nummonsters < MAXMONSTERS) {
        i = monstactive[nummonsters++];
        if (InMap)
            dung_map[x][y].dMonster = i + 1;
        InitMonster(i, dir, mtype, x, y);
        return i;
    }

    return -1;
}

/* SYM OPEN: bytes PASS, but retail has no record for `mode` (the mode load is scheduled before the
 * pmonster loads while its store sinks after them -> an anonymous or copy-propagated temp in retail).
 * Falsified: statement orders (12 perms), casts, comma forms, pmonster-based copy, int/uint/short/uchar/
 * pointer temps, braced vs function scope.  Next angle: a copy chain that CSE folds (cf. GMAN StreamLoadTP Fs). */
void M_StartStand(int i, int md)
{
    MonsterStruct *pmonster;
    int _mx, _my;

    ClearMVars(i);
    if (monster[i].MType->mtype == MT_GOLEM)
        NewMonsterAnim(i, monster[i].MType->Anims[MA_WALK], md, MA_WALK);
    else
        NewMonsterAnim(i, monster[i].MType->Anims[MA_STAND], md, MA_STAND);
    pmonster = &monster[i];
    const char mode = monster[i]._mmode;
    _mx = pmonster->_mx;
    _my = pmonster->_my;
    monster[i]._mVar1 = mode;
    monster[i]._mVar2 = 0;
    monster[i]._mmode = MM_STAND;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = _mx;
    monster[i]._mfuty = _my;
    monster[i]._moldx = _mx;
    monster[i]._moldy = _my;
    monster[i]._mdir = md;
    if (monster->MType->mtype != MT_GOLEM)
        M_Enemy(i);
}

void M_UpdateLeader(int i)
{
    int x;
    int tmp;

    for (x = 0; x < nummonsters; x++) {
        tmp = monstactive[x];
        if (monster[tmp].leaderflag == 1 && monster[tmp].leader == i)
            monster[tmp].leaderflag = 0;
    }

    if (monster[i].leaderflag == 1)
        monster[monster[i].leader].packsize--;
}

void ActivateSpawn(int i, int x, int y, int dir)
{
    dung_map[x][y].dMonster = i + 1;
    monster[i]._mx = x;
    monster[i]._my = y;
    monster[i]._mfutx = x;
    monster[i]._mfuty = y;
    monster[i]._moldx = x;
    monster[i]._moldy = y;
    M_StartSpStand(i, dir);
}

unsigned char SpawnSkeleton(int ii, int x, int y)
{
    int monstok[3][3];
    int i;
    int j;
    int xx;
    int yy;
    int rs;
    unsigned char savail;

    if (ii == -1)
        return 0;

    if (PosOkMonst(-1, x, y)) {
        ActivateSpawn(ii, x, y, GetDirection(x, y, x, y));
        return 1;
    }

    savail = 0;
    yy = 0;
    for (j = y - 1; j <= y + 1; j++) {
        xx = 0;
        for (i = x - 1; i <= x + 1; i++) {
            monstok[xx][yy] = PosOkMonst(-1, i, j);
            savail |= monstok[xx][yy];
            xx++;
        }
        yy++;
    }
    if (!savail)
        return 0;

    rs = ENG_random(15) + 1;
    xx = 0;
    yy = 0;
    while (rs > 0) {
        if (monstok[xx][yy])
            rs--;
        if (rs > 0) {
            xx++;
            if (xx == 3) {
                xx = 0;
                yy++;
                if (yy == 3)
                    yy = 0;
            }
        }
    }

    xx = xx + x - 1;
    yy = yy + y - 1;
    ActivateSpawn(ii, xx, yy, GetDirection(xx, yy, x, y));
    return 1;
}

void M_StartSpStand(int i, int md)
{
    MonsterStruct *pmonster;
    int _mx, _my;

    NewMonsterAnim(i, monster[i].MType->Anims[MA_SPECIAL], md, MA_SPECIAL);
    pmonster = &monster[i];
    _mx = pmonster->_mx;
    _my = pmonster->_my;
    monster[i]._mmode = MM_SPSTAND;
    monster[i]._mxoff = 0;
    monster[i]._myoff = 0;
    monster[i]._mfutx = _mx;
    monster[i]._mfuty = _my;
    monster[i]._moldx = _mx;
    monster[i]._moldy = _my;
    monster[i]._mdir = md;
    M_CheckEFlag(i);
}

unsigned char PosOkMonst(int i, int x, int y)
{
    unsigned char ret;
    int oi;
    int mi;
    unsigned char fire;

    fire = 0;
    ret = !SolidLoc(x, y) && !IsDplayer(x, y) && dung_map[x][y].dMonster == 0;
    if (ret && dung_map[x][y].dObject != 0) {
        oi = dung_map[x][y].dObject > 0 ? dung_map[x][y].dObject - 1 : -(dung_map[x][y].dObject + 1);
        if (object[oi]._oSolidFlag)
            ret = 0;
    }

    if (ret && dung_map[x][y].dMissile != 0 && i >= 0) {
        mi = dung_map[x][y].dMissile;
        if (mi > 0) {
            if (missile[mi]._mitype == MIS_FIREWALL) {
                fire = 1;
            } else {
                for (mi = 0; mi < nummissiles; mi++) {
                    if (missile[missileactive[mi]]._mitype == MIS_FIREWALL)
                        fire = 1;
                }
            }
        }
        if (fire && (!(monster[i].mMagicRes & IMMUNE_FIRE) || monster[i].MType->mtype == MT_DIABLO))
            ret = 0;
    }

    return ret;
}

unsigned char CanPut(int i, int j)
{
    int oi;

    if (dung_map[i][j].dItem)
        return 0;
    if (GetSOLID(i, j))
        return 0;

    if (dung_map[i][j].dObject != 0) {
        oi = dung_map[i][j].dObject > 0 ? dung_map[i][j].dObject - 1 : -(dung_map[i][j].dObject + 1);
        if (object[oi]._oSolidFlag)
            return 0;
    }

    if (dung_map[i + 1][j + 1].dObject > 0) {
        oi = dung_map[i + 1][j + 1].dObject - 1;
        if (object[oi]._oSelFlag != 0)
            return 0;
    }
    if (dung_map[i + 1][j + 1].dObject < 0) {
        oi = -(dung_map[i + 1][j + 1].dObject + 1);
        if (object[oi]._oSelFlag != 0)
            return 0;
    }

    if (dung_map[i + 1][j].dObject > 0 && dung_map[i][j + 1].dObject > 0) {
        oi = dung_map[i + 1][j].dObject - 1;
        if (object[oi]._oSelFlag != 0) {
            oi = dung_map[i][j + 1].dObject - 1;
            if (object[oi]._oSelFlag != 0)
                return 0;
        }
    }

    if (currlevel == 0) {
        if (dung_map[i][j].dMonster != 0)
            return 0;
        if (dung_map[i + 1][j + 1].dMonster != 0)
            return 0;
    }

    return 1;
}

int encode_enemy(int m)
{
    if (monster[m]._mFlags & MFLAG_TARGETS_MONSTER)
        return monster[m]._menemy + MAX_PLRS;
    else
        return monster[m]._menemy;
}
