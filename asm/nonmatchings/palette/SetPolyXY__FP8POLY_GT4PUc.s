.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyXY__FP8POLY_GT4PUc, 0x11C

glabel SetPolyXY__FP8POLY_GT4PUc
    /* 6EEB8 8007EEB8 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 6EEBC 8007EEBC AA2A073C */  lui        $a3, (0x2AAAAAAB >> 16)
    /* 6EEC0 8007EEC0 ABAAE734 */  ori        $a3, $a3, (0x2AAAAAAB & 0xFFFF)
    /* 6EEC4 8007EEC4 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6EEC8 8007EEC8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 6EECC 8007EECC 18008890 */  lbu        $t0, 0x18($a0)
    /* 6EED0 8007EED0 E6148693 */  lbu        $a2, %gp_rel(D_8011BC66)($gp)
    /* 6EED4 8007EED4 40100200 */  sll        $v0, $v0, 1
    /* 6EED8 8007EED8 080082A4 */  sh         $v0, 0x8($a0)
    /* 6EEDC 8007EEDC 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6EEE0 8007EEE0 0100A524 */  addiu      $a1, $a1, 0x1
    /* 6EEE4 8007EEE4 FFFF0825 */  addiu      $t0, $t0, -0x1
    /* 6EEE8 8007EEE8 C0180600 */  sll        $v1, $a2, 3
    /* 6EEEC 8007EEEC 18006700 */  mult       $v1, $a3
    /* 6EEF0 8007EEF0 40100200 */  sll        $v0, $v0, 1
    /* 6EEF4 8007EEF4 0A0082A4 */  sh         $v0, 0xA($a0)
    /* 6EEF8 8007EEF8 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6EEFC 8007EEFC 0100A524 */  addiu      $a1, $a1, 0x1
    /* 6EF00 8007EF00 40100200 */  sll        $v0, $v0, 1
    /* 6EF04 8007EF04 140082A4 */  sh         $v0, 0x14($a0)
    /* 6EF08 8007EF08 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6EF0C 8007EF0C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 6EF10 8007EF10 40100200 */  sll        $v0, $v0, 1
    /* 6EF14 8007EF14 160082A4 */  sh         $v0, 0x16($a0)
    /* 6EF18 8007EF18 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6EF1C 8007EF1C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 6EF20 8007EF20 40100200 */  sll        $v0, $v0, 1
    /* 6EF24 8007EF24 200082A4 */  sh         $v0, 0x20($a0)
    /* 6EF28 8007EF28 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6EF2C 8007EF2C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 6EF30 8007EF30 40100200 */  sll        $v0, $v0, 1
    /* 6EF34 8007EF34 220082A4 */  sh         $v0, 0x22($a0)
    /* 6EF38 8007EF38 0000A290 */  lbu        $v0, 0x0($a1)
    /* 6EF3C 8007EF3C 30008790 */  lbu        $a3, 0x30($a0)
    /* 6EF40 8007EF40 40100200 */  sll        $v0, $v0, 1
    /* 6EF44 8007EF44 2C0082A4 */  sh         $v0, 0x2C($a0)
    /* 6EF48 8007EF48 0100A590 */  lbu        $a1, 0x1($a1)
    /* 6EF4C 8007EF4C 1A008294 */  lhu        $v0, 0x1A($a0)
    /* 6EF50 8007EF50 FFFFE724 */  addiu      $a3, $a3, -0x1
    /* 6EF54 8007EF54 040086A0 */  sb         $a2, 0x4($a0)
    /* 6EF58 8007EF58 100086A0 */  sb         $a2, 0x10($a0)
    /* 6EF5C 8007EF5C 1C0086A0 */  sb         $a2, 0x1C($a0)
    /* 6EF60 8007EF60 280086A0 */  sb         $a2, 0x28($a0)
    /* 6EF64 8007EF64 180088A0 */  sb         $t0, 0x18($a0)
    /* 6EF68 8007EF68 40004234 */  ori        $v0, $v0, 0x40
    /* 6EF6C 8007EF6C 40280500 */  sll        $a1, $a1, 1
    /* 6EF70 8007EF70 1A0082A4 */  sh         $v0, 0x1A($a0)
    /* 6EF74 8007EF74 2E0085A4 */  sh         $a1, 0x2E($a0)
    /* 6EF78 8007EF78 10180000 */  mfhi       $v1
    /* 6EF7C 8007EF7C 050083A0 */  sb         $v1, 0x5($a0)
    /* 6EF80 8007EF80 060083A0 */  sb         $v1, 0x6($a0)
    /* 6EF84 8007EF84 110083A0 */  sb         $v1, 0x11($a0)
    /* 6EF88 8007EF88 120083A0 */  sb         $v1, 0x12($a0)
    /* 6EF8C 8007EF8C 1D0083A0 */  sb         $v1, 0x1D($a0)
    /* 6EF90 8007EF90 1E0083A0 */  sb         $v1, 0x1E($a0)
    /* 6EF94 8007EF94 290083A0 */  sb         $v1, 0x29($a0)
    /* 6EF98 8007EF98 2A0083A0 */  sb         $v1, 0x2A($a0)
    /* 6EF9C 8007EF9C 300087A0 */  sb         $a3, 0x30($a0)
    /* 6EFA0 8007EFA0 25008590 */  lbu        $a1, 0x25($a0)
    /* 6EFA4 8007EFA4 31008290 */  lbu        $v0, 0x31($a0)
    /* 6EFA8 8007EFA8 07008390 */  lbu        $v1, 0x7($a0)
    /* 6EFAC 8007EFAC FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 6EFB0 8007EFB0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 6EFB4 8007EFB4 02006334 */  ori        $v1, $v1, 0x2
    /* 6EFB8 8007EFB8 FE006330 */  andi       $v1, $v1, 0xFE
    /* 6EFBC 8007EFBC 250085A0 */  sb         $a1, 0x25($a0)
    /* 6EFC0 8007EFC0 310082A0 */  sb         $v0, 0x31($a0)
    /* 6EFC4 8007EFC4 070083A0 */  sb         $v1, 0x7($a0)
    /* 6EFC8 8007EFC8 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 6EFCC 8007EFCC 0800E003 */  jr         $ra
    /* 6EFD0 8007EFD0 00000000 */   nop
endlabel SetPolyXY__FP8POLY_GT4PUc
