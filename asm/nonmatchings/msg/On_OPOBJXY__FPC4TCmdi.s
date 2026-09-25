.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_OPOBJXY__FPC4TCmdi, 0xE0

glabel On_OPOBJXY__FPC4TCmdi
    /* 40EC0 80050EC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40EC4 80050EC4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40EC8 80050EC8 21888000 */  addu       $s1, $a0, $zero
    /* 40ECC 80050ECC 04002296 */  lhu        $v0, 0x4($s1)
    /* 40ED0 80050ED0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 40ED4 80050ED4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40ED8 80050ED8 40180200 */  sll        $v1, $v0, 1
    /* 40EDC 80050EDC 21186200 */  addu       $v1, $v1, $v0
    /* 40EE0 80050EE0 80180300 */  sll        $v1, $v1, 2
    /* 40EE4 80050EE4 23186200 */  subu       $v1, $v1, $v0
    /* 40EE8 80050EE8 80180300 */  sll        $v1, $v1, 2
    /* 40EEC 80050EEC 0E80013C */  lui        $at, %hi(object + 0x27)
    /* 40EF0 80050EF0 21082300 */  addu       $at, $at, $v1
    /* 40EF4 80050EF4 738C2290 */  lbu        $v0, %lo(object + 0x27)($at)
    /* 40EF8 80050EF8 00000000 */  nop
    /* 40EFC 80050EFC 0B004014 */  bnez       $v0, .L80050F2C
    /* 40F00 80050F00 2180A000 */   addu      $s0, $a1, $zero
    /* 40F04 80050F04 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 40F08 80050F08 21082300 */  addu       $at, $at, $v1
    /* 40F0C 80050F0C 778C2290 */  lbu        $v0, %lo(object + 0x2B)($at)
    /* 40F10 80050F10 00000000 */  nop
    /* 40F14 80050F14 06004014 */  bnez       $v0, .L80050F30
    /* 40F18 80050F18 21200002 */   addu      $a0, $s0, $zero
    /* 40F1C 80050F1C 01002592 */  lbu        $a1, 0x1($s1)
    /* 40F20 80050F20 02002692 */  lbu        $a2, 0x2($s1)
    /* 40F24 80050F24 CF430108 */  j          .L80050F3C
    /* 40F28 80050F28 01000724 */   addiu     $a3, $zero, 0x1
  .L80050F2C:
    /* 40F2C 80050F2C 21200002 */  addu       $a0, $s0, $zero
  .L80050F30:
    /* 40F30 80050F30 01002592 */  lbu        $a1, 0x1($s1)
    /* 40F34 80050F34 02002692 */  lbu        $a2, 0x2($s1)
    /* 40F38 80050F38 21380000 */  addu       $a3, $zero, $zero
  .L80050F3C:
    /* 40F3C 80050F3C 4F9B010C */  jal        MakePlrPath__FiiiUc
    /* 40F40 80050F40 00000000 */   nop
    /* 40F44 80050F44 40101000 */  sll        $v0, $s0, 1
    /* 40F48 80050F48 21105000 */  addu       $v0, $v0, $s0
    /* 40F4C 80050F4C 80100200 */  sll        $v0, $v0, 2
    /* 40F50 80050F50 21105000 */  addu       $v0, $v0, $s0
    /* 40F54 80050F54 00110200 */  sll        $v0, $v0, 4
    /* 40F58 80050F58 23105000 */  subu       $v0, $v0, $s0
    /* 40F5C 80050F5C 80100200 */  sll        $v0, $v0, 2
    /* 40F60 80050F60 21105000 */  addu       $v0, $v0, $s0
    /* 40F64 80050F64 C0100200 */  sll        $v0, $v0, 3
    /* 40F68 80050F68 04002496 */  lhu        $a0, 0x4($s1)
    /* 40F6C 80050F6C 0D000324 */  addiu      $v1, $zero, 0xD
    /* 40F70 80050F70 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40F74 80050F74 21082200 */  addu       $at, $at, $v0
    /* 40F78 80050F78 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 40F7C 80050F7C 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 40F80 80050F80 21082200 */  addu       $at, $at, $v0
    /* 40F84 80050F84 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 40F88 80050F88 1800BF8F */  lw         $ra, 0x18($sp)
    /* 40F8C 80050F8C 1400B18F */  lw         $s1, 0x14($sp)
    /* 40F90 80050F90 1000B08F */  lw         $s0, 0x10($sp)
    /* 40F94 80050F94 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40F98 80050F98 0800E003 */  jr         $ra
    /* 40F9C 80050F9C 00000000 */   nop
endlabel On_OPOBJXY__FPC4TCmdi
