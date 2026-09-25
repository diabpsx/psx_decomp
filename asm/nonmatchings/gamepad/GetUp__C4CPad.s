.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetUp__C4CPad, 0x28

glabel GetUp__C4CPad
    /* 6B120 8007B120 00008290 */  lbu        $v0, 0x0($a0)
    /* 6B124 8007B124 00000000 */  nop
    /* 6B128 8007B128 04004014 */  bnez       $v0, .L8007B13C
    /* 6B12C 8007B12C 00000000 */   nop
    /* 6B130 8007B130 0A008294 */  lhu        $v0, 0xA($a0)
    /* 6B134 8007B134 50EC0108 */  j          .L8007B140
    /* 6B138 8007B138 00000000 */   nop
  .L8007B13C:
    /* 6B13C 8007B13C 14008294 */  lhu        $v0, 0x14($a0)
  .L8007B140:
    /* 6B140 8007B140 0800E003 */  jr         $ra
    /* 6B144 8007B144 00000000 */   nop
endlabel GetUp__C4CPad
