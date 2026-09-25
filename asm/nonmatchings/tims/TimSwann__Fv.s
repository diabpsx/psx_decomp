.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TimSwann__Fv, 0x8

glabel TimSwann__Fv
    /* 75874 80085874 0800E003 */  jr         $ra
    /* 75878 80085878 00000000 */   nop
endlabel TimSwann__Fv
