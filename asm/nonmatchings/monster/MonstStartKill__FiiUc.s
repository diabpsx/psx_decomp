.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MonstStartKill__FiiUc, 0x31C

glabel MonstStartKill__FiiUc
    /* 11FAC 8014BBA4 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 11FB0 8014BBA8 3000B2AF */  sw         $s2, 0x30($sp)
    /* 11FB4 8014BBAC 21908000 */  addu       $s2, $a0, $zero
    /* 11FB8 8014BBB0 3800B4AF */  sw         $s4, 0x38($sp)
    /* 11FBC 8014BBB4 21A0A000 */  addu       $s4, $a1, $zero
    /* 11FC0 8014BBB8 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 11FC4 8014BBBC 21A8C000 */  addu       $s5, $a2, $zero
    /* 11FC8 8014BBC0 40101200 */  sll        $v0, $s2, 1
    /* 11FCC 8014BBC4 21105200 */  addu       $v0, $v0, $s2
    /* 11FD0 8014BBC8 80100200 */  sll        $v0, $v0, 2
    /* 11FD4 8014BBCC 21105200 */  addu       $v0, $v0, $s2
    /* 11FD8 8014BBD0 C0100200 */  sll        $v0, $v0, 3
    /* 11FDC 8014BBD4 1080033C */  lui        $v1, %hi(monster)
    /* 11FE0 8014BBD8 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 11FE4 8014BBDC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 11FE8 8014BBE0 21884300 */  addu       $s1, $v0, $v1
    /* 11FEC 8014BBE4 4000BFAF */  sw         $ra, 0x40($sp)
    /* 11FF0 8014BBE8 3400B3AF */  sw         $s3, 0x34($sp)
    /* 11FF4 8014BBEC 04008006 */  bltz       $s4, .L8014BC00
    /* 11FF8 8014BBF0 2800B0AF */   sw        $s0, 0x28($sp)
    /* 11FFC 8014BBF4 01000224 */  addiu      $v0, $zero, 0x1
    /* 12000 8014BBF8 04108202 */  sllv       $v0, $v0, $s4
    /* 12004 8014BBFC 460022A2 */  sb         $v0, 0x46($s1)
  .L8014BC00:
    /* 12008 8014BC00 0200822A */  slti       $v0, $s4, 0x2
    /* 1200C 8014BC04 0E004010 */  beqz       $v0, .L8014BC40
    /* 12010 8014BC08 0300422A */   slti      $v0, $s2, 0x3
    /* 12014 8014BC0C 0C004014 */  bnez       $v0, .L8014BC40
    /* 12018 8014BC10 00000000 */   nop
    /* 1201C 8014BC14 1280103C */  lui        $s0, %hi(myplr)
    /* 12020 8014BC18 08BA108E */  lw         $s0, %lo(myplr)($s0)
    /* 12024 8014BC1C 1280013C */  lui        $at, %hi(myplr)
    /* 12028 8014BC20 08BA34AC */  sw         $s4, %lo(myplr)($at)
    /* 1202C 8014BC24 47002482 */  lb         $a0, 0x47($s1)
    /* 12030 8014BC28 2E002596 */  lhu        $a1, 0x2E($s1)
    /* 12034 8014BC2C 46002682 */  lb         $a2, 0x46($s1)
    /* 12038 8014BC30 2882010C */  jal        AddPlrMonstExper__Filc
    /* 1203C 8014BC34 00000000 */   nop
    /* 12040 8014BC38 1280013C */  lui        $at, %hi(myplr)
    /* 12044 8014BC3C 08BA30AC */  sw         $s0, %lo(myplr)($at)
  .L8014BC40:
    /* 12048 8014BC40 6000228E */  lw         $v0, 0x60($s1)
    /* 1204C 8014BC44 00000000 */  nop
    /* 12050 8014BC48 12004390 */  lbu        $v1, 0x12($v0)
    /* 12054 8014BC4C 1180023C */  lui        $v0, %hi(monstkills)
    /* 12058 8014BC50 40A24224 */  addiu      $v0, $v0, %lo(monstkills)
    /* 1205C 8014BC54 40180300 */  sll        $v1, $v1, 1
    /* 12060 8014BC58 21186200 */  addu       $v1, $v1, $v0
    /* 12064 8014BC5C 00006294 */  lhu        $v0, 0x0($v1)
    /* 12068 8014BC60 00000000 */  nop
    /* 1206C 8014BC64 01004224 */  addiu      $v0, $v0, 0x1
    /* 12070 8014BC68 000062A4 */  sh         $v0, 0x0($v1)
    /* 12074 8014BC6C 34002582 */  lb         $a1, 0x34($s1)
    /* 12078 8014BC70 35002682 */  lb         $a2, 0x35($s1)
    /* 1207C 8014BC74 21204002 */  addu       $a0, $s2, $zero
    /* 12080 8014BC78 AE1E050C */  jal        RemoveStoneMissiles__Fiii
    /* 12084 8014BC7C 100020AE */   sw        $zero, 0x10($s1)
    /* 12088 8014BC80 B7F6000C */  jal        GetRndSeed__Fv
    /* 1208C 8014BC84 00000000 */   nop
    /* 12090 8014BC88 C9F6000C */  jal        ENG_random__Fl
    /* 12094 8014BC8C 21204000 */   addu      $a0, $v0, $zero
    /* 12098 8014BC90 B3F6000C */  jal        SetRndSeed__Fl
    /* 1209C 8014BC94 21204000 */   addu      $a0, $v0, $zero
    /* 120A0 8014BC98 DC9E010C */  jal        QuestStatus__Fi
    /* 120A4 8014BC9C 02000424 */   addiu     $a0, $zero, 0x2
    /* 120A8 8014BCA0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 120AC 8014BCA4 14004010 */  beqz       $v0, .L8014BCF8
    /* 120B0 8014BCA8 0400422A */   slti      $v0, $s2, 0x4
    /* 120B4 8014BCAC 1180033C */  lui        $v1, %hi(UniqMonst + 0x2)
    /* 120B8 8014BCB0 0AC76394 */  lhu        $v1, %lo(UniqMonst + 0x2)($v1)
    /* 120BC 8014BCB4 5C00228E */  lw         $v0, 0x5C($s1)
    /* 120C0 8014BCB8 00000000 */  nop
    /* 120C4 8014BCBC 0E004314 */  bne        $v0, $v1, .L8014BCF8
    /* 120C8 8014BCC0 0400422A */   slti      $v0, $s2, 0x4
    /* 120CC 8014BCC4 01000624 */  addiu      $a2, $zero, 0x1
    /* 120D0 8014BCC8 04000724 */  addiu      $a3, $zero, 0x4
    /* 120D4 8014BCCC 34002482 */  lb         $a0, 0x34($s1)
    /* 120D8 8014BCD0 35002582 */  lb         $a1, 0x35($s1)
    /* 120DC 8014BCD4 01000224 */  addiu      $v0, $zero, 0x1
    /* 120E0 8014BCD8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 120E4 8014BCDC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 120E8 8014BCE0 1800A0AF */  sw         $zero, 0x18($sp)
    /* 120EC 8014BCE4 01008424 */  addiu      $a0, $a0, 0x1
    /* 120F0 8014BCE8 B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 120F4 8014BCEC 0100A524 */   addiu     $a1, $a1, 0x1
    /* 120F8 8014BCF0 442F0508 */  j          .L8014BD10
    /* 120FC 8014BCF4 00000000 */   nop
  .L8014BCF8:
    /* 12100 8014BCF8 05004014 */  bnez       $v0, .L8014BD10
    /* 12104 8014BCFC 21204002 */   addu      $a0, $s2, $zero
    /* 12108 8014BD00 34002582 */  lb         $a1, 0x34($s1)
    /* 1210C 8014BD04 35002682 */  lb         $a2, 0x35($s1)
    /* 12110 8014BD08 F211010C */  jal        SpawnItem__FiiiUc
    /* 12114 8014BD0C FF00A732 */   andi      $a3, $s5, 0xFF
  .L8014BD10:
    /* 12118 8014BD10 4F002292 */  lbu        $v0, 0x4F($s1)
    /* 1211C 8014BD14 00000000 */  nop
    /* 12120 8014BD18 03004010 */  beqz       $v0, .L8014BD28
    /* 12124 8014BD1C 00000000 */   nop
    /* 12128 8014BD20 D7F3000C */  jal        stream_stop__Fv
    /* 1212C 8014BD24 00000000 */   nop
  .L8014BD28:
    /* 12130 8014BD28 6000228E */  lw         $v0, 0x60($s1)
    /* 12134 8014BD2C 00000000 */  nop
    /* 12138 8014BD30 12004390 */  lbu        $v1, 0x12($v0)
    /* 1213C 8014BD34 6E000224 */  addiu      $v0, $zero, 0x6E
    /* 12140 8014BD38 06006214 */  bne        $v1, $v0, .L8014BD54
    /* 12144 8014BD3C 21204002 */   addu      $a0, $s2, $zero
    /* 12148 8014BD40 01000524 */  addiu      $a1, $zero, 0x1
    /* 1214C 8014BD44 702D050C */  jal        M_DiabloDeath__FiUci
    /* 12150 8014BD48 21308002 */   addu      $a2, $s4, $zero
    /* 12154 8014BD4C 572F0508 */  j          .L8014BD5C
    /* 12158 8014BD50 00000000 */   nop
  .L8014BD54:
    /* 1215C 8014BD54 4AF5000C */  jal        PlayEffect__Fii
    /* 12160 8014BD58 02000524 */   addiu     $a1, $zero, 0x2
  .L8014BD5C:
    /* 12164 8014BD5C 1080033C */  lui        $v1, %hi(monster)
    /* 12168 8014BD60 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1216C 8014BD64 40101200 */  sll        $v0, $s2, 1
    /* 12170 8014BD68 21105200 */  addu       $v0, $v0, $s2
    /* 12174 8014BD6C 80100200 */  sll        $v0, $v0, 2
    /* 12178 8014BD70 21105200 */  addu       $v0, $v0, $s2
    /* 1217C 8014BD74 C0100200 */  sll        $v0, $v0, 3
    /* 12180 8014BD78 21104300 */  addu       $v0, $v0, $v1
    /* 12184 8014BD7C 38005080 */  lb         $s0, 0x38($v0)
    /* 12188 8014BD80 39005380 */  lb         $s3, 0x39($v0)
    /* 1218C 8014BD84 05008006 */  bltz       $s4, .L8014BD9C
    /* 12190 8014BD88 21204002 */   addu      $a0, $s2, $zero
    /* 12194 8014BD8C EB2A050C */  jal        M_GetDir__Fi
    /* 12198 8014BD90 21204002 */   addu      $a0, $s2, $zero
    /* 1219C 8014BD94 682F0508 */  j          .L8014BDA0
    /* 121A0 8014BD98 21204002 */   addu      $a0, $s2, $zero
  .L8014BD9C:
    /* 121A4 8014BD9C 3C002282 */  lb         $v0, 0x3C($s1)
  .L8014BDA0:
    /* 121A8 8014BDA0 00000000 */  nop
    /* 121AC 8014BDA4 21304000 */  addu       $a2, $v0, $zero
    /* 121B0 8014BDA8 6000258E */  lw         $a1, 0x60($s1)
    /* 121B4 8014BDAC 04000724 */  addiu      $a3, $zero, 0x4
    /* 121B8 8014BDB0 3C0026A2 */  sb         $a2, 0x3C($s1)
    /* 121BC 8014BDB4 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 121C0 8014BDB8 0C00A524 */   addiu     $a1, $a1, 0xC
    /* 121C4 8014BDBC 06000224 */  addiu      $v0, $zero, 0x6
    /* 121C8 8014BDC0 330022A2 */  sb         $v0, 0x33($s1)
    /* 121CC 8014BDC4 0400422A */  slti       $v0, $s2, 0x4
    /* 121D0 8014BDC8 03004014 */  bnez       $v0, .L8014BDD8
    /* 121D4 8014BDCC 00000000 */   nop
    /* 121D8 8014BDD0 3A0020A2 */  sb         $zero, 0x3A($s1)
    /* 121DC 8014BDD4 3B0020A2 */  sb         $zero, 0x3B($s1)
  .L8014BDD8:
    /* 121E0 8014BDD8 21204002 */  addu       $a0, $s2, $zero
    /* 121E4 8014BDDC 180020A6 */  sh         $zero, 0x18($s1)
    /* 121E8 8014BDE0 340030A2 */  sb         $s0, 0x34($s1)
    /* 121EC 8014BDE4 350033A2 */  sb         $s3, 0x35($s1)
    /* 121F0 8014BDE8 360030A2 */  sb         $s0, 0x36($s1)
    /* 121F4 8014BDEC 370033A2 */  sb         $s3, 0x37($s1)
    /* 121F8 8014BDF0 380030A2 */  sb         $s0, 0x38($s1)
    /* 121FC 8014BDF4 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 12200 8014BDF8 390033A2 */   sb        $s3, 0x39($s1)
    /* 12204 8014BDFC D7FC010C */  jal        M_ClearSquares__Fi
    /* 12208 8014BE00 21204002 */   addu      $a0, $s2, $zero
    /* 1220C 8014BE04 21204002 */  addu       $a0, $s2, $zero
    /* 12210 8014BE08 C0181300 */  sll        $v1, $s3, 3
    /* 12214 8014BE0C C0101000 */  sll        $v0, $s0, 3
    /* 12218 8014BE10 23105000 */  subu       $v0, $v0, $s0
    /* 1221C 8014BE14 C0110200 */  sll        $v0, $v0, 7
    /* 12220 8014BE18 21186200 */  addu       $v1, $v1, $v0
    /* 12224 8014BE1C 01004226 */  addiu      $v0, $s2, 0x1
    /* 12228 8014BE20 0E80013C */  lui        $at, %hi(dung_map)
    /* 1222C 8014BE24 21082300 */  addu       $at, $at, $v1
    /* 12230 8014BE28 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 12234 8014BE2C 019F010C */  jal        CheckQuestKill__FiUc
    /* 12238 8014BE30 FF00A532 */   andi      $a1, $s5, 0xFF
    /* 1223C 8014BE34 21200002 */  addu       $a0, $s0, $zero
    /* 12240 8014BE38 D355050C */  jal        M_FallenFear__Fii
    /* 12244 8014BE3C 21286002 */   addu      $a1, $s3, $zero
    /* 12248 8014BE40 6000228E */  lw         $v0, 0x60($s1)
    /* 1224C 8014BE44 00000000 */  nop
    /* 12250 8014BE48 12004290 */  lbu        $v0, 0x12($v0)
    /* 12254 8014BE4C 00000000 */  nop
    /* 12258 8014BE50 D2FF4224 */  addiu      $v0, $v0, -0x2E
    /* 1225C 8014BE54 0400422C */  sltiu      $v0, $v0, 0x4
    /* 12260 8014BE58 0F004010 */  beqz       $v0, .L8014BE98
    /* 12264 8014BE5C 21200002 */   addu      $a0, $s0, $zero
    /* 12268 8014BE60 21286002 */  addu       $a1, $s3, $zero
    /* 1226C 8014BE64 21300000 */  addu       $a2, $zero, $zero
    /* 12270 8014BE68 3B000224 */  addiu      $v0, $zero, 0x3B
    /* 12274 8014BE6C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 12278 8014BE70 01000224 */  addiu      $v0, $zero, 0x1
    /* 1227C 8014BE74 1000A0AF */  sw         $zero, 0x10($sp)
    /* 12280 8014BE78 1800A2AF */  sw         $v0, 0x18($sp)
    /* 12284 8014BE7C 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 12288 8014BE80 4D002292 */  lbu        $v0, 0x4D($s1)
    /* 1228C 8014BE84 21380000 */  addu       $a3, $zero, $zero
    /* 12290 8014BE88 2400A0AF */  sw         $zero, 0x24($sp)
    /* 12294 8014BE8C 01004224 */  addiu      $v0, $v0, 0x1
    /* 12298 8014BE90 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 1229C 8014BE94 2000A2AF */   sw        $v0, 0x20($sp)
  .L8014BE98:
    /* 122A0 8014BE98 4000BF8F */  lw         $ra, 0x40($sp)
    /* 122A4 8014BE9C 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 122A8 8014BEA0 3800B48F */  lw         $s4, 0x38($sp)
    /* 122AC 8014BEA4 3400B38F */  lw         $s3, 0x34($sp)
    /* 122B0 8014BEA8 3000B28F */  lw         $s2, 0x30($sp)
    /* 122B4 8014BEAC 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 122B8 8014BEB0 2800B08F */  lw         $s0, 0x28($sp)
    /* 122BC 8014BEB4 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 122C0 8014BEB8 0800E003 */  jr         $ra
    /* 122C4 8014BEBC 00000000 */   nop
endlabel MonstStartKill__FiiUc
