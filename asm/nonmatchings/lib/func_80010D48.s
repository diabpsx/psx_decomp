.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching func_80010D48, 0x78

glabel func_80010D48
    /* D48 80010D48 21100000 */  addu       $v0, $zero, $zero
  .L80010D4C:
    /* D4C 80010D4C C0371800 */  sll        $a2, $t8, 31
    /* D50 80010D50 42C01800 */  srl        $t8, $t8, 1
    /* D54 80010D54 0500C104 */  bgez       $a2, .L80010D6C
    /* D58 80010D58 00000000 */   nop
    /* D5C 80010D5C 05000013 */  beqz       $t8, .L80010D74
    /* D60 80010D60 00000000 */   nop
    /* D64 80010D64 68430008 */  j          .L80010DA0
    /* D68 80010D68 00000000 */   nop
  .L80010D6C:
    /* D6C 80010D6C 0C000017 */  bnez       $t8, .L80010DA0
    /* D70 80010D70 00000000 */   nop
  .L80010D74:
    /* D74 80010D74 21C04003 */  addu       $t8, $k0, $zero
    /* D78 80010D78 FCFF0821 */  addi       $t0, $t0, -0x4 /* handwritten instruction */
    /* D7C 80010D7C 00001A8D */  lw         $k0, 0x0($t0) /* handwritten instruction */
    /* D80 80010D80 00000000 */  nop
    /* D84 80010D84 2628B800 */  xor        $a1, $a1, $t8
    /* D88 80010D88 42081800 */  srl        $at, $t8, 1
    /* D8C 80010D8C C0371800 */  sll        $a2, $t8, 31
    /* D90 80010D90 2530C100 */  or         $a2, $a2, $at
    /* D94 80010D94 42C01800 */  srl        $t8, $t8, 1
    /* D98 80010D98 0080013C */  lui        $at, (0x80000000 >> 16)
    /* D9C 80010D9C 25C00103 */  or         $t8, $t8, $at
  .L80010DA0:
    /* DA0 80010DA0 2A30C000 */  slt        $a2, $a2, $zero
    /* DA4 80010DA4 40100200 */  sll        $v0, $v0, 1
    /* DA8 80010DA8 25104600 */  or         $v0, $v0, $a2
    /* DAC 80010DAC FFFF3923 */  addi       $t9, $t9, -0x1 /* handwritten instruction */
    /* DB0 80010DB0 E6FF2017 */  bnez       $t9, .L80010D4C
    /* DB4 80010DB4 00000000 */   nop
    /* DB8 80010DB8 0800E003 */  jr         $ra
    /* DBC 80010DBC 00000000 */   nop
endlabel func_80010D48
