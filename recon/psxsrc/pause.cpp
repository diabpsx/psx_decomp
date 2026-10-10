/* PAUSE.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/PAUSE.CPP).  No PC twin: the in-game
 * pause task.  PauseTask waits (GetPausePad) for an active player's START, then CPauseMessages::DoPause
 * freezes the game (exec filter, streams, panel) and runs the "Paused" / "Quit game?" / "Are you sure?"
 * dialogs through the pure-virtual print hooks that CTempPauseMessage implements.  The header inlines
 * (Dialog, CBlocks, CPad) are emitted out of line in this object (-fno-inline).
 * Sources: retail asm oracle > SYM (scratch/tuinfo.py PAUSE.CPP) > refs/skeleton PAUSE.H (prototypes). */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"

struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

enum TXT_JUST { JustLeft = 0, JustCentre = 1, JustRight = 2 };

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
struct TSnd;
struct TextDat;

extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;

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

    unsigned char CheckActive() { return active; }
    unsigned short GetDown() const
    {
        if (get_both)
            return both_Down;
        return Down;
    }
};

class CBlocks {
public:
    static int GetMaxOtPos() { return 0x1FF; }
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
    void SetBack(int Type) { BackGfx = Type; }
    void SetRGB(unsigned char R, unsigned char G, unsigned char B)
    {
        DialogRed = R;
        DialogGreen = G;
        DialogBlue = B;
    }
    void Back(int DX, int DY, int DW, int DH);
    int SetOTpos(int OT);
};

class CFont {
public:
    unsigned char data[540];
    int Print(int X, int Y, char *Str, enum TXT_JUST Justify, struct RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    int GetStrWidth(char *Str);
    int SetOTpos(int OT);
};

struct PlayerStruct {   /* sizeof 6632 -- only plractive is read here */
    int _pmode;              /* +0x0 */
    char walkpath[25];       /* +0x4 */
    unsigned char plractive; /* +0x1D */
    unsigned char rest[6632 - 0x1E];
};

struct TextDat *GM_UseTexData(int Id);

/* ---- pause-menu classes (declared in PAUSE.CPP itself: ctor/dtor line numbers 85/86/115) ---- */
class CPauseMessages {
public:
    int PadNum;   /* +0x0 ; vptr at +0x4 */

    CPauseMessages() {}
    virtual ~CPauseMessages() {}
    void DoPause(int nPadNum);
    BOOL DoPausedMessage();
    int DoQuitMessage();
    BOOL AreYouSureMessage();

    virtual void InitPrintQuitMessage() = 0;
    virtual void PrintQuitMessage(int Menu) = 0;
    virtual void LeavePrintQuitMessage(int Menu) = 0;
    virtual void InitPrintAreYouSure() = 0;
    virtual void PrintAreYouSure(int Menu) = 0;
    virtual void LeavePrintAreYouSure(int Menu) = 0;
    virtual void InitPrintPaused() = 0;
    virtual void PrintPaused() = 0;
    virtual void LeavePrintPaused() = 0;
};

class CTempPauseMessage : public CPauseMessages {
public:
    struct TextDat *TData;   /* +0x8 */

    CTempPauseMessage() { TData = GM_UseTexData(0); }
    ~CTempPauseMessage();
    void MY_PausePrint(int s, int Txt, int Menu, struct RECT *PRect);

    void InitPrintQuitMessage();
    void PrintQuitMessage(int Menu);
    void LeavePrintQuitMessage(int Menu);
    void InitPrintAreYouSure();
    void PrintAreYouSure(int Menu);
    void LeavePrintAreYouSure(int Menu);
    void InitPrintPaused();
    void PrintPaused();
    void LeavePrintPaused();
};

/* ---- externals ---- */
extern "C" {
void TSK_Sleep(int Frames);
void TSK_SetExecFilter(unsigned long Id, unsigned long Mask);
void TSK_ClearExecFilter(void);
void GAL_SetTimeStamp(int Time);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);
}
CPad *PAD_GetPad(int PadNum, unsigned char both);
BOOL BL_AsyncLoadDone(void);
BOOL GLUE_SetHomingScrollFlag(BOOL NewFlag);
BOOL GLUE_SetShowPanelFlag(BOOL NewFlag);
void GLUE_StartGameExit(void);
void STR_pauseall(void);
void STR_resumeall(void);
void snd_stop_snd(struct TSnd *pSnd);
void PlaySFX(int psfx);
void stream_stop(void);
void music_fade(void);
BOOL PaletteFadeOut(int fr);
BOOL GetFadeState(void);
char *GetStr(int StrId);
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);
void RedBack(void);
void PrintSelectBack(unsigned short Str);
BOOL IsGameLoading(void);
BOOL PA_SetPauseOk(BOOL NewPause);
BOOL PA_GetPauseOk(void);

extern unsigned char qtextflag;
extern BOOL optionsflag;
extern unsigned char invflag;
extern unsigned char chrflag;
extern unsigned char questlog;
extern unsigned char sbookflag;
extern char stextflag;
extern unsigned char deathflag;
extern BOOL user_start;
extern BOOL ignore_buttons;
extern int demo_pad_time;
extern int FePlayerNo;
extern unsigned char PauseMode;
extern struct PlayerStruct plr[2];
extern CFont MediumFont;
/* the colour globals are const in the retail headers */
extern const unsigned char WHITER, WHITEG, WHITEB;
extern const unsigned char GOLDR, GOLDG, GOLDB;
extern const unsigned char BLUER, BLUEG, BLUEB;
extern const unsigned char BORDERR, BORDERG, BORDERB;

/* ---- TU data ---- */
TASK *TPtr;                     /* SYM EXT, gp-rel here -> owned */
static BOOL CanPause;           /* retail STAT BOOL, 0x8011C644 */
static BOOL Paused;             /* retail STAT BOOL, 0x8011C648 */
static Dialog PBack;            /* retail STAT Dialog, 0x8011CBC0 */

/* Only the CPauseMessages methods onward have external callers: PauseTask/GetPausePad/
 * TryPadForPause are file statics, so the static-object thunks are _GLOBAL__I/D_DoPause. */
static int GetPausePad();
static BOOL TryPadForPause(int);

/* @0x800884C8 PAUSE.CPP:181 */
static void PauseTask(TASK *T)
{
    TPtr = T;
    while (1) {
        CTempPauseMessage Cpm;
        Cpm.DoPause(GetPausePad());
        Paused = 0;
    }
}

/* @0x80088518 PAUSE.CPP:211 */
static int GetPausePad(void)
{
    BOOL Done = false;
    int PadVal = -1;

    while (!Done) {
        if (CanPause && !optionsflag && !ignore_buttons && !demo_pad_time) {
            for (int f = 0; f <= FePlayerNo && !Done; f++) {
                CPad *Pad;
                if (plr[f].plractive) {
                    Pad = PAD_GetPad(f, 0);
                    if (!Pad->CheckActive()) {
                        Done = true;
                        PadVal = f;
                    }
                    if (TryPadForPause(f)) {
                        Done = true;
                        PadVal = f;
                    }
                }
            }
        }
        TSK_Sleep(1);
    }
    return PadVal;
}

/* @0x80088640 PAUSE.CPP:251 */
static BOOL TryPadForPause(int PadNum)
{
    if (PAD_GetPad(PadNum, 0)->GetDown() & 0x10)
        return true;
    return false;
}

/* @0x8008866C PAUSE.CPP:268 */
void CPauseMessages::DoPause(int nPadNum)
{
    if (nPadNum != -1) {
        if (!(optionsflag | qtextflag | invflag | chrflag | questlog | sbookflag | stextflag) && BL_AsyncLoadDone()) {
            TSK_SetExecFilter(0x8000, 0x8000);
            int dummy;   /* stand-in: retail's SYM has a record-less level from here to the end of the block
                          * (a dead local); the quit flag below reuses nPadNum ($s0), no record of its own */
            PadNum = nPadNum;
            PauseMode = 1;
            GLUE_SetHomingScrollFlag(false);
            GLUE_SetShowPanelFlag(false);
            STR_pauseall();
            snd_stop_snd(NULL);
            if (!deathflag)
                PlaySFX(0x33);
            while ((PA_GetPauseOk() && deathflag) ? PauseMode : DoPausedMessage()) {
                nPadNum = false;
                if (PA_GetPauseOk())
                    nPadNum = (BOOL)DoQuitMessage();
                if (nPadNum && !AreYouSureMessage()) {
                    PA_SetPauseOk(false);
                    stream_stop();
                    music_fade();
                    if (PaletteFadeOut(8)) {
                        for (;;) {
                            if (GetFadeState() == 0)
                                break;
                            TSK_Sleep(1);
                        }
                    }
                    PauseMode = 0;
                    GAL_SetTimeStamp(5);
                    GLUE_StartGameExit();
                    user_start = true;
                }
            }
            STR_resumeall();
            GLUE_SetShowPanelFlag(true);
            GLUE_SetHomingScrollFlag(true);
            PauseMode = 0;
            TSK_ClearExecFilter();
        }
    }
}

/* @0x8008887C PAUSE.CPP:339 */
BOOL CPauseMessages::DoPausedMessage()
{
    BOOL RetVal = false;
    BOOL Done = false;

    InitPrintPaused();
    while (!Done && PauseMode) {
        PrintPaused();
        TSK_Sleep(1);
        unsigned short PadVal = PAD_GetPad(PadNum, 0)->GetDown();
        if (PadVal & 0x10) {
            PlaySFX(0x33);
            Done = true;
            RetVal = false;
            TSK_Sleep(2);
        } else if (PAD_GetPad(PadNum, 1)->GetDown() & 0x20) {
            PlaySFX(0x33);
            Done = true;
            RetVal = true;
        }
        PAD_GetPad(0, 0);
    }
    LeavePrintPaused();
    return RetVal;
}

/* @0x800889B4 PAUSE.CPP:462 */
int CPauseMessages::DoQuitMessage()
{
    int RetVal = 0;
    BOOL Done = false;
    int Menu = 1;

    InitPrintQuitMessage();
    while (!Done) {
        unsigned short PadVal;
        PrintQuitMessage(Menu);
        TSK_Sleep(1);
        PadVal = PAD_GetPad(PadNum, 1)->GetDown();
        if (PadVal & 3) {
            PlaySFX(0x32);
            Menu = !Menu;
        }
        if (PadVal & 0x50) {
            PlaySFX(0x33);
            Done = true;
            RetVal = !Menu;
        } else if (PadVal & 0x100) {
            PlaySFX(0x33);
            Done = true;
            RetVal = 0;
        }
    }
    LeavePrintQuitMessage(Menu);
    return RetVal;
}

/* @0x80088AD4 PAUSE.CPP:511 */
BOOL CPauseMessages::AreYouSureMessage()
{
    BOOL RetVal = false;
    BOOL Done = false;
    int Menu = 1;

    InitPrintAreYouSure();
    while (!Done) {
        unsigned short PadVal;
        PrintAreYouSure(Menu);
        TSK_Sleep(1);
        PadVal = PAD_GetPad(PadNum, 1)->GetDown();
        if (PadVal & 3) {
            PlaySFX(0x32);
            Menu = !Menu;
        }
        if (PadVal & 0x40) {
            PlaySFX(0x33);
            Done = true;
            RetVal = Menu;
        }
        if (PadVal & 0x100) {
            PlaySFX(0x33);
            Done = true;
            RetVal = true;
        }
    }
    LeavePrintAreYouSure(Menu);
    return RetVal;
}

/* @0x800B06E4 PAUSE.CPP:560 -- retail links this one into .STARTUP_text (startup segment); kept at its
 * source position here (it is also what keeps the static PauseTask referenced). */
void PA_Open(void) __attribute__((section(".STARTUP_text")));
void PA_Open(void)
{
    CanPause = false;
    Paused = 0;
    TSK_AddTask(0x8000, (void (*)())PauseTask, 0x800, 0);
}

/* @0x80088BF4 PAUSE.CPP:573 */
BOOL PA_SetPauseOk(BOOL NewPause)
{
    BOOL Ret = CanPause;
    CanPause = NewPause;
    return Ret;
}

/* @0x80088C04 PAUSE.CPP:586 */
BOOL PA_GetPauseOk(void)
{
    return CanPause;
}

/* @0x80088C10 PAUSE.CPP:610 */
void CTempPauseMessage::MY_PausePrint(int s, int Txt, int Menu, struct RECT *PRect)
{
    int y;
    int otpos;

    y = s * 10 + 11;
    if (Txt == 0x343)
        y = s * 10 + 9;
    otpos = CBlocks::GetMaxOtPos() - 1;

    if (s == 0) {
        MediumFont.Print(0, y, GetStr(Txt), JustCentre, PRect, BLUER, BLUEG, BLUEB);
        return;
    }
    if (s - 2 == Menu) {
        int len;
        MediumFont.Print(0, y, GetStr(Txt), JustCentre, PRect, GOLDR, GOLDG, GOLDB);
        len = MediumFont.GetStrWidth(GetStr(Txt));
        DrawSpinner((256 - len) / 2 + 22, y + 96, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, true, otpos, true, false, 8);
        DrawSpinner(len + (256 - len) / 2 + 35, y + 96, 0xA0, 0x40, 0xF0, 0x20, 0x40, 0, true, otpos, true, false, 8);
    } else {
        MediumFont.Print(0, y, GetStr(Txt), JustCentre, PRect, WHITER, WHITEG, WHITEB);
    }
}

/* @0x80088E50 PAUSE.CPP:637 */
void CTempPauseMessage::InitPrintQuitMessage()
{
}

/* @0x80088E58 PAUSE.CPP:641 */
void CTempPauseMessage::PrintQuitMessage(int Menu)
{
    RECT PRect;
    int otpos;
    int oldDotpos;
    int oldTotpos;

    RedBack();
    otpos = CBlocks::GetMaxOtPos();
    oldDotpos = PBack.SetOTpos(otpos - 3);
    oldTotpos = MediumFont.SetOTpos(otpos - 2);
    PBack.SetRGB(BORDERR, BORDERG, BORDERB);
    PBack.SetBack(0x94);
    PBack.SetBorder(0x12);
    PBack.Back(0x5F, 0x60, 0x82, 0x30);
    PRect.x = 0x5F;
    PRect.y = 0x60;
    PRect.w = 0x82;
    PRect.h = 0x30;
    MY_PausePrint(0, 0x343, Menu, &PRect);
    MY_PausePrint(2, 0x343, Menu, &PRect);
    MY_PausePrint(3, 0x135, Menu, &PRect);
    PrintSelectBack(0x4E6);
    MediumFont.SetOTpos(oldTotpos);
    PBack.SetOTpos(oldDotpos);
}

/* @0x80088FD0 PAUSE.CPP:669 */
void CTempPauseMessage::LeavePrintQuitMessage(int Menu)
{
}

/* @0x80088FD8 PAUSE.CPP:673 */
void CTempPauseMessage::InitPrintAreYouSure()
{
}

/* @0x80088FE0 PAUSE.CPP:677 */
void CTempPauseMessage::PrintAreYouSure(int Menu)
{
    RECT PRect;
    int otpos;
    int oldDotpos;
    int oldTotpos;

    RedBack();
    otpos = CBlocks::GetMaxOtPos();
    oldDotpos = PBack.SetOTpos(otpos - 3);
    oldTotpos = MediumFont.SetOTpos(otpos - 2);
    PBack.SetRGB(BORDERR, BORDERG, BORDERB);
    PBack.SetBack(0x94);
    PBack.SetBorder(0x12);
    PBack.Back(0x50, 0x60, 0xA0, 0x30);
    PRect.x = 0x50;
    PRect.y = 0x60;
    PRect.w = 0xA0;
    PRect.h = 0x30;
    MY_PausePrint(0, 0x26, Menu, &PRect);
    MY_PausePrint(2, 0x4E7, Menu, &PRect);
    MY_PausePrint(3, 0x2C9, Menu, &PRect);
    PrintSelectBack(0x4E6);
    MediumFont.SetOTpos(oldTotpos);
    PBack.SetOTpos(oldDotpos);
}

/* @0x80089158 PAUSE.CPP:706 */
void CTempPauseMessage::LeavePrintAreYouSure(int Menu)
{
}

/* @0x80089160 PAUSE.CPP:710 */
void CTempPauseMessage::InitPrintPaused()
{
}

/* @0x80089168 PAUSE.CPP:715 */
void CTempPauseMessage::PrintPaused()
{
    RECT PRect;
    int otpos;
    int oldDotpos;
    int oldTotpos;

    if (IsGameLoading() == 0) {
        RedBack();
        otpos = CBlocks::GetMaxOtPos();
        oldDotpos = PBack.SetOTpos(otpos - 3);
        oldTotpos = MediumFont.SetOTpos(otpos - 2);
        PBack.SetRGB(BORDERR, BORDERG, BORDERB);
        PBack.SetBack(0x94);
        PBack.SetBorder(0x12);
        PBack.Back(0x80, 0x70, 0x40, 0xF);
        PRect.x = 0x80;
        PRect.y = 0x70;
        PRect.w = 0x40;
        PRect.h = 0xF;
        MediumFont.Print(0, 0xB, GetStr(0x302), JustCentre, &PRect, 0xFF, 0xFF, 0xFF);
        MediumFont.SetOTpos(oldTotpos);
        PBack.SetOTpos(oldDotpos);
    }
}

/* @0x800892B8 PAUSE.CPP:761 */
void CTempPauseMessage::LeavePrintPaused()
{
}

/* @0x800892C0 PAUSE.CPP:765 */
CTempPauseMessage::~CTempPauseMessage()
{
}
