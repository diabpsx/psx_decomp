.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StoreAutoPlace__Fv, 0x648

glabel StoreAutoPlace__Fv
    /* 5A408 8006A408 1280033C */  lui        $v1, %hi(myplr)
    /* 5A40C 8006A40C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5A410 8006A410 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 5A414 8006A414 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 5A418 8006A418 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5A41C 8006A41C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5A420 8006A420 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5A424 8006A424 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5A428 8006A428 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5A42C 8006A42C 40100300 */  sll        $v0, $v1, 1
    /* 5A430 8006A430 21104300 */  addu       $v0, $v0, $v1
    /* 5A434 8006A434 80100200 */  sll        $v0, $v0, 2
    /* 5A438 8006A438 21104300 */  addu       $v0, $v0, $v1
    /* 5A43C 8006A43C 00110200 */  sll        $v0, $v0, 4
    /* 5A440 8006A440 23104300 */  subu       $v0, $v0, $v1
    /* 5A444 8006A444 80100200 */  sll        $v0, $v0, 2
    /* 5A448 8006A448 21104300 */  addu       $v0, $v0, $v1
    /* 5A44C 8006A44C C0100200 */  sll        $v0, $v0, 3
    /* 5A450 8006A450 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 5A454 8006A454 21082200 */  addu       $at, $at, $v0
    /* 5A458 8006A458 94BE2490 */  lbu        $a0, %lo(plr + 0x195C)($at)
    /* 5A45C 8006A45C D1DD000C */  jal        SetICursor__Fi
    /* 5A460 8006A460 0C008424 */   addiu     $a0, $a0, 0xC
    /* 5A464 8006A464 01000224 */  addiu      $v0, $zero, 0x1
    /* 5A468 8006A468 1280123C */  lui        $s2, %hi(icursW28)
    /* 5A46C 8006A46C 48B7528E */  lw         $s2, %lo(icursW28)($s2)
    /* 5A470 8006A470 1280133C */  lui        $s3, %hi(icursH28)
    /* 5A474 8006A474 4CB7738E */  lw         $s3, %lo(icursH28)($s3)
    /* 5A478 8006A478 F2004216 */  bne        $s2, $v0, .L8006A844
    /* 5A47C 8006A47C 21200000 */   addu      $a0, $zero, $zero
    /* 5A480 8006A480 9F007216 */  bne        $s3, $s2, .L8006A700
    /* 5A484 8006A484 00000000 */   nop
    /* 5A488 8006A488 1280023C */  lui        $v0, %hi(myplr)
    /* 5A48C 8006A48C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5A490 8006A490 00000000 */  nop
    /* 5A494 8006A494 40180200 */  sll        $v1, $v0, 1
    /* 5A498 8006A498 21186200 */  addu       $v1, $v1, $v0
    /* 5A49C 8006A49C 80180300 */  sll        $v1, $v1, 2
    /* 5A4A0 8006A4A0 21186200 */  addu       $v1, $v1, $v0
    /* 5A4A4 8006A4A4 00190300 */  sll        $v1, $v1, 4
    /* 5A4A8 8006A4A8 23186200 */  subu       $v1, $v1, $v0
    /* 5A4AC 8006A4AC 80180300 */  sll        $v1, $v1, 2
    /* 5A4B0 8006A4B0 21186200 */  addu       $v1, $v1, $v0
    /* 5A4B4 8006A4B4 C0180300 */  sll        $v1, $v1, 3
    /* 5A4B8 8006A4B8 0E80013C */  lui        $at, %hi(plr + 0x1976)
    /* 5A4BC 8006A4BC 21082300 */  addu       $at, $at, $v1
    /* 5A4C0 8006A4C0 AEBE2280 */  lb         $v0, %lo(plr + 0x1976)($at)
    /* 5A4C4 8006A4C4 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 5A4C8 8006A4C8 21082300 */  addu       $at, $at, $v1
    /* 5A4CC 8006A4CC 76BE2584 */  lh         $a1, %lo(plr + 0x193E)($at)
    /* 5A4D0 8006A4D0 43004010 */  beqz       $v0, .L8006A5E0
    /* 5A4D4 8006A4D4 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A4D8 8006A4D8 0D80013C */  lui        $at, %hi(AllItemsUseable)
    /* 5A4DC 8006A4DC 21082500 */  addu       $at, $at, $a1
    /* 5A4E0 8006A4E0 401B2290 */  lbu        $v0, %lo(AllItemsUseable)($at)
    /* 5A4E4 8006A4E4 00000000 */  nop
    /* 5A4E8 8006A4E8 3C004010 */  beqz       $v0, .L8006A5DC
    /* 5A4EC 8006A4EC 0B000224 */   addiu     $v0, $zero, 0xB
    /* 5A4F0 8006A4F0 0E80013C */  lui        $at, %hi(plr + 0x193C)
    /* 5A4F4 8006A4F4 21082300 */  addu       $at, $at, $v1
    /* 5A4F8 8006A4F8 74BE2384 */  lh         $v1, %lo(plr + 0x193C)($at)
    /* 5A4FC 8006A4FC 00000000 */  nop
    /* 5A500 8006A500 37006210 */  beq        $v1, $v0, .L8006A5E0
    /* 5A504 8006A504 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A508 8006A508 21800000 */  addu       $s0, $zero, $zero
    /* 5A50C 8006A50C FFFF0C24 */  addiu      $t4, $zero, -0x1
    /* 5A510 8006A510 0E800A3C */  lui        $t2, %hi(plr + 0x15B0)
    /* 5A514 8006A514 E8BA4A25 */  addiu      $t2, $t2, %lo(plr + 0x15B0)
    /* 5A518 8006A518 60034B25 */  addiu      $t3, $t2, 0x360
    /* 5A51C 8006A51C 21480000 */  addu       $t1, $zero, $zero
  .L8006A520:
    /* 5A520 8006A520 1280033C */  lui        $v1, %hi(myplr)
    /* 5A524 8006A524 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5A528 8006A528 00000000 */  nop
    /* 5A52C 8006A52C 40100300 */  sll        $v0, $v1, 1
    /* 5A530 8006A530 21104300 */  addu       $v0, $v0, $v1
    /* 5A534 8006A534 80100200 */  sll        $v0, $v0, 2
    /* 5A538 8006A538 21104300 */  addu       $v0, $v0, $v1
    /* 5A53C 8006A53C 00110200 */  sll        $v0, $v0, 4
    /* 5A540 8006A540 23104300 */  subu       $v0, $v0, $v1
    /* 5A544 8006A544 80100200 */  sll        $v0, $v0, 2
    /* 5A548 8006A548 21104300 */  addu       $v0, $v0, $v1
    /* 5A54C 8006A54C C0180200 */  sll        $v1, $v0, 3
    /* 5A550 8006A550 21102301 */  addu       $v0, $t1, $v1
    /* 5A554 8006A554 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 5A558 8006A558 21082200 */  addu       $at, $at, $v0
    /* 5A55C 8006A55C 14BB2284 */  lh         $v0, %lo(plr + 0x15DC)($at)
    /* 5A560 8006A560 00000000 */  nop
    /* 5A564 8006A564 16004C14 */  bne        $v0, $t4, .L8006A5C0
    /* 5A568 8006A568 21106A00 */   addu      $v0, $v1, $t2
    /* 5A56C 8006A56C 21382201 */  addu       $a3, $t1, $v0
    /* 5A570 8006A570 21306B00 */  addu       $a2, $v1, $t3
    /* 5A574 8006A574 6000C824 */  addiu      $t0, $a2, 0x60
  .L8006A578:
    /* 5A578 8006A578 0000C28C */  lw         $v0, 0x0($a2)
    /* 5A57C 8006A57C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5A580 8006A580 0800C48C */  lw         $a0, 0x8($a2)
    /* 5A584 8006A584 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5A588 8006A588 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5A58C 8006A58C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5A590 8006A590 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5A594 8006A594 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 5A598 8006A598 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5A59C 8006A59C F6FFC814 */  bne        $a2, $t0, .L8006A578
    /* 5A5A0 8006A5A0 1000E724 */   addiu     $a3, $a3, 0x10
    /* 5A5A4 8006A5A4 0000C28C */  lw         $v0, 0x0($a2)
    /* 5A5A8 8006A5A8 0400C38C */  lw         $v1, 0x4($a2)
    /* 5A5AC 8006A5AC 0800C48C */  lw         $a0, 0x8($a2)
    /* 5A5B0 8006A5B0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 5A5B4 8006A5B4 0400E3AC */  sw         $v1, 0x4($a3)
    /* 5A5B8 8006A5B8 0800E4AC */  sw         $a0, 0x8($a3)
    /* 5A5BC 8006A5BC 01000424 */  addiu      $a0, $zero, 0x1
  .L8006A5C0:
    /* 5A5C0 8006A5C0 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A5C4 8006A5C4 0800022A */  slti       $v0, $s0, 0x8
    /* 5A5C8 8006A5C8 04004010 */  beqz       $v0, .L8006A5DC
    /* 5A5CC 8006A5CC 6C002925 */   addiu     $t1, $t1, 0x6C
    /* 5A5D0 8006A5D0 FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A5D4 8006A5D4 D2FF4010 */  beqz       $v0, .L8006A520
    /* 5A5D8 8006A5D8 00000000 */   nop
  .L8006A5DC:
    /* 5A5DC 8006A5DC FF008230 */  andi       $v0, $a0, 0xFF
  .L8006A5E0:
    /* 5A5E0 8006A5E0 10004014 */  bnez       $v0, .L8006A624
    /* 5A5E4 8006A5E4 1E001024 */   addiu     $s0, $zero, 0x1E
    /* 5A5E8 8006A5E8 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A5EC 8006A5EC 21280002 */  addu       $a1, $s0, $zero
  .L8006A5F0:
    /* 5A5F0 8006A5F0 21304002 */  addu       $a2, $s2, $zero
    /* 5A5F4 8006A5F4 21386002 */  addu       $a3, $s3, $zero
    /* 5A5F8 8006A5F8 1280043C */  lui        $a0, %hi(myplr)
    /* 5A5FC 8006A5FC 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A600 8006A600 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A604 8006A604 C967050C */  jal        func_80159F24
    /* 5A608 8006A608 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A60C 8006A60C 21204000 */  addu       $a0, $v0, $zero
    /* 5A610 8006A610 2800022A */  slti       $v0, $s0, 0x28
    /* 5A614 8006A614 03004010 */  beqz       $v0, .L8006A624
    /* 5A618 8006A618 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A61C 8006A61C F4FF4010 */  beqz       $v0, .L8006A5F0
    /* 5A620 8006A620 21280002 */   addu      $a1, $s0, $zero
  .L8006A624:
    /* 5A624 8006A624 FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A628 8006A628 11004014 */  bnez       $v0, .L8006A670
    /* 5A62C 8006A62C 14001024 */   addiu     $s0, $zero, 0x14
    /* 5A630 8006A630 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A634 8006A634 21280002 */  addu       $a1, $s0, $zero
  .L8006A638:
    /* 5A638 8006A638 21304002 */  addu       $a2, $s2, $zero
    /* 5A63C 8006A63C 21386002 */  addu       $a3, $s3, $zero
    /* 5A640 8006A640 1280043C */  lui        $a0, %hi(myplr)
    /* 5A644 8006A644 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A648 8006A648 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A64C 8006A64C C967050C */  jal        func_80159F24
    /* 5A650 8006A650 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A654 8006A654 21204000 */  addu       $a0, $v0, $zero
    /* 5A658 8006A658 1E00022A */  slti       $v0, $s0, 0x1E
    /* 5A65C 8006A65C 03004010 */  beqz       $v0, .L8006A66C
    /* 5A660 8006A660 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A664 8006A664 F4FF4010 */  beqz       $v0, .L8006A638
    /* 5A668 8006A668 21280002 */   addu      $a1, $s0, $zero
  .L8006A66C:
    /* 5A66C 8006A66C FF008230 */  andi       $v0, $a0, 0xFF
  .L8006A670:
    /* 5A670 8006A670 10004014 */  bnez       $v0, .L8006A6B4
    /* 5A674 8006A674 0A001024 */   addiu     $s0, $zero, 0xA
    /* 5A678 8006A678 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A67C 8006A67C 21280002 */  addu       $a1, $s0, $zero
  .L8006A680:
    /* 5A680 8006A680 21304002 */  addu       $a2, $s2, $zero
    /* 5A684 8006A684 21386002 */  addu       $a3, $s3, $zero
    /* 5A688 8006A688 1280043C */  lui        $a0, %hi(myplr)
    /* 5A68C 8006A68C 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A690 8006A690 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A694 8006A694 C967050C */  jal        func_80159F24
    /* 5A698 8006A698 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A69C 8006A69C 21204000 */  addu       $a0, $v0, $zero
    /* 5A6A0 8006A6A0 1400022A */  slti       $v0, $s0, 0x14
    /* 5A6A4 8006A6A4 03004010 */  beqz       $v0, .L8006A6B4
    /* 5A6A8 8006A6A8 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A6AC 8006A6AC F4FF4010 */  beqz       $v0, .L8006A680
    /* 5A6B0 8006A6B0 21280002 */   addu      $a1, $s0, $zero
  .L8006A6B4:
    /* 5A6B4 8006A6B4 FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A6B8 8006A6B8 10004014 */  bnez       $v0, .L8006A6FC
    /* 5A6BC 8006A6BC 21800000 */   addu      $s0, $zero, $zero
    /* 5A6C0 8006A6C0 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A6C4 8006A6C4 21280002 */  addu       $a1, $s0, $zero
  .L8006A6C8:
    /* 5A6C8 8006A6C8 21304002 */  addu       $a2, $s2, $zero
    /* 5A6CC 8006A6CC 21386002 */  addu       $a3, $s3, $zero
    /* 5A6D0 8006A6D0 1280043C */  lui        $a0, %hi(myplr)
    /* 5A6D4 8006A6D4 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A6D8 8006A6D8 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A6DC 8006A6DC C967050C */  jal        func_80159F24
    /* 5A6E0 8006A6E0 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A6E4 8006A6E4 21204000 */  addu       $a0, $v0, $zero
    /* 5A6E8 8006A6E8 0A00022A */  slti       $v0, $s0, 0xA
    /* 5A6EC 8006A6EC 03004010 */  beqz       $v0, .L8006A6FC
    /* 5A6F0 8006A6F0 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A6F4 8006A6F4 F4FF4010 */  beqz       $v0, .L8006A6C8
    /* 5A6F8 8006A6F8 21280002 */   addu      $a1, $s0, $zero
  .L8006A6FC:
    /* 5A6FC 8006A6FC 01000224 */  addiu      $v0, $zero, 0x1
  .L8006A700:
    /* 5A700 8006A700 51004216 */  bne        $s2, $v0, .L8006A848
    /* 5A704 8006A704 02000224 */   addiu     $v0, $zero, 0x2
    /* 5A708 8006A708 37006216 */  bne        $s3, $v0, .L8006A7E8
    /* 5A70C 8006A70C 01000224 */   addiu     $v0, $zero, 0x1
    /* 5A710 8006A710 FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A714 8006A714 11004014 */  bnez       $v0, .L8006A75C
    /* 5A718 8006A718 1D001024 */   addiu     $s0, $zero, 0x1D
    /* 5A71C 8006A71C 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A720 8006A720 21280002 */  addu       $a1, $s0, $zero
  .L8006A724:
    /* 5A724 8006A724 21304002 */  addu       $a2, $s2, $zero
    /* 5A728 8006A728 21386002 */  addu       $a3, $s3, $zero
    /* 5A72C 8006A72C 1280043C */  lui        $a0, %hi(myplr)
    /* 5A730 8006A730 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A734 8006A734 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 5A738 8006A738 C967050C */  jal        func_80159F24
    /* 5A73C 8006A73C 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A740 8006A740 21204000 */  addu       $a0, $v0, $zero
    /* 5A744 8006A744 1400022A */  slti       $v0, $s0, 0x14
    /* 5A748 8006A748 03004014 */  bnez       $v0, .L8006A758
    /* 5A74C 8006A74C FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A750 8006A750 F4FF4010 */  beqz       $v0, .L8006A724
    /* 5A754 8006A754 21280002 */   addu      $a1, $s0, $zero
  .L8006A758:
    /* 5A758 8006A758 FF008230 */  andi       $v0, $a0, 0xFF
  .L8006A75C:
    /* 5A75C 8006A75C 0F004014 */  bnez       $v0, .L8006A79C
    /* 5A760 8006A760 09001024 */   addiu     $s0, $zero, 0x9
    /* 5A764 8006A764 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A768 8006A768 21280002 */  addu       $a1, $s0, $zero
  .L8006A76C:
    /* 5A76C 8006A76C 21304002 */  addu       $a2, $s2, $zero
    /* 5A770 8006A770 21386002 */  addu       $a3, $s3, $zero
    /* 5A774 8006A774 1280043C */  lui        $a0, %hi(myplr)
    /* 5A778 8006A778 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A77C 8006A77C FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 5A780 8006A780 C967050C */  jal        func_80159F24
    /* 5A784 8006A784 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A788 8006A788 04000006 */  bltz       $s0, .L8006A79C
    /* 5A78C 8006A78C 21204000 */   addu      $a0, $v0, $zero
    /* 5A790 8006A790 FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A794 8006A794 F5FF4010 */  beqz       $v0, .L8006A76C
    /* 5A798 8006A798 21280002 */   addu      $a1, $s0, $zero
  .L8006A79C:
    /* 5A79C 8006A79C FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A7A0 8006A7A0 10004014 */  bnez       $v0, .L8006A7E4
    /* 5A7A4 8006A7A4 13001024 */   addiu     $s0, $zero, 0x13
    /* 5A7A8 8006A7A8 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A7AC 8006A7AC 21280002 */  addu       $a1, $s0, $zero
  .L8006A7B0:
    /* 5A7B0 8006A7B0 21304002 */  addu       $a2, $s2, $zero
    /* 5A7B4 8006A7B4 21386002 */  addu       $a3, $s3, $zero
    /* 5A7B8 8006A7B8 1280043C */  lui        $a0, %hi(myplr)
    /* 5A7BC 8006A7BC 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A7C0 8006A7C0 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 5A7C4 8006A7C4 C967050C */  jal        func_80159F24
    /* 5A7C8 8006A7C8 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A7CC 8006A7CC 21204000 */  addu       $a0, $v0, $zero
    /* 5A7D0 8006A7D0 0A00022A */  slti       $v0, $s0, 0xA
    /* 5A7D4 8006A7D4 03004014 */  bnez       $v0, .L8006A7E4
    /* 5A7D8 8006A7D8 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A7DC 8006A7DC F4FF4010 */  beqz       $v0, .L8006A7B0
    /* 5A7E0 8006A7E0 21280002 */   addu      $a1, $s0, $zero
  .L8006A7E4:
    /* 5A7E4 8006A7E4 01000224 */  addiu      $v0, $zero, 0x1
  .L8006A7E8:
    /* 5A7E8 8006A7E8 17004216 */  bne        $s2, $v0, .L8006A848
    /* 5A7EC 8006A7EC 02000224 */   addiu     $v0, $zero, 0x2
    /* 5A7F0 8006A7F0 03000224 */  addiu      $v0, $zero, 0x3
    /* 5A7F4 8006A7F4 14006216 */  bne        $s3, $v0, .L8006A848
    /* 5A7F8 8006A7F8 02000224 */   addiu     $v0, $zero, 0x2
    /* 5A7FC 8006A7FC FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A800 8006A800 10004014 */  bnez       $v0, .L8006A844
    /* 5A804 8006A804 21800000 */   addu      $s0, $zero, $zero
    /* 5A808 8006A808 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A80C 8006A80C 21280002 */  addu       $a1, $s0, $zero
  .L8006A810:
    /* 5A810 8006A810 21304002 */  addu       $a2, $s2, $zero
    /* 5A814 8006A814 21386002 */  addu       $a3, $s3, $zero
    /* 5A818 8006A818 1280043C */  lui        $a0, %hi(myplr)
    /* 5A81C 8006A81C 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A820 8006A820 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A824 8006A824 C967050C */  jal        func_80159F24
    /* 5A828 8006A828 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A82C 8006A82C 21204000 */  addu       $a0, $v0, $zero
    /* 5A830 8006A830 1400022A */  slti       $v0, $s0, 0x14
    /* 5A834 8006A834 03004010 */  beqz       $v0, .L8006A844
    /* 5A838 8006A838 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A83C 8006A83C F4FF4010 */  beqz       $v0, .L8006A810
    /* 5A840 8006A840 21280002 */   addu      $a1, $s0, $zero
  .L8006A844:
    /* 5A844 8006A844 02000224 */  addiu      $v0, $zero, 0x2
  .L8006A848:
    /* 5A848 8006A848 77004216 */  bne        $s2, $v0, .L8006AA28
    /* 5A84C 8006A84C 00000000 */   nop
    /* 5A850 8006A850 4D007216 */  bne        $s3, $s2, .L8006A988
    /* 5A854 8006A854 02000224 */   addiu     $v0, $zero, 0x2
    /* 5A858 8006A858 FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A85C 8006A85C 14004014 */  bnez       $v0, .L8006A8B0
    /* 5A860 8006A860 21800000 */   addu      $s0, $zero, $zero
    /* 5A864 8006A864 01001424 */  addiu      $s4, $zero, 0x1
    /* 5A868 8006A868 1180113C */  lui        $s1, %hi(AP2x2Tbl)
    /* 5A86C 8006A86C 08D03126 */  addiu      $s1, $s1, %lo(AP2x2Tbl)
    /* 5A870 8006A870 21304002 */  addu       $a2, $s2, $zero
  .L8006A874:
    /* 5A874 8006A874 21386002 */  addu       $a3, $s3, $zero
    /* 5A878 8006A878 1000B4AF */  sw         $s4, 0x10($sp)
    /* 5A87C 8006A87C 0000258E */  lw         $a1, 0x0($s1)
    /* 5A880 8006A880 04003126 */  addiu      $s1, $s1, 0x4
    /* 5A884 8006A884 1280043C */  lui        $a0, %hi(myplr)
    /* 5A888 8006A888 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A88C 8006A88C C967050C */  jal        func_80159F24
    /* 5A890 8006A890 01001026 */   addiu     $s0, $s0, 0x1
    /* 5A894 8006A894 21204000 */  addu       $a0, $v0, $zero
    /* 5A898 8006A898 0A00022A */  slti       $v0, $s0, 0xA
    /* 5A89C 8006A89C 03004010 */  beqz       $v0, .L8006A8AC
    /* 5A8A0 8006A8A0 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A8A4 8006A8A4 F3FF4010 */  beqz       $v0, .L8006A874
    /* 5A8A8 8006A8A8 21304002 */   addu      $a2, $s2, $zero
  .L8006A8AC:
    /* 5A8AC 8006A8AC FF008230 */  andi       $v0, $a0, 0xFF
  .L8006A8B0:
    /* 5A8B0 8006A8B0 10004014 */  bnez       $v0, .L8006A8F4
    /* 5A8B4 8006A8B4 15001024 */   addiu     $s0, $zero, 0x15
    /* 5A8B8 8006A8B8 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A8BC 8006A8BC 21280002 */  addu       $a1, $s0, $zero
  .L8006A8C0:
    /* 5A8C0 8006A8C0 21304002 */  addu       $a2, $s2, $zero
    /* 5A8C4 8006A8C4 21386002 */  addu       $a3, $s3, $zero
    /* 5A8C8 8006A8C8 1280043C */  lui        $a0, %hi(myplr)
    /* 5A8CC 8006A8CC 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A8D0 8006A8D0 02001026 */  addiu      $s0, $s0, 0x2
    /* 5A8D4 8006A8D4 C967050C */  jal        func_80159F24
    /* 5A8D8 8006A8D8 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A8DC 8006A8DC 21204000 */  addu       $a0, $v0, $zero
    /* 5A8E0 8006A8E0 1D00022A */  slti       $v0, $s0, 0x1D
    /* 5A8E4 8006A8E4 03004010 */  beqz       $v0, .L8006A8F4
    /* 5A8E8 8006A8E8 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A8EC 8006A8EC F4FF4010 */  beqz       $v0, .L8006A8C0
    /* 5A8F0 8006A8F0 21280002 */   addu      $a1, $s0, $zero
  .L8006A8F4:
    /* 5A8F4 8006A8F4 FF008230 */  andi       $v0, $a0, 0xFF
    /* 5A8F8 8006A8F8 11004014 */  bnez       $v0, .L8006A940
    /* 5A8FC 8006A8FC 01001024 */   addiu     $s0, $zero, 0x1
    /* 5A900 8006A900 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A904 8006A904 21280002 */  addu       $a1, $s0, $zero
  .L8006A908:
    /* 5A908 8006A908 21304002 */  addu       $a2, $s2, $zero
    /* 5A90C 8006A90C 21386002 */  addu       $a3, $s3, $zero
    /* 5A910 8006A910 1280043C */  lui        $a0, %hi(myplr)
    /* 5A914 8006A914 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A918 8006A918 02001026 */  addiu      $s0, $s0, 0x2
    /* 5A91C 8006A91C C967050C */  jal        func_80159F24
    /* 5A920 8006A920 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A924 8006A924 21204000 */  addu       $a0, $v0, $zero
    /* 5A928 8006A928 0900022A */  slti       $v0, $s0, 0x9
    /* 5A92C 8006A92C 03004010 */  beqz       $v0, .L8006A93C
    /* 5A930 8006A930 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A934 8006A934 F4FF4010 */  beqz       $v0, .L8006A908
    /* 5A938 8006A938 21280002 */   addu      $a1, $s0, $zero
  .L8006A93C:
    /* 5A93C 8006A93C FF008230 */  andi       $v0, $a0, 0xFF
  .L8006A940:
    /* 5A940 8006A940 10004014 */  bnez       $v0, .L8006A984
    /* 5A944 8006A944 0A001024 */   addiu     $s0, $zero, 0xA
    /* 5A948 8006A948 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A94C 8006A94C 21280002 */  addu       $a1, $s0, $zero
  .L8006A950:
    /* 5A950 8006A950 21304002 */  addu       $a2, $s2, $zero
    /* 5A954 8006A954 21386002 */  addu       $a3, $s3, $zero
    /* 5A958 8006A958 1280043C */  lui        $a0, %hi(myplr)
    /* 5A95C 8006A95C 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A960 8006A960 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A964 8006A964 C967050C */  jal        func_80159F24
    /* 5A968 8006A968 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A96C 8006A96C 21204000 */  addu       $a0, $v0, $zero
    /* 5A970 8006A970 1300022A */  slti       $v0, $s0, 0x13
    /* 5A974 8006A974 03004010 */  beqz       $v0, .L8006A984
    /* 5A978 8006A978 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A97C 8006A97C F4FF4010 */  beqz       $v0, .L8006A950
    /* 5A980 8006A980 21280002 */   addu      $a1, $s0, $zero
  .L8006A984:
    /* 5A984 8006A984 02000224 */  addiu      $v0, $zero, 0x2
  .L8006A988:
    /* 5A988 8006A988 28004216 */  bne        $s2, $v0, .L8006AA2C
    /* 5A98C 8006A98C FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A990 8006A990 03000224 */  addiu      $v0, $zero, 0x3
    /* 5A994 8006A994 25006216 */  bne        $s3, $v0, .L8006AA2C
    /* 5A998 8006A998 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A99C 8006A99C 11004014 */  bnez       $v0, .L8006A9E4
    /* 5A9A0 8006A9A0 21800000 */   addu      $s0, $zero, $zero
    /* 5A9A4 8006A9A4 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A9A8 8006A9A8 21280002 */  addu       $a1, $s0, $zero
  .L8006A9AC:
    /* 5A9AC 8006A9AC 21304002 */  addu       $a2, $s2, $zero
    /* 5A9B0 8006A9B0 21386002 */  addu       $a3, $s3, $zero
    /* 5A9B4 8006A9B4 1280043C */  lui        $a0, %hi(myplr)
    /* 5A9B8 8006A9B8 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5A9BC 8006A9BC 01001026 */  addiu      $s0, $s0, 0x1
    /* 5A9C0 8006A9C0 C967050C */  jal        func_80159F24
    /* 5A9C4 8006A9C4 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5A9C8 8006A9C8 21204000 */  addu       $a0, $v0, $zero
    /* 5A9CC 8006A9CC 0900022A */  slti       $v0, $s0, 0x9
    /* 5A9D0 8006A9D0 03004010 */  beqz       $v0, .L8006A9E0
    /* 5A9D4 8006A9D4 FF008230 */   andi      $v0, $a0, 0xFF
    /* 5A9D8 8006A9D8 F4FF4010 */  beqz       $v0, .L8006A9AC
    /* 5A9DC 8006A9DC 21280002 */   addu      $a1, $s0, $zero
  .L8006A9E0:
    /* 5A9E0 8006A9E0 FF008230 */  andi       $v0, $a0, 0xFF
  .L8006A9E4:
    /* 5A9E4 8006A9E4 10004014 */  bnez       $v0, .L8006AA28
    /* 5A9E8 8006A9E8 0A001024 */   addiu     $s0, $zero, 0xA
    /* 5A9EC 8006A9EC 01001124 */  addiu      $s1, $zero, 0x1
    /* 5A9F0 8006A9F0 21280002 */  addu       $a1, $s0, $zero
  .L8006A9F4:
    /* 5A9F4 8006A9F4 21304002 */  addu       $a2, $s2, $zero
    /* 5A9F8 8006A9F8 21386002 */  addu       $a3, $s3, $zero
    /* 5A9FC 8006A9FC 1280043C */  lui        $a0, %hi(myplr)
    /* 5AA00 8006AA00 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 5AA04 8006AA04 01001026 */  addiu      $s0, $s0, 0x1
    /* 5AA08 8006AA08 C967050C */  jal        func_80159F24
    /* 5AA0C 8006AA0C 1000B1AF */   sw        $s1, 0x10($sp)
    /* 5AA10 8006AA10 21204000 */  addu       $a0, $v0, $zero
    /* 5AA14 8006AA14 1300022A */  slti       $v0, $s0, 0x13
    /* 5AA18 8006AA18 03004010 */  beqz       $v0, .L8006AA28
    /* 5AA1C 8006AA1C FF008230 */   andi      $v0, $a0, 0xFF
    /* 5AA20 8006AA20 F4FF4010 */  beqz       $v0, .L8006A9F4
    /* 5AA24 8006AA24 21280002 */   addu      $a1, $s0, $zero
  .L8006AA28:
    /* 5AA28 8006AA28 FF008230 */  andi       $v0, $a0, 0xFF
  .L8006AA2C:
    /* 5AA2C 8006AA2C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 5AA30 8006AA30 2800B48F */  lw         $s4, 0x28($sp)
    /* 5AA34 8006AA34 2400B38F */  lw         $s3, 0x24($sp)
    /* 5AA38 8006AA38 2000B28F */  lw         $s2, 0x20($sp)
    /* 5AA3C 8006AA3C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5AA40 8006AA40 1800B08F */  lw         $s0, 0x18($sp)
    /* 5AA44 8006AA44 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 5AA48 8006AA48 0800E003 */  jr         $ra
    /* 5AA4C 8006AA4C 00000000 */   nop
endlabel StoreAutoPlace__Fv
