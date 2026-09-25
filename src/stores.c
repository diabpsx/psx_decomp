#include "common.h"

void FreeStoreMem__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/stores", DrawSTextBack__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", DrawStoreArrows__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", PrintSString__FiiUcPcci);

INCLUDE_ASM("asm/nonmatchings/stores", DrawSLine__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", ClearSText__Fii);

INCLUDE_ASM("asm/nonmatchings/stores", AddSLine__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", AddSTextVal__Fii);

INCLUDE_ASM("asm/nonmatchings/stores", OffsetSTextY__Fii);

INCLUDE_ASM("asm/nonmatchings/stores", AddSText__FiiUcPccUc);

INCLUDE_ASM("asm/nonmatchings/stores", PrintStoreItem__FPC10ItemStructic);

INCLUDE_ASM("asm/nonmatchings/stores", StoreAutoPlace__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartSmith__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_ScrollSBuy__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartSBuy__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_ScrollSPBuy__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartSPBuy__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", SmithSellOk__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_ScrollSSell__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartSSell__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", SmithRepairOk__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", AddStoreHoldRepair__FP10ItemStructi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartSRepair__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartWitch__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", CheckWitchItem__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_ScrollWBuy__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartWBuy__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", WitchSellOk__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartWSell__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", WitchRechargeOk__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", AddStoreHoldRecharge__FG10ItemStructi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartWRecharge__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartNoMoney__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartNoRoom__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartNoItems__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartConfirm__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartBoy__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartBBoy__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartHealer__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_ScrollHBuy__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartHBuy__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartStory__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", IdItemOk__FP10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/stores", AddStoreHoldId__FG10ItemStructi);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartSIdentify__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartIdShow__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartTalk__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartTavern__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartBarMaid__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StartDrunk__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", StartStore__Fc);

INCLUDE_ASM("asm/nonmatchings/stores", DrawStoreHelpText__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", DrawSText__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", DrawSTextTSK__FP4TASK);

INCLUDE_ASM("asm/nonmatchings/stores", DoThatDrawSText__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", STextESC__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", STextUp__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", STextDown__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_SmithEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", SetGoldCurs__Fii);

INCLUDE_ASM("asm/nonmatchings/stores", SetSpdbarGoldCurs__Fii);

INCLUDE_ASM("asm/nonmatchings/stores", TakePlrsMoney__Fl);

INCLUDE_ASM("asm/nonmatchings/stores", SmithBuyItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_SBuyEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", SmithBuyPItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_SPBuyEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", StoreGoldFit__Fi);

INCLUDE_ASM("asm/nonmatchings/stores", PlaceStoreGold__Fl);

INCLUDE_ASM("asm/nonmatchings/stores", StoreSellItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_SSellEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", SmithRepairItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_SRepairEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_WitchEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", WitchBuyItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_WBuyEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_WSellEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", WitchRechargeItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_WRechargeEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_BoyEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", BoyBuyItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", HealerBuyItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_BBuyEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", StoryIdItem__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_ConfirmEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_HealerEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_HBuyEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_StoryEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_SIDEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_TalkEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_TavernEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_BarmaidEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", S_DrunkEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", STextEnter__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", CheckStoreBtn__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", ReleaseStoreBtn__Fv);

INCLUDE_ASM("asm/nonmatchings/stores", _GLOBAL__D_pSTextBoxCels);

INCLUDE_ASM("asm/nonmatchings/stores", _GLOBAL__I_pSTextBoxCels);

INCLUDE_ASM("asm/nonmatchings/stores", GetDown__C4CPad_80074378);

INCLUDE_ASM("asm/nonmatchings/stores", SetRGB__6DialogUcUcUc_800743a0);

INCLUDE_ASM("asm/nonmatchings/stores", SetBorder__6Dialogi_800743c0);

INCLUDE_ASM("asm/nonmatchings/stores", ___6Dialog_800743c8);

INCLUDE_ASM("asm/nonmatchings/stores", __6Dialog_800743f0);

INCLUDE_ASM("asm/nonmatchings/stores", GetOverlayOtBase__7CBlocks_80074470);
