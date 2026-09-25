.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SelectorActive__Fv, 0xC

glabel SelectorActive__Fv
    /* 9336C 800A336C 9D098293 */  lbu        $v0, %gp_rel(select_flag)($gp)
    /* 93370 800A3370 0800E003 */  jr         $ra
    /* 93374 800A3374 2B100200 */   sltu      $v0, $zero, $v0
endlabel SelectorActive__Fv
