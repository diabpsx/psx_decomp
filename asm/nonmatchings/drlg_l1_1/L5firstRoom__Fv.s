.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5firstRoom__Fv, 0x3A0

glabel L5firstRoom__Fv
    /* 3C04 8013D7FC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3C08 8013D800 02000424 */  addiu      $a0, $zero, 0x2
    /* 3C0C 8013D804 2000BFAF */  sw         $ra, 0x20($sp)
    /* 3C10 8013D808 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 3C14 8013D80C C9F6000C */  jal        ENG_random__Fl
    /* 3C18 8013D810 1800B0AF */   sw        $s0, 0x18($sp)
    /* 3C1C 8013D814 70004014 */  bnez       $v0, .L8013D9D8
    /* 3C20 8013D818 01001124 */   addiu     $s1, $zero, 0x1
    /* 3C24 8013D81C C9F6000C */  jal        ENG_random__Fl
    /* 3C28 8013D820 02000424 */   addiu     $a0, $zero, 0x2
    /* 3C2C 8013D824 5B2182A3 */  sb         $v0, %gp_rel(D_8011C8DB)($gp)
    /* 3C30 8013D828 C9F6000C */  jal        ENG_random__Fl
    /* 3C34 8013D82C 02000424 */   addiu     $a0, $zero, 0x2
    /* 3C38 8013D830 5C2182A3 */  sb         $v0, %gp_rel(D_8011C8DC)($gp)
    /* 3C3C 8013D834 C9F6000C */  jal        ENG_random__Fl
    /* 3C40 8013D838 02000424 */   addiu     $a0, $zero, 0x2
    /* 3C44 8013D83C 5B218393 */  lbu        $v1, %gp_rel(D_8011C8DB)($gp)
    /* 3C48 8013D840 5D2182A3 */  sb         $v0, %gp_rel(D_8011C8DD)($gp)
    /* 3C4C 8013D844 FF004230 */  andi       $v0, $v0, 0xFF
    /* 3C50 8013D848 21106200 */  addu       $v0, $v1, $v0
    /* 3C54 8013D84C 02004228 */  slti       $v0, $v0, 0x2
    /* 3C58 8013D850 03004010 */  beqz       $v0, .L8013D860
    /* 3C5C 8013D854 27001024 */   addiu     $s0, $zero, 0x27
    /* 3C60 8013D858 01000224 */  addiu      $v0, $zero, 0x1
    /* 3C64 8013D85C 5C2182A3 */  sb         $v0, %gp_rel(D_8011C8DC)($gp)
  .L8013D860:
    /* 3C68 8013D860 07006010 */  beqz       $v1, .L8013D880
    /* 3C6C 8013D864 0F000424 */   addiu     $a0, $zero, 0xF
    /* 3C70 8013D868 01000524 */  addiu      $a1, $zero, 0x1
    /* 3C74 8013D86C 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3C78 8013D870 F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3C7C 8013D874 0A000724 */   addiu     $a3, $zero, 0xA
    /* 3C80 8013D878 21F60408 */  j          .L8013D884
    /* 3C84 8013D87C 00000000 */   nop
  .L8013D880:
    /* 3C88 8013D880 12001124 */  addiu      $s1, $zero, 0x12
  .L8013D884:
    /* 3C8C 8013D884 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 3C90 8013D888 00000000 */  nop
    /* 3C94 8013D88C 05004010 */  beqz       $v0, .L8013D8A4
    /* 3C98 8013D890 0F000424 */   addiu     $a0, $zero, 0xF
    /* 3C9C 8013D894 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3CA0 8013D898 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3CA4 8013D89C F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3CA8 8013D8A0 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013D8A4:
    /* 3CAC 8013D8A4 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 3CB0 8013D8A8 00000000 */  nop
    /* 3CB4 8013D8AC 07004010 */  beqz       $v0, .L8013D8CC
    /* 3CB8 8013D8B0 0F000424 */   addiu     $a0, $zero, 0xF
    /* 3CBC 8013D8B4 1D000524 */  addiu      $a1, $zero, 0x1D
    /* 3CC0 8013D8B8 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3CC4 8013D8BC F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3CC8 8013D8C0 0A000724 */   addiu     $a3, $zero, 0xA
    /* 3CCC 8013D8C4 35F60408 */  j          .L8013D8D4
    /* 3CD0 8013D8C8 21282002 */   addu      $a1, $s1, $zero
  .L8013D8CC:
    /* 3CD4 8013D8CC EFFF1026 */  addiu      $s0, $s0, -0x11
    /* 3CD8 8013D8D0 21282002 */  addu       $a1, $s1, $zero
  .L8013D8D4:
    /* 3CDC 8013D8D4 2A10B000 */  slt        $v0, $a1, $s0
    /* 3CE0 8013D8D8 1F004010 */  beqz       $v0, .L8013D958
    /* 3CE4 8013D8DC 00000000 */   nop
    /* 3CE8 8013D8E0 01000824 */  addiu      $t0, $zero, 0x1
    /* 3CEC 8013D8E4 0E80043C */  lui        $a0, %hi(dungeon + 0x660)
    /* 3CF0 8013D8E8 24478424 */  addiu      $a0, $a0, %lo(dungeon + 0x660)
    /* 3CF4 8013D8EC E0018224 */  addiu      $v0, $a0, 0x1E0
    /* 3CF8 8013D8F0 40180500 */  sll        $v1, $a1, 1
    /* 3CFC 8013D8F4 21586200 */  addu       $t3, $v1, $v0
    /* 3D00 8013D8F8 80018224 */  addiu      $v0, $a0, 0x180
    /* 3D04 8013D8FC 21506200 */  addu       $t2, $v1, $v0
    /* 3D08 8013D900 20018224 */  addiu      $v0, $a0, 0x120
    /* 3D0C 8013D904 21486200 */  addu       $t1, $v1, $v0
    /* 3D10 8013D908 C0008224 */  addiu      $v0, $a0, 0xC0
    /* 3D14 8013D90C 21386200 */  addu       $a3, $v1, $v0
    /* 3D18 8013D910 60008224 */  addiu      $v0, $a0, 0x60
    /* 3D1C 8013D914 21306200 */  addu       $a2, $v1, $v0
    /* 3D20 8013D918 21186400 */  addu       $v1, $v1, $a0
  .L8013D91C:
    /* 3D24 8013D91C 000068A4 */  sh         $t0, 0x0($v1)
    /* 3D28 8013D920 0000C8A4 */  sh         $t0, 0x0($a2)
    /* 3D2C 8013D924 0000E8A4 */  sh         $t0, 0x0($a3)
    /* 3D30 8013D928 000028A5 */  sh         $t0, 0x0($t1)
    /* 3D34 8013D92C 000048A5 */  sh         $t0, 0x0($t2)
    /* 3D38 8013D930 000068A5 */  sh         $t0, 0x0($t3)
    /* 3D3C 8013D934 02006B25 */  addiu      $t3, $t3, 0x2
    /* 3D40 8013D938 02004A25 */  addiu      $t2, $t2, 0x2
    /* 3D44 8013D93C 02002925 */  addiu      $t1, $t1, 0x2
    /* 3D48 8013D940 0200E724 */  addiu      $a3, $a3, 0x2
    /* 3D4C 8013D944 0200C624 */  addiu      $a2, $a2, 0x2
    /* 3D50 8013D948 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3D54 8013D94C 2A10B000 */  slt        $v0, $a1, $s0
    /* 3D58 8013D950 F2FF4014 */  bnez       $v0, .L8013D91C
    /* 3D5C 8013D954 02006324 */   addiu     $v1, $v1, 0x2
  .L8013D958:
    /* 3D60 8013D958 5B218293 */  lbu        $v0, %gp_rel(D_8011C8DB)($gp)
    /* 3D64 8013D95C 00000000 */  nop
    /* 3D68 8013D960 06004010 */  beqz       $v0, .L8013D97C
    /* 3D6C 8013D964 0F000424 */   addiu     $a0, $zero, 0xF
    /* 3D70 8013D968 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3D74 8013D96C 01000524 */  addiu      $a1, $zero, 0x1
    /* 3D78 8013D970 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3D7C 8013D974 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3D80 8013D978 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013D97C:
    /* 3D84 8013D97C 5C218293 */  lbu        $v0, %gp_rel(D_8011C8DC)($gp)
    /* 3D88 8013D980 00000000 */  nop
    /* 3D8C 8013D984 06004010 */  beqz       $v0, .L8013D9A0
    /* 3D90 8013D988 0F000424 */   addiu     $a0, $zero, 0xF
    /* 3D94 8013D98C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3D98 8013D990 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3D9C 8013D994 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3DA0 8013D998 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3DA4 8013D99C 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013D9A0:
    /* 3DA8 8013D9A0 5D218293 */  lbu        $v0, %gp_rel(D_8011C8DD)($gp)
    /* 3DAC 8013D9A4 00000000 */  nop
    /* 3DB0 8013D9A8 06004010 */  beqz       $v0, .L8013D9C4
    /* 3DB4 8013D9AC 0F000424 */   addiu     $a0, $zero, 0xF
    /* 3DB8 8013D9B0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3DBC 8013D9B4 1D000524 */  addiu      $a1, $zero, 0x1D
    /* 3DC0 8013D9B8 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3DC4 8013D9BC 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3DC8 8013D9C0 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013D9C4:
    /* 3DCC 8013D9C4 5A2180A3 */  sb         $zero, %gp_rel(D_8011C8DA)($gp)
    /* 3DD0 8013D9C8 592180A3 */  sb         $zero, %gp_rel(D_8011C8D9)($gp)
    /* 3DD4 8013D9CC 582180A3 */  sb         $zero, %gp_rel(D_8011C8D8)($gp)
    /* 3DD8 8013D9D0 E1F60408 */  j          .L8013DB84
    /* 3DDC 8013D9D4 00000000 */   nop
  .L8013D9D8:
    /* 3DE0 8013D9D8 C9F6000C */  jal        ENG_random__Fl
    /* 3DE4 8013D9DC 02000424 */   addiu     $a0, $zero, 0x2
    /* 3DE8 8013D9E0 582182A3 */  sb         $v0, %gp_rel(D_8011C8D8)($gp)
    /* 3DEC 8013D9E4 C9F6000C */  jal        ENG_random__Fl
    /* 3DF0 8013D9E8 02000424 */   addiu     $a0, $zero, 0x2
    /* 3DF4 8013D9EC 592182A3 */  sb         $v0, %gp_rel(D_8011C8D9)($gp)
    /* 3DF8 8013D9F0 C9F6000C */  jal        ENG_random__Fl
    /* 3DFC 8013D9F4 02000424 */   addiu     $a0, $zero, 0x2
    /* 3E00 8013D9F8 58218393 */  lbu        $v1, %gp_rel(D_8011C8D8)($gp)
    /* 3E04 8013D9FC 5A2182A3 */  sb         $v0, %gp_rel(D_8011C8DA)($gp)
    /* 3E08 8013DA00 FF004230 */  andi       $v0, $v0, 0xFF
    /* 3E0C 8013DA04 21106200 */  addu       $v0, $v1, $v0
    /* 3E10 8013DA08 02004228 */  slti       $v0, $v0, 0x2
    /* 3E14 8013DA0C 03004010 */  beqz       $v0, .L8013DA1C
    /* 3E18 8013DA10 27001024 */   addiu     $s0, $zero, 0x27
    /* 3E1C 8013DA14 01000224 */  addiu      $v0, $zero, 0x1
    /* 3E20 8013DA18 592182A3 */  sb         $v0, %gp_rel(D_8011C8D9)($gp)
  .L8013DA1C:
    /* 3E24 8013DA1C 07006010 */  beqz       $v1, .L8013DA3C
    /* 3E28 8013DA20 01000424 */   addiu     $a0, $zero, 0x1
    /* 3E2C 8013DA24 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3E30 8013DA28 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3E34 8013DA2C F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3E38 8013DA30 0A000724 */   addiu     $a3, $zero, 0xA
    /* 3E3C 8013DA34 90F60408 */  j          .L8013DA40
    /* 3E40 8013DA38 00000000 */   nop
  .L8013DA3C:
    /* 3E44 8013DA3C 12001124 */  addiu      $s1, $zero, 0x12
  .L8013DA40:
    /* 3E48 8013DA40 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 3E4C 8013DA44 00000000 */  nop
    /* 3E50 8013DA48 05004010 */  beqz       $v0, .L8013DA60
    /* 3E54 8013DA4C 0F000424 */   addiu     $a0, $zero, 0xF
    /* 3E58 8013DA50 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3E5C 8013DA54 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3E60 8013DA58 F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3E64 8013DA5C 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013DA60:
    /* 3E68 8013DA60 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 3E6C 8013DA64 00000000 */  nop
    /* 3E70 8013DA68 07004010 */  beqz       $v0, .L8013DA88
    /* 3E74 8013DA6C 1D000424 */   addiu     $a0, $zero, 0x1D
    /* 3E78 8013DA70 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3E7C 8013DA74 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3E80 8013DA78 F3F4040C */  jal        L5drawRoom__Fiiii
    /* 3E84 8013DA7C 0A000724 */   addiu     $a3, $zero, 0xA
    /* 3E88 8013DA80 A4F60408 */  j          .L8013DA90
    /* 3E8C 8013DA84 21202002 */   addu      $a0, $s1, $zero
  .L8013DA88:
    /* 3E90 8013DA88 EFFF1026 */  addiu      $s0, $s0, -0x11
    /* 3E94 8013DA8C 21202002 */  addu       $a0, $s1, $zero
  .L8013DA90:
    /* 3E98 8013DA90 2A109000 */  slt        $v0, $a0, $s0
    /* 3E9C 8013DA94 1A004010 */  beqz       $v0, .L8013DB00
    /* 3EA0 8013DA98 40100400 */   sll       $v0, $a0, 1
    /* 3EA4 8013DA9C 01000524 */  addiu      $a1, $zero, 0x1
    /* 3EA8 8013DAA0 21104400 */  addu       $v0, $v0, $a0
    /* 3EAC 8013DAA4 40190200 */  sll        $v1, $v0, 5
  .L8013DAA8:
    /* 3EB0 8013DAA8 0E80013C */  lui        $at, %hi(dungeon + 0x22)
    /* 3EB4 8013DAAC 21082300 */  addu       $at, $at, $v1
    /* 3EB8 8013DAB0 E64025A4 */  sh         $a1, %lo(dungeon + 0x22)($at)
    /* 3EBC 8013DAB4 0E80013C */  lui        $at, %hi(dungeon + 0x24)
    /* 3EC0 8013DAB8 21082300 */  addu       $at, $at, $v1
    /* 3EC4 8013DABC E84025A4 */  sh         $a1, %lo(dungeon + 0x24)($at)
    /* 3EC8 8013DAC0 0E80013C */  lui        $at, %hi(dungeon + 0x26)
    /* 3ECC 8013DAC4 21082300 */  addu       $at, $at, $v1
    /* 3ED0 8013DAC8 EA4025A4 */  sh         $a1, %lo(dungeon + 0x26)($at)
    /* 3ED4 8013DACC 0E80013C */  lui        $at, %hi(dungeon + 0x28)
    /* 3ED8 8013DAD0 21082300 */  addu       $at, $at, $v1
    /* 3EDC 8013DAD4 EC4025A4 */  sh         $a1, %lo(dungeon + 0x28)($at)
    /* 3EE0 8013DAD8 0E80013C */  lui        $at, %hi(dungeon + 0x2A)
    /* 3EE4 8013DADC 21082300 */  addu       $at, $at, $v1
    /* 3EE8 8013DAE0 EE4025A4 */  sh         $a1, %lo(dungeon + 0x2A)($at)
    /* 3EEC 8013DAE4 0E80013C */  lui        $at, %hi(dungeon + 0x2C)
    /* 3EF0 8013DAE8 21082300 */  addu       $at, $at, $v1
    /* 3EF4 8013DAEC F04025A4 */  sh         $a1, %lo(dungeon + 0x2C)($at)
    /* 3EF8 8013DAF0 01008424 */  addiu      $a0, $a0, 0x1
    /* 3EFC 8013DAF4 2A109000 */  slt        $v0, $a0, $s0
    /* 3F00 8013DAF8 EBFF4014 */  bnez       $v0, .L8013DAA8
    /* 3F04 8013DAFC 60006324 */   addiu     $v1, $v1, 0x60
  .L8013DB00:
    /* 3F08 8013DB00 58218293 */  lbu        $v0, %gp_rel(D_8011C8D8)($gp)
    /* 3F0C 8013DB04 00000000 */  nop
    /* 3F10 8013DB08 07004010 */  beqz       $v0, .L8013DB28
    /* 3F14 8013DB0C 01000224 */   addiu     $v0, $zero, 0x1
    /* 3F18 8013DB10 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3F1C 8013DB14 01000424 */  addiu      $a0, $zero, 0x1
    /* 3F20 8013DB18 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3F24 8013DB1C 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3F28 8013DB20 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3F2C 8013DB24 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013DB28:
    /* 3F30 8013DB28 59218293 */  lbu        $v0, %gp_rel(D_8011C8D9)($gp)
    /* 3F34 8013DB2C 00000000 */  nop
    /* 3F38 8013DB30 07004010 */  beqz       $v0, .L8013DB50
    /* 3F3C 8013DB34 01000224 */   addiu     $v0, $zero, 0x1
    /* 3F40 8013DB38 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3F44 8013DB3C 0F000424 */  addiu      $a0, $zero, 0xF
    /* 3F48 8013DB40 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3F4C 8013DB44 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3F50 8013DB48 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3F54 8013DB4C 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013DB50:
    /* 3F58 8013DB50 5A218293 */  lbu        $v0, %gp_rel(D_8011C8DA)($gp)
    /* 3F5C 8013DB54 00000000 */  nop
    /* 3F60 8013DB58 07004010 */  beqz       $v0, .L8013DB78
    /* 3F64 8013DB5C 01000224 */   addiu     $v0, $zero, 0x1
    /* 3F68 8013DB60 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3F6C 8013DB64 1D000424 */  addiu      $a0, $zero, 0x1D
    /* 3F70 8013DB68 0F000524 */  addiu      $a1, $zero, 0xF
    /* 3F74 8013DB6C 0A000624 */  addiu      $a2, $zero, 0xA
    /* 3F78 8013DB70 33F5040C */  jal        L5roomGen__Fiiiii
    /* 3F7C 8013DB74 0A000724 */   addiu     $a3, $zero, 0xA
  .L8013DB78:
    /* 3F80 8013DB78 5D2180A3 */  sb         $zero, %gp_rel(D_8011C8DD)($gp)
    /* 3F84 8013DB7C 5C2180A3 */  sb         $zero, %gp_rel(D_8011C8DC)($gp)
    /* 3F88 8013DB80 5B2180A3 */  sb         $zero, %gp_rel(D_8011C8DB)($gp)
  .L8013DB84:
    /* 3F8C 8013DB84 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3F90 8013DB88 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3F94 8013DB8C 1800B08F */  lw         $s0, 0x18($sp)
    /* 3F98 8013DB90 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 3F9C 8013DB94 0800E003 */  jr         $ra
    /* 3FA0 8013DB98 00000000 */   nop
endlabel L5firstRoom__Fv
