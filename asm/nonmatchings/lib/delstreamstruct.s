.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delstreamstruct, 0x12C

glabel delstreamstruct
    /* 1CF20 8002CF20 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1CF24 8002CF24 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1CF28 8002CF28 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CF2C 8002CF2C 21808000 */  addu       $s0, $a0, $zero
    /* 1CF30 8002CF30 2400BFAF */  sw         $ra, 0x24($sp)
    /* 1CF34 8002CF34 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1CF38 8002CF38 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1CF3C 8002CF3C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1CF40 8002CF40 0C004014 */  bnez       $v0, .L8002CF74
    /* 1CF44 8002CF44 1400B1AF */   sw        $s1, 0x14($sp)
    /* 1CF48 8002CF48 1180043C */  lui        $a0, %hi(D_8010FB88)
    /* 1CF4C 8002CF4C 88FB8424 */  addiu      $a0, $a0, %lo(D_8010FB88)
    /* 1CF50 8002CF50 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1CF54 8002CF54 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1CF58 8002CF58 1280013C */  lui        $at, %hi(abortfile)
    /* 1CF5C 8002CF5C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1CF60 8002CF60 5D020224 */  addiu      $v0, $zero, 0x25D
    /* 1CF64 8002CF64 1280013C */  lui        $at, %hi(abortline)
    /* 1CF68 8002CF68 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1CF6C 8002CF6C 0F95000C */  jal        abortmessage
    /* 1CF70 8002CF70 00000000 */   nop
  .L8002CF74:
    /* 1CF74 8002CF74 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1CF78 8002CF78 00000000 */  nop
    /* 1CF7C 8002CF7C 2A000216 */  bne        $s0, $v0, .L8002D028
    /* 1CF80 8002CF80 08000224 */   addiu     $v0, $zero, 0x8
    /* 1CF84 8002CF84 240002AE */  sw         $v0, 0x24($s0)
    /* 1CF88 8002CF88 2800028E */  lw         $v0, 0x28($s0)
    /* 1CF8C 8002CF8C 01001224 */  addiu      $s2, $zero, 0x1
    /* 1CF90 8002CF90 03005214 */  bne        $v0, $s2, .L8002CFA0
    /* 1CF94 8002CF94 00000000 */   nop
    /* 1CF98 8002CF98 C79D000C */  jal        psxcdromstopread
    /* 1CF9C 8002CF9C 00000000 */   nop
  .L8002CFA0:
    /* 1CFA0 8002CFA0 08C0000C */  jal        gettick
    /* 1CFA4 8002CFA4 00000000 */   nop
    /* 1CFA8 8002CFA8 2800038E */  lw         $v1, 0x28($s0)
    /* 1CFAC 8002CFAC 00000000 */  nop
    /* 1CFB0 8002CFB0 16007214 */  bne        $v1, $s2, .L8002D00C
    /* 1CFB4 8002CFB4 64005124 */   addiu     $s1, $v0, 0x64
    /* 1CFB8 8002CFB8 1180143C */  lui        $s4, %hi(D_8010FAF8)
    /* 1CFBC 8002CFBC F8FA9426 */  addiu      $s4, $s4, %lo(D_8010FAF8)
    /* 1CFC0 8002CFC0 6B021324 */  addiu      $s3, $zero, 0x26B
    /* 1CFC4 8002CFC4 01001224 */  addiu      $s2, $zero, 0x1
  .L8002CFC8:
    /* 1CFC8 8002CFC8 08C0000C */  jal        gettick
    /* 1CFCC 8002CFCC 00000000 */   nop
    /* 1CFD0 8002CFD0 2A102202 */  slt        $v0, $s1, $v0
    /* 1CFD4 8002CFD4 09004010 */  beqz       $v0, .L8002CFFC
    /* 1CFD8 8002CFD8 00000000 */   nop
    /* 1CFDC 8002CFDC 1180043C */  lui        $a0, %hi(D_8010FBC8)
    /* 1CFE0 8002CFE0 C8FB8424 */  addiu      $a0, $a0, %lo(D_8010FBC8)
    /* 1CFE4 8002CFE4 1280013C */  lui        $at, %hi(abortfile)
    /* 1CFE8 8002CFE8 B8C334AC */  sw         $s4, %lo(abortfile)($at)
    /* 1CFEC 8002CFEC 1280013C */  lui        $at, %hi(abortline)
    /* 1CFF0 8002CFF0 BCC333AC */  sw         $s3, %lo(abortline)($at)
    /* 1CFF4 8002CFF4 0F95000C */  jal        abortmessage
    /* 1CFF8 8002CFF8 00000000 */   nop
  .L8002CFFC:
    /* 1CFFC 8002CFFC 2800028E */  lw         $v0, 0x28($s0)
    /* 1D000 8002D000 00000000 */  nop
    /* 1D004 8002D004 F0FF5210 */  beq        $v0, $s2, .L8002CFC8
    /* 1D008 8002D008 00000000 */   nop
  .L8002D00C:
    /* 1D00C 8002D00C 3FB6000C */  jal        PSXistreamreader
    /* 1D010 8002D010 00000000 */   nop
    /* 1D014 8002D014 21200000 */  addu       $a0, $zero, $zero
    /* 1D018 8002D018 21280000 */  addu       $a1, $zero, $zero
    /* 1D01C 8002D01C 0EA5000C */  jal        setstreameriofuncs
    /* 1D020 8002D020 21300000 */   addu      $a2, $zero, $zero
    /* 1D024 8002D024 781D80AF */  sw         $zero, %gp_rel(cdms)($gp)
  .L8002D028:
    /* 1D028 8002D028 2400BF8F */  lw         $ra, 0x24($sp)
    /* 1D02C 8002D02C 2000B48F */  lw         $s4, 0x20($sp)
    /* 1D030 8002D030 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1D034 8002D034 1800B28F */  lw         $s2, 0x18($sp)
    /* 1D038 8002D038 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D03C 8002D03C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D040 8002D040 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1D044 8002D044 0800E003 */  jr         $ra
    /* 1D048 8002D048 00000000 */   nop
endlabel delstreamstruct
