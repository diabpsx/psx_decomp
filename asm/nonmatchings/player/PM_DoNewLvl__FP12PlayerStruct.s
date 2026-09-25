.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_DoNewLvl__FP12PlayerStruct, 0x8

glabel PM_DoNewLvl__FP12PlayerStruct
    /* 546A0 800646A0 0800E003 */  jr         $ra
    /* 546A4 800646A4 21100000 */   addu      $v0, $zero, $zero
endlabel PM_DoNewLvl__FP12PlayerStruct
