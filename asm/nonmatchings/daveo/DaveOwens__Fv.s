.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DaveOwens__Fv, 0x8

glabel DaveOwens__Fv
    /* 747CC 800847CC 0800E003 */  jr         $ra
    /* 747D0 800847D0 00000000 */   nop
endlabel DaveOwens__Fv
