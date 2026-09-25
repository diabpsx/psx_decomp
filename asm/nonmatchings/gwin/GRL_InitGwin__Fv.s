.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GRL_InitGwin__Fv, 0xC

glabel GRL_InitGwin__Fv
    /* 6B210 8007B210 4C2180AF */  sw         $zero, %gp_rel(D_8011C8CC)($gp)
    /* 6B214 8007B214 0800E003 */  jr         $ra
    /* 6B218 8007B218 00000000 */   nop
endlabel GRL_InitGwin__Fv
