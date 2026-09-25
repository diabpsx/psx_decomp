.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findmemblock, 0x20

glabel findmemblock
    /* 1AEC4 8002AEC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1AEC8 8002AEC8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1AECC 8002AECC 6FAB000C */  jal        findmemblocka
    /* 1AED0 8002AED0 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AED4 8002AED4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1AED8 8002AED8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1AEDC 8002AEDC 0800E003 */  jr         $ra
    /* 1AEE0 8002AEE0 00000000 */   nop
endlabel findmemblock
