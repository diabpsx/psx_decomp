.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RestoreLoadedData__Fb, 0x460

glabel RestoreLoadedData__Fb
    /* 22DD4 8015C9CC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 22DD8 8015C9D0 1480023C */  lui        $v0, %hi(save_buffer)
    /* 22DDC 8015C9D4 EC364224 */  addiu      $v0, $v0, %lo(save_buffer)
    /* 22DE0 8015C9D8 2400BFAF */  sw         $ra, 0x24($sp)
    /* 22DE4 8015C9DC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 22DE8 8015C9E0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 22DEC 8015C9E4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 22DF0 8015C9E8 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22DF4 8015C9EC 656E050C */  jal        ILoad__Fv
    /* 22DF8 8015C9F0 21800000 */   addu      $s0, $zero, $zero
    /* 22DFC 8015C9F4 656E050C */  jal        ILoad__Fv
    /* 22E00 8015C9F8 21904000 */   addu      $s2, $v0, $zero
    /* 22E04 8015C9FC 1280013C */  lui        $at, %hi(FePlayerNo)
    /* 22E08 8015CA00 78B322AC */  sw         $v0, %lo(FePlayerNo)($at)
    /* 22E0C 8015CA04 656E050C */  jal        ILoad__Fv
    /* 22E10 8015CA08 00000000 */   nop
    /* 22E14 8015CA0C 656E050C */  jal        ILoad__Fv
    /* 22E18 8015CA10 00000000 */   nop
    /* 22E1C 8015CA14 1280013C */  lui        $at, %hi(currlevel)
    /* 22E20 8015CA18 0CC122A0 */  sb         $v0, %lo(currlevel)($at)
    /* 22E24 8015CA1C 656E050C */  jal        ILoad__Fv
    /* 22E28 8015CA20 00000000 */   nop
    /* 22E2C 8015CA24 1280013C */  lui        $at, %hi(leveltype)
    /* 22E30 8015CA28 0DC122A0 */  sb         $v0, %lo(leveltype)($at)
    /* 22E34 8015CA2C 656E050C */  jal        ILoad__Fv
    /* 22E38 8015CA30 00000000 */   nop
    /* 22E3C 8015CA34 1280013C */  lui        $at, %hi(setlevel)
    /* 22E40 8015CA38 0EC122A0 */  sb         $v0, %lo(setlevel)($at)
    /* 22E44 8015CA3C 656E050C */  jal        ILoad__Fv
    /* 22E48 8015CA40 00000000 */   nop
    /* 22E4C 8015CA44 5421848F */  lw         $a0, %gp_rel(D_8011C8D4)($gp)
    /* 22E50 8015CA48 1280013C */  lui        $at, %hi(setlvlnum)
    /* 22E54 8015CA4C 0FC122A0 */  sb         $v0, %lo(setlvlnum)($at)
    /* 22E58 8015CA50 633D010C */  jal        DeltaImportData__FPc
    /* 22E5C 8015CA54 00000000 */   nop
    /* 22E60 8015CA58 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 22E64 8015CA5C 0E80073C */  lui        $a3, %hi(portal)
    /* 22E68 8015CA60 EC3BE724 */  addiu      $a3, $a3, %lo(portal)
    /* 22E6C 8015CA64 21186200 */  addu       $v1, $v1, $v0
    /* 22E70 8015CA68 542183AF */  sw         $v1, %gp_rel(D_8011C8D4)($gp)
  .L8015CA6C:
    /* 22E74 8015CA6C 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22E78 8015CA70 01001026 */  addiu      $s0, $s0, 0x1
    /* 22E7C 8015CA74 03004388 */  lwl        $v1, 0x3($v0)
    /* 22E80 8015CA78 00004398 */  lwr        $v1, 0x0($v0)
    /* 22E84 8015CA7C 07004488 */  lwl        $a0, 0x7($v0)
    /* 22E88 8015CA80 04004498 */  lwr        $a0, 0x4($v0)
    /* 22E8C 8015CA84 0B004588 */  lwl        $a1, 0xB($v0)
    /* 22E90 8015CA88 08004598 */  lwr        $a1, 0x8($v0)
    /* 22E94 8015CA8C 0300E3A8 */  swl        $v1, 0x3($a3)
    /* 22E98 8015CA90 0000E3B8 */  swr        $v1, 0x0($a3)
    /* 22E9C 8015CA94 0700E4A8 */  swl        $a0, 0x7($a3)
    /* 22EA0 8015CA98 0400E4B8 */  swr        $a0, 0x4($a3)
    /* 22EA4 8015CA9C 0B00E5A8 */  swl        $a1, 0xB($a3)
    /* 22EA8 8015CAA0 0800E5B8 */  swr        $a1, 0x8($a3)
    /* 22EAC 8015CAA4 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22EB0 8015CAA8 00000000 */  nop
    /* 22EB4 8015CAAC 0C004224 */  addiu      $v0, $v0, 0xC
    /* 22EB8 8015CAB0 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22EBC 8015CAB4 0400022A */  slti       $v0, $s0, 0x4
    /* 22EC0 8015CAB8 ECFF4014 */  bnez       $v0, .L8015CA6C
    /* 22EC4 8015CABC 0C00E724 */   addiu     $a3, $a3, 0xC
    /* 22EC8 8015CAC0 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 22ECC 8015CAC4 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 22ED0 8015CAC8 00000000 */  nop
    /* 22ED4 8015CACC 01004224 */  addiu      $v0, $v0, 0x1
    /* 22ED8 8015CAD0 45004018 */  blez       $v0, .L8015CBE8
    /* 22EDC 8015CAD4 21800000 */   addu      $s0, $zero, $zero
    /* 22EE0 8015CAD8 0E80113C */  lui        $s1, %hi(plr)
    /* 22EE4 8015CADC 38A53126 */  addiu      $s1, $s1, %lo(plr)
  .L8015CAE0:
    /* 22EE8 8015CAE0 5421868F */  lw         $a2, %gp_rel(D_8011C8D4)($gp)
    /* 22EEC 8015CAE4 00000000 */  nop
    /* 22EF0 8015CAE8 2510D100 */  or         $v0, $a2, $s1
    /* 22EF4 8015CAEC 03004230 */  andi       $v0, $v0, 0x3
    /* 22EF8 8015CAF0 17004010 */  beqz       $v0, .L8015CB50
    /* 22EFC 8015CAF4 21382002 */   addu      $a3, $s1, $zero
    /* 22F00 8015CAF8 E019C824 */  addiu      $t0, $a2, 0x19E0
  .L8015CAFC:
    /* 22F04 8015CAFC 0300C288 */  lwl        $v0, 0x3($a2)
    /* 22F08 8015CB00 0000C298 */  lwr        $v0, 0x0($a2)
    /* 22F0C 8015CB04 0700C388 */  lwl        $v1, 0x7($a2)
    /* 22F10 8015CB08 0400C398 */  lwr        $v1, 0x4($a2)
    /* 22F14 8015CB0C 0B00C488 */  lwl        $a0, 0xB($a2)
    /* 22F18 8015CB10 0800C498 */  lwr        $a0, 0x8($a2)
    /* 22F1C 8015CB14 0F00C588 */  lwl        $a1, 0xF($a2)
    /* 22F20 8015CB18 0C00C598 */  lwr        $a1, 0xC($a2)
    /* 22F24 8015CB1C 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 22F28 8015CB20 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 22F2C 8015CB24 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 22F30 8015CB28 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 22F34 8015CB2C 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* 22F38 8015CB30 0800E4B8 */  swr        $a0, 0x8($a3)
    /* 22F3C 8015CB34 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* 22F40 8015CB38 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* 22F44 8015CB3C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 22F48 8015CB40 EEFFC814 */  bne        $a2, $t0, .L8015CAFC
    /* 22F4C 8015CB44 1000E724 */   addiu     $a3, $a3, 0x10
    /* 22F50 8015CB48 E0720508 */  j          .L8015CB80
    /* 22F54 8015CB4C 00000000 */   nop
  .L8015CB50:
    /* 22F58 8015CB50 E019C824 */  addiu      $t0, $a2, 0x19E0
  .L8015CB54:
    /* 22F5C 8015CB54 0000C28C */  lw         $v0, 0x0($a2)
    /* 22F60 8015CB58 0400C38C */  lw         $v1, 0x4($a2)
    /* 22F64 8015CB5C 0800C48C */  lw         $a0, 0x8($a2)
    /* 22F68 8015CB60 0C00C58C */  lw         $a1, 0xC($a2)
    /* 22F6C 8015CB64 0000E2AC */  sw         $v0, 0x0($a3)
    /* 22F70 8015CB68 0400E3AC */  sw         $v1, 0x4($a3)
    /* 22F74 8015CB6C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 22F78 8015CB70 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 22F7C 8015CB74 1000C624 */  addiu      $a2, $a2, 0x10
    /* 22F80 8015CB78 F6FFC814 */  bne        $a2, $t0, .L8015CB54
    /* 22F84 8015CB7C 1000E724 */   addiu     $a3, $a3, 0x10
  .L8015CB80:
    /* 22F88 8015CB80 0300C288 */  lwl        $v0, 0x3($a2)
    /* 22F8C 8015CB84 0000C298 */  lwr        $v0, 0x0($a2)
    /* 22F90 8015CB88 00000000 */  nop
    /* 22F94 8015CB8C 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 22F98 8015CB90 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 22F9C 8015CB94 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22FA0 8015CB98 00000000 */  nop
    /* 22FA4 8015CB9C E4194224 */  addiu      $v0, $v0, 0x19E4
    /* 22FA8 8015CBA0 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22FAC 8015CBA4 5E6E050C */  jal        BLoad__Fv
    /* 22FB0 8015CBA8 E8193126 */   addiu     $s1, $s1, 0x19E8
    /* 22FB4 8015CBAC 1280013C */  lui        $at, %hi(QSpell)
    /* 22FB8 8015CBB0 21083000 */  addu       $at, $at, $s0
    /* 22FBC 8015CBB4 20B122A0 */  sb         $v0, %lo(QSpell)($at)
    /* 22FC0 8015CBB8 5E6E050C */  jal        BLoad__Fv
    /* 22FC4 8015CBBC 00000000 */   nop
    /* 22FC8 8015CBC0 1280013C */  lui        $at, %hi(_spltotype)
    /* 22FCC 8015CBC4 21083000 */  addu       $at, $at, $s0
    /* 22FD0 8015CBC8 24B122A0 */  sb         $v0, %lo(_spltotype)($at)
    /* 22FD4 8015CBCC 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 22FD8 8015CBD0 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 22FDC 8015CBD4 01001026 */  addiu      $s0, $s0, 0x1
    /* 22FE0 8015CBD8 01004224 */  addiu      $v0, $v0, 0x1
    /* 22FE4 8015CBDC 2A100202 */  slt        $v0, $s0, $v0
    /* 22FE8 8015CBE0 BFFF4014 */  bnez       $v0, .L8015CAE0
    /* 22FEC 8015CBE4 00000000 */   nop
  .L8015CBE8:
    /* 22FF0 8015CBE8 21800000 */  addu       $s0, $zero, $zero
    /* 22FF4 8015CBEC 0D80113C */  lui        $s1, %hi(glSeedTbl)
    /* 22FF8 8015CBF0 5CF73126 */  addiu      $s1, $s1, %lo(glSeedTbl)
  .L8015CBF4:
    /* 22FFC 8015CBF4 656E050C */  jal        ILoad__Fv
    /* 23000 8015CBF8 01001026 */   addiu     $s0, $s0, 0x1
    /* 23004 8015CBFC 000022AE */  sw         $v0, 0x0($s1)
    /* 23008 8015CC00 1100022A */  slti       $v0, $s0, 0x11
    /* 2300C 8015CC04 FBFF4014 */  bnez       $v0, .L8015CBF4
    /* 23010 8015CC08 04003126 */   addiu     $s1, $s1, 0x4
    /* 23014 8015CC0C 21800000 */  addu       $s0, $zero, $zero
  .L8015CC10:
    /* 23018 8015CC10 5E6E050C */  jal        BLoad__Fv
    /* 2301C 8015CC14 00000000 */   nop
    /* 23020 8015CC18 0E80013C */  lui        $at, %hi(MlTab)
    /* 23024 8015CC1C 21083000 */  addu       $at, $at, $s0
    /* 23028 8015CC20 C43922A0 */  sb         $v0, %lo(MlTab)($at)
    /* 2302C 8015CC24 5E6E050C */  jal        BLoad__Fv
    /* 23030 8015CC28 00000000 */   nop
    /* 23034 8015CC2C 0E80013C */  lui        $at, %hi(QlTab)
    /* 23038 8015CC30 21083000 */  addu       $at, $at, $s0
    /* 2303C 8015CC34 D43922A0 */  sb         $v0, %lo(QlTab)($at)
    /* 23040 8015CC38 01001026 */  addiu      $s0, $s0, 0x1
    /* 23044 8015CC3C 1000022A */  slti       $v0, $s0, 0x10
    /* 23048 8015CC40 F3FF4014 */  bnez       $v0, .L8015CC10
    /* 2304C 8015CC44 00000000 */   nop
    /* 23050 8015CC48 656E050C */  jal        ILoad__Fv
    /* 23054 8015CC4C 21800000 */   addu      $s0, $zero, $zero
    /* 23058 8015CC50 1280013C */  lui        $at, %hi(orgseed)
    /* 2305C 8015CC54 58B822AC */  sw         $v0, %lo(orgseed)($at)
  .L8015CC58:
    /* 23060 8015CC58 836E050C */  jal        LoadQuest__Fi
    /* 23064 8015CC5C 21200002 */   addu      $a0, $s0, $zero
    /* 23068 8015CC60 01001026 */  addiu      $s0, $s0, 0x1
    /* 2306C 8015CC64 1000022A */  slti       $v0, $s0, 0x10
    /* 23070 8015CC68 FBFF4014 */  bnez       $v0, .L8015CC58
    /* 23074 8015CC6C 00000000 */   nop
    /* 23078 8015CC70 1472050C */  jal        LoadOptions__Fv
    /* 2307C 8015CC74 21800000 */   addu      $s0, $zero, $zero
    /* 23080 8015CC78 0D80093C */  lui        $t1, %hi(sgLocals)
    /* 23084 8015CC7C BC712925 */  addiu      $t1, $t1, %lo(sgLocals)
  .L8015CC80:
    /* 23088 8015CC80 5421868F */  lw         $a2, %gp_rel(D_8011C8D4)($gp)
    /* 2308C 8015CC84 00000000 */  nop
    /* 23090 8015CC88 2510C900 */  or         $v0, $a2, $t1
    /* 23094 8015CC8C 03004230 */  andi       $v0, $v0, 0x3
    /* 23098 8015CC90 17004010 */  beqz       $v0, .L8015CCF0
    /* 2309C 8015CC94 21382001 */   addu      $a3, $t1, $zero
    /* 230A0 8015CC98 C000C824 */  addiu      $t0, $a2, 0xC0
  .L8015CC9C:
    /* 230A4 8015CC9C 0300C288 */  lwl        $v0, 0x3($a2)
    /* 230A8 8015CCA0 0000C298 */  lwr        $v0, 0x0($a2)
    /* 230AC 8015CCA4 0700C388 */  lwl        $v1, 0x7($a2)
    /* 230B0 8015CCA8 0400C398 */  lwr        $v1, 0x4($a2)
    /* 230B4 8015CCAC 0B00C488 */  lwl        $a0, 0xB($a2)
    /* 230B8 8015CCB0 0800C498 */  lwr        $a0, 0x8($a2)
    /* 230BC 8015CCB4 0F00C588 */  lwl        $a1, 0xF($a2)
    /* 230C0 8015CCB8 0C00C598 */  lwr        $a1, 0xC($a2)
    /* 230C4 8015CCBC 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 230C8 8015CCC0 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 230CC 8015CCC4 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 230D0 8015CCC8 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 230D4 8015CCCC 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* 230D8 8015CCD0 0800E4B8 */  swr        $a0, 0x8($a3)
    /* 230DC 8015CCD4 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* 230E0 8015CCD8 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* 230E4 8015CCDC 1000C624 */  addiu      $a2, $a2, 0x10
    /* 230E8 8015CCE0 EEFFC814 */  bne        $a2, $t0, .L8015CC9C
    /* 230EC 8015CCE4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 230F0 8015CCE8 48730508 */  j          .L8015CD20
    /* 230F4 8015CCEC 00000000 */   nop
  .L8015CCF0:
    /* 230F8 8015CCF0 C000C824 */  addiu      $t0, $a2, 0xC0
  .L8015CCF4:
    /* 230FC 8015CCF4 0000C28C */  lw         $v0, 0x0($a2)
    /* 23100 8015CCF8 0400C38C */  lw         $v1, 0x4($a2)
    /* 23104 8015CCFC 0800C48C */  lw         $a0, 0x8($a2)
    /* 23108 8015CD00 0C00C58C */  lw         $a1, 0xC($a2)
    /* 2310C 8015CD04 0000E2AC */  sw         $v0, 0x0($a3)
    /* 23110 8015CD08 0400E3AC */  sw         $v1, 0x4($a3)
    /* 23114 8015CD0C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 23118 8015CD10 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 2311C 8015CD14 1000C624 */  addiu      $a2, $a2, 0x10
    /* 23120 8015CD18 F6FFC814 */  bne        $a2, $t0, .L8015CCF4
    /* 23124 8015CD1C 1000E724 */   addiu     $a3, $a3, 0x10
  .L8015CD20:
    /* 23128 8015CD20 0300C288 */  lwl        $v0, 0x3($a2)
    /* 2312C 8015CD24 0000C298 */  lwr        $v0, 0x0($a2)
    /* 23130 8015CD28 0700C388 */  lwl        $v1, 0x7($a2)
    /* 23134 8015CD2C 0400C398 */  lwr        $v1, 0x4($a2)
    /* 23138 8015CD30 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 2313C 8015CD34 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 23140 8015CD38 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 23144 8015CD3C 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 23148 8015CD40 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 2314C 8015CD44 01001026 */  addiu      $s0, $s0, 0x1
    /* 23150 8015CD48 C8004224 */  addiu      $v0, $v0, 0xC8
    /* 23154 8015CD4C 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 23158 8015CD50 1600022A */  slti       $v0, $s0, 0x16
    /* 2315C 8015CD54 CAFF4014 */  bnez       $v0, .L8015CC80
    /* 23160 8015CD58 C8002925 */   addiu     $t1, $t1, 0xC8
    /* 23164 8015CD5C 656E050C */  jal        ILoad__Fv
    /* 23168 8015CD60 21800000 */   addu      $s0, $zero, $zero
    /* 2316C 8015CD64 1280013C */  lui        $at, %hi(gnDifficulty)
    /* 23170 8015CD68 08C122AC */  sw         $v0, %lo(gnDifficulty)($at)
  .L8015CD6C:
    /* 23174 8015CD6C 5E6E050C */  jal        BLoad__Fv
    /* 23178 8015CD70 00000000 */   nop
    /* 2317C 8015CD74 0C80013C */  lui        $at, %hi(LevPals)
    /* 23180 8015CD78 21083000 */  addu       $at, $at, $s0
    /* 23184 8015CD7C 589A22A0 */  sb         $v0, %lo(LevPals)($at)
    /* 23188 8015CD80 01001026 */  addiu      $s0, $s0, 0x1
    /* 2318C 8015CD84 1100022A */  slti       $v0, $s0, 0x11
    /* 23190 8015CD88 F8FF4014 */  bnez       $v0, .L8015CD6C
    /* 23194 8015CD8C 00000000 */   nop
    /* 23198 8015CD90 656E050C */  jal        ILoad__Fv
    /* 2319C 8015CD94 00000000 */   nop
    /* 231A0 8015CD98 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 231A4 8015CD9C B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 231A8 8015CDA0 00000000 */  nop
    /* 231AC 8015CDA4 80180300 */  sll        $v1, $v1, 2
    /* 231B0 8015CDA8 1280013C */  lui        $at, %hi(_numpremium)
    /* 231B4 8015CDAC 21082300 */  addu       $at, $at, $v1
    /* 231B8 8015CDB0 B8BA22AC */  sw         $v0, %lo(_numpremium)($at)
    /* 231BC 8015CDB4 656E050C */  jal        ILoad__Fv
    /* 231C0 8015CDB8 00000000 */   nop
    /* 231C4 8015CDBC 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 231C8 8015CDC0 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 231CC 8015CDC4 00000000 */  nop
    /* 231D0 8015CDC8 80180300 */  sll        $v1, $v1, 2
    /* 231D4 8015CDCC 1280013C */  lui        $at, %hi(_premiumlevel)
    /* 231D8 8015CDD0 21082300 */  addu       $at, $at, $v1
    /* 231DC 8015CDD4 C0BA22AC */  sw         $v0, %lo(_premiumlevel)($at)
    /* 231E0 8015CDD8 656E050C */  jal        ILoad__Fv
    /* 231E4 8015CDDC 00000000 */   nop
    /* 231E8 8015CDE0 1280013C */  lui        $at, %hi(ViewX)
    /* 231EC 8015CDE4 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 231F0 8015CDE8 656E050C */  jal        ILoad__Fv
    /* 231F4 8015CDEC 00000000 */   nop
    /* 231F8 8015CDF0 1280013C */  lui        $at, %hi(ViewY)
    /* 231FC 8015CDF4 18C122AC */  sw         $v0, %lo(ViewY)($at)
    /* 23200 8015CDF8 5E6E050C */  jal        BLoad__Fv
    /* 23204 8015CDFC 00000000 */   nop
    /* 23208 8015CE00 00160200 */  sll        $v0, $v0, 24
    /* 2320C 8015CE04 EAE6000C */  jal        SetSpeed__F9GM_SPEEDS
    /* 23210 8015CE08 03260200 */   sra       $a0, $v0, 24
    /* 23214 8015CE0C 21104002 */  addu       $v0, $s2, $zero
    /* 23218 8015CE10 2400BF8F */  lw         $ra, 0x24($sp)
    /* 2321C 8015CE14 2000B28F */  lw         $s2, 0x20($sp)
    /* 23220 8015CE18 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 23224 8015CE1C 1800B08F */  lw         $s0, 0x18($sp)
    /* 23228 8015CE20 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2322C 8015CE24 0800E003 */  jr         $ra
    /* 23230 8015CE28 00000000 */   nop
endlabel RestoreLoadedData__Fb
