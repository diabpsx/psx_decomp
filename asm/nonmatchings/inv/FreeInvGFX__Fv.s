.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeInvGFX__Fv, 0x8

glabel FreeInvGFX__Fv
    /* 1D67C 80157274 0800E003 */  jr         $ra
    /* 1D680 80157278 00000000 */   nop
endlabel FreeInvGFX__Fv
