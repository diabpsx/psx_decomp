.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Succ__Fi, 0x24

glabel MAI_Succ__Fi
    /* 1804C 80151C44 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18050 80151C48 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18054 80151C4C 18000524 */  addiu      $a1, $zero, 0x18
    /* 18058 80151C50 7F46050C */  jal        MAI_Ranged__FiiUc
    /* 1805C 80151C54 21300000 */   addu      $a2, $zero, $zero
    /* 18060 80151C58 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18064 80151C5C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18068 80151C60 0800E003 */  jr         $ra
    /* 1806C 80151C64 00000000 */   nop
endlabel MAI_Succ__Fi
