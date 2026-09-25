#include "common.h"

INCLUDE_ASM("asm/nonmatchings/cardcore", init_mem_card__FPFii_vUc);

INCLUDE_ASM("asm/nonmatchings/cardcore", memcard_event__Fii);

INCLUDE_ASM("asm/nonmatchings/cardcore", init_card__Fib);

INCLUDE_ASM("asm/nonmatchings/cardcore", ping_card__Fi);

INCLUDE_ASM("asm/nonmatchings/cardcore", DealWithCard__Fi);

INCLUDE_ASM("asm/nonmatchings/cardcore", CardUpdateTask__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/cardcore", MemcardON__Fv);

INCLUDE_ASM("asm/nonmatchings/cardcore", MemcardOFF__Fv);

INCLUDE_ASM("asm/nonmatchings/cardcore", CheckSavedOptions__Fv);

INCLUDE_ASM("asm/nonmatchings/cardcore", card_removed__Fi);

INCLUDE_ASM("asm/nonmatchings/cardcore", read_card_block__Fii);

INCLUDE_ASM("asm/nonmatchings/cardcore", test_hw_event__Fv);

INCLUDE_ASM("asm/nonmatchings/cardcore", ActivateMemcard__Fii);

INCLUDE_ASM("asm/nonmatchings/cardcore", ActivateCharacterMemcard__Fii);

INCLUDE_ASM("asm/nonmatchings/cardcore", ShowCardActionText__Fv);

INCLUDE_ASM("asm/nonmatchings/cardcore", CountdownLoad__Fi);

INCLUDE_ASM("asm/nonmatchings/cardcore", CountdownSave__Fi);

INCLUDE_ASM("asm/nonmatchings/cardcore", ShowLoadingBox__Fi);

INCLUDE_ASM("asm/nonmatchings/cardcore", KillItemDead__Fiii);

INCLUDE_ASM("asm/nonmatchings/cardcore", ClearLoadCharItems__Fv);

INCLUDE_ASM("asm/nonmatchings/cardcore", PantsDelay__Fv);

INCLUDE_ASM("asm/nonmatchings/cardcore", SetRGB__6DialogUcUcUc_800a67f0);

INCLUDE_ASM("asm/nonmatchings/cardcore", SetBack__6Dialogi_800a6810);

INCLUDE_ASM("asm/nonmatchings/cardcore", SetBorder__6Dialogi_800a6818);

INCLUDE_ASM("asm/nonmatchings/cardcore", ___6Dialog_800a6820);

INCLUDE_ASM("asm/nonmatchings/cardcore", __6Dialog_800a6848);

INCLUDE_ASM("asm/nonmatchings/cardcore", GetOverlayOtBase__7CBlocks_800a68c8);
