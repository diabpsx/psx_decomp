.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching UpdateSel__FPUsUsPUc, 0x40

glabel UpdateSel__FPUsUsPUc
    /* 7D41C 8008D41C 00008294 */  lhu        $v0, 0x0($a0)
    /* 7D420 8008D420 00000000 */  nop
    /* 7D424 8008D424 FF7F4330 */  andi       $v1, $v0, 0x7FFF
    /* 7D428 8008D428 000083A4 */  sh         $v1, 0x0($a0)
    /* 7D42C 8008D42C 0000C290 */  lbu        $v0, 0x0($a2)
    /* 7D430 8008D430 00000000 */  nop
    /* 7D434 8008D434 1000422C */  sltiu      $v0, $v0, 0x10
    /* 7D438 8008D438 02004014 */  bnez       $v0, .L8008D444
    /* 7D43C 8008D43C 21106500 */   addu      $v0, $v1, $a1
    /* 7D440 8008D440 23106500 */  subu       $v0, $v1, $a1
  .L8008D444:
    /* 7D444 8008D444 000082A4 */  sh         $v0, 0x0($a0)
    /* 7D448 8008D448 00008294 */  lhu        $v0, 0x0($a0)
    /* 7D44C 8008D44C 00000000 */  nop
    /* 7D450 8008D450 00804234 */  ori        $v0, $v0, 0x8000
    /* 7D454 8008D454 0800E003 */  jr         $ra
    /* 7D458 8008D458 000082A4 */   sh        $v0, 0x0($a0)
endlabel UpdateSel__FPUsUsPUc
