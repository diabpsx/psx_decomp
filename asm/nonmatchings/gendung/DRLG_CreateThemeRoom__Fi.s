.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_CreateThemeRoom__Fi, 0x1004

glabel DRLG_CreateThemeRoom__Fi
    /* 20ABC 8015A6B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 20AC0 8015A6B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20AC4 8015A6BC 21808000 */  addu       $s0, $a0, $zero
    /* 20AC8 8015A6C0 80201000 */  sll        $a0, $s0, 2
    /* 20ACC 8015A6C4 21109000 */  addu       $v0, $a0, $s0
    /* 20AD0 8015A6C8 80100200 */  sll        $v0, $v0, 2
    /* 20AD4 8015A6CC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 20AD8 8015A6D0 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20ADC 8015A6D4 21082200 */  addu       $at, $at, $v0
    /* 20AE0 8015A6D8 6C9C278C */  lw         $a3, %lo(themeLoc + 0x4)($at)
    /* 20AE4 8015A6DC 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20AE8 8015A6E0 21082200 */  addu       $at, $at, $v0
    /* 20AEC 8015A6E4 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 20AF0 8015A6E8 00000000 */  nop
    /* 20AF4 8015A6EC 2110E200 */  addu       $v0, $a3, $v0
    /* 20AF8 8015A6F0 2A10E200 */  slt        $v0, $a3, $v0
    /* 20AFC 8015A6F4 65014010 */  beqz       $v0, .L8015AC8C
    /* 20B00 8015A6F8 21109000 */   addu      $v0, $a0, $s0
    /* 20B04 8015A6FC 8D198A93 */  lbu        $t2, %gp_rel(leveltype)($gp)
    /* 20B08 8015A700 02000B24 */  addiu      $t3, $zero, 0x2
  .L8015A704:
    /* 20B0C 8015A704 80180200 */  sll        $v1, $v0, 2
    /* 20B10 8015A708 1480013C */  lui        $at, %hi(themeLoc)
    /* 20B14 8015A70C 21082300 */  addu       $at, $at, $v1
    /* 20B18 8015A710 689C268C */  lw         $a2, %lo(themeLoc)($at)
    /* 20B1C 8015A714 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20B20 8015A718 21082300 */  addu       $at, $at, $v1
    /* 20B24 8015A71C 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 20B28 8015A720 00000000 */  nop
    /* 20B2C 8015A724 2110C200 */  addu       $v0, $a2, $v0
    /* 20B30 8015A728 2A10C200 */  slt        $v0, $a2, $v0
    /* 20B34 8015A72C 49014010 */  beqz       $v0, .L8015AC54
    /* 20B38 8015A730 40100600 */   sll       $v0, $a2, 1
    /* 20B3C 8015A734 21286000 */  addu       $a1, $v1, $zero
    /* 20B40 8015A738 40480700 */  sll        $t1, $a3, 1
    /* 20B44 8015A73C 0E80033C */  lui        $v1, %hi(dungeon)
    /* 20B48 8015A740 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 20B4C 8015A744 21104600 */  addu       $v0, $v0, $a2
    /* 20B50 8015A748 40110200 */  sll        $v0, $v0, 5
    /* 20B54 8015A74C 21404300 */  addu       $t0, $v0, $v1
  .L8015A750:
    /* 20B58 8015A750 67004B15 */  bne        $t2, $t3, .L8015A8F0
    /* 20B5C 8015A754 03000224 */   addiu     $v0, $zero, 0x3
    /* 20B60 8015A758 21109000 */  addu       $v0, $a0, $s0
    /* 20B64 8015A75C 80200200 */  sll        $a0, $v0, 2
    /* 20B68 8015A760 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20B6C 8015A764 21082400 */  addu       $at, $at, $a0
    /* 20B70 8015A768 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 20B74 8015A76C 00000000 */  nop
    /* 20B78 8015A770 1000E214 */  bne        $a3, $v0, .L8015A7B4
    /* 20B7C 8015A774 00000000 */   nop
    /* 20B80 8015A778 1480013C */  lui        $at, %hi(themeLoc)
    /* 20B84 8015A77C 21082400 */  addu       $at, $at, $a0
    /* 20B88 8015A780 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 20B8C 8015A784 00000000 */  nop
    /* 20B90 8015A788 2A10C300 */  slt        $v0, $a2, $v1
    /* 20B94 8015A78C 09004014 */  bnez       $v0, .L8015A7B4
    /* 20B98 8015A790 00000000 */   nop
    /* 20B9C 8015A794 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20BA0 8015A798 21082400 */  addu       $at, $at, $a0
    /* 20BA4 8015A79C 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 20BA8 8015A7A0 00000000 */  nop
    /* 20BAC 8015A7A4 21106200 */  addu       $v0, $v1, $v0
    /* 20BB0 8015A7A8 2A104600 */  slt        $v0, $v0, $a2
    /* 20BB4 8015A7AC 1A004010 */  beqz       $v0, .L8015A818
    /* 20BB8 8015A7B0 21102801 */   addu      $v0, $t1, $t0
  .L8015A7B4:
    /* 20BBC 8015A7B4 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20BC0 8015A7B8 21082500 */  addu       $at, $at, $a1
    /* 20BC4 8015A7BC 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 20BC8 8015A7C0 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20BCC 8015A7C4 21082500 */  addu       $at, $at, $a1
    /* 20BD0 8015A7C8 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 20BD4 8015A7CC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 20BD8 8015A7D0 21104300 */  addu       $v0, $v0, $v1
    /* 20BDC 8015A7D4 1200E214 */  bne        $a3, $v0, .L8015A820
    /* 20BE0 8015A7D8 00000000 */   nop
    /* 20BE4 8015A7DC 1480013C */  lui        $at, %hi(themeLoc)
    /* 20BE8 8015A7E0 21082500 */  addu       $at, $at, $a1
    /* 20BEC 8015A7E4 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 20BF0 8015A7E8 00000000 */  nop
    /* 20BF4 8015A7EC 2A10C300 */  slt        $v0, $a2, $v1
    /* 20BF8 8015A7F0 0B004014 */  bnez       $v0, .L8015A820
    /* 20BFC 8015A7F4 00000000 */   nop
    /* 20C00 8015A7F8 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20C04 8015A7FC 21082500 */  addu       $at, $at, $a1
    /* 20C08 8015A800 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 20C0C 8015A804 00000000 */  nop
    /* 20C10 8015A808 21106200 */  addu       $v0, $v1, $v0
    /* 20C14 8015A80C 2A104600 */  slt        $v0, $v0, $a2
    /* 20C18 8015A810 03004014 */  bnez       $v0, .L8015A820
    /* 20C1C 8015A814 21102801 */   addu      $v0, $t1, $t0
  .L8015A818:
    /* 20C20 8015A818 3B6A0508 */  j          .L8015A8EC
    /* 20C24 8015A81C 00004BA4 */   sh        $t3, 0x0($v0)
  .L8015A820:
    /* 20C28 8015A820 1480013C */  lui        $at, %hi(themeLoc)
    /* 20C2C 8015A824 21082500 */  addu       $at, $at, $a1
    /* 20C30 8015A828 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 20C34 8015A82C 00000000 */  nop
    /* 20C38 8015A830 1300C214 */  bne        $a2, $v0, .L8015A880
    /* 20C3C 8015A834 00000000 */   nop
    /* 20C40 8015A838 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20C44 8015A83C 21082500 */  addu       $at, $at, $a1
    /* 20C48 8015A840 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 20C4C 8015A844 00000000 */  nop
    /* 20C50 8015A848 2A10E300 */  slt        $v0, $a3, $v1
    /* 20C54 8015A84C 09004014 */  bnez       $v0, .L8015A874
    /* 20C58 8015A850 00000000 */   nop
    /* 20C5C 8015A854 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20C60 8015A858 21082500 */  addu       $at, $at, $a1
    /* 20C64 8015A85C 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 20C68 8015A860 00000000 */  nop
    /* 20C6C 8015A864 21106200 */  addu       $v0, $v1, $v0
    /* 20C70 8015A868 2A104700 */  slt        $v0, $v0, $a3
    /* 20C74 8015A86C 1A004010 */  beqz       $v0, .L8015A8D8
    /* 20C78 8015A870 21182801 */   addu      $v1, $t1, $t0
  .L8015A874:
    /* 20C7C 8015A874 1480013C */  lui        $at, %hi(themeLoc)
    /* 20C80 8015A878 21082500 */  addu       $at, $at, $a1
    /* 20C84 8015A87C 689C228C */  lw         $v0, %lo(themeLoc)($at)
  .L8015A880:
    /* 20C88 8015A880 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20C8C 8015A884 21082500 */  addu       $at, $at, $a1
    /* 20C90 8015A888 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 20C94 8015A88C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 20C98 8015A890 21104300 */  addu       $v0, $v0, $v1
    /* 20C9C 8015A894 1300C214 */  bne        $a2, $v0, .L8015A8E4
    /* 20CA0 8015A898 21182801 */   addu      $v1, $t1, $t0
    /* 20CA4 8015A89C 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20CA8 8015A8A0 21082500 */  addu       $at, $at, $a1
    /* 20CAC 8015A8A4 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 20CB0 8015A8A8 00000000 */  nop
    /* 20CB4 8015A8AC 2A10E300 */  slt        $v0, $a3, $v1
    /* 20CB8 8015A8B0 0B004014 */  bnez       $v0, .L8015A8E0
    /* 20CBC 8015A8B4 00000000 */   nop
    /* 20CC0 8015A8B8 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20CC4 8015A8BC 21082500 */  addu       $at, $at, $a1
    /* 20CC8 8015A8C0 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 20CCC 8015A8C4 00000000 */  nop
    /* 20CD0 8015A8C8 21106200 */  addu       $v0, $v1, $v0
    /* 20CD4 8015A8CC 2A104700 */  slt        $v0, $v0, $a3
    /* 20CD8 8015A8D0 04004014 */  bnez       $v0, .L8015A8E4
    /* 20CDC 8015A8D4 21182801 */   addu      $v1, $t1, $t0
  .L8015A8D8:
    /* 20CE0 8015A8D8 3A6A0508 */  j          .L8015A8E8
    /* 20CE4 8015A8DC 01000224 */   addiu     $v0, $zero, 0x1
  .L8015A8E0:
    /* 20CE8 8015A8E0 21182801 */  addu       $v1, $t1, $t0
  .L8015A8E4:
    /* 20CEC 8015A8E4 03000224 */  addiu      $v0, $zero, 0x3
  .L8015A8E8:
    /* 20CF0 8015A8E8 000062A4 */  sh         $v0, 0x0($v1)
  .L8015A8EC:
    /* 20CF4 8015A8EC 03000224 */  addiu      $v0, $zero, 0x3
  .L8015A8F0:
    /* 20CF8 8015A8F0 65004215 */  bne        $t2, $v0, .L8015AA88
    /* 20CFC 8015A8F4 04000224 */   addiu     $v0, $zero, 0x4
    /* 20D00 8015A8F8 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20D04 8015A8FC 21082500 */  addu       $at, $at, $a1
    /* 20D08 8015A900 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 20D0C 8015A904 00000000 */  nop
    /* 20D10 8015A908 1300E214 */  bne        $a3, $v0, .L8015A958
    /* 20D14 8015A90C 00000000 */   nop
    /* 20D18 8015A910 1480013C */  lui        $at, %hi(themeLoc)
    /* 20D1C 8015A914 21082500 */  addu       $at, $at, $a1
    /* 20D20 8015A918 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 20D24 8015A91C 00000000 */  nop
    /* 20D28 8015A920 2A10C300 */  slt        $v0, $a2, $v1
    /* 20D2C 8015A924 09004014 */  bnez       $v0, .L8015A94C
    /* 20D30 8015A928 00000000 */   nop
    /* 20D34 8015A92C 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20D38 8015A930 21082500 */  addu       $at, $at, $a1
    /* 20D3C 8015A934 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 20D40 8015A938 00000000 */  nop
    /* 20D44 8015A93C 21106200 */  addu       $v0, $v1, $v0
    /* 20D48 8015A940 2A104600 */  slt        $v0, $v0, $a2
    /* 20D4C 8015A944 1A004010 */  beqz       $v0, .L8015A9B0
    /* 20D50 8015A948 21182801 */   addu      $v1, $t1, $t0
  .L8015A94C:
    /* 20D54 8015A94C 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20D58 8015A950 21082500 */  addu       $at, $at, $a1
    /* 20D5C 8015A954 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
  .L8015A958:
    /* 20D60 8015A958 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20D64 8015A95C 21082500 */  addu       $at, $at, $a1
    /* 20D68 8015A960 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 20D6C 8015A964 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 20D70 8015A968 21104300 */  addu       $v0, $v0, $v1
    /* 20D74 8015A96C 1200E214 */  bne        $a3, $v0, .L8015A9B8
    /* 20D78 8015A970 00000000 */   nop
    /* 20D7C 8015A974 1480013C */  lui        $at, %hi(themeLoc)
    /* 20D80 8015A978 21082500 */  addu       $at, $at, $a1
    /* 20D84 8015A97C 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 20D88 8015A980 00000000 */  nop
    /* 20D8C 8015A984 2A10C300 */  slt        $v0, $a2, $v1
    /* 20D90 8015A988 0B004014 */  bnez       $v0, .L8015A9B8
    /* 20D94 8015A98C 00000000 */   nop
    /* 20D98 8015A990 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20D9C 8015A994 21082500 */  addu       $at, $at, $a1
    /* 20DA0 8015A998 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 20DA4 8015A99C 00000000 */  nop
    /* 20DA8 8015A9A0 21106200 */  addu       $v0, $v1, $v0
    /* 20DAC 8015A9A4 2A104600 */  slt        $v0, $v0, $a2
    /* 20DB0 8015A9A8 03004014 */  bnez       $v0, .L8015A9B8
    /* 20DB4 8015A9AC 21182801 */   addu      $v1, $t1, $t0
  .L8015A9B0:
    /* 20DB8 8015A9B0 A06A0508 */  j          .L8015AA80
    /* 20DBC 8015A9B4 86000224 */   addiu     $v0, $zero, 0x86
  .L8015A9B8:
    /* 20DC0 8015A9B8 1480013C */  lui        $at, %hi(themeLoc)
    /* 20DC4 8015A9BC 21082500 */  addu       $at, $at, $a1
    /* 20DC8 8015A9C0 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 20DCC 8015A9C4 00000000 */  nop
    /* 20DD0 8015A9C8 1300C214 */  bne        $a2, $v0, .L8015AA18
    /* 20DD4 8015A9CC 00000000 */   nop
    /* 20DD8 8015A9D0 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20DDC 8015A9D4 21082500 */  addu       $at, $at, $a1
    /* 20DE0 8015A9D8 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 20DE4 8015A9DC 00000000 */  nop
    /* 20DE8 8015A9E0 2A10E300 */  slt        $v0, $a3, $v1
    /* 20DEC 8015A9E4 09004014 */  bnez       $v0, .L8015AA0C
    /* 20DF0 8015A9E8 00000000 */   nop
    /* 20DF4 8015A9EC 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20DF8 8015A9F0 21082500 */  addu       $at, $at, $a1
    /* 20DFC 8015A9F4 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 20E00 8015A9F8 00000000 */  nop
    /* 20E04 8015A9FC 21106200 */  addu       $v0, $v1, $v0
    /* 20E08 8015AA00 2A104700 */  slt        $v0, $v0, $a3
    /* 20E0C 8015AA04 1A004010 */  beqz       $v0, .L8015AA70
    /* 20E10 8015AA08 21182801 */   addu      $v1, $t1, $t0
  .L8015AA0C:
    /* 20E14 8015AA0C 1480013C */  lui        $at, %hi(themeLoc)
    /* 20E18 8015AA10 21082500 */  addu       $at, $at, $a1
    /* 20E1C 8015AA14 689C228C */  lw         $v0, %lo(themeLoc)($at)
  .L8015AA18:
    /* 20E20 8015AA18 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20E24 8015AA1C 21082500 */  addu       $at, $at, $a1
    /* 20E28 8015AA20 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 20E2C 8015AA24 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 20E30 8015AA28 21104300 */  addu       $v0, $v0, $v1
    /* 20E34 8015AA2C 1300C214 */  bne        $a2, $v0, .L8015AA7C
    /* 20E38 8015AA30 21182801 */   addu      $v1, $t1, $t0
    /* 20E3C 8015AA34 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20E40 8015AA38 21082500 */  addu       $at, $at, $a1
    /* 20E44 8015AA3C 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 20E48 8015AA40 00000000 */  nop
    /* 20E4C 8015AA44 2A10E300 */  slt        $v0, $a3, $v1
    /* 20E50 8015AA48 0B004014 */  bnez       $v0, .L8015AA78
    /* 20E54 8015AA4C 00000000 */   nop
    /* 20E58 8015AA50 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20E5C 8015AA54 21082500 */  addu       $at, $at, $a1
    /* 20E60 8015AA58 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 20E64 8015AA5C 00000000 */  nop
    /* 20E68 8015AA60 21106200 */  addu       $v0, $v1, $v0
    /* 20E6C 8015AA64 2A104700 */  slt        $v0, $v0, $a3
    /* 20E70 8015AA68 04004014 */  bnez       $v0, .L8015AA7C
    /* 20E74 8015AA6C 21182801 */   addu      $v1, $t1, $t0
  .L8015AA70:
    /* 20E78 8015AA70 A06A0508 */  j          .L8015AA80
    /* 20E7C 8015AA74 89000224 */   addiu     $v0, $zero, 0x89
  .L8015AA78:
    /* 20E80 8015AA78 21182801 */  addu       $v1, $t1, $t0
  .L8015AA7C:
    /* 20E84 8015AA7C 07000224 */  addiu      $v0, $zero, 0x7
  .L8015AA80:
    /* 20E88 8015AA80 000062A4 */  sh         $v0, 0x0($v1)
    /* 20E8C 8015AA84 04000224 */  addiu      $v0, $zero, 0x4
  .L8015AA88:
    /* 20E90 8015AA88 65004215 */  bne        $t2, $v0, .L8015AC20
    /* 20E94 8015AA8C 80201000 */   sll       $a0, $s0, 2
    /* 20E98 8015AA90 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20E9C 8015AA94 21082500 */  addu       $at, $at, $a1
    /* 20EA0 8015AA98 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 20EA4 8015AA9C 00000000 */  nop
    /* 20EA8 8015AAA0 1300E214 */  bne        $a3, $v0, .L8015AAF0
    /* 20EAC 8015AAA4 00000000 */   nop
    /* 20EB0 8015AAA8 1480013C */  lui        $at, %hi(themeLoc)
    /* 20EB4 8015AAAC 21082500 */  addu       $at, $at, $a1
    /* 20EB8 8015AAB0 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 20EBC 8015AAB4 00000000 */  nop
    /* 20EC0 8015AAB8 2A10C300 */  slt        $v0, $a2, $v1
    /* 20EC4 8015AABC 09004014 */  bnez       $v0, .L8015AAE4
    /* 20EC8 8015AAC0 00000000 */   nop
    /* 20ECC 8015AAC4 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20ED0 8015AAC8 21082500 */  addu       $at, $at, $a1
    /* 20ED4 8015AACC 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 20ED8 8015AAD0 00000000 */  nop
    /* 20EDC 8015AAD4 21106200 */  addu       $v0, $v1, $v0
    /* 20EE0 8015AAD8 2A104600 */  slt        $v0, $v0, $a2
    /* 20EE4 8015AADC 1A004010 */  beqz       $v0, .L8015AB48
    /* 20EE8 8015AAE0 21102801 */   addu      $v0, $t1, $t0
  .L8015AAE4:
    /* 20EEC 8015AAE4 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20EF0 8015AAE8 21082500 */  addu       $at, $at, $a1
    /* 20EF4 8015AAEC 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
  .L8015AAF0:
    /* 20EF8 8015AAF0 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20EFC 8015AAF4 21082500 */  addu       $at, $at, $a1
    /* 20F00 8015AAF8 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 20F04 8015AAFC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 20F08 8015AB00 21104300 */  addu       $v0, $v0, $v1
    /* 20F0C 8015AB04 1200E214 */  bne        $a3, $v0, .L8015AB50
    /* 20F10 8015AB08 00000000 */   nop
    /* 20F14 8015AB0C 1480013C */  lui        $at, %hi(themeLoc)
    /* 20F18 8015AB10 21082500 */  addu       $at, $at, $a1
    /* 20F1C 8015AB14 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 20F20 8015AB18 00000000 */  nop
    /* 20F24 8015AB1C 2A10C300 */  slt        $v0, $a2, $v1
    /* 20F28 8015AB20 0B004014 */  bnez       $v0, .L8015AB50
    /* 20F2C 8015AB24 00000000 */   nop
    /* 20F30 8015AB28 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20F34 8015AB2C 21082500 */  addu       $at, $at, $a1
    /* 20F38 8015AB30 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 20F3C 8015AB34 00000000 */  nop
    /* 20F40 8015AB38 21106200 */  addu       $v0, $v1, $v0
    /* 20F44 8015AB3C 2A104600 */  slt        $v0, $v0, $a2
    /* 20F48 8015AB40 03004014 */  bnez       $v0, .L8015AB50
    /* 20F4C 8015AB44 21102801 */   addu      $v0, $t1, $t0
  .L8015AB48:
    /* 20F50 8015AB48 076B0508 */  j          .L8015AC1C
    /* 20F54 8015AB4C 00004BA4 */   sh        $t3, 0x0($v0)
  .L8015AB50:
    /* 20F58 8015AB50 1480013C */  lui        $at, %hi(themeLoc)
    /* 20F5C 8015AB54 21082500 */  addu       $at, $at, $a1
    /* 20F60 8015AB58 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 20F64 8015AB5C 00000000 */  nop
    /* 20F68 8015AB60 1300C214 */  bne        $a2, $v0, .L8015ABB0
    /* 20F6C 8015AB64 00000000 */   nop
    /* 20F70 8015AB68 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20F74 8015AB6C 21082500 */  addu       $at, $at, $a1
    /* 20F78 8015AB70 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 20F7C 8015AB74 00000000 */  nop
    /* 20F80 8015AB78 2A10E300 */  slt        $v0, $a3, $v1
    /* 20F84 8015AB7C 09004014 */  bnez       $v0, .L8015ABA4
    /* 20F88 8015AB80 00000000 */   nop
    /* 20F8C 8015AB84 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20F90 8015AB88 21082500 */  addu       $at, $at, $a1
    /* 20F94 8015AB8C 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 20F98 8015AB90 00000000 */  nop
    /* 20F9C 8015AB94 21106200 */  addu       $v0, $v1, $v0
    /* 20FA0 8015AB98 2A104700 */  slt        $v0, $v0, $a3
    /* 20FA4 8015AB9C 1A004010 */  beqz       $v0, .L8015AC08
    /* 20FA8 8015ABA0 21182801 */   addu      $v1, $t1, $t0
  .L8015ABA4:
    /* 20FAC 8015ABA4 1480013C */  lui        $at, %hi(themeLoc)
    /* 20FB0 8015ABA8 21082500 */  addu       $at, $at, $a1
    /* 20FB4 8015ABAC 689C228C */  lw         $v0, %lo(themeLoc)($at)
  .L8015ABB0:
    /* 20FB8 8015ABB0 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 20FBC 8015ABB4 21082500 */  addu       $at, $at, $a1
    /* 20FC0 8015ABB8 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 20FC4 8015ABBC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 20FC8 8015ABC0 21104300 */  addu       $v0, $v0, $v1
    /* 20FCC 8015ABC4 1300C214 */  bne        $a2, $v0, .L8015AC14
    /* 20FD0 8015ABC8 21182801 */   addu      $v1, $t1, $t0
    /* 20FD4 8015ABCC 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 20FD8 8015ABD0 21082500 */  addu       $at, $at, $a1
    /* 20FDC 8015ABD4 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 20FE0 8015ABD8 00000000 */  nop
    /* 20FE4 8015ABDC 2A10E300 */  slt        $v0, $a3, $v1
    /* 20FE8 8015ABE0 0B004014 */  bnez       $v0, .L8015AC10
    /* 20FEC 8015ABE4 00000000 */   nop
    /* 20FF0 8015ABE8 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 20FF4 8015ABEC 21082500 */  addu       $at, $at, $a1
    /* 20FF8 8015ABF0 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 20FFC 8015ABF4 00000000 */  nop
    /* 21000 8015ABF8 21106200 */  addu       $v0, $v1, $v0
    /* 21004 8015ABFC 2A104700 */  slt        $v0, $v0, $a3
    /* 21008 8015AC00 04004014 */  bnez       $v0, .L8015AC14
    /* 2100C 8015AC04 21182801 */   addu      $v1, $t1, $t0
  .L8015AC08:
    /* 21010 8015AC08 066B0508 */  j          .L8015AC18
    /* 21014 8015AC0C 01000224 */   addiu     $v0, $zero, 0x1
  .L8015AC10:
    /* 21018 8015AC10 21182801 */  addu       $v1, $t1, $t0
  .L8015AC14:
    /* 2101C 8015AC14 06000224 */  addiu      $v0, $zero, 0x6
  .L8015AC18:
    /* 21020 8015AC18 000062A4 */  sh         $v0, 0x0($v1)
  .L8015AC1C:
    /* 21024 8015AC1C 80201000 */  sll        $a0, $s0, 2
  .L8015AC20:
    /* 21028 8015AC20 21109000 */  addu       $v0, $a0, $s0
    /* 2102C 8015AC24 80100200 */  sll        $v0, $v0, 2
    /* 21030 8015AC28 1480013C */  lui        $at, %hi(themeLoc)
    /* 21034 8015AC2C 21082200 */  addu       $at, $at, $v0
    /* 21038 8015AC30 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 2103C 8015AC34 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21040 8015AC38 21082200 */  addu       $at, $at, $v0
    /* 21044 8015AC3C 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21048 8015AC40 0100C624 */  addiu      $a2, $a2, 0x1
    /* 2104C 8015AC44 21186200 */  addu       $v1, $v1, $v0
    /* 21050 8015AC48 2A18C300 */  slt        $v1, $a2, $v1
    /* 21054 8015AC4C C0FE6014 */  bnez       $v1, .L8015A750
    /* 21058 8015AC50 60000825 */   addiu     $t0, $t0, 0x60
  .L8015AC54:
    /* 2105C 8015AC54 80201000 */  sll        $a0, $s0, 2
    /* 21060 8015AC58 21109000 */  addu       $v0, $a0, $s0
    /* 21064 8015AC5C 80100200 */  sll        $v0, $v0, 2
    /* 21068 8015AC60 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 2106C 8015AC64 21082200 */  addu       $at, $at, $v0
    /* 21070 8015AC68 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 21074 8015AC6C 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21078 8015AC70 21082200 */  addu       $at, $at, $v0
    /* 2107C 8015AC74 789C228C */  lw         $v0, %lo(themeLoc + 0x10)($at)
    /* 21080 8015AC78 0100E724 */  addiu      $a3, $a3, 0x1
    /* 21084 8015AC7C 21186200 */  addu       $v1, $v1, $v0
    /* 21088 8015AC80 2A18E300 */  slt        $v1, $a3, $v1
    /* 2108C 8015AC84 9FFE6014 */  bnez       $v1, .L8015A704
    /* 21090 8015AC88 21109000 */   addu      $v0, $a0, $s0
  .L8015AC8C:
    /* 21094 8015AC8C 8D198293 */  lbu        $v0, %gp_rel(leveltype)($gp)
    /* 21098 8015AC90 02000824 */  addiu      $t0, $zero, 0x2
    /* 2109C 8015AC94 4F004814 */  bne        $v0, $t0, .L8015ADD4
    /* 210A0 8015AC98 80201000 */   sll       $a0, $s0, 2
    /* 210A4 8015AC9C 21209000 */  addu       $a0, $a0, $s0
    /* 210A8 8015ACA0 80200400 */  sll        $a0, $a0, 2
    /* 210AC 8015ACA4 1480013C */  lui        $at, %hi(themeLoc)
    /* 210B0 8015ACA8 21082400 */  addu       $at, $at, $a0
    /* 210B4 8015ACAC 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 210B8 8015ACB0 0E80063C */  lui        $a2, %hi(dungeon)
    /* 210BC 8015ACB4 C440C624 */  addiu      $a2, $a2, %lo(dungeon)
    /* 210C0 8015ACB8 40100300 */  sll        $v0, $v1, 1
    /* 210C4 8015ACBC 21104300 */  addu       $v0, $v0, $v1
    /* 210C8 8015ACC0 40110200 */  sll        $v0, $v0, 5
    /* 210CC 8015ACC4 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 210D0 8015ACC8 21082400 */  addu       $at, $at, $a0
    /* 210D4 8015ACCC 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 210D8 8015ACD0 21104600 */  addu       $v0, $v0, $a2
    /* 210DC 8015ACD4 40180300 */  sll        $v1, $v1, 1
    /* 210E0 8015ACD8 21186200 */  addu       $v1, $v1, $v0
    /* 210E4 8015ACDC 08000224 */  addiu      $v0, $zero, 0x8
    /* 210E8 8015ACE0 000062A4 */  sh         $v0, 0x0($v1)
    /* 210EC 8015ACE4 1480013C */  lui        $at, %hi(themeLoc)
    /* 210F0 8015ACE8 21082400 */  addu       $at, $at, $a0
    /* 210F4 8015ACEC 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 210F8 8015ACF0 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 210FC 8015ACF4 21082400 */  addu       $at, $at, $a0
    /* 21100 8015ACF8 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21104 8015ACFC A0FFC724 */  addiu      $a3, $a2, -0x60
    /* 21108 8015AD00 21186200 */  addu       $v1, $v1, $v0
    /* 2110C 8015AD04 40100300 */  sll        $v0, $v1, 1
    /* 21110 8015AD08 21104300 */  addu       $v0, $v0, $v1
    /* 21114 8015AD0C 40110200 */  sll        $v0, $v0, 5
    /* 21118 8015AD10 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 2111C 8015AD14 21082400 */  addu       $at, $at, $a0
    /* 21120 8015AD18 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 21124 8015AD1C 21104700 */  addu       $v0, $v0, $a3
    /* 21128 8015AD20 40180300 */  sll        $v1, $v1, 1
    /* 2112C 8015AD24 21186200 */  addu       $v1, $v1, $v0
    /* 21130 8015AD28 07000224 */  addiu      $v0, $zero, 0x7
    /* 21134 8015AD2C 000062A4 */  sh         $v0, 0x0($v1)
    /* 21138 8015AD30 1480013C */  lui        $at, %hi(themeLoc)
    /* 2113C 8015AD34 21082400 */  addu       $at, $at, $a0
    /* 21140 8015AD38 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 21144 8015AD3C 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21148 8015AD40 21082400 */  addu       $at, $at, $a0
    /* 2114C 8015AD44 789C258C */  lw         $a1, %lo(themeLoc + 0x10)($at)
    /* 21150 8015AD48 40180200 */  sll        $v1, $v0, 1
    /* 21154 8015AD4C 21186200 */  addu       $v1, $v1, $v0
    /* 21158 8015AD50 40190300 */  sll        $v1, $v1, 5
    /* 2115C 8015AD54 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21160 8015AD58 21082400 */  addu       $at, $at, $a0
    /* 21164 8015AD5C 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21168 8015AD60 21186600 */  addu       $v1, $v1, $a2
    /* 2116C 8015AD64 21104500 */  addu       $v0, $v0, $a1
    /* 21170 8015AD68 40100200 */  sll        $v0, $v0, 1
    /* 21174 8015AD6C 21104300 */  addu       $v0, $v0, $v1
    /* 21178 8015AD70 09000324 */  addiu      $v1, $zero, 0x9
    /* 2117C 8015AD74 FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 21180 8015AD78 1480013C */  lui        $at, %hi(themeLoc)
    /* 21184 8015AD7C 21082400 */  addu       $at, $at, $a0
    /* 21188 8015AD80 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 2118C 8015AD84 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21190 8015AD88 21082400 */  addu       $at, $at, $a0
    /* 21194 8015AD8C 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 21198 8015AD90 00000000 */  nop
    /* 2119C 8015AD94 21104300 */  addu       $v0, $v0, $v1
    /* 211A0 8015AD98 40180200 */  sll        $v1, $v0, 1
    /* 211A4 8015AD9C 21186200 */  addu       $v1, $v1, $v0
    /* 211A8 8015ADA0 40190300 */  sll        $v1, $v1, 5
    /* 211AC 8015ADA4 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 211B0 8015ADA8 21082400 */  addu       $at, $at, $a0
    /* 211B4 8015ADAC 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 211B8 8015ADB0 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 211BC 8015ADB4 21082400 */  addu       $at, $at, $a0
    /* 211C0 8015ADB8 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 211C4 8015ADBC 21186700 */  addu       $v1, $v1, $a3
    /* 211C8 8015ADC0 21104400 */  addu       $v0, $v0, $a0
    /* 211CC 8015ADC4 40100200 */  sll        $v0, $v0, 1
    /* 211D0 8015ADC8 21104300 */  addu       $v0, $v0, $v1
    /* 211D4 8015ADCC 06000324 */  addiu      $v1, $zero, 0x6
    /* 211D8 8015ADD0 FEFF43A4 */  sh         $v1, -0x2($v0)
  .L8015ADD4:
    /* 211DC 8015ADD4 8D198393 */  lbu        $v1, %gp_rel(leveltype)($gp)
    /* 211E0 8015ADD8 03000224 */  addiu      $v0, $zero, 0x3
    /* 211E4 8015ADDC 52006214 */  bne        $v1, $v0, .L8015AF28
    /* 211E8 8015ADE0 04000224 */   addiu     $v0, $zero, 0x4
    /* 211EC 8015ADE4 80201000 */  sll        $a0, $s0, 2
    /* 211F0 8015ADE8 21209000 */  addu       $a0, $a0, $s0
    /* 211F4 8015ADEC 80200400 */  sll        $a0, $a0, 2
    /* 211F8 8015ADF0 1480013C */  lui        $at, %hi(themeLoc)
    /* 211FC 8015ADF4 21082400 */  addu       $at, $at, $a0
    /* 21200 8015ADF8 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 21204 8015ADFC 0E80063C */  lui        $a2, %hi(dungeon)
    /* 21208 8015AE00 C440C624 */  addiu      $a2, $a2, %lo(dungeon)
    /* 2120C 8015AE04 40100300 */  sll        $v0, $v1, 1
    /* 21210 8015AE08 21104300 */  addu       $v0, $v0, $v1
    /* 21214 8015AE0C 40110200 */  sll        $v0, $v0, 5
    /* 21218 8015AE10 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 2121C 8015AE14 21082400 */  addu       $at, $at, $a0
    /* 21220 8015AE18 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 21224 8015AE1C 21104600 */  addu       $v0, $v0, $a2
    /* 21228 8015AE20 40180300 */  sll        $v1, $v1, 1
    /* 2122C 8015AE24 21186200 */  addu       $v1, $v1, $v0
    /* 21230 8015AE28 96000224 */  addiu      $v0, $zero, 0x96
    /* 21234 8015AE2C 000062A4 */  sh         $v0, 0x0($v1)
    /* 21238 8015AE30 1480013C */  lui        $at, %hi(themeLoc)
    /* 2123C 8015AE34 21082400 */  addu       $at, $at, $a0
    /* 21240 8015AE38 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 21244 8015AE3C 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21248 8015AE40 21082400 */  addu       $at, $at, $a0
    /* 2124C 8015AE44 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21250 8015AE48 A0FFC724 */  addiu      $a3, $a2, -0x60
    /* 21254 8015AE4C 21186200 */  addu       $v1, $v1, $v0
    /* 21258 8015AE50 40100300 */  sll        $v0, $v1, 1
    /* 2125C 8015AE54 21104300 */  addu       $v0, $v0, $v1
    /* 21260 8015AE58 40110200 */  sll        $v0, $v0, 5
    /* 21264 8015AE5C 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21268 8015AE60 21082400 */  addu       $at, $at, $a0
    /* 2126C 8015AE64 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 21270 8015AE68 21104700 */  addu       $v0, $v0, $a3
    /* 21274 8015AE6C 40180300 */  sll        $v1, $v1, 1
    /* 21278 8015AE70 21186200 */  addu       $v1, $v1, $v0
    /* 2127C 8015AE74 97000224 */  addiu      $v0, $zero, 0x97
    /* 21280 8015AE78 000062A4 */  sh         $v0, 0x0($v1)
    /* 21284 8015AE7C 1480013C */  lui        $at, %hi(themeLoc)
    /* 21288 8015AE80 21082400 */  addu       $at, $at, $a0
    /* 2128C 8015AE84 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 21290 8015AE88 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21294 8015AE8C 21082400 */  addu       $at, $at, $a0
    /* 21298 8015AE90 789C258C */  lw         $a1, %lo(themeLoc + 0x10)($at)
    /* 2129C 8015AE94 40180200 */  sll        $v1, $v0, 1
    /* 212A0 8015AE98 21186200 */  addu       $v1, $v1, $v0
    /* 212A4 8015AE9C 40190300 */  sll        $v1, $v1, 5
    /* 212A8 8015AEA0 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 212AC 8015AEA4 21082400 */  addu       $at, $at, $a0
    /* 212B0 8015AEA8 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 212B4 8015AEAC 21186600 */  addu       $v1, $v1, $a2
    /* 212B8 8015AEB0 21104500 */  addu       $v0, $v0, $a1
    /* 212BC 8015AEB4 40100200 */  sll        $v0, $v0, 1
    /* 212C0 8015AEB8 21104300 */  addu       $v0, $v0, $v1
    /* 212C4 8015AEBC 98000324 */  addiu      $v1, $zero, 0x98
    /* 212C8 8015AEC0 FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 212CC 8015AEC4 1480013C */  lui        $at, %hi(themeLoc)
    /* 212D0 8015AEC8 21082400 */  addu       $at, $at, $a0
    /* 212D4 8015AECC 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 212D8 8015AED0 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 212DC 8015AED4 21082400 */  addu       $at, $at, $a0
    /* 212E0 8015AED8 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 212E4 8015AEDC 00000000 */  nop
    /* 212E8 8015AEE0 21104300 */  addu       $v0, $v0, $v1
    /* 212EC 8015AEE4 40180200 */  sll        $v1, $v0, 1
    /* 212F0 8015AEE8 21186200 */  addu       $v1, $v1, $v0
    /* 212F4 8015AEEC 40190300 */  sll        $v1, $v1, 5
    /* 212F8 8015AEF0 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 212FC 8015AEF4 21082400 */  addu       $at, $at, $a0
    /* 21300 8015AEF8 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21304 8015AEFC 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21308 8015AF00 21082400 */  addu       $at, $at, $a0
    /* 2130C 8015AF04 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 21310 8015AF08 21186700 */  addu       $v1, $v1, $a3
    /* 21314 8015AF0C 21104400 */  addu       $v0, $v0, $a0
    /* 21318 8015AF10 40100200 */  sll        $v0, $v0, 1
    /* 2131C 8015AF14 21104300 */  addu       $v0, $v0, $v1
    /* 21320 8015AF18 8A000324 */  addiu      $v1, $zero, 0x8A
    /* 21324 8015AF1C FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 21328 8015AF20 8D198393 */  lbu        $v1, %gp_rel(leveltype)($gp)
    /* 2132C 8015AF24 04000224 */  addiu      $v0, $zero, 0x4
  .L8015AF28:
    /* 21330 8015AF28 4F006214 */  bne        $v1, $v0, .L8015B068
    /* 21334 8015AF2C 80201000 */   sll       $a0, $s0, 2
    /* 21338 8015AF30 21209000 */  addu       $a0, $a0, $s0
    /* 2133C 8015AF34 80200400 */  sll        $a0, $a0, 2
    /* 21340 8015AF38 1480013C */  lui        $at, %hi(themeLoc)
    /* 21344 8015AF3C 21082400 */  addu       $at, $at, $a0
    /* 21348 8015AF40 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 2134C 8015AF44 0E80063C */  lui        $a2, %hi(dungeon)
    /* 21350 8015AF48 C440C624 */  addiu      $a2, $a2, %lo(dungeon)
    /* 21354 8015AF4C 40100300 */  sll        $v0, $v1, 1
    /* 21358 8015AF50 21104300 */  addu       $v0, $v0, $v1
    /* 2135C 8015AF54 40110200 */  sll        $v0, $v0, 5
    /* 21360 8015AF58 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21364 8015AF5C 21082400 */  addu       $at, $at, $a0
    /* 21368 8015AF60 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 2136C 8015AF64 21104600 */  addu       $v0, $v0, $a2
    /* 21370 8015AF68 40180300 */  sll        $v1, $v1, 1
    /* 21374 8015AF6C 21186200 */  addu       $v1, $v1, $v0
    /* 21378 8015AF70 09000224 */  addiu      $v0, $zero, 0x9
    /* 2137C 8015AF74 000062A4 */  sh         $v0, 0x0($v1)
    /* 21380 8015AF78 1480013C */  lui        $at, %hi(themeLoc)
    /* 21384 8015AF7C 21082400 */  addu       $at, $at, $a0
    /* 21388 8015AF80 689C238C */  lw         $v1, %lo(themeLoc)($at)
    /* 2138C 8015AF84 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21390 8015AF88 21082400 */  addu       $at, $at, $a0
    /* 21394 8015AF8C 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21398 8015AF90 A0FFC724 */  addiu      $a3, $a2, -0x60
    /* 2139C 8015AF94 21186200 */  addu       $v1, $v1, $v0
    /* 213A0 8015AF98 40100300 */  sll        $v0, $v1, 1
    /* 213A4 8015AF9C 21104300 */  addu       $v0, $v0, $v1
    /* 213A8 8015AFA0 40110200 */  sll        $v0, $v0, 5
    /* 213AC 8015AFA4 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 213B0 8015AFA8 21082400 */  addu       $at, $at, $a0
    /* 213B4 8015AFAC 6C9C238C */  lw         $v1, %lo(themeLoc + 0x4)($at)
    /* 213B8 8015AFB0 21104700 */  addu       $v0, $v0, $a3
    /* 213BC 8015AFB4 40180300 */  sll        $v1, $v1, 1
    /* 213C0 8015AFB8 21186200 */  addu       $v1, $v1, $v0
    /* 213C4 8015AFBC 10000224 */  addiu      $v0, $zero, 0x10
    /* 213C8 8015AFC0 000062A4 */  sh         $v0, 0x0($v1)
    /* 213CC 8015AFC4 1480013C */  lui        $at, %hi(themeLoc)
    /* 213D0 8015AFC8 21082400 */  addu       $at, $at, $a0
    /* 213D4 8015AFCC 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 213D8 8015AFD0 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 213DC 8015AFD4 21082400 */  addu       $at, $at, $a0
    /* 213E0 8015AFD8 789C258C */  lw         $a1, %lo(themeLoc + 0x10)($at)
    /* 213E4 8015AFDC 40180200 */  sll        $v1, $v0, 1
    /* 213E8 8015AFE0 21186200 */  addu       $v1, $v1, $v0
    /* 213EC 8015AFE4 40190300 */  sll        $v1, $v1, 5
    /* 213F0 8015AFE8 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 213F4 8015AFEC 21082400 */  addu       $at, $at, $a0
    /* 213F8 8015AFF0 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 213FC 8015AFF4 21186600 */  addu       $v1, $v1, $a2
    /* 21400 8015AFF8 21104500 */  addu       $v0, $v0, $a1
    /* 21404 8015AFFC 40100200 */  sll        $v0, $v0, 1
    /* 21408 8015B000 21104300 */  addu       $v0, $v0, $v1
    /* 2140C 8015B004 0F000324 */  addiu      $v1, $zero, 0xF
    /* 21410 8015B008 FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 21414 8015B00C 1480013C */  lui        $at, %hi(themeLoc)
    /* 21418 8015B010 21082400 */  addu       $at, $at, $a0
    /* 2141C 8015B014 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 21420 8015B018 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21424 8015B01C 21082400 */  addu       $at, $at, $a0
    /* 21428 8015B020 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 2142C 8015B024 00000000 */  nop
    /* 21430 8015B028 21104300 */  addu       $v0, $v0, $v1
    /* 21434 8015B02C 40180200 */  sll        $v1, $v0, 1
    /* 21438 8015B030 21186200 */  addu       $v1, $v1, $v0
    /* 2143C 8015B034 40190300 */  sll        $v1, $v1, 5
    /* 21440 8015B038 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21444 8015B03C 21082400 */  addu       $at, $at, $a0
    /* 21448 8015B040 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 2144C 8015B044 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21450 8015B048 21082400 */  addu       $at, $at, $a0
    /* 21454 8015B04C 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 21458 8015B050 21186700 */  addu       $v1, $v1, $a3
    /* 2145C 8015B054 21104400 */  addu       $v0, $v0, $a0
    /* 21460 8015B058 40100200 */  sll        $v0, $v0, 1
    /* 21464 8015B05C 21104300 */  addu       $v0, $v0, $v1
    /* 21468 8015B060 0C000324 */  addiu      $v1, $zero, 0xC
    /* 2146C 8015B064 FEFF43A4 */  sh         $v1, -0x2($v0)
  .L8015B068:
    /* 21470 8015B068 8D198293 */  lbu        $v0, %gp_rel(leveltype)($gp)
    /* 21474 8015B06C 00000000 */  nop
    /* 21478 8015B070 46004814 */  bne        $v0, $t0, .L8015B18C
    /* 2147C 8015B074 00000000 */   nop
    /* 21480 8015B078 C9F6000C */  jal        ENG_random__Fl
    /* 21484 8015B07C 02000424 */   addiu     $a0, $zero, 0x2
    /* 21488 8015B080 21184000 */  addu       $v1, $v0, $zero
    /* 2148C 8015B084 05006010 */  beqz       $v1, .L8015B09C
    /* 21490 8015B088 01000224 */   addiu     $v0, $zero, 0x1
    /* 21494 8015B08C 22006210 */  beq        $v1, $v0, .L8015B118
    /* 21498 8015B090 80281000 */   sll       $a1, $s0, 2
    /* 2149C 8015B094 636C0508 */  j          .L8015B18C
    /* 214A0 8015B098 00000000 */   nop
  .L8015B09C:
    /* 214A4 8015B09C 80281000 */  sll        $a1, $s0, 2
    /* 214A8 8015B0A0 2128B000 */  addu       $a1, $a1, $s0
    /* 214AC 8015B0A4 80280500 */  sll        $a1, $a1, 2
    /* 214B0 8015B0A8 1480013C */  lui        $at, %hi(themeLoc)
    /* 214B4 8015B0AC 21082500 */  addu       $at, $at, $a1
    /* 214B8 8015B0B0 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 214BC 8015B0B4 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 214C0 8015B0B8 21082500 */  addu       $at, $at, $a1
    /* 214C4 8015B0BC 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 214C8 8015B0C0 0E80063C */  lui        $a2, %hi(D_800E4064)
    /* 214CC 8015B0C4 6440C624 */  addiu      $a2, $a2, %lo(D_800E4064)
    /* 214D0 8015B0C8 21104300 */  addu       $v0, $v0, $v1
    /* 214D4 8015B0CC 40200200 */  sll        $a0, $v0, 1
    /* 214D8 8015B0D0 21208200 */  addu       $a0, $a0, $v0
    /* 214DC 8015B0D4 40210400 */  sll        $a0, $a0, 5
    /* 214E0 8015B0D8 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 214E4 8015B0DC 21082500 */  addu       $at, $at, $a1
    /* 214E8 8015B0E0 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 214EC 8015B0E4 21208600 */  addu       $a0, $a0, $a2
    /* 214F0 8015B0E8 C2170300 */  srl        $v0, $v1, 31
    /* 214F4 8015B0EC 21186200 */  addu       $v1, $v1, $v0
    /* 214F8 8015B0F0 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 214FC 8015B0F4 21082500 */  addu       $at, $at, $a1
    /* 21500 8015B0F8 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21504 8015B0FC 43180300 */  sra        $v1, $v1, 1
    /* 21508 8015B100 21104300 */  addu       $v0, $v0, $v1
    /* 2150C 8015B104 40100200 */  sll        $v0, $v0, 1
    /* 21510 8015B108 21104400 */  addu       $v0, $v0, $a0
    /* 21514 8015B10C 04000324 */  addiu      $v1, $zero, 0x4
    /* 21518 8015B110 636C0508 */  j          .L8015B18C
    /* 2151C 8015B114 000043A4 */   sh        $v1, 0x0($v0)
  .L8015B118:
    /* 21520 8015B118 2128B000 */  addu       $a1, $a1, $s0
    /* 21524 8015B11C 80280500 */  sll        $a1, $a1, 2
    /* 21528 8015B120 0E80063C */  lui        $a2, %hi(dungeon)
    /* 2152C 8015B124 C440C624 */  addiu      $a2, $a2, %lo(dungeon)
    /* 21530 8015B128 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21534 8015B12C 21082500 */  addu       $at, $at, $a1
    /* 21538 8015B130 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 2153C 8015B134 1480013C */  lui        $at, %hi(themeLoc)
    /* 21540 8015B138 21082500 */  addu       $at, $at, $a1
    /* 21544 8015B13C 689C248C */  lw         $a0, %lo(themeLoc)($at)
    /* 21548 8015B140 C21F0200 */  srl        $v1, $v0, 31
    /* 2154C 8015B144 21104300 */  addu       $v0, $v0, $v1
    /* 21550 8015B148 43100200 */  sra        $v0, $v0, 1
    /* 21554 8015B14C 21208200 */  addu       $a0, $a0, $v0
    /* 21558 8015B150 40180400 */  sll        $v1, $a0, 1
    /* 2155C 8015B154 21186400 */  addu       $v1, $v1, $a0
    /* 21560 8015B158 40190300 */  sll        $v1, $v1, 5
    /* 21564 8015B15C 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21568 8015B160 21082500 */  addu       $at, $at, $a1
    /* 2156C 8015B164 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21570 8015B168 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21574 8015B16C 21082500 */  addu       $at, $at, $a1
    /* 21578 8015B170 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 2157C 8015B174 21186600 */  addu       $v1, $v1, $a2
    /* 21580 8015B178 21104400 */  addu       $v0, $v0, $a0
    /* 21584 8015B17C 40100200 */  sll        $v0, $v0, 1
    /* 21588 8015B180 21104300 */  addu       $v0, $v0, $v1
    /* 2158C 8015B184 05000324 */  addiu      $v1, $zero, 0x5
    /* 21590 8015B188 FEFF43A4 */  sh         $v1, -0x2($v0)
  .L8015B18C:
    /* 21594 8015B18C 8D198393 */  lbu        $v1, %gp_rel(leveltype)($gp)
    /* 21598 8015B190 03000224 */  addiu      $v0, $zero, 0x3
    /* 2159C 8015B194 48006214 */  bne        $v1, $v0, .L8015B2B8
    /* 215A0 8015B198 04000224 */   addiu     $v0, $zero, 0x4
    /* 215A4 8015B19C C9F6000C */  jal        ENG_random__Fl
    /* 215A8 8015B1A0 02000424 */   addiu     $a0, $zero, 0x2
    /* 215AC 8015B1A4 21184000 */  addu       $v1, $v0, $zero
    /* 215B0 8015B1A8 05006010 */  beqz       $v1, .L8015B1C0
    /* 215B4 8015B1AC 01000224 */   addiu     $v0, $zero, 0x1
    /* 215B8 8015B1B0 22006210 */  beq        $v1, $v0, .L8015B23C
    /* 215BC 8015B1B4 80281000 */   sll       $a1, $s0, 2
    /* 215C0 8015B1B8 AC6C0508 */  j          .L8015B2B0
    /* 215C4 8015B1BC 00000000 */   nop
  .L8015B1C0:
    /* 215C8 8015B1C0 80281000 */  sll        $a1, $s0, 2
    /* 215CC 8015B1C4 2128B000 */  addu       $a1, $a1, $s0
    /* 215D0 8015B1C8 80280500 */  sll        $a1, $a1, 2
    /* 215D4 8015B1CC 1480013C */  lui        $at, %hi(themeLoc)
    /* 215D8 8015B1D0 21082500 */  addu       $at, $at, $a1
    /* 215DC 8015B1D4 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 215E0 8015B1D8 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 215E4 8015B1DC 21082500 */  addu       $at, $at, $a1
    /* 215E8 8015B1E0 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 215EC 8015B1E4 0E80063C */  lui        $a2, %hi(D_800E4064)
    /* 215F0 8015B1E8 6440C624 */  addiu      $a2, $a2, %lo(D_800E4064)
    /* 215F4 8015B1EC 21104300 */  addu       $v0, $v0, $v1
    /* 215F8 8015B1F0 40200200 */  sll        $a0, $v0, 1
    /* 215FC 8015B1F4 21208200 */  addu       $a0, $a0, $v0
    /* 21600 8015B1F8 40210400 */  sll        $a0, $a0, 5
    /* 21604 8015B1FC 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21608 8015B200 21082500 */  addu       $at, $at, $a1
    /* 2160C 8015B204 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 21610 8015B208 21208600 */  addu       $a0, $a0, $a2
    /* 21614 8015B20C C2170300 */  srl        $v0, $v1, 31
    /* 21618 8015B210 21186200 */  addu       $v1, $v1, $v0
    /* 2161C 8015B214 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21620 8015B218 21082500 */  addu       $at, $at, $a1
    /* 21624 8015B21C 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21628 8015B220 43180300 */  sra        $v1, $v1, 1
    /* 2162C 8015B224 21104300 */  addu       $v0, $v0, $v1
    /* 21630 8015B228 40100200 */  sll        $v0, $v0, 1
    /* 21634 8015B22C 21104400 */  addu       $v0, $v0, $a0
    /* 21638 8015B230 93000324 */  addiu      $v1, $zero, 0x93
    /* 2163C 8015B234 AC6C0508 */  j          .L8015B2B0
    /* 21640 8015B238 000043A4 */   sh        $v1, 0x0($v0)
  .L8015B23C:
    /* 21644 8015B23C 2128B000 */  addu       $a1, $a1, $s0
    /* 21648 8015B240 80280500 */  sll        $a1, $a1, 2
    /* 2164C 8015B244 0E80063C */  lui        $a2, %hi(dungeon)
    /* 21650 8015B248 C440C624 */  addiu      $a2, $a2, %lo(dungeon)
    /* 21654 8015B24C 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21658 8015B250 21082500 */  addu       $at, $at, $a1
    /* 2165C 8015B254 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21660 8015B258 1480013C */  lui        $at, %hi(themeLoc)
    /* 21664 8015B25C 21082500 */  addu       $at, $at, $a1
    /* 21668 8015B260 689C248C */  lw         $a0, %lo(themeLoc)($at)
    /* 2166C 8015B264 C21F0200 */  srl        $v1, $v0, 31
    /* 21670 8015B268 21104300 */  addu       $v0, $v0, $v1
    /* 21674 8015B26C 43100200 */  sra        $v0, $v0, 1
    /* 21678 8015B270 21208200 */  addu       $a0, $a0, $v0
    /* 2167C 8015B274 40180400 */  sll        $v1, $a0, 1
    /* 21680 8015B278 21186400 */  addu       $v1, $v1, $a0
    /* 21684 8015B27C 40190300 */  sll        $v1, $v1, 5
    /* 21688 8015B280 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 2168C 8015B284 21082500 */  addu       $at, $at, $a1
    /* 21690 8015B288 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21694 8015B28C 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21698 8015B290 21082500 */  addu       $at, $at, $a1
    /* 2169C 8015B294 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 216A0 8015B298 21186600 */  addu       $v1, $v1, $a2
    /* 216A4 8015B29C 21104400 */  addu       $v0, $v0, $a0
    /* 216A8 8015B2A0 40100200 */  sll        $v0, $v0, 1
    /* 216AC 8015B2A4 21104300 */  addu       $v0, $v0, $v1
    /* 216B0 8015B2A8 92000324 */  addiu      $v1, $zero, 0x92
    /* 216B4 8015B2AC FEFF43A4 */  sh         $v1, -0x2($v0)
  .L8015B2B0:
    /* 216B8 8015B2B0 8D198393 */  lbu        $v1, %gp_rel(leveltype)($gp)
    /* 216BC 8015B2B4 04000224 */  addiu      $v0, $zero, 0x4
  .L8015B2B8:
    /* 216C0 8015B2B8 FA006214 */  bne        $v1, $v0, .L8015B6A4
    /* 216C4 8015B2BC 00000000 */   nop
    /* 216C8 8015B2C0 C9F6000C */  jal        ENG_random__Fl
    /* 216CC 8015B2C4 02000424 */   addiu     $a0, $zero, 0x2
    /* 216D0 8015B2C8 21184000 */  addu       $v1, $v0, $zero
    /* 216D4 8015B2CC 05006010 */  beqz       $v1, .L8015B2E4
    /* 216D8 8015B2D0 01000224 */   addiu     $v0, $zero, 0x1
    /* 216DC 8015B2D4 70006210 */  beq        $v1, $v0, .L8015B498
    /* 216E0 8015B2D8 80281000 */   sll       $a1, $s0, 2
    /* 216E4 8015B2DC A96D0508 */  j          .L8015B6A4
    /* 216E8 8015B2E0 00000000 */   nop
  .L8015B2E4:
    /* 216EC 8015B2E4 80281000 */  sll        $a1, $s0, 2
    /* 216F0 8015B2E8 2128B000 */  addu       $a1, $a1, $s0
    /* 216F4 8015B2EC 80280500 */  sll        $a1, $a1, 2
    /* 216F8 8015B2F0 1480013C */  lui        $at, %hi(themeLoc)
    /* 216FC 8015B2F4 21082500 */  addu       $at, $at, $a1
    /* 21700 8015B2F8 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 21704 8015B2FC 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21708 8015B300 21082500 */  addu       $at, $at, $a1
    /* 2170C 8015B304 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 21710 8015B308 0E80063C */  lui        $a2, %hi(D_800E4064)
    /* 21714 8015B30C 6440C624 */  addiu      $a2, $a2, %lo(D_800E4064)
    /* 21718 8015B310 21104300 */  addu       $v0, $v0, $v1
    /* 2171C 8015B314 40200200 */  sll        $a0, $v0, 1
    /* 21720 8015B318 21208200 */  addu       $a0, $a0, $v0
    /* 21724 8015B31C 40210400 */  sll        $a0, $a0, 5
    /* 21728 8015B320 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 2172C 8015B324 21082500 */  addu       $at, $at, $a1
    /* 21730 8015B328 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 21734 8015B32C 21208600 */  addu       $a0, $a0, $a2
    /* 21738 8015B330 C2170300 */  srl        $v0, $v1, 31
    /* 2173C 8015B334 21186200 */  addu       $v1, $v1, $v0
    /* 21740 8015B338 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21744 8015B33C 21082500 */  addu       $at, $at, $a1
    /* 21748 8015B340 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 2174C 8015B344 43180300 */  sra        $v1, $v1, 1
    /* 21750 8015B348 21104300 */  addu       $v0, $v0, $v1
    /* 21754 8015B34C 40100200 */  sll        $v0, $v0, 1
    /* 21758 8015B350 21104400 */  addu       $v0, $v0, $a0
    /* 2175C 8015B354 35000324 */  addiu      $v1, $zero, 0x35
    /* 21760 8015B358 FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 21764 8015B35C 1480013C */  lui        $at, %hi(themeLoc)
    /* 21768 8015B360 21082500 */  addu       $at, $at, $a1
    /* 2176C 8015B364 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 21770 8015B368 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21774 8015B36C 21082500 */  addu       $at, $at, $a1
    /* 21778 8015B370 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 2177C 8015B374 00000000 */  nop
    /* 21780 8015B378 21104300 */  addu       $v0, $v0, $v1
    /* 21784 8015B37C 40200200 */  sll        $a0, $v0, 1
    /* 21788 8015B380 21208200 */  addu       $a0, $a0, $v0
    /* 2178C 8015B384 40210400 */  sll        $a0, $a0, 5
    /* 21790 8015B388 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21794 8015B38C 21082500 */  addu       $at, $at, $a1
    /* 21798 8015B390 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 2179C 8015B394 21208600 */  addu       $a0, $a0, $a2
    /* 217A0 8015B398 C2170300 */  srl        $v0, $v1, 31
    /* 217A4 8015B39C 21186200 */  addu       $v1, $v1, $v0
    /* 217A8 8015B3A0 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 217AC 8015B3A4 21082500 */  addu       $at, $at, $a1
    /* 217B0 8015B3A8 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 217B4 8015B3AC 43180300 */  sra        $v1, $v1, 1
    /* 217B8 8015B3B0 21104300 */  addu       $v0, $v0, $v1
    /* 217BC 8015B3B4 40100200 */  sll        $v0, $v0, 1
    /* 217C0 8015B3B8 21104400 */  addu       $v0, $v0, $a0
    /* 217C4 8015B3BC 06000324 */  addiu      $v1, $zero, 0x6
    /* 217C8 8015B3C0 000043A4 */  sh         $v1, 0x0($v0)
    /* 217CC 8015B3C4 1480013C */  lui        $at, %hi(themeLoc)
    /* 217D0 8015B3C8 21082500 */  addu       $at, $at, $a1
    /* 217D4 8015B3CC 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 217D8 8015B3D0 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 217DC 8015B3D4 21082500 */  addu       $at, $at, $a1
    /* 217E0 8015B3D8 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 217E4 8015B3DC 00000000 */  nop
    /* 217E8 8015B3E0 21104300 */  addu       $v0, $v0, $v1
    /* 217EC 8015B3E4 40200200 */  sll        $a0, $v0, 1
    /* 217F0 8015B3E8 21208200 */  addu       $a0, $a0, $v0
    /* 217F4 8015B3EC 40210400 */  sll        $a0, $a0, 5
    /* 217F8 8015B3F0 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 217FC 8015B3F4 21082500 */  addu       $at, $at, $a1
    /* 21800 8015B3F8 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 21804 8015B3FC 21208600 */  addu       $a0, $a0, $a2
    /* 21808 8015B400 C2170300 */  srl        $v0, $v1, 31
    /* 2180C 8015B404 21186200 */  addu       $v1, $v1, $v0
    /* 21810 8015B408 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21814 8015B40C 21082500 */  addu       $at, $at, $a1
    /* 21818 8015B410 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 2181C 8015B414 43180300 */  sra        $v1, $v1, 1
    /* 21820 8015B418 21104300 */  addu       $v0, $v0, $v1
    /* 21824 8015B41C 40100200 */  sll        $v0, $v0, 1
    /* 21828 8015B420 21104400 */  addu       $v0, $v0, $a0
    /* 2182C 8015B424 34000324 */  addiu      $v1, $zero, 0x34
    /* 21830 8015B428 020043A4 */  sh         $v1, 0x2($v0)
    /* 21834 8015B42C 1480013C */  lui        $at, %hi(themeLoc)
    /* 21838 8015B430 21082500 */  addu       $at, $at, $a1
    /* 2183C 8015B434 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 21840 8015B438 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21844 8015B43C 21082500 */  addu       $at, $at, $a1
    /* 21848 8015B440 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 2184C 8015B444 A0FFC624 */  addiu      $a2, $a2, -0x60
    /* 21850 8015B448 21104300 */  addu       $v0, $v0, $v1
    /* 21854 8015B44C 40200200 */  sll        $a0, $v0, 1
    /* 21858 8015B450 21208200 */  addu       $a0, $a0, $v0
    /* 2185C 8015B454 40210400 */  sll        $a0, $a0, 5
    /* 21860 8015B458 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21864 8015B45C 21082500 */  addu       $at, $at, $a1
    /* 21868 8015B460 789C238C */  lw         $v1, %lo(themeLoc + 0x10)($at)
    /* 2186C 8015B464 21208600 */  addu       $a0, $a0, $a2
    /* 21870 8015B468 C2170300 */  srl        $v0, $v1, 31
    /* 21874 8015B46C 21186200 */  addu       $v1, $v1, $v0
    /* 21878 8015B470 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 2187C 8015B474 21082500 */  addu       $at, $at, $a1
    /* 21880 8015B478 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21884 8015B47C 43180300 */  sra        $v1, $v1, 1
    /* 21888 8015B480 21104300 */  addu       $v0, $v0, $v1
    /* 2188C 8015B484 40100200 */  sll        $v0, $v0, 1
    /* 21890 8015B488 21104400 */  addu       $v0, $v0, $a0
    /* 21894 8015B48C 36000324 */  addiu      $v1, $zero, 0x36
    /* 21898 8015B490 A96D0508 */  j          .L8015B6A4
    /* 2189C 8015B494 FEFF43A4 */   sh        $v1, -0x2($v0)
  .L8015B498:
    /* 218A0 8015B498 2128B000 */  addu       $a1, $a1, $s0
    /* 218A4 8015B49C 80280500 */  sll        $a1, $a1, 2
    /* 218A8 8015B4A0 0E80073C */  lui        $a3, %hi(D_800E4064)
    /* 218AC 8015B4A4 6440E724 */  addiu      $a3, $a3, %lo(D_800E4064)
    /* 218B0 8015B4A8 6000E824 */  addiu      $t0, $a3, 0x60
    /* 218B4 8015B4AC C000E624 */  addiu      $a2, $a3, 0xC0
    /* 218B8 8015B4B0 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 218BC 8015B4B4 21082500 */  addu       $at, $at, $a1
    /* 218C0 8015B4B8 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 218C4 8015B4BC 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 218C8 8015B4C0 21082500 */  addu       $at, $at, $a1
    /* 218CC 8015B4C4 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 218D0 8015B4C8 C2170300 */  srl        $v0, $v1, 31
    /* 218D4 8015B4CC 21186200 */  addu       $v1, $v1, $v0
    /* 218D8 8015B4D0 1480013C */  lui        $at, %hi(themeLoc)
    /* 218DC 8015B4D4 21082500 */  addu       $at, $at, $a1
    /* 218E0 8015B4D8 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 218E4 8015B4DC 43180300 */  sra        $v1, $v1, 1
    /* 218E8 8015B4E0 21104300 */  addu       $v0, $v0, $v1
    /* 218EC 8015B4E4 40180200 */  sll        $v1, $v0, 1
    /* 218F0 8015B4E8 21186200 */  addu       $v1, $v1, $v0
    /* 218F4 8015B4EC 40190300 */  sll        $v1, $v1, 5
    /* 218F8 8015B4F0 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 218FC 8015B4F4 21082500 */  addu       $at, $at, $a1
    /* 21900 8015B4F8 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21904 8015B4FC 21186700 */  addu       $v1, $v1, $a3
    /* 21908 8015B500 21104400 */  addu       $v0, $v0, $a0
    /* 2190C 8015B504 40100200 */  sll        $v0, $v0, 1
    /* 21910 8015B508 21104300 */  addu       $v0, $v0, $v1
    /* 21914 8015B50C 39000324 */  addiu      $v1, $zero, 0x39
    /* 21918 8015B510 FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 2191C 8015B514 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21920 8015B518 21082500 */  addu       $at, $at, $a1
    /* 21924 8015B51C 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21928 8015B520 1480013C */  lui        $at, %hi(themeLoc)
    /* 2192C 8015B524 21082500 */  addu       $at, $at, $a1
    /* 21930 8015B528 689C248C */  lw         $a0, %lo(themeLoc)($at)
    /* 21934 8015B52C C21F0200 */  srl        $v1, $v0, 31
    /* 21938 8015B530 21104300 */  addu       $v0, $v0, $v1
    /* 2193C 8015B534 43100200 */  sra        $v0, $v0, 1
    /* 21940 8015B538 21208200 */  addu       $a0, $a0, $v0
    /* 21944 8015B53C 40180400 */  sll        $v1, $a0, 1
    /* 21948 8015B540 21186400 */  addu       $v1, $v1, $a0
    /* 2194C 8015B544 40190300 */  sll        $v1, $v1, 5
    /* 21950 8015B548 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21954 8015B54C 21082500 */  addu       $at, $at, $a1
    /* 21958 8015B550 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 2195C 8015B554 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21960 8015B558 21082500 */  addu       $at, $at, $a1
    /* 21964 8015B55C 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 21968 8015B560 21186800 */  addu       $v1, $v1, $t0
    /* 2196C 8015B564 21104400 */  addu       $v0, $v0, $a0
    /* 21970 8015B568 40100200 */  sll        $v0, $v0, 1
    /* 21974 8015B56C 21104300 */  addu       $v0, $v0, $v1
    /* 21978 8015B570 06000324 */  addiu      $v1, $zero, 0x6
    /* 2197C 8015B574 FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 21980 8015B578 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21984 8015B57C 21082500 */  addu       $at, $at, $a1
    /* 21988 8015B580 749C238C */  lw         $v1, %lo(themeLoc + 0xC)($at)
    /* 2198C 8015B584 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21990 8015B588 21082500 */  addu       $at, $at, $a1
    /* 21994 8015B58C 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 21998 8015B590 C2170300 */  srl        $v0, $v1, 31
    /* 2199C 8015B594 21186200 */  addu       $v1, $v1, $v0
    /* 219A0 8015B598 1480013C */  lui        $at, %hi(themeLoc)
    /* 219A4 8015B59C 21082500 */  addu       $at, $at, $a1
    /* 219A8 8015B5A0 689C228C */  lw         $v0, %lo(themeLoc)($at)
    /* 219AC 8015B5A4 43180300 */  sra        $v1, $v1, 1
    /* 219B0 8015B5A8 21104300 */  addu       $v0, $v0, $v1
    /* 219B4 8015B5AC 40180200 */  sll        $v1, $v0, 1
    /* 219B8 8015B5B0 21186200 */  addu       $v1, $v1, $v0
    /* 219BC 8015B5B4 40190300 */  sll        $v1, $v1, 5
    /* 219C0 8015B5B8 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 219C4 8015B5BC 21082500 */  addu       $at, $at, $a1
    /* 219C8 8015B5C0 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 219CC 8015B5C4 21186600 */  addu       $v1, $v1, $a2
    /* 219D0 8015B5C8 21104400 */  addu       $v0, $v0, $a0
    /* 219D4 8015B5CC 40100200 */  sll        $v0, $v0, 1
    /* 219D8 8015B5D0 21104300 */  addu       $v0, $v0, $v1
    /* 219DC 8015B5D4 38000324 */  addiu      $v1, $zero, 0x38
    /* 219E0 8015B5D8 FEFF43A4 */  sh         $v1, -0x2($v0)
    /* 219E4 8015B5DC 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 219E8 8015B5E0 21082500 */  addu       $at, $at, $a1
    /* 219EC 8015B5E4 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 219F0 8015B5E8 1480013C */  lui        $at, %hi(themeLoc)
    /* 219F4 8015B5EC 21082500 */  addu       $at, $at, $a1
    /* 219F8 8015B5F0 689C248C */  lw         $a0, %lo(themeLoc)($at)
    /* 219FC 8015B5F4 C21F0200 */  srl        $v1, $v0, 31
    /* 21A00 8015B5F8 21104300 */  addu       $v0, $v0, $v1
    /* 21A04 8015B5FC 43100200 */  sra        $v0, $v0, 1
    /* 21A08 8015B600 21208200 */  addu       $a0, $a0, $v0
    /* 21A0C 8015B604 40180400 */  sll        $v1, $a0, 1
    /* 21A10 8015B608 21186400 */  addu       $v1, $v1, $a0
    /* 21A14 8015B60C 40190300 */  sll        $v1, $v1, 5
    /* 21A18 8015B610 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21A1C 8015B614 21082500 */  addu       $at, $at, $a1
    /* 21A20 8015B618 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21A24 8015B61C 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21A28 8015B620 21082500 */  addu       $at, $at, $a1
    /* 21A2C 8015B624 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 21A30 8015B628 21186800 */  addu       $v1, $v1, $t0
    /* 21A34 8015B62C 21104400 */  addu       $v0, $v0, $a0
    /* 21A38 8015B630 40100200 */  sll        $v0, $v0, 1
    /* 21A3C 8015B634 21104300 */  addu       $v0, $v0, $v1
    /* 21A40 8015B638 3B000324 */  addiu      $v1, $zero, 0x3B
    /* 21A44 8015B63C FCFF43A4 */  sh         $v1, -0x4($v0)
    /* 21A48 8015B640 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21A4C 8015B644 21082500 */  addu       $at, $at, $a1
    /* 21A50 8015B648 749C228C */  lw         $v0, %lo(themeLoc + 0xC)($at)
    /* 21A54 8015B64C 1480013C */  lui        $at, %hi(themeLoc)
    /* 21A58 8015B650 21082500 */  addu       $at, $at, $a1
    /* 21A5C 8015B654 689C248C */  lw         $a0, %lo(themeLoc)($at)
    /* 21A60 8015B658 C21F0200 */  srl        $v1, $v0, 31
    /* 21A64 8015B65C 21104300 */  addu       $v0, $v0, $v1
    /* 21A68 8015B660 43100200 */  sra        $v0, $v0, 1
    /* 21A6C 8015B664 21208200 */  addu       $a0, $a0, $v0
    /* 21A70 8015B668 40180400 */  sll        $v1, $a0, 1
    /* 21A74 8015B66C 21186400 */  addu       $v1, $v1, $a0
    /* 21A78 8015B670 40190300 */  sll        $v1, $v1, 5
    /* 21A7C 8015B674 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21A80 8015B678 21082500 */  addu       $at, $at, $a1
    /* 21A84 8015B67C 6C9C228C */  lw         $v0, %lo(themeLoc + 0x4)($at)
    /* 21A88 8015B680 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21A8C 8015B684 21082500 */  addu       $at, $at, $a1
    /* 21A90 8015B688 789C248C */  lw         $a0, %lo(themeLoc + 0x10)($at)
    /* 21A94 8015B68C 21186700 */  addu       $v1, $v1, $a3
    /* 21A98 8015B690 21104400 */  addu       $v0, $v0, $a0
    /* 21A9C 8015B694 40100200 */  sll        $v0, $v0, 1
    /* 21AA0 8015B698 21104300 */  addu       $v0, $v0, $v1
    /* 21AA4 8015B69C 3A000324 */  addiu      $v1, $zero, 0x3A
    /* 21AA8 8015B6A0 FCFF43A4 */  sh         $v1, -0x4($v0)
  .L8015B6A4:
    /* 21AAC 8015B6A4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 21AB0 8015B6A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 21AB4 8015B6AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 21AB8 8015B6B0 0800E003 */  jr         $ra
    /* 21ABC 8015B6B4 00000000 */   nop
endlabel DRLG_CreateThemeRoom__Fi
