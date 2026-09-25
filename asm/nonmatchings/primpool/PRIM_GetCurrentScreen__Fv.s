.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetCurrentScreen__Fv, 0xC

glabel PRIM_GetCurrentScreen__Fv
    /* 73B14 80083B14 921E8293 */  lbu        $v0, %gp_rel(D_8011C612)($gp)
    /* 73B18 80083B18 0800E003 */  jr         $ra
    /* 73B1C 80083B1C 00000000 */   nop
endlabel PRIM_GetCurrentScreen__Fv
