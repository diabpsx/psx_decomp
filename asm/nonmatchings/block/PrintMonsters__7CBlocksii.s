.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintMonsters__7CBlocksii, 0xAA4

glabel PrintMonsters__7CBlocksii
    /* 7F5F8 8008F5F8 B8FEBD27 */  addiu      $sp, $sp, -0x148
    /* 7F5FC 8008F5FC 2001B0AF */  sw         $s0, 0x120($sp)
    /* 7F600 8008F600 2180A000 */  addu       $s0, $a1, $zero
    /* 7F604 8008F604 2401B1AF */  sw         $s1, 0x124($sp)
    /* 7F608 8008F608 2188C000 */  addu       $s1, $a2, $zero
    /* 7F60C 8008F60C 0980073C */  lui        $a3, %hi(AddMonst__FP9CacheInfoP8map_infoii)
    /* 7F610 8008F610 10F5E724 */  addiu      $a3, $a3, %lo(AddMonst__FP9CacheInfoP8map_infoii)
    /* 7F614 8008F614 2800A4AF */  sw         $a0, 0x28($sp)
    /* 7F618 8008F618 2800A48F */  lw         $a0, 0x28($sp)
    /* 7F61C 8008F61C 01000224 */  addiu      $v0, $zero, 0x1
    /* 7F620 8008F620 4401BFAF */  sw         $ra, 0x144($sp)
    /* 7F624 8008F624 4001BEAF */  sw         $fp, 0x140($sp)
    /* 7F628 8008F628 3C01B7AF */  sw         $s7, 0x13C($sp)
    /* 7F62C 8008F62C 3801B6AF */  sw         $s6, 0x138($sp)
    /* 7F630 8008F630 3401B5AF */  sw         $s5, 0x134($sp)
    /* 7F634 8008F634 3001B4AF */  sw         $s4, 0x130($sp)
    /* 7F638 8008F638 2C01B3AF */  sw         $s3, 0x12C($sp)
    /* 7F63C 8008F63C 2801B2AF */  sw         $s2, 0x128($sp)
    /* 7F640 8008F640 263C020C */  jal        IterateVisibleMap__7CBlocksiiPFP9CacheInfoP8map_infoii_ib
    /* 7F644 8008F644 1000A2AF */   sw        $v0, 0x10($sp)
    /* 7F648 8008F648 F9FF1026 */  addiu      $s0, $s0, -0x7
    /* 7F64C 8008F64C 21280002 */  addu       $a1, $s0, $zero
    /* 7F650 8008F650 2800A48F */  lw         $a0, 0x28($sp)
    /* 7F654 8008F654 801F0D3C */  lui        $t5, (0x1F800000 >> 16)
    /* 7F658 8008F658 0000AD8D */  lw         $t5, (0x1F800000 & 0xFFFF)($t5)
    /* 7F65C 8008F65C F5FF3126 */  addiu      $s1, $s1, -0xB
    /* 7F660 8008F660 3800ADAF */  sw         $t5, 0x38($sp)
    /* 7F664 8008F664 70008E8C */  lw         $t6, 0x70($a0)
    /* 7F668 8008F668 21302002 */  addu       $a2, $s1, $zero
    /* 7F66C 8008F66C 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 7F670 8008F670 3000AEAF */   sw        $t6, 0x30($sp)
    /* 7F674 8008F674 21280002 */  addu       $a1, $s0, $zero
    /* 7F678 8008F678 2800A48F */  lw         $a0, 0x28($sp)
    /* 7F67C 8008F67C 21302002 */  addu       $a2, $s1, $zero
    /* 7F680 8008F680 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 7F684 8008F684 4000A2AF */   sw        $v0, 0x40($sp)
    /* 7F688 8008F688 2800AD8F */  lw         $t5, 0x28($sp)
    /* 7F68C 8008F68C 2800AE8F */  lw         $t6, 0x28($sp)
    /* 7F690 8008F690 4800A2AF */  sw         $v0, 0x48($sp)
    /* 7F694 8008F694 C000AD85 */  lh         $t5, 0xC0($t5)
    /* 7F698 8008F698 00000000 */  nop
    /* 7F69C 8008F69C 5000ADAF */  sw         $t5, 0x50($sp)
    /* 7F6A0 8008F6A0 C200CE85 */  lh         $t6, 0xC2($t6)
    /* 7F6A4 8008F6A4 D0000424 */  addiu      $a0, $zero, 0xD0
    /* 7F6A8 8008F6A8 044F020C */  jal        GM_UseTexData__Fi
    /* 7F6AC 8008F6AC 5800AEAF */   sw        $t6, 0x58($sp)
    /* 7F6B0 8008F6B0 62100D3C */  lui        $t5, (0x10624DD3 >> 16)
    /* 7F6B4 8008F6B4 D34DAD35 */  ori        $t5, $t5, (0x10624DD3 & 0xFFFF)
    /* 7F6B8 8008F6B8 FF000E3C */  lui        $t6, (0xFFFFFF >> 16)
    /* 7F6BC 8008F6BC FFFFCE35 */  ori        $t6, $t6, (0xFFFFFF & 0xFFFF)
    /* 7F6C0 8008F6C0 8800ADAF */  sw         $t5, 0x88($sp)
    /* 7F6C4 8008F6C4 801F0D3C */  lui        $t5, (0x1F800000 >> 16)
    /* 7F6C8 8008F6C8 6000A2AF */  sw         $v0, 0x60($sp)
    /* 7F6CC 8008F6CC 6800A0AF */  sw         $zero, 0x68($sp)
    /* 7F6D0 8008F6D0 A800AEAF */  sw         $t6, 0xA8($sp)
    /* 7F6D4 8008F6D4 1801ADAF */  sw         $t5, 0x118($sp)
  .L8008F6D8:
    /* 7F6D8 8008F6D8 6800AE8F */  lw         $t6, 0x68($sp)
    /* 7F6DC 8008F6DC 3800AD8F */  lw         $t5, 0x38($sp)
    /* 7F6E0 8008F6E0 00000000 */  nop
    /* 7F6E4 8008F6E4 2A10CD01 */  slt        $v0, $t6, $t5
    /* 7F6E8 8008F6E8 E5004010 */  beqz       $v0, .L8008FA80
    /* 7F6EC 8008F6EC 00000000 */   nop
    /* 7F6F0 8008F6F0 1801AE8F */  lw         $t6, 0x118($sp)
    /* 7F6F4 8008F6F4 00000000 */  nop
    /* 7F6F8 8008F6F8 0400CE91 */  lbu        $t6, 0x4($t6)
    /* 7F6FC 8008F6FC 00000000 */  nop
    /* 7F700 8008F700 0400C229 */  slti       $v0, $t6, 0x4
    /* 7F704 8008F704 D7004010 */  beqz       $v0, .L8008FA64
    /* 7F708 8008F708 7000AEAF */   sw        $t6, 0x70($sp)
    /* 7F70C 8008F70C 1801AD8F */  lw         $t5, 0x118($sp)
    /* 7F710 8008F710 2800A48F */  lw         $a0, 0x28($sp)
    /* 7F714 8008F714 0400A38D */  lw         $v1, 0x4($t5)
    /* 7F718 8008F718 8800AD8F */  lw         $t5, 0x88($sp)
    /* 7F71C 8008F71C 0080023C */  lui        $v0, %hi(D_80000034)
    /* 7F720 8008F720 7800A0AF */  sw         $zero, 0x78($sp)
    /* 7F724 8008F724 021A0300 */  srl        $v1, $v1, 8
    /* 7F728 8008F728 25B06200 */  or         $s6, $v1, $v0
    /* 7F72C 8008F72C 3400CB92 */  lbu        $t3, %lo(D_80000034)($s6)
    /* 7F730 8008F730 3500CA92 */  lbu        $t2, %lo(D_80000034 + 0x1)($s6)
    /* 7F734 8008F734 3A00C282 */  lb         $v0, %lo(D_8000003A)($s6)
    /* 7F738 8008F738 3B00C382 */  lb         $v1, %lo(D_8000003B)($s6)
    /* 7F73C 8008F73C 005E0B00 */  sll        $t3, $t3, 24
    /* 7F740 8008F740 034E0B00 */  sra        $t1, $t3, 24
    /* 7F744 8008F744 80980900 */  sll        $s3, $t1, 2
    /* 7F748 8008F748 21986902 */  addu       $s3, $s3, $t1
    /* 7F74C 8008F74C 80981300 */  sll        $s3, $s3, 2
    /* 7F750 8008F750 21286002 */  addu       $a1, $s3, $zero
    /* 7F754 8008F754 00560A00 */  sll        $t2, $t2, 24
    /* 7F758 8008F758 80380200 */  sll        $a3, $v0, 2
    /* 7F75C 8008F75C 2138E200 */  addu       $a3, $a3, $v0
    /* 7F760 8008F760 C0380700 */  sll        $a3, $a3, 3
    /* 7F764 8008F764 2338E200 */  subu       $a3, $a3, $v0
    /* 7F768 8008F768 00390700 */  sll        $a3, $a3, 4
    /* 7F76C 8008F76C 2138E200 */  addu       $a3, $a3, $v0
    /* 7F770 8008F770 1800ED00 */  mult       $a3, $t5
    /* 7F774 8008F774 03460A00 */  sra        $t0, $t2, 24
    /* 7F778 8008F778 80900800 */  sll        $s2, $t0, 2
    /* 7F77C 8008F77C 21904802 */  addu       $s2, $s2, $t0
    /* 7F780 8008F780 80901200 */  sll        $s2, $s2, 2
    /* 7F784 8008F784 21304002 */  addu       $a2, $s2, $zero
    /* 7F788 8008F788 80100300 */  sll        $v0, $v1, 2
    /* 7F78C 8008F78C 21104300 */  addu       $v0, $v0, $v1
    /* 7F790 8008F790 C0100200 */  sll        $v0, $v0, 3
    /* 7F794 8008F794 23104300 */  subu       $v0, $v0, $v1
    /* 7F798 8008F798 00110200 */  sll        $v0, $v0, 4
    /* 7F79C 8008F79C 21104300 */  addu       $v0, $v0, $v1
    /* 7F7A0 8008F7A0 10600000 */  mfhi       $t4
    /* 7F7A4 8008F7A4 C25F0B00 */  srl        $t3, $t3, 31
    /* 7F7A8 8008F7A8 21482B01 */  addu       $t1, $t1, $t3
    /* 7F7AC 8008F7AC 18004D00 */  mult       $v0, $t5
    /* 7F7B0 8008F7B0 43480900 */  sra        $t1, $t1, 1
    /* 7F7B4 8008F7B4 F8FF2925 */  addiu      $t1, $t1, -0x8
    /* 7F7B8 8008F7B8 C2570A00 */  srl        $t2, $t2, 31
    /* 7F7BC 8008F7BC 21400A01 */  addu       $t0, $t0, $t2
    /* 7F7C0 8008F7C0 43400800 */  sra        $t0, $t0, 1
    /* 7F7C4 8008F7C4 F8FF1725 */  addiu      $s7, $t0, -0x8
    /* 7F7C8 8008F7C8 C33F0700 */  sra        $a3, $a3, 31
    /* 7F7CC 8008F7CC 8000A9AF */  sw         $t1, 0x80($sp)
    /* 7F7D0 8008F7D0 83810C00 */  sra        $s0, $t4, 6
    /* 7F7D4 8008F7D4 23800702 */  subu       $s0, $s0, $a3
    /* 7F7D8 8008F7D8 C3170200 */  sra        $v0, $v0, 31
    /* 7F7DC 8008F7DC 10180000 */  mfhi       $v1
    /* 7F7E0 8008F7E0 83890300 */  sra        $s1, $v1, 6
    /* 7F7E4 8008F7E4 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 7F7E8 8008F7E8 23882202 */   subu      $s1, $s1, $v0
    /* 7F7EC 8008F7EC 21286002 */  addu       $a1, $s3, $zero
    /* 7F7F0 8008F7F0 21304002 */  addu       $a2, $s2, $zero
    /* 7F7F4 8008F7F4 2800A48F */  lw         $a0, 0x28($sp)
    /* 7F7F8 8008F7F8 5000AD8F */  lw         $t5, 0x50($sp)
    /* 7F7FC 8008F7FC 4000AE8F */  lw         $t6, 0x40($sp)
    /* 7F800 8008F800 2110A201 */  addu       $v0, $t5, $v0
    /* 7F804 8008F804 21105000 */  addu       $v0, $v0, $s0
    /* 7F808 8008F808 23104E00 */  subu       $v0, $v0, $t6
    /* 7F80C 8008F80C 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 7F810 8008F810 9000A2AF */   sw        $v0, 0x90($sp)
    /* 7F814 8008F814 2800A48F */  lw         $a0, 0x28($sp)
    /* 7F818 8008F818 5800AD8F */  lw         $t5, 0x58($sp)
    /* 7F81C 8008F81C 4800AE8F */  lw         $t6, 0x48($sp)
    /* 7F820 8008F820 2110A201 */  addu       $v0, $t5, $v0
    /* 7F824 8008F824 21105100 */  addu       $v0, $v0, $s1
    /* 7F828 8008F828 23104E00 */  subu       $v0, $v0, $t6
    /* 7F82C 8008F82C 9800A2AF */  sw         $v0, 0x98($sp)
    /* 7F830 8008F830 9800A58F */  lw         $a1, 0x98($sp)
    /* 7F834 8008F834 3047020C */  jal        GetOtPos__7CBlocksi_80091cc0
    /* 7F838 8008F838 01001E24 */   addiu     $fp, $zero, 0x1
    /* 7F83C 8008F83C 5A00D482 */  lb         $s4, %lo(D_8000005A)($s6)
    /* 7F840 8008F840 4100C382 */  lb         $v1, %lo(D_80000041)($s6)
    /* 7F844 8008F844 A000A2AF */  sw         $v0, 0xA0($sp)
    /* 7F848 8008F848 05000224 */  addiu      $v0, $zero, 0x5
    /* 7F84C 8008F84C 0B008216 */  bne        $s4, $v0, .L8008F87C
    /* 7F850 8008F850 FFFF7524 */   addiu     $s5, $v1, -0x1
    /* 7F854 8008F854 21A00000 */  addu       $s4, $zero, $zero
    /* 7F858 8008F858 01000D24 */  addiu      $t5, $zero, 0x1
    /* 7F85C 8008F85C 0700A016 */  bnez       $s5, .L8008F87C
    /* 7F860 8008F860 7800ADAF */   sw        $t5, 0x78($sp)
    /* 7F864 8008F864 7000AE8F */  lw         $t6, 0x70($sp)
    /* 7F868 8008F868 00000000 */  nop
    /* 7F86C 8008F86C 80100E00 */  sll        $v0, $t6, 2
    /* 7F870 8008F870 1280013C */  lui        $at, %hi(D_8011CBD0)
    /* 7F874 8008F874 21082200 */  addu       $at, $at, $v0
    /* 7F878 8008F878 D0CB20AC */  sw         $zero, %lo(D_8011CBD0)($at)
  .L8008F87C:
    /* 7F87C 8008F87C 6000A48F */  lw         $a0, 0x60($sp)
    /* 7F880 8008F880 6F47020C */  jal        GetNumOfActions__7TextDati
    /* 7F884 8008F884 2128C003 */   addu      $a1, $fp, $zero
    /* 7F888 8008F888 2A108202 */  slt        $v0, $s4, $v0
    /* 7F88C 8008F88C 0C004014 */  bnez       $v0, .L8008F8C0
    /* 7F890 8008F890 01000224 */   addiu     $v0, $zero, 0x1
    /* 7F894 8008F894 7300A216 */  bne        $s5, $v0, .L8008FA64
    /* 7F898 8008F898 21280000 */   addu      $a1, $zero, $zero
    /* 7F89C 8008F89C A000AD8F */  lw         $t5, 0xA0($sp)
    /* 7F8A0 8008F8A0 00800634 */  ori        $a2, $zero, 0x8000
    /* 7F8A4 8008F8A4 6000073C */  lui        $a3, (0x606060 >> 16)
    /* 7F8A8 8008F8A8 7000A48F */  lw         $a0, 0x70($sp)
    /* 7F8AC 8008F8AC 6060E734 */  ori        $a3, $a3, (0x606060 & 0xFFFF)
    /* 7F8B0 8008F8B0 107D020C */  jal        StartPartJump__Fiiiii
    /* 7F8B4 8008F8B4 1000ADAF */   sw        $t5, 0x10($sp)
    /* 7F8B8 8008F8B8 993E0208 */  j          .L8008FA64
    /* 7F8BC 8008F8BC 00000000 */   nop
  .L8008F8C0:
    /* 7F8C0 8008F8C0 2128C003 */  addu       $a1, $fp, $zero
    /* 7F8C4 8008F8C4 1080073C */  lui        $a3, %hi(dung_map_r)
    /* 7F8C8 8008F8C8 2802E724 */  addiu      $a3, $a3, %lo(dung_map_r)
    /* 7F8CC 8008F8CC 1080063C */  lui        $a2, %hi(dung_map_g)
    /* 7F8D0 8008F8D0 680EC624 */  addiu      $a2, $a2, %lo(dung_map_g)
    /* 7F8D4 8008F8D4 1080023C */  lui        $v0, %hi(dung_map_b)
    /* 7F8D8 8008F8D8 A81A4224 */  addiu      $v0, $v0, %lo(dung_map_b)
    /* 7F8DC 8008F8DC 6000A48F */  lw         $a0, 0x60($sp)
    /* 7F8E0 8008F8E0 8000AE8F */  lw         $t6, 0x80($sp)
    /* 7F8E4 8008F8E4 3C00D082 */  lb         $s0, %lo(D_8000003C)($s6)
    /* 7F8E8 8008F8E8 C0180E00 */  sll        $v1, $t6, 3
    /* 7F8EC 8008F8EC 23186E00 */  subu       $v1, $v1, $t6
    /* 7F8F0 8008F8F0 C0180300 */  sll        $v1, $v1, 3
    /* 7F8F4 8008F8F4 21386700 */  addu       $a3, $v1, $a3
    /* 7F8F8 8008F8F8 2138F700 */  addu       $a3, $a3, $s7
    /* 7F8FC 8008F8FC 21306600 */  addu       $a2, $v1, $a2
    /* 7F900 8008F900 2130D700 */  addu       $a2, $a2, $s7
    /* 7F904 8008F904 21186200 */  addu       $v1, $v1, $v0
    /* 7F908 8008F908 21187700 */  addu       $v1, $v1, $s7
    /* 7F90C 8008F90C 0000D290 */  lbu        $s2, 0x0($a2)
    /* 7F910 8008F910 21308002 */  addu       $a2, $s4, $zero
    /* 7F914 8008F914 0000F190 */  lbu        $s1, 0x0($a3)
    /* 7F918 8008F918 00007390 */  lbu        $s3, 0x0($v1)
    /* 7F91C 8008F91C 21380002 */  addu       $a3, $s0, $zero
    /* 7F920 8008F920 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 7F924 8008F924 1000B5AF */   sw        $s5, 0x10($sp)
    /* 7F928 8008F928 2128C003 */  addu       $a1, $fp, $zero
    /* 7F92C 8008F92C 21308002 */  addu       $a2, $s4, $zero
    /* 7F930 8008F930 21380002 */  addu       $a3, $s0, $zero
    /* 7F934 8008F934 6000A48F */  lw         $a0, 0x60($sp)
    /* 7F938 8008F938 BB4F020C */  jal        IsDirAliased__7TextDatiii
    /* 7F93C 8008F93C 21804000 */   addu      $s0, $v0, $zero
    /* 7F940 8008F940 6000A48F */  lw         $a0, 0x60($sp)
    /* 7F944 8008F944 9000A68F */  lw         $a2, 0x90($sp)
    /* 7F948 8008F948 9800A78F */  lw         $a3, 0x98($sp)
    /* 7F94C 8008F94C A000AD8F */  lw         $t5, 0xA0($sp)
    /* 7F950 8008F950 21280002 */  addu       $a1, $s0, $zero
    /* 7F954 8008F954 1000A2AF */  sw         $v0, 0x10($sp)
    /* 7F958 8008F958 1800A0AF */  sw         $zero, 0x18($sp)
    /* 7F95C 8008F95C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 7F960 8008F960 1400ADAF */   sw        $t5, 0x14($sp)
    /* 7F964 8008F964 21284000 */  addu       $a1, $v0, $zero
    /* 7F968 8008F968 0700A290 */  lbu        $v0, 0x7($a1)
    /* 7F96C 8008F96C 0400B1A0 */  sb         $s1, 0x4($a1)
    /* 7F970 8008F970 0500B2A0 */  sb         $s2, 0x5($a1)
    /* 7F974 8008F974 0600B3A0 */  sb         $s3, 0x6($a1)
    /* 7F978 8008F978 FE004230 */  andi       $v0, $v0, 0xFE
    /* 7F97C 8008F97C 0700A2A0 */  sb         $v0, 0x7($a1)
    /* 7F980 8008F980 7800AE8F */  lw         $t6, 0x78($sp)
    /* 7F984 8008F984 00000000 */  nop
    /* 7F988 8008F988 1F00C011 */  beqz       $t6, .L8008FA08
    /* 7F98C 8008F98C 00000000 */   nop
    /* 7F990 8008F990 7000AD8F */  lw         $t5, 0x70($sp)
    /* 7F994 8008F994 1280033C */  lui        $v1, %hi(D_8011CBD0)
    /* 7F998 8008F998 D0CB6324 */  addiu      $v1, $v1, %lo(D_8011CBD0)
    /* 7F99C 8008F99C 80100D00 */  sll        $v0, $t5, 2
    /* 7F9A0 8008F9A0 21384300 */  addu       $a3, $v0, $v1
    /* 7F9A4 8008F9A4 0000E68C */  lw         $a2, 0x0($a3)
    /* 7F9A8 8008F9A8 0A00A294 */  lhu        $v0, 0xA($a1)
    /* 7F9AC 8008F9AC 1200A394 */  lhu        $v1, 0x12($a1)
    /* 7F9B0 8008F9B0 23104600 */  subu       $v0, $v0, $a2
    /* 7F9B4 8008F9B4 23186600 */  subu       $v1, $v1, $a2
    /* 7F9B8 8008F9B8 83200600 */  sra        $a0, $a2, 2
    /* 7F9BC 8008F9BC 0A00A2A4 */  sh         $v0, 0xA($a1)
    /* 7F9C0 8008F9C0 0800A294 */  lhu        $v0, 0x8($a1)
    /* 7F9C4 8008F9C4 0100C624 */  addiu      $a2, $a2, 0x1
    /* 7F9C8 8008F9C8 1200A3A4 */  sh         $v1, 0x12($a1)
    /* 7F9CC 8008F9CC 1800A394 */  lhu        $v1, 0x18($a1)
    /* 7F9D0 8008F9D0 21104400 */  addu       $v0, $v0, $a0
    /* 7F9D4 8008F9D4 0800A2A4 */  sh         $v0, 0x8($a1)
    /* 7F9D8 8008F9D8 1000A294 */  lhu        $v0, 0x10($a1)
    /* 7F9DC 8008F9DC 21186400 */  addu       $v1, $v1, $a0
    /* 7F9E0 8008F9E0 1800A3A4 */  sh         $v1, 0x18($a1)
    /* 7F9E4 8008F9E4 2000A394 */  lhu        $v1, 0x20($a1)
    /* 7F9E8 8008F9E8 23104400 */  subu       $v0, $v0, $a0
    /* 7F9EC 8008F9EC 23186400 */  subu       $v1, $v1, $a0
    /* 7F9F0 8008F9F0 1000A2A4 */  sh         $v0, 0x10($a1)
    /* 7F9F4 8008F9F4 2900C228 */  slti       $v0, $a2, 0x29
    /* 7F9F8 8008F9F8 02004014 */  bnez       $v0, .L8008FA04
    /* 7F9FC 8008F9FC 2000A3A4 */   sh        $v1, 0x20($a1)
    /* 7FA00 8008FA00 28000624 */  addiu      $a2, $zero, 0x28
  .L8008FA04:
    /* 7FA04 8008FA04 0000E6AC */  sw         $a2, 0x0($a3)
  .L8008FA08:
    /* 7FA08 8008FA08 C146020C */  jal        PRIM_GetCopy__FP8POLY_FT4_80091b04
    /* 7FA0C 8008FA0C 2120A000 */   addu      $a0, $a1, $zero
    /* 7FA10 8008FA10 21804000 */  addu       $s0, $v0, $zero
    /* 7FA14 8008FA14 4C46020C */  jal        ShadScaleSkew__7CBlocksP8POLY_FT4
    /* 7FA18 8008FA18 21200002 */   addu      $a0, $s0, $zero
    /* 7FA1C 8008FA1C 00FF053C */  lui        $a1, (0xFF000000 >> 16)
    /* 7FA20 8008FA20 0000038E */  lw         $v1, 0x0($s0)
    /* 7FA24 8008FA24 1280023C */  lui        $v0, %hi(ThisOt)
    /* 7FA28 8008FA28 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 7FA2C 8008FA2C A000AE8F */  lw         $t6, 0xA0($sp)
    /* 7FA30 8008FA30 A800AD8F */  lw         $t5, 0xA8($sp)
    /* 7FA34 8008FA34 80200E00 */  sll        $a0, $t6, 2
    /* 7FA38 8008FA38 21208200 */  addu       $a0, $a0, $v0
    /* 7FA3C 8008FA3C 0000828C */  lw         $v0, 0x0($a0)
    /* 7FA40 8008FA40 24186500 */  and        $v1, $v1, $a1
    /* 7FA44 8008FA44 24104D00 */  and        $v0, $v0, $t5
    /* 7FA48 8008FA48 25186200 */  or         $v1, $v1, $v0
    /* 7FA4C 8008FA4C 000003AE */  sw         $v1, 0x0($s0)
    /* 7FA50 8008FA50 0000828C */  lw         $v0, 0x0($a0)
    /* 7FA54 8008FA54 24800D02 */  and        $s0, $s0, $t5
    /* 7FA58 8008FA58 24104500 */  and        $v0, $v0, $a1
    /* 7FA5C 8008FA5C 25105000 */  or         $v0, $v0, $s0
    /* 7FA60 8008FA60 000082AC */  sw         $v0, 0x0($a0)
  .L8008FA64:
    /* 7FA64 8008FA64 1801AE8F */  lw         $t6, 0x118($sp)
    /* 7FA68 8008FA68 6800AD8F */  lw         $t5, 0x68($sp)
    /* 7FA6C 8008FA6C 0400CE25 */  addiu      $t6, $t6, 0x4
    /* 7FA70 8008FA70 0100AD25 */  addiu      $t5, $t5, 0x1
    /* 7FA74 8008FA74 1801AEAF */  sw         $t6, 0x118($sp)
    /* 7FA78 8008FA78 B63D0208 */  j          .L8008F6D8
    /* 7FA7C 8008FA7C 6800ADAF */   sw        $t5, 0x68($sp)
  .L8008FA80:
    /* 7FA80 8008FA80 6000A48F */  lw         $a0, 0x60($sp)
    /* 7FA84 8008FA84 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 7FA88 8008FA88 00000000 */   nop
    /* 7FA8C 8008FA8C 62100D3C */  lui        $t5, (0x10624DD3 >> 16)
    /* 7FA90 8008FA90 DC1E8E8F */  lw         $t6, %gp_rel(D_8011C65C)($gp)
    /* 7FA94 8008FA94 D34DAD35 */  ori        $t5, $t5, (0x10624DD3 & 0xFFFF)
    /* 7FA98 8008FA98 B800A0AF */  sw         $zero, 0xB8($sp)
    /* 7FA9C 8008FA9C B000AEAF */  sw         $t6, 0xB0($sp)
    /* 7FAA0 8008FAA0 0001ADAF */  sw         $t5, 0x100($sp)
  .L8008FAA4:
    /* 7FAA4 8008FAA4 B800AE8F */  lw         $t6, 0xB8($sp)
    /* 7FAA8 8008FAA8 00000000 */  nop
    /* 7FAAC 8008FAAC 0200C229 */  slti       $v0, $t6, 0x2
    /* 7FAB0 8008FAB0 6D014010 */  beqz       $v0, .L80090068
    /* 7FAB4 8008FAB4 08000D24 */   addiu     $t5, $zero, 0x8
    /* 7FAB8 8008FAB8 801F0E3C */  lui        $t6, (0x1F800000 >> 16)
    /* 7FABC 8008FABC C000ADAF */  sw         $t5, 0xC0($sp)
    /* 7FAC0 8008FAC0 C800A0AF */  sw         $zero, 0xC8($sp)
    /* 7FAC4 8008FAC4 1001AEAF */  sw         $t6, 0x110($sp)
  .L8008FAC8:
    /* 7FAC8 8008FAC8 C800AD8F */  lw         $t5, 0xC8($sp)
    /* 7FACC 8008FACC 3800AE8F */  lw         $t6, 0x38($sp)
    /* 7FAD0 8008FAD0 00000000 */  nop
    /* 7FAD4 8008FAD4 2A10AE01 */  slt        $v0, $t5, $t6
    /* 7FAD8 8008FAD8 5E014010 */  beqz       $v0, .L80090054
    /* 7FADC 8008FADC 00000000 */   nop
    /* 7FAE0 8008FAE0 1001AD8F */  lw         $t5, 0x110($sp)
    /* 7FAE4 8008FAE4 00000000 */  nop
    /* 7FAE8 8008FAE8 0400AD91 */  lbu        $t5, 0x4($t5)
    /* 7FAEC 8008FAEC 00000000 */  nop
    /* 7FAF0 8008FAF0 0400A229 */  slti       $v0, $t5, 0x4
    /* 7FAF4 8008FAF4 50014014 */  bnez       $v0, .L80090038
    /* 7FAF8 8008FAF8 F000ADAF */   sw        $t5, 0xF0($sp)
    /* 7FAFC 8008FAFC 1001AE8F */  lw         $t6, 0x110($sp)
    /* 7FB00 8008FB00 00000000 */  nop
    /* 7FB04 8008FB04 0400C28D */  lw         $v0, 0x4($t6)
    /* 7FB08 8008FB08 0080033C */  lui        $v1, %hi(D_8000002C)
    /* 7FB0C 8008FB0C 02120200 */  srl        $v0, $v0, 8
    /* 7FB10 8008FB10 25904300 */  or         $s2, $v0, $v1
    /* 7FB14 8008FB14 2C004296 */  lhu        $v0, %lo(D_8000002C)($s2)
    /* 7FB18 8008FB18 00000000 */  nop
    /* 7FB1C 8008FB1C 01004230 */  andi       $v0, $v0, 0x1
    /* 7FB20 8008FB20 46014014 */  bnez       $v0, .L8009003C
    /* 7FB24 8008FB24 00000000 */   nop
    /* 7FB28 8008FB28 3A004282 */  lb         $v0, %lo(D_8000003A)($s2)
    /* 7FB2C 8008FB2C 0001AD8F */  lw         $t5, 0x100($sp)
    /* 7FB30 8008FB30 80200200 */  sll        $a0, $v0, 2
    /* 7FB34 8008FB34 21208200 */  addu       $a0, $a0, $v0
    /* 7FB38 8008FB38 C0200400 */  sll        $a0, $a0, 3
    /* 7FB3C 8008FB3C 23208200 */  subu       $a0, $a0, $v0
    /* 7FB40 8008FB40 00210400 */  sll        $a0, $a0, 4
    /* 7FB44 8008FB44 21208200 */  addu       $a0, $a0, $v0
    /* 7FB48 8008FB48 18008D00 */  mult       $a0, $t5
    /* 7FB4C 8008FB4C 3B004382 */  lb         $v1, %lo(D_8000003B)($s2)
    /* 7FB50 8008FB50 00000000 */  nop
    /* 7FB54 8008FB54 80100300 */  sll        $v0, $v1, 2
    /* 7FB58 8008FB58 21104300 */  addu       $v0, $v0, $v1
    /* 7FB5C 8008FB5C C0100200 */  sll        $v0, $v0, 3
    /* 7FB60 8008FB60 23104300 */  subu       $v0, $v0, $v1
    /* 7FB64 8008FB64 00110200 */  sll        $v0, $v0, 4
    /* 7FB68 8008FB68 10280000 */  mfhi       $a1
    /* 7FB6C 8008FB6C 21104300 */  addu       $v0, $v0, $v1
    /* 7FB70 8008FB70 41004382 */  lb         $v1, %lo(D_80000041)($s2)
    /* 7FB74 8008FB74 18004D00 */  mult       $v0, $t5
    /* 7FB78 8008FB78 C3270400 */  sra        $a0, $a0, 31
    /* 7FB7C 8008FB7C FFFF7424 */  addiu      $s4, $v1, -0x1
    /* 7FB80 8008FB80 83190500 */  sra        $v1, $a1, 6
    /* 7FB84 8008FB84 23186400 */  subu       $v1, $v1, $a0
    /* 7FB88 8008FB88 E000A3AF */  sw         $v1, 0xE0($sp)
    /* 7FB8C 8008FB8C 6400438E */  lw         $v1, %lo(D_80000064)($s2)
    /* 7FB90 8008FB90 00000000 */  nop
    /* 7FB94 8008FB94 00006394 */  lhu        $v1, 0x0($v1)
    /* 7FB98 8008FB98 C3170200 */  sra        $v0, $v0, 31
    /* 7FB9C 8008FB9C F800A3AF */  sw         $v1, 0xF8($sp)
    /* 7FBA0 8008FBA0 F800A68F */  lw         $a2, 0xF8($sp)
    /* 7FBA4 8008FBA4 10400000 */  mfhi       $t0
    /* 7FBA8 8008FBA8 83210800 */  sra        $a0, $t0, 6
    /* 7FBAC 8008FBAC 23208200 */  subu       $a0, $a0, $v0
    /* 7FBB0 8008FBB0 E800A4AF */  sw         $a0, 0xE8($sp)
    /* 7FBB4 8008FBB4 34005582 */  lb         $s5, %lo(D_80000034)($s2)
    /* 7FBB8 8008FBB8 6000428E */  lw         $v0, %lo(D_80000060)($s2)
    /* 7FBBC 8008FBBC 35005682 */  lb         $s6, %lo(D_80000034 + 0x1)($s2)
    /* 7FBC0 8008FBC0 3C004D82 */  lb         $t5, %lo(D_8000003C)($s2)
    /* 7FBC4 8008FBC4 12004290 */  lbu        $v0, 0x12($v0)
    /* 7FBC8 8008FBC8 28000324 */  addiu      $v1, $zero, 0x28
    /* 7FBCC 8008FBCC 0A004314 */  bne        $v0, $v1, .L8008FBF8
    /* 7FBD0 8008FBD0 D800ADAF */   sw        $t5, 0xD8($sp)
    /* 7FBD4 8008FBD4 33004382 */  lb         $v1, %lo(D_80000033)($s2)
    /* 7FBD8 8008FBD8 0E000224 */  addiu      $v0, $zero, 0xE
    /* 7FBDC 8008FBDC 06006214 */  bne        $v1, $v0, .L8008FBF8
    /* 7FBE0 8008FBE0 00000000 */   nop
    /* 7FBE4 8008FBE4 D000A0AF */  sw         $zero, 0xD0($sp)
    /* 7FBE8 8008FBE8 013F0208 */  j          .L8008FC04
    /* 7FBEC 8008FBEC 21A00000 */   addu      $s4, $zero, $zero
  .L8008FBF0:
    /* 7FBF0 8008FBF0 143F0208 */  j          .L8008FC50
    /* 7FBF4 8008FBF4 21988000 */   addu      $s3, $a0, $zero
  .L8008FBF8:
    /* 7FBF8 8008FBF8 5A004E82 */  lb         $t6, %lo(D_8000005A)($s2)
    /* 7FBFC 8008FBFC 00000000 */  nop
    /* 7FC00 8008FC00 D000AEAF */  sw         $t6, 0xD0($sp)
  .L8008FC04:
    /* 7FC04 8008FC04 2800AD8F */  lw         $t5, 0x28($sp)
    /* 7FC08 8008FC08 00000000 */  nop
    /* 7FC0C 8008FC0C 7800A38D */  lw         $v1, 0x78($t5)
    /* 7FC10 8008FC10 21200000 */  addu       $a0, $zero, $zero
    /* 7FC14 8008FC14 00006294 */  lhu        $v0, 0x0($v1)
    /* 7FC18 8008FC18 00000000 */  nop
    /* 7FC1C 8008FC1C 0C004010 */  beqz       $v0, .L8008FC50
    /* 7FC20 8008FC20 21980000 */   addu      $s3, $zero, $zero
    /* 7FC24 8008FC24 21284000 */  addu       $a1, $v0, $zero
    /* 7FC28 8008FC28 0400638C */  lw         $v1, 0x4($v1)
  .L8008FC2C:
    /* 7FC2C 8008FC2C 00000000 */  nop
    /* 7FC30 8008FC30 00006290 */  lbu        $v0, 0x0($v1)
    /* 7FC34 8008FC34 00000000 */  nop
    /* 7FC38 8008FC38 EDFF4610 */  beq        $v0, $a2, .L8008FBF0
    /* 7FC3C 8008FC3C 00000000 */   nop
    /* 7FC40 8008FC40 01008424 */  addiu      $a0, $a0, 0x1
    /* 7FC44 8008FC44 2B108500 */  sltu       $v0, $a0, $a1
    /* 7FC48 8008FC48 F8FF4014 */  bnez       $v0, .L8008FC2C
    /* 7FC4C 8008FC4C 01006324 */   addiu     $v1, $v1, 0x1
  .L8008FC50:
    /* 7FC50 8008FC50 3000A48F */  lw         $a0, 0x30($sp)
    /* 7FC54 8008FC54 D000A68F */  lw         $a2, 0xD0($sp)
    /* 7FC58 8008FC58 D800A78F */  lw         $a3, 0xD8($sp)
    /* 7FC5C 8008FC5C 21286002 */  addu       $a1, $s3, $zero
    /* 7FC60 8008FC60 7849020C */  jal        IsCompressed__7TextDatiiii
    /* 7FC64 8008FC64 1000B4AF */   sw        $s4, 0x10($sp)
    /* 7FC68 8008FC68 B800AE8F */  lw         $t6, 0xB8($sp)
    /* 7FC6C 8008FC6C 00000000 */  nop
    /* 7FC70 8008FC70 0200C015 */  bnez       $t6, .L8008FC7C
    /* 7FC74 8008FC74 2B180200 */   sltu      $v1, $zero, $v0
    /* 7FC78 8008FC78 01006338 */  xori       $v1, $v1, 0x1
  .L8008FC7C:
    /* 7FC7C 8008FC7C EE006010 */  beqz       $v1, .L80090038
    /* 7FC80 8008FC80 00000000 */   nop
    /* 7FC84 8008FC84 11004010 */  beqz       $v0, .L8008FCCC
    /* 7FC88 8008FC88 80881500 */   sll       $s1, $s5, 2
    /* 7FC8C 8008FC8C C000AD8F */  lw         $t5, 0xC0($sp)
    /* 7FC90 8008FC90 00000000 */  nop
    /* 7FC94 8008FC94 0300A011 */  beqz       $t5, .L8008FCA4
    /* 7FC98 8008FC98 FFFFAD25 */   addiu     $t5, $t5, -0x1
    /* 7FC9C 8008FC9C 333F0208 */  j          .L8008FCCC
    /* 7FCA0 8008FCA0 C000ADAF */   sw        $t5, 0xC0($sp)
  .L8008FCA4:
    /* 7FCA4 8008FCA4 3000A48F */  lw         $a0, 0x30($sp)
    /* 7FCA8 8008FCA8 D000A68F */  lw         $a2, 0xD0($sp)
    /* 7FCAC 8008FCAC 6147020C */  jal        GetNumOfFrames__7TextDatii_80091d84
    /* 7FCB0 8008FCB0 21286002 */   addu      $a1, $s3, $zero
    /* 7FCB4 8008FCB4 01000324 */  addiu      $v1, $zero, 0x1
    /* 7FCB8 8008FCB8 04004310 */  beq        $v0, $v1, .L8008FCCC
    /* 7FCBC 8008FCBC 80881500 */   sll       $s1, $s5, 2
    /* 7FCC0 8008FCC0 02008016 */  bnez       $s4, .L8008FCCC
    /* 7FCC4 8008FCC4 FFFF9426 */   addiu     $s4, $s4, -0x1
    /* 7FCC8 8008FCC8 01001424 */  addiu      $s4, $zero, 0x1
  .L8008FCCC:
    /* 7FCCC 8008FCCC 21883502 */  addu       $s1, $s1, $s5
    /* 7FCD0 8008FCD0 80881100 */  sll        $s1, $s1, 2
    /* 7FCD4 8008FCD4 21282002 */  addu       $a1, $s1, $zero
    /* 7FCD8 8008FCD8 80801600 */  sll        $s0, $s6, 2
    /* 7FCDC 8008FCDC 21801602 */  addu       $s0, $s0, $s6
    /* 7FCE0 8008FCE0 80801000 */  sll        $s0, $s0, 2
    /* 7FCE4 8008FCE4 21300002 */  addu       $a2, $s0, $zero
    /* 7FCE8 8008FCE8 C2171500 */  srl        $v0, $s5, 31
    /* 7FCEC 8008FCEC 2110A202 */  addu       $v0, $s5, $v0
    /* 7FCF0 8008FCF0 43100200 */  sra        $v0, $v0, 1
    /* 7FCF4 8008FCF4 F8FF5E24 */  addiu      $fp, $v0, -0x8
    /* 7FCF8 8008FCF8 C2171600 */  srl        $v0, $s6, 31
    /* 7FCFC 8008FCFC 2110C202 */  addu       $v0, $s6, $v0
    /* 7FD00 8008FD00 43100200 */  sra        $v0, $v0, 1
    /* 7FD04 8008FD04 2800A48F */  lw         $a0, 0x28($sp)
    /* 7FD08 8008FD08 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 7FD0C 8008FD0C F8FF5724 */   addiu     $s7, $v0, -0x8
    /* 7FD10 8008FD10 21282002 */  addu       $a1, $s1, $zero
    /* 7FD14 8008FD14 21300002 */  addu       $a2, $s0, $zero
    /* 7FD18 8008FD18 2800A48F */  lw         $a0, 0x28($sp)
    /* 7FD1C 8008FD1C 5000AE8F */  lw         $t6, 0x50($sp)
    /* 7FD20 8008FD20 E000AD8F */  lw         $t5, 0xE0($sp)
    /* 7FD24 8008FD24 2188C201 */  addu       $s1, $t6, $v0
    /* 7FD28 8008FD28 4000AE8F */  lw         $t6, 0x40($sp)
    /* 7FD2C 8008FD2C 21882D02 */  addu       $s1, $s1, $t5
    /* 7FD30 8008FD30 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 7FD34 8008FD34 23882E02 */   subu      $s1, $s1, $t6
    /* 7FD38 8008FD38 2800A48F */  lw         $a0, 0x28($sp)
    /* 7FD3C 8008FD3C 5800AD8F */  lw         $t5, 0x58($sp)
    /* 7FD40 8008FD40 E800AE8F */  lw         $t6, 0xE8($sp)
    /* 7FD44 8008FD44 2180A201 */  addu       $s0, $t5, $v0
    /* 7FD48 8008FD48 4800AD8F */  lw         $t5, 0x48($sp)
    /* 7FD4C 8008FD4C 21800E02 */  addu       $s0, $s0, $t6
    /* 7FD50 8008FD50 23800D02 */  subu       $s0, $s0, $t5
    /* 7FD54 8008FD54 3047020C */  jal        GetOtPos__7CBlocksi_80091cc0
    /* 7FD58 8008FD58 21280002 */   addu      $a1, $s0, $zero
    /* 7FD5C 8008FD5C 21286002 */  addu       $a1, $s3, $zero
    /* 7FD60 8008FD60 3000A48F */  lw         $a0, 0x30($sp)
    /* 7FD64 8008FD64 D000A68F */  lw         $a2, 0xD0($sp)
    /* 7FD68 8008FD68 D800A78F */  lw         $a3, 0xD8($sp)
    /* 7FD6C 8008FD6C 21984000 */  addu       $s3, $v0, $zero
    /* 7FD70 8008FD70 1000B4AF */  sw         $s4, 0x10($sp)
    /* 7FD74 8008FD74 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7FD78 8008FD78 1800B0AF */  sw         $s0, 0x18($sp)
    /* 7FD7C 8008FD7C 8B49020C */  jal        PrintMonster__7TextDatiiiiiii
    /* 7FD80 8008FD80 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 7FD84 8008FD84 C0201600 */  sll        $a0, $s6, 3
    /* 7FD88 8008FD88 C0181500 */  sll        $v1, $s5, 3
    /* 7FD8C 8008FD8C 23187500 */  subu       $v1, $v1, $s5
    /* 7FD90 8008FD90 C0190300 */  sll        $v1, $v1, 7
    /* 7FD94 8008FD94 21208300 */  addu       $a0, $a0, $v1
    /* 7FD98 8008FD98 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 7FD9C 8008FD9C 21082400 */  addu       $at, $at, $a0
    /* 7FDA0 8008FDA0 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 7FDA4 8008FDA4 00000000 */  nop
    /* 7FDA8 8008FDA8 03006330 */  andi       $v1, $v1, 0x3
    /* 7FDAC 8008FDAC 08006014 */  bnez       $v1, .L8008FDD0
    /* 7FDB0 8008FDB0 21884000 */   addu      $s1, $v0, $zero
    /* 7FDB4 8008FDB4 B000AE8F */  lw         $t6, 0xB0($sp)
    /* 7FDB8 8008FDB8 00000000 */  nop
    /* 7FDBC 8008FDBC 0400C011 */  beqz       $t6, .L8008FDD0
    /* 7FDC0 8008FDC0 90000624 */   addiu     $a2, $zero, 0x90
    /* 7FDC4 8008FDC4 21280000 */  addu       $a1, $zero, $zero
    /* 7FDC8 8008FDC8 863F0208 */  j          .L8008FE18
    /* 7FDCC 8008FDCC 21100000 */   addu      $v0, $zero, $zero
  .L8008FDD0:
    /* 7FDD0 8008FDD0 1080023C */  lui        $v0, %hi(dung_map_r)
    /* 7FDD4 8008FDD4 28024224 */  addiu      $v0, $v0, %lo(dung_map_r)
    /* 7FDD8 8008FDD8 C0181E00 */  sll        $v1, $fp, 3
    /* 7FDDC 8008FDDC 23187E00 */  subu       $v1, $v1, $fp
    /* 7FDE0 8008FDE0 C0180300 */  sll        $v1, $v1, 3
    /* 7FDE4 8008FDE4 21106200 */  addu       $v0, $v1, $v0
    /* 7FDE8 8008FDE8 21105700 */  addu       $v0, $v0, $s7
    /* 7FDEC 8008FDEC 00004690 */  lbu        $a2, 0x0($v0)
    /* 7FDF0 8008FDF0 1080023C */  lui        $v0, %hi(dung_map_g)
    /* 7FDF4 8008FDF4 680E4224 */  addiu      $v0, $v0, %lo(dung_map_g)
    /* 7FDF8 8008FDF8 21106200 */  addu       $v0, $v1, $v0
    /* 7FDFC 8008FDFC 21105700 */  addu       $v0, $v0, $s7
    /* 7FE00 8008FE00 00004590 */  lbu        $a1, 0x0($v0)
    /* 7FE04 8008FE04 1080023C */  lui        $v0, %hi(dung_map_b)
    /* 7FE08 8008FE08 A81A4224 */  addiu      $v0, $v0, %lo(dung_map_b)
    /* 7FE0C 8008FE0C 21186200 */  addu       $v1, $v1, $v0
    /* 7FE10 8008FE10 21187700 */  addu       $v1, $v1, $s7
    /* 7FE14 8008FE14 00006290 */  lbu        $v0, 0x0($v1)
  .L8008FE18:
    /* 7FE18 8008FE18 21202002 */  addu       $a0, $s1, $zero
    /* 7FE1C 8008FE1C 040026A2 */  sb         $a2, 0x4($s1)
    /* 7FE20 8008FE20 050025A2 */  sb         $a1, 0x5($s1)
    /* 7FE24 8008FE24 C146020C */  jal        PRIM_GetCopy__FP8POLY_FT4_80091b04
    /* 7FE28 8008FE28 060022A2 */   sb        $v0, 0x6($s1)
    /* 7FE2C 8008FE2C 21804000 */  addu       $s0, $v0, $zero
    /* 7FE30 8008FE30 4C46020C */  jal        ShadScaleSkew__7CBlocksP8POLY_FT4
    /* 7FE34 8008FE34 21200002 */   addu      $a0, $s0, $zero
    /* 7FE38 8008FE38 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 7FE3C 8008FE3C FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 7FE40 8008FE40 80201300 */  sll        $a0, $s3, 2
    /* 7FE44 8008FE44 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 7FE48 8008FE48 1280023C */  lui        $v0, %hi(ThisOt)
    /* 7FE4C 8008FE4C B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 7FE50 8008FE50 0000038E */  lw         $v1, 0x0($s0)
    /* 7FE54 8008FE54 21208200 */  addu       $a0, $a0, $v0
    /* 7FE58 8008FE58 0000828C */  lw         $v0, 0x0($a0)
    /* 7FE5C 8008FE5C 24186600 */  and        $v1, $v1, $a2
    /* 7FE60 8008FE60 24104500 */  and        $v0, $v0, $a1
    /* 7FE64 8008FE64 25186200 */  or         $v1, $v1, $v0
    /* 7FE68 8008FE68 000003AE */  sw         $v1, 0x0($s0)
    /* 7FE6C 8008FE6C 0000828C */  lw         $v0, 0x0($a0)
    /* 7FE70 8008FE70 24280502 */  and        $a1, $s0, $a1
    /* 7FE74 8008FE74 24104600 */  and        $v0, $v0, $a2
    /* 7FE78 8008FE78 25104500 */  or         $v0, $v0, $a1
    /* 7FE7C 8008FE7C 000082AC */  sw         $v0, 0x0($a0)
    /* 7FE80 8008FE80 D000AD8F */  lw         $t5, 0xD0($sp)
    /* 7FE84 8008FE84 00000000 */  nop
    /* 7FE88 8008FE88 0400A239 */  xori       $v0, $t5, 0x4
    /* 7FE8C 8008FE8C 0100432C */  sltiu      $v1, $v0, 0x1
    /* 7FE90 8008FE90 4F004292 */  lbu        $v0, %lo(D_8000004F)($s2)
    /* 7FE94 8008FE94 00000000 */  nop
    /* 7FE98 8008FE98 0A004010 */  beqz       $v0, .L8008FEC4
    /* 7FE9C 8008FE9C 21206000 */   addu      $a0, $v1, $zero
    /* 7FEA0 8008FEA0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 7FEA4 8008FEA4 40100200 */  sll        $v0, $v0, 1
    /* 7FEA8 8008FEA8 21104300 */  addu       $v0, $v0, $v1
    /* 7FEAC 8008FEAC 80100200 */  sll        $v0, $v0, 2
    /* 7FEB0 8008FEB0 1180013C */  lui        $at, %hi(UniqTransPals)
    /* 7FEB4 8008FEB4 21082200 */  addu       $at, $at, $v0
    /* 7FEB8 8008FEB8 94A7258C */  lw         $a1, %lo(UniqTransPals)($at)
    /* 7FEBC 8008FEBC BB3F0208 */  j          .L8008FEEC
    /* 7FEC0 8008FEC0 00000000 */   nop
  .L8008FEC4:
    /* 7FEC4 8008FEC4 6400428E */  lw         $v0, %lo(D_80000064)($s2)
    /* 7FEC8 8008FEC8 00000000 */  nop
    /* 7FECC 8008FECC 07004280 */  lb         $v0, 0x7($v0)
    /* 7FED0 8008FED0 00000000 */  nop
    /* 7FED4 8008FED4 40100200 */  sll        $v0, $v0, 1
    /* 7FED8 8008FED8 21104400 */  addu       $v0, $v0, $a0
    /* 7FEDC 8008FEDC 80100200 */  sll        $v0, $v0, 2
    /* 7FEE0 8008FEE0 1180013C */  lui        $at, %hi(TransPals)
    /* 7FEE4 8008FEE4 21082200 */  addu       $at, $at, $v0
    /* 7FEE8 8008FEE8 7CA5258C */  lw         $a1, %lo(TransPals)($at)
  .L8008FEEC:
    /* 7FEEC 8008FEEC 33004382 */  lb         $v1, %lo(D_80000033)($s2)
    /* 7FEF0 8008FEF0 0F000224 */  addiu      $v0, $zero, 0xF
    /* 7FEF4 8008FEF4 0A006210 */  beq        $v1, $v0, .L8008FF20
    /* 7FEF8 8008FEF8 0A000224 */   addiu     $v0, $zero, 0xA
    /* 7FEFC 8008FEFC F800AE8F */  lw         $t6, 0xF8($sp)
    /* 7FF00 8008FF00 00000000 */  nop
    /* 7FF04 8008FF04 1A00C215 */  bne        $t6, $v0, .L8008FF70
    /* 7FF08 8008FF08 00000000 */   nop
    /* 7FF0C 8008FF0C 2C004296 */  lhu        $v0, %lo(D_8000002C)($s2)
    /* 7FF10 8008FF10 00000000 */  nop
    /* 7FF14 8008FF14 04004230 */  andi       $v0, $v0, 0x4
    /* 7FF18 8008FF18 15004010 */  beqz       $v0, .L8008FF70
    /* 7FF1C 8008FF1C 00000000 */   nop
  .L8008FF20:
    /* 7FF20 8008FF20 F800AD8F */  lw         $t5, 0xF8($sp)
    /* 7FF24 8008FF24 D000AE8F */  lw         $t6, 0xD0($sp)
    /* 7FF28 8008FF28 C0100D00 */  sll        $v0, $t5, 3
    /* 7FF2C 8008FF2C 1180013C */  lui        $at, %hi(StonePals + 0x4)
    /* 7FF30 8008FF30 21082200 */  addu       $at, $at, $v0
    /* 7FF34 8008FF34 A0AA258C */  lw         $a1, %lo(StonePals + 0x4)($at)
    /* 7FF38 8008FF38 04000224 */  addiu      $v0, $zero, 0x4
    /* 7FF3C 8008FF3C 0600C215 */  bne        $t6, $v0, .L8008FF58
    /* 7FF40 8008FF40 1D000224 */   addiu     $v0, $zero, 0x1D
    /* 7FF44 8008FF44 02000224 */  addiu      $v0, $zero, 0x2
    /* 7FF48 8008FF48 0300A214 */  bne        $a1, $v0, .L8008FF58
    /* 7FF4C 8008FF4C 1D000224 */   addiu     $v0, $zero, 0x1D
    /* 7FF50 8008FF50 03000524 */  addiu      $a1, $zero, 0x3
    /* 7FF54 8008FF54 F800AD8F */  lw         $t5, 0xF8($sp)
  .L8008FF58:
    /* 7FF58 8008FF58 00000000 */  nop
    /* 7FF5C 8008FF5C 0600A215 */  bne        $t5, $v0, .L8008FF78
    /* 7FF60 8008FF60 00000000 */   nop
    /* 7FF64 8008FF64 D000AE8F */  lw         $t6, 0xD0($sp)
    /* 7FF68 8008FF68 DE3F0208 */  j          .L8008FF78
    /* 7FF6C 8008FF6C 2128AE00 */   addu      $a1, $a1, $t6
  .L8008FF70:
    /* 7FF70 8008FF70 0B00A010 */  beqz       $a1, .L8008FFA0
    /* 7FF74 8008FF74 00000000 */   nop
  .L8008FF78:
    /* 7FF78 8008FF78 2800AD8F */  lw         $t5, 0x28($sp)
    /* 7FF7C 8008FF7C 00000000 */  nop
    /* 7FF80 8008FF80 7400A48D */  lw         $a0, 0x74($t5)
    /* 7FF84 8008FF84 8E47020C */  jal        GetFr__7TextDati_80091e38
    /* 7FF88 8008FF88 00000000 */   nop
    /* 7FF8C 8008FF8C 2800AE8F */  lw         $t6, 0x28($sp)
    /* 7FF90 8008FF90 21284000 */  addu       $a1, $v0, $zero
    /* 7FF94 8008FF94 7400C48D */  lw         $a0, 0x74($t6)
    /* 7FF98 8008FF98 754F020C */  jal        SetPal__7TextDatP9FRAME_HDRP8POLY_FT4
    /* 7FF9C 8008FF9C 21302002 */   addu      $a2, $s1, $zero
  .L8008FFA0:
    /* 7FFA0 8008FFA0 F800AD8F */  lw         $t5, 0xF8($sp)
    /* 7FFA4 8008FFA4 01000224 */  addiu      $v0, $zero, 0x1
    /* 7FFA8 8008FFA8 0D00A215 */  bne        $t5, $v0, .L8008FFE0
    /* 7FFAC 8008FFAC 00000000 */   nop
    /* 7FFB0 8008FFB0 0A000296 */  lhu        $v0, 0xA($s0)
    /* 7FFB4 8008FFB4 12000396 */  lhu        $v1, 0x12($s0)
    /* 7FFB8 8008FFB8 14004224 */  addiu      $v0, $v0, 0x14
    /* 7FFBC 8008FFBC 0A0002A6 */  sh         $v0, 0xA($s0)
    /* 7FFC0 8008FFC0 1A000296 */  lhu        $v0, 0x1A($s0)
    /* 7FFC4 8008FFC4 14006324 */  addiu      $v1, $v1, 0x14
    /* 7FFC8 8008FFC8 120003A6 */  sh         $v1, 0x12($s0)
    /* 7FFCC 8008FFCC 22000396 */  lhu        $v1, 0x22($s0)
    /* 7FFD0 8008FFD0 14004224 */  addiu      $v0, $v0, 0x14
    /* 7FFD4 8008FFD4 14006324 */  addiu      $v1, $v1, 0x14
    /* 7FFD8 8008FFD8 1A0002A6 */  sh         $v0, 0x1A($s0)
    /* 7FFDC 8008FFDC 220003A6 */  sh         $v1, 0x22($s0)
  .L8008FFE0:
    /* 7FFE0 8008FFE0 1280053C */  lui        $a1, %hi(_pcursmonst)
    /* 7FFE4 8008FFE4 58B7A524 */  addiu      $a1, $a1, %lo(_pcursmonst)
    /* 7FFE8 8008FFE8 F000A48F */  lw         $a0, 0xF0($sp)
    /* 7FFEC 8008FFEC 16058697 */  lhu        $a2, %gp_rel(D_8011AC96)($gp)
    /* 7FFF0 8008FFF0 18058797 */  lhu        $a3, %gp_rel(D_8011AC98)($gp)
    /* 7FFF4 8008FFF4 1A058297 */  lhu        $v0, %gp_rel(D_8011AC9A)($gp)
    /* 7FFF8 8008FFF8 0080C634 */  ori        $a2, $a2, 0x8000
    /* 7FFFC 8008FFFC 0080E734 */  ori        $a3, $a3, 0x8000
    /* 80000 80090000 00804234 */  ori        $v0, $v0, 0x8000
    /* 80004 80090004 AF46020C */  jal        GetHighlightCol__FiPiUsUsUs
    /* 80008 80090008 1000A2AF */   sw        $v0, 0x10($sp)
    /* 8000C 8009000C 21284000 */  addu       $a1, $v0, $zero
    /* 80010 80090010 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 80014 80090014 0800A210 */  beq        $a1, $v0, .L80090038
    /* 80018 80090018 FFFFA530 */   andi      $a1, $a1, 0xFFFF
    /* 8001C 8009001C 0E002496 */  lhu        $a0, 0xE($s1)
    /* 80020 80090020 4C6B020C */  jal        SCR_NeedHighlightPal__FUsUsi
    /* 80024 80090024 10000624 */   addiu     $a2, $zero, 0x10
    /* 80028 80090028 07002392 */  lbu        $v1, 0x7($s1)
    /* 8002C 8009002C 0E0022A6 */  sh         $v0, 0xE($s1)
    /* 80030 80090030 02006334 */  ori        $v1, $v1, 0x2
    /* 80034 80090034 070023A2 */  sb         $v1, 0x7($s1)
  .L80090038:
    /* 80038 80090038 1001AE8F */  lw         $t6, 0x110($sp)
  .L8009003C:
    /* 8003C 8009003C C800AD8F */  lw         $t5, 0xC8($sp)
    /* 80040 80090040 0400CE25 */  addiu      $t6, $t6, 0x4
    /* 80044 80090044 0100AD25 */  addiu      $t5, $t5, 0x1
    /* 80048 80090048 1001AEAF */  sw         $t6, 0x110($sp)
    /* 8004C 8009004C B23E0208 */  j          .L8008FAC8
    /* 80050 80090050 C800ADAF */   sw        $t5, 0xC8($sp)
  .L80090054:
    /* 80054 80090054 B800AE8F */  lw         $t6, 0xB8($sp)
    /* 80058 80090058 00000000 */  nop
    /* 8005C 8009005C 0100CE25 */  addiu      $t6, $t6, 0x1
    /* 80060 80090060 A93E0208 */  j          .L8008FAA4
    /* 80064 80090064 B800AEAF */   sw        $t6, 0xB8($sp)
  .L80090068:
    /* 80068 80090068 4401BF8F */  lw         $ra, 0x144($sp)
    /* 8006C 8009006C 4001BE8F */  lw         $fp, 0x140($sp)
    /* 80070 80090070 3C01B78F */  lw         $s7, 0x13C($sp)
    /* 80074 80090074 3801B68F */  lw         $s6, 0x138($sp)
    /* 80078 80090078 3401B58F */  lw         $s5, 0x134($sp)
    /* 8007C 8009007C 3001B48F */  lw         $s4, 0x130($sp)
    /* 80080 80090080 2C01B38F */  lw         $s3, 0x12C($sp)
    /* 80084 80090084 2801B28F */  lw         $s2, 0x128($sp)
    /* 80088 80090088 2401B18F */  lw         $s1, 0x124($sp)
    /* 8008C 8009008C 2001B08F */  lw         $s0, 0x120($sp)
    /* 80090 80090090 4801BD27 */  addiu      $sp, $sp, 0x148
    /* 80094 80090094 0800E003 */  jr         $ra
    /* 80098 80090098 00000000 */   nop
endlabel PrintMonsters__7CBlocksii
