.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateShrine__Fiii, 0x23D8

glabel OperateShrine__Fiii
    /* 4A478 8005A478 1280023C */  lui        $v0, %hi(dropGoldFlag)
    /* 4A47C 8005A47C B4B64290 */  lbu        $v0, %lo(dropGoldFlag)($v0)
    /* 4A480 8005A480 20FFBD27 */  addiu      $sp, $sp, -0xE0
    /* 4A484 8005A484 C400B3AF */  sw         $s3, 0xC4($sp)
    /* 4A488 8005A488 21988000 */  addu       $s3, $a0, $zero
    /* 4A48C 8005A48C D800BEAF */  sw         $fp, 0xD8($sp)
    /* 4A490 8005A490 21F0A000 */  addu       $fp, $a1, $zero
    /* 4A494 8005A494 BC00B1AF */  sw         $s1, 0xBC($sp)
    /* 4A498 8005A498 2188C000 */  addu       $s1, $a2, $zero
    /* 4A49C 8005A49C DC00BFAF */  sw         $ra, 0xDC($sp)
    /* 4A4A0 8005A4A0 D400B7AF */  sw         $s7, 0xD4($sp)
    /* 4A4A4 8005A4A4 D000B6AF */  sw         $s6, 0xD0($sp)
    /* 4A4A8 8005A4A8 CC00B5AF */  sw         $s5, 0xCC($sp)
    /* 4A4AC 8005A4AC C800B4AF */  sw         $s4, 0xC8($sp)
    /* 4A4B0 8005A4B0 C000B2AF */  sw         $s2, 0xC0($sp)
    /* 4A4B4 8005A4B4 05004010 */  beqz       $v0, .L8005A4CC
    /* 4A4B8 8005A4B8 B800B0AF */   sw        $s0, 0xB8($sp)
    /* 4A4BC 8005A4BC 1280013C */  lui        $at, %hi(dropGoldFlag)
    /* 4A4C0 8005A4C0 B4B620A0 */  sb         $zero, %lo(dropGoldFlag)($at)
    /* 4A4C4 8005A4C4 1280013C */  lui        $at, %hi(dropGoldValue)
    /* 4A4C8 8005A4C8 C8B620AC */  sw         $zero, %lo(dropGoldValue)($at)
  .L8005A4CC:
    /* 4A4CC 8005A4CC 40101E00 */  sll        $v0, $fp, 1
    /* 4A4D0 8005A4D0 21105E00 */  addu       $v0, $v0, $fp
    /* 4A4D4 8005A4D4 80100200 */  sll        $v0, $v0, 2
    /* 4A4D8 8005A4D8 23105E00 */  subu       $v0, $v0, $fp
    /* 4A4DC 8005A4DC 80800200 */  sll        $s0, $v0, 2
    /* 4A4E0 8005A4E0 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4A4E4 8005A4E4 21083000 */  addu       $at, $at, $s0
    /* 4A4E8 8005A4E8 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4A4EC 8005A4EC 00000000 */  nop
    /* 4A4F0 8005A4F0 CA084010 */  beqz       $v0, .L8005C81C
    /* 4A4F4 8005A4F4 00000000 */   nop
    /* 4A4F8 8005A4F8 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4A4FC 8005A4FC 21083000 */  addu       $at, $at, $s0
    /* 4A500 8005A500 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4A504 8005A504 B3F6000C */  jal        SetRndSeed__Fl
    /* 4A508 8005A508 00000000 */   nop
    /* 4A50C 8005A50C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4A510 8005A510 21083000 */  addu       $at, $at, $s0
    /* 4A514 8005A514 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4A518 8005A518 1280023C */  lui        $v0, %hi(deltaload)
    /* 4A51C 8005A51C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4A520 8005A520 00000000 */  nop
    /* 4A524 8005A524 0C004010 */  beqz       $v0, .L8005A558
    /* 4A528 8005A528 00000000 */   nop
    /* 4A52C 8005A52C 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 4A530 8005A530 21083000 */  addu       $at, $at, $s0
    /* 4A534 8005A534 588C2294 */  lhu        $v0, %lo(object + 0xC)($at)
    /* 4A538 8005A538 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 4A53C 8005A53C 21083000 */  addu       $at, $at, $s0
    /* 4A540 8005A540 718C20A0 */  sb         $zero, %lo(object + 0x25)($at)
    /* 4A544 8005A544 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4A548 8005A548 21083000 */  addu       $at, $at, $s0
    /* 4A54C 8005A54C 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4A550 8005A550 07720108 */  j          .L8005C81C
    /* 4A554 8005A554 00000000 */   nop
  .L8005A558:
    /* 4A558 8005A558 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4A55C 8005A55C 21083000 */  addu       $at, $at, $s0
    /* 4A560 8005A560 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4A564 8005A564 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4A568 8005A568 21083000 */  addu       $at, $at, $s0
    /* 4A56C 8005A56C 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4A570 8005A570 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4A574 8005A574 21202002 */   addu      $a0, $s1, $zero
    /* 4A578 8005A578 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4A57C 8005A57C 21083000 */  addu       $at, $at, $s0
    /* 4A580 8005A580 5A8C2384 */  lh         $v1, %lo(object + 0xE)($at)
    /* 4A584 8005A584 01000224 */  addiu      $v0, $zero, 0x1
    /* 4A588 8005A588 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 4A58C 8005A58C 21083000 */  addu       $at, $at, $s0
    /* 4A590 8005A590 718C22A0 */  sb         $v0, %lo(object + 0x25)($at)
    /* 4A594 8005A594 01000224 */  addiu      $v0, $zero, 0x1
    /* 4A598 8005A598 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 4A59C 8005A59C 21083000 */  addu       $at, $at, $s0
    /* 4A5A0 8005A5A0 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 4A5A4 8005A5A4 1A00622C */  sltiu      $v0, $v1, 0x1A
    /* 4A5A8 8005A5A8 91084010 */  beqz       $v0, .L8005C7F0
    /* 4A5AC 8005A5AC 80100300 */   sll       $v0, $v1, 2
    /* 4A5B0 8005A5B0 1180013C */  lui        $at, %hi(jtbl_80116F40)
    /* 4A5B4 8005A5B4 21082200 */  addu       $at, $at, $v0
    /* 4A5B8 8005A5B8 406F228C */  lw         $v0, %lo(jtbl_80116F40)($at)
    /* 4A5BC 8005A5BC 00000000 */  nop
    /* 4A5C0 8005A5C0 08004000 */  jr         $v0
    /* 4A5C4 8005A5C4 00000000 */   nop
  jlabel .L8005A5C8
    /* 4A5C8 8005A5C8 21206002 */  addu       $a0, $s3, $zero
    /* 4A5CC 8005A5CC 6897010C */  jal        ModifyPlrStr__Fii
    /* 4A5D0 8005A5D0 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 4A5D4 8005A5D4 21206002 */  addu       $a0, $s3, $zero
    /* 4A5D8 8005A5D8 AF97010C */  jal        ModifyPlrMag__Fii
    /* 4A5DC 8005A5DC FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 4A5E0 8005A5E0 21206002 */  addu       $a0, $s3, $zero
    /* 4A5E4 8005A5E4 EA97010C */  jal        ModifyPlrDex__Fii
    /* 4A5E8 8005A5E8 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 4A5EC 8005A5EC 21206002 */  addu       $a0, $s3, $zero
    /* 4A5F0 8005A5F0 2398010C */  jal        ModifyPlrVit__Fii
    /* 4A5F4 8005A5F4 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 4A5F8 8005A5F8 C9F6000C */  jal        ENG_random__Fl
    /* 4A5FC 8005A5FC 04000424 */   addiu     $a0, $zero, 0x4
    /* 4A600 8005A600 21184000 */  addu       $v1, $v0, $zero
    /* 4A604 8005A604 01000224 */  addiu      $v0, $zero, 0x1
    /* 4A608 8005A608 12006210 */  beq        $v1, $v0, .L8005A654
    /* 4A60C 8005A60C 02006228 */   slti      $v0, $v1, 0x2
    /* 4A610 8005A610 05004010 */  beqz       $v0, .L8005A628
    /* 4A614 8005A614 00000000 */   nop
    /* 4A618 8005A618 0A006010 */  beqz       $v1, .L8005A644
    /* 4A61C 8005A61C 21206002 */   addu      $a0, $s3, $zero
    /* 4A620 8005A620 A1690108 */  j          .L8005A684
    /* 4A624 8005A624 00000000 */   nop
  .L8005A628:
    /* 4A628 8005A628 02000224 */  addiu      $v0, $zero, 0x2
    /* 4A62C 8005A62C 0E006210 */  beq        $v1, $v0, .L8005A668
    /* 4A630 8005A630 03000224 */   addiu     $v0, $zero, 0x3
    /* 4A634 8005A634 11006210 */  beq        $v1, $v0, .L8005A67C
    /* 4A638 8005A638 21206002 */   addu      $a0, $s3, $zero
    /* 4A63C 8005A63C A1690108 */  j          .L8005A684
    /* 4A640 8005A640 00000000 */   nop
  .L8005A644:
    /* 4A644 8005A644 6897010C */  jal        ModifyPlrStr__Fii
    /* 4A648 8005A648 06000524 */   addiu     $a1, $zero, 0x6
    /* 4A64C 8005A64C A1690108 */  j          .L8005A684
    /* 4A650 8005A650 00000000 */   nop
  .L8005A654:
    /* 4A654 8005A654 21206002 */  addu       $a0, $s3, $zero
    /* 4A658 8005A658 AF97010C */  jal        ModifyPlrMag__Fii
    /* 4A65C 8005A65C 06000524 */   addiu     $a1, $zero, 0x6
    /* 4A660 8005A660 A1690108 */  j          .L8005A684
    /* 4A664 8005A664 00000000 */   nop
  .L8005A668:
    /* 4A668 8005A668 21206002 */  addu       $a0, $s3, $zero
    /* 4A66C 8005A66C EA97010C */  jal        ModifyPlrDex__Fii
    /* 4A670 8005A670 06000524 */   addiu     $a1, $zero, 0x6
    /* 4A674 8005A674 A1690108 */  j          .L8005A684
    /* 4A678 8005A678 00000000 */   nop
  .L8005A67C:
    /* 4A67C 8005A67C 2398010C */  jal        ModifyPlrVit__Fii
    /* 4A680 8005A680 06000524 */   addiu     $a1, $zero, 0x6
  .L8005A684:
    /* 4A684 8005A684 F396010C */  jal        CheckStats__Fi
    /* 4A688 8005A688 21206002 */   addu      $a0, $s3, $zero
    /* 4A68C 8005A68C 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4A690 8005A690 0C000424 */   addiu     $a0, $zero, 0xC
    /* 4A694 8005A694 FD710108 */  j          .L8005C7F4
    /* 4A698 8005A698 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005A69C
    /* 4A69C 8005A69C 21880000 */  addu       $s1, $zero, $zero
    /* 4A6A0 8005A6A0 21900000 */  addu       $s2, $zero, $zero
    /* 4A6A4 8005A6A4 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 4A6A8 8005A6A8 40101300 */  sll        $v0, $s3, 1
    /* 4A6AC 8005A6AC 21105300 */  addu       $v0, $v0, $s3
    /* 4A6B0 8005A6B0 80100200 */  sll        $v0, $v0, 2
    /* 4A6B4 8005A6B4 21105300 */  addu       $v0, $v0, $s3
    /* 4A6B8 8005A6B8 00110200 */  sll        $v0, $v0, 4
    /* 4A6BC 8005A6BC 23105300 */  subu       $v0, $v0, $s3
    /* 4A6C0 8005A6C0 80100200 */  sll        $v0, $v0, 2
    /* 4A6C4 8005A6C4 21105300 */  addu       $v0, $v0, $s3
    /* 4A6C8 8005A6C8 C0200200 */  sll        $a0, $v0, 3
  .L8005A6CC:
    /* 4A6CC 8005A6CC 0E80013C */  lui        $at, %hi(plr + 0x1DC)
    /* 4A6D0 8005A6D0 21082400 */  addu       $at, $at, $a0
    /* 4A6D4 8005A6D4 14A72284 */  lh         $v0, %lo(plr + 0x1DC)($at)
    /* 4A6D8 8005A6D8 00000000 */  nop
    /* 4A6DC 8005A6DC 0A004510 */  beq        $v0, $a1, .L8005A708
    /* 4A6E0 8005A6E0 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 4A6E4 8005A6E4 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A6E8 8005A6E8 21082400 */  addu       $at, $at, $a0
    /* 4A6EC 8005A6EC 28A72384 */  lh         $v1, %lo(plr + 0x1F0)($at)
    /* 4A6F0 8005A6F0 00000000 */  nop
    /* 4A6F4 8005A6F4 04006210 */  beq        $v1, $v0, .L8005A708
    /* 4A6F8 8005A6F8 00000000 */   nop
    /* 4A6FC 8005A6FC 02006010 */  beqz       $v1, .L8005A708
    /* 4A700 8005A700 00000000 */   nop
    /* 4A704 8005A704 01003126 */  addiu      $s1, $s1, 0x1
  .L8005A708:
    /* 4A708 8005A708 01005226 */  addiu      $s2, $s2, 0x1
    /* 4A70C 8005A70C 0700422A */  slti       $v0, $s2, 0x7
    /* 4A710 8005A710 EEFF4014 */  bnez       $v0, .L8005A6CC
    /* 4A714 8005A714 6C008424 */   addiu     $a0, $a0, 0x6C
    /* 4A718 8005A718 7C00201A */  blez       $s1, .L8005A90C
    /* 4A71C 8005A71C 21900000 */   addu      $s2, $zero, $zero
    /* 4A720 8005A720 40101300 */  sll        $v0, $s3, 1
    /* 4A724 8005A724 21105300 */  addu       $v0, $v0, $s3
    /* 4A728 8005A728 80100200 */  sll        $v0, $v0, 2
    /* 4A72C 8005A72C 21105300 */  addu       $v0, $v0, $s3
    /* 4A730 8005A730 00110200 */  sll        $v0, $v0, 4
    /* 4A734 8005A734 23105300 */  subu       $v0, $v0, $s3
    /* 4A738 8005A738 80100200 */  sll        $v0, $v0, 2
    /* 4A73C 8005A73C 21105300 */  addu       $v0, $v0, $s3
    /* 4A740 8005A740 C0200200 */  sll        $a0, $v0, 3
  .L8005A744:
    /* 4A744 8005A744 0E80013C */  lui        $at, %hi(plr + 0x1DC)
    /* 4A748 8005A748 21082400 */  addu       $at, $at, $a0
    /* 4A74C 8005A74C 14A72384 */  lh         $v1, %lo(plr + 0x1DC)($at)
    /* 4A750 8005A750 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4A754 8005A754 23006210 */  beq        $v1, $v0, .L8005A7E4
    /* 4A758 8005A758 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 4A75C 8005A75C 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A760 8005A760 21082400 */  addu       $at, $at, $a0
    /* 4A764 8005A764 28A72384 */  lh         $v1, %lo(plr + 0x1F0)($at)
    /* 4A768 8005A768 00000000 */  nop
    /* 4A76C 8005A76C 1D006210 */  beq        $v1, $v0, .L8005A7E4
    /* 4A770 8005A770 00000000 */   nop
    /* 4A774 8005A774 1B006010 */  beqz       $v1, .L8005A7E4
    /* 4A778 8005A778 00000000 */   nop
    /* 4A77C 8005A77C 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A780 8005A780 21082400 */  addu       $at, $at, $a0
    /* 4A784 8005A784 26A72294 */  lhu        $v0, %lo(plr + 0x1EE)($at)
    /* 4A788 8005A788 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A78C 8005A78C 21082400 */  addu       $at, $at, $a0
    /* 4A790 8005A790 28A72394 */  lhu        $v1, %lo(plr + 0x1F0)($at)
    /* 4A794 8005A794 0A004224 */  addiu      $v0, $v0, 0xA
    /* 4A798 8005A798 0A006324 */  addiu      $v1, $v1, 0xA
    /* 4A79C 8005A79C 21286000 */  addu       $a1, $v1, $zero
    /* 4A7A0 8005A7A0 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A7A4 8005A7A4 21082400 */  addu       $at, $at, $a0
    /* 4A7A8 8005A7A8 28A723A4 */  sh         $v1, %lo(plr + 0x1F0)($at)
    /* 4A7AC 8005A7AC 001C0300 */  sll        $v1, $v1, 16
    /* 4A7B0 8005A7B0 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A7B4 8005A7B4 21082400 */  addu       $at, $at, $a0
    /* 4A7B8 8005A7B8 26A722A4 */  sh         $v0, %lo(plr + 0x1EE)($at)
    /* 4A7BC 8005A7BC 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A7C0 8005A7C0 21082400 */  addu       $at, $at, $a0
    /* 4A7C4 8005A7C4 26A72284 */  lh         $v0, %lo(plr + 0x1EE)($at)
    /* 4A7C8 8005A7C8 031C0300 */  sra        $v1, $v1, 16
    /* 4A7CC 8005A7CC 2A186200 */  slt        $v1, $v1, $v0
    /* 4A7D0 8005A7D0 04006010 */  beqz       $v1, .L8005A7E4
    /* 4A7D4 8005A7D4 00000000 */   nop
    /* 4A7D8 8005A7D8 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A7DC 8005A7DC 21082400 */  addu       $at, $at, $a0
    /* 4A7E0 8005A7E0 26A725A4 */  sh         $a1, %lo(plr + 0x1EE)($at)
  .L8005A7E4:
    /* 4A7E4 8005A7E4 01005226 */  addiu      $s2, $s2, 0x1
    /* 4A7E8 8005A7E8 0700422A */  slti       $v0, $s2, 0x7
    /* 4A7EC 8005A7EC D5FF4014 */  bnez       $v0, .L8005A744
    /* 4A7F0 8005A7F0 6C008424 */   addiu     $a0, $a0, 0x6C
    /* 4A7F4 8005A7F4 21A80000 */  addu       $s5, $zero, $zero
    /* 4A7F8 8005A7F8 40101300 */  sll        $v0, $s3, 1
    /* 4A7FC 8005A7FC 21105300 */  addu       $v0, $v0, $s3
    /* 4A800 8005A800 80100200 */  sll        $v0, $v0, 2
    /* 4A804 8005A804 21105300 */  addu       $v0, $v0, $s3
    /* 4A808 8005A808 00110200 */  sll        $v0, $v0, 4
    /* 4A80C 8005A80C 23105300 */  subu       $v0, $v0, $s3
    /* 4A810 8005A810 80100200 */  sll        $v0, $v0, 2
    /* 4A814 8005A814 21105300 */  addu       $v0, $v0, $s3
    /* 4A818 8005A818 C0800200 */  sll        $s0, $v0, 3
  .L8005A81C:
    /* 4A81C 8005A81C C9F6000C */  jal        ENG_random__Fl
    /* 4A820 8005A820 07000424 */   addiu     $a0, $zero, 0x7
    /* 4A824 8005A824 21904000 */  addu       $s2, $v0, $zero
    /* 4A828 8005A828 C0101200 */  sll        $v0, $s2, 3
    /* 4A82C 8005A82C 23105200 */  subu       $v0, $v0, $s2
    /* 4A830 8005A830 80100200 */  sll        $v0, $v0, 2
    /* 4A834 8005A834 23105200 */  subu       $v0, $v0, $s2
    /* 4A838 8005A838 80100200 */  sll        $v0, $v0, 2
    /* 4A83C 8005A83C 21205000 */  addu       $a0, $v0, $s0
    /* 4A840 8005A840 0E80013C */  lui        $at, %hi(plr + 0x1DC)
    /* 4A844 8005A844 21082400 */  addu       $at, $at, $a0
    /* 4A848 8005A848 14A72384 */  lh         $v1, %lo(plr + 0x1DC)($at)
    /* 4A84C 8005A84C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4A850 8005A850 2C006210 */  beq        $v1, $v0, .L8005A904
    /* 4A854 8005A854 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 4A858 8005A858 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A85C 8005A85C 21082400 */  addu       $at, $at, $a0
    /* 4A860 8005A860 28A72384 */  lh         $v1, %lo(plr + 0x1F0)($at)
    /* 4A864 8005A864 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 4A868 8005A868 25006210 */  beq        $v1, $v0, .L8005A900
    /* 4A86C 8005A86C 00000000 */   nop
    /* 4A870 8005A870 24006010 */  beqz       $v1, .L8005A904
    /* 4A874 8005A874 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 4A878 8005A878 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A87C 8005A87C 21082400 */  addu       $at, $at, $a0
    /* 4A880 8005A880 26A72294 */  lhu        $v0, %lo(plr + 0x1EE)($at)
    /* 4A884 8005A884 00000000 */  nop
    /* 4A888 8005A888 ECFF4224 */  addiu      $v0, $v0, -0x14
    /* 4A88C 8005A88C 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A890 8005A890 21082400 */  addu       $at, $at, $a0
    /* 4A894 8005A894 26A722A4 */  sh         $v0, %lo(plr + 0x1EE)($at)
    /* 4A898 8005A898 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A89C 8005A89C 21082400 */  addu       $at, $at, $a0
    /* 4A8A0 8005A8A0 28A72294 */  lhu        $v0, %lo(plr + 0x1F0)($at)
    /* 4A8A4 8005A8A4 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A8A8 8005A8A8 21082400 */  addu       $at, $at, $a0
    /* 4A8AC 8005A8AC 26A72384 */  lh         $v1, %lo(plr + 0x1EE)($at)
    /* 4A8B0 8005A8B0 ECFF4224 */  addiu      $v0, $v0, -0x14
    /* 4A8B4 8005A8B4 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A8B8 8005A8B8 21082400 */  addu       $at, $at, $a0
    /* 4A8BC 8005A8BC 28A722A4 */  sh         $v0, %lo(plr + 0x1F0)($at)
    /* 4A8C0 8005A8C0 0400601C */  bgtz       $v1, .L8005A8D4
    /* 4A8C4 8005A8C4 01000224 */   addiu     $v0, $zero, 0x1
    /* 4A8C8 8005A8C8 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4A8CC 8005A8CC 21082400 */  addu       $at, $at, $a0
    /* 4A8D0 8005A8D0 26A722A4 */  sh         $v0, %lo(plr + 0x1EE)($at)
  .L8005A8D4:
    /* 4A8D4 8005A8D4 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A8D8 8005A8D8 21082400 */  addu       $at, $at, $a0
    /* 4A8DC 8005A8DC 28A72284 */  lh         $v0, %lo(plr + 0x1F0)($at)
    /* 4A8E0 8005A8E0 00000000 */  nop
    /* 4A8E4 8005A8E4 0900401C */  bgtz       $v0, .L8005A90C
    /* 4A8E8 8005A8E8 01000224 */   addiu     $v0, $zero, 0x1
    /* 4A8EC 8005A8EC 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4A8F0 8005A8F0 21082400 */  addu       $at, $at, $a0
    /* 4A8F4 8005A8F4 28A722A4 */  sh         $v0, %lo(plr + 0x1F0)($at)
    /* 4A8F8 8005A8F8 436A0108 */  j          .L8005A90C
    /* 4A8FC 8005A8FC 00000000 */   nop
  .L8005A900:
    /* 4A900 8005A900 FF00A232 */  andi       $v0, $s5, 0xFF
  .L8005A904:
    /* 4A904 8005A904 C5FF4010 */  beqz       $v0, .L8005A81C
    /* 4A908 8005A908 00000000 */   nop
  .L8005A90C:
    /* 4A90C 8005A90C 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4A910 8005A910 0D000424 */   addiu     $a0, $zero, 0xD
    /* 4A914 8005A914 FD710108 */  j          .L8005C7F4
    /* 4A918 8005A918 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005A91C
    /* 4A91C 8005A91C 40101300 */  sll        $v0, $s3, 1
    /* 4A920 8005A920 21105300 */  addu       $v0, $v0, $s3
    /* 4A924 8005A924 80100200 */  sll        $v0, $v0, 2
    /* 4A928 8005A928 21105300 */  addu       $v0, $v0, $s3
    /* 4A92C 8005A92C 00110200 */  sll        $v0, $v0, 4
    /* 4A930 8005A930 23105300 */  subu       $v0, $v0, $s3
    /* 4A934 8005A934 80100200 */  sll        $v0, $v0, 2
    /* 4A938 8005A938 21105300 */  addu       $v0, $v0, $s3
    /* 4A93C 8005A93C C0200200 */  sll        $a0, $v0, 3
    /* 4A940 8005A940 0E80013C */  lui        $at, %hi(plr + 0x1DC)
    /* 4A944 8005A944 21082400 */  addu       $at, $at, $a0
    /* 4A948 8005A948 14A72284 */  lh         $v0, %lo(plr + 0x1DC)($at)
    /* 4A94C 8005A94C FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 4A950 8005A950 09004510 */  beq        $v0, $a1, .L8005A978
    /* 4A954 8005A954 00000000 */   nop
    /* 4A958 8005A958 0E80013C */  lui        $at, %hi(plr + 0x1FA)
    /* 4A95C 8005A95C 21082400 */  addu       $at, $at, $a0
    /* 4A960 8005A960 32A72290 */  lbu        $v0, %lo(plr + 0x1FA)($at)
    /* 4A964 8005A964 00000000 */  nop
    /* 4A968 8005A968 02004224 */  addiu      $v0, $v0, 0x2
    /* 4A96C 8005A96C 0E80013C */  lui        $at, %hi(plr + 0x1FA)
    /* 4A970 8005A970 21082400 */  addu       $at, $at, $a0
    /* 4A974 8005A974 32A722A0 */  sb         $v0, %lo(plr + 0x1FA)($at)
  .L8005A978:
    /* 4A978 8005A978 0E80013C */  lui        $at, %hi(plr + 0x464)
    /* 4A97C 8005A97C 21082400 */  addu       $at, $at, $a0
    /* 4A980 8005A980 9CA92284 */  lh         $v0, %lo(plr + 0x464)($at)
    /* 4A984 8005A984 00000000 */  nop
    /* 4A988 8005A988 09004510 */  beq        $v0, $a1, .L8005A9B0
    /* 4A98C 8005A98C 00000000 */   nop
    /* 4A990 8005A990 0E80013C */  lui        $at, %hi(plr + 0x482)
    /* 4A994 8005A994 21082400 */  addu       $at, $at, $a0
    /* 4A998 8005A998 BAA92290 */  lbu        $v0, %lo(plr + 0x482)($at)
    /* 4A99C 8005A99C 00000000 */  nop
    /* 4A9A0 8005A9A0 02004224 */  addiu      $v0, $v0, 0x2
    /* 4A9A4 8005A9A4 0E80013C */  lui        $at, %hi(plr + 0x482)
    /* 4A9A8 8005A9A8 21082400 */  addu       $at, $at, $a0
    /* 4A9AC 8005A9AC BAA922A0 */  sb         $v0, %lo(plr + 0x482)($at)
  .L8005A9B0:
    /* 4A9B0 8005A9B0 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 4A9B4 8005A9B4 21082400 */  addu       $at, $at, $a0
    /* 4A9B8 8005A9B8 C4A82384 */  lh         $v1, %lo(plr + 0x38C)($at)
    /* 4A9BC 8005A9BC 00000000 */  nop
    /* 4A9C0 8005A9C0 21006510 */  beq        $v1, $a1, .L8005AA48
    /* 4A9C4 8005A9C4 05000224 */   addiu     $v0, $zero, 0x5
    /* 4A9C8 8005A9C8 0B006214 */  bne        $v1, $v0, .L8005A9F8
    /* 4A9CC 8005A9CC 00000000 */   nop
    /* 4A9D0 8005A9D0 0E80013C */  lui        $at, %hi(plr + 0x3AA)
    /* 4A9D4 8005A9D4 21082400 */  addu       $at, $at, $a0
    /* 4A9D8 8005A9D8 E2A82290 */  lbu        $v0, %lo(plr + 0x3AA)($at)
    /* 4A9DC 8005A9DC 00000000 */  nop
    /* 4A9E0 8005A9E0 02004224 */  addiu      $v0, $v0, 0x2
    /* 4A9E4 8005A9E4 0E80013C */  lui        $at, %hi(plr + 0x3AA)
    /* 4A9E8 8005A9E8 21082400 */  addu       $at, $at, $a0
    /* 4A9EC 8005A9EC E2A822A0 */  sb         $v0, %lo(plr + 0x3AA)($at)
    /* 4A9F0 8005A9F0 936A0108 */  j          .L8005AA4C
    /* 4A9F4 8005A9F4 40101300 */   sll       $v0, $s3, 1
  .L8005A9F8:
    /* 4A9F8 8005A9F8 0E80013C */  lui        $at, %hi(plr + 0x39C)
    /* 4A9FC 8005A9FC 21082400 */  addu       $at, $at, $a0
    /* 4AA00 8005AA00 D4A82290 */  lbu        $v0, %lo(plr + 0x39C)($at)
    /* 4AA04 8005AA04 0E80013C */  lui        $at, %hi(plr + 0x39B)
    /* 4AA08 8005AA08 21082400 */  addu       $at, $at, $a0
    /* 4AA0C 8005AA0C D3A82380 */  lb         $v1, %lo(plr + 0x39B)($at)
    /* 4AA10 8005AA10 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4AA14 8005AA14 0E80013C */  lui        $at, %hi(plr + 0x39C)
    /* 4AA18 8005AA18 21082400 */  addu       $at, $at, $a0
    /* 4AA1C 8005AA1C D4A822A0 */  sb         $v0, %lo(plr + 0x39C)($at)
    /* 4AA20 8005AA20 0E80013C */  lui        $at, %hi(plr + 0x39C)
    /* 4AA24 8005AA24 21082400 */  addu       $at, $at, $a0
    /* 4AA28 8005AA28 D4A82280 */  lb         $v0, %lo(plr + 0x39C)($at)
    /* 4AA2C 8005AA2C 00000000 */  nop
    /* 4AA30 8005AA30 2A104300 */  slt        $v0, $v0, $v1
    /* 4AA34 8005AA34 04004010 */  beqz       $v0, .L8005AA48
    /* 4AA38 8005AA38 21286000 */   addu      $a1, $v1, $zero
    /* 4AA3C 8005AA3C 0E80013C */  lui        $at, %hi(plr + 0x39C)
    /* 4AA40 8005AA40 21082400 */  addu       $at, $at, $a0
    /* 4AA44 8005AA44 D4A825A0 */  sb         $a1, %lo(plr + 0x39C)($at)
  .L8005AA48:
    /* 4AA48 8005AA48 40101300 */  sll        $v0, $s3, 1
  .L8005AA4C:
    /* 4AA4C 8005AA4C 21105300 */  addu       $v0, $v0, $s3
    /* 4AA50 8005AA50 80100200 */  sll        $v0, $v0, 2
    /* 4AA54 8005AA54 21105300 */  addu       $v0, $v0, $s3
    /* 4AA58 8005AA58 00110200 */  sll        $v0, $v0, 4
    /* 4AA5C 8005AA5C 23105300 */  subu       $v0, $v0, $s3
    /* 4AA60 8005AA60 80100200 */  sll        $v0, $v0, 2
    /* 4AA64 8005AA64 21105300 */  addu       $v0, $v0, $s3
    /* 4AA68 8005AA68 C0200200 */  sll        $a0, $v0, 3
    /* 4AA6C 8005AA6C 0E80013C */  lui        $at, %hi(plr + 0x3F8)
    /* 4AA70 8005AA70 21082400 */  addu       $at, $at, $a0
    /* 4AA74 8005AA74 30A92384 */  lh         $v1, %lo(plr + 0x3F8)($at)
    /* 4AA78 8005AA78 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4AA7C 8005AA7C 21006210 */  beq        $v1, $v0, .L8005AB04
    /* 4AA80 8005AA80 05000224 */   addiu     $v0, $zero, 0x5
    /* 4AA84 8005AA84 0B006214 */  bne        $v1, $v0, .L8005AAB4
    /* 4AA88 8005AA88 40181300 */   sll       $v1, $s3, 1
    /* 4AA8C 8005AA8C 0E80013C */  lui        $at, %hi(plr + 0x416)
    /* 4AA90 8005AA90 21082400 */  addu       $at, $at, $a0
    /* 4AA94 8005AA94 4EA92290 */  lbu        $v0, %lo(plr + 0x416)($at)
    /* 4AA98 8005AA98 00000000 */  nop
    /* 4AA9C 8005AA9C 02004224 */  addiu      $v0, $v0, 0x2
    /* 4AAA0 8005AAA0 0E80013C */  lui        $at, %hi(plr + 0x416)
    /* 4AAA4 8005AAA4 21082400 */  addu       $at, $at, $a0
    /* 4AAA8 8005AAA8 4EA922A0 */  sb         $v0, %lo(plr + 0x416)($at)
    /* 4AAAC 8005AAAC C26A0108 */  j          .L8005AB08
    /* 4AAB0 8005AAB0 00000000 */   nop
  .L8005AAB4:
    /* 4AAB4 8005AAB4 0E80013C */  lui        $at, %hi(plr + 0x408)
    /* 4AAB8 8005AAB8 21082400 */  addu       $at, $at, $a0
    /* 4AABC 8005AABC 40A92290 */  lbu        $v0, %lo(plr + 0x408)($at)
    /* 4AAC0 8005AAC0 0E80013C */  lui        $at, %hi(plr + 0x407)
    /* 4AAC4 8005AAC4 21082400 */  addu       $at, $at, $a0
    /* 4AAC8 8005AAC8 3FA92380 */  lb         $v1, %lo(plr + 0x407)($at)
    /* 4AACC 8005AACC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4AAD0 8005AAD0 0E80013C */  lui        $at, %hi(plr + 0x408)
    /* 4AAD4 8005AAD4 21082400 */  addu       $at, $at, $a0
    /* 4AAD8 8005AAD8 40A922A0 */  sb         $v0, %lo(plr + 0x408)($at)
    /* 4AADC 8005AADC 0E80013C */  lui        $at, %hi(plr + 0x408)
    /* 4AAE0 8005AAE0 21082400 */  addu       $at, $at, $a0
    /* 4AAE4 8005AAE4 40A92280 */  lb         $v0, %lo(plr + 0x408)($at)
    /* 4AAE8 8005AAE8 00000000 */  nop
    /* 4AAEC 8005AAEC 2A104300 */  slt        $v0, $v0, $v1
    /* 4AAF0 8005AAF0 04004010 */  beqz       $v0, .L8005AB04
    /* 4AAF4 8005AAF4 21286000 */   addu      $a1, $v1, $zero
    /* 4AAF8 8005AAF8 0E80013C */  lui        $at, %hi(plr + 0x408)
    /* 4AAFC 8005AAFC 21082400 */  addu       $at, $at, $a0
    /* 4AB00 8005AB00 40A925A0 */  sb         $a1, %lo(plr + 0x408)($at)
  .L8005AB04:
    /* 4AB04 8005AB04 40181300 */  sll        $v1, $s3, 1
  .L8005AB08:
    /* 4AB08 8005AB08 21107300 */  addu       $v0, $v1, $s3
    /* 4AB0C 8005AB0C 80100200 */  sll        $v0, $v0, 2
    /* 4AB10 8005AB10 21105300 */  addu       $v0, $v0, $s3
    /* 4AB14 8005AB14 00110200 */  sll        $v0, $v0, 4
    /* 4AB18 8005AB18 23105300 */  subu       $v0, $v0, $s3
    /* 4AB1C 8005AB1C 80100200 */  sll        $v0, $v0, 2
    /* 4AB20 8005AB20 21105300 */  addu       $v0, $v0, $s3
    /* 4AB24 8005AB24 C0200200 */  sll        $a0, $v0, 3
    /* 4AB28 8005AB28 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4AB2C 8005AB2C 21082400 */  addu       $at, $at, $a0
    /* 4AB30 8005AB30 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4AB34 8005AB34 00000000 */  nop
    /* 4AB38 8005AB38 4C004018 */  blez       $v0, .L8005AC6C
    /* 4AB3C 8005AB3C 21900000 */   addu      $s2, $zero, $zero
    /* 4AB40 8005AB40 1180073C */  lui        $a3, %hi(jtbl_80116FA8)
    /* 4AB44 8005AB44 A86FE724 */  addiu      $a3, $a3, %lo(jtbl_80116FA8)
    /* 4AB48 8005AB48 21288000 */  addu       $a1, $a0, $zero
    /* 4AB4C 8005AB4C 21300000 */  addu       $a2, $zero, $zero
  .L8005AB50:
    /* 4AB50 8005AB50 21107300 */  addu       $v0, $v1, $s3
    /* 4AB54 8005AB54 80100200 */  sll        $v0, $v0, 2
    /* 4AB58 8005AB58 21105300 */  addu       $v0, $v0, $s3
    /* 4AB5C 8005AB5C 00110200 */  sll        $v0, $v0, 4
    /* 4AB60 8005AB60 23105300 */  subu       $v0, $v0, $s3
    /* 4AB64 8005AB64 80100200 */  sll        $v0, $v0, 2
    /* 4AB68 8005AB68 21105300 */  addu       $v0, $v0, $s3
    /* 4AB6C 8005AB6C C0100200 */  sll        $v0, $v0, 3
    /* 4AB70 8005AB70 2110C200 */  addu       $v0, $a2, $v0
    /* 4AB74 8005AB74 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 4AB78 8005AB78 21082200 */  addu       $at, $at, $v0
    /* 4AB7C 8005AB7C 08AA2294 */  lhu        $v0, %lo(plr + 0x4D0)($at)
    /* 4AB80 8005AB80 00000000 */  nop
    /* 4AB84 8005AB84 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4AB88 8005AB88 00140200 */  sll        $v0, $v0, 16
    /* 4AB8C 8005AB8C 031C0200 */  sra        $v1, $v0, 16
    /* 4AB90 8005AB90 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 4AB94 8005AB94 24004010 */  beqz       $v0, .L8005AC28
    /* 4AB98 8005AB98 80100300 */   sll       $v0, $v1, 2
    /* 4AB9C 8005AB9C 21104700 */  addu       $v0, $v0, $a3
    /* 4ABA0 8005ABA0 0000428C */  lw         $v0, 0x0($v0)
    /* 4ABA4 8005ABA4 00000000 */  nop
    /* 4ABA8 8005ABA8 08004000 */  jr         $v0
    /* 4ABAC 8005ABAC 00000000 */   nop
  jlabel .L8005ABB0
    /* 4ABB0 8005ABB0 0E80013C */  lui        $at, %hi(plr + 0x4EE)
    /* 4ABB4 8005ABB4 21082500 */  addu       $at, $at, $a1
    /* 4ABB8 8005ABB8 26AA2290 */  lbu        $v0, %lo(plr + 0x4EE)($at)
    /* 4ABBC 8005ABBC 00000000 */  nop
    /* 4ABC0 8005ABC0 02004224 */  addiu      $v0, $v0, 0x2
    /* 4ABC4 8005ABC4 0E80013C */  lui        $at, %hi(plr + 0x4EE)
    /* 4ABC8 8005ABC8 21082500 */  addu       $at, $at, $a1
    /* 4ABCC 8005ABCC 26AA22A0 */  sb         $v0, %lo(plr + 0x4EE)($at)
    /* 4ABD0 8005ABD0 0B6B0108 */  j          .L8005AC2C
    /* 4ABD4 8005ABD4 6C00A524 */   addiu     $a1, $a1, 0x6C
  jlabel .L8005ABD8
    /* 4ABD8 8005ABD8 0E80013C */  lui        $at, %hi(plr + 0x4E0)
    /* 4ABDC 8005ABDC 21082500 */  addu       $at, $at, $a1
    /* 4ABE0 8005ABE0 18AA2290 */  lbu        $v0, %lo(plr + 0x4E0)($at)
    /* 4ABE4 8005ABE4 0E80013C */  lui        $at, %hi(plr + 0x4DF)
    /* 4ABE8 8005ABE8 21082500 */  addu       $at, $at, $a1
    /* 4ABEC 8005ABEC 17AA2380 */  lb         $v1, %lo(plr + 0x4DF)($at)
    /* 4ABF0 8005ABF0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4ABF4 8005ABF4 0E80013C */  lui        $at, %hi(plr + 0x4E0)
    /* 4ABF8 8005ABF8 21082500 */  addu       $at, $at, $a1
    /* 4ABFC 8005ABFC 18AA22A0 */  sb         $v0, %lo(plr + 0x4E0)($at)
    /* 4AC00 8005AC00 0E80013C */  lui        $at, %hi(plr + 0x4E0)
    /* 4AC04 8005AC04 21082500 */  addu       $at, $at, $a1
    /* 4AC08 8005AC08 18AA2280 */  lb         $v0, %lo(plr + 0x4E0)($at)
    /* 4AC0C 8005AC0C 00000000 */  nop
    /* 4AC10 8005AC10 2A104300 */  slt        $v0, $v0, $v1
    /* 4AC14 8005AC14 04004010 */  beqz       $v0, .L8005AC28
    /* 4AC18 8005AC18 21206000 */   addu      $a0, $v1, $zero
    /* 4AC1C 8005AC1C 0E80013C */  lui        $at, %hi(plr + 0x4E0)
    /* 4AC20 8005AC20 21082500 */  addu       $at, $at, $a1
    /* 4AC24 8005AC24 18AA24A0 */  sb         $a0, %lo(plr + 0x4E0)($at)
  .L8005AC28:
    /* 4AC28 8005AC28 6C00A524 */  addiu      $a1, $a1, 0x6C
  .L8005AC2C:
    /* 4AC2C 8005AC2C 40181300 */  sll        $v1, $s3, 1
    /* 4AC30 8005AC30 21107300 */  addu       $v0, $v1, $s3
    /* 4AC34 8005AC34 80100200 */  sll        $v0, $v0, 2
    /* 4AC38 8005AC38 21105300 */  addu       $v0, $v0, $s3
    /* 4AC3C 8005AC3C 00110200 */  sll        $v0, $v0, 4
    /* 4AC40 8005AC40 23105300 */  subu       $v0, $v0, $s3
    /* 4AC44 8005AC44 80100200 */  sll        $v0, $v0, 2
    /* 4AC48 8005AC48 21105300 */  addu       $v0, $v0, $s3
    /* 4AC4C 8005AC4C C0100200 */  sll        $v0, $v0, 3
    /* 4AC50 8005AC50 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4AC54 8005AC54 21082200 */  addu       $at, $at, $v0
    /* 4AC58 8005AC58 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4AC5C 8005AC5C 01005226 */  addiu      $s2, $s2, 0x1
    /* 4AC60 8005AC60 2A104202 */  slt        $v0, $s2, $v0
    /* 4AC64 8005AC64 BAFF4014 */  bnez       $v0, .L8005AB50
    /* 4AC68 8005AC68 6C00C624 */   addiu     $a2, $a2, 0x6C
  .L8005AC6C:
    /* 4AC6C 8005AC6C 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4AC70 8005AC70 0E000424 */   addiu     $a0, $zero, 0xE
    /* 4AC74 8005AC74 FD710108 */  j          .L8005C7F4
    /* 4AC78 8005AC78 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005AC7C
    /* 4AC7C 8005AC7C 40101300 */  sll        $v0, $s3, 1
    /* 4AC80 8005AC80 21105300 */  addu       $v0, $v0, $s3
    /* 4AC84 8005AC84 80100200 */  sll        $v0, $v0, 2
    /* 4AC88 8005AC88 21105300 */  addu       $v0, $v0, $s3
    /* 4AC8C 8005AC8C 00110200 */  sll        $v0, $v0, 4
    /* 4AC90 8005AC90 23105300 */  subu       $v0, $v0, $s3
    /* 4AC94 8005AC94 80100200 */  sll        $v0, $v0, 2
    /* 4AC98 8005AC98 21105300 */  addu       $v0, $v0, $s3
    /* 4AC9C 8005AC9C C0180200 */  sll        $v1, $v0, 3
    /* 4ACA0 8005ACA0 0E80013C */  lui        $at, %hi(plr + 0x38C)
    /* 4ACA4 8005ACA4 21082300 */  addu       $at, $at, $v1
    /* 4ACA8 8005ACA8 C4A82484 */  lh         $a0, %lo(plr + 0x38C)($at)
    /* 4ACAC 8005ACAC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4ACB0 8005ACB0 0B008210 */  beq        $a0, $v0, .L8005ACE0
    /* 4ACB4 8005ACB4 05000224 */   addiu     $v0, $zero, 0x5
    /* 4ACB8 8005ACB8 0A008210 */  beq        $a0, $v0, .L8005ACE4
    /* 4ACBC 8005ACBC 40101300 */   sll       $v0, $s3, 1
    /* 4ACC0 8005ACC0 0E80013C */  lui        $at, %hi(plr + 0x39C)
    /* 4ACC4 8005ACC4 21082300 */  addu       $at, $at, $v1
    /* 4ACC8 8005ACC8 D4A82290 */  lbu        $v0, %lo(plr + 0x39C)($at)
    /* 4ACCC 8005ACCC 00000000 */  nop
    /* 4ACD0 8005ACD0 01004224 */  addiu      $v0, $v0, 0x1
    /* 4ACD4 8005ACD4 0E80013C */  lui        $at, %hi(plr + 0x39C)
    /* 4ACD8 8005ACD8 21082300 */  addu       $at, $at, $v1
    /* 4ACDC 8005ACDC D4A822A0 */  sb         $v0, %lo(plr + 0x39C)($at)
  .L8005ACE0:
    /* 4ACE0 8005ACE0 40101300 */  sll        $v0, $s3, 1
  .L8005ACE4:
    /* 4ACE4 8005ACE4 21105300 */  addu       $v0, $v0, $s3
    /* 4ACE8 8005ACE8 80100200 */  sll        $v0, $v0, 2
    /* 4ACEC 8005ACEC 21105300 */  addu       $v0, $v0, $s3
    /* 4ACF0 8005ACF0 00110200 */  sll        $v0, $v0, 4
    /* 4ACF4 8005ACF4 23105300 */  subu       $v0, $v0, $s3
    /* 4ACF8 8005ACF8 80100200 */  sll        $v0, $v0, 2
    /* 4ACFC 8005ACFC 21105300 */  addu       $v0, $v0, $s3
    /* 4AD00 8005AD00 C0180200 */  sll        $v1, $v0, 3
    /* 4AD04 8005AD04 0E80013C */  lui        $at, %hi(plr + 0x3F8)
    /* 4AD08 8005AD08 21082300 */  addu       $at, $at, $v1
    /* 4AD0C 8005AD0C 30A92484 */  lh         $a0, %lo(plr + 0x3F8)($at)
    /* 4AD10 8005AD10 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4AD14 8005AD14 0B008210 */  beq        $a0, $v0, .L8005AD44
    /* 4AD18 8005AD18 05000224 */   addiu     $v0, $zero, 0x5
    /* 4AD1C 8005AD1C 09008210 */  beq        $a0, $v0, .L8005AD44
    /* 4AD20 8005AD20 00000000 */   nop
    /* 4AD24 8005AD24 0E80013C */  lui        $at, %hi(plr + 0x408)
    /* 4AD28 8005AD28 21082300 */  addu       $at, $at, $v1
    /* 4AD2C 8005AD2C 40A92290 */  lbu        $v0, %lo(plr + 0x408)($at)
    /* 4AD30 8005AD30 00000000 */  nop
    /* 4AD34 8005AD34 01004224 */  addiu      $v0, $v0, 0x1
    /* 4AD38 8005AD38 0E80013C */  lui        $at, %hi(plr + 0x408)
    /* 4AD3C 8005AD3C 21082300 */  addu       $at, $at, $v1
    /* 4AD40 8005AD40 40A922A0 */  sb         $v0, %lo(plr + 0x408)($at)
  .L8005AD44:
    /* 4AD44 8005AD44 40181300 */  sll        $v1, $s3, 1
    /* 4AD48 8005AD48 21107300 */  addu       $v0, $v1, $s3
    /* 4AD4C 8005AD4C 80100200 */  sll        $v0, $v0, 2
    /* 4AD50 8005AD50 21105300 */  addu       $v0, $v0, $s3
    /* 4AD54 8005AD54 00110200 */  sll        $v0, $v0, 4
    /* 4AD58 8005AD58 23105300 */  subu       $v0, $v0, $s3
    /* 4AD5C 8005AD5C 80100200 */  sll        $v0, $v0, 2
    /* 4AD60 8005AD60 21105300 */  addu       $v0, $v0, $s3
    /* 4AD64 8005AD64 C0100200 */  sll        $v0, $v0, 3
    /* 4AD68 8005AD68 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4AD6C 8005AD6C 21082200 */  addu       $at, $at, $v0
    /* 4AD70 8005AD70 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4AD74 8005AD74 00000000 */  nop
    /* 4AD78 8005AD78 2E004018 */  blez       $v0, .L8005AE34
    /* 4AD7C 8005AD7C 21900000 */   addu      $s2, $zero, $zero
    /* 4AD80 8005AD80 0A000724 */  addiu      $a3, $zero, 0xA
    /* 4AD84 8005AD84 0E80063C */  lui        $a2, %hi(plr)
    /* 4AD88 8005AD88 38A5C624 */  addiu      $a2, $a2, %lo(plr)
    /* 4AD8C 8005AD8C 21280000 */  addu       $a1, $zero, $zero
  .L8005AD90:
    /* 4AD90 8005AD90 21107300 */  addu       $v0, $v1, $s3
    /* 4AD94 8005AD94 80100200 */  sll        $v0, $v0, 2
    /* 4AD98 8005AD98 21105300 */  addu       $v0, $v0, $s3
    /* 4AD9C 8005AD9C 00110200 */  sll        $v0, $v0, 4
    /* 4ADA0 8005ADA0 23105300 */  subu       $v0, $v0, $s3
    /* 4ADA4 8005ADA4 80100200 */  sll        $v0, $v0, 2
    /* 4ADA8 8005ADA8 21105300 */  addu       $v0, $v0, $s3
    /* 4ADAC 8005ADAC C0100200 */  sll        $v0, $v0, 3
    /* 4ADB0 8005ADB0 2118A200 */  addu       $v1, $a1, $v0
    /* 4ADB4 8005ADB4 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 4ADB8 8005ADB8 21082300 */  addu       $at, $at, $v1
    /* 4ADBC 8005ADBC 08AA2484 */  lh         $a0, %lo(plr + 0x4D0)($at)
    /* 4ADC0 8005ADC0 00000000 */  nop
    /* 4ADC4 8005ADC4 0B008018 */  blez       $a0, .L8005ADF4
    /* 4ADC8 8005ADC8 05008228 */   slti      $v0, $a0, 0x5
    /* 4ADCC 8005ADCC 03004014 */  bnez       $v0, .L8005ADDC
    /* 4ADD0 8005ADD0 00000000 */   nop
    /* 4ADD4 8005ADD4 07008714 */  bne        $a0, $a3, .L8005ADF4
    /* 4ADD8 8005ADD8 00000000 */   nop
  .L8005ADDC:
    /* 4ADDC 8005ADDC 0E80013C */  lui        $at, %hi(plr + 0x4E0)
    /* 4ADE0 8005ADE0 21082300 */  addu       $at, $at, $v1
    /* 4ADE4 8005ADE4 18AA2290 */  lbu        $v0, %lo(plr + 0x4E0)($at)
    /* 4ADE8 8005ADE8 21186600 */  addu       $v1, $v1, $a2
    /* 4ADEC 8005ADEC 01004224 */  addiu      $v0, $v0, 0x1
    /* 4ADF0 8005ADF0 E00462A0 */  sb         $v0, 0x4E0($v1)
  .L8005ADF4:
    /* 4ADF4 8005ADF4 40181300 */  sll        $v1, $s3, 1
    /* 4ADF8 8005ADF8 21107300 */  addu       $v0, $v1, $s3
    /* 4ADFC 8005ADFC 80100200 */  sll        $v0, $v0, 2
    /* 4AE00 8005AE00 21105300 */  addu       $v0, $v0, $s3
    /* 4AE04 8005AE04 00110200 */  sll        $v0, $v0, 4
    /* 4AE08 8005AE08 23105300 */  subu       $v0, $v0, $s3
    /* 4AE0C 8005AE0C 80100200 */  sll        $v0, $v0, 2
    /* 4AE10 8005AE10 21105300 */  addu       $v0, $v0, $s3
    /* 4AE14 8005AE14 C0100200 */  sll        $v0, $v0, 3
    /* 4AE18 8005AE18 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4AE1C 8005AE1C 21082200 */  addu       $at, $at, $v0
    /* 4AE20 8005AE20 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4AE24 8005AE24 01005226 */  addiu      $s2, $s2, 0x1
    /* 4AE28 8005AE28 2A104202 */  slt        $v0, $s2, $v0
    /* 4AE2C 8005AE2C D8FF4014 */  bnez       $v0, .L8005AD90
    /* 4AE30 8005AE30 6C00A524 */   addiu     $a1, $a1, 0x6C
  .L8005AE34:
    /* 4AE34 8005AE34 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4AE38 8005AE38 0F000424 */   addiu     $a0, $zero, 0xF
    /* 4AE3C 8005AE3C FD710108 */  j          .L8005C7F4
    /* 4AE40 8005AE40 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005AE44
    /* 4AE44 8005AE44 40101300 */  sll        $v0, $s3, 1
    /* 4AE48 8005AE48 21105300 */  addu       $v0, $v0, $s3
    /* 4AE4C 8005AE4C 80100200 */  sll        $v0, $v0, 2
    /* 4AE50 8005AE50 21105300 */  addu       $v0, $v0, $s3
    /* 4AE54 8005AE54 00110200 */  sll        $v0, $v0, 4
    /* 4AE58 8005AE58 23105300 */  subu       $v0, $v0, $s3
    /* 4AE5C 8005AE5C 80100200 */  sll        $v0, $v0, 2
    /* 4AE60 8005AE60 21105300 */  addu       $v0, $v0, $s3
    /* 4AE64 8005AE64 C0100200 */  sll        $v0, $v0, 3
    /* 4AE68 8005AE68 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 4AE6C 8005AE6C 21082200 */  addu       $at, $at, $v0
    /* 4AE70 8005AE70 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 4AE74 8005AE74 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 4AE78 8005AE78 21082200 */  addu       $at, $at, $v0
    /* 4AE7C 8005AE7C 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 4AE80 8005AE80 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 4AE84 8005AE84 21082200 */  addu       $at, $at, $v0
    /* 4AE88 8005AE88 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* 4AE8C 8005AE8C 0D000224 */  addiu      $v0, $zero, 0xD
    /* 4AE90 8005AE90 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4AE94 8005AE94 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4AE98 8005AE98 1800A2AF */  sw         $v0, 0x18($sp)
    /* 4AE9C 8005AE9C 1280023C */  lui        $v0, %hi(leveltype)
    /* 4AEA0 8005AEA0 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4AEA4 8005AEA4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4AEA8 8005AEA8 2000A0AF */  sw         $zero, 0x20($sp)
    /* 4AEAC 8005AEAC 21308000 */  addu       $a2, $a0, $zero
    /* 4AEB0 8005AEB0 2138A000 */  addu       $a3, $a1, $zero
    /* 4AEB4 8005AEB4 40100200 */  sll        $v0, $v0, 1
    /* 4AEB8 8005AEB8 1000A3AF */  sw         $v1, 0x10($sp)
    /* 4AEBC 8005AEBC 810A050C */  jal        func_80142A04
    /* 4AEC0 8005AEC0 2400A2AF */   sw        $v0, 0x24($sp)
    /* 4AEC4 8005AEC4 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4AEC8 8005AEC8 10000424 */   addiu     $a0, $zero, 0x10
    /* 4AECC 8005AECC FD710108 */  j          .L8005C7F4
    /* 4AED0 8005AED0 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005AED4
    /* 4AED4 8005AED4 21900000 */  addu       $s2, $zero, $zero
    /* 4AED8 8005AED8 0A000424 */  addiu      $a0, $zero, 0xA
    /* 4AEDC 8005AEDC 40101300 */  sll        $v0, $s3, 1
    /* 4AEE0 8005AEE0 21105300 */  addu       $v0, $v0, $s3
    /* 4AEE4 8005AEE4 80100200 */  sll        $v0, $v0, 2
    /* 4AEE8 8005AEE8 21105300 */  addu       $v0, $v0, $s3
    /* 4AEEC 8005AEEC 00110200 */  sll        $v0, $v0, 4
    /* 4AEF0 8005AEF0 23105300 */  subu       $v0, $v0, $s3
    /* 4AEF4 8005AEF4 80100200 */  sll        $v0, $v0, 2
    /* 4AEF8 8005AEF8 21105300 */  addu       $v0, $v0, $s3
    /* 4AEFC 8005AEFC C0180200 */  sll        $v1, $v0, 3
  .L8005AF00:
    /* 4AF00 8005AF00 0E80013C */  lui        $at, %hi(plr + 0x1DC)
    /* 4AF04 8005AF04 21082300 */  addu       $at, $at, $v1
    /* 4AF08 8005AF08 14A72284 */  lh         $v0, %lo(plr + 0x1DC)($at)
    /* 4AF0C 8005AF0C 00000000 */  nop
    /* 4AF10 8005AF10 07004414 */  bne        $v0, $a0, .L8005AF30
    /* 4AF14 8005AF14 00000000 */   nop
    /* 4AF18 8005AF18 0E80013C */  lui        $at, %hi(plr + 0x1FB)
    /* 4AF1C 8005AF1C 21082300 */  addu       $at, $at, $v1
    /* 4AF20 8005AF20 33A72290 */  lbu        $v0, %lo(plr + 0x1FB)($at)
    /* 4AF24 8005AF24 0E80013C */  lui        $at, %hi(plr + 0x1F9)
    /* 4AF28 8005AF28 21082300 */  addu       $at, $at, $v1
    /* 4AF2C 8005AF2C 31A722A0 */  sb         $v0, %lo(plr + 0x1F9)($at)
  .L8005AF30:
    /* 4AF30 8005AF30 01005226 */  addiu      $s2, $s2, 0x1
    /* 4AF34 8005AF34 0700422A */  slti       $v0, $s2, 0x7
    /* 4AF38 8005AF38 F1FF4014 */  bnez       $v0, .L8005AF00
    /* 4AF3C 8005AF3C 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 4AF40 8005AF40 40281300 */  sll        $a1, $s3, 1
    /* 4AF44 8005AF44 2110B300 */  addu       $v0, $a1, $s3
    /* 4AF48 8005AF48 80100200 */  sll        $v0, $v0, 2
    /* 4AF4C 8005AF4C 21105300 */  addu       $v0, $v0, $s3
    /* 4AF50 8005AF50 00110200 */  sll        $v0, $v0, 4
    /* 4AF54 8005AF54 23105300 */  subu       $v0, $v0, $s3
    /* 4AF58 8005AF58 80100200 */  sll        $v0, $v0, 2
    /* 4AF5C 8005AF5C 21105300 */  addu       $v0, $v0, $s3
    /* 4AF60 8005AF60 C0100200 */  sll        $v0, $v0, 3
    /* 4AF64 8005AF64 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4AF68 8005AF68 21082200 */  addu       $at, $at, $v0
    /* 4AF6C 8005AF6C BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4AF70 8005AF70 00000000 */  nop
    /* 4AF74 8005AF74 1F004018 */  blez       $v0, .L8005AFF4
    /* 4AF78 8005AF78 21900000 */   addu      $s2, $zero, $zero
    /* 4AF7C 8005AF7C 0A000724 */  addiu      $a3, $zero, 0xA
    /* 4AF80 8005AF80 21300000 */  addu       $a2, $zero, $zero
  .L8005AF84:
    /* 4AF84 8005AF84 2110B300 */  addu       $v0, $a1, $s3
    /* 4AF88 8005AF88 80100200 */  sll        $v0, $v0, 2
    /* 4AF8C 8005AF8C 21105300 */  addu       $v0, $v0, $s3
    /* 4AF90 8005AF90 00110200 */  sll        $v0, $v0, 4
    /* 4AF94 8005AF94 23105300 */  subu       $v0, $v0, $s3
    /* 4AF98 8005AF98 80100200 */  sll        $v0, $v0, 2
    /* 4AF9C 8005AF9C 21105300 */  addu       $v0, $v0, $s3
    /* 4AFA0 8005AFA0 C0200200 */  sll        $a0, $v0, 3
    /* 4AFA4 8005AFA4 2118C400 */  addu       $v1, $a2, $a0
    /* 4AFA8 8005AFA8 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 4AFAC 8005AFAC 21082300 */  addu       $at, $at, $v1
    /* 4AFB0 8005AFB0 08AA2284 */  lh         $v0, %lo(plr + 0x4D0)($at)
    /* 4AFB4 8005AFB4 00000000 */  nop
    /* 4AFB8 8005AFB8 07004714 */  bne        $v0, $a3, .L8005AFD8
    /* 4AFBC 8005AFBC 00000000 */   nop
    /* 4AFC0 8005AFC0 0E80013C */  lui        $at, %hi(plr + 0x4EF)
    /* 4AFC4 8005AFC4 21082300 */  addu       $at, $at, $v1
    /* 4AFC8 8005AFC8 27AA2290 */  lbu        $v0, %lo(plr + 0x4EF)($at)
    /* 4AFCC 8005AFCC 0E80013C */  lui        $at, %hi(plr + 0x4ED)
    /* 4AFD0 8005AFD0 21082300 */  addu       $at, $at, $v1
    /* 4AFD4 8005AFD4 25AA22A0 */  sb         $v0, %lo(plr + 0x4ED)($at)
  .L8005AFD8:
    /* 4AFD8 8005AFD8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4AFDC 8005AFDC 21082400 */  addu       $at, $at, $a0
    /* 4AFE0 8005AFE0 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4AFE4 8005AFE4 01005226 */  addiu      $s2, $s2, 0x1
    /* 4AFE8 8005AFE8 2A104202 */  slt        $v0, $s2, $v0
    /* 4AFEC 8005AFEC E5FF4014 */  bnez       $v0, .L8005AF84
    /* 4AFF0 8005AFF0 6C00C624 */   addiu     $a2, $a2, 0x6C
  .L8005AFF4:
    /* 4AFF4 8005AFF4 21900000 */  addu       $s2, $zero, $zero
    /* 4AFF8 8005AFF8 0A000424 */  addiu      $a0, $zero, 0xA
    /* 4AFFC 8005AFFC 40101300 */  sll        $v0, $s3, 1
    /* 4B000 8005B000 21105300 */  addu       $v0, $v0, $s3
    /* 4B004 8005B004 80100200 */  sll        $v0, $v0, 2
    /* 4B008 8005B008 21105300 */  addu       $v0, $v0, $s3
    /* 4B00C 8005B00C 00110200 */  sll        $v0, $v0, 4
    /* 4B010 8005B010 23105300 */  subu       $v0, $v0, $s3
    /* 4B014 8005B014 80100200 */  sll        $v0, $v0, 2
    /* 4B018 8005B018 21105300 */  addu       $v0, $v0, $s3
    /* 4B01C 8005B01C C0180200 */  sll        $v1, $v0, 3
  .L8005B020:
    /* 4B020 8005B020 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 4B024 8005B024 21082300 */  addu       $at, $at, $v1
    /* 4B028 8005B028 14BB2284 */  lh         $v0, %lo(plr + 0x15DC)($at)
    /* 4B02C 8005B02C 00000000 */  nop
    /* 4B030 8005B030 07004414 */  bne        $v0, $a0, .L8005B050
    /* 4B034 8005B034 00000000 */   nop
    /* 4B038 8005B038 0E80013C */  lui        $at, %hi(plr + 0x15FB)
    /* 4B03C 8005B03C 21082300 */  addu       $at, $at, $v1
    /* 4B040 8005B040 33BB2290 */  lbu        $v0, %lo(plr + 0x15FB)($at)
    /* 4B044 8005B044 0E80013C */  lui        $at, %hi(plr + 0x15F9)
    /* 4B048 8005B048 21082300 */  addu       $at, $at, $v1
    /* 4B04C 8005B04C 31BB22A0 */  sb         $v0, %lo(plr + 0x15F9)($at)
  .L8005B050:
    /* 4B050 8005B050 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B054 8005B054 0800422A */  slti       $v0, $s2, 0x8
    /* 4B058 8005B058 F1FF4014 */  bnez       $v0, .L8005B020
    /* 4B05C 8005B05C 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 4B060 8005B060 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4B064 8005B064 11000424 */   addiu     $a0, $zero, 0x11
    /* 4B068 8005B068 FD710108 */  j          .L8005C7F4
    /* 4B06C 8005B06C 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005B070
    /* 4B070 8005B070 21900000 */  addu       $s2, $zero, $zero
    /* 4B074 8005B074 40101300 */  sll        $v0, $s3, 1
    /* 4B078 8005B078 21105300 */  addu       $v0, $v0, $s3
    /* 4B07C 8005B07C 80100200 */  sll        $v0, $v0, 2
    /* 4B080 8005B080 21105300 */  addu       $v0, $v0, $s3
    /* 4B084 8005B084 00110200 */  sll        $v0, $v0, 4
    /* 4B088 8005B088 23105300 */  subu       $v0, $v0, $s3
    /* 4B08C 8005B08C 80100200 */  sll        $v0, $v0, 2
    /* 4B090 8005B090 21105300 */  addu       $v0, $v0, $s3
    /* 4B094 8005B094 C0180200 */  sll        $v1, $v0, 3
  .L8005B098:
    /* 4B098 8005B098 0E80013C */  lui        $at, %hi(plr + 0x1F0)
    /* 4B09C 8005B09C 21082300 */  addu       $at, $at, $v1
    /* 4B0A0 8005B0A0 28A72294 */  lhu        $v0, %lo(plr + 0x1F0)($at)
    /* 4B0A4 8005B0A4 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B0A8 8005B0A8 0E80013C */  lui        $at, %hi(plr + 0x1EE)
    /* 4B0AC 8005B0AC 21082300 */  addu       $at, $at, $v1
    /* 4B0B0 8005B0B0 26A722A4 */  sh         $v0, %lo(plr + 0x1EE)($at)
    /* 4B0B4 8005B0B4 0700422A */  slti       $v0, $s2, 0x7
    /* 4B0B8 8005B0B8 F7FF4014 */  bnez       $v0, .L8005B098
    /* 4B0BC 8005B0BC 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 4B0C0 8005B0C0 40281300 */  sll        $a1, $s3, 1
    /* 4B0C4 8005B0C4 2110B300 */  addu       $v0, $a1, $s3
    /* 4B0C8 8005B0C8 80100200 */  sll        $v0, $v0, 2
    /* 4B0CC 8005B0CC 21105300 */  addu       $v0, $v0, $s3
    /* 4B0D0 8005B0D0 00110200 */  sll        $v0, $v0, 4
    /* 4B0D4 8005B0D4 23105300 */  subu       $v0, $v0, $s3
    /* 4B0D8 8005B0D8 80100200 */  sll        $v0, $v0, 2
    /* 4B0DC 8005B0DC 21105300 */  addu       $v0, $v0, $s3
    /* 4B0E0 8005B0E0 C0100200 */  sll        $v0, $v0, 3
    /* 4B0E4 8005B0E4 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4B0E8 8005B0E8 21082200 */  addu       $at, $at, $v0
    /* 4B0EC 8005B0EC BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4B0F0 8005B0F0 00000000 */  nop
    /* 4B0F4 8005B0F4 18004018 */  blez       $v0, .L8005B158
    /* 4B0F8 8005B0F8 21900000 */   addu      $s2, $zero, $zero
    /* 4B0FC 8005B0FC 21300000 */  addu       $a2, $zero, $zero
  .L8005B100:
    /* 4B100 8005B100 2110B300 */  addu       $v0, $a1, $s3
    /* 4B104 8005B104 80100200 */  sll        $v0, $v0, 2
    /* 4B108 8005B108 21105300 */  addu       $v0, $v0, $s3
    /* 4B10C 8005B10C 00110200 */  sll        $v0, $v0, 4
    /* 4B110 8005B110 23105300 */  subu       $v0, $v0, $s3
    /* 4B114 8005B114 80100200 */  sll        $v0, $v0, 2
    /* 4B118 8005B118 21105300 */  addu       $v0, $v0, $s3
    /* 4B11C 8005B11C C0100200 */  sll        $v0, $v0, 3
    /* 4B120 8005B120 2120C200 */  addu       $a0, $a2, $v0
    /* 4B124 8005B124 0E80013C */  lui        $at, %hi(plr + 0x4E4)
    /* 4B128 8005B128 21082400 */  addu       $at, $at, $a0
    /* 4B12C 8005B12C 1CAA2394 */  lhu        $v1, %lo(plr + 0x4E4)($at)
    /* 4B130 8005B130 0E80013C */  lui        $at, %hi(plr + 0x4E2)
    /* 4B134 8005B134 21082400 */  addu       $at, $at, $a0
    /* 4B138 8005B138 1AAA23A4 */  sh         $v1, %lo(plr + 0x4E2)($at)
    /* 4B13C 8005B13C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4B140 8005B140 21082200 */  addu       $at, $at, $v0
    /* 4B144 8005B144 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4B148 8005B148 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B14C 8005B14C 2A104202 */  slt        $v0, $s2, $v0
    /* 4B150 8005B150 EBFF4014 */  bnez       $v0, .L8005B100
    /* 4B154 8005B154 6C00C624 */   addiu     $a2, $a2, 0x6C
  .L8005B158:
    /* 4B158 8005B158 21900000 */  addu       $s2, $zero, $zero
    /* 4B15C 8005B15C 40101300 */  sll        $v0, $s3, 1
    /* 4B160 8005B160 21105300 */  addu       $v0, $v0, $s3
    /* 4B164 8005B164 80100200 */  sll        $v0, $v0, 2
    /* 4B168 8005B168 21105300 */  addu       $v0, $v0, $s3
    /* 4B16C 8005B16C 00110200 */  sll        $v0, $v0, 4
    /* 4B170 8005B170 23105300 */  subu       $v0, $v0, $s3
    /* 4B174 8005B174 80100200 */  sll        $v0, $v0, 2
    /* 4B178 8005B178 21105300 */  addu       $v0, $v0, $s3
    /* 4B17C 8005B17C C0180200 */  sll        $v1, $v0, 3
  .L8005B180:
    /* 4B180 8005B180 0E80013C */  lui        $at, %hi(plr + 0x15F0)
    /* 4B184 8005B184 21082300 */  addu       $at, $at, $v1
    /* 4B188 8005B188 28BB2294 */  lhu        $v0, %lo(plr + 0x15F0)($at)
    /* 4B18C 8005B18C 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B190 8005B190 0E80013C */  lui        $at, %hi(plr + 0x15EE)
    /* 4B194 8005B194 21082300 */  addu       $at, $at, $v1
    /* 4B198 8005B198 26BB22A4 */  sh         $v0, %lo(plr + 0x15EE)($at)
    /* 4B19C 8005B19C 0800422A */  slti       $v0, $s2, 0x8
    /* 4B1A0 8005B1A0 F7FF4014 */  bnez       $v0, .L8005B180
    /* 4B1A4 8005B1A4 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 4B1A8 8005B1A8 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4B1AC 8005B1AC 12000424 */   addiu     $a0, $zero, 0x12
    /* 4B1B0 8005B1B0 FD710108 */  j          .L8005C7F4
    /* 4B1B4 8005B1B4 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005B1B8
    /* 4B1B8 8005B1B8 21300000 */  addu       $a2, $zero, $zero
    /* 4B1BC 8005B1BC 00001124 */  addiu      $s1, $zero, 0x0
    /* 4B1C0 8005B1C0 01001024 */  addiu      $s0, $zero, 0x1
    /* 4B1C4 8005B1C4 01001224 */  addiu      $s2, $zero, 0x1
    /* 4B1C8 8005B1C8 40101300 */  sll        $v0, $s3, 1
    /* 4B1CC 8005B1CC 21105300 */  addu       $v0, $v0, $s3
    /* 4B1D0 8005B1D0 80100200 */  sll        $v0, $v0, 2
    /* 4B1D4 8005B1D4 21105300 */  addu       $v0, $v0, $s3
    /* 4B1D8 8005B1D8 00110200 */  sll        $v0, $v0, 4
    /* 4B1DC 8005B1DC 23105300 */  subu       $v0, $v0, $s3
    /* 4B1E0 8005B1E0 80100200 */  sll        $v0, $v0, 2
    /* 4B1E4 8005B1E4 21105300 */  addu       $v0, $v0, $s3
    /* 4B1E8 8005B1E8 C0100200 */  sll        $v0, $v0, 3
    /* 4B1EC 8005B1EC 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4B1F0 8005B1F0 21082200 */  addu       $at, $at, $v0
    /* 4B1F4 8005B1F4 F0A5248C */  lw         $a0, %lo(plr + 0xB8)($at)
    /* 4B1F8 8005B1F8 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4B1FC 8005B1FC 21082200 */  addu       $at, $at, $v0
    /* 4B200 8005B200 F4A5258C */  lw         $a1, %lo(plr + 0xBC)($at)
    /* 4B204 8005B204 24109000 */  and        $v0, $a0, $s0
  .L8005B208:
    /* 4B208 8005B208 03004014 */  bnez       $v0, .L8005B218
    /* 4B20C 8005B20C 2418B100 */   and       $v1, $a1, $s1
    /* 4B210 8005B210 02006010 */  beqz       $v1, .L8005B21C
    /* 4B214 8005B214 00000000 */   nop
  .L8005B218:
    /* 4B218 8005B218 0100C624 */  addiu      $a2, $a2, 0x1
  .L8005B21C:
    /* 4B21C 8005B21C 40881100 */  sll        $s1, $s1, 1
    /* 4B220 8005B220 C2171000 */  srl        $v0, $s0, 31
    /* 4B224 8005B224 25882202 */  or         $s1, $s1, $v0
    /* 4B228 8005B228 40801000 */  sll        $s0, $s0, 1
    /* 4B22C 8005B22C 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B230 8005B230 2600422A */  slti       $v0, $s2, 0x26
    /* 4B234 8005B234 F4FF4014 */  bnez       $v0, .L8005B208
    /* 4B238 8005B238 24109000 */   and       $v0, $a0, $s0
    /* 4B23C 8005B23C 0200C228 */  slti       $v0, $a2, 0x2
    /* 4B240 8005B240 64004014 */  bnez       $v0, .L8005B3D4
    /* 4B244 8005B244 01001224 */   addiu     $s2, $zero, 0x1
    /* 4B248 8005B248 00001124 */  addiu      $s1, $zero, 0x0
    /* 4B24C 8005B24C 01001024 */  addiu      $s0, $zero, 0x1
    /* 4B250 8005B250 40101300 */  sll        $v0, $s3, 1
    /* 4B254 8005B254 21105300 */  addu       $v0, $v0, $s3
    /* 4B258 8005B258 80100200 */  sll        $v0, $v0, 2
    /* 4B25C 8005B25C 21105300 */  addu       $v0, $v0, $s3
    /* 4B260 8005B260 00110200 */  sll        $v0, $v0, 4
    /* 4B264 8005B264 23105300 */  subu       $v0, $v0, $s3
    /* 4B268 8005B268 80100200 */  sll        $v0, $v0, 2
    /* 4B26C 8005B26C 21105300 */  addu       $v0, $v0, $s3
    /* 4B270 8005B270 C0280200 */  sll        $a1, $v0, 3
    /* 4B274 8005B274 0E80023C */  lui        $v0, %hi(plr + 0x72)
    /* 4B278 8005B278 AAA54224 */  addiu      $v0, $v0, %lo(plr + 0x72)
    /* 4B27C 8005B27C 2120A200 */  addu       $a0, $a1, $v0
  .L8005B280:
    /* 4B280 8005B280 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4B284 8005B284 21082500 */  addu       $at, $at, $a1
    /* 4B288 8005B288 F0A5228C */  lw         $v0, %lo(plr + 0xB8)($at)
    /* 4B28C 8005B28C 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4B290 8005B290 21082500 */  addu       $at, $at, $a1
    /* 4B294 8005B294 F4A5238C */  lw         $v1, %lo(plr + 0xBC)($at)
    /* 4B298 8005B298 00000000 */  nop
    /* 4B29C 8005B29C 24187100 */  and        $v1, $v1, $s1
    /* 4B2A0 8005B2A0 24105000 */  and        $v0, $v0, $s0
    /* 4B2A4 8005B2A4 03004014 */  bnez       $v0, .L8005B2B4
    /* 4B2A8 8005B2A8 00000000 */   nop
    /* 4B2AC 8005B2AC 08006010 */  beqz       $v1, .L8005B2D0
    /* 4B2B0 8005B2B0 00000000 */   nop
  .L8005B2B4:
    /* 4B2B4 8005B2B4 00008280 */  lb         $v0, 0x0($a0)
    /* 4B2B8 8005B2B8 00000000 */  nop
    /* 4B2BC 8005B2BC 21184000 */  addu       $v1, $v0, $zero
    /* 4B2C0 8005B2C0 0F004228 */  slti       $v0, $v0, 0xF
    /* 4B2C4 8005B2C4 02004010 */  beqz       $v0, .L8005B2D0
    /* 4B2C8 8005B2C8 01006224 */   addiu     $v0, $v1, 0x1
    /* 4B2CC 8005B2CC 000082A0 */  sb         $v0, 0x0($a0)
  .L8005B2D0:
    /* 4B2D0 8005B2D0 40881100 */  sll        $s1, $s1, 1
    /* 4B2D4 8005B2D4 C2171000 */  srl        $v0, $s0, 31
    /* 4B2D8 8005B2D8 25882202 */  or         $s1, $s1, $v0
    /* 4B2DC 8005B2DC 40801000 */  sll        $s0, $s0, 1
    /* 4B2E0 8005B2E0 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B2E4 8005B2E4 2600422A */  slti       $v0, $s2, 0x26
    /* 4B2E8 8005B2E8 E5FF4014 */  bnez       $v0, .L8005B280
    /* 4B2EC 8005B2EC 01008424 */   addiu     $a0, $a0, 0x1
    /* 4B2F0 8005B2F0 21A80000 */  addu       $s5, $zero, $zero
    /* 4B2F4 8005B2F4 40101300 */  sll        $v0, $s3, 1
    /* 4B2F8 8005B2F8 21105300 */  addu       $v0, $v0, $s3
    /* 4B2FC 8005B2FC 80100200 */  sll        $v0, $v0, 2
    /* 4B300 8005B300 21105300 */  addu       $v0, $v0, $s3
    /* 4B304 8005B304 00110200 */  sll        $v0, $v0, 4
    /* 4B308 8005B308 23105300 */  subu       $v0, $v0, $s3
    /* 4B30C 8005B30C 80100200 */  sll        $v0, $v0, 2
    /* 4B310 8005B310 21105300 */  addu       $v0, $v0, $s3
    /* 4B314 8005B314 C0A00200 */  sll        $s4, $v0, 3
  .L8005B318:
    /* 4B318 8005B318 00001124 */  addiu      $s1, $zero, 0x0
    /* 4B31C 8005B31C 01001024 */  addiu      $s0, $zero, 0x1
    /* 4B320 8005B320 C9F6000C */  jal        ENG_random__Fl
    /* 4B324 8005B324 25000424 */   addiu     $a0, $zero, 0x25
    /* 4B328 8005B328 21904000 */  addu       $s2, $v0, $zero
    /* 4B32C 8005B32C 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4B330 8005B330 21083400 */  addu       $at, $at, $s4
    /* 4B334 8005B334 F0A5228C */  lw         $v0, %lo(plr + 0xB8)($at)
    /* 4B338 8005B338 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4B33C 8005B33C 21083400 */  addu       $at, $at, $s4
    /* 4B340 8005B340 F4A5238C */  lw         $v1, %lo(plr + 0xBC)($at)
    /* 4B344 8005B344 80261200 */  sll        $a0, $s2, 26
    /* 4B348 8005B348 04008104 */  bgez       $a0, .L8005B35C
    /* 4B34C 8005B34C 00000000 */   nop
    /* 4B350 8005B350 04585002 */  sllv       $t3, $s0, $s2
    /* 4B354 8005B354 07000104 */  bgez       $zero, .L8005B374
    /* 4B358 8005B358 21500000 */   addu      $t2, $zero, $zero
  .L8005B35C:
    /* 4B35C 8005B35C 04008010 */  beqz       $a0, .L8005B370
    /* 4B360 8005B360 04585102 */   sllv      $t3, $s1, $s2
    /* 4B364 8005B364 23201200 */  negu       $a0, $s2
    /* 4B368 8005B368 06209000 */  srlv       $a0, $s0, $a0
    /* 4B36C 8005B36C 25586401 */  or         $t3, $t3, $a0
  .L8005B370:
    /* 4B370 8005B370 04505002 */  sllv       $t2, $s0, $s2
  .L8005B374:
    /* 4B374 8005B374 21804001 */  addu       $s0, $t2, $zero
    /* 4B378 8005B378 21886001 */  addu       $s1, $t3, $zero
    /* 4B37C 8005B37C 24187100 */  and        $v1, $v1, $s1
    /* 4B380 8005B380 24105000 */  and        $v0, $v0, $s0
    /* 4B384 8005B384 03004014 */  bnez       $v0, .L8005B394
    /* 4B388 8005B388 00000000 */   nop
    /* 4B38C 8005B38C 0F006010 */  beqz       $v1, .L8005B3CC
    /* 4B390 8005B390 FF00A232 */   andi      $v0, $s5, 0xFF
  .L8005B394:
    /* 4B394 8005B394 0E80023C */  lui        $v0, %hi(plr + 0x72)
    /* 4B398 8005B398 AAA54224 */  addiu      $v0, $v0, %lo(plr + 0x72)
    /* 4B39C 8005B39C 21189202 */  addu       $v1, $s4, $s2
    /* 4B3A0 8005B3A0 21186200 */  addu       $v1, $v1, $v0
    /* 4B3A4 8005B3A4 00006280 */  lb         $v0, 0x0($v1)
    /* 4B3A8 8005B3A8 00000000 */  nop
    /* 4B3AC 8005B3AC 21204000 */  addu       $a0, $v0, $zero
    /* 4B3B0 8005B3B0 02004228 */  slti       $v0, $v0, 0x2
    /* 4B3B4 8005B3B4 03004014 */  bnez       $v0, .L8005B3C4
    /* 4B3B8 8005B3B8 FEFF8224 */   addiu     $v0, $a0, -0x2
    /* 4B3BC 8005B3BC F56C0108 */  j          .L8005B3D4
    /* 4B3C0 8005B3C0 000062A0 */   sb        $v0, 0x0($v1)
  .L8005B3C4:
    /* 4B3C4 8005B3C4 F56C0108 */  j          .L8005B3D4
    /* 4B3C8 8005B3C8 000060A0 */   sb        $zero, 0x0($v1)
  .L8005B3CC:
    /* 4B3CC 8005B3CC D2FF4010 */  beqz       $v0, .L8005B318
    /* 4B3D0 8005B3D0 00000000 */   nop
  .L8005B3D4:
    /* 4B3D4 8005B3D4 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4B3D8 8005B3D8 13000424 */   addiu     $a0, $zero, 0x13
    /* 4B3DC 8005B3DC FD710108 */  j          .L8005C7F4
    /* 4B3E0 8005B3E0 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005B3E4
    /* 4B3E4 8005B3E4 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4B3E8 8005B3E8 00000000 */  nop
    /* 4B3EC 8005B3EC 31004018 */  blez       $v0, .L8005B4B4
    /* 4B3F0 8005B3F0 21900000 */   addu      $s2, $zero, $zero
  .L8005B3F4:
    /* 4B3F4 8005B3F4 0E80013C */  lui        $at, %hi(objectactive)
    /* 4B3F8 8005B3F8 21083200 */  addu       $at, $at, $s2
    /* 4B3FC 8005B3FC 20A23180 */  lb         $s1, %lo(objectactive)($at)
    /* 4B400 8005B400 00000000 */  nop
    /* 4B404 8005B404 40101100 */  sll        $v0, $s1, 1
    /* 4B408 8005B408 21105100 */  addu       $v0, $v0, $s1
    /* 4B40C 8005B40C 80100200 */  sll        $v0, $v0, 2
    /* 4B410 8005B410 23105100 */  subu       $v0, $v0, $s1
    /* 4B414 8005B414 80800200 */  sll        $s0, $v0, 2
    /* 4B418 8005B418 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4B41C 8005B41C 21083000 */  addu       $at, $at, $s0
    /* 4B420 8005B420 6A8C2390 */  lbu        $v1, %lo(object + 0x1E)($at)
    /* 4B424 8005B424 00000000 */  nop
    /* 4B428 8005B428 FBFF6224 */  addiu      $v0, $v1, -0x5
    /* 4B42C 8005B42C 0200422C */  sltiu      $v0, $v0, 0x2
    /* 4B430 8005B430 05004014 */  bnez       $v0, .L8005B448
    /* 4B434 8005B434 00160300 */   sll       $v0, $v1, 24
    /* 4B438 8005B438 03160200 */  sra        $v0, $v0, 24
    /* 4B43C 8005B43C 07000324 */  addiu      $v1, $zero, 0x7
    /* 4B440 8005B440 17004314 */  bne        $v0, $v1, .L8005B4A0
    /* 4B444 8005B444 00000000 */   nop
  .L8005B448:
    /* 4B448 8005B448 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4B44C 8005B44C 21083000 */  addu       $at, $at, $s0
    /* 4B450 8005B450 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4B454 8005B454 00000000 */  nop
    /* 4B458 8005B458 11004014 */  bnez       $v0, .L8005B4A0
    /* 4B45C 8005B45C 00000000 */   nop
    /* 4B460 8005B460 B7F6000C */  jal        GetRndSeed__Fv
    /* 4B464 8005B464 00000000 */   nop
    /* 4B468 8005B468 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4B46C 8005B46C 21083000 */  addu       $at, $at, $s0
    /* 4B470 8005B470 6D8C2390 */  lbu        $v1, %lo(object + 0x21)($at)
    /* 4B474 8005B474 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4B478 8005B478 21083000 */  addu       $at, $at, $s0
    /* 4B47C 8005B47C 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 4B480 8005B480 01000224 */  addiu      $v0, $zero, 0x1
    /* 4B484 8005B484 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4B488 8005B488 21083000 */  addu       $at, $at, $s0
    /* 4B48C 8005B48C 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 4B490 8005B490 FEFF6324 */  addiu      $v1, $v1, -0x2
    /* 4B494 8005B494 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4B498 8005B498 21083000 */  addu       $at, $at, $s0
    /* 4B49C 8005B49C 6D8C23A0 */  sb         $v1, %lo(object + 0x21)($at)
  .L8005B4A0:
    /* 4B4A0 8005B4A0 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4B4A4 8005B4A4 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B4A8 8005B4A8 2A104202 */  slt        $v0, $s2, $v0
    /* 4B4AC 8005B4AC D1FF4014 */  bnez       $v0, .L8005B3F4
    /* 4B4B0 8005B4B0 00000000 */   nop
  .L8005B4B4:
    /* 4B4B4 8005B4B4 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4B4B8 8005B4B8 14000424 */   addiu     $a0, $zero, 0x14
    /* 4B4BC 8005B4BC FD710108 */  j          .L8005C7F4
    /* 4B4C0 8005B4C0 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005B4C4
    /* 4B4C4 8005B4C4 00000724 */  addiu      $a3, $zero, 0x0
    /* 4B4C8 8005B4C8 01000624 */  addiu      $a2, $zero, 0x1
    /* 4B4CC 8005B4CC 40101300 */  sll        $v0, $s3, 1
    /* 4B4D0 8005B4D0 21105300 */  addu       $v0, $v0, $s3
    /* 4B4D4 8005B4D4 80100200 */  sll        $v0, $v0, 2
    /* 4B4D8 8005B4D8 21105300 */  addu       $v0, $v0, $s3
    /* 4B4DC 8005B4DC 00110200 */  sll        $v0, $v0, 4
    /* 4B4E0 8005B4E0 23105300 */  subu       $v0, $v0, $s3
    /* 4B4E4 8005B4E4 80100200 */  sll        $v0, $v0, 2
    /* 4B4E8 8005B4E8 21105300 */  addu       $v0, $v0, $s3
    /* 4B4EC 8005B4EC C0280200 */  sll        $a1, $v0, 3
    /* 4B4F0 8005B4F0 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4B4F4 8005B4F4 21082500 */  addu       $at, $at, $a1
    /* 4B4F8 8005B4F8 F0A5228C */  lw         $v0, %lo(plr + 0xB8)($at)
    /* 4B4FC 8005B4FC 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4B500 8005B500 21082500 */  addu       $at, $at, $a1
    /* 4B504 8005B504 F4A5238C */  lw         $v1, %lo(plr + 0xBC)($at)
    /* 4B508 8005B508 0E80013C */  lui        $at, %hi(plr + 0x72)
    /* 4B50C 8005B50C 21082500 */  addu       $at, $at, $a1
    /* 4B510 8005B510 AAA52480 */  lb         $a0, %lo(plr + 0x72)($at)
    /* 4B514 8005B514 25186700 */  or         $v1, $v1, $a3
    /* 4B518 8005B518 25104600 */  or         $v0, $v0, $a2
    /* 4B51C 8005B51C 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4B520 8005B520 21082500 */  addu       $at, $at, $a1
    /* 4B524 8005B524 F0A522AC */  sw         $v0, %lo(plr + 0xB8)($at)
    /* 4B528 8005B528 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4B52C 8005B52C 21082500 */  addu       $at, $at, $a1
    /* 4B530 8005B530 F4A523AC */  sw         $v1, %lo(plr + 0xBC)($at)
    /* 4B534 8005B534 21108000 */  addu       $v0, $a0, $zero
    /* 4B538 8005B538 0F008428 */  slti       $a0, $a0, 0xF
    /* 4B53C 8005B53C 0E008010 */  beqz       $a0, .L8005B578
    /* 4B540 8005B540 01004224 */   addiu     $v0, $v0, 0x1
    /* 4B544 8005B544 0E80033C */  lui        $v1, %hi(plr)
    /* 4B548 8005B548 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 4B54C 8005B54C 2120A300 */  addu       $a0, $a1, $v1
    /* 4B550 8005B550 720082A0 */  sb         $v0, 0x72($a0)
    /* 4B554 8005B554 0E80013C */  lui        $at, %hi(plr + 0x72)
    /* 4B558 8005B558 21082500 */  addu       $at, $at, $a1
    /* 4B55C 8005B55C AAA52280 */  lb         $v0, %lo(plr + 0x72)($at)
    /* 4B560 8005B560 00000000 */  nop
    /* 4B564 8005B564 21184000 */  addu       $v1, $v0, $zero
    /* 4B568 8005B568 0F004228 */  slti       $v0, $v0, 0xF
    /* 4B56C 8005B56C 02004010 */  beqz       $v0, .L8005B578
    /* 4B570 8005B570 01006224 */   addiu     $v0, $v1, 0x1
    /* 4B574 8005B574 720082A0 */  sb         $v0, 0x72($a0)
  .L8005B578:
    /* 4B578 8005B578 6666043C */  lui        $a0, (0x66666667 >> 16)
    /* 4B57C 8005B57C 40101300 */  sll        $v0, $s3, 1
    /* 4B580 8005B580 21105300 */  addu       $v0, $v0, $s3
    /* 4B584 8005B584 80100200 */  sll        $v0, $v0, 2
    /* 4B588 8005B588 21105300 */  addu       $v0, $v0, $s3
    /* 4B58C 8005B58C 00110200 */  sll        $v0, $v0, 4
    /* 4B590 8005B590 23105300 */  subu       $v0, $v0, $s3
    /* 4B594 8005B594 80100200 */  sll        $v0, $v0, 2
    /* 4B598 8005B598 21105300 */  addu       $v0, $v0, $s3
    /* 4B59C 8005B59C C0300200 */  sll        $a2, $v0, 3
    /* 4B5A0 8005B5A0 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4B5A4 8005B5A4 21082600 */  addu       $at, $at, $a2
    /* 4B5A8 8005B5A8 64A6238C */  lw         $v1, %lo(plr + 0x12C)($at)
    /* 4B5AC 8005B5AC 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
    /* 4B5B0 8005B5B0 18006400 */  mult       $v1, $a0
    /* 4B5B4 8005B5B4 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4B5B8 8005B5B8 21082600 */  addu       $at, $at, $a2
    /* 4B5BC 8005B5BC 68A6258C */  lw         $a1, %lo(plr + 0x130)($at)
    /* 4B5C0 8005B5C0 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4B5C4 8005B5C4 21082600 */  addu       $at, $at, $a2
    /* 4B5C8 8005B5C8 60A6228C */  lw         $v0, %lo(plr + 0x128)($at)
    /* 4B5CC 8005B5CC 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4B5D0 8005B5D0 21082600 */  addu       $at, $at, $a2
    /* 4B5D4 8005B5D4 6CA6248C */  lw         $a0, %lo(plr + 0x134)($at)
    /* 4B5D8 8005B5D8 23A8A200 */  subu       $s5, $a1, $v0
    /* 4B5DC 8005B5DC 23B08300 */  subu       $s6, $a0, $v1
    /* 4B5E0 8005B5E0 C31F0300 */  sra        $v1, $v1, 31
    /* 4B5E4 8005B5E4 10580000 */  mfhi       $t3
    /* 4B5E8 8005B5E8 83200B00 */  sra        $a0, $t3, 2
    /* 4B5EC 8005B5EC 23888300 */  subu       $s1, $a0, $v1
    /* 4B5F0 8005B5F0 23105100 */  subu       $v0, $v0, $s1
    /* 4B5F4 8005B5F4 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4B5F8 8005B5F8 21082600 */  addu       $at, $at, $a2
    /* 4B5FC 8005B5FC 60A622AC */  sw         $v0, %lo(plr + 0x128)($at)
    /* 4B600 8005B600 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4B604 8005B604 21082600 */  addu       $at, $at, $a2
    /* 4B608 8005B608 68A6228C */  lw         $v0, %lo(plr + 0x130)($at)
    /* 4B60C 8005B60C 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4B610 8005B610 21082600 */  addu       $at, $at, $a2
    /* 4B614 8005B614 6CA6238C */  lw         $v1, %lo(plr + 0x134)($at)
    /* 4B618 8005B618 23105100 */  subu       $v0, $v0, $s1
    /* 4B61C 8005B61C 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4B620 8005B620 21082600 */  addu       $at, $at, $a2
    /* 4B624 8005B624 68A622AC */  sw         $v0, %lo(plr + 0x130)($at)
    /* 4B628 8005B628 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4B62C 8005B62C 21082600 */  addu       $at, $at, $a2
    /* 4B630 8005B630 64A6228C */  lw         $v0, %lo(plr + 0x12C)($at)
    /* 4B634 8005B634 23187100 */  subu       $v1, $v1, $s1
    /* 4B638 8005B638 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4B63C 8005B63C 21082600 */  addu       $at, $at, $a2
    /* 4B640 8005B640 6CA623AC */  sw         $v1, %lo(plr + 0x134)($at)
    /* 4B644 8005B644 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4B648 8005B648 21082600 */  addu       $at, $at, $a2
    /* 4B64C 8005B64C 68A6238C */  lw         $v1, %lo(plr + 0x130)($at)
    /* 4B650 8005B650 23105100 */  subu       $v0, $v0, $s1
    /* 4B654 8005B654 83190300 */  sra        $v1, $v1, 6
    /* 4B658 8005B658 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4B65C 8005B65C 21082600 */  addu       $at, $at, $a2
    /* 4B660 8005B660 64A622AC */  sw         $v0, %lo(plr + 0x12C)($at)
    /* 4B664 8005B664 0700601C */  bgtz       $v1, .L8005B684
    /* 4B668 8005B668 00000000 */   nop
    /* 4B66C 8005B66C 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4B670 8005B670 21082600 */  addu       $at, $at, $a2
    /* 4B674 8005B674 68A635AC */  sw         $s5, %lo(plr + 0x130)($at)
    /* 4B678 8005B678 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4B67C 8005B67C 21082600 */  addu       $at, $at, $a2
    /* 4B680 8005B680 60A620AC */  sw         $zero, %lo(plr + 0x128)($at)
  .L8005B684:
    /* 4B684 8005B684 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4B688 8005B688 21082600 */  addu       $at, $at, $a2
    /* 4B68C 8005B68C 6CA6228C */  lw         $v0, %lo(plr + 0x134)($at)
    /* 4B690 8005B690 00000000 */  nop
    /* 4B694 8005B694 83110200 */  sra        $v0, $v0, 6
    /* 4B698 8005B698 0700401C */  bgtz       $v0, .L8005B6B8
    /* 4B69C 8005B69C 00000000 */   nop
    /* 4B6A0 8005B6A0 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4B6A4 8005B6A4 21082600 */  addu       $at, $at, $a2
    /* 4B6A8 8005B6A8 6CA636AC */  sw         $s6, %lo(plr + 0x134)($at)
    /* 4B6AC 8005B6AC 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4B6B0 8005B6B0 21082600 */  addu       $at, $at, $a2
    /* 4B6B4 8005B6B4 64A620AC */  sw         $zero, %lo(plr + 0x12C)($at)
  .L8005B6B8:
    /* 4B6B8 8005B6B8 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4B6BC 8005B6BC 15000424 */   addiu     $a0, $zero, 0x15
    /* 4B6C0 8005B6C0 FD710108 */  j          .L8005C7F4
    /* 4B6C4 8005B6C4 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005B6C8
    /* 4B6C8 8005B6C8 40801300 */  sll        $s0, $s3, 1
    /* 4B6CC 8005B6CC 21801302 */  addu       $s0, $s0, $s3
    /* 4B6D0 8005B6D0 80801000 */  sll        $s0, $s0, 2
    /* 4B6D4 8005B6D4 21801302 */  addu       $s0, $s0, $s3
    /* 4B6D8 8005B6D8 00811000 */  sll        $s0, $s0, 4
    /* 4B6DC 8005B6DC 23801302 */  subu       $s0, $s0, $s3
    /* 4B6E0 8005B6E0 80801000 */  sll        $s0, $s0, 2
    /* 4B6E4 8005B6E4 21801302 */  addu       $s0, $s0, $s3
    /* 4B6E8 8005B6E8 C0801000 */  sll        $s0, $s0, 3
    /* 4B6EC 8005B6EC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 4B6F0 8005B6F0 21083000 */  addu       $at, $at, $s0
    /* 4B6F4 8005B6F4 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 4B6F8 8005B6F8 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 4B6FC 8005B6FC 21083000 */  addu       $at, $at, $s0
    /* 4B700 8005B700 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 4B704 8005B704 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 4B708 8005B708 21083000 */  addu       $at, $at, $s0
    /* 4B70C 8005B70C 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* 4B710 8005B710 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 4B714 8005B714 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4B718 8005B718 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4B71C 8005B71C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 4B720 8005B720 1280023C */  lui        $v0, %hi(leveltype)
    /* 4B724 8005B724 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4B728 8005B728 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4B72C 8005B72C 2000A0AF */  sw         $zero, 0x20($sp)
    /* 4B730 8005B730 21308000 */  addu       $a2, $a0, $zero
    /* 4B734 8005B734 2138A000 */  addu       $a3, $a1, $zero
    /* 4B738 8005B738 40100200 */  sll        $v0, $v0, 1
    /* 4B73C 8005B73C 1000A3AF */  sw         $v1, 0x10($sp)
    /* 4B740 8005B740 810A050C */  jal        func_80142A04
    /* 4B744 8005B744 2400A2AF */   sw        $v0, 0x24($sp)
    /* 4B748 8005B748 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4B74C 8005B74C 21083000 */  addu       $at, $at, $s0
    /* 4B750 8005B750 6CA6228C */  lw         $v0, %lo(plr + 0x134)($at)
    /* 4B754 8005B754 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4B758 8005B758 21083000 */  addu       $at, $at, $s0
    /* 4B75C 8005B75C 64A6238C */  lw         $v1, %lo(plr + 0x12C)($at)
    /* 4B760 8005B760 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4B764 8005B764 21083000 */  addu       $at, $at, $s0
    /* 4B768 8005B768 68A622AC */  sw         $v0, %lo(plr + 0x130)($at)
    /* 4B76C 8005B76C 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4B770 8005B770 21083000 */  addu       $at, $at, $s0
    /* 4B774 8005B774 60A623AC */  sw         $v1, %lo(plr + 0x128)($at)
    /* 4B778 8005B778 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4B77C 8005B77C 16000424 */   addiu     $a0, $zero, 0x16
    /* 4B780 8005B780 FD710108 */  j          .L8005C7F4
    /* 4B784 8005B784 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005B788
    /* 4B788 8005B788 40181300 */  sll        $v1, $s3, 1
    /* 4B78C 8005B78C 21107300 */  addu       $v0, $v1, $s3
    /* 4B790 8005B790 80100200 */  sll        $v0, $v0, 2
    /* 4B794 8005B794 21105300 */  addu       $v0, $v0, $s3
    /* 4B798 8005B798 00110200 */  sll        $v0, $v0, 4
    /* 4B79C 8005B79C 23105300 */  subu       $v0, $v0, $s3
    /* 4B7A0 8005B7A0 80100200 */  sll        $v0, $v0, 2
    /* 4B7A4 8005B7A4 21105300 */  addu       $v0, $v0, $s3
    /* 4B7A8 8005B7A8 C0100200 */  sll        $v0, $v0, 3
    /* 4B7AC 8005B7AC 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4B7B0 8005B7B0 21082200 */  addu       $at, $at, $v0
    /* 4B7B4 8005B7B4 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4B7B8 8005B7B8 00000000 */  nop
    /* 4B7BC 8005B7BC 7E004018 */  blez       $v0, .L8005B9B8
    /* 4B7C0 8005B7C0 21900000 */   addu      $s2, $zero, $zero
    /* 4B7C4 8005B7C4 0E80153C */  lui        $s5, %hi(plr + 0x1910)
    /* 4B7C8 8005B7C8 48BEB526 */  addiu      $s5, $s5, %lo(plr + 0x1910)
    /* 4B7CC 8005B7CC 94EBB626 */  addiu      $s6, $s5, -0x146C
    /* 4B7D0 8005B7D0 21A00000 */  addu       $s4, $zero, $zero
  .L8005B7D4:
    /* 4B7D4 8005B7D4 21107300 */  addu       $v0, $v1, $s3
    /* 4B7D8 8005B7D8 80100200 */  sll        $v0, $v0, 2
    /* 4B7DC 8005B7DC 21105300 */  addu       $v0, $v0, $s3
    /* 4B7E0 8005B7E0 00110200 */  sll        $v0, $v0, 4
    /* 4B7E4 8005B7E4 23105300 */  subu       $v0, $v0, $s3
    /* 4B7E8 8005B7E8 80100200 */  sll        $v0, $v0, 2
    /* 4B7EC 8005B7EC 21105300 */  addu       $v0, $v0, $s3
    /* 4B7F0 8005B7F0 C0880200 */  sll        $s1, $v0, 3
    /* 4B7F4 8005B7F4 21189102 */  addu       $v1, $s4, $s1
    /* 4B7F8 8005B7F8 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 4B7FC 8005B7FC 21082300 */  addu       $at, $at, $v1
    /* 4B800 8005B800 08AA2284 */  lh         $v0, %lo(plr + 0x4D0)($at)
    /* 4B804 8005B804 00000000 */  nop
    /* 4B808 8005B808 5B004014 */  bnez       $v0, .L8005B978
    /* 4B80C 8005B80C 03000224 */   addiu     $v0, $zero, 0x3
    /* 4B810 8005B810 0E80013C */  lui        $at, %hi(plr + 0x4F1)
    /* 4B814 8005B814 21082300 */  addu       $at, $at, $v1
    /* 4B818 8005B818 29AA2390 */  lbu        $v1, %lo(plr + 0x4F1)($at)
    /* 4B81C 8005B81C 00000000 */  nop
    /* 4B820 8005B820 03006210 */  beq        $v1, $v0, .L8005B830
    /* 4B824 8005B824 06000224 */   addiu     $v0, $zero, 0x6
    /* 4B828 8005B828 22006214 */  bne        $v1, $v0, .L8005B8B4
    /* 4B82C 8005B82C 40101300 */   sll       $v0, $s3, 1
  .L8005B830:
    /* 4B830 8005B830 0269010C */  jal        ItemMiscIdIdx__Fi
    /* 4B834 8005B834 12000424 */   addiu     $a0, $zero, 0x12
    /* 4B838 8005B838 21803502 */  addu       $s0, $s1, $s5
    /* 4B83C 8005B83C 21200002 */  addu       $a0, $s0, $zero
    /* 4B840 8005B840 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 4B844 8005B844 21284000 */   addu      $a1, $v0, $zero
    /* 4B848 8005B848 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 4B84C 8005B84C 21200002 */   addu      $a0, $s0, $zero
    /* 4B850 8005B850 01000224 */  addiu      $v0, $zero, 0x1
    /* 4B854 8005B854 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 4B858 8005B858 21083100 */  addu       $at, $at, $s1
    /* 4B85C 8005B85C AEBE22A0 */  sb         $v0, %lo(plr + 0x1976)($at)
    /* 4B860 8005B860 21103602 */  addu       $v0, $s1, $s6
    /* 4B864 8005B864 21308202 */  addu       $a2, $s4, $v0
    /* 4B868 8005B868 60000726 */  addiu      $a3, $s0, 0x60
  .L8005B86C:
    /* 4B86C 8005B86C 0000028E */  lw         $v0, 0x0($s0)
    /* 4B870 8005B870 0400038E */  lw         $v1, 0x4($s0)
    /* 4B874 8005B874 0800048E */  lw         $a0, 0x8($s0)
    /* 4B878 8005B878 0C00058E */  lw         $a1, 0xC($s0)
    /* 4B87C 8005B87C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4B880 8005B880 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4B884 8005B884 0800C4AC */  sw         $a0, 0x8($a2)
    /* 4B888 8005B888 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 4B88C 8005B88C 10001026 */  addiu      $s0, $s0, 0x10
    /* 4B890 8005B890 F6FF0716 */  bne        $s0, $a3, .L8005B86C
    /* 4B894 8005B894 1000C624 */   addiu     $a2, $a2, 0x10
    /* 4B898 8005B898 0000028E */  lw         $v0, 0x0($s0)
    /* 4B89C 8005B89C 0400038E */  lw         $v1, 0x4($s0)
    /* 4B8A0 8005B8A0 0800048E */  lw         $a0, 0x8($s0)
    /* 4B8A4 8005B8A4 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4B8A8 8005B8A8 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4B8AC 8005B8AC 0800C4AC */  sw         $a0, 0x8($a2)
    /* 4B8B0 8005B8B0 40101300 */  sll        $v0, $s3, 1
  .L8005B8B4:
    /* 4B8B4 8005B8B4 21105300 */  addu       $v0, $v0, $s3
    /* 4B8B8 8005B8B8 80100200 */  sll        $v0, $v0, 2
    /* 4B8BC 8005B8BC 21105300 */  addu       $v0, $v0, $s3
    /* 4B8C0 8005B8C0 00110200 */  sll        $v0, $v0, 4
    /* 4B8C4 8005B8C4 23105300 */  subu       $v0, $v0, $s3
    /* 4B8C8 8005B8C8 80100200 */  sll        $v0, $v0, 2
    /* 4B8CC 8005B8CC 21105300 */  addu       $v0, $v0, $s3
    /* 4B8D0 8005B8D0 C0880200 */  sll        $s1, $v0, 3
    /* 4B8D4 8005B8D4 21109102 */  addu       $v0, $s4, $s1
    /* 4B8D8 8005B8D8 0E80013C */  lui        $at, %hi(plr + 0x4F1)
    /* 4B8DC 8005B8DC 21082200 */  addu       $at, $at, $v0
    /* 4B8E0 8005B8E0 29AA2390 */  lbu        $v1, %lo(plr + 0x4F1)($at)
    /* 4B8E4 8005B8E4 02000224 */  addiu      $v0, $zero, 0x2
    /* 4B8E8 8005B8E8 03006210 */  beq        $v1, $v0, .L8005B8F8
    /* 4B8EC 8005B8EC 07000224 */   addiu     $v0, $zero, 0x7
    /* 4B8F0 8005B8F0 22006214 */  bne        $v1, $v0, .L8005B97C
    /* 4B8F4 8005B8F4 40181300 */   sll       $v1, $s3, 1
  .L8005B8F8:
    /* 4B8F8 8005B8F8 0269010C */  jal        ItemMiscIdIdx__Fi
    /* 4B8FC 8005B8FC 13000424 */   addiu     $a0, $zero, 0x13
    /* 4B900 8005B900 21803502 */  addu       $s0, $s1, $s5
    /* 4B904 8005B904 21200002 */  addu       $a0, $s0, $zero
    /* 4B908 8005B908 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 4B90C 8005B90C 21284000 */   addu      $a1, $v0, $zero
    /* 4B910 8005B910 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 4B914 8005B914 21200002 */   addu      $a0, $s0, $zero
    /* 4B918 8005B918 01000224 */  addiu      $v0, $zero, 0x1
    /* 4B91C 8005B91C 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 4B920 8005B920 21083100 */  addu       $at, $at, $s1
    /* 4B924 8005B924 AEBE22A0 */  sb         $v0, %lo(plr + 0x1976)($at)
    /* 4B928 8005B928 21103602 */  addu       $v0, $s1, $s6
    /* 4B92C 8005B92C 21308202 */  addu       $a2, $s4, $v0
    /* 4B930 8005B930 60000726 */  addiu      $a3, $s0, 0x60
  .L8005B934:
    /* 4B934 8005B934 0000028E */  lw         $v0, 0x0($s0)
    /* 4B938 8005B938 0400038E */  lw         $v1, 0x4($s0)
    /* 4B93C 8005B93C 0800048E */  lw         $a0, 0x8($s0)
    /* 4B940 8005B940 0C00058E */  lw         $a1, 0xC($s0)
    /* 4B944 8005B944 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4B948 8005B948 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4B94C 8005B94C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 4B950 8005B950 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 4B954 8005B954 10001026 */  addiu      $s0, $s0, 0x10
    /* 4B958 8005B958 F6FF0716 */  bne        $s0, $a3, .L8005B934
    /* 4B95C 8005B95C 1000C624 */   addiu     $a2, $a2, 0x10
    /* 4B960 8005B960 0000028E */  lw         $v0, 0x0($s0)
    /* 4B964 8005B964 0400038E */  lw         $v1, 0x4($s0)
    /* 4B968 8005B968 0800048E */  lw         $a0, 0x8($s0)
    /* 4B96C 8005B96C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4B970 8005B970 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4B974 8005B974 0800C4AC */  sw         $a0, 0x8($a2)
  .L8005B978:
    /* 4B978 8005B978 40181300 */  sll        $v1, $s3, 1
  .L8005B97C:
    /* 4B97C 8005B97C 21107300 */  addu       $v0, $v1, $s3
    /* 4B980 8005B980 80100200 */  sll        $v0, $v0, 2
    /* 4B984 8005B984 21105300 */  addu       $v0, $v0, $s3
    /* 4B988 8005B988 00110200 */  sll        $v0, $v0, 4
    /* 4B98C 8005B98C 23105300 */  subu       $v0, $v0, $s3
    /* 4B990 8005B990 80100200 */  sll        $v0, $v0, 2
    /* 4B994 8005B994 21105300 */  addu       $v0, $v0, $s3
    /* 4B998 8005B998 C0100200 */  sll        $v0, $v0, 3
    /* 4B99C 8005B99C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4B9A0 8005B9A0 21082200 */  addu       $at, $at, $v0
    /* 4B9A4 8005B9A4 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4B9A8 8005B9A8 01005226 */  addiu      $s2, $s2, 0x1
    /* 4B9AC 8005B9AC 2A104202 */  slt        $v0, $s2, $v0
    /* 4B9B0 8005B9B0 88FF4014 */  bnez       $v0, .L8005B7D4
    /* 4B9B4 8005B9B4 6C009426 */   addiu     $s4, $s4, 0x6C
  .L8005B9B8:
    /* 4B9B8 8005B9B8 40101300 */  sll        $v0, $s3, 1
    /* 4B9BC 8005B9BC 21105300 */  addu       $v0, $v0, $s3
    /* 4B9C0 8005B9C0 80100200 */  sll        $v0, $v0, 2
    /* 4B9C4 8005B9C4 21105300 */  addu       $v0, $v0, $s3
    /* 4B9C8 8005B9C8 00110200 */  sll        $v0, $v0, 4
    /* 4B9CC 8005B9CC 23105300 */  subu       $v0, $v0, $s3
    /* 4B9D0 8005B9D0 80100200 */  sll        $v0, $v0, 2
    /* 4B9D4 8005B9D4 21105300 */  addu       $v0, $v0, $s3
    /* 4B9D8 8005B9D8 C0900200 */  sll        $s2, $v0, 3
    /* 4B9DC 8005B9DC 21884002 */  addu       $s1, $s2, $zero
    /* 4B9E0 8005B9E0 21A80000 */  addu       $s5, $zero, $zero
    /* 4B9E4 8005B9E4 0E80173C */  lui        $s7, %hi(plr + 0x1910)
    /* 4B9E8 8005B9E8 48BEF726 */  addiu      $s7, $s7, %lo(plr + 0x1910)
    /* 4B9EC 8005B9EC A0FCE226 */  addiu      $v0, $s7, -0x360
    /* 4B9F0 8005B9F0 21B04202 */  addu       $s6, $s2, $v0
    /* 4B9F4 8005B9F4 21A0C002 */  addu       $s4, $s6, $zero
  .L8005B9F8:
    /* 4B9F8 8005B9F8 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 4B9FC 8005B9FC 21083100 */  addu       $at, $at, $s1
    /* 4BA00 8005BA00 14BB2284 */  lh         $v0, %lo(plr + 0x15DC)($at)
    /* 4BA04 8005BA04 00000000 */  nop
    /* 4BA08 8005BA08 4F004014 */  bnez       $v0, .L8005BB48
    /* 4BA0C 8005BA0C 03000224 */   addiu     $v0, $zero, 0x3
    /* 4BA10 8005BA10 0E80013C */  lui        $at, %hi(plr + 0x15FD)
    /* 4BA14 8005BA14 21083100 */  addu       $at, $at, $s1
    /* 4BA18 8005BA18 35BB2390 */  lbu        $v1, %lo(plr + 0x15FD)($at)
    /* 4BA1C 8005BA1C 00000000 */  nop
    /* 4BA20 8005BA20 03006210 */  beq        $v1, $v0, .L8005BA30
    /* 4BA24 8005BA24 06000224 */   addiu     $v0, $zero, 0x6
    /* 4BA28 8005BA28 24006214 */  bne        $v1, $v0, .L8005BABC
    /* 4BA2C 8005BA2C 02000224 */   addiu     $v0, $zero, 0x2
  .L8005BA30:
    /* 4BA30 8005BA30 0269010C */  jal        ItemMiscIdIdx__Fi
    /* 4BA34 8005BA34 12000424 */   addiu     $a0, $zero, 0x12
    /* 4BA38 8005BA38 21805702 */  addu       $s0, $s2, $s7
    /* 4BA3C 8005BA3C 21200002 */  addu       $a0, $s0, $zero
    /* 4BA40 8005BA40 F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 4BA44 8005BA44 21284000 */   addu      $a1, $v0, $zero
    /* 4BA48 8005BA48 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 4BA4C 8005BA4C 21200002 */   addu      $a0, $s0, $zero
    /* 4BA50 8005BA50 01000224 */  addiu      $v0, $zero, 0x1
    /* 4BA54 8005BA54 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 4BA58 8005BA58 21083200 */  addu       $at, $at, $s2
    /* 4BA5C 8005BA5C AEBE22A0 */  sb         $v0, %lo(plr + 0x1976)($at)
    /* 4BA60 8005BA60 21308002 */  addu       $a2, $s4, $zero
    /* 4BA64 8005BA64 60000726 */  addiu      $a3, $s0, 0x60
  .L8005BA68:
    /* 4BA68 8005BA68 0000028E */  lw         $v0, 0x0($s0)
    /* 4BA6C 8005BA6C 0400038E */  lw         $v1, 0x4($s0)
    /* 4BA70 8005BA70 0800048E */  lw         $a0, 0x8($s0)
    /* 4BA74 8005BA74 0C00058E */  lw         $a1, 0xC($s0)
    /* 4BA78 8005BA78 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4BA7C 8005BA7C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4BA80 8005BA80 0800C4AC */  sw         $a0, 0x8($a2)
    /* 4BA84 8005BA84 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 4BA88 8005BA88 10001026 */  addiu      $s0, $s0, 0x10
    /* 4BA8C 8005BA8C F6FF0716 */  bne        $s0, $a3, .L8005BA68
    /* 4BA90 8005BA90 1000C624 */   addiu     $a2, $a2, 0x10
    /* 4BA94 8005BA94 0000028E */  lw         $v0, 0x0($s0)
    /* 4BA98 8005BA98 0400038E */  lw         $v1, 0x4($s0)
    /* 4BA9C 8005BA9C 0800048E */  lw         $a0, 0x8($s0)
    /* 4BAA0 8005BAA0 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4BAA4 8005BAA4 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4BAA8 8005BAA8 0800C4AC */  sw         $a0, 0x8($a2)
    /* 4BAAC 8005BAAC 0E80013C */  lui        $at, %hi(plr + 0x15FD)
    /* 4BAB0 8005BAB0 21083100 */  addu       $at, $at, $s1
    /* 4BAB4 8005BAB4 35BB2390 */  lbu        $v1, %lo(plr + 0x15FD)($at)
    /* 4BAB8 8005BAB8 02000224 */  addiu      $v0, $zero, 0x2
  .L8005BABC:
    /* 4BABC 8005BABC 03006210 */  beq        $v1, $v0, .L8005BACC
    /* 4BAC0 8005BAC0 07000224 */   addiu     $v0, $zero, 0x7
    /* 4BAC4 8005BAC4 20006214 */  bne        $v1, $v0, .L8005BB48
    /* 4BAC8 8005BAC8 00000000 */   nop
  .L8005BACC:
    /* 4BACC 8005BACC 0269010C */  jal        ItemMiscIdIdx__Fi
    /* 4BAD0 8005BAD0 13000424 */   addiu     $a0, $zero, 0x13
    /* 4BAD4 8005BAD4 21805702 */  addu       $s0, $s2, $s7
    /* 4BAD8 8005BAD8 21200002 */  addu       $a0, $s0, $zero
    /* 4BADC 8005BADC F2FE000C */  jal        SetPlrHandItem__FP10ItemStructi
    /* 4BAE0 8005BAE0 21284000 */   addu      $a1, $v0, $zero
    /* 4BAE4 8005BAE4 38FF000C */  jal        GetPlrHandSeed__FP10ItemStruct
    /* 4BAE8 8005BAE8 21200002 */   addu      $a0, $s0, $zero
    /* 4BAEC 8005BAEC 01000224 */  addiu      $v0, $zero, 0x1
    /* 4BAF0 8005BAF0 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 4BAF4 8005BAF4 21083200 */  addu       $at, $at, $s2
    /* 4BAF8 8005BAF8 AEBE22A0 */  sb         $v0, %lo(plr + 0x1976)($at)
    /* 4BAFC 8005BAFC 2130B602 */  addu       $a2, $s5, $s6
    /* 4BB00 8005BB00 60000726 */  addiu      $a3, $s0, 0x60
  .L8005BB04:
    /* 4BB04 8005BB04 0000028E */  lw         $v0, 0x0($s0)
    /* 4BB08 8005BB08 0400038E */  lw         $v1, 0x4($s0)
    /* 4BB0C 8005BB0C 0800048E */  lw         $a0, 0x8($s0)
    /* 4BB10 8005BB10 0C00058E */  lw         $a1, 0xC($s0)
    /* 4BB14 8005BB14 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4BB18 8005BB18 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4BB1C 8005BB1C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 4BB20 8005BB20 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 4BB24 8005BB24 10001026 */  addiu      $s0, $s0, 0x10
    /* 4BB28 8005BB28 F6FF0716 */  bne        $s0, $a3, .L8005BB04
    /* 4BB2C 8005BB2C 1000C624 */   addiu     $a2, $a2, 0x10
    /* 4BB30 8005BB30 0000028E */  lw         $v0, 0x0($s0)
    /* 4BB34 8005BB34 0400038E */  lw         $v1, 0x4($s0)
    /* 4BB38 8005BB38 0800048E */  lw         $a0, 0x8($s0)
    /* 4BB3C 8005BB3C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 4BB40 8005BB40 0400C3AC */  sw         $v1, 0x4($a2)
    /* 4BB44 8005BB44 0800C4AC */  sw         $a0, 0x8($a2)
  .L8005BB48:
    /* 4BB48 8005BB48 6C003126 */  addiu      $s1, $s1, 0x6C
    /* 4BB4C 8005BB4C 6C00B526 */  addiu      $s5, $s5, 0x6C
    /* 4BB50 8005BB50 60034226 */  addiu      $v0, $s2, 0x360
    /* 4BB54 8005BB54 2A102202 */  slt        $v0, $s1, $v0
    /* 4BB58 8005BB58 A7FF4014 */  bnez       $v0, .L8005B9F8
    /* 4BB5C 8005BB5C 6C009426 */   addiu     $s4, $s4, 0x6C
    /* 4BB60 8005BB60 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4BB64 8005BB64 18000424 */   addiu     $a0, $zero, 0x18
    /* 4BB68 8005BB68 FD710108 */  j          .L8005C7F4
    /* 4BB6C 8005BB6C 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005BB70
    /* 4BB70 8005BB70 21206002 */  addu       $a0, $s3, $zero
    /* 4BB74 8005BB74 AF97010C */  jal        ModifyPlrMag__Fii
    /* 4BB78 8005BB78 02000524 */   addiu     $a1, $zero, 0x2
    /* 4BB7C 8005BB7C F396010C */  jal        CheckStats__Fi
    /* 4BB80 8005BB80 21206002 */   addu      $a0, $s3, $zero
    /* 4BB84 8005BB84 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4BB88 8005BB88 19000424 */   addiu     $a0, $zero, 0x19
    /* 4BB8C 8005BB8C FD710108 */  j          .L8005C7F4
    /* 4BB90 8005BB90 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005BB94
    /* 4BB94 8005BB94 1280023C */  lui        $v0, %hi(currlevel)
    /* 4BB98 8005BB98 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 4BB9C 8005BB9C 00000000 */  nop
    /* 4BBA0 8005BBA0 04004228 */  slti       $v0, $v0, 0x4
    /* 4BBA4 8005BBA4 1E004010 */  beqz       $v0, .L8005BC20
    /* 4BBA8 8005BBA8 21300000 */   addu      $a2, $zero, $zero
    /* 4BBAC 8005BBAC 21380000 */  addu       $a3, $zero, $zero
    /* 4BBB0 8005BBB0 40801E00 */  sll        $s0, $fp, 1
    /* 4BBB4 8005BBB4 21801E02 */  addu       $s0, $s0, $fp
    /* 4BBB8 8005BBB8 80801000 */  sll        $s0, $s0, 2
    /* 4BBBC 8005BBBC 23801E02 */  subu       $s0, $s0, $fp
    /* 4BBC0 8005BBC0 80801000 */  sll        $s0, $s0, 2
    /* 4BBC4 8005BBC4 07000224 */  addiu      $v0, $zero, 0x7
    /* 4BBC8 8005BBC8 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4BBCC 8005BBCC 21083000 */  addu       $at, $at, $s0
    /* 4BBD0 8005BBD0 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4BBD4 8005BBD4 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4BBD8 8005BBD8 21083000 */  addu       $at, $at, $s0
    /* 4BBDC 8005BBDC 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4BBE0 8005BBE0 01001124 */  addiu      $s1, $zero, 0x1
    /* 4BBE4 8005BBE4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 4BBE8 8005BBE8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4BBEC 8005BBEC B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 4BBF0 8005BBF0 1800A0AF */   sw        $zero, 0x18($sp)
    /* 4BBF4 8005BBF4 21300000 */  addu       $a2, $zero, $zero
    /* 4BBF8 8005BBF8 21380000 */  addu       $a3, $zero, $zero
    /* 4BBFC 8005BBFC 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4BC00 8005BC00 21083000 */  addu       $at, $at, $s0
    /* 4BC04 8005BC04 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4BC08 8005BC08 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4BC0C 8005BC0C 21083000 */  addu       $at, $at, $s0
    /* 4BC10 8005BC10 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4BC14 8005BC14 02000224 */  addiu      $v0, $zero, 0x2
    /* 4BC18 8005BC18 236F0108 */  j          .L8005BC8C
    /* 4BC1C 8005BC1C 1000A2AF */   sw        $v0, 0x10($sp)
  .L8005BC20:
    /* 4BC20 8005BC20 21380000 */  addu       $a3, $zero, $zero
    /* 4BC24 8005BC24 40801E00 */  sll        $s0, $fp, 1
    /* 4BC28 8005BC28 21801E02 */  addu       $s0, $s0, $fp
    /* 4BC2C 8005BC2C 80801000 */  sll        $s0, $s0, 2
    /* 4BC30 8005BC30 23801E02 */  subu       $s0, $s0, $fp
    /* 4BC34 8005BC34 80801000 */  sll        $s0, $s0, 2
    /* 4BC38 8005BC38 13001224 */  addiu      $s2, $zero, 0x13
    /* 4BC3C 8005BC3C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4BC40 8005BC40 21083000 */  addu       $at, $at, $s0
    /* 4BC44 8005BC44 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4BC48 8005BC48 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4BC4C 8005BC4C 21083000 */  addu       $at, $at, $s0
    /* 4BC50 8005BC50 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4BC54 8005BC54 01001124 */  addiu      $s1, $zero, 0x1
    /* 4BC58 8005BC58 1000B2AF */  sw         $s2, 0x10($sp)
    /* 4BC5C 8005BC5C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4BC60 8005BC60 B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 4BC64 8005BC64 1800A0AF */   sw        $zero, 0x18($sp)
    /* 4BC68 8005BC68 21300000 */  addu       $a2, $zero, $zero
    /* 4BC6C 8005BC6C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4BC70 8005BC70 21083000 */  addu       $at, $at, $s0
    /* 4BC74 8005BC74 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4BC78 8005BC78 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4BC7C 8005BC7C 21083000 */  addu       $at, $at, $s0
    /* 4BC80 8005BC80 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4BC84 8005BC84 21380000 */  addu       $a3, $zero, $zero
    /* 4BC88 8005BC88 1000B2AF */  sw         $s2, 0x10($sp)
  .L8005BC8C:
    /* 4BC8C 8005BC8C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4BC90 8005BC90 B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 4BC94 8005BC94 1800A0AF */   sw        $zero, 0x18($sp)
    /* 4BC98 8005BC98 40101300 */  sll        $v0, $s3, 1
    /* 4BC9C 8005BC9C 21105300 */  addu       $v0, $v0, $s3
    /* 4BCA0 8005BCA0 80100200 */  sll        $v0, $v0, 2
    /* 4BCA4 8005BCA4 21105300 */  addu       $v0, $v0, $s3
    /* 4BCA8 8005BCA8 00110200 */  sll        $v0, $v0, 4
    /* 4BCAC 8005BCAC 23105300 */  subu       $v0, $v0, $s3
    /* 4BCB0 8005BCB0 80100200 */  sll        $v0, $v0, 2
    /* 4BCB4 8005BCB4 21105300 */  addu       $v0, $v0, $s3
    /* 4BCB8 8005BCB8 C0100200 */  sll        $v0, $v0, 3
    /* 4BCBC 8005BCBC 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4BCC0 8005BCC0 21082200 */  addu       $at, $at, $v0
    /* 4BCC4 8005BCC4 6CA6238C */  lw         $v1, %lo(plr + 0x134)($at)
    /* 4BCC8 8005BCC8 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4BCCC 8005BCCC 21082200 */  addu       $at, $at, $v0
    /* 4BCD0 8005BCD0 64A6258C */  lw         $a1, %lo(plr + 0x12C)($at)
    /* 4BCD4 8005BCD4 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 4BCD8 8005BCD8 21082200 */  addu       $at, $at, $v0
    /* 4BCDC 8005BCDC 58A6268C */  lw         $a2, %lo(plr + 0x120)($at)
    /* 4BCE0 8005BCE0 0E80013C */  lui        $at, %hi(plr + 0x118)
    /* 4BCE4 8005BCE4 21082200 */  addu       $at, $at, $v0
    /* 4BCE8 8005BCE8 50A6278C */  lw         $a3, %lo(plr + 0x118)($at)
    /* 4BCEC 8005BCEC 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4BCF0 8005BCF0 21082200 */  addu       $at, $at, $v0
    /* 4BCF4 8005BCF4 68A623AC */  sw         $v1, %lo(plr + 0x130)($at)
    /* 4BCF8 8005BCF8 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4BCFC 8005BCFC 21082200 */  addu       $at, $at, $v0
    /* 4BD00 8005BD00 60A625AC */  sw         $a1, %lo(plr + 0x128)($at)
    /* 4BD04 8005BD04 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4BD08 8005BD08 21082200 */  addu       $at, $at, $v0
    /* 4BD0C 8005BD0C 54A626AC */  sw         $a2, %lo(plr + 0x11C)($at)
    /* 4BD10 8005BD10 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 4BD14 8005BD14 21082200 */  addu       $at, $at, $v0
    /* 4BD18 8005BD18 4CA627AC */  sw         $a3, %lo(plr + 0x114)($at)
    /* 4BD1C 8005BD1C 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4BD20 8005BD20 1A000424 */   addiu     $a0, $zero, 0x1A
    /* 4BD24 8005BD24 FD710108 */  j          .L8005C7F4
    /* 4BD28 8005BD28 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005BD2C
    /* 4BD2C 8005BD2C 21A00000 */  addu       $s4, $zero, $zero
  .L8005BD30:
    /* 4BD30 8005BD30 C9F6000C */  jal        ENG_random__Fl
    /* 4BD34 8005BD34 60000424 */   addiu     $a0, $zero, 0x60
    /* 4BD38 8005BD38 21884000 */  addu       $s1, $v0, $zero
    /* 4BD3C 8005BD3C C9F6000C */  jal        ENG_random__Fl
    /* 4BD40 8005BD40 60000424 */   addiu     $a0, $zero, 0x60
    /* 4BD44 8005BD44 21A84000 */  addu       $s5, $v0, $zero
    /* 4BD48 8005BD48 01009426 */  addiu      $s4, $s4, 0x1
    /* 4BD4C 8005BD4C 0124822A */  slti       $v0, $s4, 0x2401
    /* 4BD50 8005BD50 15004010 */  beqz       $v0, .L8005BDA8
    /* 4BD54 8005BD54 21202002 */   addu      $a0, $s1, $zero
    /* 4BD58 8005BD58 380B020C */  jal        GetSOLID__Fii
    /* 4BD5C 8005BD5C 2128A002 */   addu      $a1, $s5, $zero
    /* 4BD60 8005BD60 F3FF4014 */  bnez       $v0, .L8005BD30
    /* 4BD64 8005BD64 C0101500 */   sll       $v0, $s5, 3
    /* 4BD68 8005BD68 C0181100 */  sll        $v1, $s1, 3
    /* 4BD6C 8005BD6C 23187100 */  subu       $v1, $v1, $s1
    /* 4BD70 8005BD70 C0190300 */  sll        $v1, $v1, 7
    /* 4BD74 8005BD74 21184300 */  addu       $v1, $v0, $v1
    /* 4BD78 8005BD78 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 4BD7C 8005BD7C 21082300 */  addu       $at, $at, $v1
    /* 4BD80 8005BD80 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 4BD84 8005BD84 00000000 */  nop
    /* 4BD88 8005BD88 E9FF4014 */  bnez       $v0, .L8005BD30
    /* 4BD8C 8005BD8C 00000000 */   nop
    /* 4BD90 8005BD90 0E80013C */  lui        $at, %hi(dung_map)
    /* 4BD94 8005BD94 21082300 */  addu       $at, $at, $v1
    /* 4BD98 8005BD98 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 4BD9C 8005BD9C 00000000 */  nop
    /* 4BDA0 8005BDA0 E3FF4014 */  bnez       $v0, .L8005BD30
    /* 4BDA4 8005BDA4 00000000 */   nop
  .L8005BDA8:
    /* 4BDA8 8005BDA8 21302002 */  addu       $a2, $s1, $zero
    /* 4BDAC 8005BDAC 40101300 */  sll        $v0, $s3, 1
    /* 4BDB0 8005BDB0 21105300 */  addu       $v0, $v0, $s3
    /* 4BDB4 8005BDB4 80100200 */  sll        $v0, $v0, 2
    /* 4BDB8 8005BDB8 21105300 */  addu       $v0, $v0, $s3
    /* 4BDBC 8005BDBC 00110200 */  sll        $v0, $v0, 4
    /* 4BDC0 8005BDC0 23105300 */  subu       $v0, $v0, $s3
    /* 4BDC4 8005BDC4 80100200 */  sll        $v0, $v0, 2
    /* 4BDC8 8005BDC8 21105300 */  addu       $v0, $v0, $s3
    /* 4BDCC 8005BDCC C0100200 */  sll        $v0, $v0, 3
    /* 4BDD0 8005BDD0 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 4BDD4 8005BDD4 21082200 */  addu       $at, $at, $v0
    /* 4BDD8 8005BDD8 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 4BDDC 8005BDDC 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 4BDE0 8005BDE0 21082200 */  addu       $at, $at, $v0
    /* 4BDE4 8005BDE4 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 4BDE8 8005BDE8 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 4BDEC 8005BDEC 21082200 */  addu       $at, $at, $v0
    /* 4BDF0 8005BDF0 7AA52380 */  lb         $v1, %lo(plr + 0x42)($at)
    /* 4BDF4 8005BDF4 03000224 */  addiu      $v0, $zero, 0x3
    /* 4BDF8 8005BDF8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4BDFC 8005BDFC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4BE00 8005BE00 1800A2AF */  sw         $v0, 0x18($sp)
    /* 4BE04 8005BE04 1280023C */  lui        $v0, %hi(leveltype)
    /* 4BE08 8005BE08 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4BE0C 8005BE0C 2138A002 */  addu       $a3, $s5, $zero
    /* 4BE10 8005BE10 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 4BE14 8005BE14 2000A0AF */  sw         $zero, 0x20($sp)
    /* 4BE18 8005BE18 40100200 */  sll        $v0, $v0, 1
    /* 4BE1C 8005BE1C 1000A3AF */  sw         $v1, 0x10($sp)
    /* 4BE20 8005BE20 810A050C */  jal        func_80142A04
    /* 4BE24 8005BE24 2400A2AF */   sw        $v0, 0x24($sp)
    /* 4BE28 8005BE28 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4BE2C 8005BE2C 1B000424 */   addiu     $a0, $zero, 0x1B
    /* 4BE30 8005BE30 FD710108 */  j          .L8005C7F4
    /* 4BE34 8005BE34 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005BE38
    /* 4BE38 8005BE38 40101300 */  sll        $v0, $s3, 1
    /* 4BE3C 8005BE3C 21105300 */  addu       $v0, $v0, $s3
    /* 4BE40 8005BE40 80100200 */  sll        $v0, $v0, 2
    /* 4BE44 8005BE44 21105300 */  addu       $v0, $v0, $s3
    /* 4BE48 8005BE48 00110200 */  sll        $v0, $v0, 4
    /* 4BE4C 8005BE4C 23105300 */  subu       $v0, $v0, $s3
    /* 4BE50 8005BE50 80100200 */  sll        $v0, $v0, 2
    /* 4BE54 8005BE54 21105300 */  addu       $v0, $v0, $s3
    /* 4BE58 8005BE58 C0280200 */  sll        $a1, $v0, 3
    /* 4BE5C 8005BE5C 00000724 */  addiu      $a3, $zero, 0x0
    /* 4BE60 8005BE60 0020063C */  lui        $a2, (0x20000000 >> 16)
    /* 4BE64 8005BE64 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4BE68 8005BE68 21082500 */  addu       $at, $at, $a1
    /* 4BE6C 8005BE6C F0A5228C */  lw         $v0, %lo(plr + 0xB8)($at)
    /* 4BE70 8005BE70 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4BE74 8005BE74 21082500 */  addu       $at, $at, $a1
    /* 4BE78 8005BE78 F4A5238C */  lw         $v1, %lo(plr + 0xBC)($at)
    /* 4BE7C 8005BE7C 0E80013C */  lui        $at, %hi(plr + 0x8F)
    /* 4BE80 8005BE80 21082500 */  addu       $at, $at, $a1
    /* 4BE84 8005BE84 C7A52480 */  lb         $a0, %lo(plr + 0x8F)($at)
    /* 4BE88 8005BE88 25186700 */  or         $v1, $v1, $a3
    /* 4BE8C 8005BE8C 25104600 */  or         $v0, $v0, $a2
    /* 4BE90 8005BE90 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4BE94 8005BE94 21082500 */  addu       $at, $at, $a1
    /* 4BE98 8005BE98 F0A522AC */  sw         $v0, %lo(plr + 0xB8)($at)
    /* 4BE9C 8005BE9C 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4BEA0 8005BEA0 21082500 */  addu       $at, $at, $a1
    /* 4BEA4 8005BEA4 F4A523AC */  sw         $v1, %lo(plr + 0xBC)($at)
    /* 4BEA8 8005BEA8 21108000 */  addu       $v0, $a0, $zero
    /* 4BEAC 8005BEAC 0F008428 */  slti       $a0, $a0, 0xF
    /* 4BEB0 8005BEB0 0E008010 */  beqz       $a0, .L8005BEEC
    /* 4BEB4 8005BEB4 01004224 */   addiu     $v0, $v0, 0x1
    /* 4BEB8 8005BEB8 0E80033C */  lui        $v1, %hi(plr)
    /* 4BEBC 8005BEBC 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 4BEC0 8005BEC0 2120A300 */  addu       $a0, $a1, $v1
    /* 4BEC4 8005BEC4 8F0082A0 */  sb         $v0, 0x8F($a0)
    /* 4BEC8 8005BEC8 0E80013C */  lui        $at, %hi(plr + 0x8F)
    /* 4BECC 8005BECC 21082500 */  addu       $at, $at, $a1
    /* 4BED0 8005BED0 C7A52280 */  lb         $v0, %lo(plr + 0x8F)($at)
    /* 4BED4 8005BED4 00000000 */  nop
    /* 4BED8 8005BED8 21184000 */  addu       $v1, $v0, $zero
    /* 4BEDC 8005BEDC 0F004228 */  slti       $v0, $v0, 0xF
    /* 4BEE0 8005BEE0 02004010 */  beqz       $v0, .L8005BEEC
    /* 4BEE4 8005BEE4 01006224 */   addiu     $v0, $v1, 0x1
    /* 4BEE8 8005BEE8 8F0082A0 */  sb         $v0, 0x8F($a0)
  .L8005BEEC:
    /* 4BEEC 8005BEEC 6666043C */  lui        $a0, (0x66666667 >> 16)
    /* 4BEF0 8005BEF0 40101300 */  sll        $v0, $s3, 1
    /* 4BEF4 8005BEF4 21105300 */  addu       $v0, $v0, $s3
    /* 4BEF8 8005BEF8 80100200 */  sll        $v0, $v0, 2
    /* 4BEFC 8005BEFC 21105300 */  addu       $v0, $v0, $s3
    /* 4BF00 8005BF00 00110200 */  sll        $v0, $v0, 4
    /* 4BF04 8005BF04 23105300 */  subu       $v0, $v0, $s3
    /* 4BF08 8005BF08 80100200 */  sll        $v0, $v0, 2
    /* 4BF0C 8005BF0C 21105300 */  addu       $v0, $v0, $s3
    /* 4BF10 8005BF10 C0300200 */  sll        $a2, $v0, 3
    /* 4BF14 8005BF14 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4BF18 8005BF18 21082600 */  addu       $at, $at, $a2
    /* 4BF1C 8005BF1C 64A6238C */  lw         $v1, %lo(plr + 0x12C)($at)
    /* 4BF20 8005BF20 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
    /* 4BF24 8005BF24 18006400 */  mult       $v1, $a0
    /* 4BF28 8005BF28 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4BF2C 8005BF2C 21082600 */  addu       $at, $at, $a2
    /* 4BF30 8005BF30 68A6258C */  lw         $a1, %lo(plr + 0x130)($at)
    /* 4BF34 8005BF34 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4BF38 8005BF38 21082600 */  addu       $at, $at, $a2
    /* 4BF3C 8005BF3C 60A6228C */  lw         $v0, %lo(plr + 0x128)($at)
    /* 4BF40 8005BF40 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4BF44 8005BF44 21082600 */  addu       $at, $at, $a2
    /* 4BF48 8005BF48 6CA6248C */  lw         $a0, %lo(plr + 0x134)($at)
    /* 4BF4C 8005BF4C 23A8A200 */  subu       $s5, $a1, $v0
    /* 4BF50 8005BF50 23B08300 */  subu       $s6, $a0, $v1
    /* 4BF54 8005BF54 C31F0300 */  sra        $v1, $v1, 31
    /* 4BF58 8005BF58 10500000 */  mfhi       $t2
    /* 4BF5C 8005BF5C 83200A00 */  sra        $a0, $t2, 2
    /* 4BF60 8005BF60 23888300 */  subu       $s1, $a0, $v1
    /* 4BF64 8005BF64 23105100 */  subu       $v0, $v0, $s1
    /* 4BF68 8005BF68 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4BF6C 8005BF6C 21082600 */  addu       $at, $at, $a2
    /* 4BF70 8005BF70 60A622AC */  sw         $v0, %lo(plr + 0x128)($at)
    /* 4BF74 8005BF74 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4BF78 8005BF78 21082600 */  addu       $at, $at, $a2
    /* 4BF7C 8005BF7C 68A6228C */  lw         $v0, %lo(plr + 0x130)($at)
    /* 4BF80 8005BF80 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4BF84 8005BF84 21082600 */  addu       $at, $at, $a2
    /* 4BF88 8005BF88 6CA6238C */  lw         $v1, %lo(plr + 0x134)($at)
    /* 4BF8C 8005BF8C 23105100 */  subu       $v0, $v0, $s1
    /* 4BF90 8005BF90 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4BF94 8005BF94 21082600 */  addu       $at, $at, $a2
    /* 4BF98 8005BF98 68A622AC */  sw         $v0, %lo(plr + 0x130)($at)
    /* 4BF9C 8005BF9C 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4BFA0 8005BFA0 21082600 */  addu       $at, $at, $a2
    /* 4BFA4 8005BFA4 64A6228C */  lw         $v0, %lo(plr + 0x12C)($at)
    /* 4BFA8 8005BFA8 23187100 */  subu       $v1, $v1, $s1
    /* 4BFAC 8005BFAC 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4BFB0 8005BFB0 21082600 */  addu       $at, $at, $a2
    /* 4BFB4 8005BFB4 6CA623AC */  sw         $v1, %lo(plr + 0x134)($at)
    /* 4BFB8 8005BFB8 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4BFBC 8005BFBC 21082600 */  addu       $at, $at, $a2
    /* 4BFC0 8005BFC0 68A6238C */  lw         $v1, %lo(plr + 0x130)($at)
    /* 4BFC4 8005BFC4 23105100 */  subu       $v0, $v0, $s1
    /* 4BFC8 8005BFC8 83190300 */  sra        $v1, $v1, 6
    /* 4BFCC 8005BFCC 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4BFD0 8005BFD0 21082600 */  addu       $at, $at, $a2
    /* 4BFD4 8005BFD4 64A622AC */  sw         $v0, %lo(plr + 0x12C)($at)
    /* 4BFD8 8005BFD8 0700601C */  bgtz       $v1, .L8005BFF8
    /* 4BFDC 8005BFDC 00000000 */   nop
    /* 4BFE0 8005BFE0 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4BFE4 8005BFE4 21082600 */  addu       $at, $at, $a2
    /* 4BFE8 8005BFE8 68A635AC */  sw         $s5, %lo(plr + 0x130)($at)
    /* 4BFEC 8005BFEC 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4BFF0 8005BFF0 21082600 */  addu       $at, $at, $a2
    /* 4BFF4 8005BFF4 60A620AC */  sw         $zero, %lo(plr + 0x128)($at)
  .L8005BFF8:
    /* 4BFF8 8005BFF8 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4BFFC 8005BFFC 21082600 */  addu       $at, $at, $a2
    /* 4C000 8005C000 6CA6228C */  lw         $v0, %lo(plr + 0x134)($at)
    /* 4C004 8005C004 00000000 */  nop
    /* 4C008 8005C008 83110200 */  sra        $v0, $v0, 6
    /* 4C00C 8005C00C 0700401C */  bgtz       $v0, .L8005C02C
    /* 4C010 8005C010 00000000 */   nop
    /* 4C014 8005C014 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4C018 8005C018 21082600 */  addu       $at, $at, $a2
    /* 4C01C 8005C01C 6CA636AC */  sw         $s6, %lo(plr + 0x134)($at)
    /* 4C020 8005C020 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4C024 8005C024 21082600 */  addu       $at, $at, $a2
    /* 4C028 8005C028 64A620AC */  sw         $zero, %lo(plr + 0x12C)($at)
  .L8005C02C:
    /* 4C02C 8005C02C 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C030 8005C030 1C000424 */   addiu     $a0, $zero, 0x1C
    /* 4C034 8005C034 FD710108 */  j          .L8005C7F4
    /* 4C038 8005C038 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C03C
    /* 4C03C 8005C03C 21900000 */  addu       $s2, $zero, $zero
    /* 4C040 8005C040 40101300 */  sll        $v0, $s3, 1
    /* 4C044 8005C044 21105300 */  addu       $v0, $v0, $s3
    /* 4C048 8005C048 80100200 */  sll        $v0, $v0, 2
    /* 4C04C 8005C04C 21105300 */  addu       $v0, $v0, $s3
    /* 4C050 8005C050 00110200 */  sll        $v0, $v0, 4
    /* 4C054 8005C054 23105300 */  subu       $v0, $v0, $s3
    /* 4C058 8005C058 80100200 */  sll        $v0, $v0, 2
    /* 4C05C 8005C05C 21105300 */  addu       $v0, $v0, $s3
    /* 4C060 8005C060 C0800200 */  sll        $s0, $v0, 3
    /* 4C064 8005C064 0E80143C */  lui        $s4, %hi(plr + 0x1588)
    /* 4C068 8005C068 C0BA9426 */  addiu      $s4, $s4, %lo(plr + 0x1588)
    /* 4C06C 8005C06C 1CEF8226 */  addiu      $v0, $s4, -0x10E4
    /* 4C070 8005C070 21B00202 */  addu       $s6, $s0, $v0
    /* 4C074 8005C074 21101402 */  addu       $v0, $s0, $s4
  .L8005C078:
    /* 4C078 8005C078 21105200 */  addu       $v0, $v0, $s2
    /* 4C07C 8005C07C 00004280 */  lb         $v0, 0x0($v0)
    /* 4C080 8005C080 00000000 */  nop
    /* 4C084 8005C084 57004014 */  bnez       $v0, .L8005C1E4
    /* 4C088 8005C088 00000000 */   nop
    /* 4C08C 8005C08C 1280023C */  lui        $v0, %hi(leveltype)
    /* 4C090 8005C090 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 4C094 8005C094 00000000 */  nop
    /* 4C098 8005C098 80200200 */  sll        $a0, $v0, 2
    /* 4C09C 8005C09C 21208200 */  addu       $a0, $a0, $v0
    /* 4C0A0 8005C0A0 C9F6000C */  jal        ENG_random__Fl
    /* 4C0A4 8005C0A4 40200400 */   sll       $a0, $a0, 1
    /* 4C0A8 8005C0A8 1280043C */  lui        $a0, %hi(leveltype)
    /* 4C0AC 8005C0AC 0DC18490 */  lbu        $a0, %lo(leveltype)($a0)
    /* 4C0B0 8005C0B0 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4C0B4 8005C0B4 21083000 */  addu       $at, $at, $s0
    /* 4C0B8 8005C0B8 BCBA318C */  lw         $s1, %lo(plr + 0x1584)($at)
    /* 4C0BC 8005C0BC 80180400 */  sll        $v1, $a0, 2
    /* 4C0C0 8005C0C0 21186400 */  addu       $v1, $v1, $a0
    /* 4C0C4 8005C0C4 21A86200 */  addu       $s5, $v1, $v0
    /* 4C0C8 8005C0C8 C0101100 */  sll        $v0, $s1, 3
    /* 4C0CC 8005C0CC 23105100 */  subu       $v0, $v0, $s1
    /* 4C0D0 8005C0D0 80100200 */  sll        $v0, $v0, 2
    /* 4C0D4 8005C0D4 23105100 */  subu       $v0, $v0, $s1
    /* 4C0D8 8005C0D8 80100200 */  sll        $v0, $v0, 2
    /* 4C0DC 8005C0DC 21385600 */  addu       $a3, $v0, $s6
    /* 4C0E0 8005C0E0 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 4C0E4 8005C0E4 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 4C0E8 8005C0E8 0E80043C */  lui        $a0, %hi(_golditem)
    /* 4C0EC 8005C0EC B01C8424 */  addiu      $a0, $a0, %lo(_golditem)
    /* 4C0F0 8005C0F0 C0100300 */  sll        $v0, $v1, 3
    /* 4C0F4 8005C0F4 23104300 */  subu       $v0, $v0, $v1
    /* 4C0F8 8005C0F8 80100200 */  sll        $v0, $v0, 2
    /* 4C0FC 8005C0FC 23104300 */  subu       $v0, $v0, $v1
    /* 4C100 8005C100 80100200 */  sll        $v0, $v0, 2
    /* 4C104 8005C104 21304400 */  addu       $a2, $v0, $a0
    /* 4C108 8005C108 6000C824 */  addiu      $t0, $a2, 0x60
  .L8005C10C:
    /* 4C10C 8005C10C 0000C28C */  lw         $v0, 0x0($a2)
    /* 4C110 8005C110 0400C38C */  lw         $v1, 0x4($a2)
    /* 4C114 8005C114 0800C48C */  lw         $a0, 0x8($a2)
    /* 4C118 8005C118 0C00C58C */  lw         $a1, 0xC($a2)
    /* 4C11C 8005C11C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 4C120 8005C120 0400E3AC */  sw         $v1, 0x4($a3)
    /* 4C124 8005C124 0800E4AC */  sw         $a0, 0x8($a3)
    /* 4C128 8005C128 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 4C12C 8005C12C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 4C130 8005C130 F6FFC814 */  bne        $a2, $t0, .L8005C10C
    /* 4C134 8005C134 1000E724 */   addiu     $a3, $a3, 0x10
    /* 4C138 8005C138 0000C28C */  lw         $v0, 0x0($a2)
    /* 4C13C 8005C13C 0400C38C */  lw         $v1, 0x4($a2)
    /* 4C140 8005C140 0800C48C */  lw         $a0, 0x8($a2)
    /* 4C144 8005C144 0000E2AC */  sw         $v0, 0x0($a3)
    /* 4C148 8005C148 0400E3AC */  sw         $v1, 0x4($a3)
    /* 4C14C 8005C14C B7F6000C */  jal        GetRndSeed__Fv
    /* 4C150 8005C150 0800E4AC */   sw        $a0, 0x8($a3)
    /* 4C154 8005C154 C0181100 */  sll        $v1, $s1, 3
    /* 4C158 8005C158 23187100 */  subu       $v1, $v1, $s1
    /* 4C15C 8005C15C 80180300 */  sll        $v1, $v1, 2
    /* 4C160 8005C160 23187100 */  subu       $v1, $v1, $s1
    /* 4C164 8005C164 80180300 */  sll        $v1, $v1, 2
    /* 4C168 8005C168 21187000 */  addu       $v1, $v1, $s0
    /* 4C16C 8005C16C 0E80013C */  lui        $at, %hi(plr + 0x4B4)
    /* 4C170 8005C170 21082300 */  addu       $at, $at, $v1
    /* 4C174 8005C174 ECA922AC */  sw         $v0, %lo(plr + 0x4B4)($at)
    /* 4C178 8005C178 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4C17C 8005C17C 21083000 */  addu       $at, $at, $s0
    /* 4C180 8005C180 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4C184 8005C184 21206002 */  addu       $a0, $s3, $zero
    /* 4C188 8005C188 01004224 */  addiu      $v0, $v0, 0x1
    /* 4C18C 8005C18C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4C190 8005C190 21083000 */  addu       $at, $at, $s0
    /* 4C194 8005C194 BCBA22AC */  sw         $v0, %lo(plr + 0x1584)($at)
    /* 4C198 8005C198 21101402 */  addu       $v0, $s0, $s4
    /* 4C19C 8005C19C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4C1A0 8005C1A0 21083000 */  addu       $at, $at, $s0
    /* 4C1A4 8005C1A4 BCBA258C */  lw         $a1, %lo(plr + 0x1584)($at)
    /* 4C1A8 8005C1A8 21105200 */  addu       $v0, $v0, $s2
    /* 4C1AC 8005C1AC 000045A0 */  sb         $a1, 0x0($v0)
    /* 4C1B0 8005C1B0 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 4C1B4 8005C1B4 21082300 */  addu       $at, $at, $v1
    /* 4C1B8 8005C1B8 F0A935AC */  sw         $s5, %lo(plr + 0x4B8)($at)
    /* 4C1BC 8005C1BC 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 4C1C0 8005C1C0 21083000 */  addu       $at, $at, $s0
    /* 4C1C4 8005C1C4 88A6228C */  lw         $v0, %lo(plr + 0x150)($at)
    /* 4C1C8 8005C1C8 00000000 */  nop
    /* 4C1CC 8005C1CC 21105500 */  addu       $v0, $v0, $s5
    /* 4C1D0 8005C1D0 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 4C1D4 8005C1D4 21083000 */  addu       $at, $at, $s0
    /* 4C1D8 8005C1D8 88A622AC */  sw         $v0, %lo(plr + 0x150)($at)
    /* 4C1DC 8005C1DC 92C1010C */  jal        SetGoldCurs__Fii
    /* 4C1E0 8005C1E0 21282002 */   addu      $a1, $s1, $zero
  .L8005C1E4:
    /* 4C1E4 8005C1E4 01005226 */  addiu      $s2, $s2, 0x1
    /* 4C1E8 8005C1E8 2800422A */  slti       $v0, $s2, 0x28
    /* 4C1EC 8005C1EC A2FF4014 */  bnez       $v0, .L8005C078
    /* 4C1F0 8005C1F0 21101402 */   addu      $v0, $s0, $s4
    /* 4C1F4 8005C1F4 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C1F8 8005C1F8 1D000424 */   addiu     $a0, $zero, 0x1D
    /* 4C1FC 8005C1FC FD710108 */  j          .L8005C7F4
    /* 4C200 8005C200 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C204
    /* 4C204 8005C204 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 4C208 8005C208 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 4C20C 8005C20C 01000224 */  addiu      $v0, $zero, 0x1
    /* 4C210 8005C210 05006214 */  bne        $v1, $v0, .L8005C228
    /* 4C214 8005C214 00000000 */   nop
    /* 4C218 8005C218 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C21C 8005C21C 1E000424 */   addiu     $a0, $zero, 0x1E
    /* 4C220 8005C220 FD710108 */  j          .L8005C7F4
    /* 4C224 8005C224 21206002 */   addu      $a0, $s3, $zero
  .L8005C228:
    /* 4C228 8005C228 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C22C 8005C22C 1F000424 */   addiu     $a0, $zero, 0x1F
    /* 4C230 8005C230 0100633A */  xori       $v1, $s3, 0x1
    /* 4C234 8005C234 40100300 */  sll        $v0, $v1, 1
    /* 4C238 8005C238 21104300 */  addu       $v0, $v0, $v1
    /* 4C23C 8005C23C 80100200 */  sll        $v0, $v0, 2
    /* 4C240 8005C240 21104300 */  addu       $v0, $v0, $v1
    /* 4C244 8005C244 00110200 */  sll        $v0, $v0, 4
    /* 4C248 8005C248 23104300 */  subu       $v0, $v0, $v1
    /* 4C24C 8005C24C 80100200 */  sll        $v0, $v0, 2
    /* 4C250 8005C250 21104300 */  addu       $v0, $v0, $v1
    /* 4C254 8005C254 C0100200 */  sll        $v0, $v0, 3
    /* 4C258 8005C258 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 4C25C 8005C25C 21082200 */  addu       $at, $at, $v0
    /* 4C260 8005C260 58A6238C */  lw         $v1, %lo(plr + 0x120)($at)
    /* 4C264 8005C264 0E80013C */  lui        $at, %hi(plr + 0x118)
    /* 4C268 8005C268 21082200 */  addu       $at, $at, $v0
    /* 4C26C 8005C26C 50A6248C */  lw         $a0, %lo(plr + 0x118)($at)
    /* 4C270 8005C270 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4C274 8005C274 21082200 */  addu       $at, $at, $v0
    /* 4C278 8005C278 6CA6258C */  lw         $a1, %lo(plr + 0x134)($at)
    /* 4C27C 8005C27C 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4C280 8005C280 21082200 */  addu       $at, $at, $v0
    /* 4C284 8005C284 64A6268C */  lw         $a2, %lo(plr + 0x12C)($at)
    /* 4C288 8005C288 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 4C28C 8005C28C 21082200 */  addu       $at, $at, $v0
    /* 4C290 8005C290 54A623AC */  sw         $v1, %lo(plr + 0x11C)($at)
    /* 4C294 8005C294 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 4C298 8005C298 21082200 */  addu       $at, $at, $v0
    /* 4C29C 8005C29C 4CA624AC */  sw         $a0, %lo(plr + 0x114)($at)
    /* 4C2A0 8005C2A0 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4C2A4 8005C2A4 21082200 */  addu       $at, $at, $v0
    /* 4C2A8 8005C2A8 68A625AC */  sw         $a1, %lo(plr + 0x130)($at)
    /* 4C2AC 8005C2AC 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4C2B0 8005C2B0 21082200 */  addu       $at, $at, $v0
    /* 4C2B4 8005C2B4 60A626AC */  sw         $a2, %lo(plr + 0x128)($at)
    /* 4C2B8 8005C2B8 FD710108 */  j          .L8005C7F4
    /* 4C2BC 8005C2BC 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C2C0
    /* 4C2C0 8005C2C0 21206002 */  addu       $a0, $s3, $zero
    /* 4C2C4 8005C2C4 EA97010C */  jal        ModifyPlrDex__Fii
    /* 4C2C8 8005C2C8 02000524 */   addiu     $a1, $zero, 0x2
    /* 4C2CC 8005C2CC F396010C */  jal        CheckStats__Fi
    /* 4C2D0 8005C2D0 21206002 */   addu      $a0, $s3, $zero
    /* 4C2D4 8005C2D4 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C2D8 8005C2D8 20000424 */   addiu     $a0, $zero, 0x20
    /* 4C2DC 8005C2DC FD710108 */  j          .L8005C7F4
    /* 4C2E0 8005C2E0 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C2E4
    /* 4C2E4 8005C2E4 21206002 */  addu       $a0, $s3, $zero
    /* 4C2E8 8005C2E8 6897010C */  jal        ModifyPlrStr__Fii
    /* 4C2EC 8005C2EC 02000524 */   addiu     $a1, $zero, 0x2
    /* 4C2F0 8005C2F0 F396010C */  jal        CheckStats__Fi
    /* 4C2F4 8005C2F4 21206002 */   addu      $a0, $s3, $zero
    /* 4C2F8 8005C2F8 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C2FC 8005C2FC 21000424 */   addiu     $a0, $zero, 0x21
    /* 4C300 8005C300 FD710108 */  j          .L8005C7F4
    /* 4C304 8005C304 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C308
    /* 4C308 8005C308 21206002 */  addu       $a0, $s3, $zero
    /* 4C30C 8005C30C 2398010C */  jal        ModifyPlrVit__Fii
    /* 4C310 8005C310 02000524 */   addiu     $a1, $zero, 0x2
    /* 4C314 8005C314 F396010C */  jal        CheckStats__Fi
    /* 4C318 8005C318 21206002 */   addu      $a0, $s3, $zero
    /* 4C31C 8005C31C 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C320 8005C320 22000424 */   addiu     $a0, $zero, 0x22
    /* 4C324 8005C324 FD710108 */  j          .L8005C7F4
    /* 4C328 8005C328 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C32C
    /* 4C32C 8005C32C 21280000 */  addu       $a1, $zero, $zero
    /* 4C330 8005C330 1180073C */  lui        $a3, %hi(automapview)
    /* 4C334 8005C334 E4D6E724 */  addiu      $a3, $a3, %lo(automapview)
    /* 4C338 8005C338 FF000624 */  addiu      $a2, $zero, 0xFF
    /* 4C33C 8005C33C 21200000 */  addu       $a0, $zero, $zero
  .L8005C340:
    /* 4C340 8005C340 2118E000 */  addu       $v1, $a3, $zero
  .L8005C344:
    /* 4C344 8005C344 21106500 */  addu       $v0, $v1, $a1
    /* 4C348 8005C348 000046A0 */  sb         $a2, 0x0($v0)
    /* 4C34C 8005C34C 01008424 */  addiu      $a0, $a0, 0x1
    /* 4C350 8005C350 05008228 */  slti       $v0, $a0, 0x5
    /* 4C354 8005C354 FBFF4014 */  bnez       $v0, .L8005C344
    /* 4C358 8005C358 28006324 */   addiu     $v1, $v1, 0x28
    /* 4C35C 8005C35C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 4C360 8005C360 2800A228 */  slti       $v0, $a1, 0x28
    /* 4C364 8005C364 F6FF4014 */  bnez       $v0, .L8005C340
    /* 4C368 8005C368 21200000 */   addu      $a0, $zero, $zero
    /* 4C36C 8005C36C 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C370 8005C370 23000424 */   addiu     $a0, $zero, 0x23
    /* 4C374 8005C374 FD710108 */  j          .L8005C7F4
    /* 4C378 8005C378 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C37C
    /* 4C37C 8005C37C 40101300 */  sll        $v0, $s3, 1
    /* 4C380 8005C380 21105300 */  addu       $v0, $v0, $s3
    /* 4C384 8005C384 80100200 */  sll        $v0, $v0, 2
    /* 4C388 8005C388 21105300 */  addu       $v0, $v0, $s3
    /* 4C38C 8005C38C 00110200 */  sll        $v0, $v0, 4
    /* 4C390 8005C390 23105300 */  subu       $v0, $v0, $s3
    /* 4C394 8005C394 80100200 */  sll        $v0, $v0, 2
    /* 4C398 8005C398 21105300 */  addu       $v0, $v0, $s3
    /* 4C39C 8005C39C C0280200 */  sll        $a1, $v0, 3
    /* 4C3A0 8005C3A0 00000724 */  addiu      $a3, $zero, 0x0
    /* 4C3A4 8005C3A4 0040063C */  lui        $a2, (0x40000000 >> 16)
    /* 4C3A8 8005C3A8 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4C3AC 8005C3AC 21082500 */  addu       $at, $at, $a1
    /* 4C3B0 8005C3B0 F0A5228C */  lw         $v0, %lo(plr + 0xB8)($at)
    /* 4C3B4 8005C3B4 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4C3B8 8005C3B8 21082500 */  addu       $at, $at, $a1
    /* 4C3BC 8005C3BC F4A5238C */  lw         $v1, %lo(plr + 0xBC)($at)
    /* 4C3C0 8005C3C0 0E80013C */  lui        $at, %hi(plr + 0x90)
    /* 4C3C4 8005C3C4 21082500 */  addu       $at, $at, $a1
    /* 4C3C8 8005C3C8 C8A52480 */  lb         $a0, %lo(plr + 0x90)($at)
    /* 4C3CC 8005C3CC 25186700 */  or         $v1, $v1, $a3
    /* 4C3D0 8005C3D0 25104600 */  or         $v0, $v0, $a2
    /* 4C3D4 8005C3D4 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 4C3D8 8005C3D8 21082500 */  addu       $at, $at, $a1
    /* 4C3DC 8005C3DC F0A522AC */  sw         $v0, %lo(plr + 0xB8)($at)
    /* 4C3E0 8005C3E0 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 4C3E4 8005C3E4 21082500 */  addu       $at, $at, $a1
    /* 4C3E8 8005C3E8 F4A523AC */  sw         $v1, %lo(plr + 0xBC)($at)
    /* 4C3EC 8005C3EC 21108000 */  addu       $v0, $a0, $zero
    /* 4C3F0 8005C3F0 0F008428 */  slti       $a0, $a0, 0xF
    /* 4C3F4 8005C3F4 0E008010 */  beqz       $a0, .L8005C430
    /* 4C3F8 8005C3F8 01004224 */   addiu     $v0, $v0, 0x1
    /* 4C3FC 8005C3FC 0E80033C */  lui        $v1, %hi(plr)
    /* 4C400 8005C400 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 4C404 8005C404 2120A300 */  addu       $a0, $a1, $v1
    /* 4C408 8005C408 900082A0 */  sb         $v0, 0x90($a0)
    /* 4C40C 8005C40C 0E80013C */  lui        $at, %hi(plr + 0x90)
    /* 4C410 8005C410 21082500 */  addu       $at, $at, $a1
    /* 4C414 8005C414 C8A52280 */  lb         $v0, %lo(plr + 0x90)($at)
    /* 4C418 8005C418 00000000 */  nop
    /* 4C41C 8005C41C 21184000 */  addu       $v1, $v0, $zero
    /* 4C420 8005C420 0F004228 */  slti       $v0, $v0, 0xF
    /* 4C424 8005C424 02004010 */  beqz       $v0, .L8005C430
    /* 4C428 8005C428 01006224 */   addiu     $v0, $v1, 0x1
    /* 4C42C 8005C42C 900082A0 */  sb         $v0, 0x90($a0)
  .L8005C430:
    /* 4C430 8005C430 6666043C */  lui        $a0, (0x66666667 >> 16)
    /* 4C434 8005C434 40101300 */  sll        $v0, $s3, 1
    /* 4C438 8005C438 21105300 */  addu       $v0, $v0, $s3
    /* 4C43C 8005C43C 80100200 */  sll        $v0, $v0, 2
    /* 4C440 8005C440 21105300 */  addu       $v0, $v0, $s3
    /* 4C444 8005C444 00110200 */  sll        $v0, $v0, 4
    /* 4C448 8005C448 23105300 */  subu       $v0, $v0, $s3
    /* 4C44C 8005C44C 80100200 */  sll        $v0, $v0, 2
    /* 4C450 8005C450 21105300 */  addu       $v0, $v0, $s3
    /* 4C454 8005C454 C0300200 */  sll        $a2, $v0, 3
    /* 4C458 8005C458 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4C45C 8005C45C 21082600 */  addu       $at, $at, $a2
    /* 4C460 8005C460 64A6238C */  lw         $v1, %lo(plr + 0x12C)($at)
    /* 4C464 8005C464 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
    /* 4C468 8005C468 18006400 */  mult       $v1, $a0
    /* 4C46C 8005C46C 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4C470 8005C470 21082600 */  addu       $at, $at, $a2
    /* 4C474 8005C474 68A6258C */  lw         $a1, %lo(plr + 0x130)($at)
    /* 4C478 8005C478 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4C47C 8005C47C 21082600 */  addu       $at, $at, $a2
    /* 4C480 8005C480 60A6228C */  lw         $v0, %lo(plr + 0x128)($at)
    /* 4C484 8005C484 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4C488 8005C488 21082600 */  addu       $at, $at, $a2
    /* 4C48C 8005C48C 6CA6248C */  lw         $a0, %lo(plr + 0x134)($at)
    /* 4C490 8005C490 23A8A200 */  subu       $s5, $a1, $v0
    /* 4C494 8005C494 23B08300 */  subu       $s6, $a0, $v1
    /* 4C498 8005C498 C31F0300 */  sra        $v1, $v1, 31
    /* 4C49C 8005C49C 10580000 */  mfhi       $t3
    /* 4C4A0 8005C4A0 83200B00 */  sra        $a0, $t3, 2
    /* 4C4A4 8005C4A4 23888300 */  subu       $s1, $a0, $v1
    /* 4C4A8 8005C4A8 23105100 */  subu       $v0, $v0, $s1
    /* 4C4AC 8005C4AC 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4C4B0 8005C4B0 21082600 */  addu       $at, $at, $a2
    /* 4C4B4 8005C4B4 60A622AC */  sw         $v0, %lo(plr + 0x128)($at)
    /* 4C4B8 8005C4B8 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4C4BC 8005C4BC 21082600 */  addu       $at, $at, $a2
    /* 4C4C0 8005C4C0 68A6228C */  lw         $v0, %lo(plr + 0x130)($at)
    /* 4C4C4 8005C4C4 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4C4C8 8005C4C8 21082600 */  addu       $at, $at, $a2
    /* 4C4CC 8005C4CC 6CA6238C */  lw         $v1, %lo(plr + 0x134)($at)
    /* 4C4D0 8005C4D0 23105100 */  subu       $v0, $v0, $s1
    /* 4C4D4 8005C4D4 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4C4D8 8005C4D8 21082600 */  addu       $at, $at, $a2
    /* 4C4DC 8005C4DC 68A622AC */  sw         $v0, %lo(plr + 0x130)($at)
    /* 4C4E0 8005C4E0 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4C4E4 8005C4E4 21082600 */  addu       $at, $at, $a2
    /* 4C4E8 8005C4E8 64A6228C */  lw         $v0, %lo(plr + 0x12C)($at)
    /* 4C4EC 8005C4EC 23187100 */  subu       $v1, $v1, $s1
    /* 4C4F0 8005C4F0 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4C4F4 8005C4F4 21082600 */  addu       $at, $at, $a2
    /* 4C4F8 8005C4F8 6CA623AC */  sw         $v1, %lo(plr + 0x134)($at)
    /* 4C4FC 8005C4FC 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4C500 8005C500 21082600 */  addu       $at, $at, $a2
    /* 4C504 8005C504 68A6238C */  lw         $v1, %lo(plr + 0x130)($at)
    /* 4C508 8005C508 23105100 */  subu       $v0, $v0, $s1
    /* 4C50C 8005C50C 83190300 */  sra        $v1, $v1, 6
    /* 4C510 8005C510 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4C514 8005C514 21082600 */  addu       $at, $at, $a2
    /* 4C518 8005C518 64A622AC */  sw         $v0, %lo(plr + 0x12C)($at)
    /* 4C51C 8005C51C 0700601C */  bgtz       $v1, .L8005C53C
    /* 4C520 8005C520 00000000 */   nop
    /* 4C524 8005C524 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 4C528 8005C528 21082600 */  addu       $at, $at, $a2
    /* 4C52C 8005C52C 68A635AC */  sw         $s5, %lo(plr + 0x130)($at)
    /* 4C530 8005C530 0E80013C */  lui        $at, %hi(plr + 0x128)
    /* 4C534 8005C534 21082600 */  addu       $at, $at, $a2
    /* 4C538 8005C538 60A620AC */  sw         $zero, %lo(plr + 0x128)($at)
  .L8005C53C:
    /* 4C53C 8005C53C 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4C540 8005C540 21082600 */  addu       $at, $at, $a2
    /* 4C544 8005C544 6CA6228C */  lw         $v0, %lo(plr + 0x134)($at)
    /* 4C548 8005C548 00000000 */  nop
    /* 4C54C 8005C54C 83110200 */  sra        $v0, $v0, 6
    /* 4C550 8005C550 0700401C */  bgtz       $v0, .L8005C570
    /* 4C554 8005C554 00000000 */   nop
    /* 4C558 8005C558 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 4C55C 8005C55C 21082600 */  addu       $at, $at, $a2
    /* 4C560 8005C560 6CA636AC */  sw         $s6, %lo(plr + 0x134)($at)
    /* 4C564 8005C564 0E80013C */  lui        $at, %hi(plr + 0x12C)
    /* 4C568 8005C568 21082600 */  addu       $at, $at, $a2
    /* 4C56C 8005C56C 64A620AC */  sw         $zero, %lo(plr + 0x12C)($at)
  .L8005C570:
    /* 4C570 8005C570 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C574 8005C574 24000424 */   addiu     $a0, $zero, 0x24
    /* 4C578 8005C578 FD710108 */  j          .L8005C7F4
    /* 4C57C 8005C57C 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C580
    /* 4C580 8005C580 21900000 */  addu       $s2, $zero, $zero
    /* 4C584 8005C584 01000424 */  addiu      $a0, $zero, 0x1
    /* 4C588 8005C588 40101300 */  sll        $v0, $s3, 1
    /* 4C58C 8005C58C 21105300 */  addu       $v0, $v0, $s3
    /* 4C590 8005C590 80100200 */  sll        $v0, $v0, 2
    /* 4C594 8005C594 21105300 */  addu       $v0, $v0, $s3
    /* 4C598 8005C598 00110200 */  sll        $v0, $v0, 4
    /* 4C59C 8005C59C 23105300 */  subu       $v0, $v0, $s3
    /* 4C5A0 8005C5A0 80100200 */  sll        $v0, $v0, 2
    /* 4C5A4 8005C5A4 21105300 */  addu       $v0, $v0, $s3
    /* 4C5A8 8005C5A8 C0180200 */  sll        $v1, $v0, 3
  .L8005C5AC:
    /* 4C5AC 8005C5AC 0E80013C */  lui        $at, %hi(plr + 0x201)
    /* 4C5B0 8005C5B0 21082300 */  addu       $at, $at, $v1
    /* 4C5B4 8005C5B4 39A72280 */  lb         $v0, %lo(plr + 0x201)($at)
    /* 4C5B8 8005C5B8 00000000 */  nop
    /* 4C5BC 8005C5BC 0A004010 */  beqz       $v0, .L8005C5E8
    /* 4C5C0 8005C5C0 00000000 */   nop
    /* 4C5C4 8005C5C4 0E80013C */  lui        $at, %hi(plr + 0x219)
    /* 4C5C8 8005C5C8 21082300 */  addu       $at, $at, $v1
    /* 4C5CC 8005C5CC 51A72280 */  lb         $v0, %lo(plr + 0x219)($at)
    /* 4C5D0 8005C5D0 00000000 */  nop
    /* 4C5D4 8005C5D4 04004014 */  bnez       $v0, .L8005C5E8
    /* 4C5D8 8005C5D8 00000000 */   nop
    /* 4C5DC 8005C5DC 0E80013C */  lui        $at, %hi(plr + 0x219)
    /* 4C5E0 8005C5E0 21082300 */  addu       $at, $at, $v1
    /* 4C5E4 8005C5E4 51A724A0 */  sb         $a0, %lo(plr + 0x219)($at)
  .L8005C5E8:
    /* 4C5E8 8005C5E8 01005226 */  addiu      $s2, $s2, 0x1
    /* 4C5EC 8005C5EC 0700422A */  slti       $v0, $s2, 0x7
    /* 4C5F0 8005C5F0 EEFF4014 */  bnez       $v0, .L8005C5AC
    /* 4C5F4 8005C5F4 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 4C5F8 8005C5F8 40181300 */  sll        $v1, $s3, 1
    /* 4C5FC 8005C5FC 21107300 */  addu       $v0, $v1, $s3
    /* 4C600 8005C600 80100200 */  sll        $v0, $v0, 2
    /* 4C604 8005C604 21105300 */  addu       $v0, $v0, $s3
    /* 4C608 8005C608 00110200 */  sll        $v0, $v0, 4
    /* 4C60C 8005C60C 23105300 */  subu       $v0, $v0, $s3
    /* 4C610 8005C610 80100200 */  sll        $v0, $v0, 2
    /* 4C614 8005C614 21105300 */  addu       $v0, $v0, $s3
    /* 4C618 8005C618 C0100200 */  sll        $v0, $v0, 3
    /* 4C61C 8005C61C 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4C620 8005C620 21082200 */  addu       $at, $at, $v0
    /* 4C624 8005C624 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4C628 8005C628 00000000 */  nop
    /* 4C62C 8005C62C 2B004018 */  blez       $v0, .L8005C6DC
    /* 4C630 8005C630 21900000 */   addu      $s2, $zero, $zero
    /* 4C634 8005C634 01000524 */  addiu      $a1, $zero, 0x1
    /* 4C638 8005C638 21200000 */  addu       $a0, $zero, $zero
  .L8005C63C:
    /* 4C63C 8005C63C 21107300 */  addu       $v0, $v1, $s3
    /* 4C640 8005C640 80100200 */  sll        $v0, $v0, 2
    /* 4C644 8005C644 21105300 */  addu       $v0, $v0, $s3
    /* 4C648 8005C648 00110200 */  sll        $v0, $v0, 4
    /* 4C64C 8005C64C 23105300 */  subu       $v0, $v0, $s3
    /* 4C650 8005C650 80100200 */  sll        $v0, $v0, 2
    /* 4C654 8005C654 21105300 */  addu       $v0, $v0, $s3
    /* 4C658 8005C658 C0100200 */  sll        $v0, $v0, 3
    /* 4C65C 8005C65C 21188200 */  addu       $v1, $a0, $v0
    /* 4C660 8005C660 0E80013C */  lui        $at, %hi(plr + 0x4F5)
    /* 4C664 8005C664 21082300 */  addu       $at, $at, $v1
    /* 4C668 8005C668 2DAA2280 */  lb         $v0, %lo(plr + 0x4F5)($at)
    /* 4C66C 8005C66C 00000000 */  nop
    /* 4C670 8005C670 0A004010 */  beqz       $v0, .L8005C69C
    /* 4C674 8005C674 00000000 */   nop
    /* 4C678 8005C678 0E80013C */  lui        $at, %hi(plr + 0x50D)
    /* 4C67C 8005C67C 21082300 */  addu       $at, $at, $v1
    /* 4C680 8005C680 45AA2280 */  lb         $v0, %lo(plr + 0x50D)($at)
    /* 4C684 8005C684 00000000 */  nop
    /* 4C688 8005C688 04004014 */  bnez       $v0, .L8005C69C
    /* 4C68C 8005C68C 00000000 */   nop
    /* 4C690 8005C690 0E80013C */  lui        $at, %hi(plr + 0x50D)
    /* 4C694 8005C694 21082300 */  addu       $at, $at, $v1
    /* 4C698 8005C698 45AA25A0 */  sb         $a1, %lo(plr + 0x50D)($at)
  .L8005C69C:
    /* 4C69C 8005C69C 40181300 */  sll        $v1, $s3, 1
    /* 4C6A0 8005C6A0 21107300 */  addu       $v0, $v1, $s3
    /* 4C6A4 8005C6A4 80100200 */  sll        $v0, $v0, 2
    /* 4C6A8 8005C6A8 21105300 */  addu       $v0, $v0, $s3
    /* 4C6AC 8005C6AC 00110200 */  sll        $v0, $v0, 4
    /* 4C6B0 8005C6B0 23105300 */  subu       $v0, $v0, $s3
    /* 4C6B4 8005C6B4 80100200 */  sll        $v0, $v0, 2
    /* 4C6B8 8005C6B8 21105300 */  addu       $v0, $v0, $s3
    /* 4C6BC 8005C6BC C0100200 */  sll        $v0, $v0, 3
    /* 4C6C0 8005C6C0 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 4C6C4 8005C6C4 21082200 */  addu       $at, $at, $v0
    /* 4C6C8 8005C6C8 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 4C6CC 8005C6CC 01005226 */  addiu      $s2, $s2, 0x1
    /* 4C6D0 8005C6D0 2A104202 */  slt        $v0, $s2, $v0
    /* 4C6D4 8005C6D4 D9FF4014 */  bnez       $v0, .L8005C63C
    /* 4C6D8 8005C6D8 6C008424 */   addiu     $a0, $a0, 0x6C
  .L8005C6DC:
    /* 4C6DC 8005C6DC 21900000 */  addu       $s2, $zero, $zero
    /* 4C6E0 8005C6E0 01000424 */  addiu      $a0, $zero, 0x1
    /* 4C6E4 8005C6E4 40101300 */  sll        $v0, $s3, 1
    /* 4C6E8 8005C6E8 21105300 */  addu       $v0, $v0, $s3
    /* 4C6EC 8005C6EC 80100200 */  sll        $v0, $v0, 2
    /* 4C6F0 8005C6F0 21105300 */  addu       $v0, $v0, $s3
    /* 4C6F4 8005C6F4 00110200 */  sll        $v0, $v0, 4
    /* 4C6F8 8005C6F8 23105300 */  subu       $v0, $v0, $s3
    /* 4C6FC 8005C6FC 80100200 */  sll        $v0, $v0, 2
    /* 4C700 8005C700 21105300 */  addu       $v0, $v0, $s3
    /* 4C704 8005C704 C0180200 */  sll        $v1, $v0, 3
  .L8005C708:
    /* 4C708 8005C708 0E80013C */  lui        $at, %hi(plr + 0x1601)
    /* 4C70C 8005C70C 21082300 */  addu       $at, $at, $v1
    /* 4C710 8005C710 39BB2280 */  lb         $v0, %lo(plr + 0x1601)($at)
    /* 4C714 8005C714 00000000 */  nop
    /* 4C718 8005C718 0A004010 */  beqz       $v0, .L8005C744
    /* 4C71C 8005C71C 00000000 */   nop
    /* 4C720 8005C720 0E80013C */  lui        $at, %hi(plr + 0x1619)
    /* 4C724 8005C724 21082300 */  addu       $at, $at, $v1
    /* 4C728 8005C728 51BB2280 */  lb         $v0, %lo(plr + 0x1619)($at)
    /* 4C72C 8005C72C 00000000 */  nop
    /* 4C730 8005C730 04004014 */  bnez       $v0, .L8005C744
    /* 4C734 8005C734 00000000 */   nop
    /* 4C738 8005C738 0E80013C */  lui        $at, %hi(plr + 0x1619)
    /* 4C73C 8005C73C 21082300 */  addu       $at, $at, $v1
    /* 4C740 8005C740 51BB24A0 */  sb         $a0, %lo(plr + 0x1619)($at)
  .L8005C744:
    /* 4C744 8005C744 01005226 */  addiu      $s2, $s2, 0x1
    /* 4C748 8005C748 0800422A */  slti       $v0, $s2, 0x8
    /* 4C74C 8005C74C EEFF4014 */  bnez       $v0, .L8005C708
    /* 4C750 8005C750 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 4C754 8005C754 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C758 8005C758 25000424 */   addiu     $a0, $zero, 0x25
    /* 4C75C 8005C75C FD710108 */  j          .L8005C7F4
    /* 4C760 8005C760 21206002 */   addu      $a0, $s3, $zero
  jlabel .L8005C764
    /* 4C764 8005C764 11F7000C */  jal        InitDiabloMsg__Fc
    /* 4C768 8005C768 26000424 */   addiu     $a0, $zero, 0x26
    /* 4C76C 8005C76C C9F6000C */  jal        ENG_random__Fl
    /* 4C770 8005C770 04000424 */   addiu     $a0, $zero, 0x4
    /* 4C774 8005C774 21904000 */  addu       $s2, $v0, $zero
    /* 4C778 8005C778 02004016 */  bnez       $s2, .L8005C784
    /* 4C77C 8005C77C FFFF1124 */   addiu     $s1, $zero, -0x1
    /* 4C780 8005C780 01001124 */  addiu      $s1, $zero, 0x1
  .L8005C784:
    /* 4C784 8005C784 01000224 */  addiu      $v0, $zero, 0x1
    /* 4C788 8005C788 02004216 */  bne        $s2, $v0, .L8005C794
    /* 4C78C 8005C78C FFFF1524 */   addiu     $s5, $zero, -0x1
    /* 4C790 8005C790 01001524 */  addiu      $s5, $zero, 0x1
  .L8005C794:
    /* 4C794 8005C794 02000224 */  addiu      $v0, $zero, 0x2
    /* 4C798 8005C798 02004216 */  bne        $s2, $v0, .L8005C7A4
    /* 4C79C 8005C79C FFFF1624 */   addiu     $s6, $zero, -0x1
    /* 4C7A0 8005C7A0 01001624 */  addiu      $s6, $zero, 0x1
  .L8005C7A4:
    /* 4C7A4 8005C7A4 03000224 */  addiu      $v0, $zero, 0x3
    /* 4C7A8 8005C7A8 02004216 */  bne        $s2, $v0, .L8005C7B4
    /* 4C7AC 8005C7AC FFFF1424 */   addiu     $s4, $zero, -0x1
    /* 4C7B0 8005C7B0 01001424 */  addiu      $s4, $zero, 0x1
  .L8005C7B4:
    /* 4C7B4 8005C7B4 0100703A */  xori       $s0, $s3, 0x1
    /* 4C7B8 8005C7B8 21200002 */  addu       $a0, $s0, $zero
    /* 4C7BC 8005C7BC 6897010C */  jal        ModifyPlrStr__Fii
    /* 4C7C0 8005C7C0 21282002 */   addu      $a1, $s1, $zero
    /* 4C7C4 8005C7C4 21200002 */  addu       $a0, $s0, $zero
    /* 4C7C8 8005C7C8 AF97010C */  jal        ModifyPlrMag__Fii
    /* 4C7CC 8005C7CC 2128A002 */   addu      $a1, $s5, $zero
    /* 4C7D0 8005C7D0 21200002 */  addu       $a0, $s0, $zero
    /* 4C7D4 8005C7D4 EA97010C */  jal        ModifyPlrDex__Fii
    /* 4C7D8 8005C7D8 2128C002 */   addu      $a1, $s6, $zero
    /* 4C7DC 8005C7DC 21200002 */  addu       $a0, $s0, $zero
    /* 4C7E0 8005C7E0 2398010C */  jal        ModifyPlrVit__Fii
    /* 4C7E4 8005C7E4 21288002 */   addu      $a1, $s4, $zero
    /* 4C7E8 8005C7E8 F396010C */  jal        CheckStats__Fi
    /* 4C7EC 8005C7EC 21200002 */   addu      $a0, $s0, $zero
  .L8005C7F0:
    /* 4C7F0 8005C7F0 21206002 */  addu       $a0, $s3, $zero
  .L8005C7F4:
    /* 4C7F4 8005C7F4 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 4C7F8 8005C7F8 01000524 */   addiu     $a1, $zero, 0x1
    /* 4C7FC 8005C7FC FF000224 */  addiu      $v0, $zero, 0xFF
    /* 4C800 8005C800 1280013C */  lui        $at, %hi(force_redraw)
    /* 4C804 8005C804 90B722AC */  sw         $v0, %lo(force_redraw)($at)
    /* 4C808 8005C808 21200000 */  addu       $a0, $zero, $zero
    /* 4C80C 8005C80C 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 4C810 8005C810 FFFF6632 */  andi       $a2, $s3, 0xFFFF
    /* 4C814 8005C814 183E010C */  jal        NetSendCmdParam2__FUcUcUsUs
    /* 4C818 8005C818 FFFFC733 */   andi      $a3, $fp, 0xFFFF
  .L8005C81C:
    /* 4C81C 8005C81C DC00BF8F */  lw         $ra, 0xDC($sp)
    /* 4C820 8005C820 D800BE8F */  lw         $fp, 0xD8($sp)
    /* 4C824 8005C824 D400B78F */  lw         $s7, 0xD4($sp)
    /* 4C828 8005C828 D000B68F */  lw         $s6, 0xD0($sp)
    /* 4C82C 8005C82C CC00B58F */  lw         $s5, 0xCC($sp)
    /* 4C830 8005C830 C800B48F */  lw         $s4, 0xC8($sp)
    /* 4C834 8005C834 C400B38F */  lw         $s3, 0xC4($sp)
    /* 4C838 8005C838 C000B28F */  lw         $s2, 0xC0($sp)
    /* 4C83C 8005C83C BC00B18F */  lw         $s1, 0xBC($sp)
    /* 4C840 8005C840 B800B08F */  lw         $s0, 0xB8($sp)
    /* 4C844 8005C844 E000BD27 */  addiu      $sp, $sp, 0xE0
    /* 4C848 8005C848 0800E003 */  jr         $ra
    /* 4C84C 8005C84C 00000000 */   nop
endlabel OperateShrine__Fiii
