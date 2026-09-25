.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintMap__7CBlocksii, 0xB70

glabel PrintMap__7CBlocksii
    /* 7E528 8008E528 F0FEBD27 */  addiu      $sp, $sp, -0x110
    /* 7E52C 8008E52C 0C01BFAF */  sw         $ra, 0x10C($sp)
    /* 7E530 8008E530 0801BEAF */  sw         $fp, 0x108($sp)
    /* 7E534 8008E534 0401B7AF */  sw         $s7, 0x104($sp)
    /* 7E538 8008E538 0001B6AF */  sw         $s6, 0x100($sp)
    /* 7E53C 8008E53C FC00B5AF */  sw         $s5, 0xFC($sp)
    /* 7E540 8008E540 F800B4AF */  sw         $s4, 0xF8($sp)
    /* 7E544 8008E544 F400B3AF */  sw         $s3, 0xF4($sp)
    /* 7E548 8008E548 F000B2AF */  sw         $s2, 0xF0($sp)
    /* 7E54C 8008E54C EC00B1AF */  sw         $s1, 0xEC($sp)
    /* 7E550 8008E550 E800B0AF */  sw         $s0, 0xE8($sp)
    /* 7E554 8008E554 4800A4AF */  sw         $a0, 0x48($sp)
    /* 7E558 8008E558 5000A5AF */  sw         $a1, 0x50($sp)
    /* 7E55C 8008E55C 5800A6AF */  sw         $a2, 0x58($sp)
    /* 7E560 8008E560 2000848C */  lw         $a0, 0x20($a0)
    /* 7E564 8008E564 DD85000C */  jal        GAL_Lock
    /* 7E568 8008E568 00000000 */   nop
    /* 7E56C 8008E56C 06004014 */  bnez       $v0, .L8008E588
    /* 7E570 8008E570 8800A2AF */   sw        $v0, 0x88($sp)
    /* 7E574 8008E574 21200000 */  addu       $a0, $zero, $zero
    /* 7E578 8008E578 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7E57C 8008E57C 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7E580 8008E580 A583000C */  jal        DBG_Error
    /* 7E584 8008E584 0C040624 */   addiu     $a2, $zero, 0x40C
  .L8008E588:
    /* 7E588 8008E588 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7E58C 8008E58C 00000000 */  nop
    /* 7E590 8008E590 3C004A8D */  lw         $t2, 0x3C($t2)
    /* 7E594 8008E594 00000000 */  nop
    /* 7E598 8008E598 06004015 */  bnez       $t2, .L8008E5B4
    /* 7E59C 8008E59C 8000AAAF */   sw        $t2, 0x80($sp)
    /* 7E5A0 8008E5A0 21200000 */  addu       $a0, $zero, $zero
    /* 7E5A4 8008E5A4 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7E5A8 8008E5A8 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7E5AC 8008E5AC A583000C */  jal        DBG_Error
    /* 7E5B0 8008E5B0 0F040624 */   addiu     $a2, $zero, 0x40F
  .L8008E5B4:
    /* 7E5B4 8008E5B4 1735020C */  jal        CycleSelCols__Fv
    /* 7E5B8 8008E5B8 00000000 */   nop
    /* 7E5BC 8008E5BC 1280033C */  lui        $v1, %hi(leveltype)
    /* 7E5C0 8008E5C0 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 7E5C4 8008E5C4 00000000 */  nop
    /* 7E5C8 8008E5C8 0500622C */  sltiu      $v0, $v1, 0x5
    /* 7E5CC 8008E5CC 16004010 */  beqz       $v0, .L8008E628
    /* 7E5D0 8008E5D0 80100300 */   sll       $v0, $v1, 2
    /* 7E5D4 8008E5D4 1180013C */  lui        $at, %hi(jtbl_80110574)
    /* 7E5D8 8008E5D8 21082200 */  addu       $at, $at, $v0
    /* 7E5DC 8008E5DC 7405228C */  lw         $v0, %lo(jtbl_80110574)($at)
    /* 7E5E0 8008E5E0 00000000 */  nop
    /* 7E5E4 8008E5E4 08004000 */  jr         $v0
    /* 7E5E8 8008E5E8 00000000 */   nop
  jlabel .L8008E5EC
    /* 7E5EC 8008E5EC 03000B24 */  addiu      $t3, $zero, 0x3
    /* 7E5F0 8008E5F0 8B390208 */  j          .L8008E62C
    /* 7E5F4 8008E5F4 7800ABAF */   sw        $t3, 0x78($sp)
  jlabel .L8008E5F8
    /* 7E5F8 8008E5F8 16000A24 */  addiu      $t2, $zero, 0x16
    /* 7E5FC 8008E5FC 8B390208 */  j          .L8008E62C
    /* 7E600 8008E600 7800AAAF */   sw        $t2, 0x78($sp)
  jlabel .L8008E604
    /* 7E604 8008E604 0C000B24 */  addiu      $t3, $zero, 0xC
    /* 7E608 8008E608 8B390208 */  j          .L8008E62C
    /* 7E60C 8008E60C 7800ABAF */   sw        $t3, 0x78($sp)
  jlabel .L8008E610
    /* 7E610 8008E610 08000A24 */  addiu      $t2, $zero, 0x8
    /* 7E614 8008E614 8B390208 */  j          .L8008E62C
    /* 7E618 8008E618 7800AAAF */   sw        $t2, 0x78($sp)
  jlabel .L8008E61C
    /* 7E61C 8008E61C 14000B24 */  addiu      $t3, $zero, 0x14
    /* 7E620 8008E620 8B390208 */  j          .L8008E62C
    /* 7E624 8008E624 7800ABAF */   sw        $t3, 0x78($sp)
  .L8008E628:
    /* 7E628 8008E628 7800A0AF */  sw         $zero, 0x78($sp)
  .L8008E62C:
    /* 7E62C 8008E62C 6666023C */  lui        $v0, (0x66666667 >> 16)
    /* 7E630 8008E630 5000AA8F */  lw         $t2, 0x50($sp)
    /* 7E634 8008E634 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
    /* 7E638 8008E638 18004201 */  mult       $t2, $v0
    /* 7E63C 8008E63C 10180000 */  mfhi       $v1
    /* 7E640 8008E640 5800AA8F */  lw         $t2, 0x58($sp)
    /* 7E644 8008E644 00000000 */  nop
    /* 7E648 8008E648 18004201 */  mult       $t2, $v0
    /* 7E64C 8008E64C 5000AB8F */  lw         $t3, 0x50($sp)
    /* 7E650 8008E650 03190300 */  sra        $v1, $v1, 4
    /* 7E654 8008E654 C3170B00 */  sra        $v0, $t3, 31
    /* 7E658 8008E658 23A06200 */  subu       $s4, $v1, $v0
    /* 7E65C 8008E65C 21208002 */  addu       $a0, $s4, $zero
    /* 7E660 8008E660 80100400 */  sll        $v0, $a0, 2
    /* 7E664 8008E664 21104400 */  addu       $v0, $v0, $a0
    /* 7E668 8008E668 C0100200 */  sll        $v0, $v0, 3
    /* 7E66C 8008E66C 23A06201 */  subu       $s4, $t3, $v0
    /* 7E670 8008E670 C3170A00 */  sra        $v0, $t2, 31
    /* 7E674 8008E674 6000A4AF */  sw         $a0, 0x60($sp)
    /* 7E678 8008E678 10280000 */  mfhi       $a1
    /* 7E67C 8008E67C 03190500 */  sra        $v1, $a1, 4
    /* 7E680 8008E680 23A86200 */  subu       $s5, $v1, $v0
    /* 7E684 8008E684 2118A002 */  addu       $v1, $s5, $zero
    /* 7E688 8008E688 80100300 */  sll        $v0, $v1, 2
    /* 7E68C 8008E68C 21104300 */  addu       $v0, $v0, $v1
    /* 7E690 8008E690 C0100200 */  sll        $v0, $v0, 3
    /* 7E694 8008E694 23A84201 */  subu       $s5, $t2, $v0
    /* 7E698 8008E698 05006105 */  bgez       $t3, .L8008E6B0
    /* 7E69C 8008E69C 6800A3AF */   sw        $v1, 0x68($sp)
    /* 7E6A0 8008E6A0 21508000 */  addu       $t2, $a0, $zero
    /* 7E6A4 8008E6A4 FFFF4A25 */  addiu      $t2, $t2, -0x1
    /* 7E6A8 8008E6A8 6000AAAF */  sw         $t2, 0x60($sp)
    /* 7E6AC 8008E6AC 28009426 */  addiu      $s4, $s4, 0x28
  .L8008E6B0:
    /* 7E6B0 8008E6B0 4800A48F */  lw         $a0, 0x48($sp)
    /* 7E6B4 8008E6B4 5000A58F */  lw         $a1, 0x50($sp)
    /* 7E6B8 8008E6B8 5800A68F */  lw         $a2, 0x58($sp)
    /* 7E6BC 8008E6BC 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 7E6C0 8008E6C0 00000000 */   nop
    /* 7E6C4 8008E6C4 21804000 */  addu       $s0, $v0, $zero
    /* 7E6C8 8008E6C8 4800A48F */  lw         $a0, 0x48($sp)
    /* 7E6CC 8008E6CC 5000AB8F */  lw         $t3, 0x50($sp)
    /* 7E6D0 8008E6D0 5800AA8F */  lw         $t2, 0x58($sp)
    /* 7E6D4 8008E6D4 23907401 */  subu       $s2, $t3, $s4
    /* 7E6D8 8008E6D8 21284002 */  addu       $a1, $s2, $zero
    /* 7E6DC 8008E6DC 23885501 */  subu       $s1, $t2, $s5
    /* 7E6E0 8008E6E0 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 7E6E4 8008E6E4 21302002 */   addu      $a2, $s1, $zero
    /* 7E6E8 8008E6E8 4800A48F */  lw         $a0, 0x48($sp)
    /* 7E6EC 8008E6EC 5000A58F */  lw         $a1, 0x50($sp)
    /* 7E6F0 8008E6F0 5800A68F */  lw         $a2, 0x58($sp)
    /* 7E6F4 8008E6F4 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 7E6F8 8008E6F8 23980202 */   subu      $s3, $s0, $v0
    /* 7E6FC 8008E6FC 21284002 */  addu       $a1, $s2, $zero
    /* 7E700 8008E700 21302002 */  addu       $a2, $s1, $zero
    /* 7E704 8008E704 4800A48F */  lw         $a0, 0x48($sp)
    /* 7E708 8008E708 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 7E70C 8008E70C 21804000 */   addu      $s0, $v0, $zero
    /* 7E710 8008E710 4800AB8F */  lw         $t3, 0x48($sp)
    /* 7E714 8008E714 00000000 */  nop
    /* 7E718 8008E718 A800638D */  lw         $v1, 0xA8($t3)
    /* 7E71C 8008E71C 00000000 */  nop
    /* 7E720 8008E720 11006014 */  bnez       $v1, .L8008E768
    /* 7E724 8008E724 23800202 */   subu      $s0, $s0, $v0
    /* 7E728 8008E728 40010524 */  addiu      $a1, $zero, 0x140
    /* 7E72C 8008E72C 4800A48F */  lw         $a0, 0x48($sp)
    /* 7E730 8008E730 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 7E734 8008E734 40010624 */   addiu     $a2, $zero, 0x140
    /* 7E738 8008E738 23986202 */  subu       $s3, $s3, $v0
    /* 7E73C 8008E73C 40010524 */  addiu      $a1, $zero, 0x140
    /* 7E740 8008E740 4800A48F */  lw         $a0, 0x48($sp)
    /* 7E744 8008E744 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 7E748 8008E748 40010624 */   addiu     $a2, $zero, 0x140
    /* 7E74C 8008E74C 23800202 */  subu       $s0, $s0, $v0
    /* 7E750 8008E750 6000AA8F */  lw         $t2, 0x60($sp)
    /* 7E754 8008E754 6800AB8F */  lw         $t3, 0x68($sp)
    /* 7E758 8008E758 F8FF4A25 */  addiu      $t2, $t2, -0x8
    /* 7E75C 8008E75C F8FF6B25 */  addiu      $t3, $t3, -0x8
    /* 7E760 8008E760 6000AAAF */  sw         $t2, 0x60($sp)
    /* 7E764 8008E764 6800ABAF */  sw         $t3, 0x68($sp)
  .L8008E768:
    /* 7E768 8008E768 4C05828F */  lw         $v0, %gp_rel(GMXAdj2)($gp)
    /* 7E76C 8008E76C 5005838F */  lw         $v1, %gp_rel(GMYAdj2)($gp)
    /* 7E770 8008E770 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7E774 8008E774 23105300 */  subu       $v0, $v0, $s3
    /* 7E778 8008E778 23187000 */  subu       $v1, $v1, $s0
    /* 7E77C 8008E77C 21584000 */  addu       $t3, $v0, $zero
    /* 7E780 8008E780 5000A2AF */  sw         $v0, 0x50($sp)
    /* 7E784 8008E784 5800A3AF */  sw         $v1, 0x58($sp)
    /* 7E788 8008E788 C0004385 */  lh         $v1, 0xC0($t2)
    /* 7E78C 8008E78C C2004485 */  lh         $a0, 0xC2($t2)
    /* 7E790 8008E790 5800AA8F */  lw         $t2, 0x58($sp)
    /* 7E794 8008E794 21586301 */  addu       $t3, $t3, $v1
    /* 7E798 8008E798 5000ABAF */  sw         $t3, 0x50($sp)
    /* 7E79C 8008E79C 4800AB8F */  lw         $t3, 0x48($sp)
    /* 7E7A0 8008E7A0 21504401 */  addu       $t2, $t2, $a0
    /* 7E7A4 8008E7A4 5800AAAF */  sw         $t2, 0x58($sp)
    /* 7E7A8 8008E7A8 C4006285 */  lh         $v0, 0xC4($t3)
    /* 7E7AC 8008E7AC 9000A3AF */  sw         $v1, 0x90($sp)
    /* 7E7B0 8008E7B0 21106200 */  addu       $v0, $v1, $v0
    /* 7E7B4 8008E7B4 9800A2AF */  sw         $v0, 0x98($sp)
    /* 7E7B8 8008E7B8 C6006285 */  lh         $v0, 0xC6($t3)
    /* 7E7BC 8008E7BC A000A4AF */  sw         $a0, 0xA0($sp)
    /* 7E7C0 8008E7C0 21108200 */  addu       $v0, $a0, $v0
    /* 7E7C4 8008E7C4 A800A2AF */  sw         $v0, 0xA8($sp)
    /* 7E7C8 8008E7C8 23109502 */  subu       $v0, $s4, $s5
    /* 7E7CC 8008E7CC 0A004104 */  bgez       $v0, .L8008E7F8
    /* 7E7D0 8008E7D0 00000000 */   nop
    /* 7E7D4 8008E7D4 6000AA8F */  lw         $t2, 0x60($sp)
    /* 7E7D8 8008E7D8 5000AB8F */  lw         $t3, 0x50($sp)
    /* 7E7DC 8008E7DC FFFF4A25 */  addiu      $t2, $t2, -0x1
    /* 7E7E0 8008E7E0 6000AAAF */  sw         $t2, 0x60($sp)
    /* 7E7E4 8008E7E4 01000A24 */  addiu      $t2, $zero, 0x1
    /* 7E7E8 8008E7E8 7000AAAF */  sw         $t2, 0x70($sp)
    /* 7E7EC 8008E7EC D8FF6B25 */  addiu      $t3, $t3, -0x28
    /* 7E7F0 8008E7F0 FF390208 */  j          .L8008E7FC
    /* 7E7F4 8008E7F4 5000ABAF */   sw        $t3, 0x50($sp)
  .L8008E7F8:
    /* 7E7F8 8008E7F8 7000A0AF */  sw         $zero, 0x70($sp)
  .L8008E7FC:
    /* 7E7FC 8008E7FC 5000AB8F */  lw         $t3, 0x50($sp)
    /* 7E800 8008E800 9800AA8F */  lw         $t2, 0x98($sp)
    /* 7E804 8008E804 00000000 */  nop
    /* 7E808 8008E808 2A106A01 */  slt        $v0, $t3, $t2
    /* 7E80C 8008E80C 01024010 */  beqz       $v0, .L8008F014
    /* 7E810 8008E810 01000524 */   addiu     $a1, $zero, 0x1
    /* 7E814 8008E814 7000AA8F */  lw         $t2, 0x70($sp)
    /* 7E818 8008E818 5800AB8F */  lw         $t3, 0x58($sp)
    /* 7E81C 8008E81C 01004231 */  andi       $v0, $t2, 0x1
    /* 7E820 8008E820 03004010 */  beqz       $v0, .L8008E830
    /* 7E824 8008E824 B000ABAF */   sw        $t3, 0xB0($sp)
    /* 7E828 8008E828 ECFF6B25 */  addiu      $t3, $t3, -0x14
    /* 7E82C 8008E82C B000ABAF */  sw         $t3, 0xB0($sp)
  .L8008E830:
    /* 7E830 8008E830 6000AB8F */  lw         $t3, 0x60($sp)
    /* 7E834 8008E834 6800B58F */  lw         $s5, 0x68($sp)
    /* 7E838 8008E838 C000A0AF */  sw         $zero, 0xC0($sp)
    /* 7E83C 8008E83C C0100B00 */  sll        $v0, $t3, 3
    /* 7E840 8008E840 23104B00 */  subu       $v0, $v0, $t3
    /* 7E844 8008E844 C0F00200 */  sll        $fp, $v0, 3
    /* 7E848 8008E848 B800ABAF */  sw         $t3, 0xB8($sp)
  .L8008E84C:
    /* 7E84C 8008E84C 5800AA8F */  lw         $t2, 0x58($sp)
    /* 7E850 8008E850 A800AB8F */  lw         $t3, 0xA8($sp)
    /* 7E854 8008E854 00000000 */  nop
    /* 7E858 8008E858 2A104B01 */  slt        $v0, $t2, $t3
    /* 7E85C 8008E85C D8014010 */  beqz       $v0, .L8008EFC0
    /* 7E860 8008E860 00000000 */   nop
    /* 7E864 8008E864 C000AA8F */  lw         $t2, 0xC0($sp)
    /* 7E868 8008E868 00000000 */  nop
    /* 7E86C 8008E86C 01004A25 */  addiu      $t2, $t2, 0x1
    /* 7E870 8008E870 0B004229 */  slti       $v0, $t2, 0xB
    /* 7E874 8008E874 D2014010 */  beqz       $v0, .L8008EFC0
    /* 7E878 8008E878 C000AAAF */   sw        $t2, 0xC0($sp)
    /* 7E87C 8008E87C 2F00A22E */  sltiu      $v0, $s5, 0x2F
    /* 7E880 8008E880 4E004010 */  beqz       $v0, .L8008E9BC
    /* 7E884 8008E884 00000000 */   nop
    /* 7E888 8008E888 B800AB8F */  lw         $t3, 0xB8($sp)
    /* 7E88C 8008E88C 00000000 */  nop
    /* 7E890 8008E890 2F00622D */  sltiu      $v0, $t3, 0x2F
    /* 7E894 8008E894 49004010 */  beqz       $v0, .L8008E9BC
    /* 7E898 8008E898 40100B00 */   sll       $v0, $t3, 1
    /* 7E89C 8008E89C 0E80033C */  lui        $v1, %hi(dungeon)
    /* 7E8A0 8008E8A0 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 7E8A4 8008E8A4 21104B00 */  addu       $v0, $v0, $t3
    /* 7E8A8 8008E8A8 40110200 */  sll        $v0, $v0, 5
    /* 7E8AC 8008E8AC 21104300 */  addu       $v0, $v0, $v1
    /* 7E8B0 8008E8B0 40181500 */  sll        $v1, $s5, 1
    /* 7E8B4 8008E8B4 21186200 */  addu       $v1, $v1, $v0
    /* 7E8B8 8008E8B8 10800A3C */  lui        $t2, %hi(dung_map + 0x187C8)
    /* 7E8BC 8008E8BC F0014A25 */  addiu      $t2, $t2, %lo(dung_map + (0x187C8 & 0xFFFF))
    /* 7E8C0 8008E8C0 2110CA03 */  addu       $v0, $fp, $t2
    /* 7E8C4 8008E8C4 21105500 */  addu       $v0, $v0, $s5
    /* 7E8C8 8008E8C8 10800B3C */  lui        $t3, %hi(dung_map_r + 0xC08)
    /* 7E8CC 8008E8CC 300E6B25 */  addiu      $t3, $t3, %lo(dung_map_r + 0xC08)
    /* 7E8D0 8008E8D0 00006694 */  lhu        $a2, 0x0($v1)
    /* 7E8D4 8008E8D4 00004290 */  lbu        $v0, 0x0($v0)
    /* 7E8D8 8008E8D8 10800A3C */  lui        $t2, %hi(dung_map_g + 0xC08)
    /* 7E8DC 8008E8DC 701A4A25 */  addiu      $t2, $t2, %lo(dung_map_g + 0xC08)
    /* 7E8E0 8008E8E0 1800A2A3 */  sb         $v0, 0x18($sp)
    /* 7E8E4 8008E8E4 2110CB03 */  addu       $v0, $fp, $t3
    /* 7E8E8 8008E8E8 21105500 */  addu       $v0, $v0, $s5
    /* 7E8EC 8008E8EC 10800B3C */  lui        $t3, %hi(dung_map_r)
    /* 7E8F0 8008E8F0 28026B25 */  addiu      $t3, $t3, %lo(dung_map_r)
    /* 7E8F4 8008E8F4 2128CB03 */  addu       $a1, $fp, $t3
    /* 7E8F8 8008E8F8 2128B500 */  addu       $a1, $a1, $s5
    /* 7E8FC 8008E8FC 10800B3C */  lui        $t3, %hi(dung_map_b)
    /* 7E900 8008E900 A81A6B25 */  addiu      $t3, $t3, %lo(dung_map_b)
    /* 7E904 8008E904 00004290 */  lbu        $v0, 0x0($v0)
    /* 7E908 8008E908 2118CB03 */  addu       $v1, $fp, $t3
    /* 7E90C 8008E90C 1900A2A3 */  sb         $v0, 0x19($sp)
    /* 7E910 8008E910 2110CA03 */  addu       $v0, $fp, $t2
    /* 7E914 8008E914 21105500 */  addu       $v0, $v0, $s5
    /* 7E918 8008E918 10800A3C */  lui        $t2, %hi(dung_map_g)
    /* 7E91C 8008E91C 680E4A25 */  addiu      $t2, $t2, %lo(dung_map_g)
    /* 7E920 8008E920 00004290 */  lbu        $v0, 0x0($v0)
    /* 7E924 8008E924 2120CA03 */  addu       $a0, $fp, $t2
    /* 7E928 8008E928 1A00A2A3 */  sb         $v0, 0x1A($sp)
    /* 7E92C 8008E92C FFFFA290 */  lbu        $v0, -0x1($a1)
    /* 7E930 8008E930 21209500 */  addu       $a0, $a0, $s5
    /* 7E934 8008E934 1C00A2A3 */  sb         $v0, 0x1C($sp)
    /* 7E938 8008E938 FFFF8290 */  lbu        $v0, -0x1($a0)
    /* 7E93C 8008E93C 21187500 */  addu       $v1, $v1, $s5
    /* 7E940 8008E940 1D00A2A3 */  sb         $v0, 0x1D($sp)
    /* 7E944 8008E944 FFFF6290 */  lbu        $v0, -0x1($v1)
    /* 7E948 8008E948 00000000 */  nop
    /* 7E94C 8008E94C 1E00A2A3 */  sb         $v0, 0x1E($sp)
    /* 7E950 8008E950 0100A290 */  lbu        $v0, 0x1($a1)
    /* 7E954 8008E954 00000000 */  nop
    /* 7E958 8008E958 2000A2A3 */  sb         $v0, 0x20($sp)
    /* 7E95C 8008E95C 01008290 */  lbu        $v0, 0x1($a0)
    /* 7E960 8008E960 00000000 */  nop
    /* 7E964 8008E964 2100A2A3 */  sb         $v0, 0x21($sp)
    /* 7E968 8008E968 01006290 */  lbu        $v0, 0x1($v1)
    /* 7E96C 8008E96C 10800A3C */  lui        $t2, %hi(dung_map_r + 0x38)
    /* 7E970 8008E970 60024A25 */  addiu      $t2, $t2, %lo(dung_map_r + 0x38)
    /* 7E974 8008E974 2200A2A3 */  sb         $v0, 0x22($sp)
    /* 7E978 8008E978 2110CA03 */  addu       $v0, $fp, $t2
    /* 7E97C 8008E97C 21105500 */  addu       $v0, $v0, $s5
    /* 7E980 8008E980 00004290 */  lbu        $v0, 0x0($v0)
    /* 7E984 8008E984 10800B3C */  lui        $t3, %hi(dung_map_g + 0x38)
    /* 7E988 8008E988 A00E6B25 */  addiu      $t3, $t3, %lo(dung_map_g + 0x38)
    /* 7E98C 8008E98C 2400A2A3 */  sb         $v0, 0x24($sp)
    /* 7E990 8008E990 2110CB03 */  addu       $v0, $fp, $t3
    /* 7E994 8008E994 21105500 */  addu       $v0, $v0, $s5
    /* 7E998 8008E998 00004290 */  lbu        $v0, 0x0($v0)
    /* 7E99C 8008E99C 10800A3C */  lui        $t2, %hi(dung_map_b + 0x38)
    /* 7E9A0 8008E9A0 E01A4A25 */  addiu      $t2, $t2, %lo(dung_map_b + 0x38)
    /* 7E9A4 8008E9A4 2500A2A3 */  sb         $v0, 0x25($sp)
    /* 7E9A8 8008E9A8 2110CA03 */  addu       $v0, $fp, $t2
    /* 7E9AC 8008E9AC 21105500 */  addu       $v0, $v0, $s5
    /* 7E9B0 8008E9B0 00004290 */  lbu        $v0, 0x0($v0)
    /* 7E9B4 8008E9B4 823A0208 */  j          .L8008EA08
    /* 7E9B8 8008E9B8 2600A2A3 */   sb        $v0, 0x26($sp)
  .L8008E9BC:
    /* 7E9BC 8008E9BC 1280023C */  lui        $v0, %hi(restore_r)
    /* 7E9C0 8008E9C0 F8B84290 */  lbu        $v0, %lo(restore_r)($v0)
    /* 7E9C4 8008E9C4 1280033C */  lui        $v1, %hi(restore_g)
    /* 7E9C8 8008E9C8 FCB86390 */  lbu        $v1, %lo(restore_g)($v1)
    /* 7E9CC 8008E9CC 1280043C */  lui        $a0, %hi(restore_b)
    /* 7E9D0 8008E9D0 00B98490 */  lbu        $a0, %lo(restore_b)($a0)
    /* 7E9D4 8008E9D4 7800A68F */  lw         $a2, 0x78($sp)
    /* 7E9D8 8008E9D8 2400A2A3 */  sb         $v0, 0x24($sp)
    /* 7E9DC 8008E9DC 2000A2A3 */  sb         $v0, 0x20($sp)
    /* 7E9E0 8008E9E0 1C00A2A3 */  sb         $v0, 0x1C($sp)
    /* 7E9E4 8008E9E4 1800A2A3 */  sb         $v0, 0x18($sp)
    /* 7E9E8 8008E9E8 2500A3A3 */  sb         $v1, 0x25($sp)
    /* 7E9EC 8008E9EC 2100A3A3 */  sb         $v1, 0x21($sp)
    /* 7E9F0 8008E9F0 1D00A3A3 */  sb         $v1, 0x1D($sp)
    /* 7E9F4 8008E9F4 1900A3A3 */  sb         $v1, 0x19($sp)
    /* 7E9F8 8008E9F8 2600A4A3 */  sb         $a0, 0x26($sp)
    /* 7E9FC 8008E9FC 2200A4A3 */  sb         $a0, 0x22($sp)
    /* 7EA00 8008EA00 1E00A4A3 */  sb         $a0, 0x1E($sp)
    /* 7EA04 8008EA04 1A00A4A3 */  sb         $a0, 0x1A($sp)
  .L8008EA08:
    /* 7EA08 8008EA08 B800AB8F */  lw         $t3, 0xB8($sp)
    /* 7EA0C 8008EA0C 00000000 */  nop
    /* 7EA10 8008EA10 FFFF6225 */  addiu      $v0, $t3, -0x1
    /* 7EA14 8008EA14 0A00401C */  bgtz       $v0, .L8008EA40
    /* 7EA18 8008EA18 00000000 */   nop
    /* 7EA1C 8008EA1C 1280023C */  lui        $v0, %hi(restore_r)
    /* 7EA20 8008EA20 F8B8428C */  lw         $v0, %lo(restore_r)($v0)
    /* 7EA24 8008EA24 1280033C */  lui        $v1, %hi(restore_g)
    /* 7EA28 8008EA28 FCB8638C */  lw         $v1, %lo(restore_g)($v1)
    /* 7EA2C 8008EA2C 1280043C */  lui        $a0, %hi(restore_b)
    /* 7EA30 8008EA30 00B9848C */  lw         $a0, %lo(restore_b)($a0)
    /* 7EA34 8008EA34 1800A2A3 */  sb         $v0, 0x18($sp)
    /* 7EA38 8008EA38 1900A3A3 */  sb         $v1, 0x19($sp)
    /* 7EA3C 8008EA3C 1A00A4A3 */  sb         $a0, 0x1A($sp)
  .L8008EA40:
    /* 7EA40 8008EA40 B800AA8F */  lw         $t2, 0xB8($sp)
    /* 7EA44 8008EA44 0800A826 */  addiu      $t0, $s5, 0x8
    /* 7EA48 8008EA48 40880800 */  sll        $s1, $t0, 1
    /* 7EA4C 8008EA4C 08004925 */  addiu      $t1, $t2, 0x8
    /* 7EA50 8008EA50 5201C010 */  beqz       $a2, .L8008EF9C
    /* 7EA54 8008EA54 40800900 */   sll       $s0, $t1, 1
    /* 7EA58 8008EA58 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 7EA5C 8008EA5C C0100600 */  sll        $v0, $a2, 3
    /* 7EA60 8008EA60 4800AB8F */  lw         $t3, 0x48($sp)
    /* 7EA64 8008EA64 8800AA8F */  lw         $t2, 0x88($sp)
    /* 7EA68 8008EA68 B800638D */  lw         $v1, 0xB8($t3)
    /* 7EA6C 8008EA6C 8000AB8F */  lw         $t3, 0x80($sp)
    /* 7EA70 8008EA70 21286200 */  addu       $a1, $v1, $v0
    /* 7EA74 8008EA74 80100600 */  sll        $v0, $a2, 2
    /* 7EA78 8008EA78 21104A00 */  addu       $v0, $v0, $t2
    /* 7EA7C 8008EA7C 0000428C */  lw         $v0, 0x0($v0)
    /* 7EA80 8008EA80 0000A384 */  lh         $v1, 0x0($a1)
    /* 7EA84 8008EA84 5000AA8F */  lw         $t2, 0x50($sp)
    /* 7EA88 8008EA88 21906201 */  addu       $s2, $t3, $v0
    /* 7EA8C 8008EA8C 21206A00 */  addu       $a0, $v1, $t2
    /* 7EA90 8008EA90 0200A384 */  lh         $v1, 0x2($a1)
    /* 7EA94 8008EA94 0400A284 */  lh         $v0, 0x4($a1)
    /* 7EA98 8008EA98 B000AB8F */  lw         $t3, 0xB0($sp)
    /* 7EA9C 8008EA9C 9000AA8F */  lw         $t2, 0x90($sp)
    /* 7EAA0 8008EAA0 21108200 */  addu       $v0, $a0, $v0
    /* 7EAA4 8008EAA4 2A104A00 */  slt        $v0, $v0, $t2
    /* 7EAA8 8008EAA8 3C014014 */  bnez       $v0, .L8008EF9C
    /* 7EAAC 8008EAAC 21186B00 */   addu      $v1, $v1, $t3
    /* 7EAB0 8008EAB0 9800AB8F */  lw         $t3, 0x98($sp)
    /* 7EAB4 8008EAB4 00000000 */  nop
    /* 7EAB8 8008EAB8 2A108B00 */  slt        $v0, $a0, $t3
    /* 7EABC 8008EABC 37014010 */  beqz       $v0, .L8008EF9C
    /* 7EAC0 8008EAC0 00000000 */   nop
    /* 7EAC4 8008EAC4 0600A284 */  lh         $v0, 0x6($a1)
    /* 7EAC8 8008EAC8 A000AA8F */  lw         $t2, 0xA0($sp)
    /* 7EACC 8008EACC 21106200 */  addu       $v0, $v1, $v0
    /* 7EAD0 8008EAD0 2A104A00 */  slt        $v0, $v0, $t2
    /* 7EAD4 8008EAD4 31014014 */  bnez       $v0, .L8008EF9C
    /* 7EAD8 8008EAD8 00000000 */   nop
    /* 7EADC 8008EADC A800AB8F */  lw         $t3, 0xA8($sp)
    /* 7EAE0 8008EAE0 00000000 */  nop
    /* 7EAE4 8008EAE4 2A106B00 */  slt        $v0, $v1, $t3
    /* 7EAE8 8008EAE8 2C014010 */  beqz       $v0, .L8008EF9C
    /* 7EAEC 8008EAEC 21380000 */   addu      $a3, $zero, $zero
    /* 7EAF0 8008EAF0 2000A293 */  lbu        $v0, 0x20($sp)
    /* 7EAF4 8008EAF4 1800A393 */  lbu        $v1, 0x18($sp)
    /* 7EAF8 8008EAF8 1900A493 */  lbu        $a0, 0x19($sp)
    /* 7EAFC 8008EAFC 23104300 */  subu       $v0, $v0, $v1
    /* 7EB00 8008EB00 2100A393 */  lbu        $v1, 0x21($sp)
    /* 7EB04 8008EB04 40120200 */  sll        $v0, $v0, 9
    /* 7EB08 8008EB08 2800A2AF */  sw         $v0, 0x28($sp)
    /* 7EB0C 8008EB0C 2200A293 */  lbu        $v0, 0x22($sp)
    /* 7EB10 8008EB10 23186400 */  subu       $v1, $v1, $a0
    /* 7EB14 8008EB14 1A00A493 */  lbu        $a0, 0x1A($sp)
    /* 7EB18 8008EB18 401A0300 */  sll        $v1, $v1, 9
    /* 7EB1C 8008EB1C 2C00A3AF */  sw         $v1, 0x2C($sp)
    /* 7EB20 8008EB20 2400A393 */  lbu        $v1, 0x24($sp)
    /* 7EB24 8008EB24 23104400 */  subu       $v0, $v0, $a0
    /* 7EB28 8008EB28 1C00A493 */  lbu        $a0, 0x1C($sp)
    /* 7EB2C 8008EB2C 40120200 */  sll        $v0, $v0, 9
    /* 7EB30 8008EB30 3000A2AF */  sw         $v0, 0x30($sp)
    /* 7EB34 8008EB34 1D00A293 */  lbu        $v0, 0x1D($sp)
    /* 7EB38 8008EB38 23186400 */  subu       $v1, $v1, $a0
    /* 7EB3C 8008EB3C 2500A493 */  lbu        $a0, 0x25($sp)
    /* 7EB40 8008EB40 401A0300 */  sll        $v1, $v1, 9
    /* 7EB44 8008EB44 3400A3AF */  sw         $v1, 0x34($sp)
    /* 7EB48 8008EB48 1E00A393 */  lbu        $v1, 0x1E($sp)
    /* 7EB4C 8008EB4C 23208200 */  subu       $a0, $a0, $v0
    /* 7EB50 8008EB50 2600A293 */  lbu        $v0, 0x26($sp)
    /* 7EB54 8008EB54 40220400 */  sll        $a0, $a0, 9
    /* 7EB58 8008EB58 3800A4AF */  sw         $a0, 0x38($sp)
    /* 7EB5C 8008EB5C 23104300 */  subu       $v0, $v0, $v1
    /* 7EB60 8008EB60 40120200 */  sll        $v0, $v0, 9
    /* 7EB64 8008EB64 00190800 */  sll        $v1, $t0, 4
    /* 7EB68 8008EB68 3C00A2AF */  sw         $v0, 0x3C($sp)
    /* 7EB6C 8008EB6C 00110900 */  sll        $v0, $t1, 4
    /* 7EB70 8008EB70 23105000 */  subu       $v0, $v0, $s0
    /* 7EB74 8008EB74 C0110200 */  sll        $v0, $v0, 7
    /* 7EB78 8008EB78 21186200 */  addu       $v1, $v1, $v0
    /* 7EB7C 8008EB7C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 7EB80 8008EB80 21082300 */  addu       $at, $at, $v1
    /* 7EB84 8008EB84 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 7EB88 8008EB88 00004A8E */  lw         $t2, 0x0($s2)
    /* 7EB8C 8008EB8C 3C004010 */  beqz       $v0, .L8008EC80
    /* 7EB90 8008EB90 C800AAAF */   sw        $t2, 0xC8($sp)
    /* 7EB94 8008EB94 0E80053C */  lui        $a1, %hi(plr + 0x32)
    /* 7EB98 8008EB98 6AA5A524 */  addiu      $a1, $a1, %lo(plr + 0x32)
    /* 7EB9C 8008EB9C 21200000 */  addu       $a0, $zero, $zero
  .L8008EBA0:
    /* 7EBA0 8008EBA0 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 7EBA4 8008EBA4 21082400 */  addu       $at, $at, $a0
    /* 7EBA8 8008EBA8 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 7EBAC 8008EBAC 00000000 */  nop
    /* 7EBB0 8008EBB0 2D004010 */  beqz       $v0, .L8008EC68
    /* 7EBB4 8008EBB4 00000000 */   nop
    /* 7EBB8 8008EBB8 0000A384 */  lh         $v1, 0x0($a1)
    /* 7EBBC 8008EBBC 00000000 */  nop
    /* 7EBC0 8008EBC0 FAFF6224 */  addiu      $v0, $v1, -0x6
    /* 7EBC4 8008EBC4 2A105100 */  slt        $v0, $v0, $s1
    /* 7EBC8 8008EBC8 11004010 */  beqz       $v0, .L8008EC10
    /* 7EBCC 8008EBCC 06006224 */   addiu     $v0, $v1, 0x6
    /* 7EBD0 8008EBD0 2A102202 */  slt        $v0, $s1, $v0
    /* 7EBD4 8008EBD4 10004010 */  beqz       $v0, .L8008EC18
    /* 7EBD8 8008EBD8 FCFF6224 */   addiu     $v0, $v1, -0x4
    /* 7EBDC 8008EBDC 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 7EBE0 8008EBE0 21082400 */  addu       $at, $at, $a0
    /* 7EBE4 8008EBE4 68A52384 */  lh         $v1, %lo(plr + 0x30)($at)
    /* 7EBE8 8008EBE8 00000000 */  nop
    /* 7EBEC 8008EBEC FAFF6224 */  addiu      $v0, $v1, -0x6
    /* 7EBF0 8008EBF0 2A105000 */  slt        $v0, $v0, $s0
    /* 7EBF4 8008EBF4 05004010 */  beqz       $v0, .L8008EC0C
    /* 7EBF8 8008EBF8 06006224 */   addiu     $v0, $v1, 0x6
    /* 7EBFC 8008EBFC 2A100202 */  slt        $v0, $s0, $v0
    /* 7EC00 8008EC00 02004010 */  beqz       $v0, .L8008EC0C
    /* 7EC04 8008EC04 00000000 */   nop
    /* 7EC08 8008EC08 01000724 */  addiu      $a3, $zero, 0x1
  .L8008EC0C:
    /* 7EC0C 8008EC0C 0000A384 */  lh         $v1, 0x0($a1)
  .L8008EC10:
    /* 7EC10 8008EC10 00000000 */  nop
    /* 7EC14 8008EC14 FCFF6224 */  addiu      $v0, $v1, -0x4
  .L8008EC18:
    /* 7EC18 8008EC18 2A105100 */  slt        $v0, $v0, $s1
    /* 7EC1C 8008EC1C 12004010 */  beqz       $v0, .L8008EC68
    /* 7EC20 8008EC20 04006224 */   addiu     $v0, $v1, 0x4
    /* 7EC24 8008EC24 2A102202 */  slt        $v0, $s1, $v0
    /* 7EC28 8008EC28 0F004010 */  beqz       $v0, .L8008EC68
    /* 7EC2C 8008EC2C 00000000 */   nop
    /* 7EC30 8008EC30 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 7EC34 8008EC34 21082400 */  addu       $at, $at, $a0
    /* 7EC38 8008EC38 68A52384 */  lh         $v1, %lo(plr + 0x30)($at)
    /* 7EC3C 8008EC3C 00000000 */  nop
    /* 7EC40 8008EC40 FCFF6224 */  addiu      $v0, $v1, -0x4
    /* 7EC44 8008EC44 2A105000 */  slt        $v0, $v0, $s0
    /* 7EC48 8008EC48 07004010 */  beqz       $v0, .L8008EC68
    /* 7EC4C 8008EC4C 04006224 */   addiu     $v0, $v1, 0x4
    /* 7EC50 8008EC50 2A100202 */  slt        $v0, $s0, $v0
    /* 7EC54 8008EC54 04004010 */  beqz       $v0, .L8008EC68
    /* 7EC58 8008EC58 00000000 */   nop
    /* 7EC5C 8008EC5C 0200E014 */  bnez       $a3, .L8008EC68
    /* 7EC60 8008EC60 00000000 */   nop
    /* 7EC64 8008EC64 01000724 */  addiu      $a3, $zero, 0x1
  .L8008EC68:
    /* 7EC68 8008EC68 E819A524 */  addiu      $a1, $a1, 0x19E8
    /* 7EC6C 8008EC6C 0E80023C */  lui        $v0, %hi(questlist + 0x32)
    /* 7EC70 8008EC70 3AD94224 */  addiu      $v0, $v0, %lo(questlist + 0x32)
    /* 7EC74 8008EC74 2A10A200 */  slt        $v0, $a1, $v0
    /* 7EC78 8008EC78 C9FF4014 */  bnez       $v0, .L8008EBA0
    /* 7EC7C 8008EC7C E8198424 */   addiu     $a0, $a0, 0x19E8
  .L8008EC80:
    /* 7EC80 8008EC80 4800AB8F */  lw         $t3, 0x48($sp)
    /* 7EC84 8008EC84 5000A58F */  lw         $a1, 0x50($sp)
    /* 7EC88 8008EC88 B000A68F */  lw         $a2, 0xB0($sp)
    /* 7EC8C 8008EC8C 7B43000C */  jal        ABL_SetBlockRGBXY
    /* 7EC90 8008EC90 F0006425 */   addiu     $a0, $t3, 0xF0
    /* 7EC94 8008EC94 C800AA8F */  lw         $t2, 0xC8($sp)
    /* 7EC98 8008EC98 B000AB8F */  lw         $t3, 0xB0($sp)
    /* 7EC9C 8008EC9C C0100A00 */  sll        $v0, $t2, 3
    /* 7ECA0 8008ECA0 FCFF4224 */  addiu      $v0, $v0, -0x4
    /* 7ECA4 8008ECA4 21B04202 */  addu       $s6, $s2, $v0
    /* 7ECA8 8008ECA8 D8FF7425 */  addiu      $s4, $t3, -0x28
    /* 7ECAC 8008ECAC BDFF822A */  slti       $v0, $s4, -0x43
    /* 7ECB0 8008ECB0 03004010 */  beqz       $v0, .L8008ECC0
    /* 7ECB4 8008ECB4 9C01822A */   slti      $v0, $s4, 0x19C
    /* 7ECB8 8008ECB8 BDFF1424 */  addiu      $s4, $zero, -0x43
    /* 7ECBC 8008ECBC 9C01822A */  slti       $v0, $s4, 0x19C
  .L8008ECC0:
    /* 7ECC0 8008ECC0 03004014 */  bnez       $v0, .L8008ECD0
    /* 7ECC4 8008ECC4 4D009426 */   addiu     $s4, $s4, 0x4D
    /* 7ECC8 8008ECC8 9B011424 */  addiu      $s4, $zero, 0x19B
    /* 7ECCC 8008ECCC 4D009426 */  addiu      $s4, $s4, 0x4D
  .L8008ECD0:
    /* 7ECD0 8008ECD0 FF00123C */  lui        $s2, (0xFFFFFF >> 16)
    /* 7ECD4 8008ECD4 FFFF5236 */  ori        $s2, $s2, (0xFFFFFF & 0xFFFF)
    /* 7ECD8 8008ECD8 00FF083C */  lui        $t0, (0xFF000000 >> 16)
    /* 7ECDC 8008ECDC 1800B727 */  addiu      $s7, $sp, 0x18
    /* 7ECE0 8008ECE0 C0101100 */  sll        $v0, $s1, 3
    /* 7ECE4 8008ECE4 C0181000 */  sll        $v1, $s0, 3
    /* 7ECE8 8008ECE8 23187000 */  subu       $v1, $v1, $s0
    /* 7ECEC 8008ECEC C0190300 */  sll        $v1, $v1, 7
    /* 7ECF0 8008ECF0 21104300 */  addu       $v0, $v0, $v1
    /* 7ECF4 8008ECF4 D800A0AF */  sw         $zero, 0xD8($sp)
    /* 7ECF8 8008ECF8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 7ECFC 8008ECFC 21082200 */  addu       $at, $at, $v0
    /* 7ED00 8008ED00 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 7ED04 8008ED04 0600D126 */  addiu      $s1, $s6, 0x6
    /* 7ED08 8008ED08 42110200 */  srl        $v0, $v0, 5
    /* 7ED0C 8008ED0C 01004230 */  andi       $v0, $v0, 0x1
    /* 7ED10 8008ED10 D000A2AF */  sw         $v0, 0xD0($sp)
  .L8008ED14:
    /* 7ED14 8008ED14 D800AA8F */  lw         $t2, 0xD8($sp)
    /* 7ED18 8008ED18 C800AB8F */  lw         $t3, 0xC8($sp)
    /* 7ED1C 8008ED1C 00000000 */  nop
    /* 7ED20 8008ED20 2A104B01 */  slt        $v0, $t2, $t3
    /* 7ED24 8008ED24 9D004010 */  beqz       $v0, .L8008EF9C
    /* 7ED28 8008ED28 4000A427 */   addiu     $a0, $sp, 0x40
    /* 7ED2C 8008ED2C 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7ED30 8008ED30 0000C28E */  lw         $v0, 0x0($s6)
    /* 7ED34 8008ED34 B000438D */  lw         $v1, 0xB0($t2)
    /* 7ED38 8008ED38 00110200 */  sll        $v0, $v0, 4
    /* 7ED3C 8008ED3C E000A8AF */  sw         $t0, 0xE0($sp)
    /* 7ED40 8008ED40 D046020C */  jal        PRIM_GetPrim__FPP8POLY_GT4
    /* 7ED44 8008ED44 21806200 */   addu      $s0, $v1, $v0
    /* 7ED48 8008ED48 2120C002 */  addu       $a0, $s6, $zero
    /* 7ED4C 8008ED4C 4000A68F */  lw         $a2, 0x40($sp)
    /* 7ED50 8008ED50 8043000C */  jal        ABL_PrintPart
    /* 7ED54 8008ED54 21280002 */   addu      $a1, $s0, $zero
    /* 7ED58 8008ED58 0F000392 */  lbu        $v1, 0xF($s0)
    /* 7ED5C 8008ED5C E000A88F */  lw         $t0, 0xE0($sp)
    /* 7ED60 8008ED60 10006230 */  andi       $v0, $v1, 0x10
    /* 7ED64 8008ED64 10004010 */  beqz       $v0, .L8008EDA8
    /* 7ED68 8008ED68 01006230 */   andi      $v0, $v1, 0x1
    /* 7ED6C 8008ED6C 4000A48F */  lw         $a0, 0x40($sp)
    /* 7ED70 8008ED70 1280053C */  lui        $a1, %hi(ThisOt)
    /* 7ED74 8008ED74 B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 7ED78 8008ED78 0000838C */  lw         $v1, 0x0($a0)
    /* 7ED7C 8008ED7C 0400A28C */  lw         $v0, 0x4($a1)
    /* 7ED80 8008ED80 24186800 */  and        $v1, $v1, $t0
    /* 7ED84 8008ED84 24105200 */  and        $v0, $v0, $s2
    /* 7ED88 8008ED88 25186200 */  or         $v1, $v1, $v0
    /* 7ED8C 8008ED8C 000083AC */  sw         $v1, 0x0($a0)
    /* 7ED90 8008ED90 0400A28C */  lw         $v0, 0x4($a1)
    /* 7ED94 8008ED94 24209200 */  and        $a0, $a0, $s2
    /* 7ED98 8008ED98 24104800 */  and        $v0, $v0, $t0
    /* 7ED9C 8008ED9C 25104400 */  or         $v0, $v0, $a0
    /* 7EDA0 8008EDA0 8A3B0208 */  j          .L8008EE28
    /* 7EDA4 8008EDA4 0400A2AC */   sw        $v0, 0x4($a1)
  .L8008EDA8:
    /* 7EDA8 8008EDA8 10004010 */  beqz       $v0, .L8008EDEC
    /* 7EDAC 8008EDAC 80201400 */   sll       $a0, $s4, 2
    /* 7EDB0 8008EDB0 4000A48F */  lw         $a0, 0x40($sp)
    /* 7EDB4 8008EDB4 1280053C */  lui        $a1, %hi(ThisOt)
    /* 7EDB8 8008EDB8 B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 7EDBC 8008EDBC 0000838C */  lw         $v1, 0x0($a0)
    /* 7EDC0 8008EDC0 0C00A28C */  lw         $v0, 0xC($a1)
    /* 7EDC4 8008EDC4 24186800 */  and        $v1, $v1, $t0
    /* 7EDC8 8008EDC8 24105200 */  and        $v0, $v0, $s2
    /* 7EDCC 8008EDCC 25186200 */  or         $v1, $v1, $v0
    /* 7EDD0 8008EDD0 000083AC */  sw         $v1, 0x0($a0)
    /* 7EDD4 8008EDD4 0C00A28C */  lw         $v0, 0xC($a1)
    /* 7EDD8 8008EDD8 24209200 */  and        $a0, $a0, $s2
    /* 7EDDC 8008EDDC 24104800 */  and        $v0, $v0, $t0
    /* 7EDE0 8008EDE0 25104400 */  or         $v0, $v0, $a0
    /* 7EDE4 8008EDE4 8A3B0208 */  j          .L8008EE28
    /* 7EDE8 8008EDE8 0C00A2AC */   sw        $v0, 0xC($a1)
  .L8008EDEC:
    /* 7EDEC 8008EDEC 1280023C */  lui        $v0, %hi(ThisOt)
    /* 7EDF0 8008EDF0 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 7EDF4 8008EDF4 4000A58F */  lw         $a1, 0x40($sp)
    /* 7EDF8 8008EDF8 21208200 */  addu       $a0, $a0, $v0
    /* 7EDFC 8008EDFC 0000A38C */  lw         $v1, 0x0($a1)
    /* 7EE00 8008EE00 0000828C */  lw         $v0, 0x0($a0)
    /* 7EE04 8008EE04 24186800 */  and        $v1, $v1, $t0
    /* 7EE08 8008EE08 24105200 */  and        $v0, $v0, $s2
    /* 7EE0C 8008EE0C 25186200 */  or         $v1, $v1, $v0
    /* 7EE10 8008EE10 0000A3AC */  sw         $v1, 0x0($a1)
    /* 7EE14 8008EE14 0000828C */  lw         $v0, 0x0($a0)
    /* 7EE18 8008EE18 2428B200 */  and        $a1, $a1, $s2
    /* 7EE1C 8008EE1C 24104800 */  and        $v0, $v0, $t0
    /* 7EE20 8008EE20 25104500 */  or         $v0, $v0, $a1
    /* 7EE24 8008EE24 000082AC */  sw         $v0, 0x0($a0)
  .L8008EE28:
    /* 7EE28 8008EE28 0C001392 */  lbu        $s3, 0xC($s0)
    /* 7EE2C 8008EE2C D000AB8F */  lw         $t3, 0xD0($sp)
    /* 7EE30 8008EE30 0D001092 */  lbu        $s0, 0xD($s0)
    /* 7EE34 8008EE34 2D006011 */  beqz       $t3, .L8008EEEC
    /* 7EE38 8008EE38 80000A24 */   addiu     $t2, $zero, 0x80
    /* 7EE3C 8008EE3C 1800A393 */  lbu        $v1, 0x18($sp)
    /* 7EE40 8008EE40 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EE44 8008EE44 1900A493 */  lbu        $a0, 0x19($sp)
    /* 7EE48 8008EE48 1A00A593 */  lbu        $a1, 0x1A($sp)
    /* 7EE4C 8008EE4C 040043A0 */  sb         $v1, 0x4($v0)
    /* 7EE50 8008EE50 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EE54 8008EE54 00000000 */  nop
    /* 7EE58 8008EE58 050044A0 */  sb         $a0, 0x5($v0)
    /* 7EE5C 8008EE5C 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EE60 8008EE60 00000000 */  nop
    /* 7EE64 8008EE64 060045A0 */  sb         $a1, 0x6($v0)
    /* 7EE68 8008EE68 1C00A393 */  lbu        $v1, 0x1C($sp)
    /* 7EE6C 8008EE6C 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EE70 8008EE70 1D00A493 */  lbu        $a0, 0x1D($sp)
    /* 7EE74 8008EE74 1E00A593 */  lbu        $a1, 0x1E($sp)
    /* 7EE78 8008EE78 100043A0 */  sb         $v1, 0x10($v0)
    /* 7EE7C 8008EE7C 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EE80 8008EE80 00000000 */  nop
    /* 7EE84 8008EE84 110044A0 */  sb         $a0, 0x11($v0)
    /* 7EE88 8008EE88 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EE8C 8008EE8C 00000000 */  nop
    /* 7EE90 8008EE90 120045A0 */  sb         $a1, 0x12($v0)
    /* 7EE94 8008EE94 2000A393 */  lbu        $v1, 0x20($sp)
    /* 7EE98 8008EE98 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EE9C 8008EE9C 2100A493 */  lbu        $a0, 0x21($sp)
    /* 7EEA0 8008EEA0 2200A593 */  lbu        $a1, 0x22($sp)
    /* 7EEA4 8008EEA4 1C0043A0 */  sb         $v1, 0x1C($v0)
    /* 7EEA8 8008EEA8 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EEAC 8008EEAC 00000000 */  nop
    /* 7EEB0 8008EEB0 1D0044A0 */  sb         $a0, 0x1D($v0)
    /* 7EEB4 8008EEB4 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EEB8 8008EEB8 00000000 */  nop
    /* 7EEBC 8008EEBC 1E0045A0 */  sb         $a1, 0x1E($v0)
    /* 7EEC0 8008EEC0 2400A393 */  lbu        $v1, 0x24($sp)
    /* 7EEC4 8008EEC4 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EEC8 8008EEC8 2500A493 */  lbu        $a0, 0x25($sp)
    /* 7EECC 8008EECC 2600A593 */  lbu        $a1, 0x26($sp)
    /* 7EED0 8008EED0 280043A0 */  sb         $v1, 0x28($v0)
    /* 7EED4 8008EED4 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EED8 8008EED8 00000000 */  nop
    /* 7EEDC 8008EEDC 290044A0 */  sb         $a0, 0x29($v0)
    /* 7EEE0 8008EEE0 4000A28F */  lw         $v0, 0x40($sp)
    /* 7EEE4 8008EEE4 E13B0208 */  j          .L8008EF84
    /* 7EEE8 8008EEE8 2A0045A0 */   sb        $a1, 0x2A($v0)
  .L8008EEEC:
    /* 7EEEC 8008EEEC FEFF2586 */  lh         $a1, -0x2($s1)
    /* 7EEF0 8008EEF0 00002686 */  lh         $a2, 0x0($s1)
    /* 7EEF4 8008EEF4 4000A78F */  lw         $a3, 0x40($sp)
    /* 7EEF8 8008EEF8 4800A48F */  lw         $a0, 0x48($sp)
    /* 7EEFC 8008EEFC 1000B7AF */  sw         $s7, 0x10($sp)
    /* 7EF00 8008EF00 E000A8AF */  sw         $t0, 0xE0($sp)
    /* 7EF04 8008EF04 23304601 */  subu       $a2, $t2, $a2
    /* 7EF08 8008EF08 FA38020C */  jal        GetGCol__7CBlocksiiPUcP7RGBData
    /* 7EF0C 8008EF0C 0400E724 */   addiu     $a3, $a3, 0x4
    /* 7EF10 8008EF10 FEFF2586 */  lh         $a1, -0x2($s1)
    /* 7EF14 8008EF14 00002686 */  lh         $a2, 0x0($s1)
    /* 7EF18 8008EF18 4000A78F */  lw         $a3, 0x40($sp)
    /* 7EF1C 8008EF1C 4800A48F */  lw         $a0, 0x48($sp)
    /* 7EF20 8008EF20 80000B24 */  addiu      $t3, $zero, 0x80
    /* 7EF24 8008EF24 1000B7AF */  sw         $s7, 0x10($sp)
    /* 7EF28 8008EF28 2128B300 */  addu       $a1, $a1, $s3
    /* 7EF2C 8008EF2C 23306601 */  subu       $a2, $t3, $a2
    /* 7EF30 8008EF30 FA38020C */  jal        GetGCol__7CBlocksiiPUcP7RGBData
    /* 7EF34 8008EF34 1000E724 */   addiu     $a3, $a3, 0x10
    /* 7EF38 8008EF38 FEFF2586 */  lh         $a1, -0x2($s1)
    /* 7EF3C 8008EF3C 00002686 */  lh         $a2, 0x0($s1)
    /* 7EF40 8008EF40 4000A78F */  lw         $a3, 0x40($sp)
    /* 7EF44 8008EF44 4800A48F */  lw         $a0, 0x48($sp)
    /* 7EF48 8008EF48 80001026 */  addiu      $s0, $s0, 0x80
    /* 7EF4C 8008EF4C 1000B7AF */  sw         $s7, 0x10($sp)
    /* 7EF50 8008EF50 23300602 */  subu       $a2, $s0, $a2
    /* 7EF54 8008EF54 FA38020C */  jal        GetGCol__7CBlocksiiPUcP7RGBData
    /* 7EF58 8008EF58 1C00E724 */   addiu     $a3, $a3, 0x1C
    /* 7EF5C 8008EF5C FEFF2586 */  lh         $a1, -0x2($s1)
    /* 7EF60 8008EF60 00002686 */  lh         $a2, 0x0($s1)
    /* 7EF64 8008EF64 4000A78F */  lw         $a3, 0x40($sp)
    /* 7EF68 8008EF68 4800A48F */  lw         $a0, 0x48($sp)
    /* 7EF6C 8008EF6C 1000B7AF */  sw         $s7, 0x10($sp)
    /* 7EF70 8008EF70 2128B300 */  addu       $a1, $a1, $s3
    /* 7EF74 8008EF74 23300602 */  subu       $a2, $s0, $a2
    /* 7EF78 8008EF78 FA38020C */  jal        GetGCol__7CBlocksiiPUcP7RGBData
    /* 7EF7C 8008EF7C 2800E724 */   addiu     $a3, $a3, 0x28
    /* 7EF80 8008EF80 E000A88F */  lw         $t0, 0xE0($sp)
  .L8008EF84:
    /* 7EF84 8008EF84 F8FF3126 */  addiu      $s1, $s1, -0x8
    /* 7EF88 8008EF88 D800AA8F */  lw         $t2, 0xD8($sp)
    /* 7EF8C 8008EF8C F8FFD626 */  addiu      $s6, $s6, -0x8
    /* 7EF90 8008EF90 01004A25 */  addiu      $t2, $t2, 0x1
    /* 7EF94 8008EF94 453B0208 */  j          .L8008ED14
    /* 7EF98 8008EF98 D800AAAF */   sw        $t2, 0xD8($sp)
  .L8008EF9C:
    /* 7EF9C 8008EF9C 3800DE27 */  addiu      $fp, $fp, 0x38
    /* 7EFA0 8008EFA0 0100B526 */  addiu      $s5, $s5, 0x1
    /* 7EFA4 8008EFA4 B800AB8F */  lw         $t3, 0xB8($sp)
    /* 7EFA8 8008EFA8 B000AA8F */  lw         $t2, 0xB0($sp)
    /* 7EFAC 8008EFAC 01006B25 */  addiu      $t3, $t3, 0x1
    /* 7EFB0 8008EFB0 28004A25 */  addiu      $t2, $t2, 0x28
    /* 7EFB4 8008EFB4 B800ABAF */  sw         $t3, 0xB8($sp)
    /* 7EFB8 8008EFB8 133A0208 */  j          .L8008E84C
    /* 7EFBC 8008EFBC B000AAAF */   sw        $t2, 0xB0($sp)
  .L8008EFC0:
    /* 7EFC0 8008EFC0 7000AB8F */  lw         $t3, 0x70($sp)
    /* 7EFC4 8008EFC4 00000000 */  nop
    /* 7EFC8 8008EFC8 01006231 */  andi       $v0, $t3, 0x1
    /* 7EFCC 8008EFCC 06004014 */  bnez       $v0, .L8008EFE8
    /* 7EFD0 8008EFD0 00000000 */   nop
    /* 7EFD4 8008EFD4 6800AA8F */  lw         $t2, 0x68($sp)
    /* 7EFD8 8008EFD8 00000000 */  nop
    /* 7EFDC 8008EFDC FFFF4A25 */  addiu      $t2, $t2, -0x1
    /* 7EFE0 8008EFE0 FE3B0208 */  j          .L8008EFF8
    /* 7EFE4 8008EFE4 6800AAAF */   sw        $t2, 0x68($sp)
  .L8008EFE8:
    /* 7EFE8 8008EFE8 6000AB8F */  lw         $t3, 0x60($sp)
    /* 7EFEC 8008EFEC 00000000 */  nop
    /* 7EFF0 8008EFF0 01006B25 */  addiu      $t3, $t3, 0x1
    /* 7EFF4 8008EFF4 6000ABAF */  sw         $t3, 0x60($sp)
  .L8008EFF8:
    /* 7EFF8 8008EFF8 5000AA8F */  lw         $t2, 0x50($sp)
    /* 7EFFC 8008EFFC 7000AB8F */  lw         $t3, 0x70($sp)
    /* 7F000 8008F000 28004A25 */  addiu      $t2, $t2, 0x28
    /* 7F004 8008F004 01006B25 */  addiu      $t3, $t3, 0x1
    /* 7F008 8008F008 5000AAAF */  sw         $t2, 0x50($sp)
    /* 7F00C 8008F00C FF390208 */  j          .L8008E7FC
    /* 7F010 8008F010 7000ABAF */   sw        $t3, 0x70($sp)
  .L8008F014:
    /* 7F014 8008F014 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7F018 8008F018 7B0E020C */  jal        PRIM_Clip__FP4RECTi
    /* 7F01C 8008F01C C0004425 */   addiu     $a0, $t2, 0xC0
    /* 7F020 8008F020 C80E020C */  jal        PRIM_FullScreen__Fi
    /* 7F024 8008F024 64000424 */   addiu     $a0, $zero, 0x64
    /* 7F028 8008F028 4800AB8F */  lw         $t3, 0x48($sp)
    /* 7F02C 8008F02C 00000000 */  nop
    /* 7F030 8008F030 2000648D */  lw         $a0, 0x20($t3)
    /* 7F034 8008F034 F785000C */  jal        GAL_Unlock
    /* 7F038 8008F038 00000000 */   nop
    /* 7F03C 8008F03C 4800AA8F */  lw         $t2, 0x48($sp)
    /* 7F040 8008F040 00000000 */  nop
    /* 7F044 8008F044 2000428D */  lw         $v0, 0x20($t2)
    /* 7F048 8008F048 00000000 */  nop
    /* 7F04C 8008F04C 05004014 */  bnez       $v0, .L8008F064
    /* 7F050 8008F050 21200000 */   addu      $a0, $zero, $zero
    /* 7F054 8008F054 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7F058 8008F058 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7F05C 8008F05C A583000C */  jal        DBG_Error
    /* 7F060 8008F060 3D050624 */   addiu     $a2, $zero, 0x53D
  .L8008F064:
    /* 7F064 8008F064 0C01BF8F */  lw         $ra, 0x10C($sp)
    /* 7F068 8008F068 0801BE8F */  lw         $fp, 0x108($sp)
    /* 7F06C 8008F06C 0401B78F */  lw         $s7, 0x104($sp)
    /* 7F070 8008F070 0001B68F */  lw         $s6, 0x100($sp)
    /* 7F074 8008F074 FC00B58F */  lw         $s5, 0xFC($sp)
    /* 7F078 8008F078 F800B48F */  lw         $s4, 0xF8($sp)
    /* 7F07C 8008F07C F400B38F */  lw         $s3, 0xF4($sp)
    /* 7F080 8008F080 F000B28F */  lw         $s2, 0xF0($sp)
    /* 7F084 8008F084 EC00B18F */  lw         $s1, 0xEC($sp)
    /* 7F088 8008F088 E800B08F */  lw         $s0, 0xE8($sp)
    /* 7F08C 8008F08C 1001BD27 */  addiu      $sp, $sp, 0x110
    /* 7F090 8008F090 0800E003 */  jr         $ra
    /* 7F094 8008F094 00000000 */   nop
endlabel PrintMap__7CBlocksii
