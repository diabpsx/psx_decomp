.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching addexit, 0x68

glabel addexit
    /* 1F6D8 8002F6D8 21280000 */  addu       $a1, $zero, $zero
    /* 1F6DC 8002F6DC 0B80033C */  lui        $v1, %hi(D_800B6FC4)
    /* 1F6E0 8002F6E0 C46F6324 */  addiu      $v1, $v1, %lo(D_800B6FC4)
  .L8002F6E4:
    /* 1F6E4 8002F6E4 0000628C */  lw         $v0, 0x0($v1)
    /* 1F6E8 8002F6E8 00000000 */  nop
    /* 1F6EC 8002F6EC 12004410 */  beq        $v0, $a0, .L8002F738
    /* 1F6F0 8002F6F0 00000000 */   nop
    /* 1F6F4 8002F6F4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1F6F8 8002F6F8 2000A228 */  slti       $v0, $a1, 0x20
    /* 1F6FC 8002F6FC F9FF4014 */  bnez       $v0, .L8002F6E4
    /* 1F700 8002F700 04006324 */   addiu     $v1, $v1, 0x4
    /* 1F704 8002F704 21280000 */  addu       $a1, $zero, $zero
    /* 1F708 8002F708 0B80033C */  lui        $v1, %hi(D_800B6FC4)
    /* 1F70C 8002F70C C46F6324 */  addiu      $v1, $v1, %lo(D_800B6FC4)
  .L8002F710:
    /* 1F710 8002F710 0000628C */  lw         $v0, 0x0($v1)
    /* 1F714 8002F714 00000000 */  nop
    /* 1F718 8002F718 03004014 */  bnez       $v0, .L8002F728
    /* 1F71C 8002F71C 00000000 */   nop
    /* 1F720 8002F720 CEBD0008 */  j          .L8002F738
    /* 1F724 8002F724 000064AC */   sw        $a0, 0x0($v1)
  .L8002F728:
    /* 1F728 8002F728 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1F72C 8002F72C 2000A228 */  slti       $v0, $a1, 0x20
    /* 1F730 8002F730 F7FF4014 */  bnez       $v0, .L8002F710
    /* 1F734 8002F734 04006324 */   addiu     $v1, $v1, 0x4
  .L8002F738:
    /* 1F738 8002F738 0800E003 */  jr         $ra
    /* 1F73C 8002F73C 00000000 */   nop
endlabel addexit
