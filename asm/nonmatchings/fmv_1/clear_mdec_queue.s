.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching clear_mdec_queue, 0x2C

glabel clear_mdec_queue
    /* 1E674 8015826C 580D828F */  lw         $v0, %gp_rel(mdecs_queued)($gp)
    /* 1E678 80158270 00000000 */  nop
    /* 1E67C 80158274 06004010 */  beqz       $v0, .L80158290
    /* 1E680 80158278 00000000 */   nop
    /* 1E684 8015827C 540D80AF */  sw         $zero, %gp_rel(mdec_waiting_tail)($gp)
    /* 1E688 80158280 4C0D80AF */  sw         $zero, %gp_rel(mdec_head)($gp)
    /* 1E68C 80158284 500D80AF */  sw         $zero, %gp_rel(mdec_tail)($gp)
    /* 1E690 80158288 5C0D80AF */  sw         $zero, %gp_rel(mdecs_waiting)($gp)
    /* 1E694 8015828C 580D80AF */  sw         $zero, %gp_rel(mdecs_queued)($gp)
  .L80158290:
    /* 1E698 80158290 0800E003 */  jr         $ra
    /* 1E69C 80158294 00000000 */   nop
endlabel clear_mdec_queue
