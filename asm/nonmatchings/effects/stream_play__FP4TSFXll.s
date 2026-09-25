.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stream_play__FP4TSFXll, 0xEC

glabel stream_play__FP4TSFXll
    /* 2D06C 8003D06C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2D070 8003D070 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2D074 8003D074 21888000 */  addu       $s1, $a0, $zero
    /* 2D078 8003D078 1280033C */  lui        $v1, %hi(FileSYS)
    /* 2D07C 8003D07C ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 2D080 8003D080 02000224 */  addiu      $v0, $zero, 0x2
    /* 2D084 8003D084 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2D088 8003D088 2D006214 */  bne        $v1, $v0, .L8003D140
    /* 2D08C 8003D08C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 2D090 8003D090 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 2D094 8003D094 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 2D098 8003D098 00000000 */  nop
    /* 2D09C 8003D09C 28004014 */  bnez       $v0, .L8003D140
    /* 2D0A0 8003D0A0 00000000 */   nop
    /* 2D0A4 8003D0A4 01002392 */  lbu        $v1, 0x1($s1)
    /* 2D0A8 8003D0A8 00000000 */  nop
    /* 2D0AC 8003D0AC 01006230 */  andi       $v0, $v1, 0x1
    /* 2D0B0 8003D0B0 0C004010 */  beqz       $v0, .L8003D0E4
    /* 2D0B4 8003D0B4 70006230 */   andi      $v0, $v1, 0x70
    /* 2D0B8 8003D0B8 1280033C */  lui        $v1, %hi(sglSoundVolume)
    /* 2D0BC 8003D0BC A4BB638C */  lw         $v1, %lo(sglSoundVolume)($v1)
    /* 2D0C0 8003D0C0 1280023C */  lui        $v0, %hi(sglMasterVolume)
    /* 2D0C4 8003D0C4 9CBB428C */  lw         $v0, %lo(sglMasterVolume)($v0)
    /* 2D0C8 8003D0C8 00000000 */  nop
    /* 2D0CC 8003D0CC 18006200 */  mult       $v1, $v0
    /* 2D0D0 8003D0D0 12400000 */  mflo       $t0
    /* 2D0D4 8003D0D4 D7F3000C */  jal        stream_stop__Fv
    /* 2D0D8 8003D0D8 03820800 */   sra       $s0, $t0, 8
    /* 2D0DC 8003D0DC 45F40008 */  j          .L8003D114
    /* 2D0E0 8003D0E0 00000000 */   nop
  .L8003D0E4:
    /* 2D0E4 8003D0E4 03004014 */  bnez       $v0, .L8003D0F4
    /* 2D0E8 8003D0E8 00000000 */   nop
    /* 2D0EC 8003D0EC D7F3000C */  jal        stream_stop__Fv
    /* 2D0F0 8003D0F0 00000000 */   nop
  .L8003D0F4:
    /* 2D0F4 8003D0F4 1280033C */  lui        $v1, %hi(sglSpeechVolume)
    /* 2D0F8 8003D0F8 A8BB638C */  lw         $v1, %lo(sglSpeechVolume)($v1)
    /* 2D0FC 8003D0FC 1280023C */  lui        $v0, %hi(sglMasterVolume)
    /* 2D100 8003D100 9CBB428C */  lw         $v0, %lo(sglMasterVolume)($v0)
    /* 2D104 8003D104 00000000 */  nop
    /* 2D108 8003D108 18006200 */  mult       $v1, $v0
    /* 2D10C 8003D10C 12400000 */  mflo       $t0
    /* 2D110 8003D110 03820800 */  sra        $s0, $t0, 8
  .L8003D114:
    /* 2D114 8003D114 0A000006 */  bltz       $s0, .L8003D140
    /* 2D118 8003D118 0040022A */   slti      $v0, $s0, 0x4000
    /* 2D11C 8003D11C 02004014 */  bnez       $v0, .L8003D128
    /* 2D120 8003D120 21280000 */   addu      $a1, $zero, $zero
    /* 2D124 8003D124 FF3F1024 */  addiu      $s0, $zero, 0x3FFF
  .L8003D128:
    /* 2D128 8003D128 21300002 */  addu       $a2, $s0, $zero
    /* 2D12C 8003D12C 02002496 */  lhu        $a0, 0x2($s1)
    /* 2D130 8003D130 7263020C */  jal        STR_PlaySound__FUscic
    /* 2D134 8003D134 21380000 */   addu      $a3, $zero, $zero
    /* 2D138 8003D138 B41082AF */  sw         $v0, %gp_rel(sghStream)($gp)
    /* 2D13C 8003D13C B81091AF */  sw         $s1, %gp_rel(sgpStreamSFX)($gp)
  .L8003D140:
    /* 2D140 8003D140 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2D144 8003D144 1400B18F */  lw         $s1, 0x14($sp)
    /* 2D148 8003D148 1000B08F */  lw         $s0, 0x10($sp)
    /* 2D14C 8003D14C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2D150 8003D150 0800E003 */  jr         $ra
    /* 2D154 8003D154 00000000 */   nop
endlabel stream_play__FP4TSFXll
