.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSpeed__Fv, 0xC

glabel GetSpeed__Fv
    /* 29BBC 80039BBC 5C10828F */  lw         $v0, %gp_rel(GameSpeed)($gp)
    /* 29BC0 80039BC0 0800E003 */  jr         $ra
    /* 29BC4 80039BC4 00000000 */   nop
endlabel GetSpeed__Fv
