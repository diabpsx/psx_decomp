.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_Cauldron__Fi, 0x74

glabel Theme_Cauldron__Fi
    /* 24510 8015E108 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 24514 8015E10C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 24518 8015E110 21808000 */  addu       $s0, $a0, $zero
    /* 2451C 8015E114 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 24520 8015E118 1280053C */  lui        $a1, %hi(D_8011C16C)
    /* 24524 8015E11C 6CC1A524 */  addiu      $a1, $a1, %lo(D_8011C16C)
    /* 24528 8015E120 0300A288 */  lwl        $v0, 0x3($a1)
    /* 2452C 8015E124 0000A298 */  lwr        $v0, 0x0($a1)
    /* 24530 8015E128 00000000 */  nop
    /* 24534 8015E12C 1300A2AB */  swl        $v0, 0x13($sp)
    /* 24538 8015E130 1000A2BB */  swr        $v0, 0x10($sp)
    /* 2453C 8015E134 BF6F050C */  jal        TFit_Obj5__Fi
    /* 24540 8015E138 21200002 */   addu      $a0, $s0, $zero
    /* 24544 8015E13C 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 24548 8015E140 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 2454C 8015E144 BE4E010C */  jal        AddObject__Fiii
    /* 24550 8015E148 50000424 */   addiu     $a0, $zero, 0x50
    /* 24554 8015E14C 1280023C */  lui        $v0, %hi(leveltype)
    /* 24558 8015E150 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2455C 8015E154 00000000 */  nop
    /* 24560 8015E158 2110A203 */  addu       $v0, $sp, $v0
    /* 24564 8015E15C 0F004580 */  lb         $a1, 0xF($v0)
    /* 24568 8015E160 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 2456C 8015E164 21200002 */   addu      $a0, $s0, $zero
    /* 24570 8015E168 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 24574 8015E16C 1800B08F */  lw         $s0, 0x18($sp)
    /* 24578 8015E170 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2457C 8015E174 0800E003 */  jr         $ra
    /* 24580 8015E178 00000000 */   nop
endlabel Theme_Cauldron__Fi
