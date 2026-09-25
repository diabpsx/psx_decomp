.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching validateasyncblocks, 0x8

glabel validateasyncblocks
    /* 13738 80023738 0800E003 */  jr         $ra
    /* 1373C 8002373C 00000000 */   nop
endlabel validateasyncblocks
