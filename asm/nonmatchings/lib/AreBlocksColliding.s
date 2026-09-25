.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AreBlocksColliding, 0x58

glabel AreBlocksColliding
    /* 12610 80022610 0800A68C */  lw         $a2, 0x8($a1)
    /* 12614 80022614 0C00A28C */  lw         $v0, 0xC($a1)
    /* 12618 80022618 0800858C */  lw         $a1, 0x8($a0)
    /* 1261C 8002261C 2110C200 */  addu       $v0, $a2, $v0
    /* 12620 80022620 2B10A200 */  sltu       $v0, $a1, $v0
    /* 12624 80022624 06004010 */  beqz       $v0, .L80022640
    /* 12628 80022628 00000000 */   nop
    /* 1262C 8002262C 2B10A600 */  sltu       $v0, $a1, $a2
    /* 12630 80022630 03004014 */  bnez       $v0, .L80022640
    /* 12634 80022634 00000000 */   nop
    /* 12638 80022638 98890008 */  j          .L80022660
    /* 1263C 8002263C 01000234 */   ori       $v0, $zero, 0x1
  .L80022640:
    /* 12640 80022640 0C00838C */  lw         $v1, 0xC($a0)
    /* 12644 80022644 00000000 */  nop
    /* 12648 80022648 2118A300 */  addu       $v1, $a1, $v1
    /* 1264C 8002264C 2B18C300 */  sltu       $v1, $a2, $v1
    /* 12650 80022650 03006010 */  beqz       $v1, .L80022660
    /* 12654 80022654 21100000 */   addu      $v0, $zero, $zero
    /* 12658 80022658 2B10C500 */  sltu       $v0, $a2, $a1
    /* 1265C 8002265C 01004238 */  xori       $v0, $v0, 0x1
  .L80022660:
    /* 12660 80022660 0800E003 */  jr         $ra
    /* 12664 80022664 00000000 */   nop
endlabel AreBlocksColliding
