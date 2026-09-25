.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcVolumes__Fv, 0x15C

glabel CalcVolumes__Fv
    /* 99EAC 800A9EAC 741F828F */  lw         $v0, %gp_rel(D_8011C6F4)($gp)
    /* 99EB0 800A9EB0 E6000324 */  addiu      $v1, $zero, 0xE6
    /* 99EB4 800A9EB4 1A006200 */  div        $zero, $v1, $v0
    /* 99EB8 800A9EB8 12180000 */  mflo       $v1
    /* 99EBC 800A9EBC FF1F0424 */  addiu      $a0, $zero, 0x1FFF
    /* 99EC0 800A9EC0 00000000 */  nop
    /* 99EC4 800A9EC4 1A008200 */  div        $zero, $a0, $v0
    /* 99EC8 800A9EC8 12200000 */  mflo       $a0
    /* 99ECC 800A9ECC FF3F0524 */  addiu      $a1, $zero, 0x3FFF
    /* 99ED0 800A9ED0 00000000 */  nop
    /* 99ED4 800A9ED4 1A00A200 */  div        $zero, $a1, $v0
    /* 99ED8 800A9ED8 12280000 */  mflo       $a1
    /* 99EDC 800A9EDC F80A828F */  lw         $v0, %gp_rel(MasterVol)($gp)
    /* 99EE0 800A9EE0 00000000 */  nop
    /* 99EE4 800A9EE4 18004300 */  mult       $v0, $v1
    /* 99EE8 800A9EE8 12380000 */  mflo       $a3
    /* 99EEC 800A9EEC FC0A828F */  lw         $v0, %gp_rel(MusicVol)($gp)
    /* 99EF0 800A9EF0 00000000 */  nop
    /* 99EF4 800A9EF4 18004400 */  mult       $v0, $a0
    /* 99EF8 800A9EF8 12300000 */  mflo       $a2
    /* 99EFC 800A9EFC 000B828F */  lw         $v0, %gp_rel(SoundVol)($gp)
    /* 99F00 800A9F00 00000000 */  nop
    /* 99F04 800A9F04 18004500 */  mult       $v0, $a1
    /* 99F08 800A9F08 12180000 */  mflo       $v1
    /* 99F0C 800A9F0C 080B828F */  lw         $v0, %gp_rel(SpeechVol)($gp)
    /* 99F10 800A9F10 00000000 */  nop
    /* 99F14 800A9F14 18004500 */  mult       $v0, $a1
    /* 99F18 800A9F18 1280043C */  lui        $a0, %hi(sghMusic)
    /* 99F1C 800A9F1C B4BB848C */  lw         $a0, %lo(sghMusic)($a0)
    /* 99F20 800A9F20 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 99F24 800A9F24 1000BFAF */  sw         $ra, 0x10($sp)
    /* 99F28 800A9F28 1280013C */  lui        $at, %hi(sglMasterVolume)
    /* 99F2C 800A9F2C 9CBB27AC */  sw         $a3, %lo(sglMasterVolume)($at)
    /* 99F30 800A9F30 1280013C */  lui        $at, %hi(sglMusicVolume)
    /* 99F34 800A9F34 A0BB26AC */  sw         $a2, %lo(sglMusicVolume)($at)
    /* 99F38 800A9F38 1280013C */  lui        $at, %hi(sglSoundVolume)
    /* 99F3C 800A9F3C A4BB23AC */  sw         $v1, %lo(sglSoundVolume)($at)
    /* 99F40 800A9F40 12100000 */  mflo       $v0
    /* 99F44 800A9F44 1280013C */  lui        $at, %hi(sglSpeechVolume)
    /* 99F48 800A9F48 A8BB22AC */  sw         $v0, %lo(sglSpeechVolume)($at)
    /* 99F4C 800A9F4C 06008010 */  beqz       $a0, .L800A9F68
    /* 99F50 800A9F50 1800C700 */   mult      $a2, $a3
    /* 99F54 800A9F54 12400000 */  mflo       $t0
    /* 99F58 800A9F58 03120800 */  sra        $v0, $t0, 8
    /* 99F5C 800A9F5C 180082AC */  sw         $v0, 0x18($a0)
    /* 99F60 800A9F60 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 99F64 800A9F64 140082AC */   sw        $v0, 0x14($a0)
  .L800A9F68:
    /* 99F68 800A9F68 1280043C */  lui        $a0, %hi(sghStream)
    /* 99F6C 800A9F6C 34B8848C */  lw         $a0, %lo(sghStream)($a0)
    /* 99F70 800A9F70 00000000 */  nop
    /* 99F74 800A9F74 20008010 */  beqz       $a0, .L800A9FF8
    /* 99F78 800A9F78 00000000 */   nop
    /* 99F7C 800A9F7C 1280023C */  lui        $v0, %hi(sgpStreamSFX)
    /* 99F80 800A9F80 38B8428C */  lw         $v0, %lo(sgpStreamSFX)($v0)
    /* 99F84 800A9F84 00000000 */  nop
    /* 99F88 800A9F88 01004290 */  lbu        $v0, 0x1($v0)
    /* 99F8C 800A9F8C 00000000 */  nop
    /* 99F90 800A9F90 01004230 */  andi       $v0, $v0, 0x1
    /* 99F94 800A9F94 05004010 */  beqz       $v0, .L800A9FAC
    /* 99F98 800A9F98 00000000 */   nop
    /* 99F9C 800A9F9C 1280033C */  lui        $v1, %hi(sglSoundVolume)
    /* 99FA0 800A9FA0 A4BB638C */  lw         $v1, %lo(sglSoundVolume)($v1)
    /* 99FA4 800A9FA4 EDA70208 */  j          .L800A9FB4
    /* 99FA8 800A9FA8 00000000 */   nop
  .L800A9FAC:
    /* 99FAC 800A9FAC 1280033C */  lui        $v1, %hi(sglSpeechVolume)
    /* 99FB0 800A9FB0 A8BB638C */  lw         $v1, %lo(sglSpeechVolume)($v1)
  .L800A9FB4:
    /* 99FB4 800A9FB4 1280023C */  lui        $v0, %hi(sglMasterVolume)
    /* 99FB8 800A9FB8 9CBB428C */  lw         $v0, %lo(sglMasterVolume)($v0)
    /* 99FBC 800A9FBC 00000000 */  nop
    /* 99FC0 800A9FC0 18006200 */  mult       $v1, $v0
    /* 99FC4 800A9FC4 12400000 */  mflo       $t0
    /* 99FC8 800A9FC8 03120800 */  sra        $v0, $t0, 8
    /* 99FCC 800A9FCC 180082AC */  sw         $v0, 0x18($a0)
    /* 99FD0 800A9FD0 140082AC */  sw         $v0, 0x14($a0)
    /* 99FD4 800A9FD4 1280043C */  lui        $a0, %hi(sghStream)
    /* 99FD8 800A9FD8 34B8848C */  lw         $a0, %lo(sghStream)($a0)
    /* 99FDC 800A9FDC 00000000 */  nop
    /* 99FE0 800A9FE0 03008380 */  lb         $v1, 0x3($a0)
    /* 99FE4 800A9FE4 03000224 */  addiu      $v0, $zero, 0x3
    /* 99FE8 800A9FE8 03006210 */  beq        $v1, $v0, .L800A9FF8
    /* 99FEC 800A9FEC 00000000 */   nop
    /* 99FF0 800A9FF0 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 99FF4 800A9FF4 00000000 */   nop
  .L800A9FF8:
    /* 99FF8 800A9FF8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 99FFC 800A9FFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9A000 800AA000 0800E003 */  jr         $ra
    /* 9A004 800AA004 00000000 */   nop
endlabel CalcVolumes__Fv
