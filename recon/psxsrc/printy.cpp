/* PRINTY.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the CFont bitmap-font
 * printer (per-character frame tables, word wrap, left/centre/right justification, kanji glyphs via
 * GetKanjiFrm) plus the colour constants and the two game fonts.  Header inlines (CFont::Init/
 * ClearFont/IsDefined/GetCharFrameNum, TextDat::GetFr, CBlocks::GetOverlayOtBase) are emitted out of
 * line in this object (-fno-inline).  `CFont LargeFont = MediumFont;` is the dynamic initialiser behind
 * _GLOBAL__I_WHITER (WHITER = first explicitly-initialised public global). */
#include "psxsrc/printy.h"

/* ---- TU-owned data (SYM EXT; values from the retail image) ---- */
const unsigned char WHITER = 0x80;
const unsigned char WHITEG = 0x80;
const unsigned char WHITEB = 0x80;
const unsigned char BLUER = 0x40;
const unsigned char BLUEG = 0x80;
const unsigned char BLUEB = 0xF0;
const unsigned char REDR = 0x80;
const unsigned char REDG = 0x20;
const unsigned char REDB = 0x20;
const unsigned char GOLDR = 0x80;
const unsigned char GOLDG = 0x60;
const unsigned char GOLDB = 0x20;
POLY_FT4 *CharFt4 = 0;
int CharFrm = 0;
BOOL buttoncol = 0;
CFont MediumFont;
CFont LargeFont = MediumFont;
FontItem LFontTab[114] = {
    { 0x20, 8 }, { 'A', 0 }, { 'B', 1 }, { 'C', 2 }, { 'D', 3 }, { 'E', 4 }, { 'F', 5 }, { 'G', 6 },
    { 'H', 7 }, { 'I', 8 }, { 'J', 9 }, { 'K', 10 }, { 'L', 11 }, { 'M', 12 }, { 'N', 13 }, { 'O', 14 },
    { 'P', 15 }, { 'Q', 16 }, { 'R', 17 }, { 'S', 18 }, { 'T', 19 }, { 'U', 20 }, { 'V', 21 }, { 'W', 22 },
    { 'X', 23 }, { 'Y', 24 }, { 'Z', 25 }, { 'a', 0 }, { 'b', 1 }, { 'c', 2 }, { 'd', 3 }, { 'e', 4 },
    { 'f', 5 }, { 'g', 6 }, { 'h', 7 }, { 'i', 8 }, { 'j', 9 }, { 'k', 10 }, { 'l', 11 }, { 'm', 12 },
    { 'n', 13 }, { 'o', 14 }, { 'p', 15 }, { 'q', 16 }, { 'r', 17 }, { 's', 18 }, { 't', 19 }, { 'u', 20 },
    { 'v', 21 }, { 'w', 22 }, { 'x', 23 }, { 'y', 24 }, { 'z', 25 }, { '1', 26 }, { '2', 27 }, { '3', 28 },
    { '4', 29 }, { '5', 30 }, { '6', 31 }, { '7', 32 }, { '8', 33 }, { '9', 34 }, { '0', 35 }, { 0x21, 36 },
    { 0x2A, 37 }, { 0x25, 38 }, { 0x26, 39 }, { 0x23, 40 }, { 0x28, 41 }, { 0x29, 42 }, { 0x2D, 43 }, { 0x2B, 44 },
    { 0x3D, 45 }, { 0x27, 46 }, { 0x60, 46 }, { 0x92, 46 }, { 0x22, 47 }, { 0x3B, 49 }, { 0x3A, 50 }, { 0x2C, 51 },
    { 0x2E, 52 }, { 0x85, 52 }, { 0x3F, 53 }, { 0x2F, 54 }, { 0x5B, 55 }, { 0x5C, 56 }, { 0x5D, 57 }, { 0x3C, 58 },
    { 0x3E, 59 }, { 0x24, 60 }, { 0x5F, 61 }, { 0x7B, 74 }, { 0x7D, 75 }, { 0x5E, 76 }, { 0xD5, 62 }, { 0xD6, 63 },
    { 0xD1, 64 }, { 0xCA, 65 }, { 0xC6, 66 }, { 0xC5, 67 }, { 0xDF, 68 }, { 0xC7, 69 }, { 0xF5, 62 }, { 0xF6, 63 },
    { 0xF1, 64 }, { 0xEA, 65 }, { 0xE6, 66 }, { 0xE5, 67 }, { 0xDF, 68 }, { 0xE7, 69 }, { 0x7C, 70 }, { 0x7E, 71 },
    { 0x7F, 72 }, { 0x1F, 73 },
};
FontItem MFontTab[118] = {
    { 0x20, 8 }, { 'A', 0 }, { 'B', 1 }, { 'C', 2 }, { 'D', 3 }, { 'E', 4 }, { 'F', 5 }, { 'G', 6 },
    { 'H', 7 }, { 'I', 8 }, { 'J', 9 }, { 'K', 10 }, { 'L', 11 }, { 'M', 12 }, { 'N', 13 }, { 'O', 14 },
    { 'P', 15 }, { 'Q', 16 }, { 'R', 17 }, { 'S', 18 }, { 'T', 19 }, { 'U', 20 }, { 'V', 21 }, { 'W', 22 },
    { 'X', 23 }, { 'Y', 24 }, { 'Z', 25 }, { 'a', 0 }, { 'b', 1 }, { 'c', 2 }, { 'd', 3 }, { 'e', 4 },
    { 'f', 5 }, { 'g', 6 }, { 'h', 7 }, { 'i', 8 }, { 'j', 9 }, { 'k', 10 }, { 'l', 11 }, { 'm', 12 },
    { 'n', 13 }, { 'o', 14 }, { 'p', 15 }, { 'q', 16 }, { 'r', 17 }, { 's', 18 }, { 't', 19 }, { 'u', 20 },
    { 'v', 21 }, { 'w', 22 }, { 'x', 23 }, { 'y', 24 }, { 'z', 25 }, { '1', 26 }, { '2', 27 }, { '3', 28 },
    { '4', 29 }, { '5', 30 }, { '6', 31 }, { '7', 32 }, { '8', 33 }, { '9', 34 }, { '0', 35 }, { 0x21, 36 },
    { 0x2A, 37 }, { 0x25, 38 }, { 0x26, 39 }, { 0x23, 40 }, { 0x28, 41 }, { 0x29, 42 }, { 0x2D, 43 }, { 0x2B, 44 },
    { 0x3D, 45 }, { 0x27, 46 }, { 0x92, 46 }, { 0x60, 46 }, { 0x22, 47 }, { 0x3B, 49 }, { 0x3A, 50 }, { 0x2C, 51 },
    { 0x2E, 52 }, { 0x85, 52 }, { 0x3F, 53 }, { 0x2F, 54 }, { 0x5B, 55 }, { 0x5C, 56 }, { 0x5D, 57 }, { 0xD5, 62 },
    { 0xD6, 63 }, { 0xD1, 64 }, { 0xCA, 65 }, { 0xC6, 66 }, { 0xC5, 67 }, { 0xDF, 68 }, { 0xC7, 69 }, { 0xF5, 62 },
    { 0xF6, 63 }, { 0xF1, 64 }, { 0xEA, 65 }, { 0xE6, 66 }, { 0xE5, 67 }, { 0xDF, 68 }, { 0xE7, 69 }, { 0x7B, 66 },
    { 0x7D, 67 }, { 0x5E, 68 }, { 0x3C, 58 }, { 0x3E, 59 }, { 0x5F, 60 }, { 0x24, 61 }, { 0x7C, 62 }, { 0x7E, 63 },
    { 0x7F, 64 }, { 0x1F, 65 }, { 0xAE, 70 }, { 0xAF, 71 }, { 0xB0, 72 }, { 0xB1, 73 },
};
FontTab LFont = { &LargeFont, LFontTab, 114, 0 };
FontTab MFont = { &MediumFont, MFontTab, 118, 0x39 };

/* @0x80089C60 PRINTY.CPP:102 */
void FontTab::Set()
{
    for (int Loop = 0; Loop < 256; Loop++)
        Fnt->SetChar(Loop, 0x3039);
    for (int f = 0; f < NumOfItems; f++)
        Fnt->SetChar(Items[f].ch, Items[f].Offset + FrameBase);
}

/* @0x80089CFC PRINTY.CPP:581 */
void InitPrinty(void)
{
    int otpos;

    LargeFont.Init();
    MediumFont.Init();
    MediumFont.FontHeight = LargeFont.FontHeight = 0xD;
    LFont.Set();
    MFont.Set();
    otpos = CBlocks::GetOverlayOtBase();
    LargeFont.SetOTpos(otpos);
    MediumFont.SetOTpos(otpos);
    LargeFont.ClearFont();
}

/* @0x80089DAC PRINTY.CPP:605 */
void CFont::SetTextDat(TextDat *NewDat)
{
    ThisDat = NewDat;
}

/* @0x80089DB4 PRINTY.CPP:617 */
int CFont::KanjiPrintChar(unsigned short Cx, unsigned short Cy, unsigned short kan, unsigned char R, unsigned char G, unsigned char B)
{
    CharFt4 = GetKanjiFrm(kan);
    CharFt4->x0 = Cx;
    CharFt4->y0 = Cy - 10;
    CharFt4->x1 = Cx + 12;
    CharFt4->y1 = Cy - 10;
    CharFt4->x2 = Cx;
    CharFt4->y2 = Cy + 2;
    CharFt4->x3 = Cx + 12;
    CharFt4->y3 = Cy + 2;
    CharFt4->r0 = R;
    CharFt4->g0 = G;
    CharFt4->b0 = B;
    setSemiTrans(CharFt4, 0);
    setShadeTex(CharFt4, 0);
    addPrim(ThisOt + PrintyOTpos + 1, CharFt4);
    return 12;
}

/* @0x80089EEC PRINTY.CPP:667 */
int CFont::PrintChar(unsigned short Cx, unsigned short Cy, unsigned char C, unsigned char R, unsigned char G, unsigned char B)
{
    int Cw;

    if (C == 0xFF)
        return 0;
    if (!IsDefined(C) && C != '\n')
        return 0;
    Cw = GetCharWidth(C);
    CharFrm = GetCharFrameNum(C);
    if (C != ' ' && Cw > 0) {
        CharFt4 = ThisDat->PrintFt4(CharFrm, Cx, Cy, 0, PrintyOTpos + 1, 0);
        if (!buttoncol && CharFrm >= 0x73 && CharFrm <= 0x7A) {
            CharFt4->r0 = 0x80;
            CharFt4->g0 = 0x80;
            CharFt4->b0 = 0x80;
        } else {
            CharFt4->r0 = R;
            CharFt4->g0 = G;
            CharFt4->b0 = B;
        }
        setSemiTrans(CharFt4, 0);
        setShadeTex(CharFt4, 0);
    }
    return Cw;
}

/* @0x8008A090 PRINTY.CPP:746 */
int CFont::Print(int X, int Y, char *Str, TXT_JUST Justify, RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B)
{
    int Cx = 0;
    int Cy;
    int WrapCount;
    char *EndPtr;
    char *SpacePtr;
    int CharW;
    int SpaceW;
    int _WindowW;
    int WindowW;
    int WindowH;
    int WindowX;
    int WindowY;
    RECT ClipRect;
    unsigned short kan;
    char *OrigStr;

    PRIM_FullScreen(PrintyOTpos + 1);
    G -= G >> 3;
    B -= B >> 2;
    MinX = 0x3039;
    MaxX = 0;
    if (TextWindow) {
        WindowH = TextWindow->h;
        WindowW = TextWindow->w;
        WindowX = TextWindow->x;
        WindowY = TextWindow->y;
    } else {
        WindowW = 0x140;
        WindowH = 0x100;
        WindowX = 0;
        WindowY = 0;
    }
    Cy = Y + WindowY;
    _WindowW = WindowW;
    while (!IsKanjiLoaded())
        TSK_Sleep(1);
    OrigStr = Str;
    WrapCount = 0;
    while (*Str) {
        EndPtr = Str;
        SpacePtr = NULL;
        SpaceW = 0;
        WrapCount++;
        WindowW = _WindowW;
        Width = 0;
        while (Width < WindowW) {
            unsigned char c = *EndPtr;
            if (!*EndPtr)
                break;
            if (*EndPtr == '\n')
                break;
            if (c == ' ' || c == '-' || c == 0xFF) {
                SpacePtr = EndPtr;
                SpaceW = Width;
            }
            if (c & 0x80) {
                SpacePtr = EndPtr;
                SpaceW = Width;
                CharW = 12;
                EndPtr++;
            } else {
                CharW = GetCharWidth(c);
            }
            EndPtr++;
            Width += CharW;
        }
        switch (*EndPtr) {
        case ' ':
        case 0:
            break;
        case '\n':
            EndPtr++;
            break;
        default:
            Width = WindowW + 1;
            SpaceW++;
            break;
        }
        if (WindowW < Width) {
            if (!SpacePtr) {
                char c;
                if (*EndPtr && *EndPtr != ' ') {
                    for (;;) {
                        if (!*EndPtr)
                            break;
                        c = *EndPtr;
                        if (c & 0x80) {
                            EndPtr++;
                            Width += 12;
                        } else {
                            Width += GetCharWidth(c);
                        }
                        EndPtr++;
                        if (!c || c == ' ')
                            break;
                    }
                }
                WindowW = Width;
            } else if (OrigStr == SpacePtr) {
                DBG_Error(NULL, "psxsrc/PRINTY.CPP", 0x370);
            } else {
                EndPtr = SpacePtr;
                Width = SpaceW;
            }
        }
        switch (Justify) {
        case JustLeft:
            Cx = WindowX + X;
            if (Cx < MinX)
                MinX = Cx;
            while (Str != EndPtr) {
                char c = *Str++;
                if (c & 0x80) {
                    kan = ((unsigned char)c << 8) | (unsigned char)*Str++;
                    Cx += KanjiPrintChar(Cx, Cy, kan, R, G, B);
                } else if (c) {
                    Cx += PrintChar(Cx, Cy + 1, c, R, G, B);
                }
            }
            break;
        case JustCentre:
            Cx = (WindowW - Width) / 2 + WindowX;
            if (Cx < MinX)
                MinX = Cx;
            while (Str != EndPtr) {
                if (*Str & 0x80) {
                    kan = *Str++ << 8;
                    kan |= (unsigned char)*Str++;
                    Cx += KanjiPrintChar(Cx, Cy, kan, R, G, B);
                } else if (*Str) {
                    Cx += PrintChar(Cx, Cy + 1, *Str++, R, G, B);
                } else {
                    Str++;
                }
            }
            break;
        case JustRight:
            Cx = WindowW - Width + WindowX;
            if (Cx < MinX)
                MinX = Cx;
            while (Str != EndPtr) {
                if (*Str & 0x80) {
                    kan = *Str++ << 8;
                    kan |= (unsigned char)*Str++;
                    Cx += KanjiPrintChar(Cx, Cy, kan, R, G, B);
                } else if (*Str) {
                    Cx += PrintChar(Cx, Cy + 1, *Str++, R, G, B);
                } else {
                    Str++;
                }
            }
            break;
        }
        if (MaxX < Cx)
            MaxX = Cx;
        Cy += FontHeight;
        while (*Str == ' ')
            Str++;
    }
    ClipRect.x = WindowX;
    ClipRect.y = WindowY;
    ClipRect.w = WindowW;
    ClipRect.h = WindowH;
    PRIM_Clip(&ClipRect, PrintyOTpos + 1);
    return WrapCount;
}

/* @0x8008A6C8 PRINTY.CPP:989 */
int CFont::GetWrap(char *Str, RECT *TextWindow)
{
    int WrapCount;
    char *EndPtr;
    char *SpacePtr;
    char *LastSpacePtr;
    int CharW;
    int SpaceW;
    int WindowW;
    int _WindowW;

    if (TextWindow)
        WindowW = TextWindow->w;
    else
        WindowW = 0x140;
    _WindowW = WindowW;
    WrapCount = 0;
    while (*Str) {
        WindowW = _WindowW;
        EndPtr = Str;
        SpacePtr = NULL;
        LastSpacePtr = NULL;
        WrapCount++;
        Width = 0;
        SpaceW = 0;
        while (Width < WindowW) {
            unsigned char c = *EndPtr;
            if (!*EndPtr)
                break;
            if (*EndPtr == '\n')
                break;
            if (c == ' ' || c == '-' || c == 0xFF) {
                SpacePtr = EndPtr;
                SpaceW = Width;
            }
            if (c & 0x80) {
                SpacePtr = EndPtr;
                SpaceW = Width;
                CharW = 12;
                EndPtr++;
            } else {
                CharW = GetCharWidth(c);
            }
            EndPtr++;
            Width += CharW;
        }
        switch (*EndPtr) {
        case ' ':
        case 0:
            break;
        case '\n':
            EndPtr++;
            break;
        default:
            Width = WindowW + 1;
            SpaceW++;
            break;
        }
        if (WindowW < Width) {
            if (!SpacePtr) {
                char c;
                if (*EndPtr && *EndPtr != ' ') {
                    do for (;;) {
                        if (!*EndPtr)
                            goto done;
                        c = *EndPtr;
                        if (c & 0x80) {
                            EndPtr++;
                            Width += 12;
                        } else {
                            Width += GetCharWidth(c);
                        }
                        EndPtr++;
                        if (!c || c == ' ')
                            break;
                    } while (0);
                done:;
                }
            } else if (LastSpacePtr == SpacePtr) {
                DBG_Error(NULL, "psxsrc/PRINTY.CPP", 0x43D);
            } else {
                EndPtr = SpacePtr;
                Width = SpaceW;
            }
        }
        Str = EndPtr;
        while (*Str == ' ')
            Str++;
    }
    return WrapCount;
}

/* @0x8008A938 PRINTY.CPP:1107 */
int CFont::GetWrapWidth(char *Str, RECT *TextWindow)
{
    char *EndPtr;
    char *SpacePtr;
    char *LastSpacePtr;
    int CharW;
    int SpaceW;
    int WindowW;

    if (TextWindow)
        WindowW = TextWindow->w;
    else
        WindowW = 0x140;
    EndPtr = Str;
    SpacePtr = NULL;
    LastSpacePtr = NULL;
    Width = 0;
    SpaceW = 0;
    while (Width < WindowW) {
        unsigned char c = *EndPtr;
        if (!*EndPtr)
            break;
        if (*EndPtr == '\n')
            break;
        if (c == ' ' || c == '-' || c == 0xFF) {
            SpacePtr = EndPtr;
            SpaceW = Width;
        }
        if (c & 0x80) {
            SpacePtr = EndPtr;
            SpaceW = Width;
            CharW = 12;
            EndPtr++;
        } else {
            CharW = GetCharWidth(c);
        }
        EndPtr++;
        Width += CharW;
    }
    switch (*EndPtr) {
    case ' ':
    case 0:
    case '\n':
        break;
    default:
        Width = WindowW + 1;
        SpaceW++;
        break;
    }
    if (WindowW < Width) {
        if (!SpacePtr)
            return 0;
        else if (LastSpacePtr == SpacePtr)
            DBG_Error(NULL, "psxsrc/PRINTY.CPP", 0x499);
        else {
            EndPtr = SpacePtr;
            Width = SpaceW;
        }
    }
    return Width;
}

/* @0x8008AAA4 PRINTY.CPP:1196 */
int CFont::GetStrWidth(char *Str)
{
    int Width;

    LANG_GetLang();
    Width = 0;
    while (*Str) {
        if (*(unsigned char *)Str & 0x80) {
            Str++;
            Width += 12;
        } else {
            Width += GetCharWidth(*(unsigned char *)Str);
        }
        Str++;
    }
    return Width;
}

/* @0x8008AB20 PRINTY.CPP:1226 */
void CFont::SetChar(int ch, unsigned short Frm)
{
    if (!(ch < 256))
        DBG_Error(NULL, "psxsrc/PRINTY.CPP", 0x4CB);
    if (!(ch >= 0))
        DBG_Error(NULL, "psxsrc/PRINTY.CPP", 0x4CC);
    FontTab[ch] = Frm;
}

/* @0x8008ABA0 PRINTY.CPP:1235 */
int CFont::SetOTpos(int OT)
{
    int OldOT = PrintyOTpos;

    PrintyOTpos = OT;
    return OldOT;
}

/* @0x8008ABAC PRINTY.CPP:1246 */
int CFont::GetCharWidth(unsigned char ch)
{
    if (ch & 0x80)
        return 12;
    if (ch == 0xFF)
        return 0;
    if (ch == ' ')
        return 3;
    if (ch == '\n')
        return 0;
    if (!IsDefined(ch))
        return 1;
    if (ch == '.')
        return ThisDat->GetFr(FontTab['.'])->W;
    return ThisDat->GetFr(FontTab[ch])->W - 1;
}
