.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_GM_SaveGame__FiPcT1, 0x560

glabel PSX_GM_SaveGame__FiPcT1
    /* 22064 8015BC5C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 22068 8015BC60 4000B6AF */  sw         $s6, 0x40($sp)
    /* 2206C 8015BC64 21B08000 */  addu       $s6, $a0, $zero
    /* 22070 8015BC68 4400B7AF */  sw         $s7, 0x44($sp)
    /* 22074 8015BC6C 21B8A000 */  addu       $s7, $a1, $zero
    /* 22078 8015BC70 4800BEAF */  sw         $fp, 0x48($sp)
    /* 2207C 8015BC74 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 22080 8015BC78 1480153C */  lui        $s5, %hi(save_buffer)
    /* 22084 8015BC7C EC36B526 */  addiu      $s5, $s5, %lo(save_buffer)
    /* 22088 8015BC80 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 2208C 8015BC84 3800B4AF */  sw         $s4, 0x38($sp)
    /* 22090 8015BC88 3400B3AF */  sw         $s3, 0x34($sp)
    /* 22094 8015BC8C 3000B2AF */  sw         $s2, 0x30($sp)
    /* 22098 8015BC90 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 2209C 8015BC94 2800B0AF */  sw         $s0, 0x28($sp)
    /* 220A0 8015BC98 542195AF */  sw         $s5, %gp_rel(D_8011C8D4)($gp)
    /* 220A4 8015BC9C A671050C */  jal        GetIcon__Fv
    /* 220A8 8015BCA0 21F0C000 */   addu      $fp, $a2, $zero
    /* 220AC 8015BCA4 753D010C */  jal        DeltaSaveLevel__Fv
    /* 220B0 8015BCA8 21800000 */   addu      $s0, $zero, $zero
    /* 220B4 8015BCAC BB6E050C */  jal        ISave__Fi
    /* 220B8 8015BCB0 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 220BC 8015BCB4 1280043C */  lui        $a0, %hi(FePlayerNo)
    /* 220C0 8015BCB8 78B3848C */  lw         $a0, %lo(FePlayerNo)($a0)
    /* 220C4 8015BCBC BB6E050C */  jal        ISave__Fi
    /* 220C8 8015BCC0 04001324 */   addiu     $s3, $zero, 0x4
    /* 220CC 8015BCC4 1280043C */  lui        $a0, %hi(gbActivePlayers)
    /* 220D0 8015BCC8 A3B98490 */  lbu        $a0, %lo(gbActivePlayers)($a0)
    /* 220D4 8015BCCC BB6E050C */  jal        ISave__Fi
    /* 220D8 8015BCD0 00000000 */   nop
    /* 220DC 8015BCD4 1280043C */  lui        $a0, %hi(currlevel)
    /* 220E0 8015BCD8 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 220E4 8015BCDC BB6E050C */  jal        ISave__Fi
    /* 220E8 8015BCE0 00000000 */   nop
    /* 220EC 8015BCE4 1280043C */  lui        $a0, %hi(leveltype)
    /* 220F0 8015BCE8 0DC18490 */  lbu        $a0, %lo(leveltype)($a0)
    /* 220F4 8015BCEC BB6E050C */  jal        ISave__Fi
    /* 220F8 8015BCF0 00000000 */   nop
    /* 220FC 8015BCF4 1280043C */  lui        $a0, %hi(setlevel)
    /* 22100 8015BCF8 0EC18490 */  lbu        $a0, %lo(setlevel)($a0)
    /* 22104 8015BCFC BB6E050C */  jal        ISave__Fi
    /* 22108 8015BD00 00000000 */   nop
    /* 2210C 8015BD04 1280043C */  lui        $a0, %hi(setlvlnum)
    /* 22110 8015BD08 0FC18490 */  lbu        $a0, %lo(setlvlnum)($a0)
    /* 22114 8015BD0C BB6E050C */  jal        ISave__Fi
    /* 22118 8015BD10 00000000 */   nop
    /* 2211C 8015BD14 5421848F */  lw         $a0, %gp_rel(D_8011C8D4)($gp)
    /* 22120 8015BD18 583D010C */  jal        DeltaExportData__FPc
    /* 22124 8015BD1C 00000000 */   nop
    /* 22128 8015BD20 5421838F */  lw         $v1, %gp_rel(D_8011C8D4)($gp)
    /* 2212C 8015BD24 0E80073C */  lui        $a3, %hi(portal)
    /* 22130 8015BD28 EC3BE724 */  addiu      $a3, $a3, %lo(portal)
    /* 22134 8015BD2C 21186200 */  addu       $v1, $v1, $v0
    /* 22138 8015BD30 542183AF */  sw         $v1, %gp_rel(D_8011C8D4)($gp)
  .L8015BD34:
    /* 2213C 8015BD34 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22140 8015BD38 01001026 */  addiu      $s0, $s0, 0x1
    /* 22144 8015BD3C 0300E388 */  lwl        $v1, 0x3($a3)
    /* 22148 8015BD40 0000E398 */  lwr        $v1, 0x0($a3)
    /* 2214C 8015BD44 0700E488 */  lwl        $a0, 0x7($a3)
    /* 22150 8015BD48 0400E498 */  lwr        $a0, 0x4($a3)
    /* 22154 8015BD4C 0B00E588 */  lwl        $a1, 0xB($a3)
    /* 22158 8015BD50 0800E598 */  lwr        $a1, 0x8($a3)
    /* 2215C 8015BD54 030043A8 */  swl        $v1, 0x3($v0)
    /* 22160 8015BD58 000043B8 */  swr        $v1, 0x0($v0)
    /* 22164 8015BD5C 070044A8 */  swl        $a0, 0x7($v0)
    /* 22168 8015BD60 040044B8 */  swr        $a0, 0x4($v0)
    /* 2216C 8015BD64 0B0045A8 */  swl        $a1, 0xB($v0)
    /* 22170 8015BD68 080045B8 */  swr        $a1, 0x8($v0)
    /* 22174 8015BD6C 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22178 8015BD70 00000000 */  nop
    /* 2217C 8015BD74 0C004224 */  addiu      $v0, $v0, 0xC
    /* 22180 8015BD78 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22184 8015BD7C 0400022A */  slti       $v0, $s0, 0x4
    /* 22188 8015BD80 ECFF4014 */  bnez       $v0, .L8015BD34
    /* 2218C 8015BD84 0C00E724 */   addiu     $a3, $a3, 0xC
    /* 22190 8015BD88 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 22194 8015BD8C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 22198 8015BD90 00000000 */  nop
    /* 2219C 8015BD94 01004224 */  addiu      $v0, $v0, 0x1
    /* 221A0 8015BD98 45004018 */  blez       $v0, .L8015BEB0
    /* 221A4 8015BD9C 21800000 */   addu      $s0, $zero, $zero
    /* 221A8 8015BDA0 0E80113C */  lui        $s1, %hi(plr)
    /* 221AC 8015BDA4 38A53126 */  addiu      $s1, $s1, %lo(plr)
  .L8015BDA8:
    /* 221B0 8015BDA8 5421878F */  lw         $a3, %gp_rel(D_8011C8D4)($gp)
    /* 221B4 8015BDAC 00000000 */  nop
    /* 221B8 8015BDB0 25102702 */  or         $v0, $s1, $a3
    /* 221BC 8015BDB4 03004230 */  andi       $v0, $v0, 0x3
    /* 221C0 8015BDB8 17004010 */  beqz       $v0, .L8015BE18
    /* 221C4 8015BDBC 21302002 */   addu      $a2, $s1, $zero
    /* 221C8 8015BDC0 E0192826 */  addiu      $t0, $s1, 0x19E0
  .L8015BDC4:
    /* 221CC 8015BDC4 0300C288 */  lwl        $v0, 0x3($a2)
    /* 221D0 8015BDC8 0000C298 */  lwr        $v0, 0x0($a2)
    /* 221D4 8015BDCC 0700C388 */  lwl        $v1, 0x7($a2)
    /* 221D8 8015BDD0 0400C398 */  lwr        $v1, 0x4($a2)
    /* 221DC 8015BDD4 0B00C488 */  lwl        $a0, 0xB($a2)
    /* 221E0 8015BDD8 0800C498 */  lwr        $a0, 0x8($a2)
    /* 221E4 8015BDDC 0F00C588 */  lwl        $a1, 0xF($a2)
    /* 221E8 8015BDE0 0C00C598 */  lwr        $a1, 0xC($a2)
    /* 221EC 8015BDE4 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 221F0 8015BDE8 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 221F4 8015BDEC 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 221F8 8015BDF0 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 221FC 8015BDF4 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* 22200 8015BDF8 0800E4B8 */  swr        $a0, 0x8($a3)
    /* 22204 8015BDFC 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* 22208 8015BE00 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* 2220C 8015BE04 1000C624 */  addiu      $a2, $a2, 0x10
    /* 22210 8015BE08 EEFFC814 */  bne        $a2, $t0, .L8015BDC4
    /* 22214 8015BE0C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 22218 8015BE10 926F0508 */  j          .L8015BE48
    /* 2221C 8015BE14 00000000 */   nop
  .L8015BE18:
    /* 22220 8015BE18 E0192826 */  addiu      $t0, $s1, 0x19E0
  .L8015BE1C:
    /* 22224 8015BE1C 0000C28C */  lw         $v0, 0x0($a2)
    /* 22228 8015BE20 0400C38C */  lw         $v1, 0x4($a2)
    /* 2222C 8015BE24 0800C48C */  lw         $a0, 0x8($a2)
    /* 22230 8015BE28 0C00C58C */  lw         $a1, 0xC($a2)
    /* 22234 8015BE2C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 22238 8015BE30 0400E3AC */  sw         $v1, 0x4($a3)
    /* 2223C 8015BE34 0800E4AC */  sw         $a0, 0x8($a3)
    /* 22240 8015BE38 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 22244 8015BE3C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 22248 8015BE40 F6FFC814 */  bne        $a2, $t0, .L8015BE1C
    /* 2224C 8015BE44 1000E724 */   addiu     $a3, $a3, 0x10
  .L8015BE48:
    /* 22250 8015BE48 0300C288 */  lwl        $v0, 0x3($a2)
    /* 22254 8015BE4C 0000C298 */  lwr        $v0, 0x0($a2)
    /* 22258 8015BE50 00000000 */  nop
    /* 2225C 8015BE54 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 22260 8015BE58 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 22264 8015BE5C 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22268 8015BE60 00000000 */  nop
    /* 2226C 8015BE64 E4194224 */  addiu      $v0, $v0, 0x19E4
    /* 22270 8015BE68 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22274 8015BE6C 1280013C */  lui        $at, %hi(QSpell)
    /* 22278 8015BE70 21083000 */  addu       $at, $at, $s0
    /* 2227C 8015BE74 20B12480 */  lb         $a0, %lo(QSpell)($at)
    /* 22280 8015BE78 B56E050C */  jal        BSave__Fc
    /* 22284 8015BE7C E8193126 */   addiu     $s1, $s1, 0x19E8
    /* 22288 8015BE80 1280013C */  lui        $at, %hi(_spltotype)
    /* 2228C 8015BE84 21083000 */  addu       $at, $at, $s0
    /* 22290 8015BE88 24B12480 */  lb         $a0, %lo(_spltotype)($at)
    /* 22294 8015BE8C B56E050C */  jal        BSave__Fc
    /* 22298 8015BE90 01001026 */   addiu     $s0, $s0, 0x1
    /* 2229C 8015BE94 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 222A0 8015BE98 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 222A4 8015BE9C 00000000 */  nop
    /* 222A8 8015BEA0 01004224 */  addiu      $v0, $v0, 0x1
    /* 222AC 8015BEA4 2A100202 */  slt        $v0, $s0, $v0
    /* 222B0 8015BEA8 BFFF4014 */  bnez       $v0, .L8015BDA8
    /* 222B4 8015BEAC 00000000 */   nop
  .L8015BEB0:
    /* 222B8 8015BEB0 21800000 */  addu       $s0, $zero, $zero
    /* 222BC 8015BEB4 0D80113C */  lui        $s1, %hi(glSeedTbl)
    /* 222C0 8015BEB8 5CF73126 */  addiu      $s1, $s1, %lo(glSeedTbl)
  .L8015BEBC:
    /* 222C4 8015BEBC 0000248E */  lw         $a0, 0x0($s1)
    /* 222C8 8015BEC0 04003126 */  addiu      $s1, $s1, 0x4
    /* 222CC 8015BEC4 BB6E050C */  jal        ISave__Fi
    /* 222D0 8015BEC8 01001026 */   addiu     $s0, $s0, 0x1
    /* 222D4 8015BECC 1100022A */  slti       $v0, $s0, 0x11
    /* 222D8 8015BED0 FAFF4014 */  bnez       $v0, .L8015BEBC
    /* 222DC 8015BED4 00000000 */   nop
    /* 222E0 8015BED8 21800000 */  addu       $s0, $zero, $zero
  .L8015BEDC:
    /* 222E4 8015BEDC 0E80013C */  lui        $at, %hi(MlTab)
    /* 222E8 8015BEE0 21083000 */  addu       $at, $at, $s0
    /* 222EC 8015BEE4 C4392480 */  lb         $a0, %lo(MlTab)($at)
    /* 222F0 8015BEE8 B56E050C */  jal        BSave__Fc
    /* 222F4 8015BEEC 00000000 */   nop
    /* 222F8 8015BEF0 0E80013C */  lui        $at, %hi(QlTab)
    /* 222FC 8015BEF4 21083000 */  addu       $at, $at, $s0
    /* 22300 8015BEF8 D4392480 */  lb         $a0, %lo(QlTab)($at)
    /* 22304 8015BEFC B56E050C */  jal        BSave__Fc
    /* 22308 8015BF00 01001026 */   addiu     $s0, $s0, 0x1
    /* 2230C 8015BF04 1000022A */  slti       $v0, $s0, 0x10
    /* 22310 8015BF08 F4FF4014 */  bnez       $v0, .L8015BEDC
    /* 22314 8015BF0C 00000000 */   nop
    /* 22318 8015BF10 1280043C */  lui        $a0, %hi(orgseed)
    /* 2231C 8015BF14 58B8848C */  lw         $a0, %lo(orgseed)($a0)
    /* 22320 8015BF18 BB6E050C */  jal        ISave__Fi
    /* 22324 8015BF1C 21800000 */   addu      $s0, $zero, $zero
  .L8015BF20:
    /* 22328 8015BF20 E46E050C */  jal        SaveQuest__Fi
    /* 2232C 8015BF24 21200002 */   addu      $a0, $s0, $zero
    /* 22330 8015BF28 01001026 */  addiu      $s0, $s0, 0x1
    /* 22334 8015BF2C 1000022A */  slti       $v0, $s0, 0x10
    /* 22338 8015BF30 FBFF4014 */  bnez       $v0, .L8015BF20
    /* 2233C 8015BF34 00000000 */   nop
    /* 22340 8015BF38 4A72050C */  jal        SaveOptions__Fv
    /* 22344 8015BF3C 21800000 */   addu      $s0, $zero, $zero
    /* 22348 8015BF40 0D80093C */  lui        $t1, %hi(sgLocals)
    /* 2234C 8015BF44 BC712925 */  addiu      $t1, $t1, %lo(sgLocals)
  .L8015BF48:
    /* 22350 8015BF48 5421878F */  lw         $a3, %gp_rel(D_8011C8D4)($gp)
    /* 22354 8015BF4C 00000000 */  nop
    /* 22358 8015BF50 25102701 */  or         $v0, $t1, $a3
    /* 2235C 8015BF54 03004230 */  andi       $v0, $v0, 0x3
    /* 22360 8015BF58 17004010 */  beqz       $v0, .L8015BFB8
    /* 22364 8015BF5C 21302001 */   addu      $a2, $t1, $zero
    /* 22368 8015BF60 C0002825 */  addiu      $t0, $t1, 0xC0
  .L8015BF64:
    /* 2236C 8015BF64 0300C288 */  lwl        $v0, 0x3($a2)
    /* 22370 8015BF68 0000C298 */  lwr        $v0, 0x0($a2)
    /* 22374 8015BF6C 0700C388 */  lwl        $v1, 0x7($a2)
    /* 22378 8015BF70 0400C398 */  lwr        $v1, 0x4($a2)
    /* 2237C 8015BF74 0B00C488 */  lwl        $a0, 0xB($a2)
    /* 22380 8015BF78 0800C498 */  lwr        $a0, 0x8($a2)
    /* 22384 8015BF7C 0F00C588 */  lwl        $a1, 0xF($a2)
    /* 22388 8015BF80 0C00C598 */  lwr        $a1, 0xC($a2)
    /* 2238C 8015BF84 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 22390 8015BF88 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 22394 8015BF8C 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 22398 8015BF90 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 2239C 8015BF94 0B00E4A8 */  swl        $a0, 0xB($a3)
    /* 223A0 8015BF98 0800E4B8 */  swr        $a0, 0x8($a3)
    /* 223A4 8015BF9C 0F00E5A8 */  swl        $a1, 0xF($a3)
    /* 223A8 8015BFA0 0C00E5B8 */  swr        $a1, 0xC($a3)
    /* 223AC 8015BFA4 1000C624 */  addiu      $a2, $a2, 0x10
    /* 223B0 8015BFA8 EEFFC814 */  bne        $a2, $t0, .L8015BF64
    /* 223B4 8015BFAC 1000E724 */   addiu     $a3, $a3, 0x10
    /* 223B8 8015BFB0 FA6F0508 */  j          .L8015BFE8
    /* 223BC 8015BFB4 00000000 */   nop
  .L8015BFB8:
    /* 223C0 8015BFB8 C0002825 */  addiu      $t0, $t1, 0xC0
  .L8015BFBC:
    /* 223C4 8015BFBC 0000C28C */  lw         $v0, 0x0($a2)
    /* 223C8 8015BFC0 0400C38C */  lw         $v1, 0x4($a2)
    /* 223CC 8015BFC4 0800C48C */  lw         $a0, 0x8($a2)
    /* 223D0 8015BFC8 0C00C58C */  lw         $a1, 0xC($a2)
    /* 223D4 8015BFCC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 223D8 8015BFD0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 223DC 8015BFD4 0800E4AC */  sw         $a0, 0x8($a3)
    /* 223E0 8015BFD8 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 223E4 8015BFDC 1000C624 */  addiu      $a2, $a2, 0x10
    /* 223E8 8015BFE0 F6FFC814 */  bne        $a2, $t0, .L8015BFBC
    /* 223EC 8015BFE4 1000E724 */   addiu     $a3, $a3, 0x10
  .L8015BFE8:
    /* 223F0 8015BFE8 0300C288 */  lwl        $v0, 0x3($a2)
    /* 223F4 8015BFEC 0000C298 */  lwr        $v0, 0x0($a2)
    /* 223F8 8015BFF0 0700C388 */  lwl        $v1, 0x7($a2)
    /* 223FC 8015BFF4 0400C398 */  lwr        $v1, 0x4($a2)
    /* 22400 8015BFF8 0300E2A8 */  swl        $v0, 0x3($a3)
    /* 22404 8015BFFC 0000E2B8 */  swr        $v0, 0x0($a3)
    /* 22408 8015C000 0700E3A8 */  swl        $v1, 0x7($a3)
    /* 2240C 8015C004 0400E3B8 */  swr        $v1, 0x4($a3)
    /* 22410 8015C008 5421828F */  lw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22414 8015C00C 01001026 */  addiu      $s0, $s0, 0x1
    /* 22418 8015C010 C8004224 */  addiu      $v0, $v0, 0xC8
    /* 2241C 8015C014 542182AF */  sw         $v0, %gp_rel(D_8011C8D4)($gp)
    /* 22420 8015C018 1600022A */  slti       $v0, $s0, 0x16
    /* 22424 8015C01C CAFF4014 */  bnez       $v0, .L8015BF48
    /* 22428 8015C020 C8002925 */   addiu     $t1, $t1, 0xC8
    /* 2242C 8015C024 1280043C */  lui        $a0, %hi(gnDifficulty)
    /* 22430 8015C028 08C1848C */  lw         $a0, %lo(gnDifficulty)($a0)
    /* 22434 8015C02C BB6E050C */  jal        ISave__Fi
    /* 22438 8015C030 21800000 */   addu      $s0, $zero, $zero
  .L8015C034:
    /* 2243C 8015C034 0C80013C */  lui        $at, %hi(LevPals)
    /* 22440 8015C038 21083000 */  addu       $at, $at, $s0
    /* 22444 8015C03C 589A2480 */  lb         $a0, %lo(LevPals)($at)
    /* 22448 8015C040 B56E050C */  jal        BSave__Fc
    /* 2244C 8015C044 01001026 */   addiu     $s0, $s0, 0x1
    /* 22450 8015C048 1100022A */  slti       $v0, $s0, 0x11
    /* 22454 8015C04C F9FF4014 */  bnez       $v0, .L8015C034
    /* 22458 8015C050 00000000 */   nop
    /* 2245C 8015C054 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 22460 8015C058 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 22464 8015C05C 00000000 */  nop
    /* 22468 8015C060 80100200 */  sll        $v0, $v0, 2
    /* 2246C 8015C064 1280013C */  lui        $at, %hi(_numpremium)
    /* 22470 8015C068 21082200 */  addu       $at, $at, $v0
    /* 22474 8015C06C B8BA248C */  lw         $a0, %lo(_numpremium)($at)
    /* 22478 8015C070 BB6E050C */  jal        ISave__Fi
    /* 2247C 8015C074 00000000 */   nop
    /* 22480 8015C078 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 22484 8015C07C B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 22488 8015C080 00000000 */  nop
    /* 2248C 8015C084 80100200 */  sll        $v0, $v0, 2
    /* 22490 8015C088 1280013C */  lui        $at, %hi(_premiumlevel)
    /* 22494 8015C08C 21082200 */  addu       $at, $at, $v0
    /* 22498 8015C090 C0BA248C */  lw         $a0, %lo(_premiumlevel)($at)
    /* 2249C 8015C094 BB6E050C */  jal        ISave__Fi
    /* 224A0 8015C098 00000000 */   nop
    /* 224A4 8015C09C 1280043C */  lui        $a0, %hi(ViewX)
    /* 224A8 8015C0A0 14C1848C */  lw         $a0, %lo(ViewX)($a0)
    /* 224AC 8015C0A4 BB6E050C */  jal        ISave__Fi
    /* 224B0 8015C0A8 00000000 */   nop
    /* 224B4 8015C0AC 1280043C */  lui        $a0, %hi(ViewY)
    /* 224B8 8015C0B0 18C1848C */  lw         $a0, %lo(ViewY)($a0)
    /* 224BC 8015C0B4 BB6E050C */  jal        ISave__Fi
    /* 224C0 8015C0B8 00000000 */   nop
    /* 224C4 8015C0BC EFE6000C */  jal        GetSpeed__Fv
    /* 224C8 8015C0C0 00000000 */   nop
    /* 224CC 8015C0C4 00160200 */  sll        $v0, $v0, 24
    /* 224D0 8015C0C8 B56E050C */  jal        BSave__Fc
    /* 224D4 8015C0CC 03260200 */   sra       $a0, $v0, 24
    /* 224D8 8015C0D0 5421918F */  lw         $s1, %gp_rel(D_8011C8D4)($gp)
    /* 224DC 8015C0D4 542195AF */  sw         $s5, %gp_rel(D_8011C8D4)($gp)
    /* 224E0 8015C0D8 23803502 */  subu       $s0, $s1, $s5
    /* 224E4 8015C0DC BB6E050C */  jal        ISave__Fi
    /* 224E8 8015C0E0 21200002 */   addu      $a0, $s0, $zero
    /* 224EC 8015C0E4 0100023C */  lui        $v0, (0x13FFF >> 16)
    /* 224F0 8015C0E8 FF3F4234 */  ori        $v0, $v0, (0x13FFF & 0xFFFF)
    /* 224F4 8015C0EC 2A105000 */  slt        $v0, $v0, $s0
    /* 224F8 8015C0F0 542191AF */  sw         $s1, %gp_rel(D_8011C8D4)($gp)
    /* 224FC 8015C0F4 03004014 */  bnez       $v0, .L8015C104
    /* 22500 8015C0F8 FFFF1124 */   addiu     $s1, $zero, -0x1
    /* 22504 8015C0FC 0100103C */  lui        $s0, (0x13E00 >> 16)
    /* 22508 8015C100 003E1036 */  ori        $s0, $s0, (0x13E00 & 0xFFFF)
  .L8015C104:
    /* 2250C 8015C104 0E80123C */  lui        $s2, %hi(IconBuffer + 0x28)
    /* 22510 8015C108 E83C5226 */  addiu      $s2, $s2, %lo(IconBuffer + 0x28)
    /* 22514 8015C10C E0FF5426 */  addiu      $s4, $s2, -0x20
  .L8015C110:
    /* 22518 8015C110 1280043C */  lui        $a0, %hi(current_card)
    /* 2251C 8015C114 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 22520 8015C118 1280053C */  lui        $a1, %hi(DiabloGameFile)
    /* 22524 8015C11C 10B4A58C */  lw         $a1, %lo(DiabloGameFile)($a1)
    /* 22528 8015C120 6465050C */  jal        GetFileNumber__FiPc
    /* 2252C 8015C124 00000000 */   nop
    /* 22530 8015C128 06005110 */  beq        $v0, $s1, .L8015C144
    /* 22534 8015C12C 2120C002 */   addu      $a0, $s6, $zero
    /* 22538 8015C130 1280043C */  lui        $a0, %hi(current_card)
    /* 2253C 8015C134 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 22540 8015C138 480B050C */  jal        delete_card_file__Fii
    /* 22544 8015C13C 21284000 */   addu      $a1, $v0, $zero
    /* 22548 8015C140 2120C002 */  addu       $a0, $s6, $zero
  .L8015C144:
    /* 2254C 8015C144 01300524 */  addiu      $a1, $zero, 0x3001
    /* 22550 8015C148 2130E002 */  addu       $a2, $s7, $zero
    /* 22554 8015C14C 2138C003 */  addu       $a3, $fp, $zero
    /* 22558 8015C150 1000B2AF */  sw         $s2, 0x10($sp)
    /* 2255C 8015C154 1400B4AF */  sw         $s4, 0x14($sp)
    /* 22560 8015C158 1800B0AF */  sw         $s0, 0x18($sp)
    /* 22564 8015C15C 2E0C050C */  jal        write_card_file__FiiPcT2PUcPUsiT4
    /* 22568 8015C160 1C00B5AF */   sw        $s5, 0x1C($sp)
    /* 2256C 8015C164 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* 22570 8015C168 03007112 */  beq        $s3, $s1, .L8015C178
    /* 22574 8015C16C 21184000 */   addu      $v1, $v0, $zero
    /* 22578 8015C170 E7FF6014 */  bnez       $v1, .L8015C110
    /* 2257C 8015C174 00000000 */   nop
  .L8015C178:
    /* 22580 8015C178 01000224 */  addiu      $v0, $zero, 0x1
    /* 22584 8015C17C 1280013C */  lui        $at, %hi(gbValidSaveFile)
    /* 22588 8015C180 F0B922A0 */  sb         $v0, %lo(gbValidSaveFile)($at)
    /* 2258C 8015C184 21106000 */  addu       $v0, $v1, $zero
    /* 22590 8015C188 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 22594 8015C18C 4800BE8F */  lw         $fp, 0x48($sp)
    /* 22598 8015C190 4400B78F */  lw         $s7, 0x44($sp)
    /* 2259C 8015C194 4000B68F */  lw         $s6, 0x40($sp)
    /* 225A0 8015C198 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 225A4 8015C19C 3800B48F */  lw         $s4, 0x38($sp)
    /* 225A8 8015C1A0 3400B38F */  lw         $s3, 0x34($sp)
    /* 225AC 8015C1A4 3000B28F */  lw         $s2, 0x30($sp)
    /* 225B0 8015C1A8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 225B4 8015C1AC 2800B08F */  lw         $s0, 0x28($sp)
    /* 225B8 8015C1B0 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 225BC 8015C1B4 0800E003 */  jr         $ra
    /* 225C0 8015C1B8 00000000 */   nop
endlabel PSX_GM_SaveGame__FiPcT1
