.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ObjL2Special__Fiiii, 0x8

glabel ObjL2Special__Fiiii
    /* 459B4 800559B4 0800E003 */  jr         $ra
    /* 459B8 800559B8 00000000 */   nop
endlabel ObjL2Special__Fiiii
