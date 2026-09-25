.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCur__C4CPad, 0x28

glabel GetCur__C4CPad
    /* 6B148 8007B148 00008290 */  lbu        $v0, 0x0($a0)
    /* 6B14C 8007B14C 00000000 */  nop
    /* 6B150 8007B150 04004014 */  bnez       $v0, .L8007B164
    /* 6B154 8007B154 00000000 */   nop
    /* 6B158 8007B158 08008294 */  lhu        $v0, 0x8($a0)
    /* 6B15C 8007B15C 5AEC0108 */  j          .L8007B168
    /* 6B160 8007B160 00000000 */   nop
  .L8007B164:
    /* 6B164 8007B164 12008294 */  lhu        $v0, 0x12($a0)
  .L8007B168:
    /* 6B168 8007B168 0800E003 */  jr         $ra
    /* 6B16C 8007B16C 00000000 */   nop
endlabel GetCur__C4CPad
