.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_80082590, 0x28

glabel GetDown__C4CPad_80082590
    /* 72590 80082590 00008290 */  lbu        $v0, 0x0($a0)
    /* 72594 80082594 00000000 */  nop
    /* 72598 80082598 04004014 */  bnez       $v0, .L800825AC
    /* 7259C 8008259C 00000000 */   nop
    /* 725A0 800825A0 0C008294 */  lhu        $v0, 0xC($a0)
    /* 725A4 800825A4 6C090208 */  j          .L800825B0
    /* 725A8 800825A8 00000000 */   nop
  .L800825AC:
    /* 725AC 800825AC 16008294 */  lhu        $v0, 0x16($a0)
  .L800825B0:
    /* 725B0 800825B0 0800E003 */  jr         $ra
    /* 725B4 800825B4 00000000 */   nop
endlabel GetDown__C4CPad_80082590
