.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_Init__Fv, 0x8

glabel GLUE_Init__Fv
    /* 8C518 8009C518 0800E003 */  jr         $ra
    /* 8C51C 8009C51C 00000000 */   nop
endlabel GLUE_Init__Fv
