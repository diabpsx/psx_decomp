.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLevelMTypes__Fv, 0x4D4

glabel GetLevelMTypes__Fv
    /* 2610C 8015FD04 10FBBD27 */  addiu      $sp, $sp, -0x4F0
    /* 26110 8015FD08 E004B2AF */  sw         $s2, 0x4E0($sp)
    /* 26114 8015FD0C 21900000 */  addu       $s2, $zero, $zero
    /* 26118 8015FD10 6D000424 */  addiu      $a0, $zero, 0x6D
    /* 2611C 8015FD14 02000524 */  addiu      $a1, $zero, 0x2
    /* 26120 8015FD18 EC04BFAF */  sw         $ra, 0x4EC($sp)
    /* 26124 8015FD1C E804B4AF */  sw         $s4, 0x4E8($sp)
    /* 26128 8015FD20 E404B3AF */  sw         $s3, 0x4E4($sp)
    /* 2612C 8015FD24 DC04B1AF */  sw         $s1, 0x4DC($sp)
    /* 26130 8015FD28 637E050C */  jal        AddMonsterType__Fii
    /* 26134 8015FD2C D804B0AF */   sw        $s0, 0x4D8($sp)
    /* 26138 8015FD30 1280033C */  lui        $v1, %hi(currlevel)
    /* 2613C 8015FD34 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 26140 8015FD38 10000224 */  addiu      $v0, $zero, 0x10
    /* 26144 8015FD3C 0C006214 */  bne        $v1, $v0, .L8015FD70
    /* 26148 8015FD40 03001424 */   addiu     $s4, $zero, 0x3
    /* 2614C 8015FD44 6C000424 */  addiu      $a0, $zero, 0x6C
    /* 26150 8015FD48 637E050C */  jal        AddMonsterType__Fii
    /* 26154 8015FD4C 01000524 */   addiu     $a1, $zero, 0x1
    /* 26158 8015FD50 70000424 */  addiu      $a0, $zero, 0x70
    /* 2615C 8015FD54 637E050C */  jal        AddMonsterType__Fii
    /* 26160 8015FD58 01000524 */   addiu     $a1, $zero, 0x1
    /* 26164 8015FD5C 6E000424 */  addiu      $a0, $zero, 0x6E
    /* 26168 8015FD60 637E050C */  jal        AddMonsterType__Fii
    /* 2616C 8015FD64 02000524 */   addiu     $a1, $zero, 0x2
    /* 26170 8015FD68 6B800508 */  j          .L801601AC
    /* 26174 8015FD6C 21200000 */   addu      $a0, $zero, $zero
  .L8015FD70:
    /* 26178 8015FD70 1280023C */  lui        $v0, %hi(setlevel)
    /* 2617C 8015FD74 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 26180 8015FD78 00000000 */  nop
    /* 26184 8015FD7C EA004014 */  bnez       $v0, .L80160128
    /* 26188 8015FD80 02000224 */   addiu     $v0, $zero, 0x2
    /* 2618C 8015FD84 DC9E010C */  jal        QuestStatus__Fi
    /* 26190 8015FD88 06000424 */   addiu     $a0, $zero, 0x6
    /* 26194 8015FD8C FF004230 */  andi       $v0, $v0, 0xFF
    /* 26198 8015FD90 06004010 */  beqz       $v0, .L8015FDAC
    /* 2619C 8015FD94 33000424 */   addiu     $a0, $zero, 0x33
    /* 261A0 8015FD98 637E050C */  jal        AddMonsterType__Fii
    /* 261A4 8015FD9C 02000524 */   addiu     $a1, $zero, 0x2
    /* 261A8 8015FDA0 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 261AC 8015FDA4 06000424 */   addiu     $a0, $zero, 0x6
    /* 261B0 8015FDA8 21904000 */  addu       $s2, $v0, $zero
  .L8015FDAC:
    /* 261B4 8015FDAC DC9E010C */  jal        QuestStatus__Fi
    /* 261B8 8015FDB0 02000424 */   addiu     $a0, $zero, 0x2
    /* 261BC 8015FDB4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 261C0 8015FDB8 08004010 */  beqz       $v0, .L8015FDDC
    /* 261C4 8015FDBC 00000000 */   nop
    /* 261C8 8015FDC0 1180043C */  lui        $a0, %hi(UniqMonst)
    /* 261CC 8015FDC4 08C78480 */  lb         $a0, %lo(UniqMonst)($a0)
    /* 261D0 8015FDC8 637E050C */  jal        AddMonsterType__Fii
    /* 261D4 8015FDCC 04000524 */   addiu     $a1, $zero, 0x4
    /* 261D8 8015FDD0 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 261DC 8015FDD4 02000424 */   addiu     $a0, $zero, 0x2
    /* 261E0 8015FDD8 25904202 */  or         $s2, $s2, $v0
  .L8015FDDC:
    /* 261E4 8015FDDC DC9E010C */  jal        QuestStatus__Fi
    /* 261E8 8015FDE0 03000424 */   addiu     $a0, $zero, 0x3
    /* 261EC 8015FDE4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 261F0 8015FDE8 08004010 */  beqz       $v0, .L8015FE0C
    /* 261F4 8015FDEC 00000000 */   nop
    /* 261F8 8015FDF0 1180043C */  lui        $a0, %hi(UniqMonst + 0x30)
    /* 261FC 8015FDF4 38C78480 */  lb         $a0, %lo(UniqMonst + 0x30)($a0)
    /* 26200 8015FDF8 637E050C */  jal        AddMonsterType__Fii
    /* 26204 8015FDFC 04000524 */   addiu     $a1, $zero, 0x4
    /* 26208 8015FE00 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 2620C 8015FE04 03000424 */   addiu     $a0, $zero, 0x3
    /* 26210 8015FE08 25904202 */  or         $s2, $s2, $v0
  .L8015FE0C:
    /* 26214 8015FE0C DC9E010C */  jal        QuestStatus__Fi
    /* 26218 8015FE10 07000424 */   addiu     $a0, $zero, 0x7
    /* 2621C 8015FE14 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26220 8015FE18 08004010 */  beqz       $v0, .L8015FE3C
    /* 26224 8015FE1C 00000000 */   nop
    /* 26228 8015FE20 1180043C */  lui        $a0, %hi(UniqMonst + 0x48)
    /* 2622C 8015FE24 50C78480 */  lb         $a0, %lo(UniqMonst + 0x48)($a0)
    /* 26230 8015FE28 637E050C */  jal        AddMonsterType__Fii
    /* 26234 8015FE2C 04000524 */   addiu     $a1, $zero, 0x4
    /* 26238 8015FE30 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 2623C 8015FE34 07000424 */   addiu     $a0, $zero, 0x7
    /* 26240 8015FE38 25904202 */  or         $s2, $s2, $v0
  .L8015FE3C:
    /* 26244 8015FE3C DC9E010C */  jal        QuestStatus__Fi
    /* 26248 8015FE40 04000424 */   addiu     $a0, $zero, 0x4
    /* 2624C 8015FE44 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26250 8015FE48 08004010 */  beqz       $v0, .L8015FE6C
    /* 26254 8015FE4C 00000000 */   nop
    /* 26258 8015FE50 1180043C */  lui        $a0, %hi(UniqMonst + 0xA8)
    /* 2625C 8015FE54 B0C78480 */  lb         $a0, %lo(UniqMonst + 0xA8)($a0)
    /* 26260 8015FE58 637E050C */  jal        AddMonsterType__Fii
    /* 26264 8015FE5C 04000524 */   addiu     $a1, $zero, 0x4
    /* 26268 8015FE60 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 2626C 8015FE64 04000424 */   addiu     $a0, $zero, 0x4
    /* 26270 8015FE68 25904202 */  or         $s2, $s2, $v0
  .L8015FE6C:
    /* 26274 8015FE6C DC9E010C */  jal        QuestStatus__Fi
    /* 26278 8015FE70 0B000424 */   addiu     $a0, $zero, 0xB
    /* 2627C 8015FE74 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26280 8015FE78 08004010 */  beqz       $v0, .L8015FE9C
    /* 26284 8015FE7C 00000000 */   nop
    /* 26288 8015FE80 1180043C */  lui        $a0, %hi(UniqMonst + 0xC0)
    /* 2628C 8015FE84 C8C78480 */  lb         $a0, %lo(UniqMonst + 0xC0)($a0)
    /* 26290 8015FE88 637E050C */  jal        AddMonsterType__Fii
    /* 26294 8015FE8C 04000524 */   addiu     $a1, $zero, 0x4
    /* 26298 8015FE90 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 2629C 8015FE94 0B000424 */   addiu     $a0, $zero, 0xB
    /* 262A0 8015FE98 25904202 */  or         $s2, $s2, $v0
  .L8015FE9C:
    /* 262A4 8015FE9C DC9E010C */  jal        QuestStatus__Fi
    /* 262A8 8015FEA0 09000424 */   addiu     $a0, $zero, 0x9
    /* 262AC 8015FEA4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 262B0 8015FEA8 04004010 */  beqz       $v0, .L8015FEBC
    /* 262B4 8015FEAC 00000000 */   nop
    /* 262B8 8015FEB0 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 262BC 8015FEB4 09000424 */   addiu     $a0, $zero, 0x9
    /* 262C0 8015FEB8 25904202 */  or         $s2, $s2, $v0
  .L8015FEBC:
    /* 262C4 8015FEBC DC9E010C */  jal        QuestStatus__Fi
    /* 262C8 8015FEC0 0A000424 */   addiu     $a0, $zero, 0xA
    /* 262CC 8015FEC4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 262D0 8015FEC8 04004010 */  beqz       $v0, .L8015FEDC
    /* 262D4 8015FECC 00000000 */   nop
    /* 262D8 8015FED0 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 262DC 8015FED4 0A000424 */   addiu     $a0, $zero, 0xA
    /* 262E0 8015FED8 25904202 */  or         $s2, $s2, $v0
  .L8015FEDC:
    /* 262E4 8015FEDC 1280033C */  lui        $v1, %hi(currlevel)
    /* 262E8 8015FEE0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 262EC 8015FEE4 0F000224 */  addiu      $v0, $zero, 0xF
    /* 262F0 8015FEE8 09006214 */  bne        $v1, $v0, .L8015FF10
    /* 262F4 8015FEEC 02000224 */   addiu     $v0, $zero, 0x2
    /* 262F8 8015FEF0 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 262FC 8015FEF4 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 26300 8015FEF8 00000000 */  nop
    /* 26304 8015FEFC 07006214 */  bne        $v1, $v0, .L8015FF1C
    /* 26308 8015FF00 01000224 */   addiu     $v0, $zero, 0x1
    /* 2630C 8015FF04 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 26310 8015FF08 0F000424 */   addiu     $a0, $zero, 0xF
    /* 26314 8015FF0C 25904202 */  or         $s2, $s2, $v0
  .L8015FF10:
    /* 26318 8015FF10 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 2631C 8015FF14 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 26320 8015FF18 01000224 */  addiu      $v0, $zero, 0x1
  .L8015FF1C:
    /* 26324 8015FF1C 46006210 */  beq        $v1, $v0, .L80160038
    /* 26328 8015FF20 1000A527 */   addiu     $a1, $sp, 0x10
    /* 2632C 8015FF24 1280033C */  lui        $v1, %hi(currlevel)
    /* 26330 8015FF28 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 26334 8015FF2C 0E80023C */  lui        $v0, %hi(quests + 0xF0)
    /* 26338 8015FF30 30DB4290 */  lbu        $v0, %lo(quests + 0xF0)($v0)
    /* 2633C 8015FF34 00000000 */  nop
    /* 26340 8015FF38 3F006214 */  bne        $v1, $v0, .L80160038
    /* 26344 8015FF3C 00000000 */   nop
    /* 26348 8015FF40 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 2634C 8015FF44 0C000424 */   addiu     $a0, $zero, 0xC
    /* 26350 8015FF48 25904202 */  or         $s2, $s2, $v0
    /* 26354 8015FF4C 32000424 */  addiu      $a0, $zero, 0x32
    /* 26358 8015FF50 637E050C */  jal        AddMonsterType__Fii
    /* 2635C 8015FF54 04000524 */   addiu     $a1, $zero, 0x4
    /* 26360 8015FF58 21980000 */  addu       $s3, $zero, $zero
    /* 26364 8015FF5C 08001124 */  addiu      $s1, $zero, 0x8
    /* 26368 8015FF60 E0011024 */  addiu      $s0, $zero, 0x1E0
  .L8015FF64:
    /* 2636C 8015FF64 27FD010C */  jal        IsSkel__Fi
    /* 26370 8015FF68 21202002 */   addu      $a0, $s1, $zero
    /* 26374 8015FF6C FF004230 */  andi       $v0, $v0, 0xFF
    /* 26378 8015FF70 25004010 */  beqz       $v0, .L80160008
    /* 2637C 8015FF74 00000000 */   nop
    /* 26380 8015FF78 1180013C */  lui        $at, %hi(monsterdata + 0x18)
    /* 26384 8015FF7C 21083000 */  addu       $at, $at, $s0
    /* 26388 8015FF80 B4AB2290 */  lbu        $v0, %lo(monsterdata + 0x18)($at)
    /* 2638C 8015FF84 1280053C */  lui        $a1, %hi(currlevel)
    /* 26390 8015FF88 0CC1A590 */  lbu        $a1, %lo(currlevel)($a1)
    /* 26394 8015FF8C 00160200 */  sll        $v0, $v0, 24
    /* 26398 8015FF90 03260200 */  sra        $a0, $v0, 24
    /* 2639C 8015FF94 C2170200 */  srl        $v0, $v0, 31
    /* 263A0 8015FF98 21208200 */  addu       $a0, $a0, $v0
    /* 263A4 8015FF9C 43200400 */  sra        $a0, $a0, 1
    /* 263A8 8015FFA0 01008424 */  addiu      $a0, $a0, 0x1
    /* 263AC 8015FFA4 1180013C */  lui        $at, %hi(monsterdata + 0x19)
    /* 263B0 8015FFA8 21083000 */  addu       $at, $at, $s0
    /* 263B4 8015FFAC B5AB2290 */  lbu        $v0, %lo(monsterdata + 0x19)($at)
    /* 263B8 8015FFB0 2A20A400 */  slt        $a0, $a1, $a0
    /* 263BC 8015FFB4 00160200 */  sll        $v0, $v0, 24
    /* 263C0 8015FFB8 031E0200 */  sra        $v1, $v0, 24
    /* 263C4 8015FFBC C2170200 */  srl        $v0, $v0, 31
    /* 263C8 8015FFC0 21186200 */  addu       $v1, $v1, $v0
    /* 263CC 8015FFC4 43180300 */  sra        $v1, $v1, 1
    /* 263D0 8015FFC8 0F008014 */  bnez       $a0, .L80160008
    /* 263D4 8015FFCC 01006224 */   addiu     $v0, $v1, 0x1
    /* 263D8 8015FFD0 2A104500 */  slt        $v0, $v0, $a1
    /* 263DC 8015FFD4 0C004014 */  bnez       $v0, .L80160008
    /* 263E0 8015FFD8 00000000 */   nop
    /* 263E4 8015FFDC 1180013C */  lui        $at, %hi(MonstAvailTbl)
    /* 263E8 8015FFE0 21083100 */  addu       $at, $at, $s1
    /* 263EC 8015FFE4 98C62290 */  lbu        $v0, %lo(MonstAvailTbl)($at)
    /* 263F0 8015FFE8 00000000 */  nop
    /* 263F4 8015FFEC 24108202 */  and        $v0, $s4, $v0
    /* 263F8 8015FFF0 05004010 */  beqz       $v0, .L80160008
    /* 263FC 8015FFF4 80101300 */   sll       $v0, $s3, 2
    /* 26400 8015FFF8 1000A327 */  addiu      $v1, $sp, 0x10
    /* 26404 8015FFFC 21104300 */  addu       $v0, $v0, $v1
    /* 26408 80160000 F80251AC */  sw         $s1, 0x2F8($v0)
    /* 2640C 80160004 01007326 */  addiu      $s3, $s3, 0x1
  .L80160008:
    /* 26410 80160008 01003126 */  addiu      $s1, $s1, 0x1
    /* 26414 8016000C 1C00222A */  slti       $v0, $s1, 0x1C
    /* 26418 80160010 D4FF4014 */  bnez       $v0, .L8015FF64
    /* 2641C 80160014 3C001026 */   addiu     $s0, $s0, 0x3C
    /* 26420 80160018 C9F6000C */  jal        ENG_random__Fl
    /* 26424 8016001C 21206002 */   addu      $a0, $s3, $zero
    /* 26428 80160020 80100200 */  sll        $v0, $v0, 2
    /* 2642C 80160024 2110A203 */  addu       $v0, $sp, $v0
    /* 26430 80160028 0803448C */  lw         $a0, 0x308($v0)
    /* 26434 8016002C 637E050C */  jal        AddMonsterType__Fii
    /* 26438 80160030 01000524 */   addiu     $a1, $zero, 0x1
    /* 2643C 80160034 1000A527 */  addiu      $a1, $sp, 0x10
  .L80160038:
    /* 26440 80160038 1280043C */  lui        $a0, %hi(currlevel)
    /* 26444 8016003C 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 26448 80160040 FEF5010C */  jal        ML_GetPresetMonsters__FiPiUl
    /* 2644C 80160044 21304002 */   addu      $a2, $s2, $zero
    /* 26450 80160048 1280033C */  lui        $v1, %hi(monstdebug)
    /* 26454 8016004C 99B76390 */  lbu        $v1, %lo(monstdebug)($v1)
    /* 26458 80160050 00000000 */  nop
    /* 2645C 80160054 16006010 */  beqz       $v1, .L801600B0
    /* 26460 80160058 21884000 */   addu      $s1, $v0, $zero
    /* 26464 8016005C 1280023C */  lui        $v0, %hi(debugmonsttypes)
    /* 26468 80160060 A0B7428C */  lw         $v0, %lo(debugmonsttypes)($v0)
    /* 2646C 80160064 00000000 */  nop
    /* 26470 80160068 52004018 */  blez       $v0, .L801601B4
    /* 26474 8016006C 21880000 */   addu      $s1, $zero, $zero
    /* 26478 80160070 0D80103C */  lui        $s0, %hi(DebugMonsters)
    /* 2647C 80160074 84EC1026 */  addiu      $s0, $s0, %lo(DebugMonsters)
  .L80160078:
    /* 26480 80160078 BA7D050C */  jal        SwapMonsterType__FPi
    /* 26484 8016007C 21200002 */   addu      $a0, $s0, $zero
    /* 26488 80160080 01000524 */  addiu      $a1, $zero, 0x1
    /* 2648C 80160084 0000048E */  lw         $a0, 0x0($s0)
    /* 26490 80160088 637E050C */  jal        AddMonsterType__Fii
    /* 26494 8016008C 04001026 */   addiu     $s0, $s0, 0x4
    /* 26498 80160090 1280023C */  lui        $v0, %hi(debugmonsttypes)
    /* 2649C 80160094 A0B7428C */  lw         $v0, %lo(debugmonsttypes)($v0)
    /* 264A0 80160098 01003126 */  addiu      $s1, $s1, 0x1
    /* 264A4 8016009C 2A102202 */  slt        $v0, $s1, $v0
    /* 264A8 801600A0 44004010 */  beqz       $v0, .L801601B4
    /* 264AC 801600A4 00000000 */   nop
    /* 264B0 801600A8 1E800508 */  j          .L80160078
    /* 264B4 801600AC 00000000 */   nop
  .L801600B0:
    /* 264B8 801600B0 4000201A */  blez       $s1, .L801601B4
    /* 264BC 801600B4 1000B327 */   addiu     $s3, $sp, 0x10
    /* 264C0 801600B8 80101100 */  sll        $v0, $s1, 2
    /* 264C4 801600BC 21905300 */  addu       $s2, $v0, $s3
  .L801600C0:
    /* 264C8 801600C0 1280023C */  lui        $v0, %hi(nummtypes)
    /* 264CC 801600C4 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 264D0 801600C8 00000000 */  nop
    /* 264D4 801600CC 10004228 */  slti       $v0, $v0, 0x10
    /* 264D8 801600D0 38004010 */  beqz       $v0, .L801601B4
    /* 264DC 801600D4 00000000 */   nop
    /* 264E0 801600D8 36002012 */  beqz       $s1, .L801601B4
    /* 264E4 801600DC 00000000 */   nop
    /* 264E8 801600E0 C9F6000C */  jal        ENG_random__Fl
    /* 264EC 801600E4 21202002 */   addu      $a0, $s1, $zero
    /* 264F0 801600E8 C804A427 */  addiu      $a0, $sp, 0x4C8
    /* 264F4 801600EC 80800200 */  sll        $s0, $v0, 2
    /* 264F8 801600F0 21801302 */  addu       $s0, $s0, $s3
    /* 264FC 801600F4 0000028E */  lw         $v0, 0x0($s0)
    /* 26500 801600F8 FCFF5226 */  addiu      $s2, $s2, -0x4
    /* 26504 801600FC BA7D050C */  jal        SwapMonsterType__FPi
    /* 26508 80160100 C804A2AF */   sw        $v0, 0x4C8($sp)
    /* 2650C 80160104 C804A48F */  lw         $a0, 0x4C8($sp)
    /* 26510 80160108 637E050C */  jal        AddMonsterType__Fii
    /* 26514 8016010C 01000524 */   addiu     $a1, $zero, 0x1
    /* 26518 80160110 0000428E */  lw         $v0, 0x0($s2)
    /* 2651C 80160114 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 26520 80160118 2600201A */  blez       $s1, .L801601B4
    /* 26524 8016011C 000002AE */   sw        $v0, 0x0($s0)
    /* 26528 80160120 30800508 */  j          .L801600C0
    /* 2652C 80160124 00000000 */   nop
  .L80160128:
    /* 26530 80160128 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 26534 8016012C 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 26538 80160130 00000000 */  nop
    /* 2653C 80160134 16006210 */  beq        $v1, $v0, .L80160190
    /* 26540 80160138 03006228 */   slti      $v0, $v1, 0x3
    /* 26544 8016013C 05004010 */  beqz       $v0, .L80160154
    /* 26548 80160140 01000224 */   addiu     $v0, $zero, 0x1
    /* 2654C 80160144 0A006210 */  beq        $v1, $v0, .L80160170
    /* 26550 80160148 21204002 */   addu      $a0, $s2, $zero
    /* 26554 8016014C 6B800508 */  j          .L801601AC
    /* 26558 80160150 00000000 */   nop
  .L80160154:
    /* 2655C 80160154 04000224 */  addiu      $v0, $zero, 0x4
    /* 26560 80160158 0F006210 */  beq        $v1, $v0, .L80160198
    /* 26564 8016015C 05000224 */   addiu     $v0, $zero, 0x5
    /* 26568 80160160 0E006210 */  beq        $v1, $v0, .L8016019C
    /* 2656C 80160164 0F000424 */   addiu     $a0, $zero, 0xF
    /* 26570 80160168 6B800508 */  j          .L801601AC
    /* 26574 8016016C 21204002 */   addu      $a0, $s2, $zero
  .L80160170:
    /* 26578 80160170 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 2657C 80160174 0C000424 */   addiu     $a0, $zero, 0xC
    /* 26580 80160178 25904202 */  or         $s2, $s2, $v0
    /* 26584 8016017C 32000424 */  addiu      $a0, $zero, 0x32
    /* 26588 80160180 637E050C */  jal        AddMonsterType__Fii
    /* 2658C 80160184 04000524 */   addiu     $a1, $zero, 0x4
    /* 26590 80160188 6B800508 */  j          .L801601AC
    /* 26594 8016018C 21204002 */   addu      $a0, $s2, $zero
  .L80160190:
    /* 26598 80160190 67800508 */  j          .L8016019C
    /* 2659C 80160194 0E000424 */   addiu     $a0, $zero, 0xE
  .L80160198:
    /* 265A0 80160198 0D000424 */  addiu      $a0, $zero, 0xD
  .L8016019C:
    /* 265A4 8016019C 8156050C */  jal        CM_QuestToBitPattern__Fi
    /* 265A8 801601A0 00000000 */   nop
    /* 265AC 801601A4 25904202 */  or         $s2, $s2, $v0
    /* 265B0 801601A8 21204002 */  addu       $a0, $s2, $zero
  .L801601AC:
    /* 265B4 801601AC A27E050C */  jal        GetMonsterTypes__FUl
    /* 265B8 801601B0 00000000 */   nop
  .L801601B4:
    /* 265BC 801601B4 EC04BF8F */  lw         $ra, 0x4EC($sp)
    /* 265C0 801601B8 E804B48F */  lw         $s4, 0x4E8($sp)
    /* 265C4 801601BC E404B38F */  lw         $s3, 0x4E4($sp)
    /* 265C8 801601C0 E004B28F */  lw         $s2, 0x4E0($sp)
    /* 265CC 801601C4 DC04B18F */  lw         $s1, 0x4DC($sp)
    /* 265D0 801601C8 D804B08F */  lw         $s0, 0x4D8($sp)
    /* 265D4 801601CC F004BD27 */  addiu      $sp, $sp, 0x4F0
    /* 265D8 801601D0 0800E003 */  jr         $ra
    /* 265DC 801601D4 00000000 */   nop
endlabel GetLevelMTypes__Fv
