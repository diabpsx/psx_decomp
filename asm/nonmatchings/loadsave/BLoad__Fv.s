.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BLoad__Fv, 0x1C

glabel BLoad__Fv
    /* 21D80 8015B978 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21D84 8015B97C 00000000 */  nop
    /* 21D88 8015B980 01006224 */  addiu      $v0, $v1, 0x1
    /* 21D8C 8015B984 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21D90 8015B988 00006290 */  lbu        $v0, 0x0($v1)
    /* 21D94 8015B98C 0800E003 */  jr         $ra
    /* 21D98 8015B990 00000000 */   nop
endlabel BLoad__Fv
