.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GameOnlyTestRoutine__Fv, 0x8

glabel GameOnlyTestRoutine__Fv
    /* 4 80139BFC 0800E003 */  jr         $ra
    /* 8 80139C00 00000000 */   nop
endlabel GameOnlyTestRoutine__Fv
