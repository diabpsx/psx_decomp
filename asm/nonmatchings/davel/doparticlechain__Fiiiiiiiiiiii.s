.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching doparticlechain__Fiiiiiiiiiiii, 0x350

glabel doparticlechain__Fiiiiiiiiiiii
    /* 8F6B4 8009F6B4 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 8F6B8 8009F6B8 6800B0AF */  sw         $s0, 0x68($sp)
    /* 8F6BC 8009F6BC 21808000 */  addu       $s0, $a0, $zero
    /* 8F6C0 8009F6C0 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* 8F6C4 8009F6C4 2188A000 */  addu       $s1, $a1, $zero
    /* 8F6C8 8009F6C8 03140600 */  sra        $v0, $a2, 16
    /* 8F6CC 8009F6CC 02004104 */  bgez       $v0, .L8009F6D8
    /* 8F6D0 8009F6D0 21284000 */   addu      $a1, $v0, $zero
    /* 8F6D4 8009F6D4 23280500 */  negu       $a1, $a1
  .L8009F6D8:
    /* 8F6D8 8009F6D8 03140700 */  sra        $v0, $a3, 16
    /* 8F6DC 8009F6DC 8800BEAF */  sw         $fp, 0x88($sp)
    /* 8F6E0 8009F6E0 A400BE8F */  lw         $fp, 0xA4($sp)
    /* 8F6E4 8009F6E4 02004104 */  bgez       $v0, .L8009F6F0
    /* 8F6E8 8009F6E8 21204000 */   addu      $a0, $v0, $zero
    /* 8F6EC 8009F6EC 23200400 */  negu       $a0, $a0
  .L8009F6F0:
    /* 8F6F0 8009F6F0 7000B2AF */  sw         $s2, 0x70($sp)
    /* 8F6F4 8009F6F4 B000B28F */  lw         $s2, 0xB0($sp)
    /* 8F6F8 8009F6F8 BC00A28F */  lw         $v0, 0xBC($sp)
    /* 8F6FC 8009F6FC 1280083C */  lui        $t0, %hi(D_8011B0EC)
    /* 8F700 8009F700 ECB00825 */  addiu      $t0, $t0, %lo(D_8011B0EC)
    /* 8F704 8009F704 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* 8F708 8009F708 8400B7AF */  sw         $s7, 0x84($sp)
    /* 8F70C 8009F70C 8000B6AF */  sw         $s6, 0x80($sp)
    /* 8F710 8009F710 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* 8F714 8009F714 7800B4AF */  sw         $s4, 0x78($sp)
    /* 8F718 8009F718 03004014 */  bnez       $v0, .L8009F728
    /* 8F71C 8009F71C 7400B3AF */   sw        $s3, 0x74($sp)
    /* 8F720 8009F720 1280083C */  lui        $t0, %hi(D_8011B0E8)
    /* 8F724 8009F724 E8B00825 */  addiu      $t0, $t0, %lo(D_8011B0E8)
  .L8009F728:
    /* 8F728 8009F728 2A10A400 */  slt        $v0, $a1, $a0
    /* 8F72C 8009F72C 03004014 */  bnez       $v0, .L8009F73C
    /* 8F730 8009F730 C2170500 */   srl       $v0, $a1, 31
    /* 8F734 8009F734 D17D0208 */  j          .L8009F744
    /* 8F738 8009F738 2110A200 */   addu      $v0, $a1, $v0
  .L8009F73C:
    /* 8F73C 8009F73C C2170400 */  srl        $v0, $a0, 31
    /* 8F740 8009F740 21108200 */  addu       $v0, $a0, $v0
  .L8009F744:
    /* 8F744 8009F744 43200200 */  sra        $a0, $v0, 1
    /* 8F748 8009F748 02008014 */  bnez       $a0, .L8009F754
    /* 8F74C 8009F74C 00000000 */   nop
    /* 8F750 8009F750 01000424 */  addiu      $a0, $zero, 0x1
  .L8009F754:
    /* 8F754 8009F754 1A00C400 */  div        $zero, $a2, $a0
    /* 8F758 8009F758 12480000 */  mflo       $t1
    /* 8F75C 8009F75C 00000000 */  nop
    /* 8F760 8009F760 4000A9AF */  sw         $t1, 0x40($sp)
    /* 8F764 8009F764 1A00E400 */  div        $zero, $a3, $a0
    /* 8F768 8009F768 12480000 */  mflo       $t1
    /* 8F76C 8009F76C A000AA8F */  lw         $t2, 0xA0($sp)
    /* 8F770 8009F770 0000058D */  lw         $a1, 0x0($t0)
    /* 8F774 8009F774 00000000 */  nop
    /* 8F778 8009F778 2A10AA00 */  slt        $v0, $a1, $t2
    /* 8F77C 8009F77C 02004010 */  beqz       $v0, .L8009F788
    /* 8F780 8009F780 4800A9AF */   sw        $t1, 0x48($sp)
    /* 8F784 8009F784 A000A5AF */  sw         $a1, 0xA0($sp)
  .L8009F788:
    /* 8F788 8009F788 43200400 */  sra        $a0, $a0, 1
    /* 8F78C 8009F78C 03008014 */  bnez       $a0, .L8009F79C
    /* 8F790 8009F790 2110A400 */   addu      $v0, $a1, $a0
    /* 8F794 8009F794 01000424 */  addiu      $a0, $zero, 0x1
    /* 8F798 8009F798 2110A400 */  addu       $v0, $a1, $a0
  .L8009F79C:
    /* 8F79C 8009F79C 000002AD */  sw         $v0, 0x0($t0)
    /* 8F7A0 8009F7A0 7C09828F */  lw         $v0, %gp_rel(D_8011B0FC)($gp)
    /* 8F7A4 8009F7A4 00000000 */  nop
    /* 8F7A8 8009F7A8 03004010 */  beqz       $v0, .L8009F7B8
    /* 8F7AC 8009F7AC 00000000 */   nop
    /* 8F7B0 8009F7B0 F37D0208 */  j          .L8009F7CC
    /* 8F7B4 8009F7B4 2800A0AF */   sw        $zero, 0x28($sp)
  .L8009F7B8:
    /* 8F7B8 8009F7B8 3E10020C */  jal        VID_GetTick__Fv
    /* 8F7BC 8009F7BC 00000000 */   nop
    /* 8F7C0 8009F7C0 82100200 */  srl        $v0, $v0, 2
    /* 8F7C4 8009F7C4 07004230 */  andi       $v0, $v0, 0x7
    /* 8F7C8 8009F7C8 2800A2AF */  sw         $v0, 0x28($sp)
  .L8009F7CC:
    /* 8F7CC 8009F7CC 08004012 */  beqz       $s2, .L8009F7F0
    /* 8F7D0 8009F7D0 00000000 */   nop
    /* 8F7D4 8009F7D4 3D83000C */  jal        GU_GetRnd
    /* 8F7D8 8009F7D8 00000000 */   nop
    /* 8F7DC 8009F7DC 03004330 */  andi       $v1, $v0, 0x3
    /* 8F7E0 8009F7E0 21800302 */  addu       $s0, $s0, $v1
    /* 8F7E4 8009F7E4 03140200 */  sra        $v0, $v0, 16
    /* 8F7E8 8009F7E8 03004230 */  andi       $v0, $v0, 0x3
    /* 8F7EC 8009F7EC 21882202 */  addu       $s1, $s1, $v0
  .L8009F7F0:
    /* 8F7F0 8009F7F0 00841000 */  sll        $s0, $s0, 16
    /* 8F7F4 8009F7F4 008C1100 */  sll        $s1, $s1, 16
    /* 8F7F8 8009F7F8 21200000 */  addu       $a0, $zero, $zero
    /* 8F7FC 8009F7FC 3000B0AF */  sw         $s0, 0x30($sp)
    /* 8F800 8009F800 044F020C */  jal        GM_UseTexData__Fi
    /* 8F804 8009F804 3800B1AF */   sw        $s1, 0x38($sp)
    /* 8F808 8009F808 A000AA8F */  lw         $t2, 0xA0($sp)
    /* 8F80C 8009F80C 21B00000 */  addu       $s6, $zero, $zero
    /* 8F810 8009F810 6C004019 */  blez       $t2, .L8009F9C4
    /* 8F814 8009F814 2000A2AF */   sw        $v0, 0x20($sp)
    /* 8F818 8009F818 B400A98F */  lw         $t1, 0xB4($sp)
    /* 8F81C 8009F81C FF00023C */  lui        $v0, (0xFF0000 >> 16)
    /* 8F820 8009F820 24102201 */  and        $v0, $t1, $v0
    /* 8F824 8009F824 5000A2AF */  sw         $v0, 0x50($sp)
  .L8009F828:
    /* 8F828 8009F828 2800AA8F */  lw         $t2, 0x28($sp)
    /* 8F82C 8009F82C 2000A48F */  lw         $a0, 0x20($sp)
    /* 8F830 8009F830 23105601 */  subu       $v0, $t2, $s6
    /* 8F834 8009F834 07005330 */  andi       $s3, $v0, 0x7
    /* 8F838 8009F838 D0007326 */  addiu      $s3, $s3, 0xD0
    /* 8F83C 8009F83C 7082020C */  jal        GetFr__7TextDati_800a09c0
    /* 8F840 8009F840 21286002 */   addu      $a1, $s3, $zero
    /* 8F844 8009F844 0800428C */  lw         $v0, 0x8($v0)
    /* 8F848 8009F848 00000000 */  nop
    /* 8F84C 8009F84C FF015430 */  andi       $s4, $v0, 0x1FF
    /* 8F850 8009F850 18009E02 */  mult       $s4, $fp
    /* 8F854 8009F854 3000A98F */  lw         $t1, 0x30($sp)
    /* 8F858 8009F858 3800AA8F */  lw         $t2, 0x38($sp)
    /* 8F85C 8009F85C 42920200 */  srl        $s2, $v0, 9
    /* 8F860 8009F860 FF015232 */  andi       $s2, $s2, 0x1FF
    /* 8F864 8009F864 03840900 */  sra        $s0, $t1, 16
    /* 8F868 8009F868 12180000 */  mflo       $v1
    /* 8F86C 8009F86C 038C0A00 */  sra        $s1, $t2, 16
    /* 8F870 8009F870 4000AA8F */  lw         $t2, 0x40($sp)
    /* 8F874 8009F874 18005E02 */  mult       $s2, $fp
    /* 8F878 8009F878 23482A01 */  subu       $t1, $t1, $t2
    /* 8F87C 8009F87C 3000A9AF */  sw         $t1, 0x30($sp)
    /* 8F880 8009F880 3800A98F */  lw         $t1, 0x38($sp)
    /* 8F884 8009F884 4800AA8F */  lw         $t2, 0x48($sp)
    /* 8F888 8009F888 00000000 */  nop
    /* 8F88C 8009F88C 23482A01 */  subu       $t1, $t1, $t2
    /* 8F890 8009F890 3800A9AF */  sw         $t1, 0x38($sp)
    /* 8F894 8009F894 AC00A98F */  lw         $t1, 0xAC($sp)
    /* 8F898 8009F898 C3A30300 */  sra        $s4, $v1, 15
    /* 8F89C 8009F89C 031C0300 */  sra        $v1, $v1, 16
    /* 8F8A0 8009F8A0 23800302 */  subu       $s0, $s0, $v1
    /* 8F8A4 8009F8A4 12100000 */  mflo       $v0
    /* 8F8A8 8009F8A8 C3930200 */  sra        $s2, $v0, 15
    /* 8F8AC 8009F8AC 03140200 */  sra        $v0, $v0, 16
    /* 8F8B0 8009F8B0 03002011 */  beqz       $t1, .L8009F8C0
    /* 8F8B4 8009F8B4 23882202 */   subu      $s1, $s1, $v0
    /* 8F8B8 8009F8B8 317E0208 */  j          .L8009F8C4
    /* 8F8BC 8009F8BC 831A1E00 */   sra       $v1, $fp, 10
  .L8009F8C0:
    /* 8F8C0 8009F8C0 431A1E00 */  sra        $v1, $fp, 9
  .L8009F8C4:
    /* 8F8C4 8009F8C4 5000AA8F */  lw         $t2, 0x50($sp)
    /* 8F8C8 8009F8C8 00000000 */  nop
    /* 8F8CC 8009F8CC 04004011 */  beqz       $t2, .L8009F8E0
    /* 8F8D0 8009F8D0 21406000 */   addu      $t0, $v1, $zero
    /* 8F8D4 8009F8D4 B400A98F */  lw         $t1, 0xB4($sp)
    /* 8F8D8 8009F8D8 00000000 */  nop
    /* 8F8DC 8009F8DC 02440900 */  srl        $t0, $t1, 16
  .L8009F8E0:
    /* 8F8E0 8009F8E0 B400AA8F */  lw         $t2, 0xB4($sp)
    /* 8F8E4 8009F8E4 00000000 */  nop
    /* 8F8E8 8009F8E8 00FF4231 */  andi       $v0, $t2, 0xFF00
    /* 8F8EC 8009F8EC 02004014 */  bnez       $v0, .L8009F8F8
    /* 8F8F0 8009F8F0 02BA0A00 */   srl       $s7, $t2, 8
    /* 8F8F4 8009F8F4 21B86000 */  addu       $s7, $v1, $zero
  .L8009F8F8:
    /* 8F8F8 8009F8F8 B400A98F */  lw         $t1, 0xB4($sp)
    /* 8F8FC 8009F8FC 00000000 */  nop
    /* 8F900 8009F900 FF002231 */  andi       $v0, $t1, 0xFF
    /* 8F904 8009F904 02004010 */  beqz       $v0, .L8009F910
    /* 8F908 8009F908 21A86000 */   addu      $s5, $v1, $zero
    /* 8F90C 8009F90C B400B593 */  lbu        $s5, 0xB4($sp)
  .L8009F910:
    /* 8F910 8009F910 21286002 */  addu       $a1, $s3, $zero
    /* 8F914 8009F914 21300002 */  addu       $a2, $s0, $zero
    /* 8F918 8009F918 2000A48F */  lw         $a0, 0x20($sp)
    /* 8F91C 8009F91C B800AA8F */  lw         $t2, 0xB8($sp)
    /* 8F920 8009F920 21382002 */  addu       $a3, $s1, $zero
    /* 8F924 8009F924 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8F928 8009F928 1800A0AF */  sw         $zero, 0x18($sp)
    /* 8F92C 8009F92C 6000A8AF */  sw         $t0, 0x60($sp)
    /* 8F930 8009F930 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 8F934 8009F934 1400AAAF */   sw        $t2, 0x14($sp)
    /* 8F938 8009F938 AC00A98F */  lw         $t1, 0xAC($sp)
    /* 8F93C 8009F93C 6000A88F */  lw         $t0, 0x60($sp)
    /* 8F940 8009F940 05002011 */  beqz       $t1, .L8009F958
    /* 8F944 8009F944 21284000 */   addu      $a1, $v0, $zero
    /* 8F948 8009F948 1600A294 */  lhu        $v0, 0x16($a1)
    /* 8F94C 8009F94C 00000000 */  nop
    /* 8F950 8009F950 20004234 */  ori        $v0, $v0, 0x20
    /* 8F954 8009F954 1600A2A4 */  sh         $v0, 0x16($a1)
  .L8009F958:
    /* 8F958 8009F958 21201402 */  addu       $a0, $s0, $s4
    /* 8F95C 8009F95C 0700A390 */  lbu        $v1, 0x7($a1)
    /* 8F960 8009F960 21103202 */  addu       $v0, $s1, $s2
    /* 8F964 8009F964 1A00A2A4 */  sh         $v0, 0x1A($a1)
    /* 8F968 8009F968 2200A2A4 */  sh         $v0, 0x22($a1)
    /* 8F96C 8009F96C 0008C22B */  slti       $v0, $fp, 0x800
    /* 8F970 8009F970 0800B0A4 */  sh         $s0, 0x8($a1)
    /* 8F974 8009F974 0A00B1A4 */  sh         $s1, 0xA($a1)
    /* 8F978 8009F978 1000A4A4 */  sh         $a0, 0x10($a1)
    /* 8F97C 8009F97C 1200B1A4 */  sh         $s1, 0x12($a1)
    /* 8F980 8009F980 1800B0A4 */  sh         $s0, 0x18($a1)
    /* 8F984 8009F984 2000A4A4 */  sh         $a0, 0x20($a1)
    /* 8F988 8009F988 0400A8A0 */  sb         $t0, 0x4($a1)
    /* 8F98C 8009F98C 0500B7A0 */  sb         $s7, 0x5($a1)
    /* 8F990 8009F990 0600B5A0 */  sb         $s5, 0x6($a1)
    /* 8F994 8009F994 02006334 */  ori        $v1, $v1, 0x2
    /* 8F998 8009F998 FE006330 */  andi       $v1, $v1, 0xFE
    /* 8F99C 8009F99C 04004014 */  bnez       $v0, .L8009F9B0
    /* 8F9A0 8009F9A0 0700A3A0 */   sb        $v1, 0x7($a1)
    /* 8F9A4 8009F9A4 A800AA8F */  lw         $t2, 0xA8($sp)
    /* 8F9A8 8009F9A8 00000000 */  nop
    /* 8F9AC 8009F9AC 23F0CA03 */  subu       $fp, $fp, $t2
  .L8009F9B0:
    /* 8F9B0 8009F9B0 A000A98F */  lw         $t1, 0xA0($sp)
    /* 8F9B4 8009F9B4 0100D626 */  addiu      $s6, $s6, 0x1
    /* 8F9B8 8009F9B8 2A10C902 */  slt        $v0, $s6, $t1
    /* 8F9BC 8009F9BC 9AFF4014 */  bnez       $v0, .L8009F828
    /* 8F9C0 8009F9C0 00000000 */   nop
  .L8009F9C4:
    /* 8F9C4 8009F9C4 2000A48F */  lw         $a0, 0x20($sp)
    /* 8F9C8 8009F9C8 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 8F9CC 8009F9CC 00000000 */   nop
    /* 8F9D0 8009F9D0 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* 8F9D4 8009F9D4 8800BE8F */  lw         $fp, 0x88($sp)
    /* 8F9D8 8009F9D8 8400B78F */  lw         $s7, 0x84($sp)
    /* 8F9DC 8009F9DC 8000B68F */  lw         $s6, 0x80($sp)
    /* 8F9E0 8009F9E0 7C00B58F */  lw         $s5, 0x7C($sp)
    /* 8F9E4 8009F9E4 7800B48F */  lw         $s4, 0x78($sp)
    /* 8F9E8 8009F9E8 7400B38F */  lw         $s3, 0x74($sp)
    /* 8F9EC 8009F9EC 7000B28F */  lw         $s2, 0x70($sp)
    /* 8F9F0 8009F9F0 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 8F9F4 8009F9F4 6800B08F */  lw         $s0, 0x68($sp)
    /* 8F9F8 8009F9F8 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 8F9FC 8009F9FC 0800E003 */  jr         $ra
    /* 8FA00 8009FA00 00000000 */   nop
endlabel doparticlechain__Fiiiiiiiiiiii
