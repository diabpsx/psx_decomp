.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeObjectGFX__Fv, 0xC

glabel FreeObjectGFX__Fv
    /* 43740 80053740 401280AF */  sw         $zero, %gp_rel(numobjfiles)($gp)
    /* 43744 80053744 0800E003 */  jr         $ra
    /* 43748 80053748 00000000 */   nop
endlabel FreeObjectGFX__Fv
