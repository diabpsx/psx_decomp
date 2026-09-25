.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AlignSize, 0x30

glabel AlignSize
    /* 11B40 80021B40 1B008500 */  divu       $zero, $a0, $a1
    /* 11B44 80021B44 0200A014 */  bnez       $a1, .L80021B50
    /* 11B48 80021B48 00000000 */   nop
    /* 11B4C 80021B4C 0D000700 */  break      7
  .L80021B50:
    /* 11B50 80021B50 10180000 */  mfhi       $v1
    /* 11B54 80021B54 00000000 */  nop
    /* 11B58 80021B58 03006010 */  beqz       $v1, .L80021B68
    /* 11B5C 80021B5C 21108000 */   addu      $v0, $a0, $zero
    /* 11B60 80021B60 2310A300 */  subu       $v0, $a1, $v1
    /* 11B64 80021B64 21108200 */  addu       $v0, $a0, $v0
  .L80021B68:
    /* 11B68 80021B68 0800E003 */  jr         $ra
    /* 11B6C 80021B6C 00000000 */   nop
endlabel AlignSize
