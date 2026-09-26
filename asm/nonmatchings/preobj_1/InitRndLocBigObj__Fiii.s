.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitRndLocBigObj__Fiii, 0x1C0

glabel InitRndLocBigObj__Fiii
    /* 1DBB4 801577AC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1DBB8 801577B0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1DBBC 801577B4 21808000 */  addu       $s0, $a0, $zero
    /* 1DBC0 801577B8 2320B000 */  subu       $a0, $a1, $s0
    /* 1DBC4 801577BC 3800BEAF */  sw         $fp, 0x38($sp)
    /* 1DBC8 801577C0 21F0C000 */  addu       $fp, $a2, $zero
    /* 1DBCC 801577C4 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 1DBD0 801577C8 3400B7AF */  sw         $s7, 0x34($sp)
    /* 1DBD4 801577CC 3000B6AF */  sw         $s6, 0x30($sp)
    /* 1DBD8 801577D0 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1DBDC 801577D4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 1DBE0 801577D8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1DBE4 801577DC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1DBE8 801577E0 C9F6000C */  jal        ENG_random__Fl
    /* 1DBEC 801577E4 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 1DBF0 801577E8 21B85000 */  addu       $s7, $v0, $s0
    /* 1DBF4 801577EC 5200E01A */  blez       $s7, .L80157938
    /* 1DBF8 801577F0 21B00000 */   addu      $s6, $zero, $zero
  .L801577F4:
    /* 1DBFC 801577F4 C9F6000C */  jal        ENG_random__Fl
    /* 1DC00 801577F8 40000424 */   addiu     $a0, $zero, 0x40
    /* 1DC04 801577FC 40000424 */  addiu      $a0, $zero, 0x40
    /* 1DC08 80157800 C9F6000C */  jal        ENG_random__Fl
    /* 1DC0C 80157804 21884000 */   addu      $s1, $v0, $zero
    /* 1DC10 80157808 0F003426 */  addiu      $s4, $s1, 0xF
    /* 1DC14 8015780C 21208002 */  addu       $a0, $s4, $zero
    /* 1DC18 80157810 21984000 */  addu       $s3, $v0, $zero
    /* 1DC1C 80157814 0E007026 */  addiu      $s0, $s3, 0xE
    /* 1DC20 80157818 305D050C */  jal        RndLocOk__Fii
    /* 1DC24 8015781C 21280002 */   addu      $a1, $s0, $zero
    /* 1DC28 80157820 10003226 */  addiu      $s2, $s1, 0x10
    /* 1DC2C 80157824 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DC30 80157828 F2FF4010 */  beqz       $v0, .L801577F4
    /* 1DC34 8015782C 10007526 */   addiu     $s5, $s3, 0x10
    /* 1DC38 80157830 21204002 */  addu       $a0, $s2, $zero
    /* 1DC3C 80157834 305D050C */  jal        RndLocOk__Fii
    /* 1DC40 80157838 21280002 */   addu      $a1, $s0, $zero
    /* 1DC44 8015783C FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DC48 80157840 ECFF4010 */  beqz       $v0, .L801577F4
    /* 1DC4C 80157844 11003126 */   addiu     $s1, $s1, 0x11
    /* 1DC50 80157848 21202002 */  addu       $a0, $s1, $zero
    /* 1DC54 8015784C 305D050C */  jal        RndLocOk__Fii
    /* 1DC58 80157850 21280002 */   addu      $a1, $s0, $zero
    /* 1DC5C 80157854 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DC60 80157858 E6FF4010 */  beqz       $v0, .L801577F4
    /* 1DC64 8015785C 21208002 */   addu      $a0, $s4, $zero
    /* 1DC68 80157860 0F007026 */  addiu      $s0, $s3, 0xF
    /* 1DC6C 80157864 305D050C */  jal        RndLocOk__Fii
    /* 1DC70 80157868 21280002 */   addu      $a1, $s0, $zero
    /* 1DC74 8015786C FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DC78 80157870 E0FF4010 */  beqz       $v0, .L801577F4
    /* 1DC7C 80157874 21204002 */   addu      $a0, $s2, $zero
    /* 1DC80 80157878 305D050C */  jal        RndLocOk__Fii
    /* 1DC84 8015787C 21280002 */   addu      $a1, $s0, $zero
    /* 1DC88 80157880 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DC8C 80157884 DBFF4010 */  beqz       $v0, .L801577F4
    /* 1DC90 80157888 21202002 */   addu      $a0, $s1, $zero
    /* 1DC94 8015788C 305D050C */  jal        RndLocOk__Fii
    /* 1DC98 80157890 21280002 */   addu      $a1, $s0, $zero
    /* 1DC9C 80157894 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DCA0 80157898 D6FF4010 */  beqz       $v0, .L801577F4
    /* 1DCA4 8015789C 21208002 */   addu      $a0, $s4, $zero
    /* 1DCA8 801578A0 305D050C */  jal        RndLocOk__Fii
    /* 1DCAC 801578A4 2128A002 */   addu      $a1, $s5, $zero
    /* 1DCB0 801578A8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DCB4 801578AC D1FF4010 */  beqz       $v0, .L801577F4
    /* 1DCB8 801578B0 21204002 */   addu      $a0, $s2, $zero
    /* 1DCBC 801578B4 305D050C */  jal        RndLocOk__Fii
    /* 1DCC0 801578B8 2128A002 */   addu      $a1, $s5, $zero
    /* 1DCC4 801578BC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DCC8 801578C0 CCFF4010 */  beqz       $v0, .L801577F4
    /* 1DCCC 801578C4 21202002 */   addu      $a0, $s1, $zero
    /* 1DCD0 801578C8 305D050C */  jal        RndLocOk__Fii
    /* 1DCD4 801578CC 2128A002 */   addu      $a1, $s5, $zero
    /* 1DCD8 801578D0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DCDC 801578D4 C7FF4010 */  beqz       $v0, .L801577F4
    /* 1DCE0 801578D8 21208002 */   addu      $a0, $s4, $zero
    /* 1DCE4 801578DC 11007026 */  addiu      $s0, $s3, 0x11
    /* 1DCE8 801578E0 305D050C */  jal        RndLocOk__Fii
    /* 1DCEC 801578E4 21280002 */   addu      $a1, $s0, $zero
    /* 1DCF0 801578E8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DCF4 801578EC C1FF4010 */  beqz       $v0, .L801577F4
    /* 1DCF8 801578F0 21204002 */   addu      $a0, $s2, $zero
    /* 1DCFC 801578F4 305D050C */  jal        RndLocOk__Fii
    /* 1DD00 801578F8 21280002 */   addu      $a1, $s0, $zero
    /* 1DD04 801578FC FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DD08 80157900 BCFF4010 */  beqz       $v0, .L801577F4
    /* 1DD0C 80157904 21202002 */   addu      $a0, $s1, $zero
    /* 1DD10 80157908 305D050C */  jal        RndLocOk__Fii
    /* 1DD14 8015790C 21280002 */   addu      $a1, $s0, $zero
    /* 1DD18 80157910 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1DD1C 80157914 B7FF4010 */  beqz       $v0, .L801577F4
    /* 1DD20 80157918 2120C003 */   addu      $a0, $fp, $zero
    /* 1DD24 8015791C 21284002 */  addu       $a1, $s2, $zero
    /* 1DD28 80157920 BE4E010C */  jal        AddObject__Fiii
    /* 1DD2C 80157924 2130A002 */   addu      $a2, $s5, $zero
    /* 1DD30 80157928 0100D626 */  addiu      $s6, $s6, 0x1
    /* 1DD34 8015792C 2A10D702 */  slt        $v0, $s6, $s7
    /* 1DD38 80157930 B0FF4014 */  bnez       $v0, .L801577F4
    /* 1DD3C 80157934 00000000 */   nop
  .L80157938:
    /* 1DD40 80157938 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 1DD44 8015793C 3800BE8F */  lw         $fp, 0x38($sp)
    /* 1DD48 80157940 3400B78F */  lw         $s7, 0x34($sp)
    /* 1DD4C 80157944 3000B68F */  lw         $s6, 0x30($sp)
    /* 1DD50 80157948 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 1DD54 8015794C 2800B48F */  lw         $s4, 0x28($sp)
    /* 1DD58 80157950 2400B38F */  lw         $s3, 0x24($sp)
    /* 1DD5C 80157954 2000B28F */  lw         $s2, 0x20($sp)
    /* 1DD60 80157958 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1DD64 8015795C 1800B08F */  lw         $s0, 0x18($sp)
    /* 1DD68 80157960 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 1DD6C 80157964 0800E003 */  jr         $ra
    /* 1DD70 80157968 00000000 */   nop
endlabel InitRndLocBigObj__Fiii
