.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_PurifyingFountain__Fi, 0x74

glabel Theme_PurifyingFountain__Fi
    /* 241EC 8015DDE4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 241F0 8015DDE8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 241F4 8015DDEC 21808000 */  addu       $s0, $a0, $zero
    /* 241F8 8015DDF0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 241FC 8015DDF4 1280053C */  lui        $a1, %hi(D_8011C16C)
    /* 24200 8015DDF8 6CC1A524 */  addiu      $a1, $a1, %lo(D_8011C16C)
    /* 24204 8015DDFC 0300A288 */  lwl        $v0, 0x3($a1)
    /* 24208 8015DE00 0000A298 */  lwr        $v0, 0x0($a1)
    /* 2420C 8015DE04 00000000 */  nop
    /* 24210 8015DE08 1300A2AB */  swl        $v0, 0x13($sp)
    /* 24214 8015DE0C 1000A2BB */  swr        $v0, 0x10($sp)
    /* 24218 8015DE10 BF6F050C */  jal        TFit_Obj5__Fi
    /* 2421C 8015DE14 21200002 */   addu      $a0, $s0, $zero
    /* 24220 8015DE18 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 24224 8015DE1C 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 24228 8015DE20 BE4E010C */  jal        AddObject__Fiii
    /* 2422C 8015DE24 4C000424 */   addiu     $a0, $zero, 0x4C
    /* 24230 8015DE28 1280023C */  lui        $v0, %hi(leveltype)
    /* 24234 8015DE2C 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 24238 8015DE30 00000000 */  nop
    /* 2423C 8015DE34 2110A203 */  addu       $v0, $sp, $v0
    /* 24240 8015DE38 0F004580 */  lb         $a1, 0xF($v0)
    /* 24244 8015DE3C 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 24248 8015DE40 21200002 */   addu      $a0, $s0, $zero
    /* 2424C 8015DE44 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 24250 8015DE48 1800B08F */  lw         $s0, 0x18($sp)
    /* 24254 8015DE4C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 24258 8015DE50 0800E003 */  jr         $ra
    /* 2425C 8015DE54 00000000 */   nop
endlabel Theme_PurifyingFountain__Fi
