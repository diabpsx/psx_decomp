.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3__Fi, 0x71C

glabel DRLG_L3__Fi
    /* 12F24 8014CB1C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 12F28 8014CB20 3800B6AF */  sw         $s6, 0x38($sp)
    /* 12F2C 8014CB24 21B08000 */  addu       $s6, $a0, $zero
    /* 12F30 8014CB28 3000B4AF */  sw         $s4, 0x30($sp)
    /* 12F34 8014CB2C FFFF1424 */  addiu      $s4, $zero, -0x1
    /* 12F38 8014CB30 3400B5AF */  sw         $s5, 0x34($sp)
    /* 12F3C 8014CB34 01001524 */  addiu      $s5, $zero, 0x1
    /* 12F40 8014CB38 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 12F44 8014CB3C 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 12F48 8014CB40 2800B2AF */  sw         $s2, 0x28($sp)
    /* 12F4C 8014CB44 2400B1AF */  sw         $s1, 0x24($sp)
    /* 12F50 8014CB48 2000B0AF */  sw         $s0, 0x20($sp)
    /* 12F54 8014CB4C 642180A3 */  sb         $zero, %gp_rel(D_8011C8E4)($gp)
  .L8014CB50:
    /* 12F58 8014CB50 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 12F5C 8014CB54 01000424 */   addiu     $a0, $zero, 0x1
  .L8014CB58:
    /* 12F60 8014CB58 E623050C */  jal        InitL3Dungeon__Fv
    /* 12F64 8014CB5C 00000000 */   nop
    /* 12F68 8014CB60 C9F6000C */  jal        ENG_random__Fl
    /* 12F6C 8014CB64 14000424 */   addiu     $a0, $zero, 0x14
    /* 12F70 8014CB68 14000424 */  addiu      $a0, $zero, 0x14
    /* 12F74 8014CB6C C9F6000C */  jal        ENG_random__Fl
    /* 12F78 8014CB70 21804000 */   addu      $s0, $v0, $zero
    /* 12F7C 8014CB74 0A001326 */  addiu      $s3, $s0, 0xA
    /* 12F80 8014CB78 21206002 */  addu       $a0, $s3, $zero
    /* 12F84 8014CB7C 21884000 */  addu       $s1, $v0, $zero
    /* 12F88 8014CB80 0A003226 */  addiu      $s2, $s1, 0xA
    /* 12F8C 8014CB84 21284002 */  addu       $a1, $s2, $zero
    /* 12F90 8014CB88 0C001026 */  addiu      $s0, $s0, 0xC
    /* 12F94 8014CB8C 21300002 */  addu       $a2, $s0, $zero
    /* 12F98 8014CB90 0C003126 */  addiu      $s1, $s1, 0xC
    /* 12F9C 8014CB94 3B24050C */  jal        DRLG_L3FillRoom__Fiiii
    /* 12FA0 8014CB98 21382002 */   addu      $a3, $s1, $zero
    /* 12FA4 8014CB9C 21206002 */  addu       $a0, $s3, $zero
    /* 12FA8 8014CBA0 21284002 */  addu       $a1, $s2, $zero
    /* 12FAC 8014CBA4 02000624 */  addiu      $a2, $zero, 0x2
    /* 12FB0 8014CBA8 CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* 12FB4 8014CBAC 21380000 */   addu      $a3, $zero, $zero
    /* 12FB8 8014CBB0 21200002 */  addu       $a0, $s0, $zero
    /* 12FBC 8014CBB4 21284002 */  addu       $a1, $s2, $zero
    /* 12FC0 8014CBB8 02000624 */  addiu      $a2, $zero, 0x2
    /* 12FC4 8014CBBC CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* 12FC8 8014CBC0 01000724 */   addiu     $a3, $zero, 0x1
    /* 12FCC 8014CBC4 21206002 */  addu       $a0, $s3, $zero
    /* 12FD0 8014CBC8 21282002 */  addu       $a1, $s1, $zero
    /* 12FD4 8014CBCC 02000624 */  addiu      $a2, $zero, 0x2
    /* 12FD8 8014CBD0 CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* 12FDC 8014CBD4 02000724 */   addiu     $a3, $zero, 0x2
    /* 12FE0 8014CBD8 21206002 */  addu       $a0, $s3, $zero
    /* 12FE4 8014CBDC 21284002 */  addu       $a1, $s2, $zero
    /* 12FE8 8014CBE0 02000624 */  addiu      $a2, $zero, 0x2
    /* 12FEC 8014CBE4 CF24050C */  jal        DRLG_L3CreateBlock__Fiiii
    /* 12FF0 8014CBE8 03000724 */   addiu     $a3, $zero, 0x3
    /* 12FF4 8014CBEC DC9E010C */  jal        QuestStatus__Fi
    /* 12FF8 8014CBF0 0A000424 */   addiu     $a0, $zero, 0xA
    /* 12FFC 8014CBF4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 13000 8014CBF8 0B004010 */  beqz       $v0, .L8014CC28
    /* 13004 8014CBFC 00000000 */   nop
    /* 13008 8014CC00 C9F6000C */  jal        ENG_random__Fl
    /* 1300C 8014CC04 0A000424 */   addiu     $a0, $zero, 0xA
    /* 13010 8014CC08 0A000424 */  addiu      $a0, $zero, 0xA
    /* 13014 8014CC0C C9F6000C */  jal        ENG_random__Fl
    /* 13018 8014CC10 21804000 */   addu      $s0, $v0, $zero
    /* 1301C 8014CC14 0A000426 */  addiu      $a0, $s0, 0xA
    /* 13020 8014CC18 0A004524 */  addiu      $a1, $v0, 0xA
    /* 13024 8014CC1C 16000626 */  addiu      $a2, $s0, 0x16
    /* 13028 8014CC20 6F25050C */  jal        DRLG_L3FloorArea__Fiiii
    /* 1302C 8014CC24 16004724 */   addiu     $a3, $v0, 0x16
  .L8014CC28:
    /* 13030 8014CC28 8925050C */  jal        DRLG_L3FillDiags__Fv
    /* 13034 8014CC2C 00000000 */   nop
    /* 13038 8014CC30 D425050C */  jal        DRLG_L3FillSingles__Fv
    /* 1303C 8014CC34 00000000 */   nop
    /* 13040 8014CC38 0726050C */  jal        DRLG_L3FillStraights__Fv
    /* 13044 8014CC3C 00000000 */   nop
    /* 13048 8014CC40 8925050C */  jal        DRLG_L3FillDiags__Fv
    /* 1304C 8014CC44 00000000 */   nop
    /* 13050 8014CC48 F226050C */  jal        DRLG_L3Edges__Fv
    /* 13054 8014CC4C 00000000 */   nop
    /* 13058 8014CC50 0227050C */  jal        DRLG_L3GetFloorArea__Fv
    /* 1305C 8014CC54 00000000 */   nop
    /* 13060 8014CC58 58024228 */  slti       $v0, $v0, 0x258
    /* 13064 8014CC5C 05004014 */  bnez       $v0, .L8014CC74
    /* 13068 8014CC60 21100000 */   addu      $v0, $zero, $zero
    /* 1306C 8014CC64 6A32050C */  jal        DRLG_L3Lockout__Fv
    /* 13070 8014CC68 00000000 */   nop
    /* 13074 8014CC6C 1E330508 */  j          .L8014CC78
    /* 13078 8014CC70 FF004230 */   andi      $v0, $v0, 0xFF
  .L8014CC74:
    /* 1307C 8014CC74 FF004230 */  andi       $v0, $v0, 0xFF
  .L8014CC78:
    /* 13080 8014CC78 B7FF4010 */  beqz       $v0, .L8014CB58
    /* 13084 8014CC7C 00000000 */   nop
    /* 13088 8014CC80 1627050C */  jal        DRLG_L3MakeMegas__Fv
    /* 1308C 8014CC84 00000000 */   nop
    /* 13090 8014CC88 2400C016 */  bnez       $s6, .L8014CD1C
    /* 13094 8014CC8C 01000524 */   addiu     $a1, $zero, 0x1
    /* 13098 8014CC90 1580043C */  lui        $a0, %hi(L3UP)
    /* 1309C 8014CC94 F4868424 */  addiu      $a0, $a0, %lo(L3UP)
    /* 130A0 8014CC98 01000624 */  addiu      $a2, $zero, 0x1
    /* 130A4 8014CC9C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 130A8 8014CCA0 1000B4AF */  sw         $s4, 0x10($sp)
    /* 130AC 8014CCA4 1400B5AF */  sw         $s5, 0x14($sp)
    /* 130B0 8014CCA8 312C050C */  jal        DRLG_L3PlaceMiniSet__FPCUciiiiii
    /* 130B4 8014CCAC 1800A0AF */   sw        $zero, 0x18($sp)
    /* 130B8 8014CCB0 21804000 */  addu       $s0, $v0, $zero
    /* 130BC 8014CCB4 76000016 */  bnez       $s0, .L8014CE90
    /* 130C0 8014CCB8 01000524 */   addiu     $a1, $zero, 0x1
    /* 130C4 8014CCBC 1580043C */  lui        $a0, %hi(L3DOWN)
    /* 130C8 8014CCC0 08878424 */  addiu      $a0, $a0, %lo(L3DOWN)
    /* 130CC 8014CCC4 01000624 */  addiu      $a2, $zero, 0x1
    /* 130D0 8014CCC8 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 130D4 8014CCCC 1000B4AF */  sw         $s4, 0x10($sp)
    /* 130D8 8014CCD0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 130DC 8014CCD4 312C050C */  jal        DRLG_L3PlaceMiniSet__FPCUciiiiii
    /* 130E0 8014CCD8 1800B5AF */   sw        $s5, 0x18($sp)
    /* 130E4 8014CCDC 21804000 */  addu       $s0, $v0, $zero
    /* 130E8 8014CCE0 6B000016 */  bnez       $s0, .L8014CE90
    /* 130EC 8014CCE4 09000224 */   addiu     $v0, $zero, 0x9
    /* 130F0 8014CCE8 1280033C */  lui        $v1, %hi(currlevel)
    /* 130F4 8014CCEC 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 130F8 8014CCF0 00000000 */  nop
    /* 130FC 8014CCF4 5C006214 */  bne        $v1, $v0, .L8014CE68
    /* 13100 8014CCF8 01000524 */   addiu     $a1, $zero, 0x1
    /* 13104 8014CCFC 1580043C */  lui        $a0, %hi(L3HOLDWARP)
    /* 13108 8014CD00 1C878424 */  addiu      $a0, $a0, %lo(L3HOLDWARP)
    /* 1310C 8014CD04 01000624 */  addiu      $a2, $zero, 0x1
    /* 13110 8014CD08 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 13114 8014CD0C 06000224 */  addiu      $v0, $zero, 0x6
    /* 13118 8014CD10 1000B4AF */  sw         $s4, 0x10($sp)
    /* 1311C 8014CD14 97330508 */  j          .L8014CE5C
    /* 13120 8014CD18 1400A0AF */   sw        $zero, 0x14($sp)
  .L8014CD1C:
    /* 13124 8014CD1C 2E00D516 */  bne        $s6, $s5, .L8014CDD8
    /* 13128 8014CD20 01000624 */   addiu     $a2, $zero, 0x1
    /* 1312C 8014CD24 1580043C */  lui        $a0, %hi(L3UP)
    /* 13130 8014CD28 F4868424 */  addiu      $a0, $a0, %lo(L3UP)
    /* 13134 8014CD2C 01000524 */  addiu      $a1, $zero, 0x1
    /* 13138 8014CD30 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 1313C 8014CD34 1000B4AF */  sw         $s4, 0x10($sp)
    /* 13140 8014CD38 1400A0AF */  sw         $zero, 0x14($sp)
    /* 13144 8014CD3C 312C050C */  jal        DRLG_L3PlaceMiniSet__FPCUciiiiii
    /* 13148 8014CD40 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1314C 8014CD44 21804000 */  addu       $s0, $v0, $zero
    /* 13150 8014CD48 51000016 */  bnez       $s0, .L8014CE90
    /* 13154 8014CD4C 01000524 */   addiu     $a1, $zero, 0x1
    /* 13158 8014CD50 1580043C */  lui        $a0, %hi(L3DOWN)
    /* 1315C 8014CD54 08878424 */  addiu      $a0, $a0, %lo(L3DOWN)
    /* 13160 8014CD58 01000624 */  addiu      $a2, $zero, 0x1
    /* 13164 8014CD5C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 13168 8014CD60 1000B4AF */  sw         $s4, 0x10($sp)
    /* 1316C 8014CD64 1400B5AF */  sw         $s5, 0x14($sp)
    /* 13170 8014CD68 312C050C */  jal        DRLG_L3PlaceMiniSet__FPCUciiiiii
    /* 13174 8014CD6C 1800B5AF */   sw        $s5, 0x18($sp)
    /* 13178 8014CD70 21804000 */  addu       $s0, $v0, $zero
    /* 1317C 8014CD74 1280023C */  lui        $v0, %hi(ViewX)
    /* 13180 8014CD78 14C1428C */  lw         $v0, %lo(ViewX)($v0)
    /* 13184 8014CD7C 1280033C */  lui        $v1, %hi(ViewY)
    /* 13188 8014CD80 18C1638C */  lw         $v1, %lo(ViewY)($v1)
    /* 1318C 8014CD84 02004224 */  addiu      $v0, $v0, 0x2
    /* 13190 8014CD88 FEFF6324 */  addiu      $v1, $v1, -0x2
    /* 13194 8014CD8C 1280013C */  lui        $at, %hi(ViewX)
    /* 13198 8014CD90 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 1319C 8014CD94 1280013C */  lui        $at, %hi(ViewY)
    /* 131A0 8014CD98 18C123AC */  sw         $v1, %lo(ViewY)($at)
    /* 131A4 8014CD9C 3C000016 */  bnez       $s0, .L8014CE90
    /* 131A8 8014CDA0 09000224 */   addiu     $v0, $zero, 0x9
    /* 131AC 8014CDA4 1280033C */  lui        $v1, %hi(currlevel)
    /* 131B0 8014CDA8 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 131B4 8014CDAC 00000000 */  nop
    /* 131B8 8014CDB0 2D006214 */  bne        $v1, $v0, .L8014CE68
    /* 131BC 8014CDB4 01000524 */   addiu     $a1, $zero, 0x1
    /* 131C0 8014CDB8 1580043C */  lui        $a0, %hi(L3HOLDWARP)
    /* 131C4 8014CDBC 1C878424 */  addiu      $a0, $a0, %lo(L3HOLDWARP)
    /* 131C8 8014CDC0 01000624 */  addiu      $a2, $zero, 0x1
    /* 131CC 8014CDC4 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 131D0 8014CDC8 06000224 */  addiu      $v0, $zero, 0x6
    /* 131D4 8014CDCC 1000B4AF */  sw         $s4, 0x10($sp)
    /* 131D8 8014CDD0 97330508 */  j          .L8014CE5C
    /* 131DC 8014CDD4 1400A0AF */   sw        $zero, 0x14($sp)
  .L8014CDD8:
    /* 131E0 8014CDD8 1580043C */  lui        $a0, %hi(L3UP)
    /* 131E4 8014CDDC F4868424 */  addiu      $a0, $a0, %lo(L3UP)
    /* 131E8 8014CDE0 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 131EC 8014CDE4 1000B4AF */  sw         $s4, 0x10($sp)
    /* 131F0 8014CDE8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 131F4 8014CDEC 312C050C */  jal        DRLG_L3PlaceMiniSet__FPCUciiiiii
    /* 131F8 8014CDF0 1800A0AF */   sw        $zero, 0x18($sp)
    /* 131FC 8014CDF4 21804000 */  addu       $s0, $v0, $zero
    /* 13200 8014CDF8 25000016 */  bnez       $s0, .L8014CE90
    /* 13204 8014CDFC 01000524 */   addiu     $a1, $zero, 0x1
    /* 13208 8014CE00 1580043C */  lui        $a0, %hi(L3DOWN)
    /* 1320C 8014CE04 08878424 */  addiu      $a0, $a0, %lo(L3DOWN)
    /* 13210 8014CE08 01000624 */  addiu      $a2, $zero, 0x1
    /* 13214 8014CE0C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 13218 8014CE10 1000B4AF */  sw         $s4, 0x10($sp)
    /* 1321C 8014CE14 1400A0AF */  sw         $zero, 0x14($sp)
    /* 13220 8014CE18 312C050C */  jal        DRLG_L3PlaceMiniSet__FPCUciiiiii
    /* 13224 8014CE1C 1800B5AF */   sw        $s5, 0x18($sp)
    /* 13228 8014CE20 21804000 */  addu       $s0, $v0, $zero
    /* 1322C 8014CE24 1A000016 */  bnez       $s0, .L8014CE90
    /* 13230 8014CE28 09000224 */   addiu     $v0, $zero, 0x9
    /* 13234 8014CE2C 1280033C */  lui        $v1, %hi(currlevel)
    /* 13238 8014CE30 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 1323C 8014CE34 00000000 */  nop
    /* 13240 8014CE38 0B006214 */  bne        $v1, $v0, .L8014CE68
    /* 13244 8014CE3C 01000524 */   addiu     $a1, $zero, 0x1
    /* 13248 8014CE40 1580043C */  lui        $a0, %hi(L3HOLDWARP)
    /* 1324C 8014CE44 1C878424 */  addiu      $a0, $a0, %lo(L3HOLDWARP)
    /* 13250 8014CE48 01000624 */  addiu      $a2, $zero, 0x1
    /* 13254 8014CE4C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 13258 8014CE50 06000224 */  addiu      $v0, $zero, 0x6
    /* 1325C 8014CE54 1000B4AF */  sw         $s4, 0x10($sp)
    /* 13260 8014CE58 1400B5AF */  sw         $s5, 0x14($sp)
  .L8014CE5C:
    /* 13264 8014CE5C 312C050C */  jal        DRLG_L3PlaceMiniSet__FPCUciiiiii
    /* 13268 8014CE60 1800A2AF */   sw        $v0, 0x18($sp)
    /* 1326C 8014CE64 21804000 */  addu       $s0, $v0, $zero
  .L8014CE68:
    /* 13270 8014CE68 09000016 */  bnez       $s0, .L8014CE90
    /* 13274 8014CE6C 00000000 */   nop
    /* 13278 8014CE70 DC9E010C */  jal        QuestStatus__Fi
    /* 1327C 8014CE74 0A000424 */   addiu     $a0, $zero, 0xA
    /* 13280 8014CE78 FF004230 */  andi       $v0, $v0, 0xFF
    /* 13284 8014CE7C 04004010 */  beqz       $v0, .L8014CE90
    /* 13288 8014CE80 00000000 */   nop
    /* 1328C 8014CE84 1E31050C */  jal        DRLG_L3Anvil__Fv
    /* 13290 8014CE88 00000000 */   nop
    /* 13294 8014CE8C 21804000 */  addu       $s0, $v0, $zero
  .L8014CE90:
    /* 13298 8014CE90 2FFF1512 */  beq        $s0, $s5, .L8014CB50
    /* 1329C 8014CE94 00000000 */   nop
    /* 132A0 8014CE98 152B050C */  jal        DRLG_L3Pool__Fv
    /* 132A4 8014CE9C 00000000 */   nop
    /* 132A8 8014CEA0 64218293 */  lbu        $v0, %gp_rel(D_8011C8E4)($gp)
    /* 132AC 8014CEA4 00000000 */  nop
    /* 132B0 8014CEA8 29FF4010 */  beqz       $v0, .L8014CB50
    /* 132B4 8014CEAC 00000000 */   nop
    /* 132B8 8014CEB0 A92B050C */  jal        DRLG_L3PoolFix__Fv
    /* 132BC 8014CEB4 00000000 */   nop
    /* 132C0 8014CEB8 B431050C */  jal        FixL3Warp__Fv
    /* 132C4 8014CEBC 00000000 */   nop
    /* 132C8 8014CEC0 1580113C */  lui        $s1, %hi(L3ISLE1)
    /* 132CC 8014CEC4 18883126 */  addiu      $s1, $s1, %lo(L3ISLE1)
    /* 132D0 8014CEC8 21202002 */  addu       $a0, $s1, $zero
    /* 132D4 8014CECC 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 132D8 8014CED0 46000524 */   addiu     $a1, $zero, 0x46
    /* 132DC 8014CED4 1580103C */  lui        $s0, %hi(L3ISLE2)
    /* 132E0 8014CED8 28881026 */  addiu      $s0, $s0, %lo(L3ISLE2)
    /* 132E4 8014CEDC 21200002 */  addu       $a0, $s0, $zero
    /* 132E8 8014CEE0 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 132EC 8014CEE4 46000524 */   addiu     $a1, $zero, 0x46
    /* 132F0 8014CEE8 1580043C */  lui        $a0, %hi(L3ISLE3)
    /* 132F4 8014CEEC 38888424 */  addiu      $a0, $a0, %lo(L3ISLE3)
    /* 132F8 8014CEF0 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 132FC 8014CEF4 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13300 8014CEF8 1580043C */  lui        $a0, %hi(L3ISLE4)
    /* 13304 8014CEFC 48888424 */  addiu      $a0, $a0, %lo(L3ISLE4)
    /* 13308 8014CF00 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 1330C 8014CF04 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13310 8014CF08 21202002 */  addu       $a0, $s1, $zero
    /* 13314 8014CF0C 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13318 8014CF10 64000524 */   addiu     $a1, $zero, 0x64
    /* 1331C 8014CF14 21200002 */  addu       $a0, $s0, $zero
    /* 13320 8014CF18 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13324 8014CF1C 64000524 */   addiu     $a1, $zero, 0x64
    /* 13328 8014CF20 1580043C */  lui        $a0, %hi(L3ISLE5)
    /* 1332C 8014CF24 58888424 */  addiu      $a0, $a0, %lo(L3ISLE5)
    /* 13330 8014CF28 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13334 8014CF2C 5A000524 */   addiu     $a1, $zero, 0x5A
    /* 13338 8014CF30 EE31050C */  jal        FixL3HallofHeroes__Fv
    /* 1333C 8014CF34 00000000 */   nop
    /* 13340 8014CF38 6527050C */  jal        DRLG_L3River__Fv
    /* 13344 8014CF3C 00000000 */   nop
    /* 13348 8014CF40 DC9E010C */  jal        QuestStatus__Fi
    /* 1334C 8014CF44 0A000424 */   addiu     $a0, $zero, 0xA
    /* 13350 8014CF48 FF004230 */  andi       $v0, $v0, 0xFF
    /* 13354 8014CF4C 21004010 */  beqz       $v0, .L8014CFD4
    /* 13358 8014CF50 00000000 */   nop
    /* 1335C 8014CF54 0E80063C */  lui        $a2, %hi(dungeon + 0x2A0)
    /* 13360 8014CF58 6443C624 */  addiu      $a2, $a2, %lo(dungeon + 0x2A0)
    /* 13364 8014CF5C 07000424 */  addiu      $a0, $zero, 0x7
    /* 13368 8014CF60 1280023C */  lui        $v0, %hi(setpc_x)
    /* 1336C 8014CF64 E4C0428C */  lw         $v0, %lo(setpc_x)($v0)
    /* 13370 8014CF68 1280053C */  lui        $a1, %hi(setpc_y)
    /* 13374 8014CF6C E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 13378 8014CF70 40180200 */  sll        $v1, $v0, 1
    /* 1337C 8014CF74 21186200 */  addu       $v1, $v1, $v0
    /* 13380 8014CF78 40190300 */  sll        $v1, $v1, 5
    /* 13384 8014CF7C 21106600 */  addu       $v0, $v1, $a2
    /* 13388 8014CF80 40280500 */  sll        $a1, $a1, 1
    /* 1338C 8014CF84 2110A200 */  addu       $v0, $a1, $v0
    /* 13390 8014CF88 0A0044A4 */  sh         $a0, 0xA($v0)
    /* 13394 8014CF8C 6000C224 */  addiu      $v0, $a2, 0x60
    /* 13398 8014CF90 21106200 */  addu       $v0, $v1, $v0
    /* 1339C 8014CF94 2110A200 */  addu       $v0, $a1, $v0
    /* 133A0 8014CF98 0A0044A4 */  sh         $a0, 0xA($v0)
    /* 133A4 8014CF9C C000C224 */  addiu      $v0, $a2, 0xC0
    /* 133A8 8014CFA0 21106200 */  addu       $v0, $v1, $v0
    /* 133AC 8014CFA4 2110A200 */  addu       $v0, $a1, $v0
    /* 133B0 8014CFA8 2001C624 */  addiu      $a2, $a2, 0x120
    /* 133B4 8014CFAC 21186600 */  addu       $v1, $v1, $a2
    /* 133B8 8014CFB0 2128A300 */  addu       $a1, $a1, $v1
    /* 133BC 8014CFB4 0A0044A4 */  sh         $a0, 0xA($v0)
    /* 133C0 8014CFB8 0A00A294 */  lhu        $v0, 0xA($a1)
    /* 133C4 8014CFBC 00000000 */  nop
    /* 133C8 8014CFC0 EFFF4224 */  addiu      $v0, $v0, -0x11
    /* 133CC 8014CFC4 0200422C */  sltiu      $v0, $v0, 0x2
    /* 133D0 8014CFC8 02004010 */  beqz       $v0, .L8014CFD4
    /* 133D4 8014CFCC 2D000224 */   addiu     $v0, $zero, 0x2D
    /* 133D8 8014CFD0 0A00A2A4 */  sh         $v0, 0xA($a1)
  .L8014CFD4:
    /* 133DC 8014CFD4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 133E0 8014CFD8 05000424 */  addiu      $a0, $zero, 0x5
    /* 133E4 8014CFDC 0A000524 */  addiu      $a1, $zero, 0xA
    /* 133E8 8014CFE0 07000624 */  addiu      $a2, $zero, 0x7
    /* 133EC 8014CFE4 AE6D050C */  jal        DRLG_PlaceThemeRooms__FiiiiUc
    /* 133F0 8014CFE8 21380000 */   addu      $a3, $zero, $zero
    /* 133F4 8014CFEC 1E24050C */  jal        FixL3Dungeon__Fv
    /* 133F8 8014CFF0 00000000 */   nop
    /* 133FC 8014CFF4 292F050C */  jal        DRLG_L3Wood__Fv
    /* 13400 8014CFF8 00000000 */   nop
    /* 13404 8014CFFC 1580043C */  lui        $a0, %hi(L3TITE1)
    /* 13408 8014D000 30878424 */  addiu      $a0, $a0, %lo(L3TITE1)
    /* 1340C 8014D004 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13410 8014D008 0A000524 */   addiu     $a1, $zero, 0xA
    /* 13414 8014D00C 1580043C */  lui        $a0, %hi(L3TITE2)
    /* 13418 8014D010 54878424 */  addiu      $a0, $a0, %lo(L3TITE2)
    /* 1341C 8014D014 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13420 8014D018 0A000524 */   addiu     $a1, $zero, 0xA
    /* 13424 8014D01C 1580043C */  lui        $a0, %hi(L3TITE3)
    /* 13428 8014D020 78878424 */  addiu      $a0, $a0, %lo(L3TITE3)
    /* 1342C 8014D024 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13430 8014D028 0A000524 */   addiu     $a1, $zero, 0xA
    /* 13434 8014D02C 1580043C */  lui        $a0, %hi(L3TITE7)
    /* 13438 8014D030 9C878424 */  addiu      $a0, $a0, %lo(L3TITE7)
    /* 1343C 8014D034 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13440 8014D038 14000524 */   addiu     $a1, $zero, 0x14
    /* 13444 8014D03C 1580043C */  lui        $a0, %hi(L3TITE8)
    /* 13448 8014D040 C8878424 */  addiu      $a0, $a0, %lo(L3TITE8)
    /* 1344C 8014D044 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13450 8014D048 14000524 */   addiu     $a1, $zero, 0x14
    /* 13454 8014D04C 1580043C */  lui        $a0, %hi(L3TITE9)
    /* 13458 8014D050 DC878424 */  addiu      $a0, $a0, %lo(L3TITE9)
    /* 1345C 8014D054 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13460 8014D058 14000524 */   addiu     $a1, $zero, 0x14
    /* 13464 8014D05C 1580043C */  lui        $a0, %hi(L3TITE10)
    /* 13468 8014D060 F0878424 */  addiu      $a0, $a0, %lo(L3TITE10)
    /* 1346C 8014D064 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13470 8014D068 14000524 */   addiu     $a1, $zero, 0x14
    /* 13474 8014D06C 1580043C */  lui        $a0, %hi(L3TITE11)
    /* 13478 8014D070 04888424 */  addiu      $a0, $a0, %lo(L3TITE11)
    /* 1347C 8014D074 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13480 8014D078 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13484 8014D07C 1280043C */  lui        $a0, %hi(D_8011BEEC)
    /* 13488 8014D080 ECBE8424 */  addiu      $a0, $a0, %lo(D_8011BEEC)
    /* 1348C 8014D084 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13490 8014D088 14000524 */   addiu     $a1, $zero, 0x14
    /* 13494 8014D08C 1280043C */  lui        $a0, %hi(D_8011BEF4)
    /* 13498 8014D090 F4BE8424 */  addiu      $a0, $a0, %lo(D_8011BEF4)
    /* 1349C 8014D094 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 134A0 8014D098 14000524 */   addiu     $a1, $zero, 0x14
    /* 134A4 8014D09C 1280043C */  lui        $a0, %hi(D_8011BEFC)
    /* 134A8 8014D0A0 FCBE8424 */  addiu      $a0, $a0, %lo(D_8011BEFC)
    /* 134AC 8014D0A4 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 134B0 8014D0A8 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 134B4 8014D0AC 1280043C */  lui        $a0, %hi(D_8011BF04)
    /* 134B8 8014D0B0 04BF8424 */  addiu      $a0, $a0, %lo(D_8011BF04)
    /* 134BC 8014D0B4 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 134C0 8014D0B8 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 134C4 8014D0BC 1280043C */  lui        $a0, %hi(D_8011BF0C)
    /* 134C8 8014D0C0 0CBF8424 */  addiu      $a0, $a0, %lo(D_8011BF0C)
    /* 134CC 8014D0C4 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 134D0 8014D0C8 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 134D4 8014D0CC 1280043C */  lui        $a0, %hi(D_8011BF14)
    /* 134D8 8014D0D0 14BF8424 */  addiu      $a0, $a0, %lo(D_8011BF14)
    /* 134DC 8014D0D4 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 134E0 8014D0D8 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 134E4 8014D0DC 1280043C */  lui        $a0, %hi(D_8011BF1C)
    /* 134E8 8014D0E0 1CBF8424 */  addiu      $a0, $a0, %lo(D_8011BF1C)
    /* 134EC 8014D0E4 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 134F0 8014D0E8 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 134F4 8014D0EC 1280043C */  lui        $a0, %hi(D_8011BF24)
    /* 134F8 8014D0F0 24BF8424 */  addiu      $a0, $a0, %lo(D_8011BF24)
    /* 134FC 8014D0F4 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13500 8014D0F8 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13504 8014D0FC 1280043C */  lui        $a0, %hi(D_8011BF2C)
    /* 13508 8014D100 2CBF8424 */  addiu      $a0, $a0, %lo(D_8011BF2C)
    /* 1350C 8014D104 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13510 8014D108 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13514 8014D10C 1280043C */  lui        $a0, %hi(D_8011BF34)
    /* 13518 8014D110 34BF8424 */  addiu      $a0, $a0, %lo(D_8011BF34)
    /* 1351C 8014D114 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13520 8014D118 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13524 8014D11C 1280043C */  lui        $a0, %hi(D_8011BF3C)
    /* 13528 8014D120 3CBF8424 */  addiu      $a0, $a0, %lo(D_8011BF3C)
    /* 1352C 8014D124 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13530 8014D128 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13534 8014D12C 1280043C */  lui        $a0, %hi(D_8011BF44)
    /* 13538 8014D130 44BF8424 */  addiu      $a0, $a0, %lo(D_8011BF44)
    /* 1353C 8014D134 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13540 8014D138 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13544 8014D13C 1280043C */  lui        $a0, %hi(D_8011BF4C)
    /* 13548 8014D140 4CBF8424 */  addiu      $a0, $a0, %lo(D_8011BF4C)
    /* 1354C 8014D144 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13550 8014D148 1E000524 */   addiu     $a1, $zero, 0x1E
    /* 13554 8014D14C 1280043C */  lui        $a0, %hi(D_8011BF54)
    /* 13558 8014D150 54BF8424 */  addiu      $a0, $a0, %lo(D_8011BF54)
    /* 1355C 8014D154 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13560 8014D158 19000524 */   addiu     $a1, $zero, 0x19
    /* 13564 8014D15C 1280043C */  lui        $a0, %hi(D_8011BF58)
    /* 13568 8014D160 58BF8424 */  addiu      $a0, $a0, %lo(D_8011BF58)
    /* 1356C 8014D164 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13570 8014D168 19000524 */   addiu     $a1, $zero, 0x19
    /* 13574 8014D16C 1280043C */  lui        $a0, %hi(D_8011BF5C)
    /* 13578 8014D170 5CBF8424 */  addiu      $a0, $a0, %lo(D_8011BF5C)
    /* 1357C 8014D174 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13580 8014D178 19000524 */   addiu     $a1, $zero, 0x19
    /* 13584 8014D17C 1280043C */  lui        $a0, %hi(D_8011BF60)
    /* 13588 8014D180 60BF8424 */  addiu      $a0, $a0, %lo(D_8011BF60)
    /* 1358C 8014D184 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 13590 8014D188 19000524 */   addiu     $a1, $zero, 0x19
    /* 13594 8014D18C 1280043C */  lui        $a0, %hi(D_8011BF64)
    /* 13598 8014D190 64BF8424 */  addiu      $a0, $a0, %lo(D_8011BF64)
    /* 1359C 8014D194 0C2D050C */  jal        DRLG_L3PlaceRndSet__FPCUci
    /* 135A0 8014D198 19000524 */   addiu     $a1, $zero, 0x19
    /* 135A4 8014D19C 9A32050C */  jal        DRLG_L3SetWalls__Fv
    /* 135A8 8014D1A0 00000000 */   nop
    /* 135AC 8014D1A4 0724050C */  jal        SetBlankL3Dungeon__Fv
    /* 135B0 8014D1A8 00000000 */   nop
    /* 135B4 8014D1AC 21380000 */  addu       $a3, $zero, $zero
    /* 135B8 8014D1B0 0E800A3C */  lui        $t2, %hi(pdungeon)
    /* 135BC 8014D1B4 C4524A25 */  addiu      $t2, $t2, %lo(pdungeon)
    /* 135C0 8014D1B8 0E80093C */  lui        $t1, %hi(dungeon)
    /* 135C4 8014D1BC C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* 135C8 8014D1C0 21300000 */  addu       $a2, $zero, $zero
  .L8014D1C4:
    /* 135CC 8014D1C4 40400700 */  sll        $t0, $a3, 1
    /* 135D0 8014D1C8 21282001 */  addu       $a1, $t1, $zero
    /* 135D4 8014D1CC 21204001 */  addu       $a0, $t2, $zero
  .L8014D1D0:
    /* 135D8 8014D1D0 21100501 */  addu       $v0, $t0, $a1
    /* 135DC 8014D1D4 6000A524 */  addiu      $a1, $a1, 0x60
    /* 135E0 8014D1D8 21188700 */  addu       $v1, $a0, $a3
    /* 135E4 8014D1DC 00004294 */  lhu        $v0, 0x0($v0)
    /* 135E8 8014D1E0 0100C624 */  addiu      $a2, $a2, 0x1
    /* 135EC 8014D1E4 000062A0 */  sb         $v0, 0x0($v1)
    /* 135F0 8014D1E8 2800C228 */  slti       $v0, $a2, 0x28
    /* 135F4 8014D1EC F8FF4014 */  bnez       $v0, .L8014D1D0
    /* 135F8 8014D1F0 28008424 */   addiu     $a0, $a0, 0x28
    /* 135FC 8014D1F4 0100E724 */  addiu      $a3, $a3, 0x1
    /* 13600 8014D1F8 2800E228 */  slti       $v0, $a3, 0x28
    /* 13604 8014D1FC F1FF4014 */  bnez       $v0, .L8014D1C4
    /* 13608 8014D200 21300000 */   addu      $a2, $zero, $zero
    /* 1360C 8014D204 ABF3040C */  jal        DRLG_Init_Globals__Fv
    /* 13610 8014D208 00000000 */   nop
    /* 13614 8014D20C 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 13618 8014D210 3800B68F */  lw         $s6, 0x38($sp)
    /* 1361C 8014D214 3400B58F */  lw         $s5, 0x34($sp)
    /* 13620 8014D218 3000B48F */  lw         $s4, 0x30($sp)
    /* 13624 8014D21C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 13628 8014D220 2800B28F */  lw         $s2, 0x28($sp)
    /* 1362C 8014D224 2400B18F */  lw         $s1, 0x24($sp)
    /* 13630 8014D228 2000B08F */  lw         $s0, 0x20($sp)
    /* 13634 8014D22C 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 13638 8014D230 0800E003 */  jr         $ra
    /* 1363C 8014D234 00000000 */   nop
endlabel DRLG_L3__Fi
