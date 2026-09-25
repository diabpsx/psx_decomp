.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ProcessLightList__Fv, 0x118

glabel ProcessLightList__Fv
    /* 3D434 8004D434 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 3D438 8004D438 2800BFAF */  sw         $ra, 0x28($sp)
    /* 3D43C 8004D43C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 3D440 8004D440 BD32010C */  jal        DoUnLight__Fv
    /* 3D444 8004D444 2000B0AF */   sw        $s0, 0x20($sp)
    /* 3D448 8004D448 9411828F */  lw         $v0, %gp_rel(numlights)($gp)
    /* 3D44C 8004D44C 00000000 */  nop
    /* 3D450 8004D450 17004018 */  blez       $v0, .L8004D4B0
    /* 3D454 8004D454 21800000 */   addu      $s0, $zero, $zero
    /* 3D458 8004D458 0D80113C */  lui        $s1, %hi(LightList)
    /* 3D45C 8004D45C 00633126 */  addiu      $s1, $s1, %lo(LightList)
  .L8004D460:
    /* 3D460 8004D460 0D80013C */  lui        $at, %hi(lightactive)
    /* 3D464 8004D464 21083000 */  addu       $at, $at, $s0
    /* 3D468 8004D468 80652790 */  lbu        $a3, %lo(lightactive)($at)
    /* 3D46C 8004D46C 00000000 */  nop
    /* 3D470 8004D470 C0100700 */  sll        $v0, $a3, 3
    /* 3D474 8004D474 21185100 */  addu       $v1, $v0, $s1
    /* 3D478 8004D478 05006290 */  lbu        $v0, 0x5($v1)
    /* 3D47C 8004D47C 00000000 */  nop
    /* 3D480 8004D480 06004014 */  bnez       $v0, .L8004D49C
    /* 3D484 8004D484 00000000 */   nop
    /* 3D488 8004D488 00006480 */  lb         $a0, 0x0($v1)
    /* 3D48C 8004D48C 01006580 */  lb         $a1, 0x1($v1)
    /* 3D490 8004D490 02006694 */  lhu        $a2, 0x2($v1)
    /* 3D494 8004D494 882F010C */  jal        DoLighting__Fiiii
    /* 3D498 8004D498 00000000 */   nop
  .L8004D49C:
    /* 3D49C 8004D49C 9411828F */  lw         $v0, %gp_rel(numlights)($gp)
    /* 3D4A0 8004D4A0 01001026 */  addiu      $s0, $s0, 0x1
    /* 3D4A4 8004D4A4 2A100202 */  slt        $v0, $s0, $v0
    /* 3D4A8 8004D4A8 EDFF4014 */  bnez       $v0, .L8004D460
    /* 3D4AC 8004D4AC 00000000 */   nop
  .L8004D4B0:
    /* 3D4B0 8004D4B0 9411848F */  lw         $a0, %gp_rel(numlights)($gp)
    /* 3D4B4 8004D4B4 00000000 */  nop
    /* 3D4B8 8004D4B8 1E008018 */  blez       $a0, .L8004D534
    /* 3D4BC 8004D4BC 21800000 */   addu      $s0, $zero, $zero
    /* 3D4C0 8004D4C0 0D80083C */  lui        $t0, %hi(LightList)
    /* 3D4C4 8004D4C4 00630825 */  addiu      $t0, $t0, %lo(LightList)
    /* 3D4C8 8004D4C8 0D80053C */  lui        $a1, %hi(lightactive)
    /* 3D4CC 8004D4CC 8065A524 */  addiu      $a1, $a1, %lo(lightactive)
    /* 3D4D0 8004D4D0 2130A000 */  addu       $a2, $a1, $zero
  .L8004D4D4:
    /* 3D4D4 8004D4D4 0000A790 */  lbu        $a3, 0x0($a1)
    /* 3D4D8 8004D4D8 00000000 */  nop
    /* 3D4DC 8004D4DC C0100700 */  sll        $v0, $a3, 3
    /* 3D4E0 8004D4E0 21184800 */  addu       $v1, $v0, $t0
    /* 3D4E4 8004D4E4 05006290 */  lbu        $v0, 0x5($v1)
    /* 3D4E8 8004D4E8 00000000 */  nop
    /* 3D4EC 8004D4EC 0A004010 */  beqz       $v0, .L8004D518
    /* 3D4F0 8004D4F0 FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 3D4F4 8004D4F4 941182AF */  sw         $v0, %gp_rel(numlights)($gp)
    /* 3D4F8 8004D4F8 0D80013C */  lui        $at, %hi(lightactive)
    /* 3D4FC 8004D4FC 21082200 */  addu       $at, $at, $v0
    /* 3D500 8004D500 80652490 */  lbu        $a0, %lo(lightactive)($at)
    /* 3D504 8004D504 0000A390 */  lbu        $v1, 0x0($a1)
    /* 3D508 8004D508 21104600 */  addu       $v0, $v0, $a2
    /* 3D50C 8004D50C 000043A0 */  sb         $v1, 0x0($v0)
    /* 3D510 8004D510 48350108 */  j          .L8004D520
    /* 3D514 8004D514 0000A4A0 */   sb        $a0, 0x0($a1)
  .L8004D518:
    /* 3D518 8004D518 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3D51C 8004D51C 01001026 */  addiu      $s0, $s0, 0x1
  .L8004D520:
    /* 3D520 8004D520 9411848F */  lw         $a0, %gp_rel(numlights)($gp)
    /* 3D524 8004D524 00000000 */  nop
    /* 3D528 8004D528 2A100402 */  slt        $v0, $s0, $a0
    /* 3D52C 8004D52C E9FF4014 */  bnez       $v0, .L8004D4D4
    /* 3D530 8004D530 00000000 */   nop
  .L8004D534:
    /* 3D534 8004D534 2800BF8F */  lw         $ra, 0x28($sp)
    /* 3D538 8004D538 2400B18F */  lw         $s1, 0x24($sp)
    /* 3D53C 8004D53C 2000B08F */  lw         $s0, 0x20($sp)
    /* 3D540 8004D540 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 3D544 8004D544 0800E003 */  jr         $ra
    /* 3D548 8004D548 00000000 */   nop
endlabel ProcessLightList__Fv
