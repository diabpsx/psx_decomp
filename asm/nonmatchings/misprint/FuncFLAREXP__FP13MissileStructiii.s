.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFLAREXP__FP13MissileStructiii, 0x17C

glabel FuncFLAREXP__FP13MissileStructiii
    /* 6CEBC 8007CEBC A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 6CEC0 8007CEC0 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6CEC4 8007CEC4 21808000 */  addu       $s0, $a0, $zero
    /* 6CEC8 8007CEC8 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6CECC 8007CECC 21A00000 */  addu       $s4, $zero, $zero
    /* 6CED0 8007CED0 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 6CED4 8007CED4 21A80000 */  addu       $s5, $zero, $zero
    /* 6CED8 8007CED8 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6CEDC 8007CEDC 21900000 */  addu       $s2, $zero, $zero
    /* 6CEE0 8007CEE0 5000B6AF */  sw         $s6, 0x50($sp)
    /* 6CEE4 8007CEE4 5400BFAF */  sw         $ra, 0x54($sp)
    /* 6CEE8 8007CEE8 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6CEEC 8007CEEC 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6CEF0 8007CEF0 28000286 */  lh         $v0, 0x28($s0)
    /* 6CEF4 8007CEF4 2A000386 */  lh         $v1, 0x2A($s0)
    /* 6CEF8 8007CEF8 2188A200 */  addu       $s1, $a1, $v0
    /* 6CEFC 8007CEFC 2198C300 */  addu       $s3, $a2, $v1
    /* 6CF00 8007CF00 37000392 */  lbu        $v1, 0x37($s0)
    /* 6CF04 8007CF04 29000224 */  addiu      $v0, $zero, 0x29
    /* 6CF08 8007CF08 11006210 */  beq        $v1, $v0, .L8007CF50
    /* 6CF0C 8007CF0C 21B0E000 */   addu      $s6, $a3, $zero
    /* 6CF10 8007CF10 2A006228 */  slti       $v0, $v1, 0x2A
    /* 6CF14 8007CF14 05004010 */  beqz       $v0, .L8007CF2C
    /* 6CF18 8007CF18 17000224 */   addiu     $v0, $zero, 0x17
    /* 6CF1C 8007CF1C 08006210 */  beq        $v1, $v0, .L8007CF40
    /* 6CF20 8007CF20 00000000 */   nop
    /* 6CF24 8007CF24 D9F30108 */  j          .L8007CF64
    /* 6CF28 8007CF28 00000000 */   nop
  .L8007CF2C:
    /* 6CF2C 8007CF2C 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 6CF30 8007CF30 09006210 */  beq        $v1, $v0, .L8007CF58
    /* 6CF34 8007CF34 2D000224 */   addiu     $v0, $zero, 0x2D
    /* 6CF38 8007CF38 0A006214 */  bne        $v1, $v0, .L8007CF64
    /* 6CF3C 8007CF3C 00000000 */   nop
  .L8007CF40:
    /* 6CF40 8007CF40 F0001424 */  addiu      $s4, $zero, 0xF0
    /* 6CF44 8007CF44 21A80000 */  addu       $s5, $zero, $zero
    /* 6CF48 8007CF48 E1F30108 */  j          .L8007CF84
    /* 6CF4C 8007CF4C 21900000 */   addu      $s2, $zero, $zero
  .L8007CF50:
    /* 6CF50 8007CF50 E1F30108 */  j          .L8007CF84
    /* 6CF54 8007CF54 F0001224 */   addiu     $s2, $zero, 0xF0
  .L8007CF58:
    /* 6CF58 8007CF58 F0001424 */  addiu      $s4, $zero, 0xF0
    /* 6CF5C 8007CF5C E1F30108 */  j          .L8007CF84
    /* 6CF60 8007CF60 F0001524 */   addiu     $s5, $zero, 0xF0
  .L8007CF64:
    /* 6CF64 8007CF64 1280023C */  lui        $v0, %hi(D_80118CBC)
    /* 6CF68 8007CF68 BC8C4224 */  addiu      $v0, $v0, %lo(D_80118CBC)
    /* 6CF6C 8007CF6C 05004010 */  beqz       $v0, .L8007CF84
    /* 6CF70 8007CF70 21200000 */   addu      $a0, $zero, $zero
    /* 6CF74 8007CF74 1280053C */  lui        $a1, %hi(D_80118CE0)
    /* 6CF78 8007CF78 E08CA524 */  addiu      $a1, $a1, %lo(D_80118CE0)
    /* 6CF7C 8007CF7C A583000C */  jal        DBG_Error
    /* 6CF80 8007CF80 19020624 */   addiu     $a2, $zero, 0x219
  .L8007CF84:
    /* 6CF84 8007CF84 42000382 */  lb         $v1, 0x42($s0)
    /* 6CF88 8007CF88 00800234 */  ori        $v0, $zero, 0x8000
    /* 6CF8C 8007CF8C 1A004300 */  div        $zero, $v0, $v1
    /* 6CF90 8007CF90 12100000 */  mflo       $v0
    /* 6CF94 8007CF94 47000382 */  lb         $v1, 0x47($s0)
    /* 6CF98 8007CF98 00000000 */  nop
    /* 6CF9C 8007CF9C 18006200 */  mult       $v1, $v0
    /* 6CFA0 8007CFA0 21202002 */  addu       $a0, $s1, $zero
    /* 6CFA4 8007CFA4 F4FF6526 */  addiu      $a1, $s3, -0xC
    /* 6CFA8 8007CFA8 21308002 */  addu       $a2, $s4, $zero
    /* 6CFAC 8007CFAC 1000B2AF */  sw         $s2, 0x10($sp)
    /* 6CFB0 8007CFB0 47000282 */  lb         $v0, 0x47($s0)
    /* 6CFB4 8007CFB4 2138A002 */  addu       $a3, $s5, $zero
    /* 6CFB8 8007CFB8 80100200 */  sll        $v0, $v0, 2
    /* 6CFBC 8007CFBC 18004224 */  addiu      $v0, $v0, 0x18
    /* 6CFC0 8007CFC0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6CFC4 8007CFC4 61000224 */  addiu      $v0, $zero, 0x61
    /* 6CFC8 8007CFC8 12400000 */  mflo       $t0
    /* 6CFCC 8007CFCC 021A0800 */  srl        $v1, $t0, 8
    /* 6CFD0 8007CFD0 23104300 */  subu       $v0, $v0, $v1
    /* 6CFD4 8007CFD4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6CFD8 8007CFD8 47000382 */  lb         $v1, 0x47($s0)
    /* 6CFDC 8007CFDC FFFFC226 */  addiu      $v0, $s6, -0x1
    /* 6CFE0 8007CFE0 2400A2AF */  sw         $v0, 0x24($sp)
    /* 6CFE4 8007CFE4 01000224 */  addiu      $v0, $zero, 0x1
    /* 6CFE8 8007CFE8 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6CFEC 8007CFEC 08000224 */  addiu      $v0, $zero, 0x8
    /* 6CFF0 8007CFF0 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6CFF4 8007CFF4 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 6CFF8 8007CFF8 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6CFFC 8007CFFC 40100300 */  sll        $v0, $v1, 1
    /* 6D000 8007D000 21104300 */  addu       $v0, $v0, $v1
    /* 6D004 8007D004 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6D008 8007D008 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 6D00C 8007D00C 5400BF8F */  lw         $ra, 0x54($sp)
    /* 6D010 8007D010 5000B68F */  lw         $s6, 0x50($sp)
    /* 6D014 8007D014 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 6D018 8007D018 4800B48F */  lw         $s4, 0x48($sp)
    /* 6D01C 8007D01C 4400B38F */  lw         $s3, 0x44($sp)
    /* 6D020 8007D020 4000B28F */  lw         $s2, 0x40($sp)
    /* 6D024 8007D024 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6D028 8007D028 3800B08F */  lw         $s0, 0x38($sp)
    /* 6D02C 8007D02C 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 6D030 8007D030 0800E003 */  jr         $ra
    /* 6D034 8007D034 00000000 */   nop
endlabel FuncFLAREXP__FP13MissileStructiii
