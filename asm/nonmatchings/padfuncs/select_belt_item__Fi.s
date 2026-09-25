.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching select_belt_item__Fi, 0x8

glabel select_belt_item__Fi
    /* 90A60 800A0A60 0800E003 */  jr         $ra
    /* 90A64 800A0A64 00000000 */   nop
endlabel select_belt_item__Fi
