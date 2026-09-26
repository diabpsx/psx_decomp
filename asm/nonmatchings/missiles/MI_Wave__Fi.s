.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Wave__Fi, 0x49C

glabel MI_Wave__Fi
    /* EA08 80148600 60FFBD27 */  addiu      $sp, $sp, -0xA0
    /* EA0C 80148604 7800B0AF */  sw         $s0, 0x78($sp)
    /* EA10 80148608 21808000 */  addu       $s0, $a0, $zero
    /* EA14 8014860C 80101000 */  sll        $v0, $s0, 2
    /* EA18 80148610 21105000 */  addu       $v0, $v0, $s0
    /* EA1C 80148614 80100200 */  sll        $v0, $v0, 2
    /* EA20 80148618 23105000 */  subu       $v0, $v0, $s0
    /* EA24 8014861C 8400B3AF */  sw         $s3, 0x84($sp)
    /* EA28 80148620 80980200 */  sll        $s3, $v0, 2
    /* EA2C 80148624 9C00BFAF */  sw         $ra, 0x9C($sp)
    /* EA30 80148628 9800BEAF */  sw         $fp, 0x98($sp)
    /* EA34 8014862C 9400B7AF */  sw         $s7, 0x94($sp)
    /* EA38 80148630 9000B6AF */  sw         $s6, 0x90($sp)
    /* EA3C 80148634 8C00B5AF */  sw         $s5, 0x8C($sp)
    /* EA40 80148638 8800B4AF */  sw         $s4, 0x88($sp)
    /* EA44 8014863C 8000B2AF */  sw         $s2, 0x80($sp)
    /* EA48 80148640 7C00B1AF */  sw         $s1, 0x7C($sp)
    /* EA4C 80148644 3800A0AF */  sw         $zero, 0x38($sp)
    /* EA50 80148648 4000A0AF */  sw         $zero, 0x40($sp)
    /* EA54 8014864C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* EA58 80148650 21083300 */  addu       $at, $at, $s3
    /* EA5C 80148654 762C2684 */  lh         $a2, %lo(missile + 0x1E)($at)
    /* EA60 80148658 1080013C */  lui        $at, %hi(missile + 0x20)
    /* EA64 8014865C 21083300 */  addu       $at, $at, $s3
    /* EA68 80148660 782C2784 */  lh         $a3, %lo(missile + 0x20)($at)
    /* EA6C 80148664 1080013C */  lui        $at, %hi(missile + 0x31)
    /* EA70 80148668 21083300 */  addu       $at, $at, $s3
    /* EA74 8014866C 892C3E80 */  lb         $fp, %lo(missile + 0x31)($at)
    /* EA78 80148670 1080013C */  lui        $at, %hi(missile + 0x32)
    /* EA7C 80148674 21083300 */  addu       $at, $at, $s3
    /* EA80 80148678 8A2C2880 */  lb         $t0, %lo(missile + 0x32)($at)
    /* EA84 8014867C 00000000 */  nop
    /* EA88 80148680 4800A8AF */  sw         $t0, 0x48($sp)
    /* EA8C 80148684 4800A58F */  lw         $a1, 0x48($sp)
    /* EA90 80148688 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* EA94 8014868C 21083300 */  addu       $at, $at, $s3
    /* EA98 80148690 862C3684 */  lh         $s6, %lo(missile + 0x2E)($at)
    /* EA9C 80148694 8AF6000C */  jal        GetDirection__Fiiii
    /* EAA0 80148698 2120C003 */   addu      $a0, $fp, $zero
    /* EAA4 8014869C 80480200 */  sll        $t1, $v0, 2
    /* EAA8 801486A0 1080083C */  lui        $t0, %hi(XDirAdd)
    /* EAAC 801486A4 D8290825 */  addiu      $t0, $t0, %lo(XDirAdd)
    /* EAB0 801486A8 21A02801 */  addu       $s4, $t1, $t0
    /* EAB4 801486AC 1080083C */  lui        $t0, %hi(YDirAdd)
    /* EAB8 801486B0 F8290825 */  addiu      $t0, $t0, %lo(YDirAdd)
    /* EABC 801486B4 21B82801 */  addu       $s7, $t1, $t0
    /* EAC0 801486B8 5000A9AF */  sw         $t1, 0x50($sp)
    /* EAC4 801486BC 0000838E */  lw         $v1, 0x0($s4)
    /* EAC8 801486C0 0000E48E */  lw         $a0, 0x0($s7)
    /* EACC 801486C4 4800A98F */  lw         $t1, 0x48($sp)
    /* EAD0 801486C8 2190C303 */  addu       $s2, $fp, $v1
    /* EAD4 801486CC 21882401 */  addu       $s1, $t1, $a0
    /* EAD8 801486D0 21204002 */  addu       $a0, $s2, $zero
    /* EADC 801486D4 21282002 */  addu       $a1, $s1, $zero
    /* EAE0 801486D8 FEFF4324 */  addiu      $v1, $v0, -0x2
    /* EAE4 801486DC 07006330 */  andi       $v1, $v1, 0x7
    /* EAE8 801486E0 02004224 */  addiu      $v0, $v0, 0x2
    /* EAEC 801486E4 07004230 */  andi       $v0, $v0, 0x7
    /* EAF0 801486E8 2800A3AF */  sw         $v1, 0x28($sp)
    /* EAF4 801486EC 900B020C */  jal        GetMISSILE__Fii
    /* EAF8 801486F0 3000A2AF */   sw        $v0, 0x30($sp)
    /* EAFC 801486F4 C7004014 */  bnez       $v0, .L80148A14
    /* EB00 801486F8 80101000 */   sll       $v0, $s0, 2
    /* EB04 801486FC 21204002 */  addu       $a0, $s2, $zero
    /* EB08 80148700 21282002 */  addu       $a1, $s1, $zero
    /* EB0C 80148704 40101600 */  sll        $v0, $s6, 1
    /* EB10 80148708 21105600 */  addu       $v0, $v0, $s6
    /* EB14 8014870C 80100200 */  sll        $v0, $v0, 2
    /* EB18 80148710 21105600 */  addu       $v0, $v0, $s6
    /* EB1C 80148714 00110200 */  sll        $v0, $v0, 4
    /* EB20 80148718 23105600 */  subu       $v0, $v0, $s6
    /* EB24 8014871C 80100200 */  sll        $v0, $v0, 2
    /* EB28 80148720 21105600 */  addu       $v0, $v0, $s6
    /* EB2C 80148724 C0100200 */  sll        $v0, $v0, 3
    /* EB30 80148728 5800A2AF */  sw         $v0, 0x58($sp)
    /* EB34 8014872C 0000868E */  lw         $a2, 0x0($s4)
    /* EB38 80148730 0000E78E */  lw         $a3, 0x0($s7)
    /* EB3C 80148734 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* EB40 80148738 21082200 */  addu       $at, $at, $v0
    /* EB44 8014873C 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* EB48 80148740 0E000224 */  addiu      $v0, $zero, 0xE
    /* EB4C 80148744 1400A2AF */  sw         $v0, 0x14($sp)
    /* EB50 80148748 1800A0AF */  sw         $zero, 0x18($sp)
    /* EB54 8014874C 1C00B6AF */  sw         $s6, 0x1C($sp)
    /* EB58 80148750 2000A0AF */  sw         $zero, 0x20($sp)
    /* EB5C 80148754 21304602 */  addu       $a2, $s2, $a2
    /* EB60 80148758 1000A3AF */  sw         $v1, 0x10($sp)
    /* EB64 8014875C 1080013C */  lui        $at, %hi(missile + 0x40)
    /* EB68 80148760 21083300 */  addu       $at, $at, $s3
    /* EB6C 80148764 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* EB70 80148768 21382702 */  addu       $a3, $s1, $a3
    /* EB74 8014876C 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* EB78 80148770 2400A2AF */   sw        $v0, 0x24($sp)
    /* EB7C 80148774 1080093C */  lui        $t1, %hi(XDirAdd)
    /* EB80 80148778 D8292925 */  addiu      $t1, $t1, %lo(XDirAdd)
    /* EB84 8014877C 21A80000 */  addu       $s5, $zero, $zero
    /* EB88 80148780 2800A88F */  lw         $t0, 0x28($sp)
    /* EB8C 80148784 0000858E */  lw         $a1, 0x0($s4)
    /* EB90 80148788 0000E48E */  lw         $a0, 0x0($s7)
    /* EB94 8014878C 80180800 */  sll        $v1, $t0, 2
    /* EB98 80148790 21106900 */  addu       $v0, $v1, $t1
    /* EB9C 80148794 1080083C */  lui        $t0, %hi(YDirAdd)
    /* EBA0 80148798 F8290825 */  addiu      $t0, $t0, %lo(YDirAdd)
    /* EBA4 8014879C 21186800 */  addu       $v1, $v1, $t0
    /* EBA8 801487A0 2128C503 */  addu       $a1, $fp, $a1
    /* EBAC 801487A4 1080083C */  lui        $t0, %hi(XDirAdd)
    /* EBB0 801487A8 D8290825 */  addiu      $t0, $t0, %lo(XDirAdd)
    /* EBB4 801487AC 0000428C */  lw         $v0, 0x0($v0)
    /* EBB8 801487B0 3000A98F */  lw         $t1, 0x30($sp)
    /* EBBC 801487B4 21904202 */  addu       $s2, $s2, $v0
    /* EBC0 801487B8 0000628C */  lw         $v0, 0x0($v1)
    /* EBC4 801487BC 80180900 */  sll        $v1, $t1, 2
    /* EBC8 801487C0 4800A98F */  lw         $t1, 0x48($sp)
    /* EBCC 801487C4 21882202 */  addu       $s1, $s1, $v0
    /* EBD0 801487C8 21106800 */  addu       $v0, $v1, $t0
    /* EBD4 801487CC 21202401 */  addu       $a0, $t1, $a0
    /* EBD8 801487D0 1080083C */  lui        $t0, %hi(YDirAdd)
    /* EBDC 801487D4 F8290825 */  addiu      $t0, $t0, %lo(YDirAdd)
    /* EBE0 801487D8 21186800 */  addu       $v1, $v1, $t0
    /* EBE4 801487DC 0000428C */  lw         $v0, 0x0($v0)
    /* EBE8 801487E0 0000638C */  lw         $v1, 0x0($v1)
    /* EBEC 801487E4 21A0A200 */  addu       $s4, $a1, $v0
    /* EBF0 801487E8 1080013C */  lui        $at, %hi(missile + 0x40)
    /* EBF4 801487EC 21083300 */  addu       $at, $at, $s3
    /* EBF8 801487F0 982C2290 */  lbu        $v0, %lo(missile + 0x40)($at)
    /* EBFC 801487F4 00000000 */  nop
    /* EC00 801487F8 00160200 */  sll        $v0, $v0, 24
    /* EC04 801487FC 43160200 */  sra        $v0, $v0, 25
    /* EC08 80148800 02004224 */  addiu      $v0, $v0, 0x2
    /* EC0C 80148804 82004018 */  blez       $v0, .L80148A10
    /* EC10 80148808 21988300 */   addu      $s3, $a0, $v1
    /* EC14 8014880C 5000A98F */  lw         $t1, 0x50($sp)
    /* EC18 80148810 6800B7AF */  sw         $s7, 0x68($sp)
    /* EC1C 80148814 5800B78F */  lw         $s7, 0x58($sp)
    /* EC20 80148818 10801E3C */  lui        $fp, %hi(XDirAdd)
    /* EC24 8014881C D829DE27 */  addiu      $fp, $fp, %lo(XDirAdd)
    /* EC28 80148820 6000A9AF */  sw         $t1, 0x60($sp)
    /* EC2C 80148824 21204002 */  addu       $a0, $s2, $zero
  .L80148828:
    /* EC30 80148828 900B020C */  jal        GetMISSILE__Fii
    /* EC34 8014882C 21282002 */   addu      $a1, $s1, $zero
    /* EC38 80148830 31004014 */  bnez       $v0, .L801488F8
    /* EC3C 80148834 01000924 */   addiu     $t1, $zero, 0x1
    /* EC40 80148838 3800A88F */  lw         $t0, 0x38($sp)
    /* EC44 8014883C 00000000 */  nop
    /* EC48 80148840 2D000015 */  bnez       $t0, .L801488F8
    /* EC4C 80148844 FFFF4226 */   addiu     $v0, $s2, -0x1
    /* EC50 80148848 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* EC54 8014884C 2A004010 */  beqz       $v0, .L801488F8
    /* EC58 80148850 FFFF2226 */   addiu     $v0, $s1, -0x1
    /* EC5C 80148854 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* EC60 80148858 27004010 */  beqz       $v0, .L801488F8
    /* EC64 8014885C 21204002 */   addu      $a0, $s2, $zero
    /* EC68 80148860 21282002 */  addu       $a1, $s1, $zero
    /* EC6C 80148864 6000A98F */  lw         $t1, 0x60($sp)
    /* EC70 80148868 6800A88F */  lw         $t0, 0x68($sp)
    /* EC74 8014886C 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* EC78 80148870 21083700 */  addu       $at, $at, $s7
    /* EC7C 80148874 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* EC80 80148878 21103E01 */  addu       $v0, $t1, $fp
    /* EC84 8014887C 0000468C */  lw         $a2, 0x0($v0)
    /* EC88 80148880 0000078D */  lw         $a3, 0x0($t0)
    /* EC8C 80148884 0E000224 */  addiu      $v0, $zero, 0xE
    /* EC90 80148888 1400A2AF */  sw         $v0, 0x14($sp)
    /* EC94 8014888C 80101000 */  sll        $v0, $s0, 2
    /* EC98 80148890 21105000 */  addu       $v0, $v0, $s0
    /* EC9C 80148894 80100200 */  sll        $v0, $v0, 2
    /* ECA0 80148898 23105000 */  subu       $v0, $v0, $s0
    /* ECA4 8014889C 80100200 */  sll        $v0, $v0, 2
    /* ECA8 801488A0 1800A0AF */  sw         $zero, 0x18($sp)
    /* ECAC 801488A4 1C00B6AF */  sw         $s6, 0x1C($sp)
    /* ECB0 801488A8 2000A0AF */  sw         $zero, 0x20($sp)
    /* ECB4 801488AC 1000A3AF */  sw         $v1, 0x10($sp)
    /* ECB8 801488B0 1080013C */  lui        $at, %hi(missile + 0x40)
    /* ECBC 801488B4 21082200 */  addu       $at, $at, $v0
    /* ECC0 801488B8 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* ECC4 801488BC 21304602 */  addu       $a2, $s2, $a2
    /* ECC8 801488C0 21382702 */  addu       $a3, $s1, $a3
    /* ECCC 801488C4 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* ECD0 801488C8 2400A2AF */   sw        $v0, 0x24($sp)
    /* ECD4 801488CC 2800A98F */  lw         $t1, 0x28($sp)
    /* ECD8 801488D0 1080083C */  lui        $t0, %hi(YDirAdd)
    /* ECDC 801488D4 F8290825 */  addiu      $t0, $t0, %lo(YDirAdd)
    /* ECE0 801488D8 80100900 */  sll        $v0, $t1, 2
    /* ECE4 801488DC 21185E00 */  addu       $v1, $v0, $fp
    /* ECE8 801488E0 21104800 */  addu       $v0, $v0, $t0
    /* ECEC 801488E4 0000638C */  lw         $v1, 0x0($v1)
    /* ECF0 801488E8 0000428C */  lw         $v0, 0x0($v0)
    /* ECF4 801488EC 21904302 */  addu       $s2, $s2, $v1
    /* ECF8 801488F0 3F220508 */  j          .L801488FC
    /* ECFC 801488F4 21882202 */   addu      $s1, $s1, $v0
  .L801488F8:
    /* ED00 801488F8 3800A9AF */  sw         $t1, 0x38($sp)
  .L801488FC:
    /* ED04 801488FC 21208002 */  addu       $a0, $s4, $zero
    /* ED08 80148900 900B020C */  jal        GetMISSILE__Fii
    /* ED0C 80148904 21286002 */   addu      $a1, $s3, $zero
    /* ED10 80148908 31004014 */  bnez       $v0, .L801489D0
    /* ED14 8014890C 01000924 */   addiu     $t1, $zero, 0x1
    /* ED18 80148910 4000A88F */  lw         $t0, 0x40($sp)
    /* ED1C 80148914 00000000 */  nop
    /* ED20 80148918 2D000015 */  bnez       $t0, .L801489D0
    /* ED24 8014891C FFFF8226 */   addiu     $v0, $s4, -0x1
    /* ED28 80148920 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* ED2C 80148924 2A004010 */  beqz       $v0, .L801489D0
    /* ED30 80148928 FFFF6226 */   addiu     $v0, $s3, -0x1
    /* ED34 8014892C 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* ED38 80148930 27004010 */  beqz       $v0, .L801489D0
    /* ED3C 80148934 21208002 */   addu      $a0, $s4, $zero
    /* ED40 80148938 21286002 */  addu       $a1, $s3, $zero
    /* ED44 8014893C 6000A98F */  lw         $t1, 0x60($sp)
    /* ED48 80148940 6800A88F */  lw         $t0, 0x68($sp)
    /* ED4C 80148944 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* ED50 80148948 21083700 */  addu       $at, $at, $s7
    /* ED54 8014894C 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* ED58 80148950 21103E01 */  addu       $v0, $t1, $fp
    /* ED5C 80148954 0000468C */  lw         $a2, 0x0($v0)
    /* ED60 80148958 0000078D */  lw         $a3, 0x0($t0)
    /* ED64 8014895C 0E000224 */  addiu      $v0, $zero, 0xE
    /* ED68 80148960 1400A2AF */  sw         $v0, 0x14($sp)
    /* ED6C 80148964 80101000 */  sll        $v0, $s0, 2
    /* ED70 80148968 21105000 */  addu       $v0, $v0, $s0
    /* ED74 8014896C 80100200 */  sll        $v0, $v0, 2
    /* ED78 80148970 23105000 */  subu       $v0, $v0, $s0
    /* ED7C 80148974 80100200 */  sll        $v0, $v0, 2
    /* ED80 80148978 1800A0AF */  sw         $zero, 0x18($sp)
    /* ED84 8014897C 1C00B6AF */  sw         $s6, 0x1C($sp)
    /* ED88 80148980 2000A0AF */  sw         $zero, 0x20($sp)
    /* ED8C 80148984 1000A3AF */  sw         $v1, 0x10($sp)
    /* ED90 80148988 1080013C */  lui        $at, %hi(missile + 0x40)
    /* ED94 8014898C 21082200 */  addu       $at, $at, $v0
    /* ED98 80148990 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* ED9C 80148994 21308602 */  addu       $a2, $s4, $a2
    /* EDA0 80148998 21386702 */  addu       $a3, $s3, $a3
    /* EDA4 8014899C 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* EDA8 801489A0 2400A2AF */   sw        $v0, 0x24($sp)
    /* EDAC 801489A4 3000A98F */  lw         $t1, 0x30($sp)
    /* EDB0 801489A8 1080083C */  lui        $t0, %hi(YDirAdd)
    /* EDB4 801489AC F8290825 */  addiu      $t0, $t0, %lo(YDirAdd)
    /* EDB8 801489B0 80100900 */  sll        $v0, $t1, 2
    /* EDBC 801489B4 21185E00 */  addu       $v1, $v0, $fp
    /* EDC0 801489B8 21104800 */  addu       $v0, $v0, $t0
    /* EDC4 801489BC 0000638C */  lw         $v1, 0x0($v1)
    /* EDC8 801489C0 0000428C */  lw         $v0, 0x0($v0)
    /* EDCC 801489C4 21A08302 */  addu       $s4, $s4, $v1
    /* EDD0 801489C8 75220508 */  j          .L801489D4
    /* EDD4 801489CC 21986202 */   addu      $s3, $s3, $v0
  .L801489D0:
    /* EDD8 801489D0 4000A9AF */  sw         $t1, 0x40($sp)
  .L801489D4:
    /* EDDC 801489D4 80101000 */  sll        $v0, $s0, 2
    /* EDE0 801489D8 21105000 */  addu       $v0, $v0, $s0
    /* EDE4 801489DC 80100200 */  sll        $v0, $v0, 2
    /* EDE8 801489E0 23105000 */  subu       $v0, $v0, $s0
    /* EDEC 801489E4 80100200 */  sll        $v0, $v0, 2
    /* EDF0 801489E8 1080013C */  lui        $at, %hi(missile + 0x40)
    /* EDF4 801489EC 21082200 */  addu       $at, $at, $v0
    /* EDF8 801489F0 982C2290 */  lbu        $v0, %lo(missile + 0x40)($at)
    /* EDFC 801489F4 0100B526 */  addiu      $s5, $s5, 0x1
    /* EE00 801489F8 00160200 */  sll        $v0, $v0, 24
    /* EE04 801489FC 43160200 */  sra        $v0, $v0, 25
    /* EE08 80148A00 02004224 */  addiu      $v0, $v0, 0x2
    /* EE0C 80148A04 2A10A202 */  slt        $v0, $s5, $v0
    /* EE10 80148A08 87FF4014 */  bnez       $v0, .L80148828
    /* EE14 80148A0C 21204002 */   addu      $a0, $s2, $zero
  .L80148A10:
    /* EE18 80148A10 80101000 */  sll        $v0, $s0, 2
  .L80148A14:
    /* EE1C 80148A14 21105000 */  addu       $v0, $v0, $s0
    /* EE20 80148A18 80100200 */  sll        $v0, $v0, 2
    /* EE24 80148A1C 23105000 */  subu       $v0, $v0, $s0
    /* EE28 80148A20 80180200 */  sll        $v1, $v0, 2
    /* EE2C 80148A24 1080013C */  lui        $at, %hi(missile + 0x18)
    /* EE30 80148A28 21082300 */  addu       $at, $at, $v1
    /* EE34 80148A2C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* EE38 80148A30 00000000 */  nop
    /* EE3C 80148A34 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* EE40 80148A38 1080013C */  lui        $at, %hi(missile + 0x18)
    /* EE44 80148A3C 21082300 */  addu       $at, $at, $v1
    /* EE48 80148A40 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* EE4C 80148A44 1080013C */  lui        $at, %hi(missile + 0x18)
    /* EE50 80148A48 21082300 */  addu       $at, $at, $v1
    /* EE54 80148A4C 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* EE58 80148A50 00000000 */  nop
    /* EE5C 80148A54 04004014 */  bnez       $v0, .L80148A68
    /* EE60 80148A58 01000224 */   addiu     $v0, $zero, 0x1
    /* EE64 80148A5C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* EE68 80148A60 21082300 */  addu       $at, $at, $v1
    /* EE6C 80148A64 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
  .L80148A68:
    /* EE70 80148A68 9C00BF8F */  lw         $ra, 0x9C($sp)
    /* EE74 80148A6C 9800BE8F */  lw         $fp, 0x98($sp)
    /* EE78 80148A70 9400B78F */  lw         $s7, 0x94($sp)
    /* EE7C 80148A74 9000B68F */  lw         $s6, 0x90($sp)
    /* EE80 80148A78 8C00B58F */  lw         $s5, 0x8C($sp)
    /* EE84 80148A7C 8800B48F */  lw         $s4, 0x88($sp)
    /* EE88 80148A80 8400B38F */  lw         $s3, 0x84($sp)
    /* EE8C 80148A84 8000B28F */  lw         $s2, 0x80($sp)
    /* EE90 80148A88 7C00B18F */  lw         $s1, 0x7C($sp)
    /* EE94 80148A8C 7800B08F */  lw         $s0, 0x78($sp)
    /* EE98 80148A90 A000BD27 */  addiu      $sp, $sp, 0xA0
    /* EE9C 80148A94 0800E003 */  jr         $ra
    /* EEA0 80148A98 00000000 */   nop
endlabel MI_Wave__Fi
