.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_CloseStreamFile__FP6STRHDR, 0x8

glabel BL_CloseStreamFile__FP6STRHDR
    /* 781CC 800881CC 0800E003 */  jr         $ra
    /* 781D0 800881D0 2B100400 */   sltu      $v0, $zero, $a0
endlabel BL_CloseStreamFile__FP6STRHDR
