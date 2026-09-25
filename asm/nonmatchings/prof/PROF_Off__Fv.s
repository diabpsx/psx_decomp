.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_Off__Fv, 0xC

glabel PROF_Off__Fv
    /* 86894 80096894 E00580AF */  sw         $zero, %gp_rel(ProfOn)($gp)
    /* 86898 80096898 0800E003 */  jr         $ra
    /* 8689C 8009689C 00000000 */   nop
endlabel PROF_Off__Fv
