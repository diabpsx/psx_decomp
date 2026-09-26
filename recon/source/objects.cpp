/* OBJECTS.CPP — Diablo PSX (Climax 1998) reconstruction (main image).  Twin: refs/diablo-hellfire/src/OBJECTS.CPP
 * (original Condor/Blizzard source) + refs/devilution/Source/objects.cpp (field names match this exactly).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * NOTE: this TU covers the OBJECTS half of the original file (a companion agent handles PREOBJ.CPP).
 * PSX deltas vs PC: no Hellfire content (base Diablo only); object animation is driven by the TextDat/
 * GM_UseTexData block-streaming system (no _oAnimData/CEL pointers -- ObjectStruct has no such field);
 * random_(idx,n) -> ENG_random(n); dPiece/dFlags/dTransVal live in dung_map[x][y] (struct map_info) or the
 * flat dPiece pointer; nSolidTable/nTrapTable/nMissileTable/nBlockTable are indexed directly (not via a
 * GetSOLID-style wrapper) except where the oracle itself calls GetSOLID/GetTRAP/SetSOLID/etc (DPIECE.CPP
 * accessors); MemFreeDbg macro (from source/diablo.h) is used for mem_free_dbg. */
#include "diabpsx_types.h"
#include "source/gen/structs_objects.h"
#include "source/gen/externs_objects.h"
#include "source/gen/protos_objects.h"
#include "source/diablo.h"

#define THEME_NONE (-1)

/* TU-owned small data (.sdata/.sbss, gp-relative in retail) */
unsigned char InitObjFlag;
int numobjects;
int numobjfiles;

void InitObjectGFX(void)
{
    unsigned char fileload[56];
    int i, t;

    memset(fileload, 0, sizeof(fileload));

    for (i = 0; AllObjects[i].oload != -1; i++) {
        if (AllObjects[i].oload == 1
            && (int)currlevel >= AllObjects[i].ominlvl
            && (int)currlevel <= AllObjects[i].omaxlvl) {
            fileload[AllObjects[i].ofindex] = 1;
        }
        if (AllObjects[i].otheme != THEME_NONE) {
            for (t = 0; t < numthemes; t++) {
                if (theme[t].ttype == AllObjects[i].otheme)
                    fileload[AllObjects[i].ofindex] = 1;
            }
        }
        if (AllObjects[i].oquest != -1) {
            if (QuestStatus(AllObjects[i].oquest))
                fileload[AllObjects[i].ofindex] = 1;
        }
    }

    for (i = 0; i < 56; i++) {
        if (fileload[i]) {
            char filestr[32];
            ObjFileList[numobjfiles] = i;
            numobjfiles++;
        }
    }
}

void FreeObjectGFX(void)
{
    numobjfiles = 0;
}

void DeleteObject(int oi, int i)
{
    int ox, oy;

    ox = object[oi]._ox;
    oy = object[oi]._oy;
    dung_map[ox][oy].dObject = 0;
    objectavail[127 - numobjects] = oi;
    numobjects--;
    if (numobjects > 0 && i != numobjects)
        objectactive[i] = objectactive[numobjects];
}

void SetupObject(int i, int x, int y, int ot)
{
    int j, ofi;

    object[i]._otype = ot;
    object[i]._ox = x;
    object[i]._oy = y;
    ofi = AllObjects[ot].ofindex;
    j = 0;
    while (ObjFileList[j] != ofi) {
        j++;
    }
    object[i]._oAnimFlag = AllObjects[ot].oAnimFlag;
    if (AllObjects[ot].oAnimFlag) {
        object[i]._oAnimDelay = AllObjects[ot].oAnimDelay;
        object[i]._oAnimCnt = ENG_random(AllObjects[ot].oAnimDelay);
        object[i]._oAnimLen = AllObjects[ot].oAnimLen;
        object[i]._oAnimFrame = ENG_random(AllObjects[ot].oAnimLen - 1) + 1;
    } else {
        object[i]._oAnimDelay = 1000;
        object[i]._oAnimCnt = 0;
        object[i]._oAnimLen = AllObjects[ot].oAnimLen;
        object[i]._oAnimFrame = AllObjects[ot].oAnimDelay;
    }
    object[i]._oSolidFlag = AllObjects[ot].oSolidFlag;
    object[i]._oMissFlag = AllObjects[ot].oMissFlag;
    object[i]._oDelFlag = 0;
    object[i]._oLight = AllObjects[ot].oLightFlag;
    object[i]._oBreak = AllObjects[ot].oBreak;
    object[i]._oPreFlag = 0;
    object[i]._oTrapFlag = 0;
    object[i]._oDoorFlag = 0;
    object[i]._oSelFlag = AllObjects[ot].oSelFlag;
}

void SetObjMapRange(int i, int x1, int y1, int x2, int y2, int v)
{
    object[i]._oVar1 = x1;
    object[i]._oVar2 = y1;
    object[i]._oVar3 = x2;
    object[i]._oVar4 = y2;
    object[i]._oVar8 = v;
}

void SetBookMsg(int i, int msg)
{
    object[i]._oVar7 = msg;
}

void PostAddL1Door(int i, int x, int y, int ot)
{
    object[i]._oDoorFlag = 1;
    object[i]._oAnimFlag = 0;
    if (ot == 1) {
        object[i]._oVar1 = FindBlock(x, y);
        object[i]._oVar2 = FindBlock(x, y - 1);
    } else {
        object[i]._oVar1 = FindBlock(x, y);
        object[i]._oVar2 = FindBlock(x - 1, y);
    }
    object[i]._oVar4 = 0;
}

void PostAddL2Door(int i, int x, int y, int ot)
{
    object[i]._oDoorFlag = 1;
    if (ot == 0x2A) {
        ObjSetMicro(x, y, 0x21A);
        dungeon[(x - 16) >> 1][(y - 16) >> 1] = 0x96;
        object[i]._oAnimFrame = 1;
    } else {
        ObjSetMicro(x, y, 0x21C);
        dungeon[(x - 16) >> 1][(y - 16) >> 1] = 0x97;
        object[i]._oAnimFrame = 2;
    }
    object[i]._oVar4 = 0;
}

void PostAddArmorStand(int i)
{
    if (!armorFlag) {
        object[i]._oAnimFlag = 2;
        object[i]._oSelFlag = 0;
    }
    object[i]._oRndSeed = GetRndSeed();
}

void PostAddWeaponRack(int i)
{
    if (!weaponFlag) {
        object[i]._oAnimFlag = 2;
        object[i]._oSelFlag = 0;
    }
    object[i]._oRndSeed = GetRndSeed();
}

void PostAddObjLight(int i, int r)
{
    if (level_lamp[leveltype]) {
        if (InitObjFlag) {
            object[i]._olid = AddLight(object[i]._ox, object[i]._oy, r);
            object[i]._oVar1 = -1;
        } else {
            object[i]._oVar1 = 0;
        }
    }
}

void PostObjObjAddSwitch(int ot, int ox, int oy, int oi)
{
    switch (ot) {
    case 0:
        PostAddObjLight(oi, 0x1B8);
        break;
    case 42:
    case 43:
        PostAddL2Door(oi, ox, oy, ot);
        break;
    case 1:
    case 2:
        PostAddL1Door(oi, ox, oy, ot);
        break;
    case 44:
    case 45:
    case 46:
    case 47:
        PostAddObjLight(oi, 0x1B6);
        break;
    case 77:
    case 89:
        PostAddArmorStand(oi);
        break;
    case 90:
    case 92:
        PostAddWeaponRack(oi);
        break;
    }
}

void AddLamp(int x, int y, int r)
{
    if (level_lamp[leveltype])
        AddLight(x, y, r);
}

void SyncPedistal(int i)
{
}

#define OBJ_CRUX1 0x14
#define OBJ_CRUX2 0x15
#define OBJ_CRUX3 0x16
#define OBJ_BLINDBOOK 0x47

void SyncCrux(int i)
{
    int j, ot, type;
    unsigned char found;

    found = 1;
    for (j = 0; j < numobjects; j++) {
        ot = objectactive[j];
        type = object[ot]._otype;
        if (type != OBJ_CRUX1 && type != OBJ_CRUX2 && type != OBJ_CRUX3)
            continue;
        if (object[i]._oVar8 != object[ot]._oVar8 || object[ot]._oBreak == -1)
            continue;
        found = 0;
    }
    if (found)
        ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
}

void SyncLever(int i)
{
    if (object[i]._oSelFlag == 0)
        ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
    FillCrapBits();
}

void SyncQSTLever(int i)
{
    int tren;

    if (object[i]._oAnimFrame == object[i]._oVar6) {
        ObjChangeMapResync(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
        if (object[i]._otype == OBJ_BLINDBOOK) {
            tren = TransVal;
            TransVal = 9;
            DRLG_MRectTrans(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
            TransVal = tren;
        }
    }
}

void ObjSetMicro(int dx, int dy, int pn)
{
    if (dPiece) {
        SetDPiece(dx, dy, (short)pn);
        return;
    }

    dung_map[dx][dy].dBits &= 0xF0;
    if (nSolidTable[pn])
        SetSOLID(dx, dy);
    else
        ClearSOLID(dx, dy);
    if (nMissileTable[pn])
        SetMISSILE(dx, dy);
    else
        ClearMISSILE(dx, dy);
    if (nBlockTable[pn])
        SetBLOCK(dx, dy);
    else
        ClearBLOCK(dx, dy);
    if (nTrapTable[pn])
        SetTRAP(dx, dy);
    else
        ClearTRAP(dx, dy);
    if (pn == 0)
        SetSOLID(dx, dy);
    ChangeBlock(dx, dy, pn);
}

struct MiniTileDef {
    short v1, v2, v3, v4;
};

void ObjSetMini(int x, int y, int v)
{
    int xx, yy;
    long v1, v2, v3, v4;
    struct MiniTileDef *def;

    def = (struct MiniTileDef *)((char *)DebugMonsters + 0x20) + v;
    v1 = def->v1 + 1;
    v2 = def->v2 + 1;
    v3 = def->v3 + 1;
    v4 = def->v4 + 1;
    xx = 2 * x + 16;
    yy = 2 * y + 16;
    ObjSetMicro(xx, yy, v1);
    ObjSetMicro(xx + 1, yy, v2);
    ObjSetMicro(xx, yy + 1, v3);
    ObjSetMicro(xx + 1, yy + 1, v4);
}
