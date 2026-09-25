.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PRIM_GetNextDrArea__Fv, 0x18

glabel PRIM_GetNextDrArea__Fv
    /* 73E9C 80083E9C 3803828F */  lw         $v0, %gp_rel(ThisPrimAddr)($gp)
    /* 73EA0 80083EA0 00000000 */  nop
    /* 73EA4 80083EA4 0C004324 */  addiu      $v1, $v0, 0xC
    /* 73EA8 80083EA8 380383AF */  sw         $v1, %gp_rel(ThisPrimAddr)($gp)
    /* 73EAC 80083EAC 0800E003 */  jr         $ra
    /* 73EB0 80083EB0 00000000 */   nop
endlabel PRIM_GetNextDrArea__Fv
