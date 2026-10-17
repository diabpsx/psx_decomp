/* PADS.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  PSX-only (no PC twin): the two
 * controller objects Pad0/Pad1 (class CPad, PADS.H), the per-frame pad reader (multitap raw buffers
 * RawPadData0/1 -> 32-bit joystick word), demo record/playback of the pad stream, the physical-bit ->
 * game-bit translation (CPad::Trans) and the auto-repeat "click" counters (MakeClickBits).
 * Reconstructed from the raw oracle (asm/nonmatchings/pads/*.s) + the SYM (DIABPSX.SYM); the TDR
 * skeleton (refs/skeleton/.../PADS.H) as shape hints.  PADS.H inlines used here are emitted out of line
 * in this object (-fno-inline), in reverse header order (SetPadType, CheckActive, SetActive,
 * SetBothFlag, ctor).  PAD_Open (PADS.CPP:103) is once-only code in retail's .STARTUP_text section. */
#include "psxsrc/gman.h"

#include "psxsrc/pads.h"

/* ---------------------------------------------------------------- externs */
extern BOOL IsGameLoading(void);   /* @0x800A4648 LOADING.CPP:212 */
extern BOOL GLUE_Finished(void);   /* @0x8009BB04 GLUE.CPP:331 */
extern void save_demo_pad_data(unsigned long demo_num);   /* @0x8009B8D0 TONY.CPP:289 */
extern BOOL PA_SetPauseOk(BOOL NewPause);   /* @0x80088BF4 PAUSE.CPP:573 */
extern "C" int printf(const char *fmt, ...);
extern int demo_record_load;   /* @0x8011AE40 */
extern int demo_level;   /* @0x8011AE88 */
extern BOOL user_start;   /* @0x8011B4E4 */
extern unsigned char deathflag;   /* @0x8011BA0C */

static void InitClickBits(unsigned short *CountArray);
static unsigned short MakeClickBits(int Switch, int Closed, int Speed, unsigned short *CountArray);

/* ---------------------------------------------------------------- data (retail definition order) */
CPad Pad0(0);                         /* @0x800B7D34 */
CPad Pad1(1);                         /* @0x800B7E20 */
unsigned char RawPadData0[34] = { 0 };   /* @0x800B7F0C */
unsigned char RawPadData1[34] = { 0 };   /* @0x800B7F30 */
unsigned char demo_buffer[900] = { 0 };  /* @0x800B7F54 */
int demo_pad_time = 0;                /* @0x8011ABB4 */
int demo_pad_count = 0;               /* @0x8011ABB8 */
unsigned long demo_finish = 0;        /* @0x8011ABBC */
int demo_start = 0;                   /* @0x8011ABC0 */
int cac_pad = 0;                      /* @0x8011ABC4 */

extern "C" {
void InitTAP(unsigned char *bufA, long lenA, unsigned char *bufB, long lenB);   /* libtap */
void StartTAP(void);
void PadInit(int mode);                                                         /* libetc */
}

/* ---------------------------------------------------------------- @0x800B071C PADS.CPP:103 (.STARTUP_text) */
void PAD_Open(void) __attribute__((section(".STARTUP_text")));
#line 102
void PAD_Open(void)
{

    InitTAP(RawPadData0, 34, RawPadData1, 34);
    StartTAP();



    PadInit(1);
}

/* ---------------------------------------------------------------- @0x800894E0 PADS.CPP:116 */
unsigned long ReadPadStream(void)
{
    unsigned char *p0 = RawPadData0;
    unsigned char *p1 = RawPadData1;
    unsigned long rval;

    Pad0.SetActive(*p0++ == 0);
    Pad1.SetActive(*p1++ == 0);
    Pad0.SetPadType(*p0++);
    Pad1.SetPadType(*p1++);

    if (Pad1.CheckActive()) {
        rval = *p1++;
        rval <<= 8;
        rval |= *p1;
        rval <<= 8;
    } else
        rval = 0xFFFF00;

    if (Pad0.CheckActive()) {
        rval |= *p0++;
        rval <<= 8;
        rval |= *p0;
    } else {
        rval <<= 8;
        rval |= 0xFFFF;
    }

    return ~rval;
}

/* ---------------------------------------------------------------- @0x800895F8 PADS.CPP:176 */
void PAD_Handler(void)
{
    unsigned long JVal;
    unsigned long v;
    unsigned char fin;

    fin = IsGameLoading() | GLUE_Finished();
    JVal = ReadPadStream();
    if (fin)
        cac_pad = 0;
    else
        cac_pad = JVal;

    if (demo_record_load == 1) {
        if (!fin && demo_pad_time) {
            demo_pad_time--;
            demo_buffer[demo_pad_count++] = ((JVal & 0xF0) >> 4) | ((JVal & 0xF000) >> 8);
            if (!demo_pad_time) {
                save_demo_pad_data(demo_level);
                printf("Finished Recording\a\n");
            }
        }
    } else if (!fin && demo_pad_time) {
        PA_SetPauseOk(0);
        demo_pad_time--;
        v = demo_buffer[demo_pad_count++];
        JVal = (JVal & 0xFFFF0F0F) | ((v & 0xF0) << 8) | ((v & 0xF) << 4);
        if (!demo_pad_time || cac_pad) {
            demo_finish = 1;
            if (cac_pad) {
                demo_finish = 2;
                if (cac_pad & 0x800)
                    user_start = 1;
            }
        }
    }

    Pad0.NewVal(JVal);
    Pad1.NewVal(JVal >> 16);
    Pad0.BothNewVal(JVal, JVal >> 16);
    Pad1.BothNewVal(JVal, JVal >> 16);
}

/* ---------------------------------------------------------------- @0x800897F4 PADS.CPP:251 */
CPad *PAD_GetPad(int PadNum, unsigned char both)
{
    if (deathflag)
        both = 1;
    if (!(both || (PadNum >= 0 && PadNum < 2)))
        DBG_Error(NULL, "psxsrc/PADS.CPP", 257);
    Pad0.SetBothFlag(both);
    Pad1.SetBothFlag(both);
    return PadNum ? &Pad1 : &Pad0;
}

/* ---------------------------------------------------------------- @0x800898A4 PADS.CPP:277 */
#line 276
void CPad::NewVal(unsigned short New)
{
    New = Trans(New);

    Old = Cur;
    Cur = New;
    Down = New & (New ^ Old);
    Up = Old & ~Cur;

    Tick = MakeClickBits(Cur, Down, PADTICK, GazTickCount);
}

/* ---------------------------------------------------------------- @0x80089918 PADS.CPP:290 */
void CPad::BothNewVal(unsigned short New, unsigned short New2)
{
    unsigned short c = Trans(New) | Trans(New2);

    both_Old = both_Cur;
    both_Cur = c;
    both_Down = c & (c ^ both_Old);
    both_Up = both_Old & ~both_Cur;
    both_Tick = MakeClickBits(both_Cur, both_Down, PADTICK, BothTickCount);
}

/* ---------------------------------------------------------------- @0x800899AC PADS.CPP:309 */
#line 308
unsigned short CPad::Trans(unsigned short PadVal)
{
    unsigned short RetVal;
    /* Climax TranslatePadVals idiom (cf. SBSPSS source/pad/pads.cpp) */
    RetVal  = PadVal&0x1000 ? 1 : 0;
    RetVal |= PadVal&0x4000 ? 2 : 0;
    RetVal |= PadVal&0x8000 ? 4 : 0;
    RetVal |= PadVal&0x2000 ? 8 : 0;
    RetVal |= PadVal&0x800 ? 0x10 : 0;
    RetVal |= PadVal&0x100 ? 0x20 : 0;


    RetVal |= PadVal&0x100 ? 0x20 : 0;


    RetVal |= PadVal&0x40 ? 0x100 : 0;
    RetVal |= PadVal&0x80 ? 0x80 : 0;
    RetVal |= PadVal&0x20 ? 0x40 : 0;
    RetVal |= PadVal&0x10 ? 0x200 : 0;







    RetVal |= PadVal&0x4 ? 0x400 : 0;
    RetVal |= PadVal&0x1 ? 0x800 : 0;

    RetVal |= PadVal&0x8 ? 0x1000 : 0;
    RetVal |= PadVal&0x2 ? 0x2000 : 0;

    return RetVal;
}

/* ---------------------------------------------------------------- @0x80089AD0 PADS.CPP:344 */
void CPad::Flush()
{
    Cur = 0;
    both_Cur = 0;
    Up = 0;
    both_Up = 0;
    Down = 0;
    both_Down = 0;
    Old = 0;
    both_Old = 0;
    InitClickBits(GazTickCount);
    InitClickBits(BothTickCount);
}

/* ---------------------------------------------------------------- @0x80089B24 PADS.CPP:357 */
#line 356
static void InitClickBits(unsigned short *CountArray)
{
    int f;

    for (f = 15; f >= 0; f--)
        CountArray[f] = 0;
}

/* ---------------------------------------------------------------- @0x80089B44 PADS.CPP:365 */
static unsigned short MakeClickBits(int Switch, int Closed, int Speed, unsigned short *CountArray)
{
    unsigned short Click = 0;
    unsigned short BitMask = 1;

    for (int f = 0; f < 16; f++) {
        int ResetSpeed;

        if (Closed & BitMask) {
            CountArray[f] = 1;
            ResetSpeed = Speed * 3;
        } else
            ResetSpeed = Speed;
        if (!(Switch & BitMask))
            CountArray[f] = 0;
        if (CountArray[f]) {
            if (--CountArray[f] == 0) {
                CountArray[f] = ResetSpeed;
                Click |= BitMask;
            }
        }
        BitMask <<= 1;
    }
    return Click;
}
