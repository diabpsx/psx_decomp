.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delstream, 0x12C

glabel delstream
    /* 1D04C 8002D04C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1D050 8002D050 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D054 8002D054 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D058 8002D058 21888000 */  addu       $s1, $a0, $zero
    /* 1D05C 8002D05C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D060 8002D060 0C004014 */  bnez       $v0, .L8002D094
    /* 1D064 8002D064 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1D068 8002D068 1180043C */  lui        $a0, %hi(D_8010FC0C)
    /* 1D06C 8002D06C 0CFC8424 */  addiu      $a0, $a0, %lo(D_8010FC0C)
    /* 1D070 8002D070 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1D074 8002D074 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1D078 8002D078 1280013C */  lui        $at, %hi(abortfile)
    /* 1D07C 8002D07C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1D080 8002D080 B6020224 */  addiu      $v0, $zero, 0x2B6
    /* 1D084 8002D084 1280013C */  lui        $at, %hi(abortline)
    /* 1D088 8002D088 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1D08C 8002D08C 0F95000C */  jal        abortmessage
    /* 1D090 8002D090 00000000 */   nop
  .L8002D094:
    /* 1D094 8002D094 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1D098 8002D098 00000000 */  nop
    /* 1D09C 8002D09C 0C002216 */  bne        $s1, $v0, .L8002D0D0
    /* 1D0A0 8002D0A0 21804000 */   addu      $s0, $v0, $zero
    /* 1D0A4 8002D0A4 C8B3000C */  jal        delstreamstruct
    /* 1D0A8 8002D0A8 21202002 */   addu      $a0, $s1, $zero
    /* 1D0AC 8002D0AC 21802002 */  addu       $s0, $s1, $zero
  .L8002D0B0:
    /* 1D0B0 8002D0B0 7000108E */  lw         $s0, 0x70($s0)
    /* 1D0B4 8002D0B4 B9AB000C */  jal        purgememadr
    /* 1D0B8 8002D0B8 21202002 */   addu      $a0, $s1, $zero
    /* 1D0BC 8002D0BC 21880002 */  addu       $s1, $s0, $zero
    /* 1D0C0 8002D0C0 25002012 */  beqz       $s1, .L8002D158
    /* 1D0C4 8002D0C4 00000000 */   nop
    /* 1D0C8 8002D0C8 2CB40008 */  j          .L8002D0B0
    /* 1D0CC 8002D0CC 00000000 */   nop
  .L8002D0D0:
    /* 1D0D0 8002D0D0 7000028E */  lw         $v0, 0x70($s0)
    /* 1D0D4 8002D0D4 00000000 */  nop
    /* 1D0D8 8002D0D8 0B004010 */  beqz       $v0, .L8002D108
    /* 1D0DC 8002D0DC 00000000 */   nop
  .L8002D0E0:
    /* 1D0E0 8002D0E0 7000028E */  lw         $v0, 0x70($s0)
    /* 1D0E4 8002D0E4 00000000 */  nop
    /* 1D0E8 8002D0E8 07005110 */  beq        $v0, $s1, .L8002D108
    /* 1D0EC 8002D0EC 00000000 */   nop
    /* 1D0F0 8002D0F0 7000108E */  lw         $s0, 0x70($s0)
    /* 1D0F4 8002D0F4 00000000 */  nop
    /* 1D0F8 8002D0F8 7000028E */  lw         $v0, 0x70($s0)
    /* 1D0FC 8002D0FC 00000000 */  nop
    /* 1D100 8002D100 F7FF4014 */  bnez       $v0, .L8002D0E0
    /* 1D104 8002D104 00000000 */   nop
  .L8002D108:
    /* 1D108 8002D108 7000028E */  lw         $v0, 0x70($s0)
    /* 1D10C 8002D10C 00000000 */  nop
    /* 1D110 8002D110 0C005110 */  beq        $v0, $s1, .L8002D144
    /* 1D114 8002D114 00000000 */   nop
    /* 1D118 8002D118 1180043C */  lui        $a0, %hi(D_8010FC48)
    /* 1D11C 8002D11C 48FC8424 */  addiu      $a0, $a0, %lo(D_8010FC48)
    /* 1D120 8002D120 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1D124 8002D124 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1D128 8002D128 1280013C */  lui        $at, %hi(abortfile)
    /* 1D12C 8002D12C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1D130 8002D130 D3020224 */  addiu      $v0, $zero, 0x2D3
    /* 1D134 8002D134 1280013C */  lui        $at, %hi(abortline)
    /* 1D138 8002D138 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1D13C 8002D13C 0F95000C */  jal        abortmessage
    /* 1D140 8002D140 00000000 */   nop
  .L8002D144:
    /* 1D144 8002D144 7000228E */  lw         $v0, 0x70($s1)
    /* 1D148 8002D148 21202002 */  addu       $a0, $s1, $zero
    /* 1D14C 8002D14C 700002AE */  sw         $v0, 0x70($s0)
    /* 1D150 8002D150 B9AB000C */  jal        purgememadr
    /* 1D154 8002D154 00000000 */   nop
  .L8002D158:
    /* 1D158 8002D158 7C1D80AF */  sw         $zero, %gp_rel(cdrs)($gp)
    /* 1D15C 8002D15C 781D80AF */  sw         $zero, %gp_rel(cdms)($gp)
    /* 1D160 8002D160 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D164 8002D164 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D168 8002D168 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D16C 8002D16C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D170 8002D170 0800E003 */  jr         $ra
    /* 1D174 8002D174 00000000 */   nop
endlabel delstream
