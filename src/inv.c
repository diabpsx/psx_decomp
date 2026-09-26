#include "common.h"

void FreeInvGFX__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawSlot__Fiii);

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawSlotBack__FiiiiUc);

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawItem__FiiiUci);

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawSlots__Fv);
