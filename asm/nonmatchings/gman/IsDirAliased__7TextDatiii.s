.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsDirAliased__7TextDatiii, 0x58

glabel IsDirAliased__7TextDatiii
    /* 83EEC 80093EEC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 83EF0 80093EF0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 83EF4 80093EF4 2180C000 */  addu       $s0, $a2, $zero
    /* 83EF8 80093EF8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 83EFC 80093EFC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 83F00 80093F00 C054020C */  jal        GetCreature__7TextDati_80095300
    /* 83F04 80093F04 2188E000 */   addu      $s1, $a3, $zero
    /* 83F08 80093F08 21204000 */  addu       $a0, $v0, $zero
    /* 83F0C 80093F0C BB50020C */  jal        GetAction__C12CCreatureHdri
    /* 83F10 80093F10 21280002 */   addu      $a1, $s0, $zero
    /* 83F14 80093F14 21105100 */  addu       $v0, $v0, $s1
    /* 83F18 80093F18 04004290 */  lbu        $v0, 0x4($v0)
    /* 83F1C 80093F1C 00000000 */  nop
    /* 83F20 80093F20 0F004230 */  andi       $v0, $v0, 0xF
    /* 83F24 80093F24 26105100 */  xor        $v0, $v0, $s1
    /* 83F28 80093F28 2B100200 */  sltu       $v0, $zero, $v0
    /* 83F2C 80093F2C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 83F30 80093F30 1400B18F */  lw         $s1, 0x14($sp)
    /* 83F34 80093F34 1000B08F */  lw         $s0, 0x10($sp)
    /* 83F38 80093F38 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 83F3C 80093F3C 0800E003 */  jr         $ra
    /* 83F40 80093F40 00000000 */   nop
endlabel IsDirAliased__7TextDatiii
