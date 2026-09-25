.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AlterBirdPos__FP10BIRDSTRUCTUc, 0x158

glabel AlterBirdPos__FP10BIRDSTRUCTUc
    /* 9B73C 800AB73C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 9B740 800AB740 2000B0AF */  sw         $s0, 0x20($sp)
    /* 9B744 800AB744 21808000 */  addu       $s0, $a0, $zero
    /* 9B748 800AB748 2400B1AF */  sw         $s1, 0x24($sp)
    /* 9B74C 800AB74C 2188A000 */  addu       $s1, $a1, $zero
    /* 9B750 800AB750 3000BFAF */  sw         $ra, 0x30($sp)
    /* 9B754 800AB754 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 9B758 800AB758 2800B2AF */  sw         $s2, 0x28($sp)
    /* 9B75C 800AB75C 0C000282 */  lb         $v0, 0xC($s0)
    /* 9B760 800AB760 FF002332 */  andi       $v1, $s1, 0xFF
    /* 9B764 800AB764 1280013C */  lui        $at, %hi(offset_x)
    /* 9B768 800AB768 21082200 */  addu       $at, $at, $v0
    /* 9B76C 800AB76C A8C23280 */  lb         $s2, %lo(offset_x)($at)
    /* 9B770 800AB770 1280013C */  lui        $at, %hi(offset_y)
    /* 9B774 800AB774 21082200 */  addu       $at, $at, $v0
    /* 9B778 800AB778 B0C23380 */  lb         $s3, %lo(offset_y)($at)
    /* 9B77C 800AB77C 04006010 */  beqz       $v1, .L800AB790
    /* 9B780 800AB780 00000000 */   nop
    /* 9B784 800AB784 10000292 */  lbu        $v0, 0x10($s0)
    /* 9B788 800AB788 E7AD0208 */  j          .L800AB79C
    /* 9B78C 800AB78C FEFF4224 */   addiu     $v0, $v0, -0x2
  .L800AB790:
    /* 9B790 800AB790 10000292 */  lbu        $v0, 0x10($s0)
    /* 9B794 800AB794 00000000 */  nop
    /* 9B798 800AB798 FFFF4224 */  addiu      $v0, $v0, -0x1
  .L800AB79C:
    /* 9B79C 800AB79C 100002A2 */  sb         $v0, 0x10($s0)
    /* 9B7A0 800AB7A0 10000282 */  lb         $v0, 0x10($s0)
    /* 9B7A4 800AB7A4 00000000 */  nop
    /* 9B7A8 800AB7A8 2700401C */  bgtz       $v0, .L800AB848
    /* 9B7AC 800AB7AC 00000000 */   nop
    /* 9B7B0 800AB7B0 280B828F */  lw         $v0, %gp_rel(D_8011B2A8)($gp)
    /* 9B7B4 800AB7B4 00000000 */  nop
    /* 9B7B8 800AB7B8 02004010 */  beqz       $v0, .L800AB7C4
    /* 9B7BC 800AB7BC 0A000424 */   addiu     $a0, $zero, 0xA
    /* 9B7C0 800AB7C0 05000424 */  addiu      $a0, $zero, 0x5
  .L800AB7C4:
    /* 9B7C4 800AB7C4 C9F6000C */  jal        ENG_random__Fl
    /* 9B7C8 800AB7C8 00000000 */   nop
    /* 9B7CC 800AB7CC 05004224 */  addiu      $v0, $v0, 0x5
    /* 9B7D0 800AB7D0 100002A2 */  sb         $v0, 0x10($s0)
    /* 9B7D4 800AB7D4 0C000482 */  lb         $a0, 0xC($s0)
    /* 9B7D8 800AB7D8 0D000382 */  lb         $v1, 0xD($s0)
    /* 9B7DC 800AB7DC 00000000 */  nop
    /* 9B7E0 800AB7E0 19006410 */  beq        $v1, $a0, .L800AB848
    /* 9B7E4 800AB7E4 21288000 */   addu      $a1, $a0, $zero
    /* 9B7E8 800AB7E8 FF002232 */  andi       $v0, $s1, 0xFF
    /* 9B7EC 800AB7EC 04004010 */  beqz       $v0, .L800AB800
    /* 9B7F0 800AB7F0 00000000 */   nop
    /* 9B7F4 800AB7F4 0E000292 */  lbu        $v0, 0xE($s0)
    /* 9B7F8 800AB7F8 06AE0208 */  j          .L800AB818
    /* 9B7FC 800AB7FC 2110A200 */   addu      $v0, $a1, $v0
  .L800AB800:
    /* 9B800 800AB800 2A108300 */  slt        $v0, $a0, $v1
    /* 9B804 800AB804 04004014 */  bnez       $v0, .L800AB818
    /* 9B808 800AB808 0100A224 */   addiu     $v0, $a1, 0x1
    /* 9B80C 800AB80C 2A106400 */  slt        $v0, $v1, $a0
    /* 9B810 800AB810 02004010 */  beqz       $v0, .L800AB81C
    /* 9B814 800AB814 FFFFA224 */   addiu     $v0, $a1, -0x1
  .L800AB818:
    /* 9B818 800AB818 0C0002A2 */  sb         $v0, 0xC($s0)
  .L800AB81C:
    /* 9B81C 800AB81C 0C000282 */  lb         $v0, 0xC($s0)
    /* 9B820 800AB820 00000000 */  nop
    /* 9B824 800AB824 03004104 */  bgez       $v0, .L800AB834
    /* 9B828 800AB828 21184000 */   addu      $v1, $v0, $zero
    /* 9B82C 800AB82C 11AE0208 */  j          .L800AB844
    /* 9B830 800AB830 08006224 */   addiu     $v0, $v1, 0x8
  .L800AB834:
    /* 9B834 800AB834 08004228 */  slti       $v0, $v0, 0x8
    /* 9B838 800AB838 04004014 */  bnez       $v0, .L800AB84C
    /* 9B83C 800AB83C 21200002 */   addu      $a0, $s0, $zero
    /* 9B840 800AB840 F8FF6224 */  addiu      $v0, $v1, -0x8
  .L800AB844:
    /* 9B844 800AB844 0C0002A2 */  sb         $v0, 0xC($s0)
  .L800AB848:
    /* 9B848 800AB848 21200002 */  addu       $a0, $s0, $zero
  .L800AB84C:
    /* 9B84C 800AB84C 04000296 */  lhu        $v0, 0x4($s0)
    /* 9B850 800AB850 06008694 */  lhu        $a2, 0x6($a0)
    /* 9B854 800AB854 21105200 */  addu       $v0, $v0, $s2
    /* 9B858 800AB858 2130D300 */  addu       $a2, $a2, $s3
    /* 9B85C 800AB85C 060086A4 */  sh         $a2, 0x6($a0)
    /* 9B860 800AB860 00340600 */  sll        $a2, $a2, 16
    /* 9B864 800AB864 040082A4 */  sh         $v0, 0x4($a0)
    /* 9B868 800AB868 04008584 */  lh         $a1, 0x4($a0)
    /* 9B86C 800AB86C 25AE020C */  jal        BirdWorld__FP10BIRDSTRUCTii
    /* 9B870 800AB870 03340600 */   sra       $a2, $a2, 16
    /* 9B874 800AB874 3000BF8F */  lw         $ra, 0x30($sp)
    /* 9B878 800AB878 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 9B87C 800AB87C 2800B28F */  lw         $s2, 0x28($sp)
    /* 9B880 800AB880 2400B18F */  lw         $s1, 0x24($sp)
    /* 9B884 800AB884 2000B08F */  lw         $s0, 0x20($sp)
    /* 9B888 800AB888 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 9B88C 800AB88C 0800E003 */  jr         $ra
    /* 9B890 800AB890 00000000 */   nop
endlabel AlterBirdPos__FP10BIRDSTRUCTUc
