.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SortSmith__Fv, 0x184

glabel SortSmith__Fv
    /* 3B700 8004B700 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B704 8004B704 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B708 8004B708 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3B70C 8004B70C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 3B710 8004B710 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3B714 8004B714 2400B3AF */  sw         $s3, 0x24($sp)
    /* 3B718 8004B718 2000B2AF */  sw         $s2, 0x20($sp)
    /* 3B71C 8004B71C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 3B720 8004B720 00110300 */  sll        $v0, $v1, 4
    /* 3B724 8004B724 21104300 */  addu       $v0, $v0, $v1
    /* 3B728 8004B728 C0100200 */  sll        $v0, $v0, 3
    /* 3B72C 8004B72C 23104300 */  subu       $v0, $v0, $v1
    /* 3B730 8004B730 00210200 */  sll        $a0, $v0, 4
    /* 3B734 8004B734 0E80013C */  lui        $at, %hi(_smithitem + 0x98)
    /* 3B738 8004B738 21082400 */  addu       $at, $at, $a0
    /* 3B73C 8004B73C C0E42384 */  lh         $v1, %lo(_smithitem + 0x98)($at)
    /* 3B740 8004B740 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3B744 8004B744 13006210 */  beq        $v1, $v0, .L8004B794
    /* 3B748 8004B748 21880000 */   addu      $s1, $zero, $zero
    /* 3B74C 8004B74C FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 3B750 8004B750 01002326 */  addiu      $v1, $s1, 0x1
  .L8004B754:
    /* 3B754 8004B754 14006228 */  slti       $v0, $v1, 0x14
    /* 3B758 8004B758 0E004010 */  beqz       $v0, .L8004B794
    /* 3B75C 8004B75C 01006224 */   addiu     $v0, $v1, 0x1
    /* 3B760 8004B760 21886000 */  addu       $s1, $v1, $zero
    /* 3B764 8004B764 C0180200 */  sll        $v1, $v0, 3
    /* 3B768 8004B768 23186200 */  subu       $v1, $v1, $v0
    /* 3B76C 8004B76C 80180300 */  sll        $v1, $v1, 2
    /* 3B770 8004B770 23186200 */  subu       $v1, $v1, $v0
    /* 3B774 8004B774 80180300 */  sll        $v1, $v1, 2
    /* 3B778 8004B778 21186400 */  addu       $v1, $v1, $a0
    /* 3B77C 8004B77C 0E80013C */  lui        $at, %hi(_smithitem + 0x2C)
    /* 3B780 8004B780 21082300 */  addu       $at, $at, $v1
    /* 3B784 8004B784 54E42284 */  lh         $v0, %lo(_smithitem + 0x2C)($at)
    /* 3B788 8004B788 00000000 */  nop
    /* 3B78C 8004B78C F1FF4514 */  bne        $v0, $a1, .L8004B754
    /* 3B790 8004B790 01002326 */   addiu     $v1, $s1, 0x1
  .L8004B794:
    /* 3B794 8004B794 3300201A */  blez       $s1, .L8004B864
    /* 3B798 8004B798 01000524 */   addiu     $a1, $zero, 0x1
    /* 3B79C 8004B79C 0E80123C */  lui        $s2, %hi(_smithitem)
    /* 3B7A0 8004B7A0 28E45226 */  addiu      $s2, $s2, %lo(_smithitem)
    /* 3B7A4 8004B7A4 6C005326 */  addiu      $s3, $s2, 0x6C
  .L8004B7A8:
    /* 3B7A8 8004B7A8 2900201A */  blez       $s1, .L8004B850
    /* 3B7AC 8004B7AC 21200000 */   addu      $a0, $zero, $zero
    /* 3B7B0 8004B7B0 C0100400 */  sll        $v0, $a0, 3
  .L8004B7B4:
    /* 3B7B4 8004B7B4 23104400 */  subu       $v0, $v0, $a0
    /* 3B7B8 8004B7B8 80100200 */  sll        $v0, $v0, 2
    /* 3B7BC 8004B7BC 23104400 */  subu       $v0, $v0, $a0
    /* 3B7C0 8004B7C0 80380200 */  sll        $a3, $v0, 2
    /* 3B7C4 8004B7C4 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B7C8 8004B7C8 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B7CC 8004B7CC 01009024 */  addiu      $s0, $a0, 0x1
    /* 3B7D0 8004B7D0 00110300 */  sll        $v0, $v1, 4
    /* 3B7D4 8004B7D4 21104300 */  addu       $v0, $v0, $v1
    /* 3B7D8 8004B7D8 C0100200 */  sll        $v0, $v0, 3
    /* 3B7DC 8004B7DC 23104300 */  subu       $v0, $v0, $v1
    /* 3B7E0 8004B7E0 00310200 */  sll        $a2, $v0, 4
    /* 3B7E4 8004B7E4 2118E600 */  addu       $v1, $a3, $a2
    /* 3B7E8 8004B7E8 C0101000 */  sll        $v0, $s0, 3
    /* 3B7EC 8004B7EC 23105000 */  subu       $v0, $v0, $s0
    /* 3B7F0 8004B7F0 80100200 */  sll        $v0, $v0, 2
    /* 3B7F4 8004B7F4 23105000 */  subu       $v0, $v0, $s0
    /* 3B7F8 8004B7F8 80100200 */  sll        $v0, $v0, 2
    /* 3B7FC 8004B7FC 21104600 */  addu       $v0, $v0, $a2
    /* 3B800 8004B800 0E80013C */  lui        $at, %hi(_smithitem + 0x2E)
    /* 3B804 8004B804 21082300 */  addu       $at, $at, $v1
    /* 3B808 8004B808 56E42384 */  lh         $v1, %lo(_smithitem + 0x2E)($at)
    /* 3B80C 8004B80C 0E80013C */  lui        $at, %hi(_smithitem + 0x2E)
    /* 3B810 8004B810 21082200 */  addu       $at, $at, $v0
    /* 3B814 8004B814 56E42284 */  lh         $v0, %lo(_smithitem + 0x2E)($at)
    /* 3B818 8004B818 00000000 */  nop
    /* 3B81C 8004B81C 2A104300 */  slt        $v0, $v0, $v1
    /* 3B820 8004B820 08004010 */  beqz       $v0, .L8004B844
    /* 3B824 8004B824 21200002 */   addu      $a0, $s0, $zero
    /* 3B828 8004B828 2120F200 */  addu       $a0, $a3, $s2
    /* 3B82C 8004B82C 2128D300 */  addu       $a1, $a2, $s3
    /* 3B830 8004B830 2120C400 */  addu       $a0, $a2, $a0
    /* 3B834 8004B834 6C26010C */  jal        BubbleSwapItem__FP10ItemStructT0
    /* 3B838 8004B838 2128A700 */   addu      $a1, $a1, $a3
    /* 3B83C 8004B83C 21280000 */  addu       $a1, $zero, $zero
    /* 3B840 8004B840 21200002 */  addu       $a0, $s0, $zero
  .L8004B844:
    /* 3B844 8004B844 2A109100 */  slt        $v0, $a0, $s1
    /* 3B848 8004B848 DAFF4014 */  bnez       $v0, .L8004B7B4
    /* 3B84C 8004B84C C0100400 */   sll       $v0, $a0, 3
  .L8004B850:
    /* 3B850 8004B850 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 3B854 8004B854 0300201A */  blez       $s1, .L8004B864
    /* 3B858 8004B858 FF00A230 */   andi      $v0, $a1, 0xFF
    /* 3B85C 8004B85C D2FF4010 */  beqz       $v0, .L8004B7A8
    /* 3B860 8004B860 01000524 */   addiu     $a1, $zero, 0x1
  .L8004B864:
    /* 3B864 8004B864 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3B868 8004B868 2400B38F */  lw         $s3, 0x24($sp)
    /* 3B86C 8004B86C 2000B28F */  lw         $s2, 0x20($sp)
    /* 3B870 8004B870 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3B874 8004B874 1800B08F */  lw         $s0, 0x18($sp)
    /* 3B878 8004B878 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3B87C 8004B87C 0800E003 */  jr         $ra
    /* 3B880 8004B880 00000000 */   nop
endlabel SortSmith__Fv
