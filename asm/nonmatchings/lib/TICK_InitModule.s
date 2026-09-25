.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TICK_InitModule, 0x20

glabel TICK_InitModule
    /* 10BEC 80020BEC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10BF0 80020BF0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10BF4 80020BF4 0383000C */  jal        TICK_Set
    /* 10BF8 80020BF8 21200000 */   addu      $a0, $zero, $zero
    /* 10BFC 80020BFC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10C00 80020C00 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10C04 80020C04 0800E003 */  jr         $ra
    /* 10C08 80020C08 00000000 */   nop
endlabel TICK_InitModule
