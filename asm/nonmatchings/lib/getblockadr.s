.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getblockadr, 0xC

glabel getblockadr
    /* 1B7A4 8002B7A4 0000828C */  lw         $v0, 0x0($a0)
    /* 1B7A8 8002B7A8 0800E003 */  jr         $ra
    /* 1B7AC 8002B7AC 00000000 */   nop
endlabel getblockadr
