.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SavePreLighting__Fv, 0x8

glabel SavePreLighting__Fv
    /* 3D54C 8004D54C 0800E003 */  jr         $ra
    /* 3D550 8004D550 00000000 */   nop
endlabel SavePreLighting__Fv
