.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _SpuIsInAllocateArea, 0x80

glabel _SpuIsInAllocateArea
    /* 7ADC 80017ADC 0B80023C */  lui        $v0, %hi(_spu_memList)
    /* 7AE0 80017AE0 B45A428C */  lw         $v0, %lo(_spu_memList)($v0)
    /* 7AE4 80017AE4 00000000 */  nop
    /* 7AE8 80017AE8 03004014 */  bnez       $v0, .L80017AF8
    /* 7AEC 80017AEC 0080083C */   lui       $t0, (0x80000000 >> 16)
    /* 7AF0 80017AF0 D55E0008 */  j          .L80017B54
    /* 7AF4 80017AF4 21100000 */   addu      $v0, $zero, $zero
  .L80017AF8:
    /* 7AF8 80017AF8 0040073C */  lui        $a3, (0x40000000 >> 16)
    /* 7AFC 80017AFC FF0F063C */  lui        $a2, (0xFFFFFFF >> 16)
    /* 7B00 80017B00 FFFFC634 */  ori        $a2, $a2, (0xFFFFFFF & 0xFFFF)
    /* 7B04 80017B04 21284000 */  addu       $a1, $v0, $zero
  .L80017B08:
    /* 7B08 80017B08 0000A38C */  lw         $v1, 0x0($a1)
    /* 7B0C 80017B0C 00000000 */  nop
    /* 7B10 80017B10 24106800 */  and        $v0, $v1, $t0
    /* 7B14 80017B14 0C004014 */  bnez       $v0, .L80017B48
    /* 7B18 80017B18 24106700 */   and       $v0, $v1, $a3
    /* 7B1C 80017B1C 0C004014 */  bnez       $v0, .L80017B50
    /* 7B20 80017B20 24186600 */   and       $v1, $v1, $a2
    /* 7B24 80017B24 2B106400 */  sltu       $v0, $v1, $a0
    /* 7B28 80017B28 0A004010 */  beqz       $v0, .L80017B54
    /* 7B2C 80017B2C 01000224 */   addiu     $v0, $zero, 0x1
    /* 7B30 80017B30 0400A28C */  lw         $v0, 0x4($a1)
    /* 7B34 80017B34 00000000 */  nop
    /* 7B38 80017B38 21106200 */  addu       $v0, $v1, $v0
    /* 7B3C 80017B3C 2B108200 */  sltu       $v0, $a0, $v0
    /* 7B40 80017B40 04004014 */  bnez       $v0, .L80017B54
    /* 7B44 80017B44 01000224 */   addiu     $v0, $zero, 0x1
  .L80017B48:
    /* 7B48 80017B48 C25E0008 */  j          .L80017B08
    /* 7B4C 80017B4C 0800A524 */   addiu     $a1, $a1, 0x8
  .L80017B50:
    /* 7B50 80017B50 21100000 */  addu       $v0, $zero, $zero
  .L80017B54:
    /* 7B54 80017B54 0800E003 */  jr         $ra
    /* 7B58 80017B58 00000000 */   nop
endlabel _SpuIsInAllocateArea
