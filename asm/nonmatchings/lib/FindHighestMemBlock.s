.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindHighestMemBlock, 0x68

glabel FindHighestMemBlock
    /* 11BC8 80021BC8 21300000 */  addu       $a2, $zero, $zero
    /* 11BCC 80021BCC 16008010 */  beqz       $a0, .L80021C28
    /* 11BD0 80021BD0 21380000 */   addu      $a3, $zero, $zero
  .L80021BD4:
    /* 11BD4 80021BD4 0C00828C */  lw         $v0, 0xC($a0)
    /* 11BD8 80021BD8 00000000 */  nop
    /* 11BDC 80021BDC 2B104500 */  sltu       $v0, $v0, $a1
    /* 11BE0 80021BE0 0D004014 */  bnez       $v0, .L80021C18
    /* 11BE4 80021BE4 00000000 */   nop
    /* 11BE8 80021BE8 0900C010 */  beqz       $a2, .L80021C10
    /* 11BEC 80021BEC 00000000 */   nop
    /* 11BF0 80021BF0 0800838C */  lw         $v1, 0x8($a0)
    /* 11BF4 80021BF4 00000000 */  nop
    /* 11BF8 80021BF8 2B10E300 */  sltu       $v0, $a3, $v1
    /* 11BFC 80021BFC 06004010 */  beqz       $v0, .L80021C18
    /* 11C00 80021C00 00000000 */   nop
    /* 11C04 80021C04 21308000 */  addu       $a2, $a0, $zero
    /* 11C08 80021C08 06870008 */  j          .L80021C18
    /* 11C0C 80021C0C 21386000 */   addu      $a3, $v1, $zero
  .L80021C10:
    /* 11C10 80021C10 21308000 */  addu       $a2, $a0, $zero
    /* 11C14 80021C14 0800878C */  lw         $a3, 0x8($a0)
  .L80021C18:
    /* 11C18 80021C18 0400848C */  lw         $a0, 0x4($a0)
    /* 11C1C 80021C1C 00000000 */  nop
    /* 11C20 80021C20 ECFF8014 */  bnez       $a0, .L80021BD4
    /* 11C24 80021C24 00000000 */   nop
  .L80021C28:
    /* 11C28 80021C28 0800E003 */  jr         $ra
    /* 11C2C 80021C2C 2110C000 */   addu      $v0, $a2, $zero
endlabel FindHighestMemBlock
