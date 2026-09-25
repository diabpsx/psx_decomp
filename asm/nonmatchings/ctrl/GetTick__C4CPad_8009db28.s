.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetTick__C4CPad_8009db28, 0x28

glabel GetTick__C4CPad_8009db28
    /* 8DB28 8009DB28 00008290 */  lbu        $v0, 0x0($a0)
    /* 8DB2C 8009DB2C 00000000 */  nop
    /* 8DB30 8009DB30 04004014 */  bnez       $v0, .L8009DB44
    /* 8DB34 8009DB34 00000000 */   nop
    /* 8DB38 8009DB38 0E008294 */  lhu        $v0, 0xE($a0)
    /* 8DB3C 8009DB3C D2760208 */  j          .L8009DB48
    /* 8DB40 8009DB40 00000000 */   nop
  .L8009DB44:
    /* 8DB44 8009DB44 18008294 */  lhu        $v0, 0x18($a0)
  .L8009DB48:
    /* 8DB48 8009DB48 0800E003 */  jr         $ra
    /* 8DB4C 8009DB4C 00000000 */   nop
endlabel GetTick__C4CPad_8009db28
