.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CM_ChooseMonsterList__FiUl, 0xA0

glabel CM_ChooseMonsterList__FiUl
    /* 1BEEC 80155AE4 3C19828F */  lw         $v0, %gp_rel(D_8011C0BC)($gp)
    /* 1BEF0 80155AE8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1BEF4 80155AEC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1BEF8 80155AF0 21808000 */  addu       $s0, $a0, $zero
    /* 1BEFC 80155AF4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1BF00 80155AF8 2188A000 */  addu       $s1, $a1, $zero
    /* 1BF04 80155AFC 18004010 */  beqz       $v0, .L80155B60
    /* 1BF08 80155B00 2000BFAF */   sw        $ra, 0x20($sp)
    /* 1BF0C 80155B04 02400424 */  addiu      $a0, $zero, 0x4002
    /* 1BF10 80155B08 1580053C */  lui        $a1, %hi(ChooseTask__FP4TASK)
    /* 1BF14 80155B0C 8C5BA524 */  addiu      $a1, $a1, %lo(ChooseTask__FP4TASK)
    /* 1BF18 80155B10 00100624 */  addiu      $a2, $zero, 0x1000
    /* 1BF1C 80155B14 10000724 */  addiu      $a3, $zero, 0x10
    /* 1BF20 80155B18 0480000C */  jal        TSK_AddTask
    /* 1BF24 80155B1C 1000A0AF */   sw        $zero, 0x10($sp)
    /* 1BF28 80155B20 1C00428C */  lw         $v0, 0x1C($v0)
    /* 1BF2C 80155B24 1000A327 */  addiu      $v1, $sp, 0x10
    /* 1BF30 80155B28 000050AC */  sw         $s0, 0x0($v0)
    /* 1BF34 80155B2C 040043AC */  sw         $v1, 0x4($v0)
    /* 1BF38 80155B30 080051AC */  sw         $s1, 0x8($v0)
  .L80155B34:
    /* 1BF3C 80155B34 EE80000C */  jal        TSK_Sleep
    /* 1BF40 80155B38 01000424 */   addiu     $a0, $zero, 0x1
    /* 1BF44 80155B3C 21200000 */  addu       $a0, $zero, $zero
    /* 1BF48 80155B40 02400524 */  addiu      $a1, $zero, 0x4002
    /* 1BF4C 80155B44 B681000C */  jal        TSK_Exist
    /* 1BF50 80155B48 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 1BF54 80155B4C F9FF4014 */  bnez       $v0, .L80155B34
    /* 1BF58 80155B50 00000000 */   nop
    /* 1BF5C 80155B54 1000A28F */  lw         $v0, 0x10($sp)
    /* 1BF60 80155B58 DB560508 */  j          .L80155B6C
    /* 1BF64 80155B5C 00000000 */   nop
  .L80155B60:
    /* 1BF68 80155B60 21200002 */  addu       $a0, $s0, $zero
    /* 1BF6C 80155B64 E156050C */  jal        NoUiListChoose__FiUl
    /* 1BF70 80155B68 21282002 */   addu      $a1, $s1, $zero
  .L80155B6C:
    /* 1BF74 80155B6C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1BF78 80155B70 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1BF7C 80155B74 1800B08F */  lw         $s0, 0x18($sp)
    /* 1BF80 80155B78 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1BF84 80155B7C 0800E003 */  jr         $ra
    /* 1BF88 80155B80 00000000 */   nop
endlabel CM_ChooseMonsterList__FiUl
