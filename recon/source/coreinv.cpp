/* COREINV.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/inv.cpp FindGetItem.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"

struct TextDat {
    BOOL OwnDat;
    int TexNum, LastFrame;
    BOOL DatLoaded;
    long hndDat;
    inline void DumpDatFile();
};
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}
class CPlayer : public TextDat {
public:
    static CPlayer *PActiveArray[2];
    static CPlayer *GetPlayer(int PNum)
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }
};
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
