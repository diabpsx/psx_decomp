.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearKanjiBuffer__Fv, 0x44

glabel ClearKanjiBuffer__Fv
    /* 9D308 800AD308 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9D30C 800AD30C 4C0B858F */  lw         $a1, %gp_rel(D_8011B2CC)($gp)
    /* 9D310 800AD310 480B848F */  lw         $a0, %gp_rel(D_8011B2C8)($gp)
    /* 9D314 800AD314 21180000 */  addu       $v1, $zero, $zero
    /* 9D318 800AD318 0600A018 */  blez       $a1, .L800AD334
    /* 9D31C 800AD31C 1800BFAF */   sw        $ra, 0x18($sp)
  .L800AD320:
    /* 9D320 800AD320 000080A4 */  sh         $zero, 0x0($a0)
    /* 9D324 800AD324 01006324 */  addiu      $v1, $v1, 0x1
    /* 9D328 800AD328 2A106500 */  slt        $v0, $v1, $a1
    /* 9D32C 800AD32C FCFF4014 */  bnez       $v0, .L800AD320
    /* 9D330 800AD330 04008424 */   addiu     $a0, $a0, 0x4
  .L800AD334:
    /* 9D334 800AD334 B4B4020C */  jal        ClearKanjiCount__Fv
    /* 9D338 800AD338 00000000 */   nop
    /* 9D33C 800AD33C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9D340 800AD340 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9D344 800AD344 0800E003 */  jr         $ra
    /* 9D348 800AD348 00000000 */   nop
endlabel ClearKanjiBuffer__Fv
