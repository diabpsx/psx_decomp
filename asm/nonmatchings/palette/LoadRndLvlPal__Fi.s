.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadRndLvlPal__Fi, 0x8

glabel LoadRndLvlPal__Fi
    /* 6EE6C 8007EE6C 0800E003 */  jr         $ra
    /* 6EE70 8007EE70 00000000 */   nop
endlabel LoadRndLvlPal__Fi
