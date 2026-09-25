.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching deltimer, 0x3C

glabel deltimer
    /* 1FC68 8002FC68 21280000 */  addu       $a1, $zero, $zero
    /* 1FC6C 8002FC6C 0B80033C */  lui        $v1, %hi(tmrsub)
    /* 1FC70 8002FC70 44706324 */  addiu      $v1, $v1, %lo(tmrsub)
  .L8002FC74:
    /* 1FC74 8002FC74 0000628C */  lw         $v0, 0x0($v1)
    /* 1FC78 8002FC78 00000000 */  nop
    /* 1FC7C 8002FC7C 03004414 */  bne        $v0, $a0, .L8002FC8C
    /* 1FC80 8002FC80 00000000 */   nop
    /* 1FC84 8002FC84 27BF0008 */  j          .L8002FC9C
    /* 1FC88 8002FC88 000060AC */   sw        $zero, 0x0($v1)
  .L8002FC8C:
    /* 1FC8C 8002FC8C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1FC90 8002FC90 0800A228 */  slti       $v0, $a1, 0x8
    /* 1FC94 8002FC94 F7FF4014 */  bnez       $v0, .L8002FC74
    /* 1FC98 8002FC98 04006324 */   addiu     $v1, $v1, 0x4
  .L8002FC9C:
    /* 1FC9C 8002FC9C 0800E003 */  jr         $ra
    /* 1FCA0 8002FCA0 00000000 */   nop
endlabel deltimer
