.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4__Fi, 0x900

glabel DRLG_L4__Fi
    /* 1AAE8 801546E0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1AAEC 801546E4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 1AAF0 801546E8 21988000 */  addu       $s3, $a0, $zero
    /* 1AAF4 801546EC 3800B6AF */  sw         $s6, 0x38($sp)
    /* 1AAF8 801546F0 10001624 */  addiu      $s6, $zero, 0x10
    /* 1AAFC 801546F4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 1AB00 801546F8 01001224 */  addiu      $s2, $zero, 0x1
    /* 1AB04 801546FC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 1AB08 80154700 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 1AB0C 80154704 3400B5AF */  sw         $s5, 0x34($sp)
    /* 1AB10 80154708 0D001524 */  addiu      $s5, $zero, 0xD
    /* 1AB14 8015470C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 1AB18 80154710 06001424 */  addiu      $s4, $zero, 0x6
    /* 1AB1C 80154714 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 1AB20 80154718 2000B0AF */  sw         $s0, 0x20($sp)
  .L8015471C:
    /* 1AB24 8015471C 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 1AB28 80154720 01000424 */   addiu     $a0, $zero, 0x1
    /* 1AB2C 80154724 1C68050C */  jal        DRLG_InitTrans__Fv
    /* 1AB30 80154728 00000000 */   nop
  .L8015472C:
    /* 1AB34 8015472C 5B3D050C */  jal        InitL4Dungeon__Fv
    /* 1AB38 80154730 00000000 */   nop
    /* 1AB3C 80154734 1E4C050C */  jal        L4firstRoom__Fv
    /* 1AB40 80154738 00000000 */   nop
    /* 1AB44 8015473C 5451050C */  jal        L4FixRim__Fv
    /* 1AB48 80154740 00000000 */   nop
    /* 1AB4C 80154744 0C4B050C */  jal        GetArea__Fv
    /* 1AB50 80154748 00000000 */   nop
    /* 1AB54 8015474C AD005028 */  slti       $s0, $v0, 0xAD
    /* 1AB58 80154750 F6FF0016 */  bnez       $s0, .L8015472C
    /* 1AB5C 80154754 00000000 */   nop
    /* 1AB60 80154758 654A050C */  jal        uShape__Fv
    /* 1AB64 8015475C 00000000 */   nop
    /* 1AB68 80154760 F2FF0016 */  bnez       $s0, .L8015472C
    /* 1AB6C 80154764 00000000 */   nop
    /* 1AB70 80154768 D749050C */  jal        L4makeDungeon__Fv
    /* 1AB74 8015476C 00000000 */   nop
    /* 1AB78 80154770 FD3D050C */  jal        L4makeDmt__Fv
    /* 1AB7C 80154774 00000000 */   nop
    /* 1AB80 80154778 E540050C */  jal        L4tileFix__Fv
    /* 1AB84 8015477C 00000000 */   nop
    /* 1AB88 80154780 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AB8C 80154784 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AB90 80154788 00000000 */  nop
    /* 1AB94 8015478C 03005614 */  bne        $v0, $s6, .L8015479C
    /* 1AB98 80154790 00000000 */   nop
    /* 1AB9C 80154794 A14C050C */  jal        L4SaveQuads__Fv
    /* 1ABA0 80154798 00000000 */   nop
  .L8015479C:
    /* 1ABA4 8015479C DC9E010C */  jal        QuestStatus__Fi
    /* 1ABA8 801547A0 0B000424 */   addiu     $a0, $zero, 0xB
    /* 1ABAC 801547A4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1ABB0 801547A8 0D004014 */  bnez       $v0, .L801547E0
    /* 1ABB4 801547AC 00000000 */   nop
    /* 1ABB8 801547B0 1280033C */  lui        $v1, %hi(currlevel)
    /* 1ABBC 801547B4 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1ABC0 801547B8 0E80023C */  lui        $v0, %hi(quests + 0x12C)
    /* 1ABC4 801547BC 6CDB4290 */  lbu        $v0, %lo(quests + 0x12C)($v0)
    /* 1ABC8 801547C0 00000000 */  nop
    /* 1ABCC 801547C4 24006214 */  bne        $v1, $v0, .L80154858
    /* 1ABD0 801547C8 00000000 */   nop
    /* 1ABD4 801547CC 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 1ABD8 801547D0 A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 1ABDC 801547D4 00000000 */  nop
    /* 1ABE0 801547D8 1F005210 */  beq        $v0, $s2, .L80154858
    /* 1ABE4 801547DC 00000000 */   nop
  .L801547E0:
    /* 1ABE8 801547E0 1C18858F */  lw         $a1, %gp_rel(SP4x1)($gp)
    /* 1ABEC 801547E4 2418828F */  lw         $v0, %gp_rel(SP4x2)($gp)
    /* 1ABF0 801547E8 00000000 */  nop
    /* 1ABF4 801547EC 2A10A200 */  slt        $v0, $a1, $v0
    /* 1ABF8 801547F0 19004010 */  beqz       $v0, .L80154858
    /* 1ABFC 801547F4 00000000 */   nop
  .L801547F8:
    /* 1AC00 801547F8 2018838F */  lw         $v1, %gp_rel(SP4y1)($gp)
    /* 1AC04 801547FC 2818828F */  lw         $v0, %gp_rel(SP4y2)($gp)
    /* 1AC08 80154800 00000000 */  nop
    /* 1AC0C 80154804 2A106200 */  slt        $v0, $v1, $v0
    /* 1AC10 80154808 0E004010 */  beqz       $v0, .L80154844
    /* 1AC14 8015480C 80100300 */   sll       $v0, $v1, 2
    /* 1AC18 80154810 21104300 */  addu       $v0, $v0, $v1
    /* 1AC1C 80154814 C0100200 */  sll        $v0, $v0, 3
    /* 1AC20 80154818 21204500 */  addu       $a0, $v0, $a1
  .L8015481C:
    /* 1AC24 8015481C 1280023C */  lui        $v0, %hi(mydflags)
    /* 1AC28 80154820 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 1AC2C 80154824 01006324 */  addiu      $v1, $v1, 0x1
    /* 1AC30 80154828 21104400 */  addu       $v0, $v0, $a0
    /* 1AC34 8015482C 000052A0 */  sb         $s2, 0x0($v0)
    /* 1AC38 80154830 2818828F */  lw         $v0, %gp_rel(SP4y2)($gp)
    /* 1AC3C 80154834 00000000 */  nop
    /* 1AC40 80154838 2A106200 */  slt        $v0, $v1, $v0
    /* 1AC44 8015483C F7FF4014 */  bnez       $v0, .L8015481C
    /* 1AC48 80154840 28008424 */   addiu     $a0, $a0, 0x28
  .L80154844:
    /* 1AC4C 80154844 2418828F */  lw         $v0, %gp_rel(SP4x2)($gp)
    /* 1AC50 80154848 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1AC54 8015484C 2A10A200 */  slt        $v0, $a1, $v0
    /* 1AC58 80154850 E9FF4014 */  bnez       $v0, .L801547F8
    /* 1AC5C 80154854 00000000 */   nop
  .L80154858:
    /* 1AC60 80154858 BB3F050C */  jal        L4AddWall__Fv
    /* 1AC64 8015485C 00000000 */   nop
    /* 1AC68 80154860 B64F050C */  jal        DRLG_L4FloodTVal__Fv
    /* 1AC6C 80154864 00000000 */   nop
    /* 1AC70 80154868 5450050C */  jal        DRLG_L4TransFix__Fv
    /* 1AC74 8015486C 00000000 */   nop
    /* 1AC78 80154870 1280023C */  lui        $v0, %hi(setloadflag)
    /* 1AC7C 80154874 F4C04290 */  lbu        $v0, %lo(setloadflag)($v0)
    /* 1AC80 80154878 00000000 */  nop
    /* 1AC84 8015487C 05004010 */  beqz       $v0, .L80154894
    /* 1AC88 80154880 00000000 */   nop
    /* 1AC8C 80154884 1C18848F */  lw         $a0, %gp_rel(SP4x1)($gp)
    /* 1AC90 80154888 2018858F */  lw         $a1, %gp_rel(SP4y1)($gp)
    /* 1AC94 8015488C BD3D050C */  jal        DRLG_L4SetSPRoom__Fii
    /* 1AC98 80154890 00000000 */   nop
  .L80154894:
    /* 1AC9C 80154894 1280023C */  lui        $v0, %hi(currlevel)
    /* 1ACA0 80154898 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1ACA4 8015489C 00000000 */  nop
    /* 1ACA8 801548A0 03005614 */  bne        $v0, $s6, .L801548B0
    /* 1ACAC 801548A4 00000000 */   nop
    /* 1ACB0 801548A8 064D050C */  jal        DRLG_LoadDiabQuads__FUc
    /* 1ACB4 801548AC 01000424 */   addiu     $a0, $zero, 0x1
  .L801548B0:
    /* 1ACB8 801548B0 DC9E010C */  jal        QuestStatus__Fi
    /* 1ACBC 801548B4 0B000424 */   addiu     $a0, $zero, 0xB
    /* 1ACC0 801548B8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1ACC4 801548BC 5E004010 */  beqz       $v0, .L80154A38
    /* 1ACC8 801548C0 00000000 */   nop
    /* 1ACCC 801548C4 1A006016 */  bnez       $s3, .L80154930
    /* 1ACD0 801548C8 01000524 */   addiu     $a1, $zero, 0x1
    /* 1ACD4 801548CC 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1ACD8 801548D0 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1ACDC 801548D4 01000624 */  addiu      $a2, $zero, 0x1
    /* 1ACE0 801548D8 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1ACE4 801548DC 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1ACE8 801548E0 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1ACEC 801548E4 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1ACF0 801548E8 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1ACF4 801548EC 21204000 */  addu       $a0, $v0, $zero
    /* 1ACF8 801548F0 FF008230 */  andi       $v0, $a0, 0xFF
    /* 1ACFC 801548F4 FC004010 */  beqz       $v0, .L80154CE8
    /* 1AD00 801548F8 00000000 */   nop
    /* 1AD04 801548FC 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AD08 80154900 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AD0C 80154904 00000000 */  nop
    /* 1AD10 80154908 F7005514 */  bne        $v0, $s5, .L80154CE8
    /* 1AD14 8015490C 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AD18 80154910 1580043C */  lui        $a0, %hi(L4TWARP)
    /* 1AD1C 80154914 54F38424 */  addiu      $a0, $a0, %lo(L4TWARP)
    /* 1AD20 80154918 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AD24 8015491C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AD28 80154920 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AD2C 80154924 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AD30 80154928 37530508 */  j          .L80154CDC
    /* 1AD34 8015492C 1800B4AF */   sw        $s4, 0x18($sp)
  .L80154930:
    /* 1AD38 80154930 29007216 */  bne        $s3, $s2, .L801549D8
    /* 1AD3C 80154934 01000624 */   addiu     $a2, $zero, 0x1
    /* 1AD40 80154938 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1AD44 8015493C 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1AD48 80154940 01000524 */  addiu      $a1, $zero, 0x1
    /* 1AD4C 80154944 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AD50 80154948 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AD54 8015494C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AD58 80154950 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1AD5C 80154954 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1AD60 80154958 21204000 */  addu       $a0, $v0, $zero
    /* 1AD64 8015495C FF008230 */  andi       $v0, $a0, 0xFF
    /* 1AD68 80154960 0F004010 */  beqz       $v0, .L801549A0
    /* 1AD6C 80154964 00000000 */   nop
    /* 1AD70 80154968 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AD74 8015496C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AD78 80154970 00000000 */  nop
    /* 1AD7C 80154974 0A005514 */  bne        $v0, $s5, .L801549A0
    /* 1AD80 80154978 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AD84 8015497C 1580043C */  lui        $a0, %hi(L4TWARP)
    /* 1AD88 80154980 54F38424 */  addiu      $a0, $a0, %lo(L4TWARP)
    /* 1AD8C 80154984 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AD90 80154988 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AD94 8015498C 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AD98 80154990 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AD9C 80154994 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1ADA0 80154998 1800B4AF */   sw        $s4, 0x18($sp)
    /* 1ADA4 8015499C 21204000 */  addu       $a0, $v0, $zero
  .L801549A0:
    /* 1ADA8 801549A0 1280023C */  lui        $v0, %hi(setpc_x)
    /* 1ADAC 801549A4 E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 1ADB0 801549A8 1280033C */  lui        $v1, %hi(setpc_y)
    /* 1ADB4 801549AC E8C0638C */  lw         $v1, %lo(setpc_y)($v1)
    /* 1ADB8 801549B0 40100200 */  sll        $v0, $v0, 1
    /* 1ADBC 801549B4 16004224 */  addiu      $v0, $v0, 0x16
    /* 1ADC0 801549B8 40180300 */  sll        $v1, $v1, 1
    /* 1ADC4 801549BC 16006324 */  addiu      $v1, $v1, 0x16
    /* 1ADC8 801549C0 1280013C */  lui        $at, %hi(ViewX)
    /* 1ADCC 801549C4 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 1ADD0 801549C8 1280013C */  lui        $at, %hi(ViewY)
    /* 1ADD4 801549CC 18C123AC */  sw         $v1, %lo(ViewY)($at)
    /* 1ADD8 801549D0 72530508 */  j          .L80154DC8
    /* 1ADDC 801549D4 FF008230 */   andi      $v0, $a0, 0xFF
  .L801549D8:
    /* 1ADE0 801549D8 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1ADE4 801549DC 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1ADE8 801549E0 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1ADEC 801549E4 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1ADF0 801549E8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1ADF4 801549EC 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1ADF8 801549F0 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1ADFC 801549F4 21204000 */  addu       $a0, $v0, $zero
    /* 1AE00 801549F8 FF008230 */  andi       $v0, $a0, 0xFF
    /* 1AE04 801549FC BA004010 */  beqz       $v0, .L80154CE8
    /* 1AE08 80154A00 00000000 */   nop
    /* 1AE0C 80154A04 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AE10 80154A08 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AE14 80154A0C 00000000 */  nop
    /* 1AE18 80154A10 B5005514 */  bne        $v0, $s5, .L80154CE8
    /* 1AE1C 80154A14 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AE20 80154A18 1580043C */  lui        $a0, %hi(L4TWARP)
    /* 1AE24 80154A1C 54F38424 */  addiu      $a0, $a0, %lo(L4TWARP)
    /* 1AE28 80154A20 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AE2C 80154A24 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AE30 80154A28 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AE34 80154A2C 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1AE38 80154A30 37530508 */  j          .L80154CDC
    /* 1AE3C 80154A34 1800B4AF */   sw        $s4, 0x18($sp)
  .L80154A38:
    /* 1AE40 80154A38 1280033C */  lui        $v1, %hi(currlevel)
    /* 1AE44 80154A3C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1AE48 80154A40 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1AE4C 80154A44 82006210 */  beq        $v1, $v0, .L80154C50
    /* 1AE50 80154A48 00000000 */   nop
    /* 1AE54 80154A4C 2B006016 */  bnez       $s3, .L80154AFC
    /* 1AE58 80154A50 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AE5C 80154A54 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1AE60 80154A58 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1AE64 80154A5C 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AE68 80154A60 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AE6C 80154A64 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AE70 80154A68 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1AE74 80154A6C 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1AE78 80154A70 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1AE7C 80154A74 21204000 */  addu       $a0, $v0, $zero
    /* 1AE80 80154A78 FF008230 */  andi       $v0, $a0, 0xFF
    /* 1AE84 80154A7C 9A004010 */  beqz       $v0, .L80154CE8
    /* 1AE88 80154A80 00000000 */   nop
    /* 1AE8C 80154A84 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AE90 80154A88 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AE94 80154A8C 00000000 */  nop
    /* 1AE98 80154A90 0A005610 */  beq        $v0, $s6, .L80154ABC
    /* 1AE9C 80154A94 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AEA0 80154A98 1580043C */  lui        $a0, %hi(L4DSTAIRS)
    /* 1AEA4 80154A9C 80F38424 */  addiu      $a0, $a0, %lo(L4DSTAIRS)
    /* 1AEA8 80154AA0 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AEAC 80154AA4 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AEB0 80154AA8 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AEB4 80154AAC 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AEB8 80154AB0 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1AEBC 80154AB4 1800B2AF */   sw        $s2, 0x18($sp)
    /* 1AEC0 80154AB8 21204000 */  addu       $a0, $v0, $zero
  .L80154ABC:
    /* 1AEC4 80154ABC FF008230 */  andi       $v0, $a0, 0xFF
    /* 1AEC8 80154AC0 89004010 */  beqz       $v0, .L80154CE8
    /* 1AECC 80154AC4 00000000 */   nop
    /* 1AED0 80154AC8 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AED4 80154ACC 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AED8 80154AD0 00000000 */  nop
    /* 1AEDC 80154AD4 84005514 */  bne        $v0, $s5, .L80154CE8
    /* 1AEE0 80154AD8 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AEE4 80154ADC 1580043C */  lui        $a0, %hi(L4TWARP)
    /* 1AEE8 80154AE0 54F38424 */  addiu      $a0, $a0, %lo(L4TWARP)
    /* 1AEEC 80154AE4 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AEF0 80154AE8 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AEF4 80154AEC 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AEF8 80154AF0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AEFC 80154AF4 37530508 */  j          .L80154CDC
    /* 1AF00 80154AF8 1800B4AF */   sw        $s4, 0x18($sp)
  .L80154AFC:
    /* 1AF04 80154AFC 2B007216 */  bne        $s3, $s2, .L80154BAC
    /* 1AF08 80154B00 01000624 */   addiu     $a2, $zero, 0x1
    /* 1AF0C 80154B04 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1AF10 80154B08 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1AF14 80154B0C 01000524 */  addiu      $a1, $zero, 0x1
    /* 1AF18 80154B10 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AF1C 80154B14 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AF20 80154B18 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AF24 80154B1C 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1AF28 80154B20 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1AF2C 80154B24 21204000 */  addu       $a0, $v0, $zero
    /* 1AF30 80154B28 FF008230 */  andi       $v0, $a0, 0xFF
    /* 1AF34 80154B2C 9F004010 */  beqz       $v0, .L80154DAC
    /* 1AF38 80154B30 00000000 */   nop
    /* 1AF3C 80154B34 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AF40 80154B38 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AF44 80154B3C 00000000 */  nop
    /* 1AF48 80154B40 0A005610 */  beq        $v0, $s6, .L80154B6C
    /* 1AF4C 80154B44 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AF50 80154B48 1580043C */  lui        $a0, %hi(L4DSTAIRS)
    /* 1AF54 80154B4C 80F38424 */  addiu      $a0, $a0, %lo(L4DSTAIRS)
    /* 1AF58 80154B50 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AF5C 80154B54 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AF60 80154B58 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AF64 80154B5C 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1AF68 80154B60 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1AF6C 80154B64 1800B2AF */   sw        $s2, 0x18($sp)
    /* 1AF70 80154B68 21204000 */  addu       $a0, $v0, $zero
  .L80154B6C:
    /* 1AF74 80154B6C FF008230 */  andi       $v0, $a0, 0xFF
    /* 1AF78 80154B70 8E004010 */  beqz       $v0, .L80154DAC
    /* 1AF7C 80154B74 00000000 */   nop
    /* 1AF80 80154B78 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AF84 80154B7C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AF88 80154B80 00000000 */  nop
    /* 1AF8C 80154B84 89005514 */  bne        $v0, $s5, .L80154DAC
    /* 1AF90 80154B88 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AF94 80154B8C 1580043C */  lui        $a0, %hi(L4TWARP)
    /* 1AF98 80154B90 54F38424 */  addiu      $a0, $a0, %lo(L4TWARP)
    /* 1AF9C 80154B94 01000624 */  addiu      $a2, $zero, 0x1
    /* 1AFA0 80154B98 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AFA4 80154B9C 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AFA8 80154BA0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AFAC 80154BA4 68530508 */  j          .L80154DA0
    /* 1AFB0 80154BA8 1800B4AF */   sw        $s4, 0x18($sp)
  .L80154BAC:
    /* 1AFB4 80154BAC 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1AFB8 80154BB0 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1AFBC 80154BB4 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1AFC0 80154BB8 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1AFC4 80154BBC 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1AFC8 80154BC0 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1AFCC 80154BC4 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1AFD0 80154BC8 21204000 */  addu       $a0, $v0, $zero
    /* 1AFD4 80154BCC FF008230 */  andi       $v0, $a0, 0xFF
    /* 1AFD8 80154BD0 45004010 */  beqz       $v0, .L80154CE8
    /* 1AFDC 80154BD4 00000000 */   nop
    /* 1AFE0 80154BD8 1280023C */  lui        $v0, %hi(currlevel)
    /* 1AFE4 80154BDC 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1AFE8 80154BE0 00000000 */  nop
    /* 1AFEC 80154BE4 0A005610 */  beq        $v0, $s6, .L80154C10
    /* 1AFF0 80154BE8 01000524 */   addiu     $a1, $zero, 0x1
    /* 1AFF4 80154BEC 1580043C */  lui        $a0, %hi(L4DSTAIRS)
    /* 1AFF8 80154BF0 80F38424 */  addiu      $a0, $a0, %lo(L4DSTAIRS)
    /* 1AFFC 80154BF4 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B000 80154BF8 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1B004 80154BFC 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B008 80154C00 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1B00C 80154C04 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1B010 80154C08 1800B2AF */   sw        $s2, 0x18($sp)
    /* 1B014 80154C0C 21204000 */  addu       $a0, $v0, $zero
  .L80154C10:
    /* 1B018 80154C10 FF008230 */  andi       $v0, $a0, 0xFF
    /* 1B01C 80154C14 34004010 */  beqz       $v0, .L80154CE8
    /* 1B020 80154C18 00000000 */   nop
    /* 1B024 80154C1C 1280023C */  lui        $v0, %hi(currlevel)
    /* 1B028 80154C20 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 1B02C 80154C24 00000000 */  nop
    /* 1B030 80154C28 2F005514 */  bne        $v0, $s5, .L80154CE8
    /* 1B034 80154C2C 01000524 */   addiu     $a1, $zero, 0x1
    /* 1B038 80154C30 1580043C */  lui        $a0, %hi(L4TWARP)
    /* 1B03C 80154C34 54F38424 */  addiu      $a0, $a0, %lo(L4TWARP)
    /* 1B040 80154C38 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B044 80154C3C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1B048 80154C40 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B04C 80154C44 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1B050 80154C48 37530508 */  j          .L80154CDC
    /* 1B054 80154C4C 1800B4AF */   sw        $s4, 0x18($sp)
  .L80154C50:
    /* 1B058 80154C50 2D006016 */  bnez       $s3, .L80154D08
    /* 1B05C 80154C54 01000524 */   addiu     $a1, $zero, 0x1
    /* 1B060 80154C58 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1B064 80154C5C 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1B068 80154C60 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B06C 80154C64 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1B070 80154C68 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B074 80154C6C 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1B078 80154C70 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1B07C 80154C74 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1B080 80154C78 21204000 */  addu       $a0, $v0, $zero
    /* 1B084 80154C7C FF008230 */  andi       $v0, $a0, 0xFF
    /* 1B088 80154C80 19004010 */  beqz       $v0, .L80154CE8
    /* 1B08C 80154C84 00000000 */   nop
    /* 1B090 80154C88 1280023C */  lui        $v0, %hi(gbMaxPlayers)
    /* 1B094 80154C8C A2B94290 */  lbu        $v0, %lo(gbMaxPlayers)($v0)
    /* 1B098 80154C90 00000000 */  nop
    /* 1B09C 80154C94 06005214 */  bne        $v0, $s2, .L80154CB0
    /* 1B0A0 80154C98 02000224 */   addiu     $v0, $zero, 0x2
    /* 1B0A4 80154C9C 0E80033C */  lui        $v1, %hi(quests + 0x66)
    /* 1B0A8 80154CA0 A6DA6390 */  lbu        $v1, %lo(quests + 0x66)($v1)
    /* 1B0AC 80154CA4 00000000 */  nop
    /* 1B0B0 80154CA8 05006214 */  bne        $v1, $v0, .L80154CC0
    /* 1B0B4 80154CAC 01000524 */   addiu     $a1, $zero, 0x1
  .L80154CB0:
    /* 1B0B8 80154CB0 1580043C */  lui        $a0, %hi(L4PENTA2)
    /* 1B0BC 80154CB4 E8F38424 */  addiu      $a0, $a0, %lo(L4PENTA2)
    /* 1B0C0 80154CB8 32530508 */  j          .L80154CC8
    /* 1B0C4 80154CBC 01000524 */   addiu     $a1, $zero, 0x1
  .L80154CC0:
    /* 1B0C8 80154CC0 1580043C */  lui        $a0, %hi(L4PENTA)
    /* 1B0CC 80154CC4 B4F38424 */  addiu      $a0, $a0, %lo(L4PENTA)
  .L80154CC8:
    /* 1B0D0 80154CC8 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B0D4 80154CCC FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1B0D8 80154CD0 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B0DC 80154CD4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1B0E0 80154CD8 1800B2AF */  sw         $s2, 0x18($sp)
  .L80154CDC:
    /* 1B0E4 80154CDC 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1B0E8 80154CE0 00000000 */   nop
    /* 1B0EC 80154CE4 21204000 */  addu       $a0, $v0, $zero
  .L80154CE8:
    /* 1B0F0 80154CE8 1280023C */  lui        $v0, %hi(ViewX)
    /* 1B0F4 80154CEC 14C1428C */  lw         $v0, %lo(ViewX)($v0)
    /* 1B0F8 80154CF0 00000000 */  nop
    /* 1B0FC 80154CF4 01004224 */  addiu      $v0, $v0, 0x1
    /* 1B100 80154CF8 1280013C */  lui        $at, %hi(ViewX)
    /* 1B104 80154CFC 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 1B108 80154D00 72530508 */  j          .L80154DC8
    /* 1B10C 80154D04 FF008230 */   andi      $v0, $a0, 0xFF
  .L80154D08:
    /* 1B110 80154D08 1580043C */  lui        $a0, %hi(L4USTAIRS)
    /* 1B114 80154D0C 28F38424 */  addiu      $a0, $a0, %lo(L4USTAIRS)
    /* 1B118 80154D10 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B11C 80154D14 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1B120 80154D18 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B124 80154D1C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 1B128 80154D20 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1B12C 80154D24 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1B130 80154D28 21204000 */  addu       $a0, $v0, $zero
    /* 1B134 80154D2C FF008230 */  andi       $v0, $a0, 0xFF
    /* 1B138 80154D30 1E004010 */  beqz       $v0, .L80154DAC
    /* 1B13C 80154D34 00000000 */   nop
    /* 1B140 80154D38 1280083C */  lui        $t0, %hi(gbMaxPlayers)
    /* 1B144 80154D3C A2B90891 */  lbu        $t0, %lo(gbMaxPlayers)($t0)
    /* 1B148 80154D40 00000000 */  nop
    /* 1B14C 80154D44 06001215 */  bne        $t0, $s2, .L80154D60
    /* 1B150 80154D48 02000224 */   addiu     $v0, $zero, 0x2
    /* 1B154 80154D4C 0E80033C */  lui        $v1, %hi(quests + 0x66)
    /* 1B158 80154D50 A6DA6390 */  lbu        $v1, %lo(quests + 0x66)($v1)
    /* 1B15C 80154D54 00000000 */  nop
    /* 1B160 80154D58 0A006214 */  bne        $v1, $v0, .L80154D84
    /* 1B164 80154D5C 01000524 */   addiu     $a1, $zero, 0x1
  .L80154D60:
    /* 1B168 80154D60 1580043C */  lui        $a0, %hi(L4PENTA2)
    /* 1B16C 80154D64 E8F38424 */  addiu      $a0, $a0, %lo(L4PENTA2)
    /* 1B170 80154D68 01000524 */  addiu      $a1, $zero, 0x1
    /* 1B174 80154D6C 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B178 80154D70 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1B17C 80154D74 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B180 80154D78 1400B2AF */  sw         $s2, 0x14($sp)
    /* 1B184 80154D7C 68530508 */  j          .L80154DA0
    /* 1B188 80154D80 1800B2AF */   sw        $s2, 0x18($sp)
  .L80154D84:
    /* 1B18C 80154D84 1580043C */  lui        $a0, %hi(L4PENTA)
    /* 1B190 80154D88 B4F38424 */  addiu      $a0, $a0, %lo(L4PENTA)
    /* 1B194 80154D8C 01000624 */  addiu      $a2, $zero, 0x1
    /* 1B198 80154D90 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1B19C 80154D94 1000B1AF */  sw         $s1, 0x10($sp)
    /* 1B1A0 80154D98 1400A8AF */  sw         $t0, 0x14($sp)
    /* 1B1A4 80154D9C 1800A8AF */  sw         $t0, 0x18($sp)
  .L80154DA0:
    /* 1B1A8 80154DA0 854D050C */  jal        DRLG_L4PlaceMiniSet__FPCUciiiiii
    /* 1B1AC 80154DA4 00000000 */   nop
    /* 1B1B0 80154DA8 21204000 */  addu       $a0, $v0, $zero
  .L80154DAC:
    /* 1B1B4 80154DAC 1280023C */  lui        $v0, %hi(ViewY)
    /* 1B1B8 80154DB0 18C1428C */  lw         $v0, %lo(ViewY)($v0)
    /* 1B1BC 80154DB4 00000000 */  nop
    /* 1B1C0 80154DB8 01004224 */  addiu      $v0, $v0, 0x1
    /* 1B1C4 80154DBC 1280013C */  lui        $at, %hi(ViewY)
    /* 1B1C8 80154DC0 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* 1B1CC 80154DC4 FF008230 */  andi       $v0, $a0, 0xFF
  .L80154DC8:
    /* 1B1D0 80154DC8 54FE4010 */  beqz       $v0, .L8015471C
    /* 1B1D4 80154DCC 00000000 */   nop
    /* 1B1D8 80154DD0 6351050C */  jal        DRLG_L4GeneralFix__Fv
    /* 1B1DC 80154DD4 00000000 */   nop
    /* 1B1E0 80154DD8 1280033C */  lui        $v1, %hi(currlevel)
    /* 1B1E4 80154DDC 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1B1E8 80154DE0 10000224 */  addiu      $v0, $zero, 0x10
    /* 1B1EC 80154DE4 07006210 */  beq        $v1, $v0, .L80154E04
    /* 1B1F0 80154DE8 01000224 */   addiu     $v0, $zero, 0x1
    /* 1B1F4 80154DEC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1B1F8 80154DF0 07000424 */  addiu      $a0, $zero, 0x7
    /* 1B1FC 80154DF4 0A000524 */  addiu      $a1, $zero, 0xA
    /* 1B200 80154DF8 06000624 */  addiu      $a2, $zero, 0x6
    /* 1B204 80154DFC AE6D050C */  jal        DRLG_PlaceThemeRooms__FiiiiUc
    /* 1B208 80154E00 08000724 */   addiu     $a3, $zero, 0x8
  .L80154E04:
    /* 1B20C 80154E04 2A3D050C */  jal        DRLG_L4Shadows__Fv
    /* 1B210 80154E08 00000000 */   nop
    /* 1B214 80154E0C 8C51050C */  jal        DRLG_L4SetWalls__Fv
    /* 1B218 80154E10 00000000 */   nop
    /* 1B21C 80154E14 2F51050C */  jal        DRLG_L4Corners__Fv
    /* 1B220 80154E18 00000000 */   nop
    /* 1B224 80154E1C 5F49050C */  jal        DRLG_L4Subs__Fv
    /* 1B228 80154E20 00000000 */   nop
    /* 1B22C 80154E24 ABF3040C */  jal        DRLG_Init_Globals__Fv
    /* 1B230 80154E28 00000000 */   nop
    /* 1B234 80154E2C DC9E010C */  jal        QuestStatus__Fi
    /* 1B238 80154E30 0B000424 */   addiu     $a0, $zero, 0xB
    /* 1B23C 80154E34 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1B240 80154E38 17004010 */  beqz       $v0, .L80154E98
    /* 1B244 80154E3C 00000000 */   nop
    /* 1B248 80154E40 21880000 */  addu       $s1, $zero, $zero
    /* 1B24C 80154E44 0E80083C */  lui        $t0, %hi(pdungeon)
    /* 1B250 80154E48 C4520825 */  addiu      $t0, $t0, %lo(pdungeon)
    /* 1B254 80154E4C 0E80073C */  lui        $a3, %hi(dungeon)
    /* 1B258 80154E50 C440E724 */  addiu      $a3, $a3, %lo(dungeon)
  .L80154E54:
    /* 1B25C 80154E54 21800000 */  addu       $s0, $zero, $zero
    /* 1B260 80154E58 40301100 */  sll        $a2, $s1, 1
    /* 1B264 80154E5C 2128E000 */  addu       $a1, $a3, $zero
    /* 1B268 80154E60 21200001 */  addu       $a0, $t0, $zero
  .L80154E64:
    /* 1B26C 80154E64 2110C500 */  addu       $v0, $a2, $a1
    /* 1B270 80154E68 6000A524 */  addiu      $a1, $a1, 0x60
    /* 1B274 80154E6C 21189100 */  addu       $v1, $a0, $s1
    /* 1B278 80154E70 00004294 */  lhu        $v0, 0x0($v0)
    /* 1B27C 80154E74 01001026 */  addiu      $s0, $s0, 0x1
    /* 1B280 80154E78 000062A0 */  sb         $v0, 0x0($v1)
    /* 1B284 80154E7C 2800022A */  slti       $v0, $s0, 0x28
    /* 1B288 80154E80 F8FF4014 */  bnez       $v0, .L80154E64
    /* 1B28C 80154E84 28008424 */   addiu     $a0, $a0, 0x28
    /* 1B290 80154E88 01003126 */  addiu      $s1, $s1, 0x1
    /* 1B294 80154E8C 2800222A */  slti       $v0, $s1, 0x28
    /* 1B298 80154E90 F0FF4014 */  bnez       $v0, .L80154E54
    /* 1B29C 80154E94 00000000 */   nop
  .L80154E98:
    /* 1B2A0 80154E98 1C18848F */  lw         $a0, %gp_rel(SP4x1)($gp)
    /* 1B2A4 80154E9C 2018858F */  lw         $a1, %gp_rel(SP4y1)($gp)
    /* 1B2A8 80154EA0 CD7C050C */  jal        DRLG_CheckQuests__Fii
    /* 1B2AC 80154EA4 00000000 */   nop
    /* 1B2B0 80154EA8 1280033C */  lui        $v1, %hi(currlevel)
    /* 1B2B4 80154EAC 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1B2B8 80154EB0 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1B2BC 80154EB4 25006214 */  bne        $v1, $v0, .L80154F4C
    /* 1B2C0 80154EB8 10000224 */   addiu     $v0, $zero, 0x10
    /* 1B2C4 80154EBC 21880000 */  addu       $s1, $zero, $zero
    /* 1B2C8 80154EC0 0E80153C */  lui        $s5, %hi(dungeon)
    /* 1B2CC 80154EC4 C440B526 */  addiu      $s5, $s5, %lo(dungeon)
  .L80154EC8:
    /* 1B2D0 80154EC8 21800000 */  addu       $s0, $zero, $zero
    /* 1B2D4 80154ECC FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 1B2D8 80154ED0 21A0A002 */  addu       $s4, $s5, $zero
  .L80154ED4:
    /* 1B2DC 80154ED4 40101100 */  sll        $v0, $s1, 1
    /* 1B2E0 80154ED8 21905400 */  addu       $s2, $v0, $s4
    /* 1B2E4 80154EDC 00004396 */  lhu        $v1, 0x0($s2)
    /* 1B2E8 80154EE0 62000224 */  addiu      $v0, $zero, 0x62
    /* 1B2EC 80154EE4 08006214 */  bne        $v1, $v0, .L80154F08
    /* 1B2F0 80154EE8 6B000224 */   addiu     $v0, $zero, 0x6B
    /* 1B2F4 80154EEC 21206002 */  addu       $a0, $s3, $zero
    /* 1B2F8 80154EF0 FFFF2526 */  addiu      $a1, $s1, -0x1
    /* 1B2FC 80154EF4 05000624 */  addiu      $a2, $zero, 0x5
    /* 1B300 80154EF8 D768050C */  jal        Make_SetPC__Fiiii
    /* 1B304 80154EFC 05000724 */   addiu     $a3, $zero, 0x5
    /* 1B308 80154F00 00004396 */  lhu        $v1, 0x0($s2)
    /* 1B30C 80154F04 6B000224 */  addiu      $v0, $zero, 0x6B
  .L80154F08:
    /* 1B310 80154F08 05006214 */  bne        $v1, $v0, .L80154F20
    /* 1B314 80154F0C 21206002 */   addu      $a0, $s3, $zero
    /* 1B318 80154F10 FFFF2526 */  addiu      $a1, $s1, -0x1
    /* 1B31C 80154F14 05000624 */  addiu      $a2, $zero, 0x5
    /* 1B320 80154F18 D768050C */  jal        Make_SetPC__Fiiii
    /* 1B324 80154F1C 05000724 */   addiu     $a3, $zero, 0x5
  .L80154F20:
    /* 1B328 80154F20 01007326 */  addiu      $s3, $s3, 0x1
    /* 1B32C 80154F24 01001026 */  addiu      $s0, $s0, 0x1
    /* 1B330 80154F28 2800022A */  slti       $v0, $s0, 0x28
    /* 1B334 80154F2C E9FF4014 */  bnez       $v0, .L80154ED4
    /* 1B338 80154F30 60009426 */   addiu     $s4, $s4, 0x60
    /* 1B33C 80154F34 01003126 */  addiu      $s1, $s1, 0x1
    /* 1B340 80154F38 2800222A */  slti       $v0, $s1, 0x28
    /* 1B344 80154F3C E2FF4014 */  bnez       $v0, .L80154EC8
    /* 1B348 80154F40 10000224 */   addiu     $v0, $zero, 0x10
    /* 1B34C 80154F44 1280033C */  lui        $v1, %hi(currlevel)
    /* 1B350 80154F48 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
  .L80154F4C:
    /* 1B354 80154F4C 00000000 */  nop
    /* 1B358 80154F50 18006214 */  bne        $v1, $v0, .L80154FB4
    /* 1B35C 80154F54 21880000 */   addu      $s1, $zero, $zero
    /* 1B360 80154F58 0E80083C */  lui        $t0, %hi(pdungeon)
    /* 1B364 80154F5C C4520825 */  addiu      $t0, $t0, %lo(pdungeon)
    /* 1B368 80154F60 0E80073C */  lui        $a3, %hi(dungeon)
    /* 1B36C 80154F64 C440E724 */  addiu      $a3, $a3, %lo(dungeon)
  .L80154F68:
    /* 1B370 80154F68 21800000 */  addu       $s0, $zero, $zero
    /* 1B374 80154F6C 40301100 */  sll        $a2, $s1, 1
    /* 1B378 80154F70 2128E000 */  addu       $a1, $a3, $zero
    /* 1B37C 80154F74 21200001 */  addu       $a0, $t0, $zero
  .L80154F78:
    /* 1B380 80154F78 2110C500 */  addu       $v0, $a2, $a1
    /* 1B384 80154F7C 6000A524 */  addiu      $a1, $a1, 0x60
    /* 1B388 80154F80 21189100 */  addu       $v1, $a0, $s1
    /* 1B38C 80154F84 00004294 */  lhu        $v0, 0x0($v0)
    /* 1B390 80154F88 01001026 */  addiu      $s0, $s0, 0x1
    /* 1B394 80154F8C 000062A0 */  sb         $v0, 0x0($v1)
    /* 1B398 80154F90 2800022A */  slti       $v0, $s0, 0x28
    /* 1B39C 80154F94 F8FF4014 */  bnez       $v0, .L80154F78
    /* 1B3A0 80154F98 28008424 */   addiu     $a0, $a0, 0x28
    /* 1B3A4 80154F9C 01003126 */  addiu      $s1, $s1, 0x1
    /* 1B3A8 80154FA0 2800222A */  slti       $v0, $s1, 0x28
    /* 1B3AC 80154FA4 F0FF4014 */  bnez       $v0, .L80154F68
    /* 1B3B0 80154FA8 00000000 */   nop
    /* 1B3B4 80154FAC 064D050C */  jal        DRLG_LoadDiabQuads__FUc
    /* 1B3B8 80154FB0 21200000 */   addu      $a0, $zero, $zero
  .L80154FB4:
    /* 1B3BC 80154FB4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 1B3C0 80154FB8 3800B68F */  lw         $s6, 0x38($sp)
    /* 1B3C4 80154FBC 3400B58F */  lw         $s5, 0x34($sp)
    /* 1B3C8 80154FC0 3000B48F */  lw         $s4, 0x30($sp)
    /* 1B3CC 80154FC4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 1B3D0 80154FC8 2800B28F */  lw         $s2, 0x28($sp)
    /* 1B3D4 80154FCC 2400B18F */  lw         $s1, 0x24($sp)
    /* 1B3D8 80154FD0 2000B08F */  lw         $s0, 0x20($sp)
    /* 1B3DC 80154FD4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1B3E0 80154FD8 0800E003 */  jr         $ra
    /* 1B3E4 80154FDC 00000000 */   nop
endlabel DRLG_L4__Fi
