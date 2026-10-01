/* PREPORT.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/portal.cpp.
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
#include "source/gen/structs_preport.h"
#include "source/gen/externs_preport.h"
#include "source/gen/protos_preport.h"

#define MAXPORTAL 4

void InitPortals(void)
{
    for (int i = 0; i < MAXPORTAL; i++) {
        if (delta_portal_inited(i))
            portal[i].open = false;
    }
}
