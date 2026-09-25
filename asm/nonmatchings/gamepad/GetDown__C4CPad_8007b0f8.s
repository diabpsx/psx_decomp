.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_8007b0f8, 0x28

glabel GetDown__C4CPad_8007b0f8
    /* 6B0F8 8007B0F8 00008290 */  lbu        $v0, 0x0($a0)
    /* 6B0FC 8007B0FC 00000000 */  nop
    /* 6B100 8007B100 04004014 */  bnez       $v0, .L8007B114
    /* 6B104 8007B104 00000000 */   nop
    /* 6B108 8007B108 0C008294 */  lhu        $v0, 0xC($a0)
    /* 6B10C 8007B10C 46EC0108 */  j          .L8007B118
    /* 6B110 8007B110 00000000 */   nop
  .L8007B114:
    /* 6B114 8007B114 16008294 */  lhu        $v0, 0x16($a0)
  .L8007B118:
    /* 6B118 8007B118 0800E003 */  jr         $ra
    /* 6B11C 8007B11C 00000000 */   nop
endlabel GetDown__C4CPad_8007b0f8
