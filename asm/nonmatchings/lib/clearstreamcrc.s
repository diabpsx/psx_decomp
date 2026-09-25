.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching clearstreamcrc, 0x1C

glabel clearstreamcrc
    /* 1F378 8002F378 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1F37C 8002F37C 00000000 */  nop
    /* 1F380 8002F380 02004010 */  beqz       $v0, .L8002F38C
    /* 1F384 8002F384 00000000 */   nop
    /* 1F388 8002F388 300040AC */  sw         $zero, 0x30($v0)
  .L8002F38C:
    /* 1F38C 8002F38C 0800E003 */  jr         $ra
    /* 1F390 8002F390 00000000 */   nop
endlabel clearstreamcrc
