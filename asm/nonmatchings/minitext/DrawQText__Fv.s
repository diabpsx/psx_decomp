.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawQText__Fv, 0x5AC

glabel DrawQText__Fv
    /* 3E390 8004E390 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 3E394 8004E394 0D80043C */  lui        $a0, %hi(tempstr)
    /* 3E398 8004E398 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 3E39C 8004E39C 21280000 */  addu       $a1, $zero, $zero
    /* 3E3A0 8004E3A0 00010624 */  addiu      $a2, $zero, 0x100
    /* 3E3A4 8004E3A4 6400BFAF */  sw         $ra, 0x64($sp)
    /* 3E3A8 8004E3A8 6000BEAF */  sw         $fp, 0x60($sp)
    /* 3E3AC 8004E3AC 5C00B7AF */  sw         $s7, 0x5C($sp)
    /* 3E3B0 8004E3B0 5800B6AF */  sw         $s6, 0x58($sp)
    /* 3E3B4 8004E3B4 5400B5AF */  sw         $s5, 0x54($sp)
    /* 3E3B8 8004E3B8 5000B4AF */  sw         $s4, 0x50($sp)
    /* 3E3BC 8004E3BC 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 3E3C0 8004E3C0 4800B2AF */  sw         $s2, 0x48($sp)
    /* 3E3C4 8004E3C4 4400B1AF */  sw         $s1, 0x44($sp)
    /* 3E3C8 8004E3C8 E940000C */  jal        memset
    /* 3E3CC 8004E3CC 4000B0AF */   sw        $s0, 0x40($sp)
    /* 3E3D0 8004E3D0 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3E3D4 8004E3D4 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3E3D8 8004E3D8 00000000 */  nop
    /* 3E3DC 8004E3DC 08004014 */  bnez       $v0, .L8004E400
    /* 3E3E0 8004E3E0 14000224 */   addiu     $v0, $zero, 0x14
    /* 3E3E4 8004E3E4 2800A2A7 */  sh         $v0, 0x28($sp)
    /* 3E3E8 8004E3E8 18000224 */  addiu      $v0, $zero, 0x18
    /* 3E3EC 8004E3EC 2A00A2A7 */  sh         $v0, 0x2A($sp)
    /* 3E3F0 8004E3F0 18010224 */  addiu      $v0, $zero, 0x118
    /* 3E3F4 8004E3F4 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 3E3F8 8004E3F8 06390108 */  j          .L8004E418
    /* 3E3FC 8004E3FC B9000224 */   addiu     $v0, $zero, 0xB9
  .L8004E400:
    /* 3E400 8004E400 2800A2A7 */  sh         $v0, 0x28($sp)
    /* 3E404 8004E404 40000224 */  addiu      $v0, $zero, 0x40
    /* 3E408 8004E408 2A00A2A7 */  sh         $v0, 0x2A($sp)
    /* 3E40C 8004E40C 18010224 */  addiu      $v0, $zero, 0x118
    /* 3E410 8004E410 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 3E414 8004E414 91000224 */  addiu      $v0, $zero, 0x91
  .L8004E418:
    /* 3E418 8004E418 973A010C */  jal        GetOverlayOtBase__7CBlocks_8004ea5c
    /* 3E41C 8004E41C 2E00A2A7 */   sh        $v0, 0x2E($sp)
    /* 3E420 8004E420 0D80113C */  lui        $s1, %hi(QBack)
    /* 3E424 8004E424 90673126 */  addiu      $s1, $s1, %lo(QBack)
    /* 3E428 8004E428 21202002 */  addu       $a0, $s1, $zero
    /* 3E42C 8004E42C 21804000 */  addu       $s0, $v0, $zero
    /* 3E430 8004E430 8A34020C */  jal        SetOTpos__6Dialogi
    /* 3E434 8004E434 FFFF0526 */   addiu     $a1, $s0, -0x1
    /* 3E438 8004E438 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 3E43C 8004E43C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 3E440 8004E440 21280002 */  addu       $a1, $s0, $zero
    /* 3E444 8004E444 E82A020C */  jal        SetOTpos__5CFonti
    /* 3E448 8004E448 21804000 */   addu      $s0, $v0, $zero
    /* 3E44C 8004E44C B337010C */  jal        DrawQTextBack__Fv
    /* 3E450 8004E450 3000A2AF */   sw        $v0, 0x30($sp)
    /* 3E454 8004E454 21202002 */  addu       $a0, $s1, $zero
    /* 3E458 8004E458 8A34020C */  jal        SetOTpos__6Dialogi
    /* 3E45C 8004E45C 21280002 */   addu      $a1, $s0, $zero
    /* 3E460 8004E460 9020828F */  lw         $v0, %gp_rel(D_8011C810)($gp)
    /* 3E464 8004E464 00000000 */  nop
    /* 3E468 8004E468 27014010 */  beqz       $v0, .L8004E908
    /* 3E46C 8004E46C 00000000 */   nop
    /* 3E470 8004E470 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 3E474 8004E474 00000000 */   nop
    /* 3E478 8004E478 01004238 */  xori       $v0, $v0, 0x1
    /* 3E47C 8004E47C 22014014 */  bnez       $v0, .L8004E908
    /* 3E480 8004E480 21F00000 */   addu      $fp, $zero, $zero
    /* 3E484 8004E484 21B80000 */  addu       $s7, $zero, $zero
    /* 3E488 8004E488 9020918F */  lw         $s1, %gp_rel(D_8011C810)($gp)
    /* 3E48C 8004E48C 9420968F */  lw         $s6, %gp_rel(D_8011C814)($gp)
  .L8004E490:
    /* 3E490 8004E490 FF00E232 */  andi       $v0, $s7, 0xFF
  .L8004E494:
    /* 3E494 8004E494 5E004014 */  bnez       $v0, .L8004E610
    /* 3E498 8004E498 21900000 */   addu      $s2, $zero, $zero
    /* 3E49C 8004E49C 21A80000 */  addu       $s5, $zero, $zero
    /* 3E4A0 8004E4A0 21980000 */  addu       $s3, $zero, $zero
    /* 3E4A4 8004E4A4 21A00000 */  addu       $s4, $zero, $zero
    /* 3E4A8 8004E4A8 0D80103C */  lui        $s0, %hi(tempstr)
    /* 3E4AC 8004E4AC 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
  .L8004E4B0:
    /* 3E4B0 8004E4B0 00002282 */  lb         $v0, 0x0($s1)
    /* 3E4B4 8004E4B4 0A000A24 */  addiu      $t2, $zero, 0xA
    /* 3E4B8 8004E4B8 1B004A10 */  beq        $v0, $t2, .L8004E528
    /* 3E4BC 8004E4BC 21184000 */   addu      $v1, $v0, $zero
    /* 3E4C0 8004E4C0 19004010 */  beqz       $v0, .L8004E528
    /* 3E4C4 8004E4C4 FF006530 */   andi      $a1, $v1, 0xFF
    /* 3E4C8 8004E4C8 01003126 */  addiu      $s1, $s1, 0x1
    /* 3E4CC 8004E4CC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 3E4D0 8004E4D0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 3E4D4 8004E4D4 EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 3E4D8 8004E4D8 000003A2 */   sb        $v1, 0x0($s0)
    /* 3E4DC 8004E4DC 21904202 */  addu       $s2, $s2, $v0
    /* 3E4E0 8004E4E0 00000382 */  lb         $v1, 0x0($s0)
    /* 3E4E4 8004E4E4 20000224 */  addiu      $v0, $zero, 0x20
    /* 3E4E8 8004E4E8 03006214 */  bne        $v1, $v0, .L8004E4F8
    /* 3E4EC 8004E4EC 80006230 */   andi      $v0, $v1, 0x80
    /* 3E4F0 8004E4F0 FFFF3526 */  addiu      $s5, $s1, -0x1
    /* 3E4F4 8004E4F4 21980000 */  addu       $s3, $zero, $zero
  .L8004E4F8:
    /* 3E4F8 8004E4F8 07004010 */  beqz       $v0, .L8004E518
    /* 3E4FC 8004E4FC 00000000 */   nop
    /* 3E500 8004E500 02009426 */  addiu      $s4, $s4, 0x2
    /* 3E504 8004E504 01001026 */  addiu      $s0, $s0, 0x1
    /* 3E508 8004E508 00002292 */  lbu        $v0, 0x0($s1)
    /* 3E50C 8004E50C 01003126 */  addiu      $s1, $s1, 0x1
    /* 3E510 8004E510 47390108 */  j          .L8004E51C
    /* 3E514 8004E514 000002A2 */   sb        $v0, 0x0($s0)
  .L8004E518:
    /* 3E518 8004E518 01007326 */  addiu      $s3, $s3, 0x1
  .L8004E51C:
    /* 3E51C 8004E51C 1801422A */  slti       $v0, $s2, 0x118
    /* 3E520 8004E520 E3FF4014 */  bnez       $v0, .L8004E4B0
    /* 3E524 8004E524 01001026 */   addiu     $s0, $s0, 0x1
  .L8004E528:
    /* 3E528 8004E528 1801422A */  slti       $v0, $s2, 0x118
    /* 3E52C 8004E52C 06004014 */  bnez       $v0, .L8004E548
    /* 3E530 8004E530 00000000 */   nop
    /* 3E534 8004E534 0400A012 */  beqz       $s5, .L8004E548
    /* 3E538 8004E538 00000000 */   nop
    /* 3E53C 8004E53C 2188A002 */  addu       $s1, $s5, $zero
    /* 3E540 8004E540 23801302 */  subu       $s0, $s0, $s3
    /* 3E544 8004E544 23801402 */  subu       $s0, $s0, $s4
  .L8004E548:
    /* 3E548 8004E548 00002282 */  lb         $v0, 0x0($s1)
    /* 3E54C 8004E54C 0A000A24 */  addiu      $t2, $zero, 0xA
    /* 3E550 8004E550 03004A14 */  bne        $v0, $t2, .L8004E560
    /* 3E554 8004E554 00000000 */   nop
    /* 3E558 8004E558 01003126 */  addiu      $s1, $s1, 0x1
    /* 3E55C 8004E55C 00002282 */  lb         $v0, 0x0($s1)
  .L8004E560:
    /* 3E560 8004E560 00000000 */  nop
    /* 3E564 8004E564 02004014 */  bnez       $v0, .L8004E570
    /* 3E568 8004E568 00000000 */   nop
    /* 3E56C 8004E56C 01001724 */  addiu      $s7, $zero, 0x1
  .L8004E570:
    /* 3E570 8004E570 0D80043C */  lui        $a0, %hi(tempstr)
    /* 3E574 8004E574 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 3E578 8004E578 D438010C */  jal        KANJI_strlen__FPc
    /* 3E57C 8004E57C 000000A2 */   sb        $zero, 0x0($s0)
    /* 3E580 8004E580 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3E584 8004E584 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3E588 8004E588 00000000 */  nop
    /* 3E58C 8004E58C 05004010 */  beqz       $v0, .L8004E5A4
    /* 3E590 8004E590 10000524 */   addiu     $a1, $zero, 0x10
    /* 3E594 8004E594 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 3E598 8004E598 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 3E59C 8004E59C 6C390108 */  j          .L8004E5B0
    /* 3E5A0 8004E5A0 BAFFC626 */   addiu     $a2, $s6, -0x46
  .L8004E5A4:
    /* 3E5A4 8004E5A4 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 3E5A8 8004E5A8 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 3E5AC 8004E5AC E2FFC626 */  addiu      $a2, $s6, -0x1E
  .L8004E5B0:
    /* 3E5B0 8004E5B0 0D80073C */  lui        $a3, %hi(tempstr)
    /* 3E5B4 8004E5B4 10EAE724 */  addiu      $a3, $a3, %lo(tempstr)
    /* 3E5B8 8004E5B8 1280033C */  lui        $v1, %hi(BORDERR)
    /* 3E5BC 8004E5BC F7AB6390 */  lbu        $v1, %lo(BORDERR)($v1)
    /* 3E5C0 8004E5C0 1280083C */  lui        $t0, %hi(BORDERG)
    /* 3E5C4 8004E5C4 F8AB0891 */  lbu        $t0, %lo(BORDERG)($t0)
    /* 3E5C8 8004E5C8 1280093C */  lui        $t1, %hi(BORDERB)
    /* 3E5CC 8004E5CC F9AB2991 */  lbu        $t1, %lo(BORDERB)($t1)
    /* 3E5D0 8004E5D0 2800A227 */  addiu      $v0, $sp, 0x28
    /* 3E5D4 8004E5D4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3E5D8 8004E5D8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 3E5DC 8004E5DC 1800A3AF */  sw         $v1, 0x18($sp)
    /* 3E5E0 8004E5E0 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 3E5E4 8004E5E4 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 3E5E8 8004E5E8 2000A9AF */   sw        $t1, 0x20($sp)
    /* 3E5EC 8004E5EC 0200C017 */  bnez       $fp, .L8004E5F8
    /* 3E5F0 8004E5F0 00000000 */   nop
    /* 3E5F4 8004E5F4 21F02002 */  addu       $fp, $s1, $zero
  .L8004E5F8:
    /* 3E5F8 8004E5F8 0F00D626 */  addiu      $s6, $s6, 0xF
    /* 3E5FC 8004E5FC E700C22A */  slti       $v0, $s6, 0xE7
    /* 3E600 8004E600 A4FF4014 */  bnez       $v0, .L8004E494
    /* 3E604 8004E604 FF00E232 */   andi      $v0, $s7, 0xFF
    /* 3E608 8004E608 24390108 */  j          .L8004E490
    /* 3E60C 8004E60C 01001724 */   addiu     $s7, $zero, 0x1
  .L8004E610:
    /* 3E610 8004E610 1280033C */  lui        $v1, %hi(FileSYS)
    /* 3E614 8004E614 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 3E618 8004E618 02000224 */  addiu      $v0, $zero, 0x2
    /* 3E61C 8004E61C 57006214 */  bne        $v1, $v0, .L8004E77C
    /* 3E620 8004E620 00000000 */   nop
    /* 3E624 8004E624 1280023C */  lui        $v0, %hi(sghStream)
    /* 3E628 8004E628 34B8428C */  lw         $v0, %lo(sghStream)($v0)
    /* 3E62C 8004E62C 00000000 */  nop
    /* 3E630 8004E630 24004014 */  bnez       $v0, .L8004E6C4
    /* 3E634 8004E634 00000000 */   nop
    /* 3E638 8004E638 9420838F */  lw         $v1, %gp_rel(D_8011C814)($gp)
    /* 3E63C 8004E63C DC11828F */  lw         $v0, %gp_rel(TextWait)($gp)
    /* 3E640 8004E640 00000000 */  nop
    /* 3E644 8004E644 2A104300 */  slt        $v0, $v0, $v1
    /* 3E648 8004E648 19004010 */  beqz       $v0, .L8004E6B0
    /* 3E64C 8004E64C 00000000 */   nop
    /* 3E650 8004E650 3E10020C */  jal        VID_GetTick__Fv
    /* 3E654 8004E654 00000000 */   nop
    /* 3E658 8004E658 21204000 */  addu       $a0, $v0, $zero
    /* 3E65C 8004E65C A020828F */  lw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E660 8004E660 FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
    /* 3E664 8004E664 21104300 */  addu       $v0, $v0, $v1
    /* 3E668 8004E668 DC11838F */  lw         $v1, %gp_rel(TextWait)($gp)
    /* 3E66C 8004E66C 9C2084AF */  sw         $a0, %gp_rel(D_8011C81C)($gp)
    /* 3E670 8004E670 A02082AF */  sw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E674 8004E674 02140200 */  srl        $v0, $v0, 16
    /* 3E678 8004E678 942082AF */  sw         $v0, %gp_rel(D_8011C814)($gp)
    /* 3E67C 8004E67C 2A186200 */  slt        $v1, $v1, $v0
    /* 3E680 8004E680 0B006014 */  bnez       $v1, .L8004E6B0
    /* 3E684 8004E684 00000000 */   nop
    /* 3E688 8004E688 A420838F */  lw         $v1, %gp_rel(D_8011C824)($gp)
    /* 3E68C 8004E68C 00000000 */  nop
    /* 3E690 8004E690 40100300 */  sll        $v0, $v1, 1
    /* 3E694 8004E694 21104300 */  addu       $v0, $v0, $v1
    /* 3E698 8004E698 80100200 */  sll        $v0, $v0, 2
    /* 3E69C 8004E69C 1180013C */  lui        $at, %hi(alltext + 0x8)
    /* 3E6A0 8004E6A0 21082200 */  addu       $at, $at, $v0
    /* 3E6A4 8004E6A4 287C248C */  lw         $a0, %lo(alltext + 0x8)($at)
    /* 3E6A8 8004E6A8 C6F5000C */  jal        PlaySFX__Fi
    /* 3E6AC 8004E6AC 00000000 */   nop
  .L8004E6B0:
    /* 3E6B0 8004E6B0 1280023C */  lui        $v0, %hi(sghStream)
    /* 3E6B4 8004E6B4 34B8428C */  lw         $v0, %lo(sghStream)($v0)
    /* 3E6B8 8004E6B8 00000000 */  nop
    /* 3E6BC 8004E6BC 20004010 */  beqz       $v0, .L8004E740
    /* 3E6C0 8004E6C0 00000000 */   nop
  .L8004E6C4:
    /* 3E6C4 8004E6C4 3E10020C */  jal        VID_GetTick__Fv
    /* 3E6C8 8004E6C8 00000000 */   nop
    /* 3E6CC 8004E6CC 9C20838F */  lw         $v1, %gp_rel(D_8011C81C)($gp)
    /* 3E6D0 8004E6D0 21204000 */  addu       $a0, $v0, $zero
    /* 3E6D4 8004E6D4 23188300 */  subu       $v1, $a0, $v1
    /* 3E6D8 8004E6D8 02006104 */  bgez       $v1, .L8004E6E4
    /* 3E6DC 8004E6DC 00000000 */   nop
    /* 3E6E0 8004E6E0 23180300 */  negu       $v1, $v1
  .L8004E6E4:
    /* 3E6E4 8004E6E4 E411828F */  lw         $v0, %gp_rel(qtextSpd)($gp)
    /* 3E6E8 8004E6E8 00000000 */  nop
    /* 3E6EC 8004E6EC 18004300 */  mult       $v0, $v1
    /* 3E6F0 8004E6F0 9C2084AF */  sw         $a0, %gp_rel(D_8011C81C)($gp)
    /* 3E6F4 8004E6F4 A020828F */  lw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E6F8 8004E6F8 1280033C */  lui        $v1, %hi(sghStream)
    /* 3E6FC 8004E6FC 34B8638C */  lw         $v1, %lo(sghStream)($v1)
    /* 3E700 8004E700 12500000 */  mflo       $t2
    /* 3E704 8004E704 23104A00 */  subu       $v0, $v0, $t2
    /* 3E708 8004E708 A02082AF */  sw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E70C 8004E70C 02140200 */  srl        $v0, $v0, 16
    /* 3E710 8004E710 942082AF */  sw         $v0, %gp_rel(D_8011C814)($gp)
    /* 3E714 8004E714 02006280 */  lb         $v0, 0x2($v1)
    /* 3E718 8004E718 00000000 */  nop
    /* 3E71C 8004E71C 25004010 */  beqz       $v0, .L8004E7B4
    /* 3E720 8004E720 00000000 */   nop
    /* 3E724 8004E724 2C00628C */  lw         $v0, 0x2C($v1)
    /* 3E728 8004E728 00000000 */  nop
    /* 3E72C 8004E72C 21004014 */  bnez       $v0, .L8004E7B4
    /* 3E730 8004E730 01000224 */   addiu     $v0, $zero, 0x1
    /* 3E734 8004E734 B41182AF */  sw         $v0, %gp_rel(D_8011B934)($gp)
    /* 3E738 8004E738 ED390108 */  j          .L8004E7B4
    /* 3E73C 8004E73C 00000000 */   nop
  .L8004E740:
    /* 3E740 8004E740 B411828F */  lw         $v0, %gp_rel(D_8011B934)($gp)
    /* 3E744 8004E744 00000000 */  nop
    /* 3E748 8004E748 1A004010 */  beqz       $v0, .L8004E7B4
    /* 3E74C 8004E74C 00000000 */   nop
    /* 3E750 8004E750 3E10020C */  jal        VID_GetTick__Fv
    /* 3E754 8004E754 00000000 */   nop
    /* 3E758 8004E758 9C20838F */  lw         $v1, %gp_rel(D_8011C81C)($gp)
    /* 3E75C 8004E75C 00000000 */  nop
    /* 3E760 8004E760 23184300 */  subu       $v1, $v0, $v1
    /* 3E764 8004E764 02006104 */  bgez       $v1, .L8004E770
    /* 3E768 8004E768 21204000 */   addu      $a0, $v0, $zero
    /* 3E76C 8004E76C 23180300 */  negu       $v1, $v1
  .L8004E770:
    /* 3E770 8004E770 E411828F */  lw         $v0, %gp_rel(qtextSpd)($gp)
    /* 3E774 8004E774 E6390108 */  j          .L8004E798
    /* 3E778 8004E778 18006200 */   mult      $v1, $v0
  .L8004E77C:
    /* 3E77C 8004E77C 3E10020C */  jal        VID_GetTick__Fv
    /* 3E780 8004E780 00000000 */   nop
    /* 3E784 8004E784 21204000 */  addu       $a0, $v0, $zero
    /* 3E788 8004E788 9C20828F */  lw         $v0, %gp_rel(D_8011C81C)($gp)
    /* 3E78C 8004E78C E411838F */  lw         $v1, %gp_rel(qtextSpd)($gp)
    /* 3E790 8004E790 23108200 */  subu       $v0, $a0, $v0
    /* 3E794 8004E794 18006200 */  mult       $v1, $v0
  .L8004E798:
    /* 3E798 8004E798 9C2084AF */  sw         $a0, %gp_rel(D_8011C81C)($gp)
    /* 3E79C 8004E79C A020828F */  lw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E7A0 8004E7A0 12500000 */  mflo       $t2
    /* 3E7A4 8004E7A4 23104A00 */  subu       $v0, $v0, $t2
    /* 3E7A8 8004E7A8 A02082AF */  sw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E7AC 8004E7AC 02140200 */  srl        $v0, $v0, 16
    /* 3E7B0 8004E7B0 942082AF */  sw         $v0, %gp_rel(D_8011C814)($gp)
  .L8004E7B4:
    /* 3E7B4 8004E7B4 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3E7B8 8004E7B8 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3E7BC 8004E7BC 00000000 */  nop
    /* 3E7C0 8004E7C0 02004010 */  beqz       $v0, .L8004E7CC
    /* 3E7C4 8004E7C4 0F000324 */   addiu     $v1, $zero, 0xF
    /* 3E7C8 8004E7C8 3C000324 */  addiu      $v1, $zero, 0x3C
  .L8004E7CC:
    /* 3E7CC 8004E7CC 9420828F */  lw         $v0, %gp_rel(D_8011C814)($gp)
    /* 3E7D0 8004E7D0 00000000 */  nop
    /* 3E7D4 8004E7D4 2A106200 */  slt        $v0, $v1, $v0
    /* 3E7D8 8004E7D8 20004014 */  bnez       $v0, .L8004E85C
    /* 3E7DC 8004E7DC 0F00033C */   lui       $v1, (0xF0000 >> 16)
    /* 3E7E0 8004E7E0 A020828F */  lw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E7E4 8004E7E4 00000000 */  nop
    /* 3E7E8 8004E7E8 21104300 */  addu       $v0, $v0, $v1
    /* 3E7EC 8004E7EC FFFFC383 */  lb         $v1, -0x1($fp)
    /* 3E7F0 8004E7F0 90209EAF */  sw         $fp, %gp_rel(D_8011C810)($gp)
    /* 3E7F4 8004E7F4 A02082AF */  sw         $v0, %gp_rel(D_8011C820)($gp)
    /* 3E7F8 8004E7F8 02140200 */  srl        $v0, $v0, 16
    /* 3E7FC 8004E7FC 942082AF */  sw         $v0, %gp_rel(D_8011C814)($gp)
    /* 3E800 8004E800 02006014 */  bnez       $v1, .L8004E80C
    /* 3E804 8004E804 00000000 */   nop
    /* 3E808 8004E808 A82080AF */  sw         $zero, %gp_rel(D_8011C828)($gp)
  .L8004E80C:
    /* 3E80C 8004E80C 0000C283 */  lb         $v0, 0x0($fp)
    /* 3E810 8004E810 00000000 */  nop
    /* 3E814 8004E814 02004014 */  bnez       $v0, .L8004E820
    /* 3E818 8004E818 00000000 */   nop
    /* 3E81C 8004E81C A82080AF */  sw         $zero, %gp_rel(D_8011C828)($gp)
  .L8004E820:
    /* 3E820 8004E820 0100C283 */  lb         $v0, 0x1($fp)
    /* 3E824 8004E824 00000000 */  nop
    /* 3E828 8004E828 02004014 */  bnez       $v0, .L8004E834
    /* 3E82C 8004E82C 00000000 */   nop
    /* 3E830 8004E830 A82080AF */  sw         $zero, %gp_rel(D_8011C828)($gp)
  .L8004E834:
    /* 3E834 8004E834 1280023C */  lui        $v0, %hi(sghStream)
    /* 3E838 8004E838 34B8428C */  lw         $v0, %lo(sghStream)($v0)
    /* 3E83C 8004E83C 00000000 */  nop
    /* 3E840 8004E840 06004010 */  beqz       $v0, .L8004E85C
    /* 3E844 8004E844 00000000 */   nop
    /* 3E848 8004E848 A820828F */  lw         $v0, %gp_rel(D_8011C828)($gp)
    /* 3E84C 8004E84C 00000000 */  nop
    /* 3E850 8004E850 02004014 */  bnez       $v0, .L8004E85C
    /* 3E854 8004E854 01000224 */   addiu     $v0, $zero, 0x1
    /* 3E858 8004E858 A82082AF */  sw         $v0, %gp_rel(D_8011C828)($gp)
  .L8004E85C:
    /* 3E85C 8004E85C 1280023C */  lui        $v0, %hi(FeFlag)
    /* 3E860 8004E860 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 3E864 8004E864 00000000 */  nop
    /* 3E868 8004E868 02004010 */  beqz       $v0, .L8004E874
    /* 3E86C 8004E86C C1100424 */   addiu     $a0, $zero, 0x10C1
    /* 3E870 8004E870 00200424 */  addiu      $a0, $zero, 0x2000
  .L8004E874:
    /* 3E874 8004E874 4AED010C */  jal        GetStr__Fi
    /* 3E878 8004E878 00000000 */   nop
    /* 3E87C 8004E87C 0D80043C */  lui        $a0, %hi(MtPrevText)
    /* 3E880 8004E880 A0678424 */  addiu      $a0, $a0, %lo(MtPrevText)
    /* 3E884 8004E884 F240000C */  jal        strcpy
    /* 3E888 8004E888 21284000 */   addu      $a1, $v0, $zero
    /* 3E88C 8004E88C 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 3E890 8004E890 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 3E894 8004E894 21200002 */  addu       $a0, $s0, $zero
    /* 3E898 8004E898 0D80113C */  lui        $s1, %hi(MtPrevText)
    /* 3E89C 8004E89C A0673126 */  addiu      $s1, $s1, %lo(MtPrevText)
    /* 3E8A0 8004E8A0 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 3E8A4 8004E8A4 21282002 */   addu      $a1, $s1, $zero
    /* 3E8A8 8004E8A8 21200002 */  addu       $a0, $s0, $zero
    /* 3E8AC 8004E8AC 00010524 */  addiu      $a1, $zero, 0x100
    /* 3E8B0 8004E8B0 2328A200 */  subu       $a1, $a1, $v0
    /* 3E8B4 8004E8B4 C2170500 */  srl        $v0, $a1, 31
    /* 3E8B8 8004E8B8 2128A200 */  addu       $a1, $a1, $v0
    /* 3E8BC 8004E8BC 43280500 */  sra        $a1, $a1, 1
    /* 3E8C0 8004E8C0 2000A524 */  addiu      $a1, $a1, 0x20
    /* 3E8C4 8004E8C4 E0000624 */  addiu      $a2, $zero, 0xE0
    /* 3E8C8 8004E8C8 1280023C */  lui        $v0, %hi(WHITER)
    /* 3E8CC 8004E8CC D1AB4290 */  lbu        $v0, %lo(WHITER)($v0)
    /* 3E8D0 8004E8D0 1280033C */  lui        $v1, %hi(WHITEG)
    /* 3E8D4 8004E8D4 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 3E8D8 8004E8D8 1280083C */  lui        $t0, %hi(WHITEB)
    /* 3E8DC 8004E8DC D3AB0891 */  lbu        $t0, %lo(WHITEB)($t0)
    /* 3E8E0 8004E8E0 21382002 */  addu       $a3, $s1, $zero
    /* 3E8E4 8004E8E4 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3E8E8 8004E8E8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 3E8EC 8004E8EC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 3E8F0 8004E8F0 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 3E8F4 8004E8F4 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 3E8F8 8004E8F8 2000A8AF */   sw        $t0, 0x20($sp)
    /* 3E8FC 8004E8FC 3000A58F */  lw         $a1, 0x30($sp)
    /* 3E900 8004E900 E82A020C */  jal        SetOTpos__5CFonti
    /* 3E904 8004E904 21200002 */   addu      $a0, $s0, $zero
  .L8004E908:
    /* 3E908 8004E908 6400BF8F */  lw         $ra, 0x64($sp)
    /* 3E90C 8004E90C 6000BE8F */  lw         $fp, 0x60($sp)
    /* 3E910 8004E910 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 3E914 8004E914 5800B68F */  lw         $s6, 0x58($sp)
    /* 3E918 8004E918 5400B58F */  lw         $s5, 0x54($sp)
    /* 3E91C 8004E91C 5000B48F */  lw         $s4, 0x50($sp)
    /* 3E920 8004E920 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 3E924 8004E924 4800B28F */  lw         $s2, 0x48($sp)
    /* 3E928 8004E928 4400B18F */  lw         $s1, 0x44($sp)
    /* 3E92C 8004E92C 4000B08F */  lw         $s0, 0x40($sp)
    /* 3E930 8004E930 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 3E934 8004E934 0800E003 */  jr         $ra
    /* 3E938 8004E938 00000000 */   nop
endlabel DrawQText__Fv
