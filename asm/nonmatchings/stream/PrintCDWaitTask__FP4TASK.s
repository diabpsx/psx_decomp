.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintCDWaitTask__FP4TASK, 0x13C

glabel PrintCDWaitTask__FP4TASK
    /* 88988 80098988 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8898C 8009898C 21200000 */  addu       $a0, $zero, $zero
    /* 88990 80098990 3400BFAF */  sw         $ra, 0x34($sp)
    /* 88994 80098994 3000B4AF */  sw         $s4, 0x30($sp)
    /* 88998 80098998 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 8899C 8009899C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 889A0 800989A0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 889A4 800989A4 044F020C */  jal        GM_UseTexData__Fi
    /* 889A8 800989A8 2000B0AF */   sw        $s0, 0x20($sp)
    /* 889AC 800989AC 21A04000 */  addu       $s4, $v0, $zero
    /* 889B0 800989B0 0E80133C */  lui        $s3, %hi(plr + 0x1D)
    /* 889B4 800989B4 55A57326 */  addiu      $s3, $s3, %lo(plr + 0x1D)
    /* 889B8 800989B8 80001224 */  addiu      $s2, $zero, 0x80
  .L800989BC:
    /* 889BC 800989BC 6C06828F */  lw         $v0, %gp_rel(CDWAIT)($gp)
    /* 889C0 800989C0 00000000 */  nop
    /* 889C4 800989C4 32004010 */  beqz       $v0, .L80098A90
    /* 889C8 800989C8 00000000 */   nop
    /* 889CC 800989CC C80E020C */  jal        PRIM_FullScreen__Fi
    /* 889D0 800989D0 2C010424 */   addiu     $a0, $zero, 0x12C
    /* 889D4 800989D4 48068293 */  lbu        $v0, %gp_rel(D_8011ADC8)($gp)
    /* 889D8 800989D8 20010324 */  addiu      $v1, $zero, 0x120
    /* 889DC 800989DC 42100200 */  srl        $v0, $v0, 1
    /* 889E0 800989E0 01004224 */  addiu      $v0, $v0, 0x1
    /* 889E4 800989E4 01004230 */  andi       $v0, $v0, 0x1
    /* 889E8 800989E8 9291020C */  jal        IsGameLoading__Fv
    /* 889EC 800989EC 23806200 */   subu      $s0, $v1, $v0
    /* 889F0 800989F0 01004238 */  xori       $v0, $v0, 0x1
    /* 889F4 800989F4 10004010 */  beqz       $v0, .L80098A38
    /* 889F8 800989F8 D0001124 */   addiu     $s1, $zero, 0xD0
    /* 889FC 800989FC 1280023C */  lui        $v0, %hi(FeFlag)
    /* 88A00 80098A00 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 88A04 80098A04 00000000 */  nop
    /* 88A08 80098A08 0C004014 */  bnez       $v0, .L80098A3C
    /* 88A0C 80098A0C 21208002 */   addu      $a0, $s4, $zero
    /* 88A10 80098A10 1280023C */  lui        $v0, %hi(qtextflag)
    /* 88A14 80098A14 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 88A18 80098A18 00000000 */  nop
    /* 88A1C 80098A1C 08004014 */  bnez       $v0, .L80098A40
    /* 88A20 80098A20 FE010224 */   addiu     $v0, $zero, 0x1FE
    /* 88A24 80098A24 E8196292 */  lbu        $v0, 0x19E8($s3)
    /* 88A28 80098A28 00000000 */  nop
    /* 88A2C 80098A2C 04004010 */  beqz       $v0, .L80098A40
    /* 88A30 80098A30 FE010224 */   addiu     $v0, $zero, 0x1FE
    /* 88A34 80098A34 80FF1026 */  addiu      $s0, $s0, -0x80
  .L80098A38:
    /* 88A38 80098A38 21208002 */  addu       $a0, $s4, $zero
  .L80098A3C:
    /* 88A3C 80098A3C FE010224 */  addiu      $v0, $zero, 0x1FE
  .L80098A40:
    /* 88A40 80098A40 21280000 */  addu       $a1, $zero, $zero
    /* 88A44 80098A44 21300002 */  addu       $a2, $s0, $zero
    /* 88A48 80098A48 48068393 */  lbu        $v1, %gp_rel(D_8011ADC8)($gp)
    /* 88A4C 80098A4C 21382002 */  addu       $a3, $s1, $zero
    /* 88A50 80098A50 1400A2AF */  sw         $v0, 0x14($sp)
    /* 88A54 80098A54 1800A0AF */  sw         $zero, 0x18($sp)
    /* 88A58 80098A58 42180300 */  srl        $v1, $v1, 1
    /* 88A5C 80098A5C 01006330 */  andi       $v1, $v1, 0x1
    /* 88A60 80098A60 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 88A64 80098A64 1000A3AF */   sw        $v1, 0x10($sp)
    /* 88A68 80098A68 07004390 */  lbu        $v1, 0x7($v0)
    /* 88A6C 80098A6C 040052A0 */  sb         $s2, 0x4($v0)
    /* 88A70 80098A70 050052A0 */  sb         $s2, 0x5($v0)
    /* 88A74 80098A74 060052A0 */  sb         $s2, 0x6($v0)
    /* 88A78 80098A78 FE006330 */  andi       $v1, $v1, 0xFE
    /* 88A7C 80098A7C 070043A0 */  sb         $v1, 0x7($v0)
    /* 88A80 80098A80 48068293 */  lbu        $v0, %gp_rel(D_8011ADC8)($gp)
    /* 88A84 80098A84 00000000 */  nop
    /* 88A88 80098A88 01004224 */  addiu      $v0, $v0, 0x1
    /* 88A8C 80098A8C 480682A3 */  sb         $v0, %gp_rel(D_8011ADC8)($gp)
  .L80098A90:
    /* 88A90 80098A90 EE80000C */  jal        TSK_Sleep
    /* 88A94 80098A94 01000424 */   addiu     $a0, $zero, 0x1
    /* 88A98 80098A98 6F620208 */  j          .L800989BC
    /* 88A9C 80098A9C 00000000 */   nop
    /* 88AA0 80098AA0 3400BF8F */  lw         $ra, 0x34($sp)
    /* 88AA4 80098AA4 3000B48F */  lw         $s4, 0x30($sp)
    /* 88AA8 80098AA8 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 88AAC 80098AAC 2800B28F */  lw         $s2, 0x28($sp)
    /* 88AB0 80098AB0 2400B18F */  lw         $s1, 0x24($sp)
    /* 88AB4 80098AB4 2000B08F */  lw         $s0, 0x20($sp)
    /* 88AB8 80098AB8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 88ABC 80098ABC 0800E003 */  jr         $ra
    /* 88AC0 80098AC0 00000000 */   nop
endlabel PrintCDWaitTask__FP4TASK
