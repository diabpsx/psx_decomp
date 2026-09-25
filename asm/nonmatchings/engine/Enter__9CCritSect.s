.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Enter__9CCritSect, 0x8

glabel Enter__9CCritSect
    /* 2DC3C 8003DC3C 0800E003 */  jr         $ra
    /* 2DC40 8003DC40 00000000 */   nop
endlabel Enter__9CCritSect
