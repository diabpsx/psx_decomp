.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddWarpMissile__Fiii, 0xF0

glabel AddWarpMissile__Fiii
    /* 70EF8 80080EF8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 70EFC 80080EFC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 70F00 80080F00 21888000 */  addu       $s1, $a0, $zero
    /* 70F04 80080F04 2110A000 */  addu       $v0, $a1, $zero
    /* 70F08 80080F08 2138C000 */  addu       $a3, $a2, $zero
    /* 70F0C 80080F0C 21200000 */  addu       $a0, $zero, $zero
    /* 70F10 80080F10 21280000 */  addu       $a1, $zero, $zero
    /* 70F14 80080F14 21304000 */  addu       $a2, $v0, $zero
    /* 70F18 80080F18 3000B2AF */  sw         $s2, 0x30($sp)
    /* 70F1C 80080F1C 0D80123C */  lui        $s2, %hi(missiledata + 0x100)
    /* 70F20 80080F20 F0685226 */  addiu      $s2, $s2, %lo(missiledata + 0x100)
    /* 70F24 80080F24 2800B0AF */  sw         $s0, 0x28($sp)
    /* 70F28 80080F28 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 70F2C 80080F2C C0180700 */  sll        $v1, $a3, 3
    /* 70F30 80080F30 C0100600 */  sll        $v0, $a2, 3
    /* 70F34 80080F34 23104600 */  subu       $v0, $v0, $a2
    /* 70F38 80080F38 C0110200 */  sll        $v0, $v0, 7
    /* 70F3C 80080F3C 21186200 */  addu       $v1, $v1, $v0
    /* 70F40 80080F40 0A000224 */  addiu      $v0, $zero, 0xA
    /* 70F44 80080F44 3400BFAF */  sw         $ra, 0x34($sp)
    /* 70F48 80080F48 000050AE */  sw         $s0, 0x0($s2)
    /* 70F4C 80080F4C 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 70F50 80080F50 21082300 */  addu       $at, $at, $v1
    /* 70F54 80080F54 2D7A20A0 */  sb         $zero, %lo(dung_map + 0x5)($at)
    /* 70F58 80080F58 1000A0AF */  sw         $zero, 0x10($sp)
    /* 70F5C 80080F5C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 70F60 80080F60 1800A0AF */  sw         $zero, 0x18($sp)
    /* 70F64 80080F64 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 70F68 80080F68 2000A0AF */  sw         $zero, 0x20($sp)
    /* 70F6C 80080F6C 810A050C */  jal        func_80142A04
    /* 70F70 80080F70 2400A0AF */   sw        $zero, 0x24($sp)
    /* 70F74 80080F74 15005010 */  beq        $v0, $s0, .L80080FCC
    /* 70F78 80080F78 21204000 */   addu      $a0, $v0, $zero
    /* 70F7C 80080F7C 09F5040C */  jal        func_8013D424
    /* 70F80 80080F80 01000524 */   addiu     $a1, $zero, 0x1
    /* 70F84 80080F84 80801100 */  sll        $s0, $s1, 2
    /* 70F88 80080F88 21801102 */  addu       $s0, $s0, $s1
    /* 70F8C 80080F8C 80801000 */  sll        $s0, $s0, 2
    /* 70F90 80080F90 23801102 */  subu       $s0, $s0, $s1
    /* 70F94 80080F94 80801000 */  sll        $s0, $s0, 2
    /* 70F98 80080F98 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 70F9C 80080F9C 21083000 */  addu       $at, $at, $s0
    /* 70FA0 80080FA0 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* 70FA4 80080FA4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 70FA8 80080FA8 21083000 */  addu       $at, $at, $s0
    /* 70FAC 80080FAC 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* 70FB0 80080FB0 BA34010C */  jal        AddLight__Fiii
    /* 70FB4 80080FB4 4A010624 */   addiu     $a2, $zero, 0x14A
    /* 70FB8 80080FB8 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 70FBC 80080FBC 21083000 */  addu       $at, $at, $s0
    /* 70FC0 80080FC0 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 70FC4 80080FC4 6E000224 */  addiu      $v0, $zero, 0x6E
    /* 70FC8 80080FC8 000042AE */  sw         $v0, 0x0($s2)
  .L80080FCC:
    /* 70FCC 80080FCC 3400BF8F */  lw         $ra, 0x34($sp)
    /* 70FD0 80080FD0 3000B28F */  lw         $s2, 0x30($sp)
    /* 70FD4 80080FD4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 70FD8 80080FD8 2800B08F */  lw         $s0, 0x28($sp)
    /* 70FDC 80080FDC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 70FE0 80080FE0 0800E003 */  jr         $ra
    /* 70FE4 80080FE4 00000000 */   nop
endlabel AddWarpMissile__Fiii
