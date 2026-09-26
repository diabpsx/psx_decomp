.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDown__C4CPad_80155fb0, 0x28

glabel GetDown__C4CPad_80155fb0
    /* 1C3B8 80155FB0 00008290 */  lbu        $v0, 0x0($a0)
    /* 1C3BC 80155FB4 00000000 */  nop
    /* 1C3C0 80155FB8 04004014 */  bnez       $v0, .L80155FCC
    /* 1C3C4 80155FBC 00000000 */   nop
    /* 1C3C8 80155FC0 0C008294 */  lhu        $v0, 0xC($a0)
    /* 1C3CC 80155FC4 F4570508 */  j          .L80155FD0
    /* 1C3D0 80155FC8 00000000 */   nop
  .L80155FCC:
    /* 1C3D4 80155FCC 16008294 */  lhu        $v0, 0x16($a0)
  .L80155FD0:
    /* 1C3D8 80155FD0 0800E003 */  jr         $ra
    /* 1C3DC 80155FD4 00000000 */   nop
endlabel GetDown__C4CPad_80155fb0
