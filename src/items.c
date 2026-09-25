#include "common.h"

void InitItemGFX__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/items", ItemPlace__Fii);

INCLUDE_ASM("asm/nonmatchings/items", AddInitItems__Fv);

INCLUDE_ASM("asm/nonmatchings/items", InitItems__Fb);

INCLUDE_ASM("asm/nonmatchings/items", CalcPlrItemVals__FiUc);

INCLUDE_ASM("asm/nonmatchings/items", CalcPlrScrolls__Fi);

INCLUDE_ASM("asm/nonmatchings/items", CalcPlrStaff__FP12PlayerStruct);

INCLUDE_ASM("asm/nonmatchings/items", CalcSelfItems__Fi);

INCLUDE_ASM("asm/nonmatchings/items", ItemMinStats__FPC12PlayerStructPC10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", SetItemMinStats__FPC12PlayerStructP10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", CalcPlrItemMin__Fi);

INCLUDE_ASM("asm/nonmatchings/items", CalcPlrBookVals__Fi);

INCLUDE_ASM("asm/nonmatchings/items", CalcPlrInv__FiUc);

INCLUDE_ASM("asm/nonmatchings/items", SetPlrHandItem__FP10ItemStructi);

INCLUDE_ASM("asm/nonmatchings/items", GetPlrHandSeed__FP10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", GetGoldSeed__FiP10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", SetPlrHandSeed__FP10ItemStructi);

INCLUDE_ASM("asm/nonmatchings/items", SetPlrHandGoldCurs__FP10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", CreatePlrItems__Fi);

INCLUDE_ASM("asm/nonmatchings/items", ItemSpaceOk__Fii);

INCLUDE_ASM("asm/nonmatchings/items", GetItemSpace__Fiic);

INCLUDE_ASM("asm/nonmatchings/items", GetSuperItemSpace__Fiic);

INCLUDE_ASM("asm/nonmatchings/items", GetSuperItemLoc__FiiRiT2);

INCLUDE_ASM("asm/nonmatchings/items", CalcItemValue__Fi);

INCLUDE_ASM("asm/nonmatchings/items", GetBookSpell__Fii);

INCLUDE_ASM("asm/nonmatchings/items", GetStaffPower__FiiiUc);

INCLUDE_ASM("asm/nonmatchings/items", GetStaffSpell__FiiUc);

INCLUDE_ASM("asm/nonmatchings/items", GetItemAttrs__Fiii);

INCLUDE_ASM("asm/nonmatchings/items", RndPL__Fii);

INCLUDE_ASM("asm/nonmatchings/items", PLVal__Fiiiii);

INCLUDE_ASM("asm/nonmatchings/items", SaveItemPower__Fiiiiiii);

INCLUDE_ASM("asm/nonmatchings/items", GetItemPower__FiiilUc);

INCLUDE_ASM("asm/nonmatchings/items", GetItemBonus__FiiiiUc);

INCLUDE_ASM("asm/nonmatchings/items", SetupItem__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RndItem__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RndUItem__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RndAllItems__Fv);

INCLUDE_ASM("asm/nonmatchings/items", RndTypeItems__Fii);

INCLUDE_ASM("asm/nonmatchings/items", CheckUnique__FiiiUc);

INCLUDE_ASM("asm/nonmatchings/items", GetUniqueItem__Fii);

INCLUDE_ASM("asm/nonmatchings/items", SpawnUnique__Fiii);

INCLUDE_ASM("asm/nonmatchings/items", ItemRndDur__Fi);

INCLUDE_ASM("asm/nonmatchings/items", SetupAllItems__FiiiiiUcUcUc);

INCLUDE_ASM("asm/nonmatchings/items", SpawnItem__FiiiUc);

INCLUDE_ASM("asm/nonmatchings/items", CreateItem__Fiii);

INCLUDE_ASM("asm/nonmatchings/items", CreateRndItem__FiiUcUcUc);

INCLUDE_ASM("asm/nonmatchings/items", SetupAllUseful__Fiii);

INCLUDE_ASM("asm/nonmatchings/items", CreateRndUseful__FiiiUc);

INCLUDE_ASM("asm/nonmatchings/items", CreateTypeItem__FiiUciiUcUc);

INCLUDE_ASM("asm/nonmatchings/items", RecreateEar__FiUsiUciiiiii);

INCLUDE_ASM("asm/nonmatchings/items", SpawnQuestItem__Fiiiii);

INCLUDE_ASM("asm/nonmatchings/items", SpawnRock__Fv);

INCLUDE_ASM("asm/nonmatchings/items", RespawnItem__FiUc);

INCLUDE_ASM("asm/nonmatchings/items", DeleteItem__Fii);

INCLUDE_ASM("asm/nonmatchings/items", ItemDoppel__Fv);

INCLUDE_ASM("asm/nonmatchings/items", ProcessItems__Fv);

void FreeItemGFX__Fv(void) {
}

INCLUDE_ASM("asm/nonmatchings/items", GetItemStr__Fi);

INCLUDE_ASM("asm/nonmatchings/items", CheckIdentify__Fii);

INCLUDE_ASM("asm/nonmatchings/items", RepairItem__FP10ItemStructi);

INCLUDE_ASM("asm/nonmatchings/items", DoRepair__Fii);

INCLUDE_ASM("asm/nonmatchings/items", RechargeItem__FP10ItemStructi);

INCLUDE_ASM("asm/nonmatchings/items", DoRecharge__Fii);

INCLUDE_ASM("asm/nonmatchings/items", PrintItemOil__Fc);

INCLUDE_ASM("asm/nonmatchings/items", PrintItemPower__FcPC10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", PrintItemMisc__FPC10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", PrintItemDetails__FPC10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", PrintItemDur__FPC10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", CastScroll__Fii);

INCLUDE_ASM("asm/nonmatchings/items", UseItem__Fiii);

INCLUDE_ASM("asm/nonmatchings/items", StoreStatOk__FP10ItemStruct);

INCLUDE_ASM("asm/nonmatchings/items", PremiumItemOk__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RndPremiumItem__Fii);

INCLUDE_ASM("asm/nonmatchings/items", SpawnOnePremium__Fii);

INCLUDE_ASM("asm/nonmatchings/items", SpawnPremium__Fi);

INCLUDE_ASM("asm/nonmatchings/items", WitchBookLevel__Fi);

INCLUDE_ASM("asm/nonmatchings/items", SpawnStoreGold__Fv);

INCLUDE_ASM("asm/nonmatchings/items", RecalcStoreStats__Fv);

INCLUDE_ASM("asm/nonmatchings/items", ItemNoFlippy__Fv);

INCLUDE_ASM("asm/nonmatchings/items", CreateSpellBook__FiiiUcUc);

INCLUDE_ASM("asm/nonmatchings/items", CreateMagicArmor__FiiiiUcUc);

INCLUDE_ASM("asm/nonmatchings/items", CreateMagicWeapon__FiiiiUcUc);

INCLUDE_ASM("asm/nonmatchings/items", DrawUniqueInfo__Fv);

INCLUDE_ASM("asm/nonmatchings/items", MakeItemStr__FP10ItemStructUsUs);

INCLUDE_ASM("asm/nonmatchings/items", SmithItemOk__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RndSmithItem__Fi);

INCLUDE_ASM("asm/nonmatchings/items", WitchItemOk__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RndWitchItem__Fi);

INCLUDE_ASM("asm/nonmatchings/items", BubbleSwapItem__FP10ItemStructT0);

INCLUDE_ASM("asm/nonmatchings/items", SortWitch__Fv);

INCLUDE_ASM("asm/nonmatchings/items", RndBoyItem__Fi);

INCLUDE_ASM("asm/nonmatchings/items", HealerItemOk__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RndHealerItem__Fi);

INCLUDE_ASM("asm/nonmatchings/items", RecreatePremiumItem__Fiiii);

INCLUDE_ASM("asm/nonmatchings/items", RecreateWitchItem__Fiiii);

INCLUDE_ASM("asm/nonmatchings/items", RecreateSmithItem__Fiiii);

INCLUDE_ASM("asm/nonmatchings/items", RecreateHealerItem__Fiiii);

INCLUDE_ASM("asm/nonmatchings/items", RecreateBoyItem__Fiiii);

INCLUDE_ASM("asm/nonmatchings/items", RecreateTownItem__FiiUsii);

INCLUDE_ASM("asm/nonmatchings/items", SpawnSmith__Fi);

INCLUDE_ASM("asm/nonmatchings/items", SpawnWitch__Fi);

INCLUDE_ASM("asm/nonmatchings/items", SpawnHealer__Fi);

INCLUDE_ASM("asm/nonmatchings/items", SpawnBoy__Fi);

INCLUDE_ASM("asm/nonmatchings/items", SortSmith__Fv);

INCLUDE_ASM("asm/nonmatchings/items", SortHealer__Fv);

INCLUDE_ASM("asm/nonmatchings/items", RecreateItem__FiiUsiii);
