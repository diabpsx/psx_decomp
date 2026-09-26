.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FadeFEOut__Fv, 0xC4

glabel FadeFEOut__Fv
    /* 261C 8013C214 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2620 8013C218 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 2624 8013C21C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2628 8013C220 1400B1AF */  sw         $s1, 0x14($sp)
    /* 262C 8013C224 A4DF010C */  jal        music_fade__Fv
    /* 2630 8013C228 1000B0AF */   sw        $s0, 0x10($sp)
    /* 2634 8013C22C BEFC010C */  jal        PaletteFadeOut__Fi
    /* 2638 8013C230 08000424 */   addiu     $a0, $zero, 0x8
    /* 263C 8013C234 1F004010 */  beqz       $v0, .L8013C2B4
    /* 2640 8013C238 00000000 */   nop
    /* 2644 8013C23C 0D80123C */  lui        $s2, %hi(FeDifficultyMenu)
    /* 2648 8013C240 44D75226 */  addiu      $s2, $s2, %lo(FeDifficultyMenu)
    /* 264C 8013C244 0D80113C */  lui        $s1, %hi(FeNewP1ClassMenu)
    /* 2650 8013C248 D4D63126 */  addiu      $s1, $s1, %lo(FeNewP1ClassMenu)
    /* 2654 8013C24C 0D80103C */  lui        $s0, %hi(FeNewP2ClassMenu)
    /* 2658 8013C250 0CD71026 */  addiu      $s0, $s0, %lo(FeNewP2ClassMenu)
  .L8013C254:
    /* 265C 8013C254 ABFB010C */  jal        GetFadeState__Fv
    /* 2660 8013C258 00000000 */   nop
    /* 2664 8013C25C 15004010 */  beqz       $v0, .L8013C2B4
    /* 2668 8013C260 00000000 */   nop
    /* 266C 8013C264 BC0B828F */  lw         $v0, %gp_rel(D_8011B33C)($gp)
    /* 2670 8013C268 00000000 */  nop
    /* 2674 8013C26C 0D004010 */  beqz       $v0, .L8013C2A4
    /* 2678 8013C270 00000000 */   nop
    /* 267C 8013C274 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* 2680 8013C278 00000000 */  nop
    /* 2684 8013C27C 05005210 */  beq        $v0, $s2, .L8013C294
    /* 2688 8013C280 00000000 */   nop
    /* 268C 8013C284 03005110 */  beq        $v0, $s1, .L8013C294
    /* 2690 8013C288 00000000 */   nop
    /* 2694 8013C28C 03005014 */  bne        $v0, $s0, .L8013C29C
    /* 2698 8013C290 00000000 */   nop
  .L8013C294:
    /* 269C 8013C294 EDEB040C */  jal        FeDrawChrClass__Fv
    /* 26A0 8013C298 00000000 */   nop
  .L8013C29C:
    /* 26A4 8013C29C 9EE7040C */  jal        FeDrawBuffer__Fv
    /* 26A8 8013C2A0 00000000 */   nop
  .L8013C2A4:
    /* 26AC 8013C2A4 EE80000C */  jal        TSK_Sleep
    /* 26B0 8013C2A8 01000424 */   addiu     $a0, $zero, 0x1
    /* 26B4 8013C2AC 95F00408 */  j          .L8013C254
    /* 26B8 8013C2B0 00000000 */   nop
  .L8013C2B4:
    /* 26BC 8013C2B4 94DF010C */  jal        music_stop__Fv
    /* 26C0 8013C2B8 00000000 */   nop
    /* 26C4 8013C2BC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 26C8 8013C2C0 1800B28F */  lw         $s2, 0x18($sp)
    /* 26CC 8013C2C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 26D0 8013C2C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 26D4 8013C2CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 26D8 8013C2D0 0800E003 */  jr         $ra
    /* 26DC 8013C2D4 00000000 */   nop
endlabel FadeFEOut__Fv
