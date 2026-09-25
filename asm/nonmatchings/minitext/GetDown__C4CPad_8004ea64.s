.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_8004ea64, 0x28

glabel GetDown__C4CPad_8004ea64
    /* 3EA64 8004EA64 00008290 */  lbu        $v0, 0x0($a0)
    /* 3EA68 8004EA68 00000000 */  nop
    /* 3EA6C 8004EA6C 04004014 */  bnez       $v0, .L8004EA80
    /* 3EA70 8004EA70 00000000 */   nop
    /* 3EA74 8004EA74 0C008294 */  lhu        $v0, 0xC($a0)
    /* 3EA78 8004EA78 A13A0108 */  j          .L8004EA84
    /* 3EA7C 8004EA7C 00000000 */   nop
  .L8004EA80:
    /* 3EA80 8004EA80 16008294 */  lhu        $v0, 0x16($a0)
  .L8004EA84:
    /* 3EA84 8004EA84 0800E003 */  jr         $ra
    /* 3EA88 8004EA88 00000000 */   nop
endlabel GetDown__C4CPad_8004ea64
