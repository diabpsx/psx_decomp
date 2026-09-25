.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_DELPLRITEMS__FPC4TCmdi, 0x8

glabel On_DELPLRITEMS__FPC4TCmdi
    /* 41EFC 80051EFC 0800E003 */  jr         $ra
    /* 41F00 80051F00 00000000 */   nop
endlabel On_DELPLRITEMS__FPC4TCmdi
