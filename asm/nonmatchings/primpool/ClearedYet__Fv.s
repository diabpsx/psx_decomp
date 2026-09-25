.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearedYet__Fv, 0xC

glabel ClearedYet__Fv
    /* 73DD4 80083DD4 981E828F */  lw         $v0, %gp_rel(D_8011C618)($gp)
    /* 73DD8 80083DD8 0800E003 */  jr         $ra
    /* 73DDC 80083DDC 0100422C */   sltiu     $v0, $v0, 0x1
endlabel ClearedYet__Fv
