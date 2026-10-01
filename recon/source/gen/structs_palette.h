struct FRAME_HDR;
struct SPR_HDR;
struct CTextFileInfo;

struct POLY_GT4 {   /* sizeof 52 */
    unsigned long tag;   /* +0x0 */
    unsigned char r0;   /* +0x4 */
    unsigned char g0;   /* +0x5 */
    unsigned char b0;   /* +0x6 */
    unsigned char code;   /* +0x7 */
    short x0;   /* +0x8 */
    short y0;   /* +0xA */
    unsigned char u0;   /* +0xC */
    unsigned char v0;   /* +0xD */
    unsigned short clut;   /* +0xE */
    unsigned char r1;   /* +0x10 */
    unsigned char g1;   /* +0x11 */
    unsigned char b1;   /* +0x12 */
    unsigned char p1;   /* +0x13 */
    short x1;   /* +0x14 */
    short y1;   /* +0x16 */
    unsigned char u1;   /* +0x18 */
    unsigned char v1;   /* +0x19 */
    unsigned short tpage;   /* +0x1A */
    unsigned char r2;   /* +0x1C */
    unsigned char g2;   /* +0x1D */
    unsigned char b2;   /* +0x1E */
    unsigned char p2;   /* +0x1F */
    short x2;   /* +0x20 */
    short y2;   /* +0x22 */
    unsigned char u2;   /* +0x24 */
    unsigned char v2;   /* +0x25 */
    unsigned short pad2;   /* +0x26 */
    unsigned char r3;   /* +0x28 */
    unsigned char g3;   /* +0x29 */
    unsigned char b3;   /* +0x2A */
    unsigned char p3;   /* +0x2B */
    short x3;   /* +0x2C */
    short y3;   /* +0x2E */
    unsigned char u3;   /* +0x30 */
    unsigned char v3;   /* +0x31 */
    unsigned short pad3;   /* +0x32 */
};

struct POLY_FT4 {   /* sizeof 40 */
    unsigned long tag;   /* +0x0 */
    unsigned char r0;   /* +0x4 */
    unsigned char g0;   /* +0x5 */
    unsigned char b0;   /* +0x6 */
    unsigned char code;   /* +0x7 */
    short x0;   /* +0x8 */
    short y0;   /* +0xA */
    unsigned char u0;   /* +0xC */
    unsigned char v0;   /* +0xD */
    unsigned short clut;   /* +0xE */
    short x1;   /* +0x10 */
    short y1;   /* +0x12 */
    unsigned char u1;   /* +0x14 */
    unsigned char v1;   /* +0x15 */
    unsigned short tpage;   /* +0x16 */
    short x2;   /* +0x18 */
    short y2;   /* +0x1A */
    unsigned char u2;   /* +0x1C */
    unsigned char v2;   /* +0x1D */
    unsigned short pad1;   /* +0x1E */
    short x3;   /* +0x20 */
    short y3;   /* +0x22 */
    unsigned char u3;   /* +0x24 */
    unsigned char v3;   /* +0x25 */
    unsigned short pad2;   /* +0x26 */
};

struct TASK {   /* sizeof 92 */
    struct TASK *Next;   /* +0x0 */
    struct TASK *Prev;   /* +0x4 */
    unsigned long Id;   /* +0x8 */
    unsigned long SleepTime;   /* +0xC */
    unsigned long fToInit : 1;
    unsigned long fToDie : 1;
    unsigned long fKillable : 1;
    unsigned long fActive : 1;
    unsigned long fXtraStack : 1;
    void *Stack;   /* +0x14 */
    unsigned long StackSize;   /* +0x18 */
    void *Data;   /* +0x1C */
    int TskEnv[12];   /* +0x20 */
    void (*Main)();   /* +0x50 */
    long hndTask;   /* +0x54 */
    unsigned short XtraLongs;   /* +0x58 */
    unsigned short MaxStackSizeBytes;   /* +0x5A */
};

struct TextDat {   /* sizeof 112 */
    BOOL OwnDat;   /* +0x0 */
    int TexNum;   /* +0x4 */
    int LastFrame;   /* +0x8 */
    BOOL DatLoaded;   /* +0xC */
    long hndDat;   /* +0x10 */
    long hndHdr;   /* +0x14 */
    long hndPalOffset;   /* +0x18 */
    long hndCreatureOffset;   /* +0x1C */
    long hndBlockOffsets;   /* +0x20 */
    struct FRAME_HDR *Frames;   /* +0x24 */
    struct SPR_HDR *Hdr;   /* +0x28 */
    void *Pals;   /* +0x2C */
    int *PalOffset;   /* +0x30 */
    int *CreatureOffset;   /* +0x34 */
    unsigned char *CreatureAnims;   /* +0x38 */
    unsigned char *Blocks;   /* +0x3C */
    BOOL Loaded;   /* +0x40 */
    int LoadCount;   /* +0x44 */
    struct CTextFileInfo *FileInfo;   /* +0x48 */
    long hndDecompBuffer;   /* +0x4C */
    int DecX;   /* +0x50 */
    int DecY;   /* +0x54 */
    int PalX;   /* +0x58 */
    int PalY;   /* +0x5C */
    int Scr;   /* +0x60 */
    int NumOfBuffers[2];   /* +0x64 */
    long hndDecompArrays;   /* +0x6C */

    POLY_GT4 *PrintGt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
    POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
    void DumpDatFile();
};
