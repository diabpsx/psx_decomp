.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resizememblockz, 0x20

glabel resizememblockz
    /* 1BFC8 8002BFC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BFCC 8002BFCC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1BFD0 8002BFD0 FAAF000C */  jal        resizememblocka
    /* 1BFD4 8002BFD4 21300000 */   addu      $a2, $zero, $zero
    /* 1BFD8 8002BFD8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1BFDC 8002BFDC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BFE0 8002BFE0 0800E003 */  jr         $ra
    /* 1BFE4 8002BFE4 00000000 */   nop
endlabel resizememblockz
