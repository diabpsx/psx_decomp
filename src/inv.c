#include "common.h"

void FreeInvGFX__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawSlot__Fiii);

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawSlotBack__FiiiiUc);

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawItem__FiiiUci);

INCLUDE_ASM("asm/nonmatchings/inv", InvDrawSlots__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", PrintStat__FiiPcUc);

INCLUDE_ASM("asm/nonmatchings/inv", DrawInvStats__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", DrawInvBack__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", DrawInvCursor__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", DrawInvMsg__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", DrawInvHelpTxt__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", DrawInv__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", DrawInvTSK__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/inv", DoThatDrawInv__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", AutoPlace__FiiiiUc);

INCLUDE_ASM("asm/nonmatchings/inv", SpecialAutoPlace__FiiiiUc);

INCLUDE_ASM("asm/nonmatchings/inv", GoldAutoPlace__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", WeaponAutoPlace__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", SwapItem__FP10ItemStructT0);

INCLUDE_ASM("asm/nonmatchings/inv", CheckInvPaste__Fiii);

INCLUDE_ASM("asm/nonmatchings/inv", CheckInvCut__Fiii);

INCLUDE_ASM("asm/nonmatchings/inv", RemoveInvItem__Fii);

INCLUDE_ASM("asm/nonmatchings/inv", RemoveSpdBarItem__Fii);

INCLUDE_ASM("asm/nonmatchings/inv", CheckInvScrn__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", CheckItemStats__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", CheckBookLevel__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", CheckQuestItem__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", InvGetItem__Fii);

INCLUDE_ASM("asm/nonmatchings/inv", AutoGetItem__Fii);

INCLUDE_ASM("asm/nonmatchings/inv", SyncGetItem__FiiiUsi);

INCLUDE_ASM("asm/nonmatchings/inv", TryInvPut__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", InvPutItem__Fiii);

INCLUDE_ASM("asm/nonmatchings/inv", SyncPutItem__FiiiiUsiUciiiiiUl);

INCLUDE_ASM("asm/nonmatchings/inv", CheckInvHLight__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", RemoveScroll__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", UseScroll__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", UseStaffCharge__FP12PlayerStruct);

INCLUDE_ASM("asm/nonmatchings/inv", UseStaff__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", StartGoldDrop__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", UseInvItem__Fii);

INCLUDE_ASM("asm/nonmatchings/inv", DoTelekinesis__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", CalculateGold__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", DropItemBeforeTrig__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", ControlInv__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", InvGetItemWH__Fi);

INCLUDE_ASM("asm/nonmatchings/inv", InvAlignObject__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", InvSetItemCurs__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", InvMoveCursLeft__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", InvMoveCursRight__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", InvMoveCursUp__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", InvMoveCursDown__Fv);

INCLUDE_ASM("asm/nonmatchings/inv", SetRGB__6DialogUcUcUc_80161e58);

INCLUDE_ASM("asm/nonmatchings/inv", SetBack__6Dialogi_80161e78);

INCLUDE_ASM("asm/nonmatchings/inv", ___6Dialog_80161e80);

INCLUDE_ASM("asm/nonmatchings/inv", __6Dialog_80161ea8);

INCLUDE_ASM("asm/nonmatchings/inv", DumpMonsters__7CBlocks_80161f28);

INCLUDE_ASM("asm/nonmatchings/inv", GetOverlayOtBase__7CBlocks_80161f50);
