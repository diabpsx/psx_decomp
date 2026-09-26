.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Bonespirit__Fi, 0x434

glabel MI_Bonespirit__Fi
    /* 103B4 80149FAC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 103B8 80149FB0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 103BC 80149FB4 21888000 */  addu       $s1, $a0, $zero
    /* 103C0 80149FB8 80101100 */  sll        $v0, $s1, 2
    /* 103C4 80149FBC 21105100 */  addu       $v0, $v0, $s1
    /* 103C8 80149FC0 80100200 */  sll        $v0, $v0, 2
    /* 103CC 80149FC4 23105100 */  subu       $v0, $v0, $s1
    /* 103D0 80149FC8 2000B0AF */  sw         $s0, 0x20($sp)
    /* 103D4 80149FCC 80800200 */  sll        $s0, $v0, 2
    /* 103D8 80149FD0 08000324 */  addiu      $v1, $zero, 0x8
    /* 103DC 80149FD4 3800BFAF */  sw         $ra, 0x38($sp)
    /* 103E0 80149FD8 3400B5AF */  sw         $s5, 0x34($sp)
    /* 103E4 80149FDC 3000B4AF */  sw         $s4, 0x30($sp)
    /* 103E8 80149FE0 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 103EC 80149FE4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 103F0 80149FE8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 103F4 80149FEC 21083000 */  addu       $at, $at, $s0
    /* 103F8 80149FF0 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 103FC 80149FF4 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 10400 80149FF8 21083000 */  addu       $at, $at, $s0
    /* 10404 80149FFC 682C328C */  lw         $s2, %lo(missile + 0x10)($at)
    /* 10408 8014A000 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1040C 8014A004 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10410 8014A008 21083000 */  addu       $at, $at, $s0
    /* 10414 8014A00C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 10418 8014A010 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 1041C 8014A014 21083000 */  addu       $at, $at, $s0
    /* 10420 8014A018 972C2280 */  lb         $v0, %lo(missile + 0x3F)($at)
    /* 10424 8014A01C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 10428 8014A020 21083000 */  addu       $at, $at, $s0
    /* 1042C 8014A024 862C3584 */  lh         $s5, %lo(missile + 0x2E)($at)
    /* 10430 8014A028 1C004314 */  bne        $v0, $v1, .L8014A09C
    /* 10434 8014A02C 00000000 */   nop
    /* 10438 8014A030 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 1043C 8014A034 21083000 */  addu       $at, $at, $s0
    /* 10440 8014A038 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 10444 8014A03C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 10448 8014A040 21083000 */  addu       $at, $at, $s0
    /* 1044C 8014A044 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* 10450 8014A048 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 10454 8014A04C 21083000 */  addu       $at, $at, $s0
    /* 10458 8014A050 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* 1045C 8014A054 F834010C */  jal        ChangeLight__Fiiii
    /* 10460 8014A058 F4030724 */   addiu     $a3, $zero, 0x3F4
    /* 10464 8014A05C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 10468 8014A060 21083000 */  addu       $at, $at, $s0
    /* 1046C 8014A064 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 10470 8014A068 00000000 */  nop
    /* 10474 8014A06C D0004014 */  bnez       $v0, .L8014A3B0
    /* 10478 8014A070 01000224 */   addiu     $v0, $zero, 0x1
    /* 1047C 8014A074 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 10480 8014A078 21083000 */  addu       $at, $at, $s0
    /* 10484 8014A07C 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 10488 8014A080 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 1048C 8014A084 21083000 */  addu       $at, $at, $s0
    /* 10490 8014A088 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* 10494 8014A08C D034010C */  jal        AddUnLight__Fi
    /* 10498 8014A090 00000000 */   nop
    /* 1049C 8014A094 EC280508 */  j          .L8014A3B0
    /* 104A0 8014A098 00000000 */   nop
  .L8014A09C:
    /* 104A4 8014A09C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 104A8 8014A0A0 21083000 */  addu       $at, $at, $s0
    /* 104AC 8014A0A4 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* 104B0 8014A0A8 1080013C */  lui        $at, %hi(missile)
    /* 104B4 8014A0AC 21083000 */  addu       $at, $at, $s0
    /* 104B8 8014A0B0 582C258C */  lw         $a1, %lo(missile)($at)
    /* 104BC 8014A0B4 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 104C0 8014A0B8 21083000 */  addu       $at, $at, $s0
    /* 104C4 8014A0BC 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* 104C8 8014A0C0 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 104CC 8014A0C4 21083000 */  addu       $at, $at, $s0
    /* 104D0 8014A0C8 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* 104D4 8014A0CC 21104500 */  addu       $v0, $v0, $a1
    /* 104D8 8014A0D0 21186600 */  addu       $v1, $v1, $a2
    /* 104DC 8014A0D4 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 104E0 8014A0D8 21083000 */  addu       $at, $at, $s0
    /* 104E4 8014A0DC 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* 104E8 8014A0E0 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 104EC 8014A0E4 21083000 */  addu       $at, $at, $s0
    /* 104F0 8014A0E8 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* 104F4 8014A0EC 68EB040C */  jal        GetMissilePos__Fi
    /* 104F8 8014A0F0 21202002 */   addu      $a0, $s1, $zero
    /* 104FC 8014A0F4 21202002 */  addu       $a0, $s1, $zero
    /* 10500 8014A0F8 21284002 */  addu       $a1, $s2, $zero
    /* 10504 8014A0FC 2130A000 */  addu       $a2, $a1, $zero
    /* 10508 8014A100 21380000 */  addu       $a3, $zero, $zero
    /* 1050C 8014A104 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 10510 8014A108 21083000 */  addu       $at, $at, $s0
    /* 10514 8014A10C 892C3380 */  lb         $s3, %lo(missile + 0x31)($at)
    /* 10518 8014A110 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 1051C 8014A114 21083000 */  addu       $at, $at, $s0
    /* 10520 8014A118 8A2C3480 */  lb         $s4, %lo(missile + 0x32)($at)
    /* 10524 8014A11C 01000224 */  addiu      $v0, $zero, 0x1
    /* 10528 8014A120 1800A0AF */  sw         $zero, 0x18($sp)
    /* 1052C 8014A124 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 10530 8014A128 1000B3AF */  sw         $s3, 0x10($sp)
    /* 10534 8014A12C 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* 10538 8014A130 1400B4AF */   sw        $s4, 0x14($sp)
    /* 1053C 8014A134 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 10540 8014A138 21083000 */  addu       $at, $at, $s0
    /* 10544 8014A13C 7A2C2284 */  lh         $v0, %lo(missile + 0x22)($at)
    /* 10548 8014A140 00000000 */  nop
    /* 1054C 8014A144 12004014 */  bnez       $v0, .L8014A190
    /* 10550 8014A148 80101100 */   sll       $v0, $s1, 2
    /* 10554 8014A14C 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 10558 8014A150 21083000 */  addu       $at, $at, $s0
    /* 1055C 8014A154 7C2C2284 */  lh         $v0, %lo(missile + 0x24)($at)
    /* 10560 8014A158 00000000 */  nop
    /* 10564 8014A15C 0C006216 */  bne        $s3, $v0, .L8014A190
    /* 10568 8014A160 80101100 */   sll       $v0, $s1, 2
    /* 1056C 8014A164 1080013C */  lui        $at, %hi(missile + 0x26)
    /* 10570 8014A168 21083000 */  addu       $at, $at, $s0
    /* 10574 8014A16C 7E2C2284 */  lh         $v0, %lo(missile + 0x26)($at)
    /* 10578 8014A170 00000000 */  nop
    /* 1057C 8014A174 06008216 */  bne        $s4, $v0, .L8014A190
    /* 10580 8014A178 80101100 */   sll       $v0, $s1, 2
    /* 10584 8014A17C 01000224 */  addiu      $v0, $zero, 0x1
    /* 10588 8014A180 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 1058C 8014A184 21083000 */  addu       $at, $at, $s0
    /* 10590 8014A188 7A2C22A4 */  sh         $v0, %lo(missile + 0x22)($at)
    /* 10594 8014A18C 80101100 */  sll        $v0, $s1, 2
  .L8014A190:
    /* 10598 8014A190 21105100 */  addu       $v0, $v0, $s1
    /* 1059C 8014A194 80100200 */  sll        $v0, $v0, 2
    /* 105A0 8014A198 23105100 */  subu       $v0, $v0, $s1
    /* 105A4 8014A19C 80900200 */  sll        $s2, $v0, 2
    /* 105A8 8014A1A0 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 105AC 8014A1A4 21083200 */  addu       $at, $at, $s2
    /* 105B0 8014A1A8 7A2C2384 */  lh         $v1, %lo(missile + 0x22)($at)
    /* 105B4 8014A1AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 105B8 8014A1B0 52006214 */  bne        $v1, $v0, .L8014A2FC
    /* 105BC 8014A1B4 80101100 */   sll       $v0, $s1, 2
    /* 105C0 8014A1B8 21206002 */  addu       $a0, $s3, $zero
    /* 105C4 8014A1BC 21288002 */  addu       $a1, $s4, $zero
    /* 105C8 8014A1C0 02000224 */  addiu      $v0, $zero, 0x2
    /* 105CC 8014A1C4 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 105D0 8014A1C8 21083200 */  addu       $at, $at, $s2
    /* 105D4 8014A1CC 7A2C22A4 */  sh         $v0, %lo(missile + 0x22)($at)
    /* 105D8 8014A1D0 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 105DC 8014A1D4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 105E0 8014A1D8 21083200 */  addu       $at, $at, $s2
    /* 105E4 8014A1DC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 105E8 8014A1E0 ACE8040C */  jal        FindClosest__Fiii
    /* 105EC 8014A1E4 13000624 */   addiu     $a2, $zero, 0x13
    /* 105F0 8014A1E8 24004018 */  blez       $v0, .L8014A27C
    /* 105F4 8014A1EC 40800200 */   sll       $s0, $v0, 1
    /* 105F8 8014A1F0 21800202 */  addu       $s0, $s0, $v0
    /* 105FC 8014A1F4 80801000 */  sll        $s0, $s0, 2
    /* 10600 8014A1F8 21800202 */  addu       $s0, $s0, $v0
    /* 10604 8014A1FC C0801000 */  sll        $s0, $s0, 3
    /* 10608 8014A200 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1060C 8014A204 21083000 */  addu       $at, $at, $s0
    /* 10610 8014A208 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 10614 8014A20C 21206002 */  addu       $a0, $s3, $zero
    /* 10618 8014A210 C3110200 */  sra        $v0, $v0, 7
    /* 1061C 8014A214 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 10620 8014A218 21083200 */  addu       $at, $at, $s2
    /* 10624 8014A21C 682C22AC */  sw         $v0, %lo(missile + 0x10)($at)
    /* 10628 8014A220 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1062C 8014A224 21083000 */  addu       $at, $at, $s0
    /* 10630 8014A228 C8532680 */  lb         $a2, %lo(monster + 0x34)($at)
    /* 10634 8014A22C 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 10638 8014A230 21083000 */  addu       $at, $at, $s0
    /* 1063C 8014A234 C9532780 */  lb         $a3, %lo(monster + 0x35)($at)
    /* 10640 8014A238 2CE9040C */  jal        GetDirection8__Fiiii
    /* 10644 8014A23C 21288002 */   addu      $a1, $s4, $zero
    /* 10648 8014A240 21202002 */  addu       $a0, $s1, $zero
    /* 1064C 8014A244 09F5040C */  jal        SetMissDir__Fii
    /* 10650 8014A248 21284000 */   addu      $a1, $v0, $zero
    /* 10654 8014A24C 21202002 */  addu       $a0, $s1, $zero
    /* 10658 8014A250 21286002 */  addu       $a1, $s3, $zero
    /* 1065C 8014A254 21308002 */  addu       $a2, $s4, $zero
    /* 10660 8014A258 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 10664 8014A25C 21083000 */  addu       $at, $at, $s0
    /* 10668 8014A260 C8532780 */  lb         $a3, %lo(monster + 0x34)($at)
    /* 1066C 8014A264 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 10670 8014A268 21083000 */  addu       $at, $at, $s0
    /* 10674 8014A26C C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 10678 8014A270 10000224 */  addiu      $v0, $zero, 0x10
    /* 1067C 8014A274 BC280508 */  j          .L8014A2F0
    /* 10680 8014A278 1400A2AF */   sw        $v0, 0x14($sp)
  .L8014A27C:
    /* 10684 8014A27C 40101500 */  sll        $v0, $s5, 1
    /* 10688 8014A280 21105500 */  addu       $v0, $v0, $s5
    /* 1068C 8014A284 80100200 */  sll        $v0, $v0, 2
    /* 10690 8014A288 21105500 */  addu       $v0, $v0, $s5
    /* 10694 8014A28C 00110200 */  sll        $v0, $v0, 4
    /* 10698 8014A290 23105500 */  subu       $v0, $v0, $s5
    /* 1069C 8014A294 80100200 */  sll        $v0, $v0, 2
    /* 106A0 8014A298 21105500 */  addu       $v0, $v0, $s5
    /* 106A4 8014A29C C0100200 */  sll        $v0, $v0, 3
    /* 106A8 8014A2A0 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 106AC 8014A2A4 21082200 */  addu       $at, $at, $v0
    /* 106B0 8014A2A8 7AA53080 */  lb         $s0, %lo(plr + 0x42)($at)
    /* 106B4 8014A2AC 21202002 */  addu       $a0, $s1, $zero
    /* 106B8 8014A2B0 09F5040C */  jal        SetMissDir__Fii
    /* 106BC 8014A2B4 21280002 */   addu      $a1, $s0, $zero
    /* 106C0 8014A2B8 21202002 */  addu       $a0, $s1, $zero
    /* 106C4 8014A2BC 21286002 */  addu       $a1, $s3, $zero
    /* 106C8 8014A2C0 21308002 */  addu       $a2, $s4, $zero
    /* 106CC 8014A2C4 80101000 */  sll        $v0, $s0, 2
    /* 106D0 8014A2C8 1080013C */  lui        $at, %hi(XDirAdd)
    /* 106D4 8014A2CC 21082200 */  addu       $at, $at, $v0
    /* 106D8 8014A2D0 D829278C */  lw         $a3, %lo(XDirAdd)($at)
    /* 106DC 8014A2D4 1080013C */  lui        $at, %hi(YDirAdd)
    /* 106E0 8014A2D8 21082200 */  addu       $at, $at, $v0
    /* 106E4 8014A2DC F829238C */  lw         $v1, %lo(YDirAdd)($at)
    /* 106E8 8014A2E0 10000224 */  addiu      $v0, $zero, 0x10
    /* 106EC 8014A2E4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 106F0 8014A2E8 21386702 */  addu       $a3, $s3, $a3
    /* 106F4 8014A2EC 21188302 */  addu       $v1, $s4, $v1
  .L8014A2F0:
    /* 106F8 8014A2F0 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 106FC 8014A2F4 1000A3AF */   sw        $v1, 0x10($sp)
    /* 10700 8014A2F8 80101100 */  sll        $v0, $s1, 2
  .L8014A2FC:
    /* 10704 8014A2FC 21105100 */  addu       $v0, $v0, $s1
    /* 10708 8014A300 80100200 */  sll        $v0, $v0, 2
    /* 1070C 8014A304 23105100 */  subu       $v0, $v0, $s1
    /* 10710 8014A308 80180200 */  sll        $v1, $v0, 2
    /* 10714 8014A30C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 10718 8014A310 21082300 */  addu       $at, $at, $v1
    /* 1071C 8014A314 762C2284 */  lh         $v0, %lo(missile + 0x1E)($at)
    /* 10720 8014A318 00000000 */  nop
    /* 10724 8014A31C 07006216 */  bne        $s3, $v0, .L8014A33C
    /* 10728 8014A320 21286002 */   addu      $a1, $s3, $zero
    /* 1072C 8014A324 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 10730 8014A328 21082300 */  addu       $at, $at, $v1
    /* 10734 8014A32C 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* 10738 8014A330 00000000 */  nop
    /* 1073C 8014A334 0E008212 */  beq        $s4, $v0, .L8014A370
    /* 10740 8014A338 80101100 */   sll       $v0, $s1, 2
  .L8014A33C:
    /* 10744 8014A33C 21308002 */  addu       $a2, $s4, $zero
    /* 10748 8014A340 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 1074C 8014A344 21082300 */  addu       $at, $at, $v1
    /* 10750 8014A348 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* 10754 8014A34C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 10758 8014A350 21082300 */  addu       $at, $at, $v1
    /* 1075C 8014A354 762C25A4 */  sh         $a1, %lo(missile + 0x1E)($at)
    /* 10760 8014A358 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 10764 8014A35C 21082300 */  addu       $at, $at, $v1
    /* 10768 8014A360 782C26A4 */  sh         $a2, %lo(missile + 0x20)($at)
    /* 1076C 8014A364 F834010C */  jal        ChangeLight__Fiiii
    /* 10770 8014A368 F4030724 */   addiu     $a3, $zero, 0x3F4
    /* 10774 8014A36C 80101100 */  sll        $v0, $s1, 2
  .L8014A370:
    /* 10778 8014A370 21105100 */  addu       $v0, $v0, $s1
    /* 1077C 8014A374 80100200 */  sll        $v0, $v0, 2
    /* 10780 8014A378 23105100 */  subu       $v0, $v0, $s1
    /* 10784 8014A37C 80800200 */  sll        $s0, $v0, 2
    /* 10788 8014A380 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 1078C 8014A384 21083000 */  addu       $at, $at, $s0
    /* 10790 8014A388 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* 10794 8014A38C 00000000 */  nop
    /* 10798 8014A390 07004014 */  bnez       $v0, .L8014A3B0
    /* 1079C 8014A394 21202002 */   addu      $a0, $s1, $zero
    /* 107A0 8014A398 09F5040C */  jal        SetMissDir__Fii
    /* 107A4 8014A39C 08000524 */   addiu     $a1, $zero, 0x8
    /* 107A8 8014A3A0 07000224 */  addiu      $v0, $zero, 0x7
    /* 107AC 8014A3A4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 107B0 8014A3A8 21083000 */  addu       $at, $at, $s0
    /* 107B4 8014A3AC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
  .L8014A3B0:
    /* 107B8 8014A3B0 D1EA040C */  jal        PutMissile__Fi
    /* 107BC 8014A3B4 21202002 */   addu      $a0, $s1, $zero
    /* 107C0 8014A3B8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 107C4 8014A3BC 3400B58F */  lw         $s5, 0x34($sp)
    /* 107C8 8014A3C0 3000B48F */  lw         $s4, 0x30($sp)
    /* 107CC 8014A3C4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 107D0 8014A3C8 2800B28F */  lw         $s2, 0x28($sp)
    /* 107D4 8014A3CC 2400B18F */  lw         $s1, 0x24($sp)
    /* 107D8 8014A3D0 2000B08F */  lw         $s0, 0x20($sp)
    /* 107DC 8014A3D4 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 107E0 8014A3D8 0800E003 */  jr         $ra
    /* 107E4 8014A3DC 00000000 */   nop
endlabel MI_Bonespirit__Fi
