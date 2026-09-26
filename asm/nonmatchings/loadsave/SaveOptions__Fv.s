.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SaveOptions__Fv, 0xA4

glabel SaveOptions__Fv
    /* 22D30 8015C928 1280043C */  lui        $a0, %hi(sglMasterVolume)
    /* 22D34 8015C92C 9CBB848C */  lw         $a0, %lo(sglMasterVolume)($a0)
    /* 22D38 8015C930 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22D3C 8015C934 1000BFAF */  sw         $ra, 0x10($sp)
    /* 22D40 8015C938 BB6E050C */  jal        ISave__Fi
    /* 22D44 8015C93C 00000000 */   nop
    /* 22D48 8015C940 1280043C */  lui        $a0, %hi(sglMusicVolume)
    /* 22D4C 8015C944 A0BB848C */  lw         $a0, %lo(sglMusicVolume)($a0)
    /* 22D50 8015C948 BB6E050C */  jal        ISave__Fi
    /* 22D54 8015C94C 00000000 */   nop
    /* 22D58 8015C950 1280043C */  lui        $a0, %hi(sglSoundVolume)
    /* 22D5C 8015C954 A4BB848C */  lw         $a0, %lo(sglSoundVolume)($a0)
    /* 22D60 8015C958 BB6E050C */  jal        ISave__Fi
    /* 22D64 8015C95C 00000000 */   nop
    /* 22D68 8015C960 1280043C */  lui        $a0, %hi(sglSpeechVolume)
    /* 22D6C 8015C964 A8BB848C */  lw         $a0, %lo(sglSpeechVolume)($a0)
    /* 22D70 8015C968 BB6E050C */  jal        ISave__Fi
    /* 22D74 8015C96C 00000000 */   nop
    /* 22D78 8015C970 5B10020C */  jal        VID_GetXOff__Fv
    /* 22D7C 8015C974 00000000 */   nop
    /* 22D80 8015C978 BB6E050C */  jal        ISave__Fi
    /* 22D84 8015C97C 21204000 */   addu      $a0, $v0, $zero
    /* 22D88 8015C980 5E10020C */  jal        VID_GetYOff__Fv
    /* 22D8C 8015C984 00000000 */   nop
    /* 22D90 8015C988 BB6E050C */  jal        ISave__Fi
    /* 22D94 8015C98C 21204000 */   addu      $a0, $v0, $zero
    /* 22D98 8015C990 7771050C */  jal        StorePads__Fv
    /* 22D9C 8015C994 00000000 */   nop
    /* 22DA0 8015C998 1280043C */  lui        $a0, %hi(MONO)
    /* 22DA4 8015C99C B0BB8480 */  lb         $a0, %lo(MONO)($a0)
    /* 22DA8 8015C9A0 B56E050C */  jal        BSave__Fc
    /* 22DAC 8015C9A4 00000000 */   nop
    /* 22DB0 8015C9A8 EFE6000C */  jal        GetSpeed__Fv
    /* 22DB4 8015C9AC 00000000 */   nop
    /* 22DB8 8015C9B0 00160200 */  sll        $v0, $v0, 24
    /* 22DBC 8015C9B4 B56E050C */  jal        BSave__Fc
    /* 22DC0 8015C9B8 03260200 */   sra       $a0, $v0, 24
    /* 22DC4 8015C9BC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 22DC8 8015C9C0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22DCC 8015C9C4 0800E003 */  jr         $ra
    /* 22DD0 8015C9C8 00000000 */   nop
endlabel SaveOptions__Fv
