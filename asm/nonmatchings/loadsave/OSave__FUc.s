.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OSave__FUc, 0x44

glabel OSave__FUc
    /* 21F54 8015BB4C FF008430 */  andi       $a0, $a0, 0xFF
    /* 21F58 8015BB50 08008010 */  beqz       $a0, .L8015BB74
    /* 21F5C 8015BB54 00000000 */   nop
    /* 21F60 8015BB58 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21F64 8015BB5C 00000000 */  nop
    /* 21F68 8015BB60 01004324 */  addiu      $v1, $v0, 0x1
    /* 21F6C 8015BB64 542183AF */  sw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21F70 8015BB68 01000324 */  addiu      $v1, $zero, 0x1
    /* 21F74 8015BB6C E26E0508 */  j          .L8015BB88
    /* 21F78 8015BB70 000043A0 */   sb        $v1, 0x0($v0)
  .L8015BB74:
    /* 21F7C 8015BB74 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21F80 8015BB78 00000000 */  nop
    /* 21F84 8015BB7C 01006224 */  addiu      $v0, $v1, 0x1
    /* 21F88 8015BB80 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21F8C 8015BB84 000060A0 */  sb         $zero, 0x0($v1)
  .L8015BB88:
    /* 21F90 8015BB88 0800E003 */  jr         $ra
    /* 21F94 8015BB8C 00000000 */   nop
endlabel OSave__FUc
