.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_800a4334, 0x28

glabel GetDown__C4CPad_800a4334
    /* 94334 800A4334 00008290 */  lbu        $v0, 0x0($a0)
    /* 94338 800A4338 00000000 */  nop
    /* 9433C 800A433C 04004014 */  bnez       $v0, .L800A4350
    /* 94340 800A4340 00000000 */   nop
    /* 94344 800A4344 0C008294 */  lhu        $v0, 0xC($a0)
    /* 94348 800A4348 D5900208 */  j          .L800A4354
    /* 9434C 800A434C 00000000 */   nop
  .L800A4350:
    /* 94350 800A4350 16008294 */  lhu        $v0, 0x16($a0)
  .L800A4354:
    /* 94354 800A4354 0800E003 */  jr         $ra
    /* 94358 800A4358 00000000 */   nop
endlabel GetDown__C4CPad_800a4334
