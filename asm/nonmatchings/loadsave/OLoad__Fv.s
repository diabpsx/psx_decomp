.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OLoad__Fv, 0x24

glabel OLoad__Fv
    /* 21DF0 8015B9E8 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21DF4 8015B9EC 00000000 */  nop
    /* 21DF8 8015B9F0 01006224 */  addiu      $v0, $v1, 0x1
    /* 21DFC 8015B9F4 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21E00 8015B9F8 00006290 */  lbu        $v0, 0x0($v1)
    /* 21E04 8015B9FC 00000000 */  nop
    /* 21E08 8015BA00 01004238 */  xori       $v0, $v0, 0x1
    /* 21E0C 8015BA04 0800E003 */  jr         $ra
    /* 21E10 8015BA08 0100422C */   sltiu     $v0, $v0, 0x1
endlabel OLoad__Fv
