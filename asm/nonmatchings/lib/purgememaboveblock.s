.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgememaboveblock, 0x70

glabel purgememaboveblock
    /* 1B0D0 8002B0D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B0D4 8002B0D4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B0D8 8002B0D8 21808000 */  addu       $s0, $a0, $zero
    /* 1B0DC 8002B0DC 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B0E0 8002B0E0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1B0E4 8002B0E4 E8BD000C */  jal        locksemaphore
    /* 1B0E8 8002B0E8 00000000 */   nop
    /* 1B0EC 8002B0EC 2000108E */  lw         $s0, 0x20($s0)
    /* 1B0F0 8002B0F0 43AC0008 */  j          .L8002B10C
    /* 1B0F4 8002B0F4 00000000 */   nop
  .L8002B0F8:
    /* 1B0F8 8002B0F8 2000108E */  lw         $s0, 0x20($s0)
    /* 1B0FC 8002B0FC 00000000 */  nop
    /* 1B100 8002B100 2400048E */  lw         $a0, 0x24($s0)
    /* 1B104 8002B104 D4AB000C */  jal        purgememblocki
    /* 1B108 8002B108 00000000 */   nop
  .L8002B10C:
    /* 1B10C 8002B10C 1800028E */  lw         $v0, 0x18($s0)
    /* 1B110 8002B110 00000000 */  nop
    /* 1B114 8002B114 20004230 */  andi       $v0, $v0, 0x20
    /* 1B118 8002B118 F7FF4010 */  beqz       $v0, .L8002B0F8
    /* 1B11C 8002B11C 00000000 */   nop
    /* 1B120 8002B120 1423848F */  lw         $a0, %gp_rel(_lv)($gp)
    /* 1B124 8002B124 F3BD000C */  jal        unlocksemaphore
    /* 1B128 8002B128 00000000 */   nop
    /* 1B12C 8002B12C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B130 8002B130 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B134 8002B134 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B138 8002B138 0800E003 */  jr         $ra
    /* 1B13C 8002B13C 00000000 */   nop
endlabel purgememaboveblock
