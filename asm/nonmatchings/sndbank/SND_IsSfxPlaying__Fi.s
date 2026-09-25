.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SND_IsSfxPlaying__Fi, 0x3C

glabel SND_IsSfxPlaying__Fi
    /* 8A6EC 8009A6EC 01008424 */  addiu      $a0, $a0, 0x1
    /* 8A6F0 8009A6F0 02000524 */  addiu      $a1, $zero, 0x2
    /* 8A6F4 8009A6F4 1280033C */  lui        $v1, %hi(D_8011CD9C)
    /* 8A6F8 8009A6F8 9CCD6324 */  addiu      $v1, $v1, %lo(D_8011CD9C)
  .L8009A6FC:
    /* 8A6FC 8009A6FC 00006294 */  lhu        $v0, 0x0($v1)
    /* 8A700 8009A700 00000000 */  nop
    /* 8A704 8009A704 06004410 */  beq        $v0, $a0, .L8009A720
    /* 8A708 8009A708 01000224 */   addiu     $v0, $zero, 0x1
    /* 8A70C 8009A70C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 8A710 8009A710 1800A228 */  slti       $v0, $a1, 0x18
    /* 8A714 8009A714 F9FF4014 */  bnez       $v0, .L8009A6FC
    /* 8A718 8009A718 02006324 */   addiu     $v1, $v1, 0x2
    /* 8A71C 8009A71C 21100000 */  addu       $v0, $zero, $zero
  .L8009A720:
    /* 8A720 8009A720 0800E003 */  jr         $ra
    /* 8A724 8009A724 00000000 */   nop
endlabel SND_IsSfxPlaying__Fi
