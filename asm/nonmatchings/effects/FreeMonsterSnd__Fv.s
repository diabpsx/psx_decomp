.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeMonsterSnd__Fv, 0x8

glabel FreeMonsterSnd__Fv
    /* 2D1D4 8003D1D4 0800E003 */  jr         $ra
    /* 2D1D8 8003D1D8 00000000 */   nop
endlabel FreeMonsterSnd__Fv
