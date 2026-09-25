.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckDirOk__FP10BIRDSTRUCT, 0x110

glabel CheckDirOk__FP10BIRDSTRUCT
    /* 9BFE0 800ABFE0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 9BFE4 800ABFE4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9BFE8 800ABFE8 21988000 */  addu       $s3, $a0, $zero
    /* 9BFEC 800ABFEC 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 9BFF0 800ABFF0 21B80000 */  addu       $s7, $zero, $zero
    /* 9BFF4 800ABFF4 3000BFAF */  sw         $ra, 0x30($sp)
    /* 9BFF8 800ABFF8 2800B6AF */  sw         $s6, 0x28($sp)
    /* 9BFFC 800ABFFC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 9C000 800AC000 2000B4AF */  sw         $s4, 0x20($sp)
    /* 9C004 800AC004 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9C008 800AC008 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9C00C 800AC00C 1000B0AF */  sw         $s0, 0x10($sp)
  .L800AC010:
    /* 9C010 800AC010 0800E22A */  slti       $v0, $s7, 0x8
    /* 9C014 800AC014 2A004010 */  beqz       $v0, .L800AC0C0
    /* 9C018 800AC018 01001624 */   addiu     $s6, $zero, 0x1
    /* 9C01C 800AC01C 21900000 */  addu       $s2, $zero, $zero
    /* 9C020 800AC020 04007186 */  lh         $s1, 0x4($s3)
    /* 9C024 800AC024 0C006282 */  lb         $v0, 0xC($s3)
    /* 9C028 800AC028 06007086 */  lh         $s0, 0x6($s3)
    /* 9C02C 800AC02C 1280013C */  lui        $at, %hi(offset_x)
    /* 9C030 800AC030 21082200 */  addu       $at, $at, $v0
    /* 9C034 800AC034 A8C23580 */  lb         $s5, %lo(offset_x)($at)
    /* 9C038 800AC038 1280013C */  lui        $at, %hi(offset_y)
    /* 9C03C 800AC03C 21082200 */  addu       $at, $at, $v0
    /* 9C040 800AC040 B0C23480 */  lb         $s4, %lo(offset_y)($at)
    /* 9C044 800AC044 C3201100 */  sra        $a0, $s1, 3
  .L800AC048:
    /* 9C048 800AC048 1383010C */  jal        SolidLoc__Fii
    /* 9C04C 800AC04C C3281000 */   sra       $a1, $s0, 3
    /* 9C050 800AC050 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9C054 800AC054 03004010 */  beqz       $v0, .L800AC064
    /* 9C058 800AC058 00000000 */   nop
    /* 9C05C 800AC05C 1BB00208 */  j          .L800AC06C
    /* 9C060 800AC060 21B00000 */   addu      $s6, $zero, $zero
  .L800AC064:
    /* 9C064 800AC064 21883502 */  addu       $s1, $s1, $s5
    /* 9C068 800AC068 21801402 */  addu       $s0, $s0, $s4
  .L800AC06C:
    /* 9C06C 800AC06C 01005226 */  addiu      $s2, $s2, 0x1
    /* 9C070 800AC070 3200422A */  slti       $v0, $s2, 0x32
    /* 9C074 800AC074 F4FF4014 */  bnez       $v0, .L800AC048
    /* 9C078 800AC078 C3201100 */   sra       $a0, $s1, 3
    /* 9C07C 800AC07C 1000C016 */  bnez       $s6, .L800AC0C0
    /* 9C080 800AC080 00000000 */   nop
    /* 9C084 800AC084 0C006392 */  lbu        $v1, 0xC($s3)
    /* 9C088 800AC088 00000000 */  nop
    /* 9C08C 800AC08C 01006324 */  addiu      $v1, $v1, 0x1
    /* 9C090 800AC090 00160300 */  sll        $v0, $v1, 24
    /* 9C094 800AC094 03260200 */  sra        $a0, $v0, 24
    /* 9C098 800AC098 21108000 */  addu       $v0, $a0, $zero
    /* 9C09C 800AC09C 02008104 */  bgez       $a0, .L800AC0A8
    /* 9C0A0 800AC0A0 0C0063A2 */   sb        $v1, 0xC($s3)
    /* 9C0A4 800AC0A4 07008224 */  addiu      $v0, $a0, 0x7
  .L800AC0A8:
    /* 9C0A8 800AC0A8 C3100200 */  sra        $v0, $v0, 3
    /* 9C0AC 800AC0AC C0100200 */  sll        $v0, $v0, 3
    /* 9C0B0 800AC0B0 23108200 */  subu       $v0, $a0, $v0
    /* 9C0B4 800AC0B4 0C0062A2 */  sb         $v0, 0xC($s3)
    /* 9C0B8 800AC0B8 04B00208 */  j          .L800AC010
    /* 9C0BC 800AC0BC 0100F726 */   addiu     $s7, $s7, 0x1
  .L800AC0C0:
    /* 9C0C0 800AC0C0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 9C0C4 800AC0C4 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 9C0C8 800AC0C8 2800B68F */  lw         $s6, 0x28($sp)
    /* 9C0CC 800AC0CC 2400B58F */  lw         $s5, 0x24($sp)
    /* 9C0D0 800AC0D0 2000B48F */  lw         $s4, 0x20($sp)
    /* 9C0D4 800AC0D4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9C0D8 800AC0D8 1800B28F */  lw         $s2, 0x18($sp)
    /* 9C0DC 800AC0DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 9C0E0 800AC0E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C0E4 800AC0E4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 9C0E8 800AC0E8 0800E003 */  jr         $ra
    /* 9C0EC 800AC0EC 00000000 */   nop
endlabel CheckDirOk__FP10BIRDSTRUCT
