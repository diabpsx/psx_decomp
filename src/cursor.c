#include "common.h"

void InitCursor__Fv(void) {
}

void FreeCursor__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/cursor", SetICursor__Fi);

INCLUDE_ASM("asm/nonmatchings/cursor", SetCursor__Fi);

INCLUDE_ASM("asm/nonmatchings/cursor", NewCursor__Fi);

INCLUDE_ASM("asm/nonmatchings/cursor", InitLevelCursor__Fv);

INCLUDE_ASM("asm/nonmatchings/cursor", CheckTown__Fv);

INCLUDE_ASM("asm/nonmatchings/cursor", CheckRportal__Fv);

void CheckCursMove__Fv(void) {
}
