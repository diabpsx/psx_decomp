.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getblocktype, 0xC

glabel getblocktype
    /* 1B7D0 8002B7D0 1800828C */  lw         $v0, 0x18($a0)
    /* 1B7D4 8002B7D4 0800E003 */  jr         $ra
    /* 1B7D8 8002B7D8 00000000 */   nop
endlabel getblocktype
