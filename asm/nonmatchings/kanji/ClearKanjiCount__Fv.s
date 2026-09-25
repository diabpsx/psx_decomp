.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearKanjiCount__Fv, 0x38

glabel ClearKanjiCount__Fv
    /* 9D2D0 800AD2D0 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 9D2D4 800AD2D4 4C0B828F */  lw         $v0, %gp_rel(D_8011B2CC)($gp)
    /* 9D2D8 800AD2D8 480B848F */  lw         $a0, %gp_rel(D_8011B2C8)($gp)
    /* 9D2DC 800AD2DC 07004018 */  blez       $v0, .L800AD2FC
    /* 9D2E0 800AD2E0 21180000 */   addu      $v1, $zero, $zero
  .L800AD2E4:
    /* 9D2E4 800AD2E4 020080A0 */  sb         $zero, 0x2($a0)
    /* 9D2E8 800AD2E8 4C0B828F */  lw         $v0, %gp_rel(D_8011B2CC)($gp)
    /* 9D2EC 800AD2EC 01006324 */  addiu      $v1, $v1, 0x1
    /* 9D2F0 800AD2F0 2A106200 */  slt        $v0, $v1, $v0
    /* 9D2F4 800AD2F4 FBFF4014 */  bnez       $v0, .L800AD2E4
    /* 9D2F8 800AD2F8 04008424 */   addiu     $a0, $a0, 0x4
  .L800AD2FC:
    /* 9D2FC 800AD2FC 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 9D300 800AD300 0800E003 */  jr         $ra
    /* 9D304 800AD304 00000000 */   nop
endlabel ClearKanjiCount__Fv
