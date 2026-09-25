.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ToggleSpell__Fi, 0xB4

glabel ToggleSpell__Fi
    /* 21004 80031004 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 21008 80031008 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2100C 8003100C 21808000 */  addu       $s0, $a0, $zero
    /* 21010 80031010 1280033C */  lui        $v1, %hi(_spselflag)
    /* 21014 80031014 50B66324 */  addiu      $v1, $v1, %lo(_spselflag)
    /* 21018 80031018 80101000 */  sll        $v0, $s0, 2
    /* 2101C 8003101C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 21020 80031020 21884300 */  addu       $s1, $v0, $v1
    /* 21024 80031024 1800BFAF */  sw         $ra, 0x18($sp)
    /* 21028 80031028 0000248E */  lw         $a0, 0x0($s1)
    /* 2102C 8003102C 00000000 */  nop
    /* 21030 80031030 0B008010 */  beqz       $a0, .L80031060
    /* 21034 80031034 21280000 */   addu      $a1, $zero, $zero
    /* 21038 80031038 5281000C */  jal        TSK_Kill
    /* 2103C 8003103C 00000000 */   nop
    /* 21040 80031040 000020AE */  sw         $zero, 0x0($s1)
    /* 21044 80031044 06000426 */  addiu      $a0, $s0, 0x6
    /* 21048 80031048 21280000 */  addu       $a1, $zero, $zero
    /* 2104C 8003104C 21300000 */  addu       $a2, $zero, $zero
    /* 21050 80031050 53EB010C */  jal        PostGamePad__Fiiii
    /* 21054 80031054 21380000 */   addu      $a3, $zero, $zero
    /* 21058 80031058 28C40008 */  j          .L800310A0
    /* 2105C 8003105C 00000000 */   nop
  .L80031060:
    /* 21060 80031060 03000426 */  addiu      $a0, $s0, 0x3
    /* 21064 80031064 21300000 */  addu       $a2, $zero, $zero
    /* 21068 80031068 53EB010C */  jal        PostGamePad__Fiiii
    /* 2106C 8003106C 21380000 */   addu      $a3, $zero, $zero
    /* 21070 80031070 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 21074 80031074 01000424 */   addiu     $a0, $zero, 0x1
    /* 21078 80031078 21200000 */  addu       $a0, $zero, $zero
    /* 2107C 8003107C 0380053C */  lui        $a1, %hi(DrawSpeedSpellTSK__FP4TASK)
    /* 21080 80031080 D40EA524 */  addiu      $a1, $a1, %lo(DrawSpeedSpellTSK__FP4TASK)
    /* 21084 80031084 00080624 */  addiu      $a2, $zero, 0x800
    /* 21088 80031088 0480000C */  jal        TSK_AddTask
    /* 2108C 8003108C 10000724 */   addiu     $a3, $zero, 0x10
    /* 21090 80031090 000022AE */  sw         $v0, 0x0($s1)
    /* 21094 80031094 1C00428C */  lw         $v0, 0x1C($v0)
    /* 21098 80031098 00000000 */  nop
    /* 2109C 8003109C 000050AC */  sw         $s0, 0x0($v0)
  .L800310A0:
    /* 210A0 800310A0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 210A4 800310A4 1400B18F */  lw         $s1, 0x14($sp)
    /* 210A8 800310A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 210AC 800310AC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 210B0 800310B0 0800E003 */  jr         $ra
    /* 210B4 800310B4 00000000 */   nop
endlabel ToggleSpell__Fi
