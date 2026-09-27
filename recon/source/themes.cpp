/* THEMES.CPP — Diablo PSX (Climax 1998) reconstruction (PREGAME overlay).  Twin: refs/devilution/Source/themes.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: nSolidTable/nTrapTable -> GetSOLID/GetTRAP, random_(idx, n) -> ENG_random(n), the dungeon
 * scan loops run over 96x96, dMonster/dFlags/dObject/dItem/dTransVal live in dung_map[x][y]. */
#include "diabpsx_types.h"
#include "source/gen/structs_themes.h"
#include "source/gen/externs_themes.h"
#include "source/gen/protos_themes.h"
#include "source/diablo.h"

#define MAXDUNX 96
#define MAXDUNY 96
#define MAXTHEMES 50

#define DTYPE_CATHEDRAL 1
#define DTYPE_CATACOMBS 2
#define DTYPE_CAVES     3
#define DTYPE_HELL      4

#define THEME_BARREL            0
#define THEME_SHRINE            1
#define THEME_MONSTPIT          2
#define THEME_SKELROOM          3
#define THEME_TREASURE          4
#define THEME_LIBRARY           5
#define THEME_TORTURE           6
#define THEME_BLOODFOUNTAIN     7
#define THEME_DECAPITATED       8
#define THEME_PURIFYINGFOUNTAIN 9
#define THEME_ARMORSTAND        10
#define THEME_GOATSHRINE        11
#define THEME_CAULDRON          12
#define THEME_MURKYFOUNTAIN     13
#define THEME_TEARFOUNTAIN      14
#define THEME_BRNCROSS          15
#define THEME_WEAPONRACK        16
#define THEME_NONE              -1

#define OBJ_SKFIRE        3
#define OBJ_CANDLE2       9
#define OBJ_BANNERL       11
#define OBJ_BANNERM       12
#define OBJ_BANNERR       13
#define OBJ_TNUDEM2       30
#define OBJ_BARREL        57
#define OBJ_BARRELEX      58
#define OBJ_SHRINEL       59
#define OBJ_SHRINER       60
#define OBJ_SKELBOOK      61
#define OBJ_BOOKCASEL     62
#define OBJ_BOOKCASER     63
#define OBJ_BOOKSTAND     64
#define OBJ_BOOKCANDLE    65
#define OBJ_BLOODFTN      66
#define OBJ_DECAP         67
#define OBJ_PURIFYINGFTN  76
#define OBJ_ARMORSTAND    77
#define OBJ_ARMORSTANDN   78
#define OBJ_GOATSHRINE    79
#define OBJ_CAULDRON      80
#define OBJ_MURKYFTN      81
#define OBJ_TEARFTN       82
#define OBJ_TBCROSS       91
#define OBJ_WEAPONRACK    92
#define OBJ_WEAPONRACKN   93

#define ITYPE_GOLD    11
#define IMISC_NONE    0
#define PLACE_SCATTER 1
#define BFLAG_POPULATED 0x08
#define Q_ZHAR 3

/* TU-owned small data (.sdata/.sbss, gp-relative in retail) */
int numthemes;
unsigned char armorFlag;
unsigned char weaponFlag;
unsigned char treasureFlag;
unsigned char mFountainFlag;
unsigned char cauldronFlag;
unsigned char tFountainFlag;
int zharlib;
int themex;
int themey;
int themeVar1;
unsigned char pFountainFlag;
unsigned char bFountainFlag;
unsigned char bCrossFlag;

unsigned char TFit_Shrine(int i)
{
    int xp, yp, found;

    xp = 0;
    yp = 0;
    found = 0;
    while (found == 0) {
        if (dung_map[xp][yp].dTransVal == theme[i].ttval) {
            if (GetTRAP(xp, yp - 1)
                && !GetSOLID(xp - 1, yp)
                && !GetSOLID(xp + 1, yp)
                && dung_map[xp - 1][yp].dTransVal == theme[i].ttval
                && dung_map[xp + 1][yp].dTransVal == theme[i].ttval
                && dung_map[xp - 1][yp - 1].dObject == 0
                && dung_map[xp + 1][yp - 1].dObject == 0) {
                found = 1;
            }
            if (found == 0) {
                if (GetTRAP(xp - 1, yp)
                    && !GetSOLID(xp, yp - 1)
                    && !GetSOLID(xp, yp + 1)
                    && dung_map[xp][yp - 1].dTransVal == theme[i].ttval
                    && dung_map[xp][yp + 1].dTransVal == theme[i].ttval
                    && dung_map[xp - 1][yp - 1].dObject == 0
                    && dung_map[xp - 1][yp + 1].dObject == 0) {
                    found = 2;
                }
            }
        }
        if (found == 0) {
            xp++;
            if (xp == MAXDUNX) {
                xp = 0;
                yp++;
                if (yp == MAXDUNY)
                    return 0;
            }
        }
    }
    themex = xp;
    themey = yp;
    themeVar1 = found;
    return 1;
}

unsigned char TFit_Obj5(int t)
{
    int xp, yp;
    int i, r, rs;
    unsigned char found;

    xp = 0;
    yp = 0;
    r = ENG_random(5) + 1;
    rs = r;
    while (r > 0) {
        found = 0;
        if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
            found = 1;
            for (i = 0; found && i < 25; i++) {
                if (GetSOLID(xp + trm5x[i], yp + trm5y[i]))
                    found = 0;
                if (dung_map[xp + trm5x[i]][yp + trm5y[i]].dTransVal != theme[t].ttval)
                    found = 0;
            }
        }

        if (!found) {
            xp++;
            if (xp == MAXDUNX) {
                xp = 0;
                yp++;
                if (yp == MAXDUNY) {
                    if (r == rs)
                        return 0;
                    yp = 0;
                }
            }
            continue;
        }

        r--;
    }

    themex = xp;
    themey = yp;

    return 1;
}

unsigned char TFit_SkelRoom(int t)
{
    int i;

    if (leveltype == DTYPE_CATHEDRAL || leveltype == DTYPE_CATACOMBS) {
        for (i = 0; i < nummtypes; i++) {
            if (IsSkel(Monsters[i].mtype)) {
                themeVar1 = i;
                return TFit_Obj5(t);
            }
        }
    }

    return 0;
}

unsigned char TFit_GoatShrine(int t)
{
    int i;

    for (i = 0; i < nummtypes; i++) {
        if (IsGoat(Monsters[i].mtype)) {
            themeVar1 = i;
            return TFit_Obj5(t);
        }
    }

    return 0;
}

unsigned char CheckThemeObj3(int xp, int yp, int t, int f)
{
    for (int i = 0; i < 9; i++) {
        if (xp + trm3x[i] < 0 || yp + trm3y[i] < 0)
            return 0;
        if (GetSOLID(xp + trm3x[i], yp + trm3y[i]))
            return 0;
        if (dung_map[xp + trm3x[i]][yp + trm3y[i]].dTransVal != theme[t].ttval)
            return 0;
        if (dung_map[xp + trm3x[i]][yp + trm3y[i]].dObject)
            return 0;
        if (f != -1 && ENG_random(f) == 0)
            return 0;
    }

    return 1;
}

unsigned char TFit_Obj3(int t)
{
    int xp, yp;
    char objrnd[4] = { 4, 4, 3, 5 };

    for (yp = 1; yp < MAXDUNY - 1; yp++) {
        for (xp = 1; xp < MAXDUNX - 1; xp++) {
            if (CheckThemeObj3(xp, yp, t, objrnd[leveltype - 1])) {
                themex = xp;
                themey = yp;
                return 1;
            }
        }
    }

    return 0;
}

unsigned char CheckThemeReqs(int t)
{
    unsigned char rv;

    rv = 1;
    switch (t) {
    case THEME_SHRINE:
    case THEME_SKELROOM:
    case THEME_LIBRARY:
        if (leveltype == DTYPE_CAVES || leveltype == DTYPE_HELL)
            rv = 0;
        break;
    case THEME_BLOODFOUNTAIN:
        if (!bFountainFlag)
            rv = 0;
        break;
    case THEME_PURIFYINGFOUNTAIN:
        if (!pFountainFlag)
            rv = 0;
        break;
    case THEME_MURKYFOUNTAIN:
        if (!mFountainFlag)
            rv = 0;
        break;
    case THEME_TEARFOUNTAIN:
        if (!tFountainFlag)
            rv = 0;
        break;
    case THEME_ARMORSTAND:
    case THEME_WEAPONRACK:
        if (leveltype == DTYPE_CATHEDRAL)
            rv = 0;
        break;
    case THEME_CAULDRON:
        if (leveltype != DTYPE_HELL || !cauldronFlag)
            rv = 0;
        break;
    }

    return rv;
}

unsigned char SpecialThemeFit(int i, int t)
{
    unsigned char rv;

    rv = CheckThemeReqs(t);
    switch (t) {
    case THEME_SHRINE:
    case THEME_LIBRARY:
        if (rv)
            rv = TFit_Shrine(i);
        break;
    case THEME_SKELROOM:
        if (rv)
            rv = TFit_SkelRoom(i);
        break;
    case THEME_BLOODFOUNTAIN:
        if (rv)
            rv = TFit_Obj5(i);
        if (rv)
            bFountainFlag = 0;
        break;
    case THEME_PURIFYINGFOUNTAIN:
        if (rv)
            rv = TFit_Obj5(i);
        if (rv)
            pFountainFlag = 0;
        break;
    case THEME_MURKYFOUNTAIN:
        if (rv)
            rv = TFit_Obj5(i);
        if (rv)
            mFountainFlag = 0;
        break;
    case THEME_TEARFOUNTAIN:
        if (rv)
            rv = TFit_Obj5(i);
        if (rv)
            tFountainFlag = 0;
        break;
    case THEME_CAULDRON:
        if (rv)
            rv = TFit_Obj5(i);
        if (rv)
            cauldronFlag = 0;
        break;
    case THEME_GOATSHRINE:
        if (rv)
            rv = TFit_GoatShrine(i);
        break;
    case THEME_TORTURE:
    case THEME_DECAPITATED:
    case THEME_ARMORSTAND:
    case THEME_BRNCROSS:
    case THEME_WEAPONRACK:
        if (rv)
            rv = TFit_Obj3(i);
        break;
    case THEME_TREASURE:
        rv = treasureFlag;
        if (rv)
            treasureFlag = 0;
        break;
    }

    return rv;
}

unsigned char CheckThemeRoom(int tv)
{
    int i, j, tarea;

    for (i = 0; i < numtrigs; i++) {
        if (dung_map[trigs[i]._tx][trigs[i]._ty].dTransVal == tv)
            return 0;
    }

    tarea = 0;
    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (dung_map[i][j].dTransVal != tv)
                continue;
            if (dung_map[i][j].dFlags & BFLAG_POPULATED)
                return 0;

            tarea++;
        }
    }

    if (leveltype == DTYPE_CATHEDRAL && (tarea < 9 || tarea > 100))
        return 0;

    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (dung_map[i][j].dTransVal == tv && !GetSOLID(i, j)) {
                if (dung_map[i - 1][j].dTransVal != tv && !GetSOLID(i - 1, j))
                    return 0;
                if (dung_map[i + 1][j].dTransVal != tv && !GetSOLID(i + 1, j))
                    return 0;
                if (dung_map[i][j - 1].dTransVal != tv && !GetSOLID(i, j - 1))
                    return 0;
                if (dung_map[i][j + 1].dTransVal != tv && !GetSOLID(i, j + 1))
                    return 0;
            }
        }
    }

    return 1;
}

void InitThemes()
{
    int i, t;

    zharlib = -1;
    numthemes = 0;
    armorFlag = 1;
    bFountainFlag = 1;
    cauldronFlag = 1;
    mFountainFlag = 1;
    pFountainFlag = 1;
    tFountainFlag = 1;
    treasureFlag = 1;
    bCrossFlag = 0;
    weaponFlag = 1;

    if (currlevel == 16)
        return;

    if (leveltype == DTYPE_CATHEDRAL) {
        for (i = 0; i < 4; i++)
            ThemeGoodIn[i] = 0;

        for (i = 0; i < 256 && numthemes < MAXTHEMES; i++) {
            if (CheckThemeRoom(i)) {
                theme[numthemes].ttval = i;
                for (t = ThemeGood[ENG_random(4)];; t = ENG_random(17)) {
                    if (SpecialThemeFit(numthemes, t))
                        break;
                }
                theme[numthemes].ttype = t;
                numthemes++;
            }
        }
    }
    if (leveltype == DTYPE_CATACOMBS || leveltype == DTYPE_CAVES || leveltype == DTYPE_HELL) {
        for (i = 0; i < themeCount; i++)
            theme[i].ttype = THEME_NONE;
        if (QuestStatus(Q_ZHAR)) {
            for (i = 0; i < themeCount; i++) {
                theme[i].ttval = themeLoc[i].ttval;
                if (SpecialThemeFit(i, THEME_LIBRARY)) {
                    theme[i].ttype = THEME_LIBRARY;
                    zharlib = i;
                    break;
                }
            }
        }
        for (i = 0; i < themeCount; i++) {
            if (theme[i].ttype == THEME_NONE) {
                theme[i].ttval = themeLoc[i].ttval;
                for (t = ThemeGood[ENG_random(4)];; t = ENG_random(17)) {
                    if (SpecialThemeFit(i, t))
                        break;
                }
                theme[i].ttype = t;
            }
        }
        numthemes += themeCount;
    }
}

void HoldThemeRooms()
{
    int i, x, y;
    char v;

    if (currlevel != 16) {
        if (leveltype == DTYPE_CATHEDRAL) {
            for (i = 0; i < numthemes; i++) {
                v = theme[i].ttval;
                for (y = 0; y < MAXDUNY; y++) {
                    for (x = 0; x < MAXDUNX; x++) {
                        if (dung_map[x][y].dTransVal == v)
                            dung_map[x][y].dFlags |= BFLAG_POPULATED;
                    }
                }
            }
        } else {
            DRLG_HoldThemeRooms();
        }
    }
}

void PlaceThemeMonsts(int t, int f)
{
    int xp, yp;
    int mtype;
    int scattertypes[111];
    int numscattypes;
    int i;

    numscattypes = 0;
    for (i = 0; i < nummtypes; i++) {
        if (Monsters[i].mPlaceFlags & PLACE_SCATTER) {
            scattertypes[numscattypes] = i;
            numscattypes++;
        }
    }
    mtype = scattertypes[ENG_random(numscattypes)];
    for (yp = 0; yp < MAXDUNY; yp++) {
        for (xp = 0; xp < MAXDUNX; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp) && dung_map[xp][yp].dItem == 0 && dung_map[xp][yp].dObject == 0) {
                if (ENG_random(f) == 0)
                    AddMonster(xp, yp, ENG_random(8), mtype, 1);
            }
        }
    }
}

void Theme_Barrel(int t)
{
    int xp, yp, r;
    char barrnd[4] = { 2, 6, 4, 8 };
    char monstrnd[4] = { 5, 7, 3, 9 };

    for (yp = 0; yp < MAXDUNY; yp++) {
        for (xp = 0; xp < MAXDUNX; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
                if (ENG_random(barrnd[leveltype - 1]) == 0) {
                    if (ENG_random(barrnd[leveltype - 1]) == 0)
                        r = OBJ_BARREL;
                    else
                        r = OBJ_BARRELEX;
                    AddObject(r, xp, yp);
                }
            }
        }
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_Shrine(int t)
{
    char monstrnd[4] = { 6, 6, 3, 9 };

    TFit_Shrine(t);
    if (themeVar1 == 1) {
        AddObject(OBJ_CANDLE2, themex - 1, themey);
        AddObject(OBJ_SHRINER, themex, themey);
        AddObject(OBJ_CANDLE2, themex + 1, themey);
    } else {
        AddObject(OBJ_CANDLE2, themex, themey - 1);
        AddObject(OBJ_SHRINEL, themex, themey);
        AddObject(OBJ_CANDLE2, themex, themey + 1);
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_MonstPit(int t)
{
    int r;
    int ixp, iyp;
    char monstrnd[4] = { 6, 7, 3, 9 };

    r = ENG_random(100) + 1;
    ixp = 0;
    iyp = 0;
    while (r > 0) {
        if (dung_map[ixp][iyp].dTransVal == theme[t].ttval && !GetSOLID(ixp, iyp))
            --r;
        if (r <= 0)
            continue;
        ixp++;
        if (ixp == MAXDUNX) {
            ixp = 0;
            iyp++;
            if (iyp == MAXDUNY)
                return;
        }
    }
    CreateRndItem(ixp, iyp, 1, 0, 1);
    ItemNoFlippy();
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_SkelRoom(int t)
{
    int xp, yp;
    char monstrnd[4] = { 6, 7, 3, 9 };

    TFit_SkelRoom(t);

    xp = themex;
    yp = themey;

    AddObject(OBJ_SKFIRE, xp, yp);

    if (ENG_random(monstrnd[leveltype - 1]) != 0)
        SpawnSkeleton(PreSpawnSkeleton(), xp - 1, yp - 1);
    else
        AddObject(OBJ_BANNERL, xp - 1, yp - 1);

    SpawnSkeleton(PreSpawnSkeleton(), xp, yp - 1);

    if (ENG_random(monstrnd[leveltype - 1]) != 0)
        SpawnSkeleton(PreSpawnSkeleton(), xp + 1, yp - 1);
    else
        AddObject(OBJ_BANNERR, xp + 1, yp - 1);
    if (ENG_random(monstrnd[leveltype - 1]) != 0)
        SpawnSkeleton(PreSpawnSkeleton(), xp - 1, yp);
    else
        AddObject(OBJ_BANNERM, xp - 1, yp);
    if (ENG_random(monstrnd[leveltype - 1]) != 0)
        SpawnSkeleton(PreSpawnSkeleton(), xp + 1, yp);
    else
        AddObject(OBJ_BANNERM, xp + 1, yp);
    if (ENG_random(monstrnd[leveltype - 1]) != 0)
        SpawnSkeleton(PreSpawnSkeleton(), xp - 1, yp + 1);
    else
        AddObject(OBJ_BANNERR, xp - 1, yp + 1);

    SpawnSkeleton(PreSpawnSkeleton(), xp, yp + 1);

    if (ENG_random(monstrnd[leveltype - 1]) != 0)
        SpawnSkeleton(PreSpawnSkeleton(), xp + 1, yp + 1);
    else
        AddObject(OBJ_BANNERL, xp + 1, yp + 1);

    if (dung_map[xp][yp - 3].dObject == 0) {
        if (!GetSOLID(xp, yp - 3))
            AddObject(OBJ_SKELBOOK, xp, yp - 2);
        else
            AddObject(OBJ_SKELBOOK, xp, yp - 1);
    }
    if (dung_map[xp][yp + 3].dObject == 0) {
        if (!GetSOLID(xp, yp + 3))
            AddObject(OBJ_SKELBOOK, xp, yp + 2);
        else
            AddObject(OBJ_SKELBOOK, xp, yp + 1);
    }
}

void Theme_Treasure(int t)
{
    int xp, yp;
    int i;
    char treasrnd[4] = { 4, 9, 7, 10 };
    char monstrnd[4] = { 6, 8, 3, 7 };

    GetRndSeed();
    for (yp = 0; yp < MAXDUNY; yp++) {
        for (xp = 0; xp < MAXDUNX; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
                int rv = ENG_random(treasrnd[leveltype - 1]);
                if ((2 * ENG_random(treasrnd[leveltype - 1])) == 0) {
                    CreateTypeItem(xp, yp, 0, ITYPE_GOLD, IMISC_NONE, 0, 1);
                    ItemNoFlippy();
                }
                if (rv == 0) {
                    CreateRndItem(xp, yp, 0, 0, 1);
                    ItemNoFlippy();
                }
                if (rv == 0 || rv >= treasrnd[leveltype - 1] - 2) {
                    i = ItemNoFlippy();
                    if (rv >= treasrnd[leveltype - 1] - 2 && leveltype != DTYPE_CATHEDRAL)
                        item[i]._ivalue >>= 1;
                }
            }
        }
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_Library(int t)
{
    int xp, yp, oi;
    char librnd[4] = { 1, 2, 2, 5 };
    char monstrnd[4] = { 5, 7, 3, 9 };

    TFit_Shrine(t);

    if (themeVar1 == 1) {
        AddObject(OBJ_BOOKCANDLE, themex - 1, themey);
        AddObject(OBJ_BOOKCASER, themex, themey);
        AddObject(OBJ_BOOKCANDLE, themex + 1, themey);
    } else {
        AddObject(OBJ_BOOKCANDLE, themex, themey - 1);
        AddObject(OBJ_BOOKCASEL, themex, themey);
        AddObject(OBJ_BOOKCANDLE, themex, themey + 1);
    }

    for (yp = 1; yp < MAXDUNY - 1; yp++) {
        for (xp = 1; xp < MAXDUNX - 1; xp++) {
            if (CheckThemeObj3(xp, yp, t, -1) && dung_map[xp][yp].dMonster == 0 && ENG_random(librnd[leveltype - 1]) == 0) {
                int lnumobjects = numobjects;
                AddObject(OBJ_BOOKSTAND, xp, yp);
                if (numobjects != lnumobjects && ENG_random(2 * librnd[leveltype - 1]) != 0) {
                    oi = dung_map[xp][yp].dObject - 1;
                    object[oi]._oSelFlag = 0;
                    object[oi]._oAnimFrame += 2;
                }
            }
        }
    }

    if (!QuestStatus(Q_ZHAR) || t != zharlib)
        PlaceThemeMonsts(t, monstrnd[leveltype]);
}

void Theme_Torture(int t)
{
    int xp, yp;
    char tortrnd[4] = { 6, 8, 3, 8 };
    char monstrnd[4] = { 6, 8, 3, 9 };

    for (yp = 1; yp < MAXDUNY - 1; yp++) {
        for (xp = 1; xp < MAXDUNX - 1; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
                if (CheckThemeObj3(xp, yp, t, -1) && ENG_random(tortrnd[leveltype - 1]) == 0)
                    AddObject(OBJ_TNUDEM2, xp, yp);
            }
        }
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_BloodFountain(int t)
{
    char monstrnd[4] = { 6, 8, 3, 9 };

    TFit_Obj5(t);
    AddObject(OBJ_BLOODFTN, themex, themey);
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_Decap(int t)
{
    int xp, yp;
    char decaprnd[4] = { 6, 8, 3, 8 };
    char monstrnd[4] = { 6, 8, 3, 9 };

    for (yp = 1; yp < MAXDUNY - 1; yp++) {
        for (xp = 1; xp < MAXDUNX - 1; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
                if (CheckThemeObj3(xp, yp, t, -1) && ENG_random(decaprnd[leveltype - 1]) == 0)
                    AddObject(OBJ_DECAP, xp, yp);
            }
        }
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_PurifyingFountain(int t)
{
    char monstrnd[4] = { 6, 7, 3, 9 };

    TFit_Obj5(t);
    AddObject(OBJ_PURIFYINGFTN, themex, themey);
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_ArmorStand(int t)
{
    int xp, yp;
    char armorrnd[4] = { 6, 8, 3, 8 };
    char monstrnd[4] = { 6, 7, 3, 9 };

    if (armorFlag) {
        TFit_Obj3(t);
        AddObject(OBJ_ARMORSTAND, themex, themey);
    }
    for (yp = 0; yp < MAXDUNY; yp++) {
        for (xp = 0; xp < MAXDUNX; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
                if (CheckThemeObj3(xp, yp, t, -1) && ENG_random(armorrnd[leveltype - 1]) == 0)
                    AddObject(OBJ_ARMORSTANDN, xp, yp);
            }
        }
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
    armorFlag = 0;
}

void Theme_GoatShrine(int t)
{
    int xx, yy;

    TFit_GoatShrine(t);
    AddObject(OBJ_GOATSHRINE, themex, themey);
    for (yy = themey - 1; yy <= themey + 1; yy++) {
        for (xx = themex - 1; xx <= themex + 1; xx++) {
            if (dung_map[xx][yy].dTransVal == theme[t].ttval && !GetSOLID(xx, yy) && (xx != themex || yy != themey))
                AddMonster(xx, yy, DIR_SW, themeVar1, 1);
        }
    }
}

void Theme_Cauldron(int t)
{
    char monstrnd[4] = { 6, 7, 3, 9 };

    TFit_Obj5(t);
    AddObject(OBJ_CAULDRON, themex, themey);
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_MurkyFountain(int t)
{
    char monstrnd[4] = { 6, 7, 3, 9 };

    TFit_Obj5(t);
    AddObject(OBJ_MURKYFTN, themex, themey);
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_TearFountain(int t)
{
    char monstrnd[4] = { 6, 7, 3, 9 };

    TFit_Obj5(t);
    AddObject(OBJ_TEARFTN, themex, themey);
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
}

void Theme_BrnCross(int t)
{
    int xp, yp;
    char monstrnd[4] = { 6, 8, 3, 9 };
    char bcrossrnd[4] = { 5, 7, 3, 8 };

    for (yp = 0; yp < MAXDUNY; yp++) {
        for (xp = 0; xp < MAXDUNX; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
                if (CheckThemeObj3(xp, yp, t, -1) && ENG_random(bcrossrnd[leveltype - 1]) == 0)
                    AddObject(OBJ_TBCROSS, xp, yp);
            }
        }
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
    bCrossFlag = 1;
}

void Theme_WeaponRack(int t)
{
    int xp, yp;
    char weaponrnd[4] = { 6, 8, 5, 8 };
    char monstrnd[4] = { 6, 7, 3, 9 };

    if (weaponFlag) {
        TFit_Obj3(t);
        AddObject(OBJ_WEAPONRACK, themex, themey);
    }
    for (yp = 0; yp < MAXDUNY; yp++) {
        for (xp = 0; xp < MAXDUNX; xp++) {
            if (dung_map[xp][yp].dTransVal == theme[t].ttval && !GetSOLID(xp, yp)) {
                if (CheckThemeObj3(xp, yp, t, -1) && ENG_random(weaponrnd[leveltype - 1]) == 0)
                    AddObject(OBJ_WEAPONRACKN, xp, yp);
            }
        }
    }
    PlaceThemeMonsts(t, monstrnd[leveltype - 1]);
    weaponFlag = 0;
}

void UpdateL4Trans()
{
    int i, j;

    for (j = 0; j < MAXDUNY; j++) {
        for (i = 0; i < MAXDUNX; i++) {
            if (dung_map[i][j].dTransVal != 0)
                dung_map[i][j].dTransVal = 1;
        }
    }
}

void CreateThemeRooms()
{
    int i;

    if (currlevel == 16)
        return;
    InitObjFlag = 1;
    for (i = 0; i < numthemes; i++) {
        themex = 0;
        themey = 0;
        switch (theme[i].ttype) {
        case THEME_BARREL:
            Theme_Barrel(i);
            break;
        case THEME_SHRINE:
            Theme_Shrine(i);
            break;
        case THEME_MONSTPIT:
            Theme_MonstPit(i);
            break;
        case THEME_SKELROOM:
            Theme_SkelRoom(i);
            break;
        case THEME_TREASURE:
            Theme_Treasure(i);
            break;
        case THEME_LIBRARY:
            Theme_Library(i);
            break;
        case THEME_TORTURE:
            Theme_Torture(i);
            break;
        case THEME_BLOODFOUNTAIN:
            Theme_BloodFountain(i);
            break;
        case THEME_DECAPITATED:
            Theme_Decap(i);
            break;
        case THEME_PURIFYINGFOUNTAIN:
            Theme_PurifyingFountain(i);
            break;
        case THEME_ARMORSTAND:
            Theme_ArmorStand(i);
            break;
        case THEME_GOATSHRINE:
            Theme_GoatShrine(i);
            break;
        case THEME_CAULDRON:
            Theme_Cauldron(i);
            break;
        case THEME_TEARFOUNTAIN:
            Theme_TearFountain(i);
            break;
        case THEME_MURKYFOUNTAIN:
            Theme_MurkyFountain(i);
            break;
        case THEME_BRNCROSS:
            Theme_BrnCross(i);
            break;
        case THEME_WEAPONRACK:
            Theme_WeaponRack(i);
            break;
        }
    }
    InitObjFlag = 0;
    if (leveltype == DTYPE_HELL && themeCount > 0)
        UpdateL4Trans();
}
