.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GRL_SetWindowProc__FPFUlUilUl_Ul, 0x10

glabel GRL_SetWindowProc__FPFUlUilUl_Ul
    /* 6B21C 8007B21C 4C21828F */  lw         $v0, %gp_rel(D_8011C8CC)($gp)
    /* 6B220 8007B220 4C2184AF */  sw         $a0, %gp_rel(D_8011C8CC)($gp)
    /* 6B224 8007B224 0800E003 */  jr         $ra
    /* 6B228 8007B228 00000000 */   nop
endlabel GRL_SetWindowProc__FPFUlUilUl_Ul
