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

/* AI ids */
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
#define MM_SPSTAND 11

#define MFLAG_LOCK_ANIMATION  0x02
#define MFLAG_ALLOW_SPECIAL   0x04
#define MFLAG_TARGETS_MONSTER 0x10

#define BFLAG_MONSTLR 0x10

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
    _mx = pmonster->_mx;
    _my = pmonster->_my;
    monster[i]._mVar1 = monster[i]._mmode;
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

int encode_enemy(int m)
{
    if (monster[m]._mFlags & MFLAG_TARGETS_MONSTER)
        return monster[m]._menemy + MAX_PLRS;
    else
        return monster[m]._menemy;
}
