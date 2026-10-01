/* LAMBO.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  A programmer's scratch file: both
 * functions are empty in the retail build. */
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

/* @0x80095844 LAMBO.CPP:73 */
void StevesDummyPoll(void)
{
}

/* @0x8009584C LAMBO.CPP:77 */
void Lambo(void)
{
}
