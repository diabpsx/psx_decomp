.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_8001097C, 0xB0

glabel func_8001097C
    /* 97C 8001097C FCFFBFAF */  sw         $ra, -0x4($sp)
    /* 980 80010980 FCFFBD27 */  addiu      $sp, $sp, -0x4
    /* 984 80010984 12002013 */  beqz       $t9, .L800109D0
    /* 988 80010988 00000000 */   nop
    /* 98C 8001098C 21182003 */  addu       $v1, $t9, $zero
    /* 990 80010990 21C80000 */  addu       $t9, $zero, $zero
    /* 994 80010994 09000624 */  addiu      $a2, $zero, 0x9
    /* 998 80010998 2A086600 */  slt        $at, $v1, $a2
    /* 99C 8001099C 11002010 */  beqz       $at, .L800109E4
    /* 9A0 800109A0 00000000 */   nop
    /* 9A4 800109A4 0180063C */  lui        $a2, %hi(D_80010AFA)
    /* 9A8 800109A8 FA0AC624 */  addiu      $a2, $a2, %lo(D_80010AFA)
    /* 9AC 800109AC 00000000 */  nop
    /* 9B0 800109B0 0000D884 */  lh         $t8, 0x0($a2)
    /* 9B4 800109B4 00000000 */  nop
    /* 9B8 800109B8 01001823 */  addi       $t8, $t8, 0x1 /* handwritten instruction */
    /* 9BC 800109BC 0000D8A4 */  sh         $t8, 0x0($a2)
    /* 9C0 800109C0 FFFF6320 */  addi       $v1, $v1, -0x1 /* handwritten instruction */
    /* 9C4 800109C4 05000624 */  addiu      $a2, $zero, 0x5
    /* 9C8 800109C8 8B42000C */  jal        func_80010A2C
    /* 9CC 800109CC 00000000 */   nop
  .L800109D0:
    /* 9D0 800109D0 0000BF8F */  lw         $ra, 0x0($sp)
    /* 9D4 800109D4 00000000 */  nop
    /* 9D8 800109D8 0400BD27 */  addiu      $sp, $sp, 0x4
    /* 9DC 800109DC 0800E003 */  jr         $ra
    /* 9E0 800109E0 00000000 */   nop
  .L800109E4:
    /* 9E4 800109E4 0180063C */  lui        $a2, %hi(D_80010AFC)
    /* 9E8 800109E8 FC0AC624 */  addiu      $a2, $a2, %lo(D_80010AFC)
    /* 9EC 800109EC 00000000 */  nop
    /* 9F0 800109F0 0000D884 */  lh         $t8, 0x0($a2)
    /* 9F4 800109F4 00000000 */  nop
    /* 9F8 800109F8 01001823 */  addi       $t8, $t8, 0x1 /* handwritten instruction */
    /* 9FC 800109FC 0000D8A4 */  sh         $t8, 0x0($a2)
    /* A00 80010A00 F7FF6320 */  addi       $v1, $v1, -0x9 /* handwritten instruction */
    /* A04 80010A04 00071824 */  addiu      $t8, $zero, 0x700
    /* A08 80010A08 25187800 */  or         $v1, $v1, $t8
    /* A0C 80010A0C 0B000624 */  addiu      $a2, $zero, 0xB
    /* A10 80010A10 8B42000C */  jal        func_80010A2C
    /* A14 80010A14 00000000 */   nop
    /* A18 80010A18 0000BF8F */  lw         $ra, 0x0($sp)
    /* A1C 80010A1C 00000000 */  nop
    /* A20 80010A20 0400BD27 */  addiu      $sp, $sp, 0x4
    /* A24 80010A24 0800E003 */  jr         $ra
    /* A28 80010A28 00000000 */   nop
endlabel func_8001097C
