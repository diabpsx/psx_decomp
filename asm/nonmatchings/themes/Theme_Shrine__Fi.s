.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_Shrine__Fi, 0xE8

glabel Theme_Shrine__Fi
    /* 23498 8015D090 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2349C 8015D094 1800B0AF */  sw         $s0, 0x18($sp)
    /* 234A0 8015D098 21808000 */  addu       $s0, $a0, $zero
    /* 234A4 8015D09C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 234A8 8015D0A0 1280053C */  lui        $a1, %hi(D_8011C168)
    /* 234AC 8015D0A4 68C1A524 */  addiu      $a1, $a1, %lo(D_8011C168)
    /* 234B0 8015D0A8 0300A288 */  lwl        $v0, 0x3($a1)
    /* 234B4 8015D0AC 0000A298 */  lwr        $v0, 0x0($a1)
    /* 234B8 8015D0B0 00000000 */  nop
    /* 234BC 8015D0B4 1300A2AB */  swl        $v0, 0x13($sp)
    /* 234C0 8015D0B8 1000A2BB */  swr        $v0, 0x10($sp)
    /* 234C4 8015D0BC 036F050C */  jal        TFit_Shrine__Fi
    /* 234C8 8015D0C0 21200002 */   addu      $a0, $s0, $zero
    /* 234CC 8015D0C4 201A838F */  lw         $v1, %gp_rel(themeVar1)($gp)
    /* 234D0 8015D0C8 01000224 */  addiu      $v0, $zero, 0x1
    /* 234D4 8015D0CC 0F006214 */  bne        $v1, $v0, .L8015D10C
    /* 234D8 8015D0D0 00000000 */   nop
    /* 234DC 8015D0D4 09000424 */  addiu      $a0, $zero, 0x9
    /* 234E0 8015D0D8 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 234E4 8015D0DC 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 234E8 8015D0E0 BE4E010C */  jal        AddObject__Fiii
    /* 234EC 8015D0E4 FFFFA524 */   addiu     $a1, $a1, -0x1
    /* 234F0 8015D0E8 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 234F4 8015D0EC 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 234F8 8015D0F0 BE4E010C */  jal        AddObject__Fiii
    /* 234FC 8015D0F4 3C000424 */   addiu     $a0, $zero, 0x3C
    /* 23500 8015D0F8 09000424 */  addiu      $a0, $zero, 0x9
    /* 23504 8015D0FC 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23508 8015D100 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 2350C 8015D104 50740508 */  j          .L8015D140
    /* 23510 8015D108 0100A524 */   addiu     $a1, $a1, 0x1
  .L8015D10C:
    /* 23514 8015D10C 09000424 */  addiu      $a0, $zero, 0x9
    /* 23518 8015D110 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 2351C 8015D114 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23520 8015D118 BE4E010C */  jal        AddObject__Fiii
    /* 23524 8015D11C FFFFC624 */   addiu     $a2, $a2, -0x1
    /* 23528 8015D120 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 2352C 8015D124 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23530 8015D128 BE4E010C */  jal        AddObject__Fiii
    /* 23534 8015D12C 3B000424 */   addiu     $a0, $zero, 0x3B
    /* 23538 8015D130 09000424 */  addiu      $a0, $zero, 0x9
    /* 2353C 8015D134 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23540 8015D138 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23544 8015D13C 0100C624 */  addiu      $a2, $a2, 0x1
  .L8015D140:
    /* 23548 8015D140 BE4E010C */  jal        AddObject__Fiii
    /* 2354C 8015D144 00000000 */   nop
    /* 23550 8015D148 1280023C */  lui        $v0, %hi(leveltype)
    /* 23554 8015D14C 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23558 8015D150 00000000 */  nop
    /* 2355C 8015D154 2110A203 */  addu       $v0, $sp, $v0
    /* 23560 8015D158 0F004580 */  lb         $a1, 0xF($v0)
    /* 23564 8015D15C 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 23568 8015D160 21200002 */   addu      $a0, $s0, $zero
    /* 2356C 8015D164 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 23570 8015D168 1800B08F */  lw         $s0, 0x18($sp)
    /* 23574 8015D16C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 23578 8015D170 0800E003 */  jr         $ra
    /* 2357C 8015D174 00000000 */   nop
endlabel Theme_Shrine__Fi
