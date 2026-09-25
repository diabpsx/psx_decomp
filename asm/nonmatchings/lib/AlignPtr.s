.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AlignPtr, 0x30

glabel AlignPtr
    /* 11B10 80021B10 1B008500 */  divu       $zero, $a0, $a1
    /* 11B14 80021B14 0200A014 */  bnez       $a1, .L80021B20
    /* 11B18 80021B18 00000000 */   nop
    /* 11B1C 80021B1C 0D000700 */  break      7
  .L80021B20:
    /* 11B20 80021B20 10100000 */  mfhi       $v0
    /* 11B24 80021B24 00000000 */  nop
    /* 11B28 80021B28 2310A200 */  subu       $v0, $a1, $v0
    /* 11B2C 80021B2C 02004510 */  beq        $v0, $a1, .L80021B38
    /* 11B30 80021B30 00000000 */   nop
    /* 11B34 80021B34 21208200 */  addu       $a0, $a0, $v0
  .L80021B38:
    /* 11B38 80021B38 0800E003 */  jr         $ra
    /* 11B3C 80021B3C 21108000 */   addu      $v0, $a0, $zero
endlabel AlignPtr
