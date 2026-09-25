.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching largestunusedinclass, 0x48

glabel largestunusedinclass
    /* 1B37C 8002B37C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B380 8002B380 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B384 8002B384 21808000 */  addu       $s0, $a0, $zero
    /* 1B388 8002B388 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B38C 8002B38C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1B390 8002B390 E8BD000C */  jal        locksemaphore
    /* 1B394 8002B394 00000000 */   nop
    /* 1B398 8002B398 F1AC000C */  jal        largestunusedinclassi
    /* 1B39C 8002B39C 21200002 */   addu      $a0, $s0, $zero
    /* 1B3A0 8002B3A0 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B3A4 8002B3A4 F3BD000C */  jal        unlocksemaphore
    /* 1B3A8 8002B3A8 21804000 */   addu      $s0, $v0, $zero
    /* 1B3AC 8002B3AC 21100002 */  addu       $v0, $s0, $zero
    /* 1B3B0 8002B3B0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B3B4 8002B3B4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B3B8 8002B3B8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B3BC 8002B3BC 0800E003 */  jr         $ra
    /* 1B3C0 8002B3C0 00000000 */   nop
endlabel largestunusedinclass
