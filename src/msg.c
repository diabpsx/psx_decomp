#include "common.h"

INCLUDE_ASM("asm/nonmatchings/msg", delta_init__Fv);

INCLUDE_ASM("asm/nonmatchings/msg", delta_kill_monster__FiUcUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", delta_monster_hp__FilUc);

INCLUDE_ASM("asm/nonmatchings/msg", delta_leave_sync__FUc);

INCLUDE_ASM("asm/nonmatchings/msg", delta_sync_object__FiUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", delta_get_item__FPC9TCmdGItemUc);

INCLUDE_ASM("asm/nonmatchings/msg", delta_put_item__FPC9TCmdPItemiiUc);

INCLUDE_ASM("asm/nonmatchings/msg", delta_portal_inited__Fi);

INCLUDE_ASM("asm/nonmatchings/msg", delta_quest_inited__Fi);

INCLUDE_ASM("asm/nonmatchings/msg", DeltaAddItem__Fi);

INCLUDE_ASM("asm/nonmatchings/msg", DeltaExportData__FPc);

INCLUDE_ASM("asm/nonmatchings/msg", DeltaImportData__FPc);

INCLUDE_ASM("asm/nonmatchings/msg", DeltaSaveLevel__Fv);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmd__FUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdGolem__FUcUcUcUclUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdLoc__FUcUcUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdLocParam1__FUcUcUcUcUs);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdLocParam2__FUcUcUcUcUsUs);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdLocParam3__FUcUcUcUcUsUsUs);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdParam1__FUcUcUs);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdParam2__FUcUcUsUs);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdParam3__FUcUcUsUsUs);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdQuest__FUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdGItem__FUcUcUcUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdGItem2__FUcUcUcUcPC9TCmdGItem);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdReq2__FUcUcUcPC9TCmdGItem);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdExtra__FPC9TCmdGItem);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdPItem__FUcUcUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdChItem__FUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdDelItem__FUcUc);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdDItem__FUci);

INCLUDE_ASM("asm/nonmatchings/msg", i_own_level__Fi);

INCLUDE_ASM("asm/nonmatchings/msg", NetSendCmdDamage__FUcUcUl);

INCLUDE_ASM("asm/nonmatchings/msg", delta_close_portal__Fi);

void check_update_plr__Fi(void) {
}

INCLUDE_ASM("asm/nonmatchings/msg", On_WALKXY__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ADDSTR__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ADDMAG__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ADDDEX__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ADDVIT__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SBSPELL__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_GOTOGETITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_REQUESTGITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_GETITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_GOTOAGETITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_REQUESTAGITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_AGETITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ITEMEXTRA__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_PUTITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SYNCPUTITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_RESPAWNITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SATTACKXY__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SPELLXYD__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SPELLXY__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_TSPELLXY__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_OPOBJXY__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_DISARMXY__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_OPOBJT__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ATTACKID__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SPELLID__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SPELLPID__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_TSPELLID__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_TSPELLPID__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_KNOCKBACK__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_RESURRECT__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_HEALOTHER__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_TALKXY__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_NEWLVL__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_WARP__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_MONSTDEATH__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_KILLGOLEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_AWAKEGOLEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_MONSTDAMAGE__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_PLRDEAD__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_PLRDAMAGE__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_OPENDOOR__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_CLOSEDOOR__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_OPERATEOBJ__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_PLROPOBJ__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_BREAKOBJ__FPC4TCmdi);

void On_CHANGEPLRITEMS__FPC4TCmdi(void) {
}

void On_DELPLRITEMS__FPC4TCmdi(void) {
}

void On_PLRLEVEL__FPC4TCmdi(void) {
}

INCLUDE_ASM("asm/nonmatchings/msg", On_DROPITEM__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_PLAYER_JOINLEVEL__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ACTIVATEPORTAL__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_DEACTIVATEPORTAL__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_RETOWN__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SETSTR__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SETDEX__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SETMAG__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SETVIT__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_SYNCQUEST__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", On_ENDSHIELD__FPC4TCmdi);

INCLUDE_ASM("asm/nonmatchings/msg", ParseCmd__FiPC4TCmd);

INCLUDE_ASM("asm/nonmatchings/msg", GetDLevel__Fib);

INCLUDE_ASM("asm/nonmatchings/msg", ReleaseDLevel__FP6DLevel);

INCLUDE_ASM("asm/nonmatchings/msg", MSG_ClearOutCompMap__Fv);

INCLUDE_ASM("asm/nonmatchings/msg", _GLOBAL__D_deltaload);

INCLUDE_ASM("asm/nonmatchings/msg", _GLOBAL__I_deltaload);

INCLUDE_ASM("asm/nonmatchings/msg", __10CrunchComp);

INCLUDE_ASM("asm/nonmatchings/msg", __7PakComp);

INCLUDE_ASM("asm/nonmatchings/msg", __6NoComp);

INCLUDE_ASM("asm/nonmatchings/msg", GetSize__14CompressedLevs);

INCLUDE_ASM("asm/nonmatchings/msg", __9CompClass);

INCLUDE_ASM("asm/nonmatchings/msg", DoDecomp__C10CrunchCompPUcPCUcii);

INCLUDE_ASM("asm/nonmatchings/msg", DoComp__C10CrunchCompPUcPCUci);

INCLUDE_ASM("asm/nonmatchings/msg", DoDecomp__C7PakCompPUcPCUcii);

INCLUDE_ASM("asm/nonmatchings/msg", DoComp__C7PakCompPUcPCUci);

INCLUDE_ASM("asm/nonmatchings/msg", DoDecomp__C6NoCompPUcPCUcii);

INCLUDE_ASM("asm/nonmatchings/msg", DoComp__C6NoCompPUcPCUci);
