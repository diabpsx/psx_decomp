.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PROF_State__Fv, 0xC

glabel PROF_State__Fv
    /* 86878 80096878 E005828F */  lw         $v0, %gp_rel(ProfOn)($gp)
    /* 8687C 8009687C 0800E003 */  jr         $ra
    /* 86880 80096880 00000000 */   nop
endlabel PROF_State__Fv
