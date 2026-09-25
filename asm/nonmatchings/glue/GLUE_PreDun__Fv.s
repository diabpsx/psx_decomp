.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_PreDun__Fv, 0x8

glabel GLUE_PreDun__Fv
    /* 8BAFC 8009BAFC 0800E003 */  jr         $ra
    /* 8BB00 8009BB00 00000000 */   nop
endlabel GLUE_PreDun__Fv
