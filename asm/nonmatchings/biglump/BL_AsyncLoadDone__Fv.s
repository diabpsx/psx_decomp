.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_AsyncLoadDone__Fv, 0xC

glabel BL_AsyncLoadDone__Fv
    /* 77E1C 80087E1C F0038293 */  lbu        $v0, %gp_rel(FileLoaded)($gp)
    /* 77E20 80087E20 0800E003 */  jr         $ra
    /* 77E24 80087E24 2B100200 */   sltu      $v0, $zero, $v0
endlabel BL_AsyncLoadDone__Fv
