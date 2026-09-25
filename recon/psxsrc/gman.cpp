/* GMAN.CPP — Climax PSX layer, texture/graphics manager (C:\diabpsx\PSXSRC\GMAN.CPP).
 * MAP: .GMAN_text 0x80091E54-0x800953F7, .GMAN_data 0x800B8B94.  Lane: CC1PLPSX 2.7.2 (C++). */
#include "psxsrc/gman.h"

/* GMAN.CPP-owned globals (.sdata @0x8011AD1C..; SYM class EXT INT).  Tentative definitions in the
 * OWNER TU make them gp-relative (`lw $v,%gp_rel(TpW)($gp)`) exactly like retail; `extern` would
 * materialize absolute lui/lw (methodology 3.12 #6). */
int TpW;
int TpH;
int TpXDest;
int TpYDest;

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

/* line 263 @0x80092170 — stream-load callback: blits each 64x256 chunk into VRAM */
BOOL TpLoadCallBack(unsigned char *Mem, int ReadSoFar, int Size, BOOL LastChunk)
{
    static int TpX;
    static int TpY;
    RECT R;
    int Dx;
    int Dy;

    if (ReadSoFar == 0) {
        TpX = 0;
        TpY = 0;
    }
    R.w = 64;
    R.h = 256;
    Dx = TpX * 64 + TpXDest;
    R.x = Dx;
    Dy = TpY * 256 + TpYDest;
    R.y = Dy;
    LoadImage(&R, (u_long *)Mem);
    TpX++;
    TpX %= TpW;
    if (TpX == 0)
        TpY++;
    DrawSync(0);
    return true;
}

/* line 1252 @0x80093A84 */
void TextDat::DumpData()
{
    DumpHdr();
    DumpDatFile();
    if (hndPalOffset != -1)
        if (!GAL_Free(hndPalOffset)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1262);
    if (hndCreatureOffset != -1)
        if (!GAL_Free(hndCreatureOffset)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1268);
    if (hndBlockOffsets != -1)
        if (!GAL_Free(hndBlockOffsets)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1274);
    if (hndDecompBuffer != -1)
        GPUQ_DiscardHandle(hndDecompBuffer);
    if (hndDecompArrays != -1)
        if (!GAL_Free(hndDecompArrays)) DBG_Error(NULL, "psxsrc/GMAN.CPP", 1285);
    InitData();
}
