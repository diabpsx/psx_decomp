.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawFadedScreen__Fv, 0x88

glabel DrawFadedScreen__Fv
    /* 6EFDC 8007EFDC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6EFE0 8007EFE0 21200000 */  addu       $a0, $zero, $zero
    /* 6EFE4 8007EFE4 2400BFAF */  sw         $ra, 0x24($sp)
    /* 6EFE8 8007EFE8 044F020C */  jal        GM_UseTexData__Fi
    /* 6EFEC 8007EFEC 2000B0AF */   sw        $s0, 0x20($sp)
    /* 6EFF0 8007EFF0 D3FC010C */  jal        GetMaxOtPos__7CBlocks_8007f34c
    /* 6EFF4 8007EFF4 21804000 */   addu      $s0, $v0, $zero
    /* 6EFF8 8007EFF8 21200002 */  addu       $a0, $s0, $zero
    /* 6EFFC 8007EFFC D8000524 */  addiu      $a1, $zero, 0xD8
    /* 6F000 8007F000 21300000 */  addu       $a2, $zero, $zero
    /* 6F004 8007F004 21380000 */  addu       $a3, $zero, $zero
    /* 6F008 8007F008 F01482AF */  sw         $v0, %gp_rel(D_8011BC70)($gp)
    /* 6F00C 8007F00C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6F010 8007F010 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6F014 8007F014 5B4D020C */  jal        PrintGt4__7TextDatiiiiii
    /* 6F018 8007F018 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6F01C 8007F01C 1280033C */  lui        $v1, %hi(TitleFlag)
    /* 6F020 8007F020 40B1638C */  lw         $v1, %lo(TitleFlag)($v1)
    /* 6F024 8007F024 00000000 */  nop
    /* 6F028 8007F028 05006014 */  bnez       $v1, .L8007F040
    /* 6F02C 8007F02C 21204000 */   addu      $a0, $v0, $zero
    /* 6F030 8007F030 1280053C */  lui        $a1, %hi(D_8011BC7C)
    /* 6F034 8007F034 7CBCA524 */  addiu      $a1, $a1, %lo(D_8011BC7C)
    /* 6F038 8007F038 12FC0108 */  j          .L8007F048
    /* 6F03C 8007F03C 00000000 */   nop
  .L8007F040:
    /* 6F040 8007F040 1280053C */  lui        $a1, %hi(D_8011BC84)
    /* 6F044 8007F044 84BCA524 */  addiu      $a1, $a1, %lo(D_8011BC84)
  .L8007F048:
    /* 6F048 8007F048 AEFB010C */  jal        SetPolyXY__FP8POLY_GT4PUc
    /* 6F04C 8007F04C 00000000 */   nop
    /* 6F050 8007F050 2400BF8F */  lw         $ra, 0x24($sp)
    /* 6F054 8007F054 2000B08F */  lw         $s0, 0x20($sp)
    /* 6F058 8007F058 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6F05C 8007F05C 0800E003 */  jr         $ra
    /* 6F060 8007F060 00000000 */   nop
endlabel DrawFadedScreen__Fv
