.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeLightTable__Fv, 0x8

glabel FreeLightTable__Fv
    /* 3D268 8004D268 0800E003 */  jr         $ra
    /* 3D26C 8004D26C 00000000 */   nop
endlabel FreeLightTable__Fv
