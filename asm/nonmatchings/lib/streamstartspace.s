.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamstartspace, 0x50

glabel streamstartspace
    /* 1F028 8002F028 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F02C 8002F02C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1F030 8002F030 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1F034 8002F034 A2BB000C */  jal        releasechunks
    /* 1F038 8002F038 21808000 */   addu      $s0, $a0, $zero
    /* 1F03C 8002F03C 1800038E */  lw         $v1, 0x18($s0)
    /* 1F040 8002F040 0C00028E */  lw         $v0, 0xC($s0)
    /* 1F044 8002F044 00000000 */  nop
    /* 1F048 8002F048 2B104300 */  sltu       $v0, $v0, $v1
    /* 1F04C 8002F04C 05004014 */  bnez       $v0, .L8002F064
    /* 1F050 8002F050 21100000 */   addu      $v0, $zero, $zero
    /* 1F054 8002F054 1800038E */  lw         $v1, 0x18($s0)
    /* 1F058 8002F058 0400028E */  lw         $v0, 0x4($s0)
    /* 1F05C 8002F05C 00000000 */  nop
    /* 1F060 8002F060 23106200 */  subu       $v0, $v1, $v0
  .L8002F064:
    /* 1F064 8002F064 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1F068 8002F068 1000B08F */  lw         $s0, 0x10($sp)
    /* 1F06C 8002F06C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F070 8002F070 0800E003 */  jr         $ra
    /* 1F074 8002F074 00000000 */   nop
endlabel streamstartspace
