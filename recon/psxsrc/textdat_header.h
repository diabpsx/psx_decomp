#ifndef TEXTDAT_HEADER_H
#define TEXTDAT_HEADER_H
/* GMAN.H type layout and original DumpDatFile inline (lines 290-296).
 * For TUs needing the original header without implementation dependencies
 * bundled into reconstructed gman.h. The unused inline retains its filename
 * literal under PsyQ, without synthetic padding or emitted function code. */
#include "diabpsx_types.h"
#include "glibdev/gdebug.h"
#include "glibdev/gal.h"

struct FRAME_HDR;
struct SPR_HDR;
struct CTextFileInfo;
struct POLY_FT4;
struct TextDat {
    BOOL OwnDat;
    int TexNum;
    int LastFrame;
    BOOL DatLoaded;
    long hndDat, hndHdr, hndPalOffset, hndCreatureOffset, hndBlockOffsets;
    FRAME_HDR *Frames;
    SPR_HDR *Hdr;
    void *Pals;
    int *PalOffset, *CreatureOffset;
    unsigned char *CreatureAnims, *Blocks;
    BOOL Loaded;
    int LoadCount;
    CTextFileInfo *FileInfo;
    long hndDecompBuffer;
    int DecX, DecY, PalX, PalY, Scr;
    int NumOfBuffers[2];
    long hndDecompArrays;
    ~TextDat();
    void DumpDatFile();
    void DoDecompRequests();
    POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
    void PrepareFt4(POLY_FT4 *FT4, int Frm, int X, int Y, int XFlip, int YFlip);
};

inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}
#endif
