.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ObjL1Special__Fiiii, 0x8

glabel ObjL1Special__Fiiii
    /* 459AC 800559AC 0800E003 */  jr         $ra
    /* 459B0 800559B0 00000000 */   nop
endlabel ObjL1Special__Fiiii
