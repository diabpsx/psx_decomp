.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DetachHdrFromList, 0x4C

glabel DetachHdrFromList
    /* 11A8C 80021A8C 0000A38C */  lw         $v1, 0x0($a1)
    /* 11A90 80021A90 00000000 */  nop
    /* 11A94 80021A94 04006010 */  beqz       $v1, .L80021AA8
    /* 11A98 80021A98 00000000 */   nop
    /* 11A9C 80021A9C 0400A28C */  lw         $v0, 0x4($a1)
    /* 11AA0 80021AA0 AD860008 */  j          .L80021AB4
    /* 11AA4 80021AA4 040062AC */   sw        $v0, 0x4($v1)
  .L80021AA8:
    /* 11AA8 80021AA8 0400A28C */  lw         $v0, 0x4($a1)
    /* 11AAC 80021AAC 00000000 */  nop
    /* 11AB0 80021AB0 000082AC */  sw         $v0, 0x0($a0)
  .L80021AB4:
    /* 11AB4 80021AB4 0400A38C */  lw         $v1, 0x4($a1)
    /* 11AB8 80021AB8 00000000 */  nop
    /* 11ABC 80021ABC 04006010 */  beqz       $v1, .L80021AD0
    /* 11AC0 80021AC0 00000000 */   nop
    /* 11AC4 80021AC4 0000A28C */  lw         $v0, 0x0($a1)
    /* 11AC8 80021AC8 00000000 */  nop
    /* 11ACC 80021ACC 000062AC */  sw         $v0, 0x0($v1)
  .L80021AD0:
    /* 11AD0 80021AD0 0800E003 */  jr         $ra
    /* 11AD4 80021AD4 00000000 */   nop
endlabel DetachHdrFromList
