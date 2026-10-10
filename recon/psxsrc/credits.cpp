/* CREDITS.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC, FRONTEND overlay).  No PC twin: the
 * credits screen -- CreditsText[] title/subtitle/text string ids shown over the CScreen backdrop, each
 * character drawn by PrintCredits as a "melting" strip of POLY_FT4 copies offset by CreditsTable. */
#include "diabpsx_types.h"
#include "psxsrc/textfileinfo_header.h"   /* GMAN.H inlines: the ".tp"/".dat" literal pool heads this TU's .sdata */

/* ---------------------------------------------------------------- types ---- */
struct RECT;
struct POLY_FT4 {   /* sizeof 40 */
    unsigned long tag;
    unsigned char r0, g0, b0, code;
    short x0, y0;
    unsigned char u0, v0;
    unsigned short clut;
    short x1, y1;
    unsigned char u1, v1;
    unsigned short tpage;
    short x2, y2;
    unsigned char u2, v2;
    unsigned short pad1;
    short x3, y3;
    unsigned char u3, v3;
    unsigned short pad2;
};
struct P_TAG {
    unsigned addr : 24;
    unsigned len : 8;
    unsigned char r0, g0, b0, code;
};
/* verbatim PsyQ 4.0 LIBGPU.H primitive macros */
typedef unsigned char u_char;
typedef unsigned long u_long;
#define setRGB0(p,_r0,_g0,_b0)						\
	(p)->r0 = _r0,(p)->g0 = _g0,(p)->b0 = _b0
#define setlen( p, _len) 	(((P_TAG *)(p))->len  = (u_char)(_len))
#define setaddr(p, _addr)	(((P_TAG *)(p))->addr = (u_long)(_addr))
#define setcode(p, _code)	(((P_TAG *)(p))->code = (u_char)(_code))
#define getlen(p)    		(u_char)(((P_TAG *)(p))->len)
#define getcode(p)   		(u_char)(((P_TAG *)(p))->code)
#define getaddr(p)   		(u_long)(((P_TAG *)(p))->addr)
#define addPrim(ot, p)		setaddr(p, getaddr(ot)), setaddr(ot, p)
#define setSemiTrans(p, abe) \
	((abe)?setcode(p, getcode(p)|0x02):setcode(p, getcode(p)&~0x02))
#define setShadeTex(p, tge) \
	((tge)?setcode(p, getcode(p)|0x01):setcode(p, getcode(p)&~0x01))

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

extern "C" BOOL GAL_Free(long Hnd);
extern "C" void DBG_Error(char *Text, char *File, int Line);

struct SPR_HDR;
struct CTextFileInfo;
class TextDat {   /* sizeof 112 */
public:
    BOOL OwnDat;                        /* +0x0 */
    int TexNum;                         /* +0x4 */
    int LastFrame;                      /* +0x8 */
    BOOL DatLoaded;                     /* +0xC */
    long hndDat;                        /* +0x10 */
    long hndHdr;                        /* +0x14 */
    long hndPalOffset;                  /* +0x18 */
    long hndCreatureOffset;             /* +0x1C */
    long hndBlockOffsets;               /* +0x20 */
    FRAME_HDR *Frames;                  /* +0x24 */
    SPR_HDR *Hdr;                       /* +0x28 */
    void *Pals;                         /* +0x2C */
    int *PalOffset;                     /* +0x30 */
    int *CreatureOffset;                /* +0x34 */
    unsigned char *CreatureAnims;       /* +0x38 */
    unsigned char *Blocks;              /* +0x3C */
    BOOL Loaded;                        /* +0x40 */
    int LoadCount;                      /* +0x44 */
    CTextFileInfo *FileInfo;            /* +0x48 */
    long hndDecompBuffer;               /* +0x4C */
    int DecX;                           /* +0x50 */
    int DecY;                           /* +0x54 */
    int PalX;                           /* +0x58 */
    int PalY;                           /* +0x5C */
    int Scr;                            /* +0x60 */
    int NumOfBuffers[2];                /* +0x64 */
    long hndDecompArrays;               /* +0x6C */

    ~TextDat();
    FRAME_HDR *GetFr(int FrNum) { return Frames + (unsigned short)FrNum; }
    inline void DumpDatFile();
};
/* GMAN.H:290-296 -- never called here; compiling it emits "psxsrc/gman.h" into .CREDITS_rdata */
inline void TextDat::DumpDatFile()
{
    if (hndDat != -1 && OwnDat) {
        long Hnd = hndDat;
        if (!GAL_Free(Hnd)) DBG_Error(NULL, "psxsrc/gman.h", 295);
        hndDat = -1;
    }
}

class CPlayer;
class CPlayer {   /* CPLAYER.H inline: never called here; emits "psxsrc/cplayer.h" */
public:
    static CPlayer *PActiveArray[2];   /* _7CPlayer.PActiveArray @0x8011AD50, defined by cplayer.cpp */
    unsigned char data[144];
    static CPlayer *GetPlayer(int PNum)
    {
        if (1 < (unsigned int)PNum)
            DBG_Error(NULL, "psxsrc/cplayer.h", 0x41);
        return PActiveArray[PNum];
    }
};

struct CScreen : public TextDat {   /* sizeof 124 */
    int LoadedId;                       /* +0x70 */
    int TpX;                            /* +0x74 */
    int TpY;                            /* +0x78 */

    CScreen();
    void Load(int Id, int tpx, int tpy);
    void Display(int Id, int tpx, int tpy, int fadeval);
    void Unload(void);
};

void GM_FinishedUsing(TextDat *Fin);
TextDat *GM_UseTexData(int Id);

class CFont {   /* sizeof 540 */
public:
    int TextureId;                      /* +0x0 */
    unsigned short FontTab[256];        /* +0x4 */
    int PrintyOTpos;                    /* +0x204 */
    int MinX;                           /* +0x208 */
    int MaxX;                           /* +0x20C */
    int Width;                          /* +0x210 */
    TextDat *ThisDat;                   /* +0x214 */
    unsigned char FontHeight;           /* +0x218 */

    void SetTextDat(TextDat *NewDat);
    int GetCharWidth(unsigned char ch);
    int PrintChar(unsigned short Cx, unsigned short Cy, unsigned char C, unsigned char R, unsigned char G, unsigned char B);
    int GetCharHeight(unsigned char ch) { return ThisDat->GetFr(FontTab[ch])->H; }
    void ClearFont() { GM_FinishedUsing(ThisDat); }
};

struct FontItem;
struct FontTab {   /* sizeof 16 */
    CFont *Fnt;
    FontItem *Items;
    int NumOfItems;
    int FrameBase;
    void Set(void);
};

struct Creds {   /* sizeof 12 */
    int Title;
    int SubTitle;
    int Text;
};

extern POLY_FT4 *ThisPrimAddr;
extern POLY_FT4 *AddrToAvoid;
inline void PRIM_GetPrim(POLY_FT4 **Prim);

/* ---------------------------------------------------------------- externals ---- */
extern "C" void TSK_Sleep(int Frames);
char *GetStr(int StrId);
void PrintSelectBack(unsigned short Str);
BOOL PaletteFadeIn(int fr);
BOOL PaletteFadeOut(int fr);
BOOL GetFadeState(void);
void LANG_ReloadMainTXT(void);
void ReadPad(int NoDeb);
void PlaySFX(int psfx);
unsigned long VID_GetTick(void);

extern CFont LargeFont;
extern FontTab LFont;
extern POLY_FT4 *CharFt4;
extern TextDat *FeTData;
extern int CharFrm;
extern unsigned long *ThisOt;
extern short DavesPad;
extern BOOL CDWAIT;

/* ---------------------------------------------------------------- TU data ---- */
int InCredits;          /* @0x8011B3BC (gp-rel only here) */
int CreditTitleNo;      /* @0x8011B3C0 */
int CreditSubTitleNo;   /* @0x8011B3C4 */
struct Creds CreditsText[57] = {   /* @0x8013CB74 */
    { 0x4001, 0x4001, 0x4001 }, { 0x4002, 0x4001, 0x4003 }, { 0x4004, 0x4001, 0x4005 }, { 0x4006, 0x4007, 0x4008 },
    { 0x4006, 0x4009, 0x400A }, { 0x4006, 0x400B, 0x400C }, { 0x4006, 0x400D, 0x400E }, { 0x4006, 0x4019, 0x401A },
    { 0x4006, 0x400F, 0x4010 }, { 0x4006, 0x4011, 0x4012 }, { 0x4006, 0x4011, 0x4013 }, { 0x4006, 0x4014, 0x4015 },
    { 0x4006, 0x4016, 0x4017 }, { 0x4006, 0x4016, 0x4018 }, { 0x4006, 0x401B, 0x401C }, { 0x4006, 0x401D, 0x401E },
    { 0x4006, 0x401F, 0x4020 }, { 0x4006, 0x4021, 0x4022 }, { 0x4023, 0x4024, 0x4025 }, { 0x4023, 0x4026, 0x4027 },
    { 0x4023, 0x4028, 0x4029 }, { 0x4023, 0x402A, 0x402B }, { 0x4023, 0x402C, 0x402D }, { 0x4023, 0x402E, 0x402F },
    { 0x4023, 0x4030, 0x4031 }, { 0x4023, 0x4032, 0x4033 }, { 0x4023, 0x4034, 0x4035 }, { 0x4036, 0x4037, 0x4038 },
    { 0x4036, 0x4039, 0x403A }, { 0x4036, 0x403B, 0x403C }, { 0x4036, 0x403D, 0x403E }, { 0x4036, 0x403D, 0x403F },
    { 0x4036, 0x403D, 0x4040 }, { 0x4036, 0x403D, 0x4041 }, { 0x4036, 0x4042, 0x4043 }, { 0x4036, 0x4044, 0x4045 },
    { 0x4036, 0x4046, 0x4047 }, { 0x4036, 0x4046, 0x4048 }, { 0x4053, 0x4054, 0x4055 }, { 0x4053, 0x4056, 0x4057 },
    { 0x4053, 0x405A, 0x405B }, { 0x4053, 0x4064, 0x4065 }, { 0x4053, 0x4064, 0x4066 }, { 0x4053, 0x4064, 0x4067 },
    { 0x4053, 0x4058, 0x4059 }, { 0x4053, 0x405C, 0x405D }, { 0x4053, 0x405E, 0x405F }, { 0x4053, 0x4060, 0x4061 },
    { 0x4053, 0x4062, 0x4063 }, { 0x4049, 0x4001, 0x404A }, { 0x4049, 0x4001, 0x404B }, { 0x4049, 0x4001, 0x404C },
    { 0x404D, 0x4001, 0x404E }, { 0x404D, 0x4001, 0x404F }, { 0x404D, 0x4001, 0x4050 }, { 0x404D, 0x4001, 0x4051 },
    { 0x404D, 0x4001, 0x4052 },
};
int CreditsTable[224] = {   /* @0x8013CE20 */
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 1, 1, 1, 1, 0, 0, 0, -1, -1, -1, -1, -1, 0,
    0, 1, 2, 2, 2, 2, 2, 1, 0, -1, -2, -2, -3, -2, -2, -1,
    0, 1, 2, 3, 3, 3, 2, 1, 0, -1, -2, -3, -3, -3, -2, -1,
    0, 1, 3, 4, 4, 4, 3, 1, 0, -1, -3, -4, -5, -4, -3, -1,
    0, 2, 4, 5, 5, 5, 4, 2, 0, -2, -4, -5, -6, -5, -4, -2,
    0, 2, 4, 6, 6, 6, 4, 2, 0, -2, -4, -6, -6, -6, -4, -2,
    0, 3, 5, 7, 7, 7, 5, 3, 0, -3, -5, -7, -7, -7, -5, -3,
    0, 3, 6, 8, 8, 8, 6, 3, 0, -3, -6, -8, -9, -8, -6, -3,
    0, 3, 7, 9, 9, 9, 7, 3, 0, -3, -7, -9, -10, -9, -7, -3,
    0, 4, 7, 10, 10, 10, 7, 4, 0, -4, -7, -10, -11, -10, -7, -4,
    0, 4, 7, 10, 10, 10, 7, 4, 0, -4, -7, -10, -11, -10, -7, -4,
    0, 4, 7, 10, 10, 10, 7, 4, 0, -4, -7, -10, -11, -10, -7, -4,
    0, 4, 7, 10, 10, 10, 7, 4, 0, -4, -7, -10, -11, -10, -7, -4,
};

inline void PRIM_GetPrim(POLY_FT4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_FT4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 0x44);
    *Prim = (POLY_FT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_FT4 *)ThisPrimAddr + 1);
}

extern int PrintCredits(int StrNo, int Y, int CharFade, int RFlag, int GFlag, int BFlag);
extern void DoCredits(void);

/* @0x8013D1B4 CREDITS.CPP:355 */
void InitCredits(void)
{
    InCredits = 5;
    CreditSubTitleNo = -1;
    CreditTitleNo = -1;
    LargeFont.SetTextDat(GM_UseTexData(0xCB));
    LFont.Set();
    DoCredits();
    LargeFont.ClearFont();
    LargeFont.SetTextDat(GM_UseTexData(0));
    LFont.Set();
}

/* @0x8013D248 CREDITS.CPP:429 */
int PrintCredits(int StrNo, int Y, int CharFade, int RFlag, int GFlag, int BFlag)
{
    int CharHeight, Loop, Width;
    char *EndPtr;
    int X, x0, x1, x2, x3, Fade;
    POLY_FT4 *Ft4;
    int Col;
    int DoneFlag = 1;
    FRAME_HDR *Fr;
    char *Str = GetStr(StrNo);

    while (*Str) {
        EndPtr = Str;
        Width = 0;
        while (*EndPtr && *EndPtr != '|') {
            Width += LargeFont.GetCharWidth(*EndPtr);
            EndPtr++;
        }
        X = (320 - Width) / 2;
        while (Str != EndPtr) {
            Fade = ++CharFade;
            if (Fade > 127)
                Fade = 127;
            if (Fade < 0)
                Fade = 0;
            if (Fade > 0 && Fade < 127)
                DoneFlag = 0;
            if (*Str == ' ')
                Width = LargeFont.GetCharWidth(' ');
            else {
                Width = LargeFont.PrintChar(X, Y, *Str, 128, 128, 128);
                CharFt4->tpage |= 0x20;
                setSemiTrans(CharFt4, 1);
                setShadeTex(CharFt4, 0);
                Fr = FeTData->GetFr(CharFrm);
                x0 = CharFt4->x0;
                x1 = CharFt4->x1;
                x2 = CharFt4->x2;
                x3 = CharFt4->x3;
                if (((unsigned long *)Fr)[1] & 0x2000000) {
                    CharFt4->x0 = x0 + CreditsTable[127 - Fade];
                    CharFt4->x1 = x1 + CreditsTable[131 - Fade];
                    CharFt4->x2 = x2 + CreditsTable[127 - Fade];
                    CharFt4->x3 = x3 + CreditsTable[131 - Fade];
                    CharFt4->y2 = CharFt4->y0 + 2;
                    CharFt4->y3 = CharFt4->y1 + 2;
                    CharFt4->u2 = CharFt4->u0 + 2;
                    CharFt4->u3 = CharFt4->u1 + 2;
                    Loop = 2;
                    CharFt4->r0 = Fade & RFlag;
                    CharFt4->g0 = Fade & GFlag;
                    CharFt4->b0 = Fade & BFlag;
                    CharHeight = LargeFont.GetCharHeight(*Str);
                    for (; Loop < CharHeight - 1; Loop += 2) {
                        Fade++;
                        if ((Col = Fade - Loop) > 0) {
                            if (Fade & ~127)
                                Fade = 127;
                            PRIM_GetPrim(&Ft4);
                            *Ft4 = *CharFt4;
                            Ft4->x0 = x0 + CreditsTable[127 - Fade];
                            Ft4->y0 += Loop;
                            Ft4->x1 = x1 + CreditsTable[131 - Fade];
                            Ft4->y1 += Loop;
                            Ft4->x2 = x2 + CreditsTable[127 - Fade];
                            Ft4->y2 += Loop;
                            Ft4->x3 = x3 + CreditsTable[131 - Fade];
                            Ft4->y3 += Loop;
                            Ft4->u0 += Loop;
                            Ft4->u1 += Loop;
                            Ft4->u2 += Loop;
                            Ft4->u3 += Loop;
                            Col = Fade - Loop;
                            if (Col < 0)
                                Col = 0;
                            Ft4->r0 = Col & RFlag;
                            Ft4->g0 = Col & GFlag;
                            Ft4->b0 = Col & BFlag;
                            addPrim(ThisOt + 100, Ft4);
                        }
                    }
                } else {
                    CharFt4->x0 = x0 + CreditsTable[127 - Fade];
                    CharFt4->x1 = x1 + CreditsTable[131 - Fade];
                    CharFt4->x2 = x2 + CreditsTable[127 - Fade];
                    CharFt4->x3 = x3 + CreditsTable[131 - Fade];
                    CharFt4->y2 = CharFt4->y0 + 2;
                    CharFt4->y3 = CharFt4->y1 + 2;
                    CharFt4->v2 = CharFt4->v0 + 2;
                    CharFt4->v3 = CharFt4->v1 + 2;
                    Loop = 1;
                    CharFt4->r0 = Fade & RFlag;
                    CharFt4->g0 = Fade & GFlag;
                    CharFt4->b0 = Fade & BFlag;
                    CharHeight = LargeFont.GetCharHeight(*Str);
                    for (; Loop < CharHeight - 1; Loop += 2) {
                        Fade++;
                        if ((Col = Fade - Loop) > 0) {
                            if (Fade & ~127)
                                Fade = 127;
                            PRIM_GetPrim(&Ft4);
                            *Ft4 = *CharFt4;
                            Ft4->x0 = x0 + CreditsTable[127 - Fade];
                            Ft4->y0 += Loop;
                            Ft4->x1 = x1 + CreditsTable[131 - Fade];
                            Ft4->y1 += Loop;
                            Ft4->x2 = x2 + CreditsTable[127 - Fade];
                            Ft4->y2 += Loop;
                            Ft4->x3 = x3 + CreditsTable[131 - Fade];
                            Ft4->y3 += Loop;
                            Ft4->v0 += Loop;
                            Ft4->v1 += Loop;
                            Ft4->v2 += Loop;
                            Ft4->v3 += Loop;
                            Col = Fade - Loop * 2;
                            if (Col < 0)
                                Col = 0;
                            Ft4->r0 = Col & RFlag;
                            Ft4->g0 = Col & GFlag;
                            Ft4->b0 = Col & BFlag;
                            addPrim(ThisOt + 100, Ft4);
                        }
                    }
                }
            }
            X += Width;
            Str++;
        }
        if (*EndPtr == '|')
            Str++;
        Y += 20;
    }
    return DoneFlag;
}

/* @0x8013DA78 CREDITS.CPP:580 */
void DrawCreditsTitle(int TitleNo, int TitleFade, int TitleMode, int NextTitleNo, int Y)
{
    if ((TitleMode == 0 && TitleNo == CreditTitleNo) || (TitleMode == 2 && NextTitleNo == CreditTitleNo)) {
        TitleMode = 1;
        TitleFade = 127;
    }
    switch (TitleMode) {
    case 0:
        PrintCredits(TitleNo, Y, TitleFade, 255, 255, 0);
        break;
    case 1:
        CreditTitleNo = TitleNo;
    case 2:
        PrintCredits(CreditTitleNo, Y, TitleFade, 255, 255, 0);
        break;
    }
}

/* @0x8013DB30 CREDITS.CPP:605 */
void DrawCreditsSubTitle(int SubTitleNo, int SubTitleFade, int SubTitleMode, int NextSubTitleNo, int Y)
{
    if ((SubTitleMode == 0 && SubTitleNo == CreditSubTitleNo) || (SubTitleMode == 2 && NextSubTitleNo == CreditSubTitleNo)) {
        SubTitleMode = 1;
        SubTitleFade = 127;
    }
    switch (SubTitleMode) {
    case 0:
        if (SubTitleNo != -1)
            PrintCredits(SubTitleNo, Y, SubTitleFade, 255, 255, 255);
        break;
    case 1:
        CreditSubTitleNo = SubTitleNo;
    case 2:
        if (CreditSubTitleNo != -1)
            PrintCredits(CreditSubTitleNo, Y, SubTitleFade, 255, 255, 255);
        break;
    }
}

/* @0x8013DBE8 CREDITS.CPP:629 */
int CredCountNL(int Str)
{
    int Count = 0;
    char *StrPtr = GetStr(Str);

    while (*StrPtr) {
        if (*StrPtr == '|')
            Count++;
        StrPtr++;
    }
    return Count;
}

/* @0x8013DC54 CREDITS.CPP:647 */
void DoCredits(void)
{
    CScreen CreditsBack;
    int Y;
    int Fade;
    int Mode;
    unsigned short TextNo;
    unsigned long CreditsCount;
    int one = 1;

    Fade = 0;
    CreditsCount = 0;
    Mode = 0;
    TextNo = 0;

    CreditSubTitleNo = -1;
    CreditTitleNo = -1;
    InCredits = 5;
    CDWAIT = one;
    CreditsBack.Load(0xE, 0xB, 0);
    PrintSelectBack(0x4000);
    CDWAIT = 0;
    PaletteFadeIn(8);
    while (GetFadeState()) {
        CreditsBack.Display(0xE, 0xB, 0, 0);
        PrintSelectBack(0x4000);
        TSK_Sleep(one);
    }
    while (InCredits) {
        int YOfs;

        ReadPad(-1);
        Y = 40;
        DrawCreditsTitle(CreditsText[TextNo].Title, Fade, Mode, CreditsText[TextNo + 1].Title, Y);
        YOfs = CredCountNL(CreditsText[TextNo].Title) * 20;
        Y = YOfs + 0x44;
        DrawCreditsSubTitle(CreditsText[TextNo].SubTitle, Fade, Mode, CreditsText[TextNo + 1].SubTitle, Y);
        YOfs += CredCountNL(CreditsText[TextNo].SubTitle) * 20;
        if (!CredCountNL(CreditsText[TextNo].Title))
            YOfs = 0;
        Y = YOfs + 110;
        switch (Mode) {
        case 0:
            if (PrintCredits(CreditsText[TextNo].Text, Y, Fade, 255, 255, 255)) {
                Mode = 1;
                CreditsCount = VID_GetTick();
            } else
                Fade++;
            break;
        case 1:
            PrintCredits(CreditsText[TextNo].Text, Y, Fade, 255, 255, 255);
            if (VID_GetTick() - CreditsCount > 25) {
                Mode = 2;
                Fade -= one;
            }
            break;
        case 2:
            if (PrintCredits(CreditsText[TextNo].Text, Y, Fade, 255, 255, 255)) {
                Mode = 0;
                if (InCredits != 2)
                    TextNo++;
                Fade = 0;
            } else
                Fade--;
            break;
        }
        CreditsBack.Display(0xE, 0xB, 0, 0);
        if (InCredits >= 4)
            PrintSelectBack(0x4000);
        TSK_Sleep(1);
        if (InCredits == 2) {
            InCredits = 3;
            PaletteFadeOut(8);
        }
        if (InCredits == 3 && !GetFadeState())
            InCredits = 1;
        if ((DavesPad & 0x100) && InCredits == 5) {
            PlaySFX(0x33);
            InCredits = 2;
        }
        if (TextNo > 56) {
            InCredits = 2;
            TextNo = 0;
        }
    }
    LANG_ReloadMainTXT();
    CreditsBack.Unload();
}
