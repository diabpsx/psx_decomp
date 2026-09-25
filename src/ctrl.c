#include "common.h"

INCLUDE_ASM("asm/nonmatchings/ctrl", SetDemoKeys__FPi);

INCLUDE_ASM("asm/nonmatchings/ctrl", RestoreDemoKeys__FPi);

INCLUDE_ASM("asm/nonmatchings/ctrl", get_action_str__Fii);

INCLUDE_ASM("asm/nonmatchings/ctrl", get_key_pad__Fi);

INCLUDE_ASM("asm/nonmatchings/ctrl", checkvalid__Fv);

INCLUDE_ASM("asm/nonmatchings/ctrl", RemoveCtrlScreen__Fv);

INCLUDE_ASM("asm/nonmatchings/ctrl", Init_ctrl_pos__Fv);

INCLUDE_ASM("asm/nonmatchings/ctrl", remove_padval__Fi);

INCLUDE_ASM("asm/nonmatchings/ctrl", remove_comboval__Fib);

INCLUDE_ASM("asm/nonmatchings/ctrl", set_buttons__Fii);

INCLUDE_ASM("asm/nonmatchings/ctrl", restore_controller_settings__F8CTRL_SET);

INCLUDE_ASM("asm/nonmatchings/ctrl", only_one_button__Fi);

INCLUDE_ASM("asm/nonmatchings/ctrl", main_ctrl_setup__Fv);

INCLUDE_ASM("asm/nonmatchings/ctrl", PrintCtrlString__FiiUcic);

INCLUDE_ASM("asm/nonmatchings/ctrl", DrawCtrlSetup__Fv);

INCLUDE_ASM("asm/nonmatchings/ctrl", _GLOBAL__D_ctrlflag);

INCLUDE_ASM("asm/nonmatchings/ctrl", _GLOBAL__I_ctrlflag);

INCLUDE_ASM("asm/nonmatchings/ctrl", GetTick__C4CPad_8009db28);

INCLUDE_ASM("asm/nonmatchings/ctrl", GetDown__C4CPad_8009db50);

INCLUDE_ASM("asm/nonmatchings/ctrl", GetUp__C4CPad_8009db78);

INCLUDE_ASM("asm/nonmatchings/ctrl", GetCur__C4CPad_8009dba0);

INCLUDE_ASM("asm/nonmatchings/ctrl", SetPadTickMask__4CPadUs_8009dbc8);

INCLUDE_ASM("asm/nonmatchings/ctrl", SetPadTick__4CPadUs_8009dbd0);

INCLUDE_ASM("asm/nonmatchings/ctrl", SetRGB__6DialogUcUcUc_8009dbd8);

INCLUDE_ASM("asm/nonmatchings/ctrl", SetBorder__6Dialogi_8009dbf8);

INCLUDE_ASM("asm/nonmatchings/ctrl", ___6Dialog_8009dc00);

INCLUDE_ASM("asm/nonmatchings/ctrl", __6Dialog_8009dc28);

INCLUDE_ASM("asm/nonmatchings/ctrl", GetOverlayOtBase__7CBlocks_8009dca8);
