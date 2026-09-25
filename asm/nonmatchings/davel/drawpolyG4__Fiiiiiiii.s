.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching drawpolyG4__Fiiiiiiii, 0x1D0

glabel drawpolyG4__Fiiiiiiii
    /* 8EF0C 8009EF0C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 8EF10 8009EF10 3000B2AF */  sw         $s2, 0x30($sp)
    /* 8EF14 8009EF14 6400B28F */  lw         $s2, 0x64($sp)
    /* 8EF18 8009EF18 4000B6AF */  sw         $s6, 0x40($sp)
    /* 8EF1C 8009EF1C 6800B68F */  lw         $s6, 0x68($sp)
    /* 8EF20 8009EF20 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 8EF24 8009EF24 21A88000 */  addu       $s5, $a0, $zero
    /* 8EF28 8009EF28 2800B0AF */  sw         $s0, 0x28($sp)
    /* 8EF2C 8009EF2C 2180A000 */  addu       $s0, $a1, $zero
    /* 8EF30 8009EF30 3400B3AF */  sw         $s3, 0x34($sp)
    /* 8EF34 8009EF34 2198C000 */  addu       $s3, $a2, $zero
    /* 8EF38 8009EF38 3800B4AF */  sw         $s4, 0x38($sp)
    /* 8EF3C 8009EF3C 21A0E000 */  addu       $s4, $a3, $zero
    /* 8EF40 8009EF40 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 8EF44 8009EF44 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 8EF48 8009EF48 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8EF4C 8009EF4C 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 8EF50 8009EF50 4800BEAF */  sw         $fp, 0x48($sp)
    /* 8EF54 8009EF54 4400B7AF */  sw         $s7, 0x44($sp)
    /* 8EF58 8009EF58 02F41200 */  srl        $fp, $s2, 16
    /* 8EF5C 8009EF5C 02BA1200 */  srl        $s7, $s2, 8
    /* 8EF60 8009EF60 02441600 */  srl        $t0, $s6, 16
    /* 8EF64 8009EF64 1800A8A3 */  sb         $t0, 0x18($sp)
    /* 8EF68 8009EF68 02421600 */  srl        $t0, $s6, 8
    /* 8EF6C 8009EF6C ED81020C */  jal        PRIM_GetPrim__FPP7POLY_G4
    /* 8EF70 8009EF70 2000A8A3 */   sb        $t0, 0x20($sp)
    /* 8EF74 8009EF74 08000224 */  addiu      $v0, $zero, 0x8
    /* 8EF78 8009EF78 1000A38F */  lw         $v1, 0x10($sp)
    /* 8EF7C 8009EF7C 2198B302 */  addu       $s3, $s5, $s3
    /* 8EF80 8009EF80 030062A0 */  sb         $v0, 0x3($v1)
    /* 8EF84 8009EF84 1000A38F */  lw         $v1, 0x10($sp)
    /* 8EF88 8009EF88 38000224 */  addiu      $v0, $zero, 0x38
    /* 8EF8C 8009EF8C 070062A0 */  sb         $v0, 0x7($v1)
    /* 8EF90 8009EF90 1000A28F */  lw         $v0, 0x10($sp)
    /* 8EF94 8009EF94 21A01402 */  addu       $s4, $s0, $s4
    /* 8EF98 8009EF98 080055A4 */  sh         $s5, 0x8($v0)
    /* 8EF9C 8009EF9C 0A0050A4 */  sh         $s0, 0xA($v0)
    /* 8EFA0 8009EFA0 100053A4 */  sh         $s3, 0x10($v0)
    /* 8EFA4 8009EFA4 120050A4 */  sh         $s0, 0x12($v0)
    /* 8EFA8 8009EFA8 180055A4 */  sh         $s5, 0x18($v0)
    /* 8EFAC 8009EFAC 1A0054A4 */  sh         $s4, 0x1A($v0)
    /* 8EFB0 8009EFB0 200053A4 */  sh         $s3, 0x20($v0)
    /* 8EFB4 8009EFB4 04005EA0 */  sb         $fp, 0x4($v0)
    /* 8EFB8 8009EFB8 6000A88F */  lw         $t0, 0x60($sp)
    /* 8EFBC 8009EFBC 1000A38F */  lw         $v1, 0x10($sp)
    /* 8EFC0 8009EFC0 21800802 */  addu       $s0, $s0, $t0
    /* 8EFC4 8009EFC4 220050A4 */  sh         $s0, 0x22($v0)
    /* 8EFC8 8009EFC8 050077A0 */  sb         $s7, 0x5($v1)
    /* 8EFCC 8009EFCC 1000A28F */  lw         $v0, 0x10($sp)
    /* 8EFD0 8009EFD0 00000000 */  nop
    /* 8EFD4 8009EFD4 060052A0 */  sb         $s2, 0x6($v0)
    /* 8EFD8 8009EFD8 1000A28F */  lw         $v0, 0x10($sp)
    /* 8EFDC 8009EFDC 00000000 */  nop
    /* 8EFE0 8009EFE0 14005EA0 */  sb         $fp, 0x14($v0)
    /* 8EFE4 8009EFE4 1000A28F */  lw         $v0, 0x10($sp)
    /* 8EFE8 8009EFE8 00000000 */  nop
    /* 8EFEC 8009EFEC 150057A0 */  sb         $s7, 0x15($v0)
    /* 8EFF0 8009EFF0 1000A28F */  lw         $v0, 0x10($sp)
    /* 8EFF4 8009EFF4 00000000 */  nop
    /* 8EFF8 8009EFF8 160052A0 */  sb         $s2, 0x16($v0)
    /* 8EFFC 8009EFFC 1000A28F */  lw         $v0, 0x10($sp)
    /* 8F000 8009F000 1800A893 */  lbu        $t0, 0x18($sp)
    /* 8F004 8009F004 00000000 */  nop
    /* 8F008 8009F008 0C0048A0 */  sb         $t0, 0xC($v0)
    /* 8F00C 8009F00C 1000A28F */  lw         $v0, 0x10($sp)
    /* 8F010 8009F010 2000A893 */  lbu        $t0, 0x20($sp)
    /* 8F014 8009F014 00000000 */  nop
    /* 8F018 8009F018 0D0048A0 */  sb         $t0, 0xD($v0)
    /* 8F01C 8009F01C 1000A28F */  lw         $v0, 0x10($sp)
    /* 8F020 8009F020 00000000 */  nop
    /* 8F024 8009F024 0E0056A0 */  sb         $s6, 0xE($v0)
    /* 8F028 8009F028 1000A28F */  lw         $v0, 0x10($sp)
    /* 8F02C 8009F02C 1800A893 */  lbu        $t0, 0x18($sp)
    /* 8F030 8009F030 00000000 */  nop
    /* 8F034 8009F034 1C0048A0 */  sb         $t0, 0x1C($v0)
    /* 8F038 8009F038 1000A28F */  lw         $v0, 0x10($sp)
    /* 8F03C 8009F03C 2000A893 */  lbu        $t0, 0x20($sp)
    /* 8F040 8009F040 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 8F044 8009F044 1D0048A0 */  sb         $t0, 0x1D($v0)
    /* 8F048 8009F048 1000A28F */  lw         $v0, 0x10($sp)
    /* 8F04C 8009F04C FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 8F050 8009F050 1E0056A0 */  sb         $s6, 0x1E($v0)
    /* 8F054 8009F054 1000A38F */  lw         $v1, 0x10($sp)
    /* 8F058 8009F058 80881100 */  sll        $s1, $s1, 2
    /* 8F05C 8009F05C 07006290 */  lbu        $v0, 0x7($v1)
    /* 8F060 8009F060 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 8F064 8009F064 02004234 */  ori        $v0, $v0, 0x2
    /* 8F068 8009F068 070062A0 */  sb         $v0, 0x7($v1)
    /* 8F06C 8009F06C 1280023C */  lui        $v0, %hi(ThisOt)
    /* 8F070 8009F070 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 8F074 8009F074 1000A48F */  lw         $a0, 0x10($sp)
    /* 8F078 8009F078 21882202 */  addu       $s1, $s1, $v0
    /* 8F07C 8009F07C 0000838C */  lw         $v1, 0x0($a0)
    /* 8F080 8009F080 0000228E */  lw         $v0, 0x0($s1)
    /* 8F084 8009F084 24186600 */  and        $v1, $v1, $a2
    /* 8F088 8009F088 24104500 */  and        $v0, $v0, $a1
    /* 8F08C 8009F08C 25186200 */  or         $v1, $v1, $v0
    /* 8F090 8009F090 000083AC */  sw         $v1, 0x0($a0)
    /* 8F094 8009F094 0000228E */  lw         $v0, 0x0($s1)
    /* 8F098 8009F098 24208500 */  and        $a0, $a0, $a1
    /* 8F09C 8009F09C 24104600 */  and        $v0, $v0, $a2
    /* 8F0A0 8009F0A0 25104400 */  or         $v0, $v0, $a0
    /* 8F0A4 8009F0A4 000022AE */  sw         $v0, 0x0($s1)
    /* 8F0A8 8009F0A8 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 8F0AC 8009F0AC 4800BE8F */  lw         $fp, 0x48($sp)
    /* 8F0B0 8009F0B0 4400B78F */  lw         $s7, 0x44($sp)
    /* 8F0B4 8009F0B4 4000B68F */  lw         $s6, 0x40($sp)
    /* 8F0B8 8009F0B8 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 8F0BC 8009F0BC 3800B48F */  lw         $s4, 0x38($sp)
    /* 8F0C0 8009F0C0 3400B38F */  lw         $s3, 0x34($sp)
    /* 8F0C4 8009F0C4 3000B28F */  lw         $s2, 0x30($sp)
    /* 8F0C8 8009F0C8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 8F0CC 8009F0CC 2800B08F */  lw         $s0, 0x28($sp)
    /* 8F0D0 8009F0D0 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 8F0D4 8009F0D4 0800E003 */  jr         $ra
    /* 8F0D8 8009F0D8 00000000 */   nop
endlabel drawpolyG4__Fiiiiiiii
