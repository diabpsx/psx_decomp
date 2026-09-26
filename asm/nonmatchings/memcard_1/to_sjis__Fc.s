.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching to_sjis__Fc, 0x80

glabel to_sjis__Fc
    /* 8B7C 80142774 1480063C */  lui        $a2, %hi(sjis_table)
    /* 8B80 80142778 58E1C624 */  addiu      $a2, $a2, %lo(sjis_table)
    /* 8B84 8014277C 0000C280 */  lb         $v0, 0x0($a2)
    /* 8B88 80142780 0000C390 */  lbu        $v1, 0x0($a2)
    /* 8B8C 80142784 17004010 */  beqz       $v0, .L801427E4
    /* 8B90 80142788 F0FFBD27 */   addiu     $sp, $sp, -0x10
    /* 8B94 8014278C 00160400 */  sll        $v0, $a0, 24
    /* 8B98 80142790 033E0200 */  sra        $a3, $v0, 24
    /* 8B9C 80142794 0200C524 */  addiu      $a1, $a2, 0x2
  .L80142798:
    /* 8BA0 80142798 00160300 */  sll        $v0, $v1, 24
    /* 8BA4 8014279C 03260200 */  sra        $a0, $v0, 24
    /* 8BA8 801427A0 2A10E400 */  slt        $v0, $a3, $a0
    /* 8BAC 801427A4 0A004014 */  bnez       $v0, .L801427D0
    /* 8BB0 801427A8 00000000 */   nop
    /* 8BB4 801427AC FFFFA290 */  lbu        $v0, -0x1($a1)
    /* 8BB8 801427B0 00000000 */  nop
    /* 8BBC 801427B4 21108200 */  addu       $v0, $a0, $v0
    /* 8BC0 801427B8 2A10E200 */  slt        $v0, $a3, $v0
    /* 8BC4 801427BC 04004010 */  beqz       $v0, .L801427D0
    /* 8BC8 801427C0 2310E400 */   subu      $v0, $a3, $a0
    /* 8BCC 801427C4 0000A394 */  lhu        $v1, 0x0($a1)
    /* 8BD0 801427C8 FA090508 */  j          .L801427E8
    /* 8BD4 801427CC 21106200 */   addu      $v0, $v1, $v0
  .L801427D0:
    /* 8BD8 801427D0 0400C624 */  addiu      $a2, $a2, 0x4
    /* 8BDC 801427D4 0000C280 */  lb         $v0, 0x0($a2)
    /* 8BE0 801427D8 0000C390 */  lbu        $v1, 0x0($a2)
    /* 8BE4 801427DC EEFF4014 */  bnez       $v0, .L80142798
    /* 8BE8 801427E0 0400A524 */   addiu     $a1, $a1, 0x4
  .L801427E4:
    /* 8BEC 801427E4 48810234 */  ori        $v0, $zero, 0x8148
  .L801427E8:
    /* 8BF0 801427E8 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 8BF4 801427EC 0800E003 */  jr         $ra
    /* 8BF8 801427F0 00000000 */   nop
endlabel to_sjis__Fc
