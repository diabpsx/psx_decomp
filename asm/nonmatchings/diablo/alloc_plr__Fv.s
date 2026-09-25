.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching alloc_plr__Fv, 0x8

glabel alloc_plr__Fv
    /* 29EB8 80039EB8 0800E003 */  jr         $ra
    /* 29EBC 80039EBC 00000000 */   nop
endlabel alloc_plr__Fv
