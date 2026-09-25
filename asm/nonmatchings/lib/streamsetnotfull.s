.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamsetnotfull, 0x2C

glabel streamsetnotfull
    /* 1F2BC 8002F2BC 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1F2C0 8002F2C0 00000000 */  nop
    /* 1F2C4 8002F2C4 06004010 */  beqz       $v0, .L8002F2E0
    /* 1F2C8 8002F2C8 00000000 */   nop
  .L8002F2CC:
    /* 1F2CC 8002F2CC 8C0040AC */  sw         $zero, 0x8C($v0)
    /* 1F2D0 8002F2D0 7000428C */  lw         $v0, 0x70($v0)
    /* 1F2D4 8002F2D4 00000000 */  nop
    /* 1F2D8 8002F2D8 FCFF4014 */  bnez       $v0, .L8002F2CC
    /* 1F2DC 8002F2DC 00000000 */   nop
  .L8002F2E0:
    /* 1F2E0 8002F2E0 0800E003 */  jr         $ra
    /* 1F2E4 8002F2E4 00000000 */   nop
endlabel streamsetnotfull
