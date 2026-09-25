.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AS_CallBack1__Fi, 0x6C

glabel AS_CallBack1__Fi
    /* 8AA20 8009AA20 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8AA24 8009AA24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8AA28 8009AA28 0C80113C */  lui        $s1, %hi(SFXTab + 0x91)
    /* 8AA2C 8009AA2C 719C3126 */  addiu      $s1, $s1, %lo(SFXTab + 0x91)
    /* 8AA30 8009AA30 1800BFAF */  sw         $ra, 0x18($sp)
    /* 8AA34 8009AA34 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8AA38 8009AA38 00002292 */  lbu        $v0, 0x0($s1)
    /* 8AA3C 8009AA3C 00000000 */  nop
    /* 8AA40 8009AA40 0C004014 */  bnez       $v0, .L8009AA74
    /* 8AA44 8009AA44 21808000 */   addu      $s0, $a0, $zero
    /* 8AA48 8009AA48 7443000C */  jal        ReloadGP
    /* 8AA4C 8009AA4C 00000000 */   nop
    /* 8AA50 8009AA50 01000324 */  addiu      $v1, $zero, 0x1
    /* 8AA54 8009AA54 000023A2 */  sb         $v1, 0x0($s1)
    /* 8AA58 8009AA58 21200002 */  addu       $a0, $s0, $zero
    /* 8AA5C 8009AA5C 9A90000C */  jal        cancelasyncload
    /* 8AA60 8009AA60 21804000 */   addu      $s0, $v0, $zero
    /* 8AA64 8009AA64 53BE000C */  jal        systemtask
    /* 8AA68 8009AA68 21200000 */   addu      $a0, $zero, $zero
    /* 8AA6C 8009AA6C 7943000C */  jal        SetGP
    /* 8AA70 8009AA70 21200002 */   addu      $a0, $s0, $zero
  .L8009AA74:
    /* 8AA74 8009AA74 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8AA78 8009AA78 1400B18F */  lw         $s1, 0x14($sp)
    /* 8AA7C 8009AA7C 1000B08F */  lw         $s0, 0x10($sp)
    /* 8AA80 8009AA80 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8AA84 8009AA84 0800E003 */  jr         $ra
    /* 8AA88 8009AA88 00000000 */   nop
endlabel AS_CallBack1__Fi
