/* GENDUNG.CPP — Diablo PSX (Climax 1998) reconstruction (PREGAME overlay).  Twin: refs/devilution/Source/gendung.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: dTransVal/dFlags live in dung_map[x][y] (scans over 96x96), dungeon is unsigned short [48][48],
 * the .SOL tables load through GRL_LoadFileInMemSig and are followed by ConvertdPiece (no nTransTable / block_lvid). */
#include "diabpsx_types.h"
#include "psxsrc/textfileinfo_header.h"   /* GMAN.H inlines: the ".tp"/".dat" literal pool heads this TU's .sdata */
#include "psxsrc/textdat_header.h"
#include "source/gen/structs_gendung.h"
#include "source/gen/externs_gendung.h"
#include "source/gen/protos_gendung.h"
#include "source/diablo.h"

#define DMAXX 40
#define DMAXY 40

#define DTYPE_TOWN      0
#define DTYPE_CATHEDRAL 1
#define DTYPE_CATACOMBS 2
#define DTYPE_CAVES     3
#define DTYPE_HELL      4

#define BFLAG_POPULATED 0x08
#define DIRTEDGED2 16

/* Complete initialized small-data group, in retail declaration order.
 * Types and ownership follow GENDUNG's global SYM records. */
unsigned char *mydflags = 0;   /* @0x8011C0D8 */
unsigned char *pSetPiece = 0;   /* @0x8011C0DC */
int DungSize = 112 * 112 * 8;   /* @0x8011C0E0: sizeof dung_map */
int setpc_x = 0;   /* @0x8011C0E4 */
int setpc_y = 0;
int setpc_w = 0;
int setpc_h = 0;
unsigned char setloadflag = 0;
int dminx = 0;
int dminy = 0;
int dmaxx = 0;
int dmaxy = 0;
int gnDifficulty = 0;
unsigned char currlevel = 0;
unsigned char leveltype = 0;
unsigned char setlevel = 0;
unsigned char setlvlnum = 0;
unsigned char setlvltype = 0;
int ViewX = 0;
int ViewY = 0;
int ViewDX = 0;
int ViewDY = 0;
int ViewBX = 0;
int ViewBY = 0;
int LvlViewX = 0;
int LvlViewY = 0;
int btmbx = 0;
int btmby = 0;
int btmdx = 0;
int btmdy = 0;
int MicroTileLen = 0;
char TransVal = 0;
int themeCount = 0;

/* Complete zero-initialized .GENDUNG_data group (0x800E40C4..0x80102728).
 * The original PC globals map to these PSX-specific dimensions and map cells. */
unsigned short dungeon[48][48] = {0};
unsigned char pdungeon[40][40] = {0};
unsigned char nBlockTable[2049] = {0};
unsigned char nSolidTable[2049] = {0};
unsigned char nMissileTable[2049] = {0};
unsigned char nTrapTable[2049] = {0};
ScrollStruct ScrollInfo = {0};
unsigned char TransList[256] = {0};
map_info dung_map[112][112] = {0};
unsigned char dung_map_r[56][56] = {0};
unsigned char dung_map_g[56][56] = {0};
unsigned char dung_map_b[56][56] = {0};
int nSxy[16] = {0};

void FillSolidBlockTbls()
{
    unsigned long dwTiles;
    unsigned char *pSBFile;
    unsigned char *pTmp;

    memset(nBlockTable, 0, sizeof(nBlockTable));
    memset(nSolidTable, 0, sizeof(nSolidTable));
    memset(nMissileTable, 0, sizeof(nMissileTable));
    memset(nTrapTable, 0, sizeof(nTrapTable));

    pSBFile = 0;
    switch (leveltype) {
    case DTYPE_TOWN:
        pSBFile = GRL_LoadFileInMemSig("Levels\\TownData\\Town.SOL", &dwTiles);
        break;
    case DTYPE_CATHEDRAL:
        pSBFile = GRL_LoadFileInMemSig("Levels\\L1Data\\L1.SOL", &dwTiles);
        break;
    case DTYPE_CATACOMBS:
        pSBFile = GRL_LoadFileInMemSig("Levels\\L2Data\\L2.SOL", &dwTiles);
        break;
    case DTYPE_CAVES:
        pSBFile = GRL_LoadFileInMemSig("Levels\\L3Data\\L3.SOL", &dwTiles);
        break;
    case DTYPE_HELL:
        pSBFile = GRL_LoadFileInMemSig("Levels\\L4Data\\L4.SOL", &dwTiles);
        break;
    }

    pTmp = pSBFile;

    for (unsigned long d = 1; d <= dwTiles; d++) {
        unsigned char bv = *pTmp++;
        if (bv & 1)
            nSolidTable[d] = 1;
        if (bv & 2)
            nBlockTable[d] = 1;
        if (bv & 4)
            nMissileTable[d] = 1;
        if (bv & 0x80)
            nTrapTable[d] = 1;
    }

    ConvertdPiece();
    MemFreeDbg(pSBFile);
}

void SetDungeonMicros()
{
}

void DRLG_InitTrans()
{
    int x, y;

    for (y = 0; y < 96; y++)
        for (x = 0; x < 96; x++)
            dung_map[x][y].dTransVal = 0;
    memset(TransList, 0, sizeof(TransList));
    TransVal = 1;
}

void DRLG_RectTrans(int x1, int y1, int x2, int y2)
{
    int i, j;

    for (j = y1; j <= y2; j++) {
        for (i = x1; i <= x2; i++)
            dung_map[i][j].dTransVal = TransVal;
    }
    TransVal++;
}

void DRLG_CopyTrans(int sx, int sy, int dx, int dy)
{
    dung_map[dx][dy].dTransVal = dung_map[sx][sy].dTransVal;
}

void DRLG_ListTrans(int num, unsigned char *List)
{
    int i;
    unsigned char x1, y1, x2, y2;

    for (i = 0; i < num; i++) {
        x1 = *List++;
        y1 = *List++;
        x2 = *List++;
        y2 = *List++;
        DRLG_RectTrans(x1, y1, x2, y2);
    }
}

void DRLG_AreaTrans(int num, unsigned char *List)
{
    int i;
    unsigned char x1, y1, x2, y2;

    for (i = 0; i < num; i++) {
        x1 = *List++;
        y1 = *List++;
        x2 = *List++;
        y2 = *List++;
        DRLG_RectTrans(x1, y1, x2, y2);
        TransVal--;
    }
    TransVal++;
}

void DRLG_InitSetPC()
{
    setpc_x = 0;
    setpc_y = 0;
    setpc_w = 0;
    setpc_h = 0;
}

void DRLG_SetPC()
{
    int i, j, x, y, w, h;

    w = 2 * setpc_w;
    h = 2 * setpc_h;
    x = 2 * setpc_x + 16;
    y = 2 * setpc_y + 16;

    for (j = 0; j < h; j++) {
        for (i = 0; i < w; i++)
            dung_map[x + i][y + j].dFlags |= BFLAG_POPULATED;
    }
}

void Make_SetPC(int x, int y, int w, int h)
{
    int i, j, dx, dy, dh, dw;

    dw = 2 * w;
    dh = 2 * h;
    dx = 2 * x + 16;
    dy = 2 * y + 16;

    for (j = 0; j < dh; j++) {
        for (i = 0; i < dw; i++)
            dung_map[dx + i][dy + j].dFlags |= BFLAG_POPULATED;
    }
}

unsigned char DRLG_WillThemeRoomFit(int floor, int x, int y, int minSize, int maxSize, int *width, int *height)
{
    int ii, xx, yy;
    int xSmallest, ySmallest;
    int xArray[20], yArray[20];
    int xCount, yCount;
    unsigned char yFlag, xFlag;

    xCount = 0;
    yCount = 0;
    yFlag = 1;
    xFlag = 1;

    if (x > DMAXX - maxSize && y > DMAXY - maxSize)
        return 0;
    if (!SkipThemeRoom(x, y))
        return 0;

    memset(xArray, 0, sizeof(xArray));
    memset(yArray, 0, sizeof(yArray));

    for (ii = 0; ii < maxSize; ii++) {
        if (xFlag) {
            for (xx = x; xx < x + maxSize; xx++) {
                if (dungeon[xx][y + ii] != floor) {
                    if (xx >= minSize)
                        break;
                    xFlag = 0;
                } else {
                    xCount++;
                }
            }
            if (xFlag) {
                xArray[ii] = xCount;
                xCount = 0;
            }
        }
        if (yFlag) {
            for (yy = y; yy < y + maxSize; yy++) {
                if (dungeon[x + ii][yy] != floor) {
                    if (yy >= minSize)
                        break;
                    yFlag = 0;
                } else {
                    yCount++;
                }
            }
            if (yFlag) {
                yArray[ii] = yCount;
                yCount = 0;
            }
        }
    }

    for (ii = 0; ii < minSize; ii++) {
        if (xArray[ii] < minSize || yArray[ii] < minSize)
            return 0;
    }

    xSmallest = xArray[0];
    ySmallest = yArray[0];

    for (ii = 0; ii < maxSize; ii++) {
        if (xArray[ii] < minSize || yArray[ii] < minSize)
            break;
        if (xArray[ii] < xSmallest)
            xSmallest = xArray[ii];
        if (yArray[ii] < ySmallest)
            ySmallest = yArray[ii];
    }

    *width = xSmallest - 2;
    *height = ySmallest - 2;
    return 1;
}

void DRLG_CreateThemeRoom(int themeIndex)
{
	int xx;
	int yy;


	for (yy = themeLoc[themeIndex].y; yy < (themeLoc[themeIndex].y + themeLoc[themeIndex].height); yy++) {
		for (xx = themeLoc[themeIndex].x; xx < (themeLoc[themeIndex].x + themeLoc[themeIndex].width); xx++) {
			if (leveltype == 2) {

				if ((yy == themeLoc[themeIndex].y && (xx >= themeLoc[themeIndex].x && (xx <= themeLoc[themeIndex].x + themeLoc[themeIndex].width))) ||
					((yy == themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)) && (xx >= themeLoc[themeIndex].x && (xx <= themeLoc[themeIndex].x + themeLoc[themeIndex].width))))
					dungeon[xx][yy] = 2;

				else if ((xx == themeLoc[themeIndex].x && (yy >= themeLoc[themeIndex].y && (yy <= themeLoc[themeIndex].y + themeLoc[themeIndex].height))) ||
						 ((xx == themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)) && (yy >= themeLoc[themeIndex].y && (yy <= themeLoc[themeIndex].y + themeLoc[themeIndex].height))))
						 dungeon[xx][yy] = 1;

				else dungeon[xx][yy] = 3;
			}
			if (leveltype == 3) {

				if ((yy == themeLoc[themeIndex].y && (xx >= themeLoc[themeIndex].x && (xx <= themeLoc[themeIndex].x + themeLoc[themeIndex].width))) ||
					((yy == themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)) && (xx >= themeLoc[themeIndex].x && (xx <= themeLoc[themeIndex].x + themeLoc[themeIndex].width))))
					dungeon[xx][yy] = 134;

				else if ((xx == themeLoc[themeIndex].x && (yy >= themeLoc[themeIndex].y && (yy <= themeLoc[themeIndex].y + themeLoc[themeIndex].height))) ||
						 ((xx == themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)) && (yy >= themeLoc[themeIndex].y && (yy <= themeLoc[themeIndex].y + themeLoc[themeIndex].height))))
					dungeon[xx][yy] = 137;

				else  dungeon[xx][yy] = 7;
			}
			if (leveltype == 4) {

				if ((yy == themeLoc[themeIndex].y && (xx >= themeLoc[themeIndex].x && (xx <= themeLoc[themeIndex].x + themeLoc[themeIndex].width))) ||
					((yy == themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)) && (xx >= themeLoc[themeIndex].x && (xx <= themeLoc[themeIndex].x + themeLoc[themeIndex].width))))
					dungeon[xx][yy] = 2;

				else if ((xx == themeLoc[themeIndex].x && (yy >= themeLoc[themeIndex].y && (yy <= themeLoc[themeIndex].y + themeLoc[themeIndex].height))) ||
						 ((xx == themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)) && (yy >= themeLoc[themeIndex].y && (yy <= themeLoc[themeIndex].y + themeLoc[themeIndex].height))))
					dungeon[xx][yy] = 1;

				else  dungeon[xx][yy] = 6;
			}
		}
	}


	if (leveltype == 2) {
		dungeon[themeLoc[themeIndex].x][themeLoc[themeIndex].y] = 8;
		dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y] = 7;
		dungeon[themeLoc[themeIndex].x][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 9;
		dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 6;
	}
	if (leveltype == 3) {
		dungeon[themeLoc[themeIndex].x][themeLoc[themeIndex].y] = 150;
		dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y] = 151;
		dungeon[themeLoc[themeIndex].x][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 152;
		dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 138;
	}
	if (leveltype == 4) {
		dungeon[themeLoc[themeIndex].x][themeLoc[themeIndex].y] = 9;
		dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y] = 16;
		dungeon[themeLoc[themeIndex].x][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 15;
		dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 12;
	}


	if (leveltype == 2) {
		switch(ENG_random(2)) {

			case 0 : dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height / 2)] = 4;
					 break;

			case 1 : dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width / 2)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 5;
					 break;
		}
	}
	if (leveltype == 3) {
		switch(ENG_random(2)) {

			case 0 : dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height / 2)] = 147;
					 break;

			case 1 : dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width / 2)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 146;
					 break;
		}
	}
	if (leveltype == 4) {
		switch(ENG_random(2)) {

			case 0 : dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][(themeLoc[themeIndex].y + (themeLoc[themeIndex].height / 2))-1] = 53;
					 dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height / 2)] = 6;
					 dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-1)][(themeLoc[themeIndex].y + (themeLoc[themeIndex].height / 2))+1] = 52;

					 dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width-2)][(themeLoc[themeIndex].y + (themeLoc[themeIndex].height / 2))-1] = 54;
					 break;

			case 1 : dungeon[(themeLoc[themeIndex].x + (themeLoc[themeIndex].width / 2))-1][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 57;
					 dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width / 2)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 6;
					 dungeon[(themeLoc[themeIndex].x + (themeLoc[themeIndex].width / 2))+1][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-1)] = 56;

					 dungeon[themeLoc[themeIndex].x + (themeLoc[themeIndex].width / 2)][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-2)] = 59;
					 dungeon[(themeLoc[themeIndex].x + (themeLoc[themeIndex].width / 2))-1][themeLoc[themeIndex].y + (themeLoc[themeIndex].height-2)] = 58;
					 break;
		}
	}
}

void DRLG_PlaceThemeRooms(int minSize, int maxSize, int floor, int freq, unsigned char rndSize)
{
    int i;
    int j;
    int themeW;
    int themeH;

    themeCount = 0;
    memset(themeLoc, 0x00, sizeof(THEME_LOC));

    for (j = 0; j < DMAXY; j++) {
        for (i = 0; i < DMAXX; i++) {
            if ((dungeon[i][j] == floor) && (!ENG_random(freq))) {
                if (DRLG_WillThemeRoomFit(floor, i, j, minSize, maxSize, &themeW, &themeH)) {
                    if (rndSize) {
                        int rv1, rv2, min, max;
                        min = minSize - 2;
                        max = maxSize - 2;
                        rv1 = ENG_random(((themeW - min) + 1));
                        rv2 = min + ENG_random(rv1);
                        if (rv2 < min || rv2 > max) themeW = min;
                        else themeW = rv2;
                        rv1 = ENG_random(((themeH - min) + 1));
                        rv2 = min + ENG_random(rv1);
                        if (rv2 < min || rv2 > max) themeH = min;
                        else themeH = rv2;
                    }
                    themeLoc[themeCount].x = i + 1;
                    themeLoc[themeCount].y = j + 1;
                    themeLoc[themeCount].width = themeW;
                    themeLoc[themeCount].height = themeH;
                    if (leveltype == 3) {
                        DRLG_RectTrans(
                            ((i + 2) << 1) + DIRTEDGED2,
                            ((j + 2) << 1) + DIRTEDGED2,
                            (((i + themeW) - 1) << 1) + DIRTEDGED2 + 1,
                            (((j + themeH) - 1) << 1) + DIRTEDGED2 + 1);
                    } else DRLG_MRectTrans(i + 1, j + 1, (i + themeW), (j + themeH));
                    themeLoc[themeCount].ttval = TransVal - 1;
                    DRLG_CreateThemeRoom(themeCount);
                    themeCount++;
                }
            }
        }
    }
}

void DRLG_HoldThemeRooms()
{
    int i, x, y;

    if (themeCount > 0) {
        for (i = 0; i < themeCount; i++) {
            for (y = themeLoc[i].y; y < themeLoc[i].y + themeLoc[i].height - 1; y++) {
                for (x = themeLoc[i].x; x < themeLoc[i].x + themeLoc[i].width - 1; x++) {
                    dung_map[2 * x + 16][2 * y + 16].dFlags |= BFLAG_POPULATED;
                    dung_map[2 * x + 17][2 * y + 16].dFlags |= BFLAG_POPULATED;
                    dung_map[2 * x + 16][2 * y + 17].dFlags |= BFLAG_POPULATED;
                    dung_map[2 * x + 17][2 * y + 17].dFlags |= BFLAG_POPULATED;
                }
            }
        }
    }
}

unsigned char SkipThemeRoom(int x, int y)
{
    int i;

    for (i = 0; i < themeCount; i++) {
        if (x >= themeLoc[i].x - 2 && x <= themeLoc[i].x + themeLoc[i].width + 2
            && y >= themeLoc[i].y - 2 && y <= themeLoc[i].y + themeLoc[i].height + 2)
            return 0;
    }

    return 1;
}

void InitLevels()
{
    if (!leveldebug) {
        currlevel = 0;
        leveltype = DTYPE_TOWN;
        setlevel = 0;
    }
    for (int i = 0; i < 16; i++)
        nSxy[i] = -1;
}
