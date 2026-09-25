.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching reservememblockai, 0x6D4

glabel reservememblockai
    /* 1A6E8 8002A6E8 2C1D828F */  lw         $v0, %gp_rel(lowmemadr)($gp)
    /* 1A6EC 8002A6EC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1A6F0 8002A6F0 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1A6F4 8002A6F4 21B08000 */  addu       $s6, $a0, $zero
    /* 1A6F8 8002A6F8 3400B7AF */  sw         $s7, 0x34($sp)
    /* 1A6FC 8002A6FC 21B8A000 */  addu       $s7, $a1, $zero
    /* 1A700 8002A700 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1A704 8002A704 21A0C000 */  addu       $s4, $a2, $zero
    /* 1A708 8002A708 3800BEAF */  sw         $fp, 0x38($sp)
    /* 1A70C 8002A70C 21F0E000 */  addu       $fp, $a3, $zero
    /* 1A710 8002A710 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 1A714 8002A714 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1A718 8002A718 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1A71C 8002A71C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1A720 8002A720 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1A724 8002A724 0B004014 */  bnez       $v0, .L8002A754
    /* 1A728 8002A728 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1A72C 8002A72C 9501C013 */  beqz       $fp, .L8002AD84
    /* 1A730 8002A730 00000000 */   nop
    /* 1A734 8002A734 1180043C */  lui        $a0, %hi(D_8010F548)
    /* 1A738 8002A738 48F58424 */  addiu      $a0, $a0, %lo(D_8010F548)
    /* 1A73C 8002A73C 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1A740 8002A740 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1A744 8002A744 1280013C */  lui        $at, %hi(abortfile)
    /* 1A748 8002A748 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1A74C 8002A74C FAA90008 */  j          .L8002A7E8
    /* 1A750 8002A750 87010224 */   addiu     $v0, $zero, 0x187
  .L8002A754:
    /* 1A754 8002A754 1300E01E */  bgtz       $s7, .L8002A7A4
    /* 1A758 8002A758 00000000 */   nop
    /* 1A75C 8002A75C 8A01C013 */  beqz       $fp, .L8002AD88
    /* 1A760 8002A760 21100000 */   addu      $v0, $zero, $zero
    /* 1A764 8002A764 F1AC000C */  jal        largestunusedinclassi
    /* 1A768 8002A768 21208002 */   addu      $a0, $s4, $zero
    /* 1A76C 8002A76C 1180043C */  lui        $a0, %hi(D_8010F584)
    /* 1A770 8002A770 84F58424 */  addiu      $a0, $a0, %lo(D_8010F584)
    /* 1A774 8002A774 2128C002 */  addu       $a1, $s6, $zero
    /* 1A778 8002A778 2130E002 */  addu       $a2, $s7, $zero
    /* 1A77C 8002A77C 21384000 */  addu       $a3, $v0, $zero
    /* 1A780 8002A780 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1A784 8002A784 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1A788 8002A788 1280013C */  lui        $at, %hi(abortfile)
    /* 1A78C 8002A78C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1A790 8002A790 8F010224 */  addiu      $v0, $zero, 0x18F
    /* 1A794 8002A794 1280013C */  lui        $at, %hi(abortline)
    /* 1A798 8002A798 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1A79C 8002A79C 5FAB0008 */  j          .L8002AD7C
    /* 1A7A0 8002A7A0 1000B4AF */   sw        $s4, 0x10($sp)
  .L8002A7A4:
    /* 1A7A4 8002A7A4 0300C016 */  bnez       $s6, .L8002A7B4
    /* 1A7A8 8002A7A8 00000000 */   nop
    /* 1A7AC 8002A7AC 1280163C */  lui        $s6, %hi(D_8011C4D8)
    /* 1A7B0 8002A7B0 D8C4D626 */  addiu      $s6, $s6, %lo(D_8011C4D8)
  .L8002A7B4:
    /* 1A7B4 8002A7B4 0000C292 */  lbu        $v0, 0x0($s6)
    /* 1A7B8 8002A7B8 00000000 */  nop
    /* 1A7BC 8002A7BC 10004014 */  bnez       $v0, .L8002A800
    /* 1A7C0 8002A7C0 21200000 */   addu      $a0, $zero, $zero
    /* 1A7C4 8002A7C4 6F01C013 */  beqz       $fp, .L8002AD84
    /* 1A7C8 8002A7C8 2128E002 */   addu      $a1, $s7, $zero
    /* 1A7CC 8002A7CC 1180043C */  lui        $a0, %hi(D_8010F5E0)
    /* 1A7D0 8002A7D0 E0F58424 */  addiu      $a0, $a0, %lo(D_8010F5E0)
    /* 1A7D4 8002A7D4 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1A7D8 8002A7D8 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1A7DC 8002A7DC 1280013C */  lui        $at, %hi(abortfile)
    /* 1A7E0 8002A7E0 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1A7E4 8002A7E4 98010224 */  addiu      $v0, $zero, 0x198
  .L8002A7E8:
    /* 1A7E8 8002A7E8 1280013C */  lui        $at, %hi(abortline)
    /* 1A7EC 8002A7EC BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1A7F0 8002A7F0 0F95000C */  jal        abortmessage
    /* 1A7F4 8002A7F4 00000000 */   nop
    /* 1A7F8 8002A7F8 62AB0008 */  j          .L8002AD88
    /* 1A7FC 8002A7FC 21100000 */   addu      $v0, $zero, $zero
  .L8002A800:
    /* 1A800 8002A800 441D828F */  lw         $v0, %gp_rel(reservememcallback)($gp)
    /* 1A804 8002A804 2128C002 */  addu       $a1, $s6, $zero
    /* 1A808 8002A808 2130E002 */  addu       $a2, $s7, $zero
    /* 1A80C 8002A80C 09F84000 */  jalr       $v0
    /* 1A810 8002A810 21388002 */   addu      $a3, $s4, $zero
    /* 1A814 8002A814 2120C002 */  addu       $a0, $s6, $zero
    /* 1A818 8002A818 000F8232 */  andi       $v0, $s4, 0xF00
    /* 1A81C 8002A81C 03120200 */  sra        $v0, $v0, 8
    /* 1A820 8002A820 40180200 */  sll        $v1, $v0, 1
    /* 1A824 8002A824 21186200 */  addu       $v1, $v1, $v0
    /* 1A828 8002A828 C0180300 */  sll        $v1, $v1, 3
    /* 1A82C 8002A82C 1380023C */  lui        $v0, %hi(memclass)
    /* 1A830 8002A830 307A4224 */  addiu      $v0, $v0, %lo(memclass)
    /* 1A834 8002A834 46BD000C */  jal        filename
    /* 1A838 8002A838 21986200 */   addu      $s3, $v1, $v0
    /* 1A83C 8002A83C 21B04000 */  addu       $s6, $v0, $zero
    /* 1A840 8002A840 40008232 */  andi       $v0, $s4, 0x40
    /* 1A844 8002A844 05004010 */  beqz       $v0, .L8002A85C
    /* 1A848 8002A848 00000000 */   nop
    /* 1A84C 8002A84C 1400638E */  lw         $v1, 0x14($s3)
    /* 1A850 8002A850 0C00628E */  lw         $v0, 0xC($s3)
    /* 1A854 8002A854 1AAA0008 */  j          .L8002A868
    /* 1A858 8002A858 2118E302 */   addu      $v1, $s7, $v1
  .L8002A85C:
    /* 1A85C 8002A85C 1400638E */  lw         $v1, 0x14($s3)
    /* 1A860 8002A860 0800628E */  lw         $v0, 0x8($s3)
    /* 1A864 8002A864 2118E302 */  addu       $v1, $s7, $v1
  .L8002A868:
    /* 1A868 8002A868 21186200 */  addu       $v1, $v1, $v0
    /* 1A86C 8002A86C 27100200 */  nor        $v0, $zero, $v0
    /* 1A870 8002A870 0000708E */  lw         $s0, 0x0($s3)
    /* 1A874 8002A874 00000000 */  nop
    /* 1A878 8002A878 29010012 */  beqz       $s0, .L8002AD20
    /* 1A87C 8002A87C 24A86200 */   and       $s5, $v1, $v0
    /* 1A880 8002A880 1800028E */  lw         $v0, 0x18($s0)
    /* 1A884 8002A884 FFF01124 */  addiu      $s1, $zero, -0xF01
    /* 1A888 8002A888 00800334 */  ori        $v1, $zero, 0x8000
    /* 1A88C 8002A88C 24105100 */  and        $v0, $v0, $s1
    /* 1A890 8002A890 18004310 */  beq        $v0, $v1, .L8002A8F4
    /* 1A894 8002A894 00000000 */   nop
    /* 1A898 8002A898 3A01C013 */  beqz       $fp, .L8002AD84
    /* 1A89C 8002A89C 04000424 */   addiu     $a0, $zero, 0x4
    /* 1A8A0 8002A8A0 441D828F */  lw         $v0, %gp_rel(reservememcallback)($gp)
    /* 1A8A4 8002A8A4 2128C002 */  addu       $a1, $s6, $zero
    /* 1A8A8 8002A8A8 2130E002 */  addu       $a2, $s7, $zero
    /* 1A8AC 8002A8AC 09F84000 */  jalr       $v0
    /* 1A8B0 8002A8B0 21388002 */   addu      $a3, $s4, $zero
    /* 1A8B4 8002A8B4 1180043C */  lui        $a0, %hi(D_8010F610)
    /* 1A8B8 8002A8B8 10F68424 */  addiu      $a0, $a0, %lo(D_8010F610)
    /* 1A8BC 8002A8BC 1800068E */  lw         $a2, 0x18($s0)
    /* 1A8C0 8002A8C0 2128E002 */  addu       $a1, $s7, $zero
    /* 1A8C4 8002A8C4 00800734 */  ori        $a3, $zero, 0x8000
    /* 1A8C8 8002A8C8 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1A8CC 8002A8CC D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1A8D0 8002A8D0 1280013C */  lui        $at, %hi(abortfile)
    /* 1A8D4 8002A8D4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1A8D8 8002A8D8 B2010224 */  addiu      $v0, $zero, 0x1B2
    /* 1A8DC 8002A8DC 1280013C */  lui        $at, %hi(abortline)
    /* 1A8E0 8002A8E0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1A8E4 8002A8E4 0F95000C */  jal        abortmessage
    /* 1A8E8 8002A8E8 2430D100 */   and       $a2, $a2, $s1
    /* 1A8EC 8002A8EC 62AB0008 */  j          .L8002AD88
    /* 1A8F0 8002A8F0 21100000 */   addu      $v0, $zero, $zero
  .L8002A8F4:
    /* 1A8F4 8002A8F4 20008232 */  andi       $v0, $s4, 0x20
    /* 1A8F8 8002A8F8 7C004014 */  bnez       $v0, .L8002AAEC
    /* 1A8FC 8002A8FC 00000000 */   nop
    /* 1A900 8002A900 381D828F */  lw         $v0, %gp_rel(autocompact)($gp)
    /* 1A904 8002A904 00000000 */  nop
    /* 1A908 8002A908 06004010 */  beqz       $v0, .L8002A924
    /* 1A90C 8002A90C 10008232 */   andi      $v0, $s4, 0x10
    /* 1A910 8002A910 04004014 */  bnez       $v0, .L8002A924
    /* 1A914 8002A914 00000000 */   nop
    /* 1A918 8002A918 0400648E */  lw         $a0, 0x4($s3)
    /* 1A91C 8002A91C E9AE000C */  jal        compactupi
    /* 1A920 8002A920 21280002 */   addu      $a1, $s0, $zero
  .L8002A924:
    /* 1A924 8002A924 40009032 */  andi       $s0, $s4, 0x40
  .L8002A928:
    /* 1A928 8002A928 0000628E */  lw         $v0, 0x0($s3)
    /* 1A92C 8002A92C 00000000 */  nop
    /* 1A930 8002A930 2000528C */  lw         $s2, 0x20($v0)
    /* 1A934 8002A934 0000518C */  lw         $s1, 0x0($v0)
    /* 1A938 8002A938 06000012 */  beqz       $s0, .L8002A954
    /* 1A93C 8002A93C 00000000 */   nop
    /* 1A940 8002A940 0C00628E */  lw         $v0, 0xC($s3)
    /* 1A944 8002A944 00000000 */  nop
    /* 1A948 8002A948 21182202 */  addu       $v1, $s1, $v0
    /* 1A94C 8002A94C 27100200 */  nor        $v0, $zero, $v0
    /* 1A950 8002A950 24886200 */  and        $s1, $v1, $v0
  .L8002A954:
    /* 1A954 8002A954 0000438E */  lw         $v1, 0x0($s2)
    /* 1A958 8002A958 68AA0008 */  j          .L8002A9A0
    /* 1A95C 8002A95C 21280000 */   addu      $a1, $zero, $zero
  .L8002A960:
    /* 1A960 8002A960 0000438E */  lw         $v1, 0x0($s2)
    /* 1A964 8002A964 1000428E */  lw         $v0, 0x10($s2)
    /* 1A968 8002A968 06000012 */  beqz       $s0, .L8002A984
    /* 1A96C 8002A96C 21886200 */   addu      $s1, $v1, $v0
    /* 1A970 8002A970 0C00628E */  lw         $v0, 0xC($s3)
    /* 1A974 8002A974 00000000 */  nop
    /* 1A978 8002A978 21182202 */  addu       $v1, $s1, $v0
    /* 1A97C 8002A97C 27100200 */  nor        $v0, $zero, $v0
    /* 1A980 8002A980 24886200 */  and        $s1, $v1, $v0
  .L8002A984:
    /* 1A984 8002A984 0400628E */  lw         $v0, 0x4($s3)
    /* 1A988 8002A988 00000000 */  nop
    /* 1A98C 8002A98C 0A004212 */  beq        $s2, $v0, .L8002A9B8
    /* 1A990 8002A990 2A10B500 */   slt       $v0, $a1, $s5
    /* 1A994 8002A994 2000528E */  lw         $s2, 0x20($s2)
    /* 1A998 8002A998 00000000 */  nop
    /* 1A99C 8002A99C 0000438E */  lw         $v1, 0x0($s2)
  .L8002A9A0:
    /* 1A9A0 8002A9A0 00000000 */  nop
    /* 1A9A4 8002A9A4 2B102302 */  sltu       $v0, $s1, $v1
    /* 1A9A8 8002A9A8 EDFF4010 */  beqz       $v0, .L8002A960
    /* 1A9AC 8002A9AC 00000000 */   nop
    /* 1A9B0 8002A9B0 23287100 */  subu       $a1, $v1, $s1
    /* 1A9B4 8002A9B4 2A10B500 */  slt        $v0, $a1, $s5
  .L8002A9B8:
    /* 1A9B8 8002A9B8 18004014 */  bnez       $v0, .L8002AA1C
    /* 1A9BC 8002A9BC 00000000 */   nop
    /* 1A9C0 8002A9C0 C8AD000C */  jal        getmemblock
    /* 1A9C4 8002A9C4 00000000 */   nop
    /* 1A9C8 8002A9C8 21804000 */  addu       $s0, $v0, $zero
    /* 1A9CC 8002A9CC 341D838F */  lw         $v1, %gp_rel(sequence)($gp)
    /* 1A9D0 8002A9D0 04000426 */  addiu      $a0, $s0, 0x4
    /* 1A9D4 8002A9D4 2128C002 */  addu       $a1, $s6, $zero
    /* 1A9D8 8002A9D8 0C000624 */  addiu      $a2, $zero, 0xC
    /* 1A9DC 8002A9DC 180014AE */  sw         $s4, 0x18($s0)
    /* 1A9E0 8002A9E0 140017AE */  sw         $s7, 0x14($s0)
    /* 1A9E4 8002A9E4 100015AE */  sw         $s5, 0x10($s0)
    /* 1A9E8 8002A9E8 01006224 */  addiu      $v0, $v1, 0x1
    /* 1A9EC 8002A9EC 341D82AF */  sw         $v0, %gp_rel(sequence)($gp)
    /* 1A9F0 8002A9F0 8367000C */  jal        strncpy
    /* 1A9F4 8002A9F4 1C0003AE */   sw        $v1, 0x1C($s0)
    /* 1A9F8 8002A9F8 000011AE */  sw         $s1, 0x0($s0)
    /* 1A9FC 8002A9FC 2400428E */  lw         $v0, 0x24($s2)
    /* 1AA00 8002AA00 200012AE */  sw         $s2, 0x20($s0)
    /* 1AA04 8002AA04 240002AE */  sw         $v0, 0x24($s0)
    /* 1AA08 8002AA08 2400428E */  lw         $v0, 0x24($s2)
    /* 1AA0C 8002AA0C 00000000 */  nop
    /* 1AA10 8002AA10 200050AC */  sw         $s0, 0x20($v0)
    /* 1AA14 8002AA14 03AB0008 */  j          .L8002AC0C
    /* 1AA18 8002AA18 240050AE */   sw        $s0, 0x24($s2)
  .L8002AA1C:
    /* 1AA1C 8002AA1C 0400628E */  lw         $v0, 0x4($s3)
    /* 1AA20 8002AA20 00000000 */  nop
    /* 1AA24 8002AA24 0D004212 */  beq        $s2, $v0, .L8002AA5C
    /* 1AA28 8002AA28 00000000 */   nop
    /* 1AA2C 8002AA2C 0000438E */  lw         $v1, 0x0($s2)
    /* 1AA30 8002AA30 1000428E */  lw         $v0, 0x10($s2)
    /* 1AA34 8002AA34 06000012 */  beqz       $s0, .L8002AA50
    /* 1AA38 8002AA38 21886200 */   addu      $s1, $v1, $v0
    /* 1AA3C 8002AA3C 0C00628E */  lw         $v0, 0xC($s3)
    /* 1AA40 8002AA40 00000000 */  nop
    /* 1AA44 8002AA44 21182202 */  addu       $v1, $s1, $v0
    /* 1AA48 8002AA48 27100200 */  nor        $v0, $zero, $v0
    /* 1AA4C 8002AA4C 24886200 */  and        $s1, $v1, $v0
  .L8002AA50:
    /* 1AA50 8002AA50 2000528E */  lw         $s2, 0x20($s2)
    /* 1AA54 8002AA54 55AA0008 */  j          .L8002A954
    /* 1AA58 8002AA58 00000000 */   nop
  .L8002AA5C:
    /* 1AA5C 8002AA5C 88A7000C */  jal        cacheonei
    /* 1AA60 8002AA60 21208002 */   addu      $a0, $s4, $zero
    /* 1AA64 8002AA64 07004010 */  beqz       $v0, .L8002AA84
    /* 1AA68 8002AA68 00000000 */   nop
    /* 1AA6C 8002AA6C 0400648E */  lw         $a0, 0x4($s3)
    /* 1AA70 8002AA70 0000658E */  lw         $a1, 0x0($s3)
    /* 1AA74 8002AA74 E9AE000C */  jal        compactupi
    /* 1AA78 8002AA78 00000000 */   nop
    /* 1AA7C 8002AA7C 4AAA0008 */  j          .L8002A928
    /* 1AA80 8002AA80 00000000 */   nop
  .L8002AA84:
    /* 1AA84 8002AA84 BF00C013 */  beqz       $fp, .L8002AD84
    /* 1AA88 8002AA88 01000424 */   addiu     $a0, $zero, 0x1
    /* 1AA8C 8002AA8C 441D828F */  lw         $v0, %gp_rel(reservememcallback)($gp)
    /* 1AA90 8002AA90 2128C002 */  addu       $a1, $s6, $zero
    /* 1AA94 8002AA94 2130E002 */  addu       $a2, $s7, $zero
    /* 1AA98 8002AA98 09F84000 */  jalr       $v0
    /* 1AA9C 8002AA9C 21388002 */   addu      $a3, $s4, $zero
    /* 1AAA0 8002AAA0 1280023C */  lui        $v0, %hi(sendtoprintmem)
    /* 1AAA4 8002AAA4 ACC5428C */  lw         $v0, %lo(sendtoprintmem)($v0)
    /* 1AAA8 8002AAA8 00000000 */  nop
    /* 1AAAC 8002AAAC 01004224 */  addiu      $v0, $v0, 0x1
    /* 1AAB0 8002AAB0 1280013C */  lui        $at, %hi(sendtoprintmem)
    /* 1AAB4 8002AAB4 ACC522AC */  sw         $v0, %lo(sendtoprintmem)($at)
    /* 1AAB8 8002AAB8 F1AC000C */  jal        largestunusedinclassi
    /* 1AABC 8002AABC 21208002 */   addu      $a0, $s4, $zero
    /* 1AAC0 8002AAC0 1180043C */  lui        $a0, %hi(D_8010F664)
    /* 1AAC4 8002AAC4 64F68424 */  addiu      $a0, $a0, %lo(D_8010F664)
    /* 1AAC8 8002AAC8 2128C002 */  addu       $a1, $s6, $zero
    /* 1AACC 8002AACC 2130E002 */  addu       $a2, $s7, $zero
    /* 1AAD0 8002AAD0 21384000 */  addu       $a3, $v0, $zero
    /* 1AAD4 8002AAD4 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1AAD8 8002AAD8 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1AADC 8002AADC 1280013C */  lui        $at, %hi(abortfile)
    /* 1AAE0 8002AAE0 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1AAE4 8002AAE4 44AB0008 */  j          .L8002AD10
    /* 1AAE8 8002AAE8 33020224 */   addiu     $v0, $zero, 0x233
  .L8002AAEC:
    /* 1AAEC 8002AAEC 381D828F */  lw         $v0, %gp_rel(autocompact)($gp)
    /* 1AAF0 8002AAF0 00000000 */  nop
    /* 1AAF4 8002AAF4 06004010 */  beqz       $v0, .L8002AB10
    /* 1AAF8 8002AAF8 10008232 */   andi      $v0, $s4, 0x10
    /* 1AAFC 8002AAFC 04004014 */  bnez       $v0, .L8002AB10
    /* 1AB00 8002AB00 00000000 */   nop
    /* 1AB04 8002AB04 0400658E */  lw         $a1, 0x4($s3)
    /* 1AB08 8002AB08 5CAF000C */  jal        compactdowni
    /* 1AB0C 8002AB0C 21200002 */   addu      $a0, $s0, $zero
  .L8002AB10:
    /* 1AB10 8002AB10 40009032 */  andi       $s0, $s4, 0x40
  .L8002AB14:
    /* 1AB14 8002AB14 0400628E */  lw         $v0, 0x4($s3)
    /* 1AB18 8002AB18 00000000 */  nop
    /* 1AB1C 8002AB1C 2400528C */  lw         $s2, 0x24($v0)
    /* 1AB20 8002AB20 0000518C */  lw         $s1, 0x0($v0)
    /* 1AB24 8002AB24 05000012 */  beqz       $s0, .L8002AB3C
    /* 1AB28 8002AB28 21280000 */   addu      $a1, $zero, $zero
    /* 1AB2C 8002AB2C 0C00628E */  lw         $v0, 0xC($s3)
    /* 1AB30 8002AB30 00000000 */  nop
    /* 1AB34 8002AB34 27100200 */  nor        $v0, $zero, $v0
    /* 1AB38 8002AB38 24882202 */  and        $s1, $s1, $v0
  .L8002AB3C:
    /* 1AB3C 8002AB3C 0000448E */  lw         $a0, 0x0($s2)
    /* 1AB40 8002AB40 1000428E */  lw         $v0, 0x10($s2)
    /* 1AB44 8002AB44 06000012 */  beqz       $s0, .L8002AB60
    /* 1AB48 8002AB48 21188200 */   addu      $v1, $a0, $v0
    /* 1AB4C 8002AB4C 0C00628E */  lw         $v0, 0xC($s3)
    /* 1AB50 8002AB50 00000000 */  nop
    /* 1AB54 8002AB54 21186200 */  addu       $v1, $v1, $v0
    /* 1AB58 8002AB58 27100200 */  nor        $v0, $zero, $v0
    /* 1AB5C 8002AB5C 24186200 */  and        $v1, $v1, $v0
  .L8002AB60:
    /* 1AB60 8002AB60 2B107100 */  sltu       $v0, $v1, $s1
    /* 1AB64 8002AB64 37004014 */  bnez       $v0, .L8002AC44
    /* 1AB68 8002AB68 00000000 */   nop
    /* 1AB6C 8002AB6C 05000012 */  beqz       $s0, .L8002AB84
    /* 1AB70 8002AB70 21888000 */   addu      $s1, $a0, $zero
    /* 1AB74 8002AB74 0C00628E */  lw         $v0, 0xC($s3)
    /* 1AB78 8002AB78 00000000 */  nop
    /* 1AB7C 8002AB7C 27100200 */  nor        $v0, $zero, $v0
    /* 1AB80 8002AB80 24882202 */  and        $s1, $s1, $v0
  .L8002AB84:
    /* 1AB84 8002AB84 0000628E */  lw         $v0, 0x0($s3)
    /* 1AB88 8002AB88 00000000 */  nop
    /* 1AB8C 8002AB8C 05004212 */  beq        $s2, $v0, .L8002ABA4
    /* 1AB90 8002AB90 2A10B500 */   slt       $v0, $a1, $s5
    /* 1AB94 8002AB94 2400528E */  lw         $s2, 0x24($s2)
    /* 1AB98 8002AB98 CFAA0008 */  j          .L8002AB3C
    /* 1AB9C 8002AB9C 00000000 */   nop
  .L8002ABA0:
    /* 1ABA0 8002ABA0 2A10B500 */  slt        $v0, $a1, $s5
  .L8002ABA4:
    /* 1ABA4 8002ABA4 29004014 */  bnez       $v0, .L8002AC4C
    /* 1ABA8 8002ABA8 00000000 */   nop
    /* 1ABAC 8002ABAC C8AD000C */  jal        getmemblock
    /* 1ABB0 8002ABB0 00000000 */   nop
    /* 1ABB4 8002ABB4 21804000 */  addu       $s0, $v0, $zero
    /* 1ABB8 8002ABB8 341D838F */  lw         $v1, %gp_rel(sequence)($gp)
    /* 1ABBC 8002ABBC 04000426 */  addiu      $a0, $s0, 0x4
    /* 1ABC0 8002ABC0 2128C002 */  addu       $a1, $s6, $zero
    /* 1ABC4 8002ABC4 0C000624 */  addiu      $a2, $zero, 0xC
    /* 1ABC8 8002ABC8 180014AE */  sw         $s4, 0x18($s0)
    /* 1ABCC 8002ABCC 140017AE */  sw         $s7, 0x14($s0)
    /* 1ABD0 8002ABD0 100015AE */  sw         $s5, 0x10($s0)
    /* 1ABD4 8002ABD4 01006224 */  addiu      $v0, $v1, 0x1
    /* 1ABD8 8002ABD8 341D82AF */  sw         $v0, %gp_rel(sequence)($gp)
    /* 1ABDC 8002ABDC 8367000C */  jal        strncpy
    /* 1ABE0 8002ABE0 1C0003AE */   sw        $v1, 0x1C($s0)
    /* 1ABE4 8002ABE4 23103502 */  subu       $v0, $s1, $s5
    /* 1ABE8 8002ABE8 000002AE */  sw         $v0, 0x0($s0)
    /* 1ABEC 8002ABEC 240012AE */  sw         $s2, 0x24($s0)
    /* 1ABF0 8002ABF0 2000428E */  lw         $v0, 0x20($s2)
    /* 1ABF4 8002ABF4 00000000 */  nop
    /* 1ABF8 8002ABF8 200002AE */  sw         $v0, 0x20($s0)
    /* 1ABFC 8002ABFC 2000428E */  lw         $v0, 0x20($s2)
    /* 1AC00 8002AC00 00000000 */  nop
    /* 1AC04 8002AC04 240050AC */  sw         $s0, 0x24($v0)
    /* 1AC08 8002AC08 200050AE */  sw         $s0, 0x20($s2)
  .L8002AC0C:
    /* 1AC0C 8002AC0C 1400628E */  lw         $v0, 0x14($s3)
    /* 1AC10 8002AC10 00000000 */  nop
    /* 1AC14 8002AC14 03004010 */  beqz       $v0, .L8002AC24
    /* 1AC18 8002AC18 00000000 */   nop
    /* 1AC1C 8002AC1C 00B1000C */  jal        addsentinel
    /* 1AC20 8002AC20 21200002 */   addu      $a0, $s0, $zero
  .L8002AC24:
    /* 1AC24 8002AC24 381D828F */  lw         $v0, %gp_rel(autocompact)($gp)
    /* 1AC28 8002AC28 00000000 */  nop
    /* 1AC2C 8002AC2C 56004010 */  beqz       $v0, .L8002AD88
    /* 1AC30 8002AC30 21100002 */   addu      $v0, $s0, $zero
    /* 1AC34 8002AC34 C4AC000C */  jal        updatehighwater
    /* 1AC38 8002AC38 00000000 */   nop
    /* 1AC3C 8002AC3C 62AB0008 */  j          .L8002AD88
    /* 1AC40 8002AC40 21100002 */   addu      $v0, $s0, $zero
  .L8002AC44:
    /* 1AC44 8002AC44 E8AA0008 */  j          .L8002ABA0
    /* 1AC48 8002AC48 23282302 */   subu      $a1, $s1, $v1
  .L8002AC4C:
    /* 1AC4C 8002AC4C 0000628E */  lw         $v0, 0x0($s3)
    /* 1AC50 8002AC50 00000000 */  nop
    /* 1AC54 8002AC54 0B004212 */  beq        $s2, $v0, .L8002AC84
    /* 1AC58 8002AC58 00000000 */   nop
    /* 1AC5C 8002AC5C 0000518E */  lw         $s1, 0x0($s2)
    /* 1AC60 8002AC60 05000012 */  beqz       $s0, .L8002AC78
    /* 1AC64 8002AC64 00000000 */   nop
    /* 1AC68 8002AC68 0C00628E */  lw         $v0, 0xC($s3)
    /* 1AC6C 8002AC6C 00000000 */  nop
    /* 1AC70 8002AC70 27100200 */  nor        $v0, $zero, $v0
    /* 1AC74 8002AC74 24882202 */  and        $s1, $s1, $v0
  .L8002AC78:
    /* 1AC78 8002AC78 2400528E */  lw         $s2, 0x24($s2)
    /* 1AC7C 8002AC7C CFAA0008 */  j          .L8002AB3C
    /* 1AC80 8002AC80 21280000 */   addu      $a1, $zero, $zero
  .L8002AC84:
    /* 1AC84 8002AC84 88A7000C */  jal        cacheonei
    /* 1AC88 8002AC88 21208002 */   addu      $a0, $s4, $zero
    /* 1AC8C 8002AC8C 07004010 */  beqz       $v0, .L8002ACAC
    /* 1AC90 8002AC90 00000000 */   nop
    /* 1AC94 8002AC94 0000648E */  lw         $a0, 0x0($s3)
    /* 1AC98 8002AC98 0400658E */  lw         $a1, 0x4($s3)
    /* 1AC9C 8002AC9C 5CAF000C */  jal        compactdowni
    /* 1ACA0 8002ACA0 00000000 */   nop
    /* 1ACA4 8002ACA4 C5AA0008 */  j          .L8002AB14
    /* 1ACA8 8002ACA8 00000000 */   nop
  .L8002ACAC:
    /* 1ACAC 8002ACAC 3500C013 */  beqz       $fp, .L8002AD84
    /* 1ACB0 8002ACB0 01000424 */   addiu     $a0, $zero, 0x1
    /* 1ACB4 8002ACB4 441D828F */  lw         $v0, %gp_rel(reservememcallback)($gp)
    /* 1ACB8 8002ACB8 2128C002 */  addu       $a1, $s6, $zero
    /* 1ACBC 8002ACBC 2130E002 */  addu       $a2, $s7, $zero
    /* 1ACC0 8002ACC0 09F84000 */  jalr       $v0
    /* 1ACC4 8002ACC4 21388002 */   addu      $a3, $s4, $zero
    /* 1ACC8 8002ACC8 1280023C */  lui        $v0, %hi(sendtoprintmem)
    /* 1ACCC 8002ACCC ACC5428C */  lw         $v0, %lo(sendtoprintmem)($v0)
    /* 1ACD0 8002ACD0 00000000 */  nop
    /* 1ACD4 8002ACD4 01004224 */  addiu      $v0, $v0, 0x1
    /* 1ACD8 8002ACD8 1280013C */  lui        $at, %hi(sendtoprintmem)
    /* 1ACDC 8002ACDC ACC522AC */  sw         $v0, %lo(sendtoprintmem)($at)
    /* 1ACE0 8002ACE0 F1AC000C */  jal        largestunusedinclassi
    /* 1ACE4 8002ACE4 21208002 */   addu      $a0, $s4, $zero
    /* 1ACE8 8002ACE8 1180043C */  lui        $a0, %hi(D_8010F6B4)
    /* 1ACEC 8002ACEC B4F68424 */  addiu      $a0, $a0, %lo(D_8010F6B4)
    /* 1ACF0 8002ACF0 2128C002 */  addu       $a1, $s6, $zero
    /* 1ACF4 8002ACF4 2130E002 */  addu       $a2, $s7, $zero
    /* 1ACF8 8002ACF8 21384000 */  addu       $a3, $v0, $zero
    /* 1ACFC 8002ACFC 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1AD00 8002AD00 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1AD04 8002AD04 1280013C */  lui        $at, %hi(abortfile)
    /* 1AD08 8002AD08 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1AD0C 8002AD0C 89020224 */  addiu      $v0, $zero, 0x289
  .L8002AD10:
    /* 1AD10 8002AD10 1280013C */  lui        $at, %hi(abortline)
    /* 1AD14 8002AD14 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1AD18 8002AD18 0F95000C */  jal        abortmessage
    /* 1AD1C 8002AD1C 1000B4AF */   sw        $s4, 0x10($sp)
  .L8002AD20:
    /* 1AD20 8002AD20 1800C013 */  beqz       $fp, .L8002AD84
    /* 1AD24 8002AD24 02000424 */   addiu     $a0, $zero, 0x2
    /* 1AD28 8002AD28 441D828F */  lw         $v0, %gp_rel(reservememcallback)($gp)
    /* 1AD2C 8002AD2C 2128C002 */  addu       $a1, $s6, $zero
    /* 1AD30 8002AD30 2130E002 */  addu       $a2, $s7, $zero
    /* 1AD34 8002AD34 09F84000 */  jalr       $v0
    /* 1AD38 8002AD38 21388002 */   addu      $a3, $s4, $zero
    /* 1AD3C 8002AD3C F1AC000C */  jal        largestunusedinclassi
    /* 1AD40 8002AD40 21208002 */   addu      $a0, $s4, $zero
    /* 1AD44 8002AD44 1180043C */  lui        $a0, %hi(D_8010F708)
    /* 1AD48 8002AD48 08F78424 */  addiu      $a0, $a0, %lo(D_8010F708)
    /* 1AD4C 8002AD4C 21288002 */  addu       $a1, $s4, $zero
    /* 1AD50 8002AD50 2130C002 */  addu       $a2, $s6, $zero
    /* 1AD54 8002AD54 2138E002 */  addu       $a3, $s7, $zero
    /* 1AD58 8002AD58 1180033C */  lui        $v1, %hi(D_8010F3D4)
    /* 1AD5C 8002AD5C D4F36324 */  addiu      $v1, $v1, %lo(D_8010F3D4)
    /* 1AD60 8002AD60 1280013C */  lui        $at, %hi(abortfile)
    /* 1AD64 8002AD64 B8C323AC */  sw         $v1, %lo(abortfile)($at)
    /* 1AD68 8002AD68 93020324 */  addiu      $v1, $zero, 0x293
    /* 1AD6C 8002AD6C 1280013C */  lui        $at, %hi(abortline)
    /* 1AD70 8002AD70 BCC323AC */  sw         $v1, %lo(abortline)($at)
    /* 1AD74 8002AD74 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1AD78 8002AD78 1400A5AF */  sw         $a1, 0x14($sp)
  .L8002AD7C:
    /* 1AD7C 8002AD7C 0F95000C */  jal        abortmessage
    /* 1AD80 8002AD80 00000000 */   nop
  .L8002AD84:
    /* 1AD84 8002AD84 21100000 */  addu       $v0, $zero, $zero
  .L8002AD88:
    /* 1AD88 8002AD88 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 1AD8C 8002AD8C 3800BE8F */  lw         $fp, 0x38($sp)
    /* 1AD90 8002AD90 3400B78F */  lw         $s7, 0x34($sp)
    /* 1AD94 8002AD94 3000B68F */  lw         $s6, 0x30($sp)
    /* 1AD98 8002AD98 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1AD9C 8002AD9C 2800B48F */  lw         $s4, 0x28($sp)
    /* 1ADA0 8002ADA0 2400B38F */  lw         $s3, 0x24($sp)
    /* 1ADA4 8002ADA4 2000B28F */  lw         $s2, 0x20($sp)
    /* 1ADA8 8002ADA8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1ADAC 8002ADAC 1800B08F */  lw         $s0, 0x18($sp)
    /* 1ADB0 8002ADB0 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1ADB4 8002ADB4 0800E003 */  jr         $ra
    /* 1ADB8 8002ADB8 00000000 */   nop
endlabel reservememblockai
