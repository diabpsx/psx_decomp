.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Guardian__Fi, 0x2B8

glabel MI_Guardian__Fi
    /* CC30 80146828 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* CC34 8014682C 2800B4AF */  sw         $s4, 0x28($sp)
    /* CC38 80146830 21A08000 */  addu       $s4, $a0, $zero
    /* CC3C 80146834 3800BEAF */  sw         $fp, 0x38($sp)
    /* CC40 80146838 21F00000 */  addu       $fp, $zero, $zero
    /* CC44 8014683C 3400B7AF */  sw         $s7, 0x34($sp)
    /* CC48 80146840 21B80000 */  addu       $s7, $zero, $zero
    /* CC4C 80146844 80101400 */  sll        $v0, $s4, 2
    /* CC50 80146848 21105400 */  addu       $v0, $v0, $s4
    /* CC54 8014684C 80100200 */  sll        $v0, $v0, 2
    /* CC58 80146850 23105400 */  subu       $v0, $v0, $s4
    /* CC5C 80146854 80100200 */  sll        $v0, $v0, 2
    /* CC60 80146858 1080033C */  lui        $v1, %hi(missile)
    /* CC64 8014685C 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* CC68 80146860 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* CC6C 80146864 21884300 */  addu       $s1, $v0, $v1
    /* CC70 80146868 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* CC74 8014686C 3000B6AF */  sw         $s6, 0x30($sp)
    /* CC78 80146870 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* CC7C 80146874 2400B3AF */  sw         $s3, 0x24($sp)
    /* CC80 80146878 2000B2AF */  sw         $s2, 0x20($sp)
    /* CC84 8014687C 1800B0AF */  sw         $s0, 0x18($sp)
    /* CC88 80146880 18002296 */  lhu        $v0, 0x18($s1)
    /* CC8C 80146884 20002386 */  lh         $v1, 0x20($s1)
    /* CC90 80146888 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* CC94 8014688C 180022A6 */  sh         $v0, 0x18($s1)
    /* CC98 80146890 03006018 */  blez       $v1, .L801468A0
    /* CC9C 80146894 21106000 */   addu      $v0, $v1, $zero
    /* CCA0 80146898 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* CCA4 8014689C 200022A6 */  sh         $v0, 0x20($s1)
  .L801468A0:
    /* CCA8 801468A0 18002396 */  lhu        $v1, 0x18($s1)
    /* CCAC 801468A4 1E002286 */  lh         $v0, 0x1E($s1)
    /* CCB0 801468A8 00000000 */  nop
    /* CCB4 801468AC 09006210 */  beq        $v1, $v0, .L801468D4
    /* CCB8 801468B0 02000224 */   addiu     $v0, $zero, 0x2
    /* CCBC 801468B4 3F002382 */  lb         $v1, 0x3F($s1)
    /* CCC0 801468B8 00000000 */  nop
    /* CCC4 801468BC 08006214 */  bne        $v1, $v0, .L801468E0
    /* CCC8 801468C0 00000000 */   nop
    /* CCCC 801468C4 20002286 */  lh         $v0, 0x20($s1)
    /* CCD0 801468C8 00000000 */  nop
    /* CCD4 801468CC 04004014 */  bnez       $v0, .L801468E0
    /* CCD8 801468D0 00000000 */   nop
  .L801468D4:
    /* CCDC 801468D4 21208002 */  addu       $a0, $s4, $zero
    /* CCE0 801468D8 09F5040C */  jal        SetMissDir__Fii
    /* CCE4 801468DC 01000524 */   addiu     $a1, $zero, 0x1
  .L801468E0:
    /* CCE8 801468E0 18002296 */  lhu        $v0, 0x18($s1)
    /* CCEC 801468E4 00000000 */  nop
    /* CCF0 801468E8 0F004230 */  andi       $v0, $v0, 0xF
    /* CCF4 801468EC 48004014 */  bnez       $v0, .L80146A10
    /* CCF8 801468F0 21180000 */   addu      $v1, $zero, $zero
    /* CCFC 801468F4 21B00000 */  addu       $s6, $zero, $zero
    /* CD00 801468F8 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* CD04 801468FC 0D80153C */  lui        $s5, %hi(vCrawlTable)
    /* CD08 80146900 1460B526 */  addiu      $s5, $s5, %lo(vCrawlTable)
  .L80146904:
    /* CD0C 80146904 42007310 */  beq        $v1, $s3, .L80146A10
    /* CD10 80146908 00000000 */   nop
    /* CD14 8014690C 0A001224 */  addiu      $s2, $zero, 0xA
  .L80146910:
    /* CD18 80146910 3B007310 */  beq        $v1, $s3, .L80146A00
    /* CD1C 80146914 2180B202 */   addu      $s0, $s5, $s2
    /* CD20 80146918 00000792 */  lbu        $a3, 0x0($s0)
    /* CD24 8014691C 00000000 */  nop
    /* CD28 80146920 0500E014 */  bnez       $a3, .L80146938
    /* CD2C 80146924 00000000 */   nop
    /* CD30 80146928 01000292 */  lbu        $v0, 0x1($s0)
    /* CD34 8014692C 00000000 */  nop
    /* CD38 80146930 33004010 */  beqz       $v0, .L80146A00
    /* CD3C 80146934 00000000 */   nop
  .L80146938:
    /* CD40 80146938 0500C717 */  bne        $fp, $a3, .L80146950
    /* CD44 8014693C 21208002 */   addu      $a0, $s4, $zero
    /* CD48 80146940 01000292 */  lbu        $v0, 0x1($s0)
    /* CD4C 80146944 00000000 */  nop
    /* CD50 80146948 2A00E212 */  beq        $s7, $v0, .L801469F4
    /* CD54 8014694C 00000000 */   nop
  .L80146950:
    /* CD58 80146950 31002582 */  lb         $a1, 0x31($s1)
    /* CD5C 80146954 32002282 */  lb         $v0, 0x32($s1)
    /* CD60 80146958 01000692 */  lbu        $a2, 0x1($s0)
    /* CD64 8014695C 2128A700 */  addu       $a1, $a1, $a3
    /* CD68 80146960 A40B050C */  jal        Sentfire__Fiii
    /* CD6C 80146964 21304600 */   addu      $a2, $v0, $a2
    /* CD70 80146968 21184000 */  addu       $v1, $v0, $zero
    /* CD74 8014696C 24007310 */  beq        $v1, $s3, .L80146A00
    /* CD78 80146970 21208002 */   addu      $a0, $s4, $zero
    /* CD7C 80146974 31002382 */  lb         $v1, 0x31($s1)
    /* CD80 80146978 00000592 */  lbu        $a1, 0x0($s0)
    /* CD84 8014697C 32002282 */  lb         $v0, 0x32($s1)
    /* CD88 80146980 01000692 */  lbu        $a2, 0x1($s0)
    /* CD8C 80146984 23286500 */  subu       $a1, $v1, $a1
    /* CD90 80146988 A40B050C */  jal        Sentfire__Fiii
    /* CD94 8014698C 23304600 */   subu      $a2, $v0, $a2
    /* CD98 80146990 21184000 */  addu       $v1, $v0, $zero
    /* CD9C 80146994 1A007310 */  beq        $v1, $s3, .L80146A00
    /* CDA0 80146998 21208002 */   addu      $a0, $s4, $zero
    /* CDA4 8014699C 31002382 */  lb         $v1, 0x31($s1)
    /* CDA8 801469A0 00000592 */  lbu        $a1, 0x0($s0)
    /* CDAC 801469A4 32002282 */  lb         $v0, 0x32($s1)
    /* CDB0 801469A8 01000692 */  lbu        $a2, 0x1($s0)
    /* CDB4 801469AC 21286500 */  addu       $a1, $v1, $a1
    /* CDB8 801469B0 A40B050C */  jal        Sentfire__Fiii
    /* CDBC 801469B4 23304600 */   subu      $a2, $v0, $a2
    /* CDC0 801469B8 21184000 */  addu       $v1, $v0, $zero
    /* CDC4 801469BC 10007310 */  beq        $v1, $s3, .L80146A00
    /* CDC8 801469C0 21208002 */   addu      $a0, $s4, $zero
    /* CDCC 801469C4 31002382 */  lb         $v1, 0x31($s1)
    /* CDD0 801469C8 00000592 */  lbu        $a1, 0x0($s0)
    /* CDD4 801469CC 32002282 */  lb         $v0, 0x32($s1)
    /* CDD8 801469D0 01000692 */  lbu        $a2, 0x1($s0)
    /* CDDC 801469D4 23286500 */  subu       $a1, $v1, $a1
    /* CDE0 801469D8 A40B050C */  jal        Sentfire__Fiii
    /* CDE4 801469DC 21304600 */   addu      $a2, $v0, $a2
    /* CDE8 801469E0 21184000 */  addu       $v1, $v0, $zero
    /* CDEC 801469E4 06007310 */  beq        $v1, $s3, .L80146A00
    /* CDF0 801469E8 00000000 */   nop
    /* CDF4 801469EC 00001E92 */  lbu        $fp, 0x0($s0)
    /* CDF8 801469F0 01001792 */  lbu        $s7, 0x1($s0)
  .L801469F4:
    /* CDFC 801469F4 FEFF5226 */  addiu      $s2, $s2, -0x2
    /* CE00 801469F8 C5FF4106 */  bgez       $s2, .L80146910
    /* CE04 801469FC 00000000 */   nop
  .L80146A00:
    /* CE08 80146A00 0100D626 */  addiu      $s6, $s6, 0x1
    /* CE0C 80146A04 1700C22A */  slti       $v0, $s6, 0x17
    /* CE10 80146A08 BEFF4014 */  bnez       $v0, .L80146904
    /* CE14 80146A0C 1E00B526 */   addiu     $s5, $s5, 0x1E
  .L80146A10:
    /* CE18 80146A10 18002396 */  lhu        $v1, 0x18($s1)
    /* CE1C 80146A14 0E000224 */  addiu      $v0, $zero, 0xE
    /* CE20 80146A18 07006214 */  bne        $v1, $v0, .L80146A38
    /* CE24 80146A1C 21208002 */   addu      $a0, $s4, $zero
    /* CE28 80146A20 09F5040C */  jal        SetMissDir__Fii
    /* CE2C 80146A24 21280000 */   addu      $a1, $zero, $zero
    /* CE30 80146A28 0F000224 */  addiu      $v0, $zero, 0xF
    /* CE34 80146A2C 470022A2 */  sb         $v0, 0x47($s1)
    /* CE38 80146A30 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* CE3C 80146A34 460022A2 */  sb         $v0, 0x46($s1)
  .L80146A38:
    /* CE40 80146A38 46002292 */  lbu        $v0, 0x46($s1)
    /* CE44 80146A3C 22002396 */  lhu        $v1, 0x22($s1)
    /* CE48 80146A40 00160200 */  sll        $v0, $v0, 24
    /* CE4C 80146A44 03160200 */  sra        $v0, $v0, 24
    /* CE50 80146A48 21186200 */  addu       $v1, $v1, $v0
    /* CE54 80146A4C 220023A6 */  sh         $v1, 0x22($s1)
    /* CE58 80146A50 001C0300 */  sll        $v1, $v1, 16
    /* CE5C 80146A54 031C0300 */  sra        $v1, $v1, 16
    /* CE60 80146A58 10006228 */  slti       $v0, $v1, 0x10
    /* CE64 80146A5C 03004014 */  bnez       $v0, .L80146A6C
    /* CE68 80146A60 0F000224 */   addiu     $v0, $zero, 0xF
    /* CE6C 80146A64 A21A0508 */  j          .L80146A88
    /* CE70 80146A68 220022A6 */   sh        $v0, 0x22($s1)
  .L80146A6C:
    /* CE74 80146A6C 06006018 */  blez       $v1, .L80146A88
    /* CE78 80146A70 00000000 */   nop
    /* CE7C 80146A74 3E002482 */  lb         $a0, 0x3E($s1)
    /* CE80 80146A78 31002582 */  lb         $a1, 0x31($s1)
    /* CE84 80146A7C 32002682 */  lb         $a2, 0x32($s1)
    /* CE88 80146A80 F834010C */  jal        ChangeLight__Fiiii
    /* CE8C 80146A84 94000724 */   addiu     $a3, $zero, 0x94
  .L80146A88:
    /* CE90 80146A88 18002296 */  lhu        $v0, 0x18($s1)
    /* CE94 80146A8C 00000000 */  nop
    /* CE98 80146A90 04004014 */  bnez       $v0, .L80146AA4
    /* CE9C 80146A94 01000224 */   addiu     $v0, $zero, 0x1
    /* CEA0 80146A98 3E002482 */  lb         $a0, 0x3E($s1)
    /* CEA4 80146A9C D034010C */  jal        AddUnLight__Fi
    /* CEA8 80146AA0 380022A2 */   sb        $v0, 0x38($s1)
  .L80146AA4:
    /* CEAC 80146AA4 D1EA040C */  jal        PutMissile__Fi
    /* CEB0 80146AA8 21208002 */   addu      $a0, $s4, $zero
    /* CEB4 80146AAC 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* CEB8 80146AB0 3800BE8F */  lw         $fp, 0x38($sp)
    /* CEBC 80146AB4 3400B78F */  lw         $s7, 0x34($sp)
    /* CEC0 80146AB8 3000B68F */  lw         $s6, 0x30($sp)
    /* CEC4 80146ABC 2C00B58F */  lw         $s5, 0x2C($sp)
    /* CEC8 80146AC0 2800B48F */  lw         $s4, 0x28($sp)
    /* CECC 80146AC4 2400B38F */  lw         $s3, 0x24($sp)
    /* CED0 80146AC8 2000B28F */  lw         $s2, 0x20($sp)
    /* CED4 80146ACC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* CED8 80146AD0 1800B08F */  lw         $s0, 0x18($sp)
    /* CEDC 80146AD4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* CEE0 80146AD8 0800E003 */  jr         $ra
    /* CEE4 80146ADC 00000000 */   nop
endlabel MI_Guardian__Fi
