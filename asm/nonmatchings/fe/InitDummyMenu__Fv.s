.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDummyMenu__Fv, 0x8

glabel InitDummyMenu__Fv
    /* E70 8013AA68 0800E003 */  jr         $ra
    /* E74 8013AA6C 00000000 */   nop
endlabel InitDummyMenu__Fv
