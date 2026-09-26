.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DL2_NumNoChar__Fv, 0x5C

glabel DL2_NumNoChar__Fv
    /* BA40 80145638 21300000 */  addu       $a2, $zero, $zero
    /* BA44 8014563C 21280000 */  addu       $a1, $zero, $zero
    /* BA48 80145640 1480083C */  lui        $t0, %hi(predungeon)
    /* BA4C 80145644 C82D0825 */  addiu      $t0, $t0, %lo(predungeon)
    /* BA50 80145648 20000724 */  addiu      $a3, $zero, 0x20
  .L8014564C:
    /* BA54 8014564C 21200000 */  addu       $a0, $zero, $zero
    /* BA58 80145650 21180001 */  addu       $v1, $t0, $zero
  .L80145654:
    /* BA5C 80145654 21106500 */  addu       $v0, $v1, $a1
    /* BA60 80145658 00004290 */  lbu        $v0, 0x0($v0)
    /* BA64 8014565C 00000000 */  nop
    /* BA68 80145660 02004714 */  bne        $v0, $a3, .L8014566C
    /* BA6C 80145664 00000000 */   nop
    /* BA70 80145668 0100C624 */  addiu      $a2, $a2, 0x1
  .L8014566C:
    /* BA74 8014566C 01008424 */  addiu      $a0, $a0, 0x1
    /* BA78 80145670 28008228 */  slti       $v0, $a0, 0x28
    /* BA7C 80145674 F7FF4014 */  bnez       $v0, .L80145654
    /* BA80 80145678 28006324 */   addiu     $v1, $v1, 0x28
    /* BA84 8014567C 0100A524 */  addiu      $a1, $a1, 0x1
    /* BA88 80145680 2800A228 */  slti       $v0, $a1, 0x28
    /* BA8C 80145684 F1FF4014 */  bnez       $v0, .L8014564C
    /* BA90 80145688 00000000 */   nop
    /* BA94 8014568C 0800E003 */  jr         $ra
    /* BA98 80145690 2110C000 */   addu      $v0, $a2, $zero
endlabel DL2_NumNoChar__Fv
