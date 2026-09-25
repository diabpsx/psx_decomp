.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_CHANGEPLRITEMS__FPC4TCmdi, 0x8

glabel On_CHANGEPLRITEMS__FPC4TCmdi
    /* 41EF4 80051EF4 0800E003 */  jr         $ra
    /* 41EF8 80051EF8 00000000 */   nop
endlabel On_CHANGEPLRITEMS__FPC4TCmdi
