.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTick__C4CPad, 0x28

glabel GetTick__C4CPad
    /* 275B4 800375B4 00008290 */  lbu        $v0, 0x0($a0)
    /* 275B8 800375B8 00000000 */  nop
    /* 275BC 800375BC 04004014 */  bnez       $v0, .L800375D0
    /* 275C0 800375C0 00000000 */   nop
    /* 275C4 800375C4 0E008294 */  lhu        $v0, 0xE($a0)
    /* 275C8 800375C8 75DD0008 */  j          .L800375D4
    /* 275CC 800375CC 00000000 */   nop
  .L800375D0:
    /* 275D0 800375D0 18008294 */  lhu        $v0, 0x18($a0)
  .L800375D4:
    /* 275D4 800375D4 0800E003 */  jr         $ra
    /* 275D8 800375D8 00000000 */   nop
endlabel GetTick__C4CPad
