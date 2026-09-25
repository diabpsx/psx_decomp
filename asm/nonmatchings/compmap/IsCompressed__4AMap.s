.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsCompressed__4AMap, 0xC

glabel IsCompressed__4AMap
    /* 72154 80082154 0000828C */  lw         $v0, 0x0($a0)
    /* 72158 80082158 0800E003 */  jr         $ra
    /* 7215C 8008215C 00000000 */   nop
endlabel IsCompressed__4AMap
