.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_TORCHR2__FP12ObjectStructiiP7TextDati, 0x8C

glabel PrintOBJ_TORCHR2__FP12ObjectStructiiP7TextDati
    /* 6E52C 8007E52C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6E530 8007E530 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6E534 8007E534 2188A000 */  addu       $s1, $a1, $zero
    /* 6E538 8007E538 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6E53C 8007E53C 2190C000 */  addu       $s2, $a2, $zero
    /* 6E540 8007E540 21202002 */  addu       $a0, $s1, $zero
    /* 6E544 8007E544 21284002 */  addu       $a1, $s2, $zero
    /* 6E548 8007E548 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6E54C 8007E54C 3000B08F */  lw         $s0, 0x30($sp)
    /* 6E550 8007E550 07000290 */  lbu        $v0, 0x7($zero)
    /* 6E554 8007E554 01000624 */  addiu      $a2, $zero, 0x1
    /* 6E558 8007E558 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6E55C 8007E55C 07001026 */  addiu      $s0, $s0, 0x7
    /* 6E560 8007E560 02004234 */  ori        $v0, $v0, 0x2
    /* 6E564 8007E564 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6E568 8007E568 070002A0 */  sb         $v0, 0x7($zero)
    /* 6E56C 8007E56C C1F8010C */  jal        PrintTorchStick__Fiiii
    /* 6E570 8007E570 21380002 */   addu      $a3, $s0, $zero
    /* 6E574 8007E574 FBFF3126 */  addiu      $s1, $s1, -0x5
    /* 6E578 8007E578 21202002 */  addu       $a0, $s1, $zero
    /* 6E57C 8007E57C DEFF4526 */  addiu      $a1, $s2, -0x22
    /* 6E580 8007E580 74F7010C */  jal        PrintOBJ_FIRE__Fiii
    /* 6E584 8007E584 21300002 */   addu      $a2, $s0, $zero
    /* 6E588 8007E588 21202002 */  addu       $a0, $s1, $zero
    /* 6E58C 8007E58C E0FF4526 */  addiu      $a1, $s2, -0x20
    /* 6E590 8007E590 71F8010C */  jal        DrawLightSpark__Fiii
    /* 6E594 8007E594 21300002 */   addu      $a2, $s0, $zero
    /* 6E598 8007E598 21100000 */  addu       $v0, $zero, $zero
    /* 6E59C 8007E59C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6E5A0 8007E5A0 1800B28F */  lw         $s2, 0x18($sp)
    /* 6E5A4 8007E5A4 1400B18F */  lw         $s1, 0x14($sp)
    /* 6E5A8 8007E5A8 1000B08F */  lw         $s0, 0x10($sp)
    /* 6E5AC 8007E5AC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6E5B0 8007E5B0 0800E003 */  jr         $ra
    /* 6E5B4 8007E5B4 00000000 */   nop
endlabel PrintOBJ_TORCHR2__FP12ObjectStructiiP7TextDati
