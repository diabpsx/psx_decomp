.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLightTable__Fv, 0x8

glabel InitLightTable__Fv
    /* 3D270 8004D270 0800E003 */  jr         $ra
    /* 3D274 8004D274 00000000 */   nop
endlabel InitLightTable__Fv
