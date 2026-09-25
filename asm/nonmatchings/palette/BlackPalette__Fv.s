.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BlackPalette__Fv, 0xFC

glabel BlackPalette__Fv
    /* 6F064 8007F064 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6F068 8007F068 2000BFAF */  sw         $ra, 0x20($sp)
    /* 6F06C 8007F06C D3FC010C */  jal        GetMaxOtPos__7CBlocks_8007f34c
    /* 6F070 8007F070 00000000 */   nop
    /* 6F074 8007F074 F01482AF */  sw         $v0, %gp_rel(D_8011BC70)($gp)
    /* 6F078 8007F078 044F020C */  jal        GM_UseTexData__Fi
    /* 6F07C 8007F07C 21200000 */   addu      $a0, $zero, $zero
    /* 6F080 8007F080 21204000 */  addu       $a0, $v0, $zero
    /* 6F084 8007F084 D8000524 */  addiu      $a1, $zero, 0xD8
    /* 6F088 8007F088 21300000 */  addu       $a2, $zero, $zero
    /* 6F08C 8007F08C F014838F */  lw         $v1, %gp_rel(D_8011BC70)($gp)
    /* 6F090 8007F090 21380000 */  addu       $a3, $zero, $zero
    /* 6F094 8007F094 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6F098 8007F098 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6F09C 8007F09C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6F0A0 8007F0A0 1400A3AF */   sw        $v1, 0x14($sp)
    /* 6F0A4 8007F0A4 21384000 */  addu       $a3, $v0, $zero
    /* 6F0A8 8007F0A8 1400E690 */  lbu        $a2, 0x14($a3)
    /* 6F0AC 8007F0AC 2400E490 */  lbu        $a0, 0x24($a3)
    /* 6F0B0 8007F0B0 1D00E590 */  lbu        $a1, 0x1D($a3)
    /* 6F0B4 8007F0B4 2500E290 */  lbu        $v0, 0x25($a3)
    /* 6F0B8 8007F0B8 0700E390 */  lbu        $v1, 0x7($a3)
    /* 6F0BC 8007F0BC 0400E0A0 */  sb         $zero, 0x4($a3)
    /* 6F0C0 8007F0C0 0500E0A0 */  sb         $zero, 0x5($a3)
    /* 6F0C4 8007F0C4 0600E0A0 */  sb         $zero, 0x6($a3)
    /* 6F0C8 8007F0C8 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 6F0CC 8007F0CC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 6F0D0 8007F0D0 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 6F0D4 8007F0D4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 6F0D8 8007F0D8 FC006330 */  andi       $v1, $v1, 0xFC
    /* 6F0DC 8007F0DC 1400E6A0 */  sb         $a2, 0x14($a3)
    /* 6F0E0 8007F0E0 2400E4A0 */  sb         $a0, 0x24($a3)
    /* 6F0E4 8007F0E4 1D00E5A0 */  sb         $a1, 0x1D($a3)
    /* 6F0E8 8007F0E8 2500E2A0 */  sb         $v0, 0x25($a3)
    /* 6F0EC 8007F0EC 0700E3A0 */  sb         $v1, 0x7($a3)
    /* 6F0F0 8007F0F0 1280023C */  lui        $v0, %hi(TitleFlag)
    /* 6F0F4 8007F0F4 40B1428C */  lw         $v0, %lo(TitleFlag)($v0)
    /* 6F0F8 8007F0F8 00000000 */  nop
    /* 6F0FC 8007F0FC 08004014 */  bnez       $v0, .L8007F120
    /* 6F100 8007F100 B0000224 */   addiu     $v0, $zero, 0xB0
    /* 6F104 8007F104 60010324 */  addiu      $v1, $zero, 0x160
    /* 6F108 8007F108 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 6F10C 8007F10C 0800E0A4 */  sh         $zero, 0x8($a3)
    /* 6F110 8007F110 0A00E0A4 */  sh         $zero, 0xA($a3)
    /* 6F114 8007F114 1000E3A4 */  sh         $v1, 0x10($a3)
    /* 6F118 8007F118 4EFC0108 */  j          .L8007F138
    /* 6F11C 8007F11C 1200E0A4 */   sh        $zero, 0x12($a3)
  .L8007F120:
    /* 6F120 8007F120 60010324 */  addiu      $v1, $zero, 0x160
    /* 6F124 8007F124 0A00E2A4 */  sh         $v0, 0xA($a3)
    /* 6F128 8007F128 1200E2A4 */  sh         $v0, 0x12($a3)
    /* 6F12C 8007F12C A0010224 */  addiu      $v0, $zero, 0x1A0
    /* 6F130 8007F130 0800E0A4 */  sh         $zero, 0x8($a3)
    /* 6F134 8007F134 1000E3A4 */  sh         $v1, 0x10($a3)
  .L8007F138:
    /* 6F138 8007F138 1800E0A4 */  sh         $zero, 0x18($a3)
    /* 6F13C 8007F13C 1A00E2A4 */  sh         $v0, 0x1A($a3)
    /* 6F140 8007F140 2000E3A4 */  sh         $v1, 0x20($a3)
    /* 6F144 8007F144 2200E2A4 */  sh         $v0, 0x22($a3)
    /* 6F148 8007F148 EE80000C */  jal        TSK_Sleep
    /* 6F14C 8007F14C 01000424 */   addiu     $a0, $zero, 0x1
    /* 6F150 8007F150 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6F154 8007F154 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6F158 8007F158 0800E003 */  jr         $ra
    /* 6F15C 8007F15C 00000000 */   nop
endlabel BlackPalette__Fv
