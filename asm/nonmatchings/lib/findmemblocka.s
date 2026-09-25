.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findmemblocka, 0x108

glabel findmemblocka
    /* 1ADBC 8002ADBC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1ADC0 8002ADC0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1ADC4 8002ADC4 21808000 */  addu       $s0, $a0, $zero
    /* 1ADC8 8002ADC8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1ADCC 8002ADCC 2188A000 */  addu       $s1, $a1, $zero
    /* 1ADD0 8002ADD0 35000012 */  beqz       $s0, .L8002AEA8
    /* 1ADD4 8002ADD4 1800BFAF */   sw        $ra, 0x18($sp)
    /* 1ADD8 8002ADD8 4C1D828F */  lw         $v0, %gp_rel(findmemcallback)($gp)
    /* 1ADDC 8002ADDC 01000424 */  addiu      $a0, $zero, 0x1
    /* 1ADE0 8002ADE0 09F84000 */  jalr       $v0
    /* 1ADE4 8002ADE4 21280002 */   addu      $a1, $s0, $zero
    /* 1ADE8 8002ADE8 21300000 */  addu       $a2, $zero, $zero
    /* 1ADEC 8002ADEC 21280000 */  addu       $a1, $zero, $zero
  .L8002ADF0:
    /* 1ADF0 8002ADF0 1380013C */  lui        $at, %hi(D_80137A34)
    /* 1ADF4 8002ADF4 21082500 */  addu       $at, $at, $a1
    /* 1ADF8 8002ADF8 347A228C */  lw         $v0, %lo(D_80137A34)($at)
    /* 1ADFC 8002ADFC 00000000 */  nop
    /* 1AE00 8002AE00 14004010 */  beqz       $v0, .L8002AE54
    /* 1AE04 8002AE04 21204000 */   addu      $a0, $v0, $zero
    /* 1AE08 8002AE08 1380013C */  lui        $at, %hi(memclass)
    /* 1AE0C 8002AE0C 21082500 */  addu       $at, $at, $a1
    /* 1AE10 8002AE10 307A238C */  lw         $v1, %lo(memclass)($at)
  .L8002AE14:
    /* 1AE14 8002AE14 00000000 */  nop
    /* 1AE18 8002AE18 2000638C */  lw         $v1, 0x20($v1)
    /* 1AE1C 8002AE1C 00000000 */  nop
    /* 1AE20 8002AE20 0000628C */  lw         $v0, 0x0($v1)
    /* 1AE24 8002AE24 00000000 */  nop
    /* 1AE28 8002AE28 03005010 */  beq        $v0, $s0, .L8002AE38
    /* 1AE2C 8002AE2C 00000000 */   nop
    /* 1AE30 8002AE30 F8FF6414 */  bne        $v1, $a0, .L8002AE14
    /* 1AE34 8002AE34 00000000 */   nop
  .L8002AE38:
    /* 1AE38 8002AE38 1800628C */  lw         $v0, 0x18($v1)
    /* 1AE3C 8002AE3C 00000000 */  nop
    /* 1AE40 8002AE40 00804230 */  andi       $v0, $v0, 0x8000
    /* 1AE44 8002AE44 04004014 */  bnez       $v0, .L8002AE58
    /* 1AE48 8002AE48 0100C624 */   addiu     $a2, $a2, 0x1
    /* 1AE4C 8002AE4C ABAB0008 */  j          .L8002AEAC
    /* 1AE50 8002AE50 21106000 */   addu      $v0, $v1, $zero
  .L8002AE54:
    /* 1AE54 8002AE54 0100C624 */  addiu      $a2, $a2, 0x1
  .L8002AE58:
    /* 1AE58 8002AE58 1000C228 */  slti       $v0, $a2, 0x10
    /* 1AE5C 8002AE5C E4FF4014 */  bnez       $v0, .L8002ADF0
    /* 1AE60 8002AE60 1800A524 */   addiu     $a1, $a1, 0x18
    /* 1AE64 8002AE64 4C1D828F */  lw         $v0, %gp_rel(findmemcallback)($gp)
    /* 1AE68 8002AE68 01000424 */  addiu      $a0, $zero, 0x1
    /* 1AE6C 8002AE6C 09F84000 */  jalr       $v0
    /* 1AE70 8002AE70 21280002 */   addu      $a1, $s0, $zero
    /* 1AE74 8002AE74 0D002012 */  beqz       $s1, .L8002AEAC
    /* 1AE78 8002AE78 21100000 */   addu      $v0, $zero, $zero
    /* 1AE7C 8002AE7C 1180043C */  lui        $a0, %hi(D_8010F768)
    /* 1AE80 8002AE80 68F78424 */  addiu      $a0, $a0, %lo(D_8010F768)
    /* 1AE84 8002AE84 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1AE88 8002AE88 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1AE8C 8002AE8C 1280013C */  lui        $at, %hi(abortfile)
    /* 1AE90 8002AE90 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1AE94 8002AE94 EB020224 */  addiu      $v0, $zero, 0x2EB
    /* 1AE98 8002AE98 1280013C */  lui        $at, %hi(abortline)
    /* 1AE9C 8002AE9C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1AEA0 8002AEA0 0F95000C */  jal        abortmessage
    /* 1AEA4 8002AEA4 21280002 */   addu      $a1, $s0, $zero
  .L8002AEA8:
    /* 1AEA8 8002AEA8 21100000 */  addu       $v0, $zero, $zero
  .L8002AEAC:
    /* 1AEAC 8002AEAC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1AEB0 8002AEB0 1400B18F */  lw         $s1, 0x14($sp)
    /* 1AEB4 8002AEB4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1AEB8 8002AEB8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1AEBC 8002AEBC 0800E003 */  jr         $ra
    /* 1AEC0 8002AEC0 00000000 */   nop
endlabel findmemblocka
