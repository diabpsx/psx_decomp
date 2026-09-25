.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitItemGFX__Fv, 0x8

glabel InitItemGFX__Fv
    /* 2E24C 8003E24C 0800E003 */  jr         $ra
    /* 2E250 8003E250 00000000 */   nop
endlabel InitItemGFX__Fv
