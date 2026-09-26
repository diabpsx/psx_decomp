.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_LArrow__Fi, 0x814

glabel MI_LArrow__Fi
    /* 9748 80143340 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 974C 80143344 3000B2AF */  sw         $s2, 0x30($sp)
    /* 9750 80143348 21908000 */  addu       $s2, $a0, $zero
    /* 9754 8014334C 80101200 */  sll        $v0, $s2, 2
    /* 9758 80143350 21105200 */  addu       $v0, $v0, $s2
    /* 975C 80143354 80100200 */  sll        $v0, $v0, 2
    /* 9760 80143358 23105200 */  subu       $v0, $v0, $s2
    /* 9764 8014335C 2800B0AF */  sw         $s0, 0x28($sp)
    /* 9768 80143360 80800200 */  sll        $s0, $v0, 2
    /* 976C 80143364 1080033C */  lui        $v1, %hi(missile)
    /* 9770 80143368 582C6324 */  addiu      $v1, $v1, %lo(missile)
    /* 9774 8014336C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 9778 80143370 3800B4AF */  sw         $s4, 0x38($sp)
    /* 977C 80143374 3400B3AF */  sw         $s3, 0x34($sp)
    /* 9780 80143378 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 9784 8014337C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 9788 80143380 21083000 */  addu       $at, $at, $s0
    /* 978C 80143384 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 9790 80143388 21280302 */  addu       $a1, $s0, $v1
    /* 9794 8014338C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9798 80143390 1800A2A4 */  sh         $v0, 0x18($a1)
    /* 979C 80143394 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 97A0 80143398 1080013C */  lui        $at, %hi(missile + 0x37)
    /* 97A4 8014339C 21083000 */  addu       $at, $at, $s0
    /* 97A8 801433A0 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* 97AC 801433A4 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 97B0 801433A8 21083000 */  addu       $at, $at, $s0
    /* 97B4 801433AC 862C3184 */  lh         $s1, %lo(missile + 0x2E)($at)
    /* 97B8 801433B0 06016210 */  beq        $v1, $v0, .L801437CC
    /* 97BC 801433B4 05000224 */   addiu     $v0, $zero, 0x5
    /* 97C0 801433B8 05016210 */  beq        $v1, $v0, .L801437D0
    /* 97C4 801433BC 80101200 */   sll       $v0, $s2, 2
    /* 97C8 801433C0 1080013C */  lui        $at, %hi(missile + 0x1C)
    /* 97CC 801433C4 21083000 */  addu       $at, $at, $s0
    /* 97D0 801433C8 742C2294 */  lhu        $v0, %lo(missile + 0x1C)($at)
    /* 97D4 801433CC 00000000 */  nop
    /* 97D8 801433D0 01004224 */  addiu      $v0, $v0, 0x1
    /* 97DC 801433D4 1C00A2A4 */  sh         $v0, 0x1C($a1)
    /* 97E0 801433D8 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 97E4 801433DC 21083000 */  addu       $at, $at, $s0
    /* 97E8 801433E0 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* 97EC 801433E4 1080013C */  lui        $at, %hi(missile)
    /* 97F0 801433E8 21083000 */  addu       $at, $at, $s0
    /* 97F4 801433EC 582C258C */  lw         $a1, %lo(missile)($at)
    /* 97F8 801433F0 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 97FC 801433F4 21083000 */  addu       $at, $at, $s0
    /* 9800 801433F8 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* 9804 801433FC 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 9808 80143400 21083000 */  addu       $at, $at, $s0
    /* 980C 80143404 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* 9810 80143408 21104500 */  addu       $v0, $v0, $a1
    /* 9814 8014340C 21186600 */  addu       $v1, $v1, $a2
    /* 9818 80143410 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 981C 80143414 21083000 */  addu       $at, $at, $s0
    /* 9820 80143418 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* 9824 8014341C 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 9828 80143420 21083000 */  addu       $at, $at, $s0
    /* 982C 80143424 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* 9830 80143428 68EB040C */  jal        GetMissilePos__Fi
    /* 9834 8014342C 00000000 */   nop
    /* 9838 80143430 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 983C 80143434 23002212 */  beq        $s1, $v0, .L801434C4
    /* 9840 80143438 00000000 */   nop
    /* 9844 8014343C 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* 9848 80143440 21083000 */  addu       $at, $at, $s0
    /* 984C 80143444 722C2294 */  lhu        $v0, %lo(missile + 0x1A)($at)
    /* 9850 80143448 00000000 */  nop
    /* 9854 8014344C 11004014 */  bnez       $v0, .L80143494
    /* 9858 80143450 40101100 */   sll       $v0, $s1, 1
    /* 985C 80143454 21105100 */  addu       $v0, $v0, $s1
    /* 9860 80143458 80100200 */  sll        $v0, $v0, 2
    /* 9864 8014345C 21105100 */  addu       $v0, $v0, $s1
    /* 9868 80143460 00110200 */  sll        $v0, $v0, 4
    /* 986C 80143464 23105100 */  subu       $v0, $v0, $s1
    /* 9870 80143468 80100200 */  sll        $v0, $v0, 2
    /* 9874 8014346C 21105100 */  addu       $v0, $v0, $s1
    /* 9878 80143470 C0100200 */  sll        $v0, $v0, 3
    /* 987C 80143474 0E80013C */  lui        $at, %hi(plr + 0x1990)
    /* 9880 80143478 21082200 */  addu       $at, $at, $v0
    /* 9884 8014347C C8BE338C */  lw         $s3, %lo(plr + 0x1990)($at)
    /* 9888 80143480 0E80013C */  lui        $at, %hi(plr + 0x1994)
    /* 988C 80143484 21082200 */  addu       $at, $at, $v0
    /* 9890 80143488 CCBE268C */  lw         $a2, %lo(plr + 0x1994)($at)
    /* 9894 8014348C 400D0508 */  j          .L80143500
    /* 9898 80143490 80101200 */   sll       $v0, $s2, 2
  .L80143494:
    /* 989C 80143494 21105100 */  addu       $v0, $v0, $s1
    /* 98A0 80143498 80100200 */  sll        $v0, $v0, 2
    /* 98A4 8014349C 21105100 */  addu       $v0, $v0, $s1
    /* 98A8 801434A0 C0100200 */  sll        $v0, $v0, 3
    /* 98AC 801434A4 1080013C */  lui        $at, %hi(monster + 0x51)
    /* 98B0 801434A8 21082200 */  addu       $at, $at, $v0
    /* 98B4 801434AC E5533390 */  lbu        $s3, %lo(monster + 0x51)($at)
    /* 98B8 801434B0 1080013C */  lui        $at, %hi(monster + 0x52)
    /* 98BC 801434B4 21082200 */  addu       $at, $at, $v0
    /* 98C0 801434B8 E6532690 */  lbu        $a2, %lo(monster + 0x52)($at)
    /* 98C4 801434BC 400D0508 */  j          .L80143500
    /* 98C8 801434C0 80101200 */   sll       $v0, $s2, 2
  .L801434C4:
    /* 98CC 801434C4 C9F6000C */  jal        ENG_random__Fl
    /* 98D0 801434C8 0A000424 */   addiu     $a0, $zero, 0xA
    /* 98D4 801434CC 1280033C */  lui        $v1, %hi(currlevel)
    /* 98D8 801434D0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 98DC 801434D4 0A000424 */  addiu      $a0, $zero, 0xA
    /* 98E0 801434D8 21186200 */  addu       $v1, $v1, $v0
    /* 98E4 801434DC C9F6000C */  jal        ENG_random__Fl
    /* 98E8 801434E0 01007324 */   addiu     $s3, $v1, 0x1
    /* 98EC 801434E4 1280033C */  lui        $v1, %hi(currlevel)
    /* 98F0 801434E8 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 98F4 801434EC 00000000 */  nop
    /* 98F8 801434F0 40180300 */  sll        $v1, $v1, 1
    /* 98FC 801434F4 21186200 */  addu       $v1, $v1, $v0
    /* 9900 801434F8 01006624 */  addiu      $a2, $v1, 0x1
    /* 9904 801434FC 80101200 */  sll        $v0, $s2, 2
  .L80143500:
    /* 9908 80143500 21105200 */  addu       $v0, $v0, $s2
    /* 990C 80143504 80100200 */  sll        $v0, $v0, 2
    /* 9910 80143508 23105200 */  subu       $v0, $v0, $s2
    /* 9914 8014350C 80800200 */  sll        $s0, $v0, 2
    /* 9918 80143510 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 991C 80143514 21083000 */  addu       $at, $at, $s0
    /* 9920 80143518 892C2380 */  lb         $v1, %lo(missile + 0x31)($at)
    /* 9924 8014351C 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 9928 80143520 21083000 */  addu       $at, $at, $s0
    /* 992C 80143524 8D2C2280 */  lb         $v0, %lo(missile + 0x35)($at)
    /* 9930 80143528 00000000 */  nop
    /* 9934 8014352C 0A006214 */  bne        $v1, $v0, .L80143558
    /* 9938 80143530 00000000 */   nop
    /* 993C 80143534 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9940 80143538 21083000 */  addu       $at, $at, $s0
    /* 9944 8014353C 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* 9948 80143540 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 994C 80143544 21083000 */  addu       $at, $at, $s0
    /* 9950 80143548 8E2C2280 */  lb         $v0, %lo(missile + 0x36)($at)
    /* 9954 8014354C 00000000 */  nop
    /* 9958 80143550 27006210 */  beq        $v1, $v0, .L801435F0
    /* 995C 80143554 80101200 */   sll       $v0, $s2, 2
  .L80143558:
    /* 9960 80143558 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 9964 8014355C 21083000 */  addu       $at, $at, $s0
    /* 9968 80143560 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 996C 80143564 21204002 */  addu       $a0, $s2, $zero
    /* 9970 80143568 40100300 */  sll        $v0, $v1, 1
    /* 9974 8014356C 21104300 */  addu       $v0, $v0, $v1
    /* 9978 80143570 C0100200 */  sll        $v0, $v0, 3
    /* 997C 80143574 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 9980 80143578 21082200 */  addu       $at, $at, $v0
    /* 9984 8014357C FE673490 */  lbu        $s4, %lo(missiledata + 0xE)($at)
    /* 9988 80143580 21286002 */  addu       $a1, $s3, $zero
    /* 998C 80143584 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 9990 80143588 21082200 */  addu       $at, $at, $v0
    /* 9994 8014358C FE6720A0 */  sb         $zero, %lo(missiledata + 0xE)($at)
    /* 9998 80143590 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 999C 80143594 21083000 */  addu       $at, $at, $s0
    /* 99A0 80143598 892C2280 */  lb         $v0, %lo(missile + 0x31)($at)
    /* 99A4 8014359C 21380000 */  addu       $a3, $zero, $zero
    /* 99A8 801435A0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 99AC 801435A4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 99B0 801435A8 21083000 */  addu       $at, $at, $s0
    /* 99B4 801435AC 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* 99B8 801435B0 01000224 */  addiu      $v0, $zero, 0x1
    /* 99BC 801435B4 1800A0AF */  sw         $zero, 0x18($sp)
    /* 99C0 801435B8 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 99C4 801435BC 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* 99C8 801435C0 1400A3AF */   sw        $v1, 0x14($sp)
    /* 99CC 801435C4 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 99D0 801435C8 21083000 */  addu       $at, $at, $s0
    /* 99D4 801435CC 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 99D8 801435D0 00000000 */  nop
    /* 99DC 801435D4 40100300 */  sll        $v0, $v1, 1
    /* 99E0 801435D8 21104300 */  addu       $v0, $v0, $v1
    /* 99E4 801435DC C0100200 */  sll        $v0, $v0, 3
    /* 99E8 801435E0 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 99EC 801435E4 21082200 */  addu       $at, $at, $v0
    /* 99F0 801435E8 FE6734A0 */  sb         $s4, %lo(missiledata + 0xE)($at)
    /* 99F4 801435EC 80101200 */  sll        $v0, $s2, 2
  .L801435F0:
    /* 99F8 801435F0 21105200 */  addu       $v0, $v0, $s2
    /* 99FC 801435F4 80100200 */  sll        $v0, $v0, 2
    /* 9A00 801435F8 23105200 */  subu       $v0, $v0, $s2
    /* 9A04 801435FC 80800200 */  sll        $s0, $v0, 2
    /* 9A08 80143600 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 9A0C 80143604 21083000 */  addu       $at, $at, $s0
    /* 9A10 80143608 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 9A14 8014360C 00000000 */  nop
    /* 9A18 80143610 31004014 */  bnez       $v0, .L801436D8
    /* 9A1C 80143614 00000000 */   nop
    /* 9A20 80143618 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 9A24 8014361C 21083000 */  addu       $at, $at, $s0
    /* 9A28 80143620 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* 9A2C 80143624 1080013C */  lui        $at, %hi(missile)
    /* 9A30 80143628 21083000 */  addu       $at, $at, $s0
    /* 9A34 8014362C 582C258C */  lw         $a1, %lo(missile)($at)
    /* 9A38 80143630 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 9A3C 80143634 21083000 */  addu       $at, $at, $s0
    /* 9A40 80143638 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* 9A44 8014363C 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 9A48 80143640 21083000 */  addu       $at, $at, $s0
    /* 9A4C 80143644 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* 9A50 80143648 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 9A54 8014364C 21083000 */  addu       $at, $at, $s0
    /* 9A58 80143650 972C20A0 */  sb         $zero, %lo(missile + 0x3F)($at)
    /* 9A5C 80143654 23104500 */  subu       $v0, $v0, $a1
    /* 9A60 80143658 23186600 */  subu       $v1, $v1, $a2
    /* 9A64 8014365C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 9A68 80143660 21083000 */  addu       $at, $at, $s0
    /* 9A6C 80143664 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* 9A70 80143668 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 9A74 8014366C 21083000 */  addu       $at, $at, $s0
    /* 9A78 80143670 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* 9A7C 80143674 68EB040C */  jal        GetMissilePos__Fi
    /* 9A80 80143678 21204002 */   addu      $a0, $s2, $zero
    /* 9A84 8014367C 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 9A88 80143680 21083000 */  addu       $at, $at, $s0
    /* 9A8C 80143684 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 9A90 80143688 38000224 */  addiu      $v0, $zero, 0x38
    /* 9A94 8014368C 03006214 */  bne        $v1, $v0, .L8014369C
    /* 9A98 80143690 21204002 */   addu      $a0, $s2, $zero
    /* 9A9C 80143694 A80D0508 */  j          .L801436A0
    /* 9AA0 80143698 1A000524 */   addiu     $a1, $zero, 0x1A
  .L8014369C:
    /* 9AA4 8014369C 05000524 */  addiu      $a1, $zero, 0x5
  .L801436A0:
    /* 9AA8 801436A0 D3F4040C */  jal        SetMissAnim__Fii
    /* 9AAC 801436A4 00000000 */   nop
    /* 9AB0 801436A8 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 9AB4 801436AC 21083000 */  addu       $at, $at, $s0
    /* 9AB8 801436B0 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* 9ABC 801436B4 00000000 */  nop
    /* 9AC0 801436B8 00160200 */  sll        $v0, $v0, 24
    /* 9AC4 801436BC 03160200 */  sra        $v0, $v0, 24
    /* 9AC8 801436C0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9ACC 801436C4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 9AD0 801436C8 21083000 */  addu       $at, $at, $s0
    /* 9AD4 801436CC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 9AD8 801436D0 B80E0508 */  j          .L80143AE0
    /* 9ADC 801436D4 80101200 */   sll       $v0, $s2, 2
  .L801436D8:
    /* 9AE0 801436D8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9AE4 801436DC 21083000 */  addu       $at, $at, $s0
    /* 9AE8 801436E0 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* 9AEC 801436E4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 9AF0 801436E8 21083000 */  addu       $at, $at, $s0
    /* 9AF4 801436EC 762C2384 */  lh         $v1, %lo(missile + 0x1E)($at)
    /* 9AF8 801436F0 00160200 */  sll        $v0, $v0, 24
    /* 9AFC 801436F4 03260200 */  sra        $a0, $v0, 24
    /* 9B00 801436F8 03160200 */  sra        $v0, $v0, 24
    /* 9B04 801436FC 0A004314 */  bne        $v0, $v1, .L80143728
    /* 9B08 80143700 00000000 */   nop
    /* 9B0C 80143704 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9B10 80143708 21083000 */  addu       $at, $at, $s0
    /* 9B14 8014370C 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* 9B18 80143710 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 9B1C 80143714 21083000 */  addu       $at, $at, $s0
    /* 9B20 80143718 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* 9B24 8014371C 00000000 */  nop
    /* 9B28 80143720 EF006210 */  beq        $v1, $v0, .L80143AE0
    /* 9B2C 80143724 80101200 */   sll       $v0, $s2, 2
  .L80143728:
    /* 9B30 80143728 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9B34 8014372C 21083000 */  addu       $at, $at, $s0
    /* 9B38 80143730 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* 9B3C 80143734 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 9B40 80143738 21083000 */  addu       $at, $at, $s0
    /* 9B44 8014373C 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 9B48 80143740 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 9B4C 80143744 21083000 */  addu       $at, $at, $s0
    /* 9B50 80143748 762C24A4 */  sh         $a0, %lo(missile + 0x1E)($at)
    /* 9B54 8014374C 00160200 */  sll        $v0, $v0, 24
    /* 9B58 80143750 03360200 */  sra        $a2, $v0, 24
    /* 9B5C 80143754 38000224 */  addiu      $v0, $zero, 0x38
    /* 9B60 80143758 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 9B64 8014375C 21083000 */  addu       $at, $at, $s0
    /* 9B68 80143760 782C26A4 */  sh         $a2, %lo(missile + 0x20)($at)
    /* 9B6C 80143764 0D006214 */  bne        $v1, $v0, .L8014379C
    /* 9B70 80143768 00000000 */   nop
    /* 9B74 8014376C 00340600 */  sll        $a2, $a2, 16
    /* 9B78 80143770 03340600 */  sra        $a2, $a2, 16
    /* 9B7C 80143774 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 9B80 80143778 21083000 */  addu       $at, $at, $s0
    /* 9B84 8014377C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 9B88 80143780 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 9B8C 80143784 21083000 */  addu       $at, $at, $s0
    /* 9B90 80143788 762C2584 */  lh         $a1, %lo(missile + 0x1E)($at)
    /* 9B94 8014378C F834010C */  jal        ChangeLight__Fiiii
    /* 9B98 80143790 65030724 */   addiu     $a3, $zero, 0x365
    /* 9B9C 80143794 B80E0508 */  j          .L80143AE0
    /* 9BA0 80143798 80101200 */   sll       $v0, $s2, 2
  .L8014379C:
    /* 9BA4 8014379C 00340600 */  sll        $a2, $a2, 16
    /* 9BA8 801437A0 03340600 */  sra        $a2, $a2, 16
    /* 9BAC 801437A4 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 9BB0 801437A8 21083000 */  addu       $at, $at, $s0
    /* 9BB4 801437AC 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 9BB8 801437B0 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 9BBC 801437B4 21083000 */  addu       $at, $at, $s0
    /* 9BC0 801437B8 762C2584 */  lh         $a1, %lo(missile + 0x1E)($at)
    /* 9BC4 801437BC F834010C */  jal        ChangeLight__Fiiii
    /* 9BC8 801437C0 95000724 */   addiu     $a3, $zero, 0x95
    /* 9BCC 801437C4 B80E0508 */  j          .L80143AE0
    /* 9BD0 801437C8 80101200 */   sll       $v0, $s2, 2
  .L801437CC:
    /* 9BD4 801437CC 80101200 */  sll        $v0, $s2, 2
  .L801437D0:
    /* 9BD8 801437D0 21105200 */  addu       $v0, $v0, $s2
    /* 9BDC 801437D4 80100200 */  sll        $v0, $v0, 2
    /* 9BE0 801437D8 23105200 */  subu       $v0, $v0, $s2
    /* 9BE4 801437DC 80300200 */  sll        $a2, $v0, 2
    /* 9BE8 801437E0 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 9BEC 801437E4 21082600 */  addu       $at, $at, $a2
    /* 9BF0 801437E8 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 9BF4 801437EC 38000224 */  addiu      $v0, $zero, 0x38
    /* 9BF8 801437F0 0F006214 */  bne        $v1, $v0, .L80143830
    /* 9BFC 801437F4 00000000 */   nop
    /* 9C00 801437F8 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 9C04 801437FC 21082600 */  addu       $at, $at, $a2
    /* 9C08 80143800 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 9C0C 80143804 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9C10 80143808 21082600 */  addu       $at, $at, $a2
    /* 9C14 8014380C 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* 9C18 80143810 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 9C1C 80143814 21082600 */  addu       $at, $at, $a2
    /* 9C20 80143818 9F2C2780 */  lb         $a3, %lo(missile + 0x47)($at)
    /* 9C24 8014381C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9C28 80143820 21082600 */  addu       $at, $at, $a2
    /* 9C2C 80143824 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* 9C30 80143828 190E0508 */  j          .L80143864
    /* 9C34 8014382C 6003E724 */   addiu     $a3, $a3, 0x360
  .L80143830:
    /* 9C38 80143830 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 9C3C 80143834 21082600 */  addu       $at, $at, $a2
    /* 9C40 80143838 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 9C44 8014383C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9C48 80143840 21082600 */  addu       $at, $at, $a2
    /* 9C4C 80143844 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* 9C50 80143848 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 9C54 8014384C 21082600 */  addu       $at, $at, $a2
    /* 9C58 80143850 9F2C2780 */  lb         $a3, %lo(missile + 0x47)($at)
    /* 9C5C 80143854 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9C60 80143858 21082600 */  addu       $at, $at, $a2
    /* 9C64 8014385C 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* 9C68 80143860 9000E724 */  addiu      $a3, $a3, 0x90
  .L80143864:
    /* 9C6C 80143864 F834010C */  jal        ChangeLight__Fiiii
    /* 9C70 80143868 00000000 */   nop
    /* 9C74 8014386C 80101200 */  sll        $v0, $s2, 2
    /* 9C78 80143870 21105200 */  addu       $v0, $v0, $s2
    /* 9C7C 80143874 80100200 */  sll        $v0, $v0, 2
    /* 9C80 80143878 23105200 */  subu       $v0, $v0, $s2
    /* 9C84 8014387C 80100200 */  sll        $v0, $v0, 2
    /* 9C88 80143880 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 9C8C 80143884 21082200 */  addu       $at, $at, $v0
    /* 9C90 80143888 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 9C94 8014388C 00000000 */  nop
    /* 9C98 80143890 40100300 */  sll        $v0, $v1, 1
    /* 9C9C 80143894 21104300 */  addu       $v0, $v0, $v1
    /* 9CA0 80143898 C0100200 */  sll        $v0, $v0, 3
    /* 9CA4 8014389C 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 9CA8 801438A0 21082200 */  addu       $at, $at, $v0
    /* 9CAC 801438A4 FE673490 */  lbu        $s4, %lo(missiledata + 0xE)($at)
    /* 9CB0 801438A8 38000224 */  addiu      $v0, $zero, 0x38
    /* 9CB4 801438AC 3A006214 */  bne        $v1, $v0, .L80143998
    /* 9CB8 801438B0 80101200 */   sll       $v0, $s2, 2
    /* 9CBC 801438B4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 9CC0 801438B8 11002212 */  beq        $s1, $v0, .L80143900
    /* 9CC4 801438BC 40101100 */   sll       $v0, $s1, 1
    /* 9CC8 801438C0 21105100 */  addu       $v0, $v0, $s1
    /* 9CCC 801438C4 80100200 */  sll        $v0, $v0, 2
    /* 9CD0 801438C8 21105100 */  addu       $v0, $v0, $s1
    /* 9CD4 801438CC 00110200 */  sll        $v0, $v0, 4
    /* 9CD8 801438D0 23105100 */  subu       $v0, $v0, $s1
    /* 9CDC 801438D4 80100200 */  sll        $v0, $v0, 2
    /* 9CE0 801438D8 21105100 */  addu       $v0, $v0, $s1
    /* 9CE4 801438DC C0100200 */  sll        $v0, $v0, 3
    /* 9CE8 801438E0 0E80013C */  lui        $at, %hi(plr + 0x19D4)
    /* 9CEC 801438E4 21082200 */  addu       $at, $at, $v0
    /* 9CF0 801438E8 0CBF338C */  lw         $s3, %lo(plr + 0x19D4)($at)
    /* 9CF4 801438EC 0E80013C */  lui        $at, %hi(plr + 0x19D8)
    /* 9CF8 801438F0 21082200 */  addu       $at, $at, $v0
    /* 9CFC 801438F4 10BF268C */  lw         $a2, %lo(plr + 0x19D8)($at)
    /* 9D00 801438F8 4F0E0508 */  j          .L8014393C
    /* 9D04 801438FC 21204002 */   addu      $a0, $s2, $zero
  .L80143900:
    /* 9D08 80143900 C9F6000C */  jal        ENG_random__Fl
    /* 9D0C 80143904 0A000424 */   addiu     $a0, $zero, 0xA
    /* 9D10 80143908 1280033C */  lui        $v1, %hi(currlevel)
    /* 9D14 8014390C 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 9D18 80143910 0A000424 */  addiu      $a0, $zero, 0xA
    /* 9D1C 80143914 21186200 */  addu       $v1, $v1, $v0
    /* 9D20 80143918 C9F6000C */  jal        ENG_random__Fl
    /* 9D24 8014391C 01007324 */   addiu     $s3, $v1, 0x1
    /* 9D28 80143920 1280033C */  lui        $v1, %hi(currlevel)
    /* 9D2C 80143924 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 9D30 80143928 00000000 */  nop
    /* 9D34 8014392C 40180300 */  sll        $v1, $v1, 1
    /* 9D38 80143930 21186200 */  addu       $v1, $v1, $v0
    /* 9D3C 80143934 01006624 */  addiu      $a2, $v1, 0x1
    /* 9D40 80143938 21204002 */  addu       $a0, $s2, $zero
  .L8014393C:
    /* 9D44 8014393C 21286002 */  addu       $a1, $s3, $zero
    /* 9D48 80143940 02000224 */  addiu      $v0, $zero, 0x2
    /* 9D4C 80143944 0D80013C */  lui        $at, %hi(missiledata + 0x54E)
    /* 9D50 80143948 3E6D22A0 */  sb         $v0, %lo(missiledata + 0x54E)($at)
    /* 9D54 8014394C 80101200 */  sll        $v0, $s2, 2
    /* 9D58 80143950 21105200 */  addu       $v0, $v0, $s2
    /* 9D5C 80143954 80100200 */  sll        $v0, $v0, 2
    /* 9D60 80143958 23105200 */  subu       $v0, $v0, $s2
    /* 9D64 8014395C 80100200 */  sll        $v0, $v0, 2
    /* 9D68 80143960 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9D6C 80143964 21082200 */  addu       $at, $at, $v0
    /* 9D70 80143968 892C2380 */  lb         $v1, %lo(missile + 0x31)($at)
    /* 9D74 8014396C 21380000 */  addu       $a3, $zero, $zero
    /* 9D78 80143970 1000A3AF */  sw         $v1, 0x10($sp)
    /* 9D7C 80143974 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9D80 80143978 21082200 */  addu       $at, $at, $v0
    /* 9D84 8014397C 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* 9D88 80143980 01000224 */  addiu      $v0, $zero, 0x1
    /* 9D8C 80143984 1800A0AF */  sw         $zero, 0x18($sp)
    /* 9D90 80143988 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9D94 8014398C 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* 9D98 80143990 1400A3AF */   sw        $v1, 0x14($sp)
    /* 9D9C 80143994 80101200 */  sll        $v0, $s2, 2
  .L80143998:
    /* 9DA0 80143998 21105200 */  addu       $v0, $v0, $s2
    /* 9DA4 8014399C 80100200 */  sll        $v0, $v0, 2
    /* 9DA8 801439A0 23105200 */  subu       $v0, $v0, $s2
    /* 9DAC 801439A4 80100200 */  sll        $v0, $v0, 2
    /* 9DB0 801439A8 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 9DB4 801439AC 21082200 */  addu       $at, $at, $v0
    /* 9DB8 801439B0 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 9DBC 801439B4 1B000224 */  addiu      $v0, $zero, 0x1B
    /* 9DC0 801439B8 3A006214 */  bne        $v1, $v0, .L80143AA4
    /* 9DC4 801439BC 80101200 */   sll       $v0, $s2, 2
    /* 9DC8 801439C0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 9DCC 801439C4 11002212 */  beq        $s1, $v0, .L80143A0C
    /* 9DD0 801439C8 40101100 */   sll       $v0, $s1, 1
    /* 9DD4 801439CC 21105100 */  addu       $v0, $v0, $s1
    /* 9DD8 801439D0 80100200 */  sll        $v0, $v0, 2
    /* 9DDC 801439D4 21105100 */  addu       $v0, $v0, $s1
    /* 9DE0 801439D8 00110200 */  sll        $v0, $v0, 4
    /* 9DE4 801439DC 23105100 */  subu       $v0, $v0, $s1
    /* 9DE8 801439E0 80100200 */  sll        $v0, $v0, 2
    /* 9DEC 801439E4 21105100 */  addu       $v0, $v0, $s1
    /* 9DF0 801439E8 C0100200 */  sll        $v0, $v0, 3
    /* 9DF4 801439EC 0E80013C */  lui        $at, %hi(plr + 0x19CC)
    /* 9DF8 801439F0 21082200 */  addu       $at, $at, $v0
    /* 9DFC 801439F4 04BF338C */  lw         $s3, %lo(plr + 0x19CC)($at)
    /* 9E00 801439F8 0E80013C */  lui        $at, %hi(plr + 0x19D0)
    /* 9E04 801439FC 21082200 */  addu       $at, $at, $v0
    /* 9E08 80143A00 08BF268C */  lw         $a2, %lo(plr + 0x19D0)($at)
    /* 9E0C 80143A04 920E0508 */  j          .L80143A48
    /* 9E10 80143A08 21204002 */   addu      $a0, $s2, $zero
  .L80143A0C:
    /* 9E14 80143A0C C9F6000C */  jal        ENG_random__Fl
    /* 9E18 80143A10 0A000424 */   addiu     $a0, $zero, 0xA
    /* 9E1C 80143A14 1280033C */  lui        $v1, %hi(currlevel)
    /* 9E20 80143A18 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 9E24 80143A1C 0A000424 */  addiu      $a0, $zero, 0xA
    /* 9E28 80143A20 21186200 */  addu       $v1, $v1, $v0
    /* 9E2C 80143A24 C9F6000C */  jal        ENG_random__Fl
    /* 9E30 80143A28 01007324 */   addiu     $s3, $v1, 0x1
    /* 9E34 80143A2C 1280033C */  lui        $v1, %hi(currlevel)
    /* 9E38 80143A30 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 9E3C 80143A34 00000000 */  nop
    /* 9E40 80143A38 40180300 */  sll        $v1, $v1, 1
    /* 9E44 80143A3C 21186200 */  addu       $v1, $v1, $v0
    /* 9E48 80143A40 01006624 */  addiu      $a2, $v1, 0x1
    /* 9E4C 80143A44 21204002 */  addu       $a0, $s2, $zero
  .L80143A48:
    /* 9E50 80143A48 21286002 */  addu       $a1, $s3, $zero
    /* 9E54 80143A4C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9E58 80143A50 0D80013C */  lui        $at, %hi(missiledata + 0x296)
    /* 9E5C 80143A54 866A22A0 */  sb         $v0, %lo(missiledata + 0x296)($at)
    /* 9E60 80143A58 80101200 */  sll        $v0, $s2, 2
    /* 9E64 80143A5C 21105200 */  addu       $v0, $v0, $s2
    /* 9E68 80143A60 80100200 */  sll        $v0, $v0, 2
    /* 9E6C 80143A64 23105200 */  subu       $v0, $v0, $s2
    /* 9E70 80143A68 80100200 */  sll        $v0, $v0, 2
    /* 9E74 80143A6C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 9E78 80143A70 21082200 */  addu       $at, $at, $v0
    /* 9E7C 80143A74 892C2380 */  lb         $v1, %lo(missile + 0x31)($at)
    /* 9E80 80143A78 21380000 */  addu       $a3, $zero, $zero
    /* 9E84 80143A7C 1000A3AF */  sw         $v1, 0x10($sp)
    /* 9E88 80143A80 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 9E8C 80143A84 21082200 */  addu       $at, $at, $v0
    /* 9E90 80143A88 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* 9E94 80143A8C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9E98 80143A90 1800A0AF */  sw         $zero, 0x18($sp)
    /* 9E9C 80143A94 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9EA0 80143A98 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* 9EA4 80143A9C 1400A3AF */   sw        $v1, 0x14($sp)
    /* 9EA8 80143AA0 80101200 */  sll        $v0, $s2, 2
  .L80143AA4:
    /* 9EAC 80143AA4 21105200 */  addu       $v0, $v0, $s2
    /* 9EB0 80143AA8 80100200 */  sll        $v0, $v0, 2
    /* 9EB4 80143AAC 23105200 */  subu       $v0, $v0, $s2
    /* 9EB8 80143AB0 80100200 */  sll        $v0, $v0, 2
    /* 9EBC 80143AB4 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 9EC0 80143AB8 21082200 */  addu       $at, $at, $v0
    /* 9EC4 80143ABC 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 9EC8 80143AC0 00000000 */  nop
    /* 9ECC 80143AC4 40100300 */  sll        $v0, $v1, 1
    /* 9ED0 80143AC8 21104300 */  addu       $v0, $v0, $v1
    /* 9ED4 80143ACC C0100200 */  sll        $v0, $v0, 3
    /* 9ED8 80143AD0 0D80013C */  lui        $at, %hi(missiledata + 0xE)
    /* 9EDC 80143AD4 21082200 */  addu       $at, $at, $v0
    /* 9EE0 80143AD8 FE6734A0 */  sb         $s4, %lo(missiledata + 0xE)($at)
    /* 9EE4 80143ADC 80101200 */  sll        $v0, $s2, 2
  .L80143AE0:
    /* 9EE8 80143AE0 21105200 */  addu       $v0, $v0, $s2
    /* 9EEC 80143AE4 80100200 */  sll        $v0, $v0, 2
    /* 9EF0 80143AE8 23105200 */  subu       $v0, $v0, $s2
    /* 9EF4 80143AEC 80180200 */  sll        $v1, $v0, 2
    /* 9EF8 80143AF0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 9EFC 80143AF4 21082300 */  addu       $at, $at, $v1
    /* 9F00 80143AF8 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 9F04 80143AFC 00000000 */  nop
    /* 9F08 80143B00 09004014 */  bnez       $v0, .L80143B28
    /* 9F0C 80143B04 01000224 */   addiu     $v0, $zero, 0x1
    /* 9F10 80143B08 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 9F14 80143B0C 21082300 */  addu       $at, $at, $v1
    /* 9F18 80143B10 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 9F1C 80143B14 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 9F20 80143B18 21082300 */  addu       $at, $at, $v1
    /* 9F24 80143B1C 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* 9F28 80143B20 D034010C */  jal        AddUnLight__Fi
    /* 9F2C 80143B24 00000000 */   nop
  .L80143B28:
    /* 9F30 80143B28 D1EA040C */  jal        PutMissile__Fi
    /* 9F34 80143B2C 21204002 */   addu      $a0, $s2, $zero
    /* 9F38 80143B30 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 9F3C 80143B34 3800B48F */  lw         $s4, 0x38($sp)
    /* 9F40 80143B38 3400B38F */  lw         $s3, 0x34($sp)
    /* 9F44 80143B3C 3000B28F */  lw         $s2, 0x30($sp)
    /* 9F48 80143B40 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 9F4C 80143B44 2800B08F */  lw         $s0, 0x28($sp)
    /* 9F50 80143B48 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 9F54 80143B4C 0800E003 */  jr         $ra
    /* 9F58 80143B50 00000000 */   nop
endlabel MI_LArrow__Fi
