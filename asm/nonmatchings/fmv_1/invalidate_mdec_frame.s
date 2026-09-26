.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching invalidate_mdec_frame, 0x14

glabel invalidate_mdec_frame
    /* 1D734 8015732C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1D738 80157330 0C0D82AF */  sw         $v0, %gp_rel(last_fn)($gp)
    /* 1D73C 80157334 100D82AF */  sw         $v0, %gp_rel(last_mdc)($gp)
    /* 1D740 80157338 0800E003 */  jr         $ra
    /* 1D744 8015733C 00000000 */   nop
endlabel invalidate_mdec_frame
