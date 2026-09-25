#ifndef PSXSRC_GMAN_H
#define PSXSRC_GMAN_H
/* Reconstructed from DIABPSX.SYM (tools/symtypes.py struct TextDat).  Sizes/offsets are SYM truth. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "glibdev/gal.h"
#include "glibdev/gdebug.h"

void GPUQ_DiscardHandle(long hnd);
BOOL TpLoadCallBack(unsigned char *Mem, int ReadSoFar, int Size, BOOL LastChunk);
extern int TpW, TpH, TpXDest, TpYDest;

struct FRAME_HDR;      /* size 12 */
struct SPR_HDR;        /* size 40 */
struct CTextFileInfo;  /* size 4 */

struct TextDat {       /* sizeof 112 */
    BOOL           OwnDat;           /* +0x00 */
    int            TexNum;           /* +0x04 */
    int            LastFrame;        /* +0x08 */
    BOOL           DatLoaded;        /* +0x0C */
    long           hndDat;           /* +0x10 */
    long           hndHdr;           /* +0x14 */
    long           hndPalOffset;     /* +0x18 */
    long           hndCreatureOffset;/* +0x1C */
    long           hndBlockOffsets;  /* +0x20 */
    FRAME_HDR     *Frames;           /* +0x24 */
    SPR_HDR       *Hdr;              /* +0x28 */
    void          *Pals;             /* +0x2C */
    int           *PalOffset;        /* +0x30 */
    int           *CreatureOffset;   /* +0x34 */
    unsigned char *CreatureAnims;    /* +0x38 */
    unsigned char *Blocks;           /* +0x3C */
    BOOL           Loaded;           /* +0x40 */
    int            LoadCount;        /* +0x44 */
    CTextFileInfo *FileInfo;         /* +0x48 */
    long           hndDecompBuffer;  /* +0x4C */
    int            DecX;             /* +0x50 */
    int            DecY;             /* +0x54 */
    int            PalX;             /* +0x58 */
    int            PalY;             /* +0x5C */
    int            Scr;              /* +0x60 */
    int            NumOfBuffers[2];  /* +0x64 */
    long           hndDecompArrays;  /* +0x6C */

    TextDat();
    ~TextDat();
    void OnceOnlyInit();
    void InitData();
    void DumpData();
    void DumpHdr();
    void DumpDatFile();
};

#endif
