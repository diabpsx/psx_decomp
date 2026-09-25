.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching crunch, 0x100

glabel crunch
    /* 5D4 800105D4 FCFFBFAF */  sw         $ra, -0x4($sp)
    /* 5D8 800105D8 FCFFBD27 */  addiu      $sp, $sp, -0x4
    /* 5DC 800105DC 21408000 */  addu       $t0, $a0, $zero
    /* 5E0 800105E0 21488000 */  addu       $t1, $a0, $zero
    /* 5E4 800105E4 21482601 */  addu       $t1, $t1, $a2
    /* 5E8 800105E8 2150A000 */  addu       $t2, $a1, $zero
    /* 5EC 800105EC FCFFA5AF */  sw         $a1, -0x4($sp)
    /* 5F0 800105F0 FCFFBD27 */  addiu      $sp, $sp, -0x4
    /* 5F4 800105F4 0180063C */  lui        $a2, %hi(D_80010AC0)
    /* 5F8 800105F8 C00AC624 */  addiu      $a2, $a2, %lo(D_80010AC0)
    /* 5FC 800105FC 00000000 */  nop
    /* 600 80010600 0000C7AC */  sw         $a3, 0x0($a2)
    /* 604 80010604 0180063C */  lui        $a2, %hi(D_80010AB8)
    /* 608 80010608 B80AC624 */  addiu      $a2, $a2, %lo(D_80010AB8)
    /* 60C 8001060C 00000000 */  nop
    /* 610 80010610 0000C8AC */  sw         $t0, 0x0($a2)
    /* 614 80010614 0180063C */  lui        $a2, %hi(D_80010ABC)
    /* 618 80010618 BC0AC624 */  addiu      $a2, $a2, %lo(D_80010ABC)
    /* 61C 8001061C 00000000 */  nop
    /* 620 80010620 0000C9AC */  sw         $t1, 0x0($a2)
    /* 624 80010624 01000224 */  addiu      $v0, $zero, 0x1
    /* 628 80010628 21380000 */  addu       $a3, $zero, $zero
    /* 62C 8001062C 21C80000 */  addu       $t9, $zero, $zero
  .L80010630:
    /* 630 80010630 B541000C */  jal        func_800106D4
    /* 634 80010634 00000000 */   nop
    /* 638 80010638 07000013 */  beqz       $t8, .L80010658
    /* 63C 8001063C 00000000 */   nop
    /* 640 80010640 08010624 */  addiu      $a2, $zero, 0x108
    /* 644 80010644 01003923 */  addi       $t9, $t9, 0x1 /* handwritten instruction */
    /* 648 80010648 03002617 */  bne        $t9, $a2, .L80010658
    /* 64C 8001064C 00000000 */   nop
    /* 650 80010650 5F42000C */  jal        func_8001097C
    /* 654 80010654 00000000 */   nop
  .L80010658:
    /* 658 80010658 2A080901 */  slt        $at, $t0, $t1
    /* 65C 8001065C F4FF2014 */  bnez       $at, .L80010630
    /* 660 80010660 00000000 */   nop
    /* 664 80010664 5F42000C */  jal        func_8001097C
    /* 668 80010668 00000000 */   nop
    /* 66C 8001066C 9F42000C */  jal        func_80010A7C
    /* 670 80010670 00000000 */   nop
    /* 674 80010674 000047AD */  sw         $a3, 0x0($t2)
    /* 678 80010678 04004A21 */  addi       $t2, $t2, 0x4 /* handwritten instruction */
    /* 67C 8001067C 0180063C */  lui        $a2, %hi(D_80010AB8)
    /* 680 80010680 B80AC624 */  addiu      $a2, $a2, %lo(D_80010AB8)
    /* 684 80010684 00000000 */  nop
    /* 688 80010688 0000C88C */  lw         $t0, 0x0($a2)
    /* 68C 8001068C 0180063C */  lui        $a2, %hi(D_80010ABC)
    /* 690 80010690 BC0AC624 */  addiu      $a2, $a2, %lo(D_80010ABC)
    /* 694 80010694 00000000 */  nop
    /* 698 80010698 0000C98C */  lw         $t1, 0x0($a2)
    /* 69C 8001069C 00000000 */  nop
    /* 6A0 800106A0 23482801 */  subu       $t1, $t1, $t0
    /* 6A4 800106A4 000049AD */  sw         $t1, 0x0($t2)
    /* 6A8 800106A8 04004A21 */  addi       $t2, $t2, 0x4 /* handwritten instruction */
    /* 6AC 800106AC 0000A58F */  lw         $a1, 0x0($sp)
    /* 6B0 800106B0 00000000 */  nop
    /* 6B4 800106B4 0400BD27 */  addiu      $sp, $sp, 0x4
    /* 6B8 800106B8 23504501 */  subu       $t2, $t2, $a1
    /* 6BC 800106BC 21104001 */  addu       $v0, $t2, $zero
    /* 6C0 800106C0 0000BF8F */  lw         $ra, 0x0($sp)
    /* 6C4 800106C4 00000000 */  nop
    /* 6C8 800106C8 0400BD27 */  addiu      $sp, $sp, 0x4
    /* 6CC 800106CC 0800E003 */  jr         $ra
    /* 6D0 800106D0 00000000 */   nop
endlabel crunch
