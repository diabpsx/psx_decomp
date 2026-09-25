.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeLightTable__Fv, 0x8

glabel MakeLightTable__Fv
    /* 3D278 8004D278 0800E003 */  jr         $ra
    /* 3D27C 8004D27C 00000000 */   nop
endlabel MakeLightTable__Fv
