.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoQuitMessage__14CPauseMessages, 0x120

glabel DoQuitMessage__14CPauseMessages
    /* 789B4 800889B4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 789B8 800889B8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 789BC 800889BC 21908000 */  addu       $s2, $a0, $zero
    /* 789C0 800889C0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 789C4 800889C4 21A00000 */  addu       $s4, $zero, $zero
    /* 789C8 800889C8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 789CC 800889CC 21980000 */  addu       $s3, $zero, $zero
    /* 789D0 800889D0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 789D4 800889D4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 789D8 800889D8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 789DC 800889DC 0400428E */  lw         $v0, 0x4($s2)
    /* 789E0 800889E0 01001124 */  addiu      $s1, $zero, 0x1
    /* 789E4 800889E4 10004484 */  lh         $a0, 0x10($v0)
    /* 789E8 800889E8 1400428C */  lw         $v0, 0x14($v0)
    /* 789EC 800889EC 00000000 */  nop
    /* 789F0 800889F0 09F84000 */  jalr       $v0
    /* 789F4 800889F4 21204402 */   addu      $a0, $s2, $a0
  .L800889F8:
    /* 789F8 800889F8 25006016 */  bnez       $s3, .L80088A90
    /* 789FC 800889FC 21282002 */   addu      $a1, $s1, $zero
    /* 78A00 80088A00 0400428E */  lw         $v0, 0x4($s2)
    /* 78A04 80088A04 00000000 */  nop
    /* 78A08 80088A08 18004484 */  lh         $a0, 0x18($v0)
    /* 78A0C 80088A0C 1C00428C */  lw         $v0, 0x1C($v0)
    /* 78A10 80088A10 00000000 */  nop
    /* 78A14 80088A14 09F84000 */  jalr       $v0
    /* 78A18 80088A18 21204402 */   addu      $a0, $s2, $a0
    /* 78A1C 80088A1C EE80000C */  jal        TSK_Sleep
    /* 78A20 80088A20 01000424 */   addiu     $a0, $zero, 0x1
    /* 78A24 80088A24 0000448E */  lw         $a0, 0x0($s2)
    /* 78A28 80088A28 FD25020C */  jal        PAD_GetPad__FiUc
    /* 78A2C 80088A2C 01000524 */   addiu     $a1, $zero, 0x1
    /* 78A30 80088A30 2B25020C */  jal        GetDown__C4CPad_800894ac
    /* 78A34 80088A34 21204000 */   addu      $a0, $v0, $zero
    /* 78A38 80088A38 21804000 */  addu       $s0, $v0, $zero
    /* 78A3C 80088A3C 03000232 */  andi       $v0, $s0, 0x3
    /* 78A40 80088A40 05004010 */  beqz       $v0, .L80088A58
    /* 78A44 80088A44 50000232 */   andi      $v0, $s0, 0x50
    /* 78A48 80088A48 C6F5000C */  jal        PlaySFX__Fi
    /* 78A4C 80088A4C 32000424 */   addiu     $a0, $zero, 0x32
    /* 78A50 80088A50 0100312E */  sltiu      $s1, $s1, 0x1
    /* 78A54 80088A54 50000232 */  andi       $v0, $s0, 0x50
  .L80088A58:
    /* 78A58 80088A58 06004010 */  beqz       $v0, .L80088A74
    /* 78A5C 80088A5C 00010232 */   andi      $v0, $s0, 0x100
    /* 78A60 80088A60 C6F5000C */  jal        PlaySFX__Fi
    /* 78A64 80088A64 33000424 */   addiu     $a0, $zero, 0x33
    /* 78A68 80088A68 01001324 */  addiu      $s3, $zero, 0x1
    /* 78A6C 80088A6C 7E220208 */  j          .L800889F8
    /* 78A70 80088A70 0100342E */   sltiu     $s4, $s1, 0x1
  .L80088A74:
    /* 78A74 80088A74 E0FF4010 */  beqz       $v0, .L800889F8
    /* 78A78 80088A78 00000000 */   nop
    /* 78A7C 80088A7C C6F5000C */  jal        PlaySFX__Fi
    /* 78A80 80088A80 33000424 */   addiu     $a0, $zero, 0x33
    /* 78A84 80088A84 01001324 */  addiu      $s3, $zero, 0x1
    /* 78A88 80088A88 7E220208 */  j          .L800889F8
    /* 78A8C 80088A8C 21A00000 */   addu      $s4, $zero, $zero
  .L80088A90:
    /* 78A90 80088A90 0400428E */  lw         $v0, 0x4($s2)
    /* 78A94 80088A94 00000000 */  nop
    /* 78A98 80088A98 20004484 */  lh         $a0, 0x20($v0)
    /* 78A9C 80088A9C 2400428C */  lw         $v0, 0x24($v0)
    /* 78AA0 80088AA0 00000000 */  nop
    /* 78AA4 80088AA4 09F84000 */  jalr       $v0
    /* 78AA8 80088AA8 21204402 */   addu      $a0, $s2, $a0
    /* 78AAC 80088AAC 21108002 */  addu       $v0, $s4, $zero
    /* 78AB0 80088AB0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 78AB4 80088AB4 2000B48F */  lw         $s4, 0x20($sp)
    /* 78AB8 80088AB8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 78ABC 80088ABC 1800B28F */  lw         $s2, 0x18($sp)
    /* 78AC0 80088AC0 1400B18F */  lw         $s1, 0x14($sp)
    /* 78AC4 80088AC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 78AC8 80088AC8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 78ACC 80088ACC 0800E003 */  jr         $ra
    /* 78AD0 80088AD0 00000000 */   nop
endlabel DoQuitMessage__14CPauseMessages
