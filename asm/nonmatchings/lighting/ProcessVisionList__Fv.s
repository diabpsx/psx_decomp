.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ProcessVisionList__Fv, 0x208

glabel ProcessVisionList__Fv
    /* 3D754 8004D754 A0118293 */  lbu        $v0, %gp_rel(dovision)($gp)
    /* 3D758 8004D758 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 3D75C 8004D75C 4400BFAF */  sw         $ra, 0x44($sp)
    /* 3D760 8004D760 4000B2AF */  sw         $s2, 0x40($sp)
    /* 3D764 8004D764 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 3D768 8004D768 74004010 */  beqz       $v0, .L8004D93C
    /* 3D76C 8004D76C 3800B0AF */   sw        $s0, 0x38($sp)
    /* 3D770 8004D770 0D80123C */  lui        $s2, %hi(VisionList)
    /* 3D774 8004D774 D0655226 */  addiu      $s2, $s2, %lo(VisionList)
    /* 3D778 8004D778 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D77C 8004D77C 00000000 */  nop
    /* 3D780 8004D780 1D004018 */  blez       $v0, .L8004D7F8
    /* 3D784 8004D784 21880000 */   addu      $s1, $zero, $zero
    /* 3D788 8004D788 06005026 */  addiu      $s0, $s2, 0x6
  .L8004D78C:
    /* 3D78C 8004D78C FFFF0292 */  lbu        $v0, -0x1($s0)
    /* 3D790 8004D790 00000000 */  nop
    /* 3D794 8004D794 07004010 */  beqz       $v0, .L8004D7B4
    /* 3D798 8004D798 00000000 */   nop
    /* 3D79C 8004D79C 00004482 */  lb         $a0, 0x0($s2)
    /* 3D7A0 8004D7A0 FBFF0582 */  lb         $a1, -0x5($s0)
    /* 3D7A4 8004D7A4 FCFF0696 */  lhu        $a2, -0x4($s0)
    /* 3D7A8 8004D7A8 06000792 */  lbu        $a3, 0x6($s0)
    /* 3D7AC 8004D7AC 4E33010C */  jal        DoUnVision__Fiiii
    /* 3D7B0 8004D7B0 00000000 */   nop
  .L8004D7B4:
    /* 3D7B4 8004D7B4 00000292 */  lbu        $v0, 0x0($s0)
    /* 3D7B8 8004D7B8 00000000 */  nop
    /* 3D7BC 8004D7BC 08004010 */  beqz       $v0, .L8004D7E0
    /* 3D7C0 8004D7C0 00000000 */   nop
    /* 3D7C4 8004D7C4 01000482 */  lb         $a0, 0x1($s0)
    /* 3D7C8 8004D7C8 02000582 */  lb         $a1, 0x2($s0)
    /* 3D7CC 8004D7CC 03000682 */  lb         $a2, 0x3($s0)
    /* 3D7D0 8004D7D0 06000792 */  lbu        $a3, 0x6($s0)
    /* 3D7D4 8004D7D4 4E33010C */  jal        DoUnVision__Fiiii
    /* 3D7D8 8004D7D8 00000000 */   nop
    /* 3D7DC 8004D7DC 000000A2 */  sb         $zero, 0x0($s0)
  .L8004D7E0:
    /* 3D7E0 8004D7E0 0E001026 */  addiu      $s0, $s0, 0xE
    /* 3D7E4 8004D7E4 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D7E8 8004D7E8 01003126 */  addiu      $s1, $s1, 0x1
    /* 3D7EC 8004D7EC 2A102202 */  slt        $v0, $s1, $v0
    /* 3D7F0 8004D7F0 E6FF4014 */  bnez       $v0, .L8004D78C
    /* 3D7F4 8004D7F4 0E005226 */   addiu     $s2, $s2, 0xE
  .L8004D7F8:
    /* 3D7F8 8004D7F8 1280023C */  lui        $v0, %hi(TransVal)
    /* 3D7FC 8004D7FC 48C14280 */  lb         $v0, %lo(TransVal)($v0)
    /* 3D800 8004D800 00000000 */  nop
    /* 3D804 8004D804 0A004018 */  blez       $v0, .L8004D830
    /* 3D808 8004D808 21880000 */   addu      $s1, $zero, $zero
  .L8004D80C:
    /* 3D80C 8004D80C 0E80013C */  lui        $at, %hi(TransList)
    /* 3D810 8004D810 21083100 */  addu       $at, $at, $s1
    /* 3D814 8004D814 287920A0 */  sb         $zero, %lo(TransList)($at)
    /* 3D818 8004D818 1280023C */  lui        $v0, %hi(TransVal)
    /* 3D81C 8004D81C 48C14280 */  lb         $v0, %lo(TransVal)($v0)
    /* 3D820 8004D820 01003126 */  addiu      $s1, $s1, 0x1
    /* 3D824 8004D824 2A102202 */  slt        $v0, $s1, $v0
    /* 3D828 8004D828 F8FF4014 */  bnez       $v0, .L8004D80C
    /* 3D82C 8004D82C 00000000 */   nop
  .L8004D830:
    /* 3D830 8004D830 0D80123C */  lui        $s2, %hi(VisionList)
    /* 3D834 8004D834 D0655226 */  addiu      $s2, $s2, %lo(VisionList)
    /* 3D838 8004D838 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D83C 8004D83C 00000000 */  nop
    /* 3D840 8004D840 12004018 */  blez       $v0, .L8004D88C
    /* 3D844 8004D844 21880000 */   addu      $s1, $zero, $zero
    /* 3D848 8004D848 0C005026 */  addiu      $s0, $s2, 0xC
  .L8004D84C:
    /* 3D84C 8004D84C F9FF0292 */  lbu        $v0, -0x7($s0)
    /* 3D850 8004D850 00000000 */  nop
    /* 3D854 8004D854 07004014 */  bnez       $v0, .L8004D874
    /* 3D858 8004D858 01000724 */   addiu     $a3, $zero, 0x1
    /* 3D85C 8004D85C 00004482 */  lb         $a0, 0x0($s2)
    /* 3D860 8004D860 F5FF0582 */  lb         $a1, -0xB($s0)
    /* 3D864 8004D864 F6FF0696 */  lhu        $a2, -0xA($s0)
    /* 3D868 8004D868 00000292 */  lbu        $v0, 0x0($s0)
    /* 3D86C 8004D86C 9033010C */  jal        DoVision__FiiiUcUc
    /* 3D870 8004D870 1000A2AF */   sw        $v0, 0x10($sp)
  .L8004D874:
    /* 3D874 8004D874 0E001026 */  addiu      $s0, $s0, 0xE
    /* 3D878 8004D878 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D87C 8004D87C 01003126 */  addiu      $s1, $s1, 0x1
    /* 3D880 8004D880 2A102202 */  slt        $v0, $s1, $v0
    /* 3D884 8004D884 F1FF4014 */  bnez       $v0, .L8004D84C
    /* 3D888 8004D888 0E005226 */   addiu     $s2, $s2, 0xE
  .L8004D88C:
    /* 3D88C 8004D88C 0D80073C */  lui        $a3, %hi(VisionList)
    /* 3D890 8004D890 D065E724 */  addiu      $a3, $a3, %lo(VisionList)
    /* 3D894 8004D894 21200000 */  addu       $a0, $zero, $zero
  .L8004D898:
    /* 3D898 8004D898 0D80123C */  lui        $s2, %hi(VisionList)
    /* 3D89C 8004D89C D0655226 */  addiu      $s2, $s2, %lo(VisionList)
    /* 3D8A0 8004D8A0 9C11838F */  lw         $v1, %gp_rel(numvision)($gp)
    /* 3D8A4 8004D8A4 00000000 */  nop
    /* 3D8A8 8004D8A8 21006018 */  blez       $v1, .L8004D930
    /* 3D8AC 8004D8AC 21880000 */   addu      $s1, $zero, $zero
  .L8004D8B0:
    /* 3D8B0 8004D8B0 05004292 */  lbu        $v0, 0x5($s2)
    /* 3D8B4 8004D8B4 00000000 */  nop
    /* 3D8B8 8004D8B8 18004010 */  beqz       $v0, .L8004D91C
    /* 3D8BC 8004D8BC FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 3D8C0 8004D8C0 9C1183AF */  sw         $v1, %gp_rel(numvision)($gp)
    /* 3D8C4 8004D8C4 14006018 */  blez       $v1, .L8004D918
    /* 3D8C8 8004D8C8 00000000 */   nop
    /* 3D8CC 8004D8CC 12002312 */  beq        $s1, $v1, .L8004D918
    /* 3D8D0 8004D8D0 C0100300 */   sll       $v0, $v1, 3
    /* 3D8D4 8004D8D4 23104300 */  subu       $v0, $v0, $v1
    /* 3D8D8 8004D8D8 40100200 */  sll        $v0, $v0, 1
    /* 3D8DC 8004D8DC 21104700 */  addu       $v0, $v0, $a3
    /* 3D8E0 8004D8E0 03004388 */  lwl        $v1, 0x3($v0)
    /* 3D8E4 8004D8E4 00004398 */  lwr        $v1, 0x0($v0)
    /* 3D8E8 8004D8E8 07004488 */  lwl        $a0, 0x7($v0)
    /* 3D8EC 8004D8EC 04004498 */  lwr        $a0, 0x4($v0)
    /* 3D8F0 8004D8F0 0B004588 */  lwl        $a1, 0xB($v0)
    /* 3D8F4 8004D8F4 08004598 */  lwr        $a1, 0x8($v0)
    /* 3D8F8 8004D8F8 0C004684 */  lh         $a2, 0xC($v0)
    /* 3D8FC 8004D8FC 030043AA */  swl        $v1, 0x3($s2)
    /* 3D900 8004D900 000043BA */  swr        $v1, 0x0($s2)
    /* 3D904 8004D904 070044AA */  swl        $a0, 0x7($s2)
    /* 3D908 8004D908 040044BA */  swr        $a0, 0x4($s2)
    /* 3D90C 8004D90C 0B0045AA */  swl        $a1, 0xB($s2)
    /* 3D910 8004D910 080045BA */  swr        $a1, 0x8($s2)
    /* 3D914 8004D914 0C0046A6 */  sh         $a2, 0xC($s2)
  .L8004D918:
    /* 3D918 8004D918 01000424 */  addiu      $a0, $zero, 0x1
  .L8004D91C:
    /* 3D91C 8004D91C 9C11838F */  lw         $v1, %gp_rel(numvision)($gp)
    /* 3D920 8004D920 01003126 */  addiu      $s1, $s1, 0x1
    /* 3D924 8004D924 2A102302 */  slt        $v0, $s1, $v1
    /* 3D928 8004D928 E1FF4014 */  bnez       $v0, .L8004D8B0
    /* 3D92C 8004D92C 0E005226 */   addiu     $s2, $s2, 0xE
  .L8004D930:
    /* 3D930 8004D930 FF008230 */  andi       $v0, $a0, 0xFF
    /* 3D934 8004D934 D8FF4014 */  bnez       $v0, .L8004D898
    /* 3D938 8004D938 21200000 */   addu      $a0, $zero, $zero
  .L8004D93C:
    /* 3D93C 8004D93C A01180A3 */  sb         $zero, %gp_rel(dovision)($gp)
    /* 3D940 8004D940 4400BF8F */  lw         $ra, 0x44($sp)
    /* 3D944 8004D944 4000B28F */  lw         $s2, 0x40($sp)
    /* 3D948 8004D948 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 3D94C 8004D94C 3800B08F */  lw         $s0, 0x38($sp)
    /* 3D950 8004D950 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 3D954 8004D954 0800E003 */  jr         $ra
    /* 3D958 8004D958 00000000 */   nop
endlabel ProcessVisionList__Fv
