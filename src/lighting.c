#include "common.h"

INCLUDE_ASM("asm/nonmatchings/lighting", veclen2__Fii);

INCLUDE_ASM("asm/nonmatchings/lighting", set_light_bands__Fv);

INCLUDE_ASM("asm/nonmatchings/lighting", SetLightFX__FiisssUcUcUc);

INCLUDE_ASM("asm/nonmatchings/lighting", SetWeirdFX__Fv);

INCLUDE_ASM("asm/nonmatchings/lighting", DoLighting__Fiiii);

INCLUDE_ASM("asm/nonmatchings/lighting", DoUnLight__Fv);

INCLUDE_ASM("asm/nonmatchings/lighting", DoUnVision__Fiiii);

INCLUDE_ASM("asm/nonmatchings/lighting", DoVision__FiiiUcUc);

void FreeLightTable__Fv(void) {
}

void InitLightTable__Fv(void) {
}

void MakeLightTable__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/lighting", InitLightMax__Fv);

INCLUDE_ASM("asm/nonmatchings/lighting", InitLighting__Fv);

INCLUDE_ASM("asm/nonmatchings/lighting", AddLight__Fiii);

INCLUDE_ASM("asm/nonmatchings/lighting", AddUnLight__Fi);

INCLUDE_ASM("asm/nonmatchings/lighting", ChangeLightRadius__Fii);

INCLUDE_ASM("asm/nonmatchings/lighting", ChangeLightXY__Fiii);

void light_fix__Fi(void) {
}

INCLUDE_ASM("asm/nonmatchings/lighting", ChangeLightOff__Fiii);

INCLUDE_ASM("asm/nonmatchings/lighting", ChangeLight__Fiiii);

INCLUDE_ASM("asm/nonmatchings/lighting", ChangeLightColour__Fii);

INCLUDE_ASM("asm/nonmatchings/lighting", ProcessLightList__Fv);

void SavePreLighting__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/lighting", InitVision__Fv);

INCLUDE_ASM("asm/nonmatchings/lighting", AddVision__FiiiUc);

INCLUDE_ASM("asm/nonmatchings/lighting", ChangeVisionRadius__Fii);

INCLUDE_ASM("asm/nonmatchings/lighting", ChangeVisionXY__Fiii);

INCLUDE_ASM("asm/nonmatchings/lighting", ProcessVisionList__Fv);
