.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resizememblock, 0x20

glabel resizememblock
    /* 1BFA8 8002BFA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BFAC 8002BFAC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1BFB0 8002BFB0 FAAF000C */  jal        resizememblocka
    /* 1BFB4 8002BFB4 01000624 */   addiu     $a2, $zero, 0x1
    /* 1BFB8 8002BFB8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1BFBC 8002BFBC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BFC0 8002BFC0 0800E003 */  jr         $ra
    /* 1BFC4 8002BFC4 00000000 */   nop
endlabel resizememblock
