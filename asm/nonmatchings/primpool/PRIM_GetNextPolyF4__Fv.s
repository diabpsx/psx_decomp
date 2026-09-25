.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetNextPolyF4__Fv, 0x18

glabel PRIM_GetNextPolyF4__Fv
    /* 73E24 80083E24 3803828F */  lw         $v0, %gp_rel(ThisPrimAddr)($gp)
    /* 73E28 80083E28 00000000 */  nop
    /* 73E2C 80083E2C 18004324 */  addiu      $v1, $v0, 0x18
    /* 73E30 80083E30 380383AF */  sw         $v1, %gp_rel(ThisPrimAddr)($gp)
    /* 73E34 80083E34 0800E003 */  jr         $ra
    /* 73E38 80083E38 00000000 */   nop
endlabel PRIM_GetNextPolyF4__Fv
