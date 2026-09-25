.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TitleScreen__FP7CScreen, 0x54

glabel TitleScreen__FP7CScreen
    /* 8E3A0 8009E3A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8E3A4 8009E3A4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8E3A8 8009E3A8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8E3AC 8009E3AC 7C78020C */  jal        DrawFlameLogo__Fv
    /* 8E3B0 8009E3B0 21808000 */   addu      $s0, $a0, $zero
    /* 8E3B4 8009E3B4 21200002 */  addu       $a0, $s0, $zero
    /* 8E3B8 8009E3B8 12000524 */  addiu      $a1, $zero, 0x12
    /* 8E3BC 8009E3BC 0B000624 */  addiu      $a2, $zero, 0xB
    /* 8E3C0 8009E3C0 2452020C */  jal        Load__7CScreeniii
    /* 8E3C4 8009E3C4 21380000 */   addu      $a3, $zero, $zero
    /* 8E3C8 8009E3C8 21200002 */  addu       $a0, $s0, $zero
    /* 8E3CC 8009E3CC 12000524 */  addiu      $a1, $zero, 0x12
    /* 8E3D0 8009E3D0 0B000624 */  addiu      $a2, $zero, 0xB
    /* 8E3D4 8009E3D4 21380000 */  addu       $a3, $zero, $zero
    /* 8E3D8 8009E3D8 F252020C */  jal        Display__7CScreeniiii
    /* 8E3DC 8009E3DC 1000A0AF */   sw        $zero, 0x10($sp)
    /* 8E3E0 8009E3E0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8E3E4 8009E3E4 1800B08F */  lw         $s0, 0x18($sp)
    /* 8E3E8 8009E3E8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8E3EC 8009E3EC 0800E003 */  jr         $ra
    /* 8E3F0 8009E3F0 00000000 */   nop
endlabel TitleScreen__FP7CScreen
