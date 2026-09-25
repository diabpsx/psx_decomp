#include "common.h"

INCLUDE_ASM("asm/nonmatchings/effects", effect_is_playing__Fi);

INCLUDE_ASM("asm/nonmatchings/effects", stream_stop__Fv);

INCLUDE_ASM("asm/nonmatchings/effects", stream_pause__Fv);

INCLUDE_ASM("asm/nonmatchings/effects", stream_resume__Fv);

INCLUDE_ASM("asm/nonmatchings/effects", stream_play__FP4TSFXll);

void stream_update__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/effects", sfx_stop__Fv);

INCLUDE_ASM("asm/nonmatchings/effects", InitMonsterSND__Fi);

void FreeMonsterSnd__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/effects", calc_snd_position__FiiPlT2);

INCLUDE_ASM("asm/nonmatchings/effects", PlaySFX_priv__FP4TSFXUcii);

INCLUDE_ASM("asm/nonmatchings/effects", PlayEffect__Fii);

INCLUDE_ASM("asm/nonmatchings/effects", RndSFX__Fi);

INCLUDE_ASM("asm/nonmatchings/effects", PlaySFX__Fi);

INCLUDE_ASM("asm/nonmatchings/effects", PlaySfxLoc__Fiii);

INCLUDE_ASM("asm/nonmatchings/effects", sound_stop__Fv);

INCLUDE_ASM("asm/nonmatchings/effects", sound_update__Fv);

INCLUDE_ASM("asm/nonmatchings/effects", priv_sound_init__FUc);

INCLUDE_ASM("asm/nonmatchings/effects", sound_init__Fv);

INCLUDE_ASM("asm/nonmatchings/effects", stream_fade__Fv);
