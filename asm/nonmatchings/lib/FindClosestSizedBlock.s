.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindClosestSizedBlock, 0x58

glabel FindClosestSizedBlock
    /* 11B70 80021B70 13008010 */  beqz       $a0, .L80021BC0
    /* 11B74 80021B74 21300000 */   addu      $a2, $zero, $zero
  .L80021B78:
    /* 11B78 80021B78 0C00838C */  lw         $v1, 0xC($a0)
    /* 11B7C 80021B7C 00000000 */  nop
    /* 11B80 80021B80 2B106500 */  sltu       $v0, $v1, $a1
    /* 11B84 80021B84 0A004014 */  bnez       $v0, .L80021BB0
    /* 11B88 80021B88 00000000 */   nop
    /* 11B8C 80021B8C 0700C010 */  beqz       $a2, .L80021BAC
    /* 11B90 80021B90 23186500 */   subu      $v1, $v1, $a1
    /* 11B94 80021B94 0C00C28C */  lw         $v0, 0xC($a2)
    /* 11B98 80021B98 00000000 */  nop
    /* 11B9C 80021B9C 23104500 */  subu       $v0, $v0, $a1
    /* 11BA0 80021BA0 2B186200 */  sltu       $v1, $v1, $v0
    /* 11BA4 80021BA4 02006010 */  beqz       $v1, .L80021BB0
    /* 11BA8 80021BA8 00000000 */   nop
  .L80021BAC:
    /* 11BAC 80021BAC 21308000 */  addu       $a2, $a0, $zero
  .L80021BB0:
    /* 11BB0 80021BB0 0400848C */  lw         $a0, 0x4($a0)
    /* 11BB4 80021BB4 00000000 */  nop
    /* 11BB8 80021BB8 EFFF8014 */  bnez       $a0, .L80021B78
    /* 11BBC 80021BBC 00000000 */   nop
  .L80021BC0:
    /* 11BC0 80021BC0 0800E003 */  jr         $ra
    /* 11BC4 80021BC4 2110C000 */   addu      $v0, $a2, $zero
endlabel FindClosestSizedBlock
