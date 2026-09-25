.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoVision__FiiiUcUc, 0x428

glabel DoVision__FiiiUcUc
    /* 3CE40 8004CE40 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 3CE44 8004CE44 A000A293 */  lbu        $v0, 0xA0($sp)
    /* 3CE48 8004CE48 7000B2AF */  sw         $s2, 0x70($sp)
    /* 3CE4C 8004CE4C 21900000 */  addu       $s2, $zero, $zero
    /* 3CE50 8004CE50 7400B3AF */  sw         $s3, 0x74($sp)
    /* 3CE54 8004CE54 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* 3CE58 8004CE58 8800BEAF */  sw         $fp, 0x88($sp)
    /* 3CE5C 8004CE5C 8400B7AF */  sw         $s7, 0x84($sp)
    /* 3CE60 8004CE60 8000B6AF */  sw         $s6, 0x80($sp)
    /* 3CE64 8004CE64 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* 3CE68 8004CE68 7800B4AF */  sw         $s4, 0x78($sp)
    /* 3CE6C 8004CE6C 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* 3CE70 8004CE70 6800B0AF */  sw         $s0, 0x68($sp)
    /* 3CE74 8004CE74 1000A4AF */  sw         $a0, 0x10($sp)
    /* 3CE78 8004CE78 1800A5AF */  sw         $a1, 0x18($sp)
    /* 3CE7C 8004CE7C 2000A6AF */  sw         $a2, 0x20($sp)
    /* 3CE80 8004CE80 2800A7A3 */  sb         $a3, 0x28($sp)
    /* 3CE84 8004CE84 01004224 */  addiu      $v0, $v0, 0x1
    /* 3CE88 8004CE88 4000A2AF */  sw         $v0, 0x40($sp)
    /* 3CE8C 8004CE8C 6100822C */  sltiu      $v0, $a0, 0x61
    /* 3CE90 8004CE90 2F004010 */  beqz       $v0, .L8004CF50
    /* 3CE94 8004CE94 21980000 */   addu      $s3, $zero, $zero
    /* 3CE98 8004CE98 6100A22C */  sltiu      $v0, $a1, 0x61
    /* 3CE9C 8004CE9C 2D004010 */  beqz       $v0, .L8004CF54
    /* 3CEA0 8004CEA0 21F00000 */   addu      $fp, $zero, $zero
    /* 3CEA4 8004CEA4 2800A293 */  lbu        $v0, 0x28($sp)
    /* 3CEA8 8004CEA8 00000000 */  nop
    /* 3CEAC 8004CEAC 17004010 */  beqz       $v0, .L8004CF0C
    /* 3CEB0 8004CEB0 C0100500 */   sll       $v0, $a1, 3
    /* 3CEB4 8004CEB4 C0180400 */  sll        $v1, $a0, 3
    /* 3CEB8 8004CEB8 23186400 */  subu       $v1, $v1, $a0
    /* 3CEBC 8004CEBC C0190300 */  sll        $v1, $v1, 7
    /* 3CEC0 8004CEC0 21804300 */  addu       $s0, $v0, $v1
    /* 3CEC4 8004CEC4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CEC8 8004CEC8 21083000 */  addu       $at, $at, $s0
    /* 3CECC 8004CECC 2E7A2280 */  lb         $v0, %lo(dung_map + 0x6)($at)
    /* 3CED0 8004CED0 00000000 */  nop
    /* 3CED4 8004CED4 05004004 */  bltz       $v0, .L8004CEEC
    /* 3CED8 8004CED8 00000000 */   nop
    /* 3CEDC 8004CEDC 1000A48F */  lw         $a0, 0x10($sp)
    /* 3CEE0 8004CEE0 1000A58F */  lw         $a1, 0x10($sp)
    /* 3CEE4 8004CEE4 AA02020C */  jal        SetAutomapView__Fii
    /* 3CEE8 8004CEE8 00000000 */   nop
  .L8004CEEC:
    /* 3CEEC 8004CEEC 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CEF0 8004CEF0 21083000 */  addu       $at, $at, $s0
    /* 3CEF4 8004CEF4 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 3CEF8 8004CEF8 00000000 */  nop
    /* 3CEFC 8004CEFC 80004234 */  ori        $v0, $v0, 0x80
    /* 3CF00 8004CF00 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CF04 8004CF04 21083000 */  addu       $at, $at, $s0
    /* 3CF08 8004CF08 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
  .L8004CF0C:
    /* 3CF0C 8004CF0C 1800A88F */  lw         $t0, 0x18($sp)
    /* 3CF10 8004CF10 1000A98F */  lw         $t1, 0x10($sp)
    /* 3CF14 8004CF14 C0100800 */  sll        $v0, $t0, 3
    /* 3CF18 8004CF18 C0180900 */  sll        $v1, $t1, 3
    /* 3CF1C 8004CF1C 23186900 */  subu       $v1, $v1, $t1
    /* 3CF20 8004CF20 C0190300 */  sll        $v1, $v1, 7
    /* 3CF24 8004CF24 21104300 */  addu       $v0, $v0, $v1
    /* 3CF28 8004CF28 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CF2C 8004CF2C 21082200 */  addu       $at, $at, $v0
    /* 3CF30 8004CF30 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 3CF34 8004CF34 4000A88F */  lw         $t0, 0x40($sp)
    /* 3CF38 8004CF38 00000000 */  nop
    /* 3CF3C 8004CF3C 25186800 */  or         $v1, $v1, $t0
    /* 3CF40 8004CF40 04006334 */  ori        $v1, $v1, 0x4
    /* 3CF44 8004CF44 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3CF48 8004CF48 21082200 */  addu       $at, $at, $v0
    /* 3CF4C 8004CF4C 2E7A23A0 */  sb         $v1, %lo(dung_map + 0x6)($at)
  .L8004CF50:
    /* 3CF50 8004CF50 21F00000 */  addu       $fp, $zero, $zero
  .L8004CF54:
    /* 3CF54 8004CF54 0D80093C */  lui        $t1, %hi(vCrawlTable)
    /* 3CF58 8004CF58 14602925 */  addiu      $t1, $t1, %lo(vCrawlTable)
    /* 3CF5C 8004CF5C 3800A0AF */  sw         $zero, 0x38($sp)
    /* 3CF60 8004CF60 5800A9AF */  sw         $t1, 0x58($sp)
  .L8004CF64:
    /* 3CF64 8004CF64 3800A88F */  lw         $t0, 0x38($sp)
    /* 3CF68 8004CF68 2000A98F */  lw         $t1, 0x20($sp)
    /* 3CF6C 8004CF6C 0D80013C */  lui        $at, %hi(RadiusAdj)
    /* 3CF70 8004CF70 21082800 */  addu       $at, $at, $t0
    /* 3CF74 8004CF74 C8622290 */  lbu        $v0, %lo(RadiusAdj)($at)
    /* 3CF78 8004CF78 21300000 */  addu       $a2, $zero, $zero
    /* 3CF7C 8004CF7C 23102201 */  subu       $v0, $t1, $v0
    /* 3CF80 8004CF80 40100200 */  sll        $v0, $v0, 1
    /* 3CF84 8004CF84 9F004018 */  blez       $v0, .L8004D204
    /* 3CF88 8004CF88 3000A2AF */   sw        $v0, 0x30($sp)
    /* 3CF8C 8004CF8C 5800A88F */  lw         $t0, 0x58($sp)
    /* 3CF90 8004CF90 5800B18F */  lw         $s1, 0x58($sp)
    /* 3CF94 8004CF94 4800A8AF */  sw         $t0, 0x48($sp)
    /* 3CF98 8004CF98 21A80000 */  addu       $s5, $zero, $zero
  .L8004CF9C:
    /* 3CF9C 8004CF9C 21B80000 */  addu       $s7, $zero, $zero
    /* 3CFA0 8004CFA0 21A00000 */  addu       $s4, $zero, $zero
    /* 3CFA4 8004CFA4 01000224 */  addiu      $v0, $zero, 0x1
    /* 3CFA8 8004CFA8 1B00C213 */  beq        $fp, $v0, .L8004D018
    /* 3CFAC 8004CFAC 21B00000 */   addu      $s6, $zero, $zero
    /* 3CFB0 8004CFB0 0200C22B */  slti       $v0, $fp, 0x2
    /* 3CFB4 8004CFB4 05004010 */  beqz       $v0, .L8004CFCC
    /* 3CFB8 8004CFB8 00000000 */   nop
    /* 3CFBC 8004CFBC 0A00C013 */  beqz       $fp, .L8004CFE8
    /* 3CFC0 8004CFC0 6100422E */   sltiu     $v0, $s2, 0x61
    /* 3CFC4 8004CFC4 29340108 */  j          .L8004D0A4
    /* 3CFC8 8004CFC8 00000000 */   nop
  .L8004CFCC:
    /* 3CFCC 8004CFCC 02000224 */  addiu      $v0, $zero, 0x2
    /* 3CFD0 8004CFD0 1C00C213 */  beq        $fp, $v0, .L8004D044
    /* 3CFD4 8004CFD4 03000224 */   addiu     $v0, $zero, 0x3
    /* 3CFD8 8004CFD8 2600C213 */  beq        $fp, $v0, .L8004D074
    /* 3CFDC 8004CFDC 6100422E */   sltiu     $v0, $s2, 0x61
    /* 3CFE0 8004CFE0 29340108 */  j          .L8004D0A4
    /* 3CFE4 8004CFE4 00000000 */   nop
  .L8004CFE8:
    /* 3CFE8 8004CFE8 00002292 */  lbu        $v0, 0x0($s1)
    /* 3CFEC 8004CFEC 01002392 */  lbu        $v1, 0x1($s1)
    /* 3CFF0 8004CFF0 1000A98F */  lw         $t1, 0x10($sp)
    /* 3CFF4 8004CFF4 1800A88F */  lw         $t0, 0x18($sp)
    /* 3CFF8 8004CFF8 21902201 */  addu       $s2, $t1, $v0
    /* 3CFFC 8004CFFC 28004010 */  beqz       $v0, .L8004D0A0
    /* 3D000 8004D000 21980301 */   addu      $s3, $t0, $v1
    /* 3D004 8004D004 27006010 */  beqz       $v1, .L8004D0A4
    /* 3D008 8004D008 6100422E */   sltiu     $v0, $s2, 0x61
    /* 3D00C 8004D00C FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 3D010 8004D010 29340108 */  j          .L8004D0A4
    /* 3D014 8004D014 FFFF1624 */   addiu     $s6, $zero, -0x1
  .L8004D018:
    /* 3D018 8004D018 00002292 */  lbu        $v0, 0x0($s1)
    /* 3D01C 8004D01C 01002392 */  lbu        $v1, 0x1($s1)
    /* 3D020 8004D020 1000A98F */  lw         $t1, 0x10($sp)
    /* 3D024 8004D024 1800A88F */  lw         $t0, 0x18($sp)
    /* 3D028 8004D028 23902201 */  subu       $s2, $t1, $v0
    /* 3D02C 8004D02C 1C004010 */  beqz       $v0, .L8004D0A0
    /* 3D030 8004D030 23980301 */   subu      $s3, $t0, $v1
    /* 3D034 8004D034 1B006010 */  beqz       $v1, .L8004D0A4
    /* 3D038 8004D038 6100422E */   sltiu     $v0, $s2, 0x61
    /* 3D03C 8004D03C 27340108 */  j          .L8004D09C
    /* 3D040 8004D040 01001424 */   addiu     $s4, $zero, 0x1
  .L8004D044:
    /* 3D044 8004D044 00002292 */  lbu        $v0, 0x0($s1)
    /* 3D048 8004D048 01002392 */  lbu        $v1, 0x1($s1)
    /* 3D04C 8004D04C 1000A98F */  lw         $t1, 0x10($sp)
    /* 3D050 8004D050 1800A88F */  lw         $t0, 0x18($sp)
    /* 3D054 8004D054 21902201 */  addu       $s2, $t1, $v0
    /* 3D058 8004D058 11004010 */  beqz       $v0, .L8004D0A0
    /* 3D05C 8004D05C 23980301 */   subu      $s3, $t0, $v1
    /* 3D060 8004D060 10006010 */  beqz       $v1, .L8004D0A4
    /* 3D064 8004D064 6100422E */   sltiu     $v0, $s2, 0x61
    /* 3D068 8004D068 FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 3D06C 8004D06C 29340108 */  j          .L8004D0A4
    /* 3D070 8004D070 01001624 */   addiu     $s6, $zero, 0x1
  .L8004D074:
    /* 3D074 8004D074 00002292 */  lbu        $v0, 0x0($s1)
    /* 3D078 8004D078 01002392 */  lbu        $v1, 0x1($s1)
    /* 3D07C 8004D07C 1000A98F */  lw         $t1, 0x10($sp)
    /* 3D080 8004D080 1800A88F */  lw         $t0, 0x18($sp)
    /* 3D084 8004D084 23902201 */  subu       $s2, $t1, $v0
    /* 3D088 8004D088 05004010 */  beqz       $v0, .L8004D0A0
    /* 3D08C 8004D08C 21980301 */   addu      $s3, $t0, $v1
    /* 3D090 8004D090 04006010 */  beqz       $v1, .L8004D0A4
    /* 3D094 8004D094 6100422E */   sltiu     $v0, $s2, 0x61
    /* 3D098 8004D098 FFFF1424 */  addiu      $s4, $zero, -0x1
  .L8004D09C:
    /* 3D09C 8004D09C 01001724 */  addiu      $s7, $zero, 0x1
  .L8004D0A0:
    /* 3D0A0 8004D0A0 6100422E */  sltiu      $v0, $s2, 0x61
  .L8004D0A4:
    /* 3D0A4 8004D0A4 4E004010 */  beqz       $v0, .L8004D1E0
    /* 3D0A8 8004D0A8 6100622E */   sltiu     $v0, $s3, 0x61
    /* 3D0AC 8004D0AC 4C004010 */  beqz       $v0, .L8004D1E0
    /* 3D0B0 8004D0B0 21204002 */   addu      $a0, $s2, $zero
    /* 3D0B4 8004D0B4 E20B020C */  jal        GetBLOCK__Fii
    /* 3D0B8 8004D0B8 21286002 */   addu      $a1, $s3, $zero
    /* 3D0BC 8004D0BC 21304000 */  addu       $a2, $v0, $zero
    /* 3D0C0 8004D0C0 21800000 */  addu       $s0, $zero, $zero
    /* 3D0C4 8004D0C4 21205502 */  addu       $a0, $s2, $s5
    /* 3D0C8 8004D0C8 21287402 */  addu       $a1, $s3, $s4
    /* 3D0CC 8004D0CC E20B020C */  jal        GetBLOCK__Fii
    /* 3D0D0 8004D0D0 6000A6AF */   sw        $a2, 0x60($sp)
    /* 3D0D4 8004D0D4 6000A68F */  lw         $a2, 0x60($sp)
    /* 3D0D8 8004D0D8 07004010 */  beqz       $v0, .L8004D0F8
    /* 3D0DC 8004D0DC 21205702 */   addu      $a0, $s2, $s7
    /* 3D0E0 8004D0E0 21287602 */  addu       $a1, $s3, $s6
    /* 3D0E4 8004D0E4 E20B020C */  jal        GetBLOCK__Fii
    /* 3D0E8 8004D0E8 6000A6AF */   sw        $a2, 0x60($sp)
    /* 3D0EC 8004D0EC 6000A68F */  lw         $a2, 0x60($sp)
    /* 3D0F0 8004D0F0 02004014 */  bnez       $v0, .L8004D0FC
    /* 3D0F4 8004D0F4 00000000 */   nop
  .L8004D0F8:
    /* 3D0F8 8004D0F8 01001024 */  addiu      $s0, $zero, 0x1
  .L8004D0FC:
    /* 3D0FC 8004D0FC 38000012 */  beqz       $s0, .L8004D1E0
    /* 3D100 8004D100 00000000 */   nop
    /* 3D104 8004D104 2800A293 */  lbu        $v0, 0x28($sp)
    /* 3D108 8004D108 00000000 */  nop
    /* 3D10C 8004D10C 1A004010 */  beqz       $v0, .L8004D178
    /* 3D110 8004D110 C0101300 */   sll       $v0, $s3, 3
    /* 3D114 8004D114 C0181200 */  sll        $v1, $s2, 3
    /* 3D118 8004D118 23187200 */  subu       $v1, $v1, $s2
    /* 3D11C 8004D11C C0190300 */  sll        $v1, $v1, 7
    /* 3D120 8004D120 21804300 */  addu       $s0, $v0, $v1
    /* 3D124 8004D124 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3D128 8004D128 21083000 */  addu       $at, $at, $s0
    /* 3D12C 8004D12C 2E7A2280 */  lb         $v0, %lo(dung_map + 0x6)($at)
    /* 3D130 8004D130 00000000 */  nop
    /* 3D134 8004D134 08004004 */  bltz       $v0, .L8004D158
    /* 3D138 8004D138 21204002 */   addu      $a0, $s2, $zero
    /* 3D13C 8004D13C 21286002 */  addu       $a1, $s3, $zero
    /* 3D140 8004D140 AA02020C */  jal        SetAutomapView__Fii
    /* 3D144 8004D144 6000A6AF */   sw        $a2, 0x60($sp)
    /* 3D148 8004D148 01004426 */  addiu      $a0, $s2, 0x1
    /* 3D14C 8004D14C AA02020C */  jal        SetAutomapView__Fii
    /* 3D150 8004D150 21286002 */   addu      $a1, $s3, $zero
    /* 3D154 8004D154 6000A68F */  lw         $a2, 0x60($sp)
  .L8004D158:
    /* 3D158 8004D158 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3D15C 8004D15C 21083000 */  addu       $at, $at, $s0
    /* 3D160 8004D160 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 3D164 8004D164 00000000 */  nop
    /* 3D168 8004D168 80004234 */  ori        $v0, $v0, 0x80
    /* 3D16C 8004D16C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3D170 8004D170 21083000 */  addu       $at, $at, $s0
    /* 3D174 8004D174 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
  .L8004D178:
    /* 3D178 8004D178 C0101300 */  sll        $v0, $s3, 3
    /* 3D17C 8004D17C C0181200 */  sll        $v1, $s2, 3
    /* 3D180 8004D180 23187200 */  subu       $v1, $v1, $s2
    /* 3D184 8004D184 C0190300 */  sll        $v1, $v1, 7
    /* 3D188 8004D188 21184300 */  addu       $v1, $v0, $v1
    /* 3D18C 8004D18C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3D190 8004D190 21082300 */  addu       $at, $at, $v1
    /* 3D194 8004D194 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 3D198 8004D198 4000A98F */  lw         $t1, 0x40($sp)
    /* 3D19C 8004D19C 00000000 */  nop
    /* 3D1A0 8004D1A0 25104900 */  or         $v0, $v0, $t1
    /* 3D1A4 8004D1A4 04004234 */  ori        $v0, $v0, 0x4
    /* 3D1A8 8004D1A8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 3D1AC 8004D1AC 21082300 */  addu       $at, $at, $v1
    /* 3D1B0 8004D1B0 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 3D1B4 8004D1B4 0A00C014 */  bnez       $a2, .L8004D1E0
    /* 3D1B8 8004D1B8 00000000 */   nop
    /* 3D1BC 8004D1BC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 3D1C0 8004D1C0 21082300 */  addu       $at, $at, $v1
    /* 3D1C4 8004D1C4 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 3D1C8 8004D1C8 00000000 */  nop
    /* 3D1CC 8004D1CC 04006010 */  beqz       $v1, .L8004D1E0
    /* 3D1D0 8004D1D0 01000224 */   addiu     $v0, $zero, 0x1
    /* 3D1D4 8004D1D4 0E80013C */  lui        $at, %hi(TransList)
    /* 3D1D8 8004D1D8 21082300 */  addu       $at, $at, $v1
    /* 3D1DC 8004D1DC 287922A0 */  sb         $v0, %lo(TransList)($at)
  .L8004D1E0:
    /* 3D1E0 8004D1E0 3000A88F */  lw         $t0, 0x30($sp)
    /* 3D1E4 8004D1E4 4800A98F */  lw         $t1, 0x48($sp)
    /* 3D1E8 8004D1E8 02003126 */  addiu      $s1, $s1, 0x2
    /* 3D1EC 8004D1EC 21100901 */  addu       $v0, $t0, $t1
    /* 3D1F0 8004D1F0 2A102202 */  slt        $v0, $s1, $v0
    /* 3D1F4 8004D1F4 03004010 */  beqz       $v0, .L8004D204
    /* 3D1F8 8004D1F8 00000000 */   nop
    /* 3D1FC 8004D1FC 67FFC010 */  beqz       $a2, .L8004CF9C
    /* 3D200 8004D200 21A80000 */   addu      $s5, $zero, $zero
  .L8004D204:
    /* 3D204 8004D204 5800A88F */  lw         $t0, 0x58($sp)
    /* 3D208 8004D208 3800A98F */  lw         $t1, 0x38($sp)
    /* 3D20C 8004D20C 1E000825 */  addiu      $t0, $t0, 0x1E
    /* 3D210 8004D210 01002925 */  addiu      $t1, $t1, 0x1
    /* 3D214 8004D214 17002229 */  slti       $v0, $t1, 0x17
    /* 3D218 8004D218 5800A8AF */  sw         $t0, 0x58($sp)
    /* 3D21C 8004D21C 51FF4014 */  bnez       $v0, .L8004CF64
    /* 3D220 8004D220 3800A9AF */   sw        $t1, 0x38($sp)
    /* 3D224 8004D224 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 3D228 8004D228 0400C22B */  slti       $v0, $fp, 0x4
    /* 3D22C 8004D22C 49FF4014 */  bnez       $v0, .L8004CF54
    /* 3D230 8004D230 00000000 */   nop
    /* 3D234 8004D234 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* 3D238 8004D238 8800BE8F */  lw         $fp, 0x88($sp)
    /* 3D23C 8004D23C 8400B78F */  lw         $s7, 0x84($sp)
    /* 3D240 8004D240 8000B68F */  lw         $s6, 0x80($sp)
    /* 3D244 8004D244 7C00B58F */  lw         $s5, 0x7C($sp)
    /* 3D248 8004D248 7800B48F */  lw         $s4, 0x78($sp)
    /* 3D24C 8004D24C 7400B38F */  lw         $s3, 0x74($sp)
    /* 3D250 8004D250 7000B28F */  lw         $s2, 0x70($sp)
    /* 3D254 8004D254 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 3D258 8004D258 6800B08F */  lw         $s0, 0x68($sp)
    /* 3D25C 8004D25C 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 3D260 8004D260 0800E003 */  jr         $ra
    /* 3D264 8004D264 00000000 */   nop
endlabel DoVision__FiiiUcUc
