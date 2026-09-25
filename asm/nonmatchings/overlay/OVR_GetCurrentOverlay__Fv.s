.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_GetCurrentOverlay__Fv, 0xC

glabel OVR_GetCurrentOverlay__Fv
    /* 85668 80095668 B405828F */  lw         $v0, %gp_rel(CurrentOverlay)($gp)
    /* 8566C 8009566C 0800E003 */  jr         $ra
    /* 85670 80095670 00000000 */   nop
endlabel OVR_GetCurrentOverlay__Fv
