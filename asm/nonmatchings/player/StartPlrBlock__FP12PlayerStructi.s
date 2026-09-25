.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPlrBlock__FP12PlayerStructi, 0x98

glabel StartPlrBlock__FP12PlayerStructi
    /* 510A8 800610A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 510AC 800610AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 510B0 800610B0 21808000 */  addu       $s0, $a0, $zero
    /* 510B4 800610B4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 510B8 800610B8 D3000292 */  lbu        $v0, 0xD3($s0)
    /* 510BC 800610BC 00000000 */  nop
    /* 510C0 800610C0 0D004010 */  beqz       $v0, .L800610F8
    /* 510C4 800610C4 00000000 */   nop
    /* 510C8 800610C8 1C01028E */  lw         $v0, 0x11C($s0)
    /* 510CC 800610CC 00000000 */  nop
    /* 510D0 800610D0 09004014 */  bnez       $v0, .L800610F8
    /* 510D4 800610D4 00000000 */   nop
    /* 510D8 800610D8 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 510DC 800610DC 00000000 */   nop
    /* 510E0 800610E0 05004010 */  beqz       $v0, .L800610F8
    /* 510E4 800610E4 21200002 */   addu      $a0, $s0, $zero
    /* 510E8 800610E8 1587010C */  jal        StartPlrKill__FP12PlayerStructi
    /* 510EC 800610EC FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 510F0 800610F0 4B840108 */  j          .L8006112C
    /* 510F4 800610F4 00000000 */   nop
  .L800610F8:
    /* 510F8 800610F8 30000586 */  lh         $a1, 0x30($s0)
    /* 510FC 800610FC 32000686 */  lh         $a2, 0x32($s0)
    /* 51100 80061100 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 51104 80061104 2A000424 */   addiu     $a0, $zero, 0x2A
    /* 51108 80061108 21200002 */  addu       $a0, $s0, $zero
    /* 5110C 8006110C 03000524 */  addiu      $a1, $zero, 0x3
    /* 51110 80061110 AC01068E */  lw         $a2, 0x1AC($s0)
    /* 51114 80061114 877F010C */  jal        NewPlrAnim__FP12PlayerStructiii
    /* 51118 80061118 02000724 */   addiu     $a3, $zero, 0x2
    /* 5111C 8006111C 21200002 */  addu       $a0, $s0, $zero
    /* 51120 80061120 06000224 */  addiu      $v0, $zero, 0x6
    /* 51124 80061124 7F83010C */  jal        SetPlayerOld__FP12PlayerStruct
    /* 51128 80061128 000082AC */   sw        $v0, 0x0($a0)
  .L8006112C:
    /* 5112C 8006112C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 51130 80061130 1000B08F */  lw         $s0, 0x10($sp)
    /* 51134 80061134 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 51138 80061138 0800E003 */  jr         $ra
    /* 5113C 8006113C 00000000 */   nop
endlabel StartPlrBlock__FP12PlayerStructi
