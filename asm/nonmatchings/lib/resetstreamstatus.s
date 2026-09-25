.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resetstreamstatus, 0x1C

glabel resetstreamstatus
    /* 1D8C4 8002D8C4 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1D8C8 8002D8C8 00000000 */  nop
    /* 1D8CC 8002D8CC 02004010 */  beqz       $v0, .L8002D8D8
    /* 1D8D0 8002D8D0 00000000 */   nop
    /* 1D8D4 8002D8D4 280040AC */  sw         $zero, 0x28($v0)
  .L8002D8D8:
    /* 1D8D8 8002D8D8 0800E003 */  jr         $ra
    /* 1D8DC 8002D8DC 00000000 */   nop
endlabel resetstreamstatus
