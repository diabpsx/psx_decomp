.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AutomapRight__Fv, 0x20

glabel AutomapRight__Fv
    /* 283D0 80161FC8 041C838F */  lw         $v1, %gp_rel(AutoMapXOfs)($gp)
    /* 283D4 80161FCC 00000000 */  nop
    /* 283D8 80161FD0 50006228 */  slti       $v0, $v1, 0x50
    /* 283DC 80161FD4 02004010 */  beqz       $v0, .L80161FE0
    /* 283E0 80161FD8 02006224 */   addiu     $v0, $v1, 0x2
    /* 283E4 80161FDC 041C82AF */  sw         $v0, %gp_rel(AutoMapXOfs)($gp)
  .L80161FE0:
    /* 283E8 80161FE0 0800E003 */  jr         $ra
    /* 283EC 80161FE4 00000000 */   nop
endlabel AutomapRight__Fv
