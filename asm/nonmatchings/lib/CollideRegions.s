.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CollideRegions, 0x34

glabel CollideRegions
    /* 12B94 80022B94 0000868C */  lw         $a2, 0x0($a0)
    /* 12B98 80022B98 0400828C */  lw         $v0, 0x4($a0)
    /* 12B9C 80022B9C 0000A38C */  lw         $v1, 0x0($a1)
    /* 12BA0 80022BA0 2110C200 */  addu       $v0, $a2, $v0
    /* 12BA4 80022BA4 2B106200 */  sltu       $v0, $v1, $v0
    /* 12BA8 80022BA8 05004010 */  beqz       $v0, .L80022BC0
    /* 12BAC 80022BAC 21100000 */   addu      $v0, $zero, $zero
    /* 12BB0 80022BB0 0400A28C */  lw         $v0, 0x4($a1)
    /* 12BB4 80022BB4 00000000 */  nop
    /* 12BB8 80022BB8 21106200 */  addu       $v0, $v1, $v0
    /* 12BBC 80022BBC 2B10C200 */  sltu       $v0, $a2, $v0
  .L80022BC0:
    /* 12BC0 80022BC0 0800E003 */  jr         $ra
    /* 12BC4 80022BC4 00000000 */   nop
endlabel CollideRegions
