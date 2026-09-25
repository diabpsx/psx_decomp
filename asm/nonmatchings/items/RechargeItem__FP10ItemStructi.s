.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RechargeItem__FP10ItemStructi, 0x68

glabel RechargeItem__FP10ItemStructi
    /* 35FD0 80045FD0 49008390 */  lbu        $v1, 0x49($a0)
    /* 35FD4 80045FD4 4B008290 */  lbu        $v0, 0x4B($a0)
    /* 35FD8 80045FD8 00000000 */  nop
    /* 35FDC 80045FDC 14006210 */  beq        $v1, $v0, .L80046030
    /* 35FE0 80045FE0 00000000 */   nop
  .L80045FE4:
    /* 35FE4 80045FE4 4B008290 */  lbu        $v0, 0x4B($a0)
    /* 35FE8 80045FE8 00000000 */  nop
    /* 35FEC 80045FEC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 35FF0 80045FF0 4B0082A0 */  sb         $v0, 0x4B($a0)
    /* 35FF4 80045FF4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 35FF8 80045FF8 0D004010 */  beqz       $v0, .L80046030
    /* 35FFC 80045FFC 00000000 */   nop
    /* 36000 80046000 49008290 */  lbu        $v0, 0x49($a0)
    /* 36004 80046004 4B008790 */  lbu        $a3, 0x4B($a0)
    /* 36008 80046008 21104500 */  addu       $v0, $v0, $a1
    /* 3600C 8004600C FF004630 */  andi       $a2, $v0, 0xFF
    /* 36010 80046010 FF00E330 */  andi       $v1, $a3, 0xFF
    /* 36014 80046014 490082A0 */  sb         $v0, 0x49($a0)
    /* 36018 80046018 2B10C300 */  sltu       $v0, $a2, $v1
    /* 3601C 8004601C F1FF4014 */  bnez       $v0, .L80045FE4
    /* 36020 80046020 2B106600 */   sltu      $v0, $v1, $a2
    /* 36024 80046024 02004010 */  beqz       $v0, .L80046030
    /* 36028 80046028 00000000 */   nop
    /* 3602C 8004602C 490087A0 */  sb         $a3, 0x49($a0)
  .L80046030:
    /* 36030 80046030 0800E003 */  jr         $ra
    /* 36034 80046034 00000000 */   nop
endlabel RechargeItem__FP10ItemStructi
