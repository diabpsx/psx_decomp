.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_PLRLEVEL__FPC4TCmdi, 0x8

glabel On_PLRLEVEL__FPC4TCmdi
    /* 41F04 80051F04 0800E003 */  jr         $ra
    /* 41F08 80051F08 00000000 */   nop
endlabel On_PLRLEVEL__FPC4TCmdi
