.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_LArrow__Fi, 0x2A8

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
    /* 97B8 801433B0 06016210 */  beq        $v1, $v0, D_801437CC
    /* 97BC 801433B4 05000224 */   addiu     $v0, $zero, 0x5
    /* 97C0 801433B8 05016210 */  beq        $v1, $v0, D_801437D0
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
    /* 9958 80143550 27006210 */  beq        $v1, $v0, D_801435F0
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
    /* 99E8 801435E0 0D80013C */  lui        $at, (0x800D0000 >> 16)
    /* 99EC 801435E4 21082200 */  addu       $at, $at, $v0
endlabel MI_LArrow__Fi
