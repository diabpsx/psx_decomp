.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching light_fix__Fi, 0x8

glabel light_fix__Fi
    /* 3D3B0 8004D3B0 0800E003 */  jr         $ra
    /* 3D3B4 8004D3B4 00000000 */   nop
endlabel light_fix__Fi
