#include "common.h"

INCLUDE_ASM("asm/nonmatchings/startup", VID_OpenModule__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", InitScreens__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", MEM_SetupMem__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", SetupWorkRam__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", SYSI_Init__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", PA_Open__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", PAD_Open__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", GM_Open__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", OVR_Open__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", DEC_Open__Fv);

INCLUDE_ASM("asm/nonmatchings/startup", StrDate);

INCLUDE_ASM("asm/nonmatchings/startup", StrTime);
