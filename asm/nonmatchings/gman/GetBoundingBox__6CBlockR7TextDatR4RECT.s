.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetBoundingBox__6CBlockR7TextDatR4RECT, 0x15C

glabel GetBoundingBox__6CBlockR7TextDatR4RECT
    /* 84F24 80094F24 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 84F28 80094F28 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 84F2C 80094F2C 21988000 */  addu       $s3, $a0, $zero
    /* 84F30 80094F30 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 84F34 80094F34 21B8A000 */  addu       $s7, $a1, $zero
    /* 84F38 80094F38 4400BFAF */  sw         $ra, 0x44($sp)
    /* 84F3C 80094F3C 4000BEAF */  sw         $fp, 0x40($sp)
    /* 84F40 80094F40 3800B6AF */  sw         $s6, 0x38($sp)
    /* 84F44 80094F44 3400B5AF */  sw         $s5, 0x34($sp)
    /* 84F48 80094F48 3000B4AF */  sw         $s4, 0x30($sp)
    /* 84F4C 80094F4C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 84F50 80094F50 2400B1AF */  sw         $s1, 0x24($sp)
    /* 84F54 80094F54 2000B0AF */  sw         $s0, 0x20($sp)
    /* 84F58 80094F58 0000628E */  lw         $v0, 0x0($s3)
    /* 84F5C 80094F5C 00000000 */  nop
    /* 84F60 80094F60 30004010 */  beqz       $v0, .L80095024
    /* 84F64 80094F64 21F0C000 */   addu      $fp, $a2, $zero
    /* 84F68 80094F68 04006426 */  addiu      $a0, $s3, 0x4
    /* 84F6C 80094F6C AA53020C */  jal        SetRect__5CPartR7TextDatR4RECT
    /* 84F70 80094F70 1000A627 */   addiu     $a2, $sp, 0x10
    /* 84F74 80094F74 21800000 */  addu       $s0, $zero, $zero
    /* 84F78 80094F78 1000B287 */  lh         $s2, 0x10($sp)
    /* 84F7C 80094F7C 1400A287 */  lh         $v0, 0x14($sp)
    /* 84F80 80094F80 1200B187 */  lh         $s1, 0x12($sp)
    /* 84F84 80094F84 21B04202 */  addu       $s6, $s2, $v0
    /* 84F88 80094F88 1600A287 */  lh         $v0, 0x16($sp)
    /* 84F8C 80094F8C 0000638E */  lw         $v1, 0x0($s3)
    /* 84F90 80094F90 00000000 */  nop
    /* 84F94 80094F94 27006010 */  beqz       $v1, .L80095034
    /* 84F98 80094F98 21A82202 */   addu      $s5, $s1, $v0
    /* 84F9C 80094F9C 04001424 */  addiu      $s4, $zero, 0x4
  .L80094FA0:
    /* 84FA0 80094FA0 21207402 */  addu       $a0, $s3, $s4
    /* 84FA4 80094FA4 2128E002 */  addu       $a1, $s7, $zero
    /* 84FA8 80094FA8 AA53020C */  jal        SetRect__5CPartR7TextDatR4RECT
    /* 84FAC 80094FAC 1000A627 */   addiu     $a2, $sp, 0x10
    /* 84FB0 80094FB0 1000A587 */  lh         $a1, 0x10($sp)
    /* 84FB4 80094FB4 1400A287 */  lh         $v0, 0x14($sp)
    /* 84FB8 80094FB8 00000000 */  nop
    /* 84FBC 80094FBC 2118A200 */  addu       $v1, $a1, $v0
    /* 84FC0 80094FC0 2A10C302 */  slt        $v0, $s6, $v1
    /* 84FC4 80094FC4 02004010 */  beqz       $v0, .L80094FD0
    /* 84FC8 80094FC8 00000000 */   nop
    /* 84FCC 80094FCC 21B06000 */  addu       $s6, $v1, $zero
  .L80094FD0:
    /* 84FD0 80094FD0 1200A487 */  lh         $a0, 0x12($sp)
    /* 84FD4 80094FD4 1600A287 */  lh         $v0, 0x16($sp)
    /* 84FD8 80094FD8 00000000 */  nop
    /* 84FDC 80094FDC 21188200 */  addu       $v1, $a0, $v0
    /* 84FE0 80094FE0 2A10A302 */  slt        $v0, $s5, $v1
    /* 84FE4 80094FE4 02004010 */  beqz       $v0, .L80094FF0
    /* 84FE8 80094FE8 2A10B200 */   slt       $v0, $a1, $s2
    /* 84FEC 80094FEC 21A86000 */  addu       $s5, $v1, $zero
  .L80094FF0:
    /* 84FF0 80094FF0 02004010 */  beqz       $v0, .L80094FFC
    /* 84FF4 80094FF4 2A109100 */   slt       $v0, $a0, $s1
    /* 84FF8 80094FF8 2190A000 */  addu       $s2, $a1, $zero
  .L80094FFC:
    /* 84FFC 80094FFC 02004010 */  beqz       $v0, .L80095008
    /* 85000 80095000 00000000 */   nop
    /* 85004 80095004 21888000 */  addu       $s1, $a0, $zero
  .L80095008:
    /* 85008 80095008 0000628E */  lw         $v0, 0x0($s3)
    /* 8500C 8009500C 01001026 */  addiu      $s0, $s0, 0x1
    /* 85010 80095010 2B100202 */  sltu       $v0, $s0, $v0
    /* 85014 80095014 E2FF4014 */  bnez       $v0, .L80094FA0
    /* 85018 80095018 08009426 */   addiu     $s4, $s4, 0x8
    /* 8501C 8009501C 0E540208 */  j          .L80095038
    /* 85020 80095020 2310D202 */   subu      $v0, $s6, $s2
  .L80095024:
    /* 85024 80095024 21900000 */  addu       $s2, $zero, $zero
    /* 85028 80095028 21B00000 */  addu       $s6, $zero, $zero
    /* 8502C 8009502C 21880000 */  addu       $s1, $zero, $zero
    /* 85030 80095030 21A80000 */  addu       $s5, $zero, $zero
  .L80095034:
    /* 85034 80095034 2310D202 */  subu       $v0, $s6, $s2
  .L80095038:
    /* 85038 80095038 0400C2A7 */  sh         $v0, 0x4($fp)
    /* 8503C 8009503C 2310B102 */  subu       $v0, $s5, $s1
    /* 85040 80095040 0000D2A7 */  sh         $s2, 0x0($fp)
    /* 85044 80095044 0200D1A7 */  sh         $s1, 0x2($fp)
    /* 85048 80095048 0600C2A7 */  sh         $v0, 0x6($fp)
    /* 8504C 8009504C 4400BF8F */  lw         $ra, 0x44($sp)
    /* 85050 80095050 4000BE8F */  lw         $fp, 0x40($sp)
    /* 85054 80095054 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 85058 80095058 3800B68F */  lw         $s6, 0x38($sp)
    /* 8505C 8009505C 3400B58F */  lw         $s5, 0x34($sp)
    /* 85060 80095060 3000B48F */  lw         $s4, 0x30($sp)
    /* 85064 80095064 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 85068 80095068 2800B28F */  lw         $s2, 0x28($sp)
    /* 8506C 8009506C 2400B18F */  lw         $s1, 0x24($sp)
    /* 85070 80095070 2000B08F */  lw         $s0, 0x20($sp)
    /* 85074 80095074 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 85078 80095078 0800E003 */  jr         $ra
    /* 8507C 8009507C 00000000 */   nop
endlabel GetBoundingBox__6CBlockR7TextDatR4RECT
