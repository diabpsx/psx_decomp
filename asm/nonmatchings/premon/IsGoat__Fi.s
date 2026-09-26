.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsGoat__Fi, 0x2C

glabel IsGoat__Fi
    /* 283B8 80161FB0 DEFF8224 */  addiu      $v0, $a0, -0x22
    /* 283BC 80161FB4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 283C0 80161FB8 05004014 */  bnez       $v0, .L80161FD0
    /* 283C4 80161FBC 21180000 */   addu      $v1, $zero, $zero
    /* 283C8 80161FC0 D6FF8224 */  addiu      $v0, $a0, -0x2A
    /* 283CC 80161FC4 0400422C */  sltiu      $v0, $v0, 0x4
    /* 283D0 80161FC8 02004010 */  beqz       $v0, .L80161FD4
    /* 283D4 80161FCC 00000000 */   nop
  .L80161FD0:
    /* 283D8 80161FD0 01000324 */  addiu      $v1, $zero, 0x1
  .L80161FD4:
    /* 283DC 80161FD4 0800E003 */  jr         $ra
    /* 283E0 80161FD8 21106000 */   addu      $v0, $v1, $zero
endlabel IsGoat__Fi
