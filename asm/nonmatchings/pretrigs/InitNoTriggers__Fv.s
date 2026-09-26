.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitNoTriggers__Fv, 0x24

glabel InitNoTriggers__Fv
    /* 285B4 801621AC 1280023C */  lui        $v0, %hi(sel_data)
    /* 285B8 801621B0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 285BC 801621B4 1280013C */  lui        $at, %hi(numtrigs)
    /* 285C0 801621B8 78BB20AC */  sw         $zero, %lo(numtrigs)($at)
    /* 285C4 801621BC 1280013C */  lui        $at, %hi(_trigflag)
    /* 285C8 801621C0 21082200 */  addu       $at, $at, $v0
    /* 285CC 801621C4 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 285D0 801621C8 0800E003 */  jr         $ra
    /* 285D4 801621CC 00000000 */   nop
endlabel InitNoTriggers__Fv
