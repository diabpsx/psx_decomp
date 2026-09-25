.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching removeexit, 0x3C

glabel removeexit
    /* 1F740 8002F740 21280000 */  addu       $a1, $zero, $zero
    /* 1F744 8002F744 0B80033C */  lui        $v1, %hi(D_800B6FC4)
    /* 1F748 8002F748 C46F6324 */  addiu      $v1, $v1, %lo(D_800B6FC4)
  .L8002F74C:
    /* 1F74C 8002F74C 0000628C */  lw         $v0, 0x0($v1)
    /* 1F750 8002F750 00000000 */  nop
    /* 1F754 8002F754 03004414 */  bne        $v0, $a0, .L8002F764
    /* 1F758 8002F758 00000000 */   nop
    /* 1F75C 8002F75C DDBD0008 */  j          .L8002F774
    /* 1F760 8002F760 000060AC */   sw        $zero, 0x0($v1)
  .L8002F764:
    /* 1F764 8002F764 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1F768 8002F768 2000A228 */  slti       $v0, $a1, 0x20
    /* 1F76C 8002F76C F7FF4014 */  bnez       $v0, .L8002F74C
    /* 1F770 8002F770 04006324 */   addiu     $v1, $v1, 0x4
  .L8002F774:
    /* 1F774 8002F774 0800E003 */  jr         $ra
    /* 1F778 8002F778 00000000 */   nop
endlabel removeexit
