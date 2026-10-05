/* startup segment (.STARTUP_text) -- Diablo PSX (Climax 1998) reconstruction.
 * The retail link groups each module's once-only init code into .STARTUP_text. This TU carries
 * GMAN.CPP / PADS.CPP initialization; MEM.CPP now owns its own once-only code and private state.
 * the other six (DEC_Open, InitScreens, OVR_Open, PA_Open, SYSI_Init, VID_OpenModule) byte-match in
 * decomp.cpp / vid.cpp / overlay.cpp / pause.cpp / sysinit.cpp.
 * Bodies from the retail oracle (asm/nonmatchings/startup) + SYM. */
#include "diabpsx_types.h"

struct TextDat;
extern "C" {
void InitTAP(unsigned char *bufA, long lenA, unsigned char *bufB, long lenB);
void StartTAP(void);
void PadInit(int mode);
}

extern TextDat *AllDats[372];                /* @0x800B9454 (GMAN.CPP) */
extern unsigned char RawPadData0[34];        /* @0x800B7F0C */
extern unsigned char RawPadData1[34];        /* @0x800B7F30 */

void GM_Open(void) __attribute__((section(".text.startup_gman")));
void PAD_Open(void) __attribute__((section(".text.startup_pads")));

/* @0x800B0760 GMAN.CPP:1398 */
void GM_Open(void)
{
    for (int f = 0; f < 372; f++)
        AllDats[f] = NULL;
}

/* PADS.CPP:103 */
void PAD_Open(void)
{
    InitTAP(RawPadData0, 34, RawPadData1, 34);
    StartTAP();
    PadInit(1);
}
