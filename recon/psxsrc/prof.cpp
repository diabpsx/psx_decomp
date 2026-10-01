/* PROF.CPP -- Diablo PSX (Climax 1998) reconstruction: CPU / GPU frame-time profiler bars.
 * Bodies from the retail oracle (asm/nonmatchings/prof) + SYM (scratch/tuinfo.py PROF.CPP).
 * The five timer words are named INT statics in retail SYM (.sbss @0x8011C684..). */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"

typedef struct POLY_F3 { u_long tag; u_char r0, g0, b0, code; short x0, y0, x1, y1, x2, y2; } POLY_F3;                   /* 20 */
typedef struct POLY_F4 { u_long tag; u_char r0, g0, b0, code; short x0, y0, x1, y1, x2, y2, x3, y3; } POLY_F4;   /* 24 */
#define setPolyF3(p) setlen(p, 4), setcode(p, 0x20)
#define setPolyF4(p) setlen(p, 5), setcode(p, 0x28)
#define setRGB0(p, _r0, _g0, _b0) (p)->r0 = (_r0), (p)->g0 = (_g0), (p)->b0 = (_b0)

extern "C" {
unsigned long GTIMSYS_InitTimer(void);   /* GTIMSYS.C */
unsigned long GTIMSYS_GetTimer(void);
void GTIMSYS_ResetTimer(void);
void AddPrim(void *ot, void *p);
}
POLY_F4 *PRIM_GetNextPolyF4(void);   /* PRIMPOOL.CPP */
POLY_F3 *PRIM_GetNextPolyF3(void);
extern void PROF_Restart();

BOOL ProfOn = 0;                     /* @0x8011AD60 (.sdata) */
static int TimePerFrame;    /* @0x8011C684 */
static int CpuStart;        /* @0x8011C688 */
static int CpuTime;         /* @0x8011C68C */
static int DrawTime;        /* @0x8011C690 */
static int DrawStart;       /* @0x8011C694 */

/* @0x80096838 PROF.CPP:87 */
void PROF_Open(void)
{
    TimePerFrame = GTIMSYS_InitTimer();
    PROF_Restart();
    CpuTime = 0;
    CpuStart = 0;
    DrawTime = 0;
    DrawStart = 0;
    ProfOn = 0;
}

/* @0x80096878 PROF.CPP:99 */
BOOL PROF_State(void)
{
    return ProfOn;
}

/* @0x80096884 PROF.CPP:104 */
void PROF_On(void)
{
    ProfOn = 1;
}

/* @0x80096894 PROF.CPP:109 */
void PROF_Off(void)
{
    ProfOn = 0;
}

/* @0x800968A0 PROF.CPP:114 */
void PROF_CpuEnd(void)
{
    CpuTime = GTIMSYS_GetTimer() - CpuStart;
}

/* @0x800968D0 PROF.CPP:119 */
void PROF_CpuStart(void)
{
    CpuStart = GTIMSYS_GetTimer();
}

/* @0x800968F4 PROF.CPP:124 */
void PROF_DrawStart(void)
{
    DrawStart = GTIMSYS_GetTimer();
}

/* @0x80096918 PROF.CPP:129 */
void PROF_DrawEnd(void)
{
    DrawTime = GTIMSYS_GetTimer() - DrawStart;
}

/* @0x80096948 PROF.CPP:134 */
void PROF_Draw(unsigned long *Ot)
{
    if (ProfOn)
    {
        POLY_F4 *F4;
        int Scale = 70;
        int CpuW = CpuTime * Scale / TimePerFrame;
        int DrawW = DrawTime * Scale / TimePerFrame;

        F4 = PRIM_GetNextPolyF4();
        setPolyF4(F4);
        setXYWH(F4, 20, 30, CpuW, 2);
        setRGB0(F4, 255, 0, 0);
        setSemiTrans(F4, 1);
        AddPrim(Ot, F4);

        F4 = PRIM_GetNextPolyF4();
        setPolyF4(F4);
        setXYWH(F4, 20, 34, DrawW, 2);
        setRGB0(F4, 0, 255, 0);
        setSemiTrans(F4, 1);
        AddPrim(Ot, F4);

        int XCent = 20;
        for (int f = 0; f < 5; f++)
        {
            POLY_F3 *F3 = PRIM_GetNextPolyF3();
            setPolyF3(F3);
            setRGB0(F3, 0, 0, 255);
            F3->x0 = XCent - 2; F3->y0 = 28;
            F3->x1 = XCent + 2; F3->y1 = 28;
            F3->x2 = XCent;     F3->y2 = 30;
            XCent += Scale;
            setSemiTrans(F3, 1);
            AddPrim(Ot, F3);
        }
    }
}

/* @0x80096B3C PROF.CPP:179 */
void PROF_Restart(void)
{
    GTIMSYS_ResetTimer();
}
