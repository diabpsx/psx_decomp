.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TakeDownCutScreen__Fv, 0xA4

glabel TakeDownCutScreen__Fv
    /* 94CA8 800A4CA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94CAC 800A4CAC D009838F */  lw         $v1, %gp_rel(D_8011B150)($gp)
    /* 94CB0 800A4CB0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 94CB4 800A4CB4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 94CB8 800A4CB8 C00980AF */  sw         $zero, %gp_rel(TitleFlag)($gp)
    /* 94CBC 800A4CBC 02006214 */  bne        $v1, $v0, .L800A4CC8
    /* 94CC0 800A4CC0 01000224 */   addiu     $v0, $zero, 0x1
    /* 94CC4 800A4CC4 C00982AF */  sw         $v0, %gp_rel(TitleFlag)($gp)
  .L800A4CC8:
    /* 94CC8 800A4CC8 C409828F */  lw         $v0, %gp_rel(D_8011B144)($gp)
    /* 94CCC 800A4CCC 00000000 */  nop
    /* 94CD0 800A4CD0 1A004010 */  beqz       $v0, .L800A4D3C
    /* 94CD4 800A4CD4 00000000 */   nop
    /* 94CD8 800A4CD8 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 94CDC 800A4CDC 08000424 */   addiu     $a0, $zero, 0x8
    /* 94CE0 800A4CE0 09004010 */  beqz       $v0, .L800A4D08
    /* 94CE4 800A4CE4 00000000 */   nop
  .L800A4CE8:
    /* 94CE8 800A4CE8 ABFB010C */  jal        GetFadeState__Fv
    /* 94CEC 800A4CEC 00000000 */   nop
    /* 94CF0 800A4CF0 05004010 */  beqz       $v0, .L800A4D08
    /* 94CF4 800A4CF4 00000000 */   nop
    /* 94CF8 800A4CF8 EE80000C */  jal        TSK_Sleep
    /* 94CFC 800A4CFC 01000424 */   addiu     $a0, $zero, 0x1
    /* 94D00 800A4D00 3A930208 */  j          .L800A4CE8
    /* 94D04 800A4D04 00000000 */   nop
  .L800A4D08:
    /* 94D08 800A4D08 C409848F */  lw         $a0, %gp_rel(D_8011B144)($gp)
    /* 94D0C 800A4D0C C80980AF */  sw         $zero, %gp_rel(D_8011B148)($gp)
    /* 94D10 800A4D10 5281000C */  jal        TSK_Kill
    /* 94D14 800A4D14 00000000 */   nop
    /* 94D18 800A4D18 D009838F */  lw         $v1, %gp_rel(D_8011B150)($gp)
    /* 94D1C 800A4D1C 0A000224 */  addiu      $v0, $zero, 0xA
    /* 94D20 800A4D20 C40980AF */  sw         $zero, %gp_rel(D_8011B144)($gp)
    /* 94D24 800A4D24 05006210 */  beq        $v1, $v0, .L800A4D3C
    /* 94D28 800A4D28 00000000 */   nop
    /* 94D2C 800A4D2C 0D80043C */  lui        $a0, %hi(CutScr)
    /* 94D30 800A4D30 6CC78424 */  addiu      $a0, $a0, %lo(CutScr)
    /* 94D34 800A4D34 E952020C */  jal        Unload__7CScreen
    /* 94D38 800A4D38 00000000 */   nop
  .L800A4D3C:
    /* 94D3C 800A4D3C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 94D40 800A4D40 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94D44 800A4D44 0800E003 */  jr         $ra
    /* 94D48 800A4D48 00000000 */   nop
endlabel TakeDownCutScreen__Fv
