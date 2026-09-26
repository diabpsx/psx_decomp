.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BSave__Fc, 0x18

glabel BSave__Fc
    /* 21EDC 8015BAD4 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21EE0 8015BAD8 00000000 */  nop
    /* 21EE4 8015BADC 01006224 */  addiu      $v0, $v1, 0x1
    /* 21EE8 8015BAE0 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21EEC 8015BAE4 0800E003 */  jr         $ra
    /* 21EF0 8015BAE8 000064A0 */   sb        $a0, 0x0($v1)
endlabel BSave__Fc
