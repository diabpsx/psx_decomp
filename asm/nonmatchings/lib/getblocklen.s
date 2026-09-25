.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching getblocklen, 0xC

glabel getblocklen
    /* 1B7BC 8002B7BC 1400828C */  lw         $v0, 0x14($a0)
    /* 1B7C0 8002B7C0 0800E003 */  jr         $ra
    /* 1B7C4 8002B7C4 00000000 */   nop
endlabel getblocklen
