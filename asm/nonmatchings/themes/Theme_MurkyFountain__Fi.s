.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_MurkyFountain__Fi, 0x74

glabel Theme_MurkyFountain__Fi
    /* 24584 8015E17C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 24588 8015E180 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2458C 8015E184 21808000 */  addu       $s0, $a0, $zero
    /* 24590 8015E188 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 24594 8015E18C 1280053C */  lui        $a1, %hi(D_8011C16C)
    /* 24598 8015E190 6CC1A524 */  addiu      $a1, $a1, %lo(D_8011C16C)
    /* 2459C 8015E194 0300A288 */  lwl        $v0, 0x3($a1)
    /* 245A0 8015E198 0000A298 */  lwr        $v0, 0x0($a1)
    /* 245A4 8015E19C 00000000 */  nop
    /* 245A8 8015E1A0 1300A2AB */  swl        $v0, 0x13($sp)
    /* 245AC 8015E1A4 1000A2BB */  swr        $v0, 0x10($sp)
    /* 245B0 8015E1A8 BF6F050C */  jal        TFit_Obj5__Fi
    /* 245B4 8015E1AC 21200002 */   addu      $a0, $s0, $zero
    /* 245B8 8015E1B0 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 245BC 8015E1B4 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 245C0 8015E1B8 BE4E010C */  jal        AddObject__Fiii
    /* 245C4 8015E1BC 51000424 */   addiu     $a0, $zero, 0x51
    /* 245C8 8015E1C0 1280023C */  lui        $v0, %hi(leveltype)
    /* 245CC 8015E1C4 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 245D0 8015E1C8 00000000 */  nop
    /* 245D4 8015E1CC 2110A203 */  addu       $v0, $sp, $v0
    /* 245D8 8015E1D0 0F004580 */  lb         $a1, 0xF($v0)
    /* 245DC 8015E1D4 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 245E0 8015E1D8 21200002 */   addu      $a0, $s0, $zero
    /* 245E4 8015E1DC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 245E8 8015E1E0 1800B08F */  lw         $s0, 0x18($sp)
    /* 245EC 8015E1E4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 245F0 8015E1E8 0800E003 */  jr         $ra
    /* 245F4 8015E1EC 00000000 */   nop
endlabel Theme_MurkyFountain__Fi
