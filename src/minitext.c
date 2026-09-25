#include "common.h"

void FreeQuestText__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/minitext", InitQuestText__Fv);

INCLUDE_ASM("asm/nonmatchings/minitext", CalcTextSpeed__FPCc);

INCLUDE_ASM("asm/nonmatchings/minitext", FadeMusicTSK__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/minitext", InitQTextMsg__Fi);

INCLUDE_ASM("asm/nonmatchings/minitext", DrawQTextBack__Fv);

INCLUDE_ASM("asm/nonmatchings/minitext", DrawQTextTSK__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/minitext", KANJI_strlen__FPc);

INCLUDE_ASM("asm/nonmatchings/minitext", DrawQText__Fv);

INCLUDE_ASM("asm/nonmatchings/minitext", _GLOBAL__D_QBack);

INCLUDE_ASM("asm/nonmatchings/minitext", _GLOBAL__I_QBack);

INCLUDE_ASM("asm/nonmatchings/minitext", SetRGB__6DialogUcUcUc_8004e98c);

INCLUDE_ASM("asm/nonmatchings/minitext", SetBorder__6Dialogi_8004e9ac);

INCLUDE_ASM("asm/nonmatchings/minitext", ___6Dialog_8004e9b4);

INCLUDE_ASM("asm/nonmatchings/minitext", __6Dialog_8004e9dc);

INCLUDE_ASM("asm/nonmatchings/minitext", GetOverlayOtBase__7CBlocks_8004ea5c);

INCLUDE_ASM("asm/nonmatchings/minitext", GetDown__C4CPad_8004ea64);
