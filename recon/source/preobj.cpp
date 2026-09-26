/* PREOBJ.CPP — Diablo PSX (Climax 1998) reconstruction (PREGAME overlay).
 * Twin: refs/devilution/Source/objects.cpp (the "Add<Type>" per-object-type setup handlers +
 * the random placement helpers). AddObject()/SetupObject() themselves stay in the main-image
 * OBJECTS.CPP TU (owned by another agent); this overlay TU supplies every per-type handler AND
 * the PreObjObjAddSwitch(ot,ox,oy,oi) dispatcher that the main-image AddObject() calls into
 * across the overlay boundary (the switch(ot){...} half of devilution's AddObject()).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 *
 * PSX deltas vs devilution (confirmed against the retail oracle, function by function):
 *  - dPiece[x][y] reads -> GetDPiece(x,y); dObject[x][y] writes -> dung_map[x][y].dObject;
 *    dFlags[x][y]&BFLAG_POPULATED -> dung_map[x][y].dFlags&BFLAG_POPULATED; dPlayer[][]!=0 test
 *    -> IsDplayer(x,y); nSolidTable[dPiece[][]] -> GetSOLID(x,y); nTrapTable[dPiece[][]] ->
 *    GetTRAP(x,y). random_(seedtable_idx, n) -> ENG_random(n) (the seed-table index argument is
 *    dropped everywhere).
 *  - the devilution/PC search-area constant 80 (random_(...,80)+16) is 0x40 (64) on PSX in every
 *    placement routine (InitRndLocObj/BigObj/5x5, AddBookLever, InitRndBarrels, AddStoryBooks,
 *    AddLazStand) — genuine PSX tuning, not a transcription choice.
 *  - AddShrine drops the per-shrine shrinemin[]/shrinemax[] level-range tables entirely; PSX
 *    hardcodes ONE special case (shrine index 7, "Enchanted") to `currlevel < 9`, everything else
 *    to `currlevel < 17` (all other devilution entries share min=1/max=MAX_LEVELS anyway, so this
 *    is a constant-fold Climax wrote by hand, not a bug). NUM_SHRINETYPE is 26 on PSX (shrineavail
 *    extern is 26 bytes), vs devilution's larger vanilla+Hellfire list.
 *  - PreObjObjAddSwitch's AddObjLight() calls use two literal radii, 0x3F3 and 0x1B8, in place of
 *    devilution's per-cluster 3, 5 and 8 (SKFIRE, CANDLE1, CANDLE2, BOOKCANDLE, TORCHL, TORCHR,
 *    TORCHL2, TORCHR2 and STORYCANDLE all collapse to ONE shared case-block using 0x3F3;
 *    L1LIGHT/BCROSS/TBCROSS share 0x1B8, with L1LIGHT written
 *    as a case-label FALLTHROUGH into the BCROSS/TBCROSS handler after AddBrnCross()). Transcribed
 *    exactly as observed — not "corrected" back to devilution's radii.
 *  - AddBookLever's tail differs from devilution: PSX writes literal `_oVar6 = 2;` then
 *    `leverid++;` then `_oAnimFrame = 1;` as three separate statements (devilution instead does
 *    `leverid++; _oVar6 = _oAnimFrame + 1;` with no _oAnimFrame store).
 *  - InitObjects' mushroom-patch gate adds a PSX-only `gbMaxPlayers != 2` guard alongside
 *    QuestStatus(Q_MUSHROOM) && currlevel==quests[Q_MUSHROOM]._qlevel (devilution tests
 *    `_qactive==QUEST_INIT` directly instead of calling QuestStatus + the players check).
 *  - SetMapObjects drops devilution's per-object CEL sprintf/LoadFileInMem/pObjCels loading loop
 *    entirely — the third pass just registers `ObjFileList[numobjfiles++] = i;` (PSX object art is
 *    already resident, not streamed per-map).
 *  - AddL1Door/AddSCambBook/AddChest/... use GetDPiece(x,y) for the raw dPiece reads devilution
 *    keeps as `dPiece[x][y]`; AddL1Door additionally zeroes `_oAnimFlag` (devilution does not).
 */
#include "diabpsx_types.h"
#include "source/gen/structs_preobj.h"
#include "source/gen/externs_preobj.h"
#include "source/gen/protos_preobj.h"
#include "source/diablo.h"

#define MAXOBJECTS   127
#define MAXDUNX      96
#define MAXDUNY      96
#define DMAXX        40
#define DMAXY        40
#define NUM_SHRINETYPE 26

#define BFLAG_POPULATED 0x08

#define DTYPE_TOWN      0
#define DTYPE_CATHEDRAL 1
#define DTYPE_CATACOMBS 2
#define DTYPE_CAVES     3
#define DTYPE_HELL      4

#define MIS_ARROW     0
#define MIS_FIREBOLT  1
#define MIS_LIGHTCTRL 7

#define Q_ROCK     0x00
#define Q_MUSHROOM 0x01
#define Q_BUTCHER  0x06
#define Q_LTBANNER 0x07
#define Q_BLIND    0x08
#define Q_BLOOD    0x09
#define Q_WARLORD  0x0B
#define Q_PWATER   0x0D
#define Q_SCHAMB   0x0E
#define Q_BETRAYER 0x0F
#define QUEST_INIT 1

#define TEXT_BLOODY    0xEC
#define TEXT_BLINDING  0xED
#define TEXT_BLOODWAR  0xEE
#define TEXT_MBLOODY   0xF0
#define TEXT_MBLINDING 0xF1
#define TEXT_MBLOODWAR 0xF2
#define TEXT_RBLOODY   0xF4
#define TEXT_RBLINDING 0xF5
#define TEXT_RBLOODWAR 0xF6

#define PC_WARRIOR  0
#define PC_ROGUE    1
#define PC_SORCERER 2

/* object type ids (retail values, from devilution enums.h; PSX bytes verified per-call-site) */
#define OBJ_L1LIGHT      0x00
#define OBJ_L1LDOOR      0x01
#define OBJ_L1RDOOR      0x02
#define OBJ_SKFIRE       0x03
#define OBJ_LEVER        0x04
#define OBJ_CHEST1       0x05
#define OBJ_CHEST2       0x06
#define OBJ_CHEST3       0x07
#define OBJ_CANDLE1      0x08
#define OBJ_CANDLE2      0x09
#define OBJ_BOOK2L       0x19
#define OBJ_BCROSS       0x1A
#define OBJ_TNUDEM1      0x1D
#define OBJ_TNUDEM2      0x1E
#define OBJ_TNUDEM3      0x1F
#define OBJ_TNUDEM4      0x20
#define OBJ_TNUDEW1      0x21
#define OBJ_TNUDEW2      0x22
#define OBJ_TNUDEW3      0x23
#define OBJ_TORTURE1     0x24
#define OBJ_TORTURE2     0x25
#define OBJ_TORTURE3     0x26
#define OBJ_TORTURE4     0x27
#define OBJ_TORTURE5     0x28
#define OBJ_BOOK2R       0x29
#define OBJ_L2LDOOR      0x2A
#define OBJ_L2RDOOR      0x2B
#define OBJ_TORCHL       0x2C
#define OBJ_TORCHR       0x2D
#define OBJ_TORCHL2      0x2E
#define OBJ_TORCHR2      0x2F
#define OBJ_SARC         0x30
#define OBJ_FLAMEHOLE    0x31
#define OBJ_FLAMELVR     0x32
#define OBJ_WATER        0x33
#define OBJ_TRAPL        0x35
#define OBJ_TRAPR        0x36
#define OBJ_BARREL       0x39
#define OBJ_BARRELEX     0x3A
#define OBJ_SHRINEL      0x3B
#define OBJ_SHRINER      0x3C
#define OBJ_SKELBOOK     0x3D
#define OBJ_BOOKCASEL    0x3E
#define OBJ_BOOKCASER    0x3F
#define OBJ_BOOKSTAND    0x40
#define OBJ_BOOKCANDLE   0x41
#define OBJ_BLOODFTN     0x42
#define OBJ_DECAP        0x43
#define OBJ_TCHEST1      0x44
#define OBJ_TCHEST2      0x45
#define OBJ_TCHEST3      0x46
#define OBJ_PEDISTAL     0x49
#define OBJ_L3LDOOR      0x4A
#define OBJ_L3RDOOR      0x4B
#define OBJ_PURIFYINGFTN 0x4C
#define OBJ_ARMORSTAND   0x4D
#define OBJ_GOATSHRINE   0x4F
#define OBJ_CAULDRON     0x50
#define OBJ_MURKYFTN     0x51
#define OBJ_TEARFTN      0x52
#define OBJ_MCIRCLE1     0x54
#define OBJ_MCIRCLE2     0x55
#define OBJ_STORYBOOK    0x56
#define OBJ_STORYCANDLE  0x57
#define OBJ_WARARMOR     0x59
#define OBJ_WARWEAP      0x5A
#define OBJ_TBCROSS      0x5B
#define OBJ_WEAPONRACK   0x5C
#define OBJ_MUSHPATCH    0x5E
#define OBJ_LAZSTAND     0x5F
#define OBJ_SLAINHERO    0x60
#define OBJ_SIGNCHEST    0x61

#define MIS_FLAMEC 0x31

/* forward decls needed because this TU's retail definition order (mirrored below) uses
 * GetRndObjLoc/SetMapObjects before RndLocOk/ClrAllObjects are defined further down. */
BOOL RndLocOk(int xp, int yp);
void ClrAllObjects();

/* ---- simple per-type "Add" handlers (called only via PreObjObjAddSwitch / AddObject) ---- */

void AddL1Door(int i, int x, int y, int ot)
{
    object[i]._oDoorFlag = 1;
    object[i]._oAnimFlag = 0;
    if (ot == OBJ_L1LDOOR) {
        object[i]._oVar1 = GetDPiece(x, y);
        object[i]._oVar2 = GetDPiece(x, y - 1);
    } else {
        object[i]._oVar1 = GetDPiece(x, y);
        object[i]._oVar2 = GetDPiece(x - 1, y);
    }
    object[i]._oVar4 = 0;
}

void AddSCambBook(int i)
{
    object[i]._oVar1 = setpc_x;
    object[i]._oVar2 = setpc_y;
    object[i]._oVar3 = setpc_w + setpc_x + 1;
    object[i]._oVar6 = object[i]._oAnimFrame + 1;
    object[i]._oVar4 = setpc_h + setpc_y + 1;
}

void AddChest(int i, int t)
{
    object[i]._oRndSeed = GetRndSeed();
    switch (t) {
    case OBJ_CHEST1:
    case OBJ_TCHEST1:
        if (setlevel) {
            object[i]._oVar1 = 1;
            break;
        }
        object[i]._oVar1 = ENG_random(2);
        break;
    case OBJ_TCHEST2:
    case OBJ_CHEST2:
        if (setlevel) {
            object[i]._oVar1 = 2;
            break;
        }
        object[i]._oVar1 = ENG_random(3);
        break;
    case OBJ_TCHEST3:
    case OBJ_CHEST3:
        if (setlevel) {
            object[i]._oVar1 = 3;
            break;
        }
        object[i]._oVar1 = ENG_random(4);
        break;
    }
    object[i]._oVar2 = ENG_random(8);
}

void AddL2Door(int i, int x, int y, int ot)
{
    object[i]._oDoorFlag = 1;
    if (ot == OBJ_L2LDOOR) {
        ObjSetMicro(x, y, 538);
        dungeon[(x - 16) >> 1][(y - 16) >> 1] = 0x96;
        object[i]._oAnimFrame = 1;
    } else {
        ObjSetMicro(x, y, 540);
        dungeon[(x - 16) >> 1][(y - 16) >> 1] = 0x97;
        object[i]._oAnimFrame = 2;
    }
    object[i]._oVar4 = 0;
}

void AddL3Door(int i, int x, int y, int ot)
{
    object[i]._oDoorFlag = 1;
    object[i]._oAnimFlag = 0;
    if (ot == OBJ_L3LDOOR)
        ObjSetMicro(x, y, 531);
    else
        ObjSetMicro(x, y, 534);
    object[i]._oVar4 = 0;
}

void AddSarc(int i)
{
    int x, y;

    x = object[i]._ox;
    y = object[i]._oy;
    dung_map[x][y - 1].dObject = -(i + 1);
    object[i]._oVar1 = ENG_random(10);
    object[i]._oRndSeed = GetRndSeed();
    if (object[i]._oVar1 >= 8)
        object[i]._oVar2 = PreSpawnSkeleton();
}

void AddFlameTrap(int i)
{
    object[i]._oVar1 = trapid;
    object[i]._oVar2 = 0;
    object[i]._oVar3 = trapdir;
    object[i]._oVar4 = 0;
}

void AddTrap(int i, int ot)
{
    int mt;

    mt = currlevel / 3 + 1;
    mt = ENG_random(mt);
    if (mt == 0)
        object[i]._oVar3 = MIS_ARROW;
    if (mt == 1)
        object[i]._oVar3 = MIS_FIREBOLT;
    if (mt == 2)
        object[i]._oVar3 = MIS_LIGHTCTRL;
    object[i]._oVar4 = 0;
}

void AddArmorStand(int i)
{
    if (!armorFlag) {
        object[i]._oAnimFlag = 2;
        object[i]._oSelFlag = 0;
    }
    object[i]._oRndSeed = GetRndSeed();
}

void AddObjLight(int i, int r)
{
    if (!level_lamp[leveltype])
        return;
    if (InitObjFlag) {
        object[i]._olid = AddLight(object[i]._ox, object[i]._oy, r);
        object[i]._oVar1 = -1;
    } else {
        object[i]._oVar1 = 0;
    }
}

void AddBarrel(int i, int ot)
{
    object[i]._oVar1 = 0;
    object[i]._oRndSeed = GetRndSeed();
    object[i]._oVar2 = ENG_random(10);
    object[i]._oVar3 = ENG_random(3);
    if (object[i]._oVar2 >= 8)
        object[i]._oVar4 = PreSpawnSkeleton();
}

void AddShrine(int i)
{
    unsigned char slist[NUM_SHRINETYPE];
    unsigned int j;
    int val;

    object[i]._oPreFlag = 1;
    for (j = 0; j < NUM_SHRINETYPE; j++) {
        if (currlevel == 0) {
            slist[j] = 0;
        } else if (j == 7) {
            slist[j] = (currlevel < 9);
        } else {
            slist[j] = (currlevel < 17);
        }
        if (gbMaxPlayers != 1 && shrineavail[j] == 1)
            slist[j] = 0;
        if (gbMaxPlayers == 1 && shrineavail[j] == 2)
            slist[j] = 0;
    }
    do {
        val = ENG_random(NUM_SHRINETYPE);
    } while (!slist[val]);

    object[i]._oVar1 = val;
}

void AddBookcase(int i)
{
    object[i]._oRndSeed = GetRndSeed();
    object[i]._oPreFlag = 1;
}

void AddBookstand(int i)
{
    object[i]._oRndSeed = GetRndSeed();
}

void AddBloodFtn(int i)
{
    object[i]._oRndSeed = GetRndSeed();
}

void AddPurifyingFountain(int i)
{
    int x, y;

    x = object[i]._ox;
    y = object[i]._oy;
    dung_map[x][y - 1].dObject = -1 - i;
    dung_map[x - 1][y].dObject = -1 - i;
    dung_map[x - 1][y - 1].dObject = -1 - i;
    object[i]._oRndSeed = GetRndSeed();
}

void AddGoatShrine(int i)
{
    object[i]._oRndSeed = GetRndSeed();
}

void AddCauldron(int i)
{
    object[i]._oRndSeed = GetRndSeed();
}

void AddMurkyFountain(int i)
{
    int x, y;

    x = object[i]._ox;
    y = object[i]._oy;
    dung_map[x][y - 1].dObject = -1 - i;
    dung_map[x - 1][y].dObject = -1 - i;
    dung_map[x - 1][y - 1].dObject = -1 - i;
    object[i]._oRndSeed = GetRndSeed();
}

void AddTearFountain(int i)
{
    object[i]._oRndSeed = GetRndSeed();
}

void AddDecap(int i)
{
    object[i]._oRndSeed = GetRndSeed();
    object[i]._oAnimFrame = ENG_random(1);
    object[i]._oPreFlag = 1;
}

void AddVilebook(int i)
{
    if (setlevel && setlvlnum == 5 /* SL_VILEBETRAYER */)
        object[i]._oAnimFrame = 4;
}

void AddMagicCircle(int i)
{
    object[i]._oRndSeed = GetRndSeed();
    object[i]._oPreFlag = 1;
    object[i]._oVar6 = 0;
    object[i]._oVar5 = 1;
}

void AddBrnCross(int i)
{
    object[i]._oRndSeed = GetRndSeed();
}

void AddPedistal(int i)
{
    object[i]._oVar1 = setpc_x;
    object[i]._oVar2 = setpc_y;
    object[i]._oVar3 = setpc_x + setpc_w;
    object[i]._oVar4 = setpc_y + setpc_h;
    if (quests[Q_BLOOD]._qvar2)
        object[i]._oVar6 = quests[Q_BLOOD]._qvar2 - 1;
    else
        object[i]._oVar6 = 0;
}

void AddStoryBook(int i)
{
    int bookframe;

    SetRndSeed(glSeedTbl[16]);
    bookframe = ENG_random(3);
    object[i]._oVar1 = bookframe;
    if (currlevel == 4)
        object[i]._oVar2 = StoryText[object[i]._oVar1][0];
    if (currlevel == 8)
        object[i]._oVar2 = StoryText[object[i]._oVar1][1];
    if (currlevel == 12)
        object[i]._oVar2 = StoryText[object[i]._oVar1][2];
    object[i]._oAnimFrame = 1;
    object[i]._oVar4 = 2;
    object[i]._oVar3 = (currlevel >> 2) + 3 * object[i]._oVar1 - 1;
}

void AddWeaponRack(int i)
{
    if (!weaponFlag) {
        object[i]._oAnimFlag = 2;
        object[i]._oSelFlag = 0;
    }
    object[i]._oRndSeed = GetRndSeed();
}

void AddTorturedBody(int i)
{
    object[i]._oRndSeed = GetRndSeed();
    object[i]._oAnimFrame = ENG_random(4) + 1;
    object[i]._oPreFlag = 1;
}

void AddFlameLvr(int i)
{
    object[i]._oVar1 = trapid;
    object[i]._oVar2 = MIS_FLAMEC;
}

/* ---- random-location helpers ---- */

void GetRndObjLoc(int randarea, int &xx, int &yy)
{
    unsigned char failed;
    int i, j, tries;

    if (randarea == 0)
        return;

    tries = 0;
    while (1) {
        tries++;
        if (tries > 1000 && randarea > 1)
            randarea--;
        xx = ENG_random(MAXDUNX);
        yy = ENG_random(MAXDUNY);
        failed = 0;
        for (i = 0; i < randarea && !failed; i++) {
            for (j = 0; j < randarea && !failed; j++) {
                failed = (unsigned char)RndLocOk(xx + i, yy + j) == 0;
            }
        }
        if (!failed)
            break;
    }
}

void AddMushPatch()
{
    int i;
    int y, x;

    if (numobjects < MAXOBJECTS) {
        i = objectavail[0];
        GetRndObjLoc(5, x, y);
        dung_map[x + 1][y + 1].dObject = -1 - i;
        dung_map[x + 2][y + 1].dObject = -1 - i;
        dung_map[x + 1][y + 2].dObject = -1 - i;
        AddObject(OBJ_MUSHPATCH, x + 2, y + 2);
    }
}

void AddSlainHero()
{
    int x, y;

    GetRndObjLoc(5, x, y);
    AddObject(OBJ_SLAINHERO, x + 2, y + 2);
}

BOOL RndLocOk(int xp, int yp)
{
    if (dung_map[xp][yp].dMonster != 0)
        return 0;
    if (IsDplayer(xp, yp))
        return 0;
    if (dung_map[xp][yp].dObject != 0)
        return 0;
    if (dung_map[xp][yp].dFlags & BFLAG_POPULATED)
        return 0;
    if (GetSOLID(xp, yp))
        return 0;
    if (leveltype != DTYPE_CATHEDRAL || GetDPiece(xp, yp) <= 126 || GetDPiece(xp, yp) >= 144)
        return 1;
    return 0;
}

BOOL TrapLocOk(int xp, int yp)
{
    if (dung_map[xp][yp].dFlags & BFLAG_POPULATED)
        return 0;
    if (GetSOLID(xp, yp) != 0)
        return 0;
    return 1;
}

void InitRndLocObj(int min, int max, int objtype)
{
    int i, xp, yp, numobjs;

    numobjs = ENG_random(max - min) + min;
    for (i = 0; i < numobjs; i++) {
        while (1) {
            xp = ENG_random(0x40) + 16;
            yp = ENG_random(0x40) + 16;
            if (RndLocOk(xp - 1, yp - 1)
                && RndLocOk(xp, yp - 1)
                && RndLocOk(xp + 1, yp - 1)
                && RndLocOk(xp - 1, yp)
                && RndLocOk(xp, yp)
                && RndLocOk(xp + 1, yp)
                && RndLocOk(xp - 1, yp + 1)
                && RndLocOk(xp, yp + 1)
                && RndLocOk(xp + 1, yp + 1)) {
                AddObject(objtype, xp, yp);
                break;
            }
        }
    }
}

void InitRndLocBigObj(int min, int max, int objtype)
{
    int i, xp, yp, numobjs;

    numobjs = ENG_random(max - min) + min;
    for (i = 0; i < numobjs; i++) {
        while (1) {
            xp = ENG_random(0x40) + 16;
            yp = ENG_random(0x40) + 16;
            if (RndLocOk(xp - 1, yp - 2)
                && RndLocOk(xp, yp - 2)
                && RndLocOk(xp + 1, yp - 2)
                && RndLocOk(xp - 1, yp - 1)
                && RndLocOk(xp, yp - 1)
                && RndLocOk(xp + 1, yp - 1)
                && RndLocOk(xp - 1, yp)
                && RndLocOk(xp, yp)
                && RndLocOk(xp + 1, yp)
                && RndLocOk(xp - 1, yp + 1)
                && RndLocOk(xp, yp + 1)
                && RndLocOk(xp + 1, yp + 1)) {
                AddObject(objtype, xp, yp);
                break;
            }
        }
    }
}

void InitRndLocObj5x5(int min, int max, int objtype)
{
    int xp, yp, xx, yy, cnt;
    unsigned char done;
    int numobjs, i;

    numobjs = ENG_random(max - min) + min;
    for (i = 0; i < numobjs; i++) {
        cnt = 0;
        done = 0;
        while (!done) {
            done = 1;
            xp = ENG_random(0x40) + 16;
            yp = ENG_random(0x40) + 16;
            for (yy = -2; yy <= 2; yy++) {
                for (xx = -2; xx <= 2; xx++) {
                    if ((unsigned char)RndLocOk(xp + xx, yp + yy) == 0)
                        done = 0;
                }
            }
            if (!done) {
                cnt++;
                if (cnt > 20000)
                    return;
            }
        }
        AddObject(objtype, xp, yp);
    }
}

void SetMapObjects(unsigned char *pMap, int startx, int starty)
{
    int rw, rh;
    int i, j;
    unsigned char *lm, *h;
    long mapoff;
    unsigned char fileload[56];
    char filestr[32];

    ClrAllObjects();
    for (i = 0; i < 56; i++)
        fileload[i] = 0;
    InitObjFlag = 1;

    for (i = 0; AllObjects[i].oload != -1; i++) {
        if (AllObjects[i].oload == 1 && leveltype == AllObjects[i].olvltype)
            fileload[AllObjects[i].ofindex] = 1;
    }

    lm = pMap;
    rw = *lm;
    lm += 2;
    rh = *lm;
    mapoff = (rw * rh + 1) * 2;
    rw <<= 1;
    rh <<= 1;
    mapoff += 2 * rw * rh * 2;
    lm += mapoff;
    h = lm;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm)
                fileload[AllObjects[ObjTypeConv[*lm]].ofindex] = 1;
            lm += 2;
        }
    }

    for (i = 0; i < 56; i++) {
        if (!fileload[i])
            continue;
        ObjFileList[numobjfiles] = i;
        numobjfiles++;
    }

    lm = h;
    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm)
                AddObject(ObjTypeConv[*lm], startx + 16 + i, starty + 16 + j);
            lm += 2;
        }
    }
    InitObjFlag = 0;
}

void ClrAllObjects()
{
    int i;

    for (i = 0; i < MAXOBJECTS; i++) {
        object[i]._ox = 0;
        object[i]._oy = 0;
        object[i]._oAnimDelay = 0;
        object[i]._oAnimCnt = 0;
        object[i]._oAnimLen = 0;
        object[i]._oAnimFrame = 0;
        object[i]._oDelFlag = 0;
        object[i]._oVar1 = 0;
        object[i]._oVar2 = 0;
        object[i]._oVar3 = 0;
        object[i]._oVar4 = 0;
    }
    numobjects = 0;
    for (i = 0; i < MAXOBJECTS; i++) {
        objectavail[i] = i;
        objectactive[i] = 0;
    }
    trapid = 1;
    trapdir = 0;
    leverid = 1;
}

void AddTortures()
{
    int yp, xp;

    for (yp = 0; yp < MAXDUNY; yp++) {
        for (xp = 0; xp < MAXDUNX; xp++) {
            if (GetDPiece(xp, yp) == 367) {
                AddObject(OBJ_TORTURE1, xp, yp + 1);
                AddObject(OBJ_TORTURE3, xp + 2, yp - 1);
                AddObject(OBJ_TORTURE2, xp, yp + 3);
                AddObject(OBJ_TORTURE4, xp + 4, yp - 1);
                AddObject(OBJ_TORTURE5, xp, yp + 5);
                AddObject(OBJ_TNUDEM1, xp + 1, yp + 3);
                AddObject(OBJ_TNUDEM2, xp + 4, yp + 5);
                AddObject(OBJ_TNUDEM3, xp + 2, yp);
                AddObject(OBJ_TNUDEM4, xp + 3, yp + 2);
                AddObject(OBJ_TNUDEW1, xp + 2, yp + 4);
                AddObject(OBJ_TNUDEW2, xp + 2, yp + 1);
                AddObject(OBJ_TNUDEW3, xp + 4, yp + 2);
            }
        }
    }
}

void AddCandles()
{
    int xp, yp;

    xp = quests[Q_PWATER]._qtx;
    yp = quests[Q_PWATER]._qty;
    AddObject(OBJ_STORYCANDLE, xp - 2, yp + 1);
    AddObject(OBJ_STORYCANDLE, xp + 3, yp + 1);
    AddObject(OBJ_STORYCANDLE, xp - 1, yp + 2);
    AddObject(OBJ_STORYCANDLE, xp + 2, yp + 2);
}

void AddBookLever(int lx1, int ly1, int lx2, int ly2, int x1, int y1, int x2, int y2, int msg)
{
    unsigned char done;
    int xp, yp, ob, cnt, m, n;

    cnt = 0;
    done = 0;
    while (!done) {
        done = 1;
        xp = ENG_random(0x40) + 16;
        yp = ENG_random(0x40) + 16;
        for (n = -2; n <= 2; n++) {
            for (m = -2; m <= 2; m++) {
                if ((unsigned char)RndLocOk(xp + m, yp + n) == 0)
                    done = 0;
            }
        }
        if (!done) {
            cnt++;
            if (cnt > 20000)
                return;
        }
    }

    if (QuestStatus(Q_BLIND))
        AddObject(0x47 /* OBJ_BLINDBOOK */, xp, yp);
    if (QuestStatus(Q_WARLORD))
        AddObject(0x58 /* OBJ_STEELTOME */, xp, yp);
    if (QuestStatus(Q_BLOOD)) {
        xp = 2 * setpc_x + 25;
        yp = 2 * setpc_y + 40;
        AddObject(0x48 /* OBJ_BLOODBOOK */, xp, yp);
    }
    ob = dung_map[xp][yp].dObject - 1;
    SetObjMapRange(ob, x1, y1, x2, y2, leverid);
    SetBookMsg(ob, msg);
    object[ob]._oVar6 = 2;
    leverid++;
    object[ob]._oAnimFrame = 1;
}

void InitRndBarrels()
{
    int numobjs;
    int xp, yp;
    int o;
    unsigned char found;
    int p;
    int dir;
    int t;
    int c;
    int i;

    numobjs = ENG_random(5) + 3;
    for (i = 0; i < numobjs; i++) {
        do {
            xp = ENG_random(0x40) + 16;
            yp = ENG_random(0x40) + 16;
        } while (!RndLocOk(xp, yp));
        o = (ENG_random(4) != 0) ? OBJ_BARREL : OBJ_BARRELEX;
        AddObject(o, xp, yp);
        found = 1;
        p = 0;
        c = 1;
        while (ENG_random(p) == 0 && found) {
            t = 0;
            found = 0;
            while (1) {
                if (t >= 3)
                    break;
                dir = ENG_random(8);
                xp += bxadd[dir];
                yp += byadd[dir];
                found = RndLocOk(xp, yp);
                t++;
                if (found)
                    break;
            }
            if (found) {
                o = (ENG_random(5) != 0) ? OBJ_BARREL : OBJ_BARRELEX;
                AddObject(o, xp, yp);
                c++;
            }
            p = c >> 1;
        }
    }
}

void AddL1Objs(int x1, int y1, int x2, int y2)
{
    int i, j, pn;

    for (j = y1; j < y2; j++) {
        for (i = x1; i < x2; i++) {
            pn = GetDPiece(i, j);
            if (pn == 270)
                AddObject(OBJ_L1LIGHT, i, j);
            if (pn == 44 || pn == 51 || pn == 214)
                AddObject(OBJ_L1LDOOR, i, j);
            if (pn == 46 || pn == 56)
                AddObject(OBJ_L1RDOOR, i, j);
        }
    }
}

void AddL2Objs(int x1, int y1, int x2, int y2)
{
    int i, j, pn;

    for (j = y1; j < y2; j++) {
        for (i = x1; i < x2; i++) {
            pn = GetDPiece(i, j);
            if (pn == 13 || pn == 541)
                AddObject(OBJ_L2LDOOR, i, j);
            if (pn == 17 || pn == 542)
                AddObject(OBJ_L2RDOOR, i, j);
        }
    }
}

void AddL3Objs(int x1, int y1, int x2, int y2)
{
    int i, j, pn;

    for (j = y1; j < y2; j++) {
        for (i = x1; i < x2; i++) {
            pn = GetDPiece(i, j);
            if (pn == 531)
                AddObject(OBJ_L3LDOOR, i, j);
            if (pn == 534)
                AddObject(OBJ_L3RDOOR, i, j);
        }
    }
}

BOOL WallTrapLocOk(int xp, int yp)
{
    if (dung_map[xp][yp].dFlags & BFLAG_POPULATED)
        return 0;
    if (GetTRAP(xp, yp) != 1)
        return 0;
    return 1;
}

BOOL TorchLocOK(int xp, int yp)
{
    if (dung_map[xp][yp].dFlags & BFLAG_POPULATED)
        return 0;
    return 1;
}

void AddL2Torches()
{
    int i, j, pn;

    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if ((unsigned char)TorchLocOK(i, j) == 0)
                continue;

            pn = GetDPiece(i, j);
            if (pn == 1 && ENG_random(3) == 0)
                AddObject(OBJ_TORCHL2, i, j);

            if (pn == 5 && ENG_random(3) == 0)
                AddObject(OBJ_TORCHR2, i, j);

            if (pn == 37 && ENG_random(10) == 0 && dung_map[i - 1][j].dObject == 0)
                AddObject(OBJ_TORCHL, i - 1, j);

            if (pn == 41 && ENG_random(10) == 0 && dung_map[i][j - 1].dObject == 0)
                AddObject(OBJ_TORCHR, i, j - 1);
        }
    }
}

void AddObjTraps()
{
    char oi_trap, oi;
    int i, j;
    int xp, yp;
    int rndv;

    if (currlevel == 1)
        rndv = 10;
    if (currlevel >= 2)
        rndv = 15;
    if (currlevel >= 5)
        rndv = 20;
    if (currlevel >= 7)
        rndv = 25;
    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (dung_map[i][j].dObject <= 0 || ENG_random(100) >= rndv)
                continue;

            oi = dung_map[i][j].dObject - 1;
            if (!AllObjects[object[oi]._otype].oTrapFlag)
                continue;

            if (ENG_random(2) == 0) {
                xp = i - 1;
                while (!GetSOLID(xp, j))
                    xp--;

                if (!WallTrapLocOk(xp, j) || i - xp <= 1)
                    continue;

                AddObject(OBJ_TRAPL, xp, j);
                oi_trap = dung_map[xp][j].dObject - 1;
                object[oi_trap]._oVar1 = i;
                object[oi_trap]._oVar2 = j;
                object[oi]._oTrapFlag = 1;
            } else {
                yp = j - 1;
                while (!GetSOLID(i, yp))
                    yp--;

                if (!WallTrapLocOk(i, yp) || j - yp <= 1)
                    continue;

                AddObject(OBJ_TRAPR, i, yp);
                oi_trap = dung_map[i][yp].dObject - 1;
                object[oi_trap]._oVar1 = i;
                object[oi_trap]._oVar2 = j;
                object[oi]._oTrapFlag = 1;
            }
        }
    }
}

void AddChestTraps()
{
    int i, j;
    char oi;

    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (dung_map[i][j].dObject > 0) {
                oi = dung_map[i][j].dObject - 1;
                if (object[oi]._otype >= OBJ_CHEST1 && object[oi]._otype <= OBJ_CHEST3 && !object[oi]._oTrapFlag && ENG_random(100) < 10) {
                    object[oi]._otype += OBJ_TCHEST1 - OBJ_CHEST1;
                    object[oi]._oTrapFlag = 1;
                    if (leveltype == DTYPE_CATACOMBS) {
                        object[oi]._oVar4 = ENG_random(2);
                    } else {
                        object[oi]._oVar4 = ENG_random(3);
                    }
                }
            }
        }
    }
}

void LoadMapObjects(unsigned char *pMap, int startx, int starty, int x1, int y1, int w, int h, int leveridx)
{
    int rw, rh, i, j, oi, type;
    unsigned char *lm;
    long mapoff;

    InitObjFlag = 1;

    lm = pMap;
    rw = *lm;
    lm += 2;
    rh = *lm;
    mapoff = (rw * rh + 1) * 2;
    rw <<= 1;
    rh <<= 1;
    mapoff += rw * 2 * rh * 2;
    lm += mapoff;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm) {
                type = *lm;
                AddObject(ObjTypeConv[type], startx + 16 + i, starty + 16 + j);
                oi = ObjIndex(startx + 16 + i, starty + 16 + j);
                SetObjMapRange(oi, x1, y1, x1 + w, y1 + h, leveridx);
            }
            lm += 2;
        }
    }

    InitObjFlag = 0;
}

void AddDiabObjs()
{
    unsigned char *lpSetPiece;

    lpSetPiece = GRL_LoadFileInMemSig("diab1.DUN", NULL);
    LoadMapObjects(lpSetPiece, 2 * diabquad1x, 2 * diabquad1y, diabquad2x, diabquad2y, 11, 12, 1);
    mem_free_dbg(lpSetPiece);
    lpSetPiece = GRL_LoadFileInMemSig("diab2a.DUN", NULL);
    LoadMapObjects(lpSetPiece, 2 * diabquad2x, 2 * diabquad2y, diabquad3x, diabquad3y, 11, 11, 2);
    mem_free_dbg(lpSetPiece);
    lpSetPiece = GRL_LoadFileInMemSig("diab3a.DUN", NULL);
    LoadMapObjects(lpSetPiece, 2 * diabquad3x, 2 * diabquad3y, diabquad4x, diabquad4y, 9, 9, 3);
    mem_free_dbg(lpSetPiece);
}

void AddStoryBooks()
{
    int xp, yp, xx, yy;
    int cnt;
    unsigned char done;

    cnt = 0;
    done = 0;
    while (!done) {
        done = 1;
        xp = ENG_random(0x40) + 16;
        yp = ENG_random(0x40) + 16;
        for (yy = -2; yy <= 2; yy++) {
            for (xx = -3; xx <= 3; xx++) {
                if ((unsigned char)RndLocOk(xp + xx, yp + yy) == 0)
                    done = 0;
            }
        }
        if (!done) {
            cnt++;
            if (cnt > 20000)
                return;
        }
    }
    AddObject(OBJ_STORYBOOK, xp, yp);
    AddObject(OBJ_STORYCANDLE, xp - 2, yp + 1);
    AddObject(OBJ_STORYCANDLE, xp - 2, yp);
    AddObject(OBJ_STORYCANDLE, xp - 1, yp - 1);
    AddObject(OBJ_STORYCANDLE, xp + 1, yp - 1);
    AddObject(OBJ_STORYCANDLE, xp + 2, yp);
    AddObject(OBJ_STORYCANDLE, xp + 2, yp + 1);
}

void AddHookedBodies(int freq)
{
    int i, j, ii, jj;

    for (j = 0; j < DMAXY; j++) {
        jj = 16 + j * 2;
        for (i = 0; i < DMAXX; i++) {
            ii = 16 + i * 2;
            if (dungeon[i][j] != 1 && dungeon[i][j] != 2)
                continue;
            if (ENG_random(freq) != 0)
                continue;
            if (!SkipThemeRoom(i, j))
                continue;
            if (dungeon[i][j] == 1 && dungeon[i + 1][j] == 6) {
                switch (ENG_random(3)) {
                case 0:
                    AddObject(OBJ_TORTURE1, ii + 1, jj);
                    break;
                case 1:
                    AddObject(OBJ_TORTURE2, ii + 1, jj);
                    break;
                case 2:
                    AddObject(OBJ_TORTURE5, ii + 1, jj);
                    break;
                }
                continue;
            }
            if (dungeon[i][j] == 2 && dungeon[i][j + 1] == 6) {
                switch (ENG_random(2)) {
                case 0:
                    AddObject(OBJ_TORTURE3, ii, jj);
                    break;
                case 1:
                    AddObject(OBJ_TORTURE4, ii, jj);
                    break;
                }
            }
        }
    }
}

void AddL4Goodies()
{
    AddHookedBodies(6);
    InitRndLocObj(2, 6, OBJ_TNUDEM1);
    InitRndLocObj(2, 6, OBJ_TNUDEM2);
    InitRndLocObj(2, 6, OBJ_TNUDEM3);
    InitRndLocObj(2, 6, OBJ_TNUDEM4);
    InitRndLocObj(2, 6, OBJ_TNUDEW1);
    InitRndLocObj(2, 6, OBJ_TNUDEW2);
    InitRndLocObj(2, 6, OBJ_TNUDEW3);
    InitRndLocObj(2, 6, OBJ_DECAP);
    InitRndLocObj(1, 3, OBJ_CAULDRON);
}

void AddLazStand()
{
    int xp, yp, xx, yy;
    int cnt;
    unsigned char done;

    cnt = 0;
    done = 0;
    while (!done) {
        done = 1;
        xp = ENG_random(0x40) + 16;
        yp = ENG_random(0x40) + 16;
        for (yy = -3; yy <= 3; yy++) {
            for (xx = -2; xx <= 3; xx++) {
                if ((unsigned char)RndLocOk(xp + xx, yp + yy) == 0)
                    done = 0;
            }
        }
        if (!done) {
            cnt++;
            if (cnt > 10000) {
                InitRndLocObj(1, 1, OBJ_LAZSTAND);
                return;
            }
        }
    }
    AddObject(OBJ_LAZSTAND, xp, yp);
    AddObject(OBJ_TNUDEM2, xp, yp + 2);
    AddObject(OBJ_STORYCANDLE, xp + 1, yp + 2);
    AddObject(OBJ_TNUDEM3, xp + 2, yp + 2);
    AddObject(OBJ_TNUDEW1, xp, yp - 2);
    AddObject(OBJ_STORYCANDLE, xp + 1, yp - 2);
    AddObject(OBJ_TNUDEW2, xp + 2, yp - 2);
    AddObject(OBJ_STORYCANDLE, xp - 1, yp - 1);
    AddObject(OBJ_TNUDEW3, xp - 1, yp);
    AddObject(OBJ_STORYCANDLE, xp - 1, yp + 1);
}

/* ---- PSX overlay-only glue: save/restore BOTH players' positions (hardcoded plr[0]/plr[1], not
 * myplr-indexed) across the pregame dungeon-object pass, using plr[0]'s own _pVar1-6 scratch
 * fields as the save area. No PC twin; reconstructed purely from the retail oracle, which reaches
 * plr[1]'s _px/_py/plractive via the literal offsets sizeof(PlayerStruct)+0x30/+0x32/+0x1D
 * (0x1A18/0x1A1A/0x1A05) instead of an indexed plr[1] access. ---- */
void saveplrpos()
{
    plr[0]._pVar1 = ViewX;
    plr[0]._pVar2 = ViewY;
    plr[0]._pVar3 = plr[0]._px;
    plr[0]._pVar4 = plr[0]._py;
    plr[0]._pVar5 = plr[1]._px;
    plr[0]._pVar6 = plr[1]._py;
    if (plr[0].plractive) {
        plr[0]._py = 0;
        plr[0]._px = 0;
    }
    if (plr[1].plractive) {
        plr[1]._py = 0;
        plr[1]._px = 0;
    }
    ViewY = 0;
    ViewX = 0;
}

void restoreplrpos()
{
    ViewX = plr[0]._pVar1;
    ViewY = plr[0]._pVar2;
    PlacePlayer(0, plr[0]._pVar3, plr[0]._pVar4, 0);
    PlacePlayer(1, plr[0]._pVar5, plr[0]._pVar6, 0);
}

void InitObjects()
{
    int textdef = 0;
    unsigned char *setp;

    ClrAllObjects();
    if (currlevel == 16) {
        AddDiabObjs();
    } else {
        saveplrpos();
        InitObjFlag = 1;
        GetRndSeed();
        if (currlevel == 9 && gbMaxPlayers == 1)
            AddSlainHero();
        if (QuestStatus(Q_MUSHROOM) && currlevel == quests[Q_MUSHROOM]._qlevel && gbMaxPlayers != 2)
            AddMushPatch();
        if (currlevel == 4)
            AddStoryBooks();
        if (currlevel == 8)
            AddStoryBooks();
        if (currlevel == 12)
            AddStoryBooks();
        if (leveltype == DTYPE_CATHEDRAL) {
            if (QuestStatus(Q_BUTCHER))
                AddTortures();
            if (QuestStatus(Q_PWATER))
                AddCandles();
            if (QuestStatus(Q_LTBANNER))
                AddObject(OBJ_SIGNCHEST, 2 * setpc_x + 26, 2 * setpc_y + 19);
            InitRndLocBigObj(10, 15, OBJ_SARC);
            AddL1Objs(0, 0, MAXDUNX, MAXDUNY);
            InitRndBarrels();
        }
        if (leveltype == DTYPE_CATACOMBS) {
            if (QuestStatus(Q_ROCK))
                InitRndLocObj5x5(1, 1, 0x17 /* OBJ_STAND */);
            if (QuestStatus(Q_SCHAMB))
                InitRndLocObj5x5(1, 1, OBJ_BOOK2R);
            AddL2Objs(0, 0, MAXDUNX, MAXDUNY);
            AddL2Torches();
            if (QuestStatus(Q_BLIND)) {
                if (plr[myplr]._pClass == PC_WARRIOR) {
                    textdef = TEXT_BLINDING;
                } else if (plr[myplr]._pClass == PC_ROGUE) {
                    textdef = TEXT_RBLINDING;
                } else if (plr[myplr]._pClass == PC_SORCERER) {
                    textdef = TEXT_MBLINDING;
                }
                quests[Q_BLIND]._qmsg = textdef;
                AddBookLever(0, 0, MAXDUNX, MAXDUNY, setpc_x, setpc_y, setpc_w + setpc_x + 1, setpc_h + setpc_y + 1, textdef);
                setp = GRL_LoadFileInMemSig("Levels\\L2Data\\Blind2.DUN", NULL);
                LoadMapObjs(setp, 2 * setpc_x, 2 * setpc_y);
                mem_free_dbg(setp);
            }
            if (QuestStatus(Q_BLOOD)) {
                if (plr[myplr]._pClass == PC_WARRIOR) {
                    textdef = TEXT_BLOODY;
                } else if (plr[myplr]._pClass == PC_ROGUE) {
                    textdef = TEXT_RBLOODY;
                } else if (plr[myplr]._pClass == PC_SORCERER) {
                    textdef = TEXT_MBLOODY;
                }
                quests[Q_BLOOD]._qmsg = textdef;
                AddBookLever(0, 0, MAXDUNX, MAXDUNY, setpc_x, setpc_y + 3, setpc_x + 2, setpc_y + 7, textdef);
                AddObject(OBJ_PEDISTAL, 2 * setpc_x + 25, 2 * setpc_y + 32);
            }
            InitRndBarrels();
        }
        if (leveltype == DTYPE_CAVES) {
            AddL3Objs(0, 0, MAXDUNX, MAXDUNY);
            InitRndBarrels();
        }
        if (leveltype == DTYPE_HELL) {
            if (QuestStatus(Q_WARLORD)) {
                if (plr[myplr]._pClass == PC_WARRIOR) {
                    textdef = TEXT_BLOODWAR;
                } else if (plr[myplr]._pClass == PC_ROGUE) {
                    textdef = TEXT_RBLOODWAR;
                } else if (plr[myplr]._pClass == PC_SORCERER) {
                    textdef = TEXT_MBLOODWAR;
                }
                quests[Q_WARLORD]._qmsg = textdef;
                AddBookLever(0, 0, MAXDUNX, MAXDUNY, setpc_x, setpc_y, setpc_x + setpc_w, setpc_y + setpc_h, textdef);
                setp = GRL_LoadFileInMemSig("Levels\\L4Data\\Warlord.DUN", NULL);
                LoadMapObjs(setp, 2 * setpc_x, 2 * setpc_y);
                mem_free_dbg(setp);
            }
            if (QuestStatus(Q_BETRAYER) && gbMaxPlayers == 1)
                AddLazStand();
            InitRndBarrels();
            AddL4Goodies();
        }
        InitRndLocObj(5, 10, OBJ_CHEST1);
        InitRndLocObj(3, 6, OBJ_CHEST2);
        InitRndLocObj(1, 5, OBJ_CHEST3);
        if (leveltype != DTYPE_HELL)
            AddObjTraps();
        if (leveltype > DTYPE_CATHEDRAL)
            AddChestTraps();
        restoreplrpos();
        InitObjFlag = 0;
    }
}

/* ---- PSX overlay dispatcher: the switch(ot){...} half of devilution's AddObject(), called from
 * the main-image AddObject() across the overlay boundary. Case order below matches the retail
 * code-block layout (VA order in the oracle), not enum order — see the file banner for the
 * AddObjLight-literal deltas and the OBJ_L1LIGHT fallthrough. ---- */
void PreObjObjAddSwitch(int ot, int ox, int oy, int oi)
{
    switch (ot) {
    case OBJ_SKFIRE:
    case OBJ_CANDLE1:
    case OBJ_CANDLE2:
    case OBJ_BOOKCANDLE:
    case OBJ_TORCHL:
    case OBJ_TORCHR:
    case OBJ_TORCHL2:
    case OBJ_TORCHR2:
    case OBJ_STORYCANDLE:
        AddObjLight(oi, 0x3F3);
        break;
    case OBJ_L1LDOOR:
    case OBJ_L1RDOOR:
        AddL1Door(oi, ox, oy, ot);
        break;
    case OBJ_L2LDOOR:
    case OBJ_L2RDOOR:
        AddL2Door(oi, ox, oy, ot);
        break;
    case OBJ_L3LDOOR:
    case OBJ_L3RDOOR:
        AddL3Door(oi, ox, oy, ot);
        break;
    case OBJ_BOOK2R:
        AddSCambBook(oi);
        break;
    case OBJ_CHEST1:
    case OBJ_CHEST2:
    case OBJ_CHEST3:
    case OBJ_TCHEST1:
    case OBJ_TCHEST2:
    case OBJ_TCHEST3:
        AddChest(oi, ot);
        break;
    case OBJ_SARC:
        AddSarc(oi);
        break;
    case OBJ_FLAMEHOLE:
        AddFlameTrap(oi);
        break;
    case OBJ_FLAMELVR:
        AddFlameLvr(oi);
        break;
    case OBJ_WATER:
        object[oi]._oAnimFrame = 1;
        break;
    case OBJ_TRAPL:
    case OBJ_TRAPR:
        AddTrap(oi, ot);
        break;
    case OBJ_BARREL:
    case OBJ_BARRELEX:
        AddBarrel(oi, ot);
        break;
    case OBJ_SHRINEL:
    case OBJ_SHRINER:
        AddShrine(oi);
        break;
    case OBJ_BOOKCASEL:
    case OBJ_BOOKCASER:
        AddBookcase(oi);
        break;
    case OBJ_SKELBOOK:
    case OBJ_BOOKSTAND:
        AddBookstand(oi);
        break;
    case OBJ_BLOODFTN:
        AddBloodFtn(oi);
        break;
    case OBJ_DECAP:
        AddDecap(oi);
        break;
    case OBJ_PURIFYINGFTN:
        AddPurifyingFountain(oi);
        break;
    case OBJ_ARMORSTAND:
    case OBJ_WARARMOR:
        AddArmorStand(oi);
        break;
    case OBJ_GOATSHRINE:
        AddGoatShrine(oi);
        break;
    case OBJ_CAULDRON:
        AddCauldron(oi);
        break;
    case OBJ_MURKYFTN:
        AddMurkyFountain(oi);
        break;
    case OBJ_TEARFTN:
        AddTearFountain(oi);
        break;
    case OBJ_BOOK2L:
        AddVilebook(oi);
        break;
    case OBJ_MCIRCLE1:
    case OBJ_MCIRCLE2:
        AddMagicCircle(oi);
        break;
    case OBJ_STORYBOOK:
        AddStoryBook(oi);
        break;
    case OBJ_BCROSS:
    case OBJ_TBCROSS:
        AddBrnCross(oi);
        /* fallthrough */
    case OBJ_L1LIGHT:
        AddObjLight(oi, 0x1B8);
        break;
    case OBJ_PEDISTAL:
        AddPedistal(oi);
        break;
    case OBJ_WARWEAP:
    case OBJ_WEAPONRACK:
        AddWeaponRack(oi);
        break;
    case OBJ_TNUDEM2:
        AddTorturedBody(oi);
        break;
    }
}
