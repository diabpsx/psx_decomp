#ifndef PSXSRC_PADS_H
#define PSXSRC_PADS_H
/* PADS.H -- Climax PSX controller object (C:\diabpsx\PSXSRC\PADS.H).  Layout from the retail SYM (sizeof 236);
 * the in-class methods are the ones the retail SYM attributes to PADS.H lines 85-127: every TU that calls
 * one emits its own out-of-line copy (-fno-inline). */
#include "diabpsx_types.h"

class CPad {
public:
    unsigned char get_both;             /* +0x00 */
    unsigned char active;               /* +0x01 */
    unsigned char PadType;              /* +0x02 */
    unsigned char PADTICK;              /* +0x03 */
    unsigned short PADTICKMASK;         /* +0x04 */
    unsigned short PadNum;              /* +0x06 */
    unsigned short Cur;                 /* +0x08 */
    unsigned short Up;                  /* +0x0A */
    unsigned short Down;                /* +0x0C */
    unsigned short Tick;                /* +0x0E */
    unsigned short Old;                 /* +0x10 */
    unsigned short both_Cur;            /* +0x12 */
    unsigned short both_Up;             /* +0x14 */
    unsigned short both_Down;           /* +0x16 */
    unsigned short both_Tick;           /* +0x18 */
    unsigned short both_Old;            /* +0x1A */
    BOOL TickDown[16];                  /* +0x1C */
    BOOL TickBoth[16];                  /* +0x5C */
    unsigned char TickCount[16];        /* +0x9C */
    unsigned short BothTickCount[16];   /* +0xAC */
    unsigned short GazTickCount[16];    /* +0xCC */

    CPad(int PhysStick)                                                     /* PADS.H:85 */
    {
        PadNum = PhysStick;
        get_both = 0;
        Flush();
    }
#line 87
    void SetBothFlag(unsigned char fl) { get_both = fl; }                   /* PADS.H:87 */
    void NewVal(unsigned short New);
    void BothNewVal(unsigned short New, unsigned short New2);
#line 91
    void SetPadTick(unsigned short tick) { PADTICK = tick; }                /* PADS.H:91 */
#line 92
    void SetPadTickMask(unsigned short mask) { PADTICKMASK = mask; }        /* PADS.H:92 */
#line 94
    void SetActive(unsigned char a) { active = a; }                         /* PADS.H:94 */
#line 96
    unsigned char CheckActive()                                             /* PADS.H:97 */
    {

        return active;
    }
#line 102
    void SetPadType(unsigned char val) { PadType = val; }                   /* PADS.H:102 */
#line 105
    unsigned short GetCur() const                                           /* PADS.H:106 */
    {
        if (get_both)
            return both_Cur;

        return Cur;
    }
#line 112
    unsigned short GetUp() const                                            /* PADS.H:113 */
    {
        if (get_both)
            return both_Up;

        return Up;
    }
#line 119
    unsigned short GetDown() const                                          /* PADS.H:120 */
    {
        if (get_both)
            return both_Down;

        return Down;
    }
#line 126
    unsigned short GetTick() const                                          /* PADS.H:127 */
    {
        if (get_both)
            return both_Tick;

        return Tick;
    }
    unsigned short Trans(unsigned short PadVal);
    void Flush();
};

extern CPad Pad0;   /* PADS.CPP @0x800B7D34 */
extern CPad Pad1;   /* PADS.CPP @0x800B7E20 */

#endif
