.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnBoy__Fi, 0x304

glabel SpawnBoy__Fi
    /* 3B3FC 8004B3FC 60FFBD27 */  addiu      $sp, $sp, -0xA0
    /* 3B400 8004B400 8C00B1AF */  sw         $s1, 0x8C($sp)
    /* 3B404 8004B404 21888000 */  addu       $s1, $a0, $zero
    /* 3B408 8004B408 1800A727 */  addiu      $a3, $sp, 0x18
    /* 3B40C 8004B40C 0D80063C */  lui        $a2, %hi(item)
    /* 3B410 8004B410 541DC624 */  addiu      $a2, $a2, %lo(item)
    /* 3B414 8004B414 6000C824 */  addiu      $t0, $a2, 0x60
    /* 3B418 8004B418 9800BFAF */  sw         $ra, 0x98($sp)
    /* 3B41C 8004B41C 9400B3AF */  sw         $s3, 0x94($sp)
    /* 3B420 8004B420 9000B2AF */  sw         $s2, 0x90($sp)
    /* 3B424 8004B424 8800B0AF */  sw         $s0, 0x88($sp)
  .L8004B428:
    /* 3B428 8004B428 0000C28C */  lw         $v0, 0x0($a2)
    /* 3B42C 8004B42C 0400C38C */  lw         $v1, 0x4($a2)
    /* 3B430 8004B430 0800C48C */  lw         $a0, 0x8($a2)
    /* 3B434 8004B434 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3B438 8004B438 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3B43C 8004B43C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3B440 8004B440 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3B444 8004B444 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3B448 8004B448 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3B44C 8004B44C F6FFC814 */  bne        $a2, $t0, .L8004B428
    /* 3B450 8004B450 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3B454 8004B454 0000C28C */  lw         $v0, 0x0($a2)
    /* 3B458 8004B458 0400C38C */  lw         $v1, 0x4($a2)
    /* 3B45C 8004B45C 0800C48C */  lw         $a0, 0x8($a2)
    /* 3B460 8004B460 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3B464 8004B464 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3B468 8004B468 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3B46C 8004B46C 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3B470 8004B470 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3B474 8004B474 00000000 */  nop
    /* 3B478 8004B478 80100400 */  sll        $v0, $a0, 2
    /* 3B47C 8004B47C 1280013C */  lui        $at, %hi(_boylevel)
    /* 3B480 8004B480 21082200 */  addu       $at, $at, $v0
    /* 3B484 8004B484 D8BA228C */  lw         $v0, %lo(_boylevel)($at)
    /* 3B488 8004B488 43181100 */  sra        $v1, $s1, 1
    /* 3B48C 8004B48C 2A104300 */  slt        $v0, $v0, $v1
    /* 3B490 8004B490 0B004014 */  bnez       $v0, .L8004B4C0
    /* 3B494 8004B494 C0100400 */   sll       $v0, $a0, 3
    /* 3B498 8004B498 23104400 */  subu       $v0, $v0, $a0
    /* 3B49C 8004B49C 80100200 */  sll        $v0, $v0, 2
    /* 3B4A0 8004B4A0 23104400 */  subu       $v0, $v0, $a0
    /* 3B4A4 8004B4A4 80100200 */  sll        $v0, $v0, 2
    /* 3B4A8 8004B4A8 0E80013C */  lui        $at, %hi(_boyitem + 0x2C)
    /* 3B4AC 8004B4AC 21082200 */  addu       $at, $at, $v0
    /* 3B4B0 8004B4B0 240B2384 */  lh         $v1, %lo(_boyitem + 0x2C)($at)
    /* 3B4B4 8004B4B4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3B4B8 8004B4B8 74006214 */  bne        $v1, $v0, .L8004B68C
    /* 3B4BC 8004B4BC 00000000 */   nop
  .L8004B4C0:
    /* 3B4C0 8004B4C0 0D80123C */  lui        $s2, %hi(item + 0x10)
    /* 3B4C4 8004B4C4 641D5226 */  addiu      $s2, $s2, %lo(item + 0x10)
    /* 3B4C8 8004B4C8 01001324 */  addiu      $s3, $zero, 0x1
  .L8004B4CC:
    /* 3B4CC 8004B4CC B7F6000C */  jal        GetRndSeed__Fv
    /* 3B4D0 8004B4D0 00000000 */   nop
    /* 3B4D4 8004B4D4 21204000 */  addu       $a0, $v0, $zero
    /* 3B4D8 8004B4D8 B3F6000C */  jal        SetRndSeed__Fl
    /* 3B4DC 8004B4DC 000044AE */   sw        $a0, 0x0($s2)
    /* 3B4E0 8004B4E0 1227010C */  jal        RndBoyItem__Fi
    /* 3B4E4 8004B4E4 21202002 */   addu      $a0, $s1, $zero
    /* 3B4E8 8004B4E8 21200000 */  addu       $a0, $zero, $zero
    /* 3B4EC 8004B4EC FFFF5024 */  addiu      $s0, $v0, -0x1
    /* 3B4F0 8004B4F0 21280002 */  addu       $a1, $s0, $zero
    /* 3B4F4 8004B4F4 A704010C */  jal        GetItemAttrs__Fiii
    /* 3B4F8 8004B4F8 21302002 */   addu      $a2, $s1, $zero
    /* 3B4FC 8004B4FC 21200000 */  addu       $a0, $zero, $zero
    /* 3B500 8004B500 21280002 */  addu       $a1, $s0, $zero
    /* 3B504 8004B504 21302002 */  addu       $a2, $s1, $zero
    /* 3B508 8004B508 40381100 */  sll        $a3, $s1, 1
    /* 3B50C 8004B50C 0D0D010C */  jal        GetItemBonus__FiiiiUc
    /* 3B510 8004B510 1000B3AF */   sw        $s3, 0x10($sp)
    /* 3B514 8004B514 0100023C */  lui        $v0, (0x15F90 >> 16)
    /* 3B518 8004B518 0800438E */  lw         $v1, 0x8($s2)
    /* 3B51C 8004B51C 905F4234 */  ori        $v0, $v0, (0x15F90 & 0xFFFF)
    /* 3B520 8004B520 2A104300 */  slt        $v0, $v0, $v1
    /* 3B524 8004B524 E9FF4014 */  bnez       $v0, .L8004B4CC
    /* 3B528 8004B528 00000000 */   nop
    /* 3B52C 8004B52C 0D80073C */  lui        $a3, %hi(item)
    /* 3B530 8004B530 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3B534 8004B534 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3B538 8004B538 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3B53C 8004B53C B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3B540 8004B540 0E80043C */  lui        $a0, %hi(_boyitem)
    /* 3B544 8004B544 F80A8424 */  addiu      $a0, $a0, %lo(_boyitem)
    /* 3B548 8004B548 C0180200 */  sll        $v1, $v0, 3
    /* 3B54C 8004B54C 23186200 */  subu       $v1, $v1, $v0
    /* 3B550 8004B550 80180300 */  sll        $v1, $v1, 2
    /* 3B554 8004B554 23186200 */  subu       $v1, $v1, $v0
    /* 3B558 8004B558 80180300 */  sll        $v1, $v1, 2
    /* 3B55C 8004B55C 21306400 */  addu       $a2, $v1, $a0
  .L8004B560:
    /* 3B560 8004B560 0000E28C */  lw         $v0, 0x0($a3)
    /* 3B564 8004B564 0400E38C */  lw         $v1, 0x4($a3)
    /* 3B568 8004B568 0800E48C */  lw         $a0, 0x8($a3)
    /* 3B56C 8004B56C 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3B570 8004B570 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3B574 8004B574 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3B578 8004B578 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3B57C 8004B57C 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3B580 8004B580 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3B584 8004B584 F6FFE814 */  bne        $a3, $t0, .L8004B560
    /* 3B588 8004B588 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3B58C 8004B58C 0000E28C */  lw         $v0, 0x0($a3)
    /* 3B590 8004B590 0400E38C */  lw         $v1, 0x4($a3)
    /* 3B594 8004B594 0800E48C */  lw         $a0, 0x8($a3)
    /* 3B598 8004B598 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3B59C 8004B59C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3B5A0 8004B5A0 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3B5A4 8004B5A4 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B5A8 8004B5A8 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B5AC 8004B5AC 00000000 */  nop
    /* 3B5B0 8004B5B0 C0100300 */  sll        $v0, $v1, 3
    /* 3B5B4 8004B5B4 23104300 */  subu       $v0, $v0, $v1
    /* 3B5B8 8004B5B8 80100200 */  sll        $v0, $v0, 2
    /* 3B5BC 8004B5BC 23104300 */  subu       $v0, $v0, $v1
    /* 3B5C0 8004B5C0 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3B5C4 8004B5C4 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3B5C8 8004B5C8 80100200 */  sll        $v0, $v0, 2
    /* 3B5CC 8004B5CC 0E80013C */  lui        $at, %hi(_boyitem + 0x65)
    /* 3B5D0 8004B5D0 21082200 */  addu       $at, $at, $v0
    /* 3B5D4 8004B5D4 5D0B23A0 */  sb         $v1, %lo(_boyitem + 0x65)($at)
    /* 3B5D8 8004B5D8 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3B5DC 8004B5DC B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3B5E0 8004B5E0 00102336 */  ori        $v1, $s1, 0x1000
    /* 3B5E4 8004B5E4 0E80013C */  lui        $at, %hi(_boyitem + 0x24)
    /* 3B5E8 8004B5E8 21082200 */  addu       $at, $at, $v0
    /* 3B5EC 8004B5EC 1C0B23A4 */  sh         $v1, %lo(_boyitem + 0x24)($at)
    /* 3B5F0 8004B5F0 01000324 */  addiu      $v1, $zero, 0x1
    /* 3B5F4 8004B5F4 C0100400 */  sll        $v0, $a0, 3
    /* 3B5F8 8004B5F8 23104400 */  subu       $v0, $v0, $a0
    /* 3B5FC 8004B5FC 80100200 */  sll        $v0, $v0, 2
    /* 3B600 8004B600 23104400 */  subu       $v0, $v0, $a0
    /* 3B604 8004B604 80100200 */  sll        $v0, $v0, 2
    /* 3B608 8004B608 0E80013C */  lui        $at, %hi(_boyitem + 0x69)
    /* 3B60C 8004B60C 21082200 */  addu       $at, $at, $v0
    /* 3B610 8004B610 610B23A0 */  sb         $v1, %lo(_boyitem + 0x69)($at)
    /* 3B614 8004B614 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3B618 8004B618 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3B61C 8004B61C 00000000 */  nop
    /* 3B620 8004B620 C0200200 */  sll        $a0, $v0, 3
    /* 3B624 8004B624 23208200 */  subu       $a0, $a0, $v0
    /* 3B628 8004B628 80200400 */  sll        $a0, $a0, 2
    /* 3B62C 8004B62C 23208200 */  subu       $a0, $a0, $v0
    /* 3B630 8004B630 80200400 */  sll        $a0, $a0, 2
    /* 3B634 8004B634 0E80023C */  lui        $v0, %hi(_boyitem)
    /* 3B638 8004B638 F80A4224 */  addiu      $v0, $v0, %lo(_boyitem)
    /* 3B63C 8004B63C 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 3B640 8004B640 21208200 */   addu      $a0, $a0, $v0
    /* 3B644 8004B644 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3B648 8004B648 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3B64C 8004B64C 00000000 */  nop
    /* 3B650 8004B650 C0180400 */  sll        $v1, $a0, 3
    /* 3B654 8004B654 23186400 */  subu       $v1, $v1, $a0
    /* 3B658 8004B658 80180300 */  sll        $v1, $v1, 2
    /* 3B65C 8004B65C 23186400 */  subu       $v1, $v1, $a0
    /* 3B660 8004B660 80180300 */  sll        $v1, $v1, 2
    /* 3B664 8004B664 0E80013C */  lui        $at, %hi(_boyitem + 0x66)
    /* 3B668 8004B668 21082300 */  addu       $at, $at, $v1
    /* 3B66C 8004B66C 5E0B22A0 */  sb         $v0, %lo(_boyitem + 0x66)($at)
    /* 3B670 8004B670 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3B674 8004B674 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3B678 8004B678 43181100 */  sra        $v1, $s1, 1
    /* 3B67C 8004B67C 80100200 */  sll        $v0, $v0, 2
    /* 3B680 8004B680 1280013C */  lui        $at, %hi(_boylevel)
    /* 3B684 8004B684 21082200 */  addu       $at, $at, $v0
    /* 3B688 8004B688 D8BA23AC */  sw         $v1, %lo(_boylevel)($at)
  .L8004B68C:
    /* 3B68C 8004B68C 0D80073C */  lui        $a3, %hi(item)
    /* 3B690 8004B690 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3B694 8004B694 1800A627 */  addiu      $a2, $sp, 0x18
    /* 3B698 8004B698 7800A827 */  addiu      $t0, $sp, 0x78
  .L8004B69C:
    /* 3B69C 8004B69C 0000C28C */  lw         $v0, 0x0($a2)
    /* 3B6A0 8004B6A0 0400C38C */  lw         $v1, 0x4($a2)
    /* 3B6A4 8004B6A4 0800C48C */  lw         $a0, 0x8($a2)
    /* 3B6A8 8004B6A8 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3B6AC 8004B6AC 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3B6B0 8004B6B0 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3B6B4 8004B6B4 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3B6B8 8004B6B8 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3B6BC 8004B6BC 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3B6C0 8004B6C0 F6FFC814 */  bne        $a2, $t0, .L8004B69C
    /* 3B6C4 8004B6C4 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3B6C8 8004B6C8 0000C28C */  lw         $v0, 0x0($a2)
    /* 3B6CC 8004B6CC 0400C38C */  lw         $v1, 0x4($a2)
    /* 3B6D0 8004B6D0 0800C48C */  lw         $a0, 0x8($a2)
    /* 3B6D4 8004B6D4 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3B6D8 8004B6D8 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3B6DC 8004B6DC 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3B6E0 8004B6E0 9800BF8F */  lw         $ra, 0x98($sp)
    /* 3B6E4 8004B6E4 9400B38F */  lw         $s3, 0x94($sp)
    /* 3B6E8 8004B6E8 9000B28F */  lw         $s2, 0x90($sp)
    /* 3B6EC 8004B6EC 8C00B18F */  lw         $s1, 0x8C($sp)
    /* 3B6F0 8004B6F0 8800B08F */  lw         $s0, 0x88($sp)
    /* 3B6F4 8004B6F4 A000BD27 */  addiu      $sp, $sp, 0xA0
    /* 3B6F8 8004B6F8 0800E003 */  jr         $ra
    /* 3B6FC 8004B6FC 00000000 */   nop
endlabel SpawnBoy__Fi
