.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching strrchr, 0x3C

glabel strrchr
    /* 410 80010410 2118E003 */  addu       $v1, $ra, $zero
    /* 414 80010414 2138A000 */  addu       $a3, $a1, $zero
    /* 418 80010418 1A001104 */  bal        strlen2 /* handwritten instruction */
    /* 41C 8001041C 21408000 */   addu      $t0, $a0, $zero
    /* 420 80010420 21104800 */  addu       $v0, $v0, $t0
  .L80010424:
    /* 424 80010424 00004580 */  lb         $a1, 0x0($v0)
    /* 428 80010428 00000000 */  nop
    /* 42C 8001042C 0500A710 */  beq        $a1, $a3, .L80010444
    /* 430 80010430 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 434 80010434 FBFF4814 */  bne        $v0, $t0, .L80010424
    /* 438 80010438 00000000 */   nop
    /* 43C 8001043C 08006000 */  jr         $v1
    /* 440 80010440 21100000 */   addu      $v0, $zero, $zero
  .L80010444:
    /* 444 80010444 08006000 */  jr         $v1
    /* 448 80010448 01004224 */   addiu     $v0, $v0, 0x1
endlabel strrchr
