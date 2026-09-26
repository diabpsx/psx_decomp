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
    void SetBorder(int Border) { BorderGfx = Border; }
    void SetRGB(unsigned char R, unsigned char G, unsigned char B)
    {
        DialogRed = R;
        DialogGreen = G;
        DialogBlue = B;
    }
    void Bevels(int Type);
    void Display(int x, int y, int W, int H);
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
};

extern CFont MediumFont;
extern char tempstr[256];
extern unsigned char REDR, REDG, REDB;
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

void RemoveHelp(void);

static struct RECT HelpRect;
static unsigned char HelpTop;
static char help_select_line;
BOOL displayinghelp;
static Dialog HelpBack;
static BOOL helpflag;
extern struct HelpStruct HelpList[25];

/* @0x800AE38C PSXHELP.CPP:72 */
void RemoveHelp(void)
{
    helpflag = 0;
    cmenu = 0;
}

/* @0x800AE3A0 PSXHELP.CPP:80 */
void HelpPad(void)
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
int GetControlKey(int str, BOOL *iscombo)
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
void InitHelp(void)
{
    PostGamePad(0xB, options_pad, (int)txt_actions, 0);
    helpflag = 1;
    HelpTop = 0;
    help_select_line = 1;
    displayinghelp = 0;
}

/* @0x800AE73C PSXHELP.CPP:294 */
int DrawHelpLine(int x, int y, char *txt, char R, char G, char B, struct HelpStruct *hp)
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
