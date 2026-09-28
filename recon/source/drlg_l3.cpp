/* DRLG_L3.CPP — Diablo PSX (Climax 1998) reconstruction (PREGAME overlay, splat segment drlg_l3).
 * Twin: refs/devilution/Source/drlg_l3.cpp (Hellfire-only content -- hive/acid/lavapool-alt -- stripped;
 * refs/diablo-hellfire/src/DRLG_L3.CPP consulted for statement spelling on functions shared with L2/L4).
 * PSX deltas: dflags[][] -> flat mydflags[x+y*40]; dTransVal/dFlags via dung_map (DRLG_L3SetWalls only --
 * L3 has NO FTVR/FloodTVal/TransFix/SetRoom/LoadL3SP/FreeL3SP, and no set-piece room); dPiece[][] writes ->
 * SetDPiece(x,y,v) calls; random_(0,n) -> ENG_random(n); L3TITE12/13, L3CREV1-11, L3XTRA1-5 are unnamed
 * main-image data in this build (D_8011BEEC..D_8011BF64) -- content confirmed byte-identical to devilution's
 * named arrays via direct ROM read, so the devilution names are used here for readability. */
#include "diabpsx_types.h"
#include "source/gen/structs_drlg_l3.h"
#include "source/gen/externs_drlg_l3.h"
#include "source/gen/protos_drlg_l3.h"
#include "source/diablo.h"

extern "C" void *memcpy(void *dst, const void *src, unsigned long n);

#define DMAXX 40
#define DMAXY 40

#define DLRG_PROTECTED 0x80
#define Q_ANVIL 10

#define ENTRY_MAIN 0
#define ENTRY_PREV 1

/* TU-owned small data (gp-relative in retail -- confirmed via %gp_rel/D_ scan of the oracle) */
unsigned char lavapool;
int abyssx;   /* set once, never read (retail comment: "Unused") */
int lockoutcnt;
unsigned char lockout[40][40];

/* ---------------------------------------------------------------------------------------------- */

void InitL3Dungeon(void)
{
    int i, j;

    for (i = 0; i < 48; i++) {
        for (j = 0; j < 48; j++) {
            dungeon[j][i] = 0;
        }
    }
    for (i = 0; i < DMAXX; i++) {
        for (j = 0; j < DMAXY; j++) {
            mydflags[j + i * DMAXX] = 0;
        }
    }
}

void SetBlankL3Dungeon(void)
{
    int x, y;

    for (y = 0; y < 47; y++) {
        for (x = 0; x < 47; x++) {
            if (dungeon[x][y] == 0) {
                dungeon[x][y] = 8;
            }
        }
    }
}

void FixL3Dungeon(void)
{
    int x, y;

    for (y = 0; y < 47; y++) {
        for (x = 0; x < 47; x++) {
            if (dungeon[x][y] == 13 && dungeon[x][y - 1] == 9) {
                dungeon[x][y - 1] = 12;
            }
        }
    }
}

int DRLG_L3FillRoom(int x1, int y1, int x2, int y2)
{
    int i, j, v, rf, rv;

    if (x1 > 1 && x2 < 34 && y1 > 1 && y2 < 38) {
        v = 0;
        for (j = y1; j <= y2; j++) {
            for (i = x1; i <= x2; i++) {
                v += dungeon[i][j];
            }
        }
        if (v == 0) {
            for (j = y1 + 1; j < y2; j++) {
                for (i = x1 + 1; i < x2; i++) {
                    dungeon[i][j] = 1;
                }
            }
            for (j = y1; j <= y2; j++) {
                rf = ENG_random(2);
                if (rf != 0) {
                    dungeon[x1][j] = 1;
                }
                rf = ENG_random(2);
                if (rf != 0) {
                    dungeon[x2][j] = 1;
                }
            }
            for (i = x1; i <= x2; i++) {
                rf = ENG_random(2);
                if (rf != 0) {
                    dungeon[i][y1] = 1;
                }
                rf = ENG_random(2);
                if (rf != 0) {
                    dungeon[i][y2] = 1;
                }
            }
            rv = true;
        } else {
            rv = false;
        }
    } else {
        rv = false;
    }
    return rv;
}

void DRLG_L3CreateBlock(int x, int y, int obs, int dir)
{
    int blksizex, blksizey, cbd;
    int x1 = 0, y1 = 0, x2 = 0, y2 = 0;
    int contflag;

    blksizex = ENG_random(2) + 3;
    blksizey = ENG_random(2) + 3;

    if (dir == 0) {
        y2 = y - 1;
        y1 = y2 - blksizey;
        if (blksizex < obs) {
            x1 = ENG_random(blksizex) + x;
        }
        if (blksizex == obs) {
            x1 = x;
        }
        if (blksizex > obs) {
            x1 = x - ENG_random(blksizex);
        }
        x2 = x1 + blksizex;
    }
    if (dir == 3) {
        x2 = x - 1;
        x1 = x2 - blksizex;
        if (blksizey < obs) {
            y1 = ENG_random(blksizey) + y;
        }
        if (blksizey == obs) {
            y1 = y;
        }
        if (blksizey > obs) {
            y1 = y - ENG_random(blksizey);
        }
        y2 = y1 + blksizey;
    }
    if (dir == 2) {
        y1 = y + 1;
        y2 = y1 + blksizey;
        if (blksizex < obs) {
            x1 = ENG_random(blksizex) + x;
        }
        if (blksizex == obs) {
            x1 = x;
        }
        if (blksizex > obs) {
            x1 = x - ENG_random(blksizex);
        }
        x2 = x1 + blksizex;
    }
    if (dir == 1) {
        x1 = x + 1;
        x2 = x1 + blksizex;
        if (blksizey < obs) {
            y1 = ENG_random(blksizey) + y;
        }
        if (blksizey == obs) {
            y1 = y;
        }
        if (blksizey > obs) {
            y1 = y - ENG_random(blksizey);
        }
        y2 = y1 + blksizey;
    }

    contflag = DRLG_L3FillRoom(x1, y1, x2, y2);
    if (contflag == true) {
        cbd = ENG_random(4);
        if (cbd != 0 && dir != 2) {
            DRLG_L3CreateBlock(x1, y1, blksizey, 0);
        }
        if (cbd != 0 && dir != 3) {
            DRLG_L3CreateBlock(x2, y1, blksizex, 1);
        }
        if (cbd != 0 && dir != 0) {
            DRLG_L3CreateBlock(x1, y2, blksizey, 2);
        }
        if (cbd != 0 && dir != 1) {
            DRLG_L3CreateBlock(x1, y1, blksizex, 3);
        }
    }
}

void DRLG_L3FloorArea(int x1, int y1, int x2, int y2)
{
    int i, j;

    for (j = y1; j <= y2; j++) {
        for (i = x1; i <= x2; i++) {
            dungeon[i][j] = 1;
        }
    }
}

void DRLG_L3FillDiags(void)
{
    int i, j, v, rv;

    for (j = 0; j < DMAXY - 1; j++) {
        for (i = 0; i < DMAXX - 1; i++) {
            v = dungeon[i][j] << 3;
            v += dungeon[i + 1][j] << 2;
            v += dungeon[i][j + 1] << 1;
            v += dungeon[i + 1][j + 1];
            if (v == 6) {
                rv = ENG_random(2);
                if (rv == 0) {
                    dungeon[i][j] = 1;
                } else {
                    dungeon[i + 1][j + 1] = 1;
                }
            }
            if (v == 9) {
                rv = ENG_random(2);
                if (rv == 0) {
                    dungeon[i + 1][j] = 1;
                } else {
                    dungeon[i][j + 1] = 1;
                }
            }
        }
    }
}

void DRLG_L3FillSingles(void)
{
    int i, j, v;

    for (j = 1; j < DMAXY - 1; j++) {
        for (i = 1; i < DMAXX - 1; i++) {
            if (dungeon[i][j] == 0) {
                v = dungeon[i - 1][j - 1] + dungeon[i][j - 1] + dungeon[i + 1][j - 1];
                if (v == 3) {
                    v = dungeon[i - 1][j] + dungeon[i + 1][j];
                    if (v == 2) {
                        v = dungeon[i - 1][j + 1] + dungeon[i][j + 1] + dungeon[i + 1][j + 1];
                        if (v == 3) {
                            dungeon[i][j] = 1;
                        }
                    }
                }
            }
        }
    }
}

void DRLG_L3FillStraights(void)
{
    int i, j;
    int xc, xs = 0;
    int yc, ys = 0;
    int k, rv;

    for (j = 0; j < DMAXY - 1; j++) {
        xc = 0;
        for (i = 0; i < 37; i++) {
            if (dungeon[i][j] == 0 && dungeon[i][j + 1] == 1) {
                if (xc == 0) {
                    xs = i;
                }
                xc++;
            } else {
                if (xc > 3 && ENG_random(2)) {
                    for (k = xs; k < i; k++) {
                        rv = ENG_random(2);
                        dungeon[k][j] = rv;
                    }
                }
                xc = 0;
            }
        }
    }
    for (j = 0; j < DMAXY - 1; j++) {
        xc = 0;
        for (i = 0; i < 37; i++) {
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 0) {
                if (xc == 0) {
                    xs = i;
                }
                xc++;
            } else {
                if (xc > 3 && ENG_random(2)) {
                    for (k = xs; k < i; k++) {
                        rv = ENG_random(2);
                        dungeon[k][j + 1] = rv;
                    }
                }
                xc = 0;
            }
        }
    }
    for (i = 0; i < DMAXX - 1; i++) {
        yc = 0;
        for (j = 0; j < 37; j++) {
            if (dungeon[i][j] == 0 && dungeon[i + 1][j] == 1) {
                if (yc == 0) {
                    ys = j;
                }
                yc++;
            } else {
                if (yc > 3 && ENG_random(2)) {
                    for (k = ys; k < j; k++) {
                        rv = ENG_random(2);
                        dungeon[i][k] = rv;
                    }
                }
                yc = 0;
            }
        }
    }
    for (i = 0; i < DMAXX - 1; i++) {
        yc = 0;
        for (j = 0; j < 37; j++) {
            if (dungeon[i][j] == 1 && dungeon[i + 1][j] == 0) {
                if (yc == 0) {
                    ys = j;
                }
                yc++;
            } else {
                if (yc > 3 && ENG_random(2)) {
                    for (k = ys; k < j; k++) {
                        rv = ENG_random(2);
                        dungeon[i + 1][k] = rv;
                    }
                }
                yc = 0;
            }
        }
    }
}

void DRLG_L3Edges(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        dungeon[DMAXX - 1][j] = 0;
    }
    for (i = 0; i < DMAXX; i++) {
        dungeon[i][DMAXY - 1] = 0;
    }
}

int DRLG_L3GetFloorArea(void)
{
    int i, j, gfa;

    gfa = 0;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            gfa += dungeon[i][j];
        }
    }

    return gfa;
}

void DRLG_L3MakeMegas(void)
{
    int i, j, k, v;

    for (j = 0; j < DMAXY - 1; j++) {
        for (i = 0; i < DMAXX - 1; i++) {
            v = dungeon[i][j] << 3;
            v += dungeon[i + 1][j] << 2;
            v += dungeon[i][j + 1] << 1;
            v += dungeon[i + 1][j + 1];
            if (v == 6) {
                k = ENG_random(2);
                if (k == 0) {
                    v = 12;
                } else {
                    v = 5;
                }
            }
            if (v == 9) {
                k = ENG_random(2);
                if (k == 0) {
                    v = 13;
                } else {
                    v = 14;
                }
            }
            dungeon[i][j] = L3ConvTbl[v];
        }
        dungeon[46][j] = 8;
    }
    for (i = 0; i < 47; i++) {
        dungeon[i][DMAXY - 1] = 8;
    }
}

void DRLG_L3River(void)
{
    int rx, ry, px, py, dir, pdir, nodir, nodir2, dircheck;
    int river[3][100];
    int rivercnt, riveramt;
    int i, trys, found, bridge, lpcnt;
    int bail;

    rivercnt = 0;
    bail = false;
    trys = 0;
    pdir = 0;

    while (trys < 200 && rivercnt < 4) {
        bail = false;
        while (!bail && trys < 200) {
            trys++;
            rx = 0;
            ry = 0;
            i = 0;
            while ((dungeon[rx][ry] < 25 || dungeon[rx][ry] > 28) && i < 100) {
                rx = ENG_random(DMAXX);
                ry = ENG_random(DMAXY);
                i++;
                while ((dungeon[rx][ry] < 25 || dungeon[rx][ry] > 28) && ry < DMAXY) {
                    rx++;
                    if (rx >= DMAXX) {
                        rx = 0;
                        ry++;
                    }
                }
            }
            if (i >= 100) {
                return;
            }
            switch (dungeon[rx][ry]) {
            case 25:
                dir = 3;
                nodir = 2;
                river[2][0] = 40;
                break;
            case 26:
                dir = 0;
                nodir = 1;
                river[2][0] = 38;
                break;
            case 27:
                dir = 1;
                nodir = 0;
                river[2][0] = 41;
                break;
            case 28:
                dir = 2;
                nodir = 3;
                river[2][0] = 39;
                break;
            }
            river[0][0] = rx;
            river[1][0] = ry;
            riveramt = 1;
            nodir2 = 4;
            dircheck = 0;
            while (dircheck < 4 && riveramt < 100) {
                px = rx;
                py = ry;
                if (dircheck == 0) {
                    dir = ENG_random(4);
                } else {
                    dir = (dir + 1) & 3;
                }
                dircheck++;
                while (dir == nodir || dir == nodir2) {
                    dir = (dir + 1) & 3;
                    dircheck++;
                }
                if (dir == 0 && ry > 0) {
                    ry--;
                }
                if (dir == 1 && ry < DMAXY) {
                    ry++;
                }
                if (dir == 2 && rx < DMAXX) {
                    rx++;
                }
                if (dir == 3 && rx > 0) {
                    rx--;
                }
                if (dungeon[rx][ry] == 7) {
                    dircheck = 0;
                    if (dir < 2) {
                        river[2][riveramt] = (unsigned char)ENG_random(2) + 17;
                    }
                    if (dir > 1) {
                        river[2][riveramt] = (unsigned char)ENG_random(2) + 15;
                    }
                    river[0][riveramt] = rx;
                    river[1][riveramt] = ry;
                    riveramt++;
                    if ((dir == 0 && pdir == 2) || (dir == 3 && pdir == 1)) {
                        if (riveramt > 2) {
                            river[2][riveramt - 2] = 22;
                        }
                        if (dir == 0) {
                            nodir2 = 1;
                        } else {
                            nodir2 = 2;
                        }
                    }
                    if ((dir == 0 && pdir == 3) || (dir == 2 && pdir == 1)) {
                        if (riveramt > 2) {
                            river[2][riveramt - 2] = 21;
                        }
                        if (dir == 0) {
                            nodir2 = 1;
                        } else {
                            nodir2 = 3;
                        }
                    }
                    if ((dir == 1 && pdir == 2) || (dir == 3 && pdir == 0)) {
                        if (riveramt > 2) {
                            river[2][riveramt - 2] = 20;
                        }
                        if (dir == 1) {
                            nodir2 = 0;
                        } else {
                            nodir2 = 2;
                        }
                    }
                    if ((dir == 1 && pdir == 3) || (dir == 2 && pdir == 0)) {
                        if (riveramt > 2) {
                            river[2][riveramt - 2] = 19;
                        }
                        if (dir == 1) {
                            nodir2 = 0;
                        } else {
                            nodir2 = 3;
                        }
                    }
                    pdir = dir;
                } else {
                    rx = px;
                    ry = py;
                }
            }
            if (dir == 0 && dungeon[rx][ry - 1] == 10 && dungeon[rx][ry - 2] == 8) {
                river[0][riveramt] = rx;
                river[1][riveramt] = ry - 1;
                river[2][riveramt] = 24;
                if (pdir == 2) {
                    river[2][riveramt - 1] = 22;
                }
                if (pdir == 3) {
                    river[2][riveramt - 1] = 21;
                }
                bail = true;
            }
            if (dir == 1 && dungeon[rx][ry + 1] == 2 && dungeon[rx][ry + 2] == 8) {
                river[0][riveramt] = rx;
                river[1][riveramt] = ry + 1;
                river[2][riveramt] = 42;
                if (pdir == 2) {
                    river[2][riveramt - 1] = 20;
                }
                if (pdir == 3) {
                    river[2][riveramt - 1] = 19;
                }
                bail = true;
            }
            if (dir == 2 && dungeon[rx + 1][ry] == 4 && dungeon[rx + 2][ry] == 8) {
                river[0][riveramt] = rx + 1;
                river[1][riveramt] = ry;
                river[2][riveramt] = 43;
                if (pdir == 0) {
                    river[2][riveramt - 1] = 19;
                }
                if (pdir == 1) {
                    river[2][riveramt - 1] = 21;
                }
                bail = true;
            }
            if (dir == 3 && dungeon[rx - 1][ry] == 9 && dungeon[rx - 2][ry] == 8) {
                river[0][riveramt] = rx - 1;
                river[1][riveramt] = ry;
                river[2][riveramt] = 23;
                if (pdir == 0) {
                    river[2][riveramt - 1] = 20;
                }
                if (pdir == 1) {
                    river[2][riveramt - 1] = 22;
                }
                bail = true;
            }
        }
        if (bail == true && riveramt < 7) {
            bail = false;
        }
        if (bail == true) {
            found = 0;
            lpcnt = 0;
            while (found == 0 && lpcnt < 30) {
                lpcnt++;
                bridge = ENG_random(riveramt);
                if ((river[2][bridge] == 15 || river[2][bridge] == 16)
                    && dungeon[river[0][bridge]][river[1][bridge] - 1] == 7
                    && dungeon[river[0][bridge]][river[1][bridge] + 1] == 7) {
                    found = 1;
                }
                if ((river[2][bridge] == 17 || river[2][bridge] == 18)
                    && dungeon[river[0][bridge] - 1][river[1][bridge]] == 7
                    && dungeon[river[0][bridge] + 1][river[1][bridge]] == 7) {
                    found = 2;
                }
                for (i = 0; i < riveramt && found != 0; i++) {
                    if (found == 1
                        && (river[1][bridge] - 1 == river[1][i] || river[1][bridge] + 1 == river[1][i])
                        && river[0][bridge] == river[0][i]) {
                        found = 0;
                    }
                    if (found == 2
                        && (river[0][bridge] - 1 == river[0][i] || river[0][bridge] + 1 == river[0][i])
                        && river[1][bridge] == river[1][i]) {
                        found = 0;
                    }
                }
            }
            if (found != 0) {
                if (found == 1) {
                    river[2][bridge] = 44;
                } else {
                    river[2][bridge] = 45;
                }
                rivercnt++;
                for (bridge = 0; bridge <= riveramt; bridge++) {
                    dungeon[river[0][bridge]][river[1][bridge]] = river[2][bridge];
                }
            } else {
                bail = false;
            }
        }
    }
}

int DRLG_L3SpawnEdge(int x, int y, int *totarea)
{
    unsigned char i;
    static const unsigned char spawntable[] = { 0x00, 0x0a, 0x43, 0x05, 0x2c, 0x06, 0x09, 0x00, 0x00, 0x1c, 0x83, 0x06, 0x09, 0x0a, 0x05 };

    if (*totarea > 40) {
        return true;
    }
    if (x < 0 || y < 0 || x >= DMAXX || y >= DMAXY) {
        return true;
    }
    if (dungeon[x][y] & 0x80) {
        return false;
    }
    if (dungeon[x][y] > 15) {
        return true;
    }

    i = dungeon[x][y];
    dungeon[x][y] |= 0x80;
    *totarea += 1;

    if (spawntable[i] & 8 && DRLG_L3SpawnEdge(x, y - 1, totarea) == true) {
        return true;
    }
    if (spawntable[i] & 4 && DRLG_L3SpawnEdge(x, y + 1, totarea) == true) {
        return true;
    }
    if (spawntable[i] & 2 && DRLG_L3SpawnEdge(x + 1, y, totarea) == true) {
        return true;
    }
    if (spawntable[i] & 1 && DRLG_L3SpawnEdge(x - 1, y, totarea) == true) {
        return true;
    }
    if (spawntable[i] & 0x80 && DRLG_L3Spawn(x, y - 1, totarea) == true) {
        return true;
    }
    if (spawntable[i] & 0x40 && DRLG_L3Spawn(x, y + 1, totarea) == true) {
        return true;
    }
    if (spawntable[i] & 0x20 && DRLG_L3Spawn(x + 1, y, totarea) == true) {
        return true;
    }
    if (spawntable[i] & 0x10 && DRLG_L3Spawn(x - 1, y, totarea) == true) {
        return true;
    }

    return false;
}

int DRLG_L3Spawn(int x, int y, int *totarea)
{
    unsigned char i;
    static const unsigned char spawntable[15] = {0x00, 0x0A, 0x03, 0x05, 0x0C, 0x06, 0x09, 0x00, 0x00, 0x0C, 0x03, 0x06, 0x09, 0x0A, 0x05};

    if (*totarea > 40) {
        return true;
    }
    if (x < 0 || y < 0 || x >= DMAXX || y >= DMAXY) {
        return true;
    }
    if (dungeon[x][y] & 0x80) {
        return false;
    }

    i = dungeon[x][y];
    dungeon[x][y] |= 0x80;
    *totarea += 1;

    if (i != 8) {
        if (spawntable[i] & 8 && DRLG_L3SpawnEdge(x, y - 1, totarea) == true) {
            return true;
        }
        if (spawntable[i] & 4 && DRLG_L3SpawnEdge(x, y + 1, totarea) == true) {
            return true;
        }
        if (spawntable[i] & 2 && DRLG_L3SpawnEdge(x + 1, y, totarea) == true) {
            return true;
        }
        if (spawntable[i] & 1 && DRLG_L3SpawnEdge(x - 1, y, totarea) == true) {
            return true;
        }
    } else {
        if (DRLG_L3Spawn(x + 1, y, totarea) == true) {
            return true;
        }
        if (DRLG_L3Spawn(x - 1, y, totarea) == true) {
            return true;
        }
        if (DRLG_L3Spawn(x, y + 1, totarea) == true) {
            return true;
        }
        if (DRLG_L3Spawn(x, y - 1, totarea) == true) {
            return true;
        }
    }

    return false;
}

void DRLG_L3Pool(void)
{
    int i, j, found;
    int dunx, duny;
    int totarea, poolchance;
    unsigned char k;
    static const unsigned char poolsub[] = { 0, 35, 26, 36, 25, 29, 34, 7, 33, 28, 27, 37, 32, 31, 30 };

    for (duny = 0; duny < DMAXY; duny++) {
        for (dunx = 0; dunx < DMAXX; dunx++) {
            if (dungeon[dunx][duny] == 8) {
                dungeon[dunx][duny] |= 0x80;
                totarea = 1;
                found = 0;

                if (dunx + 1 < DMAXX && found == 0)
                    found = DRLG_L3Spawn(dunx + 1, duny, &totarea);
                else
                    found = 1;
                if (dunx - 1 > 0 && found == 0)
                    found = DRLG_L3Spawn(dunx - 1, duny, &totarea);
                else
                    found = 1;
                if (duny + 1 < DMAXY && found == 0)
                    found = DRLG_L3Spawn(dunx, duny + 1, &totarea);
                else
                    found = 1;
                if (duny - 1 > 0 && found == 0)
                    found = DRLG_L3Spawn(dunx, duny - 1, &totarea);
                else
                    found = 1;

                poolchance = ENG_random(100);
                for (i = duny - totarea; i < duny + totarea; i++) {
                    for (j = dunx - totarea; j < dunx + totarea; j++) {
                        if ((dungeon[j][i] & 0x80) != 0 && i >= 0 && i < DMAXY && j >= 0 && j < DMAXX) {
                            dungeon[j][i] &= 0x7f;

                            if (totarea > 4 && poolchance < 25 && found == 0) {
                                k = poolsub[dungeon[j][i]];
                                if (k != 0 && k <= 37)
                                    dungeon[j][i] = k;
                                lavapool = 1;
                            }
                        }
                    }
                }
            }
        }
    }
}

void DRLG_L3PoolFix(void)
{
    int duny, dunx;
    unsigned short *p0, *p1, *p2;

    for (duny = 0; duny < DMAXY; duny++) {
        for (dunx = 0; dunx < DMAXX; dunx++) {
            p0 = dungeon[dunx - 1];
            p1 = dungeon[dunx];
            p2 = dungeon[dunx + 1];
            if (p1[duny] == 8) {
                if ((p0[duny - 1] >= 25 && p0[duny - 1] <= 41)
                    && (p1[duny - 1] >= 25 && p1[duny - 1] <= 41)
                    && (p2[duny - 1] >= 25 && p2[duny - 1] <= 41)
                    && (p0[duny] >= 25 && p0[duny] <= 41)
                    && (p2[duny] >= 25 && p2[duny] <= 41)
                    && (p0[duny + 1] >= 25 && p0[duny + 1] <= 41)
                    && (p1[duny + 1] >= 25 && p1[duny + 1] <= 41)
                    && (p2[duny + 1] >= 25 && p2[duny + 1] <= 41)) {
                    p1[duny] = 33;
                }
            }
            if (p1[duny] == 8) {
                if ((p0[duny - 1] >= 25 && p0[duny - 1] <= 41)
                    && (p1[duny - 1] >= 25 && p1[duny - 1] <= 41)
                    && (p2[duny - 1] >= 25 && p2[duny - 1] <= 41)
                    && (p0[duny] >= 25 && p0[duny] <= 41)
                    && (p2[duny] >= 25 && p2[duny] <= 41)
                    && (p0[duny + 1] >= 25 && p0[duny + 1] <= 41)
                    && (p1[duny + 1] >= 25 && p1[duny + 1] <= 41)
                    && (p2[duny + 1] >= 25 && p2[duny + 1] <= 41)) {
                    p1[duny] = 33;
                }
            }
        }
    }
}

int DRLG_L3PlaceMiniSet(const unsigned char *miniset, int tmin, int tmax, int cx, int cy, int setview, int ldir)
{
    int sx, sy;
    int sw, sh;
    int xx, yy;
    int i, ii, numt;
    int found, trys;

    sw = miniset[0];
    sh = miniset[1];

    if (tmax - tmin == 0) {
        numt = 1;
    } else {
        numt = ENG_random(tmax - tmin) + tmin;
    }

    for (i = 0; i < numt; i++) {
        sx = ENG_random(DMAXX - sw);
        sy = ENG_random(DMAXY - sh);
        found = false;
        trys = 0;
        while (!found && trys < 200) {
            trys++;
            found = true;
            if (cx != -1 && sx >= cx - sw && sx <= cx + 12) {
                sx = ENG_random(DMAXX - sw);
                sy = ENG_random(DMAXY - sh);
                found = false;
            }
            if (cy != -1 && sy >= cy - sh && sy <= cy + 12) {
                sx = ENG_random(DMAXX - sw);
                sy = ENG_random(DMAXY - sh);
                found = false;
            }
            ii = 2;
            for (yy = 0; yy < sh && found == true; yy++) {
                for (xx = 0; xx < sw && found == true; xx++) {
                    if (miniset[ii] != 0 && dungeon[sx + xx][sy + yy] != miniset[ii]) {
                        found = false;
                    }
                    if (mydflags[(sx + xx) + (sy + yy) * DMAXX] != 0) {
                        found = false;
                    }
                    ii++;
                }
            }
            if (!found) {
                sx++;
                if (sx == DMAXX - sw) {
                    sx = 0;
                    sy++;
                    if (sy == DMAXY - sh) {
                        sy = 0;
                    }
                }
            }
        }
        if (trys >= 200) {
            return true;
        }
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

    if (setview == true) {
        ViewX = 2 * sx + 17;
        ViewY = 2 * sy + 19;
    }
    if (ldir == 0) {
        LvlViewX = 2 * sx + 17;
        LvlViewY = 2 * sy + 19;
    }

    return false;
}

void DRLG_L3PlaceRndSet(const unsigned char *miniset, int rndper)
{
    int sx, sy, sw, sh, xx, yy, ii, kk;
    int found;

    sw = miniset[0];
    sh = miniset[1];

    for (sy = 0; sy < DMAXX - sh; sy++) {
        for (sx = 0; sx < DMAXY - sw; sx++) {
            found = true;
            ii = 2;
            for (yy = 0; yy < sh && found == true; yy++) {
                for (xx = 0; xx < sw && found == true; xx++) {
                    if (miniset[ii] != 0 && dungeon[sx + xx][sy + yy] != miniset[ii]) {
                        found = false;
                    }
                    if (mydflags[(sx + xx) + (sy + yy) * DMAXX] != 0) {
                        found = false;
                    }
                    ii++;
                }
            }
            kk = sh * sw + 2;
            if (miniset[kk] >= 84 && miniset[kk] <= 100 && found == true) {
                if (dungeon[sx - 1][sy] >= 84 && dungeon[sx - 1][sy] <= 100) {
                    found = false;
                }
                if (dungeon[sx + 1][sy] >= 84 && dungeon[sx - 1][sy] <= 100) {
                    found = false;
                }
                if (dungeon[sx][sy + 1] >= 84 && dungeon[sx - 1][sy] <= 100) {
                    found = false;
                }
                if (dungeon[sx][sy - 1] >= 84 && dungeon[sx - 1][sy] <= 100) {
                    found = false;
                }
            }
            if (found == true && ENG_random(100) < rndper) {
                for (yy = 0; yy < sh; yy++) {
                    for (xx = 0; xx < sw; xx++) {
                        if (miniset[kk] != 0) {
                            dungeon[sx + xx][sy + yy] = miniset[kk];
                        }
                        kk++;
                    }
                }
            }
        }
    }
}

unsigned char WoodVertU(int i, int y)
{
    if ((dungeon[i + 1][y] > 152 || dungeon[i + 1][y] < 130)
        && (dungeon[i - 1][y] > 152 || dungeon[i - 1][y] < 130)) {
        if (dungeon[i][y] == 7) {
            return true;
        }
        if (dungeon[i][y] == 10) {
            return true;
        }
        if (dungeon[i][y] == 126) {
            return true;
        }
        if (dungeon[i][y] == 129) {
            return true;
        }
        if (dungeon[i][y] == 134) {
            return true;
        }
        if (dungeon[i][y] == 136) {
            return true;
        }
    }

    return false;
}

unsigned char WoodVertD(int i, int y)
{
    if ((dungeon[i + 1][y] > 152 || dungeon[i + 1][y] < 130)
        && (dungeon[i - 1][y] > 152 || dungeon[i - 1][y] < 130)) {
        if (dungeon[i][y] == 7) {
            return true;
        }
        if (dungeon[i][y] == 2) {
            return true;
        }
        if (dungeon[i][y] == 134) {
            return true;
        }
        if (dungeon[i][y] == 136) {
            return true;
        }
    }

    return false;
}

unsigned char WoodHorizL(int x, int j)
{
    if ((dungeon[x][j + 1] > 152 || dungeon[x][j + 1] < 130)
        && (dungeon[x][j - 1] > 152 || dungeon[x][j - 1] < 130)) {
        if (dungeon[x][j] == 7) {
            return true;
        }
        if (dungeon[x][j] == 9) {
            return true;
        }
        if (dungeon[x][j] == 121) {
            return true;
        }
        if (dungeon[x][j] == 124) {
            return true;
        }
        if (dungeon[x][j] == 135) {
            return true;
        }
        if (dungeon[x][j] == 137) {
            return true;
        }
    }

    return false;
}

unsigned char WoodHorizR(int x, int j)
{
    if ((dungeon[x][j + 1] > 152 || dungeon[x][j + 1] < 130)
        && (dungeon[x][j - 1] > 152 || dungeon[x][j - 1] < 130)) {
        if (dungeon[x][j] == 7) {
            return true;
        }
        if (dungeon[x][j] == 4) {
            return true;
        }
        if (dungeon[x][j] == 135) {
            return true;
        }
        if (dungeon[x][j] == 137) {
            return true;
        }
    }

    return false;
}

void AddFenceDoors(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 7) {
                if (dungeon[i - 1][j] <= 152 && dungeon[i - 1][j] >= 130
                    && dungeon[i + 1][j] <= 152 && dungeon[i + 1][j] >= 130) {
                    dungeon[i][j] = 146;
                    continue;
                }
            }
            if (dungeon[i][j] == 7) {
                if (dungeon[i][j - 1] <= 152 && dungeon[i][j - 1] >= 130
                    && dungeon[i][j + 1] <= 152 && dungeon[i][j + 1] >= 130) {
                    dungeon[i][j] = 147;
                    continue;
                }
            }
        }
    }
}

void FenceDoorFix(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 146) {
                if (dungeon[i + 1][j] > 152 || dungeon[i + 1][j] < 130
                    || dungeon[i - 1][j] > 152 || dungeon[i - 1][j] < 130) {
                    dungeon[i][j] = 7;
                    continue;
                }
            }
            if (dungeon[i][j] == 146) {
                if (dungeon[i + 1][j] != 130 && dungeon[i - 1][j] != 130
                    && dungeon[i + 1][j] != 132 && dungeon[i - 1][j] != 132
                    && dungeon[i + 1][j] != 133 && dungeon[i - 1][j] != 133
                    && dungeon[i + 1][j] != 134 && dungeon[i - 1][j] != 134
                    && dungeon[i + 1][j] != 136 && dungeon[i - 1][j] != 136
                    && dungeon[i + 1][j] != 138 && dungeon[i - 1][j] != 138
                    && dungeon[i + 1][j] != 140 && dungeon[i - 1][j] != 140) {
                    dungeon[i][j] = 7;
                    continue;
                }
            }
            if (dungeon[i][j] == 147) {
                if (dungeon[i][j + 1] > 152 || dungeon[i][j + 1] < 130
                    || dungeon[i][j - 1] > 152 || dungeon[i][j - 1] < 130) {
                    dungeon[i][j] = 7;
                    continue;
                }
            }
            if (dungeon[i][j] == 147) {
                if (dungeon[i][j + 1] != 131 && dungeon[i][j - 1] != 131
                    && dungeon[i][j + 1] != 132 && dungeon[i][j - 1] != 132
                    && dungeon[i][j + 1] != 133 && dungeon[i][j - 1] != 133
                    && dungeon[i][j + 1] != 135 && dungeon[i][j - 1] != 135
                    && dungeon[i][j + 1] != 137 && dungeon[i][j - 1] != 137
                    && dungeon[i][j + 1] != 138 && dungeon[i][j - 1] != 138
                    && dungeon[i][j + 1] != 139 && dungeon[i][j - 1] != 139) {
                    dungeon[i][j] = 7;
                    continue;
                }
            }
        }
    }
}

void DRLG_L3Wood(void)
{
    int i, j;
    int x, y;
    int xx, yy;
    int rt, rp, skip;
    int x1, y1, x2, y2;

    for (j = 0; j < DMAXY - 1; j++) {
        for (i = 0; i < DMAXX - 1; i++) {
            if (dungeon[i][j] == 10 && ENG_random(2) != 0) {
                x = i;
                while (dungeon[x][j] == 10) {
                    x++;
                }
                x--;
                if (x - i > 0) {
                    dungeon[i][j] = 127;
                    for (xx = i + 1; xx < x; xx++) {
                        if (ENG_random(2) != 0) {
                            dungeon[xx][j] = 126;
                        } else {
                            dungeon[xx][j] = 129;
                        }
                    }
                    dungeon[x][j] = 128;
                }
            }
            if (dungeon[i][j] == 9 && ENG_random(2) != 0) {
                y = j;
                while (dungeon[i][y] == 9) {
                    y++;
                }
                y--;
                if (y - j > 0) {
                    dungeon[i][j] = 123;
                    for (yy = j + 1; yy < y; yy++) {
                        if (ENG_random(2) != 0) {
                            dungeon[i][yy] = 121;
                        } else {
                            dungeon[i][yy] = 124;
                        }
                        dungeon[i][y] = 122;
                    }
                }
            }
            if (dungeon[i][j] == 11 && dungeon[i + 1][j] == 10 && dungeon[i][j + 1] == 9 && ENG_random(2) != 0) {
                dungeon[i][j] = 125;
                x = i + 1;
                while (dungeon[x][j] == 10) {
                    x++;
                }
                x--;
                for (xx = i + 1; xx < x; xx++) {
                    if (ENG_random(2) != 0) {
                        dungeon[xx][j] = 126;
                    } else {
                        dungeon[xx][j] = 129;
                    }
                }
                dungeon[x][j] = 128;
                y = j + 1;
                while (dungeon[i][y] == 9) {
                    y++;
                }
                y--;
                for (yy = j + 1; yy < y; yy++) {
                    if (ENG_random(2) != 0) {
                        dungeon[i][yy] = 121;
                    } else {
                        dungeon[i][yy] = 124;
                    }
                }
                dungeon[i][y] = 122;
            }
        }
    }

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 7 && ENG_random(1) == 0 && SkipThemeRoom(i, j)) {
                rt = ENG_random(2);
                if (rt == 0) {
                    y1 = j;
                    while (WoodVertU(i, y1)) {
                        y1--;
                    }
                    y1++;
                    y2 = j;
                    while (WoodVertD(i, y2)) {
                        y2++;
                    }
                    y2--;
                    rp = true;
                    if (dungeon[i][y1] == 7) {
                        rp = false;
                    }
                    if (dungeon[i][y2] == 7) {
                        rp = false;
                    }
                    if (y2 - y1 > 1 && rp) {
                        skip = ENG_random(y2 - y1 - 1) + y1 + 1;
                        for (y = y1; y <= y2; y++) {
                            if (y == skip) {
                                continue;
                            }
                            if (dungeon[i][y] == 7) {
                                if (ENG_random(2) != 0) {
                                    dungeon[i][y] = 135;
                                } else {
                                    dungeon[i][y] = 137;
                                }
                            }
                            if (dungeon[i][y] == 10) {
                                dungeon[i][y] = 131;
                            }
                            if (dungeon[i][y] == 126) {
                                dungeon[i][y] = 133;
                            }
                            if (dungeon[i][y] == 129) {
                                dungeon[i][y] = 133;
                            }
                            if (dungeon[i][y] == 2) {
                                dungeon[i][y] = 139;
                            }
                            if (dungeon[i][y] == 134) {
                                dungeon[i][y] = 138;
                            }
                            if (dungeon[i][y] == 136) {
                                dungeon[i][y] = 138;
                            }
                        }
                    }
                }
                if (rt == 1) {
                    x1 = i;
                    while (WoodHorizL(x1, j)) {
                        x1--;
                    }
                    x1++;
                    x2 = i;
                    while (WoodHorizR(x2, j)) {
                        x2++;
                    }
                    x2--;
                    rp = true;
                    if (dungeon[x1][j] == 7) {
                        rp = false;
                    }
                    if (dungeon[x2][j] == 7) {
                        rp = false;
                    }
                    if (x2 - x1 > 1 && rp) {
                        skip = ENG_random(x2 - x1 - 1) + x1 + 1;
                        for (x = x1; x <= x2; x++) {
                            if (x == skip) {
                                continue;
                            }
                            if (dungeon[x][j] == 7) {
                                if (ENG_random(2) != 0) {
                                    dungeon[x][j] = 134;
                                } else {
                                    dungeon[x][j] = 136;
                                }
                            }
                            if (dungeon[x][j] == 9) {
                                dungeon[x][j] = 130;
                            }
                            if (dungeon[x][j] == 121) {
                                dungeon[x][j] = 132;
                            }
                            if (dungeon[x][j] == 124) {
                                dungeon[x][j] = 132;
                            }
                            if (dungeon[x][j] == 4) {
                                dungeon[x][j] = 140;
                            }
                            if (dungeon[x][j] == 135) {
                                dungeon[x][j] = 138;
                            }
                            if (dungeon[x][j] == 137) {
                                dungeon[x][j] = 138;
                            }
                        }
                    }
                }
            }
        }
    }

    AddFenceDoors();
    FenceDoorFix();
}

int DRLG_L3Anvil(void)
{
    int sx, sy, sw, sh, xx, yy, ii, found;
    int trys;

    sw = L3ANVIL[0];
    sh = L3ANVIL[1];
    sx = ENG_random(DMAXX - sw);
    sy = ENG_random(DMAXY - sh);

    found = false;
    trys = 0;
    while (!found && trys < 200) {
        trys++;
        found = true;
        ii = 2;
        for (yy = 0; yy < sh && found == true; yy++) {
            for (xx = 0; xx < sw && found == true; xx++) {
                if (L3ANVIL[ii] != 0 && dungeon[sx + xx][sy + yy] != L3ANVIL[ii]) {
                    found = false;
                }
                if (mydflags[(sy + yy) * DMAXX + (sx + xx)] != 0) {
                    found = false;
                }
                ii++;
            }
        }
        if (!found) {
            sx++;
            if (sx == DMAXX - sw) {
                sx = 0;
                sy++;
                if (sy == DMAXY - sh) {
                    sy = 0;
                }
            }
        }
    }
    if (trys >= 200) {
        return true;
    }

    ii = sh * sw + 2;
    for (yy = 0; yy < sh; yy++) {
        for (xx = 0; xx < sw; xx++) {
            if (L3ANVIL[ii] != 0) {
                dungeon[sx + xx][sy + yy] = L3ANVIL[ii];
            }
            mydflags[(sy + yy) * DMAXX + (sx + xx)] |= DLRG_PROTECTED;
            ii++;
        }
    }

    setpc_x = sx;
    setpc_y = sy;
    setpc_w = sw;
    setpc_h = sh;

    return false;
}

void FixL3Warp(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 125 && dungeon[i + 1][j] == 125 && dungeon[i][j + 1] == 125 && dungeon[i + 1][j + 1] == 125) {
                dungeon[i][j] = 156;
                dungeon[i + 1][j] = 155;
                dungeon[i][j + 1] = 153;
                dungeon[i + 1][j + 1] = 154;
                return;
            }
            if (dungeon[i][j] == 5 && dungeon[i + 1][j + 1] == 7) {
                dungeon[i][j] = 7;
            }
        }
    }
}

void FixL3HallofHeroes(void)
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 5 && dungeon[i + 1][j + 1] == 7) {
                dungeon[i][j] = 7;
            }
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 5 && dungeon[i + 1][j + 1] == 12 && dungeon[i + 1][j] == 7) {
                dungeon[i][j] = 7;
                dungeon[i][j + 1] = 7;
                dungeon[i + 1][j + 1] = 7;
            }
            if (dungeon[i][j] == 5 && dungeon[i + 1][j + 1] == 12 && dungeon[i][j + 1] == 7) {
                dungeon[i][j] = 7;
                dungeon[i + 1][j] = 7;
                dungeon[i + 1][j + 1] = 7;
            }
        }
    }
}

void DRLG_L3LockRec(int x, int y)
{
    if (!lockout[x][y]) {
        return;
    }

    lockout[x][y] = false;
    lockoutcnt++;
    DRLG_L3LockRec(x, y - 1);
    DRLG_L3LockRec(x, y + 1);
    DRLG_L3LockRec(x - 1, y);
    DRLG_L3LockRec(x + 1, y);
}

unsigned char DRLG_L3Lockout(void)
{
    int i, j, t, fx, fy;

    fx = 0;
    fy = 0;
    t = 0;
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] != 0) {
                lockout[i][j] = true;
                fx = i;
                fy = j;
                t++;
            } else {
                lockout[i][j] = false;
            }
        }
    }

    lockoutcnt = 0;
    DRLG_L3LockRec(fx, fy);

    if (t == lockoutcnt) {
        return true;
    }
    return false;
}

void DRLG_L3SetWalls(void)
{
    int i, j, xx, yy;

    yy = 16;
    for (j = 0; j < DMAXX; j++) {
        xx = 16;
        for (i = 0; i < DMAXX; i++) {
            int v = dungeon[i][j];

            if (v == 0 || v == 7 || v == 8) {
                dung_map[xx][yy].dFlags |= 0x20;
            } else {
                dung_map[xx][yy].dFlags &= ~0x20;
            }
            xx += 2;
        }
        yy += 2;
    }
}

void DRLG_L3(int entry)
{
    int x1, y1, x2, y2, sx1, sy1;
    int i, j;
    int found;
    unsigned char genok;

    lavapool = false;

    UPDATEPROGRESS(1);
    do {
        do {
            do {
                InitL3Dungeon();
                x1 = ENG_random(20) + 10;
                y1 = ENG_random(20) + 10;
                x2 = x1 + 2;
                y2 = y1 + 2;
                DRLG_L3FillRoom(x1, y1, x2, y2);
                DRLG_L3CreateBlock(x1, y1, 2, 0);
                DRLG_L3CreateBlock(x2, y1, 2, 1);
                DRLG_L3CreateBlock(x1, y2, 2, 2);
                DRLG_L3CreateBlock(x1, y1, 2, 3);
                if (QuestStatus(Q_ANVIL)) {
                    sx1 = ENG_random(10) + 10;
                    sy1 = ENG_random(10) + 10;
                    DRLG_L3FloorArea(sx1, sy1, sx1 + 12, sy1 + 12);
                }
                DRLG_L3FillDiags();
                DRLG_L3FillSingles();
                DRLG_L3FillStraights();
                DRLG_L3FillDiags();
                DRLG_L3Edges();
                if (DRLG_L3GetFloorArea() >= 600) {
                    genok = DRLG_L3Lockout();
                } else {
                    genok = false;
                }
            } while (!genok);
            DRLG_L3MakeMegas();
            if (entry == ENTRY_MAIN) {
                found = DRLG_L3PlaceMiniSet(L3UP, 1, 1, -1, -1, true, 0);
                if (!found) {
                    found = DRLG_L3PlaceMiniSet(L3DOWN, 1, 1, -1, -1, false, 1);
                    if (!found && currlevel == 9) {
                        found = DRLG_L3PlaceMiniSet(L3HOLDWARP, 1, 1, -1, -1, false, 6);
                    }
                }
            } else if (entry == ENTRY_PREV) {
                found = DRLG_L3PlaceMiniSet(L3UP, 1, 1, -1, -1, false, 0);
                if (!found) {
                    found = DRLG_L3PlaceMiniSet(L3DOWN, 1, 1, -1, -1, true, 1);
                    ViewX += 2;
                    ViewY -= 2;
                    if (!found && currlevel == 9) {
                        found = DRLG_L3PlaceMiniSet(L3HOLDWARP, 1, 1, -1, -1, false, 6);
                    }
                }
            } else {
                found = DRLG_L3PlaceMiniSet(L3UP, 1, 1, -1, -1, false, 0);
                if (!found) {
                    found = DRLG_L3PlaceMiniSet(L3DOWN, 1, 1, -1, -1, false, 1);
                    if (!found && currlevel == 9) {
                        found = DRLG_L3PlaceMiniSet(L3HOLDWARP, 1, 1, -1, -1, true, 6);
                    }
                }
            }
            if (!found && QuestStatus(Q_ANVIL)) {
                found = DRLG_L3Anvil();
            }
        } while (found == true);
        DRLG_L3Pool();
    } while (!lavapool);

    DRLG_L3PoolFix();
    FixL3Warp();

    DRLG_L3PlaceRndSet(L3ISLE1, 70);
    DRLG_L3PlaceRndSet(L3ISLE2, 70);
    DRLG_L3PlaceRndSet(L3ISLE3, 30);
    DRLG_L3PlaceRndSet(L3ISLE4, 30);
    DRLG_L3PlaceRndSet(L3ISLE1, 100);
    DRLG_L3PlaceRndSet(L3ISLE2, 100);
    DRLG_L3PlaceRndSet(L3ISLE5, 90);

    FixL3HallofHeroes();
    DRLG_L3River();

    if (QuestStatus(Q_ANVIL)) {
        dungeon[setpc_x + 7][setpc_y + 5] = 7;
        dungeon[setpc_x + 8][setpc_y + 5] = 7;
        dungeon[setpc_x + 9][setpc_y + 5] = 7;
        if (dungeon[setpc_x + 10][setpc_y + 5] == 17 || dungeon[setpc_x + 10][setpc_y + 5] == 18) {
            dungeon[setpc_x + 10][setpc_y + 5] = 45;
        }
    }

    DRLG_PlaceThemeRooms(5, 10, 7, 0, 0);

    FixL3Dungeon();
    DRLG_L3Wood();
    DRLG_L3PlaceRndSet(L3TITE1, 10);
    DRLG_L3PlaceRndSet(L3TITE2, 10);
    DRLG_L3PlaceRndSet(L3TITE3, 10);
    DRLG_L3PlaceRndSet(L3TITE7, 20);
    DRLG_L3PlaceRndSet(L3TITE8, 20);
    DRLG_L3PlaceRndSet(L3TITE9, 20);
    DRLG_L3PlaceRndSet(L3TITE10, 20);
    DRLG_L3PlaceRndSet(L3TITE11, 30);
    DRLG_L3PlaceRndSet(L3TITE12, 20);
    DRLG_L3PlaceRndSet(L3TITE13, 20);
    DRLG_L3PlaceRndSet(L3CREV1, 30);
    DRLG_L3PlaceRndSet(L3CREV2, 30);
    DRLG_L3PlaceRndSet(L3CREV3, 30);
    DRLG_L3PlaceRndSet(L3CREV4, 30);
    DRLG_L3PlaceRndSet(L3CREV5, 30);
    DRLG_L3PlaceRndSet(L3CREV6, 30);
    DRLG_L3PlaceRndSet(L3CREV7, 30);
    DRLG_L3PlaceRndSet(L3CREV8, 30);
    DRLG_L3PlaceRndSet(L3CREV9, 30);
    DRLG_L3PlaceRndSet(L3CREV10, 30);
    DRLG_L3PlaceRndSet(L3CREV11, 30);
    DRLG_L3PlaceRndSet(L3XTRA1, 25);
    DRLG_L3PlaceRndSet(L3XTRA2, 25);
    DRLG_L3PlaceRndSet(L3XTRA3, 25);
    DRLG_L3PlaceRndSet(L3XTRA4, 25);
    DRLG_L3PlaceRndSet(L3XTRA5, 25);

    DRLG_L3SetWalls();
    SetBlankL3Dungeon();

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            pdungeon[i][j] = dungeon[i][j];
        }
    }

    DRLG_Init_Globals();
}

void DRLG_L3Pass3(void)
{
    int i, j, xx, yy;
    long v1, v2, v3, v4, lv;

    lv = 8 - 1;

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
            if (lv >= 0) {
                v1 = *((short *)&pMegaTiles[lv * 8] + 0) + 1;
                v2 = *((short *)&pMegaTiles[lv * 8] + 1) + 1;
                v3 = *((short *)&pMegaTiles[lv * 8] + 2) + 1;
                v4 = *((short *)&pMegaTiles[lv * 8] + 3) + 1;
            } else {
                v1 = 0;
                v2 = 0;
                v3 = 0;
                v4 = 0;
            }
            SetDPiece(xx, yy, v1);
            SetDPiece(xx + 1, yy, v2);
            SetDPiece(xx, yy + 1, v3);
            SetDPiece(xx + 1, yy + 1, v4);
            xx += 2;
        }
        yy += 2;
    }
}

void CreateL3Dungeon(unsigned int rseed, int entry)
{
    SetRndSeed(rseed);
    dminx = 16;
    dminy = 16;
    dmaxx = 80;
    dmaxy = 80;
    DRLG_InitTrans();
    DRLG_InitSetPC();
    DRLG_L3(entry);
    DRLG_L3Pass3();
    DRLG_SetPC();
}

void LoadL3Dungeon(char *sFileName, int vx, int vy)
{
    int i, j, rw, rh;
    unsigned char *pLevelMap, *lm;

    InitL3Dungeon();
    dminx = 16;
    dminy = 16;
    dmaxx = 80;
    dmaxy = 80;
    DRLG_InitTrans();
    pLevelMap = GRL_LoadFileInMemSig(sFileName, 0);

    lm = pLevelMap;
    rw = *lm;
    lm += 2;
    rh = *lm;
    lm += 2;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm != 0) {
                dungeon[i][j] = *lm;
            } else {
                dungeon[i][j] = 7;
            }
            lm += 2;
        }
    }
    for (j = 0; j < 47; j++) {
        for (i = 0; i < 47; i++) {
            if (dungeon[i][j] == 0) {
                dungeon[i][j] = 8;
            }
        }
    }

    abyssx = 96;
    DRLG_L3Pass3();
    DRLG_Init_Globals();
    ViewX = 31;
    ViewY = 83;
    SetMapMonsters(pLevelMap, 0, 0);
    SetMapObjects(pLevelMap, 0, 0);

    MemFreeDbg(pLevelMap);
}

void LoadPreL3Dungeon(char *sFileName, int vx, int vy)
{
    int i, j, rw, rh;
    unsigned char *pLevelMap, *lm;

    InitL3Dungeon();
    DRLG_InitTrans();
    pLevelMap = GRL_LoadFileInMemSig(sFileName, 0);

    lm = pLevelMap;
    rw = *lm;
    lm += 2;
    rh = *lm;
    lm += 2;

    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*lm != 0) {
                dungeon[i][j] = *lm;
            } else {
                dungeon[i][j] = 7;
            }
            lm += 2;
        }
    }
    for (j = 0; j < 47; j++) {
        for (i = 0; i < 47; i++) {
            if (dungeon[i][j] == 0) {
                dungeon[i][j] = 8;
            }
        }
    }

    memcpy(pdungeon, dungeon, sizeof(pdungeon));

    MemFreeDbg(pLevelMap);
}
