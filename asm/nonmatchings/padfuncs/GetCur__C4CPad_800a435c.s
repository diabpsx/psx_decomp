.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCur__C4CPad_800a435c, 0x28

glabel GetCur__C4CPad_800a435c
    /* 9435C 800A435C 00008290 */  lbu        $v0, 0x0($a0)
    /* 94360 800A4360 00000000 */  nop
    /* 94364 800A4364 04004014 */  bnez       $v0, .L800A4378
    /* 94368 800A4368 00000000 */   nop
    /* 9436C 800A436C 08008294 */  lhu        $v0, 0x8($a0)
    /* 94370 800A4370 DF900208 */  j          .L800A437C
    /* 94374 800A4374 00000000 */   nop
  .L800A4378:
    /* 94378 800A4378 12008294 */  lhu        $v0, 0x12($a0)
  .L800A437C:
    /* 9437C 800A437C 0800E003 */  jr         $ra
    /* 94380 800A4380 00000000 */   nop
endlabel GetCur__C4CPad_800a435c
