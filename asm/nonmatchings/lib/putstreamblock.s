.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching putstreamblock, 0x28

glabel putstreamblock
    /* 1F3E0 8002F3E0 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1F3E4 8002F3E4 00000000 */  nop
    /* 1F3E8 8002F3E8 05006010 */  beqz       $v1, .L8002F400
    /* 1F3EC 8002F3EC 00000000 */   nop
    /* 1F3F0 8002F3F0 7400628C */  lw         $v0, 0x74($v1)
    /* 1F3F4 8002F3F4 00000000 */  nop
    /* 1F3F8 8002F3F8 980082AC */  sw         $v0, 0x98($a0)
    /* 1F3FC 8002F3FC 740064AC */  sw         $a0, 0x74($v1)
  .L8002F400:
    /* 1F400 8002F400 0800E003 */  jr         $ra
    /* 1F404 8002F404 00000000 */   nop
endlabel putstreamblock
