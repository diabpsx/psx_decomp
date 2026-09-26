.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadOptions__Fv, 0xD8

glabel LoadOptions__Fv
    /* 22C58 8015C850 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22C5C 8015C854 1400BFAF */  sw         $ra, 0x14($sp)
    /* 22C60 8015C858 656E050C */  jal        ILoad__Fv
    /* 22C64 8015C85C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 22C68 8015C860 1280013C */  lui        $at, %hi(sglMasterVolume)
    /* 22C6C 8015C864 9CBB22AC */  sw         $v0, %lo(sglMasterVolume)($at)
    /* 22C70 8015C868 656E050C */  jal        ILoad__Fv
    /* 22C74 8015C86C 00000000 */   nop
    /* 22C78 8015C870 1280013C */  lui        $at, %hi(sglMusicVolume)
    /* 22C7C 8015C874 A0BB22AC */  sw         $v0, %lo(sglMusicVolume)($at)
    /* 22C80 8015C878 656E050C */  jal        ILoad__Fv
    /* 22C84 8015C87C 00000000 */   nop
    /* 22C88 8015C880 1280013C */  lui        $at, %hi(sglSoundVolume)
    /* 22C8C 8015C884 A4BB22AC */  sw         $v0, %lo(sglSoundVolume)($at)
    /* 22C90 8015C888 656E050C */  jal        ILoad__Fv
    /* 22C94 8015C88C 00000000 */   nop
    /* 22C98 8015C890 DA168393 */  lbu        $v1, %gp_rel(ADirtyFlagThatGaryWillLove)($gp)
    /* 22C9C 8015C894 1280013C */  lui        $at, %hi(sglSpeechVolume)
    /* 22CA0 8015C898 A8BB22AC */  sw         $v0, %lo(sglSpeechVolume)($at)
    /* 22CA4 8015C89C 0A006014 */  bnez       $v1, .L8015C8C8
    /* 22CA8 8015C8A0 00000000 */   nop
    /* 22CAC 8015C8A4 656E050C */  jal        ILoad__Fv
    /* 22CB0 8015C8A8 00000000 */   nop
    /* 22CB4 8015C8AC 656E050C */  jal        ILoad__Fv
    /* 22CB8 8015C8B0 21804000 */   addu      $s0, $v0, $zero
    /* 22CBC 8015C8B4 21200002 */  addu       $a0, $s0, $zero
    /* 22CC0 8015C8B8 5710020C */  jal        VID_SetXYOff__Fii
    /* 22CC4 8015C8BC 21284000 */   addu      $a1, $v0, $zero
    /* 22CC8 8015C8C0 38720508 */  j          .L8015C8E0
    /* 22CCC 8015C8C4 00000000 */   nop
  .L8015C8C8:
    /* 22CD0 8015C8C8 656E050C */  jal        ILoad__Fv
    /* 22CD4 8015C8CC 00000000 */   nop
    /* 22CD8 8015C8D0 DC1682AF */  sw         $v0, %gp_rel(DirtyVidx)($gp)
    /* 22CDC 8015C8D4 656E050C */  jal        ILoad__Fv
    /* 22CE0 8015C8D8 00000000 */   nop
    /* 22CE4 8015C8DC E01682AF */  sw         $v0, %gp_rel(DirtyVidY)($gp)
  .L8015C8E0:
    /* 22CE8 8015C8E0 4771050C */  jal        RestorePads__Fv
    /* 22CEC 8015C8E4 00000000 */   nop
    /* 22CF0 8015C8E8 5E6E050C */  jal        BLoad__Fv
    /* 22CF4 8015C8EC 00000000 */   nop
    /* 22CF8 8015C8F0 00160200 */  sll        $v0, $v0, 24
    /* 22CFC 8015C8F4 2B100200 */  sltu       $v0, $zero, $v0
    /* 22D00 8015C8F8 1280013C */  lui        $at, %hi(MONO)
    /* 22D04 8015C8FC B0BB22AC */  sw         $v0, %lo(MONO)($at)
    /* 22D08 8015C900 5E6E050C */  jal        BLoad__Fv
    /* 22D0C 8015C904 00000000 */   nop
    /* 22D10 8015C908 00160200 */  sll        $v0, $v0, 24
    /* 22D14 8015C90C EAE6000C */  jal        SetSpeed__F9GM_SPEEDS
    /* 22D18 8015C910 03260200 */   sra       $a0, $v0, 24
    /* 22D1C 8015C914 1400BF8F */  lw         $ra, 0x14($sp)
    /* 22D20 8015C918 1000B08F */  lw         $s0, 0x10($sp)
    /* 22D24 8015C91C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22D28 8015C920 0800E003 */  jr         $ra
    /* 22D2C 8015C924 00000000 */   nop
endlabel LoadOptions__Fv
