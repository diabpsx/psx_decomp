#ifndef PSXSRC_PRINTY_H
#define PSXSRC_PRINTY_H
/* PRINTY.H -- Climax PSX font printer (C:\diabpsx\PSXSRC\PRINTY.H).  Layouts from the retail SYM (CFont 540,
 * FontItem 4, FontTab 16); the in-class methods are the ones the retail SYM attributes to PRINTY.H lines
 * 59-85, emitted out of line per calling TU (-fno-inline).  PRINTY.H parses GMAN.H first (a CFont owns a
 * TextDat). */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "psxsrc/gman.h"

enum TXT_JUST { JustRight = 2, JustCentre = 1, JustLeft = 0 };

struct CFont {   /* sizeof 540 */
    int TextureId;   /* +0x0 */
    unsigned short FontTab[256];   /* +0x4 */
    int PrintyOTpos;   /* +0x204 */
    int MinX;   /* +0x208 */
    int MaxX;   /* +0x20C */
    int Width;   /* +0x210 */
    TextDat *ThisDat;   /* +0x214 */
    unsigned char FontHeight;   /* +0x218 */

    void Init() { ThisDat = GM_UseTexData(TextureId); }                    /* PRINTY.H:59 */
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
    int GetCharHeight(unsigned char ch) { return ThisDat->GetFr(FontTab[ch])->H; }   /* PRINTY.H:76 */
    int GetCharFrameNum(unsigned char ch) { return FontTab[ch]; }                    /* PRINTY.H:79 */
    BOOL IsDefined(unsigned char C) { return FontTab[C] != 0x3039; }                 /* PRINTY.H:82 */
    void ClearFont() { GM_FinishedUsing(ThisDat); }                                  /* PRINTY.H:85 */
};

struct FontItem {   /* sizeof 4 */
    unsigned char ch;   /* +0x0 */
    unsigned short Offset;   /* +0x2 */
};

struct FontTab {   /* sizeof 16 */
    CFont *Fnt;   /* +0x0 */
    FontItem *Items;   /* +0x4 */
    int NumOfItems;   /* +0x8 */
    int FrameBase;   /* +0xC */

    void Set();
};

void InitPrinty(void);

/* PRINTY.CPP globals */
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
