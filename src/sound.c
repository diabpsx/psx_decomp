#include "common.h"

void snd_update__FUc(void) {
}

INCLUDE_ASM("asm/nonmatchings/sound", snd_stop_snd__FP4TSnd);

INCLUDE_ASM("asm/nonmatchings/sound", snd_play_snd__FP4TSFXll);

INCLUDE_ASM("asm/nonmatchings/sound", snd_play_msnd__FUsll);

INCLUDE_ASM("asm/nonmatchings/sound", snd_init__FUl);

INCLUDE_ASM("asm/nonmatchings/sound", music_stop__Fv);

INCLUDE_ASM("asm/nonmatchings/sound", music_fade__Fv);

INCLUDE_ASM("asm/nonmatchings/sound", music_start__Fi);

INCLUDE_ASM("asm/nonmatchings/sound", snd_playing__Fi);
