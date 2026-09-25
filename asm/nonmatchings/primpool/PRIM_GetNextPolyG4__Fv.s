.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetNextPolyG4__Fv, 0x18

glabel PRIM_GetNextPolyG4__Fv
    /* 73E6C 80083E6C 3803828F */  lw         $v0, %gp_rel(ThisPrimAddr)($gp)
    /* 73E70 80083E70 00000000 */  nop
    /* 73E74 80083E74 24004324 */  addiu      $v1, $v0, 0x24
    /* 73E78 80083E78 380383AF */  sw         $v1, %gp_rel(ThisPrimAddr)($gp)
    /* 73E7C 80083E7C 0800E003 */  jr         $ra
    /* 73E80 80083E80 00000000 */   nop
endlabel PRIM_GetNextPolyG4__Fv
