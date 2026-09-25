.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceQuests__Fv, 0x1A4

glabel ForceQuests__Fv
    /* 579CC 800679CC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 579D0 800679D0 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 579D4 800679D4 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 579D8 800679D8 01000224 */  addiu      $v0, $zero, 0x1
    /* 579DC 800679DC 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 579E0 800679E0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 579E4 800679E4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 579E8 800679E8 1A006210 */  beq        $v1, $v0, .L80067A54
    /* 579EC 800679EC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 579F0 800679F0 D59E0108 */  j          .L80067B54
    /* 579F4 800679F4 21100000 */   addu      $v0, $zero, $zero
  .L800679F8:
    /* 579F8 800679F8 4AED010C */  jal        GetStr__Fi
    /* 579FC 800679FC 98040424 */   addiu     $a0, $zero, 0x498
    /* 57A00 80067A00 80181000 */  sll        $v1, $s0, 2
    /* 57A04 80067A04 0E80013C */  lui        $at, %hi(questtrigstr)
    /* 57A08 80067A08 21082300 */  addu       $at, $at, $v1
    /* 57A0C 80067A0C 08DA248C */  lw         $a0, %lo(questtrigstr)($at)
    /* 57A10 80067A10 4AED010C */  jal        GetStr__Fi
    /* 57A14 80067A14 21804000 */   addu      $s0, $v0, $zero
    /* 57A18 80067A18 0D80033C */  lui        $v1, %hi(_infostr)
    /* 57A1C 80067A1C 10E86324 */  addiu      $v1, $v1, %lo(_infostr)
    /* 57A20 80067A20 21280002 */  addu       $a1, $s0, $zero
    /* 57A24 80067A24 1280043C */  lui        $a0, %hi(sel_data)
    /* 57A28 80067A28 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 57A2C 80067A2C 21304000 */  addu       $a2, $v0, $zero
    /* 57A30 80067A30 00220400 */  sll        $a0, $a0, 8
    /* 57A34 80067A34 9767000C */  jal        sprintf
    /* 57A38 80067A38 21208300 */   addu      $a0, $a0, $v1
    /* 57A3C 80067A3C 1280013C */  lui        $at, %hi(cursmx)
    /* 57A40 80067A40 50B732AC */  sw         $s2, %lo(cursmx)($at)
    /* 57A44 80067A44 1280013C */  lui        $at, %hi(cursmy)
    /* 57A48 80067A48 54B731AC */  sw         $s1, %lo(cursmy)($at)
    /* 57A4C 80067A4C D59E0108 */  j          .L80067B54
    /* 57A50 80067A50 01000224 */   addiu     $v0, $zero, 0x1
  .L80067A54:
    /* 57A54 80067A54 21300000 */  addu       $a2, $zero, $zero
    /* 57A58 80067A58 0F000A24 */  addiu      $t2, $zero, 0xF
    /* 57A5C 80067A5C 21280000 */  addu       $a1, $zero, $zero
    /* 57A60 80067A60 1280093C */  lui        $t1, %hi(currlevel)
    /* 57A64 80067A64 0CC12991 */  lbu        $t1, %lo(currlevel)($t1)
    /* 57A68 80067A68 1280083C */  lui        $t0, %hi(cursmx)
    /* 57A6C 80067A6C 50B7088D */  lw         $t0, %lo(cursmx)($t0)
    /* 57A70 80067A70 1280073C */  lui        $a3, %hi(cursmy)
    /* 57A74 80067A74 54B7E78C */  lw         $a3, %lo(cursmy)($a3)
  .L80067A78:
    /* 57A78 80067A78 1000C228 */  slti       $v0, $a2, 0x10
    /* 57A7C 80067A7C 34004010 */  beqz       $v0, .L80067B50
    /* 57A80 80067A80 00000000 */   nop
    /* 57A84 80067A84 2F00CA10 */  beq        $a2, $t2, .L80067B44
    /* 57A88 80067A88 00000000 */   nop
    /* 57A8C 80067A8C 0E80013C */  lui        $at, %hi(quests)
    /* 57A90 80067A90 21082500 */  addu       $at, $at, $a1
    /* 57A94 80067A94 40DA2290 */  lbu        $v0, %lo(quests)($at)
    /* 57A98 80067A98 00000000 */  nop
    /* 57A9C 80067A9C 29002215 */  bne        $t1, $v0, .L80067B44
    /* 57AA0 80067AA0 00000000 */   nop
    /* 57AA4 80067AA4 0E80013C */  lui        $at, %hi(quests + 0xC)
    /* 57AA8 80067AA8 21082500 */  addu       $at, $at, $a1
    /* 57AAC 80067AAC 4CDA2290 */  lbu        $v0, %lo(quests + 0xC)($at)
    /* 57AB0 80067AB0 00000000 */  nop
    /* 57AB4 80067AB4 23004010 */  beqz       $v0, .L80067B44
    /* 57AB8 80067AB8 21200000 */   addu      $a0, $zero, $zero
    /* 57ABC 80067ABC 0E80013C */  lui        $at, %hi(quests + 0xD)
    /* 57AC0 80067AC0 21082500 */  addu       $at, $at, $a1
    /* 57AC4 80067AC4 4DDA2290 */  lbu        $v0, %lo(quests + 0xD)($at)
    /* 57AC8 80067AC8 0E80013C */  lui        $at, %hi(quests + 0x4)
    /* 57ACC 80067ACC 21082500 */  addu       $at, $at, $a1
    /* 57AD0 80067AD0 44DA328C */  lw         $s2, %lo(quests + 0x4)($at)
    /* 57AD4 80067AD4 80180200 */  sll        $v1, $v0, 2
    /* 57AD8 80067AD8 21186200 */  addu       $v1, $v1, $v0
    /* 57ADC 80067ADC 80180300 */  sll        $v1, $v1, 2
    /* 57AE0 80067AE0 0E80013C */  lui        $at, %hi(quests + 0xC)
    /* 57AE4 80067AE4 21082300 */  addu       $at, $at, $v1
    /* 57AE8 80067AE8 4CDA2290 */  lbu        $v0, %lo(quests + 0xC)($at)
    /* 57AEC 80067AEC 0E80013C */  lui        $at, %hi(quests + 0x8)
    /* 57AF0 80067AF0 21082500 */  addu       $at, $at, $a1
    /* 57AF4 80067AF4 48DA318C */  lw         $s1, %lo(quests + 0x8)($at)
    /* 57AF8 80067AF8 FFFF5024 */  addiu      $s0, $v0, -0x1
  .L80067AFC:
    /* 57AFC 80067AFC 1280013C */  lui        $at, %hi(offset_x)
    /* 57B00 80067B00 21082400 */  addu       $at, $at, $a0
    /* 57B04 80067B04 A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 57B08 80067B08 00000000 */  nop
    /* 57B0C 80067B0C 21104202 */  addu       $v0, $s2, $v0
    /* 57B10 80067B10 08004814 */  bne        $v0, $t0, .L80067B34
    /* 57B14 80067B14 00000000 */   nop
    /* 57B18 80067B18 1280013C */  lui        $at, %hi(offset_y)
    /* 57B1C 80067B1C 21082400 */  addu       $at, $at, $a0
    /* 57B20 80067B20 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 57B24 80067B24 00000000 */  nop
    /* 57B28 80067B28 21102202 */  addu       $v0, $s1, $v0
    /* 57B2C 80067B2C B2FF4710 */  beq        $v0, $a3, .L800679F8
    /* 57B30 80067B30 00000000 */   nop
  .L80067B34:
    /* 57B34 80067B34 01008424 */  addiu      $a0, $a0, 0x1
    /* 57B38 80067B38 08008228 */  slti       $v0, $a0, 0x8
    /* 57B3C 80067B3C EFFF4014 */  bnez       $v0, .L80067AFC
    /* 57B40 80067B40 00000000 */   nop
  .L80067B44:
    /* 57B44 80067B44 1400A524 */  addiu      $a1, $a1, 0x14
    /* 57B48 80067B48 9E9E0108 */  j          .L80067A78
    /* 57B4C 80067B4C 0100C624 */   addiu     $a2, $a2, 0x1
  .L80067B50:
    /* 57B50 80067B50 21100000 */  addu       $v0, $zero, $zero
  .L80067B54:
    /* 57B54 80067B54 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 57B58 80067B58 1800B28F */  lw         $s2, 0x18($sp)
    /* 57B5C 80067B5C 1400B18F */  lw         $s1, 0x14($sp)
    /* 57B60 80067B60 1000B08F */  lw         $s0, 0x10($sp)
    /* 57B64 80067B64 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 57B68 80067B68 0800E003 */  jr         $ra
    /* 57B6C 80067B6C 00000000 */   nop
endlabel ForceQuests__Fv
