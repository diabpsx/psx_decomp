.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckMissileCol__FiiiUciiUcb, 0x530

glabel CheckMissileCol__FiiiUciiUcb
    /* 3190 8013CD88 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 3194 8013CD8C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 3198 8013CD90 2190A000 */  addu       $s2, $a1, $zero
    /* 319C 8013CD94 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 31A0 8013CD98 2198C000 */  addu       $s3, $a2, $zero
    /* 31A4 8013CD9C 3400B5AF */  sw         $s5, 0x34($sp)
    /* 31A8 8013CDA0 21A8E000 */  addu       $s5, $a3, $zero
    /* 31AC 8013CDA4 80100400 */  sll        $v0, $a0, 2
    /* 31B0 8013CDA8 21104400 */  addu       $v0, $v0, $a0
    /* 31B4 8013CDAC 80100200 */  sll        $v0, $v0, 2
    /* 31B8 8013CDB0 23104400 */  subu       $v0, $v0, $a0
    /* 31BC 8013CDB4 3800B6AF */  sw         $s6, 0x38($sp)
    /* 31C0 8013CDB8 5800B68F */  lw         $s6, 0x58($sp)
    /* 31C4 8013CDBC 80280200 */  sll        $a1, $v0, 2
    /* 31C8 8013CDC0 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 31CC 8013CDC4 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 31D0 8013CDC8 1080023C */  lui        $v0, %hi(missile)
    /* 31D4 8013CDCC 582C4224 */  addiu      $v0, $v0, %lo(missile)
    /* 31D8 8013CDD0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 31DC 8013CDD4 2188A200 */  addu       $s1, $a1, $v0
    /* 31E0 8013CDD8 3000B4AF */  sw         $s4, 0x30($sp)
    /* 31E4 8013CDDC 6000B493 */  lbu        $s4, 0x60($sp)
    /* 31E8 8013CDE0 0E80033C */  lui        $v1, %hi(dung_map)
    /* 31EC 8013CDE4 287A6324 */  addiu      $v1, $v1, %lo(dung_map)
    /* 31F0 8013CDE8 4400BFAF */  sw         $ra, 0x44($sp)
    /* 31F4 8013CDEC 4000BEAF */  sw         $fp, 0x40($sp)
    /* 31F8 8013CDF0 C0201600 */  sll        $a0, $s6, 3
    /* 31FC 8013CDF4 23209600 */  subu       $a0, $a0, $s6
    /* 3200 8013CDF8 C0210400 */  sll        $a0, $a0, 7
    /* 3204 8013CDFC C0101700 */  sll        $v0, $s7, 3
    /* 3208 8013CE00 21104300 */  addu       $v0, $v0, $v1
    /* 320C 8013CE04 21F08200 */  addu       $fp, $a0, $v0
    /* 3210 8013CE08 7000C22A */  slti       $v0, $s6, 0x70
    /* 3214 8013CE0C 04004010 */  beqz       $v0, .L8013CE20
    /* 3218 8013CE10 2000B0AF */   sw        $s0, 0x20($sp)
    /* 321C 8013CE14 7000E22A */  slti       $v0, $s7, 0x70
    /* 3220 8013CE18 0A004014 */  bnez       $v0, .L8013CE44
    /* 3224 8013CE1C 00000000 */   nop
  .L8013CE20:
    /* 3228 8013CE20 01000224 */  addiu      $v0, $zero, 0x1
    /* 322C 8013CE24 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 3230 8013CE28 21082500 */  addu       $at, $at, $a1
    /* 3234 8013CE2C 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* 3238 8013CE30 3E002482 */  lb         $a0, 0x3E($s1)
    /* 323C 8013CE34 D034010C */  jal        AddUnLight__Fi
    /* 3240 8013CE38 00000000 */   nop
    /* 3244 8013CE3C A1F40408 */  j          .L8013D284
    /* 3248 8013CE40 00000000 */   nop
  .L8013CE44:
    /* 324C 8013CE44 37002392 */  lbu        $v1, 0x37($s1)
    /* 3250 8013CE48 04000524 */  addiu      $a1, $zero, 0x4
    /* 3254 8013CE4C 05006510 */  beq        $v1, $a1, .L8013CE64
    /* 3258 8013CE50 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 325C 8013CE54 2E002486 */  lh         $a0, 0x2E($s1)
    /* 3260 8013CE58 00000000 */  nop
    /* 3264 8013CE5C 3D008214 */  bne        $a0, $v0, .L8013CF54
    /* 3268 8013CE60 00000000 */   nop
  .L8013CE64:
    /* 326C 8013CE64 0000C487 */  lh         $a0, 0x0($fp)
    /* 3270 8013CE68 00000000 */  nop
    /* 3274 8013CE6C 1F008018 */  blez       $a0, .L8013CEEC
    /* 3278 8013CE70 00000000 */   nop
    /* 327C 8013CE74 0E006514 */  bne        $v1, $a1, .L8013CEB0
    /* 3280 8013CE78 21284002 */   addu      $a1, $s2, $zero
    /* 3284 8013CE7C FFFF8524 */  addiu      $a1, $a0, -0x1
    /* 3288 8013CE80 21304002 */  addu       $a2, $s2, $zero
    /* 328C 8013CE84 2E002486 */  lh         $a0, 0x2E($s1)
    /* 3290 8013CE88 1C002286 */  lh         $v0, 0x1C($s1)
    /* 3294 8013CE8C 21386002 */  addu       $a3, $s3, $zero
    /* 3298 8013CE90 1000A2AF */  sw         $v0, 0x10($sp)
    /* 329C 8013CE94 30002382 */  lb         $v1, 0x30($s1)
    /* 32A0 8013CE98 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 32A4 8013CE9C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 32A8 8013CEA0 F4EC040C */  jal        MonsterMHit__FiiiiiiUc
    /* 32AC 8013CEA4 1400A3AF */   sw        $v1, 0x14($sp)
    /* 32B0 8013CEA8 B5F30408 */  j          .L8013CED4
    /* 32B4 8013CEAC FF004230 */   andi      $v0, $v0, 0xFF
  .L8013CEB0:
    /* 32B8 8013CEB0 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 32BC 8013CEB4 21306002 */  addu       $a2, $s3, $zero
    /* 32C0 8013CEB8 1C002786 */  lh         $a3, 0x1C($s1)
    /* 32C4 8013CEBC 30002382 */  lb         $v1, 0x30($s1)
    /* 32C8 8013CEC0 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 32CC 8013CEC4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 32D0 8013CEC8 13EC040C */  jal        MonsterTrapHit__FiiiiiUc
    /* 32D4 8013CECC 1000A3AF */   sw        $v1, 0x10($sp)
    /* 32D8 8013CED0 FF004230 */  andi       $v0, $v0, 0xFF
  .L8013CED4:
    /* 32DC 8013CED4 06004010 */  beqz       $v0, .L8013CEF0
    /* 32E0 8013CED8 2120C002 */   addu      $a0, $s6, $zero
    /* 32E4 8013CEDC 02008016 */  bnez       $s4, .L8013CEE8
    /* 32E8 8013CEE0 01000224 */   addiu     $v0, $zero, 0x1
    /* 32EC 8013CEE4 180020A6 */  sh         $zero, 0x18($s1)
  .L8013CEE8:
    /* 32F0 8013CEE8 3D0022A2 */  sb         $v0, 0x3D($s1)
  .L8013CEEC:
    /* 32F4 8013CEEC 2120C002 */  addu       $a0, $s6, $zero
  .L8013CEF0:
    /* 32F8 8013CEF0 447F010C */  jal        IsDplayer__Fii
    /* 32FC 8013CEF4 2128E002 */   addu      $a1, $s7, $zero
    /* 3300 8013CEF8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 3304 8013CEFC A7004010 */  beqz       $v0, .L8013D19C
    /* 3308 8013CF00 00000000 */   nop
    /* 330C 8013CF04 6400A88F */  lw         $t0, 0x64($sp)
    /* 3310 8013CF08 00000000 */  nop
    /* 3314 8013CF0C A3000011 */  beqz       $t0, .L8013D19C
    /* 3318 8013CF10 2120C002 */   addu      $a0, $s6, $zero
    /* 331C 8013CF14 37003092 */  lbu        $s0, 0x37($s1)
    /* 3320 8013CF18 2128E002 */  addu       $a1, $s7, $zero
    /* 3324 8013CF1C 0400103A */  xori       $s0, $s0, 0x4
    /* 3328 8013CF20 447F010C */  jal        IsDplayer__Fii
    /* 332C 8013CF24 0100102E */   sltiu     $s0, $s0, 0x1
    /* 3330 8013CF28 FF004230 */  andi       $v0, $v0, 0xFF
    /* 3334 8013CF2C FFFF4424 */  addiu      $a0, $v0, -0x1
    /* 3338 8013CF30 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 333C 8013CF34 1C002686 */  lh         $a2, 0x1C($s1)
    /* 3340 8013CF38 21384002 */  addu       $a3, $s2, $zero
    /* 3344 8013CF3C 1000B3AF */  sw         $s3, 0x10($sp)
    /* 3348 8013CF40 30002382 */  lb         $v1, 0x30($s1)
    /* 334C 8013CF44 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 3350 8013CF48 1800A2AF */  sw         $v0, 0x18($sp)
    /* 3354 8013CF4C 5EF40408 */  j          .L8013D178
    /* 3358 8013CF50 1C00B0AF */   sw        $s0, 0x1C($sp)
  .L8013CF54:
    /* 335C 8013CF54 1A002296 */  lhu        $v0, 0x1A($s1)
    /* 3360 8013CF58 00000000 */  nop
    /* 3364 8013CF5C 47004014 */  bnez       $v0, .L8013D07C
    /* 3368 8013CF60 40100400 */   sll       $v0, $a0, 1
    /* 336C 8013CF64 0000C287 */  lh         $v0, 0x0($fp)
    /* 3370 8013CF68 00000000 */  nop
    /* 3374 8013CF6C 0F00401C */  bgtz       $v0, .L8013CFAC
    /* 3378 8013CF70 FFFF4524 */   addiu     $a1, $v0, -0x1
    /* 337C 8013CF74 1E004104 */  bgez       $v0, .L8013CFF0
    /* 3380 8013CF78 21800000 */   addu      $s0, $zero, $zero
    /* 3384 8013CF7C 27280200 */  nor        $a1, $zero, $v0
    /* 3388 8013CF80 40100500 */  sll        $v0, $a1, 1
    /* 338C 8013CF84 21104500 */  addu       $v0, $v0, $a1
    /* 3390 8013CF88 80100200 */  sll        $v0, $v0, 2
    /* 3394 8013CF8C 21104500 */  addu       $v0, $v0, $a1
    /* 3398 8013CF90 C0100200 */  sll        $v0, $v0, 3
    /* 339C 8013CF94 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 33A0 8013CF98 21082200 */  addu       $at, $at, $v0
    /* 33A4 8013CF9C C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 33A8 8013CFA0 0F000224 */  addiu      $v0, $zero, 0xF
    /* 33AC 8013CFA4 12006214 */  bne        $v1, $v0, .L8013CFF0
    /* 33B0 8013CFA8 00000000 */   nop
  .L8013CFAC:
    /* 33B4 8013CFAC 21304002 */  addu       $a2, $s2, $zero
    /* 33B8 8013CFB0 1C002286 */  lh         $v0, 0x1C($s1)
    /* 33BC 8013CFB4 21386002 */  addu       $a3, $s3, $zero
    /* 33C0 8013CFB8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 33C4 8013CFBC 30002382 */  lb         $v1, 0x30($s1)
    /* 33C8 8013CFC0 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 33CC 8013CFC4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 33D0 8013CFC8 F4EC040C */  jal        MonsterMHit__FiiiiiiUc
    /* 33D4 8013CFCC 1400A3AF */   sw        $v1, 0x14($sp)
    /* 33D8 8013CFD0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 33DC 8013CFD4 05004010 */  beqz       $v0, .L8013CFEC
    /* 33E0 8013CFD8 00000000 */   nop
    /* 33E4 8013CFDC 02008016 */  bnez       $s4, .L8013CFE8
    /* 33E8 8013CFE0 01000224 */   addiu     $v0, $zero, 0x1
    /* 33EC 8013CFE4 180020A6 */  sh         $zero, 0x18($s1)
  .L8013CFE8:
    /* 33F0 8013CFE8 3D0022A2 */  sb         $v0, 0x3D($s1)
  .L8013CFEC:
    /* 33F4 8013CFEC 21800000 */  addu       $s0, $zero, $zero
  .L8013CFF0:
    /* 33F8 8013CFF0 2120C002 */  addu       $a0, $s6, $zero
    /* 33FC 8013CFF4 447F010C */  jal        IsDplayer__Fii
    /* 3400 8013CFF8 2128E002 */   addu      $a1, $s7, $zero
    /* 3404 8013CFFC FF004230 */  andi       $v0, $v0, 0xFF
    /* 3408 8013D000 08004010 */  beqz       $v0, .L8013D024
    /* 340C 8013D004 2120C002 */   addu      $a0, $s6, $zero
    /* 3410 8013D008 447F010C */  jal        IsDplayer__Fii
    /* 3414 8013D00C 2128E002 */   addu      $a1, $s7, $zero
    /* 3418 8013D010 FF004230 */  andi       $v0, $v0, 0xFF
    /* 341C 8013D014 2E002386 */  lh         $v1, 0x2E($s1)
    /* 3420 8013D018 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 3424 8013D01C 26104300 */  xor        $v0, $v0, $v1
    /* 3428 8013D020 2B800200 */  sltu       $s0, $zero, $v0
  .L8013D024:
    /* 342C 8013D024 5D000012 */  beqz       $s0, .L8013D19C
    /* 3430 8013D028 00000000 */   nop
    /* 3434 8013D02C 6400A88F */  lw         $t0, 0x64($sp)
    /* 3438 8013D030 00000000 */  nop
    /* 343C 8013D034 59000011 */  beqz       $t0, .L8013D19C
    /* 3440 8013D038 2120C002 */   addu      $a0, $s6, $zero
    /* 3444 8013D03C 447F010C */  jal        IsDplayer__Fii
    /* 3448 8013D040 2128E002 */   addu      $a1, $s7, $zero
    /* 344C 8013D044 FF004230 */  andi       $v0, $v0, 0xFF
    /* 3450 8013D048 FFFF4524 */  addiu      $a1, $v0, -0x1
    /* 3454 8013D04C 21304002 */  addu       $a2, $s2, $zero
    /* 3458 8013D050 2E002486 */  lh         $a0, 0x2E($s1)
    /* 345C 8013D054 1C002286 */  lh         $v0, 0x1C($s1)
    /* 3460 8013D058 21386002 */  addu       $a3, $s3, $zero
    /* 3464 8013D05C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3468 8013D060 30002382 */  lb         $v1, 0x30($s1)
    /* 346C 8013D064 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 3470 8013D068 1800A2AF */  sw         $v0, 0x18($sp)
    /* 3474 8013D06C 7BF1040C */  jal        Plr2PlrMHit__FiiiiiiUc
    /* 3478 8013D070 1400A3AF */   sw        $v1, 0x14($sp)
    /* 347C 8013D074 61F40408 */  j          .L8013D184
    /* 3480 8013D078 FF004230 */   andi      $v0, $v0, 0xFF
  .L8013D07C:
    /* 3484 8013D07C 21104400 */  addu       $v0, $v0, $a0
    /* 3488 8013D080 80100200 */  sll        $v0, $v0, 2
    /* 348C 8013D084 21104400 */  addu       $v0, $v0, $a0
    /* 3490 8013D088 C0100200 */  sll        $v0, $v0, 3
    /* 3494 8013D08C 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 3498 8013D090 21082200 */  addu       $at, $at, $v0
    /* 349C 8013D094 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 34A0 8013D098 00000000 */  nop
    /* 34A4 8013D09C 10004230 */  andi       $v0, $v0, 0x10
    /* 34A8 8013D0A0 1F004010 */  beqz       $v0, .L8013D120
    /* 34AC 8013D0A4 00000000 */   nop
    /* 34B0 8013D0A8 0000C287 */  lh         $v0, 0x0($fp)
    /* 34B4 8013D0AC 00000000 */  nop
    /* 34B8 8013D0B0 1B004018 */  blez       $v0, .L8013D120
    /* 34BC 8013D0B4 FFFF4424 */   addiu     $a0, $v0, -0x1
    /* 34C0 8013D0B8 40100400 */  sll        $v0, $a0, 1
    /* 34C4 8013D0BC 21104400 */  addu       $v0, $v0, $a0
    /* 34C8 8013D0C0 80100200 */  sll        $v0, $v0, 2
    /* 34CC 8013D0C4 21104400 */  addu       $v0, $v0, $a0
    /* 34D0 8013D0C8 C0100200 */  sll        $v0, $v0, 3
    /* 34D4 8013D0CC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 34D8 8013D0D0 21082200 */  addu       $at, $at, $v0
    /* 34DC 8013D0D4 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 34E0 8013D0D8 00000000 */  nop
    /* 34E4 8013D0DC 20004230 */  andi       $v0, $v0, 0x20
    /* 34E8 8013D0E0 0F004010 */  beqz       $v0, .L8013D120
    /* 34EC 8013D0E4 21284002 */   addu      $a1, $s2, $zero
    /* 34F0 8013D0E8 21306002 */  addu       $a2, $s3, $zero
    /* 34F4 8013D0EC 1C002786 */  lh         $a3, 0x1C($s1)
    /* 34F8 8013D0F0 30002382 */  lb         $v1, 0x30($s1)
    /* 34FC 8013D0F4 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 3500 8013D0F8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 3504 8013D0FC 13EC040C */  jal        MonsterTrapHit__FiiiiiUc
    /* 3508 8013D100 1000A3AF */   sw        $v1, 0x10($sp)
    /* 350C 8013D104 FF004230 */  andi       $v0, $v0, 0xFF
    /* 3510 8013D108 06004010 */  beqz       $v0, .L8013D124
    /* 3514 8013D10C 2120C002 */   addu      $a0, $s6, $zero
    /* 3518 8013D110 02008016 */  bnez       $s4, .L8013D11C
    /* 351C 8013D114 01000224 */   addiu     $v0, $zero, 0x1
    /* 3520 8013D118 180020A6 */  sh         $zero, 0x18($s1)
  .L8013D11C:
    /* 3524 8013D11C 3D0022A2 */  sb         $v0, 0x3D($s1)
  .L8013D120:
    /* 3528 8013D120 2120C002 */  addu       $a0, $s6, $zero
  .L8013D124:
    /* 352C 8013D124 447F010C */  jal        IsDplayer__Fii
    /* 3530 8013D128 2128E002 */   addu      $a1, $s7, $zero
    /* 3534 8013D12C FF004230 */  andi       $v0, $v0, 0xFF
    /* 3538 8013D130 1A004010 */  beqz       $v0, .L8013D19C
    /* 353C 8013D134 00000000 */   nop
    /* 3540 8013D138 6400A88F */  lw         $t0, 0x64($sp)
    /* 3544 8013D13C 00000000 */  nop
    /* 3548 8013D140 16000011 */  beqz       $t0, .L8013D19C
    /* 354C 8013D144 2120C002 */   addu      $a0, $s6, $zero
    /* 3550 8013D148 447F010C */  jal        IsDplayer__Fii
    /* 3554 8013D14C 2128E002 */   addu      $a1, $s7, $zero
    /* 3558 8013D150 FF004230 */  andi       $v0, $v0, 0xFF
    /* 355C 8013D154 FFFF4424 */  addiu      $a0, $v0, -0x1
    /* 3560 8013D158 2E002586 */  lh         $a1, 0x2E($s1)
    /* 3564 8013D15C 1C002686 */  lh         $a2, 0x1C($s1)
    /* 3568 8013D160 21384002 */  addu       $a3, $s2, $zero
    /* 356C 8013D164 1000B3AF */  sw         $s3, 0x10($sp)
    /* 3570 8013D168 30002382 */  lb         $v1, 0x30($s1)
    /* 3574 8013D16C FF00A232 */  andi       $v0, $s5, 0xFF
    /* 3578 8013D170 1800A2AF */  sw         $v0, 0x18($sp)
    /* 357C 8013D174 1C00A0AF */  sw         $zero, 0x1C($sp)
  .L8013D178:
    /* 3580 8013D178 E4EE040C */  jal        PlayerMHit__FiiiiiiUcUc
    /* 3584 8013D17C 1400A3AF */   sw        $v1, 0x14($sp)
    /* 3588 8013D180 FF004230 */  andi       $v0, $v0, 0xFF
  .L8013D184:
    /* 358C 8013D184 05004010 */  beqz       $v0, .L8013D19C
    /* 3590 8013D188 00000000 */   nop
    /* 3594 8013D18C 02008016 */  bnez       $s4, .L8013D198
    /* 3598 8013D190 01000224 */   addiu     $v0, $zero, 0x1
    /* 359C 8013D194 180020A6 */  sh         $zero, 0x18($s1)
  .L8013D198:
    /* 35A0 8013D198 3D0022A2 */  sb         $v0, 0x3D($s1)
  .L8013D19C:
    /* 35A4 8013D19C 0300C283 */  lb         $v0, 0x3($fp)
    /* 35A8 8013D1A0 00000000 */  nop
    /* 35AC 8013D1A4 1C004010 */  beqz       $v0, .L8013D218
    /* 35B0 8013D1A8 2120C002 */   addu      $a0, $s6, $zero
    /* 35B4 8013D1AC 0200401C */  bgtz       $v0, .L8013D1B8
    /* 35B8 8013D1B0 FFFF4524 */   addiu     $a1, $v0, -0x1
    /* 35BC 8013D1B4 27280200 */  nor        $a1, $zero, $v0
  .L8013D1B8:
    /* 35C0 8013D1B8 40100500 */  sll        $v0, $a1, 1
    /* 35C4 8013D1BC 21104500 */  addu       $v0, $v0, $a1
    /* 35C8 8013D1C0 80100200 */  sll        $v0, $v0, 2
    /* 35CC 8013D1C4 23104500 */  subu       $v0, $v0, $a1
    /* 35D0 8013D1C8 80180200 */  sll        $v1, $v0, 2
    /* 35D4 8013D1CC 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 35D8 8013D1D0 21082300 */  addu       $at, $at, $v1
    /* 35DC 8013D1D4 748C2290 */  lbu        $v0, %lo(object + 0x28)($at)
    /* 35E0 8013D1D8 00000000 */  nop
    /* 35E4 8013D1DC 0E004014 */  bnez       $v0, .L8013D218
    /* 35E8 8013D1E0 2120C002 */   addu      $a0, $s6, $zero
    /* 35EC 8013D1E4 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 35F0 8013D1E8 21082300 */  addu       $at, $at, $v1
    /* 35F4 8013D1EC 6E8C2380 */  lb         $v1, %lo(object + 0x22)($at)
    /* 35F8 8013D1F0 01000224 */  addiu      $v0, $zero, 0x1
    /* 35FC 8013D1F4 03006214 */  bne        $v1, $v0, .L8013D204
    /* 3600 8013D1F8 00000000 */   nop
    /* 3604 8013D1FC D07A010C */  jal        BreakObject__Fii
    /* 3608 8013D200 FFFF0424 */   addiu     $a0, $zero, -0x1
  .L8013D204:
    /* 360C 8013D204 02008016 */  bnez       $s4, .L8013D210
    /* 3610 8013D208 00000000 */   nop
    /* 3614 8013D20C 180020A6 */  sh         $zero, 0x18($s1)
  .L8013D210:
    /* 3618 8013D210 3D0020A2 */  sb         $zero, 0x3D($s1)
    /* 361C 8013D214 2120C002 */  addu       $a0, $s6, $zero
  .L8013D218:
    /* 3620 8013D218 900B020C */  jal        GetMISSILE__Fii
    /* 3624 8013D21C 2128E002 */   addu      $a1, $s7, $zero
    /* 3628 8013D220 05004010 */  beqz       $v0, .L8013D238
    /* 362C 8013D224 00000000 */   nop
    /* 3630 8013D228 02008016 */  bnez       $s4, .L8013D234
    /* 3634 8013D22C 00000000 */   nop
    /* 3638 8013D230 180020A6 */  sh         $zero, 0x18($s1)
  .L8013D234:
    /* 363C 8013D234 3D0020A2 */  sb         $zero, 0x3D($s1)
  .L8013D238:
    /* 3640 8013D238 18002296 */  lhu        $v0, 0x18($s1)
    /* 3644 8013D23C 00000000 */  nop
    /* 3648 8013D240 10004014 */  bnez       $v0, .L8013D284
    /* 364C 8013D244 00000000 */   nop
    /* 3650 8013D248 30002282 */  lb         $v0, 0x30($s1)
    /* 3654 8013D24C 00000000 */  nop
    /* 3658 8013D250 40180200 */  sll        $v1, $v0, 1
    /* 365C 8013D254 21186200 */  addu       $v1, $v1, $v0
    /* 3660 8013D258 C0180300 */  sll        $v1, $v1, 3
    /* 3664 8013D25C 0D80013C */  lui        $at, %hi(missiledata + 0x14)
    /* 3668 8013D260 21082300 */  addu       $at, $at, $v1
    /* 366C 8013D264 0468248C */  lw         $a0, %lo(missiledata + 0x14)($at)
    /* 3670 8013D268 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3674 8013D26C 05008210 */  beq        $a0, $v0, .L8013D284
    /* 3678 8013D270 00000000 */   nop
    /* 367C 8013D274 31002582 */  lb         $a1, 0x31($s1)
    /* 3680 8013D278 32002682 */  lb         $a2, 0x32($s1)
    /* 3684 8013D27C E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 3688 8013D280 00000000 */   nop
  .L8013D284:
    /* 368C 8013D284 4400BF8F */  lw         $ra, 0x44($sp)
    /* 3690 8013D288 4000BE8F */  lw         $fp, 0x40($sp)
    /* 3694 8013D28C 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 3698 8013D290 3800B68F */  lw         $s6, 0x38($sp)
    /* 369C 8013D294 3400B58F */  lw         $s5, 0x34($sp)
    /* 36A0 8013D298 3000B48F */  lw         $s4, 0x30($sp)
    /* 36A4 8013D29C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 36A8 8013D2A0 2800B28F */  lw         $s2, 0x28($sp)
    /* 36AC 8013D2A4 2400B18F */  lw         $s1, 0x24($sp)
    /* 36B0 8013D2A8 2000B08F */  lw         $s0, 0x20($sp)
    /* 36B4 8013D2AC 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 36B8 8013D2B0 0800E003 */  jr         $ra
    /* 36BC 8013D2B4 00000000 */   nop
endlabel CheckMissileCol__FiiiUciiUcb
