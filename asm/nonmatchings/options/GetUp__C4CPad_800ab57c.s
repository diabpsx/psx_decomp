.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetUp__C4CPad_800ab57c, 0x28

glabel GetUp__C4CPad_800ab57c
    /* 9B57C 800AB57C 00008290 */  lbu        $v0, 0x0($a0)
    /* 9B580 800AB580 00000000 */  nop
    /* 9B584 800AB584 04004014 */  bnez       $v0, .L800AB598
    /* 9B588 800AB588 00000000 */   nop
    /* 9B58C 800AB58C 0A008294 */  lhu        $v0, 0xA($a0)
    /* 9B590 800AB590 67AD0208 */  j          .L800AB59C
    /* 9B594 800AB594 00000000 */   nop
  .L800AB598:
    /* 9B598 800AB598 14008294 */  lhu        $v0, 0x14($a0)
  .L800AB59C:
    /* 9B59C 800AB59C 0800E003 */  jr         $ra
    /* 9B5A0 800AB5A0 00000000 */   nop
endlabel GetUp__C4CPad_800ab57c
