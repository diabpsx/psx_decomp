.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetUp__C4CPad_8009db78, 0x28

glabel GetUp__C4CPad_8009db78
    /* 8DB78 8009DB78 00008290 */  lbu        $v0, 0x0($a0)
    /* 8DB7C 8009DB7C 00000000 */  nop
    /* 8DB80 8009DB80 04004014 */  bnez       $v0, .L8009DB94
    /* 8DB84 8009DB84 00000000 */   nop
    /* 8DB88 8009DB88 0A008294 */  lhu        $v0, 0xA($a0)
    /* 8DB8C 8009DB8C E6760208 */  j          .L8009DB98
    /* 8DB90 8009DB90 00000000 */   nop
  .L8009DB94:
    /* 8DB94 8009DB94 14008294 */  lhu        $v0, 0x14($a0)
  .L8009DB98:
    /* 8DB98 8009DB98 0800E003 */  jr         $ra
    /* 8DB9C 8009DB9C 00000000 */   nop
endlabel GetUp__C4CPad_8009db78
