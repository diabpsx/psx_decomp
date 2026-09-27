/**
 * @file drlg_l4.cpp
 *
 * Implementation of the hell level generation algorithms.
 *
 * PSX deltas vs devilution (PREGAME overlay, splat segment drlg_l4):
 *  - dungeon is `unsigned short[48][48]` (owned by GENDUNG.CPP), still indexed dungeon[x][y].
 *    Most loops still iterate the logical 40x40 (DMAXX/DMAXY) area; InitL4Dungeon's dungeon-clear
 *    loop iterates the full physical 48x48 extent (retail bytes; not just DMAXX/DMAXY).
 *  - devilution's generation-time `dflags[40][40]` is a runtime-allocated flat buffer `mydflags`
 *    (owned by DRLG_L2.CPP, size 0x28*0x28), addressed `mydflags[x*40+y]` -- see the DFLAGS() macro.
 *  - devilution's render-time `dTransVal[112][112]` is `dung_map[x][y].dTransVal` (dung_map owned
 *    by GENDUNG.CPP).
 *  - devilution's `dPiece[112][112]` direct array is behind accessors GetDPiece()/SetDPiece()
 *    (DPIECE.CPP); DRLG_L4Pass3's first "clear the whole render grid" loop covers 96x96, not 112x112.
 *  - `random_(0, n)` -> `ENG_random(n)`.
 *  - BOOL/TRUE/FALSE are plain int (game-layer convention, confirmed via GMAN.CPP).
 *  - DUN/DAT filenames have no "Levels\\L4Data\\" prefix baked into the string (image bytes: only
 *    "Warlord.DUN", "Vile14.DUN" [renamed from devilution's Vile1.DUN], "diab1.DUN" etc.) --
 *    GRL_LoadFileInMemSig resolves the directory itself.
 *  - DRLG_L4 gained an extra `UPDATEPROGRESS(1)` call at the top of its outer retry loop, and an
 *    extra `DRLG_L4SetWalls()` pass (new PSX-only function, no devilution counterpart) right after
 *    DRLG_L4Corners()/DRLG_L4SetWalls -- see below.
 *  - pMegaTiles entries are read as SIGNED 16-bit (`lh`), not unsigned (devilution's WORD/lhu).
 */
#include "diabpsx_types.h"
#include "source/gen/structs_drlg_l4.h"
#include "source/gen/externs_drlg_l4.h"
#include "source/gen/protos_drlg_l4.h"
#include "source/diablo.h"

#define DMAXX 40
#define DMAXY 40

#define Q_WARLORD 11

#define ENTRY_MAIN 0
#define ENTRY_PREV 1

/* generation-time dflags scratch: mydflags is a flat DMAXX*DMAXY buffer, dflags[x][y] == mydflags[x*40+y] */
#define DFLAGS(x, y) (mydflags[(y) * 40 + (x)])

/* TU-owned scalar globals (tentative defs -> gp-relative addressing, matches the oracle) */
int diabquad1x;
int diabquad2x;
int diabquad3x;
int diabquad4x;
int diabquad1y;
int diabquad2y;
int diabquad3y;
int diabquad4y;
int SP4x1;
int SP4y1;
int SP4x2;
int SP4y2;
int l4holdx;
int l4holdy;

/** A lookup table for the 16 possible patterns of a 2x2 area,
 *  where each cell either contains a SW wall or it doesn't. */
static const unsigned char L4ConvTbl[16] = { 30, 6, 1, 6, 2, 6, 6, 6, 9, 6, 1, 6, 2, 6, 3, 6 };   /* @0x8014F318 */

/** Miniset: Stairs up. */
static const unsigned char L4USTAIRS[] = {   /* @0x8014F328 */
    4, 5,

    6, 6, 6, 6,
    6, 6, 6, 6,
    6, 6, 6, 6,
    6, 6, 6, 6,
    6, 6, 6, 6,

     0,  0,  0,  0,
    36, 38, 35,  0,
    37, 34, 33, 32,
     0,  0, 31,  0,
     0,  0,  0,  0,
};
/** Miniset: Stairs up to town. */
static const unsigned char L4TWARP[] = {   /* @0x8014F354 */
    4, 5,

    6, 6, 6, 6,
    6, 6, 6, 6,
    6, 6, 6, 6,
    6, 6, 6, 6,
    6, 6, 6, 6,

      0,   0,   0,   0,
    134, 136, 133,   0,
    135, 132, 131, 130,
      0,   0, 129,   0,
      0,   0,   0,   0,
};
/** Miniset: Stairs down. */
static const unsigned char L4DSTAIRS[] = {   /* @0x8014F380 */
    5, 5,

    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,

    0,  0,  0,  0, 0,
    0,  0, 45, 41, 0,
    0, 44, 43, 40, 0,
    0, 46, 42, 39, 0,
    0,  0,  0,  0, 0,
};
/** Miniset: Pentagram. */
static const unsigned char L4PENTA[] = {   /* @0x8014F3B4 */
    5, 5,

    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,

    0,   0,   0,   0, 0,
    0,  98, 100, 103, 0,
    0,  99, 102, 105, 0,
    0, 101, 104, 106, 0,
    0,   0,   0,   0, 0,
};
/** Miniset: Pentagram portal. */
static const unsigned char L4PENTA2[] = {   /* @0x8014F3E8 */
    5, 5,

    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,
    6, 6, 6, 6, 6,

    0,   0,   0,   0, 0,
    0, 107, 109, 112, 0,
    0, 108, 111, 114, 0,
    0, 110, 113, 115, 0,
    0,   0,   0,   0, 0,
};

/** Maps tile IDs to their corresponding undecorated tile ID. */
static const unsigned char L4BTYPES[140] = {   /* @0x8014F41C */
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 6,
    6, 6, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 2, 1, 2, 1, 2, 1, 1, 2,
    2, 0, 0, 0, 0, 0, 0, 15, 16, 9,
    12, 4, 5, 7, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

/* @0x8014F4A8 */
static void DRLG_L4Shadows()
{
    int x, y;
    unsigned char okflag;

    for (y = 1; y < DMAXY; y++) {
        for (x = 1; x < DMAXY; x++) {
            okflag = 0;
            if (dungeon[x][y] == 3) {
                okflag = 1;
            }
            if (dungeon[x][y] == 4) {
                okflag = 1;
            }
            if (dungeon[x][y] == 8) {
                okflag = 1;
            }
            if (dungeon[x][y] == 15) {
                okflag = 1;
            }
            if (!okflag) {
                continue;
            }
            if (dungeon[x - 1][y] == 6) {
                dungeon[x - 1][y] = 47;
            }
            if (dungeon[x - 1][y - 1] == 6) {
                dungeon[x - 1][y - 1] = 48;
            }
        }
    }
}

/* @0x8014F56C */
static void InitL4Dungeon()
{
    memset(L4dungeon, 0, sizeof(L4dungeon));

    /* clears the whole physical 48x48 dungeon array, not just the DMAXX/DMAXY logical area */
    for (int j = 0; j < 48; j++) {
        for (int i = 0; i < 48; i++) {
            dungeon[i][j] = 30; // L4_DIRT;DIRT_PIC
        }
    }

    for (int j = 0; j < DMAXY; j++) {
        for (int i = 0; i < DMAXX; i++) {
            DFLAGS(i, j) = 0;
        }
    }
}

/* @0x8014F620 */
void DRLG_LoadL4SP()
{
    setloadflag = 0;
    if (QuestStatus(Q_WARLORD)) {
        pSetPiece = GRL_LoadFileInMemSig("Warlord.DUN", NULL);
        setloadflag = 1;
    }
    if (currlevel == 15 && gbMaxPlayers != 1) {
        pSetPiece = GRL_LoadFileInMemSig("Vile14.DUN", NULL);
        setloadflag = 1;
    }
}

/* @0x8014F6C4 */
void DRLG_FreeL4SP()
{
    MemFreeDbg(pSetPiece);
}

/* @0x8014F6F4 */
void DRLG_L4SetSPRoom(int rx1, int ry1)
{
    int rw, rh;
    int i, j;
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
            if (*sp != 0) {
                dungeon[rx1 + i][ry1 + j] = *sp;
                DFLAGS(rx1 + i, ry1 + j) |= 0x80;
            } else {
                dungeon[rx1 + i][ry1 + j] = 6;
            }
            sp += 2;
        }
    }
}

/* @0x8014F7F4 */
static void L4makeDmt()
{
    int i, j;
    int idx;
    int val;
    int dmtx, dmty;

    dmty = 0;
    for (j = 1; j <= 77; j += 2) {
        dmtx = 0;
        for (i = 1; i <= 77; i += 2) {
            idx = L4dungeon[i][j] + (L4dungeon[i + 1][j] << 1)
                + (L4dungeon[i][j + 1] << 2) + (L4dungeon[i + 1][j + 1] << 3);
            val = L4ConvTbl[idx];
            dungeon[dmtx][dmty] = val;
            dmtx++;
        }
        dmty++;
    }
}

/* @0x8014F898 */
static int L4HWallOk(int i, int j)
{
    int x;
    unsigned char wallok;

    x = 1;
    while (dungeon[i + x][j] == 6 && DFLAGS(i + x, j) == 0
        && dungeon[i + x][j - 1] == 6 && dungeon[i + x][j + 1] == 6) {
        x++;
    }

    wallok = 0;

    if (dungeon[i + x][j] == 10) {
        wallok = 1;
    }
    if (dungeon[i + x][j] == 12) {
        wallok = 1;
    }
    if (dungeon[i + x][j] == 13) {
        wallok = 1;
    }
    if (dungeon[i + x][j] == 15) {
        wallok = 1;
    }
    if (dungeon[i + x][j] == 16) {
        wallok = 1;
    }
    if (dungeon[i + x][j] == 21) {
        wallok = 1;
    }
    if (dungeon[i + x][j] == 22) {
        wallok = 1;
    }
    if (x <= 3) {
        wallok = 0;
    }

    if (wallok) {
        return x;
    } else {
        return -1;
    }
}

/* @0x8014F9E8 */
static int L4VWallOk(int i, int j)
{
    int y;
    unsigned char wallok;

    y = 1;
    while (dungeon[i][j + y] == 6 && DFLAGS(i, j + y) == 0
        && dungeon[i - 1][j + y] == 6 && dungeon[i + 1][j + y] == 6) {
        y++;
    }

    wallok = 0;

    if (dungeon[i][j + y] == 8) {
        wallok = 1;
    }
    if (dungeon[i][j + y] == 9) {
        wallok = 1;
    }
    if (dungeon[i][j + y] == 11) {
        wallok = 1;
    }
    if (dungeon[i][j + y] == 14) {
        wallok = 1;
    }
    if (dungeon[i][j + y] == 15) {
        wallok = 1;
    }
    if (dungeon[i][j + y] == 16) {
        wallok = 1;
    }
    if (dungeon[i][j + y] == 21) {
        wallok = 1;
    }
    if (dungeon[i][j + y] == 23) {
        wallok = 1;
    }
    if (y <= 3) {
        wallok = 0;
    }

    if (wallok) {
        return y;
    } else {
        return -1;
    }
}

/* @0x8014FB58 */
static void L4HorizWall(int i, int j, int dx)
{
    int xx;

    if (dungeon[i][j] == 13) {
        dungeon[i][j] = 17;
    }
    if (dungeon[i][j] == 16) {
        dungeon[i][j] = 11;
    }
    if (dungeon[i][j] == 12) {
        dungeon[i][j] = 14;
    }

    for (xx = 1; xx < dx; xx++) {
        dungeon[i + xx][j] = 2;
    }

    if (dungeon[i + dx][j] == 15) {
        dungeon[i + dx][j] = 14;
    }
    if (dungeon[i + dx][j] == 10) {
        dungeon[i + dx][j] = 17;
    }
    if (dungeon[i + dx][j] == 21) {
        dungeon[i + dx][j] = 23;
    }
    if (dungeon[i + dx][j] == 22) {
        dungeon[i + dx][j] = 29;
    }

    xx = ENG_random(dx - 3) + 1;
    dungeon[i + xx][j] = 57;
    dungeon[i + xx + 2][j] = 56;
    dungeon[i + xx + 1][j] = 60;

    if (dungeon[i + xx][j - 1] == 6) {
        dungeon[i + xx][j - 1] = 58;
    }
    if (dungeon[i + xx + 1][j - 1] == 6) {
        dungeon[i + xx + 1][j - 1] = 59;
    }
}

/* @0x8014FD28 */
static void L4VertWall(int i, int j, int dy)
{
    int yy;

    if (dungeon[i][j] == 14) {
        dungeon[i][j] = 17;
    }
    if (dungeon[i][j] == 8) {
        dungeon[i][j] = 9;
    }
    if (dungeon[i][j] == 15) {
        dungeon[i][j] = 10;
    }

    for (yy = 1; yy < dy; yy++) {
        dungeon[i][j + yy] = 1;
    }

    if (dungeon[i][j + dy] == 11) {
        dungeon[i][j + dy] = 17;
    }
    if (dungeon[i][j + dy] == 9) {
        dungeon[i][j + dy] = 10;
    }
    if (dungeon[i][j + dy] == 16) {
        dungeon[i][j + dy] = 13;
    }
    if (dungeon[i][j + dy] == 21) {
        dungeon[i][j + dy] = 22;
    }
    if (dungeon[i][j + dy] == 23) {
        dungeon[i][j + dy] = 29;
    }

    yy = ENG_random(dy - 3) + 1;
    dungeon[i][j + yy] = 53;
    dungeon[i][j + yy + 2] = 52;
    dungeon[i][j + yy + 1] = 6;

    if (dungeon[i - 1][j + yy] == 6) {
        dungeon[i - 1][j + yy] = 54;
    }
    if (dungeon[i - 1][j + yy - 1] == 6) {
        dungeon[i - 1][j + yy - 1] = 55;
    }
}

/* @0x8014FEEC */
static void L4AddWall()
{
    int i, j, x, y;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (DFLAGS(i, j) != 0) {
                continue;
            }
            if (dungeon[i][j] == 10 && ENG_random(100) < 100) {
                x = L4HWallOk(i, j);
                if (x != -1) {
                    L4HorizWall(i, j, x);
                }
            }
            if (dungeon[i][j] == 12 && ENG_random(100) < 100) {
                x = L4HWallOk(i, j);
                if (x != -1) {
                    L4HorizWall(i, j, x);
                }
            }
            if (dungeon[i][j] == 13 && ENG_random(100) < 100) {
                x = L4HWallOk(i, j);
                if (x != -1) {
                    L4HorizWall(i, j, x);
                }
            }
            if (dungeon[i][j] == 15 && ENG_random(100) < 100) {
                x = L4HWallOk(i, j);
                if (x != -1) {
                    L4HorizWall(i, j, x);
                }
            }
            if (dungeon[i][j] == 16 && ENG_random(100) < 100) {
                x = L4HWallOk(i, j);
                if (x != -1) {
                    L4HorizWall(i, j, x);
                }
            }
            if (dungeon[i][j] == 21 && ENG_random(100) < 100) {
                x = L4HWallOk(i, j);
                if (x != -1) {
                    L4HorizWall(i, j, x);
                }
            }
            if (dungeon[i][j] == 22 && ENG_random(100) < 100) {
                x = L4HWallOk(i, j);
                if (x != -1) {
                    L4HorizWall(i, j, x);
                }
            }
            if (dungeon[i][j] == 8 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
            if (dungeon[i][j] == 9 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
            if (dungeon[i][j] == 11 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
            if (dungeon[i][j] == 14 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
            if (dungeon[i][j] == 15 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
            if (dungeon[i][j] == 16 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
            if (dungeon[i][j] == 21 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
            if (dungeon[i][j] == 23 && ENG_random(100) < 100) {
                y = L4VWallOk(i, j);
                if (y != -1) {
                    L4VertWall(i, j, y);
                }
            }
        }
    }
}

/* @0x80150394 */
static void L4tileFix()
{
    int i, j;

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 6)
                dungeon[i + 1][j] = 5;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 13;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 14;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 6)
                dungeon[i + 1][j] = 2;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 9)
                dungeon[i + 1][j] = 11;
            if (dungeon[i][j] == 9 && dungeon[i + 1][j] == 6)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 13;
            if (dungeon[i][j] == 6 && dungeon[i + 1][j] == 14)
                dungeon[i + 1][j] = 15;
            if (dungeon[i][j] == 6 && dungeon[i][j + 1] == 13)
                dungeon[i][j + 1] = 16;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 10;
            if (dungeon[i][j] == 6 && dungeon[i][j - 1] == 1)
                dungeon[i][j - 1] = 1;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 27;
            if (dungeon[i][j] == 27 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 27;
            if (dungeon[i][j] == 27 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 27)
                dungeon[i + 1][j] = 26;
            if (dungeon[i][j] == 27 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 15)
                dungeon[i + 1][j] = 14;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 15)
                dungeon[i + 1][j] = 14;
            if (dungeon[i][j] == 22 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 27 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 6 && dungeon[i + 1][j] == 27 && dungeon[i + 1][j + 1] != 0)
                dungeon[i + 1][j] = 22;
            if (dungeon[i][j] == 22 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 1 && dungeon[i + 1][j - 1] == 1)
                dungeon[i + 1][j] = 13;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 30 && dungeon[i][j + 1] == 6)
                dungeon[i + 1][j] = 28;
            if (dungeon[i][j] == 16 && dungeon[i + 1][j] == 6 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 27;
            if (dungeon[i][j] == 16 && dungeon[i][j + 1] == 30 && dungeon[i + 1][j + 1] == 30)
                dungeon[i][j + 1] = 27;
            if (dungeon[i][j] == 6 && dungeon[i + 1][j] == 30 && dungeon[i + 1][j - 1] == 6)
                dungeon[i + 1][j] = 21;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 27 && dungeon[i + 1][j + 1] == 9)
                dungeon[i + 1][j] = 29;
            if (dungeon[i][j] == 9 && dungeon[i + 1][j] == 15)
                dungeon[i + 1][j] = 14;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 27 && dungeon[i + 1][j + 1] == 2)
                dungeon[i + 1][j] = 29;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 18)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 9 && dungeon[i + 1][j] == 15)
                dungeon[i + 1][j] = 14;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 19 && dungeon[i + 1][j - 1] == 30)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 24 && dungeon[i][j - 1] == 30 && dungeon[i][j - 2] == 6)
                dungeon[i][j - 1] = 21;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 28;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 28;
            if (dungeon[i][j] == 28 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 28 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 19 && dungeon[i + 2][j] == 2 && dungeon[i + 1][j - 1] == 18 && dungeon[i + 1][j + 1] == 1)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 19 && dungeon[i + 2][j] == 2 && dungeon[i + 1][j - 1] == 22 && dungeon[i + 1][j + 1] == 1)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 19 && dungeon[i + 2][j] == 2 && dungeon[i + 1][j - 1] == 18 && dungeon[i + 1][j + 1] == 13)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 21 && dungeon[i + 2][j] == 2 && dungeon[i + 1][j - 1] == 18 && dungeon[i + 1][j + 1] == 1)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j + 1] == 1 && dungeon[i + 1][j - 1] == 22 && dungeon[i + 2][j] == 3)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 28 && dungeon[i + 2][j] == 30 && dungeon[i + 1][j - 1] == 6)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 28 && dungeon[i + 2][j] == 1)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 27 && dungeon[i + 1][j + 1] == 30)
                dungeon[i + 1][j] = 29;
            if (dungeon[i][j] == 28 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j - 1] == 21)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 27 && dungeon[i + 1][j + 1] == 30)
                dungeon[i + 1][j] = 29;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 18)
                dungeon[i + 1][j] = 25;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 9 && dungeon[i + 2][j] == 2)
                dungeon[i + 1][j] = 11;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 10)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 15 && dungeon[i][j + 1] == 3)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 22 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 18 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 24 && dungeon[i - 1][j] == 30)
                dungeon[i - 1][j] = 19;
            if (dungeon[i][j] == 21 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 21 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 10;
            if (dungeon[i][j] == 22 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 21 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 16 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 22 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 18 && dungeon[i + 2][j] == 30)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 9 && dungeon[i + 1][j + 1] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 27 && dungeon[i + 1][j + 1] == 2)
                dungeon[i + 1][j] = 29;
            if (dungeon[i][j] == 23 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 23 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 25 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 22 && dungeon[i + 1][j] == 9)
                dungeon[i + 1][j] = 11;
            if (dungeon[i][j] == 23 && dungeon[i + 1][j] == 9)
                dungeon[i + 1][j] = 11;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 11 && dungeon[i + 1][j] == 15)
                dungeon[i + 1][j] = 14;
            if (dungeon[i][j] == 23 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 27)
                dungeon[i + 1][j] = 26;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 18)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 26 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 29 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 29 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 1 && dungeon[i][j - 1] == 15)
                dungeon[i][j - 1] = 10;
            if (dungeon[i][j] == 18 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 23 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 18 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 10;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 30 && dungeon[i + 1][j + 1] == 30)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 28 && dungeon[i + 1][j - 1] == 6)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 23 && dungeon[i + 1][j] == 18 && dungeon[i][j - 1] == 6)
                dungeon[i + 1][j] = 24;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 23 && dungeon[i + 2][j] == 30)
                dungeon[i + 1][j] = 28;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 28 && dungeon[i + 2][j] == 30 && dungeon[i + 1][j - 1] == 6)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 23 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 29 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 29 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 26 && dungeon[i + 1][j] == 30)
                dungeon[i + 1][j] = 19;
            if (dungeon[i][j] == 16 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 10;
            if (dungeon[i][j] == 25 && dungeon[i][j + 1] == 30)
                dungeon[i][j + 1] = 18;
            if (dungeon[i][j] == 18 && dungeon[i][j + 1] == 2)
                dungeon[i][j + 1] = 15;
            if (dungeon[i][j] == 11 && dungeon[i + 1][j] == 3)
                dungeon[i + 1][j] = 5;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 9)
                dungeon[i + 1][j] = 11;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 13;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 13 && dungeon[i + 1][j - 1] == 6)
                dungeon[i + 1][j] = 16;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 21 && dungeon[i][j + 1] == 24 && dungeon[i][j + 2] == 1)
                dungeon[i][j + 1] = 17;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j + 1] == 9 && dungeon[i + 1][j - 1] == 1 && dungeon[i + 2][j] == 16)
                dungeon[i + 1][j] = 29;
            if (dungeon[i][j] == 2 && dungeon[i - 1][j] == 6)
                dungeon[i - 1][j] = 8;
            if (dungeon[i][j] == 1 && dungeon[i][j - 1] == 6)
                dungeon[i][j - 1] = 7;
            if (dungeon[i][j] == 6 && dungeon[i + 1][j] == 15 && dungeon[i + 1][j + 1] == 4)
                dungeon[i + 1][j] = 10;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 3)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 6)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 9 && dungeon[i][j + 1] == 3)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 10 && dungeon[i][j + 1] == 3)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 3)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 5)
                dungeon[i][j + 1] = 12;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 16)
                dungeon[i][j + 1] = 13;
            if (dungeon[i][j] == 6 && dungeon[i][j + 1] == 13)
                dungeon[i][j + 1] = 16;
            if (dungeon[i][j] == 25 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 10;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 5)
                dungeon[i][j + 1] = 12;
            if (dungeon[i][j] == 28 && dungeon[i][j - 1] == 6 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 10)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 9)
                dungeon[i + 1][j] = 11;
            if (dungeon[i][j] == 11 && dungeon[i + 1][j] == 3)
                dungeon[i + 1][j] = 5;
            if (dungeon[i][j] == 10 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 27 && dungeon[i + 1][j] == 9)
                dungeon[i + 1][j] = 11;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 1)
                dungeon[i + 1][j] = 16;
            if (dungeon[i][j] == 11 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 3)
                dungeon[i + 1][j] = 5;
            if (dungeon[i][j] == 9 && dungeon[i + 1][j] == 3)
                dungeon[i + 1][j] = 5;
            if (dungeon[i][j] == 14 && dungeon[i + 1][j] == 3)
                dungeon[i + 1][j] = 5;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 3)
                dungeon[i + 1][j] = 5;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 5 && dungeon[i + 1][j - 1] == 16)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 2 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 9 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 1 && dungeon[i][j - 1] == 8)
                dungeon[i][j - 1] = 9;
            if (dungeon[i][j] == 28 && dungeon[i + 1][j] == 23 && dungeon[i + 1][j + 1] == 3)
                dungeon[i + 1][j] = 16;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 10)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 17 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 10 && dungeon[i + 1][j] == 4)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 17 && dungeon[i][j + 1] == 5)
                dungeon[i][j + 1] = 12;
            if (dungeon[i][j] == 29 && dungeon[i][j + 1] == 9)
                dungeon[i][j + 1] = 10;
            if (dungeon[i][j] == 13 && dungeon[i][j + 1] == 5)
                dungeon[i][j + 1] = 12;
            if (dungeon[i][j] == 9 && dungeon[i][j + 1] == 16)
                dungeon[i][j + 1] = 13;
            if (dungeon[i][j] == 10 && dungeon[i][j + 1] == 16)
                dungeon[i][j + 1] = 13;
            if (dungeon[i][j] == 16 && dungeon[i][j + 1] == 3)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 11 && dungeon[i][j + 1] == 5)
                dungeon[i][j + 1] = 12;
            if (dungeon[i][j] == 10 && dungeon[i + 1][j] == 3 && dungeon[i + 1][j - 1] == 16)
                dungeon[i + 1][j] = 12;
            if (dungeon[i][j] == 16 && dungeon[i][j + 1] == 5)
                dungeon[i][j + 1] = 12;
            if (dungeon[i][j] == 1 && dungeon[i][j + 1] == 6)
                dungeon[i][j + 1] = 4;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j] == 13 && dungeon[i][j + 1] == 10)
                dungeon[i + 1][j + 1] = 12;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 10)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 22 && dungeon[i][j + 1] == 11)
                dungeon[i][j + 1] = 17;
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 28 && dungeon[i + 2][j] == 16)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 28 && dungeon[i + 1][j] == 23 && dungeon[i + 1][j + 1] == 1 && dungeon[i + 2][j] == 6)
                dungeon[i + 1][j] = 16;
        }
    }
    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if (dungeon[i][j] == 15 && dungeon[i + 1][j] == 28 && dungeon[i + 2][j] == 16)
                dungeon[i + 1][j] = 23;
            if (dungeon[i][j] == 21 && dungeon[i + 1][j - 1] == 21 && dungeon[i + 1][j + 1] == 13 && dungeon[i + 2][j] == 2)
                dungeon[i + 1][j] = 17;
            if (dungeon[i][j] == 19 && dungeon[i + 1][j] == 15 && dungeon[i + 1][j + 1] == 12)
                dungeon[i + 1][j] = 17;
        }
    }
}

/* @0x8015257C */
static void DRLG_L4Subs()
{
    int x, y, i, rv;
    unsigned char c;

    for (y = 0; y < DMAXY; y++) {
        for (x = 0; x < DMAXX; x++) {
            rv = ENG_random(3);
            if (rv == 0) {
                c = dungeon[x][y];
                c = L4BTYPES[c];
                if (c != 0 && DFLAGS(x, y) == 0) {
                    rv = ENG_random(16);
                    i = -1;
                    while (rv >= 0) {
                        i++;
                        if (i == sizeof(L4BTYPES)) {
                            i = 0;
                        }
                        if (c == L4BTYPES[i]) {
                            rv--;
                        }
                    }
                    dungeon[x][y] = i;
                }
            }
        }
    }
    for (y = 0; y < DMAXY; y++) {
        for (x = 0; x < DMAXX; x++) {
            rv = ENG_random(10);
            if (rv == 0) {
                c = dungeon[x][y];
                if (L4BTYPES[c] == 6 && DFLAGS(x, y) == 0) {
                    dungeon[x][y] = ENG_random(3) + 95;
                }
            }
        }
    }
}

/* @0x8015275C */
static void L4makeDungeon()
{
    int i, j, k, l;

    for (j = 0; j < 20; j++) {
        for (i = 0; i < 20; i++) {
            k = i << 1;
            l = j << 1;
            L4dungeon[k][l] = dung[i][j];
            L4dungeon[k][l + 1] = dung[i][j];
            L4dungeon[k + 1][l] = dung[i][j];
            L4dungeon[k + 1][l + 1] = dung[i][j];
        }
    }
    for (j = 0; j < 20; j++) {
        for (i = 0; i < 20; i++) {
            k = i << 1;
            l = j << 1;
            L4dungeon[k][l + 40] = dung[i][19 - j];
            L4dungeon[k][l + 41] = dung[i][19 - j];
            L4dungeon[k + 1][l + 40] = dung[i][19 - j];
            L4dungeon[k + 1][l + 41] = dung[i][19 - j];
        }
    }
    for (j = 0; j < 20; j++) {
        for (i = 0; i < 20; i++) {
            k = i << 1;
            l = j << 1;
            L4dungeon[k + 40][l] = dung[19 - i][j];
            L4dungeon[k + 40][l + 1] = dung[19 - i][j];
            L4dungeon[k + 41][l] = dung[19 - i][j];
            L4dungeon[k + 41][l + 1] = dung[19 - i][j];
        }
    }
    for (j = 0; j < 20; j++) {
        for (i = 0; i < 20; i++) {
            k = i << 1;
            l = j << 1;
            L4dungeon[k + 40][l + 40] = dung[19 - i][19 - j];
            L4dungeon[k + 40][l + 41] = dung[19 - i][19 - j];
            L4dungeon[k + 41][l + 40] = dung[19 - i][19 - j];
            L4dungeon[k + 41][l + 41] = dung[19 - i][19 - j];
        }
    }
}

/* @0x80152994 */
static void uShape()
{
    int j, i, rv;

    for (j = 19; j >= 0; j--) {
        for (i = 19; i >= 0; i--) {
            if (dung[i][j] != 1) {
                hallok[j] = 0;
            }
            if (dung[i][j] == 1) {
                if (dung[i][j + 1] == 1 && dung[i + 1][j + 1] == 0) {
                    hallok[j] = 1;
                } else {
                    hallok[j] = 0;
                }
                i = 0;
            }
        }
    }

    rv = ENG_random(19) + 1;
    do {
        if (hallok[rv]) {
            for (i = 19; i >= 0; i--) {
                if (dung[i][rv] == 1) {
                    i = -1;
                    rv = 0;
                } else {
                    dung[i][rv] = 1;
                    dung[i][rv + 1] = 1;
                }
            }
        } else {
            rv++;
            if (rv == 20) {
                rv = 1;
            }
        }
    } while (rv != 0);

    for (i = 19; i >= 0; i--) {
        for (j = 19; j >= 0; j--) {
            if (dung[i][j] != 1) {
                hallok[i] = 0;
            }
            if (dung[i][j] == 1) {
                if (dung[i + 1][j] == 1 && dung[i + 1][j + 1] == 0) {
                    hallok[i] = 1;
                } else {
                    hallok[i] = 0;
                }
                j = 0;
            }
        }
    }

    rv = ENG_random(19) + 1;
    do {
        if (hallok[rv]) {
            for (j = 19; j >= 0; j--) {
                if (dung[rv][j] == 1) {
                    j = -1;
                    rv = 0;
                } else {
                    dung[rv][j] = 1;
                    dung[rv + 1][j] = 1;
                }
            }
        } else {
            rv++;
            if (rv == 20) {
                rv = 1;
            }
        }
    } while (rv != 0);
}

/* @0x80152C30 */
static long GetArea()
{
    int i, j;
    long rv;

    rv = 0;

    for (j = 0; j < 20; j++) {
        for (i = 0; i < 20; i++) {
            if (dung[i][j] == 1) {
                rv++;
            }
        }
    }

    return rv;
}

/* @0x80152C8C */
static void L4drawRoom(int x, int y, int width, int height)
{
    int i, j;

    for (j = 0; j < height; j++) {
        for (i = 0; i < width; i++) {
            dung[x + i][y + j] = 1;
        }
    }
}

/* @0x80152CF4 */
static int L4checkRoom(int x, int y, int width, int height)
{
    int i, j;

    if (x <= 0 || y <= 0) {
        return 0;
    }

    for (j = 0; j < height; j++) {
        for (i = 0; i < width; i++) {
            if (x + i < 0 || x + i >= 20 || y + j < 0 || y + j >= 20) {
                return 0;
            }
            if (dung[x + i][y + j] != 0) {
                return 0;
            }
        }
    }

    return 1;
}

/* @0x80152D90 */
static void L4roomGen(int x, int y, int w, int h, int dir)
{
    int rx, ry, rx2, ry2;
    int height, width;
    int cx1, cy1, cw, ch;
    int num;
    int dirProb;
    int ran;
    unsigned char c, d;

    ran = ENG_random(4);
    if (dir == 1) {
        if (ran == 0) {
            dirProb = 0;
        } else {
            dirProb = 1;
        }
    } else {
        if (ran == 0) {
            dirProb = 1;
        } else {
            dirProb = 0;
        }
    }
    switch (dirProb) {
    case 0: /* L4DIR_HORIZ -- left/right */
        num = 0;
        do {
            width = ((ENG_random(5) + 2) >> 1) << 1;
            height = ((ENG_random(5) + 2) >> 1) << 1;
            ry = y + (h / 2) - (height / 2);
            rx = x - width;
            cx1 = rx - 1;
            cy1 = ry - 1;
            cw = height + 2;
            ch = width + 1;
            c = L4checkRoom(cx1, cy1, cw, ch);
            num++;
        } while (c == 0 && num < 20);
        if (c == 1) {
            L4drawRoom(rx, ry, width, height);
        }

        rx2 = x + w;
        cx1 = rx2;
        cy1 = ry - 1;
        ch = height + 2;
        cw = width + 1;
        d = L4checkRoom(cx1, cy1, cw, ch);
        if (d == 1) {
            L4drawRoom(rx2, ry, width, height);
        }
        if (c == 1) {
            L4roomGen(rx, ry, width, height, 1);
        }
        if (d == 1) {
            L4roomGen(rx2, ry, width, height, 1);
        }
        break;

    case 1: /* L4DIR_VERT -- top/bottom */
        num = 0;
        do {
            width = ((ENG_random(5) + 2) >> 1) << 1;
            height = ((ENG_random(5) + 2) >> 1) << 1;
            rx = x + (w / 2) - (width / 2);
            ry = y - height;
            cx1 = rx - 1;
            cy1 = ry - 1;
            ch = height + 1;
            cw = width + 2;
            c = L4checkRoom(cx1, cy1, cw, ch);
            num++;
        } while (c == 0 && num < 20);
        if (c == 1) {
            L4drawRoom(rx, ry, width, height);
        }

        ry2 = y + h;
        cx1 = rx - 1;
        cy1 = ry2;
        ch = height + 1;
        cw = width + 2;
        d = L4checkRoom(cx1, cy1, cw, ch);
        if (d == 1) {
            L4drawRoom(rx, ry2, width, height);
        }
        if (c == 1) {
            L4roomGen(rx, ry, width, height, 0);
        }
        if (d == 1) {
            L4roomGen(rx, ry2, width, height, 0);
        }
        break;
    }
}

/* @0x80153078 */
static void L4firstRoom()
{
    int x, y, w, h, rndx, rndy, xmin, xmax, ymin, ymax, tx, ty;

    if (currlevel != 16) {
        if (currlevel == quests[Q_WARLORD]._qlevel && quests[Q_WARLORD]._qactive != QUEST_NOTAVAIL) {
            w = 11;
            h = 11;
        } else if (currlevel == quests[Q_BETRAYER]._qlevel && gbMaxPlayers != 1) {
            w = 11;
            h = 11;
        } else {
            w = ENG_random(5) + 2;
            h = ENG_random(5) + 2;
        }
    } else {
        w = 14;
        h = 14;
    }

    xmin = (20 - w) >> 1;
    xmax = 19 - w;
    rndx = ENG_random(xmax - xmin + 1) + xmin;
    if (w + rndx > 19) {
        tx = w + rndx - 19;
        x = rndx - tx + 1;
    } else {
        x = rndx;
    }
    ymin = (20 - h) >> 1;
    ymax = 19 - h;
    rndy = ENG_random(ymax - ymin + 1) + ymin;
    if (h + rndy > 19) {
        ty = h + rndy - 19;
        y = rndy - ty + 1;
    } else {
        y = rndy;
    }

    if (currlevel == 16) {
        l4holdx = x;
        l4holdy = y;
    }
    if (QuestStatus(Q_WARLORD) || (currlevel == quests[Q_BETRAYER]._qlevel && gbMaxPlayers != 1)) {
        SP4x1 = x + 1;
        SP4y1 = y + 1;
        SP4x2 = SP4x1 + w;
        SP4y2 = SP4y1 + h;
    } else {
        SP4x1 = 0;
        SP4y1 = 0;
        SP4x2 = 0;
        SP4y2 = 0;
    }

    L4drawRoom(x, y, w, h);
    L4roomGen(x, y, w, h, ENG_random(2));
}

/* @0x80153284 */
void L4SaveQuads()
{
    int i, j, x, y;

    x = l4holdx;
    y = l4holdy;

    for (j = 0; j < 14; j++) {
        for (i = 0; i < 14; i++) {
            DFLAGS(x + i, y + j) = 1;
            DFLAGS(39 - x - i, y + j) = 1;
            DFLAGS(x + i, 39 - y - j) = 1;
            DFLAGS(39 - x - i, 39 - y - j) = 1;
        }
    }
}

/* @0x80153344 */
void DRLG_L4SetRoom(unsigned char *pSetPiece, int rx1, int ry1)
{
    int rw, rh;
    int i, j;
    unsigned char *sp;

    sp = pSetPiece;
    rw = *sp;
    sp += 2;
    rh = *sp;
    sp += 2;

    sp = pSetPiece + 4;
    for (j = 0; j < rh; j++) {
        for (i = 0; i < rw; i++) {
            if (*sp != 0) {
                dungeon[rx1 + i][ry1 + j] = *sp;
                DFLAGS(rx1 + i, ry1 + j) |= 0x80;
            } else {
                dungeon[rx1 + i][ry1 + j] = 6;
            }
            sp += 2;
        }
    }
}

/* @0x80153418 */
/* PSX-only: each quad's file is loaded ONCE and cached in a file-static pointer (never freed here --
 * CreateL4Dungeon frees+zeroes the 4 "non-b" slots at the end of a top-level generation). Confirmed
 * from the oracle: 7 distinct gp-rel statics (quad1, quad2a, quad2b, quad3a, quad3b, quad4a, quad4b);
 * the diabquad*x/y formulas are devilution's simple immediate forms, NOT Hellfire's (39-11-x-((14-11)>>1)
 * style computes the SAME numeric result but the oracle uses the plain one-subtraction form). */
static unsigned char *diabQuad1Cache;
static unsigned char *diabQuad2aCache;
static unsigned char *diabQuad2bCache;
static unsigned char *diabQuad3aCache;
static unsigned char *diabQuad3bCache;
static unsigned char *diabQuad4aCache;
static unsigned char *diabQuad4bCache;

void DRLG_LoadDiabQuads(unsigned char preflag)
{
    unsigned char *ptrSetPiece;

    if (!diabQuad1Cache) {
        diabQuad1Cache = GRL_LoadFileInMemSig("diab1.DUN", NULL);
    }
    diabquad1x = 4 + l4holdx;
    diabquad1y = 4 + l4holdy;
    ptrSetPiece = diabQuad1Cache;
    DRLG_L4SetRoom(ptrSetPiece, diabquad1x, diabquad1y);

    if (preflag) {
        if (!diabQuad2bCache) {
            diabQuad2bCache = GRL_LoadFileInMemSig("diab2b.DUN", NULL);
        }
        ptrSetPiece = diabQuad2bCache;
    } else {
        if (!diabQuad2aCache) {
            diabQuad2aCache = GRL_LoadFileInMemSig("diab2a.DUN", NULL);
        }
        ptrSetPiece = diabQuad2aCache;
    }
    diabquad2x = 27 - l4holdx;
    diabquad2y = 1 + l4holdy;
    DRLG_L4SetRoom(ptrSetPiece, diabquad2x, diabquad2y);

    if (preflag) {
        if (!diabQuad3bCache) {
            diabQuad3bCache = GRL_LoadFileInMemSig("diab3b.DUN", NULL);
        }
        ptrSetPiece = diabQuad3bCache;
    } else {
        if (!diabQuad3aCache) {
            diabQuad3aCache = GRL_LoadFileInMemSig("diab3a.DUN", NULL);
        }
        ptrSetPiece = diabQuad3aCache;
    }
    diabquad3x = 1 + l4holdx;
    diabquad3y = 27 - l4holdy;
    DRLG_L4SetRoom(ptrSetPiece, diabquad3x, diabquad3y);

    if (preflag) {
        if (!diabQuad4bCache) {
            diabQuad4bCache = GRL_LoadFileInMemSig("diab4b.DUN", NULL);
        }
        ptrSetPiece = diabQuad4bCache;
    } else {
        if (!diabQuad4aCache) {
            diabQuad4aCache = GRL_LoadFileInMemSig("diab4a.DUN", NULL);
        }
        ptrSetPiece = diabQuad4aCache;
    }
    diabquad4x = 28 - l4holdx;
    diabquad4y = 28 - l4holdy;
    DRLG_L4SetRoom(ptrSetPiece, diabquad4x, diabquad4y);
}

/* @0x80153614 */
static int DRLG_L4PlaceMiniSet(const unsigned char *miniset, int tmin, int tmax, int cx, int cy, int setview, int ldir)
{
    int sx, sy;
    int sw, sh;
    int xx, yy;
    int i, ii, numt;
    int found, bailcnt;

    sx = 0;
    sy = 0;
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
        found = 0;
        for (bailcnt = 0; !found && bailcnt < 200; bailcnt++) {
            found = 1;
            if (sx >= SP4x1 && sx <= SP4x2 && sy >= SP4y1 && sy <= SP4y2) {
                found = 0;
            }
            if (cx != -1 && sx >= cx - sw && sx <= cx + 12) {
                sx = ENG_random(DMAXX - sw);
                sy = ENG_random(DMAXY - sh);
                found = 0;
            }
            if (cy != -1 && sy >= cy - sh && sy <= cy + 12) {
                sx = ENG_random(DMAXX - sw);
                sy = ENG_random(DMAXY - sh);
                found = 0;
            }
            ii = 2;
            for (yy = 0; yy < sh && found == 1; yy++) {
                for (xx = 0; xx < sw && found == 1; xx++) {
                    if (miniset[ii] != 0 && dungeon[sx + xx][sy + yy] != miniset[ii]) {
                        found = 0;
                    }
                    if (DFLAGS(sx + xx, sy + yy) != 0) {
                        found = 0;
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
        if (bailcnt >= 200) {
            return 0;
        }
        ii = sh * sw + 2;
        for (yy = 0; yy < sh; yy++) {
            for (xx = 0; xx < sw; xx++) {
                if (miniset[ii] != 0) {
                    dungeon[sx + xx][sy + yy] = miniset[ii];
                    DFLAGS(sx + xx, sy + yy) |= 8;
                }
                ii++;
            }
        }
    }

    if (currlevel == 15 && quests[Q_BETRAYER]._qactive >= QUEST_ACTIVE) {
        quests[Q_BETRAYER]._qtx = sx + 1;
        quests[Q_BETRAYER]._qty = sy + 1;
    }
    if (setview == 1) {
        ViewX = 2 * sx + 21;
        ViewY = 2 * sy + 22;
    }
    if (ldir == 0) {
        LvlViewX = 2 * sx + 21;
        LvlViewY = 2 * sy + 22;
    }

    return 1;
}

/* @0x80153A30 */
/* PSX-only recursion-depth guard, incremented on entry, decremented on the shared exit path. */
static int recurs;

static void DRLG_L4FTVR(int i, int j, int x, int y, int d)
{
    recurs++;
    if (dung_map[x][y].dTransVal == 0 && dungeon[i][j] == 6) {
        dung_map[x][y].dTransVal = TransVal;
        dung_map[x + 1][y].dTransVal = TransVal;
        dung_map[x][y + 1].dTransVal = TransVal;
        dung_map[x + 1][y + 1].dTransVal = TransVal;
        DRLG_L4FTVR(i + 1, j, x + 2, y, 1);
        DRLG_L4FTVR(i - 1, j, x - 2, y, 2);
        DRLG_L4FTVR(i, j + 1, x, y + 2, 3);
        DRLG_L4FTVR(i, j - 1, x, y - 2, 4);

        DRLG_L4FTVR(i - 1, j - 1, x - 2, y - 2, 5);
        DRLG_L4FTVR(i + 1, j - 1, x + 2, y - 2, 6);
        DRLG_L4FTVR(i - 1, j + 1, x - 2, y + 2, 7);
        DRLG_L4FTVR(i + 1, j + 1, x + 2, y + 2, 8);
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
    recurs--;
}

/* @0x80153ED8 */
static void DRLG_L4FloodTVal()
{
    int i, j, xx, yy;

    if (TransVal == 0) {
        TransVal++;
    }

    if (currlevel == 16) {
        /* PSX-only fast path for the 4-fold mirrored level 16: stamp TransVal into the 2x2 block directly. */
        yy = 16;
        for (j = 0; j < DMAXY; j++, yy += 2) {
            xx = 16;
            for (i = 0; i < DMAXX; i++) {
                if (dungeon[i][j] == 6 && dung_map[xx][yy].dTransVal == 0) {
                    dung_map[xx][yy].dTransVal = TransVal;
                    dung_map[xx + 1][yy].dTransVal = TransVal;
                    dung_map[xx][17 + 2 * j].dTransVal = TransVal;
                    dung_map[xx + 1][17 + 2 * j].dTransVal = TransVal;
                }
                xx += 2;
            }
        }
    } else {
        yy = 16;
        for (j = 0; j < DMAXY; j++, yy += 2) {
            xx = 16;
            for (i = 0; i < DMAXX; i++) {
                if (dungeon[i][j] == 6 && dung_map[xx][yy].dTransVal == 0) {
                    recurs = 0;
                    DRLG_L4FTVR(i, j, xx, yy, 0);
                    TransVal++;
                }
                xx += 2;
            }
        }
    }
}

/* @0x801540F0 */
unsigned char IsDURWall(char d)
{
    if (d == 25) {
        return 1;
    }
    if (d == 28) {
        return 1;
    }
    if (d == 23) {
        return 1;
    }

    return 0;
}

/* @0x80154120 */
unsigned char IsDLLWall(char dd)
{
    if (dd == 27) {
        return 1;
    }
    if (dd == 26) {
        return 1;
    }
    if (dd == 22) {
        return 1;
    }

    return 0;
}

/* @0x80154150 */
static void DRLG_L4TransFix()
{
    int i, j, xx, yy;

    yy = 16;
    for (j = 0; j < DMAXY; j++) {
        xx = 16;
        for (i = 0; i < DMAXX; i++) {
            if (IsDURWall(dungeon[i][j]) && dungeon[i][j - 1] == 18) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (IsDLLWall(dungeon[i][j]) && dungeon[i + 1][j] == 19) {
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 18) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 19) {
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 24) {
                dung_map[xx + 1][yy].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
                dung_map[xx + 1][yy + 1].dTransVal = dung_map[xx][yy].dTransVal;
            }
            if (dungeon[i][j] == 57) {
                dung_map[xx - 1][yy].dTransVal = dung_map[xx][yy + 1].dTransVal;
                dung_map[xx][yy].dTransVal = dung_map[xx][yy + 1].dTransVal;
            }
            if (dungeon[i][j] == 53) {
                dung_map[xx][yy - 1].dTransVal = dung_map[xx + 1][yy].dTransVal;
                dung_map[xx][yy].dTransVal = dung_map[xx + 1][yy].dTransVal;
            }
            xx += 2;
        }
        yy += 2;
    }
}

/* @0x801544BC */
static void DRLG_L4Corners()
{
    int i, j;

    for (j = 1; j < DMAXY - 1; j++) {
        for (i = 1; i < DMAXX - 1; i++) {
            if (dungeon[i][j] >= 18 && dungeon[i][j] <= 30) {
                if (dungeon[i + 1][j] < 18) {
                    dungeon[i][j] += 98;
                } else if (dungeon[i][j + 1] < 18) {
                    dungeon[i][j] += 98;
                }
            }
        }
    }
}

/* @0x80154550 */
void L4FixRim()
{
    for (int i = 0; i < 20; i++) {
        dung[i][0] = 0;
    }
    for (int j = 0; j < 20; j++) {
        dung[0][j] = 0;
    }
}

/* @0x8015458C */
void DRLG_L4GeneralFix()
{
    int i, j;

    for (j = 0; j < DMAXY - 1; j++) {
        for (i = 0; i < DMAXX - 1; i++) {
            if ((dungeon[i][j] == 24 || dungeon[i][j] == 122) && dungeon[i + 1][j] == 2 && dungeon[i][j + 1] == 5) {
                dungeon[i][j] = 17;
            }
        }
    }
}

/* @0x80154630 -- PSX-only pass, no devilution counterpart: seals/unseals BFLAG_MISSILE (0x20) on
 * dung_map per dungeon tile (set for a wall-open tile #6 or an unset tile #0, cleared otherwise). */
static void DRLG_L4SetWalls()
{
    int i, j, yy;

    yy = 16;
    for (j = 0; j < DMAXY; j++) {
        int xx = 16;
        for (i = 0; i < DMAXX; i++) {
            int v = dungeon[i][j];
            if (v == 6 || v == 0) {
                dung_map[xx][yy].dFlags |= 0x20;
            } else {
                dung_map[xx][yy].dFlags &= ~0x20;
            }
            xx += 2;
        }
        yy += 2;
    }
}

/* @0x801546E0 */
static void DRLG_L4(int entry)
{
    unsigned char doneflag;
    int i, j, spi, spj;

    do {
        UPDATEPROGRESS(1);
        DRLG_InitTrans();
        do {
            InitL4Dungeon();
            L4firstRoom();
            L4FixRim();
            if (!(i = GetArea() < 173)) {
                uShape();
            }
        } while (i);
        L4makeDungeon();
        L4makeDmt();
        L4tileFix();
        if (currlevel == 16) {
            L4SaveQuads();
        }
        if (QuestStatus(Q_WARLORD) || (currlevel == quests[Q_BETRAYER]._qlevel && gbMaxPlayers != 1)) {
            for (spi = SP4x1; spi < SP4x2; spi++) {
                for (spj = SP4y1; spj < SP4y2; spj++) {
                    DFLAGS(spi, spj) = 1;
                }
            }
        }
        L4AddWall();
        DRLG_L4FloodTVal();
        DRLG_L4TransFix();
        if (setloadflag) {
            DRLG_L4SetSPRoom(SP4x1, SP4y1);
        }
        if (currlevel == 16) {
            DRLG_LoadDiabQuads(1);
        }
        if (QuestStatus(Q_WARLORD)) {
            if (entry == ENTRY_MAIN) {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 1, 0);
                if (doneflag && currlevel == 13) {
                    doneflag = DRLG_L4PlaceMiniSet(L4TWARP, 1, 1, -1, -1, 0, 6);
                }
                ViewX++;
            } else if (entry == ENTRY_PREV) {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 0, 0);
                if (doneflag && currlevel == 13) {
                    doneflag = DRLG_L4PlaceMiniSet(L4TWARP, 1, 1, -1, -1, 0, 6);
                }
                ViewX = 2 * setpc_x + 22;
                ViewY = 2 * setpc_y + 22;
            } else {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 0, 0);
                if (doneflag && currlevel == 13) {
                    doneflag = DRLG_L4PlaceMiniSet(L4TWARP, 1, 1, -1, -1, 1, 6);
                }
                ViewX++;
            }
        } else if (currlevel != 15) {
            if (entry == ENTRY_MAIN) {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 1, 0);
                if (doneflag && currlevel != 16) {
                    doneflag = DRLG_L4PlaceMiniSet(L4DSTAIRS, 1, 1, -1, -1, 0, 1);
                }
                if (doneflag && currlevel == 13) {
                    doneflag = DRLG_L4PlaceMiniSet(L4TWARP, 1, 1, -1, -1, 0, 6);
                }
                ViewX++;
            } else if (entry == ENTRY_PREV) {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 0, 0);
                if (doneflag && currlevel != 16) {
                    doneflag = DRLG_L4PlaceMiniSet(L4DSTAIRS, 1, 1, -1, -1, 1, 1);
                }
                if (doneflag && currlevel == 13) {
                    doneflag = DRLG_L4PlaceMiniSet(L4TWARP, 1, 1, -1, -1, 0, 6);
                }
                ViewY++;
            } else {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 0, 0);
                if (doneflag && currlevel != 16) {
                    doneflag = DRLG_L4PlaceMiniSet(L4DSTAIRS, 1, 1, -1, -1, 0, 1);
                }
                if (doneflag && currlevel == 13) {
                    doneflag = DRLG_L4PlaceMiniSet(L4TWARP, 1, 1, -1, -1, 1, 6);
                }
                ViewX++;
            }
        } else {
            if (entry == ENTRY_MAIN) {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 1, 0);
                if (doneflag) {
                    if (gbMaxPlayers != 1 || quests[Q_DIABLO]._qactive == QUEST_ACTIVE) {
                        doneflag = DRLG_L4PlaceMiniSet(L4PENTA2, 1, 1, -1, -1, 0, 1);
                    } else {
                        doneflag = DRLG_L4PlaceMiniSet(L4PENTA, 1, 1, -1, -1, 0, 1);
                    }
                }
                ViewX++;
            } else {
                doneflag = DRLG_L4PlaceMiniSet(L4USTAIRS, 1, 1, -1, -1, 0, 0);
                if (doneflag) {
                    if (gbMaxPlayers != 1 || quests[Q_DIABLO]._qactive == QUEST_ACTIVE) {
                        doneflag = DRLG_L4PlaceMiniSet(L4PENTA2, 1, 1, -1, -1, 1, 1);
                    } else {
                        doneflag = DRLG_L4PlaceMiniSet(L4PENTA, 1, 1, -1, -1, 1, 1);
                    }
                }
                ViewY++;
            }
        }
    } while (!doneflag);

    DRLG_L4GeneralFix();

    if (currlevel != 16) {
        DRLG_PlaceThemeRooms(7, 10, 6, 8, 1);
    }

    DRLG_L4Shadows();
    DRLG_L4SetWalls();
    DRLG_L4Corners();
    DRLG_L4Subs();
    DRLG_Init_Globals();

    if (QuestStatus(Q_WARLORD)) {
        for (j = 0; j < DMAXY; j++) {
            for (i = 0; i < DMAXX; i++) {
                pdungeon[i][j] = dungeon[i][j];
            }
        }
    }

    DRLG_CheckQuests(SP4x1, SP4y1);

    if (currlevel == 15) {
        for (j = 0; j < DMAXY; j++) {
            for (i = 0; i < DMAXX; i++) {
                if (dungeon[i][j] == 98) {
                    Make_SetPC(i - 1, j - 1, 5, 5);
                }
                if (dungeon[i][j] == 107) {
                    Make_SetPC(i - 1, j - 1, 5, 5);
                }
            }
        }
    }
    if (currlevel == 16) {
        for (j = 0; j < DMAXY; j++) {
            for (i = 0; i < DMAXX; i++) {
                pdungeon[i][j] = dungeon[i][j];
            }
        }
        DRLG_LoadDiabQuads(0);
    }
}

/* @0x80154FE0 */
static void DRLG_L4Pass3()
{
    int i, j, xx, yy;
    long v1, v2, v3, v4, lv;

    lv = 30 - 1;

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

/* @0x801551F8 */
void CreateL4Dungeon(unsigned int rseed, int entry)
{
    SetRndSeed(rseed);

    dmaxx = 96;
    dmaxy = 96;
    dminx = 0;
    dminy = 0;
    ViewX = 40;
    ViewY = 40;

    /* reset the 4 "non-b" quad-file caches (quad1, quad2a, quad3a, quad4a) so a fresh top-level
     * generation reloads them; the "b" variants (2b/3b/4b) are left alone -- matches the oracle. */
    diabQuad1Cache = 0;
    diabQuad2aCache = 0;
    diabQuad3aCache = 0;
    diabQuad4aCache = 0;

    DRLG_InitSetPC();
    DRLG_LoadL4SP();
    DRLG_L4(entry);
    DRLG_L4Pass3();
    DRLG_FreeL4SP();
    DRLG_SetPC();

    MemFreeDbg(diabQuad1Cache);
    MemFreeDbg(diabQuad2aCache);
    MemFreeDbg(diabQuad3aCache);
    MemFreeDbg(diabQuad4aCache);
}
