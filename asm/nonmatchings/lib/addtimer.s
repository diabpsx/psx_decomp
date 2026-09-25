.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching addtimer, 0x74

glabel addtimer
    /* 1FBF4 8002FBF4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FBF8 8002FBF8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FBFC 8002FBFC 21280000 */  addu       $a1, $zero, $zero
    /* 1FC00 8002FC00 0B80033C */  lui        $v1, %hi(tmrsub)
    /* 1FC04 8002FC04 44706324 */  addiu      $v1, $v1, %lo(tmrsub)
  .L8002FC08:
    /* 1FC08 8002FC08 0000628C */  lw         $v0, 0x0($v1)
    /* 1FC0C 8002FC0C 00000000 */  nop
    /* 1FC10 8002FC10 03004014 */  bnez       $v0, .L8002FC20
    /* 1FC14 8002FC14 0100A524 */   addiu     $a1, $a1, 0x1
    /* 1FC18 8002FC18 16BF0008 */  j          .L8002FC58
    /* 1FC1C 8002FC1C 000064AC */   sw        $a0, 0x0($v1)
  .L8002FC20:
    /* 1FC20 8002FC20 0800A228 */  slti       $v0, $a1, 0x8
    /* 1FC24 8002FC24 F8FF4014 */  bnez       $v0, .L8002FC08
    /* 1FC28 8002FC28 04006324 */   addiu     $v1, $v1, 0x4
    /* 1FC2C 8002FC2C 1180023C */  lui        $v0, %hi(D_8010FF18)
    /* 1FC30 8002FC30 18FF4224 */  addiu      $v0, $v0, %lo(D_8010FF18)
    /* 1FC34 8002FC34 1280013C */  lui        $at, %hi(abortfile)
    /* 1FC38 8002FC38 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1FC3C 8002FC3C 6F000224 */  addiu      $v0, $zero, 0x6F
    /* 1FC40 8002FC40 1180043C */  lui        $a0, %hi(D_8010FF28)
    /* 1FC44 8002FC44 28FF8424 */  addiu      $a0, $a0, %lo(D_8010FF28)
    /* 1FC48 8002FC48 1280013C */  lui        $at, %hi(abortline)
    /* 1FC4C 8002FC4C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1FC50 8002FC50 0F95000C */  jal        abortmessage
    /* 1FC54 8002FC54 00000000 */   nop
  .L8002FC58:
    /* 1FC58 8002FC58 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FC5C 8002FC5C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FC60 8002FC60 0800E003 */  jr         $ra
    /* 1FC64 8002FC64 00000000 */   nop
endlabel addtimer
