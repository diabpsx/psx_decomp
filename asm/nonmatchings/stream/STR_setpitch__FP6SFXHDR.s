.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_setpitch__FP6SFXHDR, 0x4C

glabel STR_setpitch__FP6SFXHDR
    /* 890DC 800990DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 890E0 800990E0 0D80053C */  lui        $a1, %hi(voice_attr + 0x4)
    /* 890E4 800990E4 ECBCA524 */  addiu      $a1, $a1, %lo(voice_attr + 0x4)
    /* 890E8 800990E8 10000224 */  addiu      $v0, $zero, 0x10
    /* 890EC 800990EC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 890F0 800990F0 0000A2AC */  sw         $v0, 0x0($a1)
    /* 890F4 800990F4 1000838C */  lw         $v1, 0x10($a0)
    /* 890F8 800990F8 01000224 */  addiu      $v0, $zero, 0x1
    /* 890FC 800990FC 04106200 */  sllv       $v0, $v0, $v1
    /* 89100 80099100 FCFFA2AC */  sw         $v0, -0x4($a1)
    /* 89104 80099104 1C00828C */  lw         $v0, 0x1C($a0)
    /* 89108 80099108 0D80013C */  lui        $at, %hi(voice_attr + 0x14)
    /* 8910C 8009910C FCBC22A4 */  sh         $v0, %lo(voice_attr + 0x14)($at)
    /* 89110 80099110 3765000C */  jal        SpuSetVoiceAttr
    /* 89114 80099114 FCFFA424 */   addiu     $a0, $a1, -0x4
    /* 89118 80099118 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8911C 8009911C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 89120 80099120 0800E003 */  jr         $ra
    /* 89124 80099124 00000000 */   nop
endlabel STR_setpitch__FP6SFXHDR
