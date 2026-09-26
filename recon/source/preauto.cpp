/* PREAUTO.CPP — Diablo PSX (Climax 1998) reconstruction (preauto segment).  Twin: refs/devilution/Source/automap.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas: the level->tile-shape mapping is loaded via FileIO (SYSI_GetFs()->FileLen/ReadAtAddr into a
 * function-static AmpBuffer[512]), not devilution's LoadFileInMem; automapview is a packed unsigned char[5][40]
 * (not a BOOLEAN[DMAXX][DMAXY] table); automaptype/automapview/AutoMapXOfs/AutoMapYOfs/leveltype/dung_map are
 * owned by other TUs (coreauto.cpp / gendung.cpp) -- reached here absolute, not gp-rel.  AutoMapTData IS
 * gp-rel in the oracle, so it is a TU-owned tentative definition here (InitAutomapOnce). */
#include "diabpsx_types.h"
#include "source/gen/structs_preauto.h"
#include "source/gen/externs_preauto.h"
#include "source/gen/protos_preauto.h"
#include "source/diablo.h"

#define DTYPE_CATHEDRAL 1
#define DTYPE_CATACOMBS 2
#define DTYPE_CAVES     3
#define DTYPE_HELL      4

#define BFLAG_EXPLORED 0x80

/* TU-owned small data (.sdata, gp-relative in retail) */
struct TextDat *AutoMapTData;

/* TU-owned file-static data (not a function local -- SYM lists it STAT, not REG/AUTO) */
static unsigned char AmpBuffer[512];

void InitAutomap(void)
{
    int i, j;
    unsigned long dwTiles;
    unsigned char *pTmp;
    FileIO *FIO;
    int x, y;
    char *Name;

    FIO = SYSI_GetFs();

    for (x = 511; x >= 0; x--)
        automaptype[x] = 0;

    switch (leveltype) {
    case DTYPE_CATHEDRAL:
        Name = "L1.Amp";
        break;
    case DTYPE_CATACOMBS:
        Name = "L2.Amp";
        break;
    case DTYPE_CAVES:
        Name = "L3.Amp";
        break;
    case DTYPE_HELL:
        Name = "L4.Amp";
        break;
    default:
        return;
    }

    if (Name != NULL) {
        int Len;
        unsigned char b1, b2;

        Len = FIO->FileLen(Name);
        if (Len >= 0x201)
            DBG_Error(NULL, "source/PREAUTO.cpp", 0xB5);

        FIO->ReadAtAddr(Name, AmpBuffer, -1);
        pTmp = AmpBuffer;

        dwTiles = (unsigned long)Len >> 1;
        if (dwTiles != 0) {
            unsigned long d;
            d = 1;
            do {
                b1 = *pTmp++;
                b2 = *pTmp++;
                automaptype[d] = b1 + (b2 << 8);
                d++;
            } while (d <= dwTiles);
        }

        for (j = 0; j < 40; j++)
            for (x = 0; x < 5; x++)
                automapview[x][j] = 0;

        for (y = 0; y < 96; y++)
            for (i = 0; i < 96; i++)
                dung_map[i][y].dFlags &= ~BFLAG_EXPLORED;

        AutoMapXOfs = 0;
        AutoMapYOfs = 0;
    }
}

void InitAutomapOnce(void)
{
    automapflag = 0;
    AutoMapTData = GM_UseTexData(0);
}
