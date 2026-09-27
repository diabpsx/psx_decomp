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
