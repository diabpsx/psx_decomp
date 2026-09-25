.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_800af0b0, 0x28

glabel GetDown__C4CPad_800af0b0
    /* 9F0B0 800AF0B0 00008290 */  lbu        $v0, 0x0($a0)
    /* 9F0B4 800AF0B4 00000000 */  nop
    /* 9F0B8 800AF0B8 04004014 */  bnez       $v0, .L800AF0CC
    /* 9F0BC 800AF0BC 00000000 */   nop
    /* 9F0C0 800AF0C0 0C008294 */  lhu        $v0, 0xC($a0)
    /* 9F0C4 800AF0C4 34BC0208 */  j          .L800AF0D0
    /* 9F0C8 800AF0C8 00000000 */   nop
  .L800AF0CC:
    /* 9F0CC 800AF0CC 16008294 */  lhu        $v0, 0x16($a0)
  .L800AF0D0:
    /* 9F0D0 800AF0D0 0800E003 */  jr         $ra
    /* 9F0D4 800AF0D4 00000000 */   nop
endlabel GetDown__C4CPad_800af0b0
