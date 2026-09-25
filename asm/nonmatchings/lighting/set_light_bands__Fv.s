.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_light_bands__Fv, 0x70

glabel set_light_bands__Fv
    /* 3BCD0 8004BCD0 21280000 */  addu       $a1, $zero, $zero
    /* 3BCD4 8004BCD4 1380043C */  lui        $a0, %hi(D_8012ED58)
    /* 3BCD8 8004BCD8 58ED8424 */  addiu      $a0, $a0, %lo(D_8012ED58)
    /* 3BCDC 8004BCDC 7E000324 */  addiu      $v1, $zero, 0x7E
    /* 3BCE0 8004BCE0 7F000224 */  addiu      $v0, $zero, 0x7F
    /* 3BCE4 8004BCE4 5C2082AF */  sw         $v0, %gp_rel(D_8011C7DC)($gp)
    /* 3BCE8 8004BCE8 80000224 */  addiu      $v0, $zero, 0x80
    /* 3BCEC 8004BCEC 842082AF */  sw         $v0, %gp_rel(D_8011C804)($gp)
  .L8004BCF0:
    /* 3BCF0 8004BCF0 000080A0 */  sb         $zero, 0x0($a0)
    /* 3BCF4 8004BCF4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 3BCF8 8004BCF8 FDFF6104 */  bgez       $v1, .L8004BCF0
    /* 3BCFC 8004BCFC 01008424 */   addiu     $a0, $a0, 0x1
    /* 3BD00 8004BD00 1380043C */  lui        $a0, %hi(D_8012ED58)
    /* 3BD04 8004BD04 58ED8424 */  addiu      $a0, $a0, %lo(D_8012ED58)
    /* 3BD08 8004BD08 1F000324 */  addiu      $v1, $zero, 0x1F
  .L8004BD0C:
    /* 3BD0C 8004BD0C 000085A0 */  sb         $a1, 0x0($a0)
    /* 3BD10 8004BD10 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3BD14 8004BD14 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 3BD18 8004BD18 FCFF6104 */  bgez       $v1, .L8004BD0C
    /* 3BD1C 8004BD1C 01008424 */   addiu     $a0, $a0, 0x1
    /* 3BD20 8004BD20 1F000324 */  addiu      $v1, $zero, 0x1F
  .L8004BD24:
    /* 3BD24 8004BD24 000085A0 */  sb         $a1, 0x0($a0)
    /* 3BD28 8004BD28 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 3BD2C 8004BD2C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 3BD30 8004BD30 FCFF6104 */  bgez       $v1, .L8004BD24
    /* 3BD34 8004BD34 01008424 */   addiu     $a0, $a0, 0x1
    /* 3BD38 8004BD38 0800E003 */  jr         $ra
    /* 3BD3C 8004BD3C 00000000 */   nop
endlabel set_light_bands__Fv
