/* COREINV.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/inv.cpp FindGetItem.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "source/gen/structs_coreinv.h"
#include "source/gen/externs_coreinv.h"
#include "source/gen/protos_coreinv.h"
#include "source/diablo.h"

int FindGetItem(int idx, unsigned short ci, int iseed)
{
    int i, ii;

    i = 0;
    while (i < numitems) {
        ii = itemactive[i];
        if (item[ii].IDidx == idx && item[ii]._iSeed == iseed) {
            i++;
            if (item[ii]._iCreateInfo == ci)
                return ii;
        } else {
            i++;
        }
    }
    return -1;
}
