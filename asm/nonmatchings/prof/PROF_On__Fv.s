.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_On__Fv, 0x10

glabel PROF_On__Fv
    /* 86884 80096884 01000224 */  addiu      $v0, $zero, 0x1
    /* 86888 80096888 E00582AF */  sw         $v0, %gp_rel(ProfOn)($gp)
    /* 8688C 8009688C 0800E003 */  jr         $ra
    /* 86890 80096890 00000000 */   nop
endlabel PROF_On__Fv
