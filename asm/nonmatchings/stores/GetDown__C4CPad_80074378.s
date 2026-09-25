.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_80074378, 0x28

glabel GetDown__C4CPad_80074378
    /* 64378 80074378 00008290 */  lbu        $v0, 0x0($a0)
    /* 6437C 8007437C 00000000 */  nop
    /* 64380 80074380 04004014 */  bnez       $v0, .L80074394
    /* 64384 80074384 00000000 */   nop
    /* 64388 80074388 0C008294 */  lhu        $v0, 0xC($a0)
    /* 6438C 8007438C E6D00108 */  j          .L80074398
    /* 64390 80074390 00000000 */   nop
  .L80074394:
    /* 64394 80074394 16008294 */  lhu        $v0, 0x16($a0)
  .L80074398:
    /* 64398 80074398 0800E003 */  jr         $ra
    /* 6439C 8007439C 00000000 */   nop
endlabel GetDown__C4CPad_80074378
