#ifndef PSXSRC_PRINTY_H
#define PSXSRC_PRINTY_H
/* PRINTY.CPP -- Climax PSX font printer (C:\diabpsx\PSXSRC\PRINTY.CPP).  PSX-only, no PC twin.
 * Declarations local to this TU: layouts from DIABPSX.SYM (tools/symhdr.py), prototypes spelled from the
 * retail mangled names. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"

enum TXT_JUST { JustRight = 2, JustCentre = 1, JustLeft = 0 };

struct SPR_HDR;
struct CTextFileInfo;

struct FRAME_HDR {   /* sizeof 12 */
    unsigned int FrOffset : 32;
    int X : 8;
    int Y : 8;
    unsigned int PalNum : 8;
    unsigned int NotTrans : 1;
    unsigned int Rotated : 1;
    unsigned int InVRAM : 1;
    unsigned int CompType : 2;
    unsigned int Floor : 1;
    unsigned int Cycle : 1;
    unsigned int pad : 1;
    unsigned int W : 9;
    unsigned int H : 9;
    unsigned int PentaGram : 1;
    unsigned int pad2 : 13;
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

    FRAME_HDR *GetFr(int FrNum) { return Frames + (unsigned short)FrNum; }
    POLY_FT4 *PrintFt4(int Frm, int X, int Y, int XFlip, int OtPos, int YFlip);
};

TextDat *GM_UseTexData(int Id);   /* GMAN.CPP:1312 */
void GM_FinishedUsing(TextDat *Fin);   /* GMAN.CPP:1349 */

class CBlocks {
public:
    static int GetOverlayOtBase() { return 0x1E8; }
};

struct CFont {   /* sizeof 540 */
    int TextureId;   /* +0x0 */
    unsigned short FontTab[256];   /* +0x4 */
    int PrintyOTpos;   /* +0x204 */
    int MinX;   /* +0x208 */
    int MaxX;   /* +0x20C */
    int Width;   /* +0x210 */
    struct TextDat *ThisDat;   /* +0x214 */
    unsigned char FontHeight;   /* +0x218 */

    void Init() { ThisDat = GM_UseTexData(TextureId); }
    int GetCharFrameNum(unsigned char ch) { return FontTab[ch]; }
    BOOL IsDefined(unsigned char C) { return FontTab[C] != 0x3039; }
    void ClearFont() { GM_FinishedUsing(ThisDat); }

    void SetTextDat(TextDat *NewDat);
    int KanjiPrintChar(unsigned short Cx, unsigned short Cy, unsigned short kan, unsigned char R, unsigned char G, unsigned char B);
    int PrintChar(unsigned short Cx, unsigned short Cy, unsigned char C, unsigned char R, unsigned char G, unsigned char B);
    int Print(int X, int Y, char *Str, TXT_JUST Justify, RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    int GetWrap(char *Str, RECT *TextWindow);
    int GetWrapWidth(char *Str, RECT *TextWindow);
    int GetStrWidth(char *Str);
    void SetChar(int ch, unsigned short Frm);
    int SetOTpos(int OT);
    int GetCharWidth(unsigned char ch);
};

struct FontItem {   /* sizeof 4 */
    unsigned char ch;   /* +0x0 */
    unsigned short Offset;   /* +0x2 */
};

struct FontTab {   /* sizeof 16 */
    struct CFont *Fnt;   /* +0x0 */
    struct FontItem *Items;   /* +0x4 */
    int NumOfItems;   /* +0x8 */
    int FrameBase;   /* +0xC */

    void Set();
};

enum LANG_TYPE { LANG_NONE = 5, LANG_JAP = 4, LANG_SWEDISH = 3, LANG_GERMAN = 2, LANG_FRENCH = 1, LANG_ENGLISH = 0 };

extern "C" {
void DBG_Error(char *Text, char *File, int Line);   /* GDEBUG.C:146 */
void TSK_Sleep(int Frames);   /* TASKER.C:287 */
}
enum LANG_TYPE LANG_GetLang(void);   /* LANG.CPP:84 */
POLY_FT4 *GetKanjiFrm(unsigned short kan);   /* KANJI.CPP:535 */
BOOL IsKanjiLoaded(void);   /* KANJI.CPP:294 */
void PRIM_Clip(RECT *R, int Depth);   /* PRIMPOOL.CPP:216 */
void PRIM_FullScreen(int Depth);   /* PRIMPOOL.CPP:257 */

void InitPrinty(void);

extern unsigned long *ThisOt;

/* PRINTY-owned globals (declared here so the const colour definitions get external linkage) */
extern const unsigned char WHITER, WHITEG, WHITEB;
extern const unsigned char BLUER, BLUEG, BLUEB;
extern const unsigned char REDR, REDG, REDB;
extern const unsigned char GOLDR, GOLDG, GOLDB;
extern POLY_FT4 *CharFt4;
extern int CharFrm;
extern CFont MediumFont;
extern CFont LargeFont;
extern BOOL buttoncol;
extern FontItem LFontTab[114];
extern FontTab LFont;
extern FontItem MFontTab[118];
extern FontTab MFont;

#endif
