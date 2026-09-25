.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getblockname, 0x8

glabel getblockname
    /* 1B7C8 8002B7C8 0800E003 */  jr         $ra
    /* 1B7CC 8002B7CC 04008224 */   addiu     $v0, $a0, 0x4
endlabel getblockname
