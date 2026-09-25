.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FadeGameOut__Fv, 0xA4

glabel FadeGameOut__Fv
    /* 668F0 800768F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 668F4 800768F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 668F8 800768F8 FD22020C */  jal        PA_SetPauseOk__Fb
    /* 668FC 800768FC 21200000 */   addu      $a0, $zero, $zero
    /* 66900 80076900 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 66904 80076904 21200000 */   addu      $a0, $zero, $zero
    /* 66908 80076908 01000224 */  addiu      $v0, $zero, 0x1
    /* 6690C 8007690C 1280013C */  lui        $at, %hi(PauseMode)
    /* 66910 80076910 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 66914 80076914 A4DF010C */  jal        music_fade__Fv
    /* 66918 80076918 00000000 */   nop
    /* 6691C 8007691C D7F3000C */  jal        stream_stop__Fv
    /* 66920 80076920 00000000 */   nop
    /* 66924 80076924 BEFC010C */  jal        PaletteFadeOut__Fi
    /* 66928 80076928 08000424 */   addiu     $a0, $zero, 0x8
    /* 6692C 8007692C 09004010 */  beqz       $v0, .L80076954
    /* 66930 80076930 00000000 */   nop
  .L80076934:
    /* 66934 80076934 ABFB010C */  jal        GetFadeState__Fv
    /* 66938 80076938 00000000 */   nop
    /* 6693C 8007693C 05004010 */  beqz       $v0, .L80076954
    /* 66940 80076940 00000000 */   nop
    /* 66944 80076944 EE80000C */  jal        TSK_Sleep
    /* 66948 80076948 01000424 */   addiu     $a0, $zero, 0x1
    /* 6694C 8007694C 4DDA0108 */  j          .L80076934
    /* 66950 80076950 00000000 */   nop
  .L80076954:
    /* 66954 80076954 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 66958 80076958 01000424 */   addiu     $a0, $zero, 0x1
    /* 6695C 8007695C E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 66960 80076960 21200000 */   addu      $a0, $zero, $zero
    /* 66964 80076964 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 66968 80076968 21200000 */   addu      $a0, $zero, $zero
    /* 6696C 8007696C 19FC010C */  jal        BlackPalette__Fv
    /* 66970 80076970 00000000 */   nop
    /* 66974 80076974 94DF010C */  jal        music_stop__Fv
    /* 66978 80076978 00000000 */   nop
    /* 6697C 8007697C 1280013C */  lui        $at, %hi(PauseMode)
    /* 66980 80076980 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 66984 80076984 1000BF8F */  lw         $ra, 0x10($sp)
    /* 66988 80076988 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6698C 8007698C 0800E003 */  jr         $ra
    /* 66990 80076990 00000000 */   nop
endlabel FadeGameOut__Fv
