#include "common.h"

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_Monitor__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/sndbank", SPU_OnceOnlyInit__Fv);

INCLUDE_ASM("asm/nonmatchings/sndbank", SPU_Init__Fv);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_FindChannel__Fv);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_ClearBank__Fv);

INCLUDE_ASM("asm/nonmatchings/sndbank", SndLoadCallBack__FPUciib);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_LoadBank__Fi);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_FindSFX__FUs);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_StopSnd__Fi);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_IsSfxPlaying__Fi);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_RemapSnd__Fi);

INCLUDE_ASM("asm/nonmatchings/sndbank", SND_PlaySnd__FUsiii);
