/* LOADING.CPP -- Diablo PSX (Climax 1998) reconstruction: cut-screen / loading progress bar (PSX-only).
 * Bodies from the retail oracle (asm/nonmatchings/loading) + SYM (scratch/tuinfo.py LOADING.CPP).
 * Class shapes (TextDat/CScreen/CFont/Dialog/CBlocks) as in psxsrc/fe.h, redeclared locally. */
#include "diabpsx_types.h"
#include "psxsrc/primpool.h"

enum TXT_JUST { JustRight = 2, JustCentre = 1, JustLeft = 0 };

struct TASK {   /* sizeof 92 */
    TASK *Next;
    TASK *Prev;
    unsigned long Id;
    unsigned long SleepTime;
    unsigned long Flags;
    void *Stack;
    unsigned long StackSize;
    void *Data;              /* +0x1C */
    int TskEnv[12];
    void (*Main)();
    long hndTask;
    unsigned short XtraLongs;
    unsigned short MaxStackSizeBytes;
};

struct DEF_ARGS {   /* sizeof 16 */
    unsigned long a0;
    unsigned long a1;
    unsigned long a2;
    unsigned long a3;
};

typedef struct POLY_G4 {   /* sizeof 36 */
    u_long tag;
    u_char r0, g0, b0, code; short x0, y0;
    u_char r1, g1, b1, pad1; short x1, y1;
    u_char r2, g2, b2, pad2; short x2, y2;
    u_char r3, g3, b3, pad3; short x3, y3;
} POLY_G4;

#define setPolyG4(p) setlen(p, 8), setcode(p, 0x38)
#define setRGB0(p, _r, _g, _b) ((p)->r0 = (_r), (p)->g0 = (_g), (p)->b0 = (_b))
#define setRGB1(p, _r, _g, _b) ((p)->r1 = (_r), (p)->g1 = (_g), (p)->b1 = (_b))
#define setRGB2(p, _r, _g, _b) ((p)->r2 = (_r), (p)->g2 = (_g), (p)->b2 = (_b))
#define setRGB3(p, _r, _g, _b) ((p)->r3 = (_r), (p)->g3 = (_g), (p)->b3 = (_b))
#define setXY4(p, _x0, _y0, _x1, _y1, _x2, _y2, _x3, _y3) \
    ((p)->x0 = (_x0), (p)->y0 = (_y0), (p)->x1 = (_x1), (p)->y1 = (_y1), \
     (p)->x2 = (_x2), (p)->y2 = (_y2), (p)->x3 = (_x3), (p)->y3 = (_y3))

/* PRIMPOOL.H PRIM_GetPrim, POLY_G4 copy (line 68) */
inline void PRIM_GetPrim(POLY_G4 **Prim)
{
    if ((POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_G4) * 10) >= AddrToAvoid)
        DBG_Error(NULL, "psxsrc/primpool.h", 68);
    *Prim = (POLY_G4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((POLY_G4 *)ThisPrimAddr + 1);
}

struct FRAME_HDR;
struct SPR_HDR;
struct CTextFileInfo;

struct TextDat {   /* sizeof 112 */
    unsigned char _pad[0x70];
    ~TextDat();
};

struct CScreen : TextDat {   /* sizeof 124 */
    int LoadedId;   /* +0x70 */
    int TpX;        /* +0x74 */
    int TpY;        /* +0x78 */

    CScreen();
    void Load(int Id, int tpx, int tpy);
    void Unload(void);
    void Display(int Id, int tpx, int tpy, int fadeval);
};

struct CFont {   /* sizeof 540 */
    unsigned char _pad[0x21C];

    int GetStrWidth(char *Str);
    int Print(int X, int Y, char *Str, TXT_JUST Justify, RECT *TextWindow, unsigned char R, unsigned char G, unsigned char B);
    int SetOTpos(int OT);
};

extern unsigned char DialogRed, DialogGreen, DialogBlue;
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;

class CBlocks {
public:
    static int GetOverlayOtBase() { return 0x1E8; }   /* BLOCK.H */
};

struct Dialog {   /* sizeof 16 */
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
    void SetRGB(unsigned char R, unsigned char G, unsigned char B) { DialogRed = R; DialogGreen = G; DialogBlue = B; }
    void SetBack(int Type) { BackGfx = Type; }
    void SetBorder(int Type) { BorderGfx = Type; }
    int SetOTpos(int OT);
    void Back(int DX, int DY, int DW, int DH);
};

extern CFont MediumFont;                  /* @0x800B82D8 */
extern unsigned long *ThisOt;             /* @0x8011AAB4 */
extern const unsigned char WHITER, WHITEG;
extern const unsigned char BORDERR, BORDERG, BORDERB;

extern "C" {
void TSK_Sleep(int Frames);
TASK *TSK_AddTask(unsigned long Id, void (*Main)(), int StackSize, int DataSize);
void TSK_Kill(TASK *T);
void TICK_Update(void);
}
BOOL PaletteFadeIn(int fr);
BOOL PaletteFadeOut(int fr);
BOOL GetFadeState(void);
BOOL PA_SetPauseOk(BOOL NewPause);
void VID_SetDBuffer(BOOL DBuf);
void stream_stop(void);
void music_stop(void);
char *GetStr(int StrId);
void PAD_Handler(void);
void VID_AfterDisplay(void);

#define ASSERT(e, line) if (!(e)) DBG_Error(NULL, "psxsrc/LOADING.CPP", line)   /* retail line literals */

CScreen CutScr;                           /* @0x800CC76C */
BOOL TitleFlag = 0;                       /* @0x8011B140 */
static const unsigned short Level2CutScreen[12] = { 9, 5, 1, 2, 3, 6, 7, 8, 4, 8, 0x12, 0x11 };   /* @0x80110CA8 */
static TASK *CutScreenTSK = NULL;         /* @0x8011B144 */
static BOOL GameLoading = 0;              /* @0x8011B148 */
static BOOL BootScreen = 0;               /* @0x8011B14C */
static int ThisLev = 0;                   /* @0x8011B150 */
static unsigned short progress;           /* @0x8011C6EC */

extern void DrawCutScreen(int lev);

/* @0x800A4524 LOADING.CPP:145 */
void MY_TSK_Sleep(int time)
{
    for (int i = 0; i < time; i++) {
        TICK_Update();
        PAD_Handler();
        VID_AfterDisplay();
    }
}

/* @0x800A457C LOADING.CPP:162 */
void UPDATEPROGRESS(int inc)
{
    if (BootScreen)
        return;
    if (inc == -1) {
        progress += 4;
        TSK_Sleep(1);
    } else {
        for (int i = 0; i < inc * 4; i++) {
            progress++;
            if (!BootScreen) {
                TSK_Sleep(1);
            } else {
                CutScr.Display(Level2CutScreen[11], 11, 0, 0);
                DrawCutScreen(11);
                MY_TSK_Sleep(1);
            }
        }
    }
}

/* @0x800A4648 LOADING.CPP:212 */
BOOL IsGameLoading(void)
{
    return GameLoading;
}

/* @0x800A4654 LOADING.CPP:224 */
void DrawCutScreen(int lev)
{
    unsigned char barr;
    unsigned char barg;
    unsigned short prog;
    Dialog LBack;
    int tx;
    POLY_G4 *G4;
    int BarOt;
    int oldDot;
    int oldTot;

    BarOt = CBlocks::GetOverlayOtBase() + 8;
    tx = (256 - MediumFont.GetStrWidth(GetStr(0x25A))) / 2 + 32;
    oldDot = LBack.SetOTpos(100);
    oldTot = MediumFont.SetOTpos(100);
    MediumFont.Print(tx, 188, GetStr(0x25A), JustLeft, NULL, WHITER, WHITEG, WHITEG);
    LBack.SetBack(0x94);
    LBack.SetBorder(0x12);
    LBack.SetRGB(BORDERR, BORDERG, BORDERB);
    LBack.Back(32, 200, 256, 8);
    prog = progress;
    if (prog >= 256)
        prog = 256;
    barg = prog >> 1;
    barr = 128 - barg;

    PRIM_GetPrim(&G4);
    setPolyG4(G4);
    setSemiTrans(G4, 1);
    setShadeTex(G4, 0);
    setRGB0(G4, 64, 0, 0);
    setRGB1(G4, barr >> 1, barg >> 1, 0);
    setRGB2(G4, 128, 0, 0);
    setRGB3(G4, barr, barg, 0);
    setXY4(G4, 32, 200, prog + 32, 200, 32, 204, prog + 32, 204);
    addPrim(ThisOt + BarOt, G4);

    PRIM_GetPrim(&G4);
    setPolyG4(G4);
    setSemiTrans(G4, 1);
    setShadeTex(G4, 0);
    setRGB0(G4, 128, 0, 0);
    setRGB1(G4, barr, barg, 0);
    setRGB2(G4, 64, 0, 0);
    setRGB3(G4, barr >> 1, barg >> 1, 0);
    setXY4(G4, 32, 204, prog + 32, 204, 32, 208, prog + 32, 208);
    addPrim(ThisOt + BarOt, G4);

    MediumFont.SetOTpos(oldTot);
    LBack.SetOTpos(oldDot);
}

/* @0x800A4A90 LOADING.CPP:286 */
void PutUpCutScreenTSK(TASK *T)
{
    DEF_ARGS *Args = (DEF_ARGS *)T->Data;
    int lev = Args->a0;
    int tpx = 12;

    if (lev >= 10)
        tpx = 11;
    TSK_Sleep(1);
    CutScr.Unload();
    CutScr.Load(Level2CutScreen[lev], tpx, 0);
    progress = 0;
    for (;;) {
        CutScr.Display(Level2CutScreen[lev], tpx, 0, 0);
        DrawCutScreen(lev);
        TSK_Sleep(1);
    }
}

/* @0x800A4B58 LOADING.CPP:315 */
void PutUpCutScreen(int lev)
{
    DEF_ARGS *A;

    if (CutScreenTSK)
        return;
    GameLoading = 1;
    ThisLev = lev;
    if (lev == 11) {
        VID_SetDBuffer(0);
        CutScr.Load(Level2CutScreen[lev], 11, 0);
        for (int f = 15; f >= 0; f--) {
            CutScr.Display(Level2CutScreen[lev], 11, 0, f);
            MY_TSK_Sleep(1);
        }
        BootScreen = 1;
        return;
    }
    stream_stop();
    music_stop();
    BootScreen = 0;
    VID_SetDBuffer(0);
    PA_SetPauseOk(0);
    CutScreenTSK = TSK_AddTask(0x4003, (void (*)())PutUpCutScreenTSK, 0x800, 0);
    ASSERT(CutScreenTSK, 347);
    A = (DEF_ARGS *)CutScreenTSK->Data;
    A->a0 = lev;
    if (PaletteFadeIn(8)) {
        while (GetFadeState())
            TSK_Sleep(1);
    }
}

/* @0x800A4CA8 LOADING.CPP:374 */
void TakeDownCutScreen(void)
{
    TitleFlag = 0;
    if (ThisLev == 10)
        TitleFlag = 1;
    if (CutScreenTSK) {
        if (PaletteFadeOut(8)) {
            while (GetFadeState())
                TSK_Sleep(1);
        }
        GameLoading = 0;
        TSK_Kill(CutScreenTSK);
        CutScreenTSK = NULL;
        if (ThisLev != 10)
            CutScr.Unload();
    }
}

/* @0x800A4D4C LOADING.CPP:407 */
void FinishBootProgress(void)
{
    int Lev = 11;

    if (BootScreen) {
        if (PaletteFadeOut(8)) {
            while (GetFadeState()) {
                CutScr.Display(Level2CutScreen[Lev], 11, 0, 0);
                TSK_Sleep(1);
            }
        }
        CutScr.Unload();
        GameLoading = 0;
    }
}

/* @0x800A4DD8 LOADING.CPP:438 */
void FinishProgress(void)
{
    if (!BootScreen) {
        while (progress < 256)
            UPDATEPROGRESS(-1);
    } else {
        FinishBootProgress();
    }
}

