.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoWalk3__Fi, 0x2A4

glabel M_DoWalk3__Fi
    /* 13354 8014CF4C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 13358 8014CF50 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1335C 8014CF54 21888000 */  addu       $s1, $a0, $zero
    /* 13360 8014CF58 40101100 */  sll        $v0, $s1, 1
    /* 13364 8014CF5C 21105100 */  addu       $v0, $v0, $s1
    /* 13368 8014CF60 80100200 */  sll        $v0, $v0, 2
    /* 1336C 8014CF64 21105100 */  addu       $v0, $v0, $s1
    /* 13370 8014CF68 1800B0AF */  sw         $s0, 0x18($sp)
    /* 13374 8014CF6C C0800200 */  sll        $s0, $v0, 3
    /* 13378 8014CF70 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1337C 8014CF74 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 13380 8014CF78 21083000 */  addu       $at, $at, $s0
    /* 13384 8014CF7C F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 13388 8014CF80 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 1338C 8014CF84 21083000 */  addu       $at, $at, $s0
    /* 13390 8014CF88 BA532384 */  lh         $v1, %lo(monster + 0x26)($at)
    /* 13394 8014CF8C 06004280 */  lb         $v0, 0x6($v0)
    /* 13398 8014CF90 00000000 */  nop
    /* 1339C 8014CF94 56006214 */  bne        $v1, $v0, .L8014D0F0
    /* 133A0 8014CF98 21206000 */   addu      $a0, $v1, $zero
    /* 133A4 8014CF9C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 133A8 8014CFA0 21083000 */  addu       $at, $at, $s0
    /* 133AC 8014CFA4 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 133B0 8014CFA8 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 133B4 8014CFAC 21083000 */  addu       $at, $at, $s0
    /* 133B8 8014CFB0 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 133BC 8014CFB4 C0180300 */  sll        $v1, $v1, 3
    /* 133C0 8014CFB8 C0100400 */  sll        $v0, $a0, 3
    /* 133C4 8014CFBC 23104400 */  subu       $v0, $v0, $a0
    /* 133C8 8014CFC0 C0110200 */  sll        $v0, $v0, 7
    /* 133CC 8014CFC4 21186200 */  addu       $v1, $v1, $v0
    /* 133D0 8014CFC8 0E80013C */  lui        $at, %hi(dung_map)
    /* 133D4 8014CFCC 21082300 */  addu       $at, $at, $v1
    /* 133D8 8014CFD0 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 133DC 8014CFD4 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 133E0 8014CFD8 21083000 */  addu       $at, $at, $s0
    /* 133E4 8014CFDC AC532294 */  lhu        $v0, %lo(monster + 0x18)($at)
    /* 133E8 8014CFE0 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 133EC 8014CFE4 21083000 */  addu       $at, $at, $s0
    /* 133F0 8014CFE8 AE532394 */  lhu        $v1, %lo(monster + 0x1A)($at)
    /* 133F4 8014CFEC 1080013C */  lui        $at, %hi(monster + 0x1E)
    /* 133F8 8014CFF0 21083000 */  addu       $at, $at, $s0
    /* 133FC 8014CFF4 B2532484 */  lh         $a0, %lo(monster + 0x1E)($at)
    /* 13400 8014CFF8 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 13404 8014CFFC 21083000 */  addu       $at, $at, $s0
    /* 13408 8014D000 C85322A0 */  sb         $v0, %lo(monster + 0x34)($at)
    /* 1340C 8014D004 C0100400 */  sll        $v0, $a0, 3
    /* 13410 8014D008 23104400 */  subu       $v0, $v0, $a0
    /* 13414 8014D00C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 13418 8014D010 21083000 */  addu       $at, $at, $s0
    /* 1341C 8014D014 C95323A0 */  sb         $v1, %lo(monster + 0x35)($at)
    /* 13420 8014D018 1080013C */  lui        $at, %hi(monster + 0x20)
    /* 13424 8014D01C 21083000 */  addu       $at, $at, $s0
    /* 13428 8014D020 B4532384 */  lh         $v1, %lo(monster + 0x20)($at)
    /* 1342C 8014D024 C0110200 */  sll        $v0, $v0, 7
    /* 13430 8014D028 C0180300 */  sll        $v1, $v1, 3
    /* 13434 8014D02C 21186200 */  addu       $v1, $v1, $v0
    /* 13438 8014D030 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1343C 8014D034 21082300 */  addu       $at, $at, $v1
    /* 13440 8014D038 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 13444 8014D03C 00000000 */  nop
    /* 13448 8014D040 EF004230 */  andi       $v0, $v0, 0xEF
    /* 1344C 8014D044 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 13450 8014D048 21082300 */  addu       $at, $at, $v1
    /* 13454 8014D04C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 13458 8014D050 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1345C 8014D054 21083000 */  addu       $at, $at, $s0
    /* 13460 8014D058 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 13464 8014D05C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 13468 8014D060 21083000 */  addu       $at, $at, $s0
    /* 1346C 8014D064 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 13470 8014D068 C0180300 */  sll        $v1, $v1, 3
    /* 13474 8014D06C C0100400 */  sll        $v0, $a0, 3
    /* 13478 8014D070 23104400 */  subu       $v0, $v0, $a0
    /* 1347C 8014D074 C0110200 */  sll        $v0, $v0, 7
    /* 13480 8014D078 21186200 */  addu       $v1, $v1, $v0
    /* 13484 8014D07C 01002226 */  addiu      $v0, $s1, 0x1
    /* 13488 8014D080 0E80013C */  lui        $at, %hi(dung_map)
    /* 1348C 8014D084 21082300 */  addu       $at, $at, $v1
    /* 13490 8014D088 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 13494 8014D08C 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 13498 8014D090 21083000 */  addu       $at, $at, $s0
    /* 1349C 8014D094 E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 134A0 8014D098 00000000 */  nop
    /* 134A4 8014D09C 0D004010 */  beqz       $v0, .L8014D0D4
    /* 134A8 8014D0A0 21202002 */   addu      $a0, $s1, $zero
    /* 134AC 8014D0A4 1080013C */  lui        $at, %hi(monster + 0x59)
    /* 134B0 8014D0A8 21083000 */  addu       $at, $at, $s0
    /* 134B4 8014D0AC ED532490 */  lbu        $a0, %lo(monster + 0x59)($at)
    /* 134B8 8014D0B0 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 134BC 8014D0B4 21083000 */  addu       $at, $at, $s0
    /* 134C0 8014D0B8 C8532580 */  lb         $a1, %lo(monster + 0x34)($at)
    /* 134C4 8014D0BC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 134C8 8014D0C0 21083000 */  addu       $at, $at, $s0
    /* 134CC 8014D0C4 C9532680 */  lb         $a2, %lo(monster + 0x35)($at)
    /* 134D0 8014D0C8 E134010C */  jal        ChangeLightXY__Fiii
    /* 134D4 8014D0CC 00000000 */   nop
    /* 134D8 8014D0D0 21202002 */  addu       $a0, $s1, $zero
  .L8014D0D4:
    /* 134DC 8014D0D4 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 134E0 8014D0D8 21083000 */  addu       $at, $at, $s0
    /* 134E4 8014D0DC D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 134E8 8014D0E0 9CFF010C */  jal        M_StartStand__Fii
    /* 134EC 8014D0E4 01001024 */   addiu     $s0, $zero, 0x1
    /* 134F0 8014D0E8 69340508 */  j          .L8014D1A4
    /* 134F4 8014D0EC 40101100 */   sll       $v0, $s1, 1
  .L8014D0F0:
    /* 134F8 8014D0F0 1080013C */  lui        $at, %hi(monster + 0x3F)
    /* 134FC 8014D0F4 21083000 */  addu       $at, $at, $s0
    /* 13500 8014D0F8 D3532280 */  lb         $v0, %lo(monster + 0x3F)($at)
    /* 13504 8014D0FC 00000000 */  nop
    /* 13508 8014D100 26004014 */  bnez       $v0, .L8014D19C
    /* 1350C 8014D104 01008224 */   addiu     $v0, $a0, 0x1
    /* 13510 8014D108 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 13514 8014D10C 21083000 */  addu       $at, $at, $s0
    /* 13518 8014D110 BA5322A4 */  sh         $v0, %lo(monster + 0x26)($at)
    /* 1351C 8014D114 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 13520 8014D118 21083000 */  addu       $at, $at, $s0
    /* 13524 8014D11C B6532294 */  lhu        $v0, %lo(monster + 0x22)($at)
    /* 13528 8014D120 1080013C */  lui        $at, %hi(monster + 0x28)
    /* 1352C 8014D124 21083000 */  addu       $at, $at, $s0
    /* 13530 8014D128 BC532494 */  lhu        $a0, %lo(monster + 0x28)($at)
    /* 13534 8014D12C 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 13538 8014D130 21083000 */  addu       $at, $at, $s0
    /* 1353C 8014D134 B8532394 */  lhu        $v1, %lo(monster + 0x24)($at)
    /* 13540 8014D138 1080013C */  lui        $at, %hi(monster + 0x2A)
    /* 13544 8014D13C 21083000 */  addu       $at, $at, $s0
    /* 13548 8014D140 BE532594 */  lhu        $a1, %lo(monster + 0x2A)($at)
    /* 1354C 8014D144 21104400 */  addu       $v0, $v0, $a0
    /* 13550 8014D148 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 13554 8014D14C 21083000 */  addu       $at, $at, $s0
    /* 13558 8014D150 B65322A4 */  sh         $v0, %lo(monster + 0x22)($at)
    /* 1355C 8014D154 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 13560 8014D158 21083000 */  addu       $at, $at, $s0
    /* 13564 8014D15C B6532294 */  lhu        $v0, %lo(monster + 0x22)($at)
    /* 13568 8014D160 21186500 */  addu       $v1, $v1, $a1
    /* 1356C 8014D164 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 13570 8014D168 21083000 */  addu       $at, $at, $s0
    /* 13574 8014D16C B85323A4 */  sh         $v1, %lo(monster + 0x24)($at)
    /* 13578 8014D170 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 1357C 8014D174 21083000 */  addu       $at, $at, $s0
    /* 13580 8014D178 B8532394 */  lhu        $v1, %lo(monster + 0x24)($at)
    /* 13584 8014D17C 02110200 */  srl        $v0, $v0, 4
    /* 13588 8014D180 02190300 */  srl        $v1, $v1, 4
    /* 1358C 8014D184 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 13590 8014D188 21083000 */  addu       $at, $at, $s0
    /* 13594 8014D18C CE5322A0 */  sb         $v0, %lo(monster + 0x3A)($at)
    /* 13598 8014D190 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 1359C 8014D194 21083000 */  addu       $at, $at, $s0
    /* 135A0 8014D198 CF5323A0 */  sb         $v1, %lo(monster + 0x3B)($at)
  .L8014D19C:
    /* 135A4 8014D19C 21800000 */  addu       $s0, $zero, $zero
    /* 135A8 8014D1A0 40101100 */  sll        $v0, $s1, 1
  .L8014D1A4:
    /* 135AC 8014D1A4 21105100 */  addu       $v0, $v0, $s1
    /* 135B0 8014D1A8 80100200 */  sll        $v0, $v0, 2
    /* 135B4 8014D1AC 21105100 */  addu       $v0, $v0, $s1
    /* 135B8 8014D1B0 C0100200 */  sll        $v0, $v0, 3
    /* 135BC 8014D1B4 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 135C0 8014D1B8 21082200 */  addu       $at, $at, $v0
    /* 135C4 8014D1BC E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 135C8 8014D1C0 00000000 */  nop
    /* 135CC 8014D1C4 04004010 */  beqz       $v0, .L8014D1D8
    /* 135D0 8014D1C8 21100002 */   addu      $v0, $s0, $zero
    /* 135D4 8014D1CC 4A32050C */  jal        M_ChangeLightOffset__Fi
    /* 135D8 8014D1D0 21202002 */   addu      $a0, $s1, $zero
    /* 135DC 8014D1D4 21100002 */  addu       $v0, $s0, $zero
  .L8014D1D8:
    /* 135E0 8014D1D8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 135E4 8014D1DC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 135E8 8014D1E0 1800B08F */  lw         $s0, 0x18($sp)
    /* 135EC 8014D1E4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 135F0 8014D1E8 0800E003 */  jr         $ra
    /* 135F4 8014D1EC 00000000 */   nop
endlabel M_DoWalk3__Fi
