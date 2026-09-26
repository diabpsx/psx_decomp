.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_TearFountain__Fi, 0x74

glabel Theme_TearFountain__Fi
    /* 245F8 8015E1F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 245FC 8015E1F4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 24600 8015E1F8 21808000 */  addu       $s0, $a0, $zero
    /* 24604 8015E1FC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 24608 8015E200 1280053C */  lui        $a1, %hi(D_8011C16C)
    /* 2460C 8015E204 6CC1A524 */  addiu      $a1, $a1, %lo(D_8011C16C)
    /* 24610 8015E208 0300A288 */  lwl        $v0, 0x3($a1)
    /* 24614 8015E20C 0000A298 */  lwr        $v0, 0x0($a1)
    /* 24618 8015E210 00000000 */  nop
    /* 2461C 8015E214 1300A2AB */  swl        $v0, 0x13($sp)
    /* 24620 8015E218 1000A2BB */  swr        $v0, 0x10($sp)
    /* 24624 8015E21C BF6F050C */  jal        TFit_Obj5__Fi
    /* 24628 8015E220 21200002 */   addu      $a0, $s0, $zero
    /* 2462C 8015E224 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 24630 8015E228 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 24634 8015E22C BE4E010C */  jal        AddObject__Fiii
    /* 24638 8015E230 52000424 */   addiu     $a0, $zero, 0x52
    /* 2463C 8015E234 1280023C */  lui        $v0, %hi(leveltype)
    /* 24640 8015E238 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 24644 8015E23C 00000000 */  nop
    /* 24648 8015E240 2110A203 */  addu       $v0, $sp, $v0
    /* 2464C 8015E244 0F004580 */  lb         $a1, 0xF($v0)
    /* 24650 8015E248 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 24654 8015E24C 21200002 */   addu      $a0, $s0, $zero
    /* 24658 8015E250 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 2465C 8015E254 1800B08F */  lw         $s0, 0x18($sp)
    /* 24660 8015E258 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 24664 8015E25C 0800E003 */  jr         $ra
    /* 24668 8015E260 00000000 */   nop
endlabel Theme_TearFountain__Fi
