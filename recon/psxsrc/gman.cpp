/* GMAN.CPP — Climax PSX layer, texture/graphics manager (C:\diabpsx\PSXSRC\GMAN.CPP).
 * MAP: .GMAN_text 0x80091E54-0x800953F7, .GMAN_data 0x800B8B94.  Lane: CC1PLPSX 2.7.2 (C++). */
#include "psxsrc/gman.h"

/* line 123 @0x80091E54 */
TextDat::TextDat()
{
    OnceOnlyInit();
    InitData();
}

/* line 129 @0x80091E88 */
void TextDat::OnceOnlyInit()
{
    DecX = -1;
    DecY = -1;
    PalX = -1;
    PalY = -1;
    OwnDat = 1;
}

/* line 1231 @0x80093A54 */
void TextDat::InitData()
{
    hndDecompArrays = -1;
    hndDat = -1;
    hndHdr = -1;
    hndPalOffset = -1;
    hndCreatureOffset = -1;
    hndDecompBuffer = -1;
    hndBlockOffsets = -1;
    DatLoaded = 0;
    LoadCount = 0;
    Loaded = 0;
}

/* line 144 @0x80091EA8 — gcc-2.7 deleting-dtor shape (__in_chrg + __builtin_delete) */
TextDat::~TextDat()
{
    DumpData();
}
