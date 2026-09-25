.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_800894ac, 0x28

glabel GetDown__C4CPad_800894ac
    /* 794AC 800894AC 00008290 */  lbu        $v0, 0x0($a0)
    /* 794B0 800894B0 00000000 */  nop
    /* 794B4 800894B4 04004014 */  bnez       $v0, .L800894C8
    /* 794B8 800894B8 00000000 */   nop
    /* 794BC 800894BC 0C008294 */  lhu        $v0, 0xC($a0)
    /* 794C0 800894C0 33250208 */  j          .L800894CC
    /* 794C4 800894C4 00000000 */   nop
  .L800894C8:
    /* 794C8 800894C8 16008294 */  lhu        $v0, 0x16($a0)
  .L800894CC:
    /* 794CC 800894CC 0800E003 */  jr         $ra
    /* 794D0 800894D0 00000000 */   nop
endlabel GetDown__C4CPad_800894ac
