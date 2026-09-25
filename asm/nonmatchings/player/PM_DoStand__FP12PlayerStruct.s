.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_DoStand__FP12PlayerStruct, 0x8

glabel PM_DoStand__FP12PlayerStruct
    /* 52560 80062560 0800E003 */  jr         $ra
    /* 52564 80062564 21100000 */   addu      $v0, $zero, $zero
endlabel PM_DoStand__FP12PlayerStruct
