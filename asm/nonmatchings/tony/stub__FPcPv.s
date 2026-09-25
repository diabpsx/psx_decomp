.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stub__FPcPv, 0x8

glabel stub__FPcPv
    /* 8B338 8009B338 0800E003 */  jr         $ra
    /* 8B33C 8009B33C 00000000 */   nop
endlabel stub__FPcPv
