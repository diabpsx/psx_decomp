/* PSXHELP.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the in-game controls
 * help screen (HelpList of 25 lines, scrolled with the pad, each action line showing the pad
 * button assigned to it).  The header inlines (Dialog, CPad, CBlocks) are emitted out of line in
 * this object (-fno-inline). */
#include "diabpsx_types.h"

struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

enum TXT_JUST { JustLeft = 0, JustCentre = 1, JustRight = 2 };

extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;

class CBlocks {
public:
    static int GetOverlayOtBase() { return 0x1E8; }
};

class Dialog {
public:
    int BevelGfx;      /* +0x0 */
    int BorderGfx;     /* +0x4 */
    int BackGfx;       /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog()
    {
        BackGfx = 0x94;
        BevelGfx = 0x1A;
        BorderGfx = 0x1A;
        DialogRed = 0x80;
        DialogGreen = 0x80;
        DialogBlue = 0x80;
        DialogTRed = 0x20;
        DialogTGreen = 0x20;
        DialogTBlue = 0x20;
        DialogOTpos = CBlocks::GetOverlayOtBase();
    }
    ~Dialog() {}
    void SetBorder(int Type) { BorderGfx = Type; }
    void SetRGB(unsigned char R, unsigned char G, unsigned char B)
    {
        DialogRed = R;
        DialogGreen = G;
        DialogBlue = B;
    }
    void Bevels(int Type);
    void Display(int x, int y, int W, int H);
    void Back(int x, int y, int w, int h);
    int SetOTpos(int OT);
};

class CPad {
public:
    unsigned char get_both;       /* +0x0 */
    unsigned char active;         /* +0x1 */
    unsigned char PadType;        /* +0x2 */
    unsigned char PADTICK;        /* +0x3 */
    unsigned short PADTICKMASK;   /* +0x4 */
    unsigned short PadNum;        /* +0x6 */
    unsigned short Cur;           /* +0x8 */
    unsigned short Up;            /* +0xA */
    unsigned short Down;          /* +0xC */
    unsigned short Tick;          /* +0xE */
    unsigned short Old;           /* +0x10 */
    unsigned short both_Cur;      /* +0x12 */
    unsigned short both_Up;       /* +0x14 */
    unsigned short both_Down;     /* +0x16 */
    unsigned short both_Tick;     /* +0x18 */
    unsigned short both_Old;      /* +0x1A */
    unsigned char rest[236 - 0x1C];

    unsigned short GetTick() const
    {
        if (get_both)
            return both_Tick;
        return Tick;
    }
    unsigned short GetDown() const
    {
        if (get_both)
            return both_Down;
        return Down;
    }
    void SetPadTickMask(unsigned short mask) { PADTICKMASK = mask; }
    void SetPadTick(unsigned short tick) { PADTICK = tick; }
};

struct HelpStruct {   /* sizeof 12 */
    char DisplayType;
    int HelpTxt;
    int subtxt;
};

struct KEY_ASSIGNS {   /* sizeof 16 */
    int txt;
    int pad_val;
    void (*func)();
    int combo_val;
};

struct pad_assigns {   /* sizeof 12 */
    char *txt;
    int pnum;
    char font_num;
};

class CFont {
public:
    unsigned char data[540];
    int Print(int X, int Y, char *Str, enum TXT_JUST Justify, struct RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    int GetStrWidth(char *Str);
    int SetOTpos(int OT);
};

extern CFont MediumFont;
extern CFont LargeFont;
extern char tempstr[256];
extern unsigned char REDR, REDG, REDB;
/* the colour globals are const in the retail headers: gcc hoists their loads across calls */
extern const unsigned char WHITER, WHITEG, WHITEB;
extern const unsigned char GOLDR, GOLDG, GOLDB;
extern const unsigned char BLUER, BLUEG, BLUEB;
extern const unsigned char BORDERR, BORDERG, BORDERB;
void PrintSelectBack(unsigned short Id);
char *GetStr(int StrId);
void DrawFeTwinkle(int x, int y);
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);
static int DrawHelpLine(int x, int y, char *txt, char R, char G, char B, struct HelpStruct *hp);
extern "C" int sprintf(char *buf, const char *fmt, ...);

extern struct KEY_ASSIGNS txt_actions[20];
extern struct pad_assigns pad_txt[14];
extern int options_pad;
extern int cmenu;
extern unsigned char FeFlag;

CPad *PAD_GetPad(int PadNum, unsigned char both);
void PlaySFX(int psfx);
int get_key_pad(int n);
void PostGamePad(int val, int var1, int var2, int var3);

static void RemoveHelp(void);

static struct RECT HelpRect;
static unsigned char HelpTop;
static char help_select_line;
BOOL displayinghelp;
static Dialog HelpBack;
static BOOL helpflag;
extern struct HelpStruct HelpList[25];

/* Only DrawHelp is public (OPTIONS calls it): the helpers are file statics, which is why the
 * static-object thunks are named _GLOBAL__I/D_DrawHelp__Fv. */

/* @0x800AE38C PSXHELP.CPP:72 */
static void RemoveHelp(void)
{
    helpflag = 0;
    cmenu = 0;
}

/* @0x800AE3A0 PSXHELP.CPP:80 */
static void HelpPad(void)
{
    CPad *Pad = PAD_GetPad(options_pad, 0);

    if (FeFlag)
        Pad->SetPadTick(8);
    else
        Pad->SetPadTick(5);
    Pad->SetPadTickMask(3);

    if (!displayinghelp) {
        if (Pad->GetTick() & 1) {
            displayinghelp = 0;
            help_select_line--;
            if (HelpList[help_select_line].DisplayType == 4) {
                help_select_line--;
                if (HelpTop)
                    HelpTop--;
            }
            if (HelpTop)
                HelpTop--;
            if (help_select_line < 0)
                help_select_line += 25;
            if (help_select_line == 24)
                HelpTop = 22;
            PlaySFX(0x32);
        }
        if (Pad->GetTick() & 2) {
            displayinghelp = 0;
            help_select_line = (char)(help_select_line + 1) % 25;
            if (HelpList[help_select_line].DisplayType == 4) {
                help_select_line++;
                if (help_select_line >= 3)
                    HelpTop++;
            }
            if (help_select_line >= 3)
                HelpTop++;
            else if (help_select_line == 1)
                HelpTop = 0;
            PlaySFX(0x32);
        }
    }

    if (Pad->GetDown() & 0x100) {
        PlaySFX(0x33);
        if (displayinghelp)
            displayinghelp = 0;
        else
            RemoveHelp();
    }

    if ((Pad->GetDown() & 0x40) && HelpList[help_select_line].DisplayType != 1) {
        displayinghelp = 1;
        PlaySFX(0x33);
    }
}

/* @0x800AE648 PSXHELP.CPP:156 */
static int GetControlKey(int str, BOOL *iscombo)
{
    struct KEY_ASSIGNS *ta = txt_actions;

    *iscombo = 0;
    for (int i = 0; i < 20; ta++, i++) {
        if (ta->txt == str) {
            if (ta->pad_val)
                return pad_txt[get_key_pad(ta->pad_val)].font_num;
            if (ta->combo_val) {
                *iscombo = 1;
                return pad_txt[get_key_pad(ta->combo_val)].font_num;
            }
        }
    }
    return 0;
}

/* @0x800AE6F0 PSXHELP.CPP:228 */
static void InitHelp(void)
{
    PostGamePad(0xB, options_pad, (int)txt_actions, 0);
    helpflag = 1;
    HelpTop = 0;
    help_select_line = 1;
    displayinghelp = 0;
}

/* @0x800AE73C PSXHELP.CPP:294 */
static int DrawHelpLine(int x, int y, char *txt, char R, char G, char B, struct HelpStruct *hp)
{
    int eln;

    if (hp->DisplayType == 1) {
        int key;
        BOOL combo;

        key = GetControlKey(hp->HelpTxt, &combo);
        if (combo) {
            int nkey = GetControlKey(0xC6, &combo);
            if (nkey)
                sprintf(tempstr, "%c + %c %s", nkey, key, txt);
            else {
                R = REDR;
                G = REDG;
                B = REDB;
                sprintf(tempstr, "    %s", txt);
            }
        } else if (key)
            sprintf(tempstr, "%c   %s", key, txt);
        else {
            R = REDR;
            G = REDG;
            B = REDB;
            sprintf(tempstr, "    %s", txt);
        }
        MediumFont.Print(x, y, tempstr, JustLeft, &HelpRect, R, G, B);
        eln = MediumFont.GetStrWidth(tempstr);
    } else {
        if (displayinghelp)
            MediumFont.Print(x, y, txt, JustCentre, &HelpRect, R, G, B);
        else
            MediumFont.Print(x, y, txt, JustLeft, &HelpRect, R, G, B);
        eln = MediumFont.GetStrWidth(txt);
    }
    return eln;
}

/* @0x800AE950 PSXHELP.CPP:346 */
static void DisplayHelp(void)
{
    struct HelpStruct *hp = HelpList;
    int y = 16;

    for (int i = 0; i < 25; i++, hp++) {
        char *txt = GetStr(hp->HelpTxt);
        if (i >= HelpTop && !displayinghelp) {
            if (i == help_select_line) {
                int nlen = MediumFont.GetStrWidth(txt);
                if (displayinghelp)
                    y += 2;
                nlen = DrawHelpLine(0, y, txt, GOLDR, GOLDG, GOLDB, hp);
                if (!displayinghelp) {
                    if (FeFlag) {
                        DrawFeTwinkle(20, y + 50);
                        DrawFeTwinkle(nlen + 36, y + 50);
                    } else {
                        DrawSpinner(20, y + 50, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0x118, 1, 0, 8);
                        DrawSpinner(nlen + 36, y + 50, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, 1, 0x118, 1, 0, 8);
                    }
                }
                y += 16;
            } else if (hp->DisplayType == 4) {
                y += MediumFont.Print(0, y, txt, JustCentre, &HelpRect, WHITER, WHITEG, WHITEG) * 16;
            } else {
                DrawHelpLine(0, y, txt, WHITER, WHITEG, WHITEB, hp);
                y += 16;
            }
        } else if (displayinghelp && i == help_select_line) {
            DrawHelpLine(0, y, txt, GOLDR, GOLDG, GOLDB, hp);
            y += 16;
            MediumFont.Print(0, y, GetStr(hp->subtxt), JustLeft, &HelpRect, WHITER, WHITEG, WHITEG);
        }
        if (y >= 155)
            break;
    }
}

/* @0x800AECD0 PSXHELP.CPP:415 */
void DrawHelp(void)
{
    static Dialog txtBack;
    int otpos = CBlocks::GetOverlayOtBase();
    int oldDot = HelpBack.SetOTpos(otpos);
    int OldPrintOT = MediumFont.SetOTpos(otpos + 1);

    if (!helpflag)
        InitHelp();

    if (FeFlag)
        LargeFont.Print(0, 46, GetStr(0x1E5), JustCentre, NULL, BLUER, BLUEG, BLUEB);
    else {
        HelpRect.x = 16;
        HelpRect.y = 32;
        HelpRect.w = 273;
        HelpRect.h = 16;
        HelpBack.Back(16, 32, 282, 16);
        MediumFont.Print(0, 11, GetStr(0x1E5), JustCentre, &HelpRect, GOLDR, GOLDG, GOLDB);
    }

    HelpBack.SetBorder(0x12);
    HelpBack.SetRGB(BORDERR, BORDERG, BORDERB);
    HelpBack.Back(16, 52, 281, 154);
    HelpRect.x = 32;
    HelpRect.y = 52;
    HelpRect.w = 257;
    HelpRect.h = 154;
    HelpPad();
    DisplayHelp();

    if (HelpList[help_select_line].DisplayType == 3 && !displayinghelp)
        PrintSelectBack(0x4E6);
    else
        PrintSelectBack(0x4A0);

    HelpBack.SetOTpos(oldDot);
    MediumFont.SetOTpos(OldPrintOT);
}
