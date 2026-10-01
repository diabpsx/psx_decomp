/* DRLG_L1.CPP -- Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/DRLG_L1.CPP
 * (also refs/devilution/Source/DRLG_L1.cpp -- PSX predates Hellfire, so this TU's function set matches
 * the pre-Hellfire devilution shape: no crypt/hive variants, no Statues, BrokenWall1-3, FloorRubble,
 * BrokenGrate, NormalGrate decoration passes).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 *
 * PSX deltas vs devilution:
 *  - L5dflags (devilution: static byte L5dflags[DMAXX][DMAXY]) -> shared scratch pointer `mydflags`,
 *    flat-indexed mydflags[i + j*DMAXX] (same shared buffer as DRLG_L2/L4 -- methodology: TU-owned
 *    per-level static array collapsed to one cross-level scratch region).
 *  - `dungeon` (devilution: local BYTE dungeon[DMAXX][DMAXY]) -> the GENDUNG-owned shared
 *    unsigned short dungeon[48][48]; level-gen algorithms still only touch the logical DMAXX x DMAXY
 *    sub-region, but the INIT clear (InitL5Dungeon) clears the full physical 48x48 extent.
 *  - random_(0, n) -> ENG_random(n).
 */
#include "diabpsx_types.h"
#include "source/gen/structs_drlg_l1.h"
#include "source/gen/externs_drlg_l1.h"
#include "source/gen/protos_drlg_l1.h"
#include "source/diablo.h"

#define DMAXX 40
#define DMAXY 40

#define TRUE 1
#define FALSE 0

#define DLRG_PROTECTED 0x80
#define DLRG_CHAMBER   0x40
#define DLRG_HDOOR     0x1
#define DLRG_VDOOR     0x2

#define L5DIR_HORIZ 0
#define L5DIR_VERT  1

/* level-gen scratch (TU-owned, tentative defs so the oracle's gp-rel/absolute placement matches) */
static unsigned char L5dungeon[80][80];   /* only referenced within this TU's algorithm */
static unsigned char HR1;
static unsigned char HR2;
static unsigned char HR3;
static unsigned char VR1;
static unsigned char VR2;
static unsigned char VR3;

void InitL5Dungeon(void)
{
    int i, j;

    for (j = 0; j < 48; j++) {
        for (i = 0; i < 48; i++) {
            dungeon[i][j] = 0;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            mydflags[i + j * DMAXX] = 0;
        }
    }
}

void L5ClearFlags(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            mydflags[i + j * DMAXX] &= ~DLRG_CHAMBER;
        }
    }
}

void L5drawRoom(int x, int y, int w, int h)
{
    int i, j;

    for (j = 0; j < h; j++) {
        for (i = 0; i < w; i++) {
            dungeon[i + x][j + y] = 1;
        }
    }
}

unsigned char L5checkRoom(int x, int y, int width, int height)
{
    int i, j;

    for (j = 0; j < height; j++) {
        for (i = 0; i < width; i++) {
            if (x + i < 0 || x + i >= DMAXX || y + j < 0 || y + j >= DMAXY)
                return FALSE;
            if (dungeon[x + i][y + j])
                return FALSE;
        }
    }

    return TRUE;
}

void L5roomGen(int x, int y, int w, int h, int dir)
{
    int rx, ry, rx2, ry2;
    int height, width;
    int cx1, cy1, cw, ch;
    int num;
    int dirProb;
    int ran;
    unsigned char c, d;

    ran = ENG_random(4);
    if (dir == L5DIR_VERT) {
        if (ran == 0)
            dirProb = L5DIR_HORIZ;
        else
            dirProb = L5DIR_VERT;
    } else {
        if (ran == 0)
            dirProb = L5DIR_VERT;
        else
            dirProb = L5DIR_HORIZ;
    }
    switch (dirProb) {
    case L5DIR_HORIZ:
        num = 0;
        do {
            width = ((ENG_random(5) + 2) >> 1) << 1;
            height = ((ENG_random(5) + 2) >> 1) << 1;
            if (width < 3)
                width = 3;
            if (height < 3)
                height = 3;
            ry = y + (h / 2) - (height / 2);
            rx = x - width;
            cx1 = rx - 1;
            cy1 = ry - 1;
            cw = height + 2;
            ch = width + 1;
            c = L5checkRoom(cx1, cy1, cw, ch);
            num++;
        } while (c == FALSE && num < 20);
        if (c == TRUE)
            L5drawRoom(rx, ry, width, height);

        rx2 = x + w;
        cx1 = rx2;
        cy1 = ry - 1;
        ch = height + 2;
        cw = width + 1;
        d = L5checkRoom(cx1, cy1, cw, ch);
        if (d == TRUE)
            L5drawRoom(rx2, ry, width, height);
        if (c == TRUE)
            L5roomGen(rx, ry, width, height, L5DIR_VERT);
        if (d == TRUE)
            L5roomGen(rx2, ry, width, height, L5DIR_VERT);
        break;

    case L5DIR_VERT:
        num = 0;
        do {
            width = ((ENG_random(5) + 2) >> 1) << 1;
            height = ((ENG_random(5) + 2) >> 1) << 1;
            if (width < 3)
                width = 3;
            if (height < 3)
                height = 3;
            rx = x + (w / 2) - (width / 2);
            ry = y - height;
            cx1 = rx - 1;
            cy1 = ry - 1;
            ch = height + 1;
            cw = width + 2;
            c = L5checkRoom(cx1, cy1, cw, ch);
            num++;
        } while (c == FALSE && num < 20);
        if (c == TRUE)
            L5drawRoom(rx, ry, width, height);

        ry2 = y + h;
        cx1 = rx - 1;
        cy1 = ry2;
        ch = height + 1;
        cw = width + 2;
        d = L5checkRoom(cx1, cy1, cw, ch);
        if (d == TRUE)
            L5drawRoom(rx, ry2, width, height);
        if (c == TRUE)
            L5roomGen(rx, ry, width, height, L5DIR_HORIZ);
        if (d == TRUE)
            L5roomGen(rx, ry2, width, height, L5DIR_HORIZ);
        break;
    }
}

void L5firstRoom(void)
{
    int x, y;
    int xs, xe;
    int ys, ye;

    if (ENG_random(2) == 0) {
        ys = 1;
        ye = DMAXY - 1;

        VR1 = ENG_random(2);
        VR2 = ENG_random(2);
        VR3 = ENG_random(2);

        if (VR1 + VR3 <= 1)
            VR2 = 1;
        if (VR1)
            L5drawRoom(15, 1, 10, 10);
        else
            ys = 18;

        if (VR2)
            L5drawRoom(15, 15, 10, 10);
        if (VR3)
            L5drawRoom(15, 29, 10, 10);
        else
            ye -= 17;

        for (y = ys; y < ye; y++) {
            dungeon[17][y] = 1;
            dungeon[18][y] = 1;
            dungeon[19][y] = 1;
            dungeon[20][y] = 1;
            dungeon[21][y] = 1;
            dungeon[22][y] = 1;
        }

        if (VR1)
            L5roomGen(15, 1, 10, 10, 0);
        if (VR2)
            L5roomGen(15, 15, 10, 10, 0);
        if (VR3)
            L5roomGen(15, 29, 10, 10, 0);

        HR3 = 0;
        HR2 = 0;
        HR1 = 0;
    } else {
        xs = 1;
        xe = DMAXX - 1;

        HR1 = ENG_random(2);
        HR2 = ENG_random(2);
        HR3 = ENG_random(2);

        if (HR1 + HR3 <= 1)
            HR2 = 1;
        if (HR1)
            L5drawRoom(1, 15, 10, 10);
        else
            xs = 18;

        if (HR2)
            L5drawRoom(15, 15, 10, 10);
        if (HR3)
            L5drawRoom(29, 15, 10, 10);
        else
            xe -= 17;

        for (x = xs; x < xe; x++) {
            dungeon[x][17] = 1;
            dungeon[x][18] = 1;
            dungeon[x][19] = 1;
            dungeon[x][20] = 1;
            dungeon[x][21] = 1;
            dungeon[x][22] = 1;
        }

        if (HR1)
            L5roomGen(1, 15, 10, 10, 1);
        if (HR2)
            L5roomGen(15, 15, 10, 10, 1);
        if (HR3)
            L5roomGen(29, 15, 10, 10, 1);

        VR3 = 0;
        VR2 = 0;
        VR1 = 0;
    }
}

long L5GetArea(void)
{
    int i, j;
    long rv;

    rv = 0;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 1)
                rv++;
        }
    }

    return rv;
}

void L5makeDungeon(void)
{
    int i, j;
    int k, l;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            l = j << 1;
            k = i << 1;
            L5dungeon[k][l] = dungeon[i][j];
            L5dungeon[k][l + 1] = dungeon[i][j];
            L5dungeon[k + 1][l] = dungeon[i][j];
            L5dungeon[k + 1][l + 1] = dungeon[i][j];
        }
    }
}

static const unsigned char L5ConvTbl[16] = { 22, 13, 1, 13, 2, 13, 13, 13, 4, 13, 1, 13, 2, 13, 16, 13 };

void L5makeDmt(void)
{
    int i, j;
    int idx;
    int val;
    int dmtx, dmty;

    for (j = 0; j < 47; j++)
        for (i = 0; i < 47; i++)
            dungeon[i][j] = 22;

    dmty = 0;
    for (j = 1; j <= 77; j += 2) {
        dmtx = 0;
        for (i = 1; i <= 77; i += 2) {
            idx = L5dungeon[i][j] + (L5dungeon[i + 1][j] << 1) + (L5dungeon[i][j + 1] << 2) + (L5dungeon[i + 1][j + 1] << 3);

            val = L5ConvTbl[idx];
            dungeon[dmtx][dmty] = val;
            dmtx++;
        }
        dmty++;
    }
}

int L5HWallOk(int i, int j)
{
    int x;
    unsigned char wallok;

    x = 1;
    while (dungeon[i + x][j] == 13 && dungeon[i + x][j - 1] == 13 && dungeon[i + x][j + 1] == 13 && mydflags[(i + x) + j * DMAXX] == 0)
        x++;

    wallok = FALSE;
    if (dungeon[i + x][j] >= 3 && dungeon[i + x][j] <= 7)
        wallok = TRUE;
    if (dungeon[i + x][j] >= 16 && dungeon[i + x][j] <= 24)
        wallok = TRUE;
    if (dungeon[i + x][j] == 22)
        wallok = FALSE;
    if (x == 1)
        wallok = FALSE;

    if (wallok)
        return x;
    else
        return -1;
}

int L5VWallOk(int i, int j)
{
    int y;
    unsigned char wallok;

    y = 1;
    while (dungeon[i][j + y] == 13 && dungeon[i - 1][j + y] == 13 && dungeon[i + 1][j + y] == 13 && mydflags[i + (j + y) * DMAXX] == 0)
        y++;

    wallok = FALSE;
    if (dungeon[i][j + y] >= 3 && dungeon[i][j + y] <= 7)
        wallok = TRUE;
    if (dungeon[i][j + y] >= 16 && dungeon[i][j + y] <= 24)
        wallok = TRUE;
    if (dungeon[i][j + y] == 22)
        wallok = FALSE;
    if (y == 1)
        wallok = FALSE;

    if (wallok)
        return y;
    else
        return -1;
}

void L5HorizWall(int i, int j, char p, int dx)
{
    int xx;
    char wt = 0, dt;

    switch (ENG_random(4)) {
    case 0:
    case 1:
        wt = 2;
        break;
    case 2:
        wt = 12;
        if (p == 2)
            p = 12;
        if (p == 4)
            p = 10;
        break;
    case 3:
        wt = 36;
        if (p == 2)
            p = 36;
        if (p == 4)
            p = 27;
        break;
    }

    if (ENG_random(6) == 5)
        dt = 12;
    else
        dt = 26;
    if (wt == 12)
        dt = 12;

    dungeon[i][j] = p;

    for (xx = 1; xx < dx; xx++) {
        dungeon[i + xx][j] = wt;
    }

    xx = ENG_random(dx - 1) + 1;

    if (dt == 12) {
        dungeon[i + xx][j] = dt;
    } else {
        dungeon[i + xx][j] = 2;
        mydflags[(i + xx) + j * DMAXX] |= DLRG_HDOOR;
    }
}

void L5VertWall(int i, int j, char p, int dy)
{
    int yy;
    char wt = 0, dt;

    switch (ENG_random(4)) {
    case 0:
    case 1:
        wt = 1;
        break;
    case 2:
        wt = 11;
        if (p == 1)
            p = 11;
        if (p == 4)
            p = 14;
        break;
    case 3:
        wt = 35;
        if (p == 1)
            p = 35;
        if (p == 4)
            p = 37;
        break;
    }

    if (ENG_random(6) == 5)
        dt = 11;
    else
        dt = 25;
    if (wt == 11)
        dt = 11;

    dungeon[i][j] = p;

    for (yy = 1; yy < dy; yy++) {
        dungeon[i][j + yy] = wt;
    }

    yy = ENG_random(dy - 1) + 1;

    if (dt == 11) {
        dungeon[i][j + yy] = dt;
    } else {
        dungeon[i][j + yy] = 1;
        mydflags[i + (j + yy) * DMAXX] |= DLRG_VDOOR;
    }
}

void L5AddWall(void)
{
    int i, j, x, y;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (!mydflags[i + j * DMAXX]) {
                if (dungeon[i][j] == 3 && ENG_random(100) < 100) {
                    x = L5HWallOk(i, j);
                    if (x != -1)
                        L5HorizWall(i, j, 2, x);
                }
                if (dungeon[i][j] == 3 && ENG_random(100) < 100) {
                    y = L5VWallOk(i, j);
                    if (y != -1)
                        L5VertWall(i, j, 1, y);
                }
                if (dungeon[i][j] == 6 && ENG_random(100) < 100) {
                    x = L5HWallOk(i, j);
                    if (x != -1)
                        L5HorizWall(i, j, 4, x);
                }
                if (dungeon[i][j] == 7 && ENG_random(100) < 100) {
                    y = L5VWallOk(i, j);
                    if (y != -1)
                        L5VertWall(i, j, 4, y);
                }
                if (dungeon[i][j] == 2 && ENG_random(100) < 100) {
                    x = L5HWallOk(i, j);
                    if (x != -1)
                        L5HorizWall(i, j, 2, x);
                }
                if (dungeon[i][j] == 1 && ENG_random(100) < 100) {
                    y = L5VWallOk(i, j);
                    if (y != -1)
                        L5VertWall(i, j, 1, y);
                }
            }
        }
    }
}

void DRLG_L5GChamber(int sx, int sy, int topflag, int bottomflag, int leftflag, int rightflag)
{
    int i, j;

    if (topflag == TRUE) {
        dungeon[sx + 2][sy] = 12;
        dungeon[sx + 3][sy] = 12;
        dungeon[sx + 4][sy] = 3;
        dungeon[sx + 7][sy] = 9;
        dungeon[sx + 8][sy] = 12;
        dungeon[sx + 9][sy] = 2;
    }
    if (bottomflag == TRUE) {
        sy += 11;
        dungeon[sx + 2][sy] = 10;
        dungeon[sx + 3][sy] = 12;
        dungeon[sx + 4][sy] = 8;
        dungeon[sx + 7][sy] = 5;
        dungeon[sx + 8][sy] = 12;
        if (dungeon[sx + 9][sy] != 4) {
            dungeon[sx + 9][sy] = 21;
        }
        sy -= 11;
    }
    if (leftflag == TRUE) {
        dungeon[sx][sy + 2] = 11;
        dungeon[sx][sy + 3] = 11;
        dungeon[sx][sy + 4] = 3;
        dungeon[sx][sy + 7] = 8;
        dungeon[sx][sy + 8] = 11;
        dungeon[sx][sy + 9] = 1;
    }
    if (rightflag == TRUE) {
        sx += 11;
        dungeon[sx][sy + 2] = 14;
        dungeon[sx][sy + 3] = 11;
        dungeon[sx][sy + 4] = 9;
        dungeon[sx][sy + 7] = 5;
        dungeon[sx][sy + 8] = 11;
        if (dungeon[sx][sy + 9] != 4) {
            dungeon[sx][sy + 9] = 21;
        }
        sx -= 11;
    }

    for (j = 1; j < 11; j++) {
        for (i = 1; i < 11; i++) {
            dungeon[sx + i][sy + j] = 13;
            mydflags[(sx + i) + (sy + j) * DMAXX] |= DLRG_CHAMBER;
        }
    }

    dungeon[sx + 4][sy + 4] = 15;
    dungeon[sx + 7][sy + 4] = 15;
    dungeon[sx + 4][sy + 7] = 15;
    dungeon[sx + 7][sy + 7] = 15;
}

void DRLG_L5GHall(int x1, int y1, int x2, int y2)
{
    int i;

    if (y1 == y2) {
        for (i = x1; i < x2; i++) {
            dungeon[i][y1] = 12;
            dungeon[i][y1 + 3] = 12;
        }
    } else {
        for (i = y1; i < y2; i++) {
            dungeon[x1][i] = 11;
            dungeon[x1 + 3][i] = 11;
        }
    }
}

void L5tileFix(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 22)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 13 && dungeon[i + 1][j] == 22)
                dungeon[i + 1][j] = 18;
            if (dungeon[i][j] == 13 && dungeon[i + 1][j] == 2)
                dungeon[i + 1][j] = 7;
            if (dungeon[i][j] == 6 && dungeon[i + 1][j] == 22)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 22)
                dungeon[i][j + 1] = 24;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 1)
                dungeon[i][j + 1] = 6;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 22)
                dungeon[i][j + 1] = 19;
        }
    }

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 13 && dungeon[i + 1][j] == 19)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 13 && dungeon[i + 1][j] == 22)
                dungeon[i + 1][j] = 20;
            if (dungeon[i][j] == 7 && dungeon[i + 1][j] == 22)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 13 && dungeon[i + 1][j] == 24)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 22)
                dungeon[i + 1][j] = 20;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 19)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 6;
            if (dungeon[i][j] == 7 && dungeon[i + 1][j] == 19)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 6;
            if (dungeon[i][j] == 3 && dungeon[i + 1][j] == 22)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 6;
            if (dungeon[i][j] == 7 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 6;
            if (dungeon[i][j] == 7 && dungeon[i + 1][j] == 24)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 4 && dungeon[i + 1][j] == 16)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 7 && dungeon[i + 1][j] == 13)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 24)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 13)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 23 && dungeon[i - 1][j] == 22)
                dungeon[i - 1][j] = 19;
            if (dungeon[i][j] == 19 && dungeon[i - 1][j] == 23)
                dungeon[i - 1][j] = 21;
            if (dungeon[i][j] == 6 && dungeon[i - 1][j] == 22)
                dungeon[i - 1][j] = 24;
            if (dungeon[i][j] == 6 && dungeon[i - 1][j] == 23)
                dungeon[i - 1][j] = 21;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 7;
            if (dungeon[i][j] == 6 && dungeon[i][j + 1] == 18)
                dungeon[i][j + 1] = 21;
            if (dungeon[i][j] == 18 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 7;
            if (dungeon[i][j] == 6 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 7;
            if (dungeon[i][j] == 21 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 7;
            if (dungeon[i][j] == 6 && dungeon[i][j + 1] == 22)
                dungeon[i][j + 1] = 24;
            if (dungeon[i][j] == 6 && dungeon[i][j + 1] == 13)
                dungeon[i][j + 1] = 16;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 13)
                dungeon[i][j + 1] = 16;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 16)
                dungeon[i][j + 1] = 17;
            if (dungeon[i][j] == 6 && dungeon[i][j - 1] == 22)
                dungeon[i][j - 1] = 7;
            if (dungeon[i][j] == 6 && dungeon[i][j - 1] == 22)
                dungeon[i][j - 1] = 24;
            if (dungeon[i][j] == 7 && dungeon[i][j - 1] == 24)
                dungeon[i][j - 1] = 21;
            if (dungeon[i][j] == 18 && dungeon[i][j - 1] == 24)
                dungeon[i][j - 1] = 21;
        }
    }

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 4 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 7;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 19)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 18 && dungeon[i][j + 1] == 22)
                dungeon[i][j + 1] = 20;
        }
    }
}

static const unsigned char L5BTYPES[206] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
    0, 0, 0, 0, 0, 0, 0,
    25, 26, 0, 28, 0, 30, 31, 0, 0, 0, 0, 0, 0, 0, 0, 40, 41, 42, 43, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    79, 80, 0, 82, 0, 0, 0, 0, 0, 0, 79, 0, 80, 0, 0, 79, 80, 0,
    2, 2, 2, 1, 1, 11, 25, 13, 13, 13,
    1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 2, 12, 0, 0, 11, 1, 11, 1,
    13, 0, 0, 0, 0, 0, 0, 0, 13, 13, 13, 13, 13, 13,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0
};

void DRLG_L5Subs(void)
{
    int x, y, i, rv;
    unsigned char c;

    for (y = 0; y < DMAXY; y++) {
        for (x = 0; x < DMAXX; x++) {
            rv = ENG_random(4);
            if (rv == 0) {
                c = dungeon[x][y];
                c = L5BTYPES[c];
                if (c != 0 && mydflags[x + y * DMAXX] == 0) {
                    rv = ENG_random(16);
                    i = -1;
                    while (rv >= 0) {
                        i++;
                        if (i == sizeof(L5BTYPES))
                            i = 0;
                        if (c == L5BTYPES[i])
                            rv--;
                    }
                    if (i == 89) {
                        c = dungeon[x][y - 1];
                        if (L5BTYPES[c] == 79 && mydflags[x + (y - 1) * DMAXX] == 0) {
                            dungeon[x][y - 1] = 90;
                        } else {
                            i = 79;
                        }
                    }
                    if (i == 91) {
                        c = dungeon[x + 1][y];
                        if (L5BTYPES[c] == 80 && mydflags[(x + 1) + y * DMAXX] == 0) {
                            dungeon[x + 1][y] = 92;
                        } else {
                            i = 80;
                        }
                    }
                    dungeon[x][y] = i;
                }
            }
        }
    }
}

void DRLG_L5SetRoom(int rx1, int ry1)
{
    int rw, rh, i, j;
    unsigned char *sp;

    sp = pSetPiece;
    rw = *sp;
    sp += 2;
    rh = *sp;
    sp += 2;

    setpc_x = rx1;
    setpc_y = ry1;
    setpc_w = rw;
    setpc_h = rh;

    sp = pSetPiece + 4;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*sp) {
                dungeon[rx1 + i][ry1 + j] = *sp;
                mydflags[(rx1 + i) + (ry1 + j) * DMAXX] |= DLRG_PROTECTED;
            } else {
                dungeon[rx1 + i][ry1 + j] = 13;
            }
            sp += 2;
        }
    }
}

void L5FillChambers(void)
{
    int c;

    if (HR1)
        DRLG_L5GChamber(0, 14, 0, 0, 0, 1);

    if (HR2) {
        if (HR1 && !HR3)
            DRLG_L5GChamber(14, 14, 0, 0, 1, 0);
        if (!HR1 && HR3)
            DRLG_L5GChamber(14, 14, 0, 0, 0, 1);
        if (HR1 && HR3)
            DRLG_L5GChamber(14, 14, 0, 0, 1, 1);
        if (!HR1 && !HR3)
            DRLG_L5GChamber(14, 14, 0, 0, 0, 0);
    }

    if (HR3)
        DRLG_L5GChamber(28, 14, 0, 0, 1, 0);
    if (HR1 && HR2)
        DRLG_L5GHall(12, 18, 14, 18);
    if (HR2 && HR3)
        DRLG_L5GHall(26, 18, 28, 18);
    if (HR1 && !HR2 && HR3)
        DRLG_L5GHall(12, 18, 28, 18);
    if (VR1)
        DRLG_L5GChamber(14, 0, 0, 1, 0, 0);

    if (VR2) {
        if (VR1 && !VR3)
            DRLG_L5GChamber(14, 14, 1, 0, 0, 0);
        if (!VR1 && VR3)
            DRLG_L5GChamber(14, 14, 0, 1, 0, 0);
        if (VR1 && VR3)
            DRLG_L5GChamber(14, 14, 1, 1, 0, 0);
        if (!VR1 && !VR3)
            DRLG_L5GChamber(14, 14, 0, 0, 0, 0);
    }

    if (VR3)
        DRLG_L5GChamber(14, 28, 1, 0, 0, 0);
    if (VR1 && VR2)
        DRLG_L5GHall(18, 12, 18, 14);
    if (VR2 && VR3)
        DRLG_L5GHall(18, 26, 18, 28);
    if (VR1 && !VR2 && VR3)
        DRLG_L5GHall(18, 12, 18, 28);

    if (setloadflag) {
        if (!VR1 && !VR2 && !VR3) {
            c = 1;
            if (!HR1 && HR2 && HR3) {
                if (ENG_random(2) != 0)
                    c = 2;
            }
            if (HR1 && HR2 && !HR3) {
                if (ENG_random(2) != 0)
                    c = 0;
            }
            if (HR1 && !HR2 && HR3) {
                if (ENG_random(2) != 0)
                    c = 0;
                else
                    c = 2;
            }
            if (HR1 && HR2 && HR3)
                c = ENG_random(3);

            switch (c) {
            case 0:
                DRLG_L5SetRoom(2, 16);
                break;
            case 1:
                DRLG_L5SetRoom(16, 16);
                break;
            case 2:
                DRLG_L5SetRoom(30, 16);
                break;
            }
        } else {
            c = 1;
            if (!VR1 && VR2 && VR3) {
                if (ENG_random(2) != 0)
                    c = 2;
            }
            if (VR1 && VR2 && !VR3) {
                if (ENG_random(2) != 0)
                    c = 0;
            }
            if (VR1 && !VR2 && VR3) {
                if (ENG_random(2) != 0)
                    c = 0;
                else
                    c = 2;
            }
            if (VR1 && VR2 && VR3)
                c = ENG_random(3);

            switch (c) {
            case 0:
                DRLG_L5SetRoom(16, 2);
                break;
            case 1:
                DRLG_L5SetRoom(16, 16);
                break;
            case 2:
                DRLG_L5SetRoom(16, 30);
                break;
            }
        }
    }
}

void DRLG_L5FTVR(int i, int j, int x, int y, int d)
{
    if (!dung_map[x][y].dTransVal && dungeon[i][j] == 13) {
        dung_map[x][y].dTransVal = TransVal;
        dung_map[x + 1][y].dTransVal = TransVal;
        dung_map[x][y + 1].dTransVal = TransVal;
        dung_map[x + 1][y + 1].dTransVal = TransVal;
        DRLG_L5FTVR(i + 1, j, x + 2, y, 1);
        DRLG_L5FTVR(i - 1, j, x - 2, y, 2);
        DRLG_L5FTVR(i, j + 1, x, y + 2, 3);
        DRLG_L5FTVR(i, j - 1, x, y - 2, 4);
        DRLG_L5FTVR(i - 1, j - 1, x - 2, y - 2, 5);
        DRLG_L5FTVR(i + 1, j - 1, x + 2, y - 2, 6);
        DRLG_L5FTVR(i - 1, j + 1, x - 2, y + 2, 7);
        DRLG_L5FTVR(i + 1, j + 1, x + 2, y + 2, 8);
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
        if (d == 5)
            dung_map[x + 1][y + 1].dTransVal = TransVal;
        if (d == 6)
            dung_map[x][y + 1].dTransVal = TransVal;
        if (d == 7)
            dung_map[x + 1][y].dTransVal = TransVal;
        if (d == 8)
            dung_map[x][y].dTransVal = TransVal;
    }
}

void DRLG_L5FloodTVal(void)
{
    int i, j, xx, yy;

    yy = 16;

    for (j = 0; j < DMAXY; j++) {
        xx = 16;

        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 13 && !dung_map[xx][yy].dTransVal) {
                DRLG_L5FTVR(i, j, xx, yy, 0);
                TransVal++;
            }
            xx += 2;
        }
        yy += 2;
    }
}

void DRLG_L5TransFix(void)
{
    int i, j, xx, yy, v;

    yy = 16;

    for (j = 0; j < DMAXY; j++) {
        xx = 16;

        for (i = 0; i < DMAXX; i++) {
            v = dungeon[i][j];

            if (v == 23 && dungeon[i][j - 1] == 18) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (v == 24 && dungeon[i + 1][j] == 19) {
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (v == 18) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (v == 19) {
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (v == 20) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (v == 24 && dungeon[i][j - 1] == 6) {
                dung_map[xx][yy].dTransVal = dung_map[xx][yy - 2].dTransVal;
            }
            if (v == 6) {
                if (dungeon[i - 1][j] == 2)
                    dung_map[xx][yy].dTransVal = dung_map[xx + 1][yy].dTransVal;
                if (dungeon[i - 1][j] == 37)
                    dung_map[xx][yy].dTransVal = dung_map[xx][yy + 1].dTransVal;
            }
            if (v == 27 && dungeon[i - 1][j] == 2) {
                dung_map[xx][yy].dTransVal = dung_map[xx + 1][yy].dTransVal;
            }
            if (v == 23) {
                if (dungeon[i - 1][j] == 7)
                    dung_map[xx][yy].dTransVal = -1;
                if (dungeon[i - 1][j] == 13)
                    dung_map[xx][yy].dTransVal = dung_map[xx - 1][yy - 1].dTransVal;
            }
            if (v == 7 && dungeon[i - 1][j] == 13) {
                dung_map[xx][yy].dTransVal = -1;
            }
            if (v == 12 && dungeon[i - 1][j] == 2) {
                dung_map[xx][yy].dTransVal = -1;
            }
            if (v == 7 && dungeon[i][j - 1] == 1) {
                dung_map[xx][yy].dTransVal = -1;
            }
            if (v == 21 && dungeon[i][j - 1] == 1) {
                dung_map[xx][yy].dTransVal = -1;
            }
            xx += 2;
        }
        yy += 2;
    }
}

void DRLG_L5DirtFix(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 21) {
                if (dungeon[i][j + 1] == 13)
                    dungeon[i][j] = 7;
            }
            if (dungeon[i][j] == 21) {
                if (dungeon[i + 1][j] != 19)
                    dungeon[i][j] = 202;
            }
            if (dungeon[i][j] == 19) {
                if (dungeon[i + 1][j] != 19)
                    dungeon[i][j] = 200;
            }
            if (dungeon[i][j] == 24) {
                if (dungeon[i + 1][j] != 19)
                    dungeon[i][j] = 205;
            }
            if (dungeon[i][j] == 18) {
                if (dungeon[i][j + 1] != 18)
                    dungeon[i][j] = 199;
            }
            if (dungeon[i][j] == 21) {
                if (dungeon[i][j + 1] != 18)
                    dungeon[i][j] = 202;
            }
            if (dungeon[i][j] == 23) {
                if (dungeon[i][j + 1] != 18)
                    dungeon[i][j] = 204;
            }
        }
    }
}

void DRLG_L5CornerFix(void)
{
    int i, j;

    for (j = 1; j < DMAXY - 1; j++) {
        for (i = 1; i < DMAXX - 1; i++) {
            if (!(mydflags[i + j * DMAXX] & DLRG_PROTECTED) && dungeon[i][j] == 17 && dungeon[i - 1][j] == 13 && dungeon[i][j - 1] == 1) {
                dungeon[i][j] = 16;
                mydflags[i + (j - 1) * DMAXX] &= DLRG_PROTECTED;
            }
            if (dungeon[i][j] == 202 && dungeon[i + 1][j] == 13 && dungeon[i][j + 1] == 1) {
                dungeon[i][j] = 8;
            }
        }
    }
}

void CreateL5Dungeon(unsigned int rseed, int entry)
{
    SetRndSeed(rseed);

    dminx = 16;
    dminy = 16;
    dmaxx = 80;
    dmaxy = 80;

    DRLG_InitTrans();
    DRLG_InitSetPC();
    DRLG_LoadL1SP();
    DRLG_L5(entry);
    DRLG_L1Pass3();
    DRLG_FreeL1SP();
    DRLG_InitL1Vals();
    DRLG_SetPC();
}

void DRLG_PlaceDoor(int x, int y)
{
    unsigned char c;
    unsigned char df;

    if ((mydflags[x + y * DMAXX] & DLRG_PROTECTED) == 0) {
        c = dungeon[x][y];
        df = mydflags[x + y * DMAXX] & 0x7F;

        if (df == 1) {
            if (y != 1 && c == 2)
                dungeon[x][y] = 26;
            if (y != 1 && c == 7)
                dungeon[x][y] = 31;
            if (y != 1 && c == 14)
                dungeon[x][y] = 42;
            if (y != 1 && c == 4)
                dungeon[x][y] = 43;
            if (x != 1 && c == 1)
                dungeon[x][y] = 25;
            if (x != 1 && c == 10)
                dungeon[x][y] = 40;
            if (x != 1 && c == 6)
                dungeon[x][y] = 30;
        }
        if (df == 2) {
            if (x != 1 && c == 1)
                dungeon[x][y] = 25;
            if (x != 1 && c == 6)
                dungeon[x][y] = 30;
            if (x != 1 && c == 10)
                dungeon[x][y] = 40;
            if (x != 1 && c == 4)
                dungeon[x][y] = 41;
            if (y != 1 && c == 2)
                dungeon[x][y] = 26;
            if (y != 1 && c == 14)
                dungeon[x][y] = 42;
            if (y != 1 && c == 7)
                dungeon[x][y] = 31;
        }
        if (df == 3) {
            if (x != 1 && y != 1 && c == 4)
                dungeon[x][y] = 28;
            if (x != 1 && c == 10)
                dungeon[x][y] = 40;
            if (y != 1 && c == 14)
                dungeon[x][y] = 42;
            if (y != 1 && c == 2)
                dungeon[x][y] = 26;
            if (x != 1 && c == 1)
                dungeon[x][y] = 25;
            if (y != 1 && c == 7)
                dungeon[x][y] = 31;
            if (x != 1 && c == 6)
                dungeon[x][y] = 30;
        }
    }

    mydflags[x + y * DMAXX] = DLRG_PROTECTED;
}

#define Q_PWATER 0x0D
#define Q_BUTCHER 6
#define Q_LTBANNER 7

static const unsigned char PWATERIN[] = {
    6, 6,

    13, 13, 13, 13, 13, 13,
    13, 13, 13, 13, 13, 13,
    13, 13, 13, 13, 13, 13,
    13, 13, 13, 13, 13, 13,
    13, 13, 13, 13, 13, 13,
    13, 13, 13, 13, 13, 13,

    0, 0, 0, 0, 0, 0,
    0, 202, 200, 200, 84, 0,
    0, 199, 203, 203, 83, 0,
    0, 85, 206, 80, 81, 0,
    0, 0, 134, 135, 0, 0,
    0, 0, 0, 0, 0, 0
};

int DRLG_PlaceMiniSet(const unsigned char *miniset, int tmin, int tmax, int cx, int cy, int setview, int noquad, int ldir)
{
    int sx, sy;
    int sw, sh;
    int xx, yy;
    int i, ii, numt;
    int found;
    int abort;

    sx = 0;
    sy = 0;
    sw = miniset[0];
    sh = miniset[1];

    if (tmax - tmin == 0)
        numt = 1;
    else
        numt = ENG_random(tmax - tmin) + tmin;

    for (i = 0; i < numt; i++) {
        sx = ENG_random(DMAXX - sw);
        sy = ENG_random(DMAXY - sh);

        found = 0;
        abort = 0;
        while (found == 0) {
            found = 1;
            if (cx != -1 && sx >= cx - sw && sx <= cx + 12) {
                sx++;
                found = 0;
            }
            if (cy != -1 && sy >= cy - sh && sy <= cy + 12) {
                sy++;
                found = 0;
            }

            switch (noquad) {
            case 0:
                if (sx < cx && sy < cy)
                    found = 0;
                break;
            case 1:
                if (sx > cx && sy < cy)
                    found = 0;
                break;
            case 2:
                if (sx < cx && sy > cy)
                    found = 0;
                break;
            case 3:
                if (sx > cx && sy > cy)
                    found = 0;
                break;
            }

            ii = 2;
            for (yy = 0; yy < sh && found == 1; yy++) {
                for (xx = 0; xx < sw && found == 1; xx++) {
                    if (miniset[ii] != 0 && dungeon[sx + xx][sy + yy] != miniset[ii])
                        found = 0;
                    if (mydflags[(sx + xx) + (sy + yy) * DMAXX] != 0)
                        found = 0;
                    ii++;
                }
            }
            if (found == 0) {
                sx++;
                if (sx == DMAXX - sw) {
                    sx = 0;
                    sy++;
                    if (sy == DMAXY - sh)
                        sy = 0;
                }
                abort++;
                if (abort > 4000)
                    return -1;
            }
        }

        ii = sh * sw + 2;

        for (yy = 0; yy < sh; yy++) {
            for (xx = 0; xx < sw; xx++) {
                if (miniset[ii])
                    dungeon[sx + xx][sy + yy] = miniset[ii];
                ii++;
            }
        }
    }

    if (miniset == PWATERIN) {
        i = TransVal;
        TransVal = 0;
        DRLG_MRectTrans(sx, sy + 2, sx + 5, sy + 4);
        TransVal = i;

        quests[Q_PWATER]._qtx = 2 * sx + 21;
        quests[Q_PWATER]._qty = 2 * sy + 22;
    }

    if (setview == TRUE) {
        ViewX = 2 * sx + 19;
        ViewY = 2 * sy + 20;
    }

    if (ldir == 0) {
        LvlViewX = 2 * sx + 19;
        LvlViewY = 2 * sy + 20;
    }

    if (sx < cx && sy < cy)
        return 0;
    if (sx > cx && sy < cy)
        return 1;
    if (sx < cx && sy > cy)
        return 2;
    else
        return 3;
}

void DRLG_L1Floor(void)
{
    int i, j;
    long rv;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (mydflags[i + j * DMAXX] == 0 && dungeon[i][j] == 13) {
                rv = ENG_random(3);

                if (rv == 1)
                    dungeon[i][j] = 162;
                if (rv == 2)
                    dungeon[i][j] = 163;
            }
        }
    }
}

void DRLG_L1Pass3(void)
{
    int i, j, xx, yy;
    long v1, v2, v3, v4, lv;

    lv = 22 - 1;

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

void set_restore_lighting(void)
{
    int x, y;

    for (y = 0; y < 48; y++) {
        for (x = 0; x < 48; x++) {
            dung_map_r[x][y] = restore_r;
            dung_map_g[x][y] = restore_g;
            dung_map_b[x][y] = restore_b;
        }
    }
}

void DRLG_Init_Globals(void)
{
    set_restore_lighting();
}

#define Q_SKELKING 12

void DRLG_LoadL1SP(void)
{
    setloadflag = FALSE;
    if (QuestStatus(Q_BUTCHER)) {
        pSetPiece = GRL_LoadFileInMemSig("rnd6.DUN", 0);
        setloadflag = TRUE;
    }
    if (QuestStatus(Q_SKELKING) && gbMaxPlayers == 1) {
        pSetPiece = GRL_LoadFileInMemSig("SKngDO.DUN", 0);
        setloadflag = TRUE;
    }
    if (QuestStatus(Q_LTBANNER)) {
        pSetPiece = GRL_LoadFileInMemSig("Banner2.DUN", 0);
        setloadflag = TRUE;
    }
}

void DRLG_FreeL1SP(void)
{
    {
        void *p__p = pSetPiece;
        pSetPiece = 0;
        mem_free_dbg(p__p);
    }
}

void DRLG_InitL1Vals(void)
{
}

void LoadL1Dungeon(char *sFileName, int vx, int vy)
{
    int i, j, rw, rh;
    unsigned char *pLevelMap, *lm;

    dminx = 16;
    dminy = 16;
    dmaxx = 80;
    dmaxy = 80;

    DRLG_InitTrans();
    pLevelMap = GRL_LoadFileInMemSig(sFileName, 0);
    lm = pLevelMap;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            dungeon[i][j] = 22;
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
                dungeon[i][j] = 13;
            }
            lm += 2;
        }
    }

    {
        int dummy;
        DRLG_L1Floor();
        ViewX = vx;
        ViewY = vy;
        DRLG_L1Pass3();
        DRLG_Init_Globals();
        DRLG_InitL1Vals();
        SetMapMonsters(pLevelMap, 0, 0);
        SetMapObjects(pLevelMap, 0, 0);
        mem_free_dbg(pLevelMap);
    }
}

void LoadPreL1Dungeon(char *sFileName, int vx, int vy)
{
    int i, j, rw, rh;
    unsigned char *pLevelMap, *lm;

    dminx = 16;
    dminy = 16;
    dmaxx = 80;
    dmaxy = 80;

    pLevelMap = GRL_LoadFileInMemSig(sFileName, 0);
    lm = pLevelMap;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            dungeon[i][j] = 22;
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
                dungeon[i][j] = 13;
            }
            lm += 2;
        }
    }

    DRLG_L1Floor();

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            pdungeon[i][j] = dungeon[i][j];
        }
    }

    {
        int dummy;
        mem_free_dbg(pLevelMap);
    }
}

static const struct ShadowStruct SPATS[37] = {
    { 7, 13, 0, 13, 144, 0, 142 },
    { 16, 13, 0, 13, 144, 0, 142 },
    { 15, 13, 0, 13, 145, 0, 142 },
    { 5, 13, 13, 13, 152, 140, 139 },
    { 5, 13, 1, 13, 143, 146, 139 },
    { 5, 13, 13, 2, 143, 140, 148 },
    { 5, 0, 1, 2, 0, 146, 148 },
    { 5, 13, 11, 13, 143, 147, 139 },
    { 5, 13, 13, 12, 143, 140, 149 },
    { 5, 13, 11, 12, 150, 147, 149 },
    { 5, 13, 1, 12, 143, 146, 149 },
    { 5, 13, 11, 2, 143, 147, 148 },
    { 9, 13, 13, 13, 144, 140, 142 },
    { 9, 13, 1, 13, 144, 146, 142 },
    { 9, 13, 11, 13, 151, 147, 142 },
    { 8, 13, 0, 13, 144, 0, 139 },
    { 8, 13, 0, 12, 143, 0, 149 },
    { 8, 0, 0, 2, 0, 0, 148 },
    { 11, 0, 0, 13, 0, 0, 139 },
    { 11, 13, 0, 13, 139, 0, 139 },
    { 11, 2, 0, 13, 148, 0, 139 },
    { 11, 12, 0, 13, 149, 0, 139 },
    { 11, 13, 11, 12, 139, 0, 149 },
    { 14, 0, 0, 13, 0, 0, 139 },
    { 14, 13, 0, 13, 139, 0, 139 },
    { 14, 2, 0, 13, 148, 0, 139 },
    { 14, 12, 0, 13, 149, 0, 139 },
    { 14, 13, 11, 12, 139, 0, 149 },
    { 10, 0, 13, 0, 0, 140, 0 },
    { 10, 13, 13, 0, 140, 140, 0 },
    { 10, 0, 1, 0, 0, 146, 0 },
    { 10, 13, 11, 0, 140, 147, 0 },
    { 12, 0, 13, 0, 0, 140, 0 },
    { 12, 13, 13, 0, 140, 140, 0 },
    { 12, 0, 1, 0, 0, 146, 0 },
    { 12, 13, 11, 0, 140, 147, 0 },
    { 3, 13, 11, 12, 150, 0, 0 }
};

static const unsigned char BSTYPES[206] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 0, 0,
    0, 0, 0, 0, 0, 1, 2, 10, 4, 5,
    6, 7, 8, 9, 10, 11, 12, 14, 5, 14,
    10, 4, 14, 4, 5, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    2, 3, 4, 1, 6, 7, 16, 17, 2, 1,
    1, 2, 2, 1, 1, 2, 2, 2, 2, 2,
    1, 1, 11, 1, 13, 13, 13, 1, 2, 1,
    2, 1, 2, 1, 2, 2, 2, 2, 12, 0,
    0, 11, 1, 11, 1, 13, 0, 0, 0, 0,
    0, 0, 0, 13, 13, 13, 13, 13, 13, 13,
    13, 13, 13, 13, 13, 13, 1, 11, 2, 12,
    13, 13, 13, 12, 2, 1, 2, 2, 4, 14,
    4, 10, 13, 13, 4, 4, 1, 1, 4, 2,
    2, 13, 13, 13, 13, 25, 26, 28, 30, 31,
    41, 43, 40, 41, 42, 43, 25, 41, 43, 28,
    28, 1, 2, 25, 26, 22, 22, 25, 26, 0,
    0, 0, 0, 0, 0, 0
};

void DRLG_L1Shadows(void)
{
    int x, y, i, patflag;
    unsigned char sd[2][2];
    unsigned char tnv3;

    for (y = 1; y < DMAXY; y++) {
        for (x = 1; x < DMAXX; x++) {
            if (x == 60 && y == 21)
                patflag = TRUE;
            sd[0][0] = BSTYPES[dungeon[x][y]];
            sd[1][0] = BSTYPES[dungeon[x - 1][y]];
            sd[0][1] = BSTYPES[dungeon[x][y - 1]];
            sd[1][1] = BSTYPES[dungeon[x - 1][y - 1]];

            for (i = 0; i < 37; i++) {
                if (SPATS[i].strig == sd[0][0]) {
                    patflag = TRUE;
                    if (SPATS[i].s1 && SPATS[i].s1 != sd[1][1])
                        patflag = FALSE;
                    if (SPATS[i].s2 && SPATS[i].s2 != sd[0][1])
                        patflag = FALSE;
                    if (SPATS[i].s3 && SPATS[i].s3 != sd[1][0])
                        patflag = FALSE;
                    if (patflag == TRUE) {
                        if (SPATS[i].nv1 && !mydflags[(x - 1) + (y - 1) * DMAXX])
                            dungeon[x - 1][y - 1] = SPATS[i].nv1;
                        if (SPATS[i].nv2 && !mydflags[x + (y - 1) * DMAXX])
                            dungeon[x][y - 1] = SPATS[i].nv2;
                        if (SPATS[i].nv3 && !mydflags[(x - 1) + y * DMAXX])
                            dungeon[x - 1][y] = SPATS[i].nv3;
                    }
                }
            }
        }
    }

    for (y = 1; y < DMAXY; y++) {
        for (x = 1; x < DMAXX; x++) {
            if (dungeon[x - 1][y] == 139 && !mydflags[(x - 1) + y * DMAXX]) {
                tnv3 = 139;
                if (dungeon[x][y] == 29)
                    tnv3 = 141;
                if (dungeon[x][y] == 32)
                    tnv3 = 141;
                if (dungeon[x][y] == 35)
                    tnv3 = 141;
                if (dungeon[x][y] == 37)
                    tnv3 = 141;
                if (dungeon[x][y] == 38)
                    tnv3 = 141;
                if (dungeon[x][y] == 39)
                    tnv3 = 141;
                dungeon[x - 1][y] = tnv3;
            }
            if (dungeon[x - 1][y] == 149 && !mydflags[(x - 1) + y * DMAXX]) {
                tnv3 = 149;
                if (dungeon[x][y] == 29)
                    tnv3 = 153;
                if (dungeon[x][y] == 32)
                    tnv3 = 153;
                if (dungeon[x][y] == 35)
                    tnv3 = 153;
                if (dungeon[x][y] == 37)
                    tnv3 = 153;
                if (dungeon[x][y] == 38)
                    tnv3 = 153;
                if (dungeon[x][y] == 39)
                    tnv3 = 153;
                dungeon[x - 1][y] = tnv3;
            }
            if (dungeon[x - 1][y] == 148 && !mydflags[(x - 1) + y * DMAXX]) {
                tnv3 = 148;
                if (dungeon[x][y] == 29)
                    tnv3 = 154;
                if (dungeon[x][y] == 32)
                    tnv3 = 154;
                if (dungeon[x][y] == 35)
                    tnv3 = 154;
                if (dungeon[x][y] == 37)
                    tnv3 = 154;
                if (dungeon[x][y] == 38)
                    tnv3 = 154;
                if (dungeon[x][y] == 39)
                    tnv3 = 154;
                dungeon[x - 1][y] = tnv3;
            }
        }
    }
}

/* PSX-only (no devilution counterpart): marks dung_map.dFlags bit 0x20 wherever the underlying
 * dungeon tile is passable floor/dirt (13/22) at the 2x-scaled dung_map resolution. */
void DRLG_SetWalls(void)
{
    int i, j;
    int yy = 16;

    for (j = 0; j < DMAXY; j++) {
        int xx = 16;
        for (i = 0; i < DMAXX; i++) {
            int v = dungeon[i][j];
            if (v == 13 || v == 22 || v == 0)
                dung_map[xx][yy].dFlags |= 0x20;
            else
                dung_map[xx][yy].dFlags &= ~0x20;
            xx += 2;
        }
        yy += 2;
    }
}

#define ENTRY_MAIN 0
#define ENTRY_PREV 1

static const unsigned char STAIRSUP[] = {
    4, 4,

    13, 13, 13, 13,
    2, 2, 2, 2,
    13, 13, 13, 13,
    13, 13, 13, 13,

    0, 66, 6, 0,
    63, 64, 65, 0,
    0, 67, 68, 0,
    0, 0, 0, 0
};

static const unsigned char L5STAIRSUP[] = {
    4, 4,

    22, 22, 22, 22,
    2, 2, 2, 2,
    13, 13, 13, 13,
    13, 13, 13, 13,

    0, 66, 23, 0,
    63, 64, 65, 0,
    0, 67, 68, 0,
    0, 0, 0, 0
};

static const unsigned char STAIRSDOWN[] = {
    4, 3,

    13, 13, 13, 13,
    13, 13, 13, 13,
    13, 13, 13, 13,

    62, 57, 58, 0,
    61, 59, 60, 0,
    0, 0, 0, 0
};

static const unsigned char LAMPS[] = {
    2, 2,

    13, 0,
    13, 13,

    129, 0,
    130, 128
};

void DRLG_L5(int entry)
{
    long area, minarea;
    unsigned char doneflag;
    int i, j;
    int xx, yy;

    minarea = 0;
    doneflag = FALSE;
    switch (currlevel) {
    case 1:
        minarea = 533;
        break;
    case 2:
        minarea = 693;
        break;
    case 3:
    case 4:
        minarea = 761;
        break;
    }

    while (doneflag == FALSE) {
        UPDATEPROGRESS(1);
        DRLG_InitTrans();

        do {
            InitL5Dungeon();
            L5firstRoom();
            area = L5GetArea();
        } while (area < minarea);

        doneflag = TRUE;
        L5makeDungeon();
        L5makeDmt();
        L5FillChambers();
        L5tileFix();
        L5AddWall();
        L5ClearFlags();
        DRLG_L5FloodTVal();
        DRLG_SetWalls();

        if (QuestStatus(Q_PWATER)) {
            if (entry == ENTRY_MAIN) {
                doneflag = DRLG_PlaceMiniSet(PWATERIN, 1, 1, 0, 0, TRUE, -1, 0) >= 0;
            } else {
                if (DRLG_PlaceMiniSet(PWATERIN, 1, 1, 0, 0, FALSE, -1, 0) < 0)
                    doneflag = FALSE;
                ViewY--;
            }
        }
        if (QuestStatus(Q_LTBANNER)) {
            if (entry == ENTRY_MAIN) {
                if (DRLG_PlaceMiniSet(STAIRSUP, 1, 1, 0, 0, TRUE, -1, 0) < 0)
                    doneflag = FALSE;
            } else {
                if (DRLG_PlaceMiniSet(STAIRSUP, 1, 1, 0, 0, FALSE, -1, 0) < 0)
                    doneflag = FALSE;
                if (entry == ENTRY_PREV) {
                    ViewX = 2 * setpc_x + 20;
                    ViewY = 2 * setpc_y + 28;
                } else {
                    ViewY--;
                }
            }
        } else if (entry == ENTRY_MAIN) {
            if (DRLG_PlaceMiniSet(L5STAIRSUP, 1, 1, 0, 0, TRUE, -1, 0) < 0)
                doneflag = FALSE;
            else if (DRLG_PlaceMiniSet(STAIRSDOWN, 1, 1, 0, 0, FALSE, -1, 1) < 0)
                doneflag = FALSE;
        } else {
            if (DRLG_PlaceMiniSet(L5STAIRSUP, 1, 1, 0, 0, FALSE, -1, 0) < 0)
                doneflag = FALSE;
            else if (DRLG_PlaceMiniSet(STAIRSDOWN, 1, 1, 0, 0, TRUE, -1, 1) < 0)
                doneflag = FALSE;
            ViewY--;
        }
    }

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 64) {
                xx = 2 * i + 16;
                yy = 2 * j + 16;
                DRLG_CopyTrans(xx, yy + 1, xx, yy);
                DRLG_CopyTrans(xx + 1, yy + 1, xx + 1, yy);
            }
        }
    }

    DRLG_L5TransFix();
    DRLG_L5DirtFix();
    DRLG_L5CornerFix();

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (mydflags[i + j * DMAXX] & 0x7F)
                DRLG_PlaceDoor(i, j);
        }
    }

    DRLG_L5Subs();
    DRLG_L1Shadows();
    DRLG_PlaceMiniSet(LAMPS, 5, 10, 0, 0, FALSE, -1, 4);
    DRLG_L1Floor();

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            pdungeon[i][j] = dungeon[i][j];
        }
    }

    DRLG_Init_Globals();
    DRLG_CheckQuests(setpc_x, setpc_y);
}
