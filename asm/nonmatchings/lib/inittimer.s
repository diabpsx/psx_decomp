.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching inittimer, 0x17C

glabel inittimer
    /* 1FD04 8002FD04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FD08 8002FD08 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1FD0C 8002FD0C 21808000 */  addu       $s0, $a0, $zero
    /* 1FD10 8002FD10 FFFF0226 */  addiu      $v0, $s0, -0x1
    /* 1FD14 8002FD14 1027422C */  sltiu      $v0, $v0, 0x2710
    /* 1FD18 8002FD18 0C004014 */  bnez       $v0, .L8002FD4C
    /* 1FD1C 8002FD1C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1FD20 8002FD20 1180043C */  lui        $a0, %hi(D_8010FF50)
    /* 1FD24 8002FD24 50FF8424 */  addiu      $a0, $a0, %lo(D_8010FF50)
    /* 1FD28 8002FD28 1180023C */  lui        $v0, %hi(D_8010FF40)
    /* 1FD2C 8002FD2C 40FF4224 */  addiu      $v0, $v0, %lo(D_8010FF40)
    /* 1FD30 8002FD30 1280013C */  lui        $at, %hi(abortfile)
    /* 1FD34 8002FD34 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1FD38 8002FD38 47000224 */  addiu      $v0, $zero, 0x47
    /* 1FD3C 8002FD3C 1280013C */  lui        $at, %hi(abortline)
    /* 1FD40 8002FD40 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1FD44 8002FD44 0F95000C */  jal        abortmessage
    /* 1FD48 8002FD48 21280002 */   addu      $a1, $s0, $zero
  .L8002FD4C:
    /* 1FD4C 8002FD4C 6346000C */  jal        EnterCriticalSection
    /* 1FD50 8002FD50 00000000 */   nop
    /* 1FD54 8002FD54 781E828F */  lw         $v0, %gp_rel(timerflag)($gp)
    /* 1FD58 8002FD58 00000000 */  nop
    /* 1FD5C 8002FD5C 19004014 */  bnez       $v0, .L8002FDC4
    /* 1FD60 8002FD60 4000033C */   lui       $v1, (0x409980 >> 16)
    /* 1FD64 8002FD64 1280013C */  lui        $at, %hi(finebios)
    /* 1FD68 8002FD68 80C520AC */  sw         $zero, %lo(finebios)($at)
    /* 1FD6C 8002FD6C 07000324 */  addiu      $v1, $zero, 0x7
    /* 1FD70 8002FD70 0B80023C */  lui        $v0, %hi(D_800B7060)
    /* 1FD74 8002FD74 60704224 */  addiu      $v0, $v0, %lo(D_800B7060)
  .L8002FD78:
    /* 1FD78 8002FD78 000040AC */  sw         $zero, 0x0($v0)
    /* 1FD7C 8002FD7C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1FD80 8002FD80 FDFF6104 */  bgez       $v1, .L8002FD78
    /* 1FD84 8002FD84 FCFF4224 */   addiu     $v0, $v0, -0x4
    /* 1FD88 8002FD88 0380053C */  lui        $a1, %hi(tmrint)
    /* 1FD8C 8002FD8C A4FEA524 */  addiu      $a1, $a1, %lo(tmrint)
    /* 1FD90 8002FD90 AB48000C */  jal        InterruptCallback
    /* 1FD94 8002FD94 06000424 */   addiu     $a0, $zero, 0x6
    /* 1FD98 8002FD98 01000224 */  addiu      $v0, $zero, 0x1
    /* 1FD9C 8002FD9C 781E82AF */  sw         $v0, %gp_rel(timerflag)($gp)
    /* 1FDA0 8002FDA0 0380043C */  lui        $a0, %hi(restoretimer)
    /* 1FDA4 8002FDA4 80FE8424 */  addiu      $a0, $a0, %lo(restoretimer)
    /* 1FDA8 8002FDA8 B6BD000C */  jal        addexit
    /* 1FDAC 8002FDAC 00000000 */   nop
    /* 1FDB0 8002FDB0 1180043C */  lui        $a0, %hi(D_8010FF80)
    /* 1FDB4 8002FDB4 80FF8424 */  addiu      $a0, $a0, %lo(D_8010FF80)
    /* 1FDB8 8002FDB8 5F97000C */  jal        print
    /* 1FDBC 8002FDBC 21280002 */   addu      $a1, $s0, $zero
    /* 1FDC0 8002FDC0 4000033C */  lui        $v1, (0x409980 >> 16)
  .L8002FDC4:
    /* 1FDC4 8002FDC4 80996334 */  ori        $v1, $v1, (0x409980 & 0xFFFF)
    /* 1FDC8 8002FDC8 1A007000 */  div        $zero, $v1, $s0
    /* 1FDCC 8002FDCC 02000016 */  bnez       $s0, .L8002FDD8
    /* 1FDD0 8002FDD0 00000000 */   nop
    /* 1FDD4 8002FDD4 0D000700 */  break      7
  .L8002FDD8:
    /* 1FDD8 8002FDD8 FFFF0124 */  addiu      $at, $zero, -0x1
    /* 1FDDC 8002FDDC 04000116 */  bne        $s0, $at, .L8002FDF0
    /* 1FDE0 8002FDE0 0080013C */   lui       $at, (0x80000000 >> 16)
    /* 1FDE4 8002FDE4 02006114 */  bne        $v1, $at, .L8002FDF0
    /* 1FDE8 8002FDE8 00000000 */   nop
    /* 1FDEC 8002FDEC 0D000600 */  break      6
  .L8002FDF0:
    /* 1FDF0 8002FDF0 12100000 */  mflo       $v0
    /* 1FDF4 8002FDF4 00000000 */  nop
    /* 1FDF8 8002FDF8 00000000 */  nop
    /* 1FDFC 8002FDFC 1A006200 */  div        $zero, $v1, $v0
    /* 1FE00 8002FE00 02004014 */  bnez       $v0, .L8002FE0C
    /* 1FE04 8002FE04 00000000 */   nop
    /* 1FE08 8002FE08 0D000700 */  break      7
  .L8002FE0C:
    /* 1FE0C 8002FE0C FFFF0124 */  addiu      $at, $zero, -0x1
    /* 1FE10 8002FE10 04004114 */  bne        $v0, $at, .L8002FE24
    /* 1FE14 8002FE14 0080013C */   lui       $at, (0x80000000 >> 16)
    /* 1FE18 8002FE18 02006114 */  bne        $v1, $at, .L8002FE24
    /* 1FE1C 8002FE1C 00000000 */   nop
    /* 1FE20 8002FE20 0D000600 */  break      6
  .L8002FE24:
    /* 1FE24 8002FE24 12180000 */  mflo       $v1
    /* 1FE28 8002FE28 00100624 */  addiu      $a2, $zero, 0x1000
    /* 1FE2C 8002FE2C D82280AF */  sw         $zero, %gp_rel(reentryflag)($gp)
    /* 1FE30 8002FE30 00F2043C */  lui        $a0, (0xF2000002 >> 16)
    /* 1FE34 8002FE34 02008434 */  ori        $a0, $a0, (0xF2000002 & 0xFFFF)
    /* 1FE38 8002FE38 1280013C */  lui        $at, %hi(timerperiod)
    /* 1FE3C 8002FE3C A0C522AC */  sw         $v0, %lo(timerperiod)($at)
    /* 1FE40 8002FE40 1280013C */  lui        $at, %hi(timerhz)
    /* 1FE44 8002FE44 9CC523AC */  sw         $v1, %lo(timerhz)($at)
    /* 1FE48 8002FE48 FF83000C */  jal        SetRCnt
    /* 1FE4C 8002FE4C FFFF4530 */   andi      $a1, $v0, 0xFFFF
    /* 1FE50 8002FE50 00F2043C */  lui        $a0, (0xF2000002 >> 16)
    /* 1FE54 8002FE54 3484000C */  jal        StartRCnt
    /* 1FE58 8002FE58 02008434 */   ori       $a0, $a0, (0xF2000002 & 0xFFFF)
    /* 1FE5C 8002FE5C 6746000C */  jal        ExitCriticalSection
    /* 1FE60 8002FE60 00000000 */   nop
    /* 1FE64 8002FE64 24C0000C */  jal        resettick
    /* 1FE68 8002FE68 00000000 */   nop
    /* 1FE6C 8002FE6C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1FE70 8002FE70 1000B08F */  lw         $s0, 0x10($sp)
    /* 1FE74 8002FE74 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FE78 8002FE78 0800E003 */  jr         $ra
    /* 1FE7C 8002FE7C 00000000 */   nop
endlabel inittimer
