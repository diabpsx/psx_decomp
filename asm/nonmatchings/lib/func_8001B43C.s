.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001B43C, 0x55C

glabel func_8001B43C
    /* B43C 8001B43C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* B440 8001B440 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* B444 8001B444 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* B448 8001B448 01000224 */  addiu      $v0, $zero, 0x1
    /* B44C 8001B44C 2800BFAF */  sw         $ra, 0x28($sp)
    /* B450 8001B450 2400B1AF */  sw         $s1, 0x24($sp)
    /* B454 8001B454 2000B0AF */  sw         $s0, 0x20($sp)
    /* B458 8001B458 000062A0 */  sb         $v0, 0x0($v1)
    /* B45C 8001B45C 0B80043C */  lui        $a0, %hi(D_800B61C8)
    /* B460 8001B460 C861848C */  lw         $a0, %lo(D_800B61C8)($a0)
    /* B464 8001B464 00000000 */  nop
    /* B468 8001B468 00008290 */  lbu        $v0, 0x0($a0)
    /* B46C 8001B46C 00000000 */  nop
    /* B470 8001B470 07004230 */  andi       $v0, $v0, 0x7
    /* B474 8001B474 1000A2A3 */  sb         $v0, 0x10($sp)
    /* B478 8001B478 1000A293 */  lbu        $v0, 0x10($sp)
    /* B47C 8001B47C 00000000 */  nop
    /* B480 8001B480 3F014010 */  beqz       $v0, .L8001B980
    /* B484 8001B484 21880000 */   addu      $s1, $zero, $zero
    /* B488 8001B488 286D0008 */  j          .L8001B4A0
    /* B48C 8001B48C 00000000 */   nop
  .L8001B490:
    /* B490 8001B490 00008290 */  lbu        $v0, 0x0($a0)
    /* B494 8001B494 00000000 */  nop
    /* B498 8001B498 07004230 */  andi       $v0, $v0, 0x7
    /* B49C 8001B49C 1000A2A3 */  sb         $v0, 0x10($sp)
  .L8001B4A0:
    /* B4A0 8001B4A0 00008290 */  lbu        $v0, 0x0($a0)
    /* B4A4 8001B4A4 1000A393 */  lbu        $v1, 0x10($sp)
    /* B4A8 8001B4A8 07004230 */  andi       $v0, $v0, 0x7
    /* B4AC 8001B4AC F8FF6214 */  bne        $v1, $v0, .L8001B490
    /* B4B0 8001B4B0 21800000 */   addu      $s0, $zero, $zero
    /* B4B4 8001B4B4 1800A427 */  addiu      $a0, $sp, 0x18
  .L8001B4B8:
    /* B4B8 8001B4B8 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* B4BC 8001B4BC BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* B4C0 8001B4C0 00000000 */  nop
    /* B4C4 8001B4C4 00004290 */  lbu        $v0, 0x0($v0)
    /* B4C8 8001B4C8 00000000 */  nop
    /* B4CC 8001B4CC 20004230 */  andi       $v0, $v0, 0x20
    /* B4D0 8001B4D0 0A004010 */  beqz       $v0, .L8001B4FC
    /* B4D4 8001B4D4 21189000 */   addu      $v1, $a0, $s0
    /* B4D8 8001B4D8 0B80023C */  lui        $v0, %hi(D_800B61C0)
    /* B4DC 8001B4DC C061428C */  lw         $v0, %lo(D_800B61C0)($v0)
    /* B4E0 8001B4E0 00000000 */  nop
    /* B4E4 8001B4E4 00004290 */  lbu        $v0, 0x0($v0)
    /* B4E8 8001B4E8 01001026 */  addiu      $s0, $s0, 0x1
    /* B4EC 8001B4EC 000062A0 */  sb         $v0, 0x0($v1)
    /* B4F0 8001B4F0 0800022A */  slti       $v0, $s0, 0x8
    /* B4F4 8001B4F4 F0FF4014 */  bnez       $v0, .L8001B4B8
    /* B4F8 8001B4F8 00000000 */   nop
  .L8001B4FC:
    /* B4FC 8001B4FC 0800022A */  slti       $v0, $s0, 0x8
    /* B500 8001B500 08004010 */  beqz       $v0, .L8001B524
    /* B504 8001B504 21180002 */   addu      $v1, $s0, $zero
    /* B508 8001B508 1800A427 */  addiu      $a0, $sp, 0x18
    /* B50C 8001B50C 21108300 */  addu       $v0, $a0, $v1
  .L8001B510:
    /* B510 8001B510 000040A0 */  sb         $zero, 0x0($v0)
    /* B514 8001B514 01006324 */  addiu      $v1, $v1, 0x1
    /* B518 8001B518 08006228 */  slti       $v0, $v1, 0x8
    /* B51C 8001B51C FCFF4014 */  bnez       $v0, .L8001B510
    /* B520 8001B520 21108300 */   addu      $v0, $a0, $v1
  .L8001B524:
    /* B524 8001B524 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* B528 8001B528 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* B52C 8001B52C 01000224 */  addiu      $v0, $zero, 0x1
    /* B530 8001B530 000062A0 */  sb         $v0, 0x0($v1)
    /* B534 8001B534 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* B538 8001B538 C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* B53C 8001B53C 07000324 */  addiu      $v1, $zero, 0x7
    /* B540 8001B540 000043A0 */  sb         $v1, 0x0($v0)
    /* B544 8001B544 0B80023C */  lui        $v0, %hi(D_800B61C4)
    /* B548 8001B548 C461428C */  lw         $v0, %lo(D_800B61C4)($v0)
    /* B54C 8001B54C 00000000 */  nop
    /* B550 8001B550 000043A0 */  sb         $v1, 0x0($v0)
    /* B554 8001B554 1000A393 */  lbu        $v1, 0x10($sp)
    /* B558 8001B558 03000224 */  addiu      $v0, $zero, 0x3
    /* B55C 8001B55C 0B006214 */  bne        $v1, $v0, .L8001B58C
    /* B560 8001B560 00000000 */   nop
    /* B564 8001B564 0B80023C */  lui        $v0, %hi(CD_com)
    /* B568 8001B568 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* B56C 8001B56C 00000000 */  nop
    /* B570 8001B570 80100200 */  sll        $v0, $v0, 2
    /* B574 8001B574 0B80013C */  lui        $at, %hi(D_800B60BC)
    /* B578 8001B578 21082200 */  addu       $at, $at, $v0
    /* B57C 8001B57C BC60228C */  lw         $v0, %lo(D_800B60BC)($at)
    /* B580 8001B580 00000000 */  nop
    /* B584 8001B584 1A004010 */  beqz       $v0, .L8001B5F0
    /* B588 8001B588 00000000 */   nop
  .L8001B58C:
    /* B58C 8001B58C 0B80023C */  lui        $v0, %hi(CD_status)
    /* B590 8001B590 045F428C */  lw         $v0, %lo(CD_status)($v0)
    /* B594 8001B594 00000000 */  nop
    /* B598 8001B598 10004230 */  andi       $v0, $v0, 0x10
    /* B59C 8001B59C 0C004014 */  bnez       $v0, .L8001B5D0
    /* B5A0 8001B5A0 00000000 */   nop
    /* B5A4 8001B5A4 1800A293 */  lbu        $v0, 0x18($sp)
    /* B5A8 8001B5A8 00000000 */  nop
    /* B5AC 8001B5AC 10004230 */  andi       $v0, $v0, 0x10
    /* B5B0 8001B5B0 07004010 */  beqz       $v0, .L8001B5D0
    /* B5B4 8001B5B4 00000000 */   nop
    /* B5B8 8001B5B8 0B80023C */  lui        $v0, %hi(CD_nopen)
    /* B5BC 8001B5BC 0C5F428C */  lw         $v0, %lo(CD_nopen)($v0)
    /* B5C0 8001B5C0 00000000 */  nop
    /* B5C4 8001B5C4 01004224 */  addiu      $v0, $v0, 0x1
    /* B5C8 8001B5C8 0B80013C */  lui        $at, %hi(CD_nopen)
    /* B5CC 8001B5CC 0C5F22AC */  sw         $v0, %lo(CD_nopen)($at)
  .L8001B5D0:
    /* B5D0 8001B5D0 1800A293 */  lbu        $v0, 0x18($sp)
    /* B5D4 8001B5D4 1900A393 */  lbu        $v1, 0x19($sp)
    /* B5D8 8001B5D8 FF004230 */  andi       $v0, $v0, 0xFF
    /* B5DC 8001B5DC 1D005130 */  andi       $s1, $v0, 0x1D
    /* B5E0 8001B5E0 0B80013C */  lui        $at, %hi(CD_status)
    /* B5E4 8001B5E4 045F22AC */  sw         $v0, %lo(CD_status)($at)
    /* B5E8 8001B5E8 0B80013C */  lui        $at, %hi(CD_status1)
    /* B5EC 8001B5EC 085F23AC */  sw         $v1, %lo(CD_status1)($at)
  .L8001B5F0:
    /* B5F0 8001B5F0 1000A393 */  lbu        $v1, 0x10($sp)
    /* B5F4 8001B5F4 05000224 */  addiu      $v0, $zero, 0x5
    /* B5F8 8001B5F8 1B006214 */  bne        $v1, $v0, .L8001B668
    /* B5FC 8001B5FC 00000000 */   nop
    /* B600 8001B600 0B80023C */  lui        $v0, %hi(CD_debug)
    /* B604 8001B604 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* B608 8001B608 00000000 */  nop
    /* B60C 8001B60C 16004018 */  blez       $v0, .L8001B668
    /* B610 8001B610 00000000 */   nop
    /* B614 8001B614 1180043C */  lui        $a0, %hi(D_8010E3E0)
    /* B618 8001B618 9367000C */  jal        printf
    /* B61C 8001B61C E0E38424 */   addiu     $a0, $a0, %lo(D_8010E3E0)
    /* B620 8001B620 0B80023C */  lui        $v0, %hi(CD_debug)
    /* B624 8001B624 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* B628 8001B628 00000000 */  nop
    /* B62C 8001B62C 0E004018 */  blez       $v0, .L8001B668
    /* B630 8001B630 00000000 */   nop
    /* B634 8001B634 0B80023C */  lui        $v0, %hi(CD_com)
    /* B638 8001B638 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* B63C 8001B63C 0B80063C */  lui        $a2, %hi(CD_status)
    /* B640 8001B640 045FC68C */  lw         $a2, %lo(CD_status)($a2)
    /* B644 8001B644 0B80073C */  lui        $a3, %hi(CD_status1)
    /* B648 8001B648 085FE78C */  lw         $a3, %lo(CD_status1)($a3)
    /* B64C 8001B64C 80100200 */  sll        $v0, $v0, 2
    /* B650 8001B650 0B80053C */  lui        $a1, %hi(CD_comstr)
    /* B654 8001B654 2128A200 */  addu       $a1, $a1, $v0
    /* B658 8001B658 1C5FA58C */  lw         $a1, %lo(CD_comstr)($a1)
    /* B65C 8001B65C 1180043C */  lui        $a0, %hi(D_8010E3EC)
    /* B660 8001B660 9367000C */  jal        printf
    /* B664 8001B664 ECE38424 */   addiu     $a0, $a0, %lo(D_8010E3EC)
  .L8001B668:
    /* B668 8001B668 1000A293 */  lbu        $v0, 0x10($sp)
    /* B66C 8001B66C 00000000 */  nop
    /* B670 8001B670 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* B674 8001B674 0500622C */  sltiu      $v0, $v1, 0x5
    /* B678 8001B678 BA004010 */  beqz       $v0, .L8001B964
    /* B67C 8001B67C 80100300 */   sll       $v0, $v1, 2
    /* B680 8001B680 1180013C */  lui        $at, %hi(jtbl_8010E428)
    /* B684 8001B684 21082200 */  addu       $at, $at, $v0
    /* B688 8001B688 28E4228C */  lw         $v0, %lo(jtbl_8010E428)($at)
    /* B68C 8001B68C 00000000 */  nop
    /* B690 8001B690 08004000 */  jr         $v0
    /* B694 8001B694 00000000 */   nop
  jlabel .L8001B698
    /* B698 8001B698 12002012 */  beqz       $s1, .L8001B6E4
    /* B69C 8001B69C 05000224 */   addiu     $v0, $zero, 0x5
    /* B6A0 8001B6A0 0B80033C */  lui        $v1, %hi(D_800B61D4)
    /* B6A4 8001B6A4 D4616324 */  addiu      $v1, $v1, %lo(D_800B61D4)
    /* B6A8 8001B6A8 000062A0 */  sb         $v0, 0x0($v1)
    /* B6AC 8001B6AC 1380033C */  lui        $v1, %hi(D_80130140)
    /* B6B0 8001B6B0 40016324 */  addiu      $v1, $v1, %lo(D_80130140)
    /* B6B4 8001B6B4 49006010 */  beqz       $v1, .L8001B7DC
    /* B6B8 8001B6B8 1800A527 */   addiu     $a1, $sp, 0x18
    /* B6BC 8001B6BC 07000424 */  addiu      $a0, $zero, 0x7
    /* B6C0 8001B6C0 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B6C4:
    /* B6C4 8001B6C4 0000A290 */  lbu        $v0, 0x0($a1)
    /* B6C8 8001B6C8 0100A524 */  addiu      $a1, $a1, 0x1
    /* B6CC 8001B6CC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* B6D0 8001B6D0 000062A0 */  sb         $v0, 0x0($v1)
    /* B6D4 8001B6D4 FBFF8614 */  bne        $a0, $a2, .L8001B6C4
    /* B6D8 8001B6D8 01006324 */   addiu     $v1, $v1, 0x1
    /* B6DC 8001B6DC 616E0008 */  j          .L8001B984
    /* B6E0 8001B6E0 02000224 */   addiu     $v0, $zero, 0x2
  .L8001B6E4:
    /* B6E4 8001B6E4 0B80023C */  lui        $v0, %hi(CD_com)
    /* B6E8 8001B6E8 155F4290 */  lbu        $v0, %lo(CD_com)($v0)
    /* B6EC 8001B6EC 00000000 */  nop
    /* B6F0 8001B6F0 80100200 */  sll        $v0, $v0, 2
    /* B6F4 8001B6F4 0B80013C */  lui        $at, %hi(D_800B5FBC)
    /* B6F8 8001B6F8 21082200 */  addu       $at, $at, $v0
    /* B6FC 8001B6FC BC5F228C */  lw         $v0, %lo(D_800B5FBC)($at)
    /* B700 8001B700 00000000 */  nop
    /* B704 8001B704 12004010 */  beqz       $v0, .L8001B750
    /* B708 8001B708 03000224 */   addiu     $v0, $zero, 0x3
    /* B70C 8001B70C 0B80033C */  lui        $v1, %hi(D_800B61D4)
    /* B710 8001B710 D4616324 */  addiu      $v1, $v1, %lo(D_800B61D4)
    /* B714 8001B714 000062A0 */  sb         $v0, 0x0($v1)
    /* B718 8001B718 1380033C */  lui        $v1, %hi(D_80130140)
    /* B71C 8001B71C 40016324 */  addiu      $v1, $v1, %lo(D_80130140)
    /* B720 8001B720 09006010 */  beqz       $v1, .L8001B748
    /* B724 8001B724 1800A527 */   addiu     $a1, $sp, 0x18
    /* B728 8001B728 07000424 */  addiu      $a0, $zero, 0x7
    /* B72C 8001B72C FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B730:
    /* B730 8001B730 0000A290 */  lbu        $v0, 0x0($a1)
    /* B734 8001B734 0100A524 */  addiu      $a1, $a1, 0x1
    /* B738 8001B738 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* B73C 8001B73C 000062A0 */  sb         $v0, 0x0($v1)
    /* B740 8001B740 FBFF8614 */  bne        $a0, $a2, .L8001B730
    /* B744 8001B744 01006324 */   addiu     $v1, $v1, 0x1
  .L8001B748:
    /* B748 8001B748 616E0008 */  j          .L8001B984
    /* B74C 8001B74C 01000224 */   addiu     $v0, $zero, 0x1
  .L8001B750:
    /* B750 8001B750 0B80033C */  lui        $v1, %hi(D_800B61D4)
    /* B754 8001B754 D4616324 */  addiu      $v1, $v1, %lo(D_800B61D4)
    /* B758 8001B758 02000224 */  addiu      $v0, $zero, 0x2
    /* B75C 8001B75C 000062A0 */  sb         $v0, 0x0($v1)
    /* B760 8001B760 1380033C */  lui        $v1, %hi(D_80130140)
    /* B764 8001B764 40016324 */  addiu      $v1, $v1, %lo(D_80130140)
    /* B768 8001B768 1C006010 */  beqz       $v1, .L8001B7DC
    /* B76C 8001B76C 1800A527 */   addiu     $a1, $sp, 0x18
    /* B770 8001B770 07000424 */  addiu      $a0, $zero, 0x7
    /* B774 8001B774 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B778:
    /* B778 8001B778 0000A290 */  lbu        $v0, 0x0($a1)
    /* B77C 8001B77C 0100A524 */  addiu      $a1, $a1, 0x1
    /* B780 8001B780 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* B784 8001B784 000062A0 */  sb         $v0, 0x0($v1)
    /* B788 8001B788 FBFF8614 */  bne        $a0, $a2, .L8001B778
    /* B78C 8001B78C 01006324 */   addiu     $v1, $v1, 0x1
    /* B790 8001B790 616E0008 */  j          .L8001B984
    /* B794 8001B794 02000224 */   addiu     $v0, $zero, 0x2
  jlabel .L8001B798
    /* B798 8001B798 02002012 */  beqz       $s1, .L8001B7A4
    /* B79C 8001B79C 02000224 */   addiu     $v0, $zero, 0x2
    /* B7A0 8001B7A0 05000224 */  addiu      $v0, $zero, 0x5
  .L8001B7A4:
    /* B7A4 8001B7A4 0B80013C */  lui        $at, %hi(D_800B61D4)
    /* B7A8 8001B7A8 D46122A0 */  sb         $v0, %lo(D_800B61D4)($at)
    /* B7AC 8001B7AC 1380033C */  lui        $v1, %hi(D_80130140)
    /* B7B0 8001B7B0 40016324 */  addiu      $v1, $v1, %lo(D_80130140)
    /* B7B4 8001B7B4 09006010 */  beqz       $v1, .L8001B7DC
    /* B7B8 8001B7B8 1800A527 */   addiu     $a1, $sp, 0x18
    /* B7BC 8001B7BC 07000424 */  addiu      $a0, $zero, 0x7
    /* B7C0 8001B7C0 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B7C4:
    /* B7C4 8001B7C4 0000A290 */  lbu        $v0, 0x0($a1)
    /* B7C8 8001B7C8 0100A524 */  addiu      $a1, $a1, 0x1
    /* B7CC 8001B7CC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* B7D0 8001B7D0 000062A0 */  sb         $v0, 0x0($v1)
    /* B7D4 8001B7D4 FBFF8614 */  bne        $a0, $a2, .L8001B7C4
    /* B7D8 8001B7D8 01006324 */   addiu     $v1, $v1, 0x1
  .L8001B7DC:
    /* B7DC 8001B7DC 616E0008 */  j          .L8001B984
    /* B7E0 8001B7E0 02000224 */   addiu     $v0, $zero, 0x2
  jlabel .L8001B7E4
    /* B7E4 8001B7E4 04002012 */  beqz       $s1, .L8001B7F8
    /* B7E8 8001B7E8 01000224 */   addiu     $v0, $zero, 0x1
    /* B7EC 8001B7EC 02000216 */  bne        $s0, $v0, .L8001B7F8
    /* B7F0 8001B7F0 00000000 */   nop
    /* B7F4 8001B7F4 21880000 */  addu       $s1, $zero, $zero
  .L8001B7F8:
    /* B7F8 8001B7F8 02002012 */  beqz       $s1, .L8001B804
    /* B7FC 8001B7FC 01000324 */   addiu     $v1, $zero, 0x1
    /* B800 8001B800 05000324 */  addiu      $v1, $zero, 0x5
  .L8001B804:
    /* B804 8001B804 0B80023C */  lui        $v0, %hi(D_800B61D4)
    /* B808 8001B808 D4614224 */  addiu      $v0, $v0, %lo(D_800B61D4)
    /* B80C 8001B80C 010043A0 */  sb         $v1, 0x1($v0)
    /* B810 8001B810 1380033C */  lui        $v1, %hi(D_80130148)
    /* B814 8001B814 48016324 */  addiu      $v1, $v1, %lo(D_80130148)
    /* B818 8001B818 09006010 */  beqz       $v1, .L8001B840
    /* B81C 8001B81C 1800A527 */   addiu     $a1, $sp, 0x18
    /* B820 8001B820 07000424 */  addiu      $a0, $zero, 0x7
    /* B824 8001B824 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B828:
    /* B828 8001B828 0000A290 */  lbu        $v0, 0x0($a1)
    /* B82C 8001B82C 0100A524 */  addiu      $a1, $a1, 0x1
    /* B830 8001B830 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* B834 8001B834 000062A0 */  sb         $v0, 0x0($v1)
    /* B838 8001B838 FBFF8614 */  bne        $a0, $a2, .L8001B828
    /* B83C 8001B83C 01006324 */   addiu     $v1, $v1, 0x1
  .L8001B840:
    /* B840 8001B840 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* B844 8001B844 BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* B848 8001B848 00000000 */  nop
    /* B84C 8001B84C 000040A0 */  sb         $zero, 0x0($v0)
    /* B850 8001B850 0B80033C */  lui        $v1, %hi(D_800B61C8)
    /* B854 8001B854 C861638C */  lw         $v1, %lo(D_800B61C8)($v1)
    /* B858 8001B858 04000224 */  addiu      $v0, $zero, 0x4
    /* B85C 8001B85C 616E0008 */  j          .L8001B984
    /* B860 8001B860 000060A0 */   sb        $zero, 0x0($v1)
  jlabel .L8001B864
    /* B864 8001B864 1380043C */  lui        $a0, %hi(D_80130150)
    /* B868 8001B868 50018424 */  addiu      $a0, $a0, %lo(D_80130150)
    /* B86C 8001B86C 0B80023C */  lui        $v0, %hi(D_800B61D4)
    /* B870 8001B870 D4614224 */  addiu      $v0, $v0, %lo(D_800B61D4)
    /* B874 8001B874 04000324 */  addiu      $v1, $zero, 0x4
    /* B878 8001B878 020043A0 */  sb         $v1, 0x2($v0)
    /* B87C 8001B87C 02004390 */  lbu        $v1, 0x2($v0)
    /* B880 8001B880 1800A527 */  addiu      $a1, $sp, 0x18
    /* B884 8001B884 010043A0 */  sb         $v1, 0x1($v0)
    /* B888 8001B888 08008010 */  beqz       $a0, .L8001B8AC
    /* B88C 8001B88C 07000324 */   addiu     $v1, $zero, 0x7
    /* B890 8001B890 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B894:
    /* B894 8001B894 0000A290 */  lbu        $v0, 0x0($a1)
    /* B898 8001B898 0100A524 */  addiu      $a1, $a1, 0x1
    /* B89C 8001B89C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* B8A0 8001B8A0 000082A0 */  sb         $v0, 0x0($a0)
    /* B8A4 8001B8A4 FBFF6614 */  bne        $v1, $a2, .L8001B894
    /* B8A8 8001B8A8 01008424 */   addiu     $a0, $a0, 0x1
  .L8001B8AC:
    /* B8AC 8001B8AC 1380033C */  lui        $v1, %hi(D_80130148)
    /* B8B0 8001B8B0 48016324 */  addiu      $v1, $v1, %lo(D_80130148)
    /* B8B4 8001B8B4 09006010 */  beqz       $v1, .L8001B8DC
    /* B8B8 8001B8B8 1800A527 */   addiu     $a1, $sp, 0x18
    /* B8BC 8001B8BC 07000424 */  addiu      $a0, $zero, 0x7
    /* B8C0 8001B8C0 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B8C4:
    /* B8C4 8001B8C4 0000A290 */  lbu        $v0, 0x0($a1)
    /* B8C8 8001B8C8 0100A524 */  addiu      $a1, $a1, 0x1
    /* B8CC 8001B8CC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* B8D0 8001B8D0 000062A0 */  sb         $v0, 0x0($v1)
    /* B8D4 8001B8D4 FBFF8614 */  bne        $a0, $a2, .L8001B8C4
    /* B8D8 8001B8D8 01006324 */   addiu     $v1, $v1, 0x1
  .L8001B8DC:
    /* B8DC 8001B8DC 616E0008 */  j          .L8001B984
    /* B8E0 8001B8E0 04000224 */   addiu     $v0, $zero, 0x4
  jlabel .L8001B8E4
    /* B8E4 8001B8E4 1380043C */  lui        $a0, %hi(D_80130140)
    /* B8E8 8001B8E8 40018424 */  addiu      $a0, $a0, %lo(D_80130140)
    /* B8EC 8001B8EC 0B80023C */  lui        $v0, %hi(D_800B61D4)
    /* B8F0 8001B8F0 D4614224 */  addiu      $v0, $v0, %lo(D_800B61D4)
    /* B8F4 8001B8F4 05000324 */  addiu      $v1, $zero, 0x5
    /* B8F8 8001B8F8 010043A0 */  sb         $v1, 0x1($v0)
    /* B8FC 8001B8FC 01004390 */  lbu        $v1, 0x1($v0)
    /* B900 8001B900 1800A527 */  addiu      $a1, $sp, 0x18
    /* B904 8001B904 000043A0 */  sb         $v1, 0x0($v0)
    /* B908 8001B908 08008010 */  beqz       $a0, .L8001B92C
    /* B90C 8001B90C 07000324 */   addiu     $v1, $zero, 0x7
    /* B910 8001B910 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B914:
    /* B914 8001B914 0000A290 */  lbu        $v0, 0x0($a1)
    /* B918 8001B918 0100A524 */  addiu      $a1, $a1, 0x1
    /* B91C 8001B91C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* B920 8001B920 000082A0 */  sb         $v0, 0x0($a0)
    /* B924 8001B924 FBFF6614 */  bne        $v1, $a2, .L8001B914
    /* B928 8001B928 01008424 */   addiu     $a0, $a0, 0x1
  .L8001B92C:
    /* B92C 8001B92C 1380033C */  lui        $v1, %hi(D_80130148)
    /* B930 8001B930 48016324 */  addiu      $v1, $v1, %lo(D_80130148)
    /* B934 8001B934 09006010 */  beqz       $v1, .L8001B95C
    /* B938 8001B938 1800A527 */   addiu     $a1, $sp, 0x18
    /* B93C 8001B93C 07000424 */  addiu      $a0, $zero, 0x7
    /* B940 8001B940 FFFF0624 */  addiu      $a2, $zero, -0x1
  .L8001B944:
    /* B944 8001B944 0000A290 */  lbu        $v0, 0x0($a1)
    /* B948 8001B948 0100A524 */  addiu      $a1, $a1, 0x1
    /* B94C 8001B94C FFFF8424 */  addiu      $a0, $a0, -0x1
    /* B950 8001B950 000062A0 */  sb         $v0, 0x0($v1)
    /* B954 8001B954 FBFF8614 */  bne        $a0, $a2, .L8001B944
    /* B958 8001B958 01006324 */   addiu     $v1, $v1, 0x1
  .L8001B95C:
    /* B95C 8001B95C 616E0008 */  j          .L8001B984
    /* B960 8001B960 06000224 */   addiu     $v0, $zero, 0x6
  .L8001B964:
    /* B964 8001B964 1180043C */  lui        $a0, %hi(D_8010E408)
    /* B968 8001B968 7567000C */  jal        puts
    /* B96C 8001B96C 08E48424 */   addiu     $a0, $a0, %lo(D_8010E408)
    /* B970 8001B970 1000A593 */  lbu        $a1, 0x10($sp)
    /* B974 8001B974 1180043C */  lui        $a0, %hi(D_8010E41C)
    /* B978 8001B978 9367000C */  jal        printf
    /* B97C 8001B97C 1CE48424 */   addiu     $a0, $a0, %lo(D_8010E41C)
  .L8001B980:
    /* B980 8001B980 21100000 */  addu       $v0, $zero, $zero
  .L8001B984:
    /* B984 8001B984 2800BF8F */  lw         $ra, 0x28($sp)
    /* B988 8001B988 2400B18F */  lw         $s1, 0x24($sp)
    /* B98C 8001B98C 2000B08F */  lw         $s0, 0x20($sp)
    /* B990 8001B990 0800E003 */  jr         $ra
    /* B994 8001B994 3000BD27 */   addiu     $sp, $sp, 0x30
endlabel func_8001B43C
