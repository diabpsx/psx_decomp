/* SOURCE/GAMEOVER.CPP — Diablo PSX (Climax 1998) reconstruction (SOURCE, splat segment gameover).
 * No PC twin: the "YOU HAVE DIED" screen — task that fades to red, shows the dialog box, waits for
 * the death-screen pause options, then restarts the game task.
 * Reconstructed from the retail oracle disassembly plus the m2c/Hex-Rays drafts recorded in
 * skel/SOURCE/GAMEOVER.CPP (generated from the retail SYM before this file existed).
 * Dialog's field layout is read directly off the retail SYM STRTAG record (BevelGfx/BorderGfx/
 * BackGfx/DialogOTpos), not guessed. */
#include "diabpsx_types.h"

struct TASK { unsigned char pad[92]; };   /* sizeof 92 per retail SYM; only used as an untyped handle here */

class CBlocks {
public:
    static int GetOverlayOtBase() { return 0x1E8; }
    static int GetMaxOtPos() { return 0x1FF; }
};

struct Dialog {   /* sizeof 16, real field names from the retail SYM STRTAG record */
    int BevelGfx;      /* +0x0 */
    int BorderGfx;     /* +0x4 */
    int BackGfx;       /* +0x8 */
    int DialogOTpos;   /* +0xC */

    Dialog();
    ~Dialog();
    void SetRGB(unsigned char R, unsigned char G, unsigned char B);
    void SetBack(int Type);
    void SetBorder(int Type);
    int SetOTpos(int NewOt);
    void Back(int X, int Y, int W, int H);
};

struct CPad {
    unsigned char AnalogMode;   /* +0x0 -- nonzero when the pad is in analog mode */
    unsigned char pad0[0xC - 1];
    unsigned short Down;        /* +0xC -- digital button-down bits */
    unsigned char pad1[0x16 - 0xE];
    unsigned short DownA;        /* +0x16 -- analog-mode button-down bits */
    unsigned char pad2[236 - 0x18];   /* sizeof CPad = 236 per retail SYM */

    unsigned short GetDown(void) const;
};

struct RECT { short x, y, w, h; };

struct CFont {   /* opaque body; only the methods this TU calls are declared */
    int SetOTpos(int NewOt);
    void Print(int X, int Y, const char *Str, int Just, struct RECT *R, unsigned char R2, unsigned char G2, unsigned char B2);
};
extern struct CFont MediumFont;

extern "C" struct TASK *TSK_Exist(void *List, int Type, int Id);
extern "C" void *TSK_AddTask(int List, void *Func, int StackSize, int Arg);
extern "C" void TSK_Sleep(int Ticks);
extern "C" void GLUE_SuspendGame(void);
extern "C" void GLUE_ResumeGame(void);
extern "C" void GLUE_SetFinished(BOOL NewFinished);
extern "C" void MAIN_RestartGameTask(void);
extern "C" void PA_SetPauseOk(BOOL Ok);
extern "C" void InitGamePadVars(void);
extern "C" void ToggleOptions(void);
extern "C" int VID_GetTick(void);
extern "C" CPad *PAD_GetPad(int Idx, unsigned char PlayerNo);
extern "C" int abs(int);
extern "C" void music_fade(void);
extern "C" void stream_fade(void);
extern "C" void RedBack(void);
extern "C" int PaletteFadeOut(int Ticks);
extern "C" int GetFadeState(void);
extern "C" const char *GetStr(int Id);

extern unsigned char automapflag;
extern unsigned char deathflag;
extern unsigned char PauseMode;
extern int options_pad;
extern int optionsflag;
extern int cmenu;
extern int FePlayerNo;
extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;
extern unsigned char BORDERR, BORDERG, BORDERB;

void GameOverTask(struct TASK *T);

/* -------------------------------------------------------------------------------------------- */

BOOL IS_GameOver(void)
{
    return TSK_Exist(0, 0x8001, -1) != 0;
}

void GO_DoGameOver(void)
{
    automapflag = 0;
    if (!IS_GameOver()) {
        TSK_AddTask(0x8001, (void *)GameOverTask, 0x800, 0);
    }
}

unsigned short CPad::GetDown(void) const
{
    if (AnalogMode != 0) {
        return DownA;
    }
    return Down;
}

void Dialog::SetRGB(unsigned char R, unsigned char G, unsigned char B)
{
    DialogRed = R;
    DialogGreen = G;
    DialogBlue = B;
}

void Dialog::SetBack(int Type)
{
    BackGfx = Type;
}

void Dialog::SetBorder(int Type)
{
    BorderGfx = Type;
}

Dialog::~Dialog()
{
}

Dialog::Dialog()
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

void PrintGameOver(void)
{
    struct Dialog PBack;
    RECT PRect;
    struct CFont *Font = &MediumFont;
    int otpos;
    int oldDotpos, oldTotpos;

    otpos = CBlocks::GetMaxOtPos();
    oldDotpos = PBack.SetOTpos(otpos - 3);
    oldTotpos = Font->SetOTpos(otpos - 2);
    PBack.SetRGB(BORDERR, BORDERG, BORDERB);
    PBack.SetBack(0x94);
    PBack.SetBorder(0x12);
    PBack.Back(0x50, 0x70, 0xA0, 0x10);
    PRect.x = 0x50;
    PRect.y = 0x70;
    PRect.w = 0xA0;
    PRect.h = 0x10;
    Font->Print(0, 0xC, GetStr(0x177), 1, &PRect, 0xFF, 0xFF, 0xFF);
    Font->SetOTpos(oldTotpos);
    PBack.SetOTpos(oldDotpos);
}

void GameOverTask(struct TASK *T)
{
    BOOL TimeOut;
    int TimeOutTime, lasttick;
    (void)T;

    TimeOut = 0;
    PA_SetPauseOk(0);
    TimeOutTime = 0x708;
    GLUE_SuspendGame();
    InitGamePadVars();
    if (deathflag != 0) {
        options_pad = 0;
        ToggleOptions();
        lasttick = VID_GetTick();
        while (optionsflag != 0 && TimeOut == 0) {
            CPad *Pad = PAD_GetPad(0, FePlayerNo);
            if (cmenu == 9) {
                TimeOutTime = 0x708;
            }
            if (Pad->GetDown() & 0xFFFF) {
                TimeOutTime = 0x708;
            } else {
                int ntick = VID_GetTick();
                if (ntick != lasttick) {
                    TimeOutTime -= abs(ntick - lasttick);
                    lasttick = ntick;
                    if (TimeOutTime <= 0) {
                        TimeOut = 1;
                    }
                }
            }
            TSK_Sleep(1);
        }
        if (deathflag == 0) {
            PauseMode = 0;
            return;
        }
        if (TimeOut != 0) {
            ToggleOptions();
        }
    }
    {
        int f = 0;

        music_fade();
        stream_fade();
        do {
            f++;
            RedBack();
            PrintGameOver();
            TSK_Sleep(1);
        } while (f < 0x78);
    }
    if (PaletteFadeOut(8) != 0) {
        while (GetFadeState() != 0) {
            RedBack();
            PrintGameOver();
            TSK_Sleep(1);
        }
    }
    deathflag = 0;
    GLUE_SuspendGame();
    GLUE_SetFinished(1);
    TSK_Sleep(3);
    PauseMode = 0;
    MAIN_RestartGameTask();
    GLUE_ResumeGame();
}
