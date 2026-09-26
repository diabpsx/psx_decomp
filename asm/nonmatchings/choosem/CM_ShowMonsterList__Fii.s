.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CM_ShowMonsterList__Fii, 0x8

glabel CM_ShowMonsterList__Fii
    /* 1BEE4 80155ADC 0800E003 */  jr         $ra
    /* 1BEE8 80155AE0 00000000 */   nop
endlabel CM_ShowMonsterList__Fii
