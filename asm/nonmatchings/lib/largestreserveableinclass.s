.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching largestreserveableinclass, 0x98

glabel largestreserveableinclass
    /* 1B5D8 8002B5D8 000F8430 */  andi       $a0, $a0, 0xF00
    /* 1B5DC 8002B5DC 03220400 */  sra        $a0, $a0, 8
    /* 1B5E0 8002B5E0 40100400 */  sll        $v0, $a0, 1
    /* 1B5E4 8002B5E4 21104400 */  addu       $v0, $v0, $a0
    /* 1B5E8 8002B5E8 C0100200 */  sll        $v0, $v0, 3
    /* 1B5EC 8002B5EC 1380033C */  lui        $v1, %hi(memclass)
    /* 1B5F0 8002B5F0 307A6324 */  addiu      $v1, $v1, %lo(memclass)
    /* 1B5F4 8002B5F4 21104300 */  addu       $v0, $v0, $v1
    /* 1B5F8 8002B5F8 0000448C */  lw         $a0, 0x0($v0)
    /* 1B5FC 8002B5FC 0400428C */  lw         $v0, 0x4($v0)
    /* 1B600 8002B600 21400000 */  addu       $t0, $zero, $zero
    /* 1B604 8002B604 2000878C */  lw         $a3, 0x20($a0)
    /* 1B608 8002B608 17008210 */  beq        $a0, $v0, .L8002B668
    /* 1B60C 8002B60C 21300000 */   addu      $a2, $zero, $zero
    /* 1B610 8002B610 21484000 */  addu       $t1, $v0, $zero
  .L8002B614:
    /* 1B614 8002B614 0000838C */  lw         $v1, 0x0($a0)
    /* 1B618 8002B618 1000858C */  lw         $a1, 0x10($a0)
    /* 1B61C 8002B61C 0000E28C */  lw         $v0, 0x0($a3)
    /* 1B620 8002B620 1800E48C */  lw         $a0, 0x18($a3)
    /* 1B624 8002B624 21186500 */  addu       $v1, $v1, $a1
    /* 1B628 8002B628 23104300 */  subu       $v0, $v0, $v1
    /* 1B62C 8002B62C 08008430 */  andi       $a0, $a0, 0x8
    /* 1B630 8002B630 04008010 */  beqz       $a0, .L8002B644
    /* 1B634 8002B634 2130C200 */   addu      $a2, $a2, $v0
    /* 1B638 8002B638 1000E28C */  lw         $v0, 0x10($a3)
    /* 1B63C 8002B63C 96AD0008 */  j          .L8002B658
    /* 1B640 8002B640 2130C200 */   addu      $a2, $a2, $v0
  .L8002B644:
    /* 1B644 8002B644 2A100601 */  slt        $v0, $t0, $a2
    /* 1B648 8002B648 02004010 */  beqz       $v0, .L8002B654
    /* 1B64C 8002B64C 00000000 */   nop
    /* 1B650 8002B650 2140C000 */  addu       $t0, $a2, $zero
  .L8002B654:
    /* 1B654 8002B654 21300000 */  addu       $a2, $zero, $zero
  .L8002B658:
    /* 1B658 8002B658 2120E000 */  addu       $a0, $a3, $zero
    /* 1B65C 8002B65C 2000878C */  lw         $a3, 0x20($a0)
    /* 1B660 8002B660 ECFF8914 */  bne        $a0, $t1, .L8002B614
    /* 1B664 8002B664 00000000 */   nop
  .L8002B668:
    /* 1B668 8002B668 0800E003 */  jr         $ra
    /* 1B66C 8002B66C 21100001 */   addu      $v0, $t0, $zero
endlabel largestreserveableinclass
