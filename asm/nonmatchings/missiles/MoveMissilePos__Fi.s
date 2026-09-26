.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MoveMissilePos__Fi, 0x178

glabel MoveMissilePos__Fi
    /* 12DC 8013AED4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 12E0 8013AED8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 12E4 8013AEDC 21900000 */  addu       $s2, $zero, $zero
    /* 12E8 8013AEE0 80100400 */  sll        $v0, $a0, 2
    /* 12EC 8013AEE4 21104400 */  addu       $v0, $v0, $a0
    /* 12F0 8013AEE8 80100200 */  sll        $v0, $v0, 2
    /* 12F4 8013AEEC 23104400 */  subu       $v0, $v0, $a0
    /* 12F8 8013AEF0 80100200 */  sll        $v0, $v0, 2
    /* 12FC 8013AEF4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1300 8013AEF8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1304 8013AEFC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1308 8013AF00 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 130C 8013AF04 21082200 */  addu       $at, $at, $v0
    /* 1310 8013AF08 972C2380 */  lb         $v1, %lo(missile + 0x3F)($at)
    /* 1314 8013AF0C 00000000 */  nop
    /* 1318 8013AF10 0800622C */  sltiu      $v0, $v1, 0x8
    /* 131C 8013AF14 12004010 */  beqz       $v0, .L8013AF60
    /* 1320 8013AF18 21880000 */   addu      $s1, $zero, $zero
    /* 1324 8013AF1C 80100300 */  sll        $v0, $v1, 2
    /* 1328 8013AF20 1280013C */  lui        $at, %hi(jtbl_8011A298)
    /* 132C 8013AF24 21082200 */  addu       $at, $at, $v0
    /* 1330 8013AF28 98A2228C */  lw         $v0, %lo(jtbl_8011A298)($at)
    /* 1334 8013AF2C 00000000 */  nop
    /* 1338 8013AF30 08004000 */  jr         $v0
    /* 133C 8013AF34 00000000 */   nop
    /* 1340 8013AF38 D7EB0408 */  j          .L8013AF5C
    /* 1344 8013AF3C 21900000 */   addu      $s2, $zero, $zero
    /* 1348 8013AF40 21900000 */  addu       $s2, $zero, $zero
    /* 134C 8013AF44 D8EB0408 */  j          .L8013AF60
    /* 1350 8013AF48 21880000 */   addu      $s1, $zero, $zero
    /* 1354 8013AF4C 01001224 */  addiu      $s2, $zero, 0x1
    /* 1358 8013AF50 D8EB0408 */  j          .L8013AF60
    /* 135C 8013AF54 21880000 */   addu      $s1, $zero, $zero
    /* 1360 8013AF58 01001224 */  addiu      $s2, $zero, 0x1
  .L8013AF5C:
    /* 1364 8013AF5C 01001124 */  addiu      $s1, $zero, 0x1
  .L8013AF60:
    /* 1368 8013AF60 80100400 */  sll        $v0, $a0, 2
    /* 136C 8013AF64 21104400 */  addu       $v0, $v0, $a0
    /* 1370 8013AF68 80100200 */  sll        $v0, $v0, 2
    /* 1374 8013AF6C 23104400 */  subu       $v0, $v0, $a0
    /* 1378 8013AF70 80800200 */  sll        $s0, $v0, 2
    /* 137C 8013AF74 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 1380 8013AF78 21083000 */  addu       $at, $at, $s0
    /* 1384 8013AF7C 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* 1388 8013AF80 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 138C 8013AF84 21083000 */  addu       $at, $at, $s0
    /* 1390 8013AF88 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* 1394 8013AF8C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 1398 8013AF90 21083000 */  addu       $at, $at, $s0
    /* 139C 8013AF94 862C2484 */  lh         $a0, %lo(missile + 0x2E)($at)
    /* 13A0 8013AF98 2128B200 */  addu       $a1, $a1, $s2
    /* 13A4 8013AF9C 1701020C */  jal        PosOkMonst__Fiii
    /* 13A8 8013AFA0 2130D100 */   addu      $a2, $a2, $s1
    /* 13AC 8013AFA4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 13B0 8013AFA8 21004010 */  beqz       $v0, .L8013B030
    /* 13B4 8013AFAC 00000000 */   nop
    /* 13B8 8013AFB0 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 13BC 8013AFB4 21083000 */  addu       $at, $at, $s0
    /* 13C0 8013AFB8 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* 13C4 8013AFBC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 13C8 8013AFC0 21083000 */  addu       $at, $at, $s0
    /* 13CC 8013AFC4 8A2C2390 */  lbu        $v1, %lo(missile + 0x32)($at)
    /* 13D0 8013AFC8 21105200 */  addu       $v0, $v0, $s2
    /* 13D4 8013AFCC 21187100 */  addu       $v1, $v1, $s1
    /* 13D8 8013AFD0 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 13DC 8013AFD4 21083000 */  addu       $at, $at, $s0
    /* 13E0 8013AFD8 892C22A0 */  sb         $v0, %lo(missile + 0x31)($at)
    /* 13E4 8013AFDC 23105102 */  subu       $v0, $s2, $s1
    /* 13E8 8013AFE0 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 13EC 8013AFE4 21083000 */  addu       $at, $at, $s0
    /* 13F0 8013AFE8 8A2C23A0 */  sb         $v1, %lo(missile + 0x32)($at)
    /* 13F4 8013AFEC 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 13F8 8013AFF0 21083000 */  addu       $at, $at, $s0
    /* 13FC 8013AFF4 8B2C2390 */  lbu        $v1, %lo(missile + 0x33)($at)
    /* 1400 8013AFF8 40110200 */  sll        $v0, $v0, 5
    /* 1404 8013AFFC 23186200 */  subu       $v1, $v1, $v0
    /* 1408 8013B000 21105102 */  addu       $v0, $s2, $s1
    /* 140C 8013B004 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 1410 8013B008 21083000 */  addu       $at, $at, $s0
    /* 1414 8013B00C 8B2C23A0 */  sb         $v1, %lo(missile + 0x33)($at)
    /* 1418 8013B010 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 141C 8013B014 21083000 */  addu       $at, $at, $s0
    /* 1420 8013B018 8C2C2390 */  lbu        $v1, %lo(missile + 0x34)($at)
    /* 1424 8013B01C 00110200 */  sll        $v0, $v0, 4
    /* 1428 8013B020 23186200 */  subu       $v1, $v1, $v0
    /* 142C 8013B024 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 1430 8013B028 21083000 */  addu       $at, $at, $s0
    /* 1434 8013B02C 8C2C23A0 */  sb         $v1, %lo(missile + 0x34)($at)
  .L8013B030:
    /* 1438 8013B030 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 143C 8013B034 1800B28F */  lw         $s2, 0x18($sp)
    /* 1440 8013B038 1400B18F */  lw         $s1, 0x14($sp)
    /* 1444 8013B03C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1448 8013B040 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 144C 8013B044 0800E003 */  jr         $ra
    /* 1450 8013B048 00000000 */   nop
endlabel MoveMissilePos__Fi
