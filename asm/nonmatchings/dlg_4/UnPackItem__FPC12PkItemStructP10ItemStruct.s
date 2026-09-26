.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UnPackItem__FPC12PkItemStructP10ItemStruct, 0x134

glabel UnPackItem__FPC12PkItemStructP10ItemStruct
    /* 211B4 8015ADAC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 211B8 8015ADB0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 211BC 8015ADB4 21808000 */  addu       $s0, $a0, $zero
    /* 211C0 8015ADB8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 211C4 8015ADBC 2198A000 */  addu       $s3, $a1, $zero
    /* 211C8 8015ADC0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 211CC 8015ADC4 0A001196 */  lhu        $s1, 0xA($s0)
    /* 211D0 8015ADC8 FFFF0234 */  ori        $v0, $zero, 0xFFFF
    /* 211D4 8015ADCC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 211D8 8015ADD0 04002216 */  bne        $s1, $v0, .L8015ADE4
    /* 211DC 8015ADD4 2000B2AF */   sw        $s2, 0x20($sp)
    /* 211E0 8015ADD8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 211E4 8015ADDC B06B0508 */  j          .L8015AEC0
    /* 211E8 8015ADE0 2C0062A6 */   sh        $v0, 0x2C($s3)
  .L8015ADE4:
    /* 211EC 8015ADE4 7F000424 */  addiu      $a0, $zero, 0x7F
    /* 211F0 8015ADE8 0C001296 */  lhu        $s2, 0xC($s0)
    /* 211F4 8015ADEC 0000028E */  lw         $v0, 0x0($s0)
    /* 211F8 8015ADF0 08000696 */  lhu        $a2, 0x8($s0)
    /* 211FC 8015ADF4 0400078E */  lw         $a3, 0x4($s0)
    /* 21200 8015ADF8 21282002 */  addu       $a1, $s1, $zero
    /* 21204 8015ADFC 1000B2AF */  sw         $s2, 0x10($sp)
    /* 21208 8015AE00 852E010C */  jal        RecreateItem__FiiUsiii
    /* 2120C 8015AE04 1400A2AF */   sw        $v0, 0x14($sp)
    /* 21210 8015AE08 0D80083C */  lui        $t0, %hi(item + 0x35E5)
    /* 21214 8015AE0C 39530825 */  addiu      $t0, $t0, %lo(item + 0x35E5)
    /* 21218 8015AE10 0E000392 */  lbu        $v1, 0xE($s0)
    /* 2121C 8015AE14 10000492 */  lbu        $a0, 0x10($s0)
    /* 21220 8015AE18 11000592 */  lbu        $a1, 0x11($s0)
    /* 21224 8015AE1C 12000692 */  lbu        $a2, 0x12($s0)
    /* 21228 8015AE20 42100300 */  srl        $v0, $v1, 1
    /* 2122C 8015AE24 000002A1 */  sb         $v0, 0x0($t0)
    /* 21230 8015AE28 0F000292 */  lbu        $v0, 0xF($s0)
    /* 21234 8015AE2C 01006330 */  andi       $v1, $v1, 0x1
    /* 21238 8015AE30 0D80013C */  lui        $at, %hi(item + 0x35FD)
    /* 2123C 8015AE34 515323A0 */  sb         $v1, %lo(item + 0x35FD)($at)
    /* 21240 8015AE38 0D80013C */  lui        $at, %hi(item + 0x35D4)
    /* 21244 8015AE3C 285324A4 */  sh         $a0, %lo(item + 0x35D4)($at)
    /* 21248 8015AE40 0D80013C */  lui        $at, %hi(item + 0x35DD)
    /* 2124C 8015AE44 315325A0 */  sb         $a1, %lo(item + 0x35DD)($at)
    /* 21250 8015AE48 0D80013C */  lui        $at, %hi(item + 0x35DF)
    /* 21254 8015AE4C 335326A0 */  sb         $a2, %lo(item + 0x35DF)($at)
    /* 21258 8015AE50 0D80013C */  lui        $at, %hi(item + 0x35D2)
    /* 2125C 8015AE54 265322A4 */  sh         $v0, %lo(item + 0x35D2)($at)
    /* 21260 8015AE58 05002012 */  beqz       $s1, .L8015AE70
    /* 21264 8015AE5C 02121200 */   srl       $v0, $s2, 8
    /* 21268 8015AE60 0D80013C */  lui        $at, %hi(item + 0x35DE)
    /* 2126C 8015AE64 325322A0 */  sb         $v0, %lo(item + 0x35DE)($at)
    /* 21270 8015AE68 0D80013C */  lui        $at, %hi(item + 0x35D0)
    /* 21274 8015AE6C 245332A0 */  sb         $s2, %lo(item + 0x35D0)($at)
  .L8015AE70:
    /* 21278 8015AE70 21386002 */  addu       $a3, $s3, $zero
    /* 2127C 8015AE74 AFFF0625 */  addiu      $a2, $t0, -0x51
    /* 21280 8015AE78 0F000825 */  addiu      $t0, $t0, 0xF
  .L8015AE7C:
    /* 21284 8015AE7C 0000C28C */  lw         $v0, 0x0($a2)
    /* 21288 8015AE80 0400C38C */  lw         $v1, 0x4($a2)
    /* 2128C 8015AE84 0800C48C */  lw         $a0, 0x8($a2)
    /* 21290 8015AE88 0C00C58C */  lw         $a1, 0xC($a2)
    /* 21294 8015AE8C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 21298 8015AE90 0400E3AC */  sw         $v1, 0x4($a3)
    /* 2129C 8015AE94 0800E4AC */  sw         $a0, 0x8($a3)
    /* 212A0 8015AE98 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 212A4 8015AE9C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 212A8 8015AEA0 F6FFC814 */  bne        $a2, $t0, .L8015AE7C
    /* 212AC 8015AEA4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 212B0 8015AEA8 0000C28C */  lw         $v0, 0x0($a2)
    /* 212B4 8015AEAC 0400C38C */  lw         $v1, 0x4($a2)
    /* 212B8 8015AEB0 0800C48C */  lw         $a0, 0x8($a2)
    /* 212BC 8015AEB4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 212C0 8015AEB8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 212C4 8015AEBC 0800E4AC */  sw         $a0, 0x8($a3)
  .L8015AEC0:
    /* 212C8 8015AEC0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 212CC 8015AEC4 2400B38F */  lw         $s3, 0x24($sp)
    /* 212D0 8015AEC8 2000B28F */  lw         $s2, 0x20($sp)
    /* 212D4 8015AECC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 212D8 8015AED0 1800B08F */  lw         $s0, 0x18($sp)
    /* 212DC 8015AED4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 212E0 8015AED8 0800E003 */  jr         $ra
    /* 212E4 8015AEDC 00000000 */   nop
endlabel UnPackItem__FPC12PkItemStructP10ItemStruct
