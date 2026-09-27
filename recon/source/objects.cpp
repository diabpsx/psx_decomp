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

    pn = FindBlock(dx, dy);
    if (pn == 0x2B)
        ObjSetMicro(dx, dy, 0x188);
    if (pn == 0x2D)
        ObjSetMicro(dx, dy, 0x18A);
    if (pn == 0x32 && object[oi]._otype == 1)
        ObjSetMicro(dx, dy, 0x19B);
    if (pn == 0x32 && object[oi]._otype == 2)
        ObjSetMicro(dx, dy, 0x19C);
    if (pn == 0x36)
        ObjSetMicro(dx, dy, 0x18D);
    if (pn == 0x37)
        ObjSetMicro(dx, dy, 0x18E);
    if (pn == 0x3D)
        ObjSetMicro(dx, dy, 0x18F);
    if (pn == 0x43)
        ObjSetMicro(dx, dy, 0x190);
    if (pn == 0x44)
        ObjSetMicro(dx, dy, 0x191);
    if (pn == 0x45)
        ObjSetMicro(dx, dy, 0x193);
    if (pn == 0x46)
        ObjSetMicro(dx, dy, 0x194);
    if (pn == 0x48)
        ObjSetMicro(dx, dy, 0x196);
    if (pn == 0xD4)
        ObjSetMicro(dx, dy, 0x197);
    if (pn == 0x162)
        ObjSetMicro(dx, dy, 0x199);
    if (pn == 0x163)
        ObjSetMicro(dx, dy, 0x19A);
    if (pn == 0x19B)
        ObjSetMicro(dx, dy, 0x18C);
    if (pn == 0x19C)
        ObjSetMicro(dx, dy, 0x18C);
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

void DrawExpl(int sx, int sy, int f, int ot, int scale, char rtint, char gtint, char btint)
{
    struct TextDat *pTex;
    struct POLY_FT4 *poly;
    int numFrames;
    int frm;
    int frameDiv;
    int bright;
    int spinScale;
    int dx9, dy9;
    int isSmallScale;
    int otpos2;

    pTex = GM_UseTexData(0xCE);
    BL_GetCurrentBlocks()->GetOtPos(sy + 0x18);
    numFrames = pTex->GetNumOfFrames(0, 0);
    if (!(f < numFrames))
        DBG_Error(0, "source/OBJECTS.cpp", 0x387);
    bright = 0xF0;
    if (f == 1) {
        spinScale = scale;
        if (scale < 0)
            spinScale = scale + 3;
        DrawSpinner(sx, sy - 0xA, ~rtint & 0xFF, ~gtint & 0xFF, ~btint & 0xFF,
                    spinScale >> 2, 0x40, 4, 0, numFrames + 2, f, 0, 8);
    }
    isSmallScale = scale < 0x101;
    if (!isSmallScale)
        bright = bright >> 1;
    sy -= f << 2;
    frm = pTex->GetFrNum(0, 0, 0, f);
    otpos2 = numFrames + 1;
    poly = pTex->PrintFt4(frm, sx, sy, 0, otpos2, 0);
    frameDiv = (f * 3) >> 2;
    if (frameDiv == 0)
        frameDiv = 1;
    bright = bright / frameDiv;
    dx9 = (poly->x1 - poly->x0) * scale >> 9;
    dy9 = (poly->y2 - poly->y0) * scale >> 9;
    poly->x1 = sx + dx9;
    poly->x3 = sx + dx9;
    poly->code = (poly->code | 2) & 0xFE;
    poly->x0 = sx - dx9;
    poly->x2 = sx - dx9;
    poly->y0 = sy - dy9;
    poly->y1 = sy - dy9;
    poly->y2 = sy + dy9;
    poly->y3 = sy + dy9;
    poly->r0 = bright;
    poly->g0 = bright;
    poly->b0 = bright;
    if (!isSmallScale) {
        sy -= frameDiv << 2;
        poly = pTex->PrintFt4(frm, sx, sy, 0, otpos2, 0);
        sx++;
        sy++;
        poly->x0 = sx - dx9;
        poly->x2 = sx - dx9;
        poly->y0 = sy - dy9;
        poly->y1 = sy - dy9;
        poly->x1 = sx + dx9;
        poly->x3 = sx + dx9;
        poly->y2 = sy + dy9;
        poly->y3 = sy + dy9;
        poly->r0 = bright;
        poly->g0 = bright;
        poly->b0 = bright;
        poly->code = (poly->code | 2) & 0xFE;
    }
    GM_FinishedUsing(pTex);
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
                PostAddObject(ObjTypeConv[*lm], startx + 16 + i, starty + 16 + j);
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

void ProcessObjects(void)
{
    int i, oi;

    for (i = 0; i < numobjects; i++) {
        oi = objectactive[i];
        switch (object[oi]._otype) {
        case 0:
            Obj_Light(oi, 0x1B8);
            break;
        case 20:
        case 21:
        case 22:
        case 57:
        case 58:
        case 59:
        case 60:
            Obj_StopAnim(oi);
            break;
        case 1:
        case 2:
        case 42:
        case 43:
        case 74:
        case 75:
            Obj_Door(oi);
            break;
        case 3:
        case 9:
        case 44:
        case 45:
        case 46:
        case 47:
        case 65:
        case 87:
            Obj_Light(oi, 0x3F3);
            break;
        case 48:
            Obj_Sarc(oi);
            break;
        case 49:
            Obj_FlameTrap(oi);
            break;
        case 53:
        case 54:
            Obj_Trap(oi);
            break;
        case 84:
        case 85:
            Obj_Circle(oi);
            break;
        case 26:
        case 91:
            Obj_Light(oi, 0x1B8);
            Obj_BCrossDamage(oi);
            break;
        }
        if (object[oi]._oAnimFlag) {
            object[oi]._oAnimCnt++;
            if (object[oi]._oAnimCnt >= object[oi]._oAnimDelay) {
                object[oi]._oAnimCnt = 0;
                object[oi]._oAnimFrame++;
                if (object[oi]._oAnimFrame > object[oi]._oAnimLen)
                    object[oi]._oAnimFrame = 1;
            }
        }
    }
    i = 0;
    while (i < numobjects) {
        oi = objectactive[i];
        if (object[oi]._oDelFlag) {
            DeleteObject(oi, i);
            i = 0;
        } else {
            i++;
        }
    }
}

void MonstCheckDoors(int m)
{
    int i, oi, dpx, dpy;
    int mx, my;

    mx = monster[m]._mx;
    my = monster[m]._my;
    if (!(dung_map[mx - 1][my - 1].dObject
          || dung_map[mx][my - 1].dObject
          || dung_map[mx + 1][my - 1].dObject
          || dung_map[mx - 1][my].dObject
          || dung_map[mx + 1][my].dObject
          || dung_map[mx - 1][my + 1].dObject
          || dung_map[mx][my + 1].dObject
          || dung_map[mx + 1][my + 1].dObject))
        return;
    for (i = 0; i < numobjects; i++) {
        oi = objectactive[i];
        if (object[oi]._otype == 1 || object[oi]._otype == 2) {
            if (object[oi]._oVar4 == 0) {
                dpx = abs(object[oi]._ox - mx);
                dpy = abs(object[oi]._oy - my);
                if (dpx == 1 && dpy <= 1 && object[oi]._otype == 1)
                    OperateL1LDoor(myplr, oi, 1);
                if (dpx <= 1 && dpy == 1 && object[oi]._otype == 2)
                    OperateL1RDoor(myplr, oi, 1);
            }
        }
        if (object[oi]._otype == 0x2A || object[oi]._otype == 0x2B) {
            if (object[oi]._oVar4 == 0) {
                dpx = abs(object[oi]._ox - mx);
                dpy = abs(object[oi]._oy - my);
                if (dpx == 1 && dpy <= 1 && object[oi]._otype == 0x2A)
                    OperateL2LDoor(myplr, oi, 1);
                if (dpx <= 1 && dpy == 1 && object[oi]._otype == 0x2B)
                    OperateL2RDoor(myplr, oi, 1);
            }
        }
        if (object[oi]._otype == 0x4A || object[oi]._otype == 0x4B) {
            if (object[oi]._oVar4 == 0) {
                dpx = abs(object[oi]._ox - mx);
                dpy = abs(object[oi]._oy - my);
                if (dpx == 1 && dpy <= 1 && object[oi]._otype == 0x4B)
                    OperateL3RDoor(myplr, oi, 1);
                if (dpx <= 1 && dpy == 1 && object[oi]._otype == 0x4A)
                    OperateL3LDoor(myplr, oi, 1);
            }
        }
    }
}

void BreakBarrel(int pnum, int i, int dam, unsigned char forcebreak, unsigned char sendmsg)
{
    int x, y, oi;

    if (object[i]._oSelFlag == 0)
        return;
    if (forcebreak) {
        object[i]._oVar1 = 0;
    } else {
        object[i]._oVar1 -= dam;
        if (pnum != myplr && object[i]._oVar1 <= 0)
            object[i]._oVar1 = 1;
    }
    if (object[i]._oVar1 > 0) {
        if (!deltaload)
            PlaySfxLoc(0x1D, object[i]._ox, object[i]._oy);
        return;
    }
    object[i]._oVar1 = 0;
    object[i]._oAnimFlag = 1;
    object[i]._oAnimFrame = 1;
    object[i]._oAnimDelay = 1;
    object[i]._oSolidFlag = 0;
    object[i]._oMissFlag = 1;
    object[i]._oBreak = -1;
    object[i]._oSelFlag = 0;
    object[i]._oPreFlag = 1;
    if (deltaload) {
        object[i]._oAnimFrame = object[i]._oAnimLen;
        object[i]._oAnimCnt = 0;
        object[i]._oAnimDelay = 1000;
        return;
    }
    if (object[i]._otype == 0x3A) {
        PlaySfxLoc(0xE, object[i]._ox, object[i]._oy);
        object[i]._olid = AddLight(object[i]._ox, object[i]._oy, 0x33);
        object[i]._oVar1 = 1;
        for (y = object[i]._oy - 1; y <= object[i]._oy + 1; y++) {
            for (x = object[i]._ox - 1; x <= object[i]._ox + 1; x++) {
                if (dung_map[x][y].dMonster > 0)
                    MonsterTrapHit(dung_map[x][y].dMonster - 1, 1, 4, 0, 1, 0);
                if (IsDplayer(x, y))
                    PlayerMHit(IsDplayer(x, y) - 1, -1, 0, 8, 16, 1, 0, 0);
                if (dung_map[x][y].dObject > 0) {
                    oi = dung_map[x][y].dObject - 1;
                    if (object[oi]._otype == 0x3A && object[oi]._oBreak != -1)
                        BreakBarrel(pnum, oi, dam, 1, sendmsg);
                }
            }
        }
    } else {
        PlaySfxLoc(0xF, object[i]._ox, object[i]._oy);
        SetRndSeed(object[i]._oRndSeed);
        if (object[i]._oVar2 < 2) {
            if (object[i]._oVar3 == 0)
                CreateRndUseful(pnum, object[i]._ox, object[i]._oy, sendmsg);
            else
                CreateRndItem(object[i]._ox, object[i]._oy, 0, sendmsg, 0);
        }
        if (object[i]._oVar2 >= 8)
            SpawnSkeleton(object[i]._oVar4, object[i]._ox, object[i]._oy);
    }
    NetSendCmdParam2(0, 0x2F, pnum, i);
}

void PostAddObject(int ot, int ox, int oy)
{
    int oi;

    if (numobjects >= 0x7F)
        return;
    if (QuestStatus(9) && (oi = dung_map[ox][oy].dObject) != 0) {
        oi--;
        if (ot == 0x2A) {
            if (!deltaload) {
                if (object[oi]._oVar4 == 1)
                    NetSendCmdParam1(1, 0x2C, oi);
                ObjSetMicro(ox, oy, 0x21A);
                dungeon[(ox - 16) >> 1][(oy - 16) >> 1] = 0x96;
                object[oi]._oSelFlag = 1;
                object[oi]._oVar4 = 0;
            } else {
                if (object[oi]._oVar4 != 0) {
                    ObjSetMicro(ox, oy, 0x11);
                    dungeon[(ox - 16) >> 1][(oy - 16) >> 1] = 0x99;
                    object[oi]._oSelFlag = 4;
                    object[oi]._oVar4 = 1;
                } else {
                    ObjSetMicro(ox, oy, 0x21A);
                    dungeon[(ox - 16) >> 1][(oy - 16) >> 1] = 0x96;
                    object[oi]._oSelFlag = 1;
                    object[oi]._oVar4 = 0;
                }
            }
        } else if (ot == 0x2B) {
            if (!deltaload) {
                if (object[oi]._oVar4 == 1)
                    NetSendCmdParam1(1, 0x2C, oi);
                ObjSetMicro(ox, oy, 0x21C);
                dungeon[(ox - 16) >> 1][(oy - 16) >> 1] = 0x97;
                object[oi]._oSelFlag = 2;
                object[oi]._oVar4 = 0;
            } else {
                if (object[oi]._oVar4 != 0) {
                    ObjSetMicro(ox, oy, 0xD);
                    dungeon[(ox - 16) >> 1][(oy - 16) >> 1] = 0x98;
                    object[oi]._oSelFlag = 3;
                    object[oi]._oVar4 = 1;
                } else {
                    ObjSetMicro(ox, oy, 0x21C);
                    dungeon[(ox - 16) >> 1][(oy - 16) >> 1] = 0x97;
                    object[oi]._oSelFlag = 2;
                    object[oi]._oVar4 = 0;
                }
            }
        } else {
            goto create_new;
        }
        return;
    }
create_new:
    oi = objectavail[0];
    objectavail[0] = objectavail[0x7E - numobjects];
    object[oi]._olid = -1;
    objectactive[numobjects] = oi;
    dung_map[ox][oy].dObject = oi + 1;
    SetupObject(oi, ox, oy, ot);
    if (ot != 0x53)
        PostObjObjAddSwitch(ot, ox, oy, oi);
    numobjects++;
}

void OperateObject(int pnum, int i, unsigned char TeleFlag)
{
    unsigned char senditemmsg;

    senditemmsg = !deltaload;
    switch ((char)((unsigned char)object[i]._otype - 1)) {
    case 0:
    case 1:
        if (TeleFlag) {
            if (object[i]._otype == 1)
                OperateL1LDoor(pnum, i, 1);
            if (object[i]._otype == 2)
                OperateL1RDoor(pnum, i, 1);
        } else {
            if (pnum == myplr)
                OperateL1Door(pnum, i, senditemmsg);
        }
        break;
    case 41:
    case 42:
        if (TeleFlag) {
            if (object[i]._otype == 42)
                OperateL2LDoor(pnum, i, 1);
            if (object[i]._otype == 43)
                OperateL2RDoor(pnum, i, 1);
        } else {
            if (pnum == myplr)
                OperateL2Door(pnum, i, senditemmsg);
        }
        break;
    case 73:
    case 74:
        if (TeleFlag) {
            if (object[i]._otype == 74)
                OperateL3LDoor(pnum, i, 1);
            if (object[i]._otype == 75)
                OperateL3RDoor(pnum, i, 1);
        } else {
            if (pnum == myplr)
                OperateL3Door(pnum, i, senditemmsg);
        }
        break;
    case 3:
    case 27:
        OperateLever(pnum, i);
        break;
    case 24:
        OperateBook(pnum, i);
        break;
    case 40:
        OperateSChambBk(pnum, i);
        break;
    case 4:
    case 5:
    case 6:
    case 67:
    case 68:
    case 69:
        OperateChest(pnum, i, senditemmsg);
        break;
    case 47:
        OperateSarc(pnum, i, senditemmsg);
        break;
    case 49:
        OperateTrapLvr(i);
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
        OperateSkelBook(pnum, i, senditemmsg);
        break;
    case 61:
    case 62:
        OperateBookCase(pnum, i, senditemmsg);
        break;
    case 66:
        OperateDecap(pnum, i, senditemmsg);
        break;
    case 76:
    case 88:
        OperateArmorStand(pnum, i, senditemmsg);
        break;
    case 78:
        OperateGoatShrine(pnum, i, 0x5D);
        break;
    case 79:
        OperateCauldron(pnum, i, 0x4C);
        break;
    case 65:
    case 75:
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
        OperateWeaponRack(pnum, i, senditemmsg);
        break;
    case 93:
        OperateMushPatch(pnum, i);
        break;
    case 94:
        OperateLazStand(pnum, i);
        break;
    case 95:
        OperateSlainHero(pnum, i, senditemmsg);
        break;
    case 96:
        OperateInnSignChest(pnum, i);
        break;
    }
}

void OperateChest(int pnum, int i, unsigned char sendmsg)
{
    int j, mdir, mtype;

    mtype = 0;
    if (object[i]._oSelFlag != 0) {
        if (!deltaload)
            PlaySfxLoc(0x12, object[i]._ox, object[i]._oy);
        object[i]._oSelFlag = 0;
        object[i]._oAnimFrame = 2;
        if (!deltaload) {
            SetRndSeed(object[i]._oRndSeed);
            if (setlevel) {
                for (j = 0; j < object[i]._oVar1; j++) {
                    CreateRndItem(object[i]._ox, object[i]._oy, 1, sendmsg, 0);
                }
            } else {
                for (j = 0; j < object[i]._oVar1; j++) {
                    if (object[i]._oVar2)
                        CreateRndItem(object[i]._ox, object[i]._oy, 0, sendmsg, 0);
                    else
                        CreateRndUseful(pnum, object[i]._ox, object[i]._oy, sendmsg);
                }
            }
            if (object[i]._oTrapFlag && (unsigned char)(object[i]._otype - 0x44) < 3) {
                mdir = GetDirection(object[i]._ox, object[i]._oy, plr[pnum]._px, plr[pnum]._py);
                switch (object[i]._oVar4) {
                case 0:
                    mtype = 0;
                    break;
                case 1:
                    mtype = 0x1B;
                    break;
                case 2:
                    mtype = 0x2A;
                    break;
                default:
                    mtype = 0;
                    break;
                }
                AddMissile(object[i]._ox, object[i]._oy, plr[pnum]._px, plr[pnum]._py, mdir, mtype, 0, -1, 0, 0);
                object[i]._oTrapFlag = 0;
            }
            if (pnum == myplr)
                NetSendCmdParam2(0, 0x2E, pnum, i);
        }
    }
}

void OperateSlainHero(int pnum, int i, unsigned char sendmsg)
{
    if (object[i]._oSelFlag != 0) {
        object[i]._oSelFlag = 0;
        if (!deltaload) {
            if (plr[pnum]._pClass == 0) {
                CreateMagicArmor(object[i]._ox, object[i]._oy, 9, 0x99, 1, 0);
                PlaySfxLoc(0x2D4, plr[myplr]._px, plr[myplr]._py);
            } else if (plr[pnum]._pClass == 1) {
                CreateMagicWeapon(object[i]._ox, object[i]._oy, 3, 0x77, 1, 0);
                PlaySfxLoc(0x26C, plr[myplr]._px, plr[myplr]._py);
            } else if (plr[pnum]._pClass == 2) {
                CreateSpellBook(object[i]._ox, object[i]._oy, 3, 1, 0);
                PlaySfxLoc(0x204, plr[myplr]._px, plr[myplr]._py);
            }
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
    }
}

void OperateSChambBk(int pnum, int i)
{
    int j;
    int textdef;

    if (object[i]._oSelFlag == 0)
        return;
    if (qtextflag)
        return;
    if (object[i]._oAnimFrame != object[i]._oVar6) {
        ObjChangeMapResync(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
        for (j = 0; j < numobjects; j++) {
            int oi;

            oi = objectactive[j];
            SyncObjectAnim(oi);
        }
    }
    object[i]._oAnimFrame = object[i]._oVar6;
    if (quests[13]._qactive == 1) {
        quests[13]._qactive = 2;
        quests[13]._qlog = 1;
        if (!deltaload)
            NetSendCmdQuest(1, 0xE);
    }
    if (!deltaload) {
        PlaySfxLoc(0x26, object[i]._ox, object[i]._oy);
        if (plr[myplr]._pClass == 0)
            textdef = 0xEB;
        else if (plr[myplr]._pClass == 1)
            textdef = 0xF3;
        else if (plr[myplr]._pClass == 2)
            textdef = 0xEF;
        quests[13]._qmsg = textdef;
        InitQTextMsg(textdef);
        NetSendCmdParam1(0, 0x2D, i);
    }
}

void OperateBookCase(int pnum, int i, unsigned char sendmsg)
{
    if (object[i]._oSelFlag != 0) {
        if (!deltaload)
            PlaySfxLoc(0x26, object[i]._ox, object[i]._oy);
        object[i]._oSelFlag = 0;
        object[i]._oAnimFrame -= 2;
        if (QuestStatus(3)) {
            if (monster[4].mName == UniqMonst[2].mName) {
                if (quests[3]._qvar2 != 3) {
                    if (monster[4]._msquelch == 0xFF && monster[4]._mhitpoints != 0) {
                        monster[4].mtalkmsg = 0x95;
                        M_StartStand(0, monster[4]._mdir);
                        monster[4]._mgoal = 5;
                        monster[4]._mmode = 0x11;
                        quests[3]._qvar2 = 3;
                        if (!deltaload)
                            NetSendCmdQuest(1, 3);
                    }
                }
            }
        }
        if (!deltaload) {
            SetRndSeed(object[i]._oRndSeed);
            CreateTypeItem(object[i]._ox, object[i]._oy, 0, 0, 0x18, sendmsg, 0);
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
    }
}

void OperateMushPatch(int pnum, int i)
{
    int x, y;

    if (numitems >= 0x7F) {
        PlaySFX(0x3D3);
        return;
    }
    if (object[i]._oSelFlag == 0)
        return;
    object[i]._oSelFlag = 0;
    if (!(quests[1]._qactive == 2 && quests[1]._qvar1 >= 2)) {
        if (!deltaload && pnum == myplr) {
            if (plr[pnum]._pClass == 0)
                PlaySFX(0x2D8);
            else if (plr[pnum]._pClass == 1)
                PlaySFX(0x270);
            else if (plr[pnum]._pClass == 2)
                PlaySFX(0x208);
        }
    } else {
        if (!deltaload)
            PlaySfxLoc(0x12, object[i]._ox, object[i]._oy);
        object[i]._oAnimFrame = 2;
        if (quests[1].pad_for_laz == 0) {
            GetSuperItemLoc(object[i]._ox, object[i]._oy, &x, &y);
            SpawnQuestItem(0x11, x, y, 0, 0);
        }
        if (!deltaload) {
            quests[1]._qvar1 = 3;
            NetSendCmdQuest(1, 1);
            NetSendCmdParam2(0, 0x2E, pnum, i);
        }
    }
}

void OperateInnSignChest(int pnum, int i)
{
    int x, y;

    if (numitems >= 0x7F) {
        PlaySFX(0x3D3);
        return;
    }
    if (quests[7]._qvar1 < 2) {
        if (!deltaload && pnum == myplr) {
            if (plr[pnum]._pClass == 0)
                PlaySFX(0x2E9);
            else if (plr[pnum]._pClass == 1)
                PlaySFX(0x27B);
            else if (plr[pnum]._pClass == 2)
                PlaySFX(0x213);
        }
        return;
    }
    if (object[i]._oSelFlag == 0)
        return;
    if (!deltaload)
        PlaySfxLoc(0x12, object[i]._ox, object[i]._oy);
    object[i]._oSelFlag = 0;
    object[i]._oAnimFrame = 2;
    if (deltaload)
        return;
    GetSuperItemLoc(object[i]._ox, object[i]._oy, &x, &y);
    SpawnQuestItem(0xC, x, y, 0, 0);
    NetSendCmdParam1(0, 0x2D, i);
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
    int otm;
    int x, y;

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
    int rangeok;
    unsigned char done;

    done = 0;
    do {
        rv = ENG_random(0x1A);
        cl = currlevel;
        if (cl != 0) {
            if (rv == 7)
                rangeok = cl < 9;
            else
                rangeok = cl < 0x11;
            if (rangeok && rv != 8)
                done = 1;
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

unsigned char OperateFountains(int pnum, int i)
{
    int rv;
    int statVal, saveRnd, status, rndVal, ii;

    rv = 0;
    SetRndSeed(object[i]._oRndSeed);
    if (object[i]._otype == 0x4C) {
        if (deltaload)
            return rv;
        if (pnum != myplr)
            return rv;
        if (plr[pnum]._pMana < plr[pnum]._pMaxMana) {
            PlaySfxLoc(0x5A, object[i]._ox, object[i]._oy);
            plr[pnum]._pMana += 0x40;
            plr[pnum]._pManaBase += 0x40;
            if (plr[pnum]._pMana > plr[pnum]._pMaxMana) {
                plr[pnum]._pMana = plr[pnum]._pMaxMana;
                plr[pnum]._pManaBase = plr[pnum]._pMaxManaBase;
            }
            rv = 1;
        } else {
            if (!deltaload)
                PlaySfxLoc(0x5A, object[i]._ox, object[i]._oy);
        }
        force_redraw = 0xFF;
        return rv;
    }
    if (object[i]._otype == 0x42) {
        if (deltaload)
            return rv;
        if (pnum != myplr)
            return rv;
        if (plr[pnum]._pHitPoints < plr[pnum]._pMaxHP) {
            PlaySfxLoc(0x5A, object[i]._ox, object[i]._oy);
            plr[pnum]._pHitPoints += 0x40;
            plr[pnum]._pHPBase += 0x40;
            if (plr[pnum]._pHitPoints > plr[pnum]._pMaxHP) {
                plr[pnum]._pHitPoints = plr[pnum]._pMaxHP;
                plr[pnum]._pHPBase = plr[pnum]._pMaxHPBase;
            }
            rv = 1;
        } else {
            if (!deltaload)
                PlaySfxLoc(0x5A, object[i]._ox, object[i]._oy);
        }
        force_redraw = 0xFF;
        return rv;
    }
    if (object[i]._otype == 0x51) {
        if (object[i]._oSelFlag != 0) {
            if (!deltaload)
                PlaySfxLoc(0x5A, object[i]._ox, object[i]._oy);
            object[i]._oSelFlag = 0;
            if (deltaload)
                return rv;
            AddMissile(plr[pnum]._px, plr[pnum]._py, plr[pnum]._px, plr[pnum]._py,
                       plr[pnum]._pdir, 0x27, -1, pnum, 0, leveltype << 1);
            rv = 1;
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
        force_redraw = 0xFF;
        return rv;
    }
    if (object[i]._otype == 0x52) {
        if (object[i]._oSelFlag != 0) {
            statVal = -1;
            saveRnd = -1;
            status = 0;
            ii = 0;
            if (!deltaload)
                PlaySfxLoc(0x5A, object[i]._ox, object[i]._oy);
            object[i]._oSelFlag = 0;
            if (deltaload)
                return rv;
            if (pnum != myplr)
                return rv;
            do {
                rndVal = ENG_random(4);
                if (rndVal != saveRnd) {
                    switch (rndVal) {
                    case 0:
                        ModifyPlrStr(pnum, statVal);
                        break;
                    case 1:
                        ModifyPlrMag(pnum, statVal);
                        break;
                    case 2:
                        ModifyPlrDex(pnum, statVal);
                        break;
                    case 3:
                        ModifyPlrVit(pnum, statVal);
                        break;
                    }
                    saveRnd = rndVal;
                    statVal = 1;
                    ii++;
                }
                if (ii >= 2)
                    status = 1;
            } while (!status);
            CheckStats(pnum);
            if (pnum == myplr)
                NetSendCmdParam1(0, 0x2D, i);
        }
        force_redraw = 0xFF;
        return rv;
    }
    return rv;
}

void OperateBook(int pnum, int i)
{
    unsigned char found;
    int j, oi;
    int otx, oty;

    if (object[i]._oSelFlag == 0)
        return;
    found = 0;
    if (setlevel && setlvlnum == 5) {
        otx = plr[pnum]._px;
        oty = plr[pnum]._py;
        if (!deltaload) {
            if (quests[15].pad_for_laz & 2) {
                oi = dung_map[35][36].dObject - 1;
                object[oi]._oVar5++;
            }
            if (quests[15].pad_for_laz & 1) {
                oi = dung_map[26][46].dObject - 1;
                object[oi]._oVar5++;
                found = 1;
            }
        }
        for (j = 0; j < numobjects; j++) {
            oi = objectactive[j];
            if (object[oi]._otype == 0x55) {
                if (object[oi]._oVar6 == 1) {
                    otx = 0x1B;
                    oty = 0x1D;
                    quests[15].pad_for_laz |= 2;
                    object[oi]._oVar6 = 4;
                    found = 1;
                } else if (object[oi]._oVar6 == 2) {
                    otx = 0x2B;
                    oty = 0x1D;
                    quests[15].pad_for_laz |= 1;
                    object[oi]._oVar6 = 4;
                    found = 1;
                }
                if (found)
                    object[dung_map[35][36].dObject - 1]._oVar5++;
            }
        }
        if (found && !deltaload)
            AddMissile(plr[pnum]._px, plr[pnum]._py, otx, oty, plr[pnum]._pdir, 1, 0, pnum, 0, 0);
        if (!found)
            return;
    }
    object[i]._oSelFlag = 0;
    object[i]._oAnimFrame++;
    if (setlevel && setlvlnum == 2) {
        ObjChangeMapResync(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
        for (j = 0; j < numobjects; j++)
            SyncObjectAnim(objectactive[j]);
    }
    if (!deltaload) {
        if (setlevel && setlvlnum == 2) {
            plr[myplr]._pMemSpells |= 1ULL << 12;
            if (plr[pnum]._pSplLvl[13] < 15)
                plr[myplr]._pSplLvl[13]++;
            quests[13]._qactive = 3;
            NetSendCmdQuest(1, 0xE);
            PlaySfxLoc(0xC, object[i]._ox, object[i]._oy);
            InitDiabloMsg(0x2B);
            ScrollFlag[myplr] = 1;
            AddMissile(plr[myplr]._px, plr[myplr]._py, object[i]._ox - 2, object[i]._oy - 4, plr[myplr]._pdir, 2, 0, myplr, 0, 0);
        }
        NetSendCmdParam1(0, 0x2D, i);
    }
}

#define Q_BLIND 8
#define Q_BLOOD 9
#define Q_WARLORD 11

void OperateBookLever(int pnum, int i)
{
    char savedTransVal;
    int qix, qiy;

    qix = setpc_x * 2 + 0x10;
    qiy = setpc_y * 2 + 0x10;
    if (numitems >= 0x7F) {
        PlaySFX(0x3D3);
        return;
    }
    if (object[i]._oSelFlag == 0)
        return;
    if (qtextflag)
        return;
    if (object[i]._otype == OBJ_BLINDBOOK) {
        if (quests[Q_BLIND]._qvar1 == 0) {
            quests[Q_BLIND]._qactive = 2;
            quests[Q_BLIND]._qlog = 1;
            quests[Q_BLIND]._qvar1 = 1;
            object[i]._oVar6 = 2;
            if (!deltaload)
                NetSendCmdQuest(1, Q_BLIND);
        }
    }
    if (object[i]._otype == 0x48) {
        if (quests[Q_BLOOD]._qvar1 == 0 && !deltaload) {
            quests[Q_BLOOD]._qactive = 2;
            quests[Q_BLOOD]._qlog = 1;
            quests[Q_BLOOD]._qvar1 = 1;
            quests[Q_BLOOD]._qvar2 = 1;
            object[i]._oVar6 = 2;
            SpawnQuestItem(0x15, setpc_x * 2 + 0x19, setpc_y * 2 + 0x21, 0, 1);
            NetSendCmdQuest(1, Q_BLOOD);
        }
    }
    if (object[i]._otype == 0x58) {
        if (quests[Q_WARLORD]._qvar1 == 0) {
            quests[Q_WARLORD]._qactive = 2;
            quests[Q_WARLORD]._qlog = 1;
            quests[Q_WARLORD]._qvar1 = 1;
            if (!deltaload)
                NetSendCmdQuest(1, Q_WARLORD);
        }
    }
    if (object[i]._oAnimFrame != object[i]._oVar6) {
        if (object[i]._otype != 0x48) {
            ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
            if (deltaload)
                ConvertdPiece();
        }
        if (object[i]._otype == OBJ_BLINDBOOK) {
            savedTransVal = TransVal;
            TransVal = 9;
            DRLG_MRectTrans(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
            TransVal = savedTransVal;
            if (deltaload)
                ConvertdPiece();
            if (!quests[Q_BLIND].pad_for_laz)
                CreateItem(3, qix + 5, qiy + 5);
        }
    }
    if (object[i]._oAnimFrame != object[i]._oVar6)
        PlaySfxLoc(0x26, object[i]._ox, object[i]._oy);
    object[i]._oAnimFrame = object[i]._oVar6;
    if (!deltaload) {
        InitQTextMsg(object[i]._oVar7);
        NetSendCmdParam1(0, 0x2D, i);
    }
}

void OperatePedistal(int pnum, int i)
{
    int idx;
    unsigned char *buf;
    unsigned char found;

    found = 0;
    if (numitems >= 0x7F) {
        PlaySFX(0x3D3);
        return;
    }
    if (!deltaload) {
        if (object[i]._oVar6 == 3)
            return;
        if (PlrHasItem(pnum, 0x15, &idx) != 0) {
            RemoveInvItem(pnum, idx);
            object[i]._oAnimFrame++;
            object[i]._oVar6++;
            found = 1;
        }
        if (!found)
            return;
        if (object[i]._oVar6 == 1) {
            PlaySfxLoc(0x6A, object[i]._ox, object[i]._oy);
            ObjChangeMap(setpc_x, setpc_y + 3, setpc_x + 2, setpc_y + 7);
            quests[Q_BLOOD]._qvar2 = 2;
            SpawnQuestItem(0x15, setpc_x * 2 + 19, setpc_y * 2 + 26, 0, 1);
            NetSendCmdQuest(1, Q_BLOOD);
        }
        if (object[i]._oVar6 == 2) {
            PlaySfxLoc(0x6A, object[i]._ox, object[i]._oy);
            ObjChangeMap(setpc_x + 6, setpc_y + 3, setpc_x + setpc_w, setpc_y + 7);
            quests[Q_BLOOD]._qvar2 = 3;
            SpawnQuestItem(0x15, setpc_x * 2 + 31, setpc_y * 2 + 26, 0, 1);
            NetSendCmdQuest(1, Q_BLOOD);
        }
        if (object[i]._oVar6 == 3) {
            PlaySfxLoc(0x48, object[i]._ox, object[i]._oy);
            ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
            buf = GRL_LoadFileInMemSig("Blood2.DUN", 0);
            LoadMapObjs(buf, setpc_x * 2, setpc_y * 2);
            mem_free_dbg(buf);
            CreateItem(7, setpc_x * 2 + 25, setpc_y * 2 + 19);
            object[i]._oSelFlag = 0;
            quests[Q_BLOOD]._qvar2 = 4;
            NetSendCmdQuest(1, Q_BLOOD);
        }
        NetSendCmdParam1(0, 0x2D, i);
    } else {
        if (quests[Q_BLOOD]._qvar2 == 2) {
            ObjChangeMap(setpc_x, setpc_y + 3, setpc_x + 2, setpc_y + 7);
            object[i]._oAnimFrame = 2;
        }
        if (quests[Q_BLOOD]._qvar2 == 3) {
            ObjChangeMap(setpc_x, setpc_y + 3, setpc_x + 2, setpc_y + 7);
            ObjChangeMap(setpc_x + 6, setpc_y + 3, setpc_x + setpc_w, setpc_y + 7);
            object[i]._oAnimFrame = 3;
        }
        if (quests[Q_BLOOD]._qvar2 == 4) {
            ObjChangeMap(setpc_x, setpc_y + 3, setpc_x + 2, setpc_y + 7);
            ObjChangeMap(setpc_x + 6, setpc_y + 3, setpc_x + setpc_w, setpc_y + 7);
            ObjChangeMap(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
            buf = GRL_LoadFileInMemSig("Blood2.DUN", 0);
            LoadMapObjs(buf, setpc_x * 2, setpc_y * 2);
            mem_free_dbg(buf);
            object[i]._oSelFlag = 0;
            object[i]._oAnimFrame = 4;
        }
    }
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
        OperateL3RDoor(pnum, i, sendflag);
    if (dpx < 2 && dpy == 1 && object[i]._otype == 0x4A)
        OperateL3LDoor(pnum, i, sendflag);
}

void OperateL1LDoor(int pnum, int i, unsigned char sendflag)
{
    int dx, dy;
    unsigned char dok;

    if (object[i]._oVar4 == 2) {
        if (!deltaload)
            PlaySfxLoc(0x13, object[i]._ox, object[i]._oy);
        return;
    }
    dx = object[i]._ox;
    dy = object[i]._oy;
    if (object[i]._oVar4 == 0) {
        if (pnum == myplr && sendflag)
            NetSendCmdParam1(1, 0x2B, i);
        if (!deltaload)
            PlaySfxLoc(0x14, dx, dy);
        if (object[i]._oVar1 == 0xD6)
            ObjSetMicro(dx, dy, 0x198);
        else
            ObjSetMicro(dx, dy, 0x189);
        dy--;
        object[i]._oAnimFrame += 2;
        object[i]._oPreFlag = 1;
        DoorSet(i, dx, dy);
        object[i]._oVar4 = 1;
        object[i]._oSelFlag = 2;
        RedoPlayerVision();
    } else {
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
            ObjSetMicro(dx, dy, object[i]._oVar1);
            if (object[i]._oVar2 != 0x32) {
                ObjSetMicro(dx, dy - 1, object[i]._oVar2);
            } else {
                if (FindBlock(dx - 1, dy) == 0x18C)
                    ObjSetMicro(dx - 1, dy, 0x19B);
                else
                    ObjSetMicro(dx, dy - 1, object[i]._oVar2);
            }
            object[i]._oAnimFrame -= 2;
            object[i]._oPreFlag = 0;
            RedoPlayerVision();
        } else {
            object[i]._oVar4 = 2;
        }
    }
}

void OperateL1RDoor(int pnum, int i, unsigned char sendflag)
{
    int dx, dy;
    unsigned char dok;

    if (object[i]._oVar4 == 2) {
        if (!deltaload)
            PlaySfxLoc(0x13, object[i]._ox, object[i]._oy);
        return;
    }
    dx = object[i]._ox;
    dy = object[i]._oy;
    if (object[i]._oVar4 == 0) {
        if (pnum == myplr && sendflag)
            NetSendCmdParam1(1, 0x2B, i);
        if (!deltaload)
            PlaySfxLoc(0x14, dx, dy);
        ObjSetMicro(dx, dy, 0x18B);
        object[i]._oPreFlag = 1;
        DoorSet(i, dx - 1, dy);
        object[i]._oVar4 = 1;
        object[i]._oSelFlag = 2;
        RedoPlayerVision();
    } else {
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
            ObjSetMicro(dx, dy, object[i]._oVar1);
            if (object[i]._oVar2 != 0x32) {
                ObjSetMicro(dx, dy, object[i]._oVar2);
            } else {
                if (FindBlock(dx - 1, dy) == 0x18C)
                    ObjSetMicro(dx - 1, dy, 0x19B);
                else
                    ObjSetMicro(dx - 1, dy, object[i]._oVar2);
            }
            object[i]._oPreFlag = 0;
            RedoPlayerVision();
        } else {
            object[i]._oVar4 = 2;
        }
    }
}

void OperateL2LDoor(int pnum, int i, unsigned char sendflag)
{
    int dx, dy;
    unsigned char dok;

    if (object[i]._oVar4 == 2) {
        if (!deltaload)
            PlaySfxLoc(0x13, object[i]._ox, object[i]._oy);
        return;
    }
    dx = object[i]._ox;
    dy = object[i]._oy;
    if (object[i]._oVar4 == 0) {
        if (pnum == myplr && sendflag)
            NetSendCmdParam1(1, 0x2B, i);
        if (!deltaload)
            PlaySfxLoc(0x14, dx, dy);
        ObjSetMicro(dx, dy, 0xD);
        dungeon[(dx - 16) / 2][(dy - 16) / 2] = 0x98;
        object[i]._oAnimFrame = 3;
        object[i]._oPreFlag = 1;
        object[i]._oVar4 = 1;
        object[i]._oSelFlag = 2;
        RedoPlayerVision();
    } else {
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
            ObjSetMicro(dx, dy, 0x21A);
            dungeon[(dx - 16) / 2][(dy - 16) / 2] = 0x96;
            object[i]._oAnimFrame = 1;
            object[i]._oPreFlag = 0;
            RedoPlayerVision();
        } else {
            object[i]._oVar4 = 2;
        }
    }
}

void OperateL2RDoor(int pnum, int i, unsigned char sendflag)
{
    int dx, dy;
    unsigned char dok;

    if (object[i]._oVar4 == 2) {
        if (!deltaload)
            PlaySfxLoc(0x13, object[i]._ox, object[i]._oy);
        return;
    }
    dx = object[i]._ox;
    dy = object[i]._oy;
    if (object[i]._oVar4 == 0) {
        if (pnum == myplr && sendflag)
            NetSendCmdParam1(1, 0x2B, i);
        if (!deltaload)
            PlaySfxLoc(0x14, dx, dy);
        ObjSetMicro(dx, dy, 0x11);
        dungeon[(dx - 16) / 2][(dy - 16) / 2] = 0x99;
        object[i]._oAnimFrame = 4;
        object[i]._oPreFlag = 1;
        object[i]._oVar4 = 1;
        object[i]._oSelFlag = 2;
        RedoPlayerVision();
    } else {
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
            ObjSetMicro(dx, dy, 0x21C);
            dungeon[(dx - 16) / 2][(dy - 16) / 2] = 0x97;
            object[i]._oAnimFrame = 2;
            object[i]._oPreFlag = 0;
            RedoPlayerVision();
        } else {
            object[i]._oVar4 = 2;
        }
    }
}

void OperateL3LDoor(int pnum, int i, unsigned char sendflag)
{
    int dx, dy;
    unsigned char dok;

    if (object[i]._oVar4 == 2) {
        if (!deltaload)
            PlaySfxLoc(0x13, object[i]._ox, object[i]._oy);
        return;
    }
    dx = object[i]._ox;
    dy = object[i]._oy;
    if (object[i]._oVar4 == 0) {
        if (pnum == myplr && sendflag)
            NetSendCmdParam1(1, 0x2B, i);
        if (!deltaload)
            PlaySfxLoc(0x14, dx, dy);
        ObjSetMicro(dx, dy, 0x21A);
        object[i]._oPreFlag = 1;
        object[i]._oVar4 = 1;
        object[i]._oSelFlag = 2;
        RedoPlayerVision();
    } else {
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
            ObjSetMicro(dx, dy, 0x213);
            object[i]._oPreFlag = 0;
            RedoPlayerVision();
        } else {
            object[i]._oVar4 = 2;
        }
    }
}

void OperateL3RDoor(int pnum, int i, unsigned char sendflag)
{
    int dx, dy;
    unsigned char dok;

    if (object[i]._oVar4 == 2) {
        if (!deltaload)
            PlaySfxLoc(0x13, object[i]._ox, object[i]._oy);
        return;
    }
    dx = object[i]._ox;
    dy = object[i]._oy;
    if (object[i]._oVar4 == 0) {
        if (pnum == myplr && sendflag)
            NetSendCmdParam1(1, 0x2B, i);
        if (!deltaload)
            PlaySfxLoc(0x14, dx, dy);
        ObjSetMicro(dx, dy, 0x21D);
        object[i]._oPreFlag = 1;
        object[i]._oVar4 = 1;
        object[i]._oSelFlag = 2;
        RedoPlayerVision();
    } else {
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
            ObjSetMicro(dx, dy, 0x216);
            object[i]._oPreFlag = 0;
            RedoPlayerVision();
        } else {
            object[i]._oVar4 = 2;
        }
    }
}

void OperateShrine(int pnum, int i, int sType)
{
    int j, r, cnt;
    int stype;

    if (dropGoldFlag) {
        dropGoldFlag = 0;
        dropGoldValue = 0;
    }
    if (object[i]._oSelFlag == 0)
        return;
    SetRndSeed(object[i]._oRndSeed);
    object[i]._oSelFlag = 0;
    if (deltaload) {
        object[i]._oAnimFrame = object[i]._oAnimLen;
        object[i]._oAnimFlag = 0;
        return;
    }
    PlaySfxLoc(sType, object[i]._ox, object[i]._oy);
    object[i]._oAnimFlag = 1;
    object[i]._oAnimDelay = 1;
    stype = object[i]._oVar1;
    if ((unsigned int)stype < 0x1A) {
        switch (stype) {
        case 0:
            ModifyPlrStr(pnum, -1);
            ModifyPlrMag(pnum, -1);
            ModifyPlrDex(pnum, -1);
            ModifyPlrVit(pnum, -1);
            r = ENG_random(4);
            switch (r) {
            case 0: ModifyPlrStr(pnum, 6); break;
            case 1: ModifyPlrMag(pnum, 6); break;
            case 2: ModifyPlrDex(pnum, 6); break;
            case 3: ModifyPlrVit(pnum, 6); break;
            }
            CheckStats(pnum);
            InitDiabloMsg(0xC);
            break;
        case 1:
            cnt = 0;
            for (j = 0; j < 7; j++) {
                if (plr[pnum].InvBody[j]._itype != -1 && plr[pnum].InvBody[j]._iMaxDur != 0xFF && plr[pnum].InvBody[j]._iMaxDur != 0)
                    cnt++;
            }
            if (cnt > 0) {
                for (j = 0; j < 7; j++) {
                    if (plr[pnum].InvBody[j]._itype != -1 && plr[pnum].InvBody[j]._iMaxDur != 0xFF && plr[pnum].InvBody[j]._iMaxDur != 0) {
                        plr[pnum].InvBody[j]._iDurability += 10;
                        plr[pnum].InvBody[j]._iMaxDur += 10;
                        if (plr[pnum].InvBody[j]._iDurability > plr[pnum].InvBody[j]._iMaxDur)
                            plr[pnum].InvBody[j]._iDurability = plr[pnum].InvBody[j]._iMaxDur;
                    }
                }
                do {
                    r = ENG_random(7);
                    if (plr[pnum].InvBody[r]._itype == -1)
                        continue;
                    if (plr[pnum].InvBody[r]._iMaxDur == 0xFF)
                        continue;
                    if (plr[pnum].InvBody[r]._iMaxDur == 0)
                        continue;
                    plr[pnum].InvBody[r]._iDurability -= 20;
                    plr[pnum].InvBody[r]._iMaxDur -= 20;
                    if (plr[pnum].InvBody[r]._iDurability <= 0)
                        plr[pnum].InvBody[r]._iDurability = 1;
                    if (plr[pnum].InvBody[r]._iMaxDur <= 0)
                        plr[pnum].InvBody[r]._iMaxDur = 1;
                    break;
                } while (1);
            }
            InitDiabloMsg(0xD);
            break;
        case 2:
            if (plr[pnum].InvBody[0]._itype != -1)
                plr[pnum].InvBody[0]._iAC += 2;
            if (plr[pnum].InvBody[6]._itype != -1)
                plr[pnum].InvBody[6]._iAC += 2;
            if (plr[pnum].InvBody[4]._itype != -1) {
                if (plr[pnum].InvBody[4]._itype == 5) {
                    plr[pnum].InvBody[4]._iAC += 2;
                } else {
                    plr[pnum].InvBody[4]._iMaxDam--;
                    if (plr[pnum].InvBody[4]._iMaxDam < plr[pnum].InvBody[4]._iMinDam)
                        plr[pnum].InvBody[4]._iMaxDam = plr[pnum].InvBody[4]._iMinDam;
                }
            }
            if (plr[pnum].InvBody[5]._itype != -1) {
                if (plr[pnum].InvBody[5]._itype == 5) {
                    plr[pnum].InvBody[5]._iAC += 2;
                } else {
                    plr[pnum].InvBody[5]._iMaxDam--;
                    if (plr[pnum].InvBody[5]._iMaxDam < plr[pnum].InvBody[5]._iMinDam)
                        plr[pnum].InvBody[5]._iMaxDam = plr[pnum].InvBody[5]._iMinDam;
                }
            }
            for (j = 0; j < plr[pnum]._pNumInv; j++) {
                r = plr[pnum].InvList[j]._itype - 1;
                if ((unsigned int)r < 10) {
                    if (r >= 4 && r <= 8) {
                        plr[pnum].InvList[j]._iAC += 2;
                    } else {
                        plr[pnum].InvList[j]._iMaxDam--;
                        if (plr[pnum].InvList[j]._iMaxDam < plr[pnum].InvList[j]._iMinDam)
                            plr[pnum].InvList[j]._iMaxDam = plr[pnum].InvList[j]._iMinDam;
                    }
                }
            }
            InitDiabloMsg(0xE);
            break;
        case 3:
            if (plr[pnum].InvBody[4]._itype != -1 && plr[pnum].InvBody[4]._itype != 5)
                plr[pnum].InvBody[4]._iMaxDam++;
            if (plr[pnum].InvBody[5]._itype != -1 && plr[pnum].InvBody[5]._itype != 5)
                plr[pnum].InvBody[5]._iMaxDam++;
            for (j = 0; j < plr[pnum]._pNumInv; j++) {
                r = plr[pnum].InvList[j]._itype;
                if (r > 0 && (r < 5 || r == 10))
                    plr[pnum].InvList[j]._iMaxDam++;
            }
            InitDiabloMsg(0xF);
            break;
        case 4:
        case 11:
            AddMissile(plr[pnum]._px, plr[pnum]._py, plr[pnum]._px, plr[pnum]._py, plr[pnum]._pdir, 0xD, -1, pnum, 0, leveltype << 1);
            InitDiabloMsg(0x10);
            break;
        case 5:
            for (j = 0; j < 7; j++) {
                if (plr[pnum].InvBody[j]._itype == 10)
                    plr[pnum].InvBody[j]._iCharges = plr[pnum].InvBody[j]._iMaxCharges;
            }
            for (j = 0; j < plr[pnum]._pNumInv; j++) {
                if (plr[pnum].InvList[j]._itype == 10)
                    plr[pnum].InvList[j]._iCharges = plr[pnum].InvList[j]._iMaxCharges;
            }
            for (j = 0; j < 8; j++) {
                if (plr[pnum].SpdList[j]._itype == 10)
                    plr[pnum].SpdList[j]._iCharges = plr[pnum].SpdList[j]._iMaxCharges;
            }
            InitDiabloMsg(0x11);
            break;
        case 6:
            for (j = 0; j < 7; j++)
                plr[pnum].InvBody[j]._iDurability = plr[pnum].InvBody[j]._iMaxDur;
            for (j = 0; j < plr[pnum]._pNumInv; j++)
                plr[pnum].InvList[j]._iDurability = plr[pnum].InvList[j]._iMaxDur;
            for (j = 0; j < 8; j++)
                plr[pnum].SpdList[j]._iDurability = plr[pnum].SpdList[j]._iMaxDur;
            InitDiabloMsg(0x12);
            break;
        case 7: {
            int spellToReduce;

            cnt = 0;
            for (j = 1; j < 0x26; j++) {
                if (plr[pnum]._pMemSpells & (1ULL << j))
                    cnt++;
            }
            if (cnt >= 2) {
                do {
                    spellToReduce = ENG_random(0x25) + 1;
                } while (!(plr[pnum]._pMemSpells & (1ULL << spellToReduce)));
                for (j = 1; j < 0x26; j++) {
                    if ((plr[pnum]._pMemSpells & (1ULL << j)) && plr[pnum]._pSplLvl[j] < 15)
                        plr[pnum]._pSplLvl[j]++;
                }
                if (plr[pnum]._pSplLvl[spellToReduce] < 2)
                    plr[pnum]._pSplLvl[spellToReduce] = 0;
                else
                    plr[pnum]._pSplLvl[spellToReduce] -= 2;
            }
            InitDiabloMsg(0x13);
            break;
        }
        case 8: {
            int oi, ot;

            for (j = 0; j < numobjects; j++) {
                oi = objectactive[j];
                ot = object[oi]._otype;
                if (ot == 5 || ot == 6 || ot == 7) {
                    if (object[oi]._oSelFlag == 0) {
                        object[oi]._oRndSeed = GetRndSeed();
                        object[oi]._oSelFlag = 1;
                        object[oi]._oAnimFrame -= 2;
                    }
                }
            }
            InitDiabloMsg(0x14);
            break;
        }
        case 9: {
            int penalty, diffA, diffB;

            plr[pnum]._pMemSpells |= 1ULL << 0;
            if (plr[pnum]._pSplLvl[1] < 15)
                plr[pnum]._pSplLvl[1]++;
            if (plr[pnum]._pSplLvl[1] < 15)
                plr[pnum]._pSplLvl[1]++;
            penalty = plr[pnum]._pManaBase / 5;
            diffA = plr[pnum]._pMana - plr[pnum]._pMaxManaBase;
            diffB = plr[pnum]._pMaxMana - plr[pnum]._pManaBase;
            plr[pnum]._pMaxManaBase -= penalty;
            plr[pnum]._pMana -= penalty;
            plr[pnum]._pMaxMana -= penalty;
            plr[pnum]._pManaBase -= penalty;
            if ((plr[pnum]._pMana >> 6) <= 0) {
                plr[pnum]._pMana = diffA;
                plr[pnum]._pMaxManaBase = 0;
            }
            if ((plr[pnum]._pMaxMana >> 6) <= 0) {
                plr[pnum]._pMaxMana = diffB;
                plr[pnum]._pManaBase = 0;
            }
            InitDiabloMsg(0x15);
            break;
        }
        case 10:
            AddMissile(plr[pnum]._px, plr[pnum]._py, plr[pnum]._px, plr[pnum]._py, plr[pnum]._pdir, 0x2A, -1, pnum, 0, leveltype << 1);
            plr[pnum]._pMana = plr[pnum]._pMaxMana;
            plr[pnum]._pMaxManaBase = plr[pnum]._pManaBase;
            InitDiabloMsg(0x16);
            break;
        case 12: {
            int idx, mid;

            for (j = 0; j < plr[pnum]._pNumInv; j++) {
                if (plr[pnum].InvList[j]._itype != 0)
                    continue;
                mid = plr[pnum].InvList[j]._iMiscId;
                if (mid == 3 || mid == 6)
                    idx = ItemMiscIdIdx(0x12);
                else if (mid == 2 || mid == 7)
                    idx = ItemMiscIdIdx(0x13);
                else
                    continue;
                SetPlrHandItem(&plr[pnum].HoldItem, idx);
                GetPlrHandSeed(&plr[pnum].HoldItem);
                plr[pnum].InvList[j] = plr[pnum].HoldItem;
                plr[pnum].InvList[j]._iStatFlag = 1;
            }
            for (j = 0; j < 8; j++) {
                if (plr[pnum].SpdList[j]._itype != 0)
                    continue;
                mid = plr[pnum].SpdList[j]._iMiscId;
                if (mid == 3 || mid == 6)
                    idx = ItemMiscIdIdx(0x12);
                else if (mid == 2 || mid == 7)
                    idx = ItemMiscIdIdx(0x13);
                else
                    continue;
                SetPlrHandItem(&plr[pnum].HoldItem, idx);
                GetPlrHandSeed(&plr[pnum].HoldItem);
                plr[pnum].SpdList[j] = plr[pnum].HoldItem;
                plr[pnum].SpdList[j]._iStatFlag = 1;
            }
            InitDiabloMsg(0x18);
            break;
        }
        case 13:
            ModifyPlrMag(pnum, 2);
            CheckStats(pnum);
            InitDiabloMsg(0x19);
            break;
        case 14:
            if (currlevel < 4) {
                CreateTypeItem(object[i]._ox, object[i]._oy, 0, 0, 7, 1, 0);
                CreateTypeItem(object[i]._ox, object[i]._oy, 0, 0, 2, 1, 0);
            } else {
                CreateTypeItem(object[i]._ox, object[i]._oy, 0, 0, 0x13, 1, 0);
                CreateTypeItem(object[i]._ox, object[i]._oy, 0, 0, 0x13, 1, 0);
            }
            plr[pnum]._pMana = plr[pnum]._pMaxMana;
            plr[pnum]._pManaBase = plr[pnum]._pMaxManaBase;
            plr[pnum]._pHitPoints = plr[pnum]._pMaxHP;
            plr[pnum]._pHPBase = plr[pnum]._pMaxHPBase;
            InitDiabloMsg(0x1A);
            break;
        case 15: {
            int fx, fy, tries;

            fx = 0;
            fy = 0;
            for (tries = 0; tries < 0x2400; tries++) {
                fx = ENG_random(0x60);
                fy = ENG_random(0x60);
                if (GetSOLID(fx, fy))
                    continue;
                if (dung_map[fx][fy].dObject != 0)
                    continue;
                if (dung_map[fx][fy].dMonster != 0)
                    continue;
                break;
            }
            AddMissile(plr[pnum]._px, plr[pnum]._py, fx, fy, plr[pnum]._pdir, 3, -1, pnum, 0, leveltype << 1);
            InitDiabloMsg(0x1B);
            break;
        }
        case 16: {
            int penalty, diffA, diffB;

            plr[pnum]._pMemSpells |= 1ULL << 29;
            if (plr[pnum]._pSplLvl[30] < 15)
                plr[pnum]._pSplLvl[30]++;
            if (plr[pnum]._pSplLvl[30] < 15)
                plr[pnum]._pSplLvl[30]++;
            penalty = plr[pnum]._pManaBase / 5;
            diffA = plr[pnum]._pMana - plr[pnum]._pMaxManaBase;
            diffB = plr[pnum]._pMaxMana - plr[pnum]._pManaBase;
            plr[pnum]._pMaxManaBase -= penalty;
            plr[pnum]._pMana -= penalty;
            plr[pnum]._pMaxMana -= penalty;
            plr[pnum]._pManaBase -= penalty;
            if ((plr[pnum]._pMana >> 6) <= 0) {
                plr[pnum]._pMana = diffA;
                plr[pnum]._pMaxManaBase = 0;
            }
            if ((plr[pnum]._pMaxMana >> 6) <= 0) {
                plr[pnum]._pMaxMana = diffB;
                plr[pnum]._pManaBase = 0;
            }
            InitDiabloMsg(0x1C);
            break;
        }
        case 17: {
            int amount, nInv;

            for (j = 0; j < 0x28; j++) {
                if (plr[pnum].InvGrid[j] != 0)
                    continue;
                amount = leveltype * 5 + ENG_random(leveltype * 10);
                nInv = plr[pnum]._pNumInv;
                plr[pnum].InvList[nInv] = _golditem[StorePlrNo];
                plr[pnum].InvList[nInv]._iSeed = GetRndSeed();
                plr[pnum]._pNumInv = nInv + 1;
                plr[pnum].InvGrid[j] = plr[pnum]._pNumInv;
                plr[pnum].InvList[nInv]._ivalue = amount;
                plr[pnum]._pGold += amount;
                SetGoldCurs(pnum, nInv);
            }
            InitDiabloMsg(0x1D);
            break;
        }
        case 18:
            if (gbMaxPlayers == 1) {
                InitDiabloMsg(0x1E);
            } else {
                int other;

                InitDiabloMsg(0x1F);
                other = pnum ^ 1;
                plr[other]._pHitPoints = plr[pnum]._pMaxHP;
                plr[other]._pHPBase = plr[pnum]._pMaxHPBase;
                plr[other]._pMana = plr[pnum]._pMaxMana;
                plr[other]._pManaBase = plr[pnum]._pMaxManaBase;
            }
            break;
        case 19:
            ModifyPlrDex(pnum, 2);
            CheckStats(pnum);
            InitDiabloMsg(0x20);
            break;
        case 20:
            ModifyPlrStr(pnum, 2);
            CheckStats(pnum);
            InitDiabloMsg(0x21);
            break;
        case 21:
            ModifyPlrVit(pnum, 2);
            CheckStats(pnum);
            InitDiabloMsg(0x22);
            break;
        case 22: {
            int col, row;

            for (col = 0; col < 40; col++) {
                for (row = 0; row < 5; row++)
                    automapview[row][col] = 0xFF;
            }
            InitDiabloMsg(0x23);
            break;
        }
        case 23: {
            int penalty, diffA, diffB;

            plr[pnum]._pMemSpells |= 1ULL << 30;
            if (plr[pnum]._pSplLvl[31] < 15)
                plr[pnum]._pSplLvl[31]++;
            if (plr[pnum]._pSplLvl[31] < 15)
                plr[pnum]._pSplLvl[31]++;
            penalty = plr[pnum]._pManaBase / 5;
            diffA = plr[pnum]._pMana - plr[pnum]._pMaxManaBase;
            diffB = plr[pnum]._pMaxMana - plr[pnum]._pManaBase;
            plr[pnum]._pMaxManaBase -= penalty;
            plr[pnum]._pMana -= penalty;
            plr[pnum]._pMaxMana -= penalty;
            plr[pnum]._pManaBase -= penalty;
            if ((plr[pnum]._pMana >> 6) <= 0) {
                plr[pnum]._pMana = diffA;
                plr[pnum]._pMaxManaBase = 0;
            }
            if ((plr[pnum]._pMaxMana >> 6) <= 0) {
                plr[pnum]._pMaxMana = diffB;
                plr[pnum]._pManaBase = 0;
            }
            InitDiabloMsg(0x24);
            break;
        }
        case 24:
            for (j = 0; j < 7; j++) {
                if (plr[pnum].InvBody[j]._iMagical != 0 && plr[pnum].InvBody[j]._iIdentified == 0)
                    plr[pnum].InvBody[j]._iIdentified = 1;
            }
            for (j = 0; j < plr[pnum]._pNumInv; j++) {
                if (plr[pnum].InvList[j]._iMagical != 0 && plr[pnum].InvList[j]._iIdentified == 0)
                    plr[pnum].InvList[j]._iIdentified = 1;
            }
            for (j = 0; j < 8; j++) {
                if (plr[pnum].SpdList[j]._iMagical != 0 && plr[pnum].SpdList[j]._iIdentified == 0)
                    plr[pnum].SpdList[j]._iIdentified = 1;
            }
            InitDiabloMsg(0x25);
            break;
        case 25: {
            int other, mStr, mMag, mDex, mVit, roll;

            InitDiabloMsg(0x26);
            roll = ENG_random(4);
            mStr = (roll == 0) ? -1 : 1;
            mMag = (roll == 1) ? -1 : 1;
            mDex = (roll == 2) ? -1 : 1;
            mVit = (roll == 3) ? -1 : 1;
            other = pnum ^ 1;
            ModifyPlrStr(other, mStr);
            ModifyPlrMag(other, mMag);
            ModifyPlrDex(other, mDex);
            ModifyPlrVit(other, mVit);
            CheckStats(other);
            break;
        }
        }
    }
    CalcPlrInv(pnum, 1);
    force_redraw = 0xFF;
    NetSendCmdParam2(0, 0x2E, pnum, i);
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
            OperateL3LDoor(-1, i, 0);
        if (object[i]._otype == 0x4B)
            OperateL3RDoor(-1, i, 0);
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

void Obj_Circle(int i)
{
    int p;
    unsigned char found;
    int ox, oy;
    int px, py;
    int ot;
    char *pxp, *pyp, *pdirp;

    found = 0;
    ox = object[i]._ox;
    oy = object[i]._oy;
    pxp = (char *)&plr[0]._px;
    pyp = pxp + 2;
    pdirp = pxp + 0x12;
    for (p = 0; p < 2 && !found; p++, pxp += sizeof(struct PlayerStruct), pyp += sizeof(struct PlayerStruct), pdirp += sizeof(struct PlayerStruct)) {
        px = *(short *)pxp;
        py = *(short *)pyp;
        if ((px == ox && py == oy) || deltaload) {
            found = 1;
            ot = object[i]._otype;
            if (ot == 0x54) {
                object[i]._oAnimFrame = 2;
                ot = object[i]._otype;
            }
            if (ot == 0x55)
                object[i]._oAnimFrame = 4;
            if (ox == 0x2D && oy == 0x2F)
                object[i]._oVar6 = 2;
            else if (ox == 0x1A && oy == 0x2E)
                object[i]._oVar6 = 1;
            else
                object[i]._oVar6 = 0;
            if (object[i]._oVar5 >= 3 && ((ox == 0x23 && oy == 0x24) || deltaload)) {
                object[i]._oVar6 = 4;
                ObjChangeMapResync(object[i]._oVar1, object[i]._oVar2, object[i]._oVar3, object[i]._oVar4);
                if (quests[15]._qactive == 2) {
                    if (quests[15]._qvar1 < 5) {
                        quests[15]._qvar1 = 4;
                        if (!deltaload)
                            NetSendCmdQuest(1, 15);
                    }
                }
                AddMissile(px, py, 0x23, 0x2E, *pdirp, 3, 0, p, 0, 0);
                ClrPlrPath(p);
                StartStand(p, 0);
            }
        } else {
            if (object[i]._otype == 0x54)
                object[i]._oAnimFrame = 1;
            if (object[i]._otype == 0x55)
                object[i]._oAnimFrame = 3;
            object[i]._oVar6 = 0;
        }
    }
}

void Obj_Trap(int i)
{
    int oti;
    unsigned char otrig;
    int sx, sy, dx, dy;
    int ax, ay;
    int x, y;
    int mdir;

    if (object[i]._oVar4 != 0)
        return;
    oti = dung_map[object[i]._oVar1][object[i]._oVar2].dObject - 1;
    otrig = 0;
    switch ((char)((unsigned char)object[oti]._otype - 1)) {
    case 0:
    case 1:
    case 41:
    case 42:
    case 73:
    case 74:
        if (object[oti]._oVar4 != 0)
            otrig = 1;
        break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 27:
    case 47:
        if (object[oti]._oSelFlag == 0)
            otrig = 1;
        break;
    }
    if (otrig) {
        object[i]._oVar4 = 1;
        sx = object[i]._ox;
        sy = object[i]._oy;
        dx = object[oti]._ox;
        dy = object[oti]._oy;
        ax = dx;
        ay = dy;
        for (y = ay - 1; y <= ay + 1; y++) {
            for (x = ax - 1; x <= ax + 1; x++) {
                if (IsDplayer(x, y) != 0) {
                    dx = x;
                    dy = y;
                }
            }
        }
        if (!deltaload) {
            mdir = GetDirection(sx, sy, dx, dy);
            AddMissile(sx, sy, dx, dy, mdir, object[i]._oVar3, 1, -1, 0, 0);
            PlaySfxLoc(0x35, object[oti]._ox, object[oti]._oy);
        }
        object[oti]._oTrapFlag = 0;
    }
}

void Obj_FlameTrap(int i)
{
    int xp, yp;
    int j;

    if (object[i]._oVar2 != 0) {
        if (object[i]._oVar4 != 0) {
            object[i]._oAnimFrame--;
            if (object[i]._oAnimFrame == 1) {
                object[i]._oVar4 = 0;
                AddUnLight(object[i]._olid);
            } else {
                if (object[i]._oAnimFrame <= 4)
                    ChangeLightRadius(object[i]._olid, object[i]._oAnimFrame);
            }
        }
    } else {
        if (object[i]._oVar4 == 0) {
            if (object[i]._oVar3 == 2) {
                xp = object[i]._ox - 2;
                yp = object[i]._oy;
                for (j = 0; j < 5; j++) {
                    if (IsDplayer(xp, yp) != 0 || dung_map[xp][yp].dMonster != 0)
                        object[i]._oVar4 = 1;
                    xp++;
                }
            } else {
                xp = object[i]._ox;
                yp = object[i]._oy - 2;
                for (j = 0; j < 5; j++) {
                    if (IsDplayer(xp, yp) != 0 || dung_map[xp][yp].dMonster != 0)
                        object[i]._oVar4 = 1;
                    yp++;
                }
            }
            if (object[i]._oVar4 != 0)
                ActivateTrapLine(object[i]._otype, object[i]._oVar1);
        } else {
            if (object[i]._oAnimFrame == object[i]._oAnimLen)
                object[i]._oAnimFrame = 11;
            if (object[i]._oAnimFrame <= 5)
                ChangeLightRadius(object[i]._olid, object[i]._oAnimFrame);
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
