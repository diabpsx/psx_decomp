.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getblockoffset, 0xC

glabel getblockoffset
    /* 1B7B0 8002B7B0 0000828C */  lw         $v0, 0x0($a0)
    /* 1B7B4 8002B7B4 0800E003 */  jr         $ra
    /* 1B7B8 8002B7B8 00000000 */   nop
endlabel getblockoffset
