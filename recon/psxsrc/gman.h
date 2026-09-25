#ifndef PSXSRC_GMAN_H
#define PSXSRC_GMAN_H
/* GMAN.H — Climax PSX texture/sprite manager.  Layouts are SYM truth (tools/symtypes.py);
 * the in-class method bodies are the ones the SYM attributes to GMAN.H lines (each including
 * TU emits its own out-of-line copy, e.g. GetFr__7TextDati x12). */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "glibdev/gal.h"
#include "glibdev/gdebug.h"
#include "glibdev/gutils.h"
#include "psxsrc/fileio.h"
#include "psxsrc/sysinit.h"
#include "psxsrc/biglump.h"
#include "psxsrc/decomp.h"
#include "cstring.h"
#include "psxsrc/primpool.h"

struct FRAME_HDR {                    /* sizeof 12 (bitfields) */
    unsigned int FrOffset  : 32;
    int          X         : 8;
    int          Y         : 8;
    unsigned int PalNum    : 8;
    unsigned int NotTrans  : 1;
    unsigned int Rotated   : 1;
    unsigned int InVRAM    : 1;
    unsigned int CompType  : 2;
    unsigned int Floor     : 1;
    unsigned int Cycle     : 1;
    unsigned int pad       : 1;
    unsigned int W         : 9;
    unsigned int H         : 9;
    unsigned int PentaGram : 1;
    unsigned int pad2      : 13;
};

/* Word 0 of a FRAME_HDR viewed as U/V/Tpage (retail SetUVTp* read them as byte-aligned bitfields:
 * lbu 0/1 + lhu 2 with a separate SImode copy for the arithmetic V) */
struct FRAME_TP {
    unsigned int U     : 8;
    unsigned int V     : 8;
    unsigned int Tpage : 16;
};

struct SPR_HDR {                      /* sizeof 40 (bitfields) */
    unsigned int DecompOffset    : 32;
    unsigned int CreatureOffset  : 32;
    unsigned int PalOffset       : 32;
    unsigned int FrameOffset     : 32;
    unsigned int BaseFrame       : 32;
    unsigned int DestTPage       : 32;
    unsigned int ComponentOffset : 32;
    unsigned int NumOfCreatures  : 32;
    unsigned int NumOfFrames     : 16;
    unsigned int NumOfPals       : 16;
    unsigned int TWidth          : 8;
    unsigned int THeight         : 8;
    unsigned int IsTiles         : 8;
    unsigned int Spare           : 8;
};

struct PAL {                          /* sizeof 8 */
    unsigned int   InVram    : 1;
    unsigned int   NumOfCols : 31;
    unsigned short Cols[1];
};

struct TextDat;

struct CPart {                        /* sizeof 8 */
    unsigned long Piece;
    short         X;
    short         Y;

    void SetRect(TextDat &TDat, RECT &R);
};

struct CBlock {                       /* sizeof 12 */
    unsigned long NumOfParts;
    CPart         Parts[1];

    int GetSize() const { return sizeof(NumOfParts) + NumOfParts * sizeof(CPart); }   /* GMAN.H:67 */
    void GetBoundingBox(TextDat &TDat, RECT &R);
};

struct CBlockHdr {                    /* sizeof 16 */
    unsigned long NumOfBlocks;
    CBlock        Blocks[1];

    long MakeOffsetTab() const;
};

struct CCreatureAction {              /* sizeof 14 */
    unsigned short BaseFrame;
    unsigned char  NumOfFrames;
    unsigned char  NumOfPhysFrames;
    unsigned char  DirRemap[8];
    unsigned char  AnimRemap[1];

    int GetSize() const;
    int GetFrNum(int Direction, int Frame) const;
    void InitDirRemap();
};

struct CCreatureHdr {                 /* sizeof 20 */
    long            NumOfActions;
    CCreatureAction Cr;

    int GetSize() const;
    int GetFrNum(int Action, int Direction, int Frame) const;
    CCreatureAction *GetAction(int ActNum) const;
    void InitActionDirRemaps();
};

struct CTextFileInfo {                /* sizeof 4 */
    char *FileName;

    char *GetName() const { return FileName; }                          /* GMAN.H:173 */
    BOOL  HasTp() const   { return HasFile(".tp"); }                    /* GMAN.H:160 */
    BOOL  HasDat() const  { return HasFile(".dat"); }                   /* GMAN.H:161 */
    long  LoadHdr() const { return GetFile(".hdr", 0x8001); }           /* GMAN.H:167 */
    BOOL  HasFile(char *Ext) const;
    long  GetFile(char *Ext, unsigned long RamId) const;
    long  LoadDat() const;
    void  LoadDat(long hnd, int size) const;
    void  MakeFname(char *Dst, const char *Ext) const;
};

struct TextDat {                      /* sizeof 112 */
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
    void ReloadTP();
    void StreamLoadTP();
    void FinishedUsing();
    void MakeBlockOffsetTab();
    BOOL IsCompressed(int Creature, int Action, int Dir, int Frame);
    int  GetFrNum(int Creature, int Action, int Direction, int Frame);
    BOOL IsDirAliased(int Creature, int Action, int Direction);
    void DoDecompRequests();
    void Use(long NewHndDat, BOOL DatLoaded, int size);
    void SetUVTp(FRAME_HDR *Fr, POLY_FT4 *FT4, int XFlip, int YFlip);
    void SetUVTpGT4(FRAME_HDR *Fr, POLY_GT4 *FT4, int XFlip, int YFlip);
    void SetUVTpGT3(FRAME_HDR *Fr, POLY_GT3 *GT3);
    void SetPal(FRAME_HDR *Fr, POLY_FT4 *FT4);
    unsigned char *GetDecompBufffer(int Size);
    void MakePalOffsetTab();
    void MakeCreatureOffsetTab();
    void FindDecompArea(RECT &R);

    /* GMAN.H in-class methods (line numbers per SYM) */
    FRAME_HDR *GetFr(int FrNum) { return Frames + (unsigned short)FrNum; }                        /* 229 */
    PAL *GetPal(int PalNum) { return (PAL *)((unsigned char *)Pals + PalOffset[PalNum]); }         /* 232 */
    int GetNumOfFrames() { return Hdr->NumOfFrames; }                                              /* 233 */
    void SetFileInfo(const CTextFileInfo *NewInfo, int NewTexNum) { FileInfo = (CTextFileInfo *)NewInfo; TexNum = NewTexNum; }  /* 240 */
    int GetNumOfCreatures() { return Hdr->NumOfCreatures; }                                        /* 251 */
    int GetTexNum() const { return TexNum; }                                                       /* 256 */
    BOOL IsLoaded() const { return LoadCount != 0; }                                               /* 257 */
    BOOL CanXferPal() const { return PalX >= 0 && PalY >= 0; }                                     /* 258 */
    BOOL CanXferFrame() const { return DecX >= 0 && DecY >= 0; }                                   /* 259 */
    unsigned char *GetCreature(int Creature) { return CreatureAnims + CreatureOffset[Creature]; }  /* 284 */

    static CTextFileInfo *GetFileInfo(int Id);
};

struct CScreen : public TextDat {     /* sizeof 124 */
    int LoadedId;                    /* +0x70 */
    int TpX;                         /* +0x74 */
    int TpY;                         /* +0x78 */

    CScreen();
    void Load(int Id, int x, int y);
    void Display(int a, int b, int c, int d);
    void Unload();
};

/* GMAN.CPP globals */
extern TextDat *AllDats[372];        /* @0x800B9454 (.GMAN_data) */
extern TextDat  DatPool[20];         /* @0x800B8B94 */
extern int TpW, TpH, TpXDest, TpYDest;   /* .sdata */
extern CTextFileInfo *TX_DatTab[];

void GPUQ_DiscardHandle(long hnd);
BOOL TpLoadCallBack(unsigned char *Mem, int ReadSoFar, int Size, BOOL LastChunk);
void GM_ForceTpLoad(int Id);
void GM_FinishedUsing(TextDat *tex);
TextDat *GM_UseTexData(int Id);
void Un64(unsigned char *Src, unsigned char *Dest, long SizeBytes);

/* GMAN.H:290-296 — defined in the header (out-of-line copy per TU under -fno-inline) */
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        if (!GAL_Free(hndDat)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

#endif
