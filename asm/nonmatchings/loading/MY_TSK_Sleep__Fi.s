.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MY_TSK_Sleep__Fi, 0x58

glabel MY_TSK_Sleep__Fi
    /* 94524 800A4524 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 94528 800A4528 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 9452C 800A452C 21888000 */  addu       $s1, $a0, $zero
    /* 94530 800A4530 1800B0AF */  sw         $s0, 0x18($sp)
    /* 94534 800A4534 21800000 */  addu       $s0, $zero, $zero
    /* 94538 800A4538 0A00201A */  blez       $s1, .L800A4564
    /* 9453C 800A453C 2000BFAF */   sw        $ra, 0x20($sp)
  .L800A4540:
    /* 94540 800A4540 0B83000C */  jal        TICK_Update
    /* 94544 800A4544 01001026 */   addiu     $s0, $s0, 0x1
    /* 94548 800A4548 7E25020C */  jal        PAD_Handler__Fv
    /* 9454C 800A454C 00000000 */   nop
    /* 94550 800A4550 0C10020C */  jal        VID_AfterDisplay__Fv
    /* 94554 800A4554 00000000 */   nop
    /* 94558 800A4558 2A101102 */  slt        $v0, $s0, $s1
    /* 9455C 800A455C F8FF4014 */  bnez       $v0, .L800A4540
    /* 94560 800A4560 00000000 */   nop
  .L800A4564:
    /* 94564 800A4564 2000BF8F */  lw         $ra, 0x20($sp)
    /* 94568 800A4568 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 9456C 800A456C 1800B08F */  lw         $s0, 0x18($sp)
    /* 94570 800A4570 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 94574 800A4574 0800E003 */  jr         $ra
    /* 94578 800A4578 00000000 */   nop
endlabel MY_TSK_Sleep__Fi
