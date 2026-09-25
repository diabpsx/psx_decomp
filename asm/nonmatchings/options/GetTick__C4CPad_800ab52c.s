.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTick__C4CPad_800ab52c, 0x28

glabel GetTick__C4CPad_800ab52c
    /* 9B52C 800AB52C 00008290 */  lbu        $v0, 0x0($a0)
    /* 9B530 800AB530 00000000 */  nop
    /* 9B534 800AB534 04004014 */  bnez       $v0, .L800AB548
    /* 9B538 800AB538 00000000 */   nop
    /* 9B53C 800AB53C 0E008294 */  lhu        $v0, 0xE($a0)
    /* 9B540 800AB540 53AD0208 */  j          .L800AB54C
    /* 9B544 800AB544 00000000 */   nop
  .L800AB548:
    /* 9B548 800AB548 18008294 */  lhu        $v0, 0x18($a0)
  .L800AB54C:
    /* 9B54C 800AB54C 0800E003 */  jr         $ra
    /* 9B550 800AB550 00000000 */   nop
endlabel GetTick__C4CPad_800ab52c
