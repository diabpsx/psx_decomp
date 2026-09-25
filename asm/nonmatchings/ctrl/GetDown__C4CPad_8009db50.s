.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_8009db50, 0x28

glabel GetDown__C4CPad_8009db50
    /* 8DB50 8009DB50 00008290 */  lbu        $v0, 0x0($a0)
    /* 8DB54 8009DB54 00000000 */  nop
    /* 8DB58 8009DB58 04004014 */  bnez       $v0, .L8009DB6C
    /* 8DB5C 8009DB5C 00000000 */   nop
    /* 8DB60 8009DB60 0C008294 */  lhu        $v0, 0xC($a0)
    /* 8DB64 8009DB64 DC760208 */  j          .L8009DB70
    /* 8DB68 8009DB68 00000000 */   nop
  .L8009DB6C:
    /* 8DB6C 8009DB6C 16008294 */  lhu        $v0, 0x16($a0)
  .L8009DB70:
    /* 8DB70 8009DB70 0800E003 */  jr         $ra
    /* 8DB74 8009DB74 00000000 */   nop
endlabel GetDown__C4CPad_8009db50
