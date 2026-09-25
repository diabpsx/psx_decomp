.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad, 0x28

glabel GetDown__C4CPad
    /* 275DC 800375DC 00008290 */  lbu        $v0, 0x0($a0)
    /* 275E0 800375E0 00000000 */  nop
    /* 275E4 800375E4 04004014 */  bnez       $v0, .L800375F8
    /* 275E8 800375E8 00000000 */   nop
    /* 275EC 800375EC 0C008294 */  lhu        $v0, 0xC($a0)
    /* 275F0 800375F0 7FDD0008 */  j          .L800375FC
    /* 275F4 800375F4 00000000 */   nop
  .L800375F8:
    /* 275F8 800375F8 16008294 */  lhu        $v0, 0x16($a0)
  .L800375FC:
    /* 275FC 800375FC 0800E003 */  jr         $ra
    /* 27600 80037600 00000000 */   nop
endlabel GetDown__C4CPad
