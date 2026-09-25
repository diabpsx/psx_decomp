.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching largestunused, 0x20

glabel largestunused
    /* 1B35C 8002B35C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B360 8002B360 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1B364 8002B364 DFAC000C */  jal        largestunusedinclass
    /* 1B368 8002B368 21200000 */   addu      $a0, $zero, $zero
    /* 1B36C 8002B36C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B370 8002B370 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B374 8002B374 0800E003 */  jr         $ra
    /* 1B378 8002B378 00000000 */   nop
endlabel largestunused
