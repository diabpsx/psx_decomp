.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching start_game__FUi, 0xF0

glabel start_game__FUi
    /* 27FE4 80037FE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27FE8 80037FE8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 27FEC 80037FEC 01000224 */  addiu      $v0, $zero, 0x1
    /* 27FF0 80037FF0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 27FF4 80037FF4 811080A3 */  sb         $zero, %gp_rel(gbDoEnding)($gp)
    /* 27FF8 80037FF8 601082A3 */  sb         $v0, %gp_rel(svgamode)($gp)
    /* 27FFC 80037FFC CDDD000C */  jal        InitCursor__Fv
    /* 28000 80038000 21808000 */   addu      $s0, $a0, $zero
    /* 28004 80038004 9C34010C */  jal        InitLightTable__Fv
    /* 28008 80038008 00000000 */   nop
    /* 2800C 8003800C 94DF010C */  jal        music_stop__Fv
    /* 28010 80038010 00000000 */   nop
    /* 28014 80038014 90F7000C */  jal        ShowProgress__FUi
    /* 28018 80038018 21200002 */   addu      $a0, $s0, $zero
    /* 2801C 8003801C 1280023C */  lui        $v0, %hi(DoLoadedGame)
    /* 28020 80038020 84B1428C */  lw         $v0, %lo(DoLoadedGame)($v0)
    /* 28024 80038024 00000000 */  nop
    /* 28028 80038028 1D004014 */  bnez       $v0, .L800380A0
    /* 2802C 8003802C 00000000 */   nop
    /* 28030 80038030 1280023C */  lui        $v0, %hi(LoadedChar)
    /* 28034 80038034 28B3428C */  lw         $v0, %lo(LoadedChar)($v0)
    /* 28038 80038038 00000000 */  nop
    /* 2803C 8003803C 06004014 */  bnez       $v0, .L80038058
    /* 28040 80038040 21200000 */   addu      $a0, $zero, $zero
    /* 28044 80038044 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 28048 80038048 7782020C */  jal        SetQSpell__Fiii
    /* 2804C 8003804C 04000624 */   addiu     $a2, $zero, 0x4
    /* 28050 80038050 1AE00008 */  j          .L80038068
    /* 28054 80038054 00000000 */   nop
  .L80038058:
    /* 28058 80038058 8689020C */  jal        pad_func_Quick_Spell__Fi
    /* 2805C 8003805C 21200000 */   addu      $a0, $zero, $zero
    /* 28060 80038060 8689020C */  jal        pad_func_Quick_Spell__Fi
    /* 28064 80038064 21200000 */   addu      $a0, $zero, $zero
  .L80038068:
    /* 28068 80038068 1280023C */  lui        $v0, %hi(LoadedChar + 0x4)
    /* 2806C 8003806C 2CB3428C */  lw         $v0, %lo(LoadedChar + 0x4)($v0)
    /* 28070 80038070 00000000 */  nop
    /* 28074 80038074 06004014 */  bnez       $v0, .L80038090
    /* 28078 80038078 01000424 */   addiu     $a0, $zero, 0x1
    /* 2807C 8003807C FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 28080 80038080 7782020C */  jal        SetQSpell__Fiii
    /* 28084 80038084 04000624 */   addiu     $a2, $zero, 0x4
    /* 28088 80038088 28E00008 */  j          .L800380A0
    /* 2808C 8003808C 00000000 */   nop
  .L80038090:
    /* 28090 80038090 8689020C */  jal        pad_func_Quick_Spell__Fi
    /* 28094 80038094 01000424 */   addiu     $a0, $zero, 0x1
    /* 28098 80038098 8689020C */  jal        pad_func_Quick_Spell__Fi
    /* 2809C 8003809C 01000424 */   addiu     $a0, $zero, 0x1
  .L800380A0:
    /* 280A0 800380A0 1280013C */  lui        $at, %hi(LoadedChar + 0x4)
    /* 280A4 800380A4 2CB320AC */  sw         $zero, %lo(LoadedChar + 0x4)($at)
    /* 280A8 800380A8 1280013C */  lui        $at, %hi(LoadedChar)
    /* 280AC 800380AC 28B320AC */  sw         $zero, %lo(LoadedChar)($at)
    /* 280B0 800380B0 09DE000C */  jal        InitLevelCursor__Fv
    /* 280B4 800380B4 00000000 */   nop
    /* 280B8 800380B8 281080AF */  sw         $zero, %gp_rel(D_8011B7A8)($gp)
    /* 280BC 800380BC 2C1080A3 */  sb         $zero, %gp_rel(sgbMouseDown)($gp)
    /* 280C0 800380C0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 280C4 800380C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 280C8 800380C8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 280CC 800380CC 0800E003 */  jr         $ra
    /* 280D0 800380D0 00000000 */   nop
endlabel start_game__FUi
