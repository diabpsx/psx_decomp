.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ProcessMissiles__Fv, 0x42C

glabel ProcessMissiles__Fv
    /* 10A9C 8014A694 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 10AA0 8014A698 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 10AA4 8014A69C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 10AA8 8014A6A0 1080123C */  lui        $s2, %hi(missileactive)
    /* 10AAC 8014A6A4 602A5226 */  addiu      $s2, $s2, %lo(missileactive)
    /* 10AB0 8014A6A8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 10AB4 8014A6AC 21880000 */  addu       $s1, $zero, $zero
    /* 10AB8 8014A6B0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 10ABC 8014A6B4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 10AC0 8014A6B8 2E004018 */  blez       $v0, .L8014A774
    /* 10AC4 8014A6BC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 10AC8 8014A6C0 1080073C */  lui        $a3, %hi(missile)
    /* 10ACC 8014A6C4 582CE724 */  addiu      $a3, $a3, %lo(missile)
    /* 10AD0 8014A6C8 BFFF0624 */  addiu      $a2, $zero, -0x41
  .L8014A6CC:
    /* 10AD4 8014A6CC 00004396 */  lhu        $v1, 0x0($s2)
    /* 10AD8 8014A6D0 01002426 */  addiu      $a0, $s1, 0x1
    /* 10ADC 8014A6D4 21888000 */  addu       $s1, $a0, $zero
    /* 10AE0 8014A6D8 001C0300 */  sll        $v1, $v1, 16
    /* 10AE4 8014A6DC 031C0300 */  sra        $v1, $v1, 16
    /* 10AE8 8014A6E0 80100300 */  sll        $v0, $v1, 2
    /* 10AEC 8014A6E4 21104300 */  addu       $v0, $v0, $v1
    /* 10AF0 8014A6E8 80100200 */  sll        $v0, $v0, 2
    /* 10AF4 8014A6EC 23104300 */  subu       $v0, $v0, $v1
    /* 10AF8 8014A6F0 80100200 */  sll        $v0, $v0, 2
    /* 10AFC 8014A6F4 21804700 */  addu       $s0, $v0, $a3
    /* 10B00 8014A6F8 32000582 */  lb         $a1, 0x32($s0)
    /* 10B04 8014A6FC 31000382 */  lb         $v1, 0x31($s0)
    /* 10B08 8014A700 C0280500 */  sll        $a1, $a1, 3
    /* 10B0C 8014A704 C0100300 */  sll        $v0, $v1, 3
    /* 10B10 8014A708 23104300 */  subu       $v0, $v0, $v1
    /* 10B14 8014A70C C0110200 */  sll        $v0, $v0, 7
    /* 10B18 8014A710 2128A200 */  addu       $a1, $a1, $v0
    /* 10B1C 8014A714 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 10B20 8014A718 21082500 */  addu       $at, $at, $a1
    /* 10B24 8014A71C 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 10B28 8014A720 00240400 */  sll        $a0, $a0, 16
    /* 10B2C 8014A724 24104600 */  and        $v0, $v0, $a2
    /* 10B30 8014A728 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 10B34 8014A72C 21082500 */  addu       $at, $at, $a1
    /* 10B38 8014A730 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 10B3C 8014A734 32000382 */  lb         $v1, 0x32($s0)
    /* 10B40 8014A738 31000582 */  lb         $a1, 0x31($s0)
    /* 10B44 8014A73C C0180300 */  sll        $v1, $v1, 3
    /* 10B48 8014A740 C0100500 */  sll        $v0, $a1, 3
    /* 10B4C 8014A744 23104500 */  subu       $v0, $v0, $a1
    /* 10B50 8014A748 C0110200 */  sll        $v0, $v0, 7
    /* 10B54 8014A74C 21186200 */  addu       $v1, $v1, $v0
    /* 10B58 8014A750 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 10B5C 8014A754 21082300 */  addu       $at, $at, $v1
    /* 10B60 8014A758 2D7A20A0 */  sb         $zero, %lo(dung_map + 0x5)($at)
    /* 10B64 8014A75C 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 10B68 8014A760 03240400 */  sra        $a0, $a0, 16
    /* 10B6C 8014A764 2A208200 */  slt        $a0, $a0, $v0
    /* 10B70 8014A768 D8FF8014 */  bnez       $a0, .L8014A6CC
    /* 10B74 8014A76C 02005226 */   addiu     $s2, $s2, 0x2
    /* 10B78 8014A770 21880000 */  addu       $s1, $zero, $zero
  .L8014A774:
    /* 10B7C 8014A774 1080053C */  lui        $a1, %hi(dMissArray)
    /* 10B80 8014A778 7451A524 */  addiu      $a1, $a1, %lo(dMissArray)
  .L8014A77C:
    /* 10B84 8014A77C 21180000 */  addu       $v1, $zero, $zero
    /* 10B88 8014A780 00141100 */  sll        $v0, $s1, 16
    /* 10B8C 8014A784 83130200 */  sra        $v0, $v0, 14
    /* 10B90 8014A788 21204500 */  addu       $a0, $v0, $a1
    /* 10B94 8014A78C 00140300 */  sll        $v0, $v1, 16
  .L8014A790:
    /* 10B98 8014A790 03140200 */  sra        $v0, $v0, 16
    /* 10B9C 8014A794 21108200 */  addu       $v0, $a0, $v0
    /* 10BA0 8014A798 000040A0 */  sb         $zero, 0x0($v0)
    /* 10BA4 8014A79C 01006224 */  addiu      $v0, $v1, 0x1
    /* 10BA8 8014A7A0 21184000 */  addu       $v1, $v0, $zero
    /* 10BAC 8014A7A4 00140200 */  sll        $v0, $v0, 16
    /* 10BB0 8014A7A8 03140200 */  sra        $v0, $v0, 16
    /* 10BB4 8014A7AC 04004228 */  slti       $v0, $v0, 0x4
    /* 10BB8 8014A7B0 F7FF4014 */  bnez       $v0, .L8014A790
    /* 10BBC 8014A7B4 00140300 */   sll       $v0, $v1, 16
    /* 10BC0 8014A7B8 01002226 */  addiu      $v0, $s1, 0x1
    /* 10BC4 8014A7BC 21884000 */  addu       $s1, $v0, $zero
    /* 10BC8 8014A7C0 00140200 */  sll        $v0, $v0, 16
    /* 10BCC 8014A7C4 03140200 */  sra        $v0, $v0, 16
    /* 10BD0 8014A7C8 20004228 */  slti       $v0, $v0, 0x20
    /* 10BD4 8014A7CC EBFF4014 */  bnez       $v0, .L8014A77C
    /* 10BD8 8014A7D0 00000000 */   nop
    /* 10BDC 8014A7D4 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 10BE0 8014A7D8 00000000 */  nop
    /* 10BE4 8014A7DC 1E004018 */  blez       $v0, .L8014A858
    /* 10BE8 8014A7E0 21880000 */   addu      $s1, $zero, $zero
    /* 10BEC 8014A7E4 1080103C */  lui        $s0, %hi(missileactive)
    /* 10BF0 8014A7E8 602A1026 */  addiu      $s0, $s0, %lo(missileactive)
    /* 10BF4 8014A7EC 00141100 */  sll        $v0, $s1, 16
  .L8014A7F0:
    /* 10BF8 8014A7F0 032C0200 */  sra        $a1, $v0, 16
    /* 10BFC 8014A7F4 40100500 */  sll        $v0, $a1, 1
    /* 10C00 8014A7F8 21105000 */  addu       $v0, $v0, $s0
    /* 10C04 8014A7FC 00004484 */  lh         $a0, 0x0($v0)
    /* 10C08 8014A800 00000000 */  nop
    /* 10C0C 8014A804 80100400 */  sll        $v0, $a0, 2
    /* 10C10 8014A808 21104400 */  addu       $v0, $v0, $a0
    /* 10C14 8014A80C 80100200 */  sll        $v0, $v0, 2
    /* 10C18 8014A810 23104400 */  subu       $v0, $v0, $a0
    /* 10C1C 8014A814 80100200 */  sll        $v0, $v0, 2
    /* 10C20 8014A818 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 10C24 8014A81C 21082200 */  addu       $at, $at, $v0
    /* 10C28 8014A820 902C2290 */  lbu        $v0, %lo(missile + 0x38)($at)
    /* 10C2C 8014A824 00000000 */  nop
    /* 10C30 8014A828 05004010 */  beqz       $v0, .L8014A840
    /* 10C34 8014A82C 01003126 */   addiu     $s1, $s1, 0x1
    /* 10C38 8014A830 3AEA040C */  jal        DeleteMissile__Fii
    /* 10C3C 8014A834 21880000 */   addu      $s1, $zero, $zero
    /* 10C40 8014A838 112A0508 */  j          .L8014A844
    /* 10C44 8014A83C 00141100 */   sll       $v0, $s1, 16
  .L8014A840:
    /* 10C48 8014A840 00141100 */  sll        $v0, $s1, 16
  .L8014A844:
    /* 10C4C 8014A844 081B838F */  lw         $v1, %gp_rel(nummissiles)($gp)
    /* 10C50 8014A848 03140200 */  sra        $v0, $v0, 16
    /* 10C54 8014A84C 2A104300 */  slt        $v0, $v0, $v1
    /* 10C58 8014A850 E7FF4014 */  bnez       $v0, .L8014A7F0
    /* 10C5C 8014A854 00141100 */   sll       $v0, $s1, 16
  .L8014A858:
    /* 10C60 8014A858 1080123C */  lui        $s2, %hi(missileactive)
    /* 10C64 8014A85C 602A5226 */  addiu      $s2, $s2, %lo(missileactive)
    /* 10C68 8014A860 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 10C6C 8014A864 0C1B80A3 */  sb         $zero, %gp_rel(MissilePreFlag)($gp)
    /* 10C70 8014A868 0D1B80A3 */  sb         $zero, %gp_rel(ManashieldFlag)($gp)
    /* 10C74 8014A86C 0E1B80A3 */  sb         $zero, %gp_rel(ManashieldFlag2)($gp)
    /* 10C78 8014A870 42004018 */  blez       $v0, .L8014A97C
    /* 10C7C 8014A874 21880000 */   addu      $s1, $zero, $zero
    /* 10C80 8014A878 0D80133C */  lui        $s3, %hi(missiledata)
    /* 10C84 8014A87C F0677326 */  addiu      $s3, $s3, %lo(missiledata)
  .L8014A880:
    /* 10C88 8014A880 00004396 */  lhu        $v1, 0x0($s2)
    /* 10C8C 8014A884 00000000 */  nop
    /* 10C90 8014A888 00240300 */  sll        $a0, $v1, 16
    /* 10C94 8014A88C 03240400 */  sra        $a0, $a0, 16
    /* 10C98 8014A890 80100400 */  sll        $v0, $a0, 2
    /* 10C9C 8014A894 21104400 */  addu       $v0, $v0, $a0
    /* 10CA0 8014A898 80100200 */  sll        $v0, $v0, 2
    /* 10CA4 8014A89C 23104400 */  subu       $v0, $v0, $a0
    /* 10CA8 8014A8A0 80100200 */  sll        $v0, $v0, 2
    /* 10CAC 8014A8A4 1080033C */  lui        $v1, %hi(missile)
    /* 10CB0 8014A8A8 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* 10CB4 8014A8AC 21804300 */  addu       $s0, $v0, $v1
    /* 10CB8 8014A8B0 30000382 */  lb         $v1, 0x30($s0)
    /* 10CBC 8014A8B4 00000000 */  nop
    /* 10CC0 8014A8B8 40100300 */  sll        $v0, $v1, 1
    /* 10CC4 8014A8BC 21104300 */  addu       $v0, $v0, $v1
    /* 10CC8 8014A8C0 C0100200 */  sll        $v0, $v0, 3
    /* 10CCC 8014A8C4 21105300 */  addu       $v0, $v0, $s3
    /* 10CD0 8014A8C8 0800428C */  lw         $v0, 0x8($v0)
    /* 10CD4 8014A8CC 00000000 */  nop
    /* 10CD8 8014A8D0 09F84000 */  jalr       $v0
    /* 10CDC 8014A8D4 02005226 */   addiu     $s2, $s2, 0x2
    /* 10CE0 8014A8D8 39000292 */  lbu        $v0, 0x39($s0)
    /* 10CE4 8014A8DC 00000000 */  nop
    /* 10CE8 8014A8E0 02004230 */  andi       $v0, $v0, 0x2
    /* 10CEC 8014A8E4 1E004014 */  bnez       $v0, .L8014A960
    /* 10CF0 8014A8E8 01002226 */   addiu     $v0, $s1, 0x1
    /* 10CF4 8014A8EC 45000292 */  lbu        $v0, 0x45($s0)
    /* 10CF8 8014A8F0 41000382 */  lb         $v1, 0x41($s0)
    /* 10CFC 8014A8F4 01004224 */  addiu      $v0, $v0, 0x1
    /* 10D00 8014A8F8 450002A2 */  sb         $v0, 0x45($s0)
    /* 10D04 8014A8FC 00160200 */  sll        $v0, $v0, 24
    /* 10D08 8014A900 03160200 */  sra        $v0, $v0, 24
    /* 10D0C 8014A904 2A104300 */  slt        $v0, $v0, $v1
    /* 10D10 8014A908 15004014 */  bnez       $v0, .L8014A960
    /* 10D14 8014A90C 01002226 */   addiu     $v0, $s1, 0x1
    /* 10D18 8014A910 47000292 */  lbu        $v0, 0x47($s0)
    /* 10D1C 8014A914 46000392 */  lbu        $v1, 0x46($s0)
    /* 10D20 8014A918 450000A2 */  sb         $zero, 0x45($s0)
    /* 10D24 8014A91C 21104300 */  addu       $v0, $v0, $v1
    /* 10D28 8014A920 470002A2 */  sb         $v0, 0x47($s0)
    /* 10D2C 8014A924 00160200 */  sll        $v0, $v0, 24
    /* 10D30 8014A928 42000382 */  lb         $v1, 0x42($s0)
    /* 10D34 8014A92C 03160200 */  sra        $v0, $v0, 24
    /* 10D38 8014A930 2A186200 */  slt        $v1, $v1, $v0
    /* 10D3C 8014A934 02006010 */  beqz       $v1, .L8014A940
    /* 10D40 8014A938 01000224 */   addiu     $v0, $zero, 0x1
    /* 10D44 8014A93C 470002A2 */  sb         $v0, 0x47($s0)
  .L8014A940:
    /* 10D48 8014A940 47000282 */  lb         $v0, 0x47($s0)
    /* 10D4C 8014A944 00000000 */  nop
    /* 10D50 8014A948 0500401C */  bgtz       $v0, .L8014A960
    /* 10D54 8014A94C 01002226 */   addiu     $v0, $s1, 0x1
    /* 10D58 8014A950 42000292 */  lbu        $v0, 0x42($s0)
    /* 10D5C 8014A954 00000000 */  nop
    /* 10D60 8014A958 470002A2 */  sb         $v0, 0x47($s0)
    /* 10D64 8014A95C 01002226 */  addiu      $v0, $s1, 0x1
  .L8014A960:
    /* 10D68 8014A960 21884000 */  addu       $s1, $v0, $zero
    /* 10D6C 8014A964 00140200 */  sll        $v0, $v0, 16
    /* 10D70 8014A968 081B838F */  lw         $v1, %gp_rel(nummissiles)($gp)
    /* 10D74 8014A96C 03140200 */  sra        $v0, $v0, 16
    /* 10D78 8014A970 2A104300 */  slt        $v0, $v0, $v1
    /* 10D7C 8014A974 C2FF4014 */  bnez       $v0, .L8014A880
    /* 10D80 8014A978 00000000 */   nop
  .L8014A97C:
    /* 10D84 8014A97C 0D1B8293 */  lbu        $v0, %gp_rel(ManashieldFlag)($gp)
    /* 10D88 8014A980 00000000 */  nop
    /* 10D8C 8014A984 05004014 */  bnez       $v0, .L8014A99C
    /* 10D90 8014A988 00000000 */   nop
    /* 10D94 8014A98C 0E1B8293 */  lbu        $v0, %gp_rel(ManashieldFlag2)($gp)
    /* 10D98 8014A990 00000000 */  nop
    /* 10D9C 8014A994 21004010 */  beqz       $v0, .L8014AA1C
    /* 10DA0 8014A998 00000000 */   nop
  .L8014A99C:
    /* 10DA4 8014A99C 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 10DA8 8014A9A0 00000000 */  nop
    /* 10DAC 8014A9A4 3E004018 */  blez       $v0, .L8014AAA0
    /* 10DB0 8014A9A8 21880000 */   addu      $s1, $zero, $zero
    /* 10DB4 8014A9AC 1080103C */  lui        $s0, %hi(missileactive)
    /* 10DB8 8014A9B0 602A1026 */  addiu      $s0, $s0, %lo(missileactive)
    /* 10DBC 8014A9B4 00141100 */  sll        $v0, $s1, 16
  .L8014A9B8:
    /* 10DC0 8014A9B8 C3130200 */  sra        $v0, $v0, 15
    /* 10DC4 8014A9BC 21105000 */  addu       $v0, $v0, $s0
    /* 10DC8 8014A9C0 00004484 */  lh         $a0, 0x0($v0)
    /* 10DCC 8014A9C4 00000000 */  nop
    /* 10DD0 8014A9C8 80100400 */  sll        $v0, $a0, 2
    /* 10DD4 8014A9CC 21104400 */  addu       $v0, $v0, $a0
    /* 10DD8 8014A9D0 80100200 */  sll        $v0, $v0, 2
    /* 10DDC 8014A9D4 23104400 */  subu       $v0, $v0, $a0
    /* 10DE0 8014A9D8 80100200 */  sll        $v0, $v0, 2
    /* 10DE4 8014A9DC 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 10DE8 8014A9E0 21082200 */  addu       $at, $at, $v0
    /* 10DEC 8014A9E4 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 10DF0 8014A9E8 0D000224 */  addiu      $v0, $zero, 0xD
    /* 10DF4 8014A9EC 04006214 */  bne        $v1, $v0, .L8014AA00
    /* 10DF8 8014A9F0 01002226 */   addiu     $v0, $s1, 0x1
    /* 10DFC 8014A9F4 A218050C */  jal        MI_Manashield__Fi
    /* 10E00 8014A9F8 00000000 */   nop
    /* 10E04 8014A9FC 01002226 */  addiu      $v0, $s1, 0x1
  .L8014AA00:
    /* 10E08 8014AA00 21884000 */  addu       $s1, $v0, $zero
    /* 10E0C 8014AA04 00140200 */  sll        $v0, $v0, 16
    /* 10E10 8014AA08 081B838F */  lw         $v1, %gp_rel(nummissiles)($gp)
    /* 10E14 8014AA0C 03140200 */  sra        $v0, $v0, 16
    /* 10E18 8014AA10 2A104300 */  slt        $v0, $v0, $v1
    /* 10E1C 8014AA14 E8FF4014 */  bnez       $v0, .L8014A9B8
    /* 10E20 8014AA18 00141100 */   sll       $v0, $s1, 16
  .L8014AA1C:
    /* 10E24 8014AA1C 081B828F */  lw         $v0, %gp_rel(nummissiles)($gp)
    /* 10E28 8014AA20 00000000 */  nop
    /* 10E2C 8014AA24 1E004018 */  blez       $v0, .L8014AAA0
    /* 10E30 8014AA28 21880000 */   addu      $s1, $zero, $zero
    /* 10E34 8014AA2C 1080103C */  lui        $s0, %hi(missileactive)
    /* 10E38 8014AA30 602A1026 */  addiu      $s0, $s0, %lo(missileactive)
    /* 10E3C 8014AA34 00141100 */  sll        $v0, $s1, 16
  .L8014AA38:
    /* 10E40 8014AA38 032C0200 */  sra        $a1, $v0, 16
    /* 10E44 8014AA3C 40100500 */  sll        $v0, $a1, 1
    /* 10E48 8014AA40 21105000 */  addu       $v0, $v0, $s0
    /* 10E4C 8014AA44 00004484 */  lh         $a0, 0x0($v0)
    /* 10E50 8014AA48 00000000 */  nop
    /* 10E54 8014AA4C 80100400 */  sll        $v0, $a0, 2
    /* 10E58 8014AA50 21104400 */  addu       $v0, $v0, $a0
    /* 10E5C 8014AA54 80100200 */  sll        $v0, $v0, 2
    /* 10E60 8014AA58 23104400 */  subu       $v0, $v0, $a0
    /* 10E64 8014AA5C 80100200 */  sll        $v0, $v0, 2
    /* 10E68 8014AA60 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 10E6C 8014AA64 21082200 */  addu       $at, $at, $v0
    /* 10E70 8014AA68 902C2290 */  lbu        $v0, %lo(missile + 0x38)($at)
    /* 10E74 8014AA6C 00000000 */  nop
    /* 10E78 8014AA70 05004010 */  beqz       $v0, .L8014AA88
    /* 10E7C 8014AA74 01003126 */   addiu     $s1, $s1, 0x1
    /* 10E80 8014AA78 3AEA040C */  jal        DeleteMissile__Fii
    /* 10E84 8014AA7C 21880000 */   addu      $s1, $zero, $zero
    /* 10E88 8014AA80 A32A0508 */  j          .L8014AA8C
    /* 10E8C 8014AA84 00141100 */   sll       $v0, $s1, 16
  .L8014AA88:
    /* 10E90 8014AA88 00141100 */  sll        $v0, $s1, 16
  .L8014AA8C:
    /* 10E94 8014AA8C 081B838F */  lw         $v1, %gp_rel(nummissiles)($gp)
    /* 10E98 8014AA90 03140200 */  sra        $v0, $v0, 16
    /* 10E9C 8014AA94 2A104300 */  slt        $v0, $v0, $v1
    /* 10EA0 8014AA98 E7FF4014 */  bnez       $v0, .L8014AA38
    /* 10EA4 8014AA9C 00141100 */   sll       $v0, $s1, 16
  .L8014AAA0:
    /* 10EA8 8014AAA0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 10EAC 8014AAA4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 10EB0 8014AAA8 1800B28F */  lw         $s2, 0x18($sp)
    /* 10EB4 8014AAAC 1400B18F */  lw         $s1, 0x14($sp)
    /* 10EB8 8014AAB0 1000B08F */  lw         $s0, 0x10($sp)
    /* 10EBC 8014AAB4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 10EC0 8014AAB8 0800E003 */  jr         $ra
    /* 10EC4 8014AABC 00000000 */   nop
endlabel ProcessMissiles__Fv
