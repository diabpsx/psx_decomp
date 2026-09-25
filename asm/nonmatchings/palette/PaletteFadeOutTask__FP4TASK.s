.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PaletteFadeOutTask__FP4TASK, 0xB0

glabel PaletteFadeOutTask__FP4TASK
    /* 6F248 8007F248 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6F24C 8007F24C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6F250 8007F250 1400BFAF */  sw         $ra, 0x14($sp)
    /* 6F254 8007F254 3E10020C */  jal        VID_GetTick__Fv
    /* 6F258 8007F258 80001024 */   addiu     $s0, $zero, 0x80
  .L8007F25C:
    /* 6F25C 8007F25C 0D000006 */  bltz       $s0, .L8007F294
    /* 6F260 8007F260 00000000 */   nop
    /* 6F264 8007F264 9FFB010C */  jal        SetFadeLevel__Fi
    /* 6F268 8007F268 21200002 */   addu      $a0, $s0, $zero
    /* 6F26C 8007F26C F5FB010C */  jal        SmearScreen__Fv
    /* 6F270 8007F270 00000000 */   nop
    /* 6F274 8007F274 F7FB010C */  jal        DrawFadedScreen__Fv
    /* 6F278 8007F278 00000000 */   nop
    /* 6F27C 8007F27C E814828F */  lw         $v0, %gp_rel(D_8011BC68)($gp)
    /* 6F280 8007F280 01000424 */  addiu      $a0, $zero, 0x1
    /* 6F284 8007F284 EE80000C */  jal        TSK_Sleep
    /* 6F288 8007F288 23800202 */   subu      $s0, $s0, $v0
    /* 6F28C 8007F28C 97FC0108 */  j          .L8007F25C
    /* 6F290 8007F290 00000000 */   nop
  .L8007F294:
    /* 6F294 8007F294 9FFB010C */  jal        SetFadeLevel__Fi
    /* 6F298 8007F298 21200000 */   addu      $a0, $zero, $zero
    /* 6F29C 8007F29C F7FB010C */  jal        DrawFadedScreen__Fv
    /* 6F2A0 8007F2A0 00000000 */   nop
    /* 6F2A4 8007F2A4 EE80000C */  jal        TSK_Sleep
    /* 6F2A8 8007F2A8 01000424 */   addiu     $a0, $zero, 0x1
    /* 6F2AC 8007F2AC 9FFB010C */  jal        SetFadeLevel__Fi
    /* 6F2B0 8007F2B0 21200000 */   addu      $a0, $zero, $zero
    /* 6F2B4 8007F2B4 F7FB010C */  jal        DrawFadedScreen__Fv
    /* 6F2B8 8007F2B8 00000000 */   nop
    /* 6F2BC 8007F2BC EE80000C */  jal        TSK_Sleep
    /* 6F2C0 8007F2C0 01000424 */   addiu     $a0, $zero, 0x1
    /* 6F2C4 8007F2C4 19FC010C */  jal        BlackPalette__Fv
    /* 6F2C8 8007F2C8 00000000 */   nop
    /* 6F2CC 8007F2CC E51480A3 */  sb         $zero, %gp_rel(D_8011BC65)($gp)
    /* 6F2D0 8007F2D0 EC1480AF */  sw         $zero, %gp_rel(D_8011BC6C)($gp)
    /* 6F2D4 8007F2D4 19FC010C */  jal        BlackPalette__Fv
    /* 6F2D8 8007F2D8 00000000 */   nop
    /* 6F2DC 8007F2DC 19FC010C */  jal        BlackPalette__Fv
    /* 6F2E0 8007F2E0 00000000 */   nop
    /* 6F2E4 8007F2E4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6F2E8 8007F2E8 1000B08F */  lw         $s0, 0x10($sp)
    /* 6F2EC 8007F2EC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6F2F0 8007F2F0 0800E003 */  jr         $ra
    /* 6F2F4 8007F2F4 00000000 */   nop
endlabel PaletteFadeOutTask__FP4TASK
