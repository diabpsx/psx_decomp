.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTick__C4CPad_800af088, 0x28

glabel GetTick__C4CPad_800af088
    /* 9F088 800AF088 00008290 */  lbu        $v0, 0x0($a0)
    /* 9F08C 800AF08C 00000000 */  nop
    /* 9F090 800AF090 04004014 */  bnez       $v0, .L800AF0A4
    /* 9F094 800AF094 00000000 */   nop
    /* 9F098 800AF098 0E008294 */  lhu        $v0, 0xE($a0)
    /* 9F09C 800AF09C 2ABC0208 */  j          .L800AF0A8
    /* 9F0A0 800AF0A0 00000000 */   nop
  .L800AF0A4:
    /* 9F0A4 800AF0A4 18008294 */  lhu        $v0, 0x18($a0)
  .L800AF0A8:
    /* 9F0A8 800AF0A8 0800E003 */  jr         $ra
    /* 9F0AC 800AF0AC 00000000 */   nop
endlabel GetTick__C4CPad_800af088
