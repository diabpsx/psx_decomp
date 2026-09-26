.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2__Fi, 0xA54

glabel DRLG_L2__Fi
    /* DAE8 801476E0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* DAEC 801476E4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* DAF0 801476E8 21988000 */  addu       $s3, $a0, $zero
    /* DAF4 801476EC 2000B0AF */  sw         $s0, 0x20($sp)
    /* DAF8 801476F0 21800000 */  addu       $s0, $zero, $zero
    /* DAFC 801476F4 2400B1AF */  sw         $s1, 0x24($sp)
    /* DB00 801476F8 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* DB04 801476FC 2800B2AF */  sw         $s2, 0x28($sp)
    /* DB08 80147700 01001224 */  addiu      $s2, $zero, 0x1
    /* DB0C 80147704 3400B5AF */  sw         $s5, 0x34($sp)
    /* DB10 80147708 05001524 */  addiu      $s5, $zero, 0x5
    /* DB14 8014770C 3000B4AF */  sw         $s4, 0x30($sp)
    /* DB18 80147710 06001424 */  addiu      $s4, $zero, 0x6
    /* DB1C 80147714 3800BFAF */  sw         $ra, 0x38($sp)
  .L80147718:
    /* DB20 80147718 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* DB24 8014771C 01000424 */   addiu     $a0, $zero, 0x1
    /* DB28 80147720 4C1780AF */  sw         $zero, %gp_rel(nRoomCnt)($gp)
    /* DB2C 80147724 910F050C */  jal        InitDungeon__Fv
    /* DB30 80147728 00000000 */   nop
    /* DB34 8014772C 1C68050C */  jal        DRLG_InitTrans__Fv
    /* DB38 80147730 00000000 */   nop
    /* DB3C 80147734 B918050C */  jal        CreateDungeon__Fv
    /* DB40 80147738 00000000 */   nop
    /* DB44 8014773C FF004230 */  andi       $v0, $v0, 0xFF
    /* DB48 80147740 92004010 */  beqz       $v0, .L8014798C
    /* DB4C 80147744 FF000232 */   andi      $v0, $s0, 0xFF
    /* DB50 80147748 2515050C */  jal        L2TileFix__Fv
    /* DB54 8014774C 00000000 */   nop
    /* DB58 80147750 1280023C */  lui        $v0, %hi(setloadflag)
    /* DB5C 80147754 F4C04290 */  lbu        $v0, %lo(setloadflag)($v0)
    /* DB60 80147758 00000000 */  nop
    /* DB64 8014775C 05004010 */  beqz       $v0, .L80147774
    /* DB68 80147760 00000000 */   nop
    /* DB6C 80147764 5017848F */  lw         $a0, %gp_rel(nSx1)($gp)
    /* DB70 80147768 5417858F */  lw         $a1, %gp_rel(nSy1)($gp)
    /* DB74 8014776C D70F050C */  jal        DRLG_L2SetRoom__Fii
    /* DB78 80147770 00000000 */   nop
  .L80147774:
    /* DB7C 80147774 1C1B050C */  jal        DRLG_L2FloodTVal__Fv
    /* DB80 80147778 00000000 */   nop
    /* DB84 8014777C 5A1B050C */  jal        DRLG_L2TransFix__Fv
    /* DB88 80147780 00000000 */   nop
    /* DB8C 80147784 25006016 */  bnez       $s3, .L8014781C
    /* DB90 80147788 01000524 */   addiu     $a1, $zero, 0x1
    /* DB94 8014778C 1480043C */  lui        $a0, %hi(USTAIRS)
    /* DB98 80147790 04168424 */  addiu      $a0, $a0, %lo(USTAIRS)
    /* DB9C 80147794 01000624 */  addiu      $a2, $zero, 0x1
    /* DBA0 80147798 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DBA4 8014779C 1000B1AF */  sw         $s1, 0x10($sp)
    /* DBA8 801477A0 1400B2AF */  sw         $s2, 0x14($sp)
    /* DBAC 801477A4 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DBB0 801477A8 1800A0AF */   sw        $zero, 0x18($sp)
    /* DBB4 801477AC 21804000 */  addu       $s0, $v0, $zero
    /* DBB8 801477B0 FF000232 */  andi       $v0, $s0, 0xFF
    /* DBBC 801477B4 6E004010 */  beqz       $v0, .L80147970
    /* DBC0 801477B8 01000524 */   addiu     $a1, $zero, 0x1
    /* DBC4 801477BC 1480043C */  lui        $a0, %hi(DSTAIRS)
    /* DBC8 801477C0 28168424 */  addiu      $a0, $a0, %lo(DSTAIRS)
    /* DBCC 801477C4 01000624 */  addiu      $a2, $zero, 0x1
    /* DBD0 801477C8 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DBD4 801477CC 1000B1AF */  sw         $s1, 0x10($sp)
    /* DBD8 801477D0 1400A0AF */  sw         $zero, 0x14($sp)
    /* DBDC 801477D4 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DBE0 801477D8 1800B2AF */   sw        $s2, 0x18($sp)
    /* DBE4 801477DC 21804000 */  addu       $s0, $v0, $zero
    /* DBE8 801477E0 FF000232 */  andi       $v0, $s0, 0xFF
    /* DBEC 801477E4 62004010 */  beqz       $v0, .L80147970
    /* DBF0 801477E8 00000000 */   nop
    /* DBF4 801477EC 1280023C */  lui        $v0, %hi(currlevel)
    /* DBF8 801477F0 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* DBFC 801477F4 00000000 */  nop
    /* DC00 801477F8 5D005514 */  bne        $v0, $s5, .L80147970
    /* DC04 801477FC 01000524 */   addiu     $a1, $zero, 0x1
    /* DC08 80147800 1480043C */  lui        $a0, %hi(WARPSTAIRS)
    /* DC0C 80147804 4C168424 */  addiu      $a0, $a0, %lo(WARPSTAIRS)
    /* DC10 80147808 01000624 */  addiu      $a2, $zero, 0x1
    /* DC14 8014780C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DC18 80147810 1000B1AF */  sw         $s1, 0x10($sp)
    /* DC1C 80147814 591E0508 */  j          .L80147964
    /* DC20 80147818 1400A0AF */   sw        $zero, 0x14($sp)
  .L8014781C:
    /* DC24 8014781C 2F007216 */  bne        $s3, $s2, .L801478DC
    /* DC28 80147820 01000624 */   addiu     $a2, $zero, 0x1
    /* DC2C 80147824 1480043C */  lui        $a0, %hi(USTAIRS)
    /* DC30 80147828 04168424 */  addiu      $a0, $a0, %lo(USTAIRS)
    /* DC34 8014782C 01000524 */  addiu      $a1, $zero, 0x1
    /* DC38 80147830 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DC3C 80147834 1000B1AF */  sw         $s1, 0x10($sp)
    /* DC40 80147838 1400A0AF */  sw         $zero, 0x14($sp)
    /* DC44 8014783C 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DC48 80147840 1800A0AF */   sw        $zero, 0x18($sp)
    /* DC4C 80147844 21804000 */  addu       $s0, $v0, $zero
    /* DC50 80147848 FF000232 */  andi       $v0, $s0, 0xFF
    /* DC54 8014784C 1B004010 */  beqz       $v0, .L801478BC
    /* DC58 80147850 01000524 */   addiu     $a1, $zero, 0x1
    /* DC5C 80147854 1480043C */  lui        $a0, %hi(DSTAIRS)
    /* DC60 80147858 28168424 */  addiu      $a0, $a0, %lo(DSTAIRS)
    /* DC64 8014785C 01000624 */  addiu      $a2, $zero, 0x1
    /* DC68 80147860 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DC6C 80147864 1000B1AF */  sw         $s1, 0x10($sp)
    /* DC70 80147868 1400B2AF */  sw         $s2, 0x14($sp)
    /* DC74 8014786C 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DC78 80147870 1800B2AF */   sw        $s2, 0x18($sp)
    /* DC7C 80147874 21804000 */  addu       $s0, $v0, $zero
    /* DC80 80147878 FF000232 */  andi       $v0, $s0, 0xFF
    /* DC84 8014787C 0F004010 */  beqz       $v0, .L801478BC
    /* DC88 80147880 00000000 */   nop
    /* DC8C 80147884 1280023C */  lui        $v0, %hi(currlevel)
    /* DC90 80147888 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* DC94 8014788C 00000000 */  nop
    /* DC98 80147890 0A005514 */  bne        $v0, $s5, .L801478BC
    /* DC9C 80147894 01000524 */   addiu     $a1, $zero, 0x1
    /* DCA0 80147898 1480043C */  lui        $a0, %hi(WARPSTAIRS)
    /* DCA4 8014789C 4C168424 */  addiu      $a0, $a0, %lo(WARPSTAIRS)
    /* DCA8 801478A0 01000624 */  addiu      $a2, $zero, 0x1
    /* DCAC 801478A4 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DCB0 801478A8 1000B1AF */  sw         $s1, 0x10($sp)
    /* DCB4 801478AC 1400A0AF */  sw         $zero, 0x14($sp)
    /* DCB8 801478B0 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DCBC 801478B4 1800B4AF */   sw        $s4, 0x18($sp)
    /* DCC0 801478B8 21804000 */  addu       $s0, $v0, $zero
  .L801478BC:
    /* DCC4 801478BC 1280023C */  lui        $v0, %hi(ViewX)
    /* DCC8 801478C0 14C1428C */  lw         $v0, %lo(ViewX)($v0)
    /* DCCC 801478C4 00000000 */  nop
    /* DCD0 801478C8 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* DCD4 801478CC 1280013C */  lui        $at, %hi(ViewX)
    /* DCD8 801478D0 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* DCDC 801478D4 631E0508 */  j          .L8014798C
    /* DCE0 801478D8 FF000232 */   andi      $v0, $s0, 0xFF
  .L801478DC:
    /* DCE4 801478DC 1480043C */  lui        $a0, %hi(USTAIRS)
    /* DCE8 801478E0 04168424 */  addiu      $a0, $a0, %lo(USTAIRS)
    /* DCEC 801478E4 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DCF0 801478E8 1000B1AF */  sw         $s1, 0x10($sp)
    /* DCF4 801478EC 1400A0AF */  sw         $zero, 0x14($sp)
    /* DCF8 801478F0 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DCFC 801478F4 1800A0AF */   sw        $zero, 0x18($sp)
    /* DD00 801478F8 21804000 */  addu       $s0, $v0, $zero
    /* DD04 801478FC FF000232 */  andi       $v0, $s0, 0xFF
    /* DD08 80147900 1B004010 */  beqz       $v0, .L80147970
    /* DD0C 80147904 01000524 */   addiu     $a1, $zero, 0x1
    /* DD10 80147908 1480043C */  lui        $a0, %hi(DSTAIRS)
    /* DD14 8014790C 28168424 */  addiu      $a0, $a0, %lo(DSTAIRS)
    /* DD18 80147910 01000624 */  addiu      $a2, $zero, 0x1
    /* DD1C 80147914 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DD20 80147918 1000B1AF */  sw         $s1, 0x10($sp)
    /* DD24 8014791C 1400A0AF */  sw         $zero, 0x14($sp)
    /* DD28 80147920 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DD2C 80147924 1800B2AF */   sw        $s2, 0x18($sp)
    /* DD30 80147928 21804000 */  addu       $s0, $v0, $zero
    /* DD34 8014792C FF000232 */  andi       $v0, $s0, 0xFF
    /* DD38 80147930 0F004010 */  beqz       $v0, .L80147970
    /* DD3C 80147934 00000000 */   nop
    /* DD40 80147938 1280023C */  lui        $v0, %hi(currlevel)
    /* DD44 8014793C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* DD48 80147940 00000000 */  nop
    /* DD4C 80147944 0A005514 */  bne        $v0, $s5, .L80147970
    /* DD50 80147948 01000524 */   addiu     $a1, $zero, 0x1
    /* DD54 8014794C 1480043C */  lui        $a0, %hi(WARPSTAIRS)
    /* DD58 80147950 4C168424 */  addiu      $a0, $a0, %lo(WARPSTAIRS)
    /* DD5C 80147954 01000624 */  addiu      $a2, $zero, 0x1
    /* DD60 80147958 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* DD64 8014795C 1000B1AF */  sw         $s1, 0x10($sp)
    /* DD68 80147960 1400B2AF */  sw         $s2, 0x14($sp)
  .L80147964:
    /* DD6C 80147964 020D050C */  jal        DRLG_L2PlaceMiniSet__FPUciiiiii
    /* DD70 80147968 1800B4AF */   sw        $s4, 0x18($sp)
    /* DD74 8014796C 21804000 */  addu       $s0, $v0, $zero
  .L80147970:
    /* DD78 80147970 1280023C */  lui        $v0, %hi(ViewY)
    /* DD7C 80147974 18C1428C */  lw         $v0, %lo(ViewY)($v0)
    /* DD80 80147978 00000000 */  nop
    /* DD84 8014797C FEFF4224 */  addiu      $v0, $v0, -0x2
    /* DD88 80147980 1280013C */  lui        $at, %hi(ViewY)
    /* DD8C 80147984 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* DD90 80147988 FF000232 */  andi       $v0, $s0, 0xFF
  .L8014798C:
    /* DD94 8014798C 62FF4010 */  beqz       $v0, .L80147718
    /* DD98 80147990 00000000 */   nop
    /* DD9C 80147994 3D1C050C */  jal        L2LockoutFix__Fv
    /* DDA0 80147998 00000000 */   nop
    /* DDA4 8014799C 1E1D050C */  jal        L2DoorFix__Fv
    /* DDA8 801479A0 00000000 */   nop
    /* DDAC 801479A4 E51B050C */  jal        L2DirtFix__Fv
    /* DDB0 801479A8 00000000 */   nop
    /* DDB4 801479AC 1000A0AF */  sw         $zero, 0x10($sp)
    /* DDB8 801479B0 06000424 */  addiu      $a0, $zero, 0x6
    /* DDBC 801479B4 0A000524 */  addiu      $a1, $zero, 0xA
    /* DDC0 801479B8 03000624 */  addiu      $a2, $zero, 0x3
    /* DDC4 801479BC AE6D050C */  jal        DRLG_PlaceThemeRooms__FiiiiUc
    /* DDC8 801479C0 21380000 */   addu      $a3, $zero, $zero
    /* DDCC 801479C4 1480043C */  lui        $a0, %hi(CTRDOOR1)
    /* DDD0 801479C8 0C178424 */  addiu      $a0, $a0, %lo(CTRDOOR1)
    /* DDD4 801479CC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DDD8 801479D0 64000524 */   addiu     $a1, $zero, 0x64
    /* DDDC 801479D4 1480043C */  lui        $a0, %hi(CTRDOOR2)
    /* DDE0 801479D8 20178424 */  addiu      $a0, $a0, %lo(CTRDOOR2)
    /* DDE4 801479DC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DDE8 801479E0 64000524 */   addiu     $a1, $zero, 0x64
    /* DDEC 801479E4 1480043C */  lui        $a0, %hi(CTRDOOR3)
    /* DDF0 801479E8 34178424 */  addiu      $a0, $a0, %lo(CTRDOOR3)
    /* DDF4 801479EC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DDF8 801479F0 64000524 */   addiu     $a1, $zero, 0x64
    /* DDFC 801479F4 1480043C */  lui        $a0, %hi(CTRDOOR4)
    /* DE00 801479F8 48178424 */  addiu      $a0, $a0, %lo(CTRDOOR4)
    /* DE04 801479FC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE08 80147A00 64000524 */   addiu     $a1, $zero, 0x64
    /* DE0C 80147A04 1480043C */  lui        $a0, %hi(CTRDOOR5)
    /* DE10 80147A08 5C178424 */  addiu      $a0, $a0, %lo(CTRDOOR5)
    /* DE14 80147A0C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE18 80147A10 64000524 */   addiu     $a1, $zero, 0x64
    /* DE1C 80147A14 1480043C */  lui        $a0, %hi(CTRDOOR6)
    /* DE20 80147A18 70178424 */  addiu      $a0, $a0, %lo(CTRDOOR6)
    /* DE24 80147A1C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE28 80147A20 64000524 */   addiu     $a1, $zero, 0x64
    /* DE2C 80147A24 1480043C */  lui        $a0, %hi(CTRDOOR7)
    /* DE30 80147A28 84178424 */  addiu      $a0, $a0, %lo(CTRDOOR7)
    /* DE34 80147A2C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE38 80147A30 64000524 */   addiu     $a1, $zero, 0x64
    /* DE3C 80147A34 1480043C */  lui        $a0, %hi(CTRDOOR8)
    /* DE40 80147A38 98178424 */  addiu      $a0, $a0, %lo(CTRDOOR8)
    /* DE44 80147A3C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE48 80147A40 64000524 */   addiu     $a1, $zero, 0x64
    /* DE4C 80147A44 1480043C */  lui        $a0, %hi(VARCH33)
    /* DE50 80147A48 E4128424 */  addiu      $a0, $a0, %lo(VARCH33)
    /* DE54 80147A4C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE58 80147A50 64000524 */   addiu     $a1, $zero, 0x64
    /* DE5C 80147A54 1480043C */  lui        $a0, %hi(VARCH34)
    /* DE60 80147A58 F8128424 */  addiu      $a0, $a0, %lo(VARCH34)
    /* DE64 80147A5C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE68 80147A60 64000524 */   addiu     $a1, $zero, 0x64
    /* DE6C 80147A64 1480043C */  lui        $a0, %hi(VARCH35)
    /* DE70 80147A68 0C138424 */  addiu      $a0, $a0, %lo(VARCH35)
    /* DE74 80147A6C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE78 80147A70 64000524 */   addiu     $a1, $zero, 0x64
    /* DE7C 80147A74 1480043C */  lui        $a0, %hi(VARCH36)
    /* DE80 80147A78 20138424 */  addiu      $a0, $a0, %lo(VARCH36)
    /* DE84 80147A7C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE88 80147A80 64000524 */   addiu     $a1, $zero, 0x64
    /* DE8C 80147A84 1480043C */  lui        $a0, %hi(VARCH37)
    /* DE90 80147A88 34138424 */  addiu      $a0, $a0, %lo(VARCH37)
    /* DE94 80147A8C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DE98 80147A90 64000524 */   addiu     $a1, $zero, 0x64
    /* DE9C 80147A94 1480043C */  lui        $a0, %hi(VARCH38)
    /* DEA0 80147A98 48138424 */  addiu      $a0, $a0, %lo(VARCH38)
    /* DEA4 80147A9C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DEA8 80147AA0 64000524 */   addiu     $a1, $zero, 0x64
    /* DEAC 80147AA4 1480043C */  lui        $a0, %hi(VARCH39)
    /* DEB0 80147AA8 5C138424 */  addiu      $a0, $a0, %lo(VARCH39)
    /* DEB4 80147AAC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DEB8 80147AB0 64000524 */   addiu     $a1, $zero, 0x64
    /* DEBC 80147AB4 1480043C */  lui        $a0, %hi(VARCH40)
    /* DEC0 80147AB8 70138424 */  addiu      $a0, $a0, %lo(VARCH40)
    /* DEC4 80147ABC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DEC8 80147AC0 64000524 */   addiu     $a1, $zero, 0x64
    /* DECC 80147AC4 1480043C */  lui        $a0, %hi(VARCH1)
    /* DED0 80147AC8 84108424 */  addiu      $a0, $a0, %lo(VARCH1)
    /* DED4 80147ACC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DED8 80147AD0 64000524 */   addiu     $a1, $zero, 0x64
    /* DEDC 80147AD4 1480043C */  lui        $a0, %hi(VARCH2)
    /* DEE0 80147AD8 98108424 */  addiu      $a0, $a0, %lo(VARCH2)
    /* DEE4 80147ADC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DEE8 80147AE0 64000524 */   addiu     $a1, $zero, 0x64
    /* DEEC 80147AE4 1480043C */  lui        $a0, %hi(VARCH3)
    /* DEF0 80147AE8 AC108424 */  addiu      $a0, $a0, %lo(VARCH3)
    /* DEF4 80147AEC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DEF8 80147AF0 64000524 */   addiu     $a1, $zero, 0x64
    /* DEFC 80147AF4 1480043C */  lui        $a0, %hi(VARCH4)
    /* DF00 80147AF8 C0108424 */  addiu      $a0, $a0, %lo(VARCH4)
    /* DF04 80147AFC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF08 80147B00 64000524 */   addiu     $a1, $zero, 0x64
    /* DF0C 80147B04 1480043C */  lui        $a0, %hi(VARCH5)
    /* DF10 80147B08 D4108424 */  addiu      $a0, $a0, %lo(VARCH5)
    /* DF14 80147B0C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF18 80147B10 64000524 */   addiu     $a1, $zero, 0x64
    /* DF1C 80147B14 1480043C */  lui        $a0, %hi(VARCH6)
    /* DF20 80147B18 E8108424 */  addiu      $a0, $a0, %lo(VARCH6)
    /* DF24 80147B1C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF28 80147B20 64000524 */   addiu     $a1, $zero, 0x64
    /* DF2C 80147B24 1480043C */  lui        $a0, %hi(VARCH7)
    /* DF30 80147B28 FC108424 */  addiu      $a0, $a0, %lo(VARCH7)
    /* DF34 80147B2C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF38 80147B30 64000524 */   addiu     $a1, $zero, 0x64
    /* DF3C 80147B34 1480043C */  lui        $a0, %hi(VARCH8)
    /* DF40 80147B38 10118424 */  addiu      $a0, $a0, %lo(VARCH8)
    /* DF44 80147B3C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF48 80147B40 64000524 */   addiu     $a1, $zero, 0x64
    /* DF4C 80147B44 1480043C */  lui        $a0, %hi(VARCH9)
    /* DF50 80147B48 24118424 */  addiu      $a0, $a0, %lo(VARCH9)
    /* DF54 80147B4C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF58 80147B50 64000524 */   addiu     $a1, $zero, 0x64
    /* DF5C 80147B54 1480043C */  lui        $a0, %hi(VARCH10)
    /* DF60 80147B58 38118424 */  addiu      $a0, $a0, %lo(VARCH10)
    /* DF64 80147B5C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF68 80147B60 64000524 */   addiu     $a1, $zero, 0x64
    /* DF6C 80147B64 1480043C */  lui        $a0, %hi(VARCH11)
    /* DF70 80147B68 4C118424 */  addiu      $a0, $a0, %lo(VARCH11)
    /* DF74 80147B6C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF78 80147B70 64000524 */   addiu     $a1, $zero, 0x64
    /* DF7C 80147B74 1480043C */  lui        $a0, %hi(VARCH12)
    /* DF80 80147B78 60118424 */  addiu      $a0, $a0, %lo(VARCH12)
    /* DF84 80147B7C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF88 80147B80 64000524 */   addiu     $a1, $zero, 0x64
    /* DF8C 80147B84 1480043C */  lui        $a0, %hi(VARCH13)
    /* DF90 80147B88 74118424 */  addiu      $a0, $a0, %lo(VARCH13)
    /* DF94 80147B8C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DF98 80147B90 64000524 */   addiu     $a1, $zero, 0x64
    /* DF9C 80147B94 1480043C */  lui        $a0, %hi(VARCH14)
    /* DFA0 80147B98 88118424 */  addiu      $a0, $a0, %lo(VARCH14)
    /* DFA4 80147B9C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DFA8 80147BA0 64000524 */   addiu     $a1, $zero, 0x64
    /* DFAC 80147BA4 1480043C */  lui        $a0, %hi(VARCH15)
    /* DFB0 80147BA8 9C118424 */  addiu      $a0, $a0, %lo(VARCH15)
    /* DFB4 80147BAC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DFB8 80147BB0 64000524 */   addiu     $a1, $zero, 0x64
    /* DFBC 80147BB4 1480043C */  lui        $a0, %hi(VARCH16)
    /* DFC0 80147BB8 B0118424 */  addiu      $a0, $a0, %lo(VARCH16)
    /* DFC4 80147BBC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DFC8 80147BC0 64000524 */   addiu     $a1, $zero, 0x64
    /* DFCC 80147BC4 1480043C */  lui        $a0, %hi(VARCH17)
    /* DFD0 80147BC8 C4118424 */  addiu      $a0, $a0, %lo(VARCH17)
    /* DFD4 80147BCC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DFD8 80147BD0 64000524 */   addiu     $a1, $zero, 0x64
    /* DFDC 80147BD4 1480043C */  lui        $a0, %hi(VARCH18)
    /* DFE0 80147BD8 D4118424 */  addiu      $a0, $a0, %lo(VARCH18)
    /* DFE4 80147BDC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DFE8 80147BE0 64000524 */   addiu     $a1, $zero, 0x64
    /* DFEC 80147BE4 1480043C */  lui        $a0, %hi(VARCH19)
    /* DFF0 80147BE8 E4118424 */  addiu      $a0, $a0, %lo(VARCH19)
    /* DFF4 80147BEC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* DFF8 80147BF0 64000524 */   addiu     $a1, $zero, 0x64
    /* DFFC 80147BF4 1480043C */  lui        $a0, %hi(VARCH20)
    /* E000 80147BF8 F4118424 */  addiu      $a0, $a0, %lo(VARCH20)
    /* E004 80147BFC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E008 80147C00 64000524 */   addiu     $a1, $zero, 0x64
    /* E00C 80147C04 1480043C */  lui        $a0, %hi(VARCH21)
    /* E010 80147C08 04128424 */  addiu      $a0, $a0, %lo(VARCH21)
    /* E014 80147C0C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E018 80147C10 64000524 */   addiu     $a1, $zero, 0x64
    /* E01C 80147C14 1480043C */  lui        $a0, %hi(VARCH22)
    /* E020 80147C18 14128424 */  addiu      $a0, $a0, %lo(VARCH22)
    /* E024 80147C1C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E028 80147C20 64000524 */   addiu     $a1, $zero, 0x64
    /* E02C 80147C24 1480043C */  lui        $a0, %hi(VARCH23)
    /* E030 80147C28 24128424 */  addiu      $a0, $a0, %lo(VARCH23)
    /* E034 80147C2C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E038 80147C30 64000524 */   addiu     $a1, $zero, 0x64
    /* E03C 80147C34 1480043C */  lui        $a0, %hi(VARCH24)
    /* E040 80147C38 34128424 */  addiu      $a0, $a0, %lo(VARCH24)
    /* E044 80147C3C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E048 80147C40 64000524 */   addiu     $a1, $zero, 0x64
    /* E04C 80147C44 1480043C */  lui        $a0, %hi(VARCH25)
    /* E050 80147C48 44128424 */  addiu      $a0, $a0, %lo(VARCH25)
    /* E054 80147C4C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E058 80147C50 64000524 */   addiu     $a1, $zero, 0x64
    /* E05C 80147C54 1480043C */  lui        $a0, %hi(VARCH26)
    /* E060 80147C58 58128424 */  addiu      $a0, $a0, %lo(VARCH26)
    /* E064 80147C5C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E068 80147C60 64000524 */   addiu     $a1, $zero, 0x64
    /* E06C 80147C64 1480043C */  lui        $a0, %hi(VARCH27)
    /* E070 80147C68 6C128424 */  addiu      $a0, $a0, %lo(VARCH27)
    /* E074 80147C6C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E078 80147C70 64000524 */   addiu     $a1, $zero, 0x64
    /* E07C 80147C74 1480043C */  lui        $a0, %hi(VARCH28)
    /* E080 80147C78 80128424 */  addiu      $a0, $a0, %lo(VARCH28)
    /* E084 80147C7C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E088 80147C80 64000524 */   addiu     $a1, $zero, 0x64
    /* E08C 80147C84 1480043C */  lui        $a0, %hi(VARCH29)
    /* E090 80147C88 94128424 */  addiu      $a0, $a0, %lo(VARCH29)
    /* E094 80147C8C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E098 80147C90 64000524 */   addiu     $a1, $zero, 0x64
    /* E09C 80147C94 1480043C */  lui        $a0, %hi(VARCH30)
    /* E0A0 80147C98 A8128424 */  addiu      $a0, $a0, %lo(VARCH30)
    /* E0A4 80147C9C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E0A8 80147CA0 64000524 */   addiu     $a1, $zero, 0x64
    /* E0AC 80147CA4 1480043C */  lui        $a0, %hi(VARCH31)
    /* E0B0 80147CA8 BC128424 */  addiu      $a0, $a0, %lo(VARCH31)
    /* E0B4 80147CAC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E0B8 80147CB0 64000524 */   addiu     $a1, $zero, 0x64
    /* E0BC 80147CB4 1480043C */  lui        $a0, %hi(VARCH32)
    /* E0C0 80147CB8 D0128424 */  addiu      $a0, $a0, %lo(VARCH32)
    /* E0C4 80147CBC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E0C8 80147CC0 64000524 */   addiu     $a1, $zero, 0x64
    /* E0CC 80147CC4 1480043C */  lui        $a0, %hi(HARCH1)
    /* E0D0 80147CC8 84138424 */  addiu      $a0, $a0, %lo(HARCH1)
    /* E0D4 80147CCC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E0D8 80147CD0 64000524 */   addiu     $a1, $zero, 0x64
    /* E0DC 80147CD4 1480043C */  lui        $a0, %hi(HARCH2)
    /* E0E0 80147CD8 94138424 */  addiu      $a0, $a0, %lo(HARCH2)
    /* E0E4 80147CDC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E0E8 80147CE0 64000524 */   addiu     $a1, $zero, 0x64
    /* E0EC 80147CE4 1480043C */  lui        $a0, %hi(HARCH3)
    /* E0F0 80147CE8 A4138424 */  addiu      $a0, $a0, %lo(HARCH3)
    /* E0F4 80147CEC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E0F8 80147CF0 64000524 */   addiu     $a1, $zero, 0x64
    /* E0FC 80147CF4 1480043C */  lui        $a0, %hi(HARCH4)
    /* E100 80147CF8 B4138424 */  addiu      $a0, $a0, %lo(HARCH4)
    /* E104 80147CFC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E108 80147D00 64000524 */   addiu     $a1, $zero, 0x64
    /* E10C 80147D04 1480043C */  lui        $a0, %hi(HARCH5)
    /* E110 80147D08 C4138424 */  addiu      $a0, $a0, %lo(HARCH5)
    /* E114 80147D0C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E118 80147D10 64000524 */   addiu     $a1, $zero, 0x64
    /* E11C 80147D14 1480043C */  lui        $a0, %hi(HARCH6)
    /* E120 80147D18 D4138424 */  addiu      $a0, $a0, %lo(HARCH6)
    /* E124 80147D1C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E128 80147D20 64000524 */   addiu     $a1, $zero, 0x64
    /* E12C 80147D24 1480043C */  lui        $a0, %hi(HARCH7)
    /* E130 80147D28 E4138424 */  addiu      $a0, $a0, %lo(HARCH7)
    /* E134 80147D2C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E138 80147D30 64000524 */   addiu     $a1, $zero, 0x64
    /* E13C 80147D34 1480043C */  lui        $a0, %hi(HARCH8)
    /* E140 80147D38 F4138424 */  addiu      $a0, $a0, %lo(HARCH8)
    /* E144 80147D3C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E148 80147D40 64000524 */   addiu     $a1, $zero, 0x64
    /* E14C 80147D44 1480043C */  lui        $a0, %hi(HARCH9)
    /* E150 80147D48 04148424 */  addiu      $a0, $a0, %lo(HARCH9)
    /* E154 80147D4C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E158 80147D50 64000524 */   addiu     $a1, $zero, 0x64
    /* E15C 80147D54 1480043C */  lui        $a0, %hi(HARCH10)
    /* E160 80147D58 14148424 */  addiu      $a0, $a0, %lo(HARCH10)
    /* E164 80147D5C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E168 80147D60 64000524 */   addiu     $a1, $zero, 0x64
    /* E16C 80147D64 1480043C */  lui        $a0, %hi(HARCH11)
    /* E170 80147D68 24148424 */  addiu      $a0, $a0, %lo(HARCH11)
    /* E174 80147D6C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E178 80147D70 64000524 */   addiu     $a1, $zero, 0x64
    /* E17C 80147D74 1480043C */  lui        $a0, %hi(HARCH12)
    /* E180 80147D78 34148424 */  addiu      $a0, $a0, %lo(HARCH12)
    /* E184 80147D7C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E188 80147D80 64000524 */   addiu     $a1, $zero, 0x64
    /* E18C 80147D84 1480043C */  lui        $a0, %hi(HARCH13)
    /* E190 80147D88 44148424 */  addiu      $a0, $a0, %lo(HARCH13)
    /* E194 80147D8C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E198 80147D90 64000524 */   addiu     $a1, $zero, 0x64
    /* E19C 80147D94 1480043C */  lui        $a0, %hi(HARCH14)
    /* E1A0 80147D98 54148424 */  addiu      $a0, $a0, %lo(HARCH14)
    /* E1A4 80147D9C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E1A8 80147DA0 64000524 */   addiu     $a1, $zero, 0x64
    /* E1AC 80147DA4 1480043C */  lui        $a0, %hi(HARCH15)
    /* E1B0 80147DA8 64148424 */  addiu      $a0, $a0, %lo(HARCH15)
    /* E1B4 80147DAC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E1B8 80147DB0 64000524 */   addiu     $a1, $zero, 0x64
    /* E1BC 80147DB4 1480043C */  lui        $a0, %hi(HARCH16)
    /* E1C0 80147DB8 74148424 */  addiu      $a0, $a0, %lo(HARCH16)
    /* E1C4 80147DBC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E1C8 80147DC0 64000524 */   addiu     $a1, $zero, 0x64
    /* E1CC 80147DC4 1480043C */  lui        $a0, %hi(HARCH17)
    /* E1D0 80147DC8 84148424 */  addiu      $a0, $a0, %lo(HARCH17)
    /* E1D4 80147DCC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E1D8 80147DD0 64000524 */   addiu     $a1, $zero, 0x64
    /* E1DC 80147DD4 1480043C */  lui        $a0, %hi(HARCH18)
    /* E1E0 80147DD8 94148424 */  addiu      $a0, $a0, %lo(HARCH18)
    /* E1E4 80147DDC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E1E8 80147DE0 64000524 */   addiu     $a1, $zero, 0x64
    /* E1EC 80147DE4 1480043C */  lui        $a0, %hi(HARCH19)
    /* E1F0 80147DE8 A4148424 */  addiu      $a0, $a0, %lo(HARCH19)
    /* E1F4 80147DEC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E1F8 80147DF0 64000524 */   addiu     $a1, $zero, 0x64
    /* E1FC 80147DF4 1480043C */  lui        $a0, %hi(HARCH20)
    /* E200 80147DF8 B4148424 */  addiu      $a0, $a0, %lo(HARCH20)
    /* E204 80147DFC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E208 80147E00 64000524 */   addiu     $a1, $zero, 0x64
    /* E20C 80147E04 1480043C */  lui        $a0, %hi(HARCH21)
    /* E210 80147E08 C4148424 */  addiu      $a0, $a0, %lo(HARCH21)
    /* E214 80147E0C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E218 80147E10 64000524 */   addiu     $a1, $zero, 0x64
    /* E21C 80147E14 1480043C */  lui        $a0, %hi(HARCH22)
    /* E220 80147E18 D4148424 */  addiu      $a0, $a0, %lo(HARCH22)
    /* E224 80147E1C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E228 80147E20 64000524 */   addiu     $a1, $zero, 0x64
    /* E22C 80147E24 1480043C */  lui        $a0, %hi(HARCH23)
    /* E230 80147E28 E4148424 */  addiu      $a0, $a0, %lo(HARCH23)
    /* E234 80147E2C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E238 80147E30 64000524 */   addiu     $a1, $zero, 0x64
    /* E23C 80147E34 1480043C */  lui        $a0, %hi(HARCH24)
    /* E240 80147E38 F4148424 */  addiu      $a0, $a0, %lo(HARCH24)
    /* E244 80147E3C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E248 80147E40 64000524 */   addiu     $a1, $zero, 0x64
    /* E24C 80147E44 1480043C */  lui        $a0, %hi(HARCH25)
    /* E250 80147E48 04158424 */  addiu      $a0, $a0, %lo(HARCH25)
    /* E254 80147E4C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E258 80147E50 64000524 */   addiu     $a1, $zero, 0x64
    /* E25C 80147E54 1480043C */  lui        $a0, %hi(HARCH26)
    /* E260 80147E58 14158424 */  addiu      $a0, $a0, %lo(HARCH26)
    /* E264 80147E5C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E268 80147E60 64000524 */   addiu     $a1, $zero, 0x64
    /* E26C 80147E64 1480043C */  lui        $a0, %hi(HARCH27)
    /* E270 80147E68 24158424 */  addiu      $a0, $a0, %lo(HARCH27)
    /* E274 80147E6C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E278 80147E70 64000524 */   addiu     $a1, $zero, 0x64
    /* E27C 80147E74 1480043C */  lui        $a0, %hi(HARCH28)
    /* E280 80147E78 34158424 */  addiu      $a0, $a0, %lo(HARCH28)
    /* E284 80147E7C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E288 80147E80 64000524 */   addiu     $a1, $zero, 0x64
    /* E28C 80147E84 1480043C */  lui        $a0, %hi(HARCH29)
    /* E290 80147E88 44158424 */  addiu      $a0, $a0, %lo(HARCH29)
    /* E294 80147E8C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E298 80147E90 64000524 */   addiu     $a1, $zero, 0x64
    /* E29C 80147E94 1480043C */  lui        $a0, %hi(HARCH30)
    /* E2A0 80147E98 54158424 */  addiu      $a0, $a0, %lo(HARCH30)
    /* E2A4 80147E9C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E2A8 80147EA0 64000524 */   addiu     $a1, $zero, 0x64
    /* E2AC 80147EA4 1480043C */  lui        $a0, %hi(HARCH31)
    /* E2B0 80147EA8 64158424 */  addiu      $a0, $a0, %lo(HARCH31)
    /* E2B4 80147EAC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E2B8 80147EB0 64000524 */   addiu     $a1, $zero, 0x64
    /* E2BC 80147EB4 1480043C */  lui        $a0, %hi(HARCH32)
    /* E2C0 80147EB8 74158424 */  addiu      $a0, $a0, %lo(HARCH32)
    /* E2C4 80147EBC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E2C8 80147EC0 64000524 */   addiu     $a1, $zero, 0x64
    /* E2CC 80147EC4 1480043C */  lui        $a0, %hi(HARCH33)
    /* E2D0 80147EC8 84158424 */  addiu      $a0, $a0, %lo(HARCH33)
    /* E2D4 80147ECC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E2D8 80147ED0 64000524 */   addiu     $a1, $zero, 0x64
    /* E2DC 80147ED4 1480043C */  lui        $a0, %hi(HARCH34)
    /* E2E0 80147ED8 94158424 */  addiu      $a0, $a0, %lo(HARCH34)
    /* E2E4 80147EDC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E2E8 80147EE0 64000524 */   addiu     $a1, $zero, 0x64
    /* E2EC 80147EE4 1480043C */  lui        $a0, %hi(HARCH35)
    /* E2F0 80147EE8 A4158424 */  addiu      $a0, $a0, %lo(HARCH35)
    /* E2F4 80147EEC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E2F8 80147EF0 64000524 */   addiu     $a1, $zero, 0x64
    /* E2FC 80147EF4 1480043C */  lui        $a0, %hi(HARCH36)
    /* E300 80147EF8 B4158424 */  addiu      $a0, $a0, %lo(HARCH36)
    /* E304 80147EFC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E308 80147F00 64000524 */   addiu     $a1, $zero, 0x64
    /* E30C 80147F04 1480043C */  lui        $a0, %hi(HARCH37)
    /* E310 80147F08 C4158424 */  addiu      $a0, $a0, %lo(HARCH37)
    /* E314 80147F0C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E318 80147F10 64000524 */   addiu     $a1, $zero, 0x64
    /* E31C 80147F14 1480043C */  lui        $a0, %hi(HARCH38)
    /* E320 80147F18 D4158424 */  addiu      $a0, $a0, %lo(HARCH38)
    /* E324 80147F1C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E328 80147F20 64000524 */   addiu     $a1, $zero, 0x64
    /* E32C 80147F24 1480043C */  lui        $a0, %hi(HARCH39)
    /* E330 80147F28 E4158424 */  addiu      $a0, $a0, %lo(HARCH39)
    /* E334 80147F2C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E338 80147F30 64000524 */   addiu     $a1, $zero, 0x64
    /* E33C 80147F34 1480043C */  lui        $a0, %hi(HARCH40)
    /* E340 80147F38 F4158424 */  addiu      $a0, $a0, %lo(HARCH40)
    /* E344 80147F3C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E348 80147F40 64000524 */   addiu     $a1, $zero, 0x64
    /* E34C 80147F44 1480043C */  lui        $a0, %hi(CRUSHCOL)
    /* E350 80147F48 70168424 */  addiu      $a0, $a0, %lo(CRUSHCOL)
    /* E354 80147F4C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E358 80147F50 63000524 */   addiu     $a1, $zero, 0x63
    /* E35C 80147F54 1280043C */  lui        $a0, %hi(RUINS1)
    /* E360 80147F58 A8BE8424 */  addiu      $a0, $a0, %lo(RUINS1)
    /* E364 80147F5C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E368 80147F60 0A000524 */   addiu     $a1, $zero, 0xA
    /* E36C 80147F64 1280043C */  lui        $a0, %hi(RUINS2)
    /* E370 80147F68 ACBE8424 */  addiu      $a0, $a0, %lo(RUINS2)
    /* E374 80147F6C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E378 80147F70 0A000524 */   addiu     $a1, $zero, 0xA
    /* E37C 80147F74 1280043C */  lui        $a0, %hi(RUINS3)
    /* E380 80147F78 B0BE8424 */  addiu      $a0, $a0, %lo(RUINS3)
    /* E384 80147F7C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E388 80147F80 0A000524 */   addiu     $a1, $zero, 0xA
    /* E38C 80147F84 1280043C */  lui        $a0, %hi(RUINS4)
    /* E390 80147F88 B4BE8424 */  addiu      $a0, $a0, %lo(RUINS4)
    /* E394 80147F8C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E398 80147F90 0A000524 */   addiu     $a1, $zero, 0xA
    /* E39C 80147F94 1280043C */  lui        $a0, %hi(RUINS5)
    /* E3A0 80147F98 B8BE8424 */  addiu      $a0, $a0, %lo(RUINS5)
    /* E3A4 80147F9C E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E3A8 80147FA0 0A000524 */   addiu     $a1, $zero, 0xA
    /* E3AC 80147FA4 1280043C */  lui        $a0, %hi(RUINS6)
    /* E3B0 80147FA8 BCBE8424 */  addiu      $a0, $a0, %lo(RUINS6)
    /* E3B4 80147FAC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E3B8 80147FB0 0A000524 */   addiu     $a1, $zero, 0xA
    /* E3BC 80147FB4 1280043C */  lui        $a0, %hi(RUINS7)
    /* E3C0 80147FB8 C0BE8424 */  addiu      $a0, $a0, %lo(RUINS7)
    /* E3C4 80147FBC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E3C8 80147FC0 32000524 */   addiu     $a1, $zero, 0x32
    /* E3CC 80147FC4 1480043C */  lui        $a0, %hi(PANCREAS1)
    /* E3D0 80147FC8 CC168424 */  addiu      $a0, $a0, %lo(PANCREAS1)
    /* E3D4 80147FCC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E3D8 80147FD0 01000524 */   addiu     $a1, $zero, 0x1
    /* E3DC 80147FD4 1480043C */  lui        $a0, %hi(PANCREAS2)
    /* E3E0 80147FD8 EC168424 */  addiu      $a0, $a0, %lo(PANCREAS2)
    /* E3E4 80147FDC E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E3E8 80147FE0 01000524 */   addiu     $a1, $zero, 0x1
    /* E3EC 80147FE4 4A1D050C */  jal        DRLG_L2SetWalls__Fv
    /* E3F0 80147FE8 00000000 */   nop
    /* E3F4 80147FEC 1480043C */  lui        $a0, %hi(BIG1)
    /* E3F8 80147FF0 84168424 */  addiu      $a0, $a0, %lo(BIG1)
    /* E3FC 80147FF4 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E400 80147FF8 03000524 */   addiu     $a1, $zero, 0x3
    /* E404 80147FFC 1480043C */  lui        $a0, %hi(BIG2)
    /* E408 80148000 90168424 */  addiu      $a0, $a0, %lo(BIG2)
    /* E40C 80148004 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E410 80148008 03000524 */   addiu     $a1, $zero, 0x3
    /* E414 8014800C 1280043C */  lui        $a0, %hi(BIG3)
    /* E418 80148010 88BE8424 */  addiu      $a0, $a0, %lo(BIG3)
    /* E41C 80148014 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E420 80148018 03000524 */   addiu     $a1, $zero, 0x3
    /* E424 8014801C 1280043C */  lui        $a0, %hi(BIG4)
    /* E428 80148020 90BE8424 */  addiu      $a0, $a0, %lo(BIG4)
    /* E42C 80148024 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E430 80148028 03000524 */   addiu     $a1, $zero, 0x3
    /* E434 8014802C 1480043C */  lui        $a0, %hi(BIG5)
    /* E438 80148030 9C168424 */  addiu      $a0, $a0, %lo(BIG5)
    /* E43C 80148034 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E440 80148038 03000524 */   addiu     $a1, $zero, 0x3
    /* E444 8014803C 1280043C */  lui        $a0, %hi(BIG6)
    /* E448 80148040 98BE8424 */  addiu      $a0, $a0, %lo(BIG6)
    /* E44C 80148044 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E450 80148048 14000524 */   addiu     $a1, $zero, 0x14
    /* E454 8014804C 1280043C */  lui        $a0, %hi(BIG7)
    /* E458 80148050 A0BE8424 */  addiu      $a0, $a0, %lo(BIG7)
    /* E45C 80148054 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E460 80148058 14000524 */   addiu     $a1, $zero, 0x14
    /* E464 8014805C 1480043C */  lui        $a0, %hi(BIG8)
    /* E468 80148060 A8168424 */  addiu      $a0, $a0, %lo(BIG8)
    /* E46C 80148064 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E470 80148068 03000524 */   addiu     $a1, $zero, 0x3
    /* E474 8014806C 1480043C */  lui        $a0, %hi(BIG9)
    /* E478 80148070 B4168424 */  addiu      $a0, $a0, %lo(BIG9)
    /* E47C 80148074 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E480 80148078 14000524 */   addiu     $a1, $zero, 0x14
    /* E484 8014807C 1480043C */  lui        $a0, %hi(BIG10)
    /* E488 80148080 C0168424 */  addiu      $a0, $a0, %lo(BIG10)
    /* E48C 80148084 E60D050C */  jal        DRLG_L2PlaceRndSet__FPUci
    /* E490 80148088 14000524 */   addiu     $a1, $zero, 0x14
    /* E494 8014808C A40E050C */  jal        DRLG_L2Subs__Fv
    /* E498 80148090 00000000 */   nop
    /* E49C 80148094 200F050C */  jal        DRLG_L2Shadows__Fv
    /* E4A0 80148098 00000000 */   nop
    /* E4A4 8014809C 21380000 */  addu       $a3, $zero, $zero
    /* E4A8 801480A0 0E800A3C */  lui        $t2, %hi(pdungeon)
    /* E4AC 801480A4 C4524A25 */  addiu      $t2, $t2, %lo(pdungeon)
    /* E4B0 801480A8 0E80093C */  lui        $t1, %hi(dungeon)
    /* E4B4 801480AC C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* E4B8 801480B0 21300000 */  addu       $a2, $zero, $zero
  .L801480B4:
    /* E4BC 801480B4 40400700 */  sll        $t0, $a3, 1
    /* E4C0 801480B8 21282001 */  addu       $a1, $t1, $zero
    /* E4C4 801480BC 21204001 */  addu       $a0, $t2, $zero
  .L801480C0:
    /* E4C8 801480C0 21100501 */  addu       $v0, $t0, $a1
    /* E4CC 801480C4 6000A524 */  addiu      $a1, $a1, 0x60
    /* E4D0 801480C8 21188700 */  addu       $v1, $a0, $a3
    /* E4D4 801480CC 00004294 */  lhu        $v0, 0x0($v0)
    /* E4D8 801480D0 0100C624 */  addiu      $a2, $a2, 0x1
    /* E4DC 801480D4 000062A0 */  sb         $v0, 0x0($v1)
    /* E4E0 801480D8 2800C228 */  slti       $v0, $a2, 0x28
    /* E4E4 801480DC F8FF4014 */  bnez       $v0, .L801480C0
    /* E4E8 801480E0 28008424 */   addiu     $a0, $a0, 0x28
    /* E4EC 801480E4 0100E724 */  addiu      $a3, $a3, 0x1
    /* E4F0 801480E8 2800E228 */  slti       $v0, $a3, 0x28
    /* E4F4 801480EC F1FF4014 */  bnez       $v0, .L801480B4
    /* E4F8 801480F0 21300000 */   addu      $a2, $zero, $zero
    /* E4FC 801480F4 ABF3040C */  jal        DRLG_Init_Globals__Fv
    /* E500 801480F8 00000000 */   nop
    /* E504 801480FC 5017848F */  lw         $a0, %gp_rel(nSx1)($gp)
    /* E508 80148100 5417858F */  lw         $a1, %gp_rel(nSy1)($gp)
    /* E50C 80148104 CD7C050C */  jal        DRLG_CheckQuests__Fii
    /* E510 80148108 00000000 */   nop
    /* E514 8014810C 3800BF8F */  lw         $ra, 0x38($sp)
    /* E518 80148110 3400B58F */  lw         $s5, 0x34($sp)
    /* E51C 80148114 3000B48F */  lw         $s4, 0x30($sp)
    /* E520 80148118 2C00B38F */  lw         $s3, 0x2C($sp)
    /* E524 8014811C 2800B28F */  lw         $s2, 0x28($sp)
    /* E528 80148120 2400B18F */  lw         $s1, 0x24($sp)
    /* E52C 80148124 2000B08F */  lw         $s0, 0x20($sp)
    /* E530 80148128 4000BD27 */  addiu      $sp, $sp, 0x40
    /* E534 8014812C 0800E003 */  jr         $ra
    /* E538 80148130 00000000 */   nop
endlabel DRLG_L2__Fi
