.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_CheckEFlag__Fi, 0x8

glabel M_CheckEFlag__Fi
    /* 6F354 8007F354 0800E003 */  jr         $ra
    /* 6F358 8007F358 00000000 */   nop
endlabel M_CheckEFlag__Fi
