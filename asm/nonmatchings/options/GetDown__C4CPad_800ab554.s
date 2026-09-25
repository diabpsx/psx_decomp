.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_800ab554, 0x28

glabel GetDown__C4CPad_800ab554
    /* 9B554 800AB554 00008290 */  lbu        $v0, 0x0($a0)
    /* 9B558 800AB558 00000000 */  nop
    /* 9B55C 800AB55C 04004014 */  bnez       $v0, .L800AB570
    /* 9B560 800AB560 00000000 */   nop
    /* 9B564 800AB564 0C008294 */  lhu        $v0, 0xC($a0)
    /* 9B568 800AB568 5DAD0208 */  j          .L800AB574
    /* 9B56C 800AB56C 00000000 */   nop
  .L800AB570:
    /* 9B570 800AB570 16008294 */  lhu        $v0, 0x16($a0)
  .L800AB574:
    /* 9B574 800AB574 0800E003 */  jr         $ra
    /* 9B578 800AB578 00000000 */   nop
endlabel GetDown__C4CPad_800ab554
