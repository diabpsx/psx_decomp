.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeItemGFX__Fv, 0x8

glabel FreeItemGFX__Fv
    /* 35B70 80045B70 0800E003 */  jr         $ra
    /* 35B74 80045B74 00000000 */   nop
endlabel FreeItemGFX__Fv
