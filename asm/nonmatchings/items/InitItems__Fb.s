.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitItems__Fb, 0x1B8

glabel InitItems__Fb
    /* 2E4F8 8003E4F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2E4FC 8003E4FC 21200000 */  addu       $a0, $zero, $zero
    /* 2E500 8003E500 21280000 */  addu       $a1, $zero, $zero
    /* 2E504 8003E504 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2E508 8003E508 A704010C */  jal        GetItemAttrs__Fiii
    /* 2E50C 8003E50C 01000624 */   addiu     $a2, $zero, 0x1
    /* 2E510 8003E510 0D80073C */  lui        $a3, %hi(item)
    /* 2E514 8003E514 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 2E518 8003E518 6000E824 */  addiu      $t0, $a3, 0x60
    /* 2E51C 8003E51C 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 2E520 8003E520 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 2E524 8003E524 0E80043C */  lui        $a0, %hi(_golditem)
    /* 2E528 8003E528 B01C8424 */  addiu      $a0, $a0, %lo(_golditem)
    /* 2E52C 8003E52C C0180200 */  sll        $v1, $v0, 3
    /* 2E530 8003E530 23186200 */  subu       $v1, $v1, $v0
    /* 2E534 8003E534 80180300 */  sll        $v1, $v1, 2
    /* 2E538 8003E538 23186200 */  subu       $v1, $v1, $v0
    /* 2E53C 8003E53C 80180300 */  sll        $v1, $v1, 2
    /* 2E540 8003E540 21306400 */  addu       $a2, $v1, $a0
  .L8003E544:
    /* 2E544 8003E544 0000E28C */  lw         $v0, 0x0($a3)
    /* 2E548 8003E548 0400E38C */  lw         $v1, 0x4($a3)
    /* 2E54C 8003E54C 0800E48C */  lw         $a0, 0x8($a3)
    /* 2E550 8003E550 0C00E58C */  lw         $a1, 0xC($a3)
    /* 2E554 8003E554 0000C2AC */  sw         $v0, 0x0($a2)
    /* 2E558 8003E558 0400C3AC */  sw         $v1, 0x4($a2)
    /* 2E55C 8003E55C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 2E560 8003E560 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 2E564 8003E564 1000E724 */  addiu      $a3, $a3, 0x10
    /* 2E568 8003E568 F6FFE814 */  bne        $a3, $t0, .L8003E544
    /* 2E56C 8003E56C 1000C624 */   addiu     $a2, $a2, 0x10
    /* 2E570 8003E570 0000E28C */  lw         $v0, 0x0($a3)
    /* 2E574 8003E574 0400E38C */  lw         $v1, 0x4($a3)
    /* 2E578 8003E578 0800E48C */  lw         $a0, 0x8($a3)
    /* 2E57C 8003E57C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 2E580 8003E580 0400C3AC */  sw         $v1, 0x4($a2)
    /* 2E584 8003E584 0800C4AC */  sw         $a0, 0x8($a2)
    /* 2E588 8003E588 21280000 */  addu       $a1, $zero, $zero
    /* 2E58C 8003E58C 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 2E590 8003E590 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 2E594 8003E594 21200000 */  addu       $a0, $zero, $zero
    /* 2E598 8003E598 C0100300 */  sll        $v0, $v1, 3
    /* 2E59C 8003E59C 23104300 */  subu       $v0, $v0, $v1
    /* 2E5A0 8003E5A0 80100200 */  sll        $v0, $v0, 2
    /* 2E5A4 8003E5A4 23104300 */  subu       $v0, $v0, $v1
    /* 2E5A8 8003E5A8 80100200 */  sll        $v0, $v0, 2
    /* 2E5AC 8003E5AC 01000324 */  addiu      $v1, $zero, 0x1
    /* 2E5B0 8003E5B0 0E80013C */  lui        $at, %hi(_golditem + 0x66)
    /* 2E5B4 8003E5B4 21082200 */  addu       $at, $at, $v0
    /* 2E5B8 8003E5B8 161D23A0 */  sb         $v1, %lo(_golditem + 0x66)($at)
    /* 2E5BC 8003E5BC 081180AF */  sw         $zero, %gp_rel(numitems)($gp)
  .L8003E5C0:
    /* 2E5C0 8003E5C0 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 2E5C4 8003E5C4 21082400 */  addu       $at, $at, $a0
    /* 2E5C8 8003E5C8 A61D20A0 */  sb         $zero, %lo(item + 0x52)($at)
    /* 2E5CC 8003E5CC 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 2E5D0 8003E5D0 21082400 */  addu       $at, $at, $a0
    /* 2E5D4 8003E5D4 A71D20A0 */  sb         $zero, %lo(item + 0x53)($at)
    /* 2E5D8 8003E5D8 0D80013C */  lui        $at, %hi(item + 0x68)
    /* 2E5DC 8003E5DC 21082400 */  addu       $at, $at, $a0
    /* 2E5E0 8003E5E0 BC1D20A0 */  sb         $zero, %lo(item + 0x68)($at)
    /* 2E5E4 8003E5E4 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 2E5E8 8003E5E8 21082400 */  addu       $at, $at, $a0
    /* 2E5EC 8003E5EC A41D20A0 */  sb         $zero, %lo(item + 0x50)($at)
    /* 2E5F0 8003E5F0 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 2E5F4 8003E5F4 21082400 */  addu       $at, $at, $a0
    /* 2E5F8 8003E5F8 BD1D20A0 */  sb         $zero, %lo(item + 0x69)($at)
    /* 2E5FC 8003E5FC 0D80013C */  lui        $at, %hi(item + 0x67)
    /* 2E600 8003E600 21082400 */  addu       $at, $at, $a0
    /* 2E604 8003E604 BB1D20A0 */  sb         $zero, %lo(item + 0x67)($at)
    /* 2E608 8003E608 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 2E60C 8003E60C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 2E610 8003E610 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2E614 8003E614 0D80013C */  lui        $at, %hi(item + 0x2C)
    /* 2E618 8003E618 21082400 */  addu       $at, $at, $a0
    /* 2E61C 8003E61C 801D20A4 */  sh         $zero, %lo(item + 0x2C)($at)
    /* 2E620 8003E620 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 2E624 8003E624 21082400 */  addu       $at, $at, $a0
    /* 2E628 8003E628 B91D22A0 */  sb         $v0, %lo(item + 0x65)($at)
    /* 2E62C 8003E62C 7F00A228 */  slti       $v0, $a1, 0x7F
    /* 2E630 8003E630 E3FF4014 */  bnez       $v0, .L8003E5C0
    /* 2E634 8003E634 6C008424 */   addiu     $a0, $a0, 0x6C
    /* 2E638 8003E638 21280000 */  addu       $a1, $zero, $zero
  .L8003E63C:
    /* 2E63C 8003E63C 0D80013C */  lui        $at, %hi(itemavail)
    /* 2E640 8003E640 21082500 */  addu       $at, $at, $a1
    /* 2E644 8003E644 D45325A0 */  sb         $a1, %lo(itemavail)($at)
    /* 2E648 8003E648 0D80013C */  lui        $at, %hi(itemactive)
    /* 2E64C 8003E64C 21082500 */  addu       $at, $at, $a1
    /* 2E650 8003E650 545320A0 */  sb         $zero, %lo(itemactive)($at)
    /* 2E654 8003E654 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2E658 8003E658 7F00A228 */  slti       $v0, $a1, 0x7F
    /* 2E65C 8003E65C F7FF4014 */  bnez       $v0, .L8003E63C
    /* 2E660 8003E660 00000000 */   nop
    /* 2E664 8003E664 1280023C */  lui        $v0, %hi(setlevel)
    /* 2E668 8003E668 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 2E66C 8003E66C 00000000 */  nop
    /* 2E670 8003E670 0A004014 */  bnez       $v0, .L8003E69C
    /* 2E674 8003E674 00000000 */   nop
    /* 2E678 8003E678 1280023C */  lui        $v0, %hi(currlevel)
    /* 2E67C 8003E67C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2E680 8003E680 00000000 */  nop
    /* 2E684 8003E684 05004010 */  beqz       $v0, .L8003E69C
    /* 2E688 8003E688 1000422C */   sltiu     $v0, $v0, 0x10
    /* 2E68C 8003E68C 03004010 */  beqz       $v0, .L8003E69C
    /* 2E690 8003E690 00000000 */   nop
    /* 2E694 8003E694 BCF8000C */  jal        AddInitItems__Fv
    /* 2E698 8003E698 00000000 */   nop
  .L8003E69C:
    /* 2E69C 8003E69C 5C1180A3 */  sb         $zero, %gp_rel(uitemflag)($gp)
    /* 2E6A0 8003E6A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2E6A4 8003E6A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2E6A8 8003E6A8 0800E003 */  jr         $ra
    /* 2E6AC 8003E6AC 00000000 */   nop
endlabel InitItems__Fb
