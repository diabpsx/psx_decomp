.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ExtraMarkStack, 0x2C

glabel ExtraMarkStack
    /* 10B84 80020B84 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 10B88 80020B88 0600A018 */  blez       $a1, .L80020BA4
    /* 10B8C 80020B8C 21180000 */   addu      $v1, $zero, $zero
  .L80020B90:
    /* 10B90 80020B90 000083AC */  sw         $v1, 0x0($a0)
    /* 10B94 80020B94 01006324 */  addiu      $v1, $v1, 0x1
    /* 10B98 80020B98 2A106500 */  slt        $v0, $v1, $a1
    /* 10B9C 80020B9C FCFF4014 */  bnez       $v0, .L80020B90
    /* 10BA0 80020BA0 04008424 */   addiu     $a0, $a0, 0x4
  .L80020BA4:
    /* 10BA4 80020BA4 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 10BA8 80020BA8 0800E003 */  jr         $ra
    /* 10BAC 80020BAC 00000000 */   nop
endlabel ExtraMarkStack
