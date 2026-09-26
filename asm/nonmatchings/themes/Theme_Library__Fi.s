.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_Library__Fi, 0x284

glabel Theme_Library__Fi
    /* 23C44 8015D83C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 23C48 8015D840 3400B5AF */  sw         $s5, 0x34($sp)
    /* 23C4C 8015D844 21A88000 */  addu       $s5, $a0, $zero
    /* 23C50 8015D848 3800BFAF */  sw         $ra, 0x38($sp)
    /* 23C54 8015D84C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 23C58 8015D850 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 23C5C 8015D854 2800B2AF */  sw         $s2, 0x28($sp)
    /* 23C60 8015D858 2400B1AF */  sw         $s1, 0x24($sp)
    /* 23C64 8015D85C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 23C68 8015D860 1280053C */  lui        $a1, %hi(D_8011C178)
    /* 23C6C 8015D864 78C1A524 */  addiu      $a1, $a1, %lo(D_8011C178)
    /* 23C70 8015D868 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23C74 8015D86C 0000A298 */  lwr        $v0, 0x0($a1)
    /* 23C78 8015D870 00000000 */  nop
    /* 23C7C 8015D874 1300A2AB */  swl        $v0, 0x13($sp)
    /* 23C80 8015D878 1000A2BB */  swr        $v0, 0x10($sp)
    /* 23C84 8015D87C 1280053C */  lui        $a1, %hi(D_8011C164)
    /* 23C88 8015D880 64C1A524 */  addiu      $a1, $a1, %lo(D_8011C164)
    /* 23C8C 8015D884 0300A288 */  lwl        $v0, 0x3($a1)
    /* 23C90 8015D888 0000A298 */  lwr        $v0, 0x0($a1)
    /* 23C94 8015D88C 00000000 */  nop
    /* 23C98 8015D890 1B00A2AB */  swl        $v0, 0x1B($sp)
    /* 23C9C 8015D894 1800A2BB */  swr        $v0, 0x18($sp)
    /* 23CA0 8015D898 036F050C */  jal        TFit_Shrine__Fi
    /* 23CA4 8015D89C 2120A002 */   addu      $a0, $s5, $zero
    /* 23CA8 8015D8A0 201A838F */  lw         $v1, %gp_rel(themeVar1)($gp)
    /* 23CAC 8015D8A4 01000224 */  addiu      $v0, $zero, 0x1
    /* 23CB0 8015D8A8 0F006214 */  bne        $v1, $v0, .L8015D8E8
    /* 23CB4 8015D8AC 00000000 */   nop
    /* 23CB8 8015D8B0 41000424 */  addiu      $a0, $zero, 0x41
    /* 23CBC 8015D8B4 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23CC0 8015D8B8 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23CC4 8015D8BC BE4E010C */  jal        AddObject__Fiii
    /* 23CC8 8015D8C0 FFFFA524 */   addiu     $a1, $a1, -0x1
    /* 23CCC 8015D8C4 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23CD0 8015D8C8 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23CD4 8015D8CC BE4E010C */  jal        AddObject__Fiii
    /* 23CD8 8015D8D0 3F000424 */   addiu     $a0, $zero, 0x3F
    /* 23CDC 8015D8D4 41000424 */  addiu      $a0, $zero, 0x41
    /* 23CE0 8015D8D8 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23CE4 8015D8DC 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23CE8 8015D8E0 47760508 */  j          .L8015D91C
    /* 23CEC 8015D8E4 0100A524 */   addiu     $a1, $a1, 0x1
  .L8015D8E8:
    /* 23CF0 8015D8E8 41000424 */  addiu      $a0, $zero, 0x41
    /* 23CF4 8015D8EC 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23CF8 8015D8F0 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23CFC 8015D8F4 BE4E010C */  jal        AddObject__Fiii
    /* 23D00 8015D8F8 FFFFC624 */   addiu     $a2, $a2, -0x1
    /* 23D04 8015D8FC 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23D08 8015D900 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23D0C 8015D904 BE4E010C */  jal        AddObject__Fiii
    /* 23D10 8015D908 3E000424 */   addiu     $a0, $zero, 0x3E
    /* 23D14 8015D90C 41000424 */  addiu      $a0, $zero, 0x41
    /* 23D18 8015D910 1C1A868F */  lw         $a2, %gp_rel(themey)($gp)
    /* 23D1C 8015D914 181A858F */  lw         $a1, %gp_rel(themex)($gp)
    /* 23D20 8015D918 0100C624 */  addiu      $a2, $a2, 0x1
  .L8015D91C:
    /* 23D24 8015D91C BE4E010C */  jal        AddObject__Fiii
    /* 23D28 8015D920 01001324 */   addiu     $s3, $zero, 0x1
    /* 23D2C 8015D924 0F00B427 */  addiu      $s4, $sp, 0xF
  .L8015D928:
    /* 23D30 8015D928 5F00622A */  slti       $v0, $s3, 0x5F
    /* 23D34 8015D92C 4A004010 */  beqz       $v0, .L8015DA58
    /* 23D38 8015D930 01001124 */   addiu     $s1, $zero, 0x1
    /* 23D3C 8015D934 C0101300 */  sll        $v0, $s3, 3
    /* 23D40 8015D938 80035224 */  addiu      $s2, $v0, 0x380
  .L8015D93C:
    /* 23D44 8015D93C 5F00222A */  slti       $v0, $s1, 0x5F
    /* 23D48 8015D940 43004010 */  beqz       $v0, .L8015DA50
    /* 23D4C 8015D944 21800000 */   addu      $s0, $zero, $zero
    /* 23D50 8015D948 21202002 */  addu       $a0, $s1, $zero
    /* 23D54 8015D94C 21286002 */  addu       $a1, $s3, $zero
    /* 23D58 8015D950 2130A002 */  addu       $a2, $s5, $zero
    /* 23D5C 8015D954 8270050C */  jal        CheckThemeObj3__Fiiii
    /* 23D60 8015D958 FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 23D64 8015D95C FF004230 */  andi       $v0, $v0, 0xFF
    /* 23D68 8015D960 0F004010 */  beqz       $v0, .L8015D9A0
    /* 23D6C 8015D964 00000000 */   nop
    /* 23D70 8015D968 0E80013C */  lui        $at, %hi(dung_map)
    /* 23D74 8015D96C 21083200 */  addu       $at, $at, $s2
    /* 23D78 8015D970 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 23D7C 8015D974 00000000 */  nop
    /* 23D80 8015D978 09004014 */  bnez       $v0, .L8015D9A0
    /* 23D84 8015D97C 00000000 */   nop
    /* 23D88 8015D980 1280023C */  lui        $v0, %hi(leveltype)
    /* 23D8C 8015D984 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23D90 8015D988 00000000 */  nop
    /* 23D94 8015D98C 21108202 */  addu       $v0, $s4, $v0
    /* 23D98 8015D990 00004480 */  lb         $a0, 0x0($v0)
    /* 23D9C 8015D994 C9F6000C */  jal        ENG_random__Fl
    /* 23DA0 8015D998 00000000 */   nop
    /* 23DA4 8015D99C 0100502C */  sltiu      $s0, $v0, 0x1
  .L8015D9A0:
    /* 23DA8 8015D9A0 28000012 */  beqz       $s0, .L8015DA44
    /* 23DAC 8015D9A4 40000424 */   addiu     $a0, $zero, 0x40
    /* 23DB0 8015D9A8 21282002 */  addu       $a1, $s1, $zero
    /* 23DB4 8015D9AC 1280103C */  lui        $s0, %hi(numobjects)
    /* 23DB8 8015D9B0 CCB9108E */  lw         $s0, %lo(numobjects)($s0)
    /* 23DBC 8015D9B4 BE4E010C */  jal        AddObject__Fiii
    /* 23DC0 8015D9B8 21306002 */   addu      $a2, $s3, $zero
    /* 23DC4 8015D9BC 1280023C */  lui        $v0, %hi(numobjects)
    /* 23DC8 8015D9C0 CCB9428C */  lw         $v0, %lo(numobjects)($v0)
    /* 23DCC 8015D9C4 00000000 */  nop
    /* 23DD0 8015D9C8 1E005010 */  beq        $v0, $s0, .L8015DA44
    /* 23DD4 8015D9CC 00000000 */   nop
    /* 23DD8 8015D9D0 1280023C */  lui        $v0, %hi(leveltype)
    /* 23DDC 8015D9D4 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23DE0 8015D9D8 00000000 */  nop
    /* 23DE4 8015D9DC 21108202 */  addu       $v0, $s4, $v0
    /* 23DE8 8015D9E0 00004480 */  lb         $a0, 0x0($v0)
    /* 23DEC 8015D9E4 C9F6000C */  jal        ENG_random__Fl
    /* 23DF0 8015D9E8 40200400 */   sll       $a0, $a0, 1
    /* 23DF4 8015D9EC 15004010 */  beqz       $v0, .L8015DA44
    /* 23DF8 8015D9F0 00000000 */   nop
    /* 23DFC 8015D9F4 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 23E00 8015D9F8 21083200 */  addu       $at, $at, $s2
    /* 23E04 8015D9FC 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 23E08 8015DA00 00000000 */  nop
    /* 23E0C 8015DA04 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 23E10 8015DA08 40180200 */  sll        $v1, $v0, 1
    /* 23E14 8015DA0C 21186200 */  addu       $v1, $v1, $v0
    /* 23E18 8015DA10 80180300 */  sll        $v1, $v1, 2
    /* 23E1C 8015DA14 23186200 */  subu       $v1, $v1, $v0
    /* 23E20 8015DA18 80180300 */  sll        $v1, $v1, 2
    /* 23E24 8015DA1C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 23E28 8015DA20 21082300 */  addu       $at, $at, $v1
    /* 23E2C 8015DA24 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 23E30 8015DA28 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 23E34 8015DA2C 21082300 */  addu       $at, $at, $v1
    /* 23E38 8015DA30 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 23E3C 8015DA34 02004224 */  addiu      $v0, $v0, 0x2
    /* 23E40 8015DA38 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 23E44 8015DA3C 21082300 */  addu       $at, $at, $v1
    /* 23E48 8015DA40 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
  .L8015DA44:
    /* 23E4C 8015DA44 80035226 */  addiu      $s2, $s2, 0x380
    /* 23E50 8015DA48 4F760508 */  j          .L8015D93C
    /* 23E54 8015DA4C 01003126 */   addiu     $s1, $s1, 0x1
  .L8015DA50:
    /* 23E58 8015DA50 4A760508 */  j          .L8015D928
    /* 23E5C 8015DA54 01007326 */   addiu     $s3, $s3, 0x1
  .L8015DA58:
    /* 23E60 8015DA58 DC9E010C */  jal        QuestStatus__Fi
    /* 23E64 8015DA5C 03000424 */   addiu     $a0, $zero, 0x3
    /* 23E68 8015DA60 FF004230 */  andi       $v0, $v0, 0xFF
    /* 23E6C 8015DA64 05004010 */  beqz       $v0, .L8015DA7C
    /* 23E70 8015DA68 00000000 */   nop
    /* 23E74 8015DA6C 101A828F */  lw         $v0, %gp_rel(zharlib)($gp)
    /* 23E78 8015DA70 00000000 */  nop
    /* 23E7C 8015DA74 0800A212 */  beq        $s5, $v0, .L8015DA98
    /* 23E80 8015DA78 00000000 */   nop
  .L8015DA7C:
    /* 23E84 8015DA7C 1280023C */  lui        $v0, %hi(leveltype)
    /* 23E88 8015DA80 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23E8C 8015DA84 00000000 */  nop
    /* 23E90 8015DA88 2110A203 */  addu       $v0, $sp, $v0
    /* 23E94 8015DA8C 18004580 */  lb         $a1, 0x18($v0)
    /* 23E98 8015DA90 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 23E9C 8015DA94 2120A002 */   addu      $a0, $s5, $zero
  .L8015DA98:
    /* 23EA0 8015DA98 3800BF8F */  lw         $ra, 0x38($sp)
    /* 23EA4 8015DA9C 3400B58F */  lw         $s5, 0x34($sp)
    /* 23EA8 8015DAA0 3000B48F */  lw         $s4, 0x30($sp)
    /* 23EAC 8015DAA4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 23EB0 8015DAA8 2800B28F */  lw         $s2, 0x28($sp)
    /* 23EB4 8015DAAC 2400B18F */  lw         $s1, 0x24($sp)
    /* 23EB8 8015DAB0 2000B08F */  lw         $s0, 0x20($sp)
    /* 23EBC 8015DAB4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 23EC0 8015DAB8 0800E003 */  jr         $ra
    /* 23EC4 8015DABC 00000000 */   nop
endlabel Theme_Library__Fi
