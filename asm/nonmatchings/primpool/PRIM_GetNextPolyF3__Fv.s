.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetNextPolyF3__Fv, 0x18

glabel PRIM_GetNextPolyF3__Fv
    /* 73E84 80083E84 3803828F */  lw         $v0, %gp_rel(ThisPrimAddr)($gp)
    /* 73E88 80083E88 00000000 */  nop
    /* 73E8C 80083E8C 14004324 */  addiu      $v1, $v0, 0x14
    /* 73E90 80083E90 380383AF */  sw         $v1, %gp_rel(ThisPrimAddr)($gp)
    /* 73E94 80083E94 0800E003 */  jr         $ra
    /* 73E98 80083E98 00000000 */   nop
endlabel PRIM_GetNextPolyF3__Fv
