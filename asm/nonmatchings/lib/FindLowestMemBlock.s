.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindLowestMemBlock, 0x68

glabel FindLowestMemBlock
    /* 11C30 80021C30 21300000 */  addu       $a2, $zero, $zero
    /* 11C34 80021C34 16008010 */  beqz       $a0, .L80021C90
    /* 11C38 80021C38 FFFF0724 */   addiu     $a3, $zero, -0x1
  .L80021C3C:
    /* 11C3C 80021C3C 0C00828C */  lw         $v0, 0xC($a0)
    /* 11C40 80021C40 00000000 */  nop
    /* 11C44 80021C44 2B104500 */  sltu       $v0, $v0, $a1
    /* 11C48 80021C48 0D004014 */  bnez       $v0, .L80021C80
    /* 11C4C 80021C4C 00000000 */   nop
    /* 11C50 80021C50 0900C010 */  beqz       $a2, .L80021C78
    /* 11C54 80021C54 00000000 */   nop
    /* 11C58 80021C58 0800838C */  lw         $v1, 0x8($a0)
    /* 11C5C 80021C5C 00000000 */  nop
    /* 11C60 80021C60 2B106700 */  sltu       $v0, $v1, $a3
    /* 11C64 80021C64 06004010 */  beqz       $v0, .L80021C80
    /* 11C68 80021C68 00000000 */   nop
    /* 11C6C 80021C6C 21308000 */  addu       $a2, $a0, $zero
    /* 11C70 80021C70 20870008 */  j          .L80021C80
    /* 11C74 80021C74 21386000 */   addu      $a3, $v1, $zero
  .L80021C78:
    /* 11C78 80021C78 21308000 */  addu       $a2, $a0, $zero
    /* 11C7C 80021C7C 0800878C */  lw         $a3, 0x8($a0)
  .L80021C80:
    /* 11C80 80021C80 0400848C */  lw         $a0, 0x4($a0)
    /* 11C84 80021C84 00000000 */  nop
    /* 11C88 80021C88 ECFF8014 */  bnez       $a0, .L80021C3C
    /* 11C8C 80021C8C 00000000 */   nop
  .L80021C90:
    /* 11C90 80021C90 0800E003 */  jr         $ra
    /* 11C94 80021C94 2110C000 */   addu      $v0, $a2, $zero
endlabel FindLowestMemBlock
