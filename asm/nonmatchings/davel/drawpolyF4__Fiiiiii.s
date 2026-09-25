.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching drawpolyF4__Fiiiiii, 0x134

glabel drawpolyF4__Fiiiiii
    /* 8EDD8 8009EDD8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 8EDDC 8009EDDC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8EDE0 8009EDE0 5000B28F */  lw         $s2, 0x50($sp)
    /* 8EDE4 8009EDE4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 8EDE8 8009EDE8 21A08000 */  addu       $s4, $a0, $zero
    /* 8EDEC 8009EDEC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8EDF0 8009EDF0 2188A000 */  addu       $s1, $a1, $zero
    /* 8EDF4 8009EDF4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 8EDF8 8009EDF8 2198C000 */  addu       $s3, $a2, $zero
    /* 8EDFC 8009EDFC 3000B6AF */  sw         $s6, 0x30($sp)
    /* 8EE00 8009EE00 21B0E000 */  addu       $s6, $a3, $zero
    /* 8EE04 8009EE04 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8EE08 8009EE08 5400B08F */  lw         $s0, 0x54($sp)
    /* 8EE0C 8009EE0C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8EE10 8009EE10 3800BFAF */  sw         $ra, 0x38($sp)
    /* 8EE14 8009EE14 3400B7AF */  sw         $s7, 0x34($sp)
    /* 8EE18 8009EE18 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 8EE1C 8009EE1C 02AC1200 */  srl        $s5, $s2, 16
    /* 8EE20 8009EE20 0C82020C */  jal        PRIM_GetPrim__FPP7POLY_F4
    /* 8EE24 8009EE24 02BA1200 */   srl       $s7, $s2, 8
    /* 8EE28 8009EE28 05000224 */  addiu      $v0, $zero, 0x5
    /* 8EE2C 8009EE2C 1000A38F */  lw         $v1, 0x10($sp)
    /* 8EE30 8009EE30 21989302 */  addu       $s3, $s4, $s3
    /* 8EE34 8009EE34 030062A0 */  sb         $v0, 0x3($v1)
    /* 8EE38 8009EE38 1000A38F */  lw         $v1, 0x10($sp)
    /* 8EE3C 8009EE3C 28000224 */  addiu      $v0, $zero, 0x28
    /* 8EE40 8009EE40 070062A0 */  sb         $v0, 0x7($v1)
    /* 8EE44 8009EE44 1000A28F */  lw         $v0, 0x10($sp)
    /* 8EE48 8009EE48 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 8EE4C 8009EE4C 080054A4 */  sh         $s4, 0x8($v0)
    /* 8EE50 8009EE50 0A0051A4 */  sh         $s1, 0xA($v0)
    /* 8EE54 8009EE54 0C0053A4 */  sh         $s3, 0xC($v0)
    /* 8EE58 8009EE58 0E0051A4 */  sh         $s1, 0xE($v0)
    /* 8EE5C 8009EE5C 100054A4 */  sh         $s4, 0x10($v0)
    /* 8EE60 8009EE60 040055A0 */  sb         $s5, 0x4($v0)
    /* 8EE64 8009EE64 1000A38F */  lw         $v1, 0x10($sp)
    /* 8EE68 8009EE68 21883602 */  addu       $s1, $s1, $s6
    /* 8EE6C 8009EE6C 120051A4 */  sh         $s1, 0x12($v0)
    /* 8EE70 8009EE70 140053A4 */  sh         $s3, 0x14($v0)
    /* 8EE74 8009EE74 160051A4 */  sh         $s1, 0x16($v0)
    /* 8EE78 8009EE78 050077A0 */  sb         $s7, 0x5($v1)
    /* 8EE7C 8009EE7C 1000A28F */  lw         $v0, 0x10($sp)
    /* 8EE80 8009EE80 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 8EE84 8009EE84 060052A0 */  sb         $s2, 0x6($v0)
    /* 8EE88 8009EE88 1000A38F */  lw         $v1, 0x10($sp)
    /* 8EE8C 8009EE8C 80801000 */  sll        $s0, $s0, 2
    /* 8EE90 8009EE90 07006290 */  lbu        $v0, 0x7($v1)
    /* 8EE94 8009EE94 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 8EE98 8009EE98 02004234 */  ori        $v0, $v0, 0x2
    /* 8EE9C 8009EE9C 070062A0 */  sb         $v0, 0x7($v1)
    /* 8EEA0 8009EEA0 1280023C */  lui        $v0, %hi(ThisOt)
    /* 8EEA4 8009EEA4 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 8EEA8 8009EEA8 1000A48F */  lw         $a0, 0x10($sp)
    /* 8EEAC 8009EEAC 21800202 */  addu       $s0, $s0, $v0
    /* 8EEB0 8009EEB0 0000838C */  lw         $v1, 0x0($a0)
    /* 8EEB4 8009EEB4 0000028E */  lw         $v0, 0x0($s0)
    /* 8EEB8 8009EEB8 24186600 */  and        $v1, $v1, $a2
    /* 8EEBC 8009EEBC 24104500 */  and        $v0, $v0, $a1
    /* 8EEC0 8009EEC0 25186200 */  or         $v1, $v1, $v0
    /* 8EEC4 8009EEC4 000083AC */  sw         $v1, 0x0($a0)
    /* 8EEC8 8009EEC8 0000028E */  lw         $v0, 0x0($s0)
    /* 8EECC 8009EECC 24208500 */  and        $a0, $a0, $a1
    /* 8EED0 8009EED0 24104600 */  and        $v0, $v0, $a2
    /* 8EED4 8009EED4 25104400 */  or         $v0, $v0, $a0
    /* 8EED8 8009EED8 000002AE */  sw         $v0, 0x0($s0)
    /* 8EEDC 8009EEDC 3800BF8F */  lw         $ra, 0x38($sp)
    /* 8EEE0 8009EEE0 3400B78F */  lw         $s7, 0x34($sp)
    /* 8EEE4 8009EEE4 3000B68F */  lw         $s6, 0x30($sp)
    /* 8EEE8 8009EEE8 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 8EEEC 8009EEEC 2800B48F */  lw         $s4, 0x28($sp)
    /* 8EEF0 8009EEF0 2400B38F */  lw         $s3, 0x24($sp)
    /* 8EEF4 8009EEF4 2000B28F */  lw         $s2, 0x20($sp)
    /* 8EEF8 8009EEF8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8EEFC 8009EEFC 1800B08F */  lw         $s0, 0x18($sp)
    /* 8EF00 8009EF00 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 8EF04 8009EF04 0800E003 */  jr         $ra
    /* 8EF08 8009EF08 00000000 */   nop
endlabel drawpolyF4__Fiiiiii
