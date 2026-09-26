.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L5Subs__Fv, 0x20C

glabel DRLG_L5Subs__Fv
    /* 56F4 8013F2EC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 56F8 8013F2F0 2800B6AF */  sw         $s6, 0x28($sp)
    /* 56FC 8013F2F4 21B00000 */  addu       $s6, $zero, $zero
    /* 5700 8013F2F8 3000BEAF */  sw         $fp, 0x30($sp)
    /* 5704 8013F2FC CE001E24 */  addiu      $fp, $zero, 0xCE
    /* 5708 8013F300 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 570C 8013F304 21B80000 */  addu       $s7, $zero, $zero
    /* 5710 8013F308 3400BFAF */  sw         $ra, 0x34($sp)
    /* 5714 8013F30C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 5718 8013F310 2000B4AF */  sw         $s4, 0x20($sp)
    /* 571C 8013F314 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 5720 8013F318 1800B2AF */  sw         $s2, 0x18($sp)
    /* 5724 8013F31C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 5728 8013F320 1000B0AF */  sw         $s0, 0x10($sp)
  .L8013F324:
    /* 572C 8013F324 21A80000 */  addu       $s5, $zero, $zero
    /* 5730 8013F328 40981600 */  sll        $s3, $s6, 1
    /* 5734 8013F32C 0E80123C */  lui        $s2, %hi(dungeon)
    /* 5738 8013F330 C4405226 */  addiu      $s2, $s2, %lo(dungeon)
    /* 573C 8013F334 21A00000 */  addu       $s4, $zero, $zero
    /* 5740 8013F338 2188E002 */  addu       $s1, $s7, $zero
  .L8013F33C:
    /* 5744 8013F33C C9F6000C */  jal        ENG_random__Fl
    /* 5748 8013F340 04000424 */   addiu     $a0, $zero, 0x4
    /* 574C 8013F344 55004014 */  bnez       $v0, .L8013F49C
    /* 5750 8013F348 21107202 */   addu      $v0, $s3, $s2
    /* 5754 8013F34C 00004290 */  lbu        $v0, 0x0($v0)
    /* 5758 8013F350 1480013C */  lui        $at, %hi(L5BTYPES)
    /* 575C 8013F354 21082200 */  addu       $at, $at, $v0
    /* 5760 8013F358 24A23090 */  lbu        $s0, %lo(L5BTYPES)($at)
    /* 5764 8013F35C 00000000 */  nop
    /* 5768 8013F360 4E000012 */  beqz       $s0, .L8013F49C
    /* 576C 8013F364 00000000 */   nop
    /* 5770 8013F368 1280023C */  lui        $v0, %hi(mydflags)
    /* 5774 8013F36C D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 5778 8013F370 00000000 */  nop
    /* 577C 8013F374 21105100 */  addu       $v0, $v0, $s1
    /* 5780 8013F378 00004290 */  lbu        $v0, 0x0($v0)
    /* 5784 8013F37C 00000000 */  nop
    /* 5788 8013F380 46004014 */  bnez       $v0, .L8013F49C
    /* 578C 8013F384 00000000 */   nop
    /* 5790 8013F388 C9F6000C */  jal        ENG_random__Fl
    /* 5794 8013F38C 10000424 */   addiu     $a0, $zero, 0x10
    /* 5798 8013F390 21184000 */  addu       $v1, $v0, $zero
    /* 579C 8013F394 10006004 */  bltz       $v1, .L8013F3D8
    /* 57A0 8013F398 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 57A4 8013F39C 21280002 */  addu       $a1, $s0, $zero
    /* 57A8 8013F3A0 01008424 */  addiu      $a0, $a0, 0x1
  .L8013F3A4:
    /* 57AC 8013F3A4 02009E14 */  bne        $a0, $fp, .L8013F3B0
    /* 57B0 8013F3A8 00000000 */   nop
    /* 57B4 8013F3AC 21200000 */  addu       $a0, $zero, $zero
  .L8013F3B0:
    /* 57B8 8013F3B0 1480013C */  lui        $at, %hi(L5BTYPES)
    /* 57BC 8013F3B4 21082400 */  addu       $at, $at, $a0
    /* 57C0 8013F3B8 24A22290 */  lbu        $v0, %lo(L5BTYPES)($at)
    /* 57C4 8013F3BC 00000000 */  nop
    /* 57C8 8013F3C0 0200A214 */  bne        $a1, $v0, .L8013F3CC
    /* 57CC 8013F3C4 00000000 */   nop
    /* 57D0 8013F3C8 FFFF6324 */  addiu      $v1, $v1, -0x1
  .L8013F3CC:
    /* 57D4 8013F3CC F5FF6104 */  bgez       $v1, .L8013F3A4
    /* 57D8 8013F3D0 01008424 */   addiu     $a0, $a0, 0x1
    /* 57DC 8013F3D4 FFFF8424 */  addiu      $a0, $a0, -0x1
  .L8013F3D8:
    /* 57E0 8013F3D8 59000224 */  addiu      $v0, $zero, 0x59
    /* 57E4 8013F3DC 15008214 */  bne        $a0, $v0, .L8013F434
    /* 57E8 8013F3E0 5B000224 */   addiu     $v0, $zero, 0x5B
    /* 57EC 8013F3E4 21287202 */  addu       $a1, $s3, $s2
    /* 57F0 8013F3E8 FEFFA290 */  lbu        $v0, -0x2($a1)
    /* 57F4 8013F3EC 1480013C */  lui        $at, %hi(L5BTYPES)
    /* 57F8 8013F3F0 21082200 */  addu       $at, $at, $v0
    /* 57FC 8013F3F4 24A22390 */  lbu        $v1, %lo(L5BTYPES)($at)
    /* 5800 8013F3F8 4F000224 */  addiu      $v0, $zero, 0x4F
    /* 5804 8013F3FC 0B006214 */  bne        $v1, $v0, .L8013F42C
    /* 5808 8013F400 00000000 */   nop
    /* 580C 8013F404 1280023C */  lui        $v0, %hi(mydflags)
    /* 5810 8013F408 D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 5814 8013F40C 00000000 */  nop
    /* 5818 8013F410 21102202 */  addu       $v0, $s1, $v0
    /* 581C 8013F414 D8FF4290 */  lbu        $v0, -0x28($v0)
    /* 5820 8013F418 00000000 */  nop
    /* 5824 8013F41C 03004014 */  bnez       $v0, .L8013F42C
    /* 5828 8013F420 5A000224 */   addiu     $v0, $zero, 0x5A
    /* 582C 8013F424 0CFD0408 */  j          .L8013F430
    /* 5830 8013F428 FEFFA2A4 */   sh        $v0, -0x2($a1)
  .L8013F42C:
    /* 5834 8013F42C 4F000424 */  addiu      $a0, $zero, 0x4F
  .L8013F430:
    /* 5838 8013F430 5B000224 */  addiu      $v0, $zero, 0x5B
  .L8013F434:
    /* 583C 8013F434 18008214 */  bne        $a0, $v0, .L8013F498
    /* 5840 8013F438 21107202 */   addu      $v0, $s3, $s2
    /* 5844 8013F43C 0E80023C */  lui        $v0, %hi(dungeon + 0x60)
    /* 5848 8013F440 24414224 */  addiu      $v0, $v0, %lo(dungeon + 0x60)
    /* 584C 8013F444 21108202 */  addu       $v0, $s4, $v0
    /* 5850 8013F448 21286202 */  addu       $a1, $s3, $v0
    /* 5854 8013F44C 0000A290 */  lbu        $v0, 0x0($a1)
    /* 5858 8013F450 1480013C */  lui        $at, %hi(L5BTYPES)
    /* 585C 8013F454 21082200 */  addu       $at, $at, $v0
    /* 5860 8013F458 24A22390 */  lbu        $v1, %lo(L5BTYPES)($at)
    /* 5864 8013F45C 50000224 */  addiu      $v0, $zero, 0x50
    /* 5868 8013F460 0B006214 */  bne        $v1, $v0, .L8013F490
    /* 586C 8013F464 00000000 */   nop
    /* 5870 8013F468 1280023C */  lui        $v0, %hi(mydflags)
    /* 5874 8013F46C D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 5878 8013F470 00000000 */  nop
    /* 587C 8013F474 21102202 */  addu       $v0, $s1, $v0
    /* 5880 8013F478 01004290 */  lbu        $v0, 0x1($v0)
    /* 5884 8013F47C 00000000 */  nop
    /* 5888 8013F480 03004014 */  bnez       $v0, .L8013F490
    /* 588C 8013F484 5C000224 */   addiu     $v0, $zero, 0x5C
    /* 5890 8013F488 25FD0408 */  j          .L8013F494
    /* 5894 8013F48C 0000A2A4 */   sh        $v0, 0x0($a1)
  .L8013F490:
    /* 5898 8013F490 50000424 */  addiu      $a0, $zero, 0x50
  .L8013F494:
    /* 589C 8013F494 21107202 */  addu       $v0, $s3, $s2
  .L8013F498:
    /* 58A0 8013F498 000044A4 */  sh         $a0, 0x0($v0)
  .L8013F49C:
    /* 58A4 8013F49C 60005226 */  addiu      $s2, $s2, 0x60
    /* 58A8 8013F4A0 60009426 */  addiu      $s4, $s4, 0x60
    /* 58AC 8013F4A4 0100B526 */  addiu      $s5, $s5, 0x1
    /* 58B0 8013F4A8 2800A22A */  slti       $v0, $s5, 0x28
    /* 58B4 8013F4AC A3FF4014 */  bnez       $v0, .L8013F33C
    /* 58B8 8013F4B0 01003126 */   addiu     $s1, $s1, 0x1
    /* 58BC 8013F4B4 0100D626 */  addiu      $s6, $s6, 0x1
    /* 58C0 8013F4B8 2800C22A */  slti       $v0, $s6, 0x28
    /* 58C4 8013F4BC 99FF4014 */  bnez       $v0, .L8013F324
    /* 58C8 8013F4C0 2800F726 */   addiu     $s7, $s7, 0x28
    /* 58CC 8013F4C4 3400BF8F */  lw         $ra, 0x34($sp)
    /* 58D0 8013F4C8 3000BE8F */  lw         $fp, 0x30($sp)
    /* 58D4 8013F4CC 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 58D8 8013F4D0 2800B68F */  lw         $s6, 0x28($sp)
    /* 58DC 8013F4D4 2400B58F */  lw         $s5, 0x24($sp)
    /* 58E0 8013F4D8 2000B48F */  lw         $s4, 0x20($sp)
    /* 58E4 8013F4DC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 58E8 8013F4E0 1800B28F */  lw         $s2, 0x18($sp)
    /* 58EC 8013F4E4 1400B18F */  lw         $s1, 0x14($sp)
    /* 58F0 8013F4E8 1000B08F */  lw         $s0, 0x10($sp)
    /* 58F4 8013F4EC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 58F8 8013F4F0 0800E003 */  jr         $ra
    /* 58FC 8013F4F4 00000000 */   nop
endlabel DRLG_L5Subs__Fv
