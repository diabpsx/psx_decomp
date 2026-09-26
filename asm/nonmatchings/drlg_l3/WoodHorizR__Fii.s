.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WoodHorizR__Fii, 0x84

glabel WoodHorizR__Fii
    /* 11D50 8014B948 0E80033C */  lui        $v1, %hi(dungeon)
    /* 11D54 8014B94C C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 11D58 8014B950 40100400 */  sll        $v0, $a0, 1
    /* 11D5C 8014B954 21104400 */  addu       $v0, $v0, $a0
    /* 11D60 8014B958 40110200 */  sll        $v0, $v0, 5
    /* 11D64 8014B95C 21104300 */  addu       $v0, $v0, $v1
    /* 11D68 8014B960 40280500 */  sll        $a1, $a1, 1
    /* 11D6C 8014B964 2128A200 */  addu       $a1, $a1, $v0
    /* 11D70 8014B968 0200A294 */  lhu        $v0, 0x2($a1)
    /* 11D74 8014B96C 00000000 */  nop
    /* 11D78 8014B970 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11D7C 8014B974 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11D80 8014B978 12004014 */  bnez       $v0, .L8014B9C4
    /* 11D84 8014B97C 21100000 */   addu      $v0, $zero, $zero
    /* 11D88 8014B980 FEFFA294 */  lhu        $v0, -0x2($a1)
    /* 11D8C 8014B984 00000000 */  nop
    /* 11D90 8014B988 7EFF4224 */  addiu      $v0, $v0, -0x82
    /* 11D94 8014B98C 1700422C */  sltiu      $v0, $v0, 0x17
    /* 11D98 8014B990 0C004014 */  bnez       $v0, .L8014B9C4
    /* 11D9C 8014B994 21100000 */   addu      $v0, $zero, $zero
    /* 11DA0 8014B998 0000A594 */  lhu        $a1, 0x0($a1)
    /* 11DA4 8014B99C 07000224 */  addiu      $v0, $zero, 0x7
    /* 11DA8 8014B9A0 0700A210 */  beq        $a1, $v0, .L8014B9C0
    /* 11DAC 8014B9A4 04000224 */   addiu     $v0, $zero, 0x4
    /* 11DB0 8014B9A8 0500A210 */  beq        $a1, $v0, .L8014B9C0
    /* 11DB4 8014B9AC 87000224 */   addiu     $v0, $zero, 0x87
    /* 11DB8 8014B9B0 0300A210 */  beq        $a1, $v0, .L8014B9C0
    /* 11DBC 8014B9B4 89000224 */   addiu     $v0, $zero, 0x89
    /* 11DC0 8014B9B8 0200A214 */  bne        $a1, $v0, .L8014B9C4
    /* 11DC4 8014B9BC 21100000 */   addu      $v0, $zero, $zero
  .L8014B9C0:
    /* 11DC8 8014B9C0 01000224 */  addiu      $v0, $zero, 0x1
  .L8014B9C4:
    /* 11DCC 8014B9C4 0800E003 */  jr         $ra
    /* 11DD0 8014B9C8 00000000 */   nop
endlabel WoodHorizR__Fii
