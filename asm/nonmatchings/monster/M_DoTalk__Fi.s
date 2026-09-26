.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoTalk__Fi, 0x5A4

glabel M_DoTalk__Fi
    /* 14704 8014E2FC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 14708 8014E300 2800B2AF */  sw         $s2, 0x28($sp)
    /* 1470C 8014E304 21908000 */  addu       $s2, $a0, $zero
    /* 14710 8014E308 40101200 */  sll        $v0, $s2, 1
    /* 14714 8014E30C 21105200 */  addu       $v0, $v0, $s2
    /* 14718 8014E310 80100200 */  sll        $v0, $v0, 2
    /* 1471C 8014E314 21105200 */  addu       $v0, $v0, $s2
    /* 14720 8014E318 2400B1AF */  sw         $s1, 0x24($sp)
    /* 14724 8014E31C C0880200 */  sll        $s1, $v0, 3
    /* 14728 8014E320 2000B0AF */  sw         $s0, 0x20($sp)
    /* 1472C 8014E324 1080103C */  lui        $s0, %hi(monster)
    /* 14730 8014E328 94531026 */  addiu      $s0, $s0, %lo(monster)
    /* 14734 8014E32C 21803002 */  addu       $s0, $s1, $s0
    /* 14738 8014E330 3800BFAF */  sw         $ra, 0x38($sp)
    /* 1473C 8014E334 3400B5AF */  sw         $s5, 0x34($sp)
    /* 14740 8014E338 3000B4AF */  sw         $s4, 0x30($sp)
    /* 14744 8014E33C 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 14748 8014E340 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1474C 8014E344 21083100 */  addu       $at, $at, $s1
    /* 14750 8014E348 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 14754 8014E34C 34001482 */  lb         $s4, 0x34($s0)
    /* 14758 8014E350 35001582 */  lb         $s5, 0x35($s0)
    /* 1475C 8014E354 5C00138E */  lw         $s3, 0x5C($s0)
    /* 14760 8014E358 9CFF010C */  jal        M_StartStand__Fii
    /* 14764 8014E35C 00000000 */   nop
    /* 14768 8014E360 07000224 */  addiu      $v0, $zero, 0x7
    /* 1476C 8014E364 490002A2 */  sb         $v0, 0x49($s0)
    /* 14770 8014E368 1080013C */  lui        $at, %hi(monster)
    /* 14774 8014E36C 21083100 */  addu       $at, $at, $s1
    /* 14778 8014E370 9453238C */  lw         $v1, %lo(monster)($at)
    /* 1477C 8014E374 00000000 */  nop
    /* 14780 8014E378 40100300 */  sll        $v0, $v1, 1
    /* 14784 8014E37C 21104300 */  addu       $v0, $v0, $v1
    /* 14788 8014E380 80100200 */  sll        $v0, $v0, 2
    /* 1478C 8014E384 1180013C */  lui        $at, %hi(alltext + 0x8)
    /* 14790 8014E388 21082200 */  addu       $at, $at, $v0
    /* 14794 8014E38C 287C248C */  lw         $a0, %lo(alltext + 0x8)($at)
    /* 14798 8014E390 CDF3000C */  jal        effect_is_playing__Fi
    /* 1479C 8014E394 00000000 */   nop
    /* 147A0 8014E398 FF004230 */  andi       $v0, $v0, 0xFF
    /* 147A4 8014E39C 36014014 */  bnez       $v0, .L8014E878
    /* 147A8 8014E3A0 21100000 */   addu      $v0, $zero, $zero
    /* 147AC 8014E3A4 1080013C */  lui        $at, %hi(monster)
    /* 147B0 8014E3A8 21083100 */  addu       $at, $at, $s1
    /* 147B4 8014E3AC 9453248C */  lw         $a0, %lo(monster)($at)
    /* 147B8 8014E3B0 1E37010C */  jal        InitQTextMsg__Fi
    /* 147BC 8014E3B4 00000000 */   nop
    /* 147C0 8014E3B8 1180023C */  lui        $v0, %hi(UniqMonst + 0x2)
    /* 147C4 8014E3BC 0AC74294 */  lhu        $v0, %lo(UniqMonst + 0x2)($v0)
    /* 147C8 8014E3C0 00000000 */  nop
    /* 147CC 8014E3C4 3E006216 */  bne        $s3, $v0, .L8014E4C0
    /* 147D0 8014E3C8 90000224 */   addiu     $v0, $zero, 0x90
    /* 147D4 8014E3CC 1080013C */  lui        $at, %hi(monster)
    /* 147D8 8014E3D0 21083100 */  addu       $at, $at, $s1
    /* 147DC 8014E3D4 9453238C */  lw         $v1, %lo(monster)($at)
    /* 147E0 8014E3D8 00000000 */  nop
    /* 147E4 8014E3DC 11006214 */  bne        $v1, $v0, .L8014E424
    /* 147E8 8014E3E0 40101200 */   sll       $v0, $s2, 1
    /* 147EC 8014E3E4 1280033C */  lui        $v1, %hi(deltaload)
    /* 147F0 8014E3E8 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 147F4 8014E3EC 02000224 */  addiu      $v0, $zero, 0x2
    /* 147F8 8014E3F0 0E80013C */  lui        $at, %hi(quests + 0x2A)
    /* 147FC 8014E3F4 6ADA22A0 */  sb         $v0, %lo(quests + 0x2A)($at)
    /* 14800 8014E3F8 0E80013C */  lui        $at, %hi(quests + 0x37)
    /* 14804 8014E3FC 77DA22A0 */  sb         $v0, %lo(quests + 0x37)($at)
    /* 14808 8014E400 01000224 */  addiu      $v0, $zero, 0x1
    /* 1480C 8014E404 0E80013C */  lui        $at, %hi(quests + 0x39)
    /* 14810 8014E408 79DA22A0 */  sb         $v0, %lo(quests + 0x39)($at)
    /* 14814 8014E40C 05006014 */  bnez       $v1, .L8014E424
    /* 14818 8014E410 40101200 */   sll       $v0, $s2, 1
    /* 1481C 8014E414 01000424 */  addiu      $a0, $zero, 0x1
    /* 14820 8014E418 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 14824 8014E41C 02000524 */   addiu     $a1, $zero, 0x2
    /* 14828 8014E420 40101200 */  sll        $v0, $s2, 1
  .L8014E424:
    /* 1482C 8014E424 21105200 */  addu       $v0, $v0, $s2
    /* 14830 8014E428 80100200 */  sll        $v0, $v0, 2
    /* 14834 8014E42C 21105200 */  addu       $v0, $v0, $s2
    /* 14838 8014E430 C0800200 */  sll        $s0, $v0, 3
    /* 1483C 8014E434 1080013C */  lui        $at, %hi(monster)
    /* 14840 8014E438 21083000 */  addu       $at, $at, $s0
    /* 14844 8014E43C 9453238C */  lw         $v1, %lo(monster)($at)
    /* 14848 8014E440 91000224 */  addiu      $v0, $zero, 0x91
    /* 1484C 8014E444 1E006214 */  bne        $v1, $v0, .L8014E4C0
    /* 14850 8014E448 00000000 */   nop
    /* 14854 8014E44C 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14858 8014E450 21083000 */  addu       $at, $at, $s0
    /* 1485C 8014E454 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14860 8014E458 00000000 */  nop
    /* 14864 8014E45C 40004230 */  andi       $v0, $v0, 0x40
    /* 14868 8014E460 17004014 */  bnez       $v0, .L8014E4C0
    /* 1486C 8014E464 03000224 */   addiu     $v0, $zero, 0x3
    /* 14870 8014E468 1280033C */  lui        $v1, %hi(deltaload)
    /* 14874 8014E46C 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 14878 8014E470 0E80013C */  lui        $at, %hi(quests + 0x37)
    /* 1487C 8014E474 77DA22A0 */  sb         $v0, %lo(quests + 0x37)($at)
    /* 14880 8014E478 05006014 */  bnez       $v1, .L8014E490
    /* 14884 8014E47C 21204002 */   addu      $a0, $s2, $zero
    /* 14888 8014E480 01000424 */  addiu      $a0, $zero, 0x1
    /* 1488C 8014E484 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 14890 8014E488 02000524 */   addiu     $a1, $zero, 0x2
    /* 14894 8014E48C 21204002 */  addu       $a0, $s2, $zero
  .L8014E490:
    /* 14898 8014E490 01008526 */  addiu      $a1, $s4, 0x1
    /* 1489C 8014E494 0100A626 */  addiu      $a2, $s5, 0x1
    /* 148A0 8014E498 F211010C */  jal        SpawnItem__FiiiUc
    /* 148A4 8014E49C 01000724 */   addiu     $a3, $zero, 0x1
    /* 148A8 8014E4A0 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 148AC 8014E4A4 21083000 */  addu       $at, $at, $s0
    /* 148B0 8014E4A8 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 148B4 8014E4AC 00000000 */  nop
    /* 148B8 8014E4B0 40004234 */  ori        $v0, $v0, 0x40
    /* 148BC 8014E4B4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 148C0 8014E4B8 21083000 */  addu       $at, $at, $s0
    /* 148C4 8014E4BC C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
  .L8014E4C0:
    /* 148C8 8014E4C0 1180023C */  lui        $v0, %hi(UniqMonst + 0x32)
    /* 148CC 8014E4C4 3AC74294 */  lhu        $v0, %lo(UniqMonst + 0x32)($v0)
    /* 148D0 8014E4C8 00000000 */  nop
    /* 148D4 8014E4CC 31006216 */  bne        $s3, $v0, .L8014E594
    /* 148D8 8014E4D0 40101200 */   sll       $v0, $s2, 1
    /* 148DC 8014E4D4 21105200 */  addu       $v0, $v0, $s2
    /* 148E0 8014E4D8 80100200 */  sll        $v0, $v0, 2
    /* 148E4 8014E4DC 21105200 */  addu       $v0, $v0, $s2
    /* 148E8 8014E4E0 C0800200 */  sll        $s0, $v0, 3
    /* 148EC 8014E4E4 1080013C */  lui        $at, %hi(monster)
    /* 148F0 8014E4E8 21083000 */  addu       $at, $at, $s0
    /* 148F4 8014E4EC 9453238C */  lw         $v1, %lo(monster)($at)
    /* 148F8 8014E4F0 94000224 */  addiu      $v0, $zero, 0x94
    /* 148FC 8014E4F4 27006214 */  bne        $v1, $v0, .L8014E594
    /* 14900 8014E4F8 00000000 */   nop
    /* 14904 8014E4FC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14908 8014E500 21083000 */  addu       $at, $at, $s0
    /* 1490C 8014E504 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14910 8014E508 00000000 */  nop
    /* 14914 8014E50C 40004230 */  andi       $v0, $v0, 0x40
    /* 14918 8014E510 20004014 */  bnez       $v0, .L8014E594
    /* 1491C 8014E514 02000224 */   addiu     $v0, $zero, 0x2
    /* 14920 8014E518 1280043C */  lui        $a0, %hi(deltaload)
    /* 14924 8014E51C 7DB98490 */  lbu        $a0, %lo(deltaload)($a0)
    /* 14928 8014E520 01000324 */  addiu      $v1, $zero, 0x1
    /* 1492C 8014E524 0E80013C */  lui        $at, %hi(quests + 0x3E)
    /* 14930 8014E528 7EDA22A0 */  sb         $v0, %lo(quests + 0x3E)($at)
    /* 14934 8014E52C 0E80013C */  lui        $at, %hi(quests + 0x4D)
    /* 14938 8014E530 8DDA23A0 */  sb         $v1, %lo(quests + 0x4D)($at)
    /* 1493C 8014E534 0E80013C */  lui        $at, %hi(quests + 0x4C)
    /* 14940 8014E538 8CDA22A0 */  sb         $v0, %lo(quests + 0x4C)($at)
    /* 14944 8014E53C 0D008014 */  bnez       $a0, .L8014E574
    /* 14948 8014E540 01000424 */   addiu     $a0, $zero, 0x1
    /* 1494C 8014E544 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 14950 8014E548 03000524 */   addiu     $a1, $zero, 0x3
    /* 14954 8014E54C 01008426 */  addiu      $a0, $s4, 0x1
    /* 14958 8014E550 0100A526 */  addiu      $a1, $s5, 0x1
    /* 1495C 8014E554 21300000 */  addu       $a2, $zero, $zero
    /* 14960 8014E558 21380000 */  addu       $a3, $zero, $zero
    /* 14964 8014E55C 18000224 */  addiu      $v0, $zero, 0x18
    /* 14968 8014E560 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1496C 8014E564 01000224 */  addiu      $v0, $zero, 0x1
    /* 14970 8014E568 1400A2AF */  sw         $v0, 0x14($sp)
    /* 14974 8014E56C B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 14978 8014E570 1800A0AF */   sw        $zero, 0x18($sp)
  .L8014E574:
    /* 1497C 8014E574 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14980 8014E578 21083000 */  addu       $at, $at, $s0
    /* 14984 8014E57C C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14988 8014E580 00000000 */  nop
    /* 1498C 8014E584 40004234 */  ori        $v0, $v0, 0x40
    /* 14990 8014E588 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14994 8014E58C 21083000 */  addu       $at, $at, $s0
    /* 14998 8014E590 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
  .L8014E594:
    /* 1499C 8014E594 1180023C */  lui        $v0, %hi(UniqMonst + 0x4A)
    /* 149A0 8014E598 52C74294 */  lhu        $v0, %lo(UniqMonst + 0x4A)($v0)
    /* 149A4 8014E59C 00000000 */  nop
    /* 149A8 8014E5A0 4B006216 */  bne        $s3, $v0, .L8014E6D0
    /* 149AC 8014E5A4 40101200 */   sll       $v0, $s2, 1
    /* 149B0 8014E5A8 21105200 */  addu       $v0, $v0, $s2
    /* 149B4 8014E5AC 80100200 */  sll        $v0, $v0, 2
    /* 149B8 8014E5B0 21105200 */  addu       $v0, $v0, $s2
    /* 149BC 8014E5B4 C0880200 */  sll        $s1, $v0, 3
    /* 149C0 8014E5B8 1080013C */  lui        $at, %hi(monster)
    /* 149C4 8014E5BC 21083100 */  addu       $at, $at, $s1
    /* 149C8 8014E5C0 9453238C */  lw         $v1, %lo(monster)($at)
    /* 149CC 8014E5C4 14000224 */  addiu      $v0, $zero, 0x14
    /* 149D0 8014E5C8 41006214 */  bne        $v1, $v0, .L8014E6D0
    /* 149D4 8014E5CC 00000000 */   nop
    /* 149D8 8014E5D0 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 149DC 8014E5D4 21083100 */  addu       $at, $at, $s1
    /* 149E0 8014E5D8 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 149E4 8014E5DC 00000000 */  nop
    /* 149E8 8014E5E0 40004230 */  andi       $v0, $v0, 0x40
    /* 149EC 8014E5E4 3A004014 */  bnez       $v0, .L8014E6D0
    /* 149F0 8014E5E8 00000000 */   nop
    /* 149F4 8014E5EC 1280043C */  lui        $a0, %hi(setpc_x)
    /* 149F8 8014E5F0 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 149FC 8014E5F4 1280023C */  lui        $v0, %hi(setpc_w)
    /* 14A00 8014E5F8 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 14A04 8014E5FC 1280053C */  lui        $a1, %hi(setpc_y)
    /* 14A08 8014E600 E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 14A0C 8014E604 43100200 */  sra        $v0, $v0, 1
    /* 14A10 8014E608 21308200 */  addu       $a2, $a0, $v0
    /* 14A14 8014E60C 1280023C */  lui        $v0, %hi(setpc_h)
    /* 14A18 8014E610 F0C0428C */  lw         $v0, %lo(setpc_h)($v0)
    /* 14A1C 8014E614 0200C624 */  addiu      $a2, $a2, 0x2
    /* 14A20 8014E618 43100200 */  sra        $v0, $v0, 1
    /* 14A24 8014E61C 2138A200 */  addu       $a3, $a1, $v0
    /* 14A28 8014E620 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 14A2C 8014E624 FEFFE724 */   addiu     $a3, $a3, -0x2
    /* 14A30 8014E628 1280103C */  lui        $s0, %hi(TransVal)
    /* 14A34 8014E62C 48C11082 */  lb         $s0, %lo(TransVal)($s0)
    /* 14A38 8014E630 1280043C */  lui        $a0, %hi(setpc_x)
    /* 14A3C 8014E634 E4C0848C */  lw         $a0, %lo(setpc_x)($a0)
    /* 14A40 8014E638 1280053C */  lui        $a1, %hi(setpc_y)
    /* 14A44 8014E63C E8C0A58C */  lw         $a1, %lo(setpc_y)($a1)
    /* 14A48 8014E640 09000224 */  addiu      $v0, $zero, 0x9
    /* 14A4C 8014E644 1280013C */  lui        $at, %hi(TransVal)
    /* 14A50 8014E648 48C122A0 */  sb         $v0, %lo(TransVal)($at)
    /* 14A54 8014E64C 1280023C */  lui        $v0, %hi(setpc_w)
    /* 14A58 8014E650 ECC0428C */  lw         $v0, %lo(setpc_w)($v0)
    /* 14A5C 8014E654 1280073C */  lui        $a3, %hi(setpc_h)
    /* 14A60 8014E658 F0C0E78C */  lw         $a3, %lo(setpc_h)($a3)
    /* 14A64 8014E65C 43100200 */  sra        $v0, $v0, 1
    /* 14A68 8014E660 21308200 */  addu       $a2, $a0, $v0
    /* 14A6C 8014E664 0400C624 */  addiu      $a2, $a2, 0x4
    /* 14A70 8014E668 43380700 */  sra        $a3, $a3, 1
    /* 14A74 8014E66C 375E010C */  jal        DRLG_MRectTrans__Fiiii
    /* 14A78 8014E670 2138A700 */   addu      $a3, $a1, $a3
    /* 14A7C 8014E674 02000424 */  addiu      $a0, $zero, 0x2
    /* 14A80 8014E678 0E80033C */  lui        $v1, %hi(quests + 0x8E)
    /* 14A84 8014E67C CEDA6390 */  lbu        $v1, %lo(quests + 0x8E)($v1)
    /* 14A88 8014E680 01000224 */  addiu      $v0, $zero, 0x1
    /* 14A8C 8014E684 1280013C */  lui        $at, %hi(TransVal)
    /* 14A90 8014E688 48C130A0 */  sb         $s0, %lo(TransVal)($at)
    /* 14A94 8014E68C 0E80013C */  lui        $at, %hi(quests + 0x9B)
    /* 14A98 8014E690 DBDA24A0 */  sb         $a0, %lo(quests + 0x9B)($at)
    /* 14A9C 8014E694 03006214 */  bne        $v1, $v0, .L8014E6A4
    /* 14AA0 8014E698 00000000 */   nop
    /* 14AA4 8014E69C 0E80013C */  lui        $at, %hi(quests + 0x8E)
    /* 14AA8 8014E6A0 CEDA24A0 */  sb         $a0, %lo(quests + 0x8E)($at)
  .L8014E6A4:
    /* 14AAC 8014E6A4 01000424 */  addiu      $a0, $zero, 0x1
    /* 14AB0 8014E6A8 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14AB4 8014E6AC 21083100 */  addu       $at, $at, $s1
    /* 14AB8 8014E6B0 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14ABC 8014E6B4 00000000 */  nop
    /* 14AC0 8014E6B8 40004234 */  ori        $v0, $v0, 0x40
    /* 14AC4 8014E6BC 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14AC8 8014E6C0 21083100 */  addu       $at, $at, $s1
    /* 14ACC 8014E6C4 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 14AD0 8014E6C8 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 14AD4 8014E6CC 07000524 */   addiu     $a1, $zero, 0x7
  .L8014E6D0:
    /* 14AD8 8014E6D0 1180023C */  lui        $v0, %hi(UniqMonst + 0xAA)
    /* 14ADC 8014E6D4 B2C74294 */  lhu        $v0, %lo(UniqMonst + 0xAA)($v0)
    /* 14AE0 8014E6D8 00000000 */  nop
    /* 14AE4 8014E6DC 35006216 */  bne        $s3, $v0, .L8014E7B4
    /* 14AE8 8014E6E0 40101200 */   sll       $v0, $s2, 1
    /* 14AEC 8014E6E4 21105200 */  addu       $v0, $v0, $s2
    /* 14AF0 8014E6E8 80100200 */  sll        $v0, $v0, 2
    /* 14AF4 8014E6EC 21105200 */  addu       $v0, $v0, $s2
    /* 14AF8 8014E6F0 C0100200 */  sll        $v0, $v0, 3
    /* 14AFC 8014E6F4 1080013C */  lui        $at, %hi(monster)
    /* 14B00 8014E6F8 21082200 */  addu       $at, $at, $v0
    /* 14B04 8014E6FC 9453238C */  lw         $v1, %lo(monster)($at)
    /* 14B08 8014E700 51000224 */  addiu      $v0, $zero, 0x51
    /* 14B0C 8014E704 0F006214 */  bne        $v1, $v0, .L8014E744
    /* 14B10 8014E708 40101200 */   sll       $v0, $s2, 1
    /* 14B14 8014E70C 1280033C */  lui        $v1, %hi(deltaload)
    /* 14B18 8014E710 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 14B1C 8014E714 02000224 */  addiu      $v0, $zero, 0x2
    /* 14B20 8014E718 0E80013C */  lui        $at, %hi(quests + 0x52)
    /* 14B24 8014E71C 92DA22A0 */  sb         $v0, %lo(quests + 0x52)($at)
    /* 14B28 8014E720 01000224 */  addiu      $v0, $zero, 0x1
    /* 14B2C 8014E724 0E80013C */  lui        $at, %hi(quests + 0x61)
    /* 14B30 8014E728 A1DA22A0 */  sb         $v0, %lo(quests + 0x61)($at)
    /* 14B34 8014E72C 05006014 */  bnez       $v1, .L8014E744
    /* 14B38 8014E730 40101200 */   sll       $v0, $s2, 1
    /* 14B3C 8014E734 01000424 */  addiu      $a0, $zero, 0x1
    /* 14B40 8014E738 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 14B44 8014E73C 04000524 */   addiu     $a1, $zero, 0x4
    /* 14B48 8014E740 40101200 */  sll        $v0, $s2, 1
  .L8014E744:
    /* 14B4C 8014E744 21105200 */  addu       $v0, $v0, $s2
    /* 14B50 8014E748 80100200 */  sll        $v0, $v0, 2
    /* 14B54 8014E74C 21105200 */  addu       $v0, $v0, $s2
    /* 14B58 8014E750 C0800200 */  sll        $s0, $v0, 3
    /* 14B5C 8014E754 1080013C */  lui        $at, %hi(monster)
    /* 14B60 8014E758 21083000 */  addu       $at, $at, $s0
    /* 14B64 8014E75C 9453238C */  lw         $v1, %lo(monster)($at)
    /* 14B68 8014E760 53000224 */  addiu      $v0, $zero, 0x53
    /* 14B6C 8014E764 13006214 */  bne        $v1, $v0, .L8014E7B4
    /* 14B70 8014E768 00000000 */   nop
    /* 14B74 8014E76C 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14B78 8014E770 21083000 */  addu       $at, $at, $s0
    /* 14B7C 8014E774 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14B80 8014E778 00000000 */  nop
    /* 14B84 8014E77C 40004230 */  andi       $v0, $v0, 0x40
    /* 14B88 8014E780 0C004014 */  bnez       $v0, .L8014E7B4
    /* 14B8C 8014E784 06000424 */   addiu     $a0, $zero, 0x6
    /* 14B90 8014E788 01008526 */  addiu      $a1, $s4, 0x1
    /* 14B94 8014E78C AD10010C */  jal        SpawnUnique__Fiii
    /* 14B98 8014E790 0100A626 */   addiu     $a2, $s5, 0x1
    /* 14B9C 8014E794 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14BA0 8014E798 21083000 */  addu       $at, $at, $s0
    /* 14BA4 8014E79C C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14BA8 8014E7A0 00000000 */  nop
    /* 14BAC 8014E7A4 40004234 */  ori        $v0, $v0, 0x40
    /* 14BB0 8014E7A8 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14BB4 8014E7AC 21083000 */  addu       $at, $at, $s0
    /* 14BB8 8014E7B0 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
  .L8014E7B4:
    /* 14BBC 8014E7B4 1180023C */  lui        $v0, %hi(UniqMonst + 0xC2)
    /* 14BC0 8014E7B8 CAC74294 */  lhu        $v0, %lo(UniqMonst + 0xC2)($v0)
    /* 14BC4 8014E7BC 00000000 */  nop
    /* 14BC8 8014E7C0 09006216 */  bne        $s3, $v0, .L8014E7E8
    /* 14BCC 8014E7C4 02000224 */   addiu     $v0, $zero, 0x2
    /* 14BD0 8014E7C8 1280033C */  lui        $v1, %hi(deltaload)
    /* 14BD4 8014E7CC 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 14BD8 8014E7D0 0E80013C */  lui        $at, %hi(quests + 0xEB)
    /* 14BDC 8014E7D4 2BDB22A0 */  sb         $v0, %lo(quests + 0xEB)($at)
    /* 14BE0 8014E7D8 03006014 */  bnez       $v1, .L8014E7E8
    /* 14BE4 8014E7DC 01000424 */   addiu     $a0, $zero, 0x1
    /* 14BE8 8014E7E0 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 14BEC 8014E7E4 08000524 */   addiu     $a1, $zero, 0x8
  .L8014E7E8:
    /* 14BF0 8014E7E8 1180023C */  lui        $v0, %hi(UniqMonst + 0x62)
    /* 14BF4 8014E7EC 6AC74294 */  lhu        $v0, %lo(UniqMonst + 0x62)($v0)
    /* 14BF8 8014E7F0 00000000 */  nop
    /* 14BFC 8014E7F4 20006216 */  bne        $s3, $v0, .L8014E878
    /* 14C00 8014E7F8 21100000 */   addu      $v0, $zero, $zero
    /* 14C04 8014E7FC 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 14C08 8014E800 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 14C0C 8014E804 01000224 */  addiu      $v0, $zero, 0x1
    /* 14C10 8014E808 1A006210 */  beq        $v1, $v0, .L8014E874
    /* 14C14 8014E80C 06000224 */   addiu     $v0, $zero, 0x6
    /* 14C18 8014E810 1280033C */  lui        $v1, %hi(deltaload)
    /* 14C1C 8014E814 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 14C20 8014E818 0E80013C */  lui        $at, %hi(quests + 0x13B)
    /* 14C24 8014E81C 7BDB22A0 */  sb         $v0, %lo(quests + 0x13B)($at)
    /* 14C28 8014E820 05006014 */  bnez       $v1, .L8014E838
    /* 14C2C 8014E824 40101200 */   sll       $v0, $s2, 1
    /* 14C30 8014E828 01000424 */  addiu      $a0, $zero, 0x1
    /* 14C34 8014E82C 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 14C38 8014E830 0F000524 */   addiu     $a1, $zero, 0xF
    /* 14C3C 8014E834 40101200 */  sll        $v0, $s2, 1
  .L8014E838:
    /* 14C40 8014E838 21105200 */  addu       $v0, $v0, $s2
    /* 14C44 8014E83C 80100200 */  sll        $v0, $v0, 2
    /* 14C48 8014E840 21105200 */  addu       $v0, $v0, $s2
    /* 14C4C 8014E844 C0100200 */  sll        $v0, $v0, 3
    /* 14C50 8014E848 01000324 */  addiu      $v1, $zero, 0x1
    /* 14C54 8014E84C 1080013C */  lui        $at, %hi(monster + 0x49)
    /* 14C58 8014E850 21082200 */  addu       $at, $at, $v0
    /* 14C5C 8014E854 DD5323A0 */  sb         $v1, %lo(monster + 0x49)($at)
    /* 14C60 8014E858 FF000324 */  addiu      $v1, $zero, 0xFF
    /* 14C64 8014E85C 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 14C68 8014E860 21082200 */  addu       $at, $at, $v0
    /* 14C6C 8014E864 E25323A0 */  sb         $v1, %lo(monster + 0x4E)($at)
    /* 14C70 8014E868 1080013C */  lui        $at, %hi(monster)
    /* 14C74 8014E86C 21082200 */  addu       $at, $at, $v0
    /* 14C78 8014E870 945320AC */  sw         $zero, %lo(monster)($at)
  .L8014E874:
    /* 14C7C 8014E874 21100000 */  addu       $v0, $zero, $zero
  .L8014E878:
    /* 14C80 8014E878 3800BF8F */  lw         $ra, 0x38($sp)
    /* 14C84 8014E87C 3400B58F */  lw         $s5, 0x34($sp)
    /* 14C88 8014E880 3000B48F */  lw         $s4, 0x30($sp)
    /* 14C8C 8014E884 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 14C90 8014E888 2800B28F */  lw         $s2, 0x28($sp)
    /* 14C94 8014E88C 2400B18F */  lw         $s1, 0x24($sp)
    /* 14C98 8014E890 2000B08F */  lw         $s0, 0x20($sp)
    /* 14C9C 8014E894 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 14CA0 8014E898 0800E003 */  jr         $ra
    /* 14CA4 8014E89C 00000000 */   nop
endlabel M_DoTalk__Fi
