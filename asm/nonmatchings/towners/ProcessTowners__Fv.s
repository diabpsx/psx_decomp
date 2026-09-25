.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ProcessTowners__Fv, 0x250

glabel ProcessTowners__Fv
    /* 2B518 8003B518 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2B51C 8003B51C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2B520 8003B520 0D80123C */  lui        $s2, %hi(AnimOrder)
    /* 2B524 8003B524 E4F75226 */  addiu      $s2, $s2, %lo(AnimOrder)
    /* 2B528 8003B528 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2B52C 8003B52C 0D80113C */  lui        $s1, %hi(towner + 0x28)
    /* 2B530 8003B530 A8FE3126 */  addiu      $s1, $s1, %lo(towner + 0x28)
    /* 2B534 8003B534 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2B538 8003B538 21800000 */  addu       $s0, $zero, $zero
    /* 2B53C 8003B53C 1C00BFAF */  sw         $ra, 0x1C($sp)
  .L8003B540:
    /* 2B540 8003B540 0D80023C */  lui        $v0, %hi(sgSFX + 0x28)
    /* 2B544 8003B544 E80A4224 */  addiu      $v0, $v0, %lo(sgSFX + 0x28)
    /* 2B548 8003B548 2A102202 */  slt        $v0, $s1, $v0
    /* 2B54C 8003B54C 7F004010 */  beqz       $v0, .L8003B74C
    /* 2B550 8003B550 00000000 */   nop
    /* 2B554 8003B554 0D80013C */  lui        $at, %hi(towner + 0x4)
    /* 2B558 8003B558 21083000 */  addu       $at, $at, $s0
    /* 2B55C 8003B55C 84FE238C */  lw         $v1, %lo(towner + 0x4)($at)
    /* 2B560 8003B560 00000000 */  nop
    /* 2B564 8003B564 0A00622C */  sltiu      $v0, $v1, 0xA
    /* 2B568 8003B568 2D004010 */  beqz       $v0, .L8003B620
    /* 2B56C 8003B56C 80100300 */   sll       $v0, $v1, 2
    /* 2B570 8003B570 1180013C */  lui        $at, %hi(jtbl_801112F0)
    /* 2B574 8003B574 21082200 */  addu       $at, $at, $v0
    /* 2B578 8003B578 F012228C */  lw         $v0, %lo(jtbl_801112F0)($at)
    /* 2B57C 8003B57C 00000000 */  nop
    /* 2B580 8003B580 08004000 */  jr         $v0
    /* 2B584 8003B584 00000000 */   nop
  jlabel .L8003B588
    /* 2B588 8003B588 7CEC000C */  jal        TownBlackSmith__Fv
    /* 2B58C 8003B58C 00000000 */   nop
    /* 2B590 8003B590 88ED0008 */  j          .L8003B620
    /* 2B594 8003B594 00000000 */   nop
  jlabel .L8003B598
    /* 2B598 8003B598 00ED000C */  jal        TownHealer__Fv
    /* 2B59C 8003B59C 00000000 */   nop
    /* 2B5A0 8003B5A0 88ED0008 */  j          .L8003B620
    /* 2B5A4 8003B5A4 00000000 */   nop
  jlabel .L8003B5A8
    /* 2B5A8 8003B5A8 C6EC000C */  jal        TownDead__Fv
    /* 2B5AC 8003B5AC 00000000 */   nop
    /* 2B5B0 8003B5B0 88ED0008 */  j          .L8003B620
    /* 2B5B4 8003B5B4 00000000 */   nop
  jlabel .L8003B5B8
    /* 2B5B8 8003B5B8 9FEC000C */  jal        TownBarOwner__Fv
    /* 2B5BC 8003B5BC 00000000 */   nop
    /* 2B5C0 8003B5C0 88ED0008 */  j          .L8003B620
    /* 2B5C4 8003B5C4 00000000 */   nop
  jlabel .L8003B5C8
    /* 2B5C8 8003B5C8 0AED000C */  jal        TownStory__Fv
    /* 2B5CC 8003B5CC 00000000 */   nop
    /* 2B5D0 8003B5D0 88ED0008 */  j          .L8003B620
    /* 2B5D4 8003B5D4 00000000 */   nop
  jlabel .L8003B5D8
    /* 2B5D8 8003B5D8 14ED000C */  jal        TownDrunk__Fv
    /* 2B5DC 8003B5DC 00000000 */   nop
    /* 2B5E0 8003B5E0 88ED0008 */  j          .L8003B620
    /* 2B5E4 8003B5E4 00000000 */   nop
  jlabel .L8003B5E8
    /* 2B5E8 8003B5E8 1EED000C */  jal        TownBoy__Fv
    /* 2B5EC 8003B5EC 00000000 */   nop
    /* 2B5F0 8003B5F0 88ED0008 */  j          .L8003B620
    /* 2B5F4 8003B5F4 00000000 */   nop
  jlabel .L8003B5F8
    /* 2B5F8 8003B5F8 28ED000C */  jal        TownWitch__Fv
    /* 2B5FC 8003B5FC 00000000 */   nop
    /* 2B600 8003B600 88ED0008 */  j          .L8003B620
    /* 2B604 8003B604 00000000 */   nop
  jlabel .L8003B608
    /* 2B608 8003B608 32ED000C */  jal        TownBarMaid__Fv
    /* 2B60C 8003B60C 00000000 */   nop
    /* 2B610 8003B610 88ED0008 */  j          .L8003B620
    /* 2B614 8003B614 00000000 */   nop
  jlabel .L8003B618
    /* 2B618 8003B618 3CED000C */  jal        TownCow__Fv
    /* 2B61C 8003B61C 00000000 */   nop
  .L8003B620:
    /* 2B620 8003B620 0D80033C */  lui        $v1, %hi(towner)
    /* 2B624 8003B624 80FE6324 */  addiu      $v1, $v1, %lo(towner)
    /* 2B628 8003B628 0000228E */  lw         $v0, 0x0($s1)
    /* 2B62C 8003B62C 21200302 */  addu       $a0, $s0, $v1
    /* 2B630 8003B630 01004224 */  addiu      $v0, $v0, 0x1
    /* 2B634 8003B634 280082AC */  sw         $v0, 0x28($a0)
    /* 2B638 8003B638 0000228E */  lw         $v0, 0x0($s1)
    /* 2B63C 8003B63C 0D80013C */  lui        $at, %hi(towner + 0x24)
    /* 2B640 8003B640 21083000 */  addu       $at, $at, $s0
    /* 2B644 8003B644 A4FE238C */  lw         $v1, %lo(towner + 0x24)($at)
    /* 2B648 8003B648 00000000 */  nop
    /* 2B64C 8003B64C 2A104300 */  slt        $v0, $v0, $v1
    /* 2B650 8003B650 3B004014 */  bnez       $v0, .L8003B740
    /* 2B654 8003B654 00000000 */   nop
    /* 2B658 8003B658 0D80013C */  lui        $at, %hi(towner + 0x38)
    /* 2B65C 8003B65C 21083000 */  addu       $at, $at, $s0
    /* 2B660 8003B660 B8FE2380 */  lb         $v1, %lo(towner + 0x38)($at)
    /* 2B664 8003B664 0D80013C */  lui        $at, %hi(towner + 0x28)
    /* 2B668 8003B668 21083000 */  addu       $at, $at, $s0
    /* 2B66C 8003B66C A8FE20AC */  sw         $zero, %lo(towner + 0x28)($at)
    /* 2B670 8003B670 20006004 */  bltz       $v1, .L8003B6F4
    /* 2B674 8003B674 00000000 */   nop
    /* 2B678 8003B678 0D80013C */  lui        $at, %hi(towner + 0x34)
    /* 2B67C 8003B67C 21083000 */  addu       $at, $at, $s0
    /* 2B680 8003B680 B4FE228C */  lw         $v0, %lo(towner + 0x34)($at)
    /* 2B684 8003B684 00000000 */  nop
    /* 2B688 8003B688 01004224 */  addiu      $v0, $v0, 0x1
    /* 2B68C 8003B68C 340082AC */  sw         $v0, 0x34($a0)
    /* 2B690 8003B690 C0100300 */  sll        $v0, $v1, 3
    /* 2B694 8003B694 21104300 */  addu       $v0, $v0, $v1
    /* 2B698 8003B698 80100200 */  sll        $v0, $v0, 2
    /* 2B69C 8003B69C 21104300 */  addu       $v0, $v0, $v1
    /* 2B6A0 8003B6A0 80100200 */  sll        $v0, $v0, 2
    /* 2B6A4 8003B6A4 0D80013C */  lui        $at, %hi(towner + 0x34)
    /* 2B6A8 8003B6A8 21083000 */  addu       $at, $at, $s0
    /* 2B6AC 8003B6AC B4FE238C */  lw         $v1, %lo(towner + 0x34)($at)
    /* 2B6B0 8003B6B0 21205200 */  addu       $a0, $v0, $s2
    /* 2B6B4 8003B6B4 21188300 */  addu       $v1, $a0, $v1
    /* 2B6B8 8003B6B8 00006380 */  lb         $v1, 0x0($v1)
    /* 2B6BC 8003B6BC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2B6C0 8003B6C0 04006214 */  bne        $v1, $v0, .L8003B6D4
    /* 2B6C4 8003B6C4 00000000 */   nop
    /* 2B6C8 8003B6C8 0D80013C */  lui        $at, %hi(towner + 0x34)
    /* 2B6CC 8003B6CC 21083000 */  addu       $at, $at, $s0
    /* 2B6D0 8003B6D0 B4FE20AC */  sw         $zero, %lo(towner + 0x34)($at)
  .L8003B6D4:
    /* 2B6D4 8003B6D4 0D80013C */  lui        $at, %hi(towner + 0x34)
    /* 2B6D8 8003B6D8 21083000 */  addu       $at, $at, $s0
    /* 2B6DC 8003B6DC B4FE228C */  lw         $v0, %lo(towner + 0x34)($at)
    /* 2B6E0 8003B6E0 00000000 */  nop
    /* 2B6E4 8003B6E4 21108200 */  addu       $v0, $a0, $v0
    /* 2B6E8 8003B6E8 00004280 */  lb         $v0, 0x0($v0)
    /* 2B6EC 8003B6EC CDED0008 */  j          .L8003B734
    /* 2B6F0 8003B6F0 00000000 */   nop
  .L8003B6F4:
    /* 2B6F4 8003B6F4 0D80013C */  lui        $at, %hi(towner + 0x30)
    /* 2B6F8 8003B6F8 21083000 */  addu       $at, $at, $s0
    /* 2B6FC 8003B6FC B0FE228C */  lw         $v0, %lo(towner + 0x30)($at)
    /* 2B700 8003B700 00000000 */  nop
    /* 2B704 8003B704 01004224 */  addiu      $v0, $v0, 0x1
    /* 2B708 8003B708 300082AC */  sw         $v0, 0x30($a0)
    /* 2B70C 8003B70C 0D80013C */  lui        $at, %hi(towner + 0x30)
    /* 2B710 8003B710 21083000 */  addu       $at, $at, $s0
    /* 2B714 8003B714 B0FE238C */  lw         $v1, %lo(towner + 0x30)($at)
    /* 2B718 8003B718 0D80013C */  lui        $at, %hi(towner + 0x2C)
    /* 2B71C 8003B71C 21083000 */  addu       $at, $at, $s0
    /* 2B720 8003B720 ACFE228C */  lw         $v0, %lo(towner + 0x2C)($at)
    /* 2B724 8003B724 00000000 */  nop
    /* 2B728 8003B728 2A104300 */  slt        $v0, $v0, $v1
    /* 2B72C 8003B72C 04004010 */  beqz       $v0, .L8003B740
    /* 2B730 8003B730 01000224 */   addiu     $v0, $zero, 0x1
  .L8003B734:
    /* 2B734 8003B734 0D80013C */  lui        $at, %hi(towner + 0x30)
    /* 2B738 8003B738 21083000 */  addu       $at, $at, $s0
    /* 2B73C 8003B73C B0FE22AC */  sw         $v0, %lo(towner + 0x30)($at)
  .L8003B740:
    /* 2B740 8003B740 C4003126 */  addiu      $s1, $s1, 0xC4
    /* 2B744 8003B744 50ED0008 */  j          .L8003B540
    /* 2B748 8003B748 C4001026 */   addiu     $s0, $s0, 0xC4
  .L8003B74C:
    /* 2B74C 8003B74C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 2B750 8003B750 1800B28F */  lw         $s2, 0x18($sp)
    /* 2B754 8003B754 1400B18F */  lw         $s1, 0x14($sp)
    /* 2B758 8003B758 1000B08F */  lw         $s0, 0x10($sp)
    /* 2B75C 8003B75C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2B760 8003B760 0800E003 */  jr         $ra
    /* 2B764 8003B764 00000000 */   nop
endlabel ProcessTowners__Fv
