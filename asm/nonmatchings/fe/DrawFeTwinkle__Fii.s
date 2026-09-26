.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawFeTwinkle__Fii, 0xDC

glabel DrawFeTwinkle__Fii
    /* 2DC0 8013C9B8 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 2DC4 8013C9BC 4800B4AF */  sw         $s4, 0x48($sp)
    /* 2DC8 8013C9C0 21A08000 */  addu       $s4, $a0, $zero
    /* 2DCC 8013C9C4 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 2DD0 8013C9C8 21A8A000 */  addu       $s5, $a1, $zero
    /* 2DD4 8013C9CC A0000624 */  addiu      $a2, $zero, 0xA0
    /* 2DD8 8013C9D0 40000724 */  addiu      $a3, $zero, 0x40
    /* 2DDC 8013C9D4 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 2DE0 8013C9D8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2DE4 8013C9DC 20000224 */  addiu      $v0, $zero, 0x20
    /* 2DE8 8013C9E0 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 2DEC 8013C9E4 40001124 */  addiu      $s1, $zero, 0x40
    /* 2DF0 8013C9E8 3800B0AF */  sw         $s0, 0x38($sp)
    /* 2DF4 8013C9EC 01001024 */  addiu      $s0, $zero, 0x1
    /* 2DF8 8013C9F0 4400B3AF */  sw         $s3, 0x44($sp)
    /* 2DFC 8013C9F4 FFFF1334 */  ori        $s3, $zero, 0xFFFF
    /* 2E00 8013C9F8 4000B2AF */  sw         $s2, 0x40($sp)
    /* 2E04 8013C9FC 08001224 */  addiu      $s2, $zero, 0x8
    /* 2E08 8013CA00 5000BFAF */  sw         $ra, 0x50($sp)
    /* 2E0C 8013CA04 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2E10 8013CA08 1800B1AF */  sw         $s1, 0x18($sp)
    /* 2E14 8013CA0C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 2E18 8013CA10 2000B0AF */  sw         $s0, 0x20($sp)
    /* 2E1C 8013CA14 2400B3AF */  sw         $s3, 0x24($sp)
    /* 2E20 8013CA18 2800B0AF */  sw         $s0, 0x28($sp)
    /* 2E24 8013CA1C 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 2E28 8013CA20 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 2E2C 8013CA24 3000B2AF */   sw        $s2, 0x30($sp)
    /* 2E30 8013CA28 21208002 */  addu       $a0, $s4, $zero
    /* 2E34 8013CA2C 2128A002 */  addu       $a1, $s5, $zero
    /* 2E38 8013CA30 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 2E3C 8013CA34 A0000724 */  addiu      $a3, $zero, 0xA0
    /* 2E40 8013CA38 15000224 */  addiu      $v0, $zero, 0x15
    /* 2E44 8013CA3C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2E48 8013CA40 30000224 */  addiu      $v0, $zero, 0x30
    /* 2E4C 8013CA44 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2E50 8013CA48 28000224 */  addiu      $v0, $zero, 0x28
    /* 2E54 8013CA4C 1000B1AF */  sw         $s1, 0x10($sp)
    /* 2E58 8013CA50 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 2E5C 8013CA54 2000B0AF */  sw         $s0, 0x20($sp)
    /* 2E60 8013CA58 2400B3AF */  sw         $s3, 0x24($sp)
    /* 2E64 8013CA5C 2800B0AF */  sw         $s0, 0x28($sp)
    /* 2E68 8013CA60 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 2E6C 8013CA64 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 2E70 8013CA68 3000B2AF */   sw        $s2, 0x30($sp)
    /* 2E74 8013CA6C 5000BF8F */  lw         $ra, 0x50($sp)
    /* 2E78 8013CA70 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 2E7C 8013CA74 4800B48F */  lw         $s4, 0x48($sp)
    /* 2E80 8013CA78 4400B38F */  lw         $s3, 0x44($sp)
    /* 2E84 8013CA7C 4000B28F */  lw         $s2, 0x40($sp)
    /* 2E88 8013CA80 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 2E8C 8013CA84 3800B08F */  lw         $s0, 0x38($sp)
    /* 2E90 8013CA88 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 2E94 8013CA8C 0800E003 */  jr         $ra
    /* 2E98 8013CA90 00000000 */   nop
endlabel DrawFeTwinkle__Fii
