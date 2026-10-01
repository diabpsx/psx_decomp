/* PREINV.CPP — Diablo PSX (Climax 1998) reconstruction (PREGAME overlay).  Twin: refs/devilution/Source/inv.cpp (InitInv).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX delta: retail's InitInv doesn't do the PC CEL-load-by-class dance; instead it clears the
 * inventory/status-bar flags and sets up the PSX panel/graphics TextDat handles + initial cursor slot. */
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
#include "source/gen/structs_preinv.h"
#include "source/gen/externs_preinv.h"
#include "source/gen/protos_preinv.h"
#include "source/diablo.h"

/* line 103 @0x8015F470 */
void InitInv(void)
{
    invflag = 0;
    drawsbarflag = 0;
    InvBackY = 0;
    InvPanelTData = GM_UseTexData(0);
    InvGfxTData = 0;
    InvCursPos = 0x19;
}
