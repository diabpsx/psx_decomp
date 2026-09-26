.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AD94, 0xC

glabel func_8013AD94
    /* 119C 8013AD94 00008294 */  lhu        $v0, 0x0($a0)
    /* 11A0 8013AD98 0800E003 */  jr         $ra
    /* 11A4 8013AD9C 00000000 */   nop
endlabel func_8013AD94
