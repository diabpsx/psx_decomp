.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamcommanda, 0x134

glabel streamcommanda
    /* 1D178 8002D178 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1D17C 8002D17C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1D180 8002D180 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D184 8002D184 21888000 */  addu       $s1, $a0, $zero
    /* 1D188 8002D188 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1D18C 8002D18C 4000B58F */  lw         $s5, 0x40($sp)
    /* 1D190 8002D190 4400A48F */  lw         $a0, 0x44($sp)
    /* 1D194 8002D194 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1D198 8002D198 2190A000 */  addu       $s2, $a1, $zero
    /* 1D19C 8002D19C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1D1A0 8002D1A0 2198C000 */  addu       $s3, $a2, $zero
    /* 1D1A4 8002D1A4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1D1A8 8002D1A8 21A0E000 */  addu       $s4, $a3, $zero
    /* 1D1AC 8002D1AC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1D1B0 8002D1B0 10004014 */  bnez       $v0, .L8002D1F4
    /* 1D1B4 8002D1B4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1D1B8 8002D1B8 32008010 */  beqz       $a0, .L8002D284
    /* 1D1BC 8002D1BC 21100000 */   addu      $v0, $zero, $zero
    /* 1D1C0 8002D1C0 1180043C */  lui        $a0, %hi(D_8010FC68)
    /* 1D1C4 8002D1C4 68FC8424 */  addiu      $a0, $a0, %lo(D_8010FC68)
    /* 1D1C8 8002D1C8 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1D1CC 8002D1CC F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1D1D0 8002D1D0 1280013C */  lui        $at, %hi(abortfile)
    /* 1D1D4 8002D1D4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1D1D8 8002D1D8 22030224 */  addiu      $v0, $zero, 0x322
    /* 1D1DC 8002D1DC 1280013C */  lui        $at, %hi(abortline)
    /* 1D1E0 8002D1E0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1D1E4 8002D1E4 0F95000C */  jal        abortmessage
    /* 1D1E8 8002D1E8 00000000 */   nop
    /* 1D1EC 8002D1EC A1B40008 */  j          .L8002D284
    /* 1D1F0 8002D1F0 21100000 */   addu      $v0, $zero, $zero
  .L8002D1F4:
    /* 1D1F4 8002D1F4 22BD000C */  jal        getstreamblocka
    /* 1D1F8 8002D1F8 00000000 */   nop
    /* 1D1FC 8002D1FC 21804000 */  addu       $s0, $v0, $zero
    /* 1D200 8002D200 03000016 */  bnez       $s0, .L8002D210
    /* 1D204 8002D204 21200002 */   addu      $a0, $s0, $zero
    /* 1D208 8002D208 A1B40008 */  j          .L8002D284
    /* 1D20C 8002D20C 21100000 */   addu      $v0, $zero, $zero
  .L8002D210:
    /* 1D210 8002D210 21284002 */  addu       $a1, $s2, $zero
    /* 1D214 8002D214 8367000C */  jal        strncpy
    /* 1D218 8002D218 8F000624 */   addiu     $a2, $zero, 0x8F
    /* 1D21C 8002D21C 8E0000A2 */  sb         $zero, 0x8E($s0)
    /* 1D220 8002D220 940013AE */  sw         $s3, 0x94($s0)
    /* 1D224 8002D224 900014AE */  sw         $s4, 0x90($s0)
    /* 1D228 8002D228 7C00228E */  lw         $v0, 0x7C($s1)
    /* 1D22C 8002D22C 00000000 */  nop
    /* 1D230 8002D230 07004010 */  beqz       $v0, .L8002D250
    /* 1D234 8002D234 00000000 */   nop
    /* 1D238 8002D238 7C00228E */  lw         $v0, 0x7C($s1)
    /* 1D23C 8002D23C 00000000 */  nop
    /* 1D240 8002D240 980050AC */  sw         $s0, 0x98($v0)
    /* 1D244 8002D244 7C0030AE */  sw         $s0, 0x7C($s1)
    /* 1D248 8002D248 98B40008 */  j          .L8002D260
    /* 1D24C 8002D24C 00000000 */   nop
  .L8002D250:
    /* 1D250 8002D250 7C0030AE */  sw         $s0, 0x7C($s1)
    /* 1D254 8002D254 7C00228E */  lw         $v0, 0x7C($s1)
    /* 1D258 8002D258 00000000 */  nop
    /* 1D25C 8002D25C 780022AE */  sw         $v0, 0x78($s1)
  .L8002D260:
    /* 1D260 8002D260 0800A012 */  beqz       $s5, .L8002D284
    /* 1D264 8002D264 01000224 */   addiu     $v0, $zero, 0x1
    /* 1D268 8002D268 2400228E */  lw         $v0, 0x24($s1)
    /* 1D26C 8002D26C 00000000 */  nop
    /* 1D270 8002D270 04004014 */  bnez       $v0, .L8002D284
    /* 1D274 8002D274 01000224 */   addiu     $v0, $zero, 0x1
    /* 1D278 8002D278 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1D27C 8002D27C 240022AE */  sw         $v0, 0x24($s1)
    /* 1D280 8002D280 01000224 */  addiu      $v0, $zero, 0x1
  .L8002D284:
    /* 1D284 8002D284 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1D288 8002D288 2400B58F */  lw         $s5, 0x24($sp)
    /* 1D28C 8002D28C 2000B48F */  lw         $s4, 0x20($sp)
    /* 1D290 8002D290 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1D294 8002D294 1800B28F */  lw         $s2, 0x18($sp)
    /* 1D298 8002D298 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D29C 8002D29C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D2A0 8002D2A0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1D2A4 8002D2A4 0800E003 */  jr         $ra
    /* 1D2A8 8002D2A8 00000000 */   nop
endlabel streamcommanda
