/* PREPORT.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/portal.cpp.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h). */
#include "diabpsx_types.h"
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
