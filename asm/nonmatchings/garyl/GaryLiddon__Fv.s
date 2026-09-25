.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GaryLiddon__Fv, 0x8

glabel GaryLiddon__Fv
    /* 74634 80084634 0800E003 */  jr         $ra
    /* 74638 80084638 00000000 */   nop
endlabel GaryLiddon__Fv
