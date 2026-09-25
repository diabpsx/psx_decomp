#include "common.h"

void LoadPalette__FPCc(void) {
}

void LoadRndLvlPal__Fi(void) {
}

void ResetPal__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/palette", SetFadeLevel__Fi);

INCLUDE_ASM("asm/nonmatchings/palette", GetFadeState__Fv);

INCLUDE_ASM("asm/nonmatchings/palette", SetPolyXY__FP8POLY_GT4PUc);

void SmearScreen__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/palette", DrawFadedScreen__Fv);

INCLUDE_ASM("asm/nonmatchings/palette", BlackPalette__Fv);

INCLUDE_ASM("asm/nonmatchings/palette", PaletteFadeInTask__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/palette", PaletteFadeIn__Fi);

INCLUDE_ASM("asm/nonmatchings/palette", PaletteFadeOutTask__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/palette", PaletteFadeOut__Fi);

INCLUDE_ASM("asm/nonmatchings/palette", GetMaxOtPos__7CBlocks_8007f34c);
