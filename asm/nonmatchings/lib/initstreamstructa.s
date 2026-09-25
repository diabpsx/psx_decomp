.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initstreamstructa, 0x188

glabel initstreamstructa
    /* 1CC14 8002CC14 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1CC18 8002CC18 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1CC1C 8002CC1C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CC20 8002CC20 21808000 */  addu       $s0, $a0, $zero
    /* 1CC24 8002CC24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1CC28 8002CC28 2188A000 */  addu       $s1, $a1, $zero
    /* 1CC2C 8002CC2C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1CC30 8002CC30 2198C000 */  addu       $s3, $a2, $zero
    /* 1CC34 8002CC34 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1CC38 8002CC38 2190E000 */  addu       $s2, $a3, $zero
    /* 1CC3C 8002CC3C 0E004010 */  beqz       $v0, .L8002CC78
    /* 1CC40 8002CC40 2000BFAF */   sw        $ra, 0x20($sp)
    /* 1CC44 8002CC44 0C004012 */  beqz       $s2, .L8002CC78
    /* 1CC48 8002CC48 00000000 */   nop
    /* 1CC4C 8002CC4C 1180043C */  lui        $a0, %hi(D_8010FB40)
    /* 1CC50 8002CC50 40FB8424 */  addiu      $a0, $a0, %lo(D_8010FB40)
    /* 1CC54 8002CC54 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1CC58 8002CC58 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1CC5C 8002CC5C 1280013C */  lui        $at, %hi(abortfile)
    /* 1CC60 8002CC60 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1CC64 8002CC64 02010224 */  addiu      $v0, $zero, 0x102
    /* 1CC68 8002CC68 1280013C */  lui        $at, %hi(abortline)
    /* 1CC6C 8002CC6C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1CC70 8002CC70 0F95000C */  jal        abortmessage
    /* 1CC74 8002CC74 00000000 */   nop
  .L8002CC78:
    /* 1CC78 8002CC78 641D858F */  lw         $a1, %gp_rel(maxstreamblocks)($gp)
    /* 1CC7C 8002CC7C 7C1D90AF */  sw         $s0, %gp_rel(cdrs)($gp)
    /* 1CC80 8002CC80 781D90AF */  sw         $s0, %gp_rel(cdms)($gp)
    /* 1CC84 8002CC84 E5BC000C */  jal        initstreamblocks
    /* 1CC88 8002CC88 A0000426 */   addiu     $a0, $s0, 0xA0
    /* 1CC8C 8002CC8C 641D838F */  lw         $v1, %gp_rel(maxstreamblocks)($gp)
    /* 1CC90 8002CC90 00000000 */  nop
    /* 1CC94 8002CC94 80100300 */  sll        $v0, $v1, 2
    /* 1CC98 8002CC98 21104300 */  addu       $v0, $v0, $v1
    /* 1CC9C 8002CC9C C0100200 */  sll        $v0, $v0, 3
    /* 1CCA0 8002CCA0 23104300 */  subu       $v0, $v0, $v1
    /* 1CCA4 8002CCA4 80100200 */  sll        $v0, $v0, 2
    /* 1CCA8 8002CCA8 0F004224 */  addiu      $v0, $v0, 0xF
    /* 1CCAC 8002CCAC F0FF4230 */  andi       $v0, $v0, 0xFFF0
    /* 1CCB0 8002CCB0 A0004224 */  addiu      $v0, $v0, 0xA0
    /* 1CCB4 8002CCB4 23182202 */  subu       $v1, $s1, $v0
    /* 1CCB8 8002CCB8 21100202 */  addu       $v0, $s0, $v0
    /* 1CCBC 8002CCBC 3C0003AE */  sw         $v1, 0x3C($s0)
    /* 1CCC0 8002CCC0 040002AE */  sw         $v0, 0x4($s0)
    /* 1CCC4 8002CCC4 21101102 */  addu       $v0, $s0, $s1
    /* 1CCC8 8002CCC8 080002AE */  sw         $v0, 0x8($s0)
    /* 1CCCC 8002CCCC 2C0012AE */  sw         $s2, 0x2C($s0)
    /* 1CCD0 8002CCD0 0400028E */  lw         $v0, 0x4($s0)
    /* 1CCD4 8002CCD4 00000000 */  nop
    /* 1CCD8 8002CCD8 180002AE */  sw         $v0, 0x18($s0)
    /* 1CCDC 8002CCDC 1800028E */  lw         $v0, 0x18($s0)
    /* 1CCE0 8002CCE0 00000000 */  nop
    /* 1CCE4 8002CCE4 140002AE */  sw         $v0, 0x14($s0)
    /* 1CCE8 8002CCE8 1400028E */  lw         $v0, 0x14($s0)
    /* 1CCEC 8002CCEC 00000000 */  nop
    /* 1CCF0 8002CCF0 0C0002AE */  sw         $v0, 0xC($s0)
    /* 1CCF4 8002CCF4 0C00028E */  lw         $v0, 0xC($s0)
    /* 1CCF8 8002CCF8 00000000 */  nop
    /* 1CCFC 8002CCFC 100002AE */  sw         $v0, 0x10($s0)
    /* 1CD00 8002CD00 280000AE */  sw         $zero, 0x28($s0)
    /* 1CD04 8002CD04 400013AE */  sw         $s3, 0x40($s0)
    /* 1CD08 8002CD08 1C0000AE */  sw         $zero, 0x1C($s0)
    /* 1CD0C 8002CD0C 700000AE */  sw         $zero, 0x70($s0)
    /* 1CD10 8002CD10 780000AE */  sw         $zero, 0x78($s0)
    /* 1CD14 8002CD14 7800028E */  lw         $v0, 0x78($s0)
    /* 1CD18 8002CD18 00000000 */  nop
    /* 1CD1C 8002CD1C 7C0002AE */  sw         $v0, 0x7C($s0)
    /* 1CD20 8002CD20 07000224 */  addiu      $v0, $zero, 0x7
    /* 1CD24 8002CD24 200002AE */  sw         $v0, 0x20($s0)
    /* 1CD28 8002CD28 240000AE */  sw         $zero, 0x24($s0)
    /* 1CD2C 8002CD2C 380000AE */  sw         $zero, 0x38($s0)
    /* 1CD30 8002CD30 3800028E */  lw         $v0, 0x38($s0)
    /* 1CD34 8002CD34 00000000 */  nop
    /* 1CD38 8002CD38 340002AE */  sw         $v0, 0x34($s0)
    /* 1CD3C 8002CD3C 940000AE */  sw         $zero, 0x94($s0)
    /* 1CD40 8002CD40 9400028E */  lw         $v0, 0x94($s0)
    /* 1CD44 8002CD44 0380043C */  lui        $a0, %hi(PSXistreamreader)
    /* 1CD48 8002CD48 FCD88424 */  addiu      $a0, $a0, %lo(PSXistreamreader)
    /* 1CD4C 8002CD4C 0380053C */  lui        $a1, %hi(getstreamstatus)
    /* 1CD50 8002CD50 E0D8A524 */  addiu      $a1, $a1, %lo(getstreamstatus)
    /* 1CD54 8002CD54 0380063C */  lui        $a2, %hi(streamsetnotfull)
    /* 1CD58 8002CD58 BCF2C624 */  addiu      $a2, $a2, %lo(streamsetnotfull)
    /* 1CD5C 8002CD5C 6C1D80AF */  sw         $zero, %gp_rel(seekticks)($gp)
    /* 1CD60 8002CD60 681D80AF */  sw         $zero, %gp_rel(cdspeed)($gp)
    /* 1CD64 8002CD64 900002AE */  sw         $v0, 0x90($s0)
    /* 1CD68 8002CD68 840000AE */  sw         $zero, 0x84($s0)
    /* 1CD6C 8002CD6C 300000AE */  sw         $zero, 0x30($s0)
    /* 1CD70 8002CD70 0EA5000C */  jal        setstreameriofuncs
    /* 1CD74 8002CD74 00000000 */   nop
    /* 1CD78 8002CD78 21100002 */  addu       $v0, $s0, $zero
    /* 1CD7C 8002CD7C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1CD80 8002CD80 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1CD84 8002CD84 1800B28F */  lw         $s2, 0x18($sp)
    /* 1CD88 8002CD88 1400B18F */  lw         $s1, 0x14($sp)
    /* 1CD8C 8002CD8C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CD90 8002CD90 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1CD94 8002CD94 0800E003 */  jr         $ra
    /* 1CD98 8002CD98 00000000 */   nop
endlabel initstreamstructa
