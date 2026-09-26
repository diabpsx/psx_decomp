.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching clear_mdec_frame, 0xC

glabel clear_mdec_frame
    /* 1D3B0 80156FA8 340D80AF */  sw         $zero, %gp_rel(frame_decoded)($gp)
    /* 1D3B4 80156FAC 0800E003 */  jr         $ra
    /* 1D3B8 80156FB0 00000000 */   nop
endlabel clear_mdec_frame
