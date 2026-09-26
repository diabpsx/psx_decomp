.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ILoad__Fv, 0x54

glabel ILoad__Fv
    /* 21D9C 8015B994 5421848F */  lw         $a0, %gp_rel(D_8011C8D4)($gp)
    /* 21DA0 8015B998 00000000 */  nop
    /* 21DA4 8015B99C 01008224 */  addiu      $v0, $a0, 0x1
    /* 21DA8 8015B9A0 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 21DAC 8015B9A4 00008290 */  lbu        $v0, 0x0($a0)
    /* 21DB0 8015B9A8 02008324 */  addiu      $v1, $a0, 0x2
    /* 21DB4 8015B9AC 542183AF */  sw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21DB8 8015B9B0 01008590 */  lbu        $a1, 0x1($a0)
    /* 21DBC 8015B9B4 03008324 */  addiu      $v1, $a0, 0x3
    /* 21DC0 8015B9B8 542183AF */  sw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21DC4 8015B9BC 02008690 */  lbu        $a2, 0x2($a0)
    /* 21DC8 8015B9C0 04008324 */  addiu      $v1, $a0, 0x4
    /* 21DCC 8015B9C4 542183AF */  sw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 21DD0 8015B9C8 03008390 */  lbu        $v1, 0x3($a0)
    /* 21DD4 8015B9CC 00160200 */  sll        $v0, $v0, 24
    /* 21DD8 8015B9D0 002C0500 */  sll        $a1, $a1, 16
    /* 21DDC 8015B9D4 25104500 */  or         $v0, $v0, $a1
    /* 21DE0 8015B9D8 00320600 */  sll        $a2, $a2, 8
    /* 21DE4 8015B9DC 25104600 */  or         $v0, $v0, $a2
    /* 21DE8 8015B9E0 0800E003 */  jr         $ra
    /* 21DEC 8015B9E4 25104300 */   or        $v0, $v0, $v1
endlabel ILoad__Fv
