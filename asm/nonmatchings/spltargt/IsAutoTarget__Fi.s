.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsAutoTarget__Fi, 0x38

glabel IsAutoTarget__Fi
    /* 9F0F0 800AF0F0 21280000 */  addu       $a1, $zero, $zero
    /* 9F0F4 800AF0F4 0D80033C */  lui        $v1, %hi(D_800CD650)
    /* 9F0F8 800AF0F8 50D66324 */  addiu      $v1, $v1, %lo(D_800CD650)
  .L800AF0FC:
    /* 9F0FC 800AF0FC 0000628C */  lw         $v0, 0x0($v1)
    /* 9F100 800AF100 00000000 */  nop
    /* 9F104 800AF104 06004410 */  beq        $v0, $a0, .L800AF120
    /* 9F108 800AF108 01000224 */   addiu     $v0, $zero, 0x1
    /* 9F10C 800AF10C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 9F110 800AF110 0C00A228 */  slti       $v0, $a1, 0xC
    /* 9F114 800AF114 F9FF4014 */  bnez       $v0, .L800AF0FC
    /* 9F118 800AF118 04006324 */   addiu     $v1, $v1, 0x4
    /* 9F11C 800AF11C 21100000 */  addu       $v0, $zero, $zero
  .L800AF120:
    /* 9F120 800AF120 0800E003 */  jr         $ra
    /* 9F124 800AF124 00000000 */   nop
endlabel IsAutoTarget__Fi
