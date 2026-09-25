.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcPlrItemVals__FiUc, 0xA80

glabel CalcPlrItemVals__FiUc
    /* 2E6B0 8003E6B0 40FFBD27 */  addiu      $sp, $sp, -0xC0
    /* 2E6B4 8003E6B4 21580000 */  addu       $t3, $zero, $zero
    /* 2E6B8 8003E6B8 21500000 */  addu       $t2, $zero, $zero
    /* 2E6BC 8003E6BC 21780000 */  addu       $t7, $zero, $zero
    /* 2E6C0 8003E6C0 21C00000 */  addu       $t8, $zero, $zero
    /* 2E6C4 8003E6C4 21C80000 */  addu       $t9, $zero, $zero
    /* 2E6C8 8003E6C8 A400B3AF */  sw         $s3, 0xA4($sp)
    /* 2E6CC 8003E6CC 21980000 */  addu       $s3, $zero, $zero
    /* 2E6D0 8003E6D0 A000B2AF */  sw         $s2, 0xA0($sp)
    /* 2E6D4 8003E6D4 21900000 */  addu       $s2, $zero, $zero
    /* 2E6D8 8003E6D8 AC00B5AF */  sw         $s5, 0xAC($sp)
    /* 2E6DC 8003E6DC A800B4AF */  sw         $s4, 0xA8($sp)
    /* 2E6E0 8003E6E0 21A00000 */  addu       $s4, $zero, $zero
    /* 2E6E4 8003E6E4 21A80000 */  addu       $s5, $zero, $zero
    /* 2E6E8 8003E6E8 B400B7AF */  sw         $s7, 0xB4($sp)
    /* 2E6EC 8003E6EC 21B80000 */  addu       $s7, $zero, $zero
    /* 2E6F0 8003E6F0 B800BEAF */  sw         $fp, 0xB8($sp)
    /* 2E6F4 8003E6F4 21F00000 */  addu       $fp, $zero, $zero
    /* 2E6F8 8003E6F8 B000B6AF */  sw         $s6, 0xB0($sp)
    /* 2E6FC 8003E6FC 21B00000 */  addu       $s6, $zero, $zero
    /* 2E700 8003E700 21680000 */  addu       $t5, $zero, $zero
    /* 2E704 8003E704 21700000 */  addu       $t6, $zero, $zero
    /* 2E708 8003E708 9C00B1AF */  sw         $s1, 0x9C($sp)
    /* 2E70C 8003E70C 06001124 */  addiu      $s1, $zero, 0x6
    /* 2E710 8003E710 1000A4AF */  sw         $a0, 0x10($sp)
    /* 2E714 8003E714 40100400 */  sll        $v0, $a0, 1
    /* 2E718 8003E718 21104400 */  addu       $v0, $v0, $a0
    /* 2E71C 8003E71C 80100200 */  sll        $v0, $v0, 2
    /* 2E720 8003E720 21104400 */  addu       $v0, $v0, $a0
    /* 2E724 8003E724 00110200 */  sll        $v0, $v0, 4
    /* 2E728 8003E728 23104400 */  subu       $v0, $v0, $a0
    /* 2E72C 8003E72C 80100200 */  sll        $v0, $v0, 2
    /* 2E730 8003E730 21104400 */  addu       $v0, $v0, $a0
    /* 2E734 8003E734 C0100200 */  sll        $v0, $v0, 3
    /* 2E738 8003E738 0E80033C */  lui        $v1, %hi(plr)
    /* 2E73C 8003E73C 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 2E740 8003E740 9800B0AF */  sw         $s0, 0x98($sp)
    /* 2E744 8003E744 21804300 */  addu       $s0, $v0, $v1
    /* 2E748 8003E748 B0010C24 */  addiu      $t4, $zero, 0x1B0
    /* 2E74C 8003E74C BC00BFAF */  sw         $ra, 0xBC($sp)
    /* 2E750 8003E750 1800A5A3 */  sb         $a1, 0x18($sp)
    /* 2E754 8003E754 2000A0AF */  sw         $zero, 0x20($sp)
    /* 2E758 8003E758 7800A0AF */  sw         $zero, 0x78($sp)
    /* 2E75C 8003E75C 2800A0AF */  sw         $zero, 0x28($sp)
    /* 2E760 8003E760 3000A0AF */  sw         $zero, 0x30($sp)
    /* 2E764 8003E764 3800A0AF */  sw         $zero, 0x38($sp)
    /* 2E768 8003E768 4000A0AF */  sw         $zero, 0x40($sp)
    /* 2E76C 8003E76C 4800A0AF */  sw         $zero, 0x48($sp)
    /* 2E770 8003E770 5000A0AF */  sw         $zero, 0x50($sp)
    /* 2E774 8003E774 5800A0AF */  sw         $zero, 0x58($sp)
    /* 2E778 8003E778 6000A0AF */  sw         $zero, 0x60($sp)
    /* 2E77C 8003E77C 6800A0AF */  sw         $zero, 0x68($sp)
    /* 2E780 8003E780 7000A0AF */  sw         $zero, 0x70($sp)
    /* 2E784 8003E784 9000A0AF */  sw         $zero, 0x90($sp)
  .L8003E788:
    /* 2E788 8003E788 9000A88F */  lw         $t0, 0x90($sp)
    /* 2E78C 8003E78C 00000000 */  nop
    /* 2E790 8003E790 07000229 */  slti       $v0, $t0, 0x7
    /* 2E794 8003E794 88004010 */  beqz       $v0, .L8003E9B8
    /* 2E798 8003E798 21280C02 */   addu      $a1, $s0, $t4
    /* 2E79C 8003E79C 2C00A384 */  lh         $v1, 0x2C($a1)
    /* 2E7A0 8003E7A0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2E7A4 8003E7A4 7F006210 */  beq        $v1, $v0, .L8003E9A4
    /* 2E7A8 8003E7A8 00000000 */   nop
    /* 2E7AC 8003E7AC 6600A280 */  lb         $v0, 0x66($a1)
    /* 2E7B0 8003E7B0 00000000 */  nop
    /* 2E7B4 8003E7B4 7B004010 */  beqz       $v0, .L8003E9A4
    /* 2E7B8 8003E7B8 00000000 */   nop
    /* 2E7BC 8003E7BC 3B00A280 */  lb         $v0, 0x3B($a1)
    /* 2E7C0 8003E7C0 00000724 */  addiu      $a3, $zero, 0x0
    /* 2E7C4 8003E7C4 01000624 */  addiu      $a2, $zero, 0x1
    /* 2E7C8 8003E7C8 21586201 */  addu       $t3, $t3, $v0
    /* 2E7CC 8003E7CC 3C00A280 */  lb         $v0, 0x3C($a1)
    /* 2E7D0 8003E7D0 4A00A980 */  lb         $t1, 0x4A($a1)
    /* 2E7D4 8003E7D4 21504201 */  addu       $t2, $t2, $v0
    /* 2E7D8 8003E7D8 3D00A280 */  lb         $v0, 0x3D($a1)
    /* 2E7DC 8003E7DC 2178E901 */  addu       $t7, $t7, $t1
    /* 2E7E0 8003E7E0 12004010 */  beqz       $v0, .L8003E82C
    /* 2E7E4 8003E7E4 8800A9AF */   sw        $t1, 0x88($sp)
    /* 2E7E8 8003E7E8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2E7EC 8003E7EC 80260200 */  sll        $a0, $v0, 26
    /* 2E7F0 8003E7F0 04008104 */  bgez       $a0, .L8003E804
    /* 2E7F4 8003E7F4 00000000 */   nop
    /* 2E7F8 8003E7F8 04484600 */  sllv       $t1, $a2, $v0
    /* 2E7FC 8003E7FC 07000104 */  bgez       $zero, .L8003E81C
    /* 2E800 8003E800 21400000 */   addu      $t0, $zero, $zero
  .L8003E804:
    /* 2E804 8003E804 04008010 */  beqz       $a0, .L8003E818
    /* 2E808 8003E808 04484700 */   sllv      $t1, $a3, $v0
    /* 2E80C 8003E80C 23200200 */  negu       $a0, $v0
    /* 2E810 8003E810 06208600 */  srlv       $a0, $a2, $a0
    /* 2E814 8003E814 25482401 */  or         $t1, $t1, $a0
  .L8003E818:
    /* 2E818 8003E818 04404600 */  sllv       $t0, $a2, $v0
  .L8003E81C:
    /* 2E81C 8003E81C 21100001 */  addu       $v0, $t0, $zero
    /* 2E820 8003E820 21182001 */  addu       $v1, $t1, $zero
    /* 2E824 8003E824 25A8A302 */  or         $s5, $s5, $v1
    /* 2E828 8003E828 25A08202 */  or         $s4, $s4, $v0
  .L8003E82C:
    /* 2E82C 8003E82C 5100A280 */  lb         $v0, 0x51($a1)
    /* 2E830 8003E830 00000000 */  nop
    /* 2E834 8003E834 05004010 */  beqz       $v0, .L8003E84C
    /* 2E838 8003E838 00000000 */   nop
    /* 2E83C 8003E83C 6900A280 */  lb         $v0, 0x69($a1)
    /* 2E840 8003E840 00000000 */  nop
    /* 2E844 8003E844 57004010 */  beqz       $v0, .L8003E9A4
    /* 2E848 8003E848 00000000 */   nop
  .L8003E84C:
    /* 2E84C 8003E84C 3800A284 */  lh         $v0, 0x38($a1)
    /* 2E850 8003E850 00000000 */  nop
    /* 2E854 8003E854 21C00203 */  addu       $t8, $t8, $v0
    /* 2E858 8003E858 3600A284 */  lh         $v0, 0x36($a1)
    /* 2E85C 8003E85C 2000A38C */  lw         $v1, 0x20($a1)
    /* 2E860 8003E860 00000000 */  nop
    /* 2E864 8003E864 13006010 */  beqz       $v1, .L8003E8B4
    /* 2E868 8003E868 21C82203 */   addu      $t9, $t9, $v0
    /* 2E86C 8003E86C 8800A88F */  lw         $t0, 0x88($sp)
    /* 2E870 8003E870 00000000 */  nop
    /* 2E874 8003E874 18000301 */  mult       $t0, $v1
    /* 2E878 8003E878 12100000 */  mflo       $v0
    /* 2E87C 8003E87C EB51033C */  lui        $v1, (0x51EB851F >> 16)
    /* 2E880 8003E880 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 2E884 8003E884 18004300 */  mult       $v0, $v1
    /* 2E888 8003E888 C3170200 */  sra        $v0, $v0, 31
    /* 2E88C 8003E88C 10400000 */  mfhi       $t0
    /* 2E890 8003E890 43190800 */  sra        $v1, $t0, 5
    /* 2E894 8003E894 23186200 */  subu       $v1, $v1, $v0
    /* 2E898 8003E898 02006014 */  bnez       $v1, .L8003E8A4
    /* 2E89C 8003E89C 00000000 */   nop
    /* 2E8A0 8003E8A0 01000324 */  addiu      $v1, $zero, 0x1
  .L8003E8A4:
    /* 2E8A4 8003E8A4 2000A98F */  lw         $t1, 0x20($sp)
    /* 2E8A8 8003E8A8 00000000 */  nop
    /* 2E8AC 8003E8AC 21482301 */  addu       $t1, $t1, $v1
    /* 2E8B0 8003E8B0 2000A9AF */  sw         $t1, 0x20($sp)
  .L8003E8B4:
    /* 2E8B4 8003E8B4 1C00A28C */  lw         $v0, 0x1C($a1)
    /* 2E8B8 8003E8B8 7800A88F */  lw         $t0, 0x78($sp)
    /* 2E8BC 8003E8BC 5700A380 */  lb         $v1, 0x57($a1)
    /* 2E8C0 8003E8C0 2800A98F */  lw         $t1, 0x28($sp)
    /* 2E8C4 8003E8C4 25400201 */  or         $t0, $t0, $v0
    /* 2E8C8 8003E8C8 21986302 */  addu       $s3, $s3, $v1
    /* 2E8CC 8003E8CC 5600A280 */  lb         $v0, 0x56($a1)
    /* 2E8D0 8003E8D0 5900A380 */  lb         $v1, 0x59($a1)
    /* 2E8D4 8003E8D4 7800A8AF */  sw         $t0, 0x78($sp)
    /* 2E8D8 8003E8D8 3000A88F */  lw         $t0, 0x30($sp)
    /* 2E8DC 8003E8DC 21482201 */  addu       $t1, $t1, $v0
    /* 2E8E0 8003E8E0 21904302 */  addu       $s2, $s2, $v1
    /* 2E8E4 8003E8E4 5800A280 */  lb         $v0, 0x58($a1)
    /* 2E8E8 8003E8E8 5B00A380 */  lb         $v1, 0x5B($a1)
    /* 2E8EC 8003E8EC 2800A9AF */  sw         $t1, 0x28($sp)
    /* 2E8F0 8003E8F0 3800A98F */  lw         $t1, 0x38($sp)
    /* 2E8F4 8003E8F4 21400201 */  addu       $t0, $t0, $v0
    /* 2E8F8 8003E8F8 21F0C303 */  addu       $fp, $fp, $v1
    /* 2E8FC 8003E8FC 5A00A280 */  lb         $v0, 0x5A($a1)
    /* 2E900 8003E900 3A00A380 */  lb         $v1, 0x3A($a1)
    /* 2E904 8003E904 3000A8AF */  sw         $t0, 0x30($sp)
    /* 2E908 8003E908 4000A88F */  lw         $t0, 0x40($sp)
    /* 2E90C 8003E90C 21B8E202 */  addu       $s7, $s7, $v0
    /* 2E910 8003E910 2168A301 */  addu       $t5, $t5, $v1
    /* 2E914 8003E914 5C00A280 */  lb         $v0, 0x5C($a1)
    /* 2E918 8003E918 4300A380 */  lb         $v1, 0x43($a1)
    /* 2E91C 8003E91C 21B0C202 */  addu       $s6, $s6, $v0
    /* 2E920 8003E920 21882302 */  addu       $s1, $s1, $v1
    /* 2E924 8003E924 4200A280 */  lb         $v0, 0x42($a1)
    /* 2E928 8003E928 3000A384 */  lh         $v1, 0x30($a1)
    /* 2E92C 8003E92C 2170C201 */  addu       $t6, $t6, $v0
    /* 2E930 8003E930 21400301 */  addu       $t0, $t0, $v1
    /* 2E934 8003E934 3200A284 */  lh         $v0, 0x32($a1)
    /* 2E938 8003E938 4800A380 */  lb         $v1, 0x48($a1)
    /* 2E93C 8003E93C 4000A8AF */  sw         $t0, 0x40($sp)
    /* 2E940 8003E940 5000A88F */  lw         $t0, 0x50($sp)
    /* 2E944 8003E944 21482201 */  addu       $t1, $t1, $v0
    /* 2E948 8003E948 5D00A280 */  lb         $v0, 0x5D($a1)
    /* 2E94C 8003E94C 21400301 */  addu       $t0, $t0, $v1
    /* 2E950 8003E950 3800A9AF */  sw         $t1, 0x38($sp)
    /* 2E954 8003E954 4800A98F */  lw         $t1, 0x48($sp)
    /* 2E958 8003E958 4500A380 */  lb         $v1, 0x45($a1)
    /* 2E95C 8003E95C 5000A8AF */  sw         $t0, 0x50($sp)
    /* 2E960 8003E960 6000A88F */  lw         $t0, 0x60($sp)
    /* 2E964 8003E964 21482201 */  addu       $t1, $t1, $v0
    /* 2E968 8003E968 4400A280 */  lb         $v0, 0x44($a1)
    /* 2E96C 8003E96C 4800A9AF */  sw         $t1, 0x48($sp)
    /* 2E970 8003E970 5800A98F */  lw         $t1, 0x58($sp)
    /* 2E974 8003E974 21400301 */  addu       $t0, $t0, $v1
    /* 2E978 8003E978 21482201 */  addu       $t1, $t1, $v0
    /* 2E97C 8003E97C 5800A9AF */  sw         $t1, 0x58($sp)
    /* 2E980 8003E980 6000A8AF */  sw         $t0, 0x60($sp)
    /* 2E984 8003E984 4600A280 */  lb         $v0, 0x46($a1)
    /* 2E988 8003E988 4700A380 */  lb         $v1, 0x47($a1)
    /* 2E98C 8003E98C 6800A98F */  lw         $t1, 0x68($sp)
    /* 2E990 8003E990 7000A88F */  lw         $t0, 0x70($sp)
    /* 2E994 8003E994 21482201 */  addu       $t1, $t1, $v0
    /* 2E998 8003E998 21400301 */  addu       $t0, $t0, $v1
    /* 2E99C 8003E99C 6800A9AF */  sw         $t1, 0x68($sp)
    /* 2E9A0 8003E9A0 7000A8AF */  sw         $t0, 0x70($sp)
  .L8003E9A4:
    /* 2E9A4 8003E9A4 9000A98F */  lw         $t1, 0x90($sp)
    /* 2E9A8 8003E9A8 6C008C25 */  addiu      $t4, $t4, 0x6C
    /* 2E9AC 8003E9AC 01002925 */  addiu      $t1, $t1, 0x1
    /* 2E9B0 8003E9B0 E2F90008 */  j          .L8003E788
    /* 2E9B4 8003E9B4 9000A9AF */   sw        $t1, 0x90($sp)
  .L8003E9B8:
    /* 2E9B8 8003E9B8 16006015 */  bnez       $t3, .L8003EA14
    /* 2E9BC 8003E9BC 00000000 */   nop
    /* 2E9C0 8003E9C0 14004015 */  bnez       $t2, .L8003EA14
    /* 2E9C4 8003E9C4 05000224 */   addiu     $v0, $zero, 0x5
    /* 2E9C8 8003E9C8 01000B24 */  addiu      $t3, $zero, 0x1
    /* 2E9CC 8003E9CC 8C030386 */  lh         $v1, 0x38C($s0)
    /* 2E9D0 8003E9D0 00000000 */  nop
    /* 2E9D4 8003E9D4 06006214 */  bne        $v1, $v0, .L8003E9F0
    /* 2E9D8 8003E9D8 01000A24 */   addiu     $t2, $zero, 0x1
    /* 2E9DC 8003E9DC C6030282 */  lb         $v0, 0x3C6($s0)
    /* 2E9E0 8003E9E0 00000000 */  nop
    /* 2E9E4 8003E9E4 02004010 */  beqz       $v0, .L8003E9F0
    /* 2E9E8 8003E9E8 00000000 */   nop
    /* 2E9EC 8003E9EC 03000A24 */  addiu      $t2, $zero, 0x3
  .L8003E9F0:
    /* 2E9F0 8003E9F0 F8030386 */  lh         $v1, 0x3F8($s0)
    /* 2E9F4 8003E9F4 05000224 */  addiu      $v0, $zero, 0x5
    /* 2E9F8 8003E9F8 06006214 */  bne        $v1, $v0, .L8003EA14
    /* 2E9FC 8003E9FC 00000000 */   nop
    /* 2EA00 8003EA00 32040282 */  lb         $v0, 0x432($s0)
    /* 2EA04 8003EA04 00000000 */  nop
    /* 2EA08 8003EA08 02004010 */  beqz       $v0, .L8003EA14
    /* 2EA0C 8003EA0C 00000000 */   nop
    /* 2EA10 8003EA10 03000A24 */  addiu      $t2, $zero, 0x3
  .L8003EA14:
    /* 2EA14 8003EA14 90190BAE */  sw         $t3, 0x1990($s0)
    /* 2EA18 8003EA18 94190AAE */  sw         $t2, 0x1994($s0)
    /* 2EA1C 8003EA1C 98190FAE */  sw         $t7, 0x1998($s0)
    /* 2EA20 8003EA20 9C1918AE */  sw         $t8, 0x199C($s0)
    /* 2EA24 8003EA24 A01919AE */  sw         $t9, 0x19A0($s0)
    /* 2EA28 8003EA28 2000A88F */  lw         $t0, 0x20($sp)
    /* 2EA2C 8003EA2C 00000000 */  nop
    /* 2EA30 8003EA30 A41908AE */  sw         $t0, 0x19A4($s0)
    /* 2EA34 8003EA34 7800A98F */  lw         $t1, 0x78($sp)
    /* 2EA38 8003EA38 0200222A */  slti       $v0, $s1, 0x2
    /* 2EA3C 8003EA3C A8190DAE */  sw         $t5, 0x19A8($s0)
    /* 2EA40 8003EA40 BC190EAE */  sw         $t6, 0x19BC($s0)
    /* 2EA44 8003EA44 02004010 */  beqz       $v0, .L8003EA50
    /* 2EA48 8003EA48 B81909AE */   sw        $t1, 0x19B8($s0)
    /* 2EA4C 8003EA4C 02001124 */  addiu      $s1, $zero, 0x2
  .L8003EA50:
    /* 2EA50 8003EA50 1000222A */  slti       $v0, $s1, 0x10
    /* 2EA54 8003EA54 02004014 */  bnez       $v0, .L8003EA60
    /* 2EA58 8003EA58 00000000 */   nop
    /* 2EA5C 8003EA5C 0F001124 */  addiu      $s1, $zero, 0xF
  .L8003EA60:
    /* 2EA60 8003EA60 D4000282 */  lb         $v0, 0xD4($s0)
    /* 2EA64 8003EA64 00000000 */  nop
    /* 2EA68 8003EA68 0F005110 */  beq        $v0, $s1, .L8003EAA8
    /* 2EA6C 8003EA6C 00000000 */   nop
    /* 2EA70 8003EA70 5B000482 */  lb         $a0, 0x5B($s0)
    /* 2EA74 8003EA74 D934010C */  jal        ChangeLightRadius__Fii
    /* 2EA78 8003EA78 F0232526 */   addiu     $a1, $s1, 0x23F0
    /* 2EA7C 8003EA7C 0A00222A */  slti       $v0, $s1, 0xA
    /* 2EA80 8003EA80 04004010 */  beqz       $v0, .L8003EA94
    /* 2EA84 8003EA84 0A000524 */   addiu     $a1, $zero, 0xA
    /* 2EA88 8003EA88 5C000482 */  lb         $a0, 0x5C($s0)
    /* 2EA8C 8003EA8C A7FA0008 */  j          .L8003EA9C
    /* 2EA90 8003EA90 00000000 */   nop
  .L8003EA94:
    /* 2EA94 8003EA94 5C000482 */  lb         $a0, 0x5C($s0)
    /* 2EA98 8003EA98 21282002 */  addu       $a1, $s1, $zero
  .L8003EA9C:
    /* 2EA9C 8003EA9C 8735010C */  jal        ChangeVisionRadius__Fii
    /* 2EAA0 8003EAA0 00000000 */   nop
    /* 2EAA4 8003EAA4 D40011A2 */  sb         $s1, 0xD4($s0)
  .L8003EAA8:
    /* 2EAA8 8003EAA8 FA000296 */  lhu        $v0, 0xFA($s0)
    /* 2EAAC 8003EAAC 2800A88F */  lw         $t0, 0x28($sp)
    /* 2EAB0 8003EAB0 1280033C */  lui        $v1, %hi(myplr)
    /* 2EAB4 8003EAB4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2EAB8 8003EAB8 21104800 */  addu       $v0, $v0, $t0
    /* 2EABC 8003EABC F80002A6 */  sh         $v0, 0xF8($s0)
    /* 2EAC0 8003EAC0 40100300 */  sll        $v0, $v1, 1
    /* 2EAC4 8003EAC4 21104300 */  addu       $v0, $v0, $v1
    /* 2EAC8 8003EAC8 80100200 */  sll        $v0, $v0, 2
    /* 2EACC 8003EACC 21104300 */  addu       $v0, $v0, $v1
    /* 2EAD0 8003EAD0 00110200 */  sll        $v0, $v0, 4
    /* 2EAD4 8003EAD4 23104300 */  subu       $v0, $v0, $v1
    /* 2EAD8 8003EAD8 80100200 */  sll        $v0, $v0, 2
    /* 2EADC 8003EADC 21104300 */  addu       $v0, $v0, $v1
    /* 2EAE0 8003EAE0 C0180200 */  sll        $v1, $v0, 3
    /* 2EAE4 8003EAE4 0E80013C */  lui        $at, %hi(plr + 0xF8)
    /* 2EAE8 8003EAE8 21082300 */  addu       $at, $at, $v1
    /* 2EAEC 8003EAEC 30A62284 */  lh         $v0, %lo(plr + 0xF8)($at)
    /* 2EAF0 8003EAF0 00000000 */  nop
    /* 2EAF4 8003EAF4 0400401C */  bgtz       $v0, .L8003EB08
    /* 2EAF8 8003EAF8 00000000 */   nop
    /* 2EAFC 8003EAFC 0E80013C */  lui        $at, %hi(plr + 0xF8)
    /* 2EB00 8003EB00 21082300 */  addu       $at, $at, $v1
    /* 2EB04 8003EB04 30A620A4 */  sh         $zero, %lo(plr + 0xF8)($at)
  .L8003EB08:
    /* 2EB08 8003EB08 FE000296 */  lhu        $v0, 0xFE($s0)
    /* 2EB0C 8003EB0C 1280033C */  lui        $v1, %hi(myplr)
    /* 2EB10 8003EB10 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2EB14 8003EB14 21105300 */  addu       $v0, $v0, $s3
    /* 2EB18 8003EB18 FC0002A6 */  sh         $v0, 0xFC($s0)
    /* 2EB1C 8003EB1C 40100300 */  sll        $v0, $v1, 1
    /* 2EB20 8003EB20 21104300 */  addu       $v0, $v0, $v1
    /* 2EB24 8003EB24 80100200 */  sll        $v0, $v0, 2
    /* 2EB28 8003EB28 21104300 */  addu       $v0, $v0, $v1
    /* 2EB2C 8003EB2C 00110200 */  sll        $v0, $v0, 4
    /* 2EB30 8003EB30 23104300 */  subu       $v0, $v0, $v1
    /* 2EB34 8003EB34 80100200 */  sll        $v0, $v0, 2
    /* 2EB38 8003EB38 21104300 */  addu       $v0, $v0, $v1
    /* 2EB3C 8003EB3C C0180200 */  sll        $v1, $v0, 3
    /* 2EB40 8003EB40 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* 2EB44 8003EB44 21082300 */  addu       $at, $at, $v1
    /* 2EB48 8003EB48 34A62284 */  lh         $v0, %lo(plr + 0xFC)($at)
    /* 2EB4C 8003EB4C 00000000 */  nop
    /* 2EB50 8003EB50 0400401C */  bgtz       $v0, .L8003EB64
    /* 2EB54 8003EB54 00000000 */   nop
    /* 2EB58 8003EB58 0E80013C */  lui        $at, %hi(plr + 0xFC)
    /* 2EB5C 8003EB5C 21082300 */  addu       $at, $at, $v1
    /* 2EB60 8003EB60 34A620A4 */  sh         $zero, %lo(plr + 0xFC)($at)
  .L8003EB64:
    /* 2EB64 8003EB64 02010296 */  lhu        $v0, 0x102($s0)
    /* 2EB68 8003EB68 3000A98F */  lw         $t1, 0x30($sp)
    /* 2EB6C 8003EB6C 1280033C */  lui        $v1, %hi(myplr)
    /* 2EB70 8003EB70 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2EB74 8003EB74 21104900 */  addu       $v0, $v0, $t1
    /* 2EB78 8003EB78 000102A6 */  sh         $v0, 0x100($s0)
    /* 2EB7C 8003EB7C 40100300 */  sll        $v0, $v1, 1
    /* 2EB80 8003EB80 21104300 */  addu       $v0, $v0, $v1
    /* 2EB84 8003EB84 80100200 */  sll        $v0, $v0, 2
    /* 2EB88 8003EB88 21104300 */  addu       $v0, $v0, $v1
    /* 2EB8C 8003EB8C 00110200 */  sll        $v0, $v0, 4
    /* 2EB90 8003EB90 23104300 */  subu       $v0, $v0, $v1
    /* 2EB94 8003EB94 80100200 */  sll        $v0, $v0, 2
    /* 2EB98 8003EB98 21104300 */  addu       $v0, $v0, $v1
    /* 2EB9C 8003EB9C C0180200 */  sll        $v1, $v0, 3
    /* 2EBA0 8003EBA0 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 2EBA4 8003EBA4 21082300 */  addu       $at, $at, $v1
    /* 2EBA8 8003EBA8 38A62284 */  lh         $v0, %lo(plr + 0x100)($at)
    /* 2EBAC 8003EBAC 00000000 */  nop
    /* 2EBB0 8003EBB0 0400401C */  bgtz       $v0, .L8003EBC4
    /* 2EBB4 8003EBB4 00000000 */   nop
    /* 2EBB8 8003EBB8 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 2EBBC 8003EBBC 21082300 */  addu       $at, $at, $v1
    /* 2EBC0 8003EBC0 38A620A4 */  sh         $zero, %lo(plr + 0x100)($at)
  .L8003EBC4:
    /* 2EBC4 8003EBC4 06010296 */  lhu        $v0, 0x106($s0)
    /* 2EBC8 8003EBC8 1280033C */  lui        $v1, %hi(myplr)
    /* 2EBCC 8003EBCC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2EBD0 8003EBD0 21105200 */  addu       $v0, $v0, $s2
    /* 2EBD4 8003EBD4 040102A6 */  sh         $v0, 0x104($s0)
    /* 2EBD8 8003EBD8 40100300 */  sll        $v0, $v1, 1
    /* 2EBDC 8003EBDC 21104300 */  addu       $v0, $v0, $v1
    /* 2EBE0 8003EBE0 80100200 */  sll        $v0, $v0, 2
    /* 2EBE4 8003EBE4 21104300 */  addu       $v0, $v0, $v1
    /* 2EBE8 8003EBE8 00110200 */  sll        $v0, $v0, 4
    /* 2EBEC 8003EBEC 23104300 */  subu       $v0, $v0, $v1
    /* 2EBF0 8003EBF0 80100200 */  sll        $v0, $v0, 2
    /* 2EBF4 8003EBF4 21104300 */  addu       $v0, $v0, $v1
    /* 2EBF8 8003EBF8 C0180200 */  sll        $v1, $v0, 3
    /* 2EBFC 8003EBFC 0E80013C */  lui        $at, %hi(plr + 0x104)
    /* 2EC00 8003EC00 21082300 */  addu       $at, $at, $v1
    /* 2EC04 8003EC04 3CA62284 */  lh         $v0, %lo(plr + 0x104)($at)
    /* 2EC08 8003EC08 00000000 */  nop
    /* 2EC0C 8003EC0C 0400401C */  bgtz       $v0, .L8003EC20
    /* 2EC10 8003EC10 00000000 */   nop
    /* 2EC14 8003EC14 0E80013C */  lui        $at, %hi(plr + 0x104)
    /* 2EC18 8003EC18 21082300 */  addu       $at, $at, $v1
    /* 2EC1C 8003EC1C 3CA620A4 */  sh         $zero, %lo(plr + 0x104)($at)
  .L8003EC20:
    /* 2EC20 8003EC20 F6000382 */  lb         $v1, 0xF6($s0)
    /* 2EC24 8003EC24 01000224 */  addiu      $v0, $zero, 0x1
    /* 2EC28 8003EC28 10006214 */  bne        $v1, $v0, .L8003EC6C
    /* 2EC2C 8003EC2C 00000000 */   nop
    /* 2EC30 8003EC30 F8000286 */  lh         $v0, 0xF8($s0)
    /* 2EC34 8003EC34 00010386 */  lh         $v1, 0x100($s0)
    /* 2EC38 8003EC38 3C010482 */  lb         $a0, 0x13C($s0)
    /* 2EC3C 8003EC3C 21104300 */  addu       $v0, $v0, $v1
    /* 2EC40 8003EC40 18004400 */  mult       $v0, $a0
    /* 2EC44 8003EC44 12100000 */  mflo       $v0
    /* 2EC48 8003EC48 EB51033C */  lui        $v1, (0x51EB851F >> 16)
    /* 2EC4C 8003EC4C 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 2EC50 8003EC50 18004300 */  mult       $v0, $v1
    /* 2EC54 8003EC54 C3170200 */  sra        $v0, $v0, 31
    /* 2EC58 8003EC58 10400000 */  mfhi       $t0
    /* 2EC5C 8003EC5C 83190800 */  sra        $v1, $t0, 6
    /* 2EC60 8003EC60 23186200 */  subu       $v1, $v1, $v0
    /* 2EC64 8003EC64 28FB0008 */  j          .L8003ECA0
    /* 2EC68 8003EC68 0C0103AE */   sw        $v1, 0x10C($s0)
  .L8003EC6C:
    /* 2EC6C 8003EC6C F8000386 */  lh         $v1, 0xF8($s0)
    /* 2EC70 8003EC70 3C010282 */  lb         $v0, 0x13C($s0)
    /* 2EC74 8003EC74 00000000 */  nop
    /* 2EC78 8003EC78 18006200 */  mult       $v1, $v0
    /* 2EC7C 8003EC7C 12180000 */  mflo       $v1
    /* 2EC80 8003EC80 EB51023C */  lui        $v0, (0x51EB851F >> 16)
    /* 2EC84 8003EC84 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
    /* 2EC88 8003EC88 18006200 */  mult       $v1, $v0
    /* 2EC8C 8003EC8C C31F0300 */  sra        $v1, $v1, 31
    /* 2EC90 8003EC90 10400000 */  mfhi       $t0
    /* 2EC94 8003EC94 43110800 */  sra        $v0, $t0, 5
    /* 2EC98 8003EC98 23104300 */  subu       $v0, $v0, $v1
    /* 2EC9C 8003EC9C 0C0102AE */  sw         $v0, 0x10C($s0)
  .L8003ECA0:
    /* 2ECA0 8003ECA0 68000382 */  lb         $v1, 0x68($s0)
    /* 2ECA4 8003ECA4 03000224 */  addiu      $v0, $zero, 0x3
    /* 2ECA8 8003ECA8 B01914AE */  sw         $s4, 0x19B0($s0)
    /* 2ECAC 8003ECAC B41915AE */  sw         $s5, 0x19B4($s0)
    /* 2ECB0 8003ECB0 1E006214 */  bne        $v1, $v0, .L8003ED2C
    /* 2ECB4 8003ECB4 00000000 */   nop
    /* 2ECB8 8003ECB8 6400028E */  lw         $v0, 0x64($s0)
    /* 2ECBC 8003ECBC 00000000 */  nop
    /* 2ECC0 8003ECC0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2ECC4 8003ECC4 801E0200 */  sll        $v1, $v0, 26
    /* 2ECC8 8003ECC8 04006104 */  bgez       $v1, .L8003ECDC
    /* 2ECCC 8003ECCC 00000000 */   nop
    /* 2ECD0 8003ECD0 06205500 */  srlv       $a0, $s5, $v0
    /* 2ECD4 8003ECD4 07000104 */  bgez       $zero, .L8003ECF4
    /* 2ECD8 8003ECD8 21280000 */   addu      $a1, $zero, $zero
  .L8003ECDC:
    /* 2ECDC 8003ECDC 04006010 */  beqz       $v1, .L8003ECF0
    /* 2ECE0 8003ECE0 06205400 */   srlv      $a0, $s4, $v0
    /* 2ECE4 8003ECE4 23180200 */  negu       $v1, $v0
    /* 2ECE8 8003ECE8 04187500 */  sllv       $v1, $s5, $v1
    /* 2ECEC 8003ECEC 25208300 */  or         $a0, $a0, $v1
  .L8003ECF0:
    /* 2ECF0 8003ECF0 06285500 */  srlv       $a1, $s5, $v0
  .L8003ECF4:
    /* 2ECF4 8003ECF4 00000324 */  addiu      $v1, $zero, 0x0
    /* 2ECF8 8003ECF8 01000224 */  addiu      $v0, $zero, 0x1
    /* 2ECFC 8003ECFC 2428A300 */  and        $a1, $a1, $v1
    /* 2ED00 8003ED00 24208200 */  and        $a0, $a0, $v0
    /* 2ED04 8003ED04 09008014 */  bnez       $a0, .L8003ED2C
    /* 2ED08 8003ED08 00000000 */   nop
    /* 2ED0C 8003ED0C 0700A014 */  bnez       $a1, .L8003ED2C
    /* 2ED10 8003ED10 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 2ED14 8003ED14 640002AE */  sw         $v0, 0x64($s0)
    /* 2ED18 8003ED18 04000224 */  addiu      $v0, $zero, 0x4
    /* 2ED1C 8003ED1C 680002A2 */  sb         $v0, 0x68($s0)
    /* 2ED20 8003ED20 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 2ED24 8003ED24 1280013C */  lui        $at, %hi(force_redraw)
    /* 2ED28 8003ED28 90B722AC */  sw         $v0, %lo(force_redraw)($at)
  .L8003ED2C:
    /* 2ED2C 8003ED2C 4800A993 */  lbu        $t1, 0x48($sp)
    /* 2ED30 8003ED30 00000000 */  nop
    /* 2ED34 8003ED34 C01909A2 */  sb         $t1, 0x19C0($s0)
    /* 2ED38 8003ED38 5000A88F */  lw         $t0, 0x50($sp)
    /* 2ED3C 8003ED3C 00000000 */  nop
    /* 2ED40 8003ED40 C81908AE */  sw         $t0, 0x19C8($s0)
    /* 2ED44 8003ED44 7800A98F */  lw         $t1, 0x78($sp)
    /* 2ED48 8003ED48 00000000 */  nop
    /* 2ED4C 8003ED4C 05002105 */  bgez       $t1, .L8003ED64
    /* 2ED50 8003ED50 4C00C22A */   slti      $v0, $s6, 0x4C
    /* 2ED54 8003ED54 21B00000 */  addu       $s6, $zero, $zero
    /* 2ED58 8003ED58 21B80000 */  addu       $s7, $zero, $zero
    /* 2ED5C 8003ED5C 21F00000 */  addu       $fp, $zero, $zero
    /* 2ED60 8003ED60 4C00C22A */  slti       $v0, $s6, 0x4C
  .L8003ED64:
    /* 2ED64 8003ED64 02004014 */  bnez       $v0, .L8003ED70
    /* 2ED68 8003ED68 4C00E22A */   slti      $v0, $s7, 0x4C
    /* 2ED6C 8003ED6C 4B001624 */  addiu      $s6, $zero, 0x4B
  .L8003ED70:
    /* 2ED70 8003ED70 02004014 */  bnez       $v0, .L8003ED7C
    /* 2ED74 8003ED74 4D0116A2 */   sb        $s6, 0x14D($s0)
    /* 2ED78 8003ED78 4B001724 */  addiu      $s7, $zero, 0x4B
  .L8003ED7C:
    /* 2ED7C 8003ED7C 4C00C22B */  slti       $v0, $fp, 0x4C
    /* 2ED80 8003ED80 02004014 */  bnez       $v0, .L8003ED8C
    /* 2ED84 8003ED84 4E0117A2 */   sb        $s7, 0x14E($s0)
    /* 2ED88 8003ED88 4B001E24 */  addiu      $fp, $zero, 0x4B
  .L8003ED8C:
    /* 2ED8C 8003ED8C F6000382 */  lb         $v1, 0xF6($s0)
    /* 2ED90 8003ED90 00000000 */  nop
    /* 2ED94 8003ED94 02006014 */  bnez       $v1, .L8003EDA0
    /* 2ED98 8003ED98 4F011EA2 */   sb        $fp, 0x14F($s0)
    /* 2ED9C 8003ED9C 40901200 */  sll        $s2, $s2, 1
  .L8003EDA0:
    /* 2EDA0 8003EDA0 01000424 */  addiu      $a0, $zero, 0x1
    /* 2EDA4 8003EDA4 02006414 */  bne        $v1, $a0, .L8003EDB0
    /* 2EDA8 8003EDA8 43101200 */   sra       $v0, $s2, 1
    /* 2EDAC 8003EDAC 21904202 */  addu       $s2, $s2, $v0
  .L8003EDB0:
    /* 2EDB0 8003EDB0 3800A88F */  lw         $t0, 0x38($sp)
    /* 2EDB4 8003EDB4 80111200 */  sll        $v0, $s2, 6
    /* 2EDB8 8003EDB8 21400201 */  addu       $t0, $t0, $v0
    /* 2EDBC 8003EDBC 02000224 */  addiu      $v0, $zero, 0x2
    /* 2EDC0 8003EDC0 02006214 */  bne        $v1, $v0, .L8003EDCC
    /* 2EDC4 8003EDC4 3800A8AF */   sw        $t0, 0x38($sp)
    /* 2EDC8 8003EDC8 40981300 */  sll        $s3, $s3, 1
  .L8003EDCC:
    /* 2EDCC 8003EDCC 04006414 */  bne        $v1, $a0, .L8003EDE0
    /* 2EDD0 8003EDD0 80191300 */   sll       $v1, $s3, 6
    /* 2EDD4 8003EDD4 43101300 */  sra        $v0, $s3, 1
    /* 2EDD8 8003EDD8 21986202 */  addu       $s3, $s3, $v0
    /* 2EDDC 8003EDDC 80191300 */  sll        $v1, $s3, 6
  .L8003EDE0:
    /* 2EDE0 8003EDE0 1401028E */  lw         $v0, 0x114($s0)
    /* 2EDE4 8003EDE4 4000A98F */  lw         $t1, 0x40($sp)
    /* 2EDE8 8003EDE8 3800A88F */  lw         $t0, 0x38($sp)
    /* 2EDEC 8003EDEC 21482301 */  addu       $t1, $t1, $v1
    /* 2EDF0 8003EDF0 21104800 */  addu       $v0, $v0, $t0
    /* 2EDF4 8003EDF4 4000A9AF */  sw         $t1, 0x40($sp)
    /* 2EDF8 8003EDF8 1C0102AE */  sw         $v0, 0x11C($s0)
    /* 2EDFC 8003EDFC 1801028E */  lw         $v0, 0x118($s0)
    /* 2EE00 8003EE00 1C01038E */  lw         $v1, 0x11C($s0)
    /* 2EE04 8003EE04 21104800 */  addu       $v0, $v0, $t0
    /* 2EE08 8003EE08 83190300 */  sra        $v1, $v1, 6
    /* 2EE0C 8003EE0C 0400601C */  bgtz       $v1, .L8003EE20
    /* 2EE10 8003EE10 200102AE */   sw        $v0, 0x120($s0)
    /* 2EE14 8003EE14 1000A48F */  lw         $a0, 0x10($sp)
    /* 2EE18 8003EE18 3C9B010C */  jal        SetPlayerHitPoints__Fii
    /* 2EE1C 8003EE1C 21280000 */   addu      $a1, $zero, $zero
  .L8003EE20:
    /* 2EE20 8003EE20 5800A98F */  lw         $t1, 0x58($sp)
    /* 2EE24 8003EE24 2801028E */  lw         $v0, 0x128($s0)
    /* 2EE28 8003EE28 CC1909AE */  sw         $t1, 0x19CC($s0)
    /* 2EE2C 8003EE2C 6000A88F */  lw         $t0, 0x60($sp)
    /* 2EE30 8003EE30 00000000 */  nop
    /* 2EE34 8003EE34 D01908AE */  sw         $t0, 0x19D0($s0)
    /* 2EE38 8003EE38 6800A98F */  lw         $t1, 0x68($sp)
    /* 2EE3C 8003EE3C 00000000 */  nop
    /* 2EE40 8003EE40 D41909AE */  sw         $t1, 0x19D4($s0)
    /* 2EE44 8003EE44 7000A88F */  lw         $t0, 0x70($sp)
    /* 2EE48 8003EE48 00000000 */  nop
    /* 2EE4C 8003EE4C D81908AE */  sw         $t0, 0x19D8($s0)
    /* 2EE50 8003EE50 4000A98F */  lw         $t1, 0x40($sp)
    /* 2EE54 8003EE54 2C01038E */  lw         $v1, 0x12C($s0)
    /* 2EE58 8003EE58 21104900 */  addu       $v0, $v0, $t1
    /* 2EE5C 8003EE5C 300102AE */  sw         $v0, 0x130($s0)
    /* 2EE60 8003EE60 21186900 */  addu       $v1, $v1, $t1
    /* 2EE64 8003EE64 340103AE */  sw         $v1, 0x134($s0)
    /* 2EE68 8003EE68 7800A88F */  lw         $t0, 0x78($sp)
    /* 2EE6C 8003EE6C 00000000 */  nop
    /* 2EE70 8003EE70 01000231 */  andi       $v0, $t0, 0x1
    /* 2EE74 8003EE74 03004010 */  beqz       $v0, .L8003EE84
    /* 2EE78 8003EE78 01000224 */   addiu     $v0, $zero, 0x1
    /* 2EE7C 8003EE7C A2FB0008 */  j          .L8003EE88
    /* 2EE80 8003EE80 540102A2 */   sb        $v0, 0x154($s0)
  .L8003EE84:
    /* 2EE84 8003EE84 540100A2 */  sb         $zero, 0x154($s0)
  .L8003EE88:
    /* 2EE88 8003EE88 21280000 */  addu       $a1, $zero, $zero
    /* 2EE8C 8003EE8C 8C030486 */  lh         $a0, 0x38C($s0)
    /* 2EE90 8003EE90 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2EE94 8003EE94 D20000A2 */  sb         $zero, 0xD2($s0)
    /* 2EE98 8003EE98 0A008210 */  beq        $a0, $v0, .L8003EEC4
    /* 2EE9C 8003EE9C D10000A2 */   sb        $zero, 0xD1($s0)
    /* 2EEA0 8003EEA0 B5030382 */  lb         $v1, 0x3B5($s0)
    /* 2EEA4 8003EEA4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2EEA8 8003EEA8 06006214 */  bne        $v1, $v0, .L8003EEC4
    /* 2EEAC 8003EEAC 00000000 */   nop
    /* 2EEB0 8003EEB0 C6030282 */  lb         $v0, 0x3C6($s0)
    /* 2EEB4 8003EEB4 00000000 */  nop
    /* 2EEB8 8003EEB8 2B100200 */  sltu       $v0, $zero, $v0
    /* 2EEBC 8003EEBC 23100200 */  negu       $v0, $v0
    /* 2EEC0 8003EEC0 24288200 */  and        $a1, $a0, $v0
  .L8003EEC4:
    /* 2EEC4 8003EEC4 F8030486 */  lh         $a0, 0x3F8($s0)
    /* 2EEC8 8003EEC8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2EECC 8003EECC 0A008210 */  beq        $a0, $v0, .L8003EEF8
    /* 2EED0 8003EED0 01000224 */   addiu     $v0, $zero, 0x1
    /* 2EED4 8003EED4 21040382 */  lb         $v1, 0x421($s0)
    /* 2EED8 8003EED8 00000000 */  nop
    /* 2EEDC 8003EEDC 06006214 */  bne        $v1, $v0, .L8003EEF8
    /* 2EEE0 8003EEE0 00000000 */   nop
    /* 2EEE4 8003EEE4 32040282 */  lb         $v0, 0x432($s0)
    /* 2EEE8 8003EEE8 00000000 */  nop
    /* 2EEEC 8003EEEC 03004010 */  beqz       $v0, .L8003EEFC
    /* 2EEF0 8003EEF0 FFFFA324 */   addiu     $v1, $a1, -0x1
    /* 2EEF4 8003EEF4 21288000 */  addu       $a1, $a0, $zero
  .L8003EEF8:
    /* 2EEF8 8003EEF8 FFFFA324 */  addiu      $v1, $a1, -0x1
  .L8003EEFC:
    /* 2EEFC 8003EEFC 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 2EF00 8003EF00 12004010 */  beqz       $v0, .L8003EF4C
    /* 2EF04 8003EF04 80100300 */   sll       $v0, $v1, 2
    /* 2EF08 8003EF08 1180013C */  lui        $at, %hi(jtbl_80116240)
    /* 2EF0C 8003EF0C 21082200 */  addu       $at, $at, $v0
    /* 2EF10 8003EF10 4062228C */  lw         $v0, %lo(jtbl_80116240)($at)
    /* 2EF14 8003EF14 00000000 */  nop
    /* 2EF18 8003EF18 08004000 */  jr         $v0
    /* 2EF1C 8003EF1C 00000000 */   nop
  jlabel .L8003EF20
    /* 2EF20 8003EF20 D3FB0008 */  j          .L8003EF4C
    /* 2EF24 8003EF24 02000524 */   addiu     $a1, $zero, 0x2
  jlabel .L8003EF28
    /* 2EF28 8003EF28 D3FB0008 */  j          .L8003EF4C
    /* 2EF2C 8003EF2C 06000524 */   addiu     $a1, $zero, 0x6
  jlabel .L8003EF30
    /* 2EF30 8003EF30 01000224 */  addiu      $v0, $zero, 0x1
    /* 2EF34 8003EF34 D10002A2 */  sb         $v0, 0xD1($s0)
    /* 2EF38 8003EF38 D3FB0008 */  j          .L8003EF4C
    /* 2EF3C 8003EF3C 04000524 */   addiu     $a1, $zero, 0x4
  jlabel .L8003EF40
    /* 2EF40 8003EF40 D3FB0008 */  j          .L8003EF4C
    /* 2EF44 8003EF44 05000524 */   addiu     $a1, $zero, 0x5
  jlabel .L8003EF48
    /* 2EF48 8003EF48 08000524 */  addiu      $a1, $zero, 0x8
  jlabel .L8003EF4C
    /* 2EF4C 8003EF4C 8C030386 */  lh         $v1, 0x38C($s0)
    /* 2EF50 8003EF50 05000224 */  addiu      $v0, $zero, 0x5
    /* 2EF54 8003EF54 07006214 */  bne        $v1, $v0, .L8003EF74
    /* 2EF58 8003EF58 00000000 */   nop
    /* 2EF5C 8003EF5C C6030282 */  lb         $v0, 0x3C6($s0)
    /* 2EF60 8003EF60 00000000 */  nop
    /* 2EF64 8003EF64 03004010 */  beqz       $v0, .L8003EF74
    /* 2EF68 8003EF68 01000224 */   addiu     $v0, $zero, 0x1
    /* 2EF6C 8003EF6C D20002A2 */  sb         $v0, 0xD2($s0)
    /* 2EF70 8003EF70 0100A524 */  addiu      $a1, $a1, 0x1
  .L8003EF74:
    /* 2EF74 8003EF74 F8030386 */  lh         $v1, 0x3F8($s0)
    /* 2EF78 8003EF78 05000224 */  addiu      $v0, $zero, 0x5
    /* 2EF7C 8003EF7C 07006214 */  bne        $v1, $v0, .L8003EF9C
    /* 2EF80 8003EF80 00000000 */   nop
    /* 2EF84 8003EF84 32040282 */  lb         $v0, 0x432($s0)
    /* 2EF88 8003EF88 00000000 */  nop
    /* 2EF8C 8003EF8C 03004010 */  beqz       $v0, .L8003EF9C
    /* 2EF90 8003EF90 01000224 */   addiu     $v0, $zero, 0x1
    /* 2EF94 8003EF94 D20002A2 */  sb         $v0, 0xD2($s0)
    /* 2EF98 8003EF98 0100A524 */  addiu      $a1, $a1, 0x1
  .L8003EF9C:
    /* 2EF9C 8003EF9C 64040386 */  lh         $v1, 0x464($s0)
    /* 2EFA0 8003EFA0 08000224 */  addiu      $v0, $zero, 0x8
    /* 2EFA4 8003EFA4 07006214 */  bne        $v1, $v0, .L8003EFC4
    /* 2EFA8 8003EFA8 09000224 */   addiu     $v0, $zero, 0x9
    /* 2EFAC 8003EFAC 9E040282 */  lb         $v0, 0x49E($s0)
    /* 2EFB0 8003EFB0 00000000 */  nop
    /* 2EFB4 8003EFB4 03004010 */  beqz       $v0, .L8003EFC4
    /* 2EFB8 8003EFB8 09000224 */   addiu     $v0, $zero, 0x9
    /* 2EFBC 8003EFBC 1000A524 */  addiu      $a1, $a1, 0x10
    /* 2EFC0 8003EFC0 64040386 */  lh         $v1, 0x464($s0)
  .L8003EFC4:
    /* 2EFC4 8003EFC4 00000000 */  nop
    /* 2EFC8 8003EFC8 06006214 */  bne        $v1, $v0, .L8003EFE4
    /* 2EFCC 8003EFCC 00000000 */   nop
    /* 2EFD0 8003EFD0 9E040282 */  lb         $v0, 0x49E($s0)
    /* 2EFD4 8003EFD4 00000000 */  nop
    /* 2EFD8 8003EFD8 02004010 */  beqz       $v0, .L8003EFE4
    /* 2EFDC 8003EFDC 00000000 */   nop
    /* 2EFE0 8003EFE0 2000A524 */  addiu      $a1, $a1, 0x20
  .L8003EFE4:
    /* 2EFE4 8003EFE4 43000282 */  lb         $v0, 0x43($s0)
    /* 2EFE8 8003EFE8 00000000 */  nop
    /* 2EFEC 8003EFEC 12004510 */  beq        $v0, $a1, .L8003F038
    /* 2EFF0 8003EFF0 00000000 */   nop
    /* 2EFF4 8003EFF4 1800A293 */  lbu        $v0, 0x18($sp)
    /* 2EFF8 8003EFF8 00000000 */  nop
    /* 2EFFC 8003EFFC 0E004010 */  beqz       $v0, .L8003F038
    /* 2F000 8003F000 00000000 */   nop
    /* 2F004 8003F004 1000A48F */  lw         $a0, 0x10($sp)
    /* 2F008 8003F008 430005A2 */  sb         $a1, 0x43($s0)
    /* 2F00C 8003F00C 829C010C */  jal        SetPlrAnims__Fi
    /* 2F010 8003F010 840100AE */   sw        $zero, 0x184($s0)
    /* 2F014 8003F014 9001038E */  lw         $v1, 0x190($s0)
    /* 2F018 8003F018 01000224 */  addiu      $v0, $zero, 0x1
    /* 2F01C 8003F01C 540002AE */  sw         $v0, 0x54($s0)
    /* 2F020 8003F020 03000224 */  addiu      $v0, $zero, 0x3
    /* 2F024 8003F024 880100A2 */  sb         $zero, 0x188($s0)
    /* 2F028 8003F028 4C0000AE */  sw         $zero, 0x4C($s0)
    /* 2F02C 8003F02C 480002AE */  sw         $v0, 0x48($s0)
    /* 2F030 8003F030 0FFC0008 */  j          .L8003F03C
    /* 2F034 8003F034 500003AE */   sw        $v1, 0x50($s0)
  .L8003F038:
    /* 2F038 8003F038 430005A2 */  sb         $a1, 0x43($s0)
  .L8003F03C:
    /* 2F03C 8003F03C 1280023C */  lui        $v0, %hi(nummissiles)
    /* 2F040 8003F040 88C2428C */  lw         $v0, %lo(nummissiles)($v0)
    /* 2F044 8003F044 00000000 */  nop
    /* 2F048 8003F048 27004018 */  blez       $v0, .L8003F0E8
    /* 2F04C 8003F04C 9000A0AF */   sw        $zero, 0x90($sp)
    /* 2F050 8003F050 0D000624 */  addiu      $a2, $zero, 0xD
    /* 2F054 8003F054 21284000 */  addu       $a1, $v0, $zero
    /* 2F058 8003F058 1080043C */  lui        $a0, %hi(missileactive)
    /* 2F05C 8003F05C 602A8424 */  addiu      $a0, $a0, %lo(missileactive)
  .L8003F060:
    /* 2F060 8003F060 00008284 */  lh         $v0, 0x0($a0)
    /* 2F064 8003F064 00000000 */  nop
    /* 2F068 8003F068 80180200 */  sll        $v1, $v0, 2
    /* 2F06C 8003F06C 21186200 */  addu       $v1, $v1, $v0
    /* 2F070 8003F070 80180300 */  sll        $v1, $v1, 2
    /* 2F074 8003F074 23186200 */  subu       $v1, $v1, $v0
    /* 2F078 8003F078 80180300 */  sll        $v1, $v1, 2
    /* 2F07C 8003F07C 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 2F080 8003F080 21082300 */  addu       $at, $at, $v1
    /* 2F084 8003F084 882C2280 */  lb         $v0, %lo(missile + 0x30)($at)
    /* 2F088 8003F088 00000000 */  nop
    /* 2F08C 8003F08C 10004614 */  bne        $v0, $a2, .L8003F0D0
    /* 2F090 8003F090 00000000 */   nop
    /* 2F094 8003F094 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 2F098 8003F098 21082300 */  addu       $at, $at, $v1
    /* 2F09C 8003F09C 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 2F0A0 8003F0A0 1000A98F */  lw         $t1, 0x10($sp)
    /* 2F0A4 8003F0A4 00000000 */  nop
    /* 2F0A8 8003F0A8 09004914 */  bne        $v0, $t1, .L8003F0D0
    /* 2F0AC 8003F0AC 00000000 */   nop
    /* 2F0B0 8003F0B0 1C01028E */  lw         $v0, 0x11C($s0)
    /* 2F0B4 8003F0B4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 2F0B8 8003F0B8 21082300 */  addu       $at, $at, $v1
    /* 2F0BC 8003F0BC 762C22A4 */  sh         $v0, %lo(missile + 0x1E)($at)
    /* 2F0C0 8003F0C0 1401028E */  lw         $v0, 0x114($s0)
    /* 2F0C4 8003F0C4 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 2F0C8 8003F0C8 21082300 */  addu       $at, $at, $v1
    /* 2F0CC 8003F0CC 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
  .L8003F0D0:
    /* 2F0D0 8003F0D0 9000A88F */  lw         $t0, 0x90($sp)
    /* 2F0D4 8003F0D4 02008424 */  addiu      $a0, $a0, 0x2
    /* 2F0D8 8003F0D8 01000825 */  addiu      $t0, $t0, 0x1
    /* 2F0DC 8003F0DC 2A100501 */  slt        $v0, $t0, $a1
    /* 2F0E0 8003F0E0 DFFF4014 */  bnez       $v0, .L8003F060
    /* 2F0E4 8003F0E4 9000A8AF */   sw        $t0, 0x90($sp)
  .L8003F0E8:
    /* 2F0E8 8003F0E8 01000224 */  addiu      $v0, $zero, 0x1
    /* 2F0EC 8003F0EC 1280013C */  lui        $at, %hi(drawmanaflag)
    /* 2F0F0 8003F0F0 BFB622A0 */  sb         $v0, %lo(drawmanaflag)($at)
    /* 2F0F4 8003F0F4 1280013C */  lui        $at, %hi(drawhpflag)
    /* 2F0F8 8003F0F8 BEB622A0 */  sb         $v0, %lo(drawhpflag)($at)
    /* 2F0FC 8003F0FC BC00BF8F */  lw         $ra, 0xBC($sp)
    /* 2F100 8003F100 B800BE8F */  lw         $fp, 0xB8($sp)
    /* 2F104 8003F104 B400B78F */  lw         $s7, 0xB4($sp)
    /* 2F108 8003F108 B000B68F */  lw         $s6, 0xB0($sp)
    /* 2F10C 8003F10C AC00B58F */  lw         $s5, 0xAC($sp)
    /* 2F110 8003F110 A800B48F */  lw         $s4, 0xA8($sp)
    /* 2F114 8003F114 A400B38F */  lw         $s3, 0xA4($sp)
    /* 2F118 8003F118 A000B28F */  lw         $s2, 0xA0($sp)
    /* 2F11C 8003F11C 9C00B18F */  lw         $s1, 0x9C($sp)
    /* 2F120 8003F120 9800B08F */  lw         $s0, 0x98($sp)
    /* 2F124 8003F124 C000BD27 */  addiu      $sp, $sp, 0xC0
    /* 2F128 8003F128 0800E003 */  jr         $ra
    /* 2F12C 8003F12C 00000000 */   nop
endlabel CalcPlrItemVals__FiUc
