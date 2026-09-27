/* PRIMPOOL.CPP -- Diablo PSX (Climax 1998) reconstruction: multi-buffered primitive / OT pool.
 * Bodies from the retail oracle (asm/nonmatchings/primpool) + SYM (scratch/tuinfo.py PRIMPOOL.CPP).
 * File statics per SYM class STAT; ThisOt / ThisPrimAddr / AddrToAvoid are this module's EXT .sdata. */
#include "diabpsx_types.h"
#include "psxsrc/primpool.h"
#include "glibdev/gal.h"

typedef struct POLY_F3 { u_long tag; u_char r0, g0, b0, code; short x0, y0, x1, y1, x2, y2; } POLY_F3;   /* 20 */
typedef struct POLY_F4 { u_long tag; u_char r0, g0, b0, code; short x0, y0, x1, y1, x2, y2, x3, y3; } POLY_F4;   /* 24 */
typedef struct POLY_G4 {                                                                  /* 36 */
    u_long tag;
    u_char r0, g0, b0, code; short x0, y0;
    u_char r1, g1, b1, pad1; short x1, y1;
    u_char r2, g2, b2, pad2; short x2, y2;
    u_char r3, g3, b3, pad3; short x3, y3;
} POLY_G4;
typedef struct DR_MODE { u_long tag; u_long code[2]; } DR_MODE;   /* 12 */
typedef struct DR_ENV { u_long tag; u_long code[15]; } DR_ENV;   /* 64 */
typedef struct DRAWENV {                                          /* 92 */
    RECT clip; short ofs[2]; RECT tw; u_short tpage;
    u_char dtd, dfe, isbg, r0, g0, b0;
    DR_ENV dr_env;
} DRAWENV;
typedef struct DISPENV { RECT disp; RECT screen; u_char isinter, isrgb24, pad0, pad1; } DISPENV;   /* 20 */

struct SCREEN_ENV {   /* sizeof 112 */
    DRAWENV drawenv;   /* +0x00 */
    DISPENV dispenv;   /* +0x5C */
};

struct PRIM_BUFFER {   /* sizeof 28 */
    POLY_FT4 *Prims;       /* +0x00 */
    POLY_FT4 *EndAddr;     /* +0x04 */
    unsigned long *OtList; /* +0x08 */
    unsigned char Drawing; /* +0x0C */
    int OtSize;            /* +0x10 */
    long hndOtList;        /* +0x14 */
    long hndPrims;         /* +0x18 */
};

extern "C" {
void ClearOTag(unsigned long *ot, int n);
void DrawOTag(unsigned long *p);
void SetDrawArea(DR_MODE *p, RECT *r);
void SetDrawEnv(DR_ENV *dr_env, DRAWENV *env);
DISPENV *PutDispEnv(DISPENV *env);
int DrawSyncCallback(void (*func)());
void AddPrim(void *ot, void *p);
}

void PROF_Open(void);          /* PROF.CPP */
void PROF_CpuEnd(void);
void PROF_DrawEnd(void);
void PROF_Draw(unsigned long *Ot);
void PROF_Restart(void);
void PROF_DrawStart(void);
void PROF_CpuStart(void);
int VID_GetXOff(void);          /* VID.CPP */
int VID_GetYOff(void);
void VID_DoThisNextSync(void (*Func)());
unsigned char VID_NextSyncRoutHasExecuted(void);
BOOL VID_IsDbuffer(void);
void GPUQ_FlushQ(void);         /* GPUQ.CPP */
extern BOOL CDWAIT;             /* @0x8011ADEC */

unsigned long *ThisOt = 0;          /* @0x8011AAB4 */
POLY_FT4 *ThisPrimAddr = 0;         /* @0x8011AAB8 */
POLY_FT4 *AddrToAvoid = 0;          /* @0x8011AABC */
static RECT ScrRect = { 0, 0, 320, 240 };   /* @0x8011AAC0 */

static long hndPrimBuffers;         /* @0x8011C608 */
static PRIM_BUFFER *PrimBuffers;    /* @0x8011C60C */
static unsigned char BufferDepth;   /* @0x8011C610 */
static unsigned char WorkRamId;     /* @0x8011C611 */
static unsigned char ScrNum;        /* @0x8011C612 */
static SCREEN_ENV *Screens;         /* @0x8011C614 */
static PRIM_BUFFER *PbToClear;      /* @0x8011C618 */
static unsigned char BufferNum;     /* @0x8011C61C */
static unsigned char LastBuffer;    /* @0x8011C61D */
static DISPENV *DispEnvToPut;       /* @0x8011C620 */
static int ThisOtSize;              /* @0x8011C624 */

static unsigned char InitPrimBuffer(PRIM_BUFFER *, int, int);
static BOOL ClipRect(const RECT &, RECT &);
static BOOL IsColiding(const RECT &, const RECT &);
static void SendDispEnv(void);
static unsigned char ClearedYet(void);
extern "C" {
static void ClearPbOnDrawSync(PRIM_BUFFER *);
static void PrimDrawSycnCallBack(void);
}
extern void PRIM_Flush(void);
extern DR_MODE *PRIM_GetNextDrArea(void);

/* @0x800837F4 PRIMPOOL.CPP:143 */
unsigned char PRIM_Open(int Prims, int OtSize, int Depth, SCREEN_ENV *Scr, unsigned long MemType)
{
    PROF_Open();
    Screens = Scr;
    BufferDepth = Depth;
    WorkRamId = MemType;
    hndPrimBuffers = GAL_Alloc(sizeof(PRIM_BUFFER) * Depth, MemType, "PRIMPOOL");
    ThisOtSize = OtSize;
    if (hndPrimBuffers != -1) {
        PrimBuffers = (PRIM_BUFFER *)GAL_Lock(hndPrimBuffers);
        if (PrimBuffers) {
            int f;
            for (f = 0; f < Depth; f++) {
                if (!InitPrimBuffer(&PrimBuffers[f], Prims, OtSize))
                    return 0;
            }
            PbToClear = NULL;
            DrawSyncCallback(PrimDrawSycnCallBack);
            BufferNum = 0;
            LastBuffer = Depth - 1;
            ScrNum = 0;
            PRIM_Flush();
            return 1;
        }
    }
    return 0;
}

/* @0x80083910 PRIMPOOL.CPP:187 */
static unsigned char InitPrimBuffer(PRIM_BUFFER *Pr, int Prims, int OtSize)
{
    if ((Pr->hndPrims = GAL_Alloc(sizeof(POLY_FT4) * Prims, WorkRamId, "PRIMPOOL")) == -1)
        return 0;
    if (!(Pr->Prims = (POLY_FT4 *)GAL_Lock(Pr->hndPrims)))
        return 0;
    if ((Pr->hndOtList = GAL_Alloc(sizeof(unsigned long) * OtSize, WorkRamId, "PRIMPOOL")) == -1)
        return 0;
    if (!(Pr->OtList = (unsigned long *)GAL_Lock(Pr->hndOtList)))
        return 0;
    Pr->EndAddr = (POLY_FT4 *)((unsigned char *)Pr->Prims + sizeof(POLY_FT4) * Prims);
    Pr->OtSize = OtSize;
    Pr->Drawing = 0;
    ClearOTag(Pr->OtList, Pr->OtSize);
    return 1;
}

/* @0x800839EC PRIMPOOL.CPP:216 */
void PRIM_Clip(RECT *R, int Depth)
{
    DR_MODE *DrArea;
    RECT RealRect;

    RealRect = *R;
    RealRect.x += VID_GetXOff();
    RealRect.y += VID_GetYOff();
    ClipRect(ScrRect, RealRect);
    RealRect.x += Screens[ScrNum].drawenv.clip.x;
    RealRect.y += Screens[ScrNum].drawenv.clip.y;
    DrArea = PRIM_GetNextDrArea();
    SetDrawArea(DrArea, &RealRect);
    addPrim(ThisOt + Depth, DrArea);
}

/* @0x80083B14 PRIMPOOL.CPP:248 */
unsigned char PRIM_GetCurrentScreen(void)
{
    return ScrNum;
}

/* @0x80083B20 PRIMPOOL.CPP:257 */
void PRIM_FullScreen(int Depth)
{
    RECT R;

    R.x = 0;
    R.y = 0;
    R.w = 320;
    R.h = 240;
    PRIM_Clip(&R, Depth);
}

/* @0x80083B5C PRIMPOOL.CPP:279 */
void PRIM_Flush(void)
{
    PRIM_BUFFER *Pb;

    PROF_CpuEnd();
    while (PrimBuffers[LastBuffer].Drawing)
        ;
    PROF_DrawEnd();
    PROF_Draw(&ThisOt[ThisOtSize - 1]);
    DispEnvToPut = &Screens[ScrNum].dispenv;
    VID_DoThisNextSync(SendDispEnv);
    GPUQ_FlushQ();
    while (!VID_NextSyncRoutHasExecuted())
        ;
    Pb = &PrimBuffers[BufferNum];
    Pb->Drawing = 1;
    ClearPbOnDrawSync(Pb);
    LastBuffer = BufferNum;
    if (!CDWAIT) {
        int XOff = VID_IsDbuffer() == 1 ? 320 : 0;
        Screens[0].drawenv.ofs[0] = VID_GetXOff();
        Screens[0].drawenv.ofs[1] = VID_GetYOff();
        Screens[1].drawenv.ofs[0] = VID_GetXOff() + XOff;
        Screens[1].drawenv.ofs[1] = VID_GetYOff();
        SetDrawEnv(&Screens[0].drawenv.dr_env, &Screens[0].drawenv);
        SetDrawEnv(&Screens[1].drawenv.dr_env, &Screens[1].drawenv);
    }
    AddPrim(ThisOt, &Screens[ScrNum].drawenv.dr_env);
    DrawOTag(Pb->OtList);
    PROF_Restart();
    PROF_DrawStart();
    BufferNum = (BufferNum + 1) % BufferDepth;
    Pb = &PrimBuffers[BufferNum];
    while (Pb->Drawing)
        ;
    ClearOTag(Pb->OtList, Pb->OtSize);
    ThisOt = Pb->OtList;
    ThisPrimAddr = Pb->Prims;
    AddrToAvoid = Pb->EndAddr;
    ScrNum ^= 1;
    PROF_CpuStart();
}

/* @0x80083D8C PRIMPOOL.CPP:373 */
unsigned long *PRIM_GetCurrentOtList(void)
{
    return ThisOt;
}

/* @0x80083D98 PRIMPOOL.CPP:382 */
static void ClearPbOnDrawSync(PRIM_BUFFER *Pb)
{
    while (!ClearedYet())
        ;
    PbToClear = Pb;
}

/* @0x80083DD4 PRIMPOOL.CPP:388 */
static unsigned char ClearedYet(void)
{
    return PbToClear == NULL;
}

/* @0x80083DE0 PRIMPOOL.CPP:397 */
static void PrimDrawSycnCallBack(void)
{
    if (PbToClear) {
        PbToClear->Drawing = 0;
        PbToClear = NULL;
    }
}

/* @0x80083E00 PRIMPOOL.CPP:411 */
static void SendDispEnv(void)
{
    PutDispEnv(DispEnvToPut);
}

/* @0x80083E24 PRIMPOOL.CPP:461 */
POLY_F4 *PRIM_GetNextPolyF4(void)
{
    POLY_F4 *RetPage = (POLY_F4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_F4));
    return RetPage;
}

/* @0x80083E3C PRIMPOOL.CPP:469 */
POLY_FT4 *PRIM_GetNextPolyFt4(void)
{
    POLY_FT4 *RetPage = (POLY_FT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_FT4));
    return RetPage;
}

/* @0x80083E54 PRIMPOOL.CPP:477 -- retail advances 64 bytes (sizeof(DR_ENV)), not sizeof(POLY_GT4)=52 */
POLY_GT4 *PRIM_GetNextPolyGt4(void)
{
    POLY_GT4 *RetPage = (POLY_GT4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(DR_ENV));
    return RetPage;
}

/* @0x80083E6C PRIMPOOL.CPP:486 */
POLY_G4 *PRIM_GetNextPolyG4(void)
{
    POLY_G4 *RetPage = (POLY_G4 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_G4));
    return RetPage;
}

/* @0x80083E84 PRIMPOOL.CPP:494 */
POLY_F3 *PRIM_GetNextPolyF3(void)
{
    POLY_F3 *RetPage = (POLY_F3 *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(POLY_F3));
    return RetPage;
}

/* @0x80083E9C PRIMPOOL.CPP:511 */
DR_MODE *PRIM_GetNextDrArea(void)
{
    DR_MODE *RetPage = (DR_MODE *)ThisPrimAddr;
    ThisPrimAddr = (POLY_FT4 *)((unsigned char *)ThisPrimAddr + sizeof(DR_MODE));
    return RetPage;
}

/* @0x80083EB4 PRIMPOOL.CPP:519 */
static BOOL ClipRect(const RECT &ClipRect, RECT &RectToClip)
{
    if (IsColiding(ClipRect, RectToClip)) {
        if (RectToClip.x < ClipRect.x) {
            RectToClip.w -= ClipRect.x - RectToClip.x;
            RectToClip.x = ClipRect.x;
        }
        if (RectToClip.y < ClipRect.y) {
            RectToClip.h -= ClipRect.y - RectToClip.y;
            RectToClip.y = ClipRect.y;
        }
        if (RectToClip.x + RectToClip.w > ClipRect.x + ClipRect.w)
            RectToClip.w -= (RectToClip.x + RectToClip.w) - (ClipRect.x + ClipRect.w);
        if (RectToClip.y + RectToClip.h > ClipRect.y + ClipRect.h)
            RectToClip.h -= (RectToClip.y + RectToClip.h) - (ClipRect.y + ClipRect.h);
        return 1;
    }
    RectToClip.w = 0;
    RectToClip.h = 0;
    RectToClip.x = 0;
    RectToClip.y = 0;
    return 0;
}

/* @0x80083FC8 PRIMPOOL.CPP:554 */
static BOOL IsColiding(const RECT &ClipRect, const RECT &NewRect)
{
    if (!(ClipRect.x < NewRect.x + NewRect.w && NewRect.x < ClipRect.x + ClipRect.w && ClipRect.y < NewRect.y + NewRect.h))
        return 0;
    return NewRect.y < ClipRect.y + ClipRect.h;
}
