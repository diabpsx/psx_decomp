.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001EBA4, 0xF3C

glabel func_8001EBA4
    /* EBA4 8001EBA4 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* EBA8 8001EBA8 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* EBAC 8001EBAC 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* EBB0 8001EBB0 3800B7AF */  sw         $s7, 0x38($sp)
    /* EBB4 8001EBB4 3400B6AF */  sw         $s6, 0x34($sp)
    /* EBB8 8001EBB8 3000B5AF */  sw         $s5, 0x30($sp)
    /* EBBC 8001EBBC 2C00B4AF */  sw         $s4, 0x2C($sp)
    /* EBC0 8001EBC0 0B80103C */  lui        $s0, %hi(D_800B633C)
    /* EBC4 8001EBC4 3C63108E */  lw         $s0, %lo(D_800B633C)($s0)
    /* EBC8 8001EBC8 1280183C */  lui        $t8, %hi(D_8011C944)
    /* EBCC 8001EBCC 2800B3AF */  sw         $s3, 0x28($sp)
    /* EBD0 8001EBD0 2400B2AF */  sw         $s2, 0x24($sp)
    /* EBD4 8001EBD4 2000B1AF */  sw         $s1, 0x20($sp)
    /* EBD8 8001EBD8 4800A0AF */  sw         $zero, 0x48($sp)
    /* EBDC 8001EBDC 88000E24 */  addiu      $t6, $zero, 0x88
    /* EBE0 8001EBE0 44C91827 */  addiu      $t8, $t8, %lo(D_8011C944)
    /* EBE4 8001EBE4 80780400 */  sll        $t7, $a0, 2
    /* EBE8 8001EBE8 2110F801 */  addu       $v0, $t7, $t8
    /* EBEC 8001EBEC 0E000EA6 */  sh         $t6, 0xE($s0)
    /* EBF0 8001EBF0 0000488C */  lw         $t0, 0x0($v0)
    /* EBF4 8001EBF4 FF001924 */  addiu      $t9, $zero, 0xFF
    /* EBF8 8001EBF8 21B80000 */  addu       $s7, $zero, $zero
    /* EBFC 8001EBFC 03008014 */  bnez       $a0, .L8001EC0C
    /* EC00 8001EC00 000019A1 */   sb        $t9, 0x0($t0)
    /* EC04 8001EC04 02000010 */  b          .L8001EC10
    /* EC08 8001EC08 21880000 */   addu      $s1, $zero, $zero
  .L8001EC0C:
    /* EC0C 8001EC0C 00201124 */  addiu      $s1, $zero, 0x2000
  .L8001EC10:
    /* EC10 8001EC10 02002936 */  ori        $t1, $s1, 0x2
    /* EC14 8001EC14 80500400 */  sll        $t2, $a0, 2
    /* EC18 8001EC18 1280143C */  lui        $s4, %hi(D_8011C94C)
    /* EC1C 8001EC1C 0A0009A6 */  sh         $t1, 0xA($s0)
    /* EC20 8001EC20 21A08A02 */  addu       $s4, $s4, $t2
    /* EC24 8001EC24 4CC9948E */  lw         $s4, %lo(D_8011C94C)($s4)
    /* EC28 8001EC28 0000538C */  lw         $s3, 0x0($v0)
    /* EC2C 8001EC2C 00008B82 */  lb         $t3, 0x0($s4)
    /* EC30 8001EC30 01007326 */  addiu      $s3, $s3, 0x1
    /* EC34 8001EC34 04006011 */  beqz       $t3, .L8001EC48
    /* EC38 8001EC38 00000000 */   nop
    /* EC3C 8001EC3C 02008012 */  beqz       $s4, .L8001EC48
    /* EC40 8001EC40 00000000 */   nop
    /* EC44 8001EC44 FFFF1724 */  addiu      $s7, $zero, -0x1
  .L8001EC48:
    /* EC48 8001EC48 00000092 */  lbu        $zero, 0x0($s0)
    /* EC4C 8001EC4C 01009426 */  addiu      $s4, $s4, 0x1
    /* EC50 8001EC50 4000A2AF */  sw         $v0, 0x40($sp)
    /* EC54 8001EC54 DA7A000C */  jal        func_8001EB68
    /* EC58 8001EC58 28000424 */   addiu     $a0, $zero, 0x28
    /* EC5C 8001EC5C 03102C36 */  ori        $t4, $s1, 0x1003
    /* EC60 8001EC60 0A000CA6 */  sh         $t4, 0xA($s0)
    /* EC64 8001EC64 1280013C */  lui        $at, %hi(D_8011C91C)
    /* EC68 8001EC68 1CC931AC */  sw         $s1, %lo(D_8011C91C)($at)
    /* EC6C 8001EC6C 04000D96 */  lhu        $t5, 0x4($s0)
    /* EC70 8001EC70 00000000 */  nop
    /* EC74 8001EC74 0100AE31 */  andi       $t6, $t5, 0x1
    /* EC78 8001EC78 0700C015 */  bnez       $t6, .L8001EC98
    /* EC7C 8001EC7C 01001924 */   addiu     $t9, $zero, 0x1
  .L8001EC80:
    /* EC80 8001EC80 04000F96 */  lhu        $t7, 0x4($s0)
    /* EC84 8001EC84 00000000 */  nop
    /* EC88 8001EC88 0100F831 */  andi       $t8, $t7, 0x1
    /* EC8C 8001EC8C FCFF0013 */  beqz       $t8, .L8001EC80
    /* EC90 8001EC90 00000000 */   nop
    /* EC94 8001EC94 01001924 */  addiu      $t9, $zero, 0x1
  .L8001EC98:
    /* EC98 8001EC98 000019A2 */  sb         $t9, 0x0($s0)
    /* EC9C 8001EC9C DA7A000C */  jal        func_8001EB68
    /* ECA0 8001ECA0 14000424 */   addiu     $a0, $zero, 0x14
    /* ECA4 8001ECA4 0A000896 */  lhu        $t0, 0xA($s0)
    /* ECA8 8001ECA8 0B80113C */  lui        $s1, %hi(D_800B6340)
    /* ECAC 8001ECAC 4063318E */  lw         $s1, %lo(D_800B6340)($s1)
    /* ECB0 8001ECB0 10000935 */  ori        $t1, $t0, 0x10
    /* ECB4 8001ECB4 7FFF1624 */  addiu      $s6, $zero, -0x81
    /* ECB8 8001ECB8 0A0009A6 */  sh         $t1, 0xA($s0)
    /* ECBC 8001ECBC 000036AE */  sw         $s6, 0x0($s1)
    /* ECC0 8001ECC0 4800A0AF */  sw         $zero, 0x48($sp)
    /* ECC4 8001ECC4 04000A96 */  lhu        $t2, 0x4($s0)
    /* ECC8 8001ECC8 00000000 */  nop
    /* ECCC 8001ECCC 02004B31 */  andi       $t3, $t2, 0x2
    /* ECD0 8001ECD0 06006015 */  bnez       $t3, .L8001ECEC
    /* ECD4 8001ECD4 00000000 */   nop
  .L8001ECD8:
    /* ECD8 8001ECD8 04000C96 */  lhu        $t4, 0x4($s0)
    /* ECDC 8001ECDC 00000000 */  nop
    /* ECE0 8001ECE0 02008D31 */  andi       $t5, $t4, 0x2
    /* ECE4 8001ECE4 FCFFA011 */  beqz       $t5, .L8001ECD8
    /* ECE8 8001ECE8 00000000 */   nop
  .L8001ECEC:
    /* ECEC 8001ECEC 00000092 */  lbu        $zero, 0x0($s0)
    /* ECF0 8001ECF0 DA7A000C */  jal        func_8001EB68
    /* ECF4 8001ECF4 28000424 */   addiu     $a0, $zero, 0x28
    /* ECF8 8001ECF8 00002E8E */  lw         $t6, 0x0($s1)
    /* ECFC 8001ECFC 00000000 */  nop
    /* ED00 8001ED00 8000CF31 */  andi       $t7, $t6, 0x80
    /* ED04 8001ED04 0D00E015 */  bnez       $t7, .L8001ED3C
    /* ED08 8001ED08 00000000 */   nop
    /* ED0C 8001ED0C 4800A28F */  lw         $v0, 0x48($sp)
  .L8001ED10:
    /* ED10 8001ED10 4800B88F */  lw         $t8, 0x48($sp)
    /* ED14 8001ED14 51004228 */  slti       $v0, $v0, 0x51
    /* ED18 8001ED18 01004238 */  xori       $v0, $v0, 0x1
    /* ED1C 8001ED1C 01001927 */  addiu      $t9, $t8, 0x1
    /* ED20 8001ED20 24034014 */  bnez       $v0, .L8001F9B4
    /* ED24 8001ED24 4800B9AF */   sw        $t9, 0x48($sp)
    /* ED28 8001ED28 0000288E */  lw         $t0, 0x0($s1)
    /* ED2C 8001ED2C 00000000 */  nop
    /* ED30 8001ED30 80000931 */  andi       $t1, $t0, 0x80
    /* ED34 8001ED34 F6FF2011 */  beqz       $t1, .L8001ED10
    /* ED38 8001ED38 4800A28F */   lw        $v0, 0x48($sp)
  .L8001ED3C:
    /* ED3C 8001ED3C 4800A0AF */  sw         $zero, 0x48($sp)
    /* ED40 8001ED40 04000A96 */  lhu        $t2, 0x4($s0)
    /* ED44 8001ED44 80001224 */  addiu      $s2, $zero, 0x80
    /* ED48 8001ED48 80004B31 */  andi       $t3, $t2, 0x80
    /* ED4C 8001ED4C 0E004B16 */  bne        $s2, $t3, .L8001ED88
    /* ED50 8001ED50 42001824 */   addiu     $t8, $zero, 0x42
    /* ED54 8001ED54 4800A28F */  lw         $v0, 0x48($sp)
  .L8001ED58:
    /* ED58 8001ED58 4800AC8F */  lw         $t4, 0x48($sp)
    /* ED5C 8001ED5C 10004228 */  slti       $v0, $v0, 0x10
    /* ED60 8001ED60 01004238 */  xori       $v0, $v0, 0x1
    /* ED64 8001ED64 01008D25 */  addiu      $t5, $t4, 0x1
    /* ED68 8001ED68 12034014 */  bnez       $v0, .L8001F9B4
    /* ED6C 8001ED6C 4800ADAF */   sw        $t5, 0x48($sp)
    /* ED70 8001ED70 04000E96 */  lhu        $t6, 0x4($s0)
    /* ED74 8001ED74 00000000 */  nop
    /* ED78 8001ED78 8000CF31 */  andi       $t7, $t6, 0x80
    /* ED7C 8001ED7C F6FF4F12 */  beq        $s2, $t7, .L8001ED58
    /* ED80 8001ED80 4800A28F */   lw        $v0, 0x48($sp)
    /* ED84 8001ED84 42001824 */  addiu      $t8, $zero, 0x42
  .L8001ED88:
    /* ED88 8001ED88 000018A2 */  sb         $t8, 0x0($s0)
    /* ED8C 8001ED8C DA7A000C */  jal        func_8001EB68
    /* ED90 8001ED90 19000424 */   addiu     $a0, $zero, 0x19
    /* ED94 8001ED94 0A001996 */  lhu        $t9, 0xA($s0)
    /* ED98 8001ED98 00000000 */  nop
    /* ED9C 8001ED9C 10002837 */  ori        $t0, $t9, 0x10
    /* EDA0 8001EDA0 0A0008A6 */  sh         $t0, 0xA($s0)
    /* EDA4 8001EDA4 000036AE */  sw         $s6, 0x0($s1)
    /* EDA8 8001EDA8 4800A0AF */  sw         $zero, 0x48($sp)
    /* EDAC 8001EDAC 04000996 */  lhu        $t1, 0x4($s0)
    /* EDB0 8001EDB0 00000000 */  nop
    /* EDB4 8001EDB4 02002A31 */  andi       $t2, $t1, 0x2
    /* EDB8 8001EDB8 06004015 */  bnez       $t2, .L8001EDD4
    /* EDBC 8001EDBC 00000000 */   nop
  .L8001EDC0:
    /* EDC0 8001EDC0 04000B96 */  lhu        $t3, 0x4($s0)
    /* EDC4 8001EDC4 00000000 */  nop
    /* EDC8 8001EDC8 02006C31 */  andi       $t4, $t3, 0x2
    /* EDCC 8001EDCC FCFF8011 */  beqz       $t4, .L8001EDC0
    /* EDD0 8001EDD0 00000000 */   nop
  .L8001EDD4:
    /* EDD4 8001EDD4 00000292 */  lbu        $v0, 0x0($s0)
    /* EDD8 8001EDD8 01007326 */  addiu      $s3, $s3, 0x1
    /* EDDC 8001EDDC 00160200 */  sll        $v0, $v0, 24
    /* EDE0 8001EDE0 03160200 */  sra        $v0, $v0, 24
    /* EDE4 8001EDE4 0F004330 */  andi       $v1, $v0, 0xF
    /* EDE8 8001EDE8 F0004430 */  andi       $a0, $v0, 0xF0
    /* EDEC 8001EDEC 006E0300 */  sll        $t5, $v1, 24
    /* EDF0 8001EDF0 00360400 */  sll        $a2, $a0, 24
    /* EDF4 8001EDF4 00AE0300 */  sll        $s5, $v1, 24
    /* EDF8 8001EDF8 03760D00 */  sra        $t6, $t5, 24
    /* EDFC 8001EDFC FFFF62A2 */  sb         $v0, -0x1($s3)
    /* EE00 8001EE00 03360600 */  sra        $a2, $a2, 24
    /* EE04 8001EE04 0200C015 */  bnez       $t6, .L8001EE10
    /* EE08 8001EE08 03AE1500 */   sra       $s5, $s5, 24
    /* EE0C 8001EE0C 10001524 */  addiu      $s5, $zero, 0x10
  .L8001EE10:
    /* EE10 8001EE10 001E0400 */  sll        $v1, $a0, 24
    /* EE14 8001EE14 031E0300 */  sra        $v1, $v1, 24
    /* EE18 8001EE18 80000524 */  addiu      $a1, $zero, 0x80
    /* EE1C 8001EE1C 80006330 */  andi       $v1, $v1, 0x80
    /* EE20 8001EE20 0300A314 */  bne        $a1, $v1, .L8001EE30
    /* EE24 8001EE24 00000000 */   nop
    /* EE28 8001EE28 22000F24 */  addiu      $t7, $zero, 0x22
    /* EE2C 8001EE2C 0E000FA6 */  sh         $t7, 0xE($s0)
  .L8001EE30:
    /* EE30 8001EE30 0000388E */  lw         $t8, 0x0($s1)
    /* EE34 8001EE34 00000000 */  nop
    /* EE38 8001EE38 80001933 */  andi       $t9, $t8, 0x80
    /* EE3C 8001EE3C 0D002017 */  bnez       $t9, .L8001EE74
    /* EE40 8001EE40 00000000 */   nop
    /* EE44 8001EE44 4800A28F */  lw         $v0, 0x48($sp)
  .L8001EE48:
    /* EE48 8001EE48 4800A88F */  lw         $t0, 0x48($sp)
    /* EE4C 8001EE4C 51004228 */  slti       $v0, $v0, 0x51
    /* EE50 8001EE50 01004238 */  xori       $v0, $v0, 0x1
    /* EE54 8001EE54 01000925 */  addiu      $t1, $t0, 0x1
    /* EE58 8001EE58 D6024014 */  bnez       $v0, .L8001F9B4
    /* EE5C 8001EE5C 4800A9AF */   sw        $t1, 0x48($sp)
    /* EE60 8001EE60 00002A8E */  lw         $t2, 0x0($s1)
    /* EE64 8001EE64 00000000 */  nop
    /* EE68 8001EE68 80004B31 */  andi       $t3, $t2, 0x80
    /* EE6C 8001EE6C F6FF6011 */  beqz       $t3, .L8001EE48
    /* EE70 8001EE70 4800A28F */   lw        $v0, 0x48($sp)
  .L8001EE74:
    /* EE74 8001EE74 4800A0AF */  sw         $zero, 0x48($sp)
    /* EE78 8001EE78 04000C96 */  lhu        $t4, 0x4($s0)
    /* EE7C 8001EE7C 00000000 */  nop
    /* EE80 8001EE80 80008D31 */  andi       $t5, $t4, 0x80
    /* EE84 8001EE84 0E004D16 */  bne        $s2, $t5, .L8001EEC0
    /* EE88 8001EE88 01000824 */   addiu     $t0, $zero, 0x1
    /* EE8C 8001EE8C 4800A28F */  lw         $v0, 0x48($sp)
  .L8001EE90:
    /* EE90 8001EE90 4800AE8F */  lw         $t6, 0x48($sp)
    /* EE94 8001EE94 10004228 */  slti       $v0, $v0, 0x10
    /* EE98 8001EE98 01004238 */  xori       $v0, $v0, 0x1
    /* EE9C 8001EE9C 0100CF25 */  addiu      $t7, $t6, 0x1
    /* EEA0 8001EEA0 C4024014 */  bnez       $v0, .L8001F9B4
    /* EEA4 8001EEA4 4800AFAF */   sw        $t7, 0x48($sp)
    /* EEA8 8001EEA8 04001896 */  lhu        $t8, 0x4($s0)
    /* EEAC 8001EEAC 00000000 */  nop
    /* EEB0 8001EEB0 80001933 */  andi       $t9, $t8, 0x80
    /* EEB4 8001EEB4 F6FF5912 */  beq        $s2, $t9, .L8001EE90
    /* EEB8 8001EEB8 4800A28F */   lw        $v0, 0x48($sp)
    /* EEBC 8001EEBC 01000824 */  addiu      $t0, $zero, 0x1
  .L8001EEC0:
    /* EEC0 8001EEC0 0600A310 */  beq        $a1, $v1, .L8001EEDC
    /* EEC4 8001EEC4 000008A2 */   sb        $t0, 0x0($s0)
    /* EEC8 8001EEC8 14000424 */  addiu      $a0, $zero, 0x14
    /* EECC 8001EECC DA7A000C */  jal        func_8001EB68
    /* EED0 8001EED0 6800A6A3 */   sb        $a2, 0x68($sp)
    /* EED4 8001EED4 6800A683 */  lb         $a2, 0x68($sp)
    /* EED8 8001EED8 80000524 */  addiu      $a1, $zero, 0x80
  .L8001EEDC:
    /* EEDC 8001EEDC 0A000996 */  lhu        $t1, 0xA($s0)
    /* EEE0 8001EEE0 00000000 */  nop
    /* EEE4 8001EEE4 10002A35 */  ori        $t2, $t1, 0x10
    /* EEE8 8001EEE8 0A000AA6 */  sh         $t2, 0xA($s0)
    /* EEEC 8001EEEC 000036AE */  sw         $s6, 0x0($s1)
    /* EEF0 8001EEF0 4800A0AF */  sw         $zero, 0x48($sp)
    /* EEF4 8001EEF4 04000B96 */  lhu        $t3, 0x4($s0)
    /* EEF8 8001EEF8 00000000 */  nop
    /* EEFC 8001EEFC 02006C31 */  andi       $t4, $t3, 0x2
    /* EF00 8001EF00 06008015 */  bnez       $t4, .L8001EF1C
    /* EF04 8001EF04 00000000 */   nop
  .L8001EF08:
    /* EF08 8001EF08 04000D96 */  lhu        $t5, 0x4($s0)
    /* EF0C 8001EF0C 00000000 */  nop
    /* EF10 8001EF10 0200AE31 */  andi       $t6, $t5, 0x2
    /* EF14 8001EF14 FCFFC011 */  beqz       $t6, .L8001EF08
    /* EF18 8001EF18 00000000 */   nop
  .L8001EF1C:
    /* EF1C 8001EF1C 00000292 */  lbu        $v0, 0x0($s0)
    /* EF20 8001EF20 5A000124 */  addiu      $at, $zero, 0x5A
    /* EF24 8001EF24 00160200 */  sll        $v0, $v0, 24
    /* EF28 8001EF28 03160200 */  sra        $v0, $v0, 24
    /* EF2C 8001EF2C A2024114 */  bne        $v0, $at, .L8001F9B8
    /* EF30 8001EF30 4000B98F */   lw        $t9, 0x40($sp)
    /* EF34 8001EF34 8000CF30 */  andi       $t7, $a2, 0x80
    /* EF38 8001EF38 9800AF10 */  beq        $a1, $t7, .L8001F19C
    /* EF3C 8001EF3C 88000C24 */   addiu     $t4, $zero, 0x88
    /* EF40 8001EF40 9502A01A */  blez       $s5, .L8001F998
    /* EF44 8001EF44 4000AD8F */   lw        $t5, 0x40($sp)
  .L8001EF48:
    /* EF48 8001EF48 0000388E */  lw         $t8, 0x0($s1)
    /* EF4C 8001EF4C 00000000 */  nop
    /* EF50 8001EF50 80001933 */  andi       $t9, $t8, 0x80
    /* EF54 8001EF54 0D002017 */  bnez       $t9, .L8001EF8C
    /* EF58 8001EF58 00000000 */   nop
    /* EF5C 8001EF5C 4800A28F */  lw         $v0, 0x48($sp)
  .L8001EF60:
    /* EF60 8001EF60 4800A88F */  lw         $t0, 0x48($sp)
    /* EF64 8001EF64 51004228 */  slti       $v0, $v0, 0x51
    /* EF68 8001EF68 01004238 */  xori       $v0, $v0, 0x1
    /* EF6C 8001EF6C 01000925 */  addiu      $t1, $t0, 0x1
    /* EF70 8001EF70 90024014 */  bnez       $v0, .L8001F9B4
    /* EF74 8001EF74 4800A9AF */   sw        $t1, 0x48($sp)
    /* EF78 8001EF78 00002A8E */  lw         $t2, 0x0($s1)
    /* EF7C 8001EF7C 00000000 */  nop
    /* EF80 8001EF80 80004B31 */  andi       $t3, $t2, 0x80
    /* EF84 8001EF84 F6FF6011 */  beqz       $t3, .L8001EF60
    /* EF88 8001EF88 4800A28F */   lw        $v0, 0x48($sp)
  .L8001EF8C:
    /* EF8C 8001EF8C 4800A0AF */  sw         $zero, 0x48($sp)
    /* EF90 8001EF90 04000C96 */  lhu        $t4, 0x4($s0)
    /* EF94 8001EF94 00000000 */  nop
    /* EF98 8001EF98 80008D31 */  andi       $t5, $t4, 0x80
    /* EF9C 8001EF9C 0D004D16 */  bne        $s2, $t5, .L8001EFD4
    /* EFA0 8001EFA0 00000000 */   nop
    /* EFA4 8001EFA4 4800A28F */  lw         $v0, 0x48($sp)
  .L8001EFA8:
    /* EFA8 8001EFA8 4800AE8F */  lw         $t6, 0x48($sp)
    /* EFAC 8001EFAC 10004228 */  slti       $v0, $v0, 0x10
    /* EFB0 8001EFB0 01004238 */  xori       $v0, $v0, 0x1
    /* EFB4 8001EFB4 0100CF25 */  addiu      $t7, $t6, 0x1
    /* EFB8 8001EFB8 7E024014 */  bnez       $v0, .L8001F9B4
    /* EFBC 8001EFBC 4800AFAF */   sw        $t7, 0x48($sp)
    /* EFC0 8001EFC0 04001896 */  lhu        $t8, 0x4($s0)
    /* EFC4 8001EFC4 00000000 */  nop
    /* EFC8 8001EFC8 80001933 */  andi       $t9, $t8, 0x80
    /* EFCC 8001EFCC F6FF5912 */  beq        $s2, $t9, .L8001EFA8
    /* EFD0 8001EFD0 4800A28F */   lw        $v0, 0x48($sp)
  .L8001EFD4:
    /* EFD4 8001EFD4 00008882 */  lb         $t0, 0x0($s4)
    /* EFD8 8001EFD8 01009426 */  addiu      $s4, $s4, 0x1
    /* EFDC 8001EFDC 24481701 */  and        $t1, $t0, $s7
    /* EFE0 8001EFE0 000009A2 */  sb         $t1, 0x0($s0)
    /* EFE4 8001EFE4 DA7A000C */  jal        func_8001EB68
    /* EFE8 8001EFE8 0A000424 */   addiu     $a0, $zero, 0xA
    /* EFEC 8001EFEC 0A000A96 */  lhu        $t2, 0xA($s0)
    /* EFF0 8001EFF0 00000000 */  nop
    /* EFF4 8001EFF4 10004B35 */  ori        $t3, $t2, 0x10
    /* EFF8 8001EFF8 0A000BA6 */  sh         $t3, 0xA($s0)
    /* EFFC 8001EFFC 000036AE */  sw         $s6, 0x0($s1)
    /* F000 8001F000 4800A0AF */  sw         $zero, 0x48($sp)
    /* F004 8001F004 04000C96 */  lhu        $t4, 0x4($s0)
    /* F008 8001F008 00000000 */  nop
    /* F00C 8001F00C 02008D31 */  andi       $t5, $t4, 0x2
    /* F010 8001F010 1800A015 */  bnez       $t5, .L8001F074
    /* F014 8001F014 00000000 */   nop
  .L8001F018:
    /* F018 8001F018 00002E8E */  lw         $t6, 0x0($s1)
    /* F01C 8001F01C 00000000 */  nop
    /* F020 8001F020 8000CF31 */  andi       $t7, $t6, 0x80
    /* F024 8001F024 0E00E011 */  beqz       $t7, .L8001F060
    /* F028 8001F028 00000000 */   nop
    /* F02C 8001F02C 04001896 */  lhu        $t8, 0x4($s0)
    /* F030 8001F030 00000000 */  nop
    /* F034 8001F034 02001933 */  andi       $t9, $t8, 0x2
    /* F038 8001F038 06002017 */  bnez       $t9, .L8001F054
    /* F03C 8001F03C 00000000 */   nop
  .L8001F040:
    /* F040 8001F040 04000896 */  lhu        $t0, 0x4($s0)
    /* F044 8001F044 00000000 */  nop
    /* F048 8001F048 02000931 */  andi       $t1, $t0, 0x2
    /* F04C 8001F04C FCFF2011 */  beqz       $t1, .L8001F040
    /* F050 8001F050 00000000 */   nop
  .L8001F054:
    /* F054 8001F054 00000092 */  lbu        $zero, 0x0($s0)
    /* F058 8001F058 57020010 */  b          .L8001F9B8
    /* F05C 8001F05C 4000B98F */   lw        $t9, 0x40($sp)
  .L8001F060:
    /* F060 8001F060 04000A96 */  lhu        $t2, 0x4($s0)
    /* F064 8001F064 00000000 */  nop
    /* F068 8001F068 02004B31 */  andi       $t3, $t2, 0x2
    /* F06C 8001F06C EAFF6011 */  beqz       $t3, .L8001F018
    /* F070 8001F070 00000000 */   nop
  .L8001F074:
    /* F074 8001F074 00000292 */  lbu        $v0, 0x0($s0)
    /* F078 8001F078 01007326 */  addiu      $s3, $s3, 0x1
    /* F07C 8001F07C 00160200 */  sll        $v0, $v0, 24
    /* F080 8001F080 03160200 */  sra        $v0, $v0, 24
    /* F084 8001F084 FFFF62A2 */  sb         $v0, -0x1($s3)
    /* F088 8001F088 00002C8E */  lw         $t4, 0x0($s1)
    /* F08C 8001F08C 00000000 */  nop
    /* F090 8001F090 80008D31 */  andi       $t5, $t4, 0x80
    /* F094 8001F094 0D00A015 */  bnez       $t5, .L8001F0CC
    /* F098 8001F098 00000000 */   nop
    /* F09C 8001F09C 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F0A0:
    /* F0A0 8001F0A0 4800AE8F */  lw         $t6, 0x48($sp)
    /* F0A4 8001F0A4 51004228 */  slti       $v0, $v0, 0x51
    /* F0A8 8001F0A8 01004238 */  xori       $v0, $v0, 0x1
    /* F0AC 8001F0AC 0100CF25 */  addiu      $t7, $t6, 0x1
    /* F0B0 8001F0B0 40024014 */  bnez       $v0, .L8001F9B4
    /* F0B4 8001F0B4 4800AFAF */   sw        $t7, 0x48($sp)
    /* F0B8 8001F0B8 0000388E */  lw         $t8, 0x0($s1)
    /* F0BC 8001F0BC 00000000 */  nop
    /* F0C0 8001F0C0 80001933 */  andi       $t9, $t8, 0x80
    /* F0C4 8001F0C4 F6FF2013 */  beqz       $t9, .L8001F0A0
    /* F0C8 8001F0C8 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F0CC:
    /* F0CC 8001F0CC 4800A0AF */  sw         $zero, 0x48($sp)
    /* F0D0 8001F0D0 04000896 */  lhu        $t0, 0x4($s0)
    /* F0D4 8001F0D4 00000000 */  nop
    /* F0D8 8001F0D8 80000931 */  andi       $t1, $t0, 0x80
    /* F0DC 8001F0DC 0D004916 */  bne        $s2, $t1, .L8001F114
    /* F0E0 8001F0E0 00000000 */   nop
    /* F0E4 8001F0E4 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F0E8:
    /* F0E8 8001F0E8 4800AA8F */  lw         $t2, 0x48($sp)
    /* F0EC 8001F0EC 10004228 */  slti       $v0, $v0, 0x10
    /* F0F0 8001F0F0 01004238 */  xori       $v0, $v0, 0x1
    /* F0F4 8001F0F4 01004B25 */  addiu      $t3, $t2, 0x1
    /* F0F8 8001F0F8 2E024014 */  bnez       $v0, .L8001F9B4
    /* F0FC 8001F0FC 4800ABAF */   sw        $t3, 0x48($sp)
    /* F100 8001F100 04000C96 */  lhu        $t4, 0x4($s0)
    /* F104 8001F104 00000000 */  nop
    /* F108 8001F108 80008D31 */  andi       $t5, $t4, 0x80
    /* F10C 8001F10C F6FF4D12 */  beq        $s2, $t5, .L8001F0E8
    /* F110 8001F110 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F114:
    /* F114 8001F114 00008E82 */  lb         $t6, 0x0($s4)
    /* F118 8001F118 01009426 */  addiu      $s4, $s4, 0x1
    /* F11C 8001F11C 2478D701 */  and        $t7, $t6, $s7
    /* F120 8001F120 00000FA2 */  sb         $t7, 0x0($s0)
    /* F124 8001F124 DA7A000C */  jal        func_8001EB68
    /* F128 8001F128 0A000424 */   addiu     $a0, $zero, 0xA
    /* F12C 8001F12C 0A001896 */  lhu        $t8, 0xA($s0)
    /* F130 8001F130 00000000 */  nop
    /* F134 8001F134 10001937 */  ori        $t9, $t8, 0x10
    /* F138 8001F138 0A0019A6 */  sh         $t9, 0xA($s0)
    /* F13C 8001F13C 000036AE */  sw         $s6, 0x0($s1)
    /* F140 8001F140 4800A0AF */  sw         $zero, 0x48($sp)
    /* F144 8001F144 04000896 */  lhu        $t0, 0x4($s0)
    /* F148 8001F148 00000000 */  nop
    /* F14C 8001F14C 02000931 */  andi       $t1, $t0, 0x2
    /* F150 8001F150 06002015 */  bnez       $t1, .L8001F16C
    /* F154 8001F154 00000000 */   nop
  .L8001F158:
    /* F158 8001F158 04000A96 */  lhu        $t2, 0x4($s0)
    /* F15C 8001F15C 00000000 */  nop
    /* F160 8001F160 02004B31 */  andi       $t3, $t2, 0x2
    /* F164 8001F164 FCFF6011 */  beqz       $t3, .L8001F158
    /* F168 8001F168 00000000 */   nop
  .L8001F16C:
    /* F16C 8001F16C 00000292 */  lbu        $v0, 0x0($s0)
    /* F170 8001F170 FFFFB526 */  addiu      $s5, $s5, -0x1
    /* F174 8001F174 00AE1500 */  sll        $s5, $s5, 24
    /* F178 8001F178 00160200 */  sll        $v0, $v0, 24
    /* F17C 8001F17C 03160200 */  sra        $v0, $v0, 24
    /* F180 8001F180 03AE1500 */  sra        $s5, $s5, 24
    /* F184 8001F184 000062A2 */  sb         $v0, 0x0($s3)
    /* F188 8001F188 6FFFA01E */  bgtz       $s5, .L8001EF48
    /* F18C 8001F18C 01007326 */   addiu     $s3, $s3, 0x1
    /* F190 8001F190 01020010 */  b          .L8001F998
    /* F194 8001F194 4000AD8F */   lw        $t5, 0x40($sp)
    /* F198 8001F198 88000C24 */  addiu      $t4, $zero, 0x88
  .L8001F19C:
    /* F19C 8001F19C 0E000CA6 */  sh         $t4, 0xE($s0)
    /* F1A0 8001F1A0 04000D24 */  addiu      $t5, $zero, 0x4
    /* F1A4 8001F1A4 6000ADA3 */  sb         $t5, 0x60($sp)
    /* F1A8 8001F1A8 0A001524 */  addiu      $s5, $zero, 0xA
  .L8001F1AC:
    /* F1AC 8001F1AC 00002E8E */  lw         $t6, 0x0($s1)
    /* F1B0 8001F1B0 00000000 */  nop
    /* F1B4 8001F1B4 8000CF31 */  andi       $t7, $t6, 0x80
    /* F1B8 8001F1B8 0D00E015 */  bnez       $t7, .L8001F1F0
    /* F1BC 8001F1BC 00000000 */   nop
    /* F1C0 8001F1C0 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F1C4:
    /* F1C4 8001F1C4 4800B88F */  lw         $t8, 0x48($sp)
    /* F1C8 8001F1C8 51004228 */  slti       $v0, $v0, 0x51
    /* F1CC 8001F1CC 01004238 */  xori       $v0, $v0, 0x1
    /* F1D0 8001F1D0 01001927 */  addiu      $t9, $t8, 0x1
    /* F1D4 8001F1D4 F7014014 */  bnez       $v0, .L8001F9B4
    /* F1D8 8001F1D8 4800B9AF */   sw        $t9, 0x48($sp)
    /* F1DC 8001F1DC 0000288E */  lw         $t0, 0x0($s1)
    /* F1E0 8001F1E0 00000000 */  nop
    /* F1E4 8001F1E4 80000931 */  andi       $t1, $t0, 0x80
    /* F1E8 8001F1E8 F6FF2011 */  beqz       $t1, .L8001F1C4
    /* F1EC 8001F1EC 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F1F0:
    /* F1F0 8001F1F0 4800A0AF */  sw         $zero, 0x48($sp)
    /* F1F4 8001F1F4 04000A96 */  lhu        $t2, 0x4($s0)
    /* F1F8 8001F1F8 00000000 */  nop
    /* F1FC 8001F1FC 80004B31 */  andi       $t3, $t2, 0x80
    /* F200 8001F200 0E004B16 */  bne        $s2, $t3, .L8001F23C
    /* F204 8001F204 42001824 */   addiu     $t8, $zero, 0x42
    /* F208 8001F208 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F20C:
    /* F20C 8001F20C 4800AC8F */  lw         $t4, 0x48($sp)
    /* F210 8001F210 10004228 */  slti       $v0, $v0, 0x10
    /* F214 8001F214 01004238 */  xori       $v0, $v0, 0x1
    /* F218 8001F218 01008D25 */  addiu      $t5, $t4, 0x1
    /* F21C 8001F21C E5014014 */  bnez       $v0, .L8001F9B4
    /* F220 8001F220 4800ADAF */   sw        $t5, 0x48($sp)
    /* F224 8001F224 04000E96 */  lhu        $t6, 0x4($s0)
    /* F228 8001F228 00000000 */  nop
    /* F22C 8001F22C 8000CF31 */  andi       $t7, $t6, 0x80
    /* F230 8001F230 F6FF4F12 */  beq        $s2, $t7, .L8001F20C
    /* F234 8001F234 4800A28F */   lw        $v0, 0x48($sp)
    /* F238 8001F238 42001824 */  addiu      $t8, $zero, 0x42
  .L8001F23C:
    /* F23C 8001F23C 000018A2 */  sb         $t8, 0x0($s0)
    /* F240 8001F240 DA7A000C */  jal        func_8001EB68
    /* F244 8001F244 2120A002 */   addu      $a0, $s5, $zero
    /* F248 8001F248 0A001996 */  lhu        $t9, 0xA($s0)
    /* F24C 8001F24C 01007326 */  addiu      $s3, $s3, 0x1
    /* F250 8001F250 10002837 */  ori        $t0, $t9, 0x10
    /* F254 8001F254 0A0008A6 */  sh         $t0, 0xA($s0)
    /* F258 8001F258 000036AE */  sw         $s6, 0x0($s1)
    /* F25C 8001F25C 4800A0AF */  sw         $zero, 0x48($sp)
    /* F260 8001F260 FFFF60A2 */  sb         $zero, -0x1($s3)
    /* F264 8001F264 04000996 */  lhu        $t1, 0x4($s0)
    /* F268 8001F268 00000000 */  nop
    /* F26C 8001F26C 02002A31 */  andi       $t2, $t1, 0x2
    /* F270 8001F270 06004015 */  bnez       $t2, .L8001F28C
    /* F274 8001F274 00000000 */   nop
  .L8001F278:
    /* F278 8001F278 04000B96 */  lhu        $t3, 0x4($s0)
    /* F27C 8001F27C 00000000 */  nop
    /* F280 8001F280 02006C31 */  andi       $t4, $t3, 0x2
    /* F284 8001F284 FCFF8011 */  beqz       $t4, .L8001F278
    /* F288 8001F288 00000000 */   nop
  .L8001F28C:
    /* F28C 8001F28C 00000292 */  lbu        $v0, 0x0($s0)
    /* F290 8001F290 01007326 */  addiu      $s3, $s3, 0x1
    /* F294 8001F294 00160200 */  sll        $v0, $v0, 24
    /* F298 8001F298 03160200 */  sra        $v0, $v0, 24
    /* F29C 8001F29C FFFF62A2 */  sb         $v0, -0x1($s3)
    /* F2A0 8001F2A0 00002D8E */  lw         $t5, 0x0($s1)
    /* F2A4 8001F2A4 00000000 */  nop
    /* F2A8 8001F2A8 8000AE31 */  andi       $t6, $t5, 0x80
    /* F2AC 8001F2AC 0D00C015 */  bnez       $t6, .L8001F2E4
    /* F2B0 8001F2B0 00000000 */   nop
    /* F2B4 8001F2B4 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F2B8:
    /* F2B8 8001F2B8 4800AF8F */  lw         $t7, 0x48($sp)
    /* F2BC 8001F2BC 51004228 */  slti       $v0, $v0, 0x51
    /* F2C0 8001F2C0 01004238 */  xori       $v0, $v0, 0x1
    /* F2C4 8001F2C4 0100F825 */  addiu      $t8, $t7, 0x1
    /* F2C8 8001F2C8 BA014014 */  bnez       $v0, .L8001F9B4
    /* F2CC 8001F2CC 4800B8AF */   sw        $t8, 0x48($sp)
    /* F2D0 8001F2D0 0000398E */  lw         $t9, 0x0($s1)
    /* F2D4 8001F2D4 00000000 */  nop
    /* F2D8 8001F2D8 80002833 */  andi       $t0, $t9, 0x80
    /* F2DC 8001F2DC F6FF0011 */  beqz       $t0, .L8001F2B8
    /* F2E0 8001F2E0 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F2E4:
    /* F2E4 8001F2E4 4800A0AF */  sw         $zero, 0x48($sp)
    /* F2E8 8001F2E8 04000996 */  lhu        $t1, 0x4($s0)
    /* F2EC 8001F2EC 00000000 */  nop
    /* F2F0 8001F2F0 80002A31 */  andi       $t2, $t1, 0x80
    /* F2F4 8001F2F4 0D004A16 */  bne        $s2, $t2, .L8001F32C
    /* F2F8 8001F2F8 00000000 */   nop
    /* F2FC 8001F2FC 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F300:
    /* F300 8001F300 4800AB8F */  lw         $t3, 0x48($sp)
    /* F304 8001F304 10004228 */  slti       $v0, $v0, 0x10
    /* F308 8001F308 01004238 */  xori       $v0, $v0, 0x1
    /* F30C 8001F30C 01006C25 */  addiu      $t4, $t3, 0x1
    /* F310 8001F310 A8014014 */  bnez       $v0, .L8001F9B4
    /* F314 8001F314 4800ACAF */   sw        $t4, 0x48($sp)
    /* F318 8001F318 04000D96 */  lhu        $t5, 0x4($s0)
    /* F31C 8001F31C 00000000 */  nop
    /* F320 8001F320 8000AE31 */  andi       $t6, $t5, 0x80
    /* F324 8001F324 F6FF4E12 */  beq        $s2, $t6, .L8001F300
    /* F328 8001F328 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F32C:
    /* F32C 8001F32C 000000A2 */  sb         $zero, 0x0($s0)
    /* F330 8001F330 DA7A000C */  jal        func_8001EB68
    /* F334 8001F334 2120A002 */   addu      $a0, $s5, $zero
    /* F338 8001F338 0A000F96 */  lhu        $t7, 0xA($s0)
    /* F33C 8001F33C 00000000 */  nop
    /* F340 8001F340 1000F835 */  ori        $t8, $t7, 0x10
    /* F344 8001F344 0A0018A6 */  sh         $t8, 0xA($s0)
    /* F348 8001F348 000036AE */  sw         $s6, 0x0($s1)
    /* F34C 8001F34C 4800A0AF */  sw         $zero, 0x48($sp)
    /* F350 8001F350 04001996 */  lhu        $t9, 0x4($s0)
    /* F354 8001F354 00000000 */  nop
    /* F358 8001F358 02002833 */  andi       $t0, $t9, 0x2
    /* F35C 8001F35C 06000015 */  bnez       $t0, .L8001F378
    /* F360 8001F360 00000000 */   nop
  .L8001F364:
    /* F364 8001F364 04000996 */  lhu        $t1, 0x4($s0)
    /* F368 8001F368 00000000 */  nop
    /* F36C 8001F36C 02002A31 */  andi       $t2, $t1, 0x2
    /* F370 8001F370 FCFF4011 */  beqz       $t2, .L8001F364
    /* F374 8001F374 00000000 */   nop
  .L8001F378:
    /* F378 8001F378 00000292 */  lbu        $v0, 0x0($s0)
    /* F37C 8001F37C 5A000124 */  addiu      $at, $zero, 0x5A
    /* F380 8001F380 00160200 */  sll        $v0, $v0, 24
    /* F384 8001F384 03160200 */  sra        $v0, $v0, 24
    /* F388 8001F388 03004110 */  beq        $v0, $at, .L8001F398
    /* F38C 8001F38C 00000000 */   nop
    /* F390 8001F390 FF000B24 */  addiu      $t3, $zero, 0xFF
    /* F394 8001F394 FEFF6BA2 */  sb         $t3, -0x2($s3)
  .L8001F398:
    /* F398 8001F398 00002C8E */  lw         $t4, 0x0($s1)
    /* F39C 8001F39C 00000000 */  nop
    /* F3A0 8001F3A0 80008D31 */  andi       $t5, $t4, 0x80
    /* F3A4 8001F3A4 0D00A015 */  bnez       $t5, .L8001F3DC
    /* F3A8 8001F3A8 00000000 */   nop
    /* F3AC 8001F3AC 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F3B0:
    /* F3B0 8001F3B0 4800AE8F */  lw         $t6, 0x48($sp)
    /* F3B4 8001F3B4 51004228 */  slti       $v0, $v0, 0x51
    /* F3B8 8001F3B8 01004238 */  xori       $v0, $v0, 0x1
    /* F3BC 8001F3BC 0100CF25 */  addiu      $t7, $t6, 0x1
    /* F3C0 8001F3C0 7C014014 */  bnez       $v0, .L8001F9B4
    /* F3C4 8001F3C4 4800AFAF */   sw        $t7, 0x48($sp)
    /* F3C8 8001F3C8 0000388E */  lw         $t8, 0x0($s1)
    /* F3CC 8001F3CC 00000000 */  nop
    /* F3D0 8001F3D0 80001933 */  andi       $t9, $t8, 0x80
    /* F3D4 8001F3D4 F6FF2013 */  beqz       $t9, .L8001F3B0
    /* F3D8 8001F3D8 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F3DC:
    /* F3DC 8001F3DC 4800A0AF */  sw         $zero, 0x48($sp)
    /* F3E0 8001F3E0 04000896 */  lhu        $t0, 0x4($s0)
    /* F3E4 8001F3E4 00000000 */  nop
    /* F3E8 8001F3E8 80000931 */  andi       $t1, $t0, 0x80
    /* F3EC 8001F3EC 0D004916 */  bne        $s2, $t1, .L8001F424
    /* F3F0 8001F3F0 00000000 */   nop
    /* F3F4 8001F3F4 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F3F8:
    /* F3F8 8001F3F8 4800AA8F */  lw         $t2, 0x48($sp)
    /* F3FC 8001F3FC 10004228 */  slti       $v0, $v0, 0x10
    /* F400 8001F400 01004238 */  xori       $v0, $v0, 0x1
    /* F404 8001F404 01004B25 */  addiu      $t3, $t2, 0x1
    /* F408 8001F408 6A014014 */  bnez       $v0, .L8001F9B4
    /* F40C 8001F40C 4800ABAF */   sw        $t3, 0x48($sp)
    /* F410 8001F410 04000C96 */  lhu        $t4, 0x4($s0)
    /* F414 8001F414 00000000 */  nop
    /* F418 8001F418 80008D31 */  andi       $t5, $t4, 0x80
    /* F41C 8001F41C F6FF4D12 */  beq        $s2, $t5, .L8001F3F8
    /* F420 8001F420 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F424:
    /* F424 8001F424 00008E82 */  lb         $t6, 0x0($s4)
    /* F428 8001F428 01009426 */  addiu      $s4, $s4, 0x1
    /* F42C 8001F42C 2478D701 */  and        $t7, $t6, $s7
    /* F430 8001F430 00000FA2 */  sb         $t7, 0x0($s0)
    /* F434 8001F434 DA7A000C */  jal        func_8001EB68
    /* F438 8001F438 2120A002 */   addu      $a0, $s5, $zero
    /* F43C 8001F43C 0A001896 */  lhu        $t8, 0xA($s0)
    /* F440 8001F440 00000000 */  nop
    /* F444 8001F444 10001937 */  ori        $t9, $t8, 0x10
    /* F448 8001F448 0A0019A6 */  sh         $t9, 0xA($s0)
    /* F44C 8001F44C 000036AE */  sw         $s6, 0x0($s1)
    /* F450 8001F450 4800A0AF */  sw         $zero, 0x48($sp)
    /* F454 8001F454 04000896 */  lhu        $t0, 0x4($s0)
    /* F458 8001F458 00000000 */  nop
    /* F45C 8001F45C 02000931 */  andi       $t1, $t0, 0x2
    /* F460 8001F460 06002015 */  bnez       $t1, .L8001F47C
    /* F464 8001F464 00000000 */   nop
  .L8001F468:
    /* F468 8001F468 04000A96 */  lhu        $t2, 0x4($s0)
    /* F46C 8001F46C 00000000 */  nop
    /* F470 8001F470 02004B31 */  andi       $t3, $t2, 0x2
    /* F474 8001F474 FCFF6011 */  beqz       $t3, .L8001F468
    /* F478 8001F478 00000000 */   nop
  .L8001F47C:
    /* F47C 8001F47C 00000292 */  lbu        $v0, 0x0($s0)
    /* F480 8001F480 01007326 */  addiu      $s3, $s3, 0x1
    /* F484 8001F484 00160200 */  sll        $v0, $v0, 24
    /* F488 8001F488 03160200 */  sra        $v0, $v0, 24
    /* F48C 8001F48C FFFF62A2 */  sb         $v0, -0x1($s3)
    /* F490 8001F490 00002C8E */  lw         $t4, 0x0($s1)
    /* F494 8001F494 00000000 */  nop
    /* F498 8001F498 80008D31 */  andi       $t5, $t4, 0x80
    /* F49C 8001F49C 0D00A015 */  bnez       $t5, .L8001F4D4
    /* F4A0 8001F4A0 00000000 */   nop
    /* F4A4 8001F4A4 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F4A8:
    /* F4A8 8001F4A8 4800AE8F */  lw         $t6, 0x48($sp)
    /* F4AC 8001F4AC 51004228 */  slti       $v0, $v0, 0x51
    /* F4B0 8001F4B0 01004238 */  xori       $v0, $v0, 0x1
    /* F4B4 8001F4B4 0100CF25 */  addiu      $t7, $t6, 0x1
    /* F4B8 8001F4B8 3E014014 */  bnez       $v0, .L8001F9B4
    /* F4BC 8001F4BC 4800AFAF */   sw        $t7, 0x48($sp)
    /* F4C0 8001F4C0 0000388E */  lw         $t8, 0x0($s1)
    /* F4C4 8001F4C4 00000000 */  nop
    /* F4C8 8001F4C8 80001933 */  andi       $t9, $t8, 0x80
    /* F4CC 8001F4CC F6FF2013 */  beqz       $t9, .L8001F4A8
    /* F4D0 8001F4D0 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F4D4:
    /* F4D4 8001F4D4 4800A0AF */  sw         $zero, 0x48($sp)
    /* F4D8 8001F4D8 04000896 */  lhu        $t0, 0x4($s0)
    /* F4DC 8001F4DC 00000000 */  nop
    /* F4E0 8001F4E0 80000931 */  andi       $t1, $t0, 0x80
    /* F4E4 8001F4E4 0D004916 */  bne        $s2, $t1, .L8001F51C
    /* F4E8 8001F4E8 00000000 */   nop
    /* F4EC 8001F4EC 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F4F0:
    /* F4F0 8001F4F0 4800AA8F */  lw         $t2, 0x48($sp)
    /* F4F4 8001F4F4 10004228 */  slti       $v0, $v0, 0x10
    /* F4F8 8001F4F8 01004238 */  xori       $v0, $v0, 0x1
    /* F4FC 8001F4FC 01004B25 */  addiu      $t3, $t2, 0x1
    /* F500 8001F500 2C014014 */  bnez       $v0, .L8001F9B4
    /* F504 8001F504 4800ABAF */   sw        $t3, 0x48($sp)
    /* F508 8001F508 04000C96 */  lhu        $t4, 0x4($s0)
    /* F50C 8001F50C 00000000 */  nop
    /* F510 8001F510 80008D31 */  andi       $t5, $t4, 0x80
    /* F514 8001F514 F6FF4D12 */  beq        $s2, $t5, .L8001F4F0
    /* F518 8001F518 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F51C:
    /* F51C 8001F51C 00008E82 */  lb         $t6, 0x0($s4)
    /* F520 8001F520 01009426 */  addiu      $s4, $s4, 0x1
    /* F524 8001F524 2478D701 */  and        $t7, $t6, $s7
    /* F528 8001F528 00000FA2 */  sb         $t7, 0x0($s0)
    /* F52C 8001F52C DA7A000C */  jal        func_8001EB68
    /* F530 8001F530 2120A002 */   addu      $a0, $s5, $zero
    /* F534 8001F534 0A001896 */  lhu        $t8, 0xA($s0)
    /* F538 8001F538 00000000 */  nop
    /* F53C 8001F53C 10001937 */  ori        $t9, $t8, 0x10
    /* F540 8001F540 0A0019A6 */  sh         $t9, 0xA($s0)
    /* F544 8001F544 000036AE */  sw         $s6, 0x0($s1)
    /* F548 8001F548 4800A0AF */  sw         $zero, 0x48($sp)
    /* F54C 8001F54C 04000896 */  lhu        $t0, 0x4($s0)
    /* F550 8001F550 00000000 */  nop
    /* F554 8001F554 02000931 */  andi       $t1, $t0, 0x2
    /* F558 8001F558 06002015 */  bnez       $t1, .L8001F574
    /* F55C 8001F55C 00000000 */   nop
  .L8001F560:
    /* F560 8001F560 04000A96 */  lhu        $t2, 0x4($s0)
    /* F564 8001F564 00000000 */  nop
    /* F568 8001F568 02004B31 */  andi       $t3, $t2, 0x2
    /* F56C 8001F56C FCFF6011 */  beqz       $t3, .L8001F560
    /* F570 8001F570 00000000 */   nop
  .L8001F574:
    /* F574 8001F574 00000292 */  lbu        $v0, 0x0($s0)
    /* F578 8001F578 01007326 */  addiu      $s3, $s3, 0x1
    /* F57C 8001F57C 00160200 */  sll        $v0, $v0, 24
    /* F580 8001F580 03160200 */  sra        $v0, $v0, 24
    /* F584 8001F584 FFFF62A2 */  sb         $v0, -0x1($s3)
    /* F588 8001F588 00002C8E */  lw         $t4, 0x0($s1)
    /* F58C 8001F58C 00000000 */  nop
    /* F590 8001F590 80008D31 */  andi       $t5, $t4, 0x80
    /* F594 8001F594 0D00A015 */  bnez       $t5, .L8001F5CC
    /* F598 8001F598 00000000 */   nop
    /* F59C 8001F59C 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F5A0:
    /* F5A0 8001F5A0 4800AE8F */  lw         $t6, 0x48($sp)
    /* F5A4 8001F5A4 51004228 */  slti       $v0, $v0, 0x51
    /* F5A8 8001F5A8 01004238 */  xori       $v0, $v0, 0x1
    /* F5AC 8001F5AC 0100CF25 */  addiu      $t7, $t6, 0x1
    /* F5B0 8001F5B0 00014014 */  bnez       $v0, .L8001F9B4
    /* F5B4 8001F5B4 4800AFAF */   sw        $t7, 0x48($sp)
    /* F5B8 8001F5B8 0000388E */  lw         $t8, 0x0($s1)
    /* F5BC 8001F5BC 00000000 */  nop
    /* F5C0 8001F5C0 80001933 */  andi       $t9, $t8, 0x80
    /* F5C4 8001F5C4 F6FF2013 */  beqz       $t9, .L8001F5A0
    /* F5C8 8001F5C8 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F5CC:
    /* F5CC 8001F5CC 4800A0AF */  sw         $zero, 0x48($sp)
    /* F5D0 8001F5D0 04000896 */  lhu        $t0, 0x4($s0)
    /* F5D4 8001F5D4 00000000 */  nop
    /* F5D8 8001F5D8 80000931 */  andi       $t1, $t0, 0x80
    /* F5DC 8001F5DC 0D004916 */  bne        $s2, $t1, .L8001F614
    /* F5E0 8001F5E0 00000000 */   nop
    /* F5E4 8001F5E4 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F5E8:
    /* F5E8 8001F5E8 4800AA8F */  lw         $t2, 0x48($sp)
    /* F5EC 8001F5EC 10004228 */  slti       $v0, $v0, 0x10
    /* F5F0 8001F5F0 01004238 */  xori       $v0, $v0, 0x1
    /* F5F4 8001F5F4 01004B25 */  addiu      $t3, $t2, 0x1
    /* F5F8 8001F5F8 EE004014 */  bnez       $v0, .L8001F9B4
    /* F5FC 8001F5FC 4800ABAF */   sw        $t3, 0x48($sp)
    /* F600 8001F600 04000C96 */  lhu        $t4, 0x4($s0)
    /* F604 8001F604 00000000 */  nop
    /* F608 8001F608 80008D31 */  andi       $t5, $t4, 0x80
    /* F60C 8001F60C F6FF4D12 */  beq        $s2, $t5, .L8001F5E8
    /* F610 8001F610 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F614:
    /* F614 8001F614 00008E82 */  lb         $t6, 0x0($s4)
    /* F618 8001F618 01009426 */  addiu      $s4, $s4, 0x1
    /* F61C 8001F61C 2478D701 */  and        $t7, $t6, $s7
    /* F620 8001F620 00000FA2 */  sb         $t7, 0x0($s0)
    /* F624 8001F624 DA7A000C */  jal        func_8001EB68
    /* F628 8001F628 2120A002 */   addu      $a0, $s5, $zero
    /* F62C 8001F62C 0A001896 */  lhu        $t8, 0xA($s0)
    /* F630 8001F630 00000000 */  nop
    /* F634 8001F634 10001937 */  ori        $t9, $t8, 0x10
    /* F638 8001F638 0A0019A6 */  sh         $t9, 0xA($s0)
    /* F63C 8001F63C 000036AE */  sw         $s6, 0x0($s1)
    /* F640 8001F640 4800A0AF */  sw         $zero, 0x48($sp)
    /* F644 8001F644 04000896 */  lhu        $t0, 0x4($s0)
    /* F648 8001F648 00000000 */  nop
    /* F64C 8001F64C 02000931 */  andi       $t1, $t0, 0x2
    /* F650 8001F650 06002015 */  bnez       $t1, .L8001F66C
    /* F654 8001F654 00000000 */   nop
  .L8001F658:
    /* F658 8001F658 04000A96 */  lhu        $t2, 0x4($s0)
    /* F65C 8001F65C 00000000 */  nop
    /* F660 8001F660 02004B31 */  andi       $t3, $t2, 0x2
    /* F664 8001F664 FCFF6011 */  beqz       $t3, .L8001F658
    /* F668 8001F668 00000000 */   nop
  .L8001F66C:
    /* F66C 8001F66C 00000292 */  lbu        $v0, 0x0($s0)
    /* F670 8001F670 01007326 */  addiu      $s3, $s3, 0x1
    /* F674 8001F674 00160200 */  sll        $v0, $v0, 24
    /* F678 8001F678 03160200 */  sra        $v0, $v0, 24
    /* F67C 8001F67C FFFF62A2 */  sb         $v0, -0x1($s3)
    /* F680 8001F680 00002C8E */  lw         $t4, 0x0($s1)
    /* F684 8001F684 00000000 */  nop
    /* F688 8001F688 80008D31 */  andi       $t5, $t4, 0x80
    /* F68C 8001F68C 0D00A015 */  bnez       $t5, .L8001F6C4
    /* F690 8001F690 00000000 */   nop
    /* F694 8001F694 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F698:
    /* F698 8001F698 4800AE8F */  lw         $t6, 0x48($sp)
    /* F69C 8001F69C 51004228 */  slti       $v0, $v0, 0x51
    /* F6A0 8001F6A0 01004238 */  xori       $v0, $v0, 0x1
    /* F6A4 8001F6A4 0100CF25 */  addiu      $t7, $t6, 0x1
    /* F6A8 8001F6A8 C2004014 */  bnez       $v0, .L8001F9B4
    /* F6AC 8001F6AC 4800AFAF */   sw        $t7, 0x48($sp)
    /* F6B0 8001F6B0 0000388E */  lw         $t8, 0x0($s1)
    /* F6B4 8001F6B4 00000000 */  nop
    /* F6B8 8001F6B8 80001933 */  andi       $t9, $t8, 0x80
    /* F6BC 8001F6BC F6FF2013 */  beqz       $t9, .L8001F698
    /* F6C0 8001F6C0 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F6C4:
    /* F6C4 8001F6C4 4800A0AF */  sw         $zero, 0x48($sp)
    /* F6C8 8001F6C8 04000896 */  lhu        $t0, 0x4($s0)
    /* F6CC 8001F6CC 00000000 */  nop
    /* F6D0 8001F6D0 80000931 */  andi       $t1, $t0, 0x80
    /* F6D4 8001F6D4 0D004916 */  bne        $s2, $t1, .L8001F70C
    /* F6D8 8001F6D8 00000000 */   nop
    /* F6DC 8001F6DC 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F6E0:
    /* F6E0 8001F6E0 4800AA8F */  lw         $t2, 0x48($sp)
    /* F6E4 8001F6E4 10004228 */  slti       $v0, $v0, 0x10
    /* F6E8 8001F6E8 01004238 */  xori       $v0, $v0, 0x1
    /* F6EC 8001F6EC 01004B25 */  addiu      $t3, $t2, 0x1
    /* F6F0 8001F6F0 B0004014 */  bnez       $v0, .L8001F9B4
    /* F6F4 8001F6F4 4800ABAF */   sw        $t3, 0x48($sp)
    /* F6F8 8001F6F8 04000C96 */  lhu        $t4, 0x4($s0)
    /* F6FC 8001F6FC 00000000 */  nop
    /* F700 8001F700 80008D31 */  andi       $t5, $t4, 0x80
    /* F704 8001F704 F6FF4D12 */  beq        $s2, $t5, .L8001F6E0
    /* F708 8001F708 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F70C:
    /* F70C 8001F70C 00008E82 */  lb         $t6, 0x0($s4)
    /* F710 8001F710 01009426 */  addiu      $s4, $s4, 0x1
    /* F714 8001F714 2478D701 */  and        $t7, $t6, $s7
    /* F718 8001F718 00000FA2 */  sb         $t7, 0x0($s0)
    /* F71C 8001F71C DA7A000C */  jal        func_8001EB68
    /* F720 8001F720 2120A002 */   addu      $a0, $s5, $zero
    /* F724 8001F724 0A001896 */  lhu        $t8, 0xA($s0)
    /* F728 8001F728 00000000 */  nop
    /* F72C 8001F72C 10001937 */  ori        $t9, $t8, 0x10
    /* F730 8001F730 0A0019A6 */  sh         $t9, 0xA($s0)
    /* F734 8001F734 000036AE */  sw         $s6, 0x0($s1)
    /* F738 8001F738 4800A0AF */  sw         $zero, 0x48($sp)
    /* F73C 8001F73C 04000896 */  lhu        $t0, 0x4($s0)
    /* F740 8001F740 00000000 */  nop
    /* F744 8001F744 02000931 */  andi       $t1, $t0, 0x2
    /* F748 8001F748 06002015 */  bnez       $t1, .L8001F764
    /* F74C 8001F74C 00000000 */   nop
  .L8001F750:
    /* F750 8001F750 04000A96 */  lhu        $t2, 0x4($s0)
    /* F754 8001F754 00000000 */  nop
    /* F758 8001F758 02004B31 */  andi       $t3, $t2, 0x2
    /* F75C 8001F75C FCFF6011 */  beqz       $t3, .L8001F750
    /* F760 8001F760 00000000 */   nop
  .L8001F764:
    /* F764 8001F764 00000292 */  lbu        $v0, 0x0($s0)
    /* F768 8001F768 01007326 */  addiu      $s3, $s3, 0x1
    /* F76C 8001F76C 00160200 */  sll        $v0, $v0, 24
    /* F770 8001F770 03160200 */  sra        $v0, $v0, 24
    /* F774 8001F774 FFFF62A2 */  sb         $v0, -0x1($s3)
    /* F778 8001F778 00002C8E */  lw         $t4, 0x0($s1)
    /* F77C 8001F77C 00000000 */  nop
    /* F780 8001F780 80008D31 */  andi       $t5, $t4, 0x80
    /* F784 8001F784 0D00A015 */  bnez       $t5, .L8001F7BC
    /* F788 8001F788 00000000 */   nop
    /* F78C 8001F78C 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F790:
    /* F790 8001F790 4800AE8F */  lw         $t6, 0x48($sp)
    /* F794 8001F794 51004228 */  slti       $v0, $v0, 0x51
    /* F798 8001F798 01004238 */  xori       $v0, $v0, 0x1
    /* F79C 8001F79C 0100CF25 */  addiu      $t7, $t6, 0x1
    /* F7A0 8001F7A0 84004014 */  bnez       $v0, .L8001F9B4
    /* F7A4 8001F7A4 4800AFAF */   sw        $t7, 0x48($sp)
    /* F7A8 8001F7A8 0000388E */  lw         $t8, 0x0($s1)
    /* F7AC 8001F7AC 00000000 */  nop
    /* F7B0 8001F7B0 80001933 */  andi       $t9, $t8, 0x80
    /* F7B4 8001F7B4 F6FF2013 */  beqz       $t9, .L8001F790
    /* F7B8 8001F7B8 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F7BC:
    /* F7BC 8001F7BC 4800A0AF */  sw         $zero, 0x48($sp)
    /* F7C0 8001F7C0 04000896 */  lhu        $t0, 0x4($s0)
    /* F7C4 8001F7C4 00000000 */  nop
    /* F7C8 8001F7C8 80000931 */  andi       $t1, $t0, 0x80
    /* F7CC 8001F7CC 0D004916 */  bne        $s2, $t1, .L8001F804
    /* F7D0 8001F7D0 00000000 */   nop
    /* F7D4 8001F7D4 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F7D8:
    /* F7D8 8001F7D8 4800AA8F */  lw         $t2, 0x48($sp)
    /* F7DC 8001F7DC 10004228 */  slti       $v0, $v0, 0x10
    /* F7E0 8001F7E0 01004238 */  xori       $v0, $v0, 0x1
    /* F7E4 8001F7E4 01004B25 */  addiu      $t3, $t2, 0x1
    /* F7E8 8001F7E8 72004014 */  bnez       $v0, .L8001F9B4
    /* F7EC 8001F7EC 4800ABAF */   sw        $t3, 0x48($sp)
    /* F7F0 8001F7F0 04000C96 */  lhu        $t4, 0x4($s0)
    /* F7F4 8001F7F4 00000000 */  nop
    /* F7F8 8001F7F8 80008D31 */  andi       $t5, $t4, 0x80
    /* F7FC 8001F7FC F6FF4D12 */  beq        $s2, $t5, .L8001F7D8
    /* F800 8001F800 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F804:
    /* F804 8001F804 00008E82 */  lb         $t6, 0x0($s4)
    /* F808 8001F808 01009426 */  addiu      $s4, $s4, 0x1
    /* F80C 8001F80C 2478D701 */  and        $t7, $t6, $s7
    /* F810 8001F810 00000FA2 */  sb         $t7, 0x0($s0)
    /* F814 8001F814 DA7A000C */  jal        func_8001EB68
    /* F818 8001F818 2120A002 */   addu      $a0, $s5, $zero
    /* F81C 8001F81C 0A001896 */  lhu        $t8, 0xA($s0)
    /* F820 8001F820 00000000 */  nop
    /* F824 8001F824 10001937 */  ori        $t9, $t8, 0x10
    /* F828 8001F828 0A0019A6 */  sh         $t9, 0xA($s0)
    /* F82C 8001F82C 000036AE */  sw         $s6, 0x0($s1)
    /* F830 8001F830 4800A0AF */  sw         $zero, 0x48($sp)
    /* F834 8001F834 04000896 */  lhu        $t0, 0x4($s0)
    /* F838 8001F838 00000000 */  nop
    /* F83C 8001F83C 02000931 */  andi       $t1, $t0, 0x2
    /* F840 8001F840 06002015 */  bnez       $t1, .L8001F85C
    /* F844 8001F844 00000000 */   nop
  .L8001F848:
    /* F848 8001F848 04000A96 */  lhu        $t2, 0x4($s0)
    /* F84C 8001F84C 00000000 */  nop
    /* F850 8001F850 02004B31 */  andi       $t3, $t2, 0x2
    /* F854 8001F854 FCFF6011 */  beqz       $t3, .L8001F848
    /* F858 8001F858 00000000 */   nop
  .L8001F85C:
    /* F85C 8001F85C 00000292 */  lbu        $v0, 0x0($s0)
    /* F860 8001F860 01007326 */  addiu      $s3, $s3, 0x1
    /* F864 8001F864 00160200 */  sll        $v0, $v0, 24
    /* F868 8001F868 03160200 */  sra        $v0, $v0, 24
    /* F86C 8001F86C FFFF62A2 */  sb         $v0, -0x1($s3)
    /* F870 8001F870 00002C8E */  lw         $t4, 0x0($s1)
    /* F874 8001F874 00000000 */  nop
    /* F878 8001F878 80008D31 */  andi       $t5, $t4, 0x80
    /* F87C 8001F87C 0D00A015 */  bnez       $t5, .L8001F8B4
    /* F880 8001F880 00000000 */   nop
    /* F884 8001F884 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F888:
    /* F888 8001F888 4800AE8F */  lw         $t6, 0x48($sp)
    /* F88C 8001F88C 51004228 */  slti       $v0, $v0, 0x51
    /* F890 8001F890 01004238 */  xori       $v0, $v0, 0x1
    /* F894 8001F894 0100CF25 */  addiu      $t7, $t6, 0x1
    /* F898 8001F898 46004014 */  bnez       $v0, .L8001F9B4
    /* F89C 8001F89C 4800AFAF */   sw        $t7, 0x48($sp)
    /* F8A0 8001F8A0 0000388E */  lw         $t8, 0x0($s1)
    /* F8A4 8001F8A4 00000000 */  nop
    /* F8A8 8001F8A8 80001933 */  andi       $t9, $t8, 0x80
    /* F8AC 8001F8AC F6FF2013 */  beqz       $t9, .L8001F888
    /* F8B0 8001F8B0 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F8B4:
    /* F8B4 8001F8B4 4800A0AF */  sw         $zero, 0x48($sp)
    /* F8B8 8001F8B8 04000896 */  lhu        $t0, 0x4($s0)
    /* F8BC 8001F8BC 00000000 */  nop
    /* F8C0 8001F8C0 80000931 */  andi       $t1, $t0, 0x80
    /* F8C4 8001F8C4 0D004916 */  bne        $s2, $t1, .L8001F8FC
    /* F8C8 8001F8C8 00000000 */   nop
    /* F8CC 8001F8CC 4800A28F */  lw         $v0, 0x48($sp)
  .L8001F8D0:
    /* F8D0 8001F8D0 4800AA8F */  lw         $t2, 0x48($sp)
    /* F8D4 8001F8D4 10004228 */  slti       $v0, $v0, 0x10
    /* F8D8 8001F8D8 01004238 */  xori       $v0, $v0, 0x1
    /* F8DC 8001F8DC 01004B25 */  addiu      $t3, $t2, 0x1
    /* F8E0 8001F8E0 34004014 */  bnez       $v0, .L8001F9B4
    /* F8E4 8001F8E4 4800ABAF */   sw        $t3, 0x48($sp)
    /* F8E8 8001F8E8 04000C96 */  lhu        $t4, 0x4($s0)
    /* F8EC 8001F8EC 00000000 */  nop
    /* F8F0 8001F8F0 80008D31 */  andi       $t5, $t4, 0x80
    /* F8F4 8001F8F4 F6FF4D12 */  beq        $s2, $t5, .L8001F8D0
    /* F8F8 8001F8F8 4800A28F */   lw        $v0, 0x48($sp)
  .L8001F8FC:
    /* F8FC 8001F8FC 00008E82 */  lb         $t6, 0x0($s4)
    /* F900 8001F900 01009426 */  addiu      $s4, $s4, 0x1
    /* F904 8001F904 2478D701 */  and        $t7, $t6, $s7
    /* F908 8001F908 00000FA2 */  sb         $t7, 0x0($s0)
    /* F90C 8001F90C DA7A000C */  jal        func_8001EB68
    /* F910 8001F910 2120A002 */   addu      $a0, $s5, $zero
    /* F914 8001F914 0A001896 */  lhu        $t8, 0xA($s0)
    /* F918 8001F918 00000000 */  nop
    /* F91C 8001F91C 10001937 */  ori        $t9, $t8, 0x10
    /* F920 8001F920 0A0019A6 */  sh         $t9, 0xA($s0)
    /* F924 8001F924 000036AE */  sw         $s6, 0x0($s1)
    /* F928 8001F928 4800A0AF */  sw         $zero, 0x48($sp)
    /* F92C 8001F92C 04000896 */  lhu        $t0, 0x4($s0)
    /* F930 8001F930 00000000 */  nop
    /* F934 8001F934 02000931 */  andi       $t1, $t0, 0x2
    /* F938 8001F938 06002015 */  bnez       $t1, .L8001F954
    /* F93C 8001F93C 00000000 */   nop
  .L8001F940:
    /* F940 8001F940 04000A96 */  lhu        $t2, 0x4($s0)
    /* F944 8001F944 00000000 */  nop
    /* F948 8001F948 02004B31 */  andi       $t3, $t2, 0x2
    /* F94C 8001F94C FCFF6011 */  beqz       $t3, .L8001F940
    /* F950 8001F950 00000000 */   nop
  .L8001F954:
    /* F954 8001F954 00000292 */  lbu        $v0, 0x0($s0)
    /* F958 8001F958 6000A383 */  lb         $v1, 0x60($sp)
    /* F95C 8001F95C 00160200 */  sll        $v0, $v0, 24
    /* F960 8001F960 03160200 */  sra        $v0, $v0, 24
    /* F964 8001F964 04000124 */  addiu      $at, $zero, 0x4
    /* F968 8001F968 000062A2 */  sb         $v0, 0x0($s3)
    /* F96C 8001F96C 04006114 */  bne        $v1, $at, .L8001F980
    /* F970 8001F970 01007326 */   addiu     $s3, $s3, 0x1
    /* F974 8001F974 22000C24 */  addiu      $t4, $zero, 0x22
    /* F978 8001F978 0E000CA6 */  sh         $t4, 0xE($s0)
    /* F97C 8001F97C 21A80000 */  addu       $s5, $zero, $zero
  .L8001F980:
    /* F980 8001F980 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* F984 8001F984 001E0300 */  sll        $v1, $v1, 24
    /* F988 8001F988 031E0300 */  sra        $v1, $v1, 24
    /* F98C 8001F98C 07FE601C */  bgtz       $v1, .L8001F1AC
    /* F990 8001F990 6000A3A3 */   sb        $v1, 0x60($sp)
    /* F994 8001F994 4000AD8F */  lw         $t5, 0x40($sp)
  .L8001F998:
    /* F998 8001F998 88000F24 */  addiu      $t7, $zero, 0x88
    /* F99C 8001F99C 0000AE8D */  lw         $t6, 0x0($t5)
    /* F9A0 8001F9A0 21100000 */  addu       $v0, $zero, $zero
    /* F9A4 8001F9A4 0000C0A1 */  sb         $zero, 0x0($t6)
    /* F9A8 8001F9A8 0E000FA6 */  sh         $t7, 0xE($s0)
    /* F9AC 8001F9AC 0B000010 */  b          .L8001F9DC
    /* F9B0 8001F9B0 0A0000A6 */   sh        $zero, 0xA($s0)
  .L8001F9B4:
    /* F9B4 8001F9B4 4000B98F */  lw         $t9, 0x40($sp)
  .L8001F9B8:
    /* F9B8 8001F9B8 FF001824 */  addiu      $t8, $zero, 0xFF
    /* F9BC 8001F9BC 0000288F */  lw         $t0, 0x0($t9)
    /* F9C0 8001F9C0 0A000424 */  addiu      $a0, $zero, 0xA
    /* F9C4 8001F9C4 DA7A000C */  jal        func_8001EB68
    /* F9C8 8001F9C8 000018A1 */   sb        $t8, 0x0($t0)
    /* F9CC 8001F9CC 88000924 */  addiu      $t1, $zero, 0x88
    /* F9D0 8001F9D0 0E0009A6 */  sh         $t1, 0xE($s0)
    /* F9D4 8001F9D4 0A0000A6 */  sh         $zero, 0xA($s0)
    /* F9D8 8001F9D8 FFFF0234 */  ori        $v0, $zero, 0xFFFF
  .L8001F9DC:
    /* F9DC 8001F9DC 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* F9E0 8001F9E0 1C00B08F */  lw         $s0, 0x1C($sp)
    /* F9E4 8001F9E4 2000B18F */  lw         $s1, 0x20($sp)
    /* F9E8 8001F9E8 2400B28F */  lw         $s2, 0x24($sp)
    /* F9EC 8001F9EC 2800B38F */  lw         $s3, 0x28($sp)
    /* F9F0 8001F9F0 2C00B48F */  lw         $s4, 0x2C($sp)
    /* F9F4 8001F9F4 3000B58F */  lw         $s5, 0x30($sp)
    /* F9F8 8001F9F8 3400B68F */  lw         $s6, 0x34($sp)
    /* F9FC 8001F9FC 3800B78F */  lw         $s7, 0x38($sp)
    /* FA00 8001FA00 0800E003 */  jr         $ra
    /* FA04 8001FA04 7000BD27 */   addiu     $sp, $sp, 0x70
  alabel D_8001FA08
    /* FA08 8001FA08 0B800E3C */  lui        $t6, %hi(D_800B633C)
    /* FA0C 8001FA0C 3C63CE8D */  lw         $t6, %lo(D_800B633C)($t6)
    /* FA10 8001FA10 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FA14 8001FA14 1400BFAF */  sw         $ra, 0x14($sp)
    /* FA18 8001FA18 0A000424 */  addiu      $a0, $zero, 0xA
    /* FA1C 8001FA1C DA7A000C */  jal        func_8001EB68
    /* FA20 8001FA20 0A00C0A5 */   sh        $zero, 0xA($t6)
    /* FA24 8001FA24 12800F3C */  lui        $t7, %hi(D_8011C934)
    /* FA28 8001FA28 34C9EF8D */  lw         $t7, %lo(D_8011C934)($t7)
    /* FA2C 8001FA2C 00000000 */  nop
    /* FA30 8001FA30 0C00E011 */  beqz       $t7, .L8001FA64
    /* FA34 8001FA34 00000000 */   nop
    /* FA38 8001FA38 E97A000C */  jal        func_8001EBA4
    /* FA3C 8001FA3C 21200000 */   addu      $a0, $zero, $zero
    /* FA40 8001FA40 E97A000C */  jal        func_8001EBA4
    /* FA44 8001FA44 01000424 */   addiu     $a0, $zero, 0x1
    /* FA48 8001FA48 1280183C */  lui        $t8, %hi(D_8011C940)
    /* FA4C 8001FA4C 40C9188F */  lw         $t8, %lo(D_8011C940)($t8)
    /* FA50 8001FA50 00000000 */  nop
    /* FA54 8001FA54 03000013 */  beqz       $t8, .L8001FA64
    /* FA58 8001FA58 00000000 */   nop
    /* FA5C 8001FA5C BF46000C */  jal        PAD_dr
    /* FA60 8001FA60 00000000 */   nop
  .L8001FA64:
    /* FA64 8001FA64 1280193C */  lui        $t9, %hi(D_8011C964)
    /* FA68 8001FA68 64C9398F */  lw         $t9, %lo(D_8011C964)($t9)
    /* FA6C 8001FA6C 00000000 */  nop
    /* FA70 8001FA70 06002013 */  beqz       $t9, .L8001FA8C
    /* FA74 8001FA74 1400BF8F */   lw        $ra, 0x14($sp)
    /* FA78 8001FA78 0B80093C */  lui        $t1, %hi(D_800B6340)
    /* FA7C 8001FA7C 4063298D */  lw         $t1, %lo(D_800B6340)($t1)
    /* FA80 8001FA80 FEFF0824 */  addiu      $t0, $zero, -0x2
    /* FA84 8001FA84 000028AD */  sw         $t0, 0x0($t1)
    /* FA88 8001FA88 1400BF8F */  lw         $ra, 0x14($sp)
  .L8001FA8C:
    /* FA8C 8001FA8C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FA90 8001FA90 0800E003 */  jr         $ra
    /* FA94 8001FA94 21100000 */   addu      $v0, $zero, $zero
  alabel D_8001FA98
    /* FA98 8001FA98 0B80023C */  lui        $v0, %hi(D_800B6340)
    /* FA9C 8001FA9C 4063428C */  lw         $v0, %lo(D_800B6340)($v0)
    /* FAA0 8001FAA0 00000000 */  nop
    /* FAA4 8001FAA4 04004E8C */  lw         $t6, 0x4($v0)
    /* FAA8 8001FAA8 00000000 */  nop
    /* FAAC 8001FAAC 0100CF31 */  andi       $t7, $t6, 0x1
    /* FAB0 8001FAB0 0600E011 */  beqz       $t7, .L8001FACC
    /* FAB4 8001FAB4 00000000 */   nop
    /* FAB8 8001FAB8 0000588C */  lw         $t8, 0x0($v0)
    /* FABC 8001FABC 00000000 */  nop
    /* FAC0 8001FAC0 01001933 */  andi       $t9, $t8, 0x1
    /* FAC4 8001FAC4 04002017 */  bnez       $t9, .L8001FAD8
    /* FAC8 8001FAC8 01000224 */   addiu     $v0, $zero, 0x1
  .L8001FACC:
    /* FACC 8001FACC 0800E003 */  jr         $ra
    /* FAD0 8001FAD0 21100000 */   addu      $v0, $zero, $zero
    /* FAD4 8001FAD4 01000224 */  addiu      $v0, $zero, 0x1
  .L8001FAD8:
    /* FAD8 8001FAD8 0800E003 */  jr         $ra
    /* FADC 8001FADC 00000000 */   nop
endlabel func_8001EBA4
