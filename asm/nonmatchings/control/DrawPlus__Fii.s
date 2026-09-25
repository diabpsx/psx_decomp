.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawPlus__Fii, 0x198

glabel DrawPlus__Fii
    /* 23E90 80033E90 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 23E94 80033E94 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 23E98 80033E98 21988000 */  addu       $s3, $a0, $zero
    /* 23E9C 80033E9C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 23EA0 80033EA0 2180A000 */  addu       $s0, $a1, $zero
    /* 23EA4 80033EA4 21200000 */  addu       $a0, $zero, $zero
    /* 23EA8 80033EA8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 23EAC 80033EAC 2800B2AF */  sw         $s2, 0x28($sp)
    /* 23EB0 80033EB0 044F020C */  jal        GM_UseTexData__Fi
    /* 23EB4 80033EB4 2400B1AF */   sw        $s1, 0x24($sp)
    /* 23EB8 80033EB8 BBDD000C */  jal        GetOverlayOtBase__7CBlocks
    /* 23EBC 80033EBC 21884000 */   addu      $s1, $v0, $zero
    /* 23EC0 80033EC0 04005224 */  addiu      $s2, $v0, 0x4
    /* 23EC4 80033EC4 04000224 */  addiu      $v0, $zero, 0x4
    /* 23EC8 80033EC8 2C006216 */  bne        $s3, $v0, .L80033F7C
    /* 23ECC 80033ECC 21202002 */   addu      $a0, $s1, $zero
    /* 23ED0 80033ED0 1280013C */  lui        $at, %hi(D_8011B6A0)
    /* 23ED4 80033ED4 21083000 */  addu       $at, $at, $s0
    /* 23ED8 80033ED8 A0B62290 */  lbu        $v0, %lo(D_8011B6A0)($at)
    /* 23EDC 80033EDC 00000000 */  nop
    /* 23EE0 80033EE0 01004224 */  addiu      $v0, $v0, 0x1
    /* 23EE4 80033EE4 1280013C */  lui        $at, %hi(D_8011B6A0)
    /* 23EE8 80033EE8 21083000 */  addu       $at, $at, $s0
    /* 23EEC 80033EEC A0B622A0 */  sb         $v0, %lo(D_8011B6A0)($at)
    /* 23EF0 80033EF0 01004230 */  andi       $v0, $v0, 0x1
    /* 23EF4 80033EF4 44004010 */  beqz       $v0, .L80034008
    /* 23EF8 80033EF8 00000000 */   nop
    /* 23EFC 80033EFC 09000016 */  bnez       $s0, .L80033F24
    /* 23F00 80033F00 00000000 */   nop
    /* 23F04 80033F04 3E10020C */  jal        VID_GetTick__Fv
    /* 23F08 80033F08 00000000 */   nop
    /* 23F0C 80033F0C 21202002 */  addu       $a0, $s1, $zero
    /* 23F10 80033F10 C2100200 */  srl        $v0, $v0, 3
    /* 23F14 80033F14 03004230 */  andi       $v0, $v0, 0x3
    /* 23F18 80033F18 01004524 */  addiu      $a1, $v0, 0x1
    /* 23F1C 80033F1C D0CF0008 */  j          .L80033F40
    /* 23F20 80033F20 19000624 */   addiu     $a2, $zero, 0x19
  .L80033F24:
    /* 23F24 80033F24 3E10020C */  jal        VID_GetTick__Fv
    /* 23F28 80033F28 00000000 */   nop
    /* 23F2C 80033F2C 21202002 */  addu       $a0, $s1, $zero
    /* 23F30 80033F30 C2100200 */  srl        $v0, $v0, 3
    /* 23F34 80033F34 03004230 */  andi       $v0, $v0, 0x3
    /* 23F38 80033F38 01004524 */  addiu      $a1, $v0, 0x1
    /* 23F3C 80033F3C 27010624 */  addiu      $a2, $zero, 0x127
  .L80033F40:
    /* 23F40 80033F40 64000724 */  addiu      $a3, $zero, 0x64
    /* 23F44 80033F44 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23F48 80033F48 1400B2AF */  sw         $s2, 0x14($sp)
    /* 23F4C 80033F4C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 23F50 80033F50 1800A0AF */   sw        $zero, 0x18($sp)
    /* 23F54 80033F54 21204000 */  addu       $a0, $v0, $zero
    /* 23F58 80033F58 07008390 */  lbu        $v1, 0x7($a0)
    /* 23F5C 80033F5C A0000224 */  addiu      $v0, $zero, 0xA0
    /* 23F60 80033F60 040082A0 */  sb         $v0, 0x4($a0)
    /* 23F64 80033F64 050082A0 */  sb         $v0, 0x5($a0)
    /* 23F68 80033F68 060082A0 */  sb         $v0, 0x6($a0)
    /* 23F6C 80033F6C 02006334 */  ori        $v1, $v1, 0x2
    /* 23F70 80033F70 FE006330 */  andi       $v1, $v1, 0xFE
    /* 23F74 80033F74 02D00008 */  j          .L80034008
    /* 23F78 80033F78 070083A0 */   sb        $v1, 0x7($a0)
  .L80033F7C:
    /* 23F7C 80033F7C 83000524 */  addiu      $a1, $zero, 0x83
    /* 23F80 80033F80 14006326 */  addiu      $v1, $s3, 0x14
    /* 23F84 80033F84 80100300 */  sll        $v0, $v1, 2
    /* 23F88 80033F88 21104300 */  addu       $v0, $v0, $v1
    /* 23F8C 80033F8C C0100200 */  sll        $v0, $v0, 3
    /* 23F90 80033F90 0D80013C */  lui        $at, %hi(CS_Tab)
    /* 23F94 80033F94 21082200 */  addu       $at, $at, $v0
    /* 23F98 80033F98 B0E3238C */  lw         $v1, %lo(CS_Tab)($at)
    /* 23F9C 80033F9C 0D80013C */  lui        $at, %hi(CS_Tab + 0x4)
    /* 23FA0 80033FA0 21082200 */  addu       $at, $at, $v0
    /* 23FA4 80033FA4 B4E3278C */  lw         $a3, %lo(CS_Tab + 0x4)($at)
    /* 23FA8 80033FA8 E80E868F */  lw         $a2, %gp_rel(D_8011B668)($gp)
    /* 23FAC 80033FAC 01000224 */  addiu      $v0, $zero, 0x1
    /* 23FB0 80033FB0 850F82A3 */  sb         $v0, %gp_rel(chrbtnactive)($gp)
    /* 23FB4 80033FB4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23FB8 80033FB8 1400B2AF */  sw         $s2, 0x14($sp)
    /* 23FBC 80033FBC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 23FC0 80033FC0 42006324 */  addiu      $v1, $v1, 0x42
    /* 23FC4 80033FC4 21306600 */  addu       $a2, $v1, $a2
    /* 23FC8 80033FC8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 23FCC 80033FCC 2200E724 */   addiu     $a3, $a3, 0x22
    /* 23FD0 80033FD0 DC0E838F */  lw         $v1, %gp_rel(D_8011B65C)($gp)
    /* 23FD4 80033FD4 00000000 */  nop
    /* 23FD8 80033FD8 03007314 */  bne        $v1, $s3, .L80033FE8
    /* 23FDC 80033FDC 21204000 */   addu      $a0, $v0, $zero
    /* 23FE0 80033FE0 FBCF0008 */  j          .L80033FEC
    /* 23FE4 80033FE4 80000224 */   addiu     $v0, $zero, 0x80
  .L80033FE8:
    /* 23FE8 80033FE8 20000224 */  addiu      $v0, $zero, 0x20
  .L80033FEC:
    /* 23FEC 80033FEC 040082A0 */  sb         $v0, 0x4($a0)
    /* 23FF0 80033FF0 050082A0 */  sb         $v0, 0x5($a0)
    /* 23FF4 80033FF4 060082A0 */  sb         $v0, 0x6($a0)
    /* 23FF8 80033FF8 07008290 */  lbu        $v0, 0x7($a0)
    /* 23FFC 80033FFC 00000000 */  nop
    /* 24000 80034000 FC004230 */  andi       $v0, $v0, 0xFC
    /* 24004 80034004 070082A0 */  sb         $v0, 0x7($a0)
  .L80034008:
    /* 24008 80034008 3000BF8F */  lw         $ra, 0x30($sp)
    /* 2400C 8003400C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 24010 80034010 2800B28F */  lw         $s2, 0x28($sp)
    /* 24014 80034014 2400B18F */  lw         $s1, 0x24($sp)
    /* 24018 80034018 2000B08F */  lw         $s0, 0x20($sp)
    /* 2401C 8003401C 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 24020 80034020 0800E003 */  jr         $ra
    /* 24024 80034024 00000000 */   nop
endlabel DrawPlus__Fii
