.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching filesizez, 0x20

glabel filesizez
    /* 18F9C 80028F9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 18FA0 80028FA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 18FA4 80028FA4 EFA3000C */  jal        filesizea
    /* 18FA8 80028FA8 21280000 */   addu      $a1, $zero, $zero
    /* 18FAC 80028FAC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 18FB0 80028FB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 18FB4 80028FB4 0800E003 */  jr         $ra
    /* 18FB8 80028FB8 00000000 */   nop
endlabel filesizez
