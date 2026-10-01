/* PREMON.CPP -- Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/MONSTER.CPP
 * (original Synergistic/Blizzard source -- best twin per 00_current_diablo.md checkpoint q) and
 * refs/devilution/Source/monster.cpp (closer shape for the non-Hellfire functions: PSX ships plain
 * Diablo content, not Hellfire, so several functions here (GetLevelMTypes/InitMonsters/etc.) match
 * devilution's un-#ifdef'd HELLFIRE shape almost exactly rather than the hellfire tree's).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: LoadFileInMem -> GRL_LoadFileInMemSig; random_ -> ENG_random; a PSX-only monster-list
 * preset table (ML_GetPresetMonsters, MLIST.CPP) replaces the PC build's runtime weighted-random
 * scatter loop inside GetLevelMTypes -- GetLevelMTypes here keeps its OWN inline copy of the
 * pick/swap loop (matching GetMonsterTypes's body) because CC1PL_FLAGS carries -fno-inline (no
 * inlining occurs; this is genuine PSX-side source duplication, not a compiler artifact). */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "source/gen/structs_premon.h"
#include "source/gen/externs_premon.h"
#include "source/gen/protos_premon.h"
#include "source/diablo.h"

#define MAXDUNX 96
#define MAXDUNY 96
#define MAX_LVLMTYPES 16
#define MAXMONSTERS 190
#define BFLAG_VISIBLE 0x4
#define BFLAG_POPULATED 0x8

#define MPFLAG_SCATTER 1
#define MPFLAG_SPECIAL 2
#define MPFLAG_UNIQUE  4

#define MT_GOLEM 109

/* --------------------------------------------------------------------- */
void SwapMonsterType(int *oldmt)
{
    int mt;

    mt = *oldmt;
    if (currlevel == 16) {
        if ((unsigned)(mt - 0x5D) < 2 || (unsigned)(mt - 0x5F) < 2)
            mt = 0x70;
        if (mt == 0x6B)
            mt = 0x6C;
    }
    if (mt == 0x46)
        mt = 0x4C;
    if (mt == 0x47)
        mt = 0x4E;
    if (mt == 0x45)
        mt = 0x4D;
    *oldmt = mt;
}

/* --------------------------------------------------------------------- */
unsigned char MonstPlace(int xp, int yp)
{
    if ((unsigned)xp >= MAXDUNX || (unsigned)yp >= MAXDUNY)
        return 0;

    if (dung_map[xp][yp].dMonster != 0)
        return 0;

    if (IsDplayer(xp, yp))
        return 0;

    if (dung_map[xp][yp].dFlags & BFLAG_VISIBLE)
        return 0;

    if (!(dung_map[xp][yp].dFlags & BFLAG_POPULATED))
        return !SolidLoc(xp, yp);

    return 0;
}

/* --------------------------------------------------------------------- */
void InitMonsterGFX(int monst)
{
    int anim;
    char strBuff[256];
    int mtype;
    struct MonsterData *pmonsterdata;

    mtype = Monsters[monst].mtype;
    pmonsterdata = &monsterdata[mtype];

    for (anim = 0; anim < 6; anim++) {
        if (!(animletter[anim] == 's' && !pmonsterdata->has_special) && pmonsterdata->Frames[anim] > 0) {
        }
        Monsters[monst].Anims[anim].Frames = pmonsterdata->Frames[anim];
        Monsters[monst].Anims[anim].Rate = pmonsterdata->Rate[anim];
    }

    Monsters[monst].mMinHP = pmonsterdata->mMinHP;
    Monsters[monst].mMaxHP = pmonsterdata->mMaxHP;
    Monsters[monst].has_special = pmonsterdata->has_special;
    Monsters[monst].mAFNum = pmonsterdata->mAFNum;
    Monsters[monst].MData = pmonsterdata;
}

/* --------------------------------------------------------------------- */
void PlaceMonster(int i, int mtype, int x, int y)
{
    int rd;

    dung_map[x][y].dMonster = i + 1;

    rd = ENG_random(8);
    InitMonster(i, rd, mtype, x, y);
}

/* --------------------------------------------------------------------- */
int AddMonsterType(int type, int placeflag)
{
    int i;
    unsigned char done = 0;

    for (i = 0; i < nummtypes && !done; i++)
        done = Monsters[i].mtype == type;
    i--;

    if (!done) {
        i = nummtypes++;
        Monsters[i].mtype = type;
        InitMonsterGFX(i);
        InitMonsterSND(i);
    }

    Monsters[i].mPlaceFlags |= placeflag;

    return i;
}

/* --------------------------------------------------------------------- */
void GetMonsterTypes(unsigned long QuestMask)
{
    int typelist[MAX_LVLMTYPES + 174];
    int mt;
    int nt;
    int i;

    nt = ML_GetPresetMonsters(currlevel, typelist, QuestMask);
    while (nt > 0 && nummtypes < MAX_LVLMTYPES) {
        if (nt == 0)
            break;
        i = ENG_random(nt);
        mt = typelist[i];
        SwapMonsterType(&mt);
        AddMonsterType(mt, MPFLAG_SCATTER);
        typelist[i] = typelist[--nt];
    }
}

/* --------------------------------------------------------------------- */
void ClrAllMonsters(void)
{
    int i;
    struct MonsterStruct *Monst;

    for (i = 0; i < MAXMONSTERS; i++) {
        Monst = &monster[i];
        ClearMVars(i);
        Monst->mName = 0;
        Monst->_mgoal = 0;
        Monst->_mmode = 0;
        Monst->_mVar1 = 0;
        Monst->_mVar2 = 0;
        Monst->_mx = 0;
        Monst->_my = 0;
        Monst->_mfutx = 0;
        Monst->_mfuty = 0;
        Monst->_moldx = 0;
        Monst->_moldy = 0;
        Monst->_mdir = ENG_random(8);
        Monst->Action = 0;
        Monst->_mAnimDelay = 0;
        Monst->_mAnimCnt = 0;
        Monst->_mAnimLen = 0;
        Monst->_mAnimFrame = 0;
        Monst->_mDelFlag = 0;
        Monst->_mxvel = 0;
        Monst->_myvel = 0;
        Monst->_mFlags = 0;
        Monst->_menemy = ENG_random(gbActivePlayers);
        Monst->_menemyx = plr[Monst->_menemy]._px;
        Monst->_menemyy = plr[Monst->_menemy]._py;
    }
}

/* --------------------------------------------------------------------- */
void InitLevelMonsters(void)
{
    int i;

    nummtypes = 0;
    monstimgtot = 0;

    for (i = 0; i < MAX_LVLMTYPES; i++)
        Monsters[i].mPlaceFlags = 0;

    ClrAllMonsters();
    nummonsters = 0;
    totalmonsters = MAXMONSTERS;

    for (i = 0; i < MAXMONSTERS; i++)
        monstactive[i] = i;

    uniquetrans = 0;
}

/* --------------------------------------------------------------------- */
/* PSX GetLevelMTypes: builds a QuestMask bitpattern from every active quest
 * (CM_QuestToBitPattern), passes it to ML_GetPresetMonsters (MLIST.CPP -- a
 * PSX-only precomputed-per-level monster table, CD-friendly replacement for
 * the PC build's runtime weighted-random scatter search), then -- for the
 * !setlevel path only -- keeps its OWN inline copy of the pick/swap/add loop
 * (matches GetMonsterTypes's body; not a call, -fno-inline forbids that).
 * Quest numbers/UniqMonst indices are the PSX numeric ids read off the raw
 * oracle (they do not line up with devilution's Q_/UMT_ enumerators 1:1). */
void GetLevelMTypes(void)
{
    int i;
    int minl, maxl;
    int typelist[MAX_LVLMTYPES + 174];
    int mt;
    int nt;
    char mamask;
    unsigned long QuestMask;
    int idx;

    QuestMask = 0;
    AddMonsterType(0x6D, MPFLAG_SPECIAL);   /* MT_GOLEM */
    mamask = 3;

    if (currlevel == 16) {
        AddMonsterType(0x6C, 1);
        AddMonsterType(0x70, 1);
        AddMonsterType(0x6E, 2);
        GetMonsterTypes(0);
        return;
    }

    if (!setlevel) {
        if (QuestStatus(6)) {
            AddMonsterType(0x33, 2);
            QuestMask |= CM_QuestToBitPattern(6);
        }
        if (QuestStatus(2)) {
            AddMonsterType(UniqMonst[0].mtype, 4);
            QuestMask |= CM_QuestToBitPattern(2);
        }
        if (QuestStatus(3)) {
            AddMonsterType(UniqMonst[2].mtype, 4);
            QuestMask |= CM_QuestToBitPattern(3);
        }
        if (QuestStatus(7)) {
            AddMonsterType(UniqMonst[3].mtype, 4);
            QuestMask |= CM_QuestToBitPattern(7);
        }
        if (QuestStatus(4)) {
            AddMonsterType(UniqMonst[7].mtype, 4);
            QuestMask |= CM_QuestToBitPattern(4);
        }
        if (QuestStatus(0xB)) {
            AddMonsterType(UniqMonst[8].mtype, 4);
            QuestMask |= CM_QuestToBitPattern(0xB);
        }
        if (QuestStatus(9))
            QuestMask |= CM_QuestToBitPattern(9);
        if (QuestStatus(0xA))
            QuestMask |= CM_QuestToBitPattern(0xA);

        if (currlevel == 15 && gbMaxPlayers == 2)
            QuestMask |= CM_QuestToBitPattern(0xF);

        if (gbMaxPlayers != 1 && currlevel == quests[0xC]._qlevel) {
            int skeltypes[111];
            int numskeltypes;

            QuestMask |= CM_QuestToBitPattern(0xC);
            AddMonsterType(0x32, 4);

            numskeltypes = 0;
            for (i = 8; i < 0x1C; i++) {
                if (IsSkel(i)) {
                    minl = (char)monsterdata[i].mMinDLvl / 2 + 1;
                    maxl = (char)monsterdata[i].mMaxDLvl / 2 + 1;
                    if (currlevel >= minl && currlevel <= maxl && (MonstAvailTbl[i] & mamask))
                        skeltypes[numskeltypes++] = i;
                }
            }
            AddMonsterType(skeltypes[ENG_random(numskeltypes)], MPFLAG_SCATTER);
        }

        nt = ML_GetPresetMonsters(currlevel, typelist, QuestMask);
        if (monstdebug) {
            for (i = 0; i < debugmonsttypes; i++) {
                SwapMonsterType(&DebugMonsters[i]);
                AddMonsterType(DebugMonsters[i], MPFLAG_SCATTER);
            }
        } else {
            while (nt > 0 && nummtypes < MAX_LVLMTYPES) {
                if (nt == 0)
                    break;
                idx = ENG_random(nt);
                mt = typelist[idx];
                SwapMonsterType(&mt);
                AddMonsterType(mt, MPFLAG_SCATTER);
                typelist[idx] = typelist[--nt];
            }
        }
        return;
    } else {
        switch (setlvlnum) {
        case 1:
            QuestMask |= CM_QuestToBitPattern(0xC);
            AddMonsterType(0x32, 4);
            break;
        case 2:
            QuestMask |= CM_QuestToBitPattern(0xE);
            break;
        case 4:
            QuestMask |= CM_QuestToBitPattern(0xD);
            break;
        case 5:
            QuestMask |= CM_QuestToBitPattern(0xF);
            break;
        default:
            break;
        }
        GetMonsterTypes(QuestMask);
    }
}

/* --------------------------------------------------------------------- */
void PlaceQuestMonsters(void)
{
    int skeltype;
    unsigned char *setp;

    if (!setlevel) {
        if (QuestStatus(6))
            PlaceUniqueMonst(9, 0, 0);

        if (currlevel == quests[12]._qlevel && gbMaxPlayers != 1) {
            for (skeltype = 0; skeltype < nummtypes; skeltype++) {
                if (IsSkel(Monsters[skeltype].mtype))
                    break;
            }
            PlaceUniqueMonst(1, skeltype, 30);
        }

        if (QuestStatus(7)) {
            int dummy;
            setp = GRL_LoadFileInMemSig("Levels\\L1Data\\Banner1.DUN", NULL);
            {
                int dummy2;
                SetMapMonsters(setp, 2 * setpc_x, 2 * setpc_y);
                mem_free_dbg(setp);
            }
        }
        if (QuestStatus(9)) {
            int dummy;
            setp = GRL_LoadFileInMemSig("Levels\\L2Data\\Blood2.DUN", NULL);
            {
                int dummy2;
                SetMapMonsters(setp, 2 * setpc_x, 2 * setpc_y);
                mem_free_dbg(setp);
            }
        }
        if (QuestStatus(8)) {
            int dummy;
            setp = GRL_LoadFileInMemSig("Levels\\L2Data\\Blind2.DUN", NULL);
            {
                int dummy2;
                SetMapMonsters(setp, 2 * setpc_x, 2 * setpc_y);
                mem_free_dbg(setp);
            }
        }
        if (QuestStatus(0xA)) {
            int dummy;
            setp = GRL_LoadFileInMemSig("Levels\\L3Data\\Anvil.DUN", NULL);
            {
                int dummy2;
                SetMapMonsters(setp, 2 * (setpc_x + 1), 2 * (setpc_y + 1));
                mem_free_dbg(setp);
            }
        }
        if (QuestStatus(0xB)) {
            int dummy;
            setp = GRL_LoadFileInMemSig("Levels\\L4Data\\Warlord.DUN", NULL);
            {
                int dummy2;
                SetMapMonsters(setp, 2 * setpc_x, 2 * setpc_y);
                mem_free_dbg(setp);
            }
            AddMonsterType(UniqMonst[8].mtype, 1);
        }
        if (QuestStatus(4))
            AddMonsterType(UniqMonst[7].mtype, 1);
        if (QuestStatus(3) && zharlib == -1)
            quests[3]._qactive = 0;

        if (currlevel == quests[15]._qlevel && gbMaxPlayers != 1) {
            int dummy;
            AddMonsterType(UniqMonst[4].mtype, 4);
            AddMonsterType(UniqMonst[5].mtype, 4);
            PlaceUniqueMonst(4, 0, 0);
            PlaceUniqueMonst(5, 0, 0);
            PlaceUniqueMonst(6, 0, 0);
            setp = GRL_LoadFileInMemSig("Vile14.DUN", NULL);
            {
                int dummy2;
                SetMapMonsters(setp, 2 * setpc_x, 2 * setpc_y);
                mem_free_dbg(setp);
            }
        }
    } else {
        if (setlvlnum == 1)
            PlaceUniqueMonst(1, 0, 0);
    }
}

/* --------------------------------------------------------------------- */
void LoadDiabMonsts(void)
{
    unsigned char *lpSetPiece;

    { int dummy1; }
    { int dummy2; }
    { int dummy3; }
    {
        int dummy4;
        lpSetPiece = GRL_LoadFileInMemSig("diab1.DUN", NULL);
        SetMapMonsters(lpSetPiece, 2 * diabquad1x, 2 * diabquad1y);
        mem_free_dbg(lpSetPiece);
        lpSetPiece = GRL_LoadFileInMemSig("diab2a.DUN", NULL);
        SetMapMonsters(lpSetPiece, 2 * diabquad2x, 2 * diabquad2y);
        mem_free_dbg(lpSetPiece);
        lpSetPiece = GRL_LoadFileInMemSig("diab3a.DUN", NULL);
        SetMapMonsters(lpSetPiece, 2 * diabquad3x, 2 * diabquad3y);
        mem_free_dbg(lpSetPiece);
        lpSetPiece = GRL_LoadFileInMemSig("diab4a.DUN", NULL);
        SetMapMonsters(lpSetPiece, 2 * diabquad4x, 2 * diabquad4y);
        mem_free_dbg(lpSetPiece);
    }
}

/* --------------------------------------------------------------------- */
/* PlaceGroup -- best-effort transcription (devilution shape + the PSX
 * off-map safety net that DBG_SendMessage's when a placed group member's
 * _mx/_my end up >= MAXDUNX/MAXDUNY). NOT byte-verified yet -- see report. */
void PlaceGroup(int mtype, int num, unsigned char leaderf, int leader)
{
    int xp, yp, x1, y1;
    int j;
    int placed;
    int try1;
    int try2;
    int rd;

    placed = 0;

    for (try1 = 0; try1 < 10; try1++) {
        while (placed) {
            nummonsters--;
            placed--;
            if ((unsigned char)monster[nummonsters]._mx >= MAXDUNX || (unsigned char)monster[nummonsters]._my >= MAXDUNY)
                DBG_SendMessage("Warning - GT 4 DO XXX. Group monster off of map. %s %d", "source/PREMON.cpp", 0x2F1);
            dung_map[monster[nummonsters]._mx][monster[nummonsters]._my].dMonster = 0;
        }

        if (leaderf & 1) {
            rd = ENG_random(8);
            x1 = xp = monster[leader]._mx + offset_x[rd];
            y1 = yp = monster[leader]._my + offset_y[rd];
        } else {
            do {
                x1 = xp = ENG_random(96);
                y1 = yp = ENG_random(96);
            } while (!MonstPlace(xp, yp));
        }

        if (nummonsters + num > totalmonsters)
            num = totalmonsters - nummonsters;

        j = 0;
        for (try2 = 0; j < num && try2 < 100; xp += offset_x[ENG_random(8)], yp += offset_x[ENG_random(8)]) {
            if (MonstPlace(xp, yp)
                && dung_map[xp][yp].dTransVal == dung_map[x1][y1].dTransVal
                && (!(leaderf & 2) || (abs(xp - x1) < 4 && abs(yp - y1) < 4))) {
                PlaceMonster(nummonsters, mtype, xp, yp);
                if (leaderf & 1) {
                    monster[nummonsters]._mmaxhp *= 2;
                    monster[nummonsters]._mhitpoints = monster[nummonsters]._mmaxhp;
                    monster[nummonsters]._mint = monster[leader]._mint;

                    if (leaderf & 2) {
                        monster[nummonsters].leader = leader;
                        monster[nummonsters].leaderflag = 1;
                        monster[nummonsters]._mAi = monster[leader]._mAi;
                    }

                    if (monster[nummonsters]._mAi != 12) {
                        monster[nummonsters].Action = 0;
                        monster[nummonsters]._mAnimFrame = ENG_random(monster[nummonsters]._mAnimLen - 1) + 1;
                        monster[nummonsters]._mFlags &= ~4;
                        monster[nummonsters]._mmode = 0;
                    }
                }
                placed++;
                nummonsters++;
                j++;
            } else {
                try2++;
            }
        }

        if (placed >= num)
            break;
    }

    if (leaderf & 2)
        monster[leader].packsize = placed;
}

/* --------------------------------------------------------------------- */
void SetMapMonsters(unsigned char *pMap, int startx, int starty)
{
    int i, j;
    unsigned short rw, rh;
    unsigned short *lm;
    int mt;

    AddMonsterType(MT_GOLEM, 2);
    AddMonster(1, 0, 0, 0, 0);
    AddMonster(1, 0, 0, 0, 0);
    AddMonster(1, 0, 0, 0, 0);
    AddMonster(1, 0, 0, 0, 0);

    if (setlevel && setlvlnum == 5) {
        AddMonsterType(UniqMonst[4].mtype, 4);
        AddMonsterType(UniqMonst[5].mtype, 4);
        AddMonsterType(UniqMonst[6].mtype, 4);
        PlaceUniqueMonst(4, 0, 0);
        PlaceUniqueMonst(5, 0, 0);
        PlaceUniqueMonst(6, 0, 0);
    }

    lm = (unsigned short *)pMap;
    rw = *lm++;
    rh = *lm++;
    lm += rw * rh;
    rw = rw << 1;
    rh = rh << 1;
    lm += rw * rh;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm != 0) {
                mt = *lm;
                mt = MonstConvTbl[mt - 1];
                SwapMonsterType(&mt);
                PlaceMonster(nummonsters++, AddMonsterType(mt, MPFLAG_SPECIAL), i + 16 + startx, j + 16 + starty);
            }
            lm++;
        }
    }
}

/* --------------------------------------------------------------------- */
/* InitMonsters -- best-effort transcription (devilution shape, plain-Diablo
 * i.e. no HELLFIRE arms, PSX renames). NOT byte-verified yet -- see report. */
void InitMonsters(void)
{
    int i;
    int mtype;
    int na;
    int nt;
    int scattertypes[111];
    int numscattypes;
    long fv;
    long j;
    int numplacemonsters;
    int s, t;

    numscattypes = 0;

    if (!setlevel) {
        AddMonster(1, 0, 0, 0, 0);
        AddMonster(1, 0, 0, 0, 0);
        AddMonster(1, 0, 0, 0, 0);
        AddMonster(1, 0, 0, 0, 0);
    }
    if (!setlevel && currlevel == 16)
        LoadDiabMonsts();

    nt = numtrigs;
    if (currlevel == 15)
        nt = 1;
    for (i = 0; i < nt; i++) {
        for (s = -2; s < 2; s++) {
            for (t = -2; t < 2; t++)
                DoVision(trigs[i]._tx + s, trigs[i]._ty + t, 15, 0, 0);
        }
    }

    PlaceQuestMonsters();

    if (!setlevel) {
        PlaceUniques();
        fv = 0;
        for (i = 0; i < 96; i++)
            for (j = 0; j < 96; j++)
                if (!SolidLoc(i, j))
                    fv++;
        numplacemonsters = fv / 35;
        if (gbMaxPlayers != 1)
            numplacemonsters += numplacemonsters >> 1;
        if (numplacemonsters + nummonsters > MAXMONSTERS - 10)
            numplacemonsters = MAXMONSTERS - 10 - nummonsters;
        totalmonsters = nummonsters + numplacemonsters;
        for (i = 0; i < nummtypes; i++) {
            if (Monsters[i].mPlaceFlags & MPFLAG_SCATTER)
                scattertypes[numscattypes++] = i;
        }
        while (nummonsters < totalmonsters) {
            mtype = scattertypes[ENG_random(numscattypes)];
            if (currlevel != 1 && ENG_random(2) != 0) {
                if (currlevel == 2)
                    na = ENG_random(2) + 2;
                else
                    na = ENG_random(3) + 3;
            } else
                na = 1;
            PlaceGroup(mtype, na, 0, 0);
        }
    }

    for (i = 0; i < nt; i++) {
        for (s = -2; s < 2; s++) {
            for (t = -2; t < 2; t++)
                DoUnVision(trigs[i]._tx + s, trigs[i]._ty + t, 15, -1);
        }
    }
}

/* --------------------------------------------------------------------- */
/* PlaceUniqueMonst -- best-effort transcription of the PSX shape: no .TRN
 * light-table file load (that whole devilution tail is gone), an added
 * SwapMonsterType() on the resolved type and ObjChangeMapResync/
 * RedoPlayerVision calls near the end (map-resync hook not present on PC).
 * NOT byte-verified yet -- see report for the raw jal sequence this is
 * based on and the next angles. */
void PlaceUniqueMonst(int uniqindex, int miniontype, int unpackfilesize)
{
    struct UniqMonstStruct *Uniq;
    struct MonsterStruct *Monst;
    int xp, yp, x, y;
    unsigned char done;
    int count;
    int count2;
    char filestr[64];
    int uniqtype;
    int i;
    unsigned char zharflag;
    int mMinDamage, mMaxDamage;

    Uniq = &UniqMonst[uniqindex];
    Monst = &monster[nummonsters];
    count2 = 0;
    zharflag = 1;

    if (uniquetrans * 256 + 0x1300 >= 0x1B00)
        return;

    for (uniqtype = 0; uniqtype < nummtypes; uniqtype++) {
        int monstype = UniqMonst[uniqindex].mtype;
        SwapMonsterType(&monstype);
        if (Monsters[uniqtype].mtype == monstype)
            break;
    }

    do {
        xp = ENG_random(64) + 16;
        yp = ENG_random(64) + 16;
        count = 0;
        for (x = xp - 3; x < xp + 3; x++) {
            for (y = yp - 3; y < yp + 3; y++) {
                if (y >= 0 && y < 98 && x >= 0 && x < 98 && MonstPlace(x, y))
                    count++;
            }
        }
    } while ((count < 9 && ++count2 < 1000) || !MonstPlace(xp, yp));

    if (uniqindex == 3) {
        xp = 2 * setpc_x + 24;
        yp = 2 * setpc_y + 28;
    }
    if (uniqindex == 8) {
        xp = 2 * setpc_x + 22;
        yp = 2 * setpc_y + 23;
    }
    if (uniqindex == 2) {
        for (i = 0; i < themeCount; i++) {
            if (i == zharlib && zharflag == 1) {
                zharflag = 0;
                xp = 2 * themeLoc[i].x + 20;
                yp = 2 * themeLoc[i].y + 20;
            }
        }
    }
    if (gbMaxPlayers == 1) {
        if (uniqindex == 4) {
            xp = 32;
            yp = 46;
        }
        if (uniqindex == 5) {
            xp = 40;
            yp = 45;
        }
        if (uniqindex == 6) {
            xp = 38;
            yp = 49;
        }
        if (uniqindex == 1) {
            xp = 35;
            yp = 47;
        }
    } else {
        if (uniqindex == 4) {
            xp = 2 * setpc_x + 19;
            yp = 2 * setpc_y + 22;
        }
        if (uniqindex == 5) {
            xp = 2 * setpc_x + 21;
            yp = 2 * setpc_y + 19;
        }
        if (uniqindex == 6) {
            xp = 2 * setpc_x + 21;
            yp = 2 * setpc_y + 25;
        }
    }
    if (uniqindex == 9) {
        done = 0;
        for (yp = 0; yp < 96 && !done; yp++) {
            for (xp = 0; xp < 96 && !done; xp++) {
                done = GetDPiece(xp, yp) == 367;
            }
        }
    }

    PlaceMonster(nummonsters, uniqtype, xp, yp);
    Monst->_uniqtype = uniqindex + 1;

    if (Uniq->mlevel)
        Monst->mLevel = 2 * Uniq->mlevel;
    else
        Monst->mLevel += 5;

    Monst->mExp *= 2;
    Monst->mName = Uniq->mName;
    Monst->_mmaxhp = Uniq->mmaxhp << 6;

    if (gbMaxPlayers == 1) {
        Monst->_mmaxhp = Monst->_mmaxhp >> 1;
        if (Monst->_mmaxhp < 64)
            Monst->_mmaxhp = 64;
    }

    mMinDamage = Uniq->mMinDamage;
    mMaxDamage = Uniq->mMaxDamage;
    Monst->_mhitpoints = Monst->_mmaxhp;
    Monst->_mAi = Uniq->mAi;
    Monst->_mint = Uniq->mint;
    Monst->mMinDamage = mMinDamage;
    Monst->mMaxDamage = mMaxDamage;
    Monst->mMinDamage2 = mMinDamage;
    Monst->mMaxDamage2 = mMaxDamage;
    Monst->mMagicRes = Uniq->mMagicRes;
    Monst->mtalkmsg = Uniq->mtalkmsg;
    Monst->mlid = AddLight(Monst->_mx, Monst->_my, 0x23F4);

    if (gbMaxPlayers != 1 && Monst->_mAi == 29)
        Monst->mtalkmsg = 0;
    if (Monst->mtalkmsg)
        Monst->_mgoal = 6;

    if (gnDifficulty == 1) {
        Monst->_mmaxhp = 3 * Monst->_mmaxhp + 100;
        Monst->_mhitpoints = Monst->_mmaxhp;
        Monst->mLevel += 15;
        Monst->mExp = 2 * Monst->mExp + 2000;
        Monst->mMinDamage = 2 * mMinDamage + 4;
        Monst->mMaxDamage = 2 * mMaxDamage + 4;
        Monst->mMinDamage2 = 2 * mMinDamage + 4;
        Monst->mMaxDamage2 = 2 * mMaxDamage + 4;
    }
    if (gnDifficulty == 2) {
        Monst->_mmaxhp = 4 * Monst->_mmaxhp + 200;
        Monst->_mhitpoints = Monst->_mmaxhp;
        Monst->mLevel += 30;
        Monst->mExp = 4 * Monst->mExp + 4000;
        Monst->mMinDamage = 4 * mMinDamage + 6;
        Monst->mMaxDamage = 4 * mMaxDamage + 6;
        Monst->mMinDamage2 = 4 * mMinDamage + 6;
        Monst->mMaxDamage2 = 4 * mMaxDamage + 6;
    }

    if (uniqindex == 3) {
        if (quests[7]._qvar1 == 2) {
            Monst->mtalkmsg = 0x15;
            Monst->_mFlags |= 0x40;
        }
        if (quests[7]._qvar1 == 3) {
            Monst->_msquelch = 255;
            Monst->mtalkmsg = 0;
            Monst->_mgoal = 1;
        }
    }
    if (uniqindex == 8) {
        if (quests[4]._qactive == 3) {
            Monst->mtalkmsg = 0;
            Monst->_mFlags |= 0x40;
        }
    }
    if (uniqindex == 0) {
        if (quests[2]._qvar1 == 3) {
            Monst->_mFlags |= 0x40;
            Monst->mtalkmsg = quests[2]._qvar2;
        }
        if (quests[2]._qvar1 == 4) {
            Monst->_mgoal = 1;
            Monst->_msquelch = 255;
            Monst->mtalkmsg = 0;
        }
        if (quests[2]._qvar1 == 5) {
            Monst->_mgoal = 6;
            Monst->mtalkmsg = quests[2]._qvar2;
        }
    }
    if (uniqindex == 2) {
        if (quests[3]._qvar2 == 2)
            Monst->_mFlags |= 0x40;
        if (quests[3]._qvar2 == 3) {
            Monst->_mgoal = 1;
            Monst->_msquelch = 255;
            Monst->mtalkmsg = 0;
        }
    }
    if (uniqindex == 4) {
        if (quests[15]._qvar1 == 6) {
            if (gbMaxPlayers == 1)
                ObjChangeMapResync(1, 18, 20, 24);
            RedoPlayerVision();
            Monst->_mgoal = 1;
            Monst->_msquelch = 255;
            Monst->mtalkmsg = 0;
        }
    }

    uniquetrans++;

    if (Uniq->mUnqAttr & 4) {
        Monst->mHit = Uniq->mUnqVar1;
        Monst->mHit2 = Uniq->mUnqVar1;
    }
    if (Uniq->mUnqAttr & 8)
        Monst->mArmorClass = Uniq->mUnqVar1;

    nummonsters++;

    if (Uniq->mUnqAttr & 1)
        PlaceGroup(miniontype, unpackfilesize, Uniq->mUnqAttr, nummonsters - 1);

    if (Monst->_mAi != 12) {
        Monst->Action = 0;
        Monst->_mAnimFrame = ENG_random(Monst->_mAnimLen - 1) + 1;
        Monst->_mFlags &= ~4;
        Monst->_mmode = 0;
    }
}

/* --------------------------------------------------------------------- */
void PlaceUniques(void)
{
    int u, mt;
    unsigned char done;

    for (u = 0; UniqMonst[u].mtype != -1; u++) {
        if (UniqMonst[u].mlevel == currlevel) {
            int monsttype;

            done = 0;
            monsttype = UniqMonst[u].mtype;
            SwapMonsterType(&monsttype);
            for (mt = 0; mt < nummtypes && !done; mt++)
                done = (Monsters[mt].mtype == monsttype);
            mt--;
            if (u == 0 && quests[2]._qactive == QUEST_NOTAVAIL)
                done = 0;
            if (u == 2 && quests[3]._qactive == QUEST_NOTAVAIL)
                done = 0;
            if (u == 3 && quests[7]._qactive == QUEST_NOTAVAIL)
                done = 0;
            if (u == 7 && quests[4]._qactive == QUEST_NOTAVAIL)
                done = 0;
            if (u == 8 && quests[11]._qactive == QUEST_NOTAVAIL)
                done = 0;
            if (done)
                PlaceUniqueMonst(u, mt, 8);
        }
    }
}

/* --------------------------------------------------------------------- */
int PreSpawnSkeleton(void)
{
    int i, j;
    int skeltypes;
    int skel;

    skeltypes = 0;
    for (i = 0; i < nummtypes; i++) {
        if (IsSkel(Monsters[i].mtype))
            skeltypes++;
    }

    if (skeltypes == 0)
        return -1;

    j = ENG_random(skeltypes);
    skeltypes = 0;
    for (i = 0; i < nummtypes; i++) {
        if (j < skeltypes)
            break;
        if (IsSkel(Monsters[i].mtype))
            skeltypes++;
    }

    skel = AddMonster(0, 0, 0, i - 1, 0);
    if (skel != -1)
        M_StartStand(skel, 0);

    return skel;
}

/* --------------------------------------------------------------------- */
void decode_enemy(int m, int enemy)
{
    if (enemy < 2) {
        monster[m]._menemy = enemy;
        monster[m]._mFlags = monster[m]._mFlags & ~0x10;
        monster[m]._menemyx = plr[enemy]._px;
        monster[m]._menemyy = plr[enemy]._py;
    } else {
        enemy -= 2;
        monster[m]._menemy = enemy;
        monster[m]._mFlags = monster[m]._mFlags | 0x10;
        monster[m]._menemyx = monster[enemy]._mfutx;
        monster[m]._menemyy = monster[enemy]._mfuty;
    }
}

/* --------------------------------------------------------------------- */
unsigned char IsGoat(int mt)
{
    return (unsigned)(mt - 0x22) < 4 || (unsigned)(mt - 0x2A) < 4;
}
