.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetNextPolyFt4__Fv, 0x18

glabel PRIM_GetNextPolyFt4__Fv
    /* 73E3C 80083E3C 3803828F */  lw         $v0, %gp_rel(ThisPrimAddr)($gp)
    /* 73E40 80083E40 00000000 */  nop
    /* 73E44 80083E44 28004324 */  addiu      $v1, $v0, 0x28
    /* 73E48 80083E48 380383AF */  sw         $v1, %gp_rel(ThisPrimAddr)($gp)
    /* 73E4C 80083E4C 0800E003 */  jr         $ra
    /* 73E50 80083E50 00000000 */   nop
endlabel PRIM_GetNextPolyFt4__Fv
