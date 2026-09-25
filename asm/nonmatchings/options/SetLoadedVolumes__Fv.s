.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLoadedVolumes__Fv, 0xB0

glabel SetLoadedVolumes__Fv
    /* 9A008 800AA008 741F838F */  lw         $v1, %gp_rel(D_8011C6F4)($gp)
    /* 9A00C 800AA00C E6000224 */  addiu      $v0, $zero, 0xE6
    /* 9A010 800AA010 1A004300 */  div        $zero, $v0, $v1
    /* 9A014 800AA014 12100000 */  mflo       $v0
    /* 9A018 800AA018 1280063C */  lui        $a2, %hi(sglMasterVolume)
    /* 9A01C 800AA01C 9CBBC68C */  lw         $a2, %lo(sglMasterVolume)($a2)
    /* 9A020 800AA020 00000000 */  nop
    /* 9A024 800AA024 1A00C200 */  div        $zero, $a2, $v0
    /* 9A028 800AA028 12300000 */  mflo       $a2
    /* 9A02C 800AA02C FF3F0224 */  addiu      $v0, $zero, 0x3FFF
    /* 9A030 800AA030 00000000 */  nop
    /* 9A034 800AA034 1A004300 */  div        $zero, $v0, $v1
    /* 9A038 800AA038 12100000 */  mflo       $v0
    /* 9A03C 800AA03C 1280033C */  lui        $v1, %hi(sglMusicVolume)
    /* 9A040 800AA040 A0BB638C */  lw         $v1, %lo(sglMusicVolume)($v1)
    /* 9A044 800AA044 00000000 */  nop
    /* 9A048 800AA048 40180300 */  sll        $v1, $v1, 1
    /* 9A04C 800AA04C 1A006200 */  div        $zero, $v1, $v0
    /* 9A050 800AA050 12180000 */  mflo       $v1
    /* 9A054 800AA054 1280043C */  lui        $a0, %hi(sglSoundVolume)
    /* 9A058 800AA058 A4BB848C */  lw         $a0, %lo(sglSoundVolume)($a0)
    /* 9A05C 800AA05C 00000000 */  nop
    /* 9A060 800AA060 1A008200 */  div        $zero, $a0, $v0
    /* 9A064 800AA064 12200000 */  mflo       $a0
    /* 9A068 800AA068 1280053C */  lui        $a1, %hi(sglSpeechVolume)
    /* 9A06C 800AA06C A8BBA58C */  lw         $a1, %lo(sglSpeechVolume)($a1)
    /* 9A070 800AA070 00000000 */  nop
    /* 9A074 800AA074 1A00A200 */  div        $zero, $a1, $v0
    /* 9A078 800AA078 12280000 */  mflo       $a1
    /* 9A07C 800AA07C F80A86AF */  sw         $a2, %gp_rel(MasterVol)($gp)
    /* 9A080 800AA080 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 9A084 800AA084 2430C200 */  and        $a2, $a2, $v0
    /* 9A088 800AA088 F80A86AF */  sw         $a2, %gp_rel(MasterVol)($gp)
    /* 9A08C 800AA08C FC0A83AF */  sw         $v1, %gp_rel(MusicVol)($gp)
    /* 9A090 800AA090 24186200 */  and        $v1, $v1, $v0
    /* 9A094 800AA094 FC0A83AF */  sw         $v1, %gp_rel(MusicVol)($gp)
    /* 9A098 800AA098 000B84AF */  sw         $a0, %gp_rel(SoundVol)($gp)
    /* 9A09C 800AA09C 24208200 */  and        $a0, $a0, $v0
    /* 9A0A0 800AA0A0 000B84AF */  sw         $a0, %gp_rel(SoundVol)($gp)
    /* 9A0A4 800AA0A4 080B85AF */  sw         $a1, %gp_rel(SpeechVol)($gp)
    /* 9A0A8 800AA0A8 2428A200 */  and        $a1, $a1, $v0
    /* 9A0AC 800AA0AC 080B85AF */  sw         $a1, %gp_rel(SpeechVol)($gp)
    /* 9A0B0 800AA0B0 0800E003 */  jr         $ra
    /* 9A0B4 800AA0B4 00000000 */   nop
endlabel SetLoadedVolumes__Fv
