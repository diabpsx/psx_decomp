.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_LoadDirectory__Fv, 0x128

glabel BL_LoadDirectory__Fv
    /* 775CC 800875CC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 775D0 800875D0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 775D4 800875D4 4952113C */  lui        $s1, (0x5249444C >> 16)
    /* 775D8 800875D8 4C443136 */  ori        $s1, $s1, (0x5249444C & 0xFFFF)
    /* 775DC 800875DC 1180043C */  lui        $a0, %hi(D_801102A0)
    /* 775E0 800875E0 A0028424 */  addiu      $a0, $a0, %lo(D_801102A0)
    /* 775E4 800875E4 01000524 */  addiu      $a1, $zero, 0x1
    /* 775E8 800875E8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 775EC 800875EC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 775F0 800875F0 D51C020C */  jal        BL_ReadFile__FPcUl
    /* 775F4 800875F4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 775F8 800875F8 21904000 */  addu       $s2, $v0, $zero
    /* 775FC 800875FC DD85000C */  jal        GAL_Lock
    /* 77600 80087600 21204002 */   addu      $a0, $s2, $zero
    /* 77604 80087604 21804000 */  addu       $s0, $v0, $zero
    /* 77608 80087608 05000016 */  bnez       $s0, .L80087620
    /* 7760C 8008760C 21200000 */   addu      $a0, $zero, $zero
    /* 77610 80087610 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77614 80087614 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77618 80087618 A583000C */  jal        DBG_Error
    /* 7761C 8008761C 06010624 */   addiu     $a2, $zero, 0x106
  .L80087620:
    /* 77620 80087620 0000028E */  lw         $v0, 0x0($s0)
    /* 77624 80087624 00000000 */  nop
    /* 77628 80087628 05005110 */  beq        $v0, $s1, .L80087640
    /* 7762C 8008762C 21200000 */   addu      $a0, $zero, $zero
    /* 77630 80087630 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77634 80087634 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77638 80087638 A583000C */  jal        DBG_Error
    /* 7763C 8008763C 09010624 */   addiu     $a2, $zero, 0x109
  .L80087640:
    /* 77640 80087640 0400028E */  lw         $v0, 0x4($s0)
    /* 77644 80087644 00000000 */  nop
    /* 77648 80087648 E00382AF */  sw         $v0, %gp_rel(BL_NoLumpFiles)($gp)
    /* 7764C 8008764C 05004014 */  bnez       $v0, .L80087664
    /* 77650 80087650 21200000 */   addu      $a0, $zero, $zero
    /* 77654 80087654 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77658 80087658 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 7765C 8008765C A583000C */  jal        DBG_Error
    /* 77660 80087660 0C010624 */   addiu     $a2, $zero, 0x10C
  .L80087664:
    /* 77664 80087664 E003858F */  lw         $a1, %gp_rel(BL_NoLumpFiles)($gp)
    /* 77668 80087668 611E020C */  jal        BL_MakeFilePosTab__FPUcUl
    /* 7766C 8008766C 08000426 */   addiu     $a0, $s0, 0x8
    /* 77670 80087670 E80382AF */  sw         $v0, %gp_rel(LFileTab)($gp)
    /* 77674 80087674 1886000C */  jal        GAL_Free
    /* 77678 80087678 21204002 */   addu      $a0, $s2, $zero
    /* 7767C 8008767C FF004230 */  andi       $v0, $v0, 0xFF
    /* 77680 80087680 05004014 */  bnez       $v0, .L80087698
    /* 77684 80087684 21200000 */   addu      $a0, $zero, $zero
    /* 77688 80087688 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 7768C 8008768C 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77690 80087690 A583000C */  jal        DBG_Error
    /* 77694 80087694 13010624 */   addiu     $a2, $zero, 0x113
  .L80087698:
    /* 77698 80087698 E08D000C */  jal        asyncstructsize
    /* 7769C 8008769C 0A000424 */   addiu     $a0, $zero, 0xA
    /* 776A0 800876A0 AA20020C */  jal        Tmalloc__Fi
    /* 776A4 800876A4 21204000 */   addu      $a0, $v0, $zero
    /* 776A8 800876A8 21804000 */  addu       $s0, $v0, $zero
    /* 776AC 800876AC 07000016 */  bnez       $s0, .L800876CC
    /* 776B0 800876B0 21200002 */   addu      $a0, $s0, $zero
    /* 776B4 800876B4 21200000 */  addu       $a0, $zero, $zero
    /* 776B8 800876B8 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 776BC 800876BC 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 776C0 800876C0 A583000C */  jal        DBG_Error
    /* 776C4 800876C4 18010624 */   addiu     $a2, $zero, 0x118
    /* 776C8 800876C8 21200002 */  addu       $a0, $s0, $zero
  .L800876CC:
    /* 776CC 800876CC 0A000524 */  addiu      $a1, $zero, 0xA
    /* 776D0 800876D0 E68D000C */  jal        initasyncstruct
    /* 776D4 800876D4 00300624 */   addiu     $a2, $zero, 0x3000
    /* 776D8 800876D8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 776DC 800876DC 1800B28F */  lw         $s2, 0x18($sp)
    /* 776E0 800876E0 1400B18F */  lw         $s1, 0x14($sp)
    /* 776E4 800876E4 1000B08F */  lw         $s0, 0x10($sp)
    /* 776E8 800876E8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 776EC 800876EC 0800E003 */  jr         $ra
    /* 776F0 800876F0 00000000 */   nop
endlabel BL_LoadDirectory__Fv
