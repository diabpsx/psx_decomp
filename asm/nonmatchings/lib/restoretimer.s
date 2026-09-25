.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching restoretimer, 0x24

glabel restoretimer
    /* 1FE80 8002FE80 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FE84 8002FE84 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FE88 8002FE88 06000424 */  addiu      $a0, $zero, 0x6
    /* 1FE8C 8002FE8C AB48000C */  jal        InterruptCallback
    /* 1FE90 8002FE90 21280000 */   addu      $a1, $zero, $zero
    /* 1FE94 8002FE94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FE98 8002FE98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FE9C 8002FE9C 0800E003 */  jr         $ra
    /* 1FEA0 8002FEA0 00000000 */   nop
endlabel restoretimer
