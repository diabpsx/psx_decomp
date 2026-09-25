.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching game_loop__FUc, 0x60

glabel game_loop__FUc
    /* 29E58 80039E58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29E5C 80039E5C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 29E60 80039E60 9291020C */  jal        IsGameLoading__Fv
    /* 29E64 80039E64 00000000 */   nop
    /* 29E68 80039E68 04004010 */  beqz       $v0, .L80039E7C
    /* 29E6C 80039E6C 00000000 */   nop
    /* 29E70 80039E70 382080AF */  sw         $zero, %gp_rel(D_8011C7B8)($gp)
    /* 29E74 80039E74 AAE70008 */  j          .L80039EA8
    /* 29E78 80039E78 00000000 */   nop
  .L80039E7C:
    /* 29E7C 80039E7C 3820828F */  lw         $v0, %gp_rel(D_8011C7B8)($gp)
    /* 29E80 80039E80 00000000 */  nop
    /* 29E84 80039E84 04004014 */  bnez       $v0, .L80039E98
    /* 29E88 80039E88 01000224 */   addiu     $v0, $zero, 0x1
    /* 29E8C 80039E8C 382082AF */  sw         $v0, %gp_rel(D_8011C7B8)($gp)
    /* 29E90 80039E90 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 29E94 80039E94 01000424 */   addiu     $a0, $zero, 0x1
  .L80039E98:
    /* 29E98 80039E98 6CE7000C */  jal        timeout_cursor__FUc
    /* 29E9C 80039E9C 21200000 */   addu      $a0, $zero, $zero
    /* 29EA0 80039EA0 F2E6000C */  jal        game_logic__Fv
    /* 29EA4 80039EA4 00000000 */   nop
  .L80039EA8:
    /* 29EA8 80039EA8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29EAC 80039EAC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29EB0 80039EB0 0800E003 */  jr         $ra
    /* 29EB4 80039EB4 00000000 */   nop
endlabel game_loop__FUc
