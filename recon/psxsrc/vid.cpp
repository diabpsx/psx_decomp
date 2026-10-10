/* VID.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: the video module --
 * the two SCREEN_ENV draw/display environments (single or double buffered), the VSync callback
 * (VID_DispEnvSend: frame tick + a one-shot "do this next sync" routine) and the screen offsets. */
#include "diabpsx_types.h"

/* ---------------------------------------------------------------- PsyQ libgpu ---- */
struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};
struct DR_ENV {   /* sizeof 64 */
    unsigned long tag;
    unsigned long code[15];
};
struct DRAWENV {   /* sizeof 92 */
    RECT clip;                  /* +0x0 */
    short ofs[2];               /* +0x8 */
    RECT tw;                    /* +0xC */
    unsigned short tpage;       /* +0x14 */
    unsigned char dtd;          /* +0x16 */
    unsigned char dfe;          /* +0x17 */
    unsigned char isbg;         /* +0x18 */
    unsigned char r0, g0, b0;   /* +0x19 */
    DR_ENV dr_env;              /* +0x1C */
};
struct DISPENV {   /* sizeof 20 */
    RECT disp;
    RECT screen;
    unsigned char isinter, isrgb24, pad0, pad1;
};
struct SCREEN_ENV {   /* sizeof 112 */
    DRAWENV drawenv;            /* +0x0 */
    DISPENV dispenv;            /* +0x5C */
};

extern "C" {
int VSync(int mode);
void SetDispMask(int mask);
unsigned long ReloadGP(void);
void SetGP(unsigned long gp);
DRAWENV *SetDefDrawEnv(DRAWENV *env, int x, int y, int w, int h);
DISPENV *SetDefDispEnv(DISPENV *env, int x, int y, int w, int h);
void SetDrawEnv(DR_ENV *dr_env, DRAWENV *env);
int ResetGraph(int mode);
int SetGraphDebug(int level);
void InitGeom(void);
long SetVideoMode(long mode);
int VSyncCallback(void (*f)());
void DBG_Error(char *Text, char *File, int Line);
}
void PRIM_Flush(void);
void ClearKanjiCount(void);
unsigned char PRIM_GetCurrentScreen(void);
unsigned char GPUQ_InitModule(void);
unsigned char PRIM_Open(int Prims, int OtSize, int Depth, SCREEN_ENV *Scr, unsigned long MemType);

/* ---------------------------------------------------------------- TU data ---- */
static int VidWait;                 /* @0x8011C628 sbss */
static void (*VbFunc)();            /* @0x8011C62C sbss */
static unsigned long VidTick;       /* @0x8011C630 sbss */
static int VXOff;                   /* @0x8011C634 sbss */
static int VYOff;                   /* @0x8011C638 sbss */
static BOOL DBufferFlag = 0;        /* @0x8011AAC8 sdata */
static SCREEN_ENV screen[2];        /* @0x8011CAE0 bss */

extern "C" {
static void VID_DispEnvSend(void);
}
/* These two functions belong to the retail STARTUP text region. */
static void InitScreens(void) __attribute__((section(".STARTUP_text")));
void VID_OpenModule(void) __attribute__((section(".STARTUP_text")));
void VID_SetXYOff(int x, int y);
int VID_GetXOff(void);
int VID_GetYOff(void);
unsigned char VID_NextSyncRoutHasExecuted(void);

/* @0x800B0320 VID.CPP:93 (.STARTUP_text) */
void VID_OpenModule(void)
{
    SetDispMask(0);
    VSync(0);
    VSync(0);
    VID_SetXYOff(0, 0);
    SetVideoMode(0);
    InitScreens();
    if (!GPUQ_InitModule())
        DBG_Error(NULL, "psxsrc/VID.CPP", 0x7F);
    VbFunc = NULL;
    VSyncCallback(VID_DispEnvSend);
    if (!PRIM_Open(0x400, 0x200, 2, screen, 1))
        DBG_Error(NULL, "psxsrc/VID.CPP", 0x86);
}

/* @0x80084030 VID.CPP:149 */
void VID_AfterDisplay(void)
{
    PRIM_Flush();
    ClearKanjiCount();
}

/* @0x800B03E0 VID.CPP:184 (.STARTUP_text) */
static void InitScreens(void)
{
    ResetGraph(0);
    SetGraphDebug(0);
    InitGeom();
    SetDefDrawEnv(&screen[0].drawenv, 0, 0, 320, 240);
    SetDefDispEnv(&screen[0].dispenv, 320, 0, 320, 240);
    SetDefDrawEnv(&screen[1].drawenv, 320, 0, 320, 240);
    SetDefDispEnv(&screen[1].dispenv, 0, 0, 320, 240);
    screen[0].drawenv.isbg = 0;
    screen[1].drawenv.isbg = 0;
    screen[0].drawenv.dtd = 1;
    screen[1].drawenv.dtd = 1;
    SetDrawEnv(&screen[0].drawenv.dr_env, &screen[0].drawenv);
    SetDrawEnv(&screen[1].drawenv.dr_env, &screen[1].drawenv);
}

/* @0x80084058 VID.CPP:226 */
void VID_ScrOn(void)
{
    screen[0].drawenv.isbg = 1;
    screen[1].drawenv.isbg = 1;
    VSync(0);
    SetDispMask(1);
}

/* @0x80084094 VID.CPP:249 */
void VID_DoThisNextSync(void (*Func)())
{
    VidWait = 0;
    while (!VID_NextSyncRoutHasExecuted())
        VidWait++;
    VbFunc = Func;
}

/* @0x800840EC VID.CPP:259 */
unsigned char VID_NextSyncRoutHasExecuted(void)
{
    return VbFunc == NULL;
}

/* @0x800840F8 VID.CPP:264 */
unsigned long VID_GetTick(void)
{
    return VidTick;
}

/* @0x80084104 VID.CPP:270 -- SYM class STAT, C linkage */
extern "C" {
static void VID_DispEnvSend(void)
{
    unsigned long OldGp = ReloadGP();

    VidTick++;
    if (VbFunc) {
        VbFunc();
        VbFunc = NULL;
    }
    SetGP(OldGp);
}
}

/* @0x8008415C VID.CPP:287 */
void VID_SetXYOff(int x, int y)
{
    VXOff = x;
    VYOff = y;
}

/* @0x8008416C VID.CPP:293 */
int VID_GetXOff(void)
{
    return VXOff;
}

/* @0x80084178 VID.CPP:298 */
int VID_GetYOff(void)
{
    return VYOff;
}

/* @0x80084184 VID.CPP:304 */
BOOL VID_IsDbuffer(void)
{
    return DBufferFlag == 0;
}

/* @0x80084190 VID.CPP:313 */
void VID_SetDBuffer(BOOL DBuf)
{
    DBufferFlag = DBuf;
    if (DBuf) {
        int x = ((PRIM_GetCurrentScreen() + 1) & 1) * 320;
        SetDefDrawEnv(&screen[0].drawenv, x, 0, 320, 240);
        SetDefDispEnv(&screen[0].dispenv, x, 0, 320, 240);
        SetDefDrawEnv(&screen[1].drawenv, x, 0, 320, 240);
        SetDefDispEnv(&screen[1].dispenv, x, 0, 320, 240);
        screen[0].drawenv.ofs[0] += VID_GetXOff();
        screen[0].drawenv.ofs[1] += VID_GetYOff();
        screen[1].drawenv.ofs[0] += VID_GetXOff();
        screen[1].drawenv.ofs[1] += VID_GetYOff();
        screen[0].drawenv.isbg = 0;
        screen[1].drawenv.isbg = 0;
        screen[0].drawenv.dtd = 1;
        screen[1].drawenv.dtd = 1;
    } else {
        SetDefDrawEnv(&screen[0].drawenv, 0, 0, 320, 240);
        SetDefDispEnv(&screen[0].dispenv, 320, 0, 320, 240);
        SetDefDrawEnv(&screen[1].drawenv, 320, 0, 320, 240);
        SetDefDispEnv(&screen[1].dispenv, 0, 0, 320, 240);
        screen[0].drawenv.ofs[0] += VID_GetXOff();
        screen[0].drawenv.ofs[1] += VID_GetYOff();
        screen[1].drawenv.ofs[0] += VID_GetXOff();
        screen[1].drawenv.ofs[1] += VID_GetYOff();
        screen[0].drawenv.isbg = 1;
        screen[1].drawenv.isbg = 1;
        screen[0].drawenv.dtd = 1;
        screen[1].drawenv.dtd = 1;
    }
    SetDrawEnv(&screen[0].drawenv.dr_env, &screen[0].drawenv);
    SetDrawEnv(&screen[1].drawenv.dr_env, &screen[1].drawenv);
}
