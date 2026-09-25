.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PaletteFadeInTask__FP4TASK, 0x90

glabel PaletteFadeInTask__FP4TASK
    /* 6F160 8007F160 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6F164 8007F164 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6F168 8007F168 1400BFAF */  sw         $ra, 0x14($sp)
    /* 6F16C 8007F16C 3E10020C */  jal        VID_GetTick__Fv
    /* 6F170 8007F170 21800000 */   addu      $s0, $zero, $zero
    /* 6F174 8007F174 8100022A */  slti       $v0, $s0, 0x81
  .L8007F178:
    /* 6F178 8007F178 0B004010 */  beqz       $v0, .L8007F1A8
    /* 6F17C 8007F17C 00000000 */   nop
    /* 6F180 8007F180 9FFB010C */  jal        SetFadeLevel__Fi
    /* 6F184 8007F184 21200002 */   addu      $a0, $s0, $zero
    /* 6F188 8007F188 F7FB010C */  jal        DrawFadedScreen__Fv
    /* 6F18C 8007F18C 00000000 */   nop
    /* 6F190 8007F190 E814828F */  lw         $v0, %gp_rel(D_8011BC68)($gp)
    /* 6F194 8007F194 01000424 */  addiu      $a0, $zero, 0x1
    /* 6F198 8007F198 EE80000C */  jal        TSK_Sleep
    /* 6F19C 8007F19C 21800202 */   addu      $s0, $s0, $v0
    /* 6F1A0 8007F1A0 5EFC0108 */  j          .L8007F178
    /* 6F1A4 8007F1A4 8100022A */   slti      $v0, $s0, 0x81
  .L8007F1A8:
    /* 6F1A8 8007F1A8 9FFB010C */  jal        SetFadeLevel__Fi
    /* 6F1AC 8007F1AC 80000424 */   addiu     $a0, $zero, 0x80
    /* 6F1B0 8007F1B0 F7FB010C */  jal        DrawFadedScreen__Fv
    /* 6F1B4 8007F1B4 00000000 */   nop
    /* 6F1B8 8007F1B8 EE80000C */  jal        TSK_Sleep
    /* 6F1BC 8007F1BC 01000424 */   addiu     $a0, $zero, 0x1
    /* 6F1C0 8007F1C0 EC1480AF */  sw         $zero, %gp_rel(D_8011BC6C)($gp)
    /* 6F1C4 8007F1C4 9FFB010C */  jal        SetFadeLevel__Fi
    /* 6F1C8 8007F1C8 80000424 */   addiu     $a0, $zero, 0x80
    /* 6F1CC 8007F1CC F7FB010C */  jal        DrawFadedScreen__Fv
    /* 6F1D0 8007F1D0 00000000 */   nop
    /* 6F1D4 8007F1D4 EE80000C */  jal        TSK_Sleep
    /* 6F1D8 8007F1D8 01000424 */   addiu     $a0, $zero, 0x1
    /* 6F1DC 8007F1DC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6F1E0 8007F1E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6F1E4 8007F1E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6F1E8 8007F1E8 0800E003 */  jr         $ra
    /* 6F1EC 8007F1EC 00000000 */   nop
endlabel PaletteFadeInTask__FP4TASK
