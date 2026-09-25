.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawLevelUpIcon__Fi, 0x94

glabel DrawLevelUpIcon__Fi
    /* 25C58 80035C58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 25C5C 80035C5C 1280023C */  lui        $v0, %hi(optionsflag)
    /* 25C60 80035C60 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 25C64 80035C64 21288000 */  addu       $a1, $a0, $zero
    /* 25C68 80035C68 1C004014 */  bnez       $v0, .L80035CDC
    /* 25C6C 80035C6C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 25C70 80035C70 1280023C */  lui        $v0, %hi(DoShowPanel)
    /* 25C74 80035C74 00B0428C */  lw         $v0, %lo(DoShowPanel)($v0)
    /* 25C78 80035C78 00000000 */  nop
    /* 25C7C 80035C7C 17004010 */  beqz       $v0, .L80035CDC
    /* 25C80 80035C80 00000000 */   nop
    /* 25C84 80035C84 1280023C */  lui        $v0, %hi(stextflag)
    /* 25C88 80035C88 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 25C8C 80035C8C 00000000 */  nop
    /* 25C90 80035C90 12004014 */  bnez       $v0, .L80035CDC
    /* 25C94 80035C94 00000000 */   nop
    /* 25C98 80035C98 1280023C */  lui        $v0, %hi(qtextflag)
    /* 25C9C 80035C9C 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 25CA0 80035CA0 00000000 */  nop
    /* 25CA4 80035CA4 0D004014 */  bnez       $v0, .L80035CDC
    /* 25CA8 80035CA8 04000224 */   addiu     $v0, $zero, 0x4
    /* 25CAC 80035CAC DC0E82AF */  sw         $v0, %gp_rel(D_8011B65C)($gp)
    /* 25CB0 80035CB0 A4CF000C */  jal        DrawPlus__Fii
    /* 25CB4 80035CB4 04000424 */   addiu     $a0, $zero, 0x4
    /* 25CB8 80035CB8 E40E8293 */  lbu        $v0, %gp_rel(D_8011B664)($gp)
    /* 25CBC 80035CBC 18000324 */  addiu      $v1, $zero, 0x18
    /* 25CC0 80035CC0 01004224 */  addiu      $v0, $v0, 0x1
    /* 25CC4 80035CC4 E40E82A3 */  sb         $v0, %gp_rel(D_8011B664)($gp)
    /* 25CC8 80035CC8 00160200 */  sll        $v0, $v0, 24
    /* 25CCC 80035CCC 03160200 */  sra        $v0, $v0, 24
    /* 25CD0 80035CD0 02004314 */  bne        $v0, $v1, .L80035CDC
    /* 25CD4 80035CD4 00000000 */   nop
    /* 25CD8 80035CD8 E40E80A3 */  sb         $zero, %gp_rel(D_8011B664)($gp)
  .L80035CDC:
    /* 25CDC 80035CDC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 25CE0 80035CE0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 25CE4 80035CE4 0800E003 */  jr         $ra
    /* 25CE8 80035CE8 00000000 */   nop
endlabel DrawLevelUpIcon__Fi
