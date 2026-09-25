.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching restoregetcycle, 0x24

glabel restoregetcycle
    /* 1FB14 8002FB14 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FB18 8002FB18 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FB1C 8002FB1C 05000424 */  addiu      $a0, $zero, 0x5
    /* 1FB20 8002FB20 AB48000C */  jal        InterruptCallback
    /* 1FB24 8002FB24 21280000 */   addu      $a1, $zero, $zero
    /* 1FB28 8002FB28 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FB2C 8002FB2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FB30 8002FB30 0800E003 */  jr         $ra
    /* 1FB34 8002FB34 00000000 */   nop
endlabel restoregetcycle
