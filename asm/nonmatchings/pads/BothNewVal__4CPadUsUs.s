.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BothNewVal__4CPadUsUs, 0x94

glabel BothNewVal__4CPadUsUs
    /* 79918 80089918 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7991C 8008991C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 79920 80089920 21888000 */  addu       $s1, $a0, $zero
    /* 79924 80089924 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 79928 80089928 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7992C 8008992C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 79930 80089930 6B26020C */  jal        Trans__4CPadUs
    /* 79934 80089934 2180C000 */   addu      $s0, $a2, $zero
    /* 79938 80089938 21202002 */  addu       $a0, $s1, $zero
    /* 7993C 8008993C FFFF0532 */  andi       $a1, $s0, 0xFFFF
    /* 79940 80089940 6B26020C */  jal        Trans__4CPadUs
    /* 79944 80089944 21804000 */   addu      $s0, $v0, $zero
    /* 79948 80089948 12002396 */  lhu        $v1, 0x12($s1)
    /* 7994C 8008994C 25800202 */  or         $s0, $s0, $v0
    /* 79950 80089950 120030A6 */  sh         $s0, 0x12($s1)
    /* 79954 80089954 12002496 */  lhu        $a0, 0x12($s1)
    /* 79958 80089958 03002692 */  lbu        $a2, 0x3($s1)
    /* 7995C 8008995C 1A0023A6 */  sh         $v1, 0x1A($s1)
    /* 79960 80089960 1A002296 */  lhu        $v0, 0x1A($s1)
    /* 79964 80089964 1A002396 */  lhu        $v1, 0x1A($s1)
    /* 79968 80089968 26100202 */  xor        $v0, $s0, $v0
    /* 7996C 8008996C 24800202 */  and        $s0, $s0, $v0
    /* 79970 80089970 12002296 */  lhu        $v0, 0x12($s1)
    /* 79974 80089974 AC002726 */  addiu      $a3, $s1, 0xAC
    /* 79978 80089978 160030A6 */  sh         $s0, 0x16($s1)
    /* 7997C 8008997C 16002596 */  lhu        $a1, 0x16($s1)
    /* 79980 80089980 27100200 */  nor        $v0, $zero, $v0
    /* 79984 80089984 24186200 */  and        $v1, $v1, $v0
    /* 79988 80089988 D126020C */  jal        MakeClickBits__FiiiPUs
    /* 7998C 8008998C 140023A6 */   sh        $v1, 0x14($s1)
    /* 79990 80089990 180022A6 */  sh         $v0, 0x18($s1)
    /* 79994 80089994 1800BF8F */  lw         $ra, 0x18($sp)
    /* 79998 80089998 1400B18F */  lw         $s1, 0x14($sp)
    /* 7999C 8008999C 1000B08F */  lw         $s0, 0x10($sp)
    /* 799A0 800899A0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 799A4 800899A4 0800E003 */  jr         $ra
    /* 799A8 800899A8 00000000 */   nop
endlabel BothNewVal__4CPadUsUs
