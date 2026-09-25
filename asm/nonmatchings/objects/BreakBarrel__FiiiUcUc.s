.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BreakBarrel__FiiiUcUc, 0x558

glabel BreakBarrel__FiiiUcUc
    /* 4E5E8 8005E5E8 A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 4E5EC 8005E5EC 5800BEAF */  sw         $fp, 0x58($sp)
    /* 4E5F0 8005E5F0 21F08000 */  addu       $fp, $a0, $zero
    /* 4E5F4 8005E5F4 4400B3AF */  sw         $s3, 0x44($sp)
    /* 4E5F8 8005E5F8 2198A000 */  addu       $s3, $a1, $zero
    /* 4E5FC 8005E5FC 40101300 */  sll        $v0, $s3, 1
    /* 4E600 8005E600 21105300 */  addu       $v0, $v0, $s3
    /* 4E604 8005E604 80100200 */  sll        $v0, $v0, 2
    /* 4E608 8005E608 23105300 */  subu       $v0, $v0, $s3
    /* 4E60C 8005E60C 80200200 */  sll        $a0, $v0, 2
    /* 4E610 8005E610 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 4E614 8005E614 5400B7AF */  sw         $s7, 0x54($sp)
    /* 4E618 8005E618 5000B6AF */  sw         $s6, 0x50($sp)
    /* 4E61C 8005E61C 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 4E620 8005E620 4800B4AF */  sw         $s4, 0x48($sp)
    /* 4E624 8005E624 4000B2AF */  sw         $s2, 0x40($sp)
    /* 4E628 8005E628 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 4E62C 8005E62C 3800B0AF */  sw         $s0, 0x38($sp)
    /* 4E630 8005E630 2000A6AF */  sw         $a2, 0x20($sp)
    /* 4E634 8005E634 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4E638 8005E638 21082400 */  addu       $at, $at, $a0
    /* 4E63C 8005E63C 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4E640 8005E640 7000B793 */  lbu        $s7, 0x70($sp)
    /* 4E644 8005E644 31014010 */  beqz       $v0, .L8005EB0C
    /* 4E648 8005E648 FF00E230 */   andi      $v0, $a3, 0xFF
    /* 4E64C 8005E64C 06004010 */  beqz       $v0, .L8005E668
    /* 4E650 8005E650 40101300 */   sll       $v0, $s3, 1
    /* 4E654 8005E654 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E658 8005E658 21082400 */  addu       $at, $at, $a0
    /* 4E65C 8005E65C 5A8C20A4 */  sh         $zero, %lo(object + 0xE)($at)
    /* 4E660 8005E660 AC790108 */  j          .L8005E6B0
    /* 4E664 8005E664 00000000 */   nop
  .L8005E668:
    /* 4E668 8005E668 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E66C 8005E66C 21082400 */  addu       $at, $at, $a0
    /* 4E670 8005E670 5A8C2294 */  lhu        $v0, %lo(object + 0xE)($at)
    /* 4E674 8005E674 2000A88F */  lw         $t0, 0x20($sp)
    /* 4E678 8005E678 1280033C */  lui        $v1, %hi(myplr)
    /* 4E67C 8005E67C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 4E680 8005E680 23104800 */  subu       $v0, $v0, $t0
    /* 4E684 8005E684 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E688 8005E688 21082400 */  addu       $at, $at, $a0
    /* 4E68C 8005E68C 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 4E690 8005E690 0600C313 */  beq        $fp, $v1, .L8005E6AC
    /* 4E694 8005E694 00140200 */   sll       $v0, $v0, 16
    /* 4E698 8005E698 0F00401C */  bgtz       $v0, .L8005E6D8
    /* 4E69C 8005E69C 01000224 */   addiu     $v0, $zero, 0x1
    /* 4E6A0 8005E6A0 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E6A4 8005E6A4 21082400 */  addu       $at, $at, $a0
    /* 4E6A8 8005E6A8 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
  .L8005E6AC:
    /* 4E6AC 8005E6AC 40101300 */  sll        $v0, $s3, 1
  .L8005E6B0:
    /* 4E6B0 8005E6B0 21105300 */  addu       $v0, $v0, $s3
    /* 4E6B4 8005E6B4 80100200 */  sll        $v0, $v0, 2
    /* 4E6B8 8005E6B8 23105300 */  subu       $v0, $v0, $s3
    /* 4E6BC 8005E6BC 80800200 */  sll        $s0, $v0, 2
    /* 4E6C0 8005E6C0 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E6C4 8005E6C4 21083000 */  addu       $at, $at, $s0
    /* 4E6C8 8005E6C8 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 4E6CC 8005E6CC 00000000 */  nop
    /* 4E6D0 8005E6D0 14004018 */  blez       $v0, .L8005E724
    /* 4E6D4 8005E6D4 01000224 */   addiu     $v0, $zero, 0x1
  .L8005E6D8:
    /* 4E6D8 8005E6D8 1280023C */  lui        $v0, %hi(deltaload)
    /* 4E6DC 8005E6DC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4E6E0 8005E6E0 00000000 */  nop
    /* 4E6E4 8005E6E4 09014014 */  bnez       $v0, .L8005EB0C
    /* 4E6E8 8005E6E8 40101300 */   sll       $v0, $s3, 1
    /* 4E6EC 8005E6EC 21105300 */  addu       $v0, $v0, $s3
    /* 4E6F0 8005E6F0 80100200 */  sll        $v0, $v0, 2
    /* 4E6F4 8005E6F4 23105300 */  subu       $v0, $v0, $s3
    /* 4E6F8 8005E6F8 80100200 */  sll        $v0, $v0, 2
    /* 4E6FC 8005E6FC 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4E700 8005E700 21082200 */  addu       $at, $at, $v0
    /* 4E704 8005E704 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4E708 8005E708 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4E70C 8005E70C 21082200 */  addu       $at, $at, $v0
    /* 4E710 8005E710 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4E714 8005E714 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4E718 8005E718 1D000424 */   addiu     $a0, $zero, 0x1D
    /* 4E71C 8005E71C C37A0108 */  j          .L8005EB0C
    /* 4E720 8005E720 00000000 */   nop
  .L8005E724:
    /* 4E724 8005E724 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 4E728 8005E728 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 4E72C 8005E72C 21083000 */  addu       $at, $at, $s0
    /* 4E730 8005E730 718C22A0 */  sb         $v0, %lo(object + 0x25)($at)
    /* 4E734 8005E734 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4E738 8005E738 21083000 */  addu       $at, $at, $s0
    /* 4E73C 8005E73C 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4E740 8005E740 0E80013C */  lui        $at, %hi(object + 0x27)
    /* 4E744 8005E744 21083000 */  addu       $at, $at, $s0
    /* 4E748 8005E748 738C20A0 */  sb         $zero, %lo(object + 0x27)($at)
    /* 4E74C 8005E74C 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 4E750 8005E750 21083000 */  addu       $at, $at, $s0
    /* 4E754 8005E754 748C22A0 */  sb         $v0, %lo(object + 0x28)($at)
    /* 4E758 8005E758 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 4E75C 8005E75C 21083000 */  addu       $at, $at, $s0
    /* 4E760 8005E760 6E8C23A0 */  sb         $v1, %lo(object + 0x22)($at)
    /* 4E764 8005E764 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4E768 8005E768 21083000 */  addu       $at, $at, $s0
    /* 4E76C 8005E76C 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4E770 8005E770 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 4E774 8005E774 21083000 */  addu       $at, $at, $s0
    /* 4E778 8005E778 758C22A0 */  sb         $v0, %lo(object + 0x29)($at)
    /* 4E77C 8005E77C 1280023C */  lui        $v0, %hi(deltaload)
    /* 4E780 8005E780 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4E784 8005E784 01001124 */  addiu      $s1, $zero, 0x1
    /* 4E788 8005E788 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E78C 8005E78C 21083000 */  addu       $at, $at, $s0
    /* 4E790 8005E790 5A8C20A4 */  sh         $zero, %lo(object + 0xE)($at)
    /* 4E794 8005E794 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 4E798 8005E798 21083000 */  addu       $at, $at, $s0
    /* 4E79C 8005E79C 548C31A4 */  sh         $s1, %lo(object + 0x8)($at)
    /* 4E7A0 8005E7A0 0F004010 */  beqz       $v0, .L8005E7E0
    /* 4E7A4 8005E7A4 E8030224 */   addiu     $v0, $zero, 0x3E8
    /* 4E7A8 8005E7A8 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 4E7AC 8005E7AC 21083000 */  addu       $at, $at, $s0
    /* 4E7B0 8005E7B0 588C2394 */  lhu        $v1, %lo(object + 0xC)($at)
    /* 4E7B4 8005E7B4 0E80013C */  lui        $at, %hi(object + 0xA)
    /* 4E7B8 8005E7B8 21083000 */  addu       $at, $at, $s0
    /* 4E7BC 8005E7BC 568C20A4 */  sh         $zero, %lo(object + 0xA)($at)
    /* 4E7C0 8005E7C0 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 4E7C4 8005E7C4 21083000 */  addu       $at, $at, $s0
    /* 4E7C8 8005E7C8 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 4E7CC 8005E7CC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4E7D0 8005E7D0 21083000 */  addu       $at, $at, $s0
    /* 4E7D4 8005E7D4 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
    /* 4E7D8 8005E7D8 C37A0108 */  j          .L8005EB0C
    /* 4E7DC 8005E7DC 00000000 */   nop
  .L8005E7E0:
    /* 4E7E0 8005E7E0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E7E4 8005E7E4 21083000 */  addu       $at, $at, $s0
    /* 4E7E8 8005E7E8 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4E7EC 8005E7EC 3A000224 */  addiu      $v0, $zero, 0x3A
    /* 4E7F0 8005E7F0 7C006214 */  bne        $v1, $v0, .L8005E9E4
    /* 4E7F4 8005E7F4 00000000 */   nop
    /* 4E7F8 8005E7F8 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4E7FC 8005E7FC 21083000 */  addu       $at, $at, $s0
    /* 4E800 8005E800 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4E804 8005E804 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4E808 8005E808 21083000 */  addu       $at, $at, $s0
    /* 4E80C 8005E80C 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4E810 8005E810 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4E814 8005E814 0E000424 */   addiu     $a0, $zero, 0xE
    /* 4E818 8005E818 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4E81C 8005E81C 21083000 */  addu       $at, $at, $s0
    /* 4E820 8005E820 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4E824 8005E824 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4E828 8005E828 21083000 */  addu       $at, $at, $s0
    /* 4E82C 8005E82C 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4E830 8005E830 BA34010C */  jal        AddLight__Fiii
    /* 4E834 8005E834 33000624 */   addiu     $a2, $zero, 0x33
    /* 4E838 8005E838 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4E83C 8005E83C 21083000 */  addu       $at, $at, $s0
    /* 4E840 8005E840 6C8C2380 */  lb         $v1, %lo(object + 0x20)($at)
    /* 4E844 8005E844 0E80013C */  lui        $at, %hi(object)
    /* 4E848 8005E848 21083000 */  addu       $at, $at, $s0
    /* 4E84C 8005E84C 4C8C22A4 */  sh         $v0, %lo(object)($at)
    /* 4E850 8005E850 21100000 */  addu       $v0, $zero, $zero
    /* 4E854 8005E854 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4E858 8005E858 21083000 */  addu       $at, $at, $s0
    /* 4E85C 8005E85C 5A8C31A4 */  sh         $s1, %lo(object + 0xE)($at)
    /* 4E860 8005E860 A5004014 */  bnez       $v0, .L8005EAF8
    /* 4E864 8005E864 FFFF7124 */   addiu     $s1, $v1, -0x1
    /* 4E868 8005E868 21A80002 */  addu       $s5, $s0, $zero
    /* 4E86C 8005E86C 01001624 */  addiu      $s6, $zero, 0x1
  .L8005E870:
    /* 4E870 8005E870 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4E874 8005E874 21083500 */  addu       $at, $at, $s5
    /* 4E878 8005E878 6B8C2280 */  lb         $v0, %lo(object + 0x1F)($at)
    /* 4E87C 8005E87C 00000000 */  nop
    /* 4E880 8005E880 FFFF5024 */  addiu      $s0, $v0, -0x1
    /* 4E884 8005E884 21100000 */  addu       $v0, $zero, $zero
    /* 4E888 8005E888 4C004014 */  bnez       $v0, .L8005E9BC
    /* 4E88C 8005E88C 40101300 */   sll       $v0, $s3, 1
    /* 4E890 8005E890 21105300 */  addu       $v0, $v0, $s3
    /* 4E894 8005E894 80100200 */  sll        $v0, $v0, 2
    /* 4E898 8005E898 23105300 */  subu       $v0, $v0, $s3
    /* 4E89C 8005E89C 80A00200 */  sll        $s4, $v0, 2
    /* 4E8A0 8005E8A0 C0181100 */  sll        $v1, $s1, 3
    /* 4E8A4 8005E8A4 C0101000 */  sll        $v0, $s0, 3
    /* 4E8A8 8005E8A8 23105000 */  subu       $v0, $v0, $s0
    /* 4E8AC 8005E8AC C0110200 */  sll        $v0, $v0, 7
    /* 4E8B0 8005E8B0 21904300 */  addu       $s2, $v0, $v1
  .L8005E8B4:
    /* 4E8B4 8005E8B4 0E80013C */  lui        $at, %hi(dung_map)
    /* 4E8B8 8005E8B8 21083200 */  addu       $at, $at, $s2
    /* 4E8BC 8005E8BC 287A2484 */  lh         $a0, %lo(dung_map)($at)
    /* 4E8C0 8005E8C0 00000000 */  nop
    /* 4E8C4 8005E8C4 07008018 */  blez       $a0, .L8005E8E4
    /* 4E8C8 8005E8C8 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 4E8CC 8005E8CC 01000524 */  addiu      $a1, $zero, 0x1
    /* 4E8D0 8005E8D0 04000624 */  addiu      $a2, $zero, 0x4
    /* 4E8D4 8005E8D4 21380000 */  addu       $a3, $zero, $zero
    /* 4E8D8 8005E8D8 1000B6AF */  sw         $s6, 0x10($sp)
    /* 4E8DC 8005E8DC 13EC040C */  jal        func_8013B04C
    /* 4E8E0 8005E8E0 1400A0AF */   sw        $zero, 0x14($sp)
  .L8005E8E4:
    /* 4E8E4 8005E8E4 21200002 */  addu       $a0, $s0, $zero
    /* 4E8E8 8005E8E8 447F010C */  jal        IsDplayer__Fii
    /* 4E8EC 8005E8EC 21282002 */   addu      $a1, $s1, $zero
    /* 4E8F0 8005E8F0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 4E8F4 8005E8F4 0E004010 */  beqz       $v0, .L8005E930
    /* 4E8F8 8005E8F8 21200002 */   addu      $a0, $s0, $zero
    /* 4E8FC 8005E8FC 447F010C */  jal        IsDplayer__Fii
    /* 4E900 8005E900 21282002 */   addu      $a1, $s1, $zero
    /* 4E904 8005E904 FF004230 */  andi       $v0, $v0, 0xFF
    /* 4E908 8005E908 FFFF4424 */  addiu      $a0, $v0, -0x1
    /* 4E90C 8005E90C FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 4E910 8005E910 21300000 */  addu       $a2, $zero, $zero
    /* 4E914 8005E914 08000724 */  addiu      $a3, $zero, 0x8
    /* 4E918 8005E918 10000224 */  addiu      $v0, $zero, 0x10
    /* 4E91C 8005E91C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 4E920 8005E920 1400B6AF */  sw         $s6, 0x14($sp)
    /* 4E924 8005E924 1800A0AF */  sw         $zero, 0x18($sp)
    /* 4E928 8005E928 E4EE040C */  jal        func_8013BB90
    /* 4E92C 8005E92C 1C00A0AF */   sw        $zero, 0x1C($sp)
  .L8005E930:
    /* 4E930 8005E930 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 4E934 8005E934 21083200 */  addu       $at, $at, $s2
    /* 4E938 8005E938 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 4E93C 8005E93C 00000000 */  nop
    /* 4E940 8005E940 16004018 */  blez       $v0, .L8005E99C
    /* 4E944 8005E944 FFFF4524 */   addiu     $a1, $v0, -0x1
    /* 4E948 8005E948 40100500 */  sll        $v0, $a1, 1
    /* 4E94C 8005E94C 21104500 */  addu       $v0, $v0, $a1
    /* 4E950 8005E950 80100200 */  sll        $v0, $v0, 2
    /* 4E954 8005E954 23104500 */  subu       $v0, $v0, $a1
    /* 4E958 8005E958 80200200 */  sll        $a0, $v0, 2
    /* 4E95C 8005E95C 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4E960 8005E960 21082400 */  addu       $at, $at, $a0
    /* 4E964 8005E964 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4E968 8005E968 3A000224 */  addiu      $v0, $zero, 0x3A
    /* 4E96C 8005E96C 0B006214 */  bne        $v1, $v0, .L8005E99C
    /* 4E970 8005E970 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 4E974 8005E974 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 4E978 8005E978 21082400 */  addu       $at, $at, $a0
    /* 4E97C 8005E97C 6E8C2380 */  lb         $v1, %lo(object + 0x22)($at)
    /* 4E980 8005E980 00000000 */  nop
    /* 4E984 8005E984 05006210 */  beq        $v1, $v0, .L8005E99C
    /* 4E988 8005E988 2120C003 */   addu      $a0, $fp, $zero
    /* 4E98C 8005E98C 2000A68F */  lw         $a2, 0x20($sp)
    /* 4E990 8005E990 01000724 */  addiu      $a3, $zero, 0x1
    /* 4E994 8005E994 7A79010C */  jal        BreakBarrel__FiiiUcUc
    /* 4E998 8005E998 1000B7AF */   sw        $s7, 0x10($sp)
  .L8005E99C:
    /* 4E99C 8005E99C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4E9A0 8005E9A0 21083400 */  addu       $at, $at, $s4
    /* 4E9A4 8005E9A4 6B8C2280 */  lb         $v0, %lo(object + 0x1F)($at)
    /* 4E9A8 8005E9A8 01001026 */  addiu      $s0, $s0, 0x1
    /* 4E9AC 8005E9AC 01004224 */  addiu      $v0, $v0, 0x1
    /* 4E9B0 8005E9B0 2A105000 */  slt        $v0, $v0, $s0
    /* 4E9B4 8005E9B4 BFFF4010 */  beqz       $v0, .L8005E8B4
    /* 4E9B8 8005E9B8 80035226 */   addiu     $s2, $s2, 0x380
  .L8005E9BC:
    /* 4E9BC 8005E9BC 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4E9C0 8005E9C0 21083500 */  addu       $at, $at, $s5
    /* 4E9C4 8005E9C4 6C8C2280 */  lb         $v0, %lo(object + 0x20)($at)
    /* 4E9C8 8005E9C8 01003126 */  addiu      $s1, $s1, 0x1
    /* 4E9CC 8005E9CC 01004224 */  addiu      $v0, $v0, 0x1
    /* 4E9D0 8005E9D0 2A105100 */  slt        $v0, $v0, $s1
    /* 4E9D4 8005E9D4 A6FF4010 */  beqz       $v0, .L8005E870
    /* 4E9D8 8005E9D8 21200000 */   addu      $a0, $zero, $zero
    /* 4E9DC 8005E9DC BF7A0108 */  j          .L8005EAFC
    /* 4E9E0 8005E9E0 00000000 */   nop
  .L8005E9E4:
    /* 4E9E4 8005E9E4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4E9E8 8005E9E8 21083000 */  addu       $at, $at, $s0
    /* 4E9EC 8005E9EC 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4E9F0 8005E9F0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4E9F4 8005E9F4 21083000 */  addu       $at, $at, $s0
    /* 4E9F8 8005E9F8 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4E9FC 8005E9FC E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4EA00 8005EA00 0F000424 */   addiu     $a0, $zero, 0xF
    /* 4EA04 8005EA04 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4EA08 8005EA08 21083000 */  addu       $at, $at, $s0
    /* 4EA0C 8005EA0C 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4EA10 8005EA10 B3F6000C */  jal        SetRndSeed__Fl
    /* 4EA14 8005EA14 00000000 */   nop
    /* 4EA18 8005EA18 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4EA1C 8005EA1C 21083000 */  addu       $at, $at, $s0
    /* 4EA20 8005EA20 5C8C2284 */  lh         $v0, %lo(object + 0x10)($at)
    /* 4EA24 8005EA24 00000000 */  nop
    /* 4EA28 8005EA28 02004228 */  slti       $v0, $v0, 0x2
    /* 4EA2C 8005EA2C 1C004010 */  beqz       $v0, .L8005EAA0
    /* 4EA30 8005EA30 40101300 */   sll       $v0, $s3, 1
    /* 4EA34 8005EA34 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 4EA38 8005EA38 21083000 */  addu       $at, $at, $s0
    /* 4EA3C 8005EA3C 5E8C2284 */  lh         $v0, %lo(object + 0x12)($at)
    /* 4EA40 8005EA40 00000000 */  nop
    /* 4EA44 8005EA44 0C004014 */  bnez       $v0, .L8005EA78
    /* 4EA48 8005EA48 21300000 */   addu      $a2, $zero, $zero
    /* 4EA4C 8005EA4C 2120C003 */  addu       $a0, $fp, $zero
    /* 4EA50 8005EA50 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4EA54 8005EA54 21083000 */  addu       $at, $at, $s0
    /* 4EA58 8005EA58 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4EA5C 8005EA5C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4EA60 8005EA60 21083000 */  addu       $at, $at, $s0
    /* 4EA64 8005EA64 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4EA68 8005EA68 8113010C */  jal        CreateRndUseful__FiiiUc
    /* 4EA6C 8005EA6C 2138E002 */   addu      $a3, $s7, $zero
    /* 4EA70 8005EA70 A87A0108 */  j          .L8005EAA0
    /* 4EA74 8005EA74 40101300 */   sll       $v0, $s3, 1
  .L8005EA78:
    /* 4EA78 8005EA78 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4EA7C 8005EA7C 21083000 */  addu       $at, $at, $s0
    /* 4EA80 8005EA80 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4EA84 8005EA84 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4EA88 8005EA88 21083000 */  addu       $at, $at, $s0
    /* 4EA8C 8005EA8C 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4EA90 8005EA90 2138E002 */  addu       $a3, $s7, $zero
    /* 4EA94 8005EA94 F612010C */  jal        CreateRndItem__FiiUcUcUc
    /* 4EA98 8005EA98 1000A0AF */   sw        $zero, 0x10($sp)
    /* 4EA9C 8005EA9C 40101300 */  sll        $v0, $s3, 1
  .L8005EAA0:
    /* 4EAA0 8005EAA0 21105300 */  addu       $v0, $v0, $s3
    /* 4EAA4 8005EAA4 80100200 */  sll        $v0, $v0, 2
    /* 4EAA8 8005EAA8 23105300 */  subu       $v0, $v0, $s3
    /* 4EAAC 8005EAAC 80180200 */  sll        $v1, $v0, 2
    /* 4EAB0 8005EAB0 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4EAB4 8005EAB4 21082300 */  addu       $at, $at, $v1
    /* 4EAB8 8005EAB8 5C8C2284 */  lh         $v0, %lo(object + 0x10)($at)
    /* 4EABC 8005EABC 00000000 */  nop
    /* 4EAC0 8005EAC0 08004228 */  slti       $v0, $v0, 0x8
    /* 4EAC4 8005EAC4 0D004014 */  bnez       $v0, .L8005EAFC
    /* 4EAC8 8005EAC8 21200000 */   addu      $a0, $zero, $zero
    /* 4EACC 8005EACC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4EAD0 8005EAD0 21082300 */  addu       $at, $at, $v1
    /* 4EAD4 8005EAD4 608C2484 */  lh         $a0, %lo(object + 0x14)($at)
    /* 4EAD8 8005EAD8 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4EADC 8005EADC 21082300 */  addu       $at, $at, $v1
    /* 4EAE0 8005EAE0 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4EAE4 8005EAE4 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4EAE8 8005EAE8 21082300 */  addu       $at, $at, $v1
    /* 4EAEC 8005EAEC 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4EAF0 8005EAF0 6100020C */  jal        SpawnSkeleton__Fiii
    /* 4EAF4 8005EAF4 00000000 */   nop
  .L8005EAF8:
    /* 4EAF8 8005EAF8 21200000 */  addu       $a0, $zero, $zero
  .L8005EAFC:
    /* 4EAFC 8005EAFC 2F000524 */  addiu      $a1, $zero, 0x2F
    /* 4EB00 8005EB00 FFFFC633 */  andi       $a2, $fp, 0xFFFF
    /* 4EB04 8005EB04 183E010C */  jal        NetSendCmdParam2__FUcUcUsUs
    /* 4EB08 8005EB08 FFFF6732 */   andi      $a3, $s3, 0xFFFF
  .L8005EB0C:
    /* 4EB0C 8005EB0C 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 4EB10 8005EB10 5800BE8F */  lw         $fp, 0x58($sp)
    /* 4EB14 8005EB14 5400B78F */  lw         $s7, 0x54($sp)
    /* 4EB18 8005EB18 5000B68F */  lw         $s6, 0x50($sp)
    /* 4EB1C 8005EB1C 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 4EB20 8005EB20 4800B48F */  lw         $s4, 0x48($sp)
    /* 4EB24 8005EB24 4400B38F */  lw         $s3, 0x44($sp)
    /* 4EB28 8005EB28 4000B28F */  lw         $s2, 0x40($sp)
    /* 4EB2C 8005EB2C 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 4EB30 8005EB30 3800B08F */  lw         $s0, 0x38($sp)
    /* 4EB34 8005EB34 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 4EB38 8005EB38 0800E003 */  jr         $ra
    /* 4EB3C 8005EB3C 00000000 */   nop
endlabel BreakBarrel__FiiiUcUc
