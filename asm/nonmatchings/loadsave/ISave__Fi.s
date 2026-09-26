.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ISave__Fi, 0x60

glabel ISave__Fi
    /* 21EF4 8015BAEC 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21EF8 8015BAF0 00000000 */  nop
    /* 21EFC 8015BAF4 01006224 */  addiu      $v0, $v1, 0x1
    /* 21F00 8015BAF8 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21F04 8015BAFC 03160400 */  sra        $v0, $a0, 24
    /* 21F08 8015BB00 000062A0 */  sb         $v0, 0x0($v1)
    /* 21F0C 8015BB04 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21F10 8015BB08 00000000 */  nop
    /* 21F14 8015BB0C 01006224 */  addiu      $v0, $v1, 0x1
    /* 21F18 8015BB10 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21F1C 8015BB14 03140400 */  sra        $v0, $a0, 16
    /* 21F20 8015BB18 000062A0 */  sb         $v0, 0x0($v1)
    /* 21F24 8015BB1C 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21F28 8015BB20 00000000 */  nop
    /* 21F2C 8015BB24 01006224 */  addiu      $v0, $v1, 0x1
    /* 21F30 8015BB28 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21F34 8015BB2C 03120400 */  sra        $v0, $a0, 8
    /* 21F38 8015BB30 000062A0 */  sb         $v0, 0x0($v1)
    /* 21F3C 8015BB34 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21F40 8015BB38 00000000 */  nop
    /* 21F44 8015BB3C 01006224 */  addiu      $v0, $v1, 0x1
    /* 21F48 8015BB40 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21F4C 8015BB44 0800E003 */  jr         $ra
    /* 21F50 8015BB48 000064A0 */   sb        $a0, 0x0($v1)
endlabel ISave__Fi
