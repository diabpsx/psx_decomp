.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching localstreamreader, 0x14A8

glabel localstreamreader
    /* 1D9E0 8002D9E0 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1D9E4 8002D9E4 C8FEBD27 */  addiu      $sp, $sp, -0x138
    /* 1D9E8 8002D9E8 3001B4AF */  sw         $s4, 0x130($sp)
    /* 1D9EC 8002D9EC 21A00000 */  addu       $s4, $zero, $zero
    /* 1D9F0 8002D9F0 3401BFAF */  sw         $ra, 0x134($sp)
    /* 1D9F4 8002D9F4 2C01B3AF */  sw         $s3, 0x12C($sp)
    /* 1D9F8 8002D9F8 2801B2AF */  sw         $s2, 0x128($sp)
    /* 1D9FC 8002D9FC 2401B1AF */  sw         $s1, 0x124($sp)
    /* 1DA00 8002DA00 18056010 */  beqz       $v1, .L8002EE64
    /* 1DA04 8002DA04 2001B0AF */   sw        $s0, 0x120($sp)
    /* 1DA08 8002DA08 8C1D828F */  lw         $v0, %gp_rel(D_8011C50C)($gp)
    /* 1DA0C 8002DA0C 00000000 */  nop
    /* 1DA10 8002DA10 0E004010 */  beqz       $v0, .L8002DA4C
    /* 1DA14 8002DA14 00000000 */   nop
    /* 1DA18 8002DA18 2800638C */  lw         $v1, 0x28($v1)
    /* 1DA1C 8002DA1C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1DA20 8002DA20 0A006214 */  bne        $v1, $v0, .L8002DA4C
    /* 1DA24 8002DA24 08001324 */   addiu     $s3, $zero, 0x8
    /* 1DA28 8002DA28 881D828F */  lw         $v0, %gp_rel(D_8011C508)($gp)
    /* 1DA2C 8002DA2C 00000000 */  nop
    /* 1DA30 8002DA30 01004224 */  addiu      $v0, $v0, 0x1
    /* 1DA34 8002DA34 881D82AF */  sw         $v0, %gp_rel(D_8011C508)($gp)
    /* 1DA38 8002DA38 95B60008 */  j          .L8002DA54
    /* 1DA3C 8002DA3C 00000000 */   nop
  .L8002DA40:
    /* 1DA40 8002DA40 881D80AF */  sw         $zero, %gp_rel(D_8011C508)($gp)
    /* 1DA44 8002DA44 6BBB0008 */  j          .L8002EDAC
    /* 1DA48 8002DA48 00000000 */   nop
  .L8002DA4C:
    /* 1DA4C 8002DA4C 881D80AF */  sw         $zero, %gp_rel(D_8011C508)($gp)
    /* 1DA50 8002DA50 08001324 */  addiu      $s3, $zero, 0x8
  .L8002DA54:
    /* 1DA54 8002DA54 07001224 */  addiu      $s2, $zero, 0x7
    /* 1DA58 8002DA58 01001124 */  addiu      $s1, $zero, 0x1
  jlabel .L8002DA5C
    /* 1DA5C 8002DA5C 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1DA60 8002DA60 00000000 */  nop
    /* 1DA64 8002DA64 2400828C */  lw         $v0, 0x24($a0)
    /* 1DA68 8002DA68 00000000 */  nop
    /* 1DA6C 8002DA6C 04005314 */  bne        $v0, $s3, .L8002DA80
    /* 1DA70 8002DA70 00000000 */   nop
    /* 1DA74 8002DA74 200093AC */  sw         $s3, 0x20($a0)
    /* 1DA78 8002DA78 ACB60008 */  j          .L8002DAB0
    /* 1DA7C 8002DA7C 00000000 */   nop
  .L8002DA80:
    /* 1DA80 8002DA80 2400838C */  lw         $v1, 0x24($a0)
    /* 1DA84 8002DA84 0F000224 */  addiu      $v0, $zero, 0xF
    /* 1DA88 8002DA88 04006214 */  bne        $v1, $v0, .L8002DA9C
    /* 1DA8C 8002DA8C 00000000 */   nop
    /* 1DA90 8002DA90 200092AC */  sw         $s2, 0x20($a0)
    /* 1DA94 8002DA94 ACB60008 */  j          .L8002DAB0
    /* 1DA98 8002DA98 00000000 */   nop
  .L8002DA9C:
    /* 1DA9C 8002DA9C 2400838C */  lw         $v1, 0x24($a0)
    /* 1DAA0 8002DAA0 15000224 */  addiu      $v0, $zero, 0x15
    /* 1DAA4 8002DAA4 02006214 */  bne        $v1, $v0, .L8002DAB0
    /* 1DAA8 8002DAA8 00000000 */   nop
    /* 1DAAC 8002DAAC 01001424 */  addiu      $s4, $zero, 0x1
  .L8002DAB0:
    /* 1DAB0 8002DAB0 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DAB4 8002DAB4 00000000 */  nop
    /* 1DAB8 8002DAB8 240040AC */  sw         $zero, 0x24($v0)
    /* 1DABC 8002DABC BB048016 */  bnez       $s4, .L8002EDAC
    /* 1DAC0 8002DAC0 00000000 */   nop
    /* 1DAC4 8002DAC4 2000428C */  lw         $v0, 0x20($v0)
    /* 1DAC8 8002DAC8 00000000 */  nop
    /* 1DACC 8002DACC FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 1DAD0 8002DAD0 1700622C */  sltiu      $v0, $v1, 0x17
    /* 1DAD4 8002DAD4 E1FF4010 */  beqz       $v0, .L8002DA5C
    /* 1DAD8 8002DAD8 80100300 */   sll       $v0, $v1, 2
    /* 1DADC 8002DADC 1180013C */  lui        $at, %hi(jtbl_8010FE90)
    /* 1DAE0 8002DAE0 21082200 */  addu       $at, $at, $v0
    /* 1DAE4 8002DAE4 90FE228C */  lw         $v0, %lo(jtbl_8010FE90)($at)
    /* 1DAE8 8002DAE8 00000000 */  nop
    /* 1DAEC 8002DAEC 08004000 */  jr         $v0
    /* 1DAF0 8002DAF0 00000000 */   nop
  jlabel .L8002DAF4
    /* 1DAF4 8002DAF4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1DAF8 8002DAF8 00000000 */  nop
    /* 1DAFC 8002DAFC 2800828C */  lw         $v0, 0x28($a0)
    /* 1DB00 8002DB00 00000000 */  nop
    /* 1DB04 8002DB04 A9045110 */  beq        $v0, $s1, .L8002EDAC
    /* 1DB08 8002DB08 00000000 */   nop
    /* 1DB0C 8002DB0C A2BB000C */  jal        releasechunks
    /* 1DB10 8002DB10 00000000 */   nop
    /* 1DB14 8002DB14 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1DB18 8002DB18 00000000 */  nop
    /* 1DB1C 8002DB1C 7800628C */  lw         $v0, 0x78($v1)
    /* 1DB20 8002DB20 00000000 */  nop
    /* 1DB24 8002DB24 CF044010 */  beqz       $v0, .L8002EE64
    /* 1DB28 8002DB28 00000000 */   nop
    /* 1DB2C 8002DB2C 7800648C */  lw         $a0, 0x78($v1)
    /* 1DB30 8002DB30 7800628C */  lw         $v0, 0x78($v1)
    /* 1DB34 8002DB34 00000000 */  nop
    /* 1DB38 8002DB38 9800428C */  lw         $v0, 0x98($v0)
    /* 1DB3C 8002DB3C 00000000 */  nop
    /* 1DB40 8002DB40 780062AC */  sw         $v0, 0x78($v1)
    /* 1DB44 8002DB44 800064AC */  sw         $a0, 0x80($v1)
    /* 1DB48 8002DB48 7800628C */  lw         $v0, 0x78($v1)
    /* 1DB4C 8002DB4C 00000000 */  nop
    /* 1DB50 8002DB50 02004014 */  bnez       $v0, .L8002DB5C
    /* 1DB54 8002DB54 00000000 */   nop
    /* 1DB58 8002DB58 7C0060AC */  sw         $zero, 0x7C($v1)
  .L8002DB5C:
    /* 1DB5C 8002DB5C 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1DB60 8002DB60 9400828C */  lw         $v0, 0x94($a0)
    /* 1DB64 8002DB64 00000000 */  nop
    /* 1DB68 8002DB68 2000A2AC */  sw         $v0, 0x20($a1)
    /* 1DB6C 8002DB6C 5000A28C */  lw         $v0, 0x50($a1)
    /* 1DB70 8002DB70 9000838C */  lw         $v1, 0x90($a0)
    /* 1DB74 8002DB74 00000000 */  nop
    /* 1DB78 8002DB78 21104300 */  addu       $v0, $v0, $v1
    /* 1DB7C 8002DB7C 6000A2AC */  sw         $v0, 0x60($a1)
    /* 1DB80 8002DB80 F8BC000C */  jal        putstreamblock
    /* 1DB84 8002DB84 00000000 */   nop
    /* 1DB88 8002DB88 97B60008 */  j          .L8002DA5C
    /* 1DB8C 8002DB8C 00000000 */   nop
  jlabel .L8002DB90
    /* 1DB90 8002DB90 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1DB94 8002DB94 00000000 */  nop
    /* 1DB98 8002DB98 2800628C */  lw         $v0, 0x28($v1)
    /* 1DB9C 8002DB9C 00000000 */  nop
    /* 1DBA0 8002DBA0 82045110 */  beq        $v0, $s1, .L8002EDAC
    /* 1DBA4 8002DBA4 00000000 */   nop
    /* 1DBA8 8002DBA8 1C00628C */  lw         $v0, 0x1C($v1)
    /* 1DBAC 8002DBAC 00000000 */  nop
    /* 1DBB0 8002DBB0 04004010 */  beqz       $v0, .L8002DBC4
    /* 1DBB4 8002DBB4 00000000 */   nop
    /* 1DBB8 8002DBB8 1C00648C */  lw         $a0, 0x1C($v1)
    /* 1DBBC 8002DBBC 5E99000C */  jal        closeblockhandle
    /* 1DBC0 8002DBC0 00000000 */   nop
  .L8002DBC4:
    /* 1DBC4 8002DBC4 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DBC8 8002DBC8 00000000 */  nop
    /* 1DBCC 8002DBCC 1C0040AC */  sw         $zero, 0x1C($v0)
    /* 1DBD0 8002DBD0 200052AC */  sw         $s2, 0x20($v0)
    /* 1DBD4 8002DBD4 99BB0008 */  j          .L8002EE64
    /* 1DBD8 8002DBD8 00000000 */   nop
  jlabel .L8002DBDC
    /* 1DBDC 8002DBDC 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1DBE0 8002DBE0 00000000 */  nop
    /* 1DBE4 8002DBE4 1C00628C */  lw         $v0, 0x1C($v1)
    /* 1DBE8 8002DBE8 00000000 */  nop
    /* 1DBEC 8002DBEC 04004010 */  beqz       $v0, .L8002DC00
    /* 1DBF0 8002DBF0 00000000 */   nop
    /* 1DBF4 8002DBF4 1C00648C */  lw         $a0, 0x1C($v1)
    /* 1DBF8 8002DBF8 5E99000C */  jal        closeblockhandle
    /* 1DBFC 8002DBFC 00000000 */   nop
  .L8002DC00:
    /* 1DC00 8002DC00 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DC04 8002DC04 00000000 */  nop
    /* 1DC08 8002DC08 8000448C */  lw         $a0, 0x80($v0)
    /* 1DC0C 8002DC0C 8C1D80AF */  sw         $zero, %gp_rel(D_8011C50C)($gp)
    /* 1DC10 8002DC10 8C2291AF */  sw         $s1, %gp_rel(D_8011CA0C)($gp)
    /* 1DC14 8002DC14 1341000C */  jal        strchr
    /* 1DC18 8002DC18 3A000524 */   addiu     $a1, $zero, 0x3A
    /* 1DC1C 8002DC1C 08004014 */  bnez       $v0, .L8002DC40
    /* 1DC20 8002DC20 00000000 */   nop
    /* 1DC24 8002DC24 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DC28 8002DC28 00000000 */  nop
    /* 1DC2C 8002DC2C 8000448C */  lw         $a0, 0x80($v0)
    /* 1DC30 8002DC30 1341000C */  jal        strchr
    /* 1DC34 8002DC34 5C000524 */   addiu     $a1, $zero, 0x5C
    /* 1DC38 8002DC38 0A004010 */  beqz       $v0, .L8002DC64
    /* 1DC3C 8002DC3C 00000000 */   nop
  .L8002DC40:
    /* 1DC40 8002DC40 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DC44 8002DC44 00000000 */  nop
    /* 1DC48 8002DC48 8000448C */  lw         $a0, 0x80($v0)
    /* 1DC4C 8002DC4C 1280053C */  lui        $a1, %hi(D_8011C514)
    /* 1DC50 8002DC50 14C5A524 */  addiu      $a1, $a1, %lo(D_8011C514)
    /* 1DC54 8002DC54 4375000C */  jal        strncmp
    /* 1DC58 8002DC58 06000624 */   addiu     $a2, $zero, 0x6
    /* 1DC5C 8002DC5C 15004014 */  bnez       $v0, .L8002DCB4
    /* 1DC60 8002DC60 00000000 */   nop
  .L8002DC64:
    /* 1DC64 8002DC64 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DC68 8002DC68 00000000 */  nop
    /* 1DC6C 8002DC6C 8000448C */  lw         $a0, 0x80($v0)
    /* 1DC70 8002DC70 1280103C */  lui        $s0, %hi(D_8011C514)
    /* 1DC74 8002DC74 14C51026 */  addiu      $s0, $s0, %lo(D_8011C514)
    /* 1DC78 8002DC78 21280002 */  addu       $a1, $s0, $zero
    /* 1DC7C 8002DC7C 8C2280AF */  sw         $zero, %gp_rel(D_8011CA0C)($gp)
    /* 1DC80 8002DC80 4375000C */  jal        strncmp
    /* 1DC84 8002DC84 06000624 */   addiu     $a2, $zero, 0x6
    /* 1DC88 8002DC88 0A004010 */  beqz       $v0, .L8002DCB4
    /* 1DC8C 8002DC8C 00000000 */   nop
    /* 1DC90 8002DC90 7CA2000C */  jal        getdirectory
    /* 1DC94 8002DC94 1800A427 */   addiu     $a0, $sp, 0x18
    /* 1DC98 8002DC98 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1DC9C 8002DC9C 21280002 */  addu       $a1, $s0, $zero
    /* 1DCA0 8002DCA0 4375000C */  jal        strncmp
    /* 1DCA4 8002DCA4 06000624 */   addiu     $a2, $zero, 0x6
    /* 1DCA8 8002DCA8 02004010 */  beqz       $v0, .L8002DCB4
    /* 1DCAC 8002DCAC 00000000 */   nop
    /* 1DCB0 8002DCB0 8C2291AF */  sw         $s1, %gp_rel(D_8011CA0C)($gp)
  .L8002DCB4:
    /* 1DCB4 8002DCB4 8C22828F */  lw         $v0, %gp_rel(D_8011CA0C)($gp)
    /* 1DCB8 8002DCB8 00000000 */  nop
    /* 1DCBC 8002DCBC 11004010 */  beqz       $v0, .L8002DD04
    /* 1DCC0 8002DCC0 1801A227 */   addiu     $v0, $sp, 0x118
    /* 1DCC4 8002DCC4 781D878F */  lw         $a3, %gp_rel(cdms)($gp)
    /* 1DCC8 8002DCC8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1DCCC 8002DCCC 8000E48C */  lw         $a0, 0x80($a3)
    /* 1DCD0 8002DCD0 1C00E524 */  addiu      $a1, $a3, 0x1C
    /* 1DCD4 8002DCD4 5000E624 */  addiu      $a2, $a3, 0x50
    /* 1DCD8 8002DCD8 4299000C */  jal        asyncopenblockhandle
    /* 1DCDC 8002DCDC 5800E724 */   addiu     $a3, $a3, 0x58
    /* 1DCE0 8002DCE0 37044010 */  beqz       $v0, .L8002EDC0
    /* 1DCE4 8002DCE4 00000000 */   nop
    /* 1DCE8 8002DCE8 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DCEC 8002DCEC 00000000 */  nop
    /* 1DCF0 8002DCF0 5800428C */  lw         $v0, 0x58($v0)
    /* 1DCF4 8002DCF4 8C1D91AF */  sw         $s1, %gp_rel(D_8011C50C)($gp)
    /* 1DCF8 8002DCF8 8C2282AF */  sw         $v0, %gp_rel(D_8011CA0C)($gp)
    /* 1DCFC 8002DCFC 50B70008 */  j          .L8002DD40
    /* 1DD00 8002DD00 00000000 */   nop
  .L8002DD04:
    /* 1DD04 8002DD04 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DD08 8002DD08 00000000 */  nop
    /* 1DD0C 8002DD0C 2000478C */  lw         $a3, 0x20($v0)
    /* 1DD10 8002DD10 16000324 */  addiu      $v1, $zero, 0x16
    /* 1DD14 8002DD14 200043AC */  sw         $v1, 0x20($v0)
    /* 1DD18 8002DD18 8000448C */  lw         $a0, 0x80($v0)
    /* 1DD1C 8002DD1C 1280053C */  lui        $a1, %hi(D_8011C504)
    /* 1DD20 8002DD20 04C5A524 */  addiu      $a1, $a1, %lo(D_8011C504)
    /* 1DD24 8002DD24 1280063C */  lui        $a2, %hi(D_8011CA0C)
    /* 1DD28 8002DD28 0CCAC624 */  addiu      $a2, $a2, %lo(D_8011CA0C)
    /* 1DD2C 8002DD2C 902287AF */  sw         $a3, %gp_rel(D_8011CA10)($gp)
    /* 1DD30 8002DD30 C19F000C */  jal        directoryentrycached
    /* 1DD34 8002DD34 00000000 */   nop
    /* 1DD38 8002DD38 2E044010 */  beqz       $v0, .L8002EDF4
    /* 1DD3C 8002DD3C 00000000 */   nop
  jlabel .L8002DD40
    /* 1DD40 8002DD40 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1DD44 8002DD44 00000000 */  nop
    /* 1DD48 8002DD48 2000838C */  lw         $v1, 0x20($a0)
    /* 1DD4C 8002DD4C 16000224 */  addiu      $v0, $zero, 0x16
    /* 1DD50 8002DD50 1F006214 */  bne        $v1, $v0, .L8002DDD0
    /* 1DD54 8002DD54 00000000 */   nop
    /* 1DD58 8002DD58 841D828F */  lw         $v0, %gp_rel(D_8011C504)($gp)
    /* 1DD5C 8002DD5C 00000000 */  nop
    /* 1DD60 8002DD60 0D004014 */  bnez       $v0, .L8002DD98
    /* 1DD64 8002DD64 00000000 */   nop
    /* 1DD68 8002DD68 8000858C */  lw         $a1, 0x80($a0)
    /* 1DD6C 8002DD6C 1180043C */  lui        $a0, %hi(D_8010FD88)
    /* 1DD70 8002DD70 88FD8424 */  addiu      $a0, $a0, %lo(D_8010FD88)
    /* 1DD74 8002DD74 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1DD78 8002DD78 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1DD7C 8002DD7C 1280013C */  lui        $at, %hi(abortfile)
    /* 1DD80 8002DD80 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1DD84 8002DD84 B1070224 */  addiu      $v0, $zero, 0x7B1
    /* 1DD88 8002DD88 1280013C */  lui        $at, %hi(abortline)
    /* 1DD8C 8002DD8C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1DD90 8002DD90 0F95000C */  jal        abortmessage
    /* 1DD94 8002DD94 00000000 */   nop
  .L8002DD98:
    /* 1DD98 8002DD98 781D878F */  lw         $a3, %gp_rel(cdms)($gp)
    /* 1DD9C 8002DD9C 841D858F */  lw         $a1, %gp_rel(D_8011C504)($gp)
    /* 1DDA0 8002DDA0 8C22868F */  lw         $a2, %gp_rel(D_8011CA0C)($gp)
    /* 1DDA4 8002DDA4 1801A227 */  addiu      $v0, $sp, 0x118
    /* 1DDA8 8002DDA8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1DDAC 8002DDAC 8000E48C */  lw         $a0, 0x80($a3)
    /* 1DDB0 8002DDB0 E798000C */  jal        asyncopenblockhandlebysector
    /* 1DDB4 8002DDB4 1C00E724 */   addiu     $a3, $a3, 0x1C
    /* 1DDB8 8002DDB8 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1DDBC 8002DDBC 9022828F */  lw         $v0, %gp_rel(D_8011CA10)($gp)
    /* 1DDC0 8002DDC0 00000000 */  nop
    /* 1DDC4 8002DDC4 200062AC */  sw         $v0, 0x20($v1)
    /* 1DDC8 8002DDC8 280060AC */  sw         $zero, 0x28($v1)
    /* 1DDCC 8002DDCC 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
  .L8002DDD0:
    /* 1DDD0 8002DDD0 8C22828F */  lw         $v0, %gp_rel(D_8011CA0C)($gp)
    /* 1DDD4 8002DDD4 00000000 */  nop
    /* 1DDD8 8002DDD8 580082AC */  sw         $v0, 0x58($a0)
    /* 1DDDC 8002DDDC 5800828C */  lw         $v0, 0x58($a0)
    /* 1DDE0 8002DDE0 00000000 */  nop
    /* 1DDE4 8002DDE4 540082AC */  sw         $v0, 0x54($a0)
    /* 1DDE8 8002DDE8 600080AC */  sw         $zero, 0x60($a0)
    /* 1DDEC 8002DDEC 500080AC */  sw         $zero, 0x50($a0)
    /* 1DDF0 8002DDF0 2000828C */  lw         $v0, 0x20($a0)
    /* 1DDF4 8002DDF4 00000000 */  nop
    /* 1DDF8 8002DDF8 05005110 */  beq        $v0, $s1, .L8002DE10
    /* 1DDFC 8002DDFC 00000000 */   nop
    /* 1DE00 8002DE00 2000838C */  lw         $v1, 0x20($a0)
    /* 1DE04 8002DE04 12000224 */  addiu      $v0, $zero, 0x12
    /* 1DE08 8002DE08 05006214 */  bne        $v1, $v0, .L8002DE20
    /* 1DE0C 8002DE0C 00000000 */   nop
  .L8002DE10:
    /* 1DE10 8002DE10 1400828C */  lw         $v0, 0x14($a0)
    /* 1DE14 8002DE14 00000000 */  nop
    /* 1DE18 8002DE18 100082AC */  sw         $v0, 0x10($a0)
    /* 1DE1C 8002DE1C 900080AC */  sw         $zero, 0x90($a0)
  .L8002DE20:
    /* 1DE20 8002DE20 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1DE24 8002DE24 00000000 */  nop
    /* 1DE28 8002DE28 1000828C */  lw         $v0, 0x10($a0)
    /* 1DE2C 8002DE2C 00000000 */  nop
    /* 1DE30 8002DE30 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1DE34 8002DE34 2000838C */  lw         $v1, 0x20($a0)
    /* 1DE38 8002DE38 13000224 */  addiu      $v0, $zero, 0x13
    /* 1DE3C 8002DE3C 05006210 */  beq        $v1, $v0, .L8002DE54
    /* 1DE40 8002DE40 00000000 */   nop
    /* 1DE44 8002DE44 2000838C */  lw         $v1, 0x20($a0)
    /* 1DE48 8002DE48 12000224 */  addiu      $v0, $zero, 0x12
    /* 1DE4C 8002DE4C 04006214 */  bne        $v1, $v0, .L8002DE60
    /* 1DE50 8002DE50 10000224 */   addiu     $v0, $zero, 0x10
  .L8002DE54:
    /* 1DE54 8002DE54 200092AC */  sw         $s2, 0x20($a0)
    /* 1DE58 8002DE58 99B70008 */  j          .L8002DE64
    /* 1DE5C 8002DE5C 00000000 */   nop
  .L8002DE60:
    /* 1DE60 8002DE60 200082AC */  sw         $v0, 0x20($a0)
  .L8002DE64:
    /* 1DE64 8002DE64 AFBC000C */  jal        streamsetnotfull
    /* 1DE68 8002DE68 00000000 */   nop
    /* 1DE6C 8002DE6C 97B60008 */  j          .L8002DA5C
    /* 1DE70 8002DE70 00000000 */   nop
  jlabel .L8002DE74
    /* 1DE74 8002DE74 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1DE78 8002DE78 00000000 */  nop
    /* 1DE7C 8002DE7C 1C00628C */  lw         $v0, 0x1C($v1)
    /* 1DE80 8002DE80 00000000 */  nop
    /* 1DE84 8002DE84 04004010 */  beqz       $v0, .L8002DE98
    /* 1DE88 8002DE88 00000000 */   nop
    /* 1DE8C 8002DE8C 1C00648C */  lw         $a0, 0x1C($v1)
    /* 1DE90 8002DE90 5E99000C */  jal        closeblockhandle
    /* 1DE94 8002DE94 00000000 */   nop
  .L8002DE98:
    /* 1DE98 8002DE98 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DE9C 8002DE9C 00000000 */  nop
    /* 1DEA0 8002DEA0 8000448C */  lw         $a0, 0x80($v0)
    /* 1DEA4 8002DEA4 8C1D80AF */  sw         $zero, %gp_rel(D_8011C50C)($gp)
    /* 1DEA8 8002DEA8 8C2291AF */  sw         $s1, %gp_rel(D_8011CA0C)($gp)
    /* 1DEAC 8002DEAC 1341000C */  jal        strchr
    /* 1DEB0 8002DEB0 3A000524 */   addiu     $a1, $zero, 0x3A
    /* 1DEB4 8002DEB4 08004014 */  bnez       $v0, .L8002DED8
    /* 1DEB8 8002DEB8 00000000 */   nop
    /* 1DEBC 8002DEBC 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DEC0 8002DEC0 00000000 */  nop
    /* 1DEC4 8002DEC4 8000448C */  lw         $a0, 0x80($v0)
    /* 1DEC8 8002DEC8 1341000C */  jal        strchr
    /* 1DECC 8002DECC 5C000524 */   addiu     $a1, $zero, 0x5C
    /* 1DED0 8002DED0 0A004010 */  beqz       $v0, .L8002DEFC
    /* 1DED4 8002DED4 00000000 */   nop
  .L8002DED8:
    /* 1DED8 8002DED8 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DEDC 8002DEDC 00000000 */  nop
    /* 1DEE0 8002DEE0 8000448C */  lw         $a0, 0x80($v0)
    /* 1DEE4 8002DEE4 1280053C */  lui        $a1, %hi(D_8011C514)
    /* 1DEE8 8002DEE8 14C5A524 */  addiu      $a1, $a1, %lo(D_8011C514)
    /* 1DEEC 8002DEEC 4375000C */  jal        strncmp
    /* 1DEF0 8002DEF0 06000624 */   addiu     $a2, $zero, 0x6
    /* 1DEF4 8002DEF4 15004014 */  bnez       $v0, .L8002DF4C
    /* 1DEF8 8002DEF8 00000000 */   nop
  .L8002DEFC:
    /* 1DEFC 8002DEFC 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DF00 8002DF00 00000000 */  nop
    /* 1DF04 8002DF04 8000448C */  lw         $a0, 0x80($v0)
    /* 1DF08 8002DF08 1280103C */  lui        $s0, %hi(D_8011C514)
    /* 1DF0C 8002DF0C 14C51026 */  addiu      $s0, $s0, %lo(D_8011C514)
    /* 1DF10 8002DF10 21280002 */  addu       $a1, $s0, $zero
    /* 1DF14 8002DF14 8C2280AF */  sw         $zero, %gp_rel(D_8011CA0C)($gp)
    /* 1DF18 8002DF18 4375000C */  jal        strncmp
    /* 1DF1C 8002DF1C 06000624 */   addiu     $a2, $zero, 0x6
    /* 1DF20 8002DF20 0A004010 */  beqz       $v0, .L8002DF4C
    /* 1DF24 8002DF24 00000000 */   nop
    /* 1DF28 8002DF28 7CA2000C */  jal        getdirectory
    /* 1DF2C 8002DF2C 1800A427 */   addiu     $a0, $sp, 0x18
    /* 1DF30 8002DF30 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1DF34 8002DF34 21280002 */  addu       $a1, $s0, $zero
    /* 1DF38 8002DF38 4375000C */  jal        strncmp
    /* 1DF3C 8002DF3C 06000624 */   addiu     $a2, $zero, 0x6
    /* 1DF40 8002DF40 02004010 */  beqz       $v0, .L8002DF4C
    /* 1DF44 8002DF44 00000000 */   nop
    /* 1DF48 8002DF48 8C2291AF */  sw         $s1, %gp_rel(D_8011CA0C)($gp)
  .L8002DF4C:
    /* 1DF4C 8002DF4C 8C22828F */  lw         $v0, %gp_rel(D_8011CA0C)($gp)
    /* 1DF50 8002DF50 00000000 */  nop
    /* 1DF54 8002DF54 11004010 */  beqz       $v0, .L8002DF9C
    /* 1DF58 8002DF58 1801A227 */   addiu     $v0, $sp, 0x118
    /* 1DF5C 8002DF5C 781D878F */  lw         $a3, %gp_rel(cdms)($gp)
    /* 1DF60 8002DF60 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1DF64 8002DF64 8000E48C */  lw         $a0, 0x80($a3)
    /* 1DF68 8002DF68 1C00E524 */  addiu      $a1, $a3, 0x1C
    /* 1DF6C 8002DF6C 5000E624 */  addiu      $a2, $a3, 0x50
    /* 1DF70 8002DF70 4299000C */  jal        asyncopenblockhandle
    /* 1DF74 8002DF74 5800E724 */   addiu     $a3, $a3, 0x58
    /* 1DF78 8002DF78 91034010 */  beqz       $v0, .L8002EDC0
    /* 1DF7C 8002DF7C 00000000 */   nop
    /* 1DF80 8002DF80 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DF84 8002DF84 00000000 */  nop
    /* 1DF88 8002DF88 5800428C */  lw         $v0, 0x58($v0)
    /* 1DF8C 8002DF8C 8C1D91AF */  sw         $s1, %gp_rel(D_8011C50C)($gp)
    /* 1DF90 8002DF90 8C2282AF */  sw         $v0, %gp_rel(D_8011CA0C)($gp)
    /* 1DF94 8002DF94 F6B70008 */  j          .L8002DFD8
    /* 1DF98 8002DF98 00000000 */   nop
  .L8002DF9C:
    /* 1DF9C 8002DF9C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1DFA0 8002DFA0 00000000 */  nop
    /* 1DFA4 8002DFA4 2000478C */  lw         $a3, 0x20($v0)
    /* 1DFA8 8002DFA8 17000324 */  addiu      $v1, $zero, 0x17
    /* 1DFAC 8002DFAC 200043AC */  sw         $v1, 0x20($v0)
    /* 1DFB0 8002DFB0 8000448C */  lw         $a0, 0x80($v0)
    /* 1DFB4 8002DFB4 1280053C */  lui        $a1, %hi(D_8011C504)
    /* 1DFB8 8002DFB8 04C5A524 */  addiu      $a1, $a1, %lo(D_8011C504)
    /* 1DFBC 8002DFBC 1280063C */  lui        $a2, %hi(D_8011CA0C)
    /* 1DFC0 8002DFC0 0CCAC624 */  addiu      $a2, $a2, %lo(D_8011CA0C)
    /* 1DFC4 8002DFC4 902287AF */  sw         $a3, %gp_rel(D_8011CA10)($gp)
    /* 1DFC8 8002DFC8 C19F000C */  jal        directoryentrycached
    /* 1DFCC 8002DFCC 00000000 */   nop
    /* 1DFD0 8002DFD0 88034010 */  beqz       $v0, .L8002EDF4
    /* 1DFD4 8002DFD4 00000000 */   nop
  jlabel .L8002DFD8
    /* 1DFD8 8002DFD8 781D878F */  lw         $a3, %gp_rel(cdms)($gp)
    /* 1DFDC 8002DFDC 00000000 */  nop
    /* 1DFE0 8002DFE0 2000E38C */  lw         $v1, 0x20($a3)
    /* 1DFE4 8002DFE4 17000224 */  addiu      $v0, $zero, 0x17
    /* 1DFE8 8002DFE8 1D006214 */  bne        $v1, $v0, .L8002E060
    /* 1DFEC 8002DFEC 1801A227 */   addiu     $v0, $sp, 0x118
    /* 1DFF0 8002DFF0 841D858F */  lw         $a1, %gp_rel(D_8011C504)($gp)
    /* 1DFF4 8002DFF4 8C22868F */  lw         $a2, %gp_rel(D_8011CA0C)($gp)
    /* 1DFF8 8002DFF8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1DFFC 8002DFFC 8000E48C */  lw         $a0, 0x80($a3)
    /* 1E000 8002E000 E798000C */  jal        asyncopenblockhandlebysector
    /* 1E004 8002E004 1C00E724 */   addiu     $a3, $a3, 0x1C
    /* 1E008 8002E008 841D828F */  lw         $v0, %gp_rel(D_8011C504)($gp)
    /* 1E00C 8002E00C 00000000 */  nop
    /* 1E010 8002E010 0F004014 */  bnez       $v0, .L8002E050
    /* 1E014 8002E014 00000000 */   nop
    /* 1E018 8002E018 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E01C 8002E01C 00000000 */  nop
    /* 1E020 8002E020 8000458C */  lw         $a1, 0x80($v0)
    /* 1E024 8002E024 1180043C */  lui        $a0, %hi(D_8010FD88)
    /* 1E028 8002E028 88FD8424 */  addiu      $a0, $a0, %lo(D_8010FD88)
    /* 1E02C 8002E02C 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1E030 8002E030 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1E034 8002E034 1280013C */  lui        $at, %hi(abortfile)
    /* 1E038 8002E038 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1E03C 8002E03C 0A080224 */  addiu      $v0, $zero, 0x80A
    /* 1E040 8002E040 1280013C */  lui        $at, %hi(abortline)
    /* 1E044 8002E044 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1E048 8002E048 0F95000C */  jal        abortmessage
    /* 1E04C 8002E04C 00000000 */   nop
  .L8002E050:
    /* 1E050 8002E050 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E054 8002E054 9022838F */  lw         $v1, %gp_rel(D_8011CA10)($gp)
    /* 1E058 8002E058 280040AC */  sw         $zero, 0x28($v0)
    /* 1E05C 8002E05C 200043AC */  sw         $v1, 0x20($v0)
  .L8002E060:
    /* 1E060 8002E060 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E064 8002E064 8C22838F */  lw         $v1, %gp_rel(D_8011CA0C)($gp)
    /* 1E068 8002E068 00000000 */  nop
    /* 1E06C 8002E06C 580043AC */  sw         $v1, 0x58($v0)
    /* 1E070 8002E070 5800438C */  lw         $v1, 0x58($v0)
    /* 1E074 8002E074 00000000 */  nop
    /* 1E078 8002E078 540043AC */  sw         $v1, 0x54($v0)
    /* 1E07C 8002E07C 600040AC */  sw         $zero, 0x60($v0)
    /* 1E080 8002E080 500040AC */  sw         $zero, 0x50($v0)
    /* 1E084 8002E084 AFBC000C */  jal        streamsetnotfull
    /* 1E088 8002E088 00000000 */   nop
  jlabel .L8002E08C
    /* 1E08C 8002E08C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E090 8002E090 00000000 */  nop
    /* 1E094 8002E094 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
  .L8002E098:
    /* 1E098 8002E098 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E09C 8002E09C 00000000 */  nop
    /* 1E0A0 8002E0A0 0400438C */  lw         $v1, 0x4($v0)
    /* 1E0A4 8002E0A4 00000000 */  nop
    /* 1E0A8 8002E0A8 180043AC */  sw         $v1, 0x18($v0)
    /* 1E0AC 8002E0AC 1800438C */  lw         $v1, 0x18($v0)
    /* 1E0B0 8002E0B0 00000000 */  nop
    /* 1E0B4 8002E0B4 140043AC */  sw         $v1, 0x14($v0)
    /* 1E0B8 8002E0B8 1400438C */  lw         $v1, 0x14($v0)
    /* 1E0BC 8002E0BC 00000000 */  nop
    /* 1E0C0 8002E0C0 0C0043AC */  sw         $v1, 0xC($v0)
    /* 1E0C4 8002E0C4 0C00438C */  lw         $v1, 0xC($v0)
    /* 1E0C8 8002E0C8 00000000 */  nop
    /* 1E0CC 8002E0CC 100043AC */  sw         $v1, 0x10($v0)
    /* 1E0D0 8002E0D0 940040AC */  sw         $zero, 0x94($v0)
    /* 1E0D4 8002E0D4 9400438C */  lw         $v1, 0x94($v0)
    /* 1E0D8 8002E0D8 00000000 */  nop
    /* 1E0DC 8002E0DC 900043AC */  sw         $v1, 0x90($v0)
    /* 1E0E0 8002E0E0 7000428C */  lw         $v0, 0x70($v0)
    /* 1E0E4 8002E0E4 00000000 */  nop
    /* 1E0E8 8002E0E8 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
    /* 1E0EC 8002E0EC EAFF4014 */  bnez       $v0, .L8002E098
    /* 1E0F0 8002E0F0 00000000 */   nop
    /* 1E0F4 8002E0F4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E0F8 8002E0F8 00000000 */  nop
    /* 1E0FC 8002E0FC 2000838C */  lw         $v1, 0x20($a0)
    /* 1E100 8002E100 14000224 */  addiu      $v0, $zero, 0x14
    /* 1E104 8002E104 04006214 */  bne        $v1, $v0, .L8002E118
    /* 1E108 8002E108 02000224 */   addiu     $v0, $zero, 0x2
    /* 1E10C 8002E10C 200092AC */  sw         $s2, 0x20($a0)
    /* 1E110 8002E110 97B60008 */  j          .L8002DA5C
    /* 1E114 8002E114 00000000 */   nop
  .L8002E118:
    /* 1E118 8002E118 200082AC */  sw         $v0, 0x20($a0)
  jlabel .L8002E11C
    /* 1E11C 8002E11C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E120 8002E120 00000000 */  nop
    /* 1E124 8002E124 1400438C */  lw         $v1, 0x14($v0)
    /* 1E128 8002E128 00000000 */  nop
    /* 1E12C 8002E12C 100043AC */  sw         $v1, 0x10($v0)
    /* 1E130 8002E130 900040AC */  sw         $zero, 0x90($v0)
  jlabel .L8002E134
    /* 1E134 8002E134 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E138 8002E138 00000000 */  nop
    /* 1E13C 8002E13C 1000828C */  lw         $v0, 0x10($a0)
    /* 1E140 8002E140 00000000 */  nop
    /* 1E144 8002E144 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1E148 8002E148 FCBB000C */  jal        streamendspace
    /* 1E14C 8002E14C 00000000 */   nop
    /* 1E150 8002E150 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E154 8002E154 00000000 */  nop
    /* 1E158 8002E158 4000838C */  lw         $v1, 0x40($a0)
    /* 1E15C 8002E15C 00000000 */  nop
    /* 1E160 8002E160 2A186200 */  slt        $v1, $v1, $v0
    /* 1E164 8002E164 1C006014 */  bnez       $v1, .L8002E1D8
    /* 1E168 8002E168 00000000 */   nop
    /* 1E16C 8002E16C FCBB000C */  jal        streamendspace
    /* 1E170 8002E170 00000000 */   nop
    /* 1E174 8002E174 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E178 8002E178 D8BB000C */  jal        streamspace
    /* 1E17C 8002E17C 21804000 */   addu      $s0, $v0, $zero
    /* 1E180 8002E180 2E030216 */  bne        $s0, $v0, .L8002EE3C
    /* 1E184 8002E184 00000000 */   nop
    /* 1E188 8002E188 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E18C 8002E18C 0ABC000C */  jal        streamstartspace
    /* 1E190 8002E190 00000000 */   nop
    /* 1E194 8002E194 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E198 8002E198 00000000 */  nop
    /* 1E19C 8002E19C 4000838C */  lw         $v1, 0x40($a0)
    /* 1E1A0 8002E1A0 00000000 */  nop
    /* 1E1A4 8002E1A4 2A186200 */  slt        $v1, $v1, $v0
    /* 1E1A8 8002E1A8 24036010 */  beqz       $v1, .L8002EE3C
    /* 1E1AC 8002E1AC 00000000 */   nop
    /* 1E1B0 8002E1B0 1000838C */  lw         $v1, 0x10($a0)
    /* 1E1B4 8002E1B4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1E1B8 8002E1B8 000062AC */  sw         $v0, 0x0($v1)
    /* 1E1BC 8002E1BC 0400828C */  lw         $v0, 0x4($a0)
    /* 1E1C0 8002E1C0 00000000 */  nop
    /* 1E1C4 8002E1C4 100082AC */  sw         $v0, 0x10($a0)
    /* 1E1C8 8002E1C8 1000828C */  lw         $v0, 0x10($a0)
    /* 1E1CC 8002E1CC 00000000 */  nop
    /* 1E1D0 8002E1D0 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1E1D4 8002E1D4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
  .L8002E1D8:
    /* 1E1D8 8002E1D8 D8BB000C */  jal        streamspace
    /* 1E1DC 8002E1DC 00000000 */   nop
    /* 1E1E0 8002E1E0 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1E1E4 8002E1E4 00000000 */  nop
    /* 1E1E8 8002E1E8 4000A38C */  lw         $v1, 0x40($a1)
    /* 1E1EC 8002E1EC 00000000 */  nop
    /* 1E1F0 8002E1F0 2A186200 */  slt        $v1, $v1, $v0
    /* 1E1F4 8002E1F4 11036010 */  beqz       $v1, .L8002EE3C
    /* 1E1F8 8002E1F8 03000224 */   addiu     $v0, $zero, 0x3
    /* 1E1FC 8002E1FC 2000A2AC */  sw         $v0, 0x20($a1)
    /* 1E200 8002E200 1000A28C */  lw         $v0, 0x10($a1)
    /* 1E204 8002E204 00000000 */  nop
    /* 1E208 8002E208 0C00A2AC */  sw         $v0, 0xC($a1)
    /* 1E20C 8002E20C 6000A28C */  lw         $v0, 0x60($a1)
    /* 1E210 8002E210 00000000 */  nop
    /* 1E214 8002E214 5C00A2AC */  sw         $v0, 0x5C($a1)
    /* 1E218 8002E218 1C00A48C */  lw         $a0, 0x1C($a1)
    /* 1E21C 8002E21C 5C00A58C */  lw         $a1, 0x5C($a1)
    /* 1E220 8002E220 1D9C000C */  jal        asyncseekblockhandle
    /* 1E224 8002E224 00000000 */   nop
    /* 1E228 8002E228 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1E22C 8002E22C 00000000 */  nop
    /* 1E230 8002E230 640062AC */  sw         $v0, 0x64($v1)
    /* 1E234 8002E234 4C0060AC */  sw         $zero, 0x4C($v1)
  jlabel .L8002E238
    /* 1E238 8002E238 881D828F */  lw         $v0, %gp_rel(D_8011C508)($gp)
    /* 1E23C 8002E23C 00000000 */  nop
    /* 1E240 8002E240 03004228 */  slti       $v0, $v0, 0x3
    /* 1E244 8002E244 FEFD4010 */  beqz       $v0, .L8002DA40
    /* 1E248 8002E248 00000000 */   nop
    /* 1E24C 8002E24C 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E250 8002E250 00000000 */  nop
    /* 1E254 8002E254 4C00828C */  lw         $v0, 0x4C($a0)
    /* 1E258 8002E258 00000000 */  nop
    /* 1E25C 8002E25C 0800422C */  sltiu      $v0, $v0, 0x8
    /* 1E260 8002E260 58004010 */  beqz       $v0, .L8002E3C4
    /* 1E264 8002E264 00000000 */   nop
    /* 1E268 8002E268 FCBB000C */  jal        streamendspace
    /* 1E26C 8002E26C 00000000 */   nop
    /* 1E270 8002E270 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E274 8002E274 00000000 */  nop
    /* 1E278 8002E278 4000838C */  lw         $v1, 0x40($a0)
    /* 1E27C 8002E27C 00000000 */  nop
    /* 1E280 8002E280 2A186200 */  slt        $v1, $v1, $v0
    /* 1E284 8002E284 2C006014 */  bnez       $v1, .L8002E338
    /* 1E288 8002E288 00000000 */   nop
    /* 1E28C 8002E28C 2800828C */  lw         $v0, 0x28($a0)
    /* 1E290 8002E290 00000000 */  nop
    /* 1E294 8002E294 C5025110 */  beq        $v0, $s1, .L8002EDAC
    /* 1E298 8002E298 00000000 */   nop
    /* 1E29C 8002E29C FCBB000C */  jal        streamendspace
    /* 1E2A0 8002E2A0 00000000 */   nop
    /* 1E2A4 8002E2A4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E2A8 8002E2A8 D8BB000C */  jal        streamspace
    /* 1E2AC 8002E2AC 21804000 */   addu      $s0, $v0, $zero
    /* 1E2B0 8002E2B0 E2020216 */  bne        $s0, $v0, .L8002EE3C
    /* 1E2B4 8002E2B4 00000000 */   nop
    /* 1E2B8 8002E2B8 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E2BC 8002E2BC 0ABC000C */  jal        streamstartspace
    /* 1E2C0 8002E2C0 00000000 */   nop
    /* 1E2C4 8002E2C4 781D868F */  lw         $a2, %gp_rel(cdms)($gp)
    /* 1E2C8 8002E2C8 00000000 */  nop
    /* 1E2CC 8002E2CC 4C00C38C */  lw         $v1, 0x4C($a2)
    /* 1E2D0 8002E2D0 00000000 */  nop
    /* 1E2D4 8002E2D4 2A186200 */  slt        $v1, $v1, $v0
    /* 1E2D8 8002E2D8 D8026010 */  beqz       $v1, .L8002EE3C
    /* 1E2DC 8002E2DC 00000000 */   nop
    /* 1E2E0 8002E2E0 1000C48C */  lw         $a0, 0x10($a2)
    /* 1E2E4 8002E2E4 0400C58C */  lw         $a1, 0x4($a2)
    /* 1E2E8 8002E2E8 4C00C68C */  lw         $a2, 0x4C($a2)
    /* 1E2EC 8002E2EC F1B1000C */  jal        blockmove
    /* 1E2F0 8002E2F0 00000000 */   nop
    /* 1E2F4 8002E2F4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E2F8 8002E2F8 00000000 */  nop
    /* 1E2FC 8002E2FC 1000838C */  lw         $v1, 0x10($a0)
    /* 1E300 8002E300 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1E304 8002E304 000062AC */  sw         $v0, 0x0($v1)
    /* 1E308 8002E308 0400828C */  lw         $v0, 0x4($a0)
    /* 1E30C 8002E30C 00000000 */  nop
    /* 1E310 8002E310 100082AC */  sw         $v0, 0x10($a0)
    /* 1E314 8002E314 1000828C */  lw         $v0, 0x10($a0)
    /* 1E318 8002E318 00000000 */  nop
    /* 1E31C 8002E31C 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1E320 8002E320 0C00828C */  lw         $v0, 0xC($a0)
    /* 1E324 8002E324 4C00838C */  lw         $v1, 0x4C($a0)
    /* 1E328 8002E328 00000000 */  nop
    /* 1E32C 8002E32C 21104300 */  addu       $v0, $v0, $v1
    /* 1E330 8002E330 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1E334 8002E334 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
  .L8002E338:
    /* 1E338 8002E338 D8BB000C */  jal        streamspace
    /* 1E33C 8002E33C 00000000 */   nop
    /* 1E340 8002E340 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1E344 8002E344 00000000 */  nop
    /* 1E348 8002E348 4000A38C */  lw         $v1, 0x40($a1)
    /* 1E34C 8002E34C 00000000 */  nop
    /* 1E350 8002E350 2A186200 */  slt        $v1, $v1, $v0
    /* 1E354 8002E354 07006014 */  bnez       $v1, .L8002E374
    /* 1E358 8002E358 00000000 */   nop
    /* 1E35C 8002E35C 2800A28C */  lw         $v0, 0x28($a1)
    /* 1E360 8002E360 00000000 */  nop
    /* 1E364 8002E364 91025110 */  beq        $v0, $s1, .L8002EDAC
    /* 1E368 8002E368 00000000 */   nop
    /* 1E36C 8002E36C 8FBB0008 */  j          .L8002EE3C
    /* 1E370 8002E370 00000000 */   nop
  .L8002E374:
    /* 1E374 8002E374 2800B1AC */  sw         $s1, 0x28($a1)
    /* 1E378 8002E378 4000A48C */  lw         $a0, 0x40($a1)
    /* 1E37C 8002E37C 6400A38C */  lw         $v1, 0x64($a1)
    /* 1E380 8002E380 0C00B18C */  lw         $s1, 0xC($a1)
    /* 1E384 8002E384 6400A0AC */  sw         $zero, 0x64($a1)
    /* 1E388 8002E388 0C00A28C */  lw         $v0, 0xC($a1)
    /* 1E38C 8002E38C 23808300 */  subu       $s0, $a0, $v1
    /* 1E390 8002E390 21105000 */  addu       $v0, $v0, $s0
    /* 1E394 8002E394 0C00A2AC */  sw         $v0, 0xC($a1)
    /* 1E398 8002E398 5C00A28C */  lw         $v0, 0x5C($a1)
    /* 1E39C 8002E39C 00000000 */  nop
    /* 1E3A0 8002E3A0 21105000 */  addu       $v0, $v0, $s0
    /* 1E3A4 8002E3A4 5C00A2AC */  sw         $v0, 0x5C($a1)
    /* 1E3A8 8002E3A8 4C00A28C */  lw         $v0, 0x4C($a1)
    /* 1E3AC 8002E3AC 0380043C */  lui        $a0, %hi(localstreamreader)
    /* 1E3B0 8002E3B0 E0D98424 */  addiu      $a0, $a0, %lo(localstreamreader)
    /* 1E3B4 8002E3B4 21105000 */  addu       $v0, $v0, $s0
    /* 1E3B8 8002E3B8 4C00A2AC */  sw         $v0, 0x4C($a1)
    /* 1E3BC 8002E3BC 53BA0008 */  j          .L8002E94C
    /* 1E3C0 8002E3C0 00000000 */   nop
  .L8002E3C4:
    /* 1E3C4 8002E3C4 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E3C8 8002E3C8 00000000 */  nop
    /* 1E3CC 8002E3CC 1000448C */  lw         $a0, 0x10($v0)
    /* 1E3D0 8002E3D0 B9B2000C */  jal        getm
    /* 1E3D4 8002E3D4 04000524 */   addiu     $a1, $zero, 0x4
    /* 1E3D8 8002E3D8 4353033C */  lui        $v1, (0x5343456C >> 16)
    /* 1E3DC 8002E3DC 6C456334 */  ori        $v1, $v1, (0x5343456C & 0xFFFF)
    /* 1E3E0 8002E3E0 0F004314 */  bne        $v0, $v1, .L8002E420
    /* 1E3E4 8002E3E4 00000000 */   nop
    /* 1E3E8 8002E3E8 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1E3EC 8002E3EC 00000000 */  nop
    /* 1E3F0 8002E3F0 7800628C */  lw         $v0, 0x78($v1)
    /* 1E3F4 8002E3F4 00000000 */  nop
    /* 1E3F8 8002E3F8 0A004010 */  beqz       $v0, .L8002E424
    /* 1E3FC 8002E3FC 00000000 */   nop
    /* 1E400 8002E400 200072AC */  sw         $s2, 0x20($v1)
    /* 1E404 8002E404 97B60008 */  j          .L8002DA5C
    /* 1E408 8002E408 00000000 */   nop
  .L8002E40C:
    /* 1E40C 8002E40C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E410 8002E410 00000000 */  nop
    /* 1E414 8002E414 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
    /* 1E418 8002E418 27B90008 */  j          .L8002E49C
    /* 1E41C 8002E41C 00000000 */   nop
  .L8002E420:
    /* 1E420 8002E420 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
  .L8002E424:
    /* 1E424 8002E424 00000000 */  nop
    /* 1E428 8002E428 1000628C */  lw         $v0, 0x10($v1)
    /* 1E42C 8002E42C 00000000 */  nop
    /* 1E430 8002E430 0400428C */  lw         $v0, 0x4($v0)
    /* 1E434 8002E434 00000000 */  nop
    /* 1E438 8002E438 480062AC */  sw         $v0, 0x48($v1)
    /* 1E43C 8002E43C 4800628C */  lw         $v0, 0x48($v1)
    /* 1E440 8002E440 4C00648C */  lw         $a0, 0x4C($v1)
    /* 1E444 8002E444 7C1D83AF */  sw         $v1, %gp_rel(cdrs)($gp)
    /* 1E448 8002E448 23104400 */  subu       $v0, $v0, $a0
    /* 1E44C 8002E44C 440062AC */  sw         $v0, 0x44($v1)
  .L8002E450:
    /* 1E450 8002E450 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E454 8002E454 00000000 */  nop
    /* 1E458 8002E458 7000428C */  lw         $v0, 0x70($v0)
    /* 1E45C 8002E45C 00000000 */  nop
    /* 1E460 8002E460 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
    /* 1E464 8002E464 E9FF4010 */  beqz       $v0, .L8002E40C
    /* 1E468 8002E468 00000000 */   nop
    /* 1E46C 8002E46C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E470 8002E470 00000000 */  nop
    /* 1E474 8002E474 1000448C */  lw         $a0, 0x10($v0)
    /* 1E478 8002E478 B9B2000C */  jal        getm
    /* 1E47C 8002E47C 04000524 */   addiu     $a1, $zero, 0x4
    /* 1E480 8002E480 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1E484 8002E484 00000000 */  nop
    /* 1E488 8002E488 6C00648C */  lw         $a0, 0x6C($v1)
    /* 1E48C 8002E48C 6800638C */  lw         $v1, 0x68($v1)
    /* 1E490 8002E490 24104400 */  and        $v0, $v0, $a0
    /* 1E494 8002E494 EEFF6214 */  bne        $v1, $v0, .L8002E450
    /* 1E498 8002E498 00000000 */   nop
  .L8002E49C:
    /* 1E49C 8002E49C 781D878F */  lw         $a3, %gp_rel(cdms)($gp)
    /* 1E4A0 8002E4A0 00000000 */  nop
    /* 1E4A4 8002E4A4 4800E28C */  lw         $v0, 0x48($a3)
    /* 1E4A8 8002E4A8 00000000 */  nop
    /* 1E4AC 8002E4AC 08004228 */  slti       $v0, $v0, 0x8
    /* 1E4B0 8002E4B0 0B004014 */  bnez       $v0, .L8002E4E0
    /* 1E4B4 8002E4B4 00000000 */   nop
    /* 1E4B8 8002E4B8 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E4BC 8002E4BC 00000000 */  nop
    /* 1E4C0 8002E4C0 3C00428C */  lw         $v0, 0x3C($v0)
    /* 1E4C4 8002E4C4 4800E48C */  lw         $a0, 0x48($a3)
    /* 1E4C8 8002E4C8 C21F0200 */  srl        $v1, $v0, 31
    /* 1E4CC 8002E4CC 21104300 */  addu       $v0, $v0, $v1
    /* 1E4D0 8002E4D0 43100200 */  sra        $v0, $v0, 1
    /* 1E4D4 8002E4D4 2A104400 */  slt        $v0, $v0, $a0
    /* 1E4D8 8002E4D8 3D004010 */  beqz       $v0, .L8002E5D0
    /* 1E4DC 8002E4DC 00000000 */   nop
  .L8002E4E0:
    /* 1E4E0 8002E4E0 3000E28C */  lw         $v0, 0x30($a3)
    /* 1E4E4 8002E4E4 00000000 */  nop
    /* 1E4E8 8002E4E8 04004010 */  beqz       $v0, .L8002E4FC
    /* 1E4EC 8002E4EC 00000000 */   nop
    /* 1E4F0 8002E4F0 4800F3AC */  sw         $s3, 0x48($a3)
    /* 1E4F4 8002E4F4 74B90008 */  j          .L8002E5D0
    /* 1E4F8 8002E4F8 00000000 */   nop
  .L8002E4FC:
    /* 1E4FC 8002E4FC 2C00E28C */  lw         $v0, 0x2C($a3)
    /* 1E500 8002E500 00000000 */  nop
    /* 1E504 8002E504 16004010 */  beqz       $v0, .L8002E560
    /* 1E508 8002E508 00000000 */   nop
    /* 1E50C 8002E50C 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E510 8002E510 00000000 */  nop
    /* 1E514 8002E514 3C00428C */  lw         $v0, 0x3C($v0)
    /* 1E518 8002E518 00000000 */  nop
    /* 1E51C 8002E51C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1E520 8002E520 1000E58C */  lw         $a1, 0x10($a3)
    /* 1E524 8002E524 1000E68C */  lw         $a2, 0x10($a3)
    /* 1E528 8002E528 4800E78C */  lw         $a3, 0x48($a3)
    /* 1E52C 8002E52C 1180043C */  lui        $a0, %hi(D_8010FD9C)
    /* 1E530 8002E530 9CFD8424 */  addiu      $a0, $a0, %lo(D_8010FD9C)
    /* 1E534 8002E534 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1E538 8002E538 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1E53C 8002E53C 1280013C */  lui        $at, %hi(abortfile)
    /* 1E540 8002E540 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1E544 8002E544 8A080224 */  addiu      $v0, $zero, 0x88A
    /* 1E548 8002E548 1280013C */  lui        $at, %hi(abortline)
    /* 1E54C 8002E54C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1E550 8002E550 0F95000C */  jal        abortmessage
    /* 1E554 8002E554 00000000 */   nop
    /* 1E558 8002E558 74B90008 */  j          .L8002E5D0
    /* 1E55C 8002E55C 00000000 */   nop
  .L8002E560:
    /* 1E560 8002E560 7C1D87AF */  sw         $a3, %gp_rel(cdrs)($gp)
  .L8002E564:
    /* 1E564 8002E564 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1E568 8002E568 00000000 */  nop
    /* 1E56C 8002E56C 1000648C */  lw         $a0, 0x10($v1)
    /* 1E570 8002E570 6800628C */  lw         $v0, 0x68($v1)
    /* 1E574 8002E574 00000000 */  nop
    /* 1E578 8002E578 000082AC */  sw         $v0, 0x0($a0)
    /* 1E57C 8002E57C 1000628C */  lw         $v0, 0x10($v1)
    /* 1E580 8002E580 00000000 */  nop
    /* 1E584 8002E584 040053AC */  sw         $s3, 0x4($v0)
    /* 1E588 8002E588 1000628C */  lw         $v0, 0x10($v1)
    /* 1E58C 8002E58C 00000000 */  nop
    /* 1E590 8002E590 08004224 */  addiu      $v0, $v0, 0x8
    /* 1E594 8002E594 100062AC */  sw         $v0, 0x10($v1)
    /* 1E598 8002E598 1000628C */  lw         $v0, 0x10($v1)
    /* 1E59C 8002E59C 00000000 */  nop
    /* 1E5A0 8002E5A0 0C0062AC */  sw         $v0, 0xC($v1)
    /* 1E5A4 8002E5A4 7000628C */  lw         $v0, 0x70($v1)
    /* 1E5A8 8002E5A8 00000000 */  nop
    /* 1E5AC 8002E5AC 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
    /* 1E5B0 8002E5B0 ECFF4014 */  bnez       $v0, .L8002E564
    /* 1E5B4 8002E5B4 00000000 */   nop
    /* 1E5B8 8002E5B8 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E5BC 8002E5BC 00000000 */  nop
    /* 1E5C0 8002E5C0 200052AC */  sw         $s2, 0x20($v0)
    /* 1E5C4 8002E5C4 280040AC */  sw         $zero, 0x28($v0)
    /* 1E5C8 8002E5C8 99BB0008 */  j          .L8002EE64
    /* 1E5CC 8002E5CC 00000000 */   nop
  jlabel .L8002E5D0
    /* 1E5D0 8002E5D0 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E5D4 8002E5D4 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1E5D8 8002E5D8 00000000 */  nop
    /* 1E5DC 8002E5DC 6F008310 */  beq        $a0, $v1, .L8002E79C
    /* 1E5E0 8002E5E0 04000224 */   addiu     $v0, $zero, 0x4
    /* 1E5E4 8002E5E4 200062AC */  sw         $v0, 0x20($v1)
    /* 1E5E8 8002E5E8 2800628C */  lw         $v0, 0x28($v1)
    /* 1E5EC 8002E5EC 00000000 */  nop
    /* 1E5F0 8002E5F0 EE015110 */  beq        $v0, $s1, .L8002EDAC
    /* 1E5F4 8002E5F4 00000000 */   nop
    /* 1E5F8 8002E5F8 FCBB000C */  jal        streamendspace
    /* 1E5FC 8002E5FC 00000000 */   nop
    /* 1E600 8002E600 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1E604 8002E604 00000000 */  nop
    /* 1E608 8002E608 4800648C */  lw         $a0, 0x48($v1)
    /* 1E60C 8002E60C 4000638C */  lw         $v1, 0x40($v1)
    /* 1E610 8002E610 00000000 */  nop
    /* 1E614 8002E614 21208300 */  addu       $a0, $a0, $v1
    /* 1E618 8002E618 08008424 */  addiu      $a0, $a0, 0x8
    /* 1E61C 8002E61C 2B208200 */  sltu       $a0, $a0, $v0
    /* 1E620 8002E620 1E008014 */  bnez       $a0, .L8002E69C
    /* 1E624 8002E624 00000000 */   nop
    /* 1E628 8002E628 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E62C 8002E62C FCBB000C */  jal        streamendspace
    /* 1E630 8002E630 00000000 */   nop
    /* 1E634 8002E634 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E638 8002E638 D8BB000C */  jal        streamspace
    /* 1E63C 8002E63C 21804000 */   addu      $s0, $v0, $zero
    /* 1E640 8002E640 FE010216 */  bne        $s0, $v0, .L8002EE3C
    /* 1E644 8002E644 00000000 */   nop
    /* 1E648 8002E648 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E64C 8002E64C 0ABC000C */  jal        streamstartspace
    /* 1E650 8002E650 00000000 */   nop
    /* 1E654 8002E654 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1E658 8002E658 00000000 */  nop
    /* 1E65C 8002E65C 4C00638C */  lw         $v1, 0x4C($v1)
    /* 1E660 8002E660 00000000 */  nop
    /* 1E664 8002E664 2A186200 */  slt        $v1, $v1, $v0
    /* 1E668 8002E668 F4016010 */  beqz       $v1, .L8002EE3C
    /* 1E66C 8002E66C 00000000 */   nop
    /* 1E670 8002E670 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1E674 8002E674 00000000 */  nop
    /* 1E678 8002E678 1000648C */  lw         $a0, 0x10($v1)
    /* 1E67C 8002E67C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1E680 8002E680 000082AC */  sw         $v0, 0x0($a0)
    /* 1E684 8002E684 0400628C */  lw         $v0, 0x4($v1)
    /* 1E688 8002E688 00000000 */  nop
    /* 1E68C 8002E68C 100062AC */  sw         $v0, 0x10($v1)
    /* 1E690 8002E690 1000628C */  lw         $v0, 0x10($v1)
    /* 1E694 8002E694 00000000 */  nop
    /* 1E698 8002E698 0C0062AC */  sw         $v0, 0xC($v1)
  .L8002E69C:
    /* 1E69C 8002E69C 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E6A0 8002E6A0 D8BB000C */  jal        streamspace
    /* 1E6A4 8002E6A4 00000000 */   nop
    /* 1E6A8 8002E6A8 781D868F */  lw         $a2, %gp_rel(cdms)($gp)
    /* 1E6AC 8002E6AC 00000000 */  nop
    /* 1E6B0 8002E6B0 4000C38C */  lw         $v1, 0x40($a2)
    /* 1E6B4 8002E6B4 00000000 */  nop
    /* 1E6B8 8002E6B8 08006324 */  addiu      $v1, $v1, 0x8
    /* 1E6BC 8002E6BC 2B186200 */  sltu       $v1, $v1, $v0
    /* 1E6C0 8002E6C0 DE016010 */  beqz       $v1, .L8002EE3C
    /* 1E6C4 8002E6C4 00000000 */   nop
    /* 1E6C8 8002E6C8 4400C28C */  lw         $v0, 0x44($a2)
    /* 1E6CC 8002E6CC 00000000 */  nop
    /* 1E6D0 8002E6D0 14004004 */  bltz       $v0, .L8002E724
    /* 1E6D4 8002E6D4 00000000 */   nop
    /* 1E6D8 8002E6D8 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E6DC 8002E6DC 1000C48C */  lw         $a0, 0x10($a2)
    /* 1E6E0 8002E6E0 1000458C */  lw         $a1, 0x10($v0)
    /* 1E6E4 8002E6E4 4C00C68C */  lw         $a2, 0x4C($a2)
    /* 1E6E8 8002E6E8 F1B1000C */  jal        blockmove
    /* 1E6EC 8002E6EC 00000000 */   nop
    /* 1E6F0 8002E6F0 7C1D858F */  lw         $a1, %gp_rel(cdrs)($gp)
    /* 1E6F4 8002E6F4 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E6F8 8002E6F8 1000A28C */  lw         $v0, 0x10($a1)
    /* 1E6FC 8002E6FC 4C00838C */  lw         $v1, 0x4C($a0)
    /* 1E700 8002E700 00000000 */  nop
    /* 1E704 8002E704 21104300 */  addu       $v0, $v0, $v1
    /* 1E708 8002E708 0C00A2AC */  sw         $v0, 0xC($a1)
    /* 1E70C 8002E70C 1000828C */  lw         $v0, 0x10($a0)
    /* 1E710 8002E710 00000000 */  nop
    /* 1E714 8002E714 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1E718 8002E718 4C0080AC */  sw         $zero, 0x4C($a0)
    /* 1E71C 8002E71C E7B90008 */  j          .L8002E79C
    /* 1E720 8002E720 00000000 */   nop
  .L8002E724:
    /* 1E724 8002E724 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E728 8002E728 1000C48C */  lw         $a0, 0x10($a2)
    /* 1E72C 8002E72C 1000458C */  lw         $a1, 0x10($v0)
    /* 1E730 8002E730 4800C68C */  lw         $a2, 0x48($a2)
    /* 1E734 8002E734 F1B1000C */  jal        blockmove
    /* 1E738 8002E738 00000000 */   nop
    /* 1E73C 8002E73C 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E740 8002E740 781D868F */  lw         $a2, %gp_rel(cdms)($gp)
    /* 1E744 8002E744 1000828C */  lw         $v0, 0x10($a0)
    /* 1E748 8002E748 4800C38C */  lw         $v1, 0x48($a2)
    /* 1E74C 8002E74C 00000000 */  nop
    /* 1E750 8002E750 21104300 */  addu       $v0, $v0, $v1
    /* 1E754 8002E754 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1E758 8002E758 4400C28C */  lw         $v0, 0x44($a2)
    /* 1E75C 8002E75C 00000000 */  nop
    /* 1E760 8002E760 23100200 */  negu       $v0, $v0
    /* 1E764 8002E764 4C00C2AC */  sw         $v0, 0x4C($a2)
    /* 1E768 8002E768 1000C28C */  lw         $v0, 0x10($a2)
    /* 1E76C 8002E76C 4800C48C */  lw         $a0, 0x48($a2)
    /* 1E770 8002E770 1000C58C */  lw         $a1, 0x10($a2)
    /* 1E774 8002E774 4C00C68C */  lw         $a2, 0x4C($a2)
    /* 1E778 8002E778 F1B1000C */  jal        blockmove
    /* 1E77C 8002E77C 21204400 */   addu      $a0, $v0, $a0
    /* 1E780 8002E780 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E784 8002E784 00000000 */  nop
    /* 1E788 8002E788 0C00828C */  lw         $v0, 0xC($a0)
    /* 1E78C 8002E78C 4800838C */  lw         $v1, 0x48($a0)
    /* 1E790 8002E790 00000000 */  nop
    /* 1E794 8002E794 23104300 */  subu       $v0, $v0, $v1
    /* 1E798 8002E798 0C0082AC */  sw         $v0, 0xC($a0)
  jlabel .L8002E79C
    /* 1E79C 8002E79C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E7A0 8002E7A0 00000000 */  nop
    /* 1E7A4 8002E7A4 4400428C */  lw         $v0, 0x44($v0)
    /* 1E7A8 8002E7A8 00000000 */  nop
    /* 1E7AC 8002E7AC 39004018 */  blez       $v0, .L8002E894
    /* 1E7B0 8002E7B0 00000000 */   nop
    /* 1E7B4 8002E7B4 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E7B8 8002E7B8 FCBB000C */  jal        streamendspace
    /* 1E7BC 8002E7BC 00000000 */   nop
    /* 1E7C0 8002E7C0 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1E7C4 8002E7C4 00000000 */  nop
    /* 1E7C8 8002E7C8 4400A38C */  lw         $v1, 0x44($a1)
    /* 1E7CC 8002E7CC 4000A48C */  lw         $a0, 0x40($a1)
    /* 1E7D0 8002E7D0 00000000 */  nop
    /* 1E7D4 8002E7D4 21186400 */  addu       $v1, $v1, $a0
    /* 1E7D8 8002E7D8 08006324 */  addiu      $v1, $v1, 0x8
    /* 1E7DC 8002E7DC 2B186200 */  sltu       $v1, $v1, $v0
    /* 1E7E0 8002E7E0 2C006014 */  bnez       $v1, .L8002E894
    /* 1E7E4 8002E7E4 05000224 */   addiu     $v0, $zero, 0x5
    /* 1E7E8 8002E7E8 2000A2AC */  sw         $v0, 0x20($a1)
    /* 1E7EC 8002E7EC 2800A28C */  lw         $v0, 0x28($a1)
    /* 1E7F0 8002E7F0 00000000 */  nop
    /* 1E7F4 8002E7F4 6D015110 */  beq        $v0, $s1, .L8002EDAC
    /* 1E7F8 8002E7F8 00000000 */   nop
    /* 1E7FC 8002E7FC 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E800 8002E800 FCBB000C */  jal        streamendspace
    /* 1E804 8002E804 00000000 */   nop
    /* 1E808 8002E808 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E80C 8002E80C D8BB000C */  jal        streamspace
    /* 1E810 8002E810 21804000 */   addu      $s0, $v0, $zero
    /* 1E814 8002E814 89010216 */  bne        $s0, $v0, .L8002EE3C
    /* 1E818 8002E818 00000000 */   nop
    /* 1E81C 8002E81C 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E820 8002E820 0ABC000C */  jal        streamstartspace
    /* 1E824 8002E824 00000000 */   nop
    /* 1E828 8002E828 781D868F */  lw         $a2, %gp_rel(cdms)($gp)
    /* 1E82C 8002E82C 00000000 */  nop
    /* 1E830 8002E830 4C00C38C */  lw         $v1, 0x4C($a2)
    /* 1E834 8002E834 00000000 */  nop
    /* 1E838 8002E838 2A186200 */  slt        $v1, $v1, $v0
    /* 1E83C 8002E83C 7F016010 */  beqz       $v1, .L8002EE3C
    /* 1E840 8002E840 00000000 */   nop
    /* 1E844 8002E844 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E848 8002E848 00000000 */  nop
    /* 1E84C 8002E84C 1000448C */  lw         $a0, 0x10($v0)
    /* 1E850 8002E850 0400458C */  lw         $a1, 0x4($v0)
    /* 1E854 8002E854 4C00C68C */  lw         $a2, 0x4C($a2)
    /* 1E858 8002E858 F1B1000C */  jal        blockmove
    /* 1E85C 8002E85C 00000000 */   nop
    /* 1E860 8002E860 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E864 8002E864 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1E868 8002E868 1000838C */  lw         $v1, 0x10($a0)
    /* 1E86C 8002E86C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1E870 8002E870 000062AC */  sw         $v0, 0x0($v1)
    /* 1E874 8002E874 0400828C */  lw         $v0, 0x4($a0)
    /* 1E878 8002E878 4C00A38C */  lw         $v1, 0x4C($a1)
    /* 1E87C 8002E87C 00000000 */  nop
    /* 1E880 8002E880 21104300 */  addu       $v0, $v0, $v1
    /* 1E884 8002E884 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1E888 8002E888 0400828C */  lw         $v0, 0x4($a0)
    /* 1E88C 8002E88C 00000000 */  nop
    /* 1E890 8002E890 100082AC */  sw         $v0, 0x10($a0)
  jlabel .L8002E894
    /* 1E894 8002E894 881D838F */  lw         $v1, %gp_rel(D_8011C508)($gp)
    /* 1E898 8002E898 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1E89C 8002E89C 06000224 */  addiu      $v0, $zero, 0x6
    /* 1E8A0 8002E8A0 03006328 */  slti       $v1, $v1, 0x3
    /* 1E8A4 8002E8A4 200082AC */  sw         $v0, 0x20($a0)
    /* 1E8A8 8002E8A8 65FC6010 */  beqz       $v1, .L8002DA40
    /* 1E8AC 8002E8AC 00000000 */   nop
    /* 1E8B0 8002E8B0 4400828C */  lw         $v0, 0x44($a0)
    /* 1E8B4 8002E8B4 00000000 */  nop
    /* 1E8B8 8002E8B8 2E004018 */  blez       $v0, .L8002E974
    /* 1E8BC 8002E8BC 00000000 */   nop
    /* 1E8C0 8002E8C0 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E8C4 8002E8C4 D8BB000C */  jal        streamspace
    /* 1E8C8 8002E8C8 00000000 */   nop
    /* 1E8CC 8002E8CC 781D868F */  lw         $a2, %gp_rel(cdms)($gp)
    /* 1E8D0 8002E8D0 00000000 */  nop
    /* 1E8D4 8002E8D4 4000C38C */  lw         $v1, 0x40($a2)
    /* 1E8D8 8002E8D8 00000000 */  nop
    /* 1E8DC 8002E8DC 2A186200 */  slt        $v1, $v1, $v0
    /* 1E8E0 8002E8E0 07006014 */  bnez       $v1, .L8002E900
    /* 1E8E4 8002E8E4 00000000 */   nop
    /* 1E8E8 8002E8E8 2800C28C */  lw         $v0, 0x28($a2)
    /* 1E8EC 8002E8EC 00000000 */  nop
    /* 1E8F0 8002E8F0 2E015110 */  beq        $v0, $s1, .L8002EDAC
    /* 1E8F4 8002E8F4 00000000 */   nop
    /* 1E8F8 8002E8F8 8FBB0008 */  j          .L8002EE3C
    /* 1E8FC 8002E8FC 00000000 */   nop
  .L8002E900:
    /* 1E900 8002E900 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1E904 8002E904 2800D1AC */  sw         $s1, 0x28($a2)
    /* 1E908 8002E908 4000C58C */  lw         $a1, 0x40($a2)
    /* 1E90C 8002E90C 6400C48C */  lw         $a0, 0x64($a2)
    /* 1E910 8002E910 0C00718C */  lw         $s1, 0xC($v1)
    /* 1E914 8002E914 6400C0AC */  sw         $zero, 0x64($a2)
    /* 1E918 8002E918 5C00C28C */  lw         $v0, 0x5C($a2)
    /* 1E91C 8002E91C 2380A400 */  subu       $s0, $a1, $a0
    /* 1E920 8002E920 21105000 */  addu       $v0, $v0, $s0
    /* 1E924 8002E924 5C00C2AC */  sw         $v0, 0x5C($a2)
    /* 1E928 8002E928 0C00628C */  lw         $v0, 0xC($v1)
    /* 1E92C 8002E92C 00000000 */  nop
    /* 1E930 8002E930 21105000 */  addu       $v0, $v0, $s0
    /* 1E934 8002E934 0C0062AC */  sw         $v0, 0xC($v1)
    /* 1E938 8002E938 4400C28C */  lw         $v0, 0x44($a2)
    /* 1E93C 8002E93C 0380043C */  lui        $a0, %hi(localstreamreader)
    /* 1E940 8002E940 E0D98424 */  addiu      $a0, $a0, %lo(localstreamreader)
    /* 1E944 8002E944 23105000 */  subu       $v0, $v0, $s0
    /* 1E948 8002E948 4400C2AC */  sw         $v0, 0x44($a2)
  .L8002E94C:
    /* 1E94C 8002E94C 449A000C */  jal        asyncreadblockcallback
    /* 1E950 8002E950 00000000 */   nop
    /* 1E954 8002E954 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E958 8002E958 00000000 */  nop
    /* 1E95C 8002E95C 1C00448C */  lw         $a0, 0x1C($v0)
    /* 1E960 8002E960 21282002 */  addu       $a1, $s1, $zero
    /* 1E964 8002E964 239B000C */  jal        asyncreadblockhandle
    /* 1E968 8002E968 21300002 */   addu      $a2, $s0, $zero
    /* 1E96C 8002E96C 99BB0008 */  j          .L8002EE64
    /* 1E970 8002E970 00000000 */   nop
  .L8002E974:
    /* 1E974 8002E974 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1E978 8002E978 00000000 */  nop
    /* 1E97C 8002E97C 1000448C */  lw         $a0, 0x10($v0)
    /* 1E980 8002E980 B9B2000C */  jal        getm
    /* 1E984 8002E984 04000524 */   addiu     $a1, $zero, 0x4
    /* 1E988 8002E988 4353033C */  lui        $v1, (0x5343456C >> 16)
    /* 1E98C 8002E98C 6C456334 */  ori        $v1, $v1, (0x5343456C & 0xFFFF)
    /* 1E990 8002E990 10004314 */  bne        $v0, $v1, .L8002E9D4
    /* 1E994 8002E994 00000000 */   nop
    /* 1E998 8002E998 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1E99C 8002E99C 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1E9A0 8002E9A0 1000828C */  lw         $v0, 0x10($a0)
    /* 1E9A4 8002E9A4 4800A38C */  lw         $v1, 0x48($a1)
    /* 1E9A8 8002E9A8 00000000 */  nop
    /* 1E9AC 8002E9AC 21104300 */  addu       $v0, $v0, $v1
    /* 1E9B0 8002E9B0 100082AC */  sw         $v0, 0x10($a0)
    /* 1E9B4 8002E9B4 9000828C */  lw         $v0, 0x90($a0)
    /* 1E9B8 8002E9B8 4800A38C */  lw         $v1, 0x48($a1)
    /* 1E9BC 8002E9BC F8FF4224 */  addiu      $v0, $v0, -0x8
    /* 1E9C0 8002E9C0 21104300 */  addu       $v0, $v0, $v1
    /* 1E9C4 8002E9C4 900082AC */  sw         $v0, 0x90($a0)
    /* 1E9C8 8002E9C8 2000B2AC */  sw         $s2, 0x20($a1)
    /* 1E9CC 8002E9CC 97B60008 */  j          .L8002DA5C
    /* 1E9D0 8002E9D0 00000000 */   nop
  .L8002E9D4:
    /* 1E9D4 8002E9D4 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1E9D8 8002E9D8 00000000 */  nop
    /* 1E9DC 8002E9DC 3000A28C */  lw         $v0, 0x30($a1)
    /* 1E9E0 8002E9E0 00000000 */  nop
    /* 1E9E4 8002E9E4 46004010 */  beqz       $v0, .L8002EB00
    /* 1E9E8 8002E9E8 00000000 */   nop
    /* 1E9EC 8002E9EC 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1E9F0 8002E9F0 00000000 */  nop
    /* 1E9F4 8002E9F4 1000438C */  lw         $v1, 0x10($v0)
    /* 1E9F8 8002E9F8 1000448C */  lw         $a0, 0x10($v0)
    /* 1E9FC 8002E9FC 0800708C */  lw         $s0, 0x8($v1)
    /* 1EA00 8002EA00 080080AC */  sw         $zero, 0x8($a0)
    /* 1EA04 8002EA04 1000448C */  lw         $a0, 0x10($v0)
    /* 1EA08 8002EA08 4800A58C */  lw         $a1, 0x48($a1)
    /* 1EA0C 8002EA0C EDA5000C */  jal        crc16
    /* 1EA10 8002EA10 00000000 */   nop
    /* 1EA14 8002EA14 37000212 */  beq        $s0, $v0, .L8002EAF4
    /* 1EA18 8002EA18 00000000 */   nop
    /* 1EA1C 8002EA1C 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1EA20 8002EA20 00000000 */  nop
    /* 1EA24 8002EA24 3400628C */  lw         $v0, 0x34($v1)
    /* 1EA28 8002EA28 00000000 */  nop
    /* 1EA2C 8002EA2C 01004224 */  addiu      $v0, $v0, 0x1
    /* 1EA30 8002EA30 340062AC */  sw         $v0, 0x34($v1)
    /* 1EA34 8002EA34 3400628C */  lw         $v0, 0x34($v1)
    /* 1EA38 8002EA38 3800628C */  lw         $v0, 0x38($v1)
    /* 1EA3C 8002EA3C 00000000 */  nop
    /* 1EA40 8002EA40 01004224 */  addiu      $v0, $v0, 0x1
    /* 1EA44 8002EA44 380062AC */  sw         $v0, 0x38($v1)
    /* 1EA48 8002EA48 3800628C */  lw         $v0, 0x38($v1)
    /* 1EA4C 8002EA4C 3800628C */  lw         $v0, 0x38($v1)
    /* 1EA50 8002EA50 00000000 */  nop
    /* 1EA54 8002EA54 0B004228 */  slti       $v0, $v0, 0xB
    /* 1EA58 8002EA58 16004014 */  bnez       $v0, .L8002EAB4
    /* 1EA5C 8002EA5C 00000000 */   nop
    /* 1EA60 8002EA60 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1EA64 8002EA64 00000000 */  nop
    /* 1EA68 8002EA68 1000448C */  lw         $a0, 0x10($v0)
    /* 1EA6C 8002EA6C 4800658C */  lw         $a1, 0x48($v1)
    /* 1EA70 8002EA70 EDA5000C */  jal        crc16
    /* 1EA74 8002EA74 00000000 */   nop
    /* 1EA78 8002EA78 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1EA7C 8002EA7C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1EA80 8002EA80 1000658C */  lw         $a1, 0x10($v1)
    /* 1EA84 8002EA84 4800668C */  lw         $a2, 0x48($v1)
    /* 1EA88 8002EA88 1180043C */  lui        $a0, %hi(D_8010FDF0)
    /* 1EA8C 8002EA8C F0FD8424 */  addiu      $a0, $a0, %lo(D_8010FDF0)
    /* 1EA90 8002EA90 1180023C */  lui        $v0, %hi(D_8010FAF8)
    /* 1EA94 8002EA94 F8FA4224 */  addiu      $v0, $v0, %lo(D_8010FAF8)
    /* 1EA98 8002EA98 1280013C */  lui        $at, %hi(abortfile)
    /* 1EA9C 8002EA9C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1EAA0 8002EAA0 02090224 */  addiu      $v0, $zero, 0x902
    /* 1EAA4 8002EAA4 1280013C */  lui        $at, %hi(abortline)
    /* 1EAA8 8002EAA8 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1EAAC 8002EAAC 0F95000C */  jal        abortmessage
    /* 1EAB0 8002EAB0 21380002 */   addu      $a3, $s0, $zero
  .L8002EAB4:
    /* 1EAB4 8002EAB4 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1EAB8 8002EAB8 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1EABC 8002EABC 0C00438C */  lw         $v1, 0xC($v0)
    /* 1EAC0 8002EAC0 1000448C */  lw         $a0, 0x10($v0)
    /* 1EAC4 8002EAC4 5C00A28C */  lw         $v0, 0x5C($a1)
    /* 1EAC8 8002EAC8 23186400 */  subu       $v1, $v1, $a0
    /* 1EACC 8002EACC 23104300 */  subu       $v0, $v0, $v1
    /* 1EAD0 8002EAD0 6000A2AC */  sw         $v0, 0x60($a1)
    /* 1EAD4 8002EAD4 10000224 */  addiu      $v0, $zero, 0x10
    /* 1EAD8 8002EAD8 2000A2AC */  sw         $v0, 0x20($a1)
    /* 1EADC 8002EADC 2800A28C */  lw         $v0, 0x28($a1)
    /* 1EAE0 8002EAE0 00000000 */  nop
    /* 1EAE4 8002EAE4 B1005110 */  beq        $v0, $s1, .L8002EDAC
    /* 1EAE8 8002EAE8 00000000 */   nop
    /* 1EAEC 8002EAEC 97B60008 */  j          .L8002DA5C
    /* 1EAF0 8002EAF0 00000000 */   nop
  .L8002EAF4:
    /* 1EAF4 8002EAF4 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1EAF8 8002EAF8 00000000 */  nop
    /* 1EAFC 8002EAFC 380040AC */  sw         $zero, 0x38($v0)
  .L8002EB00:
    /* 1EB00 8002EB00 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1EB04 8002EB04 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1EB08 8002EB08 1000828C */  lw         $v0, 0x10($a0)
    /* 1EB0C 8002EB0C 4800A38C */  lw         $v1, 0x48($a1)
    /* 1EB10 8002EB10 00000000 */  nop
    /* 1EB14 8002EB14 21104300 */  addu       $v0, $v0, $v1
    /* 1EB18 8002EB18 100082AC */  sw         $v0, 0x10($a0)
    /* 1EB1C 8002EB1C 9000828C */  lw         $v0, 0x90($a0)
    /* 1EB20 8002EB20 4800A38C */  lw         $v1, 0x48($a1)
    /* 1EB24 8002EB24 F8FF4224 */  addiu      $v0, $v0, -0x8
    /* 1EB28 8002EB28 21104300 */  addu       $v0, $v0, $v1
    /* 1EB2C 8002EB2C 900082AC */  sw         $v0, 0x90($a0)
    /* 1EB30 8002EB30 0A000224 */  addiu      $v0, $zero, 0xA
    /* 1EB34 8002EB34 2000A2AC */  sw         $v0, 0x20($a1)
  jlabel .L8002EB38
    /* 1EB38 8002EB38 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1EB3C 8002EB3C 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1EB40 8002EB40 00000000 */  nop
    /* 1EB44 8002EB44 56008310 */  beq        $a0, $v1, .L8002ECA0
    /* 1EB48 8002EB48 0A000224 */   addiu     $v0, $zero, 0xA
    /* 1EB4C 8002EB4C 200062AC */  sw         $v0, 0x20($v1)
    /* 1EB50 8002EB50 4C00628C */  lw         $v0, 0x4C($v1)
    /* 1EB54 8002EB54 00000000 */  nop
    /* 1EB58 8002EB58 56004014 */  bnez       $v0, .L8002ECB4
    /* 1EB5C 8002EB5C 00000000 */   nop
    /* 1EB60 8002EB60 2800628C */  lw         $v0, 0x28($v1)
    /* 1EB64 8002EB64 00000000 */  nop
    /* 1EB68 8002EB68 90005110 */  beq        $v0, $s1, .L8002EDAC
    /* 1EB6C 8002EB6C 00000000 */   nop
    /* 1EB70 8002EB70 FCBB000C */  jal        streamendspace
    /* 1EB74 8002EB74 21206000 */   addu      $a0, $v1, $zero
    /* 1EB78 8002EB78 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1EB7C 8002EB7C 00000000 */  nop
    /* 1EB80 8002EB80 0C00648C */  lw         $a0, 0xC($v1)
    /* 1EB84 8002EB84 1000638C */  lw         $v1, 0x10($v1)
    /* 1EB88 8002EB88 00000000 */  nop
    /* 1EB8C 8002EB8C 23208300 */  subu       $a0, $a0, $v1
    /* 1EB90 8002EB90 2A208200 */  slt        $a0, $a0, $v0
    /* 1EB94 8002EB94 20008014 */  bnez       $a0, .L8002EC18
    /* 1EB98 8002EB98 00000000 */   nop
    /* 1EB9C 8002EB9C 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1EBA0 8002EBA0 FCBB000C */  jal        streamendspace
    /* 1EBA4 8002EBA4 00000000 */   nop
    /* 1EBA8 8002EBA8 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1EBAC 8002EBAC D8BB000C */  jal        streamspace
    /* 1EBB0 8002EBB0 21804000 */   addu      $s0, $v0, $zero
    /* 1EBB4 8002EBB4 A1000216 */  bne        $s0, $v0, .L8002EE3C
    /* 1EBB8 8002EBB8 00000000 */   nop
    /* 1EBBC 8002EBBC 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1EBC0 8002EBC0 0ABC000C */  jal        streamstartspace
    /* 1EBC4 8002EBC4 00000000 */   nop
    /* 1EBC8 8002EBC8 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1EBCC 8002EBCC 00000000 */  nop
    /* 1EBD0 8002EBD0 0C00648C */  lw         $a0, 0xC($v1)
    /* 1EBD4 8002EBD4 1000638C */  lw         $v1, 0x10($v1)
    /* 1EBD8 8002EBD8 00000000 */  nop
    /* 1EBDC 8002EBDC 23208300 */  subu       $a0, $a0, $v1
    /* 1EBE0 8002EBE0 2A208200 */  slt        $a0, $a0, $v0
    /* 1EBE4 8002EBE4 95008010 */  beqz       $a0, .L8002EE3C
    /* 1EBE8 8002EBE8 00000000 */   nop
    /* 1EBEC 8002EBEC 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1EBF0 8002EBF0 00000000 */  nop
    /* 1EBF4 8002EBF4 1000648C */  lw         $a0, 0x10($v1)
    /* 1EBF8 8002EBF8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1EBFC 8002EBFC 000082AC */  sw         $v0, 0x0($a0)
    /* 1EC00 8002EC00 0400628C */  lw         $v0, 0x4($v1)
    /* 1EC04 8002EC04 00000000 */  nop
    /* 1EC08 8002EC08 100062AC */  sw         $v0, 0x10($v1)
    /* 1EC0C 8002EC0C 1000628C */  lw         $v0, 0x10($v1)
    /* 1EC10 8002EC10 00000000 */  nop
    /* 1EC14 8002EC14 0C0062AC */  sw         $v0, 0xC($v1)
  .L8002EC18:
    /* 1EC18 8002EC18 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1EC1C 8002EC1C D8BB000C */  jal        streamspace
    /* 1EC20 8002EC20 00000000 */   nop
    /* 1EC24 8002EC24 7C1D858F */  lw         $a1, %gp_rel(cdrs)($gp)
    /* 1EC28 8002EC28 00000000 */  nop
    /* 1EC2C 8002EC2C 0C00A38C */  lw         $v1, 0xC($a1)
    /* 1EC30 8002EC30 1000A48C */  lw         $a0, 0x10($a1)
    /* 1EC34 8002EC34 00000000 */  nop
    /* 1EC38 8002EC38 23186400 */  subu       $v1, $v1, $a0
    /* 1EC3C 8002EC3C 2A186200 */  slt        $v1, $v1, $v0
    /* 1EC40 8002EC40 7E006010 */  beqz       $v1, .L8002EE3C
    /* 1EC44 8002EC44 00000000 */   nop
    /* 1EC48 8002EC48 0C00A28C */  lw         $v0, 0xC($a1)
    /* 1EC4C 8002EC4C 1000A48C */  lw         $a0, 0x10($a1)
    /* 1EC50 8002EC50 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1EC54 8002EC54 23104400 */  subu       $v0, $v0, $a0
    /* 1EC58 8002EC58 4C0062AC */  sw         $v0, 0x4C($v1)
    /* 1EC5C 8002EC5C 1000A48C */  lw         $a0, 0x10($a1)
    /* 1EC60 8002EC60 1000658C */  lw         $a1, 0x10($v1)
    /* 1EC64 8002EC64 4C00668C */  lw         $a2, 0x4C($v1)
    /* 1EC68 8002EC68 F1B1000C */  jal        blockmove
    /* 1EC6C 8002EC6C 00000000 */   nop
    /* 1EC70 8002EC70 7C1D828F */  lw         $v0, %gp_rel(cdrs)($gp)
    /* 1EC74 8002EC74 781D848F */  lw         $a0, %gp_rel(cdms)($gp)
    /* 1EC78 8002EC78 1000438C */  lw         $v1, 0x10($v0)
    /* 1EC7C 8002EC7C 00000000 */  nop
    /* 1EC80 8002EC80 0C0043AC */  sw         $v1, 0xC($v0)
    /* 1EC84 8002EC84 1000828C */  lw         $v0, 0x10($a0)
    /* 1EC88 8002EC88 4C00838C */  lw         $v1, 0x4C($a0)
    /* 1EC8C 8002EC8C 00000000 */  nop
    /* 1EC90 8002EC90 21104300 */  addu       $v0, $v0, $v1
    /* 1EC94 8002EC94 0C0082AC */  sw         $v0, 0xC($a0)
    /* 1EC98 8002EC98 2DBB0008 */  j          .L8002ECB4
    /* 1EC9C 8002EC9C 00000000 */   nop
  .L8002ECA0:
    /* 1ECA0 8002ECA0 0C00828C */  lw         $v0, 0xC($a0)
    /* 1ECA4 8002ECA4 1000838C */  lw         $v1, 0x10($a0)
    /* 1ECA8 8002ECA8 00000000 */  nop
    /* 1ECAC 8002ECAC 23104300 */  subu       $v0, $v0, $v1
    /* 1ECB0 8002ECB0 4C0082AC */  sw         $v0, 0x4C($a0)
  jlabel .L8002ECB4
    /* 1ECB4 8002ECB4 781D858F */  lw         $a1, %gp_rel(cdms)($gp)
    /* 1ECB8 8002ECB8 00000000 */  nop
    /* 1ECBC 8002ECBC 5C00A28C */  lw         $v0, 0x5C($a1)
    /* 1ECC0 8002ECC0 4C00A38C */  lw         $v1, 0x4C($a1)
    /* 1ECC4 8002ECC4 5400A48C */  lw         $a0, 0x54($a1)
    /* 1ECC8 8002ECC8 23104300 */  subu       $v0, $v0, $v1
    /* 1ECCC 8002ECCC 2A104400 */  slt        $v0, $v0, $a0
    /* 1ECD0 8002ECD0 33004014 */  bnez       $v0, .L8002EDA0
    /* 1ECD4 8002ECD4 03000224 */   addiu     $v0, $zero, 0x3
    /* 1ECD8 8002ECD8 7800A28C */  lw         $v0, 0x78($a1)
    /* 1ECDC 8002ECDC 00000000 */  nop
    /* 1ECE0 8002ECE0 2A004014 */  bnez       $v0, .L8002ED8C
    /* 1ECE4 8002ECE4 09000224 */   addiu     $v0, $zero, 0x9
    /* 1ECE8 8002ECE8 2000A2AC */  sw         $v0, 0x20($a1)
    /* 1ECEC 8002ECEC 7C1D85AF */  sw         $a1, %gp_rel(cdrs)($gp)
  .L8002ECF0:
    /* 1ECF0 8002ECF0 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1ECF4 8002ECF4 D8BB000C */  jal        streamspace
    /* 1ECF8 8002ECF8 00000000 */   nop
    /* 1ECFC 8002ECFC 7C1D848F */  lw         $a0, %gp_rel(cdrs)($gp)
    /* 1ED00 8002ED00 00000000 */  nop
    /* 1ED04 8002ED04 4C00838C */  lw         $v1, 0x4C($a0)
    /* 1ED08 8002ED08 00000000 */  nop
    /* 1ED0C 8002ED0C 21104300 */  addu       $v0, $v0, $v1
    /* 1ED10 8002ED10 0900422C */  sltiu      $v0, $v0, 0x9
    /* 1ED14 8002ED14 25004014 */  bnez       $v0, .L8002EDAC
    /* 1ED18 8002ED18 00000000 */   nop
    /* 1ED1C 8002ED1C 7000828C */  lw         $v0, 0x70($a0)
    /* 1ED20 8002ED20 00000000 */  nop
    /* 1ED24 8002ED24 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
    /* 1ED28 8002ED28 F1FF4014 */  bnez       $v0, .L8002ECF0
    /* 1ED2C 8002ED2C FDFF0424 */   addiu     $a0, $zero, -0x3
    /* 1ED30 8002ED30 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1ED34 8002ED34 00000000 */  nop
    /* 1ED38 8002ED38 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
  .L8002ED3C:
    /* 1ED3C 8002ED3C 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1ED40 8002ED40 00000000 */  nop
    /* 1ED44 8002ED44 1000628C */  lw         $v0, 0x10($v1)
    /* 1ED48 8002ED48 00000000 */  nop
    /* 1ED4C 8002ED4C 000044AC */  sw         $a0, 0x0($v0)
    /* 1ED50 8002ED50 1000628C */  lw         $v0, 0x10($v1)
    /* 1ED54 8002ED54 00000000 */  nop
    /* 1ED58 8002ED58 040053AC */  sw         $s3, 0x4($v0)
    /* 1ED5C 8002ED5C 1000628C */  lw         $v0, 0x10($v1)
    /* 1ED60 8002ED60 00000000 */  nop
    /* 1ED64 8002ED64 08004224 */  addiu      $v0, $v0, 0x8
    /* 1ED68 8002ED68 100062AC */  sw         $v0, 0x10($v1)
    /* 1ED6C 8002ED6C 1000628C */  lw         $v0, 0x10($v1)
    /* 1ED70 8002ED70 00000000 */  nop
    /* 1ED74 8002ED74 0C0062AC */  sw         $v0, 0xC($v1)
    /* 1ED78 8002ED78 7000628C */  lw         $v0, 0x70($v1)
    /* 1ED7C 8002ED7C 00000000 */  nop
    /* 1ED80 8002ED80 7C1D82AF */  sw         $v0, %gp_rel(cdrs)($gp)
    /* 1ED84 8002ED84 EDFF4014 */  bnez       $v0, .L8002ED3C
    /* 1ED88 8002ED88 00000000 */   nop
  .L8002ED8C:
    /* 1ED8C 8002ED8C 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1ED90 8002ED90 00000000 */  nop
    /* 1ED94 8002ED94 200052AC */  sw         $s2, 0x20($v0)
    /* 1ED98 8002ED98 97B60008 */  j          .L8002DA5C
    /* 1ED9C 8002ED9C 00000000 */   nop
  .L8002EDA0:
    /* 1EDA0 8002EDA0 2000A2AC */  sw         $v0, 0x20($a1)
    /* 1EDA4 8002EDA4 97B60008 */  j          .L8002DA5C
    /* 1EDA8 8002EDA8 00000000 */   nop
  .L8002EDAC:
    /* 1EDAC 8002EDAC 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1EDB0 8002EDB0 00000000 */  nop
    /* 1EDB4 8002EDB4 280040AC */  sw         $zero, 0x28($v0)
    /* 1EDB8 8002EDB8 99BB0008 */  j          .L8002EE64
    /* 1EDBC 8002EDBC 00000000 */   nop
  .L8002EDC0:
    /* 1EDC0 8002EDC0 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1EDC4 8002EDC4 00000000 */  nop
    /* 1EDC8 8002EDC8 8000458C */  lw         $a1, 0x80($v0)
    /* 1EDCC 8002EDCC 1180043C */  lui        $a0, %hi(D_8010FD64)
    /* 1EDD0 8002EDD0 64FD8424 */  addiu      $a0, $a0, %lo(D_8010FD64)
    /* 1EDD4 8002EDD4 5F97000C */  jal        print
    /* 1EDD8 8002EDD8 00000000 */   nop
    /* 1EDDC 8002EDDC 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1EDE0 8002EDE0 07000224 */  addiu      $v0, $zero, 0x7
    /* 1EDE4 8002EDE4 1C0060AC */  sw         $zero, 0x1C($v1)
    /* 1EDE8 8002EDE8 200062AC */  sw         $v0, 0x20($v1)
    /* 1EDEC 8002EDEC 99BB0008 */  j          .L8002EE64
    /* 1EDF0 8002EDF0 00000000 */   nop
  .L8002EDF4:
    /* 1EDF4 8002EDF4 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1EDF8 8002EDF8 0380043C */  lui        $a0, %hi(localstreamreader)
    /* 1EDFC 8002EDFC E0D98424 */  addiu      $a0, $a0, %lo(localstreamreader)
    /* 1EE00 8002EE00 01000324 */  addiu      $v1, $zero, 0x1
    /* 1EE04 8002EE04 280043AC */  sw         $v1, 0x28($v0)
    /* 1EE08 8002EE08 B6A0000C */  jal        setdirentrycallback
    /* 1EE0C 8002EE0C 00000000 */   nop
    /* 1EE10 8002EE10 781D828F */  lw         $v0, %gp_rel(cdms)($gp)
    /* 1EE14 8002EE14 00000000 */  nop
    /* 1EE18 8002EE18 8000448C */  lw         $a0, 0x80($v0)
    /* 1EE1C 8002EE1C 1280053C */  lui        $a1, %hi(D_8011C504)
    /* 1EE20 8002EE20 04C5A524 */  addiu      $a1, $a1, %lo(D_8011C504)
    /* 1EE24 8002EE24 1280063C */  lui        $a2, %hi(D_8011CA0C)
    /* 1EE28 8002EE28 0CCAC624 */  addiu      $a2, $a2, %lo(D_8011CA0C)
    /* 1EE2C 8002EE2C 47A1000C */  jal        asyncdirentry
    /* 1EE30 8002EE30 00000000 */   nop
    /* 1EE34 8002EE34 99BB0008 */  j          .L8002EE64
    /* 1EE38 8002EE38 00000000 */   nop
  .L8002EE3C:
    /* 1EE3C 8002EE3C 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1EE40 8002EE40 00000000 */  nop
    /* 1EE44 8002EE44 02006010 */  beqz       $v1, .L8002EE50
    /* 1EE48 8002EE48 01000224 */   addiu     $v0, $zero, 0x1
    /* 1EE4C 8002EE4C 8C0062AC */  sw         $v0, 0x8C($v1)
  .L8002EE50:
    /* 1EE50 8002EE50 7C1D838F */  lw         $v1, %gp_rel(cdrs)($gp)
    /* 1EE54 8002EE54 00000000 */  nop
    /* 1EE58 8002EE58 02006010 */  beqz       $v1, .L8002EE64
    /* 1EE5C 8002EE5C 01000224 */   addiu     $v0, $zero, 0x1
    /* 1EE60 8002EE60 8C0062AC */  sw         $v0, 0x8C($v1)
  .L8002EE64:
    /* 1EE64 8002EE64 3401BF8F */  lw         $ra, 0x134($sp)
    /* 1EE68 8002EE68 3001B48F */  lw         $s4, 0x130($sp)
    /* 1EE6C 8002EE6C 2C01B38F */  lw         $s3, 0x12C($sp)
    /* 1EE70 8002EE70 2801B28F */  lw         $s2, 0x128($sp)
    /* 1EE74 8002EE74 2401B18F */  lw         $s1, 0x124($sp)
    /* 1EE78 8002EE78 2001B08F */  lw         $s0, 0x120($sp)
    /* 1EE7C 8002EE7C 3801BD27 */  addiu      $sp, $sp, 0x138
    /* 1EE80 8002EE80 0800E003 */  jr         $ra
    /* 1EE84 8002EE84 00000000 */   nop
endlabel localstreamreader
