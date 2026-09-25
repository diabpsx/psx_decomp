.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DisplayMonsterTypes__Fv, 0x8

glabel DisplayMonsterTypes__Fv
    /* 9F0E8 800AF0E8 0800E003 */  jr         $ra
    /* 9F0EC 800AF0EC 00000000 */   nop
endlabel DisplayMonsterTypes__Fv
