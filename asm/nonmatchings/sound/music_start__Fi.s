.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching music_start__Fi, 0xA0

glabel music_start__Fi
    /* 67ED0 80077ED0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 67ED4 80077ED4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 67ED8 80077ED8 21808000 */  addu       $s0, $a0, $zero
    /* 67EDC 80077EDC 1280033C */  lui        $v1, %hi(FileSYS)
    /* 67EE0 80077EE0 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 67EE4 80077EE4 02000224 */  addiu      $v0, $zero, 0x2
    /* 67EE8 80077EE8 1C006214 */  bne        $v1, $v0, .L80077F5C
    /* 67EEC 80077EEC 1400BFAF */   sw        $ra, 0x14($sp)
    /* 67EF0 80077EF0 3414828F */  lw         $v0, %gp_rel(sghMusic)($gp)
    /* 67EF4 80077EF4 00000000 */  nop
    /* 67EF8 80077EF8 03004010 */  beqz       $v0, .L80077F08
    /* 67EFC 80077EFC 00000000 */   nop
    /* 67F00 80077F00 94DF010C */  jal        music_stop__Fv
    /* 67F04 80077F04 00000000 */   nop
  .L80077F08:
    /* 67F08 80077F08 2014838F */  lw         $v1, %gp_rel(sglMusicVolume)($gp)
    /* 67F0C 80077F0C 1C14828F */  lw         $v0, %gp_rel(sglMasterVolume)($gp)
    /* 67F10 80077F10 00000000 */  nop
    /* 67F14 80077F14 18006200 */  mult       $v1, $v0
    /* 67F18 80077F18 01000524 */  addiu      $a1, $zero, 0x1
    /* 67F1C 80077F1C 01000724 */  addiu      $a3, $zero, 0x1
    /* 67F20 80077F20 40101000 */  sll        $v0, $s0, 1
    /* 67F24 80077F24 0E80013C */  lui        $at, %hi(sgszMusicTracks)
    /* 67F28 80077F28 21082200 */  addu       $at, $at, $v0
    /* 67F2C 80077F2C 9C382494 */  lhu        $a0, %lo(sgszMusicTracks)($at)
    /* 67F30 80077F30 12400000 */  mflo       $t0
    /* 67F34 80077F34 7263020C */  jal        STR_PlaySound__FUscic
    /* 67F38 80077F38 03320800 */   sra       $a2, $t0, 8
    /* 67F3C 80077F3C 341482AF */  sw         $v0, %gp_rel(sghMusic)($gp)
    /* 67F40 80077F40 05004014 */  bnez       $v0, .L80077F58
    /* 67F44 80077F44 21200000 */   addu      $a0, $zero, $zero
    /* 67F48 80077F48 1280053C */  lui        $a1, %hi(D_80118A0C)
    /* 67F4C 80077F4C 0C8AA524 */  addiu      $a1, $a1, %lo(D_80118A0C)
    /* 67F50 80077F50 A583000C */  jal        DBG_Error
    /* 67F54 80077F54 13010624 */   addiu     $a2, $zero, 0x113
  .L80077F58:
    /* 67F58 80077F58 2C1490AF */  sw         $s0, %gp_rel(sgnMusicTrack)($gp)
  .L80077F5C:
    /* 67F5C 80077F5C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 67F60 80077F60 1000B08F */  lw         $s0, 0x10($sp)
    /* 67F64 80077F64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 67F68 80077F68 0800E003 */  jr         $ra
    /* 67F6C 80077F6C 00000000 */   nop
endlabel music_start__Fi
