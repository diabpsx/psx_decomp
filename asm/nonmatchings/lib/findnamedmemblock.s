.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findnamedmemblock, 0x20

glabel findnamedmemblock
    /* 1B2F0 8002B2F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B2F4 8002B2F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1B2F8 8002B2F8 96AC000C */  jal        findnamedmemblockinclass
    /* 1B2FC 8002B2FC 21280000 */   addu      $a1, $zero, $zero
    /* 1B300 8002B300 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B304 8002B304 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B308 8002B308 0800E003 */  jr         $ra
    /* 1B30C 8002B30C 00000000 */   nop
endlabel findnamedmemblock
