.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTown__Fiiiiiicii, 0x480

glabel AddTown__Fiiiiiicii
    /* 53A8 8013EFA0 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 53AC 8013EFA4 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 53B0 8013EFA8 7800BEAF */  sw         $fp, 0x78($sp)
    /* 53B4 8013EFAC 7400B7AF */  sw         $s7, 0x74($sp)
    /* 53B8 8013EFB0 7000B6AF */  sw         $s6, 0x70($sp)
    /* 53BC 8013EFB4 6C00B5AF */  sw         $s5, 0x6C($sp)
    /* 53C0 8013EFB8 6800B4AF */  sw         $s4, 0x68($sp)
    /* 53C4 8013EFBC 6400B3AF */  sw         $s3, 0x64($sp)
    /* 53C8 8013EFC0 6000B2AF */  sw         $s2, 0x60($sp)
    /* 53CC 8013EFC4 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 53D0 8013EFC8 5800B0AF */  sw         $s0, 0x58($sp)
    /* 53D4 8013EFCC 3800A4AF */  sw         $a0, 0x38($sp)
    /* 53D8 8013EFD0 4000A7AF */  sw         $a3, 0x40($sp)
    /* 53DC 8013EFD4 1280053C */  lui        $a1, %hi(D_8011A030)
    /* 53E0 8013EFD8 30A0A524 */  addiu      $a1, $a1, %lo(D_8011A030)
    /* 53E4 8013EFDC 0000A28C */  lw         $v0, 0x0($a1)
    /* 53E8 8013EFE0 0400A38C */  lw         $v1, 0x4($a1)
    /* 53EC 8013EFE4 0800A48C */  lw         $a0, 0x8($a1)
    /* 53F0 8013EFE8 2000A2AF */  sw         $v0, 0x20($sp)
    /* 53F4 8013EFEC 2400A3AF */  sw         $v1, 0x24($sp)
    /* 53F8 8013EFF0 2800A4AF */  sw         $a0, 0x28($sp)
    /* 53FC 8013EFF4 0C00A28C */  lw         $v0, 0xC($a1)
    /* 5400 8013EFF8 1000A38C */  lw         $v1, 0x10($a1)
    /* 5404 8013EFFC 1400A48C */  lw         $a0, 0x14($a1)
    /* 5408 8013F000 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 540C 8013F004 3000A3AF */  sw         $v1, 0x30($sp)
    /* 5410 8013F008 3400A4AF */  sw         $a0, 0x34($sp)
    /* 5414 8013F00C 21A00000 */  addu       $s4, $zero, $zero
    /* 5418 8013F010 1280023C */  lui        $v0, %hi(currlevel)
    /* 541C 8013F014 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 5420 8013F018 00000000 */  nop
    /* 5424 8013F01C 6B004010 */  beqz       $v0, .L8013F1CC
    /* 5428 8013F020 21A80000 */   addu      $s5, $zero, $zero
    /* 542C 8013F024 01000324 */  addiu      $v1, $zero, 0x1
    /* 5430 8013F028 3800A88F */  lw         $t0, 0x38($sp)
    /* 5434 8013F02C 21F00000 */  addu       $fp, $zero, $zero
    /* 5438 8013F030 80100800 */  sll        $v0, $t0, 2
    /* 543C 8013F034 21104800 */  addu       $v0, $v0, $t0
    /* 5440 8013F038 80100200 */  sll        $v0, $v0, 2
    /* 5444 8013F03C 23104800 */  subu       $v0, $v0, $t0
    /* 5448 8013F040 80200200 */  sll        $a0, $v0, 2
    /* 544C 8013F044 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 5450 8013F048 21082400 */  addu       $at, $at, $a0
    /* 5454 8013F04C 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 5458 8013F050 4800A2AF */  sw         $v0, 0x48($sp)
    /* 545C 8013F054 80101E00 */  sll        $v0, $fp, 2
  .L8013F058:
    /* 5460 8013F058 2110A203 */  addu       $v0, $sp, $v0
    /* 5464 8013F05C 2000428C */  lw         $v0, 0x20($v0)
    /* 5468 8013F060 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 546C 8013F064 21082200 */  addu       $at, $at, $v0
    /* 5470 8013F068 54553690 */  lbu        $s6, %lo(CrawlTable)($at)
    /* 5474 8013F06C 00000000 */  nop
    /* 5478 8013F070 5000C01A */  blez       $s6, .L8013F1B4
    /* 547C 8013F074 01005724 */   addiu     $s7, $v0, 0x1
    /* 5480 8013F078 4800A88F */  lw         $t0, 0x48($sp)
    /* 5484 8013F07C 00000000 */  nop
    /* 5488 8013F080 80980800 */  sll        $s3, $t0, 2
  .L8013F084:
    /* 548C 8013F084 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 5490 8013F088 21083700 */  addu       $at, $at, $s7
    /* 5494 8013F08C 54552280 */  lb         $v0, %lo(CrawlTable)($at)
    /* 5498 8013F090 4000A88F */  lw         $t0, 0x40($sp)
    /* 549C 8013F094 0D80013C */  lui        $at, %hi(CrawlTable + 0x1)
    /* 54A0 8013F098 21083700 */  addu       $at, $at, $s7
    /* 54A4 8013F09C 55552380 */  lb         $v1, %lo(CrawlTable + 0x1)($at)
    /* 54A8 8013F0A0 21A00201 */  addu       $s4, $t0, $v0
    /* 54AC 8013F0A4 FFFF8226 */  addiu      $v0, $s4, -0x1
    /* 54B0 8013F0A8 9000A88F */  lw         $t0, 0x90($sp)
    /* 54B4 8013F0AC 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 54B8 8013F0B0 3D004010 */  beqz       $v0, .L8013F1A8
    /* 54BC 8013F0B4 21A80301 */   addu      $s5, $t0, $v1
    /* 54C0 8013F0B8 FFFFA226 */  addiu      $v0, $s5, -0x1
    /* 54C4 8013F0BC 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 54C8 8013F0C0 39004010 */  beqz       $v0, .L8013F1A8
    /* 54CC 8013F0C4 21208002 */   addu      $a0, $s4, $zero
    /* 54D0 8013F0C8 380B020C */  jal        GetSOLID__Fii
    /* 54D4 8013F0CC 2128A002 */   addu      $a1, $s5, $zero
    /* 54D8 8013F0D0 21208002 */  addu       $a0, $s4, $zero
    /* 54DC 8013F0D4 2128A002 */  addu       $a1, $s5, $zero
    /* 54E0 8013F0D8 900B020C */  jal        GetMISSILE__Fii
    /* 54E4 8013F0DC 21804000 */   addu      $s0, $v0, $zero
    /* 54E8 8013F0E0 21208002 */  addu       $a0, $s4, $zero
    /* 54EC 8013F0E4 2128A002 */  addu       $a1, $s5, $zero
    /* 54F0 8013F0E8 447F010C */  jal        IsDplayer__Fii
    /* 54F4 8013F0EC 21884000 */   addu      $s1, $v0, $zero
    /* 54F8 8013F0F0 C0201500 */  sll        $a0, $s5, 3
    /* 54FC 8013F0F4 C0181400 */  sll        $v1, $s4, 3
    /* 5500 8013F0F8 23187400 */  subu       $v1, $v1, $s4
    /* 5504 8013F0FC C0190300 */  sll        $v1, $v1, 7
    /* 5508 8013F100 21208300 */  addu       $a0, $a0, $v1
    /* 550C 8013F104 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 5510 8013F108 21082400 */  addu       $at, $at, $a0
    /* 5514 8013F10C 2B7A2380 */  lb         $v1, %lo(dung_map + 0x3)($at)
    /* 5518 8013F110 FF004230 */  andi       $v0, $v0, 0xFF
    /* 551C 8013F114 25800302 */  or         $s0, $s0, $v1
    /* 5520 8013F118 25801102 */  or         $s0, $s0, $s1
    /* 5524 8013F11C 25800202 */  or         $s0, $s0, $v0
    /* 5528 8013F120 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 552C 8013F124 21082400 */  addu       $at, $at, $a0
    /* 5530 8013F128 2D7A2280 */  lb         $v0, %lo(dung_map + 0x5)($at)
    /* 5534 8013F12C 0E80013C */  lui        $at, %hi(dung_map)
    /* 5538 8013F130 21082400 */  addu       $at, $at, $a0
    /* 553C 8013F134 287A2384 */  lh         $v1, %lo(dung_map)($at)
    /* 5540 8013F138 25800202 */  or         $s0, $s0, $v0
    /* 5544 8013F13C 25800302 */  or         $s0, $s0, $v1
    /* 5548 8013F140 06000016 */  bnez       $s0, .L8013F15C
    /* 554C 8013F144 21900000 */   addu      $s2, $zero, $zero
    /* 5550 8013F148 21208002 */  addu       $a0, $s4, $zero
    /* 5554 8013F14C 7EFB040C */  jal        CheckIfTrig__Fii
    /* 5558 8013F150 2128A002 */   addu      $a1, $s5, $zero
    /* 555C 8013F154 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5560 8013F158 0100522C */  sltiu      $s2, $v0, 0x1
  .L8013F15C:
    /* 5564 8013F15C 12004012 */  beqz       $s2, .L8013F1A8
    /* 5568 8013F160 00000000 */   nop
    /* 556C 8013F164 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 5570 8013F168 21083300 */  addu       $at, $at, $s3
    /* 5574 8013F16C 892C34A0 */  sb         $s4, %lo(missile + 0x31)($at)
    /* 5578 8013F170 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 557C 8013F174 21083300 */  addu       $at, $at, $s3
    /* 5580 8013F178 8A2C35A0 */  sb         $s5, %lo(missile + 0x32)($at)
    /* 5584 8013F17C 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 5588 8013F180 21083300 */  addu       $at, $at, $s3
    /* 558C 8013F184 8D2C34A0 */  sb         $s4, %lo(missile + 0x35)($at)
    /* 5590 8013F188 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 5594 8013F18C 21083300 */  addu       $at, $at, $s3
    /* 5598 8013F190 8E2C35A0 */  sb         $s5, %lo(missile + 0x36)($at)
    /* 559C 8013F194 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 55A0 8013F198 21083300 */  addu       $at, $at, $s3
    /* 55A4 8013F19C 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
    /* 55A8 8013F1A0 6DFC0408 */  j          .L8013F1B4
    /* 55AC 8013F1A4 06001E24 */   addiu     $fp, $zero, 0x6
  .L8013F1A8:
    /* 55B0 8013F1A8 FFFFD626 */  addiu      $s6, $s6, -0x1
    /* 55B4 8013F1AC B5FFC01E */  bgtz       $s6, .L8013F084
    /* 55B8 8013F1B0 0200F726 */   addiu     $s7, $s7, 0x2
  .L8013F1B4:
    /* 55BC 8013F1B4 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 55C0 8013F1B8 0600C22B */  slti       $v0, $fp, 0x6
    /* 55C4 8013F1BC A6FF4014 */  bnez       $v0, .L8013F058
    /* 55C8 8013F1C0 80101E00 */   sll       $v0, $fp, 2
    /* 55CC 8013F1C4 8AFC0408 */  j          .L8013F228
    /* 55D0 8013F1C8 00000000 */   nop
  .L8013F1CC:
    /* 55D4 8013F1CC 4000B48F */  lw         $s4, 0x40($sp)
    /* 55D8 8013F1D0 3800A88F */  lw         $t0, 0x38($sp)
    /* 55DC 8013F1D4 9000B58F */  lw         $s5, 0x90($sp)
    /* 55E0 8013F1D8 80100800 */  sll        $v0, $t0, 2
    /* 55E4 8013F1DC 21104800 */  addu       $v0, $v0, $t0
    /* 55E8 8013F1E0 80100200 */  sll        $v0, $v0, 2
    /* 55EC 8013F1E4 23104800 */  subu       $v0, $v0, $t0
    /* 55F0 8013F1E8 80100200 */  sll        $v0, $v0, 2
    /* 55F4 8013F1EC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 55F8 8013F1F0 21082200 */  addu       $at, $at, $v0
    /* 55FC 8013F1F4 892C34A0 */  sb         $s4, %lo(missile + 0x31)($at)
    /* 5600 8013F1F8 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 5604 8013F1FC 21082200 */  addu       $at, $at, $v0
    /* 5608 8013F200 8A2C35A0 */  sb         $s5, %lo(missile + 0x32)($at)
    /* 560C 8013F204 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 5610 8013F208 21082200 */  addu       $at, $at, $v0
    /* 5614 8013F20C 8D2C34A0 */  sb         $s4, %lo(missile + 0x35)($at)
    /* 5618 8013F210 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 561C 8013F214 21082200 */  addu       $at, $at, $v0
    /* 5620 8013F218 8E2C35A0 */  sb         $s5, %lo(missile + 0x36)($at)
    /* 5624 8013F21C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 5628 8013F220 21082200 */  addu       $at, $at, $v0
    /* 562C 8013F224 902C20A0 */  sb         $zero, %lo(missile + 0x38)($at)
  .L8013F228:
    /* 5630 8013F228 3800A88F */  lw         $t0, 0x38($sp)
    /* 5634 8013F22C 081B858F */  lw         $a1, %gp_rel(nummissiles)($gp)
    /* 5638 8013F230 80100800 */  sll        $v0, $t0, 2
    /* 563C 8013F234 21104800 */  addu       $v0, $v0, $t0
    /* 5640 8013F238 80100200 */  sll        $v0, $v0, 2
    /* 5644 8013F23C 23104800 */  subu       $v0, $v0, $t0
    /* 5648 8013F240 80100200 */  sll        $v0, $v0, 2
    /* 564C 8013F244 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 5650 8013F248 21082200 */  addu       $at, $at, $v0
    /* 5654 8013F24C 9A2C2390 */  lbu        $v1, %lo(missile + 0x42)($at)
    /* 5658 8013F250 64000424 */  addiu      $a0, $zero, 0x64
    /* 565C 8013F254 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 5660 8013F258 21082200 */  addu       $at, $at, $v0
    /* 5664 8013F25C 702C24A4 */  sh         $a0, %lo(missile + 0x18)($at)
    /* 5668 8013F260 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 566C 8013F264 21082200 */  addu       $at, $at, $v0
    /* 5670 8013F268 782C20A4 */  sh         $zero, %lo(missile + 0x20)($at)
    /* 5674 8013F26C 001E0300 */  sll        $v1, $v1, 24
    /* 5678 8013F270 031E0300 */  sra        $v1, $v1, 24
    /* 567C 8013F274 23208300 */  subu       $a0, $a0, $v1
    /* 5680 8013F278 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 5684 8013F27C 21082200 */  addu       $at, $at, $v0
    /* 5688 8013F280 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 568C 8013F284 2400A018 */  blez       $a1, .L8013F318
    /* 5690 8013F288 21B00000 */   addu      $s6, $zero, $zero
    /* 5694 8013F28C 0A000724 */  addiu      $a3, $zero, 0xA
    /* 5698 8013F290 2130A000 */  addu       $a2, $a1, $zero
    /* 569C 8013F294 1080053C */  lui        $a1, %hi(missileactive)
    /* 56A0 8013F298 602AA524 */  addiu      $a1, $a1, %lo(missileactive)
  .L8013F29C:
    /* 56A4 8013F29C 0000A484 */  lh         $a0, 0x0($a1)
    /* 56A8 8013F2A0 00000000 */  nop
    /* 56AC 8013F2A4 80100400 */  sll        $v0, $a0, 2
    /* 56B0 8013F2A8 21104400 */  addu       $v0, $v0, $a0
    /* 56B4 8013F2AC 80100200 */  sll        $v0, $v0, 2
    /* 56B8 8013F2B0 23104400 */  subu       $v0, $v0, $a0
    /* 56BC 8013F2B4 80180200 */  sll        $v1, $v0, 2
    /* 56C0 8013F2B8 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 56C4 8013F2BC 21082300 */  addu       $at, $at, $v1
    /* 56C8 8013F2C0 882C2280 */  lb         $v0, %lo(missile + 0x30)($at)
    /* 56CC 8013F2C4 00000000 */  nop
    /* 56D0 8013F2C8 0F004714 */  bne        $v0, $a3, .L8013F308
    /* 56D4 8013F2CC 00000000 */   nop
    /* 56D8 8013F2D0 3800A88F */  lw         $t0, 0x38($sp)
    /* 56DC 8013F2D4 00000000 */  nop
    /* 56E0 8013F2D8 0B008810 */  beq        $a0, $t0, .L8013F308
    /* 56E4 8013F2DC 00000000 */   nop
    /* 56E8 8013F2E0 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 56EC 8013F2E4 21082300 */  addu       $at, $at, $v1
    /* 56F0 8013F2E8 862C2284 */  lh         $v0, %lo(missile + 0x2E)($at)
    /* 56F4 8013F2EC 9C00A88F */  lw         $t0, 0x9C($sp)
    /* 56F8 8013F2F0 00000000 */  nop
    /* 56FC 8013F2F4 04004814 */  bne        $v0, $t0, .L8013F308
    /* 5700 8013F2F8 00000000 */   nop
    /* 5704 8013F2FC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 5708 8013F300 21082300 */  addu       $at, $at, $v1
    /* 570C 8013F304 702C20A4 */  sh         $zero, %lo(missile + 0x18)($at)
  .L8013F308:
    /* 5710 8013F308 0100D626 */  addiu      $s6, $s6, 0x1
    /* 5714 8013F30C 2A10C602 */  slt        $v0, $s6, $a2
    /* 5718 8013F310 E2FF4014 */  bnez       $v0, .L8013F29C
    /* 571C 8013F314 0200A524 */   addiu     $a1, $a1, 0x2
  .L8013F318:
    /* 5720 8013F318 3800A48F */  lw         $a0, 0x38($sp)
    /* 5724 8013F31C D1EA040C */  jal        PutMissile__Fi
    /* 5728 8013F320 00000000 */   nop
    /* 572C 8013F324 9C00A88F */  lw         $t0, 0x9C($sp)
    /* 5730 8013F328 1280103C */  lui        $s0, %hi(myplr)
    /* 5734 8013F32C 08BA108E */  lw         $s0, %lo(myplr)($s0)
    /* 5738 8013F330 1280013C */  lui        $at, %hi(myplr)
    /* 573C 8013F334 08BA28AC */  sw         $t0, %lo(myplr)($at)
    /* 5740 8013F338 3800A88F */  lw         $t0, 0x38($sp)
    /* 5744 8013F33C 00000000 */  nop
    /* 5748 8013F340 80100800 */  sll        $v0, $t0, 2
    /* 574C 8013F344 21104800 */  addu       $v0, $v0, $t0
    /* 5750 8013F348 80100200 */  sll        $v0, $v0, 2
    /* 5754 8013F34C 23104800 */  subu       $v0, $v0, $t0
    /* 5758 8013F350 80100200 */  sll        $v0, $v0, 2
    /* 575C 8013F354 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 5760 8013F358 21082200 */  addu       $at, $at, $v0
    /* 5764 8013F35C 902C2290 */  lbu        $v0, %lo(missile + 0x38)($at)
    /* 5768 8013F360 00000000 */  nop
    /* 576C 8013F364 1F004014 */  bnez       $v0, .L8013F3E4
    /* 5770 8013F368 00000000 */   nop
    /* 5774 8013F36C 1280033C */  lui        $v1, %hi(currlevel)
    /* 5778 8013F370 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 577C 8013F374 00000000 */  nop
    /* 5780 8013F378 1A006010 */  beqz       $v1, .L8013F3E4
    /* 5784 8013F37C 00000000 */   nop
    /* 5788 8013F380 1280023C */  lui        $v0, %hi(setlevel)
    /* 578C 8013F384 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 5790 8013F388 00000000 */  nop
    /* 5794 8013F38C 0A004014 */  bnez       $v0, .L8013F3B8
    /* 5798 8013F390 01000424 */   addiu     $a0, $zero, 0x1
    /* 579C 8013F394 38000524 */  addiu      $a1, $zero, 0x38
    /* 57A0 8013F398 FF008632 */  andi       $a2, $s4, 0xFF
    /* 57A4 8013F39C 1280023C */  lui        $v0, %hi(leveltype)
    /* 57A8 8013F3A0 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 57AC 8013F3A4 FF00A732 */  andi       $a3, $s5, 0xFF
    /* 57B0 8013F3A8 1000A3AF */  sw         $v1, 0x10($sp)
    /* 57B4 8013F3AC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 57B8 8013F3B0 F7FC0408 */  j          .L8013F3DC
    /* 57BC 8013F3B4 1400A2AF */   sw        $v0, 0x14($sp)
  .L8013F3B8:
    /* 57C0 8013F3B8 38000524 */  addiu      $a1, $zero, 0x38
    /* 57C4 8013F3BC FF008632 */  andi       $a2, $s4, 0xFF
    /* 57C8 8013F3C0 FF00A732 */  andi       $a3, $s5, 0xFF
    /* 57CC 8013F3C4 1000A3AF */  sw         $v1, 0x10($sp)
    /* 57D0 8013F3C8 1280033C */  lui        $v1, %hi(leveltype)
    /* 57D4 8013F3CC 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 57D8 8013F3D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 57DC 8013F3D4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 57E0 8013F3D8 1400A3AF */  sw         $v1, 0x14($sp)
  .L8013F3DC:
    /* 57E4 8013F3DC FB3D010C */  jal        NetSendCmdLocParam3__FUcUcUcUcUsUsUs
    /* 57E8 8013F3E0 00000000 */   nop
  .L8013F3E4:
    /* 57EC 8013F3E4 1280013C */  lui        $at, %hi(myplr)
    /* 57F0 8013F3E8 08BA30AC */  sw         $s0, %lo(myplr)($at)
    /* 57F4 8013F3EC 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 57F8 8013F3F0 7800BE8F */  lw         $fp, 0x78($sp)
    /* 57FC 8013F3F4 7400B78F */  lw         $s7, 0x74($sp)
    /* 5800 8013F3F8 7000B68F */  lw         $s6, 0x70($sp)
    /* 5804 8013F3FC 6C00B58F */  lw         $s5, 0x6C($sp)
    /* 5808 8013F400 6800B48F */  lw         $s4, 0x68($sp)
    /* 580C 8013F404 6400B38F */  lw         $s3, 0x64($sp)
    /* 5810 8013F408 6000B28F */  lw         $s2, 0x60($sp)
    /* 5814 8013F40C 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 5818 8013F410 5800B08F */  lw         $s0, 0x58($sp)
    /* 581C 8013F414 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 5820 8013F418 0800E003 */  jr         $ra
    /* 5824 8013F41C 00000000 */   nop
endlabel AddTown__Fiiiiiicii
