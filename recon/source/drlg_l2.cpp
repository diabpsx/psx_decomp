/* DRLG_L2.CPP — Diablo PSX (Climax 1998) reconstruction (PREGAME overlay, segments drlg_l2/drlg_l2_1/drlg_l2_2).
 * Twin: refs/devilution/Source/drlg_l2.cpp (+ refs/devilutionx/Source/levels/drlg_l2.cpp).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas vs devilution: dflags[] -> mydflags (flat byte array, same indexing as dungeon[i][j]);
 * dTransVal[][] -> dung_map[x][y].dTransVal; dPiece[][] writes -> SetDPiece(x,y,v) calls (no direct
 * dPiece array in this build); dSpecial[][] feature is compiled out entirely on PSX (DRLG_InitL2Vals
 * and the matching LoadL2Dungeon block are empty/absent in the retail oracle -- kept as no-ops here);
 * random_(0,n) -> ENG_random(n); LoadFileInMem -> GRL_LoadFileInMemSig; MemFreeDbg macro (source/diablo.h)
 * matches DRLG_FreeL2SP's load/null/free-call oracle shape exactly. */
#include "diabpsx_types.h"
#include "source/gen/structs_drlg_l2.h"
#include "source/gen/externs_drlg_l2.h"
#include "source/gen/protos_drlg_l2.h"
#include "source/diablo.h"

#define DMAXX 40
#define DMAXY 40

#define DLRG_PROTECTED 0x80

#define Q_BLIND  8
#define Q_BLOOD  9
#define Q_SCHAMB 0xE
#define QUEST_NOTAVAIL 0

#define ENTRY_MAIN 0
#define ENTRY_PREV 1

/* TU-owned small data (.sdata/.sbss, gp-relative in retail -- confirmed via %gp_rel in the oracle) */
int Area_Min = 2;
int Room_Max = 10;
int Room_Min = 4;
int nRoomCnt;
int nSx1;
int nSy1;
int nSx2;
int nSy2;
struct NODE *pHallList;
/* compiler-introduced spill slot written once at the tail of DoPatternCheck's switch dispatch
 * (gp_rel `sw $t9,myk`); not part of the C source -- no read site found anywhere in the oracle. */
int myk;

/* ---------------------------------------------------------------------------------------------- */

static unsigned char DRLG_L2PlaceMiniSet(unsigned char *miniset, int tmin, int tmax, int cx, int cy, int setview, int ldir)
{
    int sx, sy;
    int sw, sh;
    int xx, yy;
    int i, ii, numt;
    int found;
    int randxy[128];
    int rcount;
    int failed;
    int r;

    sw = miniset[0];
    sh = miniset[1];

    if (tmax == tmin) {
        numt = 1;
    } else {
        numt = ENG_random(tmax - tmin) + tmin;
    }

    rcount = 0;
    failed = 0;
    sx = 0;
    sy = 0;
    do {
        found = 1;

        if (sx >= nSx1 && sx <= nSx2 && sy >= nSy1 && sy <= nSy2) {
            found = 0;
        }

        if (cx != -1) {
            if (sx >= cx - sw && sx <= cx + 12) {
                found = 0;
            }
        }
        if (cy != -1) {
            if (sy >= cy - sh && sy <= cy + 12) {
                found = 0;
            }
        }

        for (yy = 0; yy < sh; yy++) {
            for (xx = 0; xx < sw; xx++) {
                if (miniset[2] != 0 && dungeon[sx + xx][sy + yy] != miniset[2]) {
                    found = 0;
                }
                if (mydflags[(sx + xx) + (sy + yy) * DMAXX] != 0) {
                    found = 0;
                }
            }
        }

        if (found) {
            randxy[rcount * 2 + 0] = sx;
            randxy[rcount * 2 + 1] = sy;
            rcount++;
            if (rcount >= 64) {
                failed = 1;
            }
        }

        sx++;
        if (sx == DMAXX - sw) {
            sx = 0;
            sy++;
            if (sy == DMAXY - sh) {
                failed = 1;
            }
        }
    } while (!failed);

    for (i = 0; i < numt; i++) {
        r = ENG_random(rcount);
        sx = randxy[r * 2 + 0];
        sy = randxy[r * 2 + 1];

        ii = sh * sw + 2;
        for (yy = 0; yy < sh; yy++) {
            for (xx = 0; xx < sw; xx++) {
                if (miniset[ii] != 0) {
                    dungeon[sx + xx][sy + yy] = miniset[ii];
                }
                ii++;
            }
        }
    }

    if (setview == 1) {
        ViewX = 2 * sx + 21;
        ViewY = 2 * sy + 22;
    }
    if (ldir == 0) {
        LvlViewX = 2 * sx + 21;
        LvlViewY = 2 * sy + 22;
    }
    if (ldir == 6) {
        LvlViewX = 2 * sx + 21;
        LvlViewY = 2 * sy + 22;
    }

    return true;
}

static void DRLG_L2PlaceRndSet(unsigned char *miniset, int rndper)
{
    int sx, sy, sw, sh, xx, yy, ii, kk;
    bool found;

    sw = miniset[0];
    sh = miniset[1];

    for (sy = 0; sy < DMAXY - sh; sy++) {
        for (sx = 0; sx < DMAXX - sw; sx++) {
            found = true;
            ii = 2;
            if (sx >= nSx1 && sx <= nSx2 && sy >= nSy1 && sy <= nSy2) {
                found = false;
            }
            for (yy = 0; yy < sh && found == true; yy++) {
                for (xx = 0; xx < sw && found == true; xx++) {
                    if (miniset[ii] != 0 && dungeon[xx + sx][yy + sy] != miniset[ii]) {
                        found = false;
                    }
                    if (mydflags[(xx + sx) + (yy + sy) * DMAXX] != 0) {
                        found = false;
                    }
                    ii++;
                }
            }
            kk = sh * sw + 2;
            if (found == true) {
                for (yy = sy - sh; yy < sy + 2 * sh && found == true; yy++) {
                    for (xx = sx - sw; xx < sx + 2 * sw; xx++) {
                        if (dungeon[xx][yy] == miniset[kk]) {
                            found = false;
                        }
                    }
                }
            }
            if (found == true && ENG_random(100) < rndper) {
                for (yy = 0; yy < sh; yy++) {
                    for (xx = 0; xx < sw; xx++) {
                        if (miniset[kk] != 0) {
                            dungeon[xx + sx][yy + sy] = miniset[kk];
                        }
                        kk++;
                    }
                }
            }
        }
    }
}

static void DRLG_L2Subs(void)
{
    int x, y, i, j, k, rv;
    unsigned char c;

    for (y = 0; y < DMAXY; y++) {
        for (x = 0; x < DMAXX; x++) {
            if ((x < nSx1 || x > nSx2) && (y < nSy1 || y > nSy2) && ENG_random(4) == 0) {
                c = BTYPESL2[(unsigned char)dungeon[x][y]];
                if (c != 0) {
                    rv = ENG_random(16);
                    k = -1;
                    while (rv >= 0) {
                        k++;
                        if (k == sizeof(BTYPESL2)) {
                            k = 0;
                        }
                        if (c == BTYPESL2[k]) {
                            rv--;
                        }
                    }
                    for (j = y - 2; j < y + 2; j++) {
                        for (i = x - 2; i < x + 2; i++) {
                            if (dungeon[i][j] == k) {
                                j = y + 3;
                                i = x + 2;
                            }
                        }
                    }
                    if (j < y + 3) {
                        dungeon[x][y] = k;
                    }
                }
            }
        }
    }
}

static void DRLG_L2Shadows(void)
{
    int x, y, i, patflag;
    unsigned char sd[2][2];

    for (y = 1; y < DMAXY; y++) {
        for (x = 1; x < DMAXX; x++) {
            if (x == 60 && y == 21) {
                patflag = 1;
            }
            sd[0][0] = BSTYPESL2[dungeon[x][y]];
            sd[1][0] = BSTYPESL2[dungeon[x - 1][y]];
            sd[0][1] = BSTYPESL2[dungeon[x][y - 1]];
            sd[1][1] = BSTYPESL2[dungeon[x - 1][y - 1]];
            for (i = 0; i < 2; i++) {
                if (SPATSL2[i].strig == sd[0][0]) {
                    patflag = 1;
                    if (SPATSL2[i].s1 != 0 && SPATSL2[i].s1 != sd[1][1]) {
                        patflag = 0;
                    }
                    if (SPATSL2[i].s2 != 0 && SPATSL2[i].s2 != sd[0][1]) {
                        patflag = 0;
                    }
                    if (SPATSL2[i].s3 != 0 && SPATSL2[i].s3 != sd[1][0]) {
                        patflag = 0;
                    }
                    if (patflag == 1) {
                        if (SPATSL2[i].nv1 != 0) {
                            dungeon[x - 1][y - 1] = SPATSL2[i].nv1;
                        }
                        if (SPATSL2[i].nv2 != 0) {
                            dungeon[x][y - 1] = SPATSL2[i].nv2;
                        }
                        if (SPATSL2[i].nv3 != 0) {
                            dungeon[x - 1][y] = SPATSL2[i].nv3;
                        }
                    }
                }
            }
        }
    }
}

void InitDungeon(void)
{
    int i, j;

    /* PSX oracle: only clears predungeon -- unlike devilution's InitDungeon this build does NOT also
     * zero mydflags here (LoadL2Dungeon/LoadPreL2Dungeon each clear mydflags themselves instead). */
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            predungeon[i][j] = 32;
        }
    }
}

static void DRLG_LoadL2SP(void)
{
    setloadflag = false;

    if (QuestStatus(Q_BLIND)) {
        pSetPiece = GRL_LoadFileInMemSig("Levels\\L2Data\\Blind2.DUN", 0);
        setloadflag = true;
    } else if (QuestStatus(Q_BLOOD)) {
        pSetPiece = GRL_LoadFileInMemSig("Levels\\L2Data\\Blood1.DUN", 0);
        setloadflag = true;
    } else if (QuestStatus(Q_SCHAMB)) {
        pSetPiece = GRL_LoadFileInMemSig("Levels\\L2Data\\Bonestr2.DUN", 0);
        setloadflag = true;
    }
}

static void DRLG_FreeL2SP(void)
{
    MemFreeDbg(pSetPiece);
}

static void DRLG_L2SetRoom(int rx1, int ry1)
{
    int rw, rh, i, j;
    unsigned char *sp;

    rw = pSetPiece[0];
    rh = pSetPiece[2];

    setpc_x = rx1;
    setpc_y = ry1;
    setpc_w = rw;
    setpc_h = rh;

    sp = &pSetPiece[4];

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*sp != 0) {
                dungeon[i + rx1][j + ry1] = *sp;
                mydflags[(i + rx1) + (j + ry1) * DMAXX] |= DLRG_PROTECTED;
            } else {
                dungeon[i + rx1][j + ry1] = 3;
            }
            sp += 2;
        }
    }
}

static void DefineRoom(int nX1, int nY1, int nX2, int nY2, int ForceHW)
{
    int i, j;
    unsigned char ft;

    predungeon[nX1][nY1] = 67;
    predungeon[nX1][nY2] = 69;
    predungeon[nX2][nY1] = 66;
    predungeon[nX2][nY2] = 65;

    nRoomCnt++;

    RoomList[nRoomCnt].nRoomx1 = nX1;
    RoomList[nRoomCnt].nRoomx2 = nX2;

    RoomList[nRoomCnt].nRoomy1 = nY1;
    RoomList[nRoomCnt].nRoomy2 = nY2;
    if (ForceHW == 1) {
        for (i = nX1; i < nX2; i++) {
            for (j = nY1; i < nY2; i++) {
                mydflags[i + j * DMAXX] |= DLRG_PROTECTED;
            }
        }
    }
    for (i = nX1 + 1; i <= nX2 - 1; i++) {
        predungeon[i][nY1] = 35;
        predungeon[i][nY2] = 35;
    }

    nY1++;
    nY2--;
    ft = 46;

    for (i = nY1; i <= nY2; i++) {
        predungeon[nX1][i] = 35;
        predungeon[nX2][i] = 35;
        j = nX1 + 1;

        while (j < nX2) {
            predungeon[j][i] = ft;
            j++;
        }
    }
}

static void CreateDoorType(int nX, int nY)
{
    unsigned char fDoneflag;

    fDoneflag = false;

    if ((signed char)predungeon[nX - 1][nY] == 68) {
        fDoneflag = true;
    }
    if ((signed char)predungeon[nX + 1][nY] == 68) {
        fDoneflag = true;
    }
    if ((signed char)predungeon[nX][nY - 1] == 68) {
        fDoneflag = true;
    }
    if ((signed char)predungeon[nX][nY + 1] == 68) {
        fDoneflag = true;
    }
    if (predungeon[nX][nY] == 66 || predungeon[nX][nY] == 67 || predungeon[nX][nY] == 65 || predungeon[nX][nY] == 69) {
        fDoneflag = true;
    }

    if (!fDoneflag) {
        predungeon[nX][nY] = 68;
    }
}

static void PlaceHallExt(int nX, int nY)
{
    if (predungeon[nX][nY] == 32) {
        predungeon[nX][nY] = 44;
    }
}

static void AddHall(int nX1, int nY1, int nX2, int nY2, int nHd)
{
    struct NODE *p1, *p2;

    if (pHallList == 0) {
        pHallList = (struct NODE *)DiabloAllocPtr(sizeof(*pHallList));
        pHallList->nHallx1 = nX1;
        pHallList->nHally1 = nY1;
        pHallList->nHallx2 = nX2;
        pHallList->nHally2 = nY2;
        pHallList->nHalldir = nHd;
        pHallList->pNext = 0;
    } else {
        p1 = (struct NODE *)DiabloAllocPtr(sizeof(*pHallList));
        p1->nHallx1 = nX1;
        p1->nHally1 = nY1;
        p1->nHallx2 = nX2;
        p1->nHally2 = nY2;
        p1->nHalldir = nHd;
        p1->pNext = 0;
        p2 = pHallList;
        while (p2->pNext != 0) {
            p2 = p2->pNext;
        }
        p2->pNext = p1;
    }
}

static void CreateRoom(int nX1, int nY1, int nX2, int nY2, int nRDest, int nHDir, int ForceHW, int nH, int nW)
{
    int nAw, nAh;
    int nRw, nRh;
    int nRx1, nRy1, nRx2, nRy2;
    int nHx1, nHy1, nHx2, nHy2;
    int nRid;

    if (nRoomCnt >= 80) {
        return;
    }

    nAw = nX2 - nX1;
    nAh = nY2 - nY1;

    if (nAw >= Area_Min && nAh >= Area_Min) {
        if (nAw > Room_Max) {
            nRw = ENG_random(Room_Max - Room_Min) + Room_Min;
        } else {
            if (nAw > Room_Min) {
                nRw = ENG_random(nAw - Room_Min) + Room_Min;
            } else {
                nRw = nAw;
            }
        }

        if (nAh > Room_Max) {
            nRh = ENG_random(Room_Max - Room_Min) + Room_Min;
        } else {
            if (nAh > Room_Min) {
                nRh = ENG_random(nAh - Room_Min) + Room_Min;
            } else {
                nRh = nAh;
            }
        }

        if (ForceHW == 1) {
            nRw = nW;
            nRh = nH;
        }

        nRx1 = ENG_random(nX2 - nX1) + nX1;
        nRy1 = ENG_random(nY2 - nY1) + nY1;
        nRx2 = nRx1 + nRw;
        nRy2 = nRy1 + nRh;

        if (nRx2 > nX2) {
            nRx2 = nX2;
            nRx1 = nRx2 - nRw;
        }

        if (nRy2 > nY2) {
            nRy2 = nY2;
            nRy1 = nRy2 - nRh;
        }

        if (nRx1 >= DMAXX - 2) {
            nRx1 = DMAXX - 2;
        }
        if (nRy1 >= DMAXY - 2) {
            nRy1 = DMAXY - 2;
        }
        if (nRx1 <= 1) {
            nRx1 = 1;
        }
        if (nRy1 <= 1) {
            nRy1 = 1;
        }
        if (nRx2 >= DMAXX - 2) {
            nRx2 = DMAXX - 2;
        }
        if (nRy2 >= DMAXY - 2) {
            nRy2 = DMAXY - 2;
        }
        if (nRx2 <= 1) {
            nRx2 = 1;
        }
        if (nRy2 <= 1) {
            nRy2 = 1;
        }

        DefineRoom(nRx1, nRy1, nRx2, nRy2, ForceHW);
        if (ForceHW == 1) {
            nSx1 = nRx1 + 2;
            nSy1 = nRy1 + 2;
            nSx2 = nRx2;
            nSy2 = nRy2;
        }

        nRid = nRoomCnt;
        RoomList[nRid].nRoomDest = nRDest;

        if (nRDest != 0) {
            if (nHDir == 1) {
                nHx1 = ENG_random(nRx2 - nRx1 - 2) + nRx1 + 1;
                nHy1 = nRy1;
                nHx2 = RoomList[nRDest].nRoomx2 - RoomList[nRDest].nRoomx1 - 2;
                nHx2 = ENG_random(nHx2) + RoomList[nRDest].nRoomx1 + 1;
                nHy2 = RoomList[nRDest].nRoomy2;
            }
            if (nHDir == 3) {
                nHx1 = ENG_random(nRx2 - nRx1 - 2) + nRx1 + 1;
                nHy1 = nRy2;
                nHx2 = RoomList[nRDest].nRoomx2 - RoomList[nRDest].nRoomx1 - 2;
                nHx2 = ENG_random(nHx2) + RoomList[nRDest].nRoomx1 + 1;
                nHy2 = RoomList[nRDest].nRoomy1;
            }
            if (nHDir == 2) {
                nHx1 = nRx2;
                nHy1 = ENG_random(nRy2 - nRy1 - 2) + nRy1 + 1;
                nHx2 = RoomList[nRDest].nRoomx1;
                nHy2 = RoomList[nRDest].nRoomy2 - RoomList[nRDest].nRoomy1 - 2;
                nHy2 = ENG_random(nHy2) + RoomList[nRDest].nRoomy1 + 1;
            }
            if (nHDir == 4) {
                nHx1 = nRx1;
                nHy1 = ENG_random(nRy2 - nRy1 - 2) + nRy1 + 1;
                nHx2 = RoomList[nRDest].nRoomx2;
                nHy2 = RoomList[nRDest].nRoomy2 - RoomList[nRDest].nRoomy1 - 2;
                nHy2 = ENG_random(nHy2) + RoomList[nRDest].nRoomy1 + 1;
            }
            AddHall(nHx1, nHy1, nHx2, nHy2, nHDir);
        }

        if (nRh > nRw) {
            CreateRoom(nX1 + 2, nY1 + 2, nRx1 - 2, nRy2 - 2, nRid, 2, 0, 0, 0);
            CreateRoom(nRx2 + 2, nRy1 + 2, nX2 - 2, nY2 - 2, nRid, 4, 0, 0, 0);
            CreateRoom(nX1 + 2, nRy2 + 2, nRx2 - 2, nY2 - 2, nRid, 1, 0, 0, 0);
            CreateRoom(nRx1 + 2, nY1 + 2, nX2 - 2, nRy1 - 2, nRid, 3, 0, 0, 0);
        } else {
            CreateRoom(nX1 + 2, nY1 + 2, nRx2 - 2, nRy1 - 2, nRid, 3, 0, 0, 0);
            CreateRoom(nRx1 + 2, nRy2 + 2, nX2 - 2, nY2 - 2, nRid, 1, 0, 0, 0);
            CreateRoom(nX1 + 2, nRy1 + 2, nRx1 - 2, nY2 - 2, nRid, 2, 0, 0, 0);
            CreateRoom(nRx2 + 2, nY1 + 2, nX2 - 2, nRy2 - 2, nRid, 4, 0, 0, 0);
        }
    }
}

static void GetHall(int *nX1, int *nY1, int *nX2, int *nY2, int *nHd)
{
    struct NODE *p1;

    p1 = pHallList->pNext;
    *nX1 = pHallList->nHallx1;
    *nY1 = pHallList->nHally1;
    *nX2 = pHallList->nHallx2;
    *nY2 = pHallList->nHally2;
    *nHd = pHallList->nHalldir;
    MemFreeDbg(pHallList);
    pHallList = p1;
}

static void ConnectHall(int nX1, int nY1, int nX2, int nY2, int nHd)
{
    unsigned char fDoneflag, fInroom;
    int nCurrd, nDx, nDy, nRp;
    int nOrigX1, nOrigY1;
    int fMinusFlag, fPlusFlag;

    fDoneflag = false;
    fMinusFlag = ENG_random(100);
    fPlusFlag = ENG_random(100);
    nOrigX1 = nX1;
    nOrigY1 = nY1;
    CreateDoorType(nX1, nY1);
    CreateDoorType(nX2, nY2);
    nDx = abs(nX2 - nX1);
    nDy = abs(nY2 - nY1);
    nCurrd = nHd;
    nX2 = nX2 - Dir_Xadd[nCurrd];
    nY2 = nY2 - Dir_Yadd[nCurrd];
    predungeon[nX2][nY2] = 44;
    fInroom = false;

    while (!fDoneflag) {
        if (nX1 >= 38 && nCurrd == 2) {
            nCurrd = 4;
        }
        if (nY1 >= 38 && nCurrd == 3) {
            nCurrd = 1;
        }
        if (nX1 <= 1 && nCurrd == 4) {
            nCurrd = 2;
        }
        if (nY1 <= 1 && nCurrd == 1) {
            nCurrd = 3;
        }
        if (predungeon[nX1][nY1] == 67 && (nCurrd == 1 || nCurrd == 4)) {
            nCurrd = 2;
        }
        if (predungeon[nX1][nY1] == 66 && (nCurrd == 1 || nCurrd == 2)) {
            nCurrd = 3;
        }
        if (predungeon[nX1][nY1] == 69 && (nCurrd == 4 || nCurrd == 3)) {
            nCurrd = 1;
        }
        if (predungeon[nX1][nY1] == 65 && (nCurrd == 2 || nCurrd == 3)) {
            nCurrd = 4;
        }
        nX1 += Dir_Xadd[nCurrd];
        nY1 += Dir_Yadd[nCurrd];
        if (predungeon[nX1][nY1] == 32) {
            if (fInroom) {
                CreateDoorType(nX1 - Dir_Xadd[nCurrd], nY1 - Dir_Yadd[nCurrd]);
            } else {
                if (fMinusFlag < 75) {
                    if (nCurrd == 1 || nCurrd == 3) {
                        PlaceHallExt(nX1 - 1, nY1);
                    } else {
                        PlaceHallExt(nX1, nY1 - 1);
                    }
                }
                if (fPlusFlag < 75) {
                    if (nCurrd == 1 || nCurrd == 3) {
                        PlaceHallExt(nX1 + 1, nY1);
                    } else {
                        PlaceHallExt(nX1, nY1 + 1);
                    }
                }
            }
            predungeon[nX1][nY1] = 44;
            fInroom = false;
        } else {
            if (!fInroom && predungeon[nX1][nY1] == 35) {
                CreateDoorType(nX1, nY1);
            }
            if (predungeon[nX1][nY1] != 44) {
                fInroom = true;
            }
        }
        nDx = abs(nX2 - nX1);
        nDy = abs(nY2 - nY1);
        if (nDx > nDy) {
            nRp = nDx * 2;
            if (nRp > 30) {
                nRp = 30;
            }
            if (ENG_random(100) < nRp) {
                if (nX2 > nX1 && nX1 < DMAXX) {
                    nCurrd = 2;
                } else {
                    nCurrd = 4;
                }
            }
        } else {
            nRp = nDy * 5;
            if (nRp > 80) {
                nRp = 80;
            }
            if (ENG_random(100) < nRp) {
                if (nY2 > nY1 && nY1 < DMAXY) {
                    nCurrd = 3;
                } else {
                    nCurrd = 1;
                }
            }
        }
        if (nDy < 10) {
            if (nX1 == nX2 && (nCurrd == 2 || nCurrd == 4)) {
                if (nY2 > nY1 && nY1 < DMAXY) {
                    nCurrd = 3;
                } else {
                    nCurrd = 1;
                }
            }
        }
        if (nDx < 10) {
            if (nY1 == nY2 && (nCurrd == 1 || nCurrd == 3)) {
                if (nX2 > nX1 && nX1 < DMAXX) {
                    nCurrd = 2;
                } else {
                    nCurrd = 4;
                }
            }
        }
        if (nDy == 1 && nDx > 1 && (nCurrd == 1 || nCurrd == 3)) {
            if (nX2 > nX1 && nX1 < DMAXX) {
                nCurrd = 2;
            } else {
                nCurrd = 4;
            }
        }
        if (nDx == 1 && nDy > 1 && (nCurrd == 2 || nCurrd == 4)) {
            if (nY2 > nY1 && nX1 < DMAXY) {
                nCurrd = 3;
            } else {
                nCurrd = 1;
            }
        }
        if (nDx == 0 && predungeon[nX1][nY1] != 32 && (nCurrd == 2 || nCurrd == 4)) {
            if (nX2 > nOrigX1 && nX1 < DMAXX) {
                nCurrd = 3;
            } else {
                nCurrd = 1;
            }
        }
        if (nDy == 0 && predungeon[nX1][nY1] != 32 && (nCurrd == 1 || nCurrd == 3)) {
            if (nY2 > nOrigY1 && nY1 < DMAXY) {
                nCurrd = 2;
            } else {
                nCurrd = 4;
            }
        }
        if (nX1 == nX2 && nY1 == nY2) {
            fDoneflag = true;
        }
    }
}

static void DoPatternCheck(int i, int j)
{
    int k, l, x, y, nOk;

    for (k = 0; Patterns[k][4] != 255; k++) {
        x = i - 1;
        y = j - 1;
        nOk = 254;
        for (l = 0; l < 9 && nOk == 254; l++) {
            nOk = 255;
            if (l == 3 || l == 6) {
                y++;
                x = i - 1;
            }
            if (x < 0 || x >= DMAXX || y < 0 || y >= DMAXY) {
                nOk = 254;
            } else {
                switch (Patterns[k][l]) {
                case 0:
                    nOk = 254;
                    break;
                case 1:
                    if (predungeon[x][y] == 35) {
                        nOk = 254;
                    }
                    break;
                case 2:
                    if (predungeon[x][y] == 46) {
                        nOk = 254;
                    }
                    break;
                case 4:
                    if (predungeon[x][y] == 32) {
                        nOk = 254;
                    }
                    break;
                case 3:
                    if (predungeon[x][y] == 68) {
                        nOk = 254;
                    }
                    break;
                case 5:
                    if (predungeon[x][y] == 68 || predungeon[x][y] == 46) {
                        nOk = 254;
                    }
                    break;
                case 6:
                    if (predungeon[x][y] == 68 || predungeon[x][y] == 35) {
                        nOk = 254;
                    }
                    break;
                case 7:
                    if (predungeon[x][y] == 32 || predungeon[x][y] == 46) {
                        nOk = 254;
                    }
                    break;
                case 8:
                    if (predungeon[x][y] == 68 || predungeon[x][y] == 35 || predungeon[x][y] == 46) {
                        nOk = 254;
                    }
                    break;
                default:
                    break;
                }
            }
            x++;
        }
        if (nOk == 254) {
            dungeon[i][j] = Patterns[k][9];
        } else {
            nOk = 255;
        }
    }
    myk = k;
}

static void L2TileFix(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 3) {
                dungeon[i][j + 1] = 1;
            }
            if (dungeon[i][j] == 3 && dungeon[i][j + 1] == 1) {
                dungeon[i][j + 1] = 3;
            }
            if (dungeon[i][j] == 3 && dungeon[i + 1][j] == 7) {
                dungeon[i + 1][j] = 3;
            }
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 3) {
                dungeon[i + 1][j] = 2;
            }
            if (dungeon[i][j] == 11 && dungeon[i + 1][j] == 14) {
                dungeon[i + 1][j] = 16;
            }
        }
    }
}

static unsigned char DL2_Cont(unsigned char x1f, unsigned char y1f, unsigned char x2f, unsigned char y2f)
{
    if (x1f && x2f && y1f && y2f) {
        return false;
    }
    if (x1f && x2f && (y1f || y2f)) {
        return true;
    }
    if (y1f && y2f && (x1f || x2f)) {
        return true;
    }

    return false;
}

static int DL2_NumNoChar(void)
{
    int t, ii, jj;

    t = 0;
    for (jj = 0; jj < DMAXY; jj++) {
        for (ii = 0; ii < DMAXX; ii++) {
            if (predungeon[ii][jj] == 32) {
                t++;
            }
        }
    }

    return t;
}

static void DL2_DrawRoom(int x1, int y1, int x2, int y2)
{
    int ii, jj;

    for (jj = y1; jj <= y2; jj++) {
        for (ii = x1; ii <= x2; ii++) {
            predungeon[ii][jj] = 46;
        }
    }
    for (jj = y1; jj <= y2; jj++) {
        predungeon[x1][jj] = 35;
        predungeon[x2][jj] = 35;
    }
    for (ii = x1; ii <= x2; ii++) {
        predungeon[ii][y1] = 35;
        predungeon[ii][y2] = 35;
    }
}

static void DL2_KnockWalls(int x1, int y1, int x2, int y2)
{
    int ii, jj;

    for (ii = x1 + 1; ii < x2; ii++) {
        if (predungeon[ii][y1 - 1] == 46 && predungeon[ii][y1 + 1] == 46) {
            predungeon[ii][y1] = 46;
        }
        if (predungeon[ii][y2 - 1] == 46 && predungeon[ii][y2 + 1] == 46) {
            predungeon[ii][y2] = 46;
        }
        if (predungeon[ii][y1 - 1] == 68) {
            predungeon[ii][y1 - 1] = 46;
        }
        if (predungeon[ii][y2 + 1] == 68) {
            predungeon[ii][y2 + 1] = 46;
        }
    }
    for (jj = y1 + 1; jj < y2; jj++) {
        if (predungeon[x1 - 1][jj] == 46 && predungeon[x1 + 1][jj] == 46) {
            predungeon[x1][jj] = 46;
        }
        if (predungeon[x2 - 1][jj] == 46 && predungeon[x2 + 1][jj] == 46) {
            predungeon[x2][jj] = 46;
        }
        if (predungeon[x1 - 1][jj] == 68) {
            predungeon[x1 - 1][jj] = 46;
        }
        if (predungeon[x2 + 1][jj] == 68) {
            predungeon[x2 + 1][jj] = 46;
        }
    }
}

static unsigned char DL2_FillVoids(void)
{
    int ii, jj, xx, yy, x1, x2, y1, y2;
    unsigned char xf1, xf2, yf1, yf2;
    int to;

    to = 0;
    while (DL2_NumNoChar() > 700 && to < 100) {
        xx = ENG_random(38) + 1;
        yy = ENG_random(38) + 1;
        if (predungeon[xx][yy] != 35) {
            continue;
        }
        xf1 = xf2 = yf1 = yf2 = false;
        if (predungeon[xx - 1][yy] == 32 && predungeon[xx + 1][yy] == 46) {
            if (predungeon[xx + 1][yy - 1] == 46
                && predungeon[xx + 1][yy + 1] == 46
                && predungeon[xx - 1][yy - 1] == 32
                && predungeon[xx - 1][yy + 1] == 32) {
                xf1 = yf1 = yf2 = true;
            }
        } else if (predungeon[xx + 1][yy] == 32 && predungeon[xx - 1][yy] == 46) {
            if (predungeon[xx - 1][yy - 1] == 46
                && predungeon[xx - 1][yy + 1] == 46
                && predungeon[xx + 1][yy - 1] == 32
                && predungeon[xx + 1][yy + 1] == 32) {
                xf2 = yf1 = yf2 = true;
            }
        } else if (predungeon[xx][yy - 1] == 32 && predungeon[xx][yy + 1] == 46) {
            if (predungeon[xx - 1][yy + 1] == 46
                && predungeon[xx + 1][yy + 1] == 46
                && predungeon[xx - 1][yy - 1] == 32
                && predungeon[xx + 1][yy - 1] == 32) {
                yf1 = xf1 = xf2 = true;
            }
        } else if (predungeon[xx][yy + 1] == 32 && predungeon[xx][yy - 1] == 46) {
            if (predungeon[xx - 1][yy - 1] == 46
                && predungeon[xx + 1][yy - 1] == 46
                && predungeon[xx - 1][yy + 1] == 32
                && predungeon[xx + 1][yy + 1] == 32) {
                yf2 = xf1 = xf2 = true;
            }
        }
        if (DL2_Cont(xf1, yf1, xf2, yf2)) {
            if (xf1) {
                x1 = xx - 1;
            } else {
                x1 = xx;
            }
            if (xf2) {
                x2 = xx + 1;
            } else {
                x2 = xx;
            }
            if (yf1) {
                y1 = yy - 1;
            } else {
                y1 = yy;
            }
            if (yf2) {
                y2 = yy + 1;
            } else {
                y2 = yy;
            }
            if (!xf1) {
                while (yf1 || yf2) {
                    if (y1 == 0) {
                        yf1 = false;
                    }
                    if (y2 == DMAXY - 1) {
                        yf2 = false;
                    }
                    if (y2 - y1 >= 14) {
                        yf1 = false;
                        yf2 = false;
                    }
                    if (yf1) {
                        y1--;
                    }
                    if (yf2) {
                        y2++;
                    }
                    if (predungeon[x2][y1] != 32) {
                        yf1 = false;
                    }
                    if (predungeon[x2][y2] != 32) {
                        yf2 = false;
                    }
                }
                y1 += 2;
                y2 -= 2;
                if (y2 - y1 > 5) {
                    while (xf2) {
                        if (x2 == 39) {
                            xf2 = false;
                        }
                        if (x2 - x1 >= 12) {
                            xf2 = false;
                        }
                        for (jj = y1; jj <= y2; jj++) {
                            if (predungeon[x2][jj] != 32) {
                                xf2 = false;
                            }
                        }
                        if (xf2) {
                            x2++;
                        }
                    }
                    x2 -= 2;
                    if (x2 - x1 > 5) {
                        DL2_DrawRoom(x1, y1, x2, y2);
                        DL2_KnockWalls(x1, y1, x2, y2);
                    }
                }
            } else if (!xf2) {
                while (yf1 || yf2) {
                    if (y1 == 0) {
                        yf1 = false;
                    }
                    if (y2 == DMAXY - 1) {
                        yf2 = false;
                    }
                    if (y2 - y1 >= 14) {
                        yf1 = false;
                        yf2 = false;
                    }
                    if (yf1) {
                        y1--;
                    }
                    if (yf2) {
                        y2++;
                    }
                    if (predungeon[x1][y1] != 32) {
                        yf1 = false;
                    }
                    if (predungeon[x1][y2] != 32) {
                        yf2 = false;
                    }
                }
                y1 += 2;
                y2 -= 2;
                if (y2 - y1 > 5) {
                    while (xf1) {
                        if (x1 == 0) {
                            xf1 = false;
                        }
                        if (x2 - x1 >= 12) {
                            xf1 = false;
                        }
                        for (jj = y1; jj <= y2; jj++) {
                            if (predungeon[x1][jj] != 32) {
                                xf1 = false;
                            }
                        }
                        if (xf1) {
                            x1--;
                        }
                    }
                    x1 += 2;
                    if (x2 - x1 > 5) {
                        DL2_DrawRoom(x1, y1, x2, y2);
                        DL2_KnockWalls(x1, y1, x2, y2);
                    }
                }
            } else if (!yf1) {
                while (xf1 || xf2) {
                    if (x1 == 0) {
                        xf1 = false;
                    }
                    if (x2 == DMAXX - 1) {
                        xf2 = false;
                    }
                    if (x2 - x1 >= 14) {
                        xf1 = false;
                        xf2 = false;
                    }
                    if (xf1) {
                        x1--;
                    }
                    if (xf2) {
                        x2++;
                    }
                    if (predungeon[x1][y2] != 32) {
                        xf1 = false;
                    }
                    if (predungeon[x2][y2] != 32) {
                        xf2 = false;
                    }
                }
                x1 += 2;
                x2 -= 2;
                if (x2 - x1 > 5) {
                    while (yf2) {
                        if (y2 == DMAXY - 1) {
                            yf2 = false;
                        }
                        if (y2 - y1 >= 12) {
                            yf2 = false;
                        }
                        for (ii = x1; ii <= x2; ii++) {
                            if (predungeon[ii][y2] != 32) {
                                yf2 = false;
                            }
                        }
                        if (yf2) {
                            y2++;
                        }
                    }
                    y2 -= 2;
                    if (y2 - y1 > 5) {
                        DL2_DrawRoom(x1, y1, x2, y2);
                        DL2_KnockWalls(x1, y1, x2, y2);
                    }
                }
            } else if (!yf2) {
                while (xf1 || xf2) {
                    if (x1 == 0) {
                        xf1 = false;
                    }
                    if (x2 == DMAXX - 1) {
                        xf2 = false;
                    }
                    if (x2 - x1 >= 14) {
                        xf1 = false;
                        xf2 = false;
                    }
                    if (xf1) {
                        x1--;
                    }
                    if (xf2) {
                        x2++;
                    }
                    if (predungeon[x1][y1] != 32) {
                        xf1 = false;
                    }
                    if (predungeon[x2][y1] != 32) {
                        xf2 = false;
                    }
                }
                x1 += 2;
                x2 -= 2;
                if (x2 - x1 > 5) {
                    while (yf1) {
                        if (y1 == 0) {
                            yf1 = false;
                        }
                        if (y2 - y1 >= 12) {
                            yf1 = false;
                        }
                        for (ii = x1; ii <= x2; ii++) {
                            if (predungeon[ii][y1] != 32) {
                                yf1 = false;
                            }
                        }
                        if (yf1) {
                            y1--;
                        }
                    }
                    y1 += 2;
                    if (y2 - y1 > 5) {
                        DL2_DrawRoom(x1, y1, x2, y2);
                        DL2_KnockWalls(x1, y1, x2, y2);
                    }
                }
            }
        }
        to++;
    }

    return DL2_NumNoChar() <= 700;
}

static unsigned char CreateDungeon(void)
{
    int i, j, nHx1, nHy1, nHx2, nHy2, nHd, ForceH, ForceW;
    int ForceHW;

    ForceW = 0;
    ForceH = 0;
    ForceHW = false;

    switch (currlevel) {
    case 5:
        if (quests[Q_BLOOD]._qactive != QUEST_NOTAVAIL) {
            ForceHW = true;
            ForceH = 20;
            ForceW = 14;
        }
        break;
    case 6:
        if (quests[Q_SCHAMB]._qactive != QUEST_NOTAVAIL) {
            ForceHW = true;
            ForceW = 10;
            ForceH = 10;
        }
        break;
    case 7:
        if (quests[Q_BLIND]._qactive != QUEST_NOTAVAIL) {
            ForceHW = true;
            ForceW = 15;
            ForceH = 15;
        }
        break;
    case 8:
        break;
    }

    CreateRoom(2, 2, DMAXX - 1, DMAXY - 1, 0, 0, ForceHW, ForceH, ForceW);

    while (pHallList != 0) {
        GetHall(&nHx1, &nHy1, &nHx2, &nHy2, &nHd);
        ConnectHall(nHx1, nHy1, nHx2, nHy2, nHd);
    }

    for (j = 0; j <= DMAXY; j++) {
        for (i = 0; i <= DMAXX; i++) {
            if (predungeon[i][j] == 67) {
                predungeon[i][j] = 35;
            }
            if (predungeon[i][j] == 66) {
                predungeon[i][j] = 35;
            }
            if (predungeon[i][j] == 69) {
                predungeon[i][j] = 35;
            }
            if (predungeon[i][j] == 65) {
                predungeon[i][j] = 35;
            }
            if (predungeon[i][j] == 44) {
                predungeon[i][j] = 46;
                if (predungeon[i - 1][j - 1] == 32) {
                    predungeon[i - 1][j - 1] = 35;
                }
                if (predungeon[i - 1][j] == 32) {
                    predungeon[i - 1][j] = 35;
                }
                if (predungeon[i - 1][1 + j] == 32) {
                    predungeon[i - 1][1 + j] = 35;
                }
                if (predungeon[i + 1][j - 1] == 32) {
                    predungeon[i + 1][j - 1] = 35;
                }
                if (predungeon[i + 1][j] == 32) {
                    predungeon[i + 1][j] = 35;
                }
                if (predungeon[i + 1][1 + j] == 32) {
                    predungeon[i + 1][1 + j] = 35;
                }
                if (predungeon[i][j - 1] == 32) {
                    predungeon[i][j - 1] = 35;
                }
                if (predungeon[i][j + 1] == 32) {
                    predungeon[i][j + 1] = 35;
                }
            }
        }
    }

    if (!DL2_FillVoids()) {
        return false;
    }

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            DoPatternCheck(i, j);
        }
    }

    return true;
}

static void DRLG_L2Pass3(void)
{
    int i, j, xx, yy;
    long v1, v2, v3, v4, lv;

    lv = 12 - 1;

    v1 = *((short *)&pMegaTiles[lv * 8] + 0) + 1;
    v2 = *((short *)&pMegaTiles[lv * 8] + 1) + 1;
    v3 = *((short *)&pMegaTiles[lv * 8] + 2) + 1;
    v4 = *((short *)&pMegaTiles[lv * 8] + 3) + 1;

    for (yy = 0; yy < 96; yy += 2) {
        for (xx = 0; xx < 96; xx += 2) {
            SetDPiece(xx, yy, v1);
            SetDPiece(xx + 1, yy, v2);
            SetDPiece(xx, yy + 1, v3);
            SetDPiece(xx + 1, yy + 1, v4);
        }
    }

    yy = 16;
    for (j = 0; j < DMAXY; j++) {
        xx = 16;
        for (i = 0; i < DMAXX; i++) {
            lv = dungeon[i][j] - 1;
            v1 = *((short *)&pMegaTiles[lv * 8] + 0) + 1;
            v2 = *((short *)&pMegaTiles[lv * 8] + 1) + 1;
            v3 = *((short *)&pMegaTiles[lv * 8] + 2) + 1;
            v4 = *((short *)&pMegaTiles[lv * 8] + 3) + 1;
            SetDPiece(xx, yy, v1);
            SetDPiece(xx + 1, yy, v2);
            SetDPiece(xx, yy + 1, v3);
            SetDPiece(xx + 1, yy + 1, v4);
            xx += 2;
        }
        yy += 2;
    }
}

static void DRLG_L2FTVR(int i, int j, int x, int y, int d)
{
    if (dung_map[x][y].dTransVal == 0 && dungeon[i][j] == 3) {
        dung_map[x][y].dTransVal = TransVal;
        dung_map[x + 1][y].dTransVal = TransVal;
        dung_map[x][y + 1].dTransVal = TransVal;
        dung_map[x + 1][y + 1].dTransVal = TransVal;
        DRLG_L2FTVR(i + 1, j, x + 2, y, 1);
        DRLG_L2FTVR(i - 1, j, x - 2, y, 2);
        DRLG_L2FTVR(i, j + 1, x, y + 2, 3);
        DRLG_L2FTVR(i, j - 1, x, y - 2, 4);
        DRLG_L2FTVR(i - 1, j - 1, x - 2, y - 2, 5);
        DRLG_L2FTVR(i + 1, j - 1, x + 2, y - 2, 6);
        DRLG_L2FTVR(i - 1, j + 1, x - 2, y + 2, 7);
        DRLG_L2FTVR(i + 1, j + 1, x + 2, y + 2, 8);
    } else {
        if (d == 1) {
            dung_map[x][y].dTransVal = TransVal;
            dung_map[x][y + 1].dTransVal = TransVal;
        }
        if (d == 2) {
            dung_map[x + 1][y].dTransVal = TransVal;
            dung_map[x + 1][y + 1].dTransVal = TransVal;
        }
        if (d == 3) {
            dung_map[x][y].dTransVal = TransVal;
            dung_map[x + 1][y].dTransVal = TransVal;
        }
        if (d == 4) {
            dung_map[x][y + 1].dTransVal = TransVal;
            dung_map[x + 1][y + 1].dTransVal = TransVal;
        }
        if (d == 5) {
            dung_map[x + 1][y + 1].dTransVal = TransVal;
        }
        if (d == 6) {
            dung_map[x][y + 1].dTransVal = TransVal;
        }
        if (d == 7) {
            dung_map[x + 1][y].dTransVal = TransVal;
        }
        if (d == 8) {
            dung_map[x][y].dTransVal = TransVal;
        }
    }
}

static void DRLG_L2FloodTVal(void)
{
    int i, j, xx, yy;

    yy = 16;
    for (j = 0; j < DMAXY; j++) {
        xx = 16;
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 3 && dung_map[xx][yy].dTransVal == 0) {
                DRLG_L2FTVR(i, j, xx, yy, 0);
                TransVal++;
            }
            xx += 2;
        }
        yy += 2;
    }
}

static void DRLG_L2TransFix(void)
{
    int i, j, xx, yy;

    yy = 16;
    for (j = 0; j < DMAXY; j++) {
        xx = 16;
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 14 && dungeon[i][j - 1] == 10) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 11) {
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 10) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 11) {
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 16) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            xx += 2;
        }
        yy += 2;
    }
}

static void L2DirtFix(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 13 && dungeon[i + 1][j] != 11) {
                dungeon[i][j] = 146;
            }
            if (dungeon[i][j] == 11 && dungeon[i + 1][j] != 11) {
                dungeon[i][j] = 144;
            }
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] != 11) {
                dungeon[i][j] = 148;
            }
            if (dungeon[i][j] == 10 && dungeon[i][j + 1] != 10) {
                dungeon[i][j] = 143;
            }
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] != 10) {
                dungeon[i][j] = 146;
            }
            if (dungeon[i][j] == 14 && dungeon[i][j + 1] != 15) {
                dungeon[i][j] = 147;
            }
        }
    }
}

void L2LockoutFix(void)
{
    int i, j;
    unsigned char doorok;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 4 && dungeon[i - 1][j] != 3) {
                dungeon[i][j] = 1;
            }
            if (dungeon[i][j] == 5 && dungeon[i][j - 1] != 3) {
                dungeon[i][j] = 2;
            }
        }
    }
    for (j = 1; j < DMAXY - 1; j++) {
        for (i = 1; i < DMAXX - 1; i++) {
            if (!(mydflags[i + j * DMAXX] & DLRG_PROTECTED)) {
                if ((dungeon[i][j] == 2 || dungeon[i][j] == 5) && dungeon[i][j - 1] == 3 && dungeon[i][j + 1] == 3) {
                    doorok = false;
                    while ((dungeon[i][j] == 2 || dungeon[i][j] == 5) && dungeon[i][j - 1] == 3 && dungeon[i][j + 1] == 3) {
                        if (dungeon[i][j] == 5) {
                            doorok = true;
                        }
                        i++;
                    }
                    if (!doorok && !(mydflags[(i - 1) + j * DMAXX] & DLRG_PROTECTED)) {
                        dungeon[i - 1][j] = 5;
                    }
                }
            }
        }
    }
    for (i = 1; i < DMAXX - 1; i++) {
        for (j = 1; j < DMAXY - 1; j++) {
            if (!(mydflags[i + j * DMAXX] & DLRG_PROTECTED)) {
                if ((dungeon[i][j] == 1 || dungeon[i][j] == 4) && dungeon[i - 1][j] == 3 && dungeon[i + 1][j] == 3) {
                    doorok = false;
                    while ((dungeon[i][j] == 1 || dungeon[i][j] == 4) && dungeon[i - 1][j] == 3 && dungeon[i + 1][j] == 3) {
                        if (dungeon[i][j] == 4) {
                            doorok = true;
                        }
                        j++;
                    }
                    if (!doorok && !(mydflags[i + (j - 1) * DMAXX] & DLRG_PROTECTED)) {
                        dungeon[i][j - 1] = 4;
                    }
                }
            }
        }
    }
}

void L2DoorFix(void)
{
    int i, j;

    for (j = 1; j < DMAXY; j++) {
        for (i = 1; i < DMAXX; i++) {
            if (dungeon[i][j] == 4 && dungeon[i][j - 1] == 3) {
                dungeon[i][j] = 7;
            }
            if (dungeon[i][j] == 5 && dungeon[i - 1][j] == 3) {
                dungeon[i][j] = 9;
            }
        }
    }
}

void DRLG_L2SetWalls(void)
{
    int i, j, xx, yy;
    unsigned short v;

    yy = 16;
    for (j = 0; j < DMAXX; j++) {
        xx = 16;
        for (i = 0; i < DMAXX; i++) {
            v = dungeon[j][i];
            if (v == 3 || v == 12 || v == 0 || v == 0x4C || v == 0x9F || v == 0x32) {
                dung_map[xx][yy].dFlags |= 0x20;
                dung_map[xx + 1][yy].dFlags |= 0x20;
                dung_map[xx][yy + 1].dFlags |= 0x20;
                dung_map[xx + 1][yy + 1].dFlags |= 0x20;
            } else {
                dung_map[xx][yy].dFlags &= ~0x20;
                dung_map[xx + 1][yy].dFlags &= ~0x20;
                dung_map[xx][yy + 1].dFlags &= ~0x20;
                dung_map[xx + 1][yy + 1].dFlags &= ~0x20;
            }
            xx += 2;
        }
        yy += 2;
    }
}

static void DRLG_L2(int entry)
{
    int i, j;
    unsigned char doneflag;

    doneflag = false;
    while (!doneflag) {
        UPDATEPROGRESS(1);
        nRoomCnt = 0;
        InitDungeon();
        DRLG_InitTrans();
        if (!CreateDungeon()) {
            continue;
        }
        L2TileFix();
        if (setloadflag) {
            DRLG_L2SetRoom(nSx1, nSy1);
        }
        DRLG_L2FloodTVal();
        DRLG_L2TransFix();
        if (entry == ENTRY_MAIN) {
            doneflag = DRLG_L2PlaceMiniSet(USTAIRS, 1, 1, -1, -1, true, 0);
            if (doneflag) {
                doneflag = DRLG_L2PlaceMiniSet(DSTAIRS, 1, 1, -1, -1, false, 1);
                if (doneflag && currlevel == 5) {
                    doneflag = DRLG_L2PlaceMiniSet(WARPSTAIRS, 1, 1, -1, -1, false, 6);
                }
            }
            ViewY -= 2;
        } else if (entry == ENTRY_PREV) {
            doneflag = DRLG_L2PlaceMiniSet(USTAIRS, 1, 1, -1, -1, false, 0);
            if (doneflag) {
                doneflag = DRLG_L2PlaceMiniSet(DSTAIRS, 1, 1, -1, -1, true, 1);
                if (doneflag && currlevel == 5) {
                    doneflag = DRLG_L2PlaceMiniSet(WARPSTAIRS, 1, 1, -1, -1, false, 6);
                }
            }
            ViewX--;
        } else {
            doneflag = DRLG_L2PlaceMiniSet(USTAIRS, 1, 1, -1, -1, false, 0);
            if (doneflag) {
                doneflag = DRLG_L2PlaceMiniSet(DSTAIRS, 1, 1, -1, -1, false, 1);
                if (doneflag && currlevel == 5) {
                    doneflag = DRLG_L2PlaceMiniSet(WARPSTAIRS, 1, 1, -1, -1, true, 6);
                }
            }
            ViewY -= 2;
        }
    }

    L2LockoutFix();
    L2DoorFix();
    L2DirtFix();

    DRLG_PlaceThemeRooms(6, 10, 3, 0, 0);
    DRLG_L2PlaceRndSet(CTRDOOR1, 100);
    DRLG_L2PlaceRndSet(CTRDOOR2, 100);
    DRLG_L2PlaceRndSet(CTRDOOR3, 100);
    DRLG_L2PlaceRndSet(CTRDOOR4, 100);
    DRLG_L2PlaceRndSet(CTRDOOR5, 100);
    DRLG_L2PlaceRndSet(CTRDOOR6, 100);
    DRLG_L2PlaceRndSet(CTRDOOR7, 100);
    DRLG_L2PlaceRndSet(CTRDOOR8, 100);
    DRLG_L2PlaceRndSet(VARCH33, 100);
    DRLG_L2PlaceRndSet(VARCH34, 100);
    DRLG_L2PlaceRndSet(VARCH35, 100);
    DRLG_L2PlaceRndSet(VARCH36, 100);
    DRLG_L2PlaceRndSet(VARCH37, 100);
    DRLG_L2PlaceRndSet(VARCH38, 100);
    DRLG_L2PlaceRndSet(VARCH39, 100);
    DRLG_L2PlaceRndSet(VARCH40, 100);
    DRLG_L2PlaceRndSet(VARCH1, 100);
    DRLG_L2PlaceRndSet(VARCH2, 100);
    DRLG_L2PlaceRndSet(VARCH3, 100);
    DRLG_L2PlaceRndSet(VARCH4, 100);
    DRLG_L2PlaceRndSet(VARCH5, 100);
    DRLG_L2PlaceRndSet(VARCH6, 100);
    DRLG_L2PlaceRndSet(VARCH7, 100);
    DRLG_L2PlaceRndSet(VARCH8, 100);
    DRLG_L2PlaceRndSet(VARCH9, 100);
    DRLG_L2PlaceRndSet(VARCH10, 100);
    DRLG_L2PlaceRndSet(VARCH11, 100);
    DRLG_L2PlaceRndSet(VARCH12, 100);
    DRLG_L2PlaceRndSet(VARCH13, 100);
    DRLG_L2PlaceRndSet(VARCH14, 100);
    DRLG_L2PlaceRndSet(VARCH15, 100);
    DRLG_L2PlaceRndSet(VARCH16, 100);
    DRLG_L2PlaceRndSet(VARCH17, 100);
    DRLG_L2PlaceRndSet(VARCH18, 100);
    DRLG_L2PlaceRndSet(VARCH19, 100);
    DRLG_L2PlaceRndSet(VARCH20, 100);
    DRLG_L2PlaceRndSet(VARCH21, 100);
    DRLG_L2PlaceRndSet(VARCH22, 100);
    DRLG_L2PlaceRndSet(VARCH23, 100);
    DRLG_L2PlaceRndSet(VARCH24, 100);
    DRLG_L2PlaceRndSet(VARCH25, 100);
    DRLG_L2PlaceRndSet(VARCH26, 100);
    DRLG_L2PlaceRndSet(VARCH27, 100);
    DRLG_L2PlaceRndSet(VARCH28, 100);
    DRLG_L2PlaceRndSet(VARCH29, 100);
    DRLG_L2PlaceRndSet(VARCH30, 100);
    DRLG_L2PlaceRndSet(VARCH31, 100);
    DRLG_L2PlaceRndSet(VARCH32, 100);
    DRLG_L2PlaceRndSet(HARCH1, 100);
    DRLG_L2PlaceRndSet(HARCH2, 100);
    DRLG_L2PlaceRndSet(HARCH3, 100);
    DRLG_L2PlaceRndSet(HARCH4, 100);
    DRLG_L2PlaceRndSet(HARCH5, 100);
    DRLG_L2PlaceRndSet(HARCH6, 100);
    DRLG_L2PlaceRndSet(HARCH7, 100);
    DRLG_L2PlaceRndSet(HARCH8, 100);
    DRLG_L2PlaceRndSet(HARCH9, 100);
    DRLG_L2PlaceRndSet(HARCH10, 100);
    DRLG_L2PlaceRndSet(HARCH11, 100);
    DRLG_L2PlaceRndSet(HARCH12, 100);
    DRLG_L2PlaceRndSet(HARCH13, 100);
    DRLG_L2PlaceRndSet(HARCH14, 100);
    DRLG_L2PlaceRndSet(HARCH15, 100);
    DRLG_L2PlaceRndSet(HARCH16, 100);
    DRLG_L2PlaceRndSet(HARCH17, 100);
    DRLG_L2PlaceRndSet(HARCH18, 100);
    DRLG_L2PlaceRndSet(HARCH19, 100);
    DRLG_L2PlaceRndSet(HARCH20, 100);
    DRLG_L2PlaceRndSet(HARCH21, 100);
    DRLG_L2PlaceRndSet(HARCH22, 100);
    DRLG_L2PlaceRndSet(HARCH23, 100);
    DRLG_L2PlaceRndSet(HARCH24, 100);
    DRLG_L2PlaceRndSet(HARCH25, 100);
    DRLG_L2PlaceRndSet(HARCH26, 100);
    DRLG_L2PlaceRndSet(HARCH27, 100);
    DRLG_L2PlaceRndSet(HARCH28, 100);
    DRLG_L2PlaceRndSet(HARCH29, 100);
    DRLG_L2PlaceRndSet(HARCH30, 100);
    DRLG_L2PlaceRndSet(HARCH31, 100);
    DRLG_L2PlaceRndSet(HARCH32, 100);
    DRLG_L2PlaceRndSet(HARCH33, 100);
    DRLG_L2PlaceRndSet(HARCH34, 100);
    DRLG_L2PlaceRndSet(HARCH35, 100);
    DRLG_L2PlaceRndSet(HARCH36, 100);
    DRLG_L2PlaceRndSet(HARCH37, 100);
    DRLG_L2PlaceRndSet(HARCH38, 100);
    DRLG_L2PlaceRndSet(HARCH39, 100);
    DRLG_L2PlaceRndSet(HARCH40, 100);
    DRLG_L2PlaceRndSet(CRUSHCOL, 99);
    DRLG_L2PlaceRndSet(RUINS1, 10);
    DRLG_L2PlaceRndSet(RUINS2, 10);
    DRLG_L2PlaceRndSet(RUINS3, 10);
    DRLG_L2PlaceRndSet(RUINS4, 10);
    DRLG_L2PlaceRndSet(RUINS5, 10);
    DRLG_L2PlaceRndSet(RUINS6, 10);
    DRLG_L2PlaceRndSet(RUINS7, 50);
    DRLG_L2PlaceRndSet(PANCREAS1, 1);
    DRLG_L2PlaceRndSet(PANCREAS2, 1);
    DRLG_L2SetWalls();
    DRLG_L2PlaceRndSet(BIG1, 3);
    DRLG_L2PlaceRndSet(BIG2, 3);
    DRLG_L2PlaceRndSet(BIG3, 3);
    DRLG_L2PlaceRndSet(BIG4, 3);
    DRLG_L2PlaceRndSet(BIG5, 3);
    DRLG_L2PlaceRndSet(BIG6, 20);
    DRLG_L2PlaceRndSet(BIG7, 20);
    DRLG_L2PlaceRndSet(BIG8, 3);
    DRLG_L2PlaceRndSet(BIG9, 20);
    DRLG_L2PlaceRndSet(BIG10, 20);
    DRLG_L2Subs();
    DRLG_L2Shadows();

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            pdungeon[i][j] = dungeon[i][j];
        }
    }

    DRLG_Init_Globals();
    DRLG_CheckQuests(nSx1, nSy1);
}

void DRLG_InitL2Vals(void)
{
    /* PSX oracle: empty (0x8-byte jr-ra stub) -- the retail dSpecial[] highlight-frame feature this
     * function implements in devilution is compiled out entirely on this build (LoadL2Dungeon's
     * matching block is likewise absent from its oracle -- see below). */
}

void LoadL2Dungeon(char *sFileName, int vx, int vy)
{
    int i, j, rw, rh;
    unsigned char *pLevelMap, *lm;

    InitDungeon();
    DRLG_InitTrans();
    pLevelMap = GRL_LoadFileInMemSig(sFileName, 0);
    lm = pLevelMap;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            dungeon[i][j] = 12;
            mydflags[i + j * DMAXX] = 0;
        }
    }

    rw = *lm;
    lm += 2;
    rh = *lm;
    lm += 2;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm != 0) {
                dungeon[i][j] = *lm;
                mydflags[i + j * DMAXX] |= DLRG_PROTECTED;
            } else {
                dungeon[i][j] = 3;
            }
            lm += 2;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 0) {
                dungeon[i][j] = 12;
            }
        }
    }

    DRLG_L2Pass3();
    DRLG_Init_Globals();

    ViewX = vx;
    ViewY = vy;
    SetMapMonsters(pLevelMap, 0, 0);
    SetMapObjects(pLevelMap, 0, 0);
    mem_free_dbg(pLevelMap);
}

void LoadPreL2Dungeon(char *sFileName, int vx, int vy)
{
    int i, j, rw, rh;
    unsigned char *pLevelMap, *lm;

    InitDungeon();
    DRLG_InitTrans();
    pLevelMap = GRL_LoadFileInMemSig(sFileName, 0);

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            dungeon[i][j] = 12;
            mydflags[i + j * DMAXX] = 0;
        }
    }

    lm = pLevelMap;
    rw = *lm;
    lm += 2;
    rh = *lm;
    lm += 2;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm != 0) {
                dungeon[i][j] = *lm;
                mydflags[i + j * DMAXX] |= DLRG_PROTECTED;
            } else {
                dungeon[i][j] = 3;
            }
            lm += 2;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 0) {
                dungeon[i][j] = 12;
            }
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            pdungeon[i][j] = dungeon[i][j];
        }
    }

    mem_free_dbg(pLevelMap);
}

void CreateL2Dungeon(unsigned int rseed, int entry)
{
    if (gbMaxPlayers == 1) {
        if (currlevel == 7 && quests[Q_BLIND]._qactive == QUEST_NOTAVAIL) {
            currlevel = 6;
            CreateL2Dungeon(glSeedTbl[6], 4);
            currlevel = 7;
        }
        if (currlevel == 8) {
            if (quests[Q_BLIND]._qactive == QUEST_NOTAVAIL) {
                currlevel = 6;
                CreateL2Dungeon(glSeedTbl[6], 4);
                currlevel = 8;
            } else {
                currlevel = 7;
                CreateL2Dungeon(glSeedTbl[7], 4);
                currlevel = 8;
            }
        }
    }

    SetRndSeed(rseed);

    dminx = 16;
    dminy = 16;
    dmaxx = 96;
    dmaxy = 96;

    DRLG_InitTrans();
    DRLG_InitSetPC();
    DRLG_LoadL2SP();
    DRLG_L2(entry);
    DRLG_L2Pass3();
    DRLG_FreeL2SP();
    DRLG_InitL2Vals();
    DRLG_SetPC();
}
