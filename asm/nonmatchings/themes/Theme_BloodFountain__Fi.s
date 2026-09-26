.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_BloodFountain__Fi, 0x74

glabel Theme_BloodFountain__Fi
    /* 24020 8015DC18 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 24024 8015DC1C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 24028 8015DC20 21808000 */  addu       $s0, $a0, $zero
    /* 2402C 8015DC24 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 24030 8015DC28 1280053C */  lui        $a1, %hi(D_8011C180)
    /* 24034 8015DC2C 80C1A524 */  addiu      $a1, $a1, %lo(D_8011C180)
    /* 24038 8015DC30 0300A288 */  lwl        $v0, 0x3($a1)
    /* 2403C 8015DC34 0000A298 */  lwr        $v0, 0x0($a1)
    /* 24040 8015DC38 00000000 */  nop
    /* 24044 8015DC3C 1300A2AB */  swl        $v0, 0x13($sp)
    /* 24048 8015DC40 1000A2BB */  swr        $v0, 0x10($sp)
    /* 2404C 8015DC44 BF6F050C */  jal        TFit_Obj5__Fi
    /* 24050 8015DC48 21200002 */   addu      $a0, $s0, $zero
    /* 24054 8015DC4C 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 24058 8015DC50 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 2405C 8015DC54 BE4E010C */  jal        AddObject__Fiii
    /* 24060 8015DC58 42000424 */   addiu     $a0, $zero, 0x42
    /* 24064 8015DC5C 1280023C */  lui        $v0, %hi(leveltype)
    /* 24068 8015DC60 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 2406C 8015DC64 00000000 */  nop
    /* 24070 8015DC68 2110A203 */  addu       $v0, $sp, $v0
    /* 24074 8015DC6C 0F004580 */  lb         $a1, 0xF($v0)
    /* 24078 8015DC70 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 2407C 8015DC74 21200002 */   addu      $a0, $s0, $zero
    /* 24080 8015DC78 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 24084 8015DC7C 1800B08F */  lw         $s0, 0x18($sp)
    /* 24088 8015DC80 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2408C 8015DC84 0800E003 */  jr         $ra
    /* 24090 8015DC88 00000000 */   nop
endlabel Theme_BloodFountain__Fi
