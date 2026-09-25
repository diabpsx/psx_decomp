.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaySFX_priv__FP4TSFXUcii, 0x164

glabel PlaySFX_priv__FP4TSFXUcii
    /* 2D3C4 8003D3C4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2D3C8 8003D3C8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2D3CC 8003D3CC 21808000 */  addu       $s0, $a0, $zero
    /* 2D3D0 8003D3D0 1280023C */  lui        $v0, %hi(gbSndInited)
    /* 2D3D4 8003D3D4 99BB4290 */  lbu        $v0, %lo(gbSndInited)($v0)
    /* 2D3D8 8003D3D8 2120C000 */  addu       $a0, $a2, $zero
    /* 2D3DC 8003D3DC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2D3E0 8003D3E0 4B004010 */  beqz       $v0, .L8003D510
    /* 2D3E4 8003D3E4 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 2D3E8 8003D3E8 1280033C */  lui        $v1, %hi(sglSoundVolume)
    /* 2D3EC 8003D3EC A4BB638C */  lw         $v1, %lo(sglSoundVolume)($v1)
    /* 2D3F0 8003D3F0 1280023C */  lui        $v0, %hi(sglMasterVolume)
    /* 2D3F4 8003D3F4 9CBB428C */  lw         $v0, %lo(sglMasterVolume)($v0)
    /* 2D3F8 8003D3F8 00000000 */  nop
    /* 2D3FC 8003D3FC 18006200 */  mult       $v1, $v0
    /* 2D400 8003D400 00801134 */  ori        $s1, $zero, 0x8000
    /* 2D404 8003D404 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2D408 8003D408 12400000 */  mflo       $t0
    /* 2D40C 8003D40C 03120800 */  sra        $v0, $t0, 8
    /* 2D410 8003D410 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2D414 8003D414 FF00A230 */  andi       $v0, $a1, 0xFF
    /* 2D418 8003D418 07004010 */  beqz       $v0, .L8003D438
    /* 2D41C 8003D41C 2128E000 */   addu      $a1, $a3, $zero
    /* 2D420 8003D420 1000A627 */  addiu      $a2, $sp, 0x10
    /* 2D424 8003D424 77F4000C */  jal        calc_snd_position__FiiPlT2
    /* 2D428 8003D428 1400A727 */   addiu     $a3, $sp, 0x14
    /* 2D42C 8003D42C FF004230 */  andi       $v0, $v0, 0xFF
    /* 2D430 8003D430 37004010 */  beqz       $v0, .L8003D510
    /* 2D434 8003D434 00000000 */   nop
  .L8003D438:
    /* 2D438 8003D438 01000392 */  lbu        $v1, 0x1($s0)
    /* 2D43C 8003D43C 00000000 */  nop
    /* 2D440 8003D440 01006230 */  andi       $v0, $v1, 0x1
    /* 2D444 8003D444 03004014 */  bnez       $v0, .L8003D454
    /* 2D448 8003D448 02006230 */   andi      $v0, $v1, 0x2
    /* 2D44C 8003D44C 21004010 */  beqz       $v0, .L8003D4D4
    /* 2D450 8003D450 00000000 */   nop
  .L8003D454:
    /* 2D454 8003D454 1280023C */  lui        $v0, %hi(sglSoundVolume)
    /* 2D458 8003D458 A4BB428C */  lw         $v0, %lo(sglSoundVolume)($v0)
    /* 2D45C 8003D45C 1280033C */  lui        $v1, %hi(sglMasterVolume)
    /* 2D460 8003D460 9CBB638C */  lw         $v1, %lo(sglMasterVolume)($v1)
    /* 2D464 8003D464 00000000 */  nop
    /* 2D468 8003D468 18004300 */  mult       $v0, $v1
    /* 2D46C 8003D46C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2D470 8003D470 1280023C */  lui        $v0, %hi(optionsflag)
    /* 2D474 8003D474 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 2D478 8003D478 12400000 */  mflo       $t0
    /* 2D47C 8003D47C 032A0800 */  sra        $a1, $t0, 8
    /* 2D480 8003D480 0F004010 */  beqz       $v0, .L8003D4C0
    /* 2D484 8003D484 1000A5AF */   sw        $a1, 0x10($sp)
    /* 2D488 8003D488 1280023C */  lui        $v0, %hi(sglSpeechVolume)
    /* 2D48C 8003D48C A8BB428C */  lw         $v0, %lo(sglSpeechVolume)($v0)
    /* 2D490 8003D490 00000000 */  nop
    /* 2D494 8003D494 18004300 */  mult       $v0, $v1
    /* 2D498 8003D498 00800634 */  ori        $a2, $zero, 0x8000
    /* 2D49C 8003D49C 21380000 */  addu       $a3, $zero, $zero
    /* 2D4A0 8003D4A0 0D80043C */  lui        $a0, %hi(sgSFX + 0xCA)
    /* 2D4A4 8003D4A4 8A0B8494 */  lhu        $a0, %lo(sgSFX + 0xCA)($a0)
    /* 2D4A8 8003D4A8 12400000 */  mflo       $t0
    /* 2D4AC 8003D4AC 032A0800 */  sra        $a1, $t0, 8
    /* 2D4B0 8003D4B0 E769020C */  jal        SND_PlaySnd__FUsiii
    /* 2D4B4 8003D4B4 1000A5AF */   sw        $a1, 0x10($sp)
    /* 2D4B8 8003D4B8 44F50008 */  j          .L8003D510
    /* 2D4BC 8003D4BC 00000000 */   nop
  .L8003D4C0:
    /* 2D4C0 8003D4C0 21200002 */  addu       $a0, $s0, $zero
    /* 2D4C4 8003D4C4 1BF4000C */  jal        stream_play__FP4TSFXll
    /* 2D4C8 8003D4C8 00800634 */   ori       $a2, $zero, 0x8000
    /* 2D4CC 8003D4CC 44F50008 */  j          .L8003D510
    /* 2D4D0 8003D4D0 00000000 */   nop
  .L8003D4D4:
    /* 2D4D4 8003D4D4 00000296 */  lhu        $v0, 0x0($s0)
    /* 2D4D8 8003D4D8 00000000 */  nop
    /* 2D4DC 8003D4DC 000C4230 */  andi       $v0, $v0, 0xC00
    /* 2D4E0 8003D4E0 07004014 */  bnez       $v0, .L8003D500
    /* 2D4E4 8003D4E4 00000000 */   nop
    /* 2D4E8 8003D4E8 02000496 */  lhu        $a0, 0x2($s0)
    /* 2D4EC 8003D4EC DCDF010C */  jal        snd_playing__Fi
    /* 2D4F0 8003D4F0 00000000 */   nop
    /* 2D4F4 8003D4F4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2D4F8 8003D4F8 05004014 */  bnez       $v0, .L8003D510
    /* 2D4FC 8003D4FC 00000000 */   nop
  .L8003D500:
    /* 2D500 8003D500 1000A58F */  lw         $a1, 0x10($sp)
    /* 2D504 8003D504 1400A68F */  lw         $a2, 0x14($sp)
    /* 2D508 8003D508 56DF010C */  jal        snd_play_snd__FP4TSFXll
    /* 2D50C 8003D50C 21200002 */   addu      $a0, $s0, $zero
  .L8003D510:
    /* 2D510 8003D510 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2D514 8003D514 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2D518 8003D518 1800B08F */  lw         $s0, 0x18($sp)
    /* 2D51C 8003D51C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2D520 8003D520 0800E003 */  jr         $ra
    /* 2D524 8003D524 00000000 */   nop
endlabel PlaySFX_priv__FP4TSFXUcii
