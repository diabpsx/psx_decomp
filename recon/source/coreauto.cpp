/* COREAUTO.CPP — Diablo PSX (Climax 1998) reconstruction (main image).  Twin: refs/devilution/Source/automap.cpp
 * (GetAutomapType/SetAutomapView).  Layouts / prototypes / externs generated from DIABPSX.SYM
 * (tools/symhdr.py -> gen/*.h).
 * PSX deltas: automapview is BIT-PACKED (unsigned char[5][40], bit x&7 of row x>>3), not a BOOLEAN
 * array like devilution's automapview[DMAXX][DMAXY]; DMAXX==DMAXY==40 here.  GetAutomapType's third
 * (view) parameter is DEAD in this build (every call site + this function itself never test it) —
 * the devilution "view && x==-1 dirt" / bounds-check preamble is simply absent on PSX; the function
 * goes straight from the automapview bit test to the automaptype/dungeon lookup.  The per-type
 * switch only ever sets two local wall flags (AMLWallFlag/AMRWallFlag) that are never read back out
 * in this reconstruction (matches the retail asm: dead stores, kept faithfully per the oracle). */
#include "diabpsx_types.h"
#include "source/gen/structs_coreauto.h"
#include "source/gen/externs_coreauto.h"
#include "source/gen/protos_coreauto.h"
#include "source/diablo.h"

#define DMAXX 40
#define DMAXY 40

#define SET_AUTOMAPVIEW(xc, yc) (automapview[(xc) >> 3][yc] |= (1 << ((xc) & 7)))

/* @0x800809D4 COREAUTO.CPP:158 */
unsigned short GetAutomapType(int x, int y, unsigned char view)
{
    unsigned short rv;
    unsigned char f;
    unsigned char AMLWallFlag;
    unsigned char AMRWallFlag;

    AMRWallFlag = 0;
    AMLWallFlag = 0;
    if (!((automapview[x >> 3][y] >> (x & 7)) & 1))
        return 0;

    rv = automaptype[dungeon[x][y]];
    f = (unsigned char)(rv >> 8);

    switch (rv & 0xF) {
    case 4:
        AMLWallFlag = 1;
        AMRWallFlag = 1;
        break;
    case 2:
    case 5:
    case 8:
        AMLWallFlag = 1;
        break;
    case 3:
    case 6:
    case 9:
        AMRWallFlag = 1;
        break;
    case 1:
    case 7:
    case 10:
    case 11:
    case 12:
        break;
    }

    /* Retail keeps the flag/f computations (a3/t0/a0 in SYM) although nothing reads them in the
     * final code: their uses were tests whose arms cross-jumped together in jump2 (after register
     * allocation), deleting the branches.  These two no-op tests are a stand-in with that property
     * (53/53 insns); the retail spelling is unknown.  Residual: rv/f swap a0<->a1 (retail f is
     * allocated before rv, i.e. its use sits in its own basic block). */
    if (AMLWallFlag == AMRWallFlag) return rv;
    if (f) return rv;
    return rv;
}

/* @0x80080AA8 COREAUTO.CPP:242 */
void SetAutomapView(int x, int y)
{
    int xx, yy;
    unsigned short s, d;

    xx = (x - 16) >> 1;
    yy = (y - 16) >> 1;

    if ((unsigned int)xx >= DMAXX) {
        return;
    }
    if ((unsigned int)yy >= DMAXY) {
        return;
    }

    SET_AUTOMAPVIEW(xx, yy);

    s = GetAutomapType(xx, yy, 0);
    d = s & 0x4000;

    switch (s & 0xF) {
    case 2:
        if (d) {
            if (GetAutomapType(xx, yy + 1, 0) == 0x4007)
                SET_AUTOMAPVIEW(xx, yy + 1);
        } else if (GetAutomapType(xx - 1, yy, 0) & 0x4000) {
            SET_AUTOMAPVIEW(xx - 1, yy);
        }
        break;
    case 3:
        if (d) {
            if (GetAutomapType(xx + 1, yy, 0) == 0x4007)
                SET_AUTOMAPVIEW(xx + 1, yy);
        } else if (GetAutomapType(xx, yy - 1, 0) & 0x4000) {
            SET_AUTOMAPVIEW(xx, yy - 1);
        }
        break;
    case 4:
        if (d) {
            if (GetAutomapType(xx, yy + 1, 0) == 0x4007)
                SET_AUTOMAPVIEW(xx, yy + 1);
            if (GetAutomapType(xx + 1, yy, 0) == 0x4007)
                SET_AUTOMAPVIEW(xx + 1, yy);
        } else {
            if (GetAutomapType(xx - 1, yy, 0) & 0x4000)
                SET_AUTOMAPVIEW(xx - 1, yy);
            if (GetAutomapType(xx, yy - 1, 0) & 0x4000)
                SET_AUTOMAPVIEW(xx, yy - 1);
            if (GetAutomapType(xx - 1, yy - 1, 0) & 0x4000)
                SET_AUTOMAPVIEW(xx - 1, yy - 1);
        }
        break;
    case 5:
        if (d) {
            if (GetAutomapType(xx, yy - 1, 0) & 0x4000)
                SET_AUTOMAPVIEW(xx, yy - 1);
            if (GetAutomapType(xx, yy + 1, 0) == 0x4007)
                SET_AUTOMAPVIEW(xx, yy + 1);
        } else if (GetAutomapType(xx - 1, yy, 0) & 0x4000) {
            SET_AUTOMAPVIEW(xx - 1, yy);
        }
        break;
    case 6:
        if (d) {
            if (GetAutomapType(xx - 1, yy, 0) & 0x4000)
                SET_AUTOMAPVIEW(xx - 1, yy);
            if (GetAutomapType(xx + 1, yy, 0) == 0x4007)
                SET_AUTOMAPVIEW(xx + 1, yy);
        } else if (GetAutomapType(xx, yy - 1, 0) & 0x4000) {
            SET_AUTOMAPVIEW(xx, yy - 1);
        }
        break;
    }
}
