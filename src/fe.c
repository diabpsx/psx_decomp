#include "common.h"

INCLUDE_ASM("asm/nonmatchings/fe", FeInitBuffer__Fv);

INCLUDE_ASM("asm/nonmatchings/fe", FeAddEntry__Fii8TXT_JUSTUsP7FeTableP5CFont);

INCLUDE_ASM("asm/nonmatchings/fe", FeAddTable__FP11FeMenuTablei);

INCLUDE_ASM("asm/nonmatchings/fe", FeAddNameTable__FPUci);

INCLUDE_ASM("asm/nonmatchings/fe", FeDrawBuffer__Fv);

INCLUDE_ASM("asm/nonmatchings/fe", FeNewMenu__FP7FeTable);

INCLUDE_ASM("asm/nonmatchings/fe", FePrevMenu__Fv);

INCLUDE_ASM("asm/nonmatchings/fe", FeSelUp__Fi);

INCLUDE_ASM("asm/nonmatchings/fe", FeSelDown__Fi);

INCLUDE_ASM("asm/nonmatchings/fe", FeGetCursor__Fv);

INCLUDE_ASM("asm/nonmatchings/fe", FeSelect__Fv);

INCLUDE_ASM("asm/nonmatchings/fe", FeMainKeyCtrl__FP7CScreen);

void InitDummyMenu__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/fe", InitFrontEnd__FP9FE_CREATE);

INCLUDE_ASM("asm/nonmatchings/fe", FeInitMainMenu__Fv);

INCLUDE_ASM("asm/nonmatchings/fe", FeInitNewGameMenu__Fv);
