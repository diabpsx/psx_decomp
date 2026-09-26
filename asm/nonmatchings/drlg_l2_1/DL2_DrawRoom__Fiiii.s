.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DL2_DrawRoom__Fiiii, 0x104

glabel DL2_DrawRoom__Fiiii
    /* BA9C 80145694 2A10E500 */  slt        $v0, $a3, $a1
    /* BAA0 80145698 2B004014 */  bnez       $v0, .L80145748
    /* BAA4 8014569C 2148A000 */   addu      $t1, $a1, $zero
    /* BAA8 801456A0 14800B3C */  lui        $t3, %hi(predungeon)
    /* BAAC 801456A4 C82D6B25 */  addiu      $t3, $t3, %lo(predungeon)
    /* BAB0 801456A8 2E000A24 */  addiu      $t2, $zero, 0x2E
  .L801456AC:
    /* BAB4 801456AC 21408000 */  addu       $t0, $a0, $zero
    /* BAB8 801456B0 2A10C400 */  slt        $v0, $a2, $a0
    /* BABC 801456B4 0A004014 */  bnez       $v0, .L801456E0
    /* BAC0 801456B8 80100800 */   sll       $v0, $t0, 2
    /* BAC4 801456BC 21104800 */  addu       $v0, $v0, $t0
    /* BAC8 801456C0 C0100200 */  sll        $v0, $v0, 3
    /* BACC 801456C4 21184B00 */  addu       $v1, $v0, $t3
  .L801456C8:
    /* BAD0 801456C8 21106900 */  addu       $v0, $v1, $t1
    /* BAD4 801456CC 00004AA0 */  sb         $t2, 0x0($v0)
    /* BAD8 801456D0 01000825 */  addiu      $t0, $t0, 0x1
    /* BADC 801456D4 2A10C800 */  slt        $v0, $a2, $t0
    /* BAE0 801456D8 FBFF4010 */  beqz       $v0, .L801456C8
    /* BAE4 801456DC 28006324 */   addiu     $v1, $v1, 0x28
  .L801456E0:
    /* BAE8 801456E0 01002925 */  addiu      $t1, $t1, 0x1
    /* BAEC 801456E4 2A10E900 */  slt        $v0, $a3, $t1
    /* BAF0 801456E8 F0FF4010 */  beqz       $v0, .L801456AC
    /* BAF4 801456EC 2A10E500 */   slt       $v0, $a3, $a1
    /* BAF8 801456F0 15004014 */  bnez       $v0, .L80145748
    /* BAFC 801456F4 2148A000 */   addu      $t1, $a1, $zero
    /* BB00 801456F8 23000A24 */  addiu      $t2, $zero, 0x23
    /* BB04 801456FC 1480023C */  lui        $v0, %hi(predungeon)
    /* BB08 80145700 C82D4224 */  addiu      $v0, $v0, %lo(predungeon)
    /* BB0C 80145704 80180600 */  sll        $v1, $a2, 2
    /* BB10 80145708 21186600 */  addu       $v1, $v1, $a2
    /* BB14 8014570C C0180300 */  sll        $v1, $v1, 3
    /* BB18 80145710 21186200 */  addu       $v1, $v1, $v0
    /* BB1C 80145714 2140A300 */  addu       $t0, $a1, $v1
    /* BB20 80145718 80180400 */  sll        $v1, $a0, 2
    /* BB24 8014571C 21186400 */  addu       $v1, $v1, $a0
    /* BB28 80145720 C0180300 */  sll        $v1, $v1, 3
    /* BB2C 80145724 21186200 */  addu       $v1, $v1, $v0
    /* BB30 80145728 2118A300 */  addu       $v1, $a1, $v1
  .L8014572C:
    /* BB34 8014572C 00006AA0 */  sb         $t2, 0x0($v1)
    /* BB38 80145730 00000AA1 */  sb         $t2, 0x0($t0)
    /* BB3C 80145734 01000825 */  addiu      $t0, $t0, 0x1
    /* BB40 80145738 01002925 */  addiu      $t1, $t1, 0x1
    /* BB44 8014573C 2A10E900 */  slt        $v0, $a3, $t1
    /* BB48 80145740 FAFF4010 */  beqz       $v0, .L8014572C
    /* BB4C 80145744 01006324 */   addiu     $v1, $v1, 0x1
  .L80145748:
    /* BB50 80145748 21408000 */  addu       $t0, $a0, $zero
    /* BB54 8014574C 2A10C800 */  slt        $v0, $a2, $t0
    /* BB58 80145750 0F004014 */  bnez       $v0, .L80145790
    /* BB5C 80145754 80100800 */   sll       $v0, $t0, 2
    /* BB60 80145758 23000924 */  addiu      $t1, $zero, 0x23
    /* BB64 8014575C 1480033C */  lui        $v1, %hi(predungeon)
    /* BB68 80145760 C82D6324 */  addiu      $v1, $v1, %lo(predungeon)
    /* BB6C 80145764 21104800 */  addu       $v0, $v0, $t0
    /* BB70 80145768 C0100200 */  sll        $v0, $v0, 3
    /* BB74 8014576C 21204300 */  addu       $a0, $v0, $v1
  .L80145770:
    /* BB78 80145770 21108500 */  addu       $v0, $a0, $a1
    /* BB7C 80145774 21188700 */  addu       $v1, $a0, $a3
    /* BB80 80145778 28008424 */  addiu      $a0, $a0, 0x28
    /* BB84 8014577C 01000825 */  addiu      $t0, $t0, 0x1
    /* BB88 80145780 000049A0 */  sb         $t1, 0x0($v0)
    /* BB8C 80145784 2A10C800 */  slt        $v0, $a2, $t0
    /* BB90 80145788 F9FF4010 */  beqz       $v0, .L80145770
    /* BB94 8014578C 000069A0 */   sb        $t1, 0x0($v1)
  .L80145790:
    /* BB98 80145790 0800E003 */  jr         $ra
    /* BB9C 80145794 00000000 */   nop
endlabel DL2_DrawRoom__Fiiii
