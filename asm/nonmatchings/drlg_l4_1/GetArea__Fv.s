.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetArea__Fv, 0x5C

glabel GetArea__Fv
    /* 19038 80152C30 21300000 */  addu       $a2, $zero, $zero
    /* 1903C 80152C34 21280000 */  addu       $a1, $zero, $zero
    /* 19040 80152C38 1580083C */  lui        $t0, %hi(dung)
    /* 19044 80152C3C 74D80825 */  addiu      $t0, $t0, %lo(dung)
    /* 19048 80152C40 01000724 */  addiu      $a3, $zero, 0x1
  .L80152C44:
    /* 1904C 80152C44 21200000 */  addu       $a0, $zero, $zero
    /* 19050 80152C48 21180001 */  addu       $v1, $t0, $zero
  .L80152C4C:
    /* 19054 80152C4C 21106500 */  addu       $v0, $v1, $a1
    /* 19058 80152C50 00004290 */  lbu        $v0, 0x0($v0)
    /* 1905C 80152C54 00000000 */  nop
    /* 19060 80152C58 02004714 */  bne        $v0, $a3, .L80152C64
    /* 19064 80152C5C 00000000 */   nop
    /* 19068 80152C60 0100C624 */  addiu      $a2, $a2, 0x1
  .L80152C64:
    /* 1906C 80152C64 01008424 */  addiu      $a0, $a0, 0x1
    /* 19070 80152C68 14008228 */  slti       $v0, $a0, 0x14
    /* 19074 80152C6C F7FF4014 */  bnez       $v0, .L80152C4C
    /* 19078 80152C70 14006324 */   addiu     $v1, $v1, 0x14
    /* 1907C 80152C74 0100A524 */  addiu      $a1, $a1, 0x1
    /* 19080 80152C78 1400A228 */  slti       $v0, $a1, 0x14
    /* 19084 80152C7C F1FF4014 */  bnez       $v0, .L80152C44
    /* 19088 80152C80 00000000 */   nop
    /* 1908C 80152C84 0800E003 */  jr         $ra
    /* 19090 80152C88 2110C000 */   addu      $v0, $a2, $zero
endlabel GetArea__Fv
