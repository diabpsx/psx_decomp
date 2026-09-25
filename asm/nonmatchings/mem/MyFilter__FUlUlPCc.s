.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MyFilter__FUlUlPCc, 0x8

glabel MyFilter__FUlUlPCc
    /* 74424 80084424 0800E003 */  jr         $ra
    /* 74428 80084428 00000000 */   nop
endlabel MyFilter__FUlUlPCc
