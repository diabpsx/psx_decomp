.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetNextPolyGt4__Fv, 0x18

glabel PRIM_GetNextPolyGt4__Fv
    /* 73E54 80083E54 3803828F */  lw         $v0, %gp_rel(ThisPrimAddr)($gp)
    /* 73E58 80083E58 00000000 */  nop
    /* 73E5C 80083E5C 40004324 */  addiu      $v1, $v0, 0x40
    /* 73E60 80083E60 380383AF */  sw         $v1, %gp_rel(ThisPrimAddr)($gp)
    /* 73E64 80083E64 0800E003 */  jr         $ra
    /* 73E68 80083E68 00000000 */   nop
endlabel PRIM_GetNextPolyGt4__Fv
