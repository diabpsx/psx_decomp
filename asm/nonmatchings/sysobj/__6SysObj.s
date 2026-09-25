.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6SysObj, 0x18

glabel __6SysObj
    /* 76618 80086618 21108000 */  addu       $v0, $a0, $zero
    /* 7661C 8008661C BC03848F */  lw         $a0, %gp_rel(_6SysObj_NewHnd)($gp)
    /* 76620 80086620 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 76624 80086624 BC0383AF */  sw         $v1, %gp_rel(_6SysObj_NewHnd)($gp)
    /* 76628 80086628 0800E003 */  jr         $ra
    /* 7662C 8008662C 000044AC */   sw        $a0, 0x0($v0)
endlabel __6SysObj
