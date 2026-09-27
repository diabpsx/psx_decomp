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
    int ai, j;

    object[i]._otype = ot;
    object[i]._ox = x;
    object[i]._oy = y;
    ai = AllObjects[ot].ofindex;
    for (j = 0; ObjFileList[j] != ai; j++) {
    }
    object[i]._oAnimFlag = AllObjects[ot].oAnimFlag;
    if (object[i]._oAnimFlag) {
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
    case 77:
    case 89:
        PostAddArmorStand(oi);
        break;
    case 44:
    case 45:
    case 46:
    case 47:
        PostAddObjLight(oi, 0x1B6);
        break;
    case 1:
    case 2:
        PostAddL1Door(oi, ox, oy, ot);
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

void DoorSet(int oi, int dx, int dy)
{
    int pn;
    struct ObjectStruct *op;

    pn = FindBlock(dx, dy);
    if (pn == 0x2B) {
        ObjSetMicro(dx, dy, 0x188);
        pn = 0x2D;
    }
    if (pn == 0x2D) {
        ObjSetMicro(dx, dy, 0x18A);
        pn = 0x32;
    }
    if (pn == 0x32) {
        op = &object[oi];
        if (op->_otype == 1)
            ObjSetMicro(dx, dy, 0x19B);
        if (op->_otype == 2)
            ObjSetMicro(dx, dy, 0x19C);
        pn = 0x36;
    }
    if (pn == 0x36) {
        ObjSetMicro(dx, dy, 0x18D);
        pn = 0x37;
    }
    if (pn == 0x37) {
        ObjSetMicro(dx, dy, 0x18E);
        pn = 0x3D;
    }
    if (pn == 0x3D) {
        ObjSetMicro(dx, dy, 0x18F);
        pn = 0x43;
    }
    if (pn == 0x43) {
        ObjSetMicro(dx, dy, 0x190);
        pn = 0x44;
    }
    if (pn == 0x44) {
        ObjSetMicro(dx, dy, 0x191);
        pn = 0x45;
    }
    if (pn == 0x45) {
        ObjSetMicro(dx, dy, 0x193);
        pn = 0x46;
    }
    if (pn == 0x46) {
        ObjSetMicro(dx, dy, 0x194);
        pn = 0x48;
    }
    if (pn == 0x48) {
        ObjSetMicro(dx, dy, 0x196);
        pn = 0xD4;
    }
    if (pn == 0xD4) {
        ObjSetMicro(dx, dy, 0x197);
        pn = 0x162;
    }
    if (pn == 0x162) {
        ObjSetMicro(dx, dy, 0x199);
        pn = 0x163;
    }
    if (pn == 0x163) {
        ObjSetMicro(dx, dy, 0x19A);
        pn = 0x19B;
    }
    if (pn == 0x19B) {
        ObjSetMicro(dx, dy, 0x18C);
        pn = 0x19C;
    }
    if (pn == 0x19C) {
        ObjSetMicro(dx, dy, 0x18C);
    }
}

int ItemMiscIdIdx(int imiscid)
{
    int i;

    i = 0;
    while (AllItemsList[i].iRnd == 0 || AllItemsList[i].iMiscId != imiscid) {
        i++;
    }
    return i;
}

void DrawObjExpl(struct ObjectStruct *obj, int ScrX, int ScrY, int ot)
{
    int f;

    f = obj->_oAnimFrame - 1;
    if (f != obj->_oAnimLen - 1) {
        DrawExpl(ScrX, ScrY, f, ot, 0x200, 0, 0, 0);
    } else {
        if (obj->_olid)
            AddUnLight(obj->_olid);
    }
}

void DRLG_MRectTrans(int x1, int y1, int x2, int y2)
{
    int i, j;

    x1 = x1 * 2 + 17;
    y1 = y1 * 2 + 17;
    x2 = x2 * 2 + 16;
    y2 = y2 * 2 + 16;
    for (j = y1; j <= y2; j++) {
        for (i = x1; i <= x2; i++) {
            dung_map[i][j].dTransVal = TransVal;
        }
    }
    TransVal++;
}

void RedoPlayerVision(void)
{
    int p;

    for (p = 0; p < 2; p++) {
        if (plr[p].plractive && currlevel == plr[p].plrlevel) {
            ChangeVisionXY(plr[p]._pvid, plr[p]._px, plr[p]._py);
        }
    }
}

void ActivateTrapLine(int ttype, int tid)
{
    int i, oi;

    for (i = 0; i < numobjects; i++) {
        oi = objectactive[i];
        if (object[oi]._otype == ttype && object[oi]._oVar1 == tid) {
            object[oi]._oVar4 = 1;
            object[oi]._oAnimFlag = 1;
            object[oi]._oAnimDelay = 1;
            object[oi]._olid = AddLight(object[oi]._ox, object[oi]._oy, 294);
        }
    }
}

void LoadMapObjs(unsigned char *pMap, int startx, int starty)
{
    int rw, rh;
    int i, j;
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
    mapoff += 2 * rw * rh * 2;
    lm += mapoff;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm) {
                AddObject(ObjTypeConv[*lm], startx + 16 + i, starty + 16 + j);
            }
            lm += 2;
        }
    }
}

void AddObject(int ot, int ox, int oy)
{
    int oi;

    if (numobjects < 0x7F && dung_map[ox][oy].dObject == 0) {
        oi = objectavail[0];
        objectavail[0] = objectavail[0x7E - numobjects];
        object[oi]._olid = -1;
        objectactive[numobjects] = oi;
        dung_map[ox][oy].dObject = oi + 1;
        SetupObject(oi, ox, oy, ot);
        if (ot != 0x53)
            func_80159C74(ot, ox, oy, oi);
        numobjects++;
    }
}

void BreakObject(int pnum, int oi)
{
    int mind, maxd, objdam;

    if (pnum != -1) {
        mind = plr[pnum]._pIMinDam;
        maxd = plr[pnum]._pIMaxDam;
        objdam = ENG_random(maxd - mind + 1) + mind;
        objdam += plr[pnum]._pDamageMod + plr[pnum]._pIBonusDamMod + plr[pnum]._pIBonusDam * objdam / 100;
    } else {
        objdam = 10;
    }
    if (object[oi]._otype < 0x14)
        return;
    if (object[oi]._otype < 0x17) {
        BreakCrux(pnum, oi);
        return;
    }
    if (object[oi]._otype >= 0x3B)
        return;
    if (object[oi]._otype >= 0x39)
        BreakBarrel(pnum, oi, objdam, 0, 1);
}

void TryDisarm(int pnum, int i)
{
    int j, oi, oti;
    int trapdisper;
    unsigned char checkflag;

    if (pnum == myplr)
        NewCursor(1);
    if (object[i]._oTrapFlag) {
        trapdisper = 2 * plr[pnum]._pDexterity - 5 * currlevel;
        if (trapdisper >= ENG_random(100)) {
            for (j = 0; j < numobjects; j++) {
                oi = objectactive[j];
                checkflag = 0;
                if (object[oi]._otype == 0x35)
                    checkflag = 1;
                if (object[oi]._otype == 0x36)
                    checkflag = 1;
                if (checkflag) {
                    oti = dung_map[object[oi]._oVar1][object[oi]._oVar2].dObject - 1;
                    if (oti == i) {
                        object[oi]._oVar4 = 1;
                        object[i]._oTrapFlag = 0;
                    }
                }
            }
        }
    }
}

void PostAddL1Objs(int x1, int y1, int x2, int y2)
{
    int i, j;
    int pn;

    for (j = y1; j < y2; j++) {
        for (i = x1; i < x2; i++) {
            pn = FindBlock(i, j);
            if (pn == 0x10E)
                PostAddObject(0, i, j);
            if (pn == 0x2C || pn == 0x33 || pn == 0xD6)
                PostAddObject(1, i, j);
            if (pn == 0x2E || pn == 0x38)
                PostAddObject(2, i, j);
        }
    }
}

void PostAddL2Objs(int x1, int y1, int x2, int y2)
{
    int i, j;
    int pn;

    for (j = y1; j < y2; j++) {
        for (i = x1; i < x2; i++) {
            pn = FindBlock(i, j);
            if (pn == 0xD || pn == 0x21D)
                PostAddObject(0x2A, i, j);
            if (pn == 0x11 || pn == 0x21E)
                PostAddObject(0x2B, i, j);
        }
    }
}

void ObjChangeMap(int x1, int y1, int x2, int y2)
{
    int i, j;

    for (j = y1; j <= y2; j++) {
        for (i = x1; i <= x2; i++) {
            ObjSetMini(i, j, pdungeon[i][j]);
            dungeon[i][j] = pdungeon[i][j];
        }
    }
    if (leveltype == 1) {
        ObjL1Special(2 * x1 + 16, 2 * y1 + 16, 2 * x2 + 17, 2 * y2 + 17);
        PostAddL1Objs(2 * x1 + 16, 2 * y1 + 16, 2 * x2 + 17, 2 * y2 + 17);
    }
    if (leveltype == 2) {
        ObjL2Special(2 * x1 + 16, 2 * y1 + 16, 2 * x2 + 17, 2 * y2 + 17);
        PostAddL2Objs(2 * x1 + 16, 2 * y1 + 16, 2 * x2 + 17, 2 * y2 + 17);
    }
}

void ObjChangeMapResync(int x1, int y1, int x2, int y2)
{
    int i, j;

    for (j = y1; j <= y2; j++) {
        for (i = x1; i <= x2; i++) {
            ObjSetMini(i, j, pdungeon[i][j]);
            dungeon[i][j] = pdungeon[i][j];
        }
    }
    if (leveltype == 1) {
        ObjL1Special(2 * x1 + 16, 2 * y1 + 16, 2 * x2 + 17, 2 * y2 + 17);
    }
    if (leveltype == 2) {
        ObjL2Special(2 * x1 + 16, 2 * y1 + 16, 2 * x2 + 17, 2 * y2 + 17);
    }
    FillCrapBits();
}

void BreakCrux(int pnum, int i)
{
    int j, ot, oi;
    unsigned char mapflag;

    if (object[i]._oSelFlag) {
        object[i]._oAnimFlag = 1;
        object[i]._oAnimFrame = 1;
        object[i]._oSolidFlag = 1;
        object[i]._oMissFlag = 1;
        object[i]._oBreak = -1;
        object[i]._oSelFlag = 0;
        object[i]._oAnimDelay = 1;
        mapflag = 1;
        for (j = 0; j < numobjects; j++) {
            oi = objectactive[j];
            ot = object[oi]._otype;
            if (ot != 0x14 && ot != 0x15 && ot != 0x16)
                continue;
            if (object[i]._oVar8 != object[oi]._oVar8 || object[oi]._oBreak == -1)
                continue;
            mapflag = 0;
        }
        if (mapflag) {
            if (!deltaload)
                PlaySfxLoc(0x2B, object[i]._ox, object[i]._oy);
            ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
        }
        if (!deltaload)
            NetSendCmdParam2(0, 0x2F, pnum, i);
    }
}

void OperateLever(int pnum, int i)
{
    unsigned char mapflag;
    int j, oi, ot;

    if (object[i]._oSelFlag != 0) {
        if (!deltaload)
            PlaySfxLoc(0x2B, object[i]._ox, object[i]._oy);
        object[i]._oSelFlag = 0;
        object[i]._oAnimFrame++;
        mapflag = 1;
        if (currlevel == 16) {
            for (j = 0; j < numobjects; j++) {
                oi = objectactive[j];
                ot = object[oi]._otype;
                if (ot == 0x1C
                    && object[i]._oVar8 == object[oi]._oVar8
                    && object[oi]._oSelFlag != 0) {
                    mapflag = 0;
                }
            }
        }
        if (mapflag)
            ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
        if (!deltaload)
            NetSendCmdParam1(0, 0x2D, i);
    }
}

void OperateSarc(int pnum, int i, unsigned char sendmsg)
{
    if (object[i]._oSelFlag != 0) {
        if (!deltaload)
            PlaySfxLoc(0x2F, object[i]._ox, object[i]._oy);
        object[i]._oSelFlag = 0;
        if (deltaload) {
            object[i]._oAnimFrame = object[i]._oAnimLen;
        } else {
            object[i]._oAnimFlag = 1;
            object[i]._oAnimDelay = 3;
            SetRndSeed(object[i]._oRndSeed);
            if (object[i]._oVar1 <= 2)
                CreateRndItem(object[i]._ox, object[i]._oy, 0, sendmsg, 0);
            if (object[i]._oVar1 >= 8)
                SpawnSkeleton(object[i]._oVar2, object[i]._ox, object[i]._oy);
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
    }
}

void ObjL1Special(int x1, int y1, int x2, int y2)
{
}

void ObjL2Special(int x1, int y1, int x2, int y2)
{
}

#define OBJ_CRUX1 0x14
#define OBJ_CRUX2 0x15
#define OBJ_CRUX3 0x16
#define OBJ_BLINDBOOK 0x47

void SyncCrux(int i)
{
    int j, ot, oi;
    unsigned char mapflag;

    mapflag = 1;
    for (j = 0; j < numobjects; j++) {
        oi = objectactive[j];
        ot = object[oi]._otype;
        if ((ot == OBJ_CRUX1 || ot == OBJ_CRUX2 || ot == OBJ_CRUX3)
            && object[i]._oVar8 == object[oi]._oVar8 && object[oi]._oBreak != -1)
            mapflag = 0;
    }
    if (mapflag)
        ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
}

void SyncL1Doors(int i)
{
    int dx, dy;

    if (object[i]._oVar4 == 0) {
        object[i]._oMissFlag = 0;
        return;
    }
    object[i]._oMissFlag = 1;
    object[i]._oSelFlag = 2;
    dx = object[i]._ox;
    dy = object[i]._oy;
    if (object[i]._otype == 1) {
        if (object[i]._oVar1 == 0xD6)
            ObjSetMicro(dx, dy, 0x198);
        else
            ObjSetMicro(dx, dy, 0x189);
        dy--;
    } else {
        ObjSetMicro(dx, dy, 0x18B);
        dx--;
    }
    DoorSet(i, dx, dy);
}

void SyncL3Doors(int i)
{
    int x, y;
    int otm;

    object[i]._oMissFlag = 1;
    object[i]._oSelFlag = 2;
    x = object[i]._ox;
    y = object[i]._oy;
    otm = -1;
    if (object[i]._otype == 0x4A) {
        if (object[i]._oVar4 == 0) {
            otm = 0x213;
        } else if (object[i]._oVar4 == 1 || object[i]._oVar4 == 2) {
            otm = 0x21A;
        }
    }
    if (object[i]._otype == 0x4B) {
        if (object[i]._oVar4 == 0) {
            otm = 0x216;
        } else if (object[i]._oVar4 == 1 || object[i]._oVar4 == 2) {
            otm = 0x21D;
        }
    }
    if (otm != -1)
        ObjSetMicro(x, y, otm);
}

void SyncL2Doors(int i)
{
    int x, y;
    int otm;

    if (object[i]._oVar4 == 0)
        object[i]._oMissFlag = 0;
    else
        object[i]._oMissFlag = 1;
    x = object[i]._ox;
    object[i]._oSelFlag = 2;
    y = object[i]._oy;
    otm = -1;
    if (object[i]._otype == 0x2A) {
        if (object[i]._oVar4 == 0) {
            otm = 0x21A;
        } else if (object[i]._oVar4 == 1 || object[i]._oVar4 == 2) {
            otm = 0xD;
        }
    }
    if (object[i]._otype == 0x2B) {
        if (object[i]._oVar4 == 0) {
            otm = 0x21C;
        } else if (object[i]._oVar4 == 1 || object[i]._oVar4 == 2) {
            otm = 0x11;
        }
    }
    if (otm != -1)
        ObjSetMicro(x, y, otm);
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

void RestoreObjectLight(void)
{
    int m;
    int p;
    int j, oi, ot, ox, oy;

    InitLighting();
    for (m = 0; m < nummonsters; m++) {
        if (monster[monstactive[m]]._uniqtype) {
            AddLight(monster[monstactive[m]]._mx, monster[monstactive[m]]._my, 0x23F4);
        }
    }
    if (FePlayerNo >= 0) {
        p = 0;
        do {
            plr[p]._plid = AddLight(plr[p]._px, plr[p]._py, plr[p]._pLightRad + 0x23F0);
            p++;
        } while (p <= FePlayerNo);
    }
    for (j = 0; j < numobjects; j++) {
        oi = objectactive[j];
        ot = object[oi]._otype;
        ox = object[oi]._ox;
        oy = object[oi]._oy;
        switch (ot) {
        case 3:
        case 8:
        case 9:
        case 44:
        case 45:
        case 46:
        case 47:
        case 65:
        case 87:
            AddLamp(ox, oy, 0x3F3);
            break;
        case 0:
        case 26:
        case 91:
            AddLamp(ox, oy, 0x1B8);
            break;
        }
    }
}

/* out-of-line header-copy methods (GMAN.H/BLOCK.H inline members compiled into this TU because it uses them) */
int CBlocks::GetOtPos(int LogicalY)
{
    int OtPos;

    OtPos = ClipRect.y + LogicalY + PosAdj;
    if (OtPos < -0x43)
        OtPos = -0x43;
    if (OtPos >= 0x19C)
        OtPos = 0x19B;
    return OtPos + 0x4D;
}

struct CCreatureHdr *TextDat::GetCreature(int Creature)
{
    return (struct CCreatureHdr *)(CreatureAnims + CreatureOffset[Creature]);
}

int TextDat::GetNumOfFrames(int Creature, int Action)
{
    return GetCreature(Creature)->GetAction(Action)->NumOfFrames;
}

int FindValidShrine(int i)
{
    int rv;
    int cl;
    unsigned char done;

    done = 0;
    do {
        rv = ENG_random(0x1A);
        cl = currlevel;
        if (cl != 0) {
            if (rv == 7) {
                if (cl < 9 && rv != 8)
                    done = 1;
            } else {
                if (cl < 0x11 && rv != 8)
                    done = 1;
            }
        }
        if (done) {
            if (gbMaxPlayers != 1 && shrineavail[rv] == 1) {
                done = 0;
            } else if (gbMaxPlayers == 1) {
                done = 1;
                if (shrineavail[rv] == 2)
                    done = 0;
            }
        }
    } while (!done);
    return rv;
}

void OperateCauldron(int pnum, int i, int sType)
{
    SetRndSeed(object[i]._oRndSeed);
    object[i]._oVar1 = FindValidShrine(i);
    OperateShrine(pnum, i, sType);
    object[i]._oAnimFlag = 0;
    force_redraw = 0xFF;
}

void OperateGoatShrine(int pnum, int i, int sType)
{
    SetRndSeed(object[i]._oRndSeed);
    object[i]._oVar1 = FindValidShrine(i);
    OperateShrine(pnum, i, sType);
    object[i]._oAnimCnt = 2;
    force_redraw = 0xFF;
}

void OperateDecap(int pnum, int i, unsigned char sendmsg)
{
    if (object[i]._oSelFlag) {
        object[i]._oSelFlag = 0;
        if (!deltaload) {
            SetRndSeed(object[i]._oRndSeed);
            CreateRndItem(object[i]._ox, object[i]._oy, 0, sendmsg, 0);
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
    }
}

void OperateL1Door(int pnum, int i, unsigned char sendflag)
{
    int dpx, dpy;

    dpx = abs(object[i]._ox - plr[pnum]._px);
    dpy = abs(object[i]._oy - plr[pnum]._py);
    if (dpx == 1 && dpy < 2 && object[i]._otype == 1)
        OperateL1LDoor(pnum, i, sendflag);
    if (dpx < 2 && dpy == 1 && object[i]._otype == 2)
        OperateL1RDoor(pnum, i, sendflag);
}

void OperateL2Door(int pnum, int i, unsigned char sendflag)
{
    int dpx, dpy;

    dpx = abs(object[i]._ox - plr[pnum]._px);
    dpy = abs(object[i]._oy - plr[pnum]._py);
    if (dpx == 1 && dpy < 2 && object[i]._otype == 0x2A)
        OperateL2LDoor(pnum, i, sendflag);
    if (dpx < 2 && dpy == 1 && object[i]._otype == 0x2B)
        OperateL2RDoor(pnum, i, sendflag);
}

void OperateL3Door(int pnum, int i, unsigned char sendflag)
{
    int dpx, dpy;

    dpx = abs(object[i]._ox - plr[pnum]._px);
    dpy = abs(object[i]._oy - plr[pnum]._py);
    if (dpx == 1 && dpy < 2 && object[i]._otype == 0x4B)
        OperateL3LDoor(pnum, i, sendflag);
    if (dpx < 2 && dpy == 1 && object[i]._otype == 0x4A)
        OperateL3RDoor(pnum, i, sendflag);
}

void OperateL1LDoor(int pnum, int i, unsigned char sendflag)
{
    int dx, dy;
    unsigned char dok;
    int oVar1, micro, pn;

    if (object[i]._oVar4 == 2) {
        if (!deltaload)
            PlaySfxLoc(0x13, object[i]._ox, object[i]._oy);
        return;
    }
    dy = object[i]._oy;
    dx = object[i]._ox;
    if (object[i]._oVar4 != 0) {
        if (!deltaload)
            PlaySfxLoc(0x13, dx, dy);
        dok = dung_map[dx][dy].dMonster == 0;
        if (dung_map[dx][dy].dItem != 0)
            dok = 0;
        if (GetdDead(dx, dy) != 0)
            dok = 0;
        if (dok) {
            if (pnum == myplr && sendflag)
                NetSendCmdParam1(1, 0x2C, i);
            object[i]._oVar4 = 0;
            object[i]._oSelFlag = 3;
            oVar1 = object[i]._oVar1;
            if (oVar1 == 0x32) {
                pn = FindBlock(dx - 1, dy);
                if (pn == 0x18C)
                    micro = 0x19B;
                else
                    micro = object[i]._oVar2;
            } else {
                micro = object[i]._oVar2;
            }
            ObjSetMicro(dx - 1, dy, micro);
            object[i]._oPreFlag = 0;
            RedoPlayerVision();
        } else {
            object[i]._oVar4 = 2;
        }
    } else {
        if (pnum == myplr && sendflag)
            NetSendCmdParam1(1, 0x2B, i);
        if (!deltaload)
            PlaySfxLoc(0x14, dx, dy);
        if (object[i]._oVar1 == 0xD6)
            ObjSetMicro(dx, dy, 0x198);
        else
            ObjSetMicro(dx, dy, 0x189);
        object[i]._oPreFlag = 1;
        DoorSet(i, dx, dy - 1);
        object[i]._oVar4 = 1;
        object[i]._oSelFlag = 2;
        RedoPlayerVision();
    }
}

#define IT_ARMOR 6
#define IT_MARMOR 8
#define IT_HARMOR 9

void OperateArmorStand(int pnum, int i, unsigned char sendmsg)
{
    int uniqueRnd;

    if (object[i]._oSelFlag) {
        object[i]._oSelFlag = 0;
        object[i]._oAnimFrame++;
        if (!deltaload) {
            SetRndSeed(object[i]._oRndSeed);
            uniqueRnd = ENG_random(2);
            if (currlevel <= 5) {
                CreateTypeItem(object[i]._ox, object[i]._oy, 1, IT_ARMOR, 0, sendmsg, 0);
            } else if (currlevel >= 6 && currlevel <= 9) {
                CreateTypeItem(object[i]._ox, object[i]._oy, uniqueRnd, IT_MARMOR, 0, sendmsg, 0);
            } else if (currlevel >= 10 && currlevel <= 12) {
                CreateTypeItem(object[i]._ox, object[i]._oy, 0, IT_HARMOR, 0, sendmsg, 0);
            } else if (currlevel >= 13 && currlevel <= 16) {
                CreateTypeItem(object[i]._ox, object[i]._oy, 1, IT_HARMOR, 0, sendmsg, 0);
            }
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
    }
}

void OperateSkelBook(int pnum, int i, unsigned char sendmsg)
{
    int imisc;

    if (object[i]._oSelFlag) {
        if (!deltaload)
            PlaySfxLoc(0x26, object[i]._ox, object[i]._oy);
        object[i]._oSelFlag = 0;
        object[i]._oAnimFrame += 2;
        if (!deltaload) {
            SetRndSeed(object[i]._oRndSeed);
            if (ENG_random(5) != 0)
                CreateTypeItem(object[i]._ox, object[i]._oy, 0, 0, 0x15, sendmsg, 0);
            else
                CreateTypeItem(object[i]._ox, object[i]._oy, 0, 0, 0x18, sendmsg, 0);
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
    }
}

void OperateLazStand(int pnum, int i)
{
    int x, y;

    if (numitems >= 0x7F && object[i]._oSelFlag) {
        PlaySFX(0x3D3);
        return;
    }
    if (deltaload) {
        object[i]._oSelFlag = 0;
        object[i]._oAnimFrame++;
        return;
    }
    if (object[i]._oSelFlag) {
        if (!qtextflag) {
            if (pnum == myplr) {
                object[i]._oSelFlag = 0;
                object[i]._oAnimFrame++;
                GetSuperItemLoc(object[i]._ox, object[i]._oy, &x, &y);
                SpawnQuestItem(0x21, x, y, 0, 0);
                NetSendCmdParam1(0, 0x2D, i);
            }
        }
    }
}

void OperateWeaponRack(int pnum, int i, unsigned char sendmsg)
{
    int weaponType, sfxType;

    weaponType = 0;
    if (!object[i]._oSelFlag)
        return;
    SetRndSeed(object[i]._oRndSeed);
    switch (ENG_random(4) + 1) {
    case 1:
        weaponType = 1;
        sfxType = 0x22;
        break;
    case 2:
        weaponType = 2;
        sfxType = 0x23;
        break;
    case 3:
        weaponType = 3;
        sfxType = 0x24;
        break;
    case 4:
        weaponType = 4;
        sfxType = 0x23;
        break;
    }
    object[i]._oSelFlag = 0;
    object[i]._oAnimFrame++;
    if (deltaload)
        return;
    if (leveltype > 1)
        CreateTypeItem(object[i]._ox, object[i]._oy, 1, weaponType, 0, sendmsg, 0);
    else
        CreateTypeItem(object[i]._ox, object[i]._oy, 0, weaponType, 0, sendmsg, 0);
    if (pnum == myplr)
        NetSendCmdParam1(0, 0x2D, i);
}

void OperateTrapLvr(int i)
{
    int j, oi;

    if (object[i]._oAnimFrame == 1) {
        object[i]._oAnimFrame++;
        for (j = 0; j < numobjects; j++) {
            oi = objectactive[j];
            if (object[oi]._otype == object[i]._oVar2 && object[oi]._oVar1 == object[i]._oVar1) {
                object[oi]._oVar2 = 1;
                object[oi]._oAnimFlag = 0;
            }
        }
    } else {
        object[i]._oAnimFrame--;
        for (j = 0; j < numobjects; j++) {
            oi = objectactive[j];
            if (object[oi]._otype == object[i]._oVar2 && object[oi]._oVar1 == object[i]._oVar1) {
                object[oi]._oVar2 = 0;
                if (object[oi]._oVar4 != 0)
                    object[oi]._oAnimFlag = 1;
            }
        }
    }
}

void Obj_Sarc(int i)
{
    if (object[i]._oAnimFrame == object[i]._oAnimLen)
        object[i]._oAnimFlag = 0;
}

void Obj_StopAnim(int i)
{
    if (object[i]._oAnimFrame == object[i]._oAnimLen) {
        object[i]._oAnimCnt = 0;
        object[i]._oAnimDelay = 1000;
        object[i]._oAnimFlag = 0;
    }
}

void SyncBreakObj(int pnum, int oi)
{
    if (object[oi]._otype < 0x14)
        return;
    if (object[oi]._otype < 0x17) {
        BreakCrux(pnum, oi);
        return;
    }
    if (object[oi]._otype >= 0x3B)
        return;
    if (object[oi]._otype >= 0x39)
        BreakBarrel(pnum, oi, 0, 1, 0);
}

void SyncOpL1Door(int pnum, int cmd, int i)
{
    unsigned char opok;

    if (pnum == myplr)
        return;
    opok = 0;
    if (cmd == 0x2B && object[i]._oVar4 == 0)
        opok = 1;
    if (cmd == 0x2C && object[i]._oVar4 == 1)
        opok = 1;
    if (opok) {
        if (object[i]._otype == 1)
            OperateL1LDoor(-1, i, 0);
        if (object[i]._otype == 2)
            OperateL1RDoor(-1, i, 0);
    }
}

void SyncOpL2Door(int pnum, int cmd, int i)
{
    unsigned char opok;

    if (pnum == myplr)
        return;
    opok = 0;
    if (cmd == 0x2B && object[i]._oVar4 == 0)
        opok = 1;
    if (cmd == 0x2C && object[i]._oVar4 == 1)
        opok = 1;
    if (opok) {
        if (object[i]._otype == 0x2A)
            OperateL2LDoor(-1, i, 0);
        if (object[i]._otype == 0x2B)
            OperateL2RDoor(-1, i, 0);
    }
}

void SyncOpL3Door(int pnum, int cmd, int i)
{
    unsigned char opok;

    if (pnum == myplr)
        return;
    opok = 0;
    if (cmd == 0x2B && object[i]._oVar4 == 0)
        opok = 1;
    if (cmd == 0x2C && object[i]._oVar4 == 1)
        opok = 1;
    if (opok) {
        if (object[i]._otype == 0x4A)
            OperateL3RDoor(-1, i, 0);
        if (object[i]._otype == 0x4B)
            OperateL3LDoor(-1, i, 0);
    }
}

void SyncOpObject(int pnum, int cmd, int i)
{
    switch ((char)((unsigned char)object[i]._otype - 1)) {
    case 0:
    case 1:
        SyncOpL1Door(pnum, cmd, i);
        break;
    case 41:
    case 42:
        SyncOpL2Door(pnum, cmd, i);
        break;
    case 73:
    case 74:
        SyncOpL3Door(pnum, cmd, i);
        break;
    case 3:
    case 27:
        OperateLever(pnum, i);
        break;
    case 4:
    case 5:
    case 6:
    case 67:
    case 68:
    case 69:
        OperateChest(pnum, i, 0);
        break;
    case 47:
        OperateSarc(pnum, i, 0);
        break;
    case 70:
    case 71:
    case 87:
        OperateBookLever(pnum, i);
        break;
    case 58:
    case 59:
        OperateShrine(pnum, i, 0x2C);
        break;
    case 60:
    case 63:
        OperateSkelBook(pnum, i, 0);
        break;
    case 61:
    case 62:
        OperateBookCase(pnum, i, 0);
        break;
    case 24:
        OperateBook(pnum, i);
        break;
    case 66:
        OperateDecap(pnum, i, 0);
        break;
    case 76:
    case 88:
        OperateArmorStand(pnum, i, 0);
        break;
    case 78:
        OperateGoatShrine(pnum, i, 0x5D);
        break;
    case 79:
        OperateCauldron(pnum, i, 0x4C);
        break;
    case 80:
    case 81:
        OperateFountains(pnum, i);
        break;
    case 85:
        OperateStoryBook(pnum, i);
        break;
    case 72:
        OperatePedistal(pnum, i);
        break;
    case 89:
    case 91:
        OperateWeaponRack(pnum, i, 0);
        break;
    case 93:
        OperateMushPatch(pnum, i);
        break;
    case 95:
        OperateSlainHero(pnum, i, 0);
        break;
    case 96:
        OperateInnSignChest(pnum, i);
        break;
    case 40:
        OperateSChambBk(pnum, i);
        break;
    case 94:
        OperateLazStand(pnum, i);
        break;
    }
}

void SyncObjectAnim(int o)
{
    int ai, ot;

    ai = AllObjects[object[o]._otype].ofindex;
    ot = 0;
    while (ObjFileList[ot] != ai) {
        ot++;
    }
    switch (object[o]._otype) {
    case 1:
    case 2:
        SyncL1Doors(o);
        break;
    case 42:
    case 43:
        SyncL2Doors(o);
        break;
    case 74:
    case 75:
        SyncL3Doors(o);
        break;
    case 20:
    case 21:
    case 22:
        SyncCrux(o);
        break;
    case 4:
    case 25:
    case 28:
        SyncLever(o);
        break;
    case 41:
    case 71:
    case 88:
        SyncQSTLever(o);
        break;
    case 73:
        SyncPedistal(o);
        break;
    }
}

void Obj_Door(int i)
{
    int dx, dy;
    unsigned char dok;

    if (object[i]._oVar4 == 0) {
        object[i]._oSelFlag = 3;
        object[i]._oMissFlag = 0;
    } else {
        dy = object[i]._oy;
        dx = object[i]._ox;
        dok = dung_map[dx][dy].dMonster == 0;
        if (dung_map[dx][dy].dItem != 0)
            dok = 0;
        if (GetdDead(dx, dy) != 0)
            dok = 0;
        if (IsDplayer(dx, dy) != 0)
            dok = 0;
        object[i]._oSelFlag = 2;
        object[i]._oVar4 = dok ? 1 : 2;
        object[i]._oMissFlag = 1;
    }
}

void Obj_Light(int i, int lr)
{
    int ox, oy;
    int dx, dy;
    int p;
    int tr;
    unsigned char turnon;

    if (level_lamp[leveltype]) {
        if (object[i]._oVar1 != -1) {
            tr = (lr & 0xF) + 6;
            turnon = 0;
            ox = object[i]._ox;
            oy = object[i]._oy;
            for (p = 0; p < 2 && !turnon; p++) {
                if (plr[p].plractive) {
                    if (currlevel == plr[p].plrlevel) {
                        dx = abs(plr[p]._px - ox);
                        dy = abs(plr[p]._py - oy);
                        if (dx < tr && dy < tr)
                            turnon = 1;
                    }
                }
            }
            if (turnon) {
                if (object[i]._oVar1 == 0)
                    object[i]._olid = AddLight(ox, oy, lr);
                object[i]._oVar1 = 1;
            } else {
                if (object[i]._oVar1 == 1)
                    AddUnLight(object[i]._olid);
                object[i]._oVar1 = 0;
            }
        }
    }
}

void Obj_BCrossDamage(int i)
{
    int resist;
    int damage[4] = { 6, 8, 10, 12 };

    for (int pnum = 0; pnum < 2; pnum++) {
        if (plr[pnum]._pmode == PM_DEATH)
            continue;
        resist = plr[pnum]._pFireResist;
        if (resist > 0)
            damage[leveltype - 1] -= damage[leveltype - 1] * resist / 100;
        if (plr[pnum]._px == object[i]._ox && plr[pnum]._py == object[i]._oy - 1) {
            plr[pnum]._pHitPoints -= damage[leveltype - 1];
            plr[pnum]._pHPBase -= damage[leveltype - 1];
            if (plr[pnum]._pHitPoints >> 6 <= 0) {
                StartPlrKill(pnum, 0);
            } else {
                if (plr[pnum]._pClass == PC_WARRIOR)
                    PlaySfxLoc(0x315, plr[pnum]._px, plr[pnum]._py);
                else if (plr[pnum]._pClass == PC_ROGUE)
                    PlaySfxLoc(0x2A7, plr[pnum]._px, plr[pnum]._py);
                else if (plr[pnum]._pClass == PC_SORCERER)
                    PlaySfxLoc(0x23F, plr[pnum]._px, plr[pnum]._py);
            }
            drawhpflag = 1;
        }
    }
}

void OperateStoryBook(int pnum, int i)
{
    if (object[i]._oSelFlag) {
        object[i]._oAnimFrame = object[i]._oVar4;
        if (!deltaload) {
            PauseMode = 1;
            if (!qtextflag) {
                if (pnum == myplr) {
                    PlaySfxLoc(0x26, object[i]._ox, object[i]._oy);
                    InitQTextMsg(object[i]._oVar2);
                    NetSendCmdParam1(0, 0x2D, i);
                }
            }
        }
    }
}

void GetObjectStr(int i)
{
    int id;
    char *s;
    short idx;

    s = 0;
    switch (object[i]._otype) {
    case 1:
    case 2:
    case 42:
    case 43:
    case 74:
    case 75:
        if (object[i]._oVar4 == 1)
            strcpy(_infostr[sel_data], GetStr(0x2F3));
        if (object[i]._oVar4 == 0)
            strcpy(_infostr[sel_data], GetStr(0xBD));
        if (object[i]._oVar4 != 2)
            goto tail;
        id = 0x5E;
        break;
    case 20:
    case 21:
    case 22:
        id = 0xDA;
        break;
    case 4:
    case 50:
        id = 0x248;
        break;
    case 25:
        if (!setlevel)
            goto tail;
        if (setlvlnum == 2)
            id = 0x17;
        else if (setlvlnum == 5)
            id = 0x7B;
        else
            goto tail;
        break;
    case 28:
        id = 0x3D8;
        break;
    case 41:
        id = 0x2AE;
        break;
    case 5:
    case 68:
        id = 0x3DF;
        break;
    case 6:
    case 69:
        id = 0xB5;
        break;
    case 7:
    case 70:
    case 97:
        id = 0x239;
        break;
    case 48:
        id = 0x383;
        break;
    case 55:
        id = 0x78;
        break;
    case 62:
    case 63:
        id = 0x77;
        break;
    case 57:
    case 58:
        id = 0x40;
        break;
    case 59:
    case 60:
        idx = object[i]._oVar1;
        if (shrinestrs[idx] == 0x1ED) {
            s = GetStr(0x1EE);
            sprintf(tempstr, "%s", s);
        } else if (shrinestrs[idx] == 0x1FA) {
            s = GetStr(0x1FD);
            sprintf(tempstr, "%s", s);
        } else if (shrinestrs[idx] == 0x4C7) {
            s = GetStr(0x4C8);
            sprintf(tempstr, "%s", s);
        } else {
            s = GetStr(0x517);
            sprintf(tempstr, s, GetStr(shrinestrs[idx]));
        }
        strcpy(_infostr[sel_data], tempstr);
        goto tail;
    case 61:
        id = 0x3D3;
        break;
    case 64:
        id = 0x24B;
        break;
    case 66:
        id = 0x68;
        break;
    case 67:
        id = 0xEF;
        break;
    case 71:
        id = 0x7A;
        break;
    case 72:
        id = 0x40D;
        break;
    case 76:
        id = 0x337;
        break;
    case 77:
    case 89:
        id = 0x28;
        break;
    case 90:
        id = 0x4C4;
        break;
    case 79:
        id = 0x18C;
        break;
    case 80:
        id = 0xA3;
        break;
    case 81:
        id = 0x2A9;
        break;
    case 82:
        id = 0x169;
        break;
    case 73:
        id = 0x304;
        break;
    case 86:
        idx = object[i]._oVar2;
        s = GetStr(StoryBookName[idx]);
        strcpy(_infostr[sel_data], s);
        goto tail;
    case 88:
        id = 0x40D;
        break;
    case 92:
        id = 0x4C4;
        break;
    case 94:
        id = 0x2AA;
        break;
    case 95:
        id = 0x4B3;
        break;
    case 96:
        id = 0x3D9;
        break;
    default:
        goto tail;
    }
    strcpy(_infostr[sel_data], GetStr(id));
tail:
    if (plr[sel_data]._pClass == 1) {
        if (object[i]._oDoorFlag) {
            sprintf(tempstr, GetStr(0x499), _infostr[sel_data]);
            strcpy(_infostr[sel_data], tempstr);
            _infoclr[sel_data] = 2;
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
    long v2, v3, v4;
    int xx, yy;

    xx = 2 * x + 16;
    yy = 2 * y + 16;
    v2 = *(short *)((char *)DebugMonsters + 0x22 + v * 8) + 1;
    v3 = *(short *)((char *)DebugMonsters + 0x24 + v * 8) + 1;
    v4 = *(short *)((char *)DebugMonsters + 0x26 + v * 8) + 1;
    ObjSetMicro(xx, yy, *(short *)((char *)DebugMonsters + 0x20 + v * 8) + 1);
    ObjSetMicro(xx + 1, yy, v2);
    ObjSetMicro(xx, yy + 1, v3);
    ObjSetMicro(xx + 1, yy + 1, v4);
}
